CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."LDS_PGLIB_bookauthor_INCR"() 
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

	TRUNCATE TABLE "PostgresLibrary_STG"."LDS_PGLIB_book_author_TMP"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."LDS_PGLIB_book_author_TMP"(
		 "LND_book_author_HKEY"
		,"authors_HKEY"
		,"books_HKEY"
		,"book_id"
		,"author_id"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"HASH_DIFF"
		,"RECORD_TYPE"
		,"SOURCE"
		,"EQUAL"
		,"DELETE_FLAG"
		,"last_updated"
	)
	WITH "DIST_STG" AS 
	( 
		SELECT 
			  "STG_DIS_SRC"."LND_book_author_HKEY" AS "LND_book_author_HKEY"
			, "STG_DIS_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, MIN("STG_DIS_SRC"."LOAD_DATE") AS "MIN_LOAD_TIMESTAMP"
		FROM "PostgresLibrary_STG"."book_author" "STG_DIS_SRC"
		GROUP BY  "STG_DIS_SRC"."LND_book_author_HKEY",  "STG_DIS_SRC"."LOAD_CYCLE_ID"
	)
	, "TEMP_TABLE_SET" AS 
	( 
		SELECT 
			  "STG_TEMP_SRC"."LND_book_author_HKEY" AS "LND_book_author_HKEY"
			, "STG_TEMP_SRC"."authors_HKEY" AS "authors_HKEY"
			, "STG_TEMP_SRC"."books_HKEY" AS "books_HKEY"
			, "STG_TEMP_SRC"."book_id" AS "book_id"
			, "STG_TEMP_SRC"."author_id" AS "author_id"
			, "STG_TEMP_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_TEMP_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, TO_TIMESTAMP(NULL, 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "LOAD_END_DATE"
			, UPPER(ENCODE(DIGEST(COALESCE('','~') ,'SHA1'),'HEX')) AS "HASH_DIFF"
			, "STG_TEMP_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, 'STG' AS "SOURCE"
			, 1 AS "ORIGIN_ID"
			, CASE WHEN "STG_TEMP_SRC"."__$operation" = 'D' THEN 'Y'::text ELSE 'N'::text END AS "DELETE_FLAG"
			, "STG_TEMP_SRC"."last_updated" AS "last_updated"
		FROM "PostgresLibrary_STG"."book_author" "STG_TEMP_SRC"
		UNION ALL 
		SELECT 
			  "LDS_SRC"."LND_book_author_HKEY" AS "LND_book_author_HKEY"
			, "LND_SRC"."authors_HKEY" AS "authors_HKEY"
			, "LND_SRC"."books_HKEY" AS "books_HKEY"
			, "LDS_SRC"."book_id" AS "book_id"
			, "LDS_SRC"."author_id" AS "author_id"
			, "LDS_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "LDS_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, MAX("LDS_SRC"."LOAD_DATE")OVER(PARTITION BY "LDS_SRC"."LND_book_author_HKEY") AS "LOAD_END_DATE"
			, "LDS_SRC"."HASH_DIFF" AS "HASH_DIFF"
			, 'SAT' AS "RECORD_TYPE"
			, 'LDS' AS "SOURCE"
			, 0 AS "ORIGIN_ID"
			, "LDS_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
			, "LDS_SRC"."last_updated" AS "last_updated"
		FROM "LIBPG_FL"."LDS_PGLIB_book_author" "LDS_SRC"
		INNER JOIN "LIBPG_FL"."LND_book_author" "LND_SRC" ON  "LDS_SRC"."LND_book_author_HKEY" = "LND_SRC"."LND_book_author_HKEY"
		INNER JOIN "DIST_STG" "DIST_STG" ON  "LDS_SRC"."LND_book_author_HKEY" = "DIST_STG"."LND_book_author_HKEY"
	)
	SELECT 
		  "TEMP_TABLE_SET"."LND_book_author_HKEY" AS "LND_book_author_HKEY"
		, "TEMP_TABLE_SET"."authors_HKEY" AS "authors_HKEY"
		, "TEMP_TABLE_SET"."books_HKEY" AS "books_HKEY"
		, "TEMP_TABLE_SET"."book_id" AS "book_id"
		, "TEMP_TABLE_SET"."author_id" AS "author_id"
		, "TEMP_TABLE_SET"."LOAD_DATE" AS "LOAD_DATE"
		, "TEMP_TABLE_SET"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "TEMP_TABLE_SET"."HASH_DIFF" AS "HASH_DIFF"
		, "TEMP_TABLE_SET"."RECORD_TYPE" AS "RECORD_TYPE"
		, "TEMP_TABLE_SET"."SOURCE" AS "SOURCE"
		, CASE WHEN "TEMP_TABLE_SET"."SOURCE" = 'STG' AND "TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."HASH_DIFF"::text =
			LAG("TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."HASH_DIFF"::text,1)OVER(PARTITION BY "TEMP_TABLE_SET"."LND_book_author_HKEY" ORDER BY "TEMP_TABLE_SET"."LOAD_DATE","TEMP_TABLE_SET"."ORIGIN_ID")THEN 1 ELSE 0 END AS "EQUAL"
		, "TEMP_TABLE_SET"."DELETE_FLAG" AS "DELETE_FLAG"
		, "TEMP_TABLE_SET"."last_updated" AS "last_updated"
	FROM "TEMP_TABLE_SET" "TEMP_TABLE_SET"
	WHERE  "TEMP_TABLE_SET"."SOURCE" = 'STG' OR("TEMP_TABLE_SET"."LOAD_DATE" = "TEMP_TABLE_SET"."LOAD_END_DATE" AND "TEMP_TABLE_SET"."SOURCE" = 'LDS')
	;
END;


BEGIN -- LDS_INUR_TGT

	INSERT INTO "LIBPG_FL"."LDS_PGLIB_book_author"(
		 "LND_book_author_HKEY"
		,"book_id"
		,"author_id"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"HASH_DIFF"
		,"DELETE_FLAG"
		,"last_updated"
	)
	SELECT 
		  "LDS_TEMP_SRC_INUR"."LND_book_author_HKEY" AS "LND_book_author_HKEY"
		, "LDS_TEMP_SRC_INUR"."book_id" AS "book_id"
		, "LDS_TEMP_SRC_INUR"."author_id" AS "author_id"
		, "LDS_TEMP_SRC_INUR"."LOAD_DATE" AS "LOAD_DATE"
		, "LDS_TEMP_SRC_INUR"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "LDS_TEMP_SRC_INUR"."HASH_DIFF" AS "HASH_DIFF"
		, "LDS_TEMP_SRC_INUR"."DELETE_FLAG" AS "DELETE_FLAG"
		, "LDS_TEMP_SRC_INUR"."last_updated" AS "last_updated"
	FROM "PostgresLibrary_STG"."LDS_PGLIB_book_author_TMP" "LDS_TEMP_SRC_INUR"
	WHERE  "LDS_TEMP_SRC_INUR"."SOURCE" = 'STG' AND "LDS_TEMP_SRC_INUR"."EQUAL" = 0
	;
END;



END;
$function$;
 
 
