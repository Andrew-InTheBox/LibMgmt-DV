/*
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 17:40:49
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12
 */

DROP TABLE IF EXISTS "LibraryMgmt_FMC"."FMC_LOADING_HISTORY" 
CASCADE
;

CREATE   TABLE "LibraryMgmt_FMC"."FMC_LOADING_HISTORY"
(
	"dag_name" VARCHAR,
	"SRC_BK" VARCHAR,
	"LOAD_CYCLE_ID" INTEGER,
	"LOAD_DATE" TIMESTAMP,
	"FMC_BEGIN_LW_TIMESTAMP" TIMESTAMP,
	"FMC_END_LW_TIMESTAMP" TIMESTAMP,
	"load_start_date" TIMESTAMP WITH TIME ZONE,
	"load_end_date" TIMESTAMP WITH TIME ZONE,
	"success_flag" INTEGER
)
;

COMMENT ON TABLE "LibraryMgmt_FMC"."FMC_LOADING_HISTORY" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';

