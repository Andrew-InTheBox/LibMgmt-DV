CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."EXT_PGLIB_magazinecheckouts_INCR"() 
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
	WITH "CALCULATE_BK" AS 
	( 
		SELECT 
			  "TDFV_SRC"."last_updated" AS "last_updated"
			, "MEX_SRC"."ATTRIBUTE_VARCHAR" AS "__$operation"
			, "TDFV_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "TDFV_SRC"."magazine_checkout_id" AS "magazine_checkout_id"
			, "TDFV_SRC"."magazine_id" AS "magazine_id"
			, "TDFV_SRC"."user_id" AS "user_id"
			, "TDFV_SRC"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
			, UPPER( "TDFV_SRC"."magazine_id"::text) AS "magazine_id_FK_magazineid_BK"
			, UPPER( "TDFV_SRC"."user_id"::text) AS "user_id_FK_userid_BK"
			, "TDFV_SRC"."checkout_date" AS "checkout_date"
			, "TDFV_SRC"."return_date" AS "return_date"
			, "TDFV_SRC"."checkout_status_id" AS "checkout_status_id"
		FROM "PostgresLibrary_DFV"."VW_magazine_checkouts" "TDFV_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  1 = 1
		WHERE  "MEX_SRC"."RECORD_TYPE" = 'N'
	)
	, "EXT_UNION" AS 
	( 
		SELECT 
			  "LCI_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, TO_TIMESTAMP(NULL , 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "LOAD_DATE"
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
		INNER JOIN "PostgresLibrary_MTD"."LOAD_CYCLE_INFO" "LCI_SRC" ON  1 = 1
	)
	SELECT 
		  "EXT_UNION"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "EXT_UNION"."LOAD_DATE" AS "LOAD_DATE"
		, "EXT_UNION"."last_updated" AS "last_updated"
		, "EXT_UNION"."__$operation" AS "__$operation"
		, "EXT_UNION"."RECORD_TYPE" AS "RECORD_TYPE"
		, "EXT_UNION"."magazine_checkout_id" AS "magazine_checkout_id"
		, "EXT_UNION"."magazine_id" AS "magazine_id"
		, "EXT_UNION"."user_id" AS "user_id"
		, "EXT_UNION"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
		, "EXT_UNION"."magazine_id_FK_magazineid_BK" AS "magazine_id_FK_magazineid_BK"
		, "EXT_UNION"."user_id_FK_userid_BK" AS "user_id_FK_userid_BK"
		, "EXT_UNION"."checkout_date" AS "checkout_date"
		, "EXT_UNION"."return_date" AS "return_date"
		, "EXT_UNION"."checkout_status_id" AS "checkout_status_id"
	FROM "EXT_UNION" "EXT_UNION"
	;
END;



END;
$function$;
 
 
