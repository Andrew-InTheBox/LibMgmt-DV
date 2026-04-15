"""
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 17:43:41
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27
 """


from datetime import datetime, timedelta
from pathlib import Path
import json

from airflow import DAG
from airflow.models import Variable
from airflow.operators.dummy_operator import DummyOperator

from vs_fmc_plugin.operators.jdbc_operator import JdbcOperator


default_args = {
	"owner":"Vaultspeed",
	"retries": 3,
	"retry_delay": timedelta(seconds=10),
	"start_date":datetime.strptime("01-01-1920 20:00:00", "%d-%m-%Y %H:%M:%S")
}

path_to_mtd = Path(Variable.get("path_to_metadata"))

if (path_to_mtd / "180_mappings_lib_pg_incr_20260317_174341.json").exists():
	with open(path_to_mtd / "180_mappings_lib_pg_incr_20260317_174341.json") as file: 
		mappings = json.load(file)

else:
	with open(path_to_mtd / "mappings_lib_pg_incr.json") as file: 
		mappings = json.load(file)

lib_pg_incr = DAG(
	dag_id="lib_pg_incr", 
	default_args=default_args,
	description="lib_pg_incr", 
	schedule_interval="@hourly", 
	concurrency=2, 
	catchup=False, 
	max_active_runs=1,
	tags=["VaultSpeed", "PGLIB", "LIBPG"]
)

# Create incremental fmc tasks
# insert load metadata
fmc_mtd = JdbcOperator(
	task_id="fmc_mtd", 
	jdbc_conn_id="datavault", 
	sql=f"""select "LibraryMgmt_PROC"."SET_FMC_MTD_FL_INCR_PGLIB"(p_dag_name := '{{{{ dag_run.dag_id }}}}', p_LOAD_CYCLE_ID := '{{{{ dag_run.id }}}}', p_LOAD_DATE := '{{{{ data_interval_end.strftime(\"%Y-%m-%d %H:%M:%S.%f\") }}}}');""", 
	dag=lib_pg_incr
)

tasks = {"fmc_mtd":fmc_mtd}

# Create mapping tasks
for map, info in mappings.items():
	task = JdbcOperator(
		task_id=map, 
		jdbc_conn_id="datavault", 
		sql=f"""select {info["map_schema"]}."{map}"();""", 
		dag=lib_pg_incr
	)
	
	for dep in info["dependencies"]:
		task << tasks[dep]
	
	tasks[map] = task
	

# task to indicate the end of a load
end_task = DummyOperator(
	task_id="end_of_load", 
	dag=lib_pg_incr
)

# Analyze tables
if (path_to_mtd / "180_FL_mtd_lib_pg_incr_20260317_174341.json").exists():
	with open(path_to_mtd / "180_FL_mtd_lib_pg_incr_20260317_174341.json") as file: 
		analyze_data = json.load(file)
else:
	with open(path_to_mtd / "FL_mtd_lib_pg_incr.json") as file: 
		analyze_data = json.load(file)

for table, data in analyze_data.items():
	task = JdbcOperator(
		task_id=f"analyze_{table}", 
		jdbc_conn_id="datavault", 
		sql=f"""analyse "{data["schema"]}"."{table}";""", 
		dag=lib_pg_incr
	)
	
	for dep in data["dependencies"]:
		task << tasks[dep]
	end_task << task

# Save load status tasks
fmc_load_fail = JdbcOperator(
	task_id="fmc_load_fail", 
	jdbc_conn_id="datavault", 
	sql=f"""select "LibraryMgmt_PROC"."FMC_UPD_RUN_STATUS_FL_PGLIB"(p_LOAD_CYCLE_ID := '{{{{ dag_run.id }}}}', p_success_flag := '0');""", 
	trigger_rule="one_failed", 
	dag=lib_pg_incr
)
fmc_load_fail << end_task

fmc_load_success = JdbcOperator(
	task_id="fmc_load_success", 
	jdbc_conn_id="datavault", 
	sql=f"""select "LibraryMgmt_PROC"."FMC_UPD_RUN_STATUS_FL_PGLIB"(p_LOAD_CYCLE_ID := '{{{{ dag_run.id }}}}', p_success_flag := '1');""", 
	dag=lib_pg_incr
)
fmc_load_success << end_task

