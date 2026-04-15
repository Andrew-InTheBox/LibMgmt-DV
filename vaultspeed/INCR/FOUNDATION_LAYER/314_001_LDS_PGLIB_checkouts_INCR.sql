CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."LDS_PGLIB_checkouts_INCR"() 
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

BEGIN -- LDS_TEMP_TGT

	TRUNCATE TABLE "PostgresLibrary_STG"."LDS_PGLIB_checkouts_TMP"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."LDS_PGLIB_checkouts_TMP"(
		 "LND_checkouts_HKEY"
		,"books_HKEY"
		,"users_HKEY"
		,"checkout_id"
		,"user_id"
		,"book_id"
		,"REF_checkout_status_id_FK"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"HASH_DIFF"
		,"RECORD_TYPE"
		,"SOURCE"
		,"EQUAL"
		,"DELETE_FLAG"
		,"last_updated"
		,"checkout_status_id"
		,"checkout_date"
		,"return_date"
	)
	WITH "DIST_STG" AS 
	( 
		SELECT 
			  "STG_DIS_SRC"."LND_checkouts_HKEY" AS "LND_checkouts_HKEY"
			, "STG_DIS_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, MIN("STG_DIS_SRC"."LOAD_DATE") AS "MIN_LOAD_TIMESTAMP"
		FROM "PostgresLibrary_STG"."checkouts" "STG_DIS_SRC"
		GROUP BY  "STG_DIS_SRC"."LND_checkouts_HKEY",  "STG_DIS_SRC"."LOAD_CYCLE_ID"
	)
	, "TEMP_TABLE_SET" AS 
	( 
		SELECT 
			  "STG_TEMP_SRC"."LND_checkouts_HKEY" AS "LND_checkouts_HKEY"
			, "STG_TEMP_SRC"."books_HKEY" AS "books_HKEY"
			, "STG_TEMP_SRC"."users_HKEY" AS "users_HKEY"
			, "STG_TEMP_SRC"."checkout_id" AS "checkout_id"
			, "STG_TEMP_SRC"."user_id" AS "user_id"
			, "STG_TEMP_SRC"."book_id" AS "book_id"
			, "STG_TEMP_SRC"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
			, "STG_TEMP_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_TEMP_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, TO_TIMESTAMP(NULL, 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "LOAD_END_DATE"
			, UPPER(ENCODE(DIGEST(COALESCE(RTRIM( UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."checkout_id"::text),'~'),
				'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( TO_CHAR("STG_TEMP_SRC"."checkout_date", 'DD/MM/YYYY HH24:MI:SS'::varchar)),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( TO_CHAR("STG_TEMP_SRC"."return_date", 'DD/MM/YYYY HH24:MI:SS'::varchar)),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."checkout_status_id"::text),'~'),'#','\' || '#'))|| '#','#' || '~'),'~') ,'SHA1'),'HEX')) AS "HASH_DIFF"
			, "STG_TEMP_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, 'STG' AS "SOURCE"
			, 1 AS "ORIGIN_ID"
			, CASE WHEN "STG_TEMP_SRC"."__$operation" = 'D' THEN 'Y'::text ELSE 'N'::text END AS "DELETE_FLAG"
			, "STG_TEMP_SRC"."last_updated" AS "last_updated"
			, "STG_TEMP_SRC"."checkout_status_id" AS "checkout_status_id"
			, "STG_TEMP_SRC"."checkout_date" AS "checkout_date"
			, "STG_TEMP_SRC"."return_date" AS "return_date"
		FROM "PostgresLibrary_STG"."checkouts" "STG_TEMP_SRC"
		UNION ALL 
		SELECT 
			  "LDS_SRC"."LND_checkouts_HKEY" AS "LND_checkouts_HKEY"
			, "LND_SRC"."books_HKEY" AS "books_HKEY"
			, "LND_SRC"."users_HKEY" AS "users_HKEY"
			, "LDS_SRC"."checkout_id" AS "checkout_id"
			, "LDS_SRC"."user_id" AS "user_id"
			, "LDS_SRC"."book_id" AS "book_id"
			, "LDS_SRC"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
			, "LDS_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "LDS_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, MAX("LDS_SRC"."LOAD_DATE")OVER(PARTITION BY "LDS_SRC"."LND_checkouts_HKEY") AS "LOAD_END_DATE"
			, "LDS_SRC"."HASH_DIFF" AS "HASH_DIFF"
			, 'SAT' AS "RECORD_TYPE"
			, 'LDS' AS "SOURCE"
			, 0 AS "ORIGIN_ID"
			, "LDS_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
			, "LDS_SRC"."last_updated" AS "last_updated"
			, "LDS_SRC"."checkout_status_id" AS "checkout_status_id"
			, "LDS_SRC"."checkout_date" AS "checkout_date"
			, "LDS_SRC"."return_date" AS "return_date"
		FROM "LIBPG_FL"."LDS_PGLIB_checkouts" "LDS_SRC"
		INNER JOIN "LIBPG_FL"."LND_checkouts" "LND_SRC" ON  "LDS_SRC"."LND_checkouts_HKEY" = "LND_SRC"."LND_checkouts_HKEY"
		INNER JOIN "DIST_STG" "DIST_STG" ON  "LDS_SRC"."LND_checkouts_HKEY" = "DIST_STG"."LND_checkouts_HKEY"
	)
	SELECT 
		  "TEMP_TABLE_SET"."LND_checkouts_HKEY" AS "LND_checkouts_HKEY"
		, "TEMP_TABLE_SET"."books_HKEY" AS "books_HKEY"
		, "TEMP_TABLE_SET"."users_HKEY" AS "users_HKEY"
		, "TEMP_TABLE_SET"."checkout_id" AS "checkout_id"
		, "TEMP_TABLE_SET"."user_id" AS "user_id"
		, "TEMP_TABLE_SET"."book_id" AS "book_id"
		, "TEMP_TABLE_SET"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
		, "TEMP_TABLE_SET"."LOAD_DATE" AS "LOAD_DATE"
		, "TEMP_TABLE_SET"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "TEMP_TABLE_SET"."HASH_DIFF" AS "HASH_DIFF"
		, "TEMP_TABLE_SET"."RECORD_TYPE" AS "RECORD_TYPE"
		, "TEMP_TABLE_SET"."SOURCE" AS "SOURCE"
		, CASE WHEN "TEMP_TABLE_SET"."SOURCE" = 'STG' AND "TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."HASH_DIFF"::text =
			LAG("TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."HASH_DIFF"::text,1)OVER(PARTITION BY "TEMP_TABLE_SET"."LND_checkouts_HKEY" ORDER BY "TEMP_TABLE_SET"."LOAD_DATE","TEMP_TABLE_SET"."ORIGIN_ID")THEN 1 ELSE 0 END AS "EQUAL"
		, "TEMP_TABLE_SET"."DELETE_FLAG" AS "DELETE_FLAG"
		, "TEMP_TABLE_SET"."last_updated" AS "last_updated"
		, "TEMP_TABLE_SET"."checkout_status_id" AS "checkout_status_id"
		, "TEMP_TABLE_SET"."checkout_date" AS "checkout_date"
		, "TEMP_TABLE_SET"."return_date" AS "return_date"
	FROM "TEMP_TABLE_SET" "TEMP_TABLE_SET"
	WHERE  "TEMP_TABLE_SET"."SOURCE" = 'STG' OR("TEMP_TABLE_SET"."LOAD_DATE" = "TEMP_TABLE_SET"."LOAD_END_DATE" AND "TEMP_TABLE_SET"."SOURCE" = 'LDS')
	;
END;


BEGIN -- LDS_INUR_TGT

	INSERT INTO "LIBPG_FL"."LDS_PGLIB_checkouts"(
		 "LND_checkouts_HKEY"
		,"checkout_id"
		,"user_id"
		,"book_id"
		,"REF_checkout_status_id_FK"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"HASH_DIFF"
		,"DELETE_FLAG"
		,"last_updated"
		,"checkout_status_id"
		,"checkout_date"
		,"return_date"
	)
	SELECT 
		  "LDS_TEMP_SRC_INUR"."LND_checkouts_HKEY" AS "LND_checkouts_HKEY"
		, "LDS_TEMP_SRC_INUR"."checkout_id" AS "checkout_id"
		, "LDS_TEMP_SRC_INUR"."user_id" AS "user_id"
		, "LDS_TEMP_SRC_INUR"."book_id" AS "book_id"
		, "LDS_TEMP_SRC_INUR"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
		, "LDS_TEMP_SRC_INUR"."LOAD_DATE" AS "LOAD_DATE"
		, "LDS_TEMP_SRC_INUR"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "LDS_TEMP_SRC_INUR"."HASH_DIFF" AS "HASH_DIFF"
		, "LDS_TEMP_SRC_INUR"."DELETE_FLAG" AS "DELETE_FLAG"
		, "LDS_TEMP_SRC_INUR"."last_updated" AS "last_updated"
		, "LDS_TEMP_SRC_INUR"."checkout_status_id" AS "checkout_status_id"
		, "LDS_TEMP_SRC_INUR"."checkout_date" AS "checkout_date"
		, "LDS_TEMP_SRC_INUR"."return_date" AS "return_date"
	FROM "PostgresLibrary_STG"."LDS_PGLIB_checkouts_TMP" "LDS_TEMP_SRC_INUR"
	WHERE  "LDS_TEMP_SRC_INUR"."SOURCE" = 'STG' AND "LDS_TEMP_SRC_INUR"."EQUAL" = 0
	;
END;



END;
$function$;
 
 
