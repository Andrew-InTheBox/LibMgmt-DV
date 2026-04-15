CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."SET_FMC_MTD_BV_INIT_LIBPG"(p_dag_name varchar,
p_LOAD_CYCLE_ID varchar,
p_LOAD_DATE varchar) 
RETURNS void 
LANGUAGE 'plpgsql' 

AS $function$ 
/*
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 16:41:38
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 16:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 16:38:27
 */


BEGIN 

BEGIN -- HIST_INS

	INSERT INTO "LibraryMgmt_FMC"."FMC_LOADING_HISTORY"(
		 "dag_name"
		,"SRC_BK"
		,"LOAD_CYCLE_ID"
		,"LOAD_DATE"
		,"FMC_BEGIN_LW_TIMESTAMP"
		,"FMC_END_LW_TIMESTAMP"
		,"load_start_date"
		,"load_end_date"
		,"success_flag"
	)
	WITH "SRC_WINDOW" AS 
	( 
		SELECT 
			  MIN("FMCH_SRC"."FMC_END_LW_TIMESTAMP") AS "FMC_BEGIN_LW_TIMESTAMP"
		FROM "LibraryMgmt_FMC"."FMC_LOADING_HISTORY" "FMCH_SRC"
		WHERE  "FMCH_SRC"."SRC_BK" IN('PGLIB') AND "FMCH_SRC"."success_flag" = 1
	)
	SELECT 
		  p_dag_name AS "dag_name"
		, 'LIBPG' AS "SRC_BK"
		, p_LOAD_CYCLE_ID::int AS "LOAD_CYCLE_ID"
		, ( TO_TIMESTAMP(p_LOAD_DATE, 'YYYY-MM-DD HH24:MI:SS.US'::varchar)  AT TIME ZONE  'UTC' ) AT TIME ZONE  'UTC'   AS "LOAD_DATE"
		, "SRC_WINDOW"."FMC_BEGIN_LW_TIMESTAMP" AS "FMC_BEGIN_LW_TIMESTAMP"
		, ( TO_TIMESTAMP(p_LOAD_DATE, 'YYYY-MM-DD HH24:MI:SS.US'::varchar)  AT TIME ZONE  'UTC' ) AT TIME ZONE  'UTC'   AS "FMC_END_LW_TIMESTAMP"
		, CURRENT_TIMESTAMP AS "load_start_date"
		, NULL AS "load_end_date"
		, NULL AS "success_flag"
	FROM "SRC_WINDOW" "SRC_WINDOW"
	WHERE  NOT EXISTS
	(
		SELECT 
			  1 AS "DUMMY"
		FROM "LibraryMgmt_FMC"."FMC_LOADING_HISTORY" "FMCH_SRC"
		WHERE  "FMCH_SRC"."LOAD_CYCLE_ID" = p_LOAD_CYCLE_ID::int
	)
	;
END;


BEGIN -- LCI_INS

	TRUNCATE TABLE "LibraryMgmt_FMC"."LOAD_CYCLE_INFO"  CASCADE;

	INSERT INTO "LibraryMgmt_FMC"."LOAD_CYCLE_INFO"(
		 "LOAD_CYCLE_ID"
		,"LOAD_DATE"
	)
	SELECT 
		  p_LOAD_CYCLE_ID::int AS "LOAD_CYCLE_ID"
		, ( TO_TIMESTAMP(p_LOAD_DATE, 'YYYY-MM-DD HH24:MI:SS.US'::varchar)  AT TIME ZONE  'UTC' ) AT TIME ZONE  'UTC'   AS "LOAD_DATE"
	;
END;


BEGIN -- LWT_INS

	TRUNCATE TABLE "LibraryMgmt_FMC"."FMC_BV_LOADING_WINDOW_TABLE"  CASCADE;

	INSERT INTO "LibraryMgmt_FMC"."FMC_BV_LOADING_WINDOW_TABLE"(
		 "FMC_BEGIN_LW_TIMESTAMP"
		,"FMC_END_LW_TIMESTAMP"
	)
	WITH "SRC_WINDOW_LWT" AS 
	( 
		SELECT 
			  MIN("FMCH_SRC"."FMC_END_LW_TIMESTAMP") AS "FMC_BEGIN_LW_TIMESTAMP"
		FROM "LibraryMgmt_FMC"."FMC_LOADING_HISTORY" "FMCH_SRC"
		WHERE  "FMCH_SRC"."SRC_BK" in('PGLIB') AND "FMCH_SRC"."success_flag" = 1
	)
	SELECT 
		  "SRC_WINDOW_LWT"."FMC_BEGIN_LW_TIMESTAMP" AS "FMC_BEGIN_LW_TIMESTAMP"
		, ( TO_TIMESTAMP(p_LOAD_DATE, 'YYYY-MM-DD HH24:MI:SS.US'::varchar)  AT TIME ZONE  'UTC' ) AT TIME ZONE  'UTC'   AS "FMC_END_LW_TIMESTAMP"
	FROM "SRC_WINDOW_LWT" "SRC_WINDOW_LWT"
	;
END;


BEGIN -- DV_LCI_INS

	TRUNCATE TABLE "LibraryMgmt_FMC"."DV_LOAD_CYCLE_INFO"  CASCADE;

	INSERT INTO "LibraryMgmt_FMC"."DV_LOAD_CYCLE_INFO"(
		 "DV_LOAD_CYCLE_ID"
	)
	SELECT 
		  "FMCH_LCI"."LOAD_CYCLE_ID" AS "DV_LOAD_CYCLE_ID"
	FROM "LibraryMgmt_FMC"."FMC_LOADING_HISTORY" "FMCH_LCI"
	WHERE  "FMCH_LCI"."SRC_BK" IN('PGLIB') AND "FMCH_LCI"."success_flag" = 1
	;
END;



END;
$function$;
 
 
