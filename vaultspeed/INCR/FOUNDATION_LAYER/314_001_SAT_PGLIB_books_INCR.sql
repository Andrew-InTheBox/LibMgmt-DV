CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."SAT_PGLIB_books_INCR"() 
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

BEGIN -- SAT_TEMP_TGT

	TRUNCATE TABLE "PostgresLibrary_STG"."SAT_PGLIB_books_TMP"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."SAT_PGLIB_books_TMP"(
		 "books_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"RECORD_TYPE"
		,"SOURCE"
		,"EQUAL"
		,"HASH_DIFF"
		,"DELETE_FLAG"
		,"last_updated"
		,"book_id"
		,"title"
		,"published_year"
		,"isbn"
		,"language"
		,"number_of_pages"
		,"format"
		,"edition"
		,"description"
		,"cover_image_url"
		,"available_copies"
		,"total_copies"
		,"average_rating"
		,"dimensions"
		,"weight"
		,"keywords"
	)
	WITH "DIST_STG" AS 
	( 
		SELECT DISTINCT 
 			  "STG_DIS_SRC"."books_HKEY" AS "books_HKEY"
			, "STG_DIS_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		FROM "PostgresLibrary_STG"."books" "STG_DIS_SRC"
		WHERE  "STG_DIS_SRC"."RECORD_TYPE" = 'S'
	)
	, "TEMP_TABLE_SET" AS 
	( 
		SELECT 
			  "STG_TEMP_SRC"."books_HKEY" AS "books_HKEY"
			, "STG_TEMP_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_TEMP_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, TO_TIMESTAMP(NULL, 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "LOAD_END_DATE"
			, "STG_TEMP_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, 'STG' AS "SOURCE"
			, 1 AS "ORIGIN_ID"
			, UPPER(ENCODE(DIGEST(COALESCE(RTRIM(  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."title"),'~'),'#','\' || 
				'#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."published_year"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."isbn"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."language"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."number_of_pages"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."format"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."edition"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."description"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."cover_image_url"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."available_copies"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."total_copies"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."average_rating"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."dimensions"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."weight"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."keywords"),'~'),'#','\' || '#'))|| '#' ,'#' || '~'),'~') ,'SHA1'),'HEX')) AS "HASH_DIFF"
			, CASE WHEN "STG_TEMP_SRC"."__$operation" = 'D' THEN 'Y'::text ELSE 'N'::text END AS "DELETE_FLAG"
			, "STG_TEMP_SRC"."last_updated" AS "last_updated"
			, "STG_TEMP_SRC"."book_id" AS "book_id"
			, "STG_TEMP_SRC"."title" AS "title"
			, "STG_TEMP_SRC"."published_year" AS "published_year"
			, "STG_TEMP_SRC"."isbn" AS "isbn"
			, "STG_TEMP_SRC"."language" AS "language"
			, "STG_TEMP_SRC"."number_of_pages" AS "number_of_pages"
			, "STG_TEMP_SRC"."format" AS "format"
			, "STG_TEMP_SRC"."edition" AS "edition"
			, "STG_TEMP_SRC"."description" AS "description"
			, "STG_TEMP_SRC"."cover_image_url" AS "cover_image_url"
			, "STG_TEMP_SRC"."available_copies" AS "available_copies"
			, "STG_TEMP_SRC"."total_copies" AS "total_copies"
			, "STG_TEMP_SRC"."average_rating" AS "average_rating"
			, "STG_TEMP_SRC"."dimensions" AS "dimensions"
			, "STG_TEMP_SRC"."weight" AS "weight"
			, "STG_TEMP_SRC"."keywords" AS "keywords"
		FROM "PostgresLibrary_STG"."books" "STG_TEMP_SRC"
		WHERE  "STG_TEMP_SRC"."RECORD_TYPE" = 'S'
		UNION ALL 
		SELECT 
			  "SAT_SRC"."books_HKEY" AS "books_HKEY"
			, "SAT_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "SAT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, MAX("SAT_SRC"."LOAD_DATE")OVER( PARTITION BY "SAT_SRC"."books_HKEY") AS "LOAD_END_DATE"
			, 'SAT' AS "RECORD_TYPE"
			, 'SAT' AS "SOURCE"
			, 0 AS "ORIGIN_ID"
			, "SAT_SRC"."HASH_DIFF" AS "HASH_DIFF"
			, "SAT_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
			, "SAT_SRC"."last_updated" AS "last_updated"
			, "SAT_SRC"."book_id" AS "book_id"
			, "SAT_SRC"."title" AS "title"
			, "SAT_SRC"."published_year" AS "published_year"
			, "SAT_SRC"."isbn" AS "isbn"
			, "SAT_SRC"."language" AS "language"
			, "SAT_SRC"."number_of_pages" AS "number_of_pages"
			, "SAT_SRC"."format" AS "format"
			, "SAT_SRC"."edition" AS "edition"
			, "SAT_SRC"."description" AS "description"
			, "SAT_SRC"."cover_image_url" AS "cover_image_url"
			, "SAT_SRC"."available_copies" AS "available_copies"
			, "SAT_SRC"."total_copies" AS "total_copies"
			, "SAT_SRC"."average_rating" AS "average_rating"
			, "SAT_SRC"."dimensions" AS "dimensions"
			, "SAT_SRC"."weight" AS "weight"
			, "SAT_SRC"."keywords" AS "keywords"
		FROM "LIBPG_FL"."SAT_PGLIB_books" "SAT_SRC"
		INNER JOIN "DIST_STG" "DIST_STG" ON  "SAT_SRC"."books_HKEY" = "DIST_STG"."books_HKEY"
	)
	SELECT 
		  "TEMP_TABLE_SET"."books_HKEY" AS "books_HKEY"
		, "TEMP_TABLE_SET"."LOAD_DATE" AS "LOAD_DATE"
		, "TEMP_TABLE_SET"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "TEMP_TABLE_SET"."RECORD_TYPE" AS "RECORD_TYPE"
		, "TEMP_TABLE_SET"."SOURCE" AS "SOURCE"
		, CASE WHEN "TEMP_TABLE_SET"."SOURCE" = 'STG' AND "TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."HASH_DIFF"::text =
			LAG("TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."HASH_DIFF"::text,1)OVER(PARTITION BY "TEMP_TABLE_SET"."books_HKEY" ORDER BY "TEMP_TABLE_SET"."LOAD_DATE","TEMP_TABLE_SET"."ORIGIN_ID")THEN 1 ELSE 0 END AS "EQUAL"
		, "TEMP_TABLE_SET"."HASH_DIFF" AS "HASH_DIFF"
		, "TEMP_TABLE_SET"."DELETE_FLAG" AS "DELETE_FLAG"
		, "TEMP_TABLE_SET"."last_updated" AS "last_updated"
		, "TEMP_TABLE_SET"."book_id" AS "book_id"
		, "TEMP_TABLE_SET"."title" AS "title"
		, "TEMP_TABLE_SET"."published_year" AS "published_year"
		, "TEMP_TABLE_SET"."isbn" AS "isbn"
		, "TEMP_TABLE_SET"."language" AS "language"
		, "TEMP_TABLE_SET"."number_of_pages" AS "number_of_pages"
		, "TEMP_TABLE_SET"."format" AS "format"
		, "TEMP_TABLE_SET"."edition" AS "edition"
		, "TEMP_TABLE_SET"."description" AS "description"
		, "TEMP_TABLE_SET"."cover_image_url" AS "cover_image_url"
		, "TEMP_TABLE_SET"."available_copies" AS "available_copies"
		, "TEMP_TABLE_SET"."total_copies" AS "total_copies"
		, "TEMP_TABLE_SET"."average_rating" AS "average_rating"
		, "TEMP_TABLE_SET"."dimensions" AS "dimensions"
		, "TEMP_TABLE_SET"."weight" AS "weight"
		, "TEMP_TABLE_SET"."keywords" AS "keywords"
	FROM "TEMP_TABLE_SET" "TEMP_TABLE_SET"
	WHERE  "TEMP_TABLE_SET"."SOURCE" = 'STG' OR("TEMP_TABLE_SET"."LOAD_DATE" = "TEMP_TABLE_SET"."LOAD_END_DATE" AND "TEMP_TABLE_SET"."SOURCE" = 'SAT')
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO "LIBPG_FL"."SAT_PGLIB_books"(
		 "books_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"HASH_DIFF"
		,"DELETE_FLAG"
		,"last_updated"
		,"book_id"
		,"title"
		,"published_year"
		,"isbn"
		,"language"
		,"number_of_pages"
		,"format"
		,"edition"
		,"description"
		,"cover_image_url"
		,"available_copies"
		,"total_copies"
		,"average_rating"
		,"dimensions"
		,"weight"
		,"keywords"
	)
	SELECT 
		  "SAT_TEMP_SRC_INUR"."books_HKEY" AS "books_HKEY"
		, "SAT_TEMP_SRC_INUR"."LOAD_DATE" AS "LOAD_DATE"
		, "SAT_TEMP_SRC_INUR"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "SAT_TEMP_SRC_INUR"."HASH_DIFF" AS "HASH_DIFF"
		, "SAT_TEMP_SRC_INUR"."DELETE_FLAG" AS "DELETE_FLAG"
		, "SAT_TEMP_SRC_INUR"."last_updated" AS "last_updated"
		, "SAT_TEMP_SRC_INUR"."book_id" AS "book_id"
		, "SAT_TEMP_SRC_INUR"."title" AS "title"
		, "SAT_TEMP_SRC_INUR"."published_year" AS "published_year"
		, "SAT_TEMP_SRC_INUR"."isbn" AS "isbn"
		, "SAT_TEMP_SRC_INUR"."language" AS "language"
		, "SAT_TEMP_SRC_INUR"."number_of_pages" AS "number_of_pages"
		, "SAT_TEMP_SRC_INUR"."format" AS "format"
		, "SAT_TEMP_SRC_INUR"."edition" AS "edition"
		, "SAT_TEMP_SRC_INUR"."description" AS "description"
		, "SAT_TEMP_SRC_INUR"."cover_image_url" AS "cover_image_url"
		, "SAT_TEMP_SRC_INUR"."available_copies" AS "available_copies"
		, "SAT_TEMP_SRC_INUR"."total_copies" AS "total_copies"
		, "SAT_TEMP_SRC_INUR"."average_rating" AS "average_rating"
		, "SAT_TEMP_SRC_INUR"."dimensions" AS "dimensions"
		, "SAT_TEMP_SRC_INUR"."weight" AS "weight"
		, "SAT_TEMP_SRC_INUR"."keywords" AS "keywords"
	FROM "PostgresLibrary_STG"."SAT_PGLIB_books_TMP" "SAT_TEMP_SRC_INUR"
	WHERE  "SAT_TEMP_SRC_INUR"."SOURCE" = 'STG' AND "SAT_TEMP_SRC_INUR"."EQUAL" = 0
	;
END;



END;
$function$;
 
 
