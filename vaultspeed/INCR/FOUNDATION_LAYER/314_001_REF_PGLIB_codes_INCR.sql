CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."REF_PGLIB_codes_INCR"() 
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

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 16:41:03
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 16:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 16:38:27
 */


BEGIN 

BEGIN -- REF_TGT_DEL

	ALTER TABLE "LIBPG_FL"."REF_PGLIB_codes" DISABLE TRIGGER ALL;

	DELETE  FROM "LIBPG_FL"."REF_PGLIB_codes" "REF_DEL_TGT"
	WHERE EXISTS ( 
		SELECT 1 
		FROM "PostgresLibrary_DFV"."VW_codes" "TDFV_DEL_SRC"
		WHERE  "REF_DEL_TGT"."code_id" = "TDFV_DEL_SRC"."code_id")

	;
END;


BEGIN -- REF_TGT

	INSERT INTO "LIBPG_FL"."REF_PGLIB_codes"(
		 "code_id"
		,"LOAD_CYCLE_ID"
		,"LOAD_DATE"
		,"code_type"
		,"code_value"
		,"code_description"
		,"is_active"
	)
	WITH "NEW_SET" AS 
	( 
		SELECT 
			  "TDFV_SRC"."code_type" AS "code_type"
			, "TDFV_SRC"."code_value" AS "code_value"
			, "TDFV_SRC"."code_description" AS "code_description"
			, "TDFV_SRC"."is_active" AS "is_active"
			, "TDFV_SRC"."code_id" AS "code_id"
			, "TDFV_SRC"."last_updated" AS "last_updated"
			, ROW_NUMBER()OVER(PARTITION BY "TDFV_SRC"."code_id" ORDER BY "TDFV_SRC"."last_updated" DESC) AS "DUMMY"
		FROM "PostgresLibrary_DFV"."VW_codes" "TDFV_SRC"
	)
	SELECT 
		  "NEW_SET"."code_id" AS "code_id"
		, "LCI_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "LCI_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "NEW_SET"."code_type" AS "code_type"
		, "NEW_SET"."code_value" AS "code_value"
		, "NEW_SET"."code_description" AS "code_description"
		, "NEW_SET"."is_active" AS "is_active"
	FROM "NEW_SET" "NEW_SET"
	INNER JOIN "PostgresLibrary_MTD"."LOAD_CYCLE_INFO" "LCI_SRC" ON  1 = 1
	LEFT OUTER JOIN "LIBPG_FL"."REF_PGLIB_codes" "REF_SRC" ON  "NEW_SET"."code_id" = "REF_SRC"."code_id"
	WHERE  "NEW_SET"."DUMMY" = 1 AND "REF_SRC"."code_id" IS NULL
	;
END;



END;
$function$;
 
 
