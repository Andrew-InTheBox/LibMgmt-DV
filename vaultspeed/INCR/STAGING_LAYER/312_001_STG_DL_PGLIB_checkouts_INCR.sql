CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."STG_DL_PGLIB_checkouts_INCR"() 
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

BEGIN -- STG_DL_TGT

	TRUNCATE TABLE "PostgresLibrary_STG"."checkouts"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."checkouts"(
		 "LND_checkouts_HKEY"
		,"books_HKEY"
		,"users_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"checkout_id"
		,"book_id"
		,"user_id"
		,"REF_checkout_status_id_FK"
		,"book_id_FK_bookid_BK"
		,"user_id_FK_userid_BK"
		,"checkout_date"
		,"return_date"
		,"checkout_status_id"
	)
	WITH "CALC_HASH_KEYS" AS 
	( 
		SELECT 
			  UPPER(ENCODE(DIGEST(  'PGLIB' || '#' || "EXT_SRC"."book_id_FK_bookid_BK" || '#' || 'PGLIB' || '#' || 
				"EXT_SRC"."user_id_FK_userid_BK" || '#'  ,'SHA1'),'HEX')) AS "LND_checkouts_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."book_id_FK_bookid_BK" || '#' ,'SHA1'),'HEX')) AS "books_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."user_id_FK_userid_BK" || '#' ,'SHA1'),'HEX')) AS "users_HKEY"
			, "EXT_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "EXT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, "EXT_SRC"."last_updated" AS "last_updated"
			, "EXT_SRC"."__$operation" AS "__$operation"
			, "EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "EXT_SRC"."checkout_id" AS "checkout_id"
			, "EXT_SRC"."book_id" AS "book_id"
			, "EXT_SRC"."user_id" AS "user_id"
			, "EXT_SRC"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
			, "EXT_SRC"."book_id_FK_bookid_BK" AS "book_id_FK_bookid_BK"
			, "EXT_SRC"."user_id_FK_userid_BK" AS "user_id_FK_userid_BK"
			, "EXT_SRC"."checkout_date" AS "checkout_date"
			, "EXT_SRC"."return_date" AS "return_date"
			, "EXT_SRC"."checkout_status_id" AS "checkout_status_id"
		FROM "PostgresLibrary_EXT"."checkouts" "EXT_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  "MEX_SRC"."RECORD_TYPE" = 'U'
	)
	SELECT 
		  "CALC_HASH_KEYS"."LND_checkouts_HKEY" AS "LND_checkouts_HKEY"
		, "CALC_HASH_KEYS"."books_HKEY" AS "books_HKEY"
		, "CALC_HASH_KEYS"."users_HKEY" AS "users_HKEY"
		, CURRENT_TIMESTAMP + row_number() over (PARTITION BY  "CALC_HASH_KEYS"."books_HKEY" ,  "CALC_HASH_KEYS"."users_HKEY"  ORDER BY  "CALC_HASH_KEYS"."last_updated")
			* interval'2 microsecond'   AS "LOAD_DATE"
		, "CALC_HASH_KEYS"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "CALC_HASH_KEYS"."last_updated" AS "last_updated"
		, "CALC_HASH_KEYS"."__$operation" AS "__$operation"
		, "CALC_HASH_KEYS"."RECORD_TYPE" AS "RECORD_TYPE"
		, "CALC_HASH_KEYS"."checkout_id" AS "checkout_id"
		, "CALC_HASH_KEYS"."book_id" AS "book_id"
		, "CALC_HASH_KEYS"."user_id" AS "user_id"
		, "CALC_HASH_KEYS"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
		, "CALC_HASH_KEYS"."book_id_FK_bookid_BK" AS "book_id_FK_bookid_BK"
		, "CALC_HASH_KEYS"."user_id_FK_userid_BK" AS "user_id_FK_userid_BK"
		, "CALC_HASH_KEYS"."checkout_date" AS "checkout_date"
		, "CALC_HASH_KEYS"."return_date" AS "return_date"
		, "CALC_HASH_KEYS"."checkout_status_id" AS "checkout_status_id"
	FROM "CALC_HASH_KEYS" "CALC_HASH_KEYS"
	;
END;



END;
$function$;
 
 
