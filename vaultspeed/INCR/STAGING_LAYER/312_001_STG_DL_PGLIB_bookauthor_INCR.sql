CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."STG_DL_PGLIB_bookauthor_INCR"() 
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

	TRUNCATE TABLE "PostgresLibrary_STG"."book_author"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."book_author"(
		 "LND_book_author_HKEY"
		,"authors_HKEY"
		,"books_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"book_id"
		,"author_id"
		,"author_id_FK_authorid_BK"
		,"book_id_FK_bookid_BK"
	)
	WITH "CALC_HASH_KEYS" AS 
	( 
		SELECT 
			  UPPER(ENCODE(DIGEST(  'PGLIB' || '#' || "EXT_SRC"."author_id_FK_authorid_BK" || '#' || 'PGLIB' || '#' || 
				"EXT_SRC"."book_id_FK_bookid_BK" || '#'  ,'SHA1'),'HEX')) AS "LND_book_author_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."author_id_FK_authorid_BK" || '#' ,'SHA1'),'HEX')) AS "authors_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."book_id_FK_bookid_BK" || '#' ,'SHA1'),'HEX')) AS "books_HKEY"
			, "EXT_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "EXT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, "EXT_SRC"."last_updated" AS "last_updated"
			, "EXT_SRC"."__$operation" AS "__$operation"
			, "EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "EXT_SRC"."book_id" AS "book_id"
			, "EXT_SRC"."author_id" AS "author_id"
			, "EXT_SRC"."author_id_FK_authorid_BK" AS "author_id_FK_authorid_BK"
			, "EXT_SRC"."book_id_FK_bookid_BK" AS "book_id_FK_bookid_BK"
		FROM "PostgresLibrary_EXT"."book_author" "EXT_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  "MEX_SRC"."RECORD_TYPE" = 'U'
	)
	SELECT 
		  "CALC_HASH_KEYS"."LND_book_author_HKEY" AS "LND_book_author_HKEY"
		, "CALC_HASH_KEYS"."authors_HKEY" AS "authors_HKEY"
		, "CALC_HASH_KEYS"."books_HKEY" AS "books_HKEY"
		, CURRENT_TIMESTAMP + row_number() over (PARTITION BY  "CALC_HASH_KEYS"."authors_HKEY" ,  "CALC_HASH_KEYS"."books_HKEY"  ORDER BY  "CALC_HASH_KEYS"."last_updated")
			* interval'2 microsecond'   AS "LOAD_DATE"
		, "CALC_HASH_KEYS"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "CALC_HASH_KEYS"."last_updated" AS "last_updated"
		, "CALC_HASH_KEYS"."__$operation" AS "__$operation"
		, "CALC_HASH_KEYS"."RECORD_TYPE" AS "RECORD_TYPE"
		, "CALC_HASH_KEYS"."book_id" AS "book_id"
		, "CALC_HASH_KEYS"."author_id" AS "author_id"
		, "CALC_HASH_KEYS"."author_id_FK_authorid_BK" AS "author_id_FK_authorid_BK"
		, "CALC_HASH_KEYS"."book_id_FK_bookid_BK" AS "book_id_FK_bookid_BK"
	FROM "CALC_HASH_KEYS" "CALC_HASH_KEYS"
	;
END;



END;
$function$;
 
 
