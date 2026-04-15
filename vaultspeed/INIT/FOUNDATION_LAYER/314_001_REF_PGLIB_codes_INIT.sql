CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."REF_PGLIB_codes_INIT"() 
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

BEGIN -- REF_TGT

	TRUNCATE TABLE "LIBPG_FL"."REF_PGLIB_codes"  CASCADE;

	INSERT INTO "LIBPG_FL"."REF_PGLIB_codes"(
		 "code_id"
		,"LOAD_CYCLE_ID"
		,"LOAD_DATE"
		,"code_type"
		,"code_value"
		,"code_description"
		,"is_active"
	)
	WITH "PREP_EXCEP" AS 
	( 
		SELECT 
			  "INI_SRC"."code_id" AS "code_id"
			, NULL ::int AS "LOAD_CYCLE_ID"
			, "INI_SRC"."code_type" AS "code_type"
			, "INI_SRC"."code_value" AS "code_value"
			, "INI_SRC"."code_description" AS "code_description"
			, "INI_SRC"."is_active" AS "is_active"
		FROM "lib_mgmt"."codes" "INI_SRC"
		UNION 
		SELECT 
			  CAST("MEX_EX_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "code_id"
			, "MEX_EX_SRC"."LOAD_CYCLE_ID" ::int AS "LOAD_CYCLE_ID"
			, "MEX_EX_SRC"."ATTRIBUTE_VARCHAR"::text AS "code_type"
			, "MEX_EX_SRC"."ATTRIBUTE_VARCHAR"::text AS "code_value"
			, "MEX_EX_SRC"."ATTRIBUTE_VARCHAR"::text AS "code_description"
			, CAST("MEX_EX_SRC"."ATTRIBUTE_BOOLEAN" AS BOOLEAN) AS "is_active"
		FROM "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_EX_SRC"
	)
	SELECT 
		  "PREP_EXCEP"."code_id" AS "code_id"
		, COALESCE("PREP_EXCEP"."LOAD_CYCLE_ID","LCI_SRC"."LOAD_CYCLE_ID") AS "LOAD_CYCLE_ID"
		, "LCI_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "PREP_EXCEP"."code_type" AS "code_type"
		, "PREP_EXCEP"."code_value" AS "code_value"
		, "PREP_EXCEP"."code_description" AS "code_description"
		, "PREP_EXCEP"."is_active" AS "is_active"
	FROM "PREP_EXCEP" "PREP_EXCEP"
	INNER JOIN "PostgresLibrary_MTD"."LOAD_CYCLE_INFO" "LCI_SRC" ON  1 = 1
	;
END;



END;
$function$;
 
 
