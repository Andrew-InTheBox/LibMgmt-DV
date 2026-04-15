CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."EXT_PGLIB_books_INCR"() 
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

	TRUNCATE TABLE "PostgresLibrary_EXT"."books"  CASCADE;

	INSERT INTO "PostgresLibrary_EXT"."books"(
		 "LOAD_CYCLE_ID"
		,"LOAD_DATE"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"book_id"
		,"publisher_id"
		,"genre_id"
		,"book_id_BK"
		,"publisher_id_FK_publisherid_BK"
		,"genre_id_FK_genreid_BK"
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
	WITH "CALCULATE_BK" AS 
	( 
		SELECT 
			  "TDFV_SRC"."last_updated" AS "last_updated"
			, "MEX_SRC"."ATTRIBUTE_VARCHAR" AS "__$operation"
			, "TDFV_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "TDFV_SRC"."book_id" AS "book_id"
			, "TDFV_SRC"."publisher_id" AS "publisher_id"
			, "TDFV_SRC"."genre_id" AS "genre_id"
			, COALESCE(UPPER( "TDFV_SRC"."book_id"::text),"MEX_SRC"."KEY_ATTRIBUTE_INTEGER") AS "book_id_BK"
			, UPPER( "TDFV_SRC"."publisher_id"::text) AS "publisher_id_FK_publisherid_BK"
			, UPPER( "TDFV_SRC"."genre_id"::text) AS "genre_id_FK_genreid_BK"
			, "TDFV_SRC"."title" AS "title"
			, "TDFV_SRC"."published_year" AS "published_year"
			, "TDFV_SRC"."isbn" AS "isbn"
			, "TDFV_SRC"."language" AS "language"
			, "TDFV_SRC"."number_of_pages" AS "number_of_pages"
			, "TDFV_SRC"."format" AS "format"
			, "TDFV_SRC"."edition" AS "edition"
			, "TDFV_SRC"."description" AS "description"
			, "TDFV_SRC"."cover_image_url" AS "cover_image_url"
			, "TDFV_SRC"."available_copies" AS "available_copies"
			, "TDFV_SRC"."total_copies" AS "total_copies"
			, "TDFV_SRC"."average_rating" AS "average_rating"
			, "TDFV_SRC"."dimensions" AS "dimensions"
			, "TDFV_SRC"."weight" AS "weight"
			, "TDFV_SRC"."keywords" AS "keywords"
		FROM "PostgresLibrary_DFV"."VW_books" "TDFV_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  1 = 1
		WHERE  "MEX_SRC"."RECORD_TYPE" = 'N'
	)
	, "EXT_UNION" AS 
	( 
		SELECT 
			  "LCI_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, CURRENT_TIMESTAMP + row_number() over (PARTITION BY  "CALCULATE_BK"."book_id_BK"  ORDER BY  "CALCULATE_BK"."last_updated")
				* interval'2 microsecond'   AS "LOAD_DATE"
			, "CALCULATE_BK"."last_updated" AS "last_updated"
			, "CALCULATE_BK"."__$operation" AS "__$operation"
			, "CALCULATE_BK"."RECORD_TYPE" AS "RECORD_TYPE"
			, "CALCULATE_BK"."book_id" AS "book_id"
			, "CALCULATE_BK"."publisher_id" AS "publisher_id"
			, "CALCULATE_BK"."genre_id" AS "genre_id"
			, "CALCULATE_BK"."book_id_BK" AS "book_id_BK"
			, "CALCULATE_BK"."publisher_id_FK_publisherid_BK" AS "publisher_id_FK_publisherid_BK"
			, "CALCULATE_BK"."genre_id_FK_genreid_BK" AS "genre_id_FK_genreid_BK"
			, "CALCULATE_BK"."title" AS "title"
			, "CALCULATE_BK"."published_year" AS "published_year"
			, "CALCULATE_BK"."isbn" AS "isbn"
			, "CALCULATE_BK"."language" AS "language"
			, "CALCULATE_BK"."number_of_pages" AS "number_of_pages"
			, "CALCULATE_BK"."format" AS "format"
			, "CALCULATE_BK"."edition" AS "edition"
			, "CALCULATE_BK"."description" AS "description"
			, "CALCULATE_BK"."cover_image_url" AS "cover_image_url"
			, "CALCULATE_BK"."available_copies" AS "available_copies"
			, "CALCULATE_BK"."total_copies" AS "total_copies"
			, "CALCULATE_BK"."average_rating" AS "average_rating"
			, "CALCULATE_BK"."dimensions" AS "dimensions"
			, "CALCULATE_BK"."weight" AS "weight"
			, "CALCULATE_BK"."keywords" AS "keywords"
		FROM "CALCULATE_BK" "CALCULATE_BK"
		INNER JOIN "PostgresLibrary_MTD"."LOAD_CYCLE_INFO" "LCI_SRC" ON  1 = 1
	)
	SELECT 
		  "EXT_UNION"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "EXT_UNION"."LOAD_DATE" AS "LOAD_DATE"
		, "EXT_UNION"."last_updated" AS "last_updated"
		, "EXT_UNION"."__$operation" AS "__$operation"
		, "EXT_UNION"."RECORD_TYPE" AS "RECORD_TYPE"
		, "EXT_UNION"."book_id" AS "book_id"
		, "EXT_UNION"."publisher_id" AS "publisher_id"
		, "EXT_UNION"."genre_id" AS "genre_id"
		, "EXT_UNION"."book_id_BK" AS "book_id_BK"
		, "EXT_UNION"."publisher_id_FK_publisherid_BK" AS "publisher_id_FK_publisherid_BK"
		, "EXT_UNION"."genre_id_FK_genreid_BK" AS "genre_id_FK_genreid_BK"
		, "EXT_UNION"."title" AS "title"
		, "EXT_UNION"."published_year" AS "published_year"
		, "EXT_UNION"."isbn" AS "isbn"
		, "EXT_UNION"."language" AS "language"
		, "EXT_UNION"."number_of_pages" AS "number_of_pages"
		, "EXT_UNION"."format" AS "format"
		, "EXT_UNION"."edition" AS "edition"
		, "EXT_UNION"."description" AS "description"
		, "EXT_UNION"."cover_image_url" AS "cover_image_url"
		, "EXT_UNION"."available_copies" AS "available_copies"
		, "EXT_UNION"."total_copies" AS "total_copies"
		, "EXT_UNION"."average_rating" AS "average_rating"
		, "EXT_UNION"."dimensions" AS "dimensions"
		, "EXT_UNION"."weight" AS "weight"
		, "EXT_UNION"."keywords" AS "keywords"
	FROM "EXT_UNION" "EXT_UNION"
	;
END;



END;
$function$;
 
 
