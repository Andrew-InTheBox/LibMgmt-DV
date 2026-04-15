CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."EXT_PGLIB_publishers_INIT"() 
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

BEGIN -- EXT_TGT

	TRUNCATE TABLE "PostgresLibrary_EXT"."publishers"  CASCADE;

	INSERT INTO "PostgresLibrary_EXT"."publishers"(
		 "LOAD_CYCLE_ID"
		,"LOAD_DATE"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"publisher_id"
		,"publisher_id_BK"
		,"name"
		,"address"
	)
	WITH "LOAD_INIT_DATA" AS 
	( 
		SELECT 
			  'I' ::text AS "__$operation"
			, "INI_SRC"."last_updated" AS "last_updated"
			, 'S'::text AS "RECORD_TYPE"
			, COALESCE("INI_SRC"."publisher_id", CAST("MEX_INR_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "publisher_id"
			, "INI_SRC"."name" AS "name"
			, "INI_SRC"."address" AS "address"
		FROM "lib_mgmt"."publishers" "INI_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_INR_SRC" ON  "MEX_INR_SRC"."RECORD_TYPE" = 'N'
	)
	, "PREP_EXCEP" AS 
	( 
		SELECT 
			  "LOAD_INIT_DATA"."__$operation" AS "__$operation"
			, "LOAD_INIT_DATA"."last_updated" AS "last_updated"
			, "LOAD_INIT_DATA"."RECORD_TYPE" AS "RECORD_TYPE"
			, NULL ::int AS "LOAD_CYCLE_ID"
			, "LOAD_INIT_DATA"."publisher_id" AS "publisher_id"
			, "LOAD_INIT_DATA"."name" AS "name"
			, "LOAD_INIT_DATA"."address" AS "address"
		FROM "LOAD_INIT_DATA" "LOAD_INIT_DATA"
		UNION ALL 
		SELECT 
			  'I' ::text AS "__$operation"
			, TO_TIMESTAMP("MEX_EXT_SRC"."KEY_ATTRIBUTE_TIMESTAMP", 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "last_updated"
			, "MEX_EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "MEX_EXT_SRC"."LOAD_CYCLE_ID" ::int AS "LOAD_CYCLE_ID"
			, CAST("MEX_EXT_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "publisher_id"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "name"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "address"
		FROM "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_EXT_SRC"
	)
	, "CALCULATE_BK" AS 
	( 
		SELECT 
			  COALESCE("PREP_EXCEP"."LOAD_CYCLE_ID","LCI_SRC"."LOAD_CYCLE_ID") AS "LOAD_CYCLE_ID"
			, "LCI_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, CASE WHEN "PREP_EXCEP"."RECORD_TYPE" = 'S' THEN "PREP_EXCEP"."last_updated" ELSE "LCI_SRC"."LOAD_DATE" END AS "last_updated"
			, "PREP_EXCEP"."__$operation" AS "__$operation"
			, "PREP_EXCEP"."RECORD_TYPE" AS "RECORD_TYPE"
			, "PREP_EXCEP"."publisher_id" AS "publisher_id"
			, COALESCE(UPPER( "PREP_EXCEP"."publisher_id"::text),"MEX_SRC"."KEY_ATTRIBUTE_INTEGER") AS "publisher_id_BK"
			, "PREP_EXCEP"."name" AS "name"
			, "PREP_EXCEP"."address" AS "address"
		FROM "PREP_EXCEP" "PREP_EXCEP"
		INNER JOIN "PostgresLibrary_MTD"."LOAD_CYCLE_INFO" "LCI_SRC" ON  1 = 1
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  1 = 1
		WHERE  "MEX_SRC"."RECORD_TYPE" = 'N'
	)
	SELECT 
		  "CALCULATE_BK"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "CALCULATE_BK"."LOAD_DATE" AS "LOAD_DATE"
		, "CALCULATE_BK"."last_updated" AS "last_updated"
		, "CALCULATE_BK"."__$operation" AS "__$operation"
		, "CALCULATE_BK"."RECORD_TYPE" AS "RECORD_TYPE"
		, "CALCULATE_BK"."publisher_id" AS "publisher_id"
		, "CALCULATE_BK"."publisher_id_BK" AS "publisher_id_BK"
		, "CALCULATE_BK"."name" AS "name"
		, "CALCULATE_BK"."address" AS "address"
	FROM "CALCULATE_BK" "CALCULATE_BK"
	;
END;



END;
$function$;
 
 
