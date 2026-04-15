CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."LDS_PGLIB_checkouts_INIT"() 
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

BEGIN -- LDS_TGT

	TRUNCATE TABLE "LIBPG_FL"."LDS_PGLIB_checkouts"  CASCADE;

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
	WITH "STG_DL_SRC" AS 
	( 
		SELECT 
			  "STG_DL_INR_SRC"."LND_checkouts_HKEY" AS "LND_checkouts_HKEY"
			, "STG_DL_INR_SRC"."checkout_id" AS "checkout_id"
			, "STG_DL_INR_SRC"."user_id" AS "user_id"
			, "STG_DL_INR_SRC"."book_id" AS "book_id"
			, "STG_DL_INR_SRC"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
			, "STG_DL_INR_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_DL_INR_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, UPPER(ENCODE(DIGEST(COALESCE(RTRIM( UPPER(REPLACE(COALESCE(TRIM( "STG_DL_INR_SRC"."checkout_id"::text),'~'),
				'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( TO_CHAR("STG_DL_INR_SRC"."checkout_date", 'DD/MM/YYYY HH24:MI:SS'::varchar)),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( TO_CHAR("STG_DL_INR_SRC"."return_date", 'DD/MM/YYYY HH24:MI:SS'::varchar)),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_DL_INR_SRC"."checkout_status_id"::text),'~'),'#','\' || '#'))|| '#','#' || '~'),'~') ,'SHA1'),'HEX')) AS "HASH_DIFF"
			, 'N'::text AS "DELETE_FLAG"
			, "STG_DL_INR_SRC"."last_updated" AS "last_updated"
			, "STG_DL_INR_SRC"."checkout_status_id" AS "checkout_status_id"
			, "STG_DL_INR_SRC"."checkout_date" AS "checkout_date"
			, "STG_DL_INR_SRC"."return_date" AS "return_date"
			, ROW_NUMBER()OVER(PARTITION BY "STG_DL_INR_SRC"."LND_checkouts_HKEY" ORDER BY "STG_DL_INR_SRC"."LOAD_DATE") AS "DUMMY"
		FROM "PostgresLibrary_STG"."checkouts" "STG_DL_INR_SRC"
	)
	SELECT 
		  "STG_DL_SRC"."LND_checkouts_HKEY" AS "LND_checkouts_HKEY"
		, "STG_DL_SRC"."checkout_id" AS "checkout_id"
		, "STG_DL_SRC"."user_id" AS "user_id"
		, "STG_DL_SRC"."book_id" AS "book_id"
		, "STG_DL_SRC"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
		, "STG_DL_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "STG_DL_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "STG_DL_SRC"."HASH_DIFF" AS "HASH_DIFF"
		, "STG_DL_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
		, "STG_DL_SRC"."last_updated" AS "last_updated"
		, "STG_DL_SRC"."checkout_status_id" AS "checkout_status_id"
		, "STG_DL_SRC"."checkout_date" AS "checkout_date"
		, "STG_DL_SRC"."return_date" AS "return_date"
	FROM "STG_DL_SRC" "STG_DL_SRC"
	WHERE  "STG_DL_SRC"."DUMMY" = 1
	;
END;



END;
$function$;
 
 
