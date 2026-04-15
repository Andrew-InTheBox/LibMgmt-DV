CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."EXT_PGLIB_magazinecheckouts_INIT"() 
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

	TRUNCATE TABLE "PostgresLibrary_EXT"."magazine_checkouts"  CASCADE;

	INSERT INTO "PostgresLibrary_EXT"."magazine_checkouts"(
		 "LOAD_CYCLE_ID"
		,"LOAD_DATE"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"magazine_checkout_id"
		,"magazine_id"
		,"user_id"
		,"REF_checkout_status_id_FK"
		,"magazine_id_FK_magazineid_BK"
		,"user_id_FK_userid_BK"
		,"checkout_date"
		,"return_date"
		,"checkout_status_id"
	)
	WITH "LOAD_INIT_DATA" AS 
	( 
		SELECT 
			  'I' ::text AS "__$operation"
			, "INI_SRC"."last_updated" AS "last_updated"
			, 'S'::text AS "RECORD_TYPE"
			, COALESCE("INI_SRC"."magazine_checkout_id", CAST("MEX_INR_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "magazine_checkout_id"
			, COALESCE("INI_SRC"."magazine_id", CAST("MEX_INR_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "magazine_id"
			, COALESCE("INI_SRC"."user_id", CAST("MEX_INR_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "user_id"
			, COALESCE("INI_SRC"."checkout_status_id", CAST("MEX_INR_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "REF_checkout_status_id_FK"
			, "INI_SRC"."checkout_date" AS "checkout_date"
			, "INI_SRC"."return_date" AS "return_date"
			, "INI_SRC"."checkout_status_id" AS "checkout_status_id"
		FROM "lib_mgmt"."magazine_checkouts" "INI_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_INR_SRC" ON  "MEX_INR_SRC"."RECORD_TYPE" = 'N'
	)
	, "PREP_EXCEP" AS 
	( 
		SELECT 
			  "LOAD_INIT_DATA"."__$operation" AS "__$operation"
			, "LOAD_INIT_DATA"."last_updated" AS "last_updated"
			, "LOAD_INIT_DATA"."RECORD_TYPE" AS "RECORD_TYPE"
			, NULL ::int AS "LOAD_CYCLE_ID"
			, "LOAD_INIT_DATA"."magazine_checkout_id" AS "magazine_checkout_id"
			, "LOAD_INIT_DATA"."magazine_id" AS "magazine_id"
			, "LOAD_INIT_DATA"."user_id" AS "user_id"
			, "LOAD_INIT_DATA"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
			, "LOAD_INIT_DATA"."checkout_date" AS "checkout_date"
			, "LOAD_INIT_DATA"."return_date" AS "return_date"
			, "LOAD_INIT_DATA"."checkout_status_id" AS "checkout_status_id"
		FROM "LOAD_INIT_DATA" "LOAD_INIT_DATA"
		UNION ALL 
		SELECT 
			  'I' ::text AS "__$operation"
			, TO_TIMESTAMP("MEX_EXT_SRC"."KEY_ATTRIBUTE_TIMESTAMP", 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "last_updated"
			, "MEX_EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "MEX_EXT_SRC"."LOAD_CYCLE_ID" ::int AS "LOAD_CYCLE_ID"
			, CAST("MEX_EXT_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "magazine_checkout_id"
			, CAST("MEX_EXT_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "magazine_id"
			, CAST("MEX_EXT_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "user_id"
			, CAST("MEX_EXT_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "REF_checkout_status_id_FK"
			, TO_TIMESTAMP("MEX_EXT_SRC"."ATTRIBUTE_TIMESTAMP", 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "checkout_date"
			, TO_TIMESTAMP("MEX_EXT_SRC"."ATTRIBUTE_TIMESTAMP", 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "return_date"
			, CAST("MEX_EXT_SRC"."ATTRIBUTE_INTEGER" AS INTEGER) AS "checkout_status_id"
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
			, "PREP_EXCEP"."magazine_checkout_id" AS "magazine_checkout_id"
			, "PREP_EXCEP"."magazine_id" AS "magazine_id"
			, "PREP_EXCEP"."user_id" AS "user_id"
			, "PREP_EXCEP"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
			, UPPER( "PREP_EXCEP"."magazine_id"::text) AS "magazine_id_FK_magazineid_BK"
			, UPPER( "PREP_EXCEP"."user_id"::text) AS "user_id_FK_userid_BK"
			, "PREP_EXCEP"."checkout_date" AS "checkout_date"
			, "PREP_EXCEP"."return_date" AS "return_date"
			, "PREP_EXCEP"."checkout_status_id" AS "checkout_status_id"
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
		, "CALCULATE_BK"."magazine_checkout_id" AS "magazine_checkout_id"
		, "CALCULATE_BK"."magazine_id" AS "magazine_id"
		, "CALCULATE_BK"."user_id" AS "user_id"
		, "CALCULATE_BK"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
		, "CALCULATE_BK"."magazine_id_FK_magazineid_BK" AS "magazine_id_FK_magazineid_BK"
		, "CALCULATE_BK"."user_id_FK_userid_BK" AS "user_id_FK_userid_BK"
		, "CALCULATE_BK"."checkout_date" AS "checkout_date"
		, "CALCULATE_BK"."return_date" AS "return_date"
		, "CALCULATE_BK"."checkout_status_id" AS "checkout_status_id"
	FROM "CALCULATE_BK" "CALCULATE_BK"
	;
END;



END;
$function$;
 
 
