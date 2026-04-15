CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."EXT_PGLIB_books_INIT"() 
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
	WITH "LOAD_INIT_DATA" AS 
	( 
		SELECT 
			  'I' ::text AS "__$operation"
			, "INI_SRC"."last_updated" AS "last_updated"
			, 'S'::text AS "RECORD_TYPE"
			, COALESCE("INI_SRC"."book_id", CAST("MEX_INR_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "book_id"
			, COALESCE("INI_SRC"."publisher_id", CAST("MEX_INR_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "publisher_id"
			, COALESCE("INI_SRC"."genre_id", CAST("MEX_INR_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "genre_id"
			, "INI_SRC"."title" AS "title"
			, "INI_SRC"."published_year" AS "published_year"
			, "INI_SRC"."isbn" AS "isbn"
			, "INI_SRC"."language" AS "language"
			, "INI_SRC"."number_of_pages" AS "number_of_pages"
			, "INI_SRC"."format" AS "format"
			, "INI_SRC"."edition" AS "edition"
			, "INI_SRC"."description" AS "description"
			, "INI_SRC"."cover_image_url" AS "cover_image_url"
			, "INI_SRC"."available_copies" AS "available_copies"
			, "INI_SRC"."total_copies" AS "total_copies"
			, "INI_SRC"."average_rating" AS "average_rating"
			, "INI_SRC"."dimensions" AS "dimensions"
			, "INI_SRC"."weight" AS "weight"
			, "INI_SRC"."keywords" AS "keywords"
		FROM "lib_mgmt"."books" "INI_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_INR_SRC" ON  "MEX_INR_SRC"."RECORD_TYPE" = 'N'
	)
	, "PREP_EXCEP" AS 
	( 
		SELECT 
			  "LOAD_INIT_DATA"."__$operation" AS "__$operation"
			, "LOAD_INIT_DATA"."last_updated" AS "last_updated"
			, "LOAD_INIT_DATA"."RECORD_TYPE" AS "RECORD_TYPE"
			, NULL ::int AS "LOAD_CYCLE_ID"
			, "LOAD_INIT_DATA"."book_id" AS "book_id"
			, "LOAD_INIT_DATA"."publisher_id" AS "publisher_id"
			, "LOAD_INIT_DATA"."genre_id" AS "genre_id"
			, "LOAD_INIT_DATA"."title" AS "title"
			, "LOAD_INIT_DATA"."published_year" AS "published_year"
			, "LOAD_INIT_DATA"."isbn" AS "isbn"
			, "LOAD_INIT_DATA"."language" AS "language"
			, "LOAD_INIT_DATA"."number_of_pages" AS "number_of_pages"
			, "LOAD_INIT_DATA"."format" AS "format"
			, "LOAD_INIT_DATA"."edition" AS "edition"
			, "LOAD_INIT_DATA"."description" AS "description"
			, "LOAD_INIT_DATA"."cover_image_url" AS "cover_image_url"
			, "LOAD_INIT_DATA"."available_copies" AS "available_copies"
			, "LOAD_INIT_DATA"."total_copies" AS "total_copies"
			, "LOAD_INIT_DATA"."average_rating" AS "average_rating"
			, "LOAD_INIT_DATA"."dimensions" AS "dimensions"
			, "LOAD_INIT_DATA"."weight" AS "weight"
			, "LOAD_INIT_DATA"."keywords" AS "keywords"
		FROM "LOAD_INIT_DATA" "LOAD_INIT_DATA"
		UNION ALL 
		SELECT 
			  'I' ::text AS "__$operation"
			, TO_TIMESTAMP("MEX_EXT_SRC"."KEY_ATTRIBUTE_TIMESTAMP", 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "last_updated"
			, "MEX_EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "MEX_EXT_SRC"."LOAD_CYCLE_ID" ::int AS "LOAD_CYCLE_ID"
			, CAST("MEX_EXT_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "book_id"
			, CAST("MEX_EXT_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "publisher_id"
			, CAST("MEX_EXT_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER) AS "genre_id"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "title"
			, CAST("MEX_EXT_SRC"."ATTRIBUTE_INTEGER" AS INTEGER) AS "published_year"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "isbn"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "language"
			, CAST("MEX_EXT_SRC"."ATTRIBUTE_INTEGER" AS INTEGER) AS "number_of_pages"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "format"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "edition"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "description"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "cover_image_url"
			, CAST("MEX_EXT_SRC"."ATTRIBUTE_INTEGER" AS INTEGER) AS "available_copies"
			, CAST("MEX_EXT_SRC"."ATTRIBUTE_INTEGER" AS INTEGER) AS "total_copies"
			, CAST("MEX_EXT_SRC"."ATTRIBUTE_DOUBLE_PRECISION" AS DOUBLE PRECISION) AS "average_rating"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "dimensions"
			, CAST("MEX_EXT_SRC"."ATTRIBUTE_DOUBLE_PRECISION" AS DOUBLE PRECISION) AS "weight"
			, "MEX_EXT_SRC"."ATTRIBUTE_VARCHAR"::text AS "keywords"
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
			, "PREP_EXCEP"."book_id" AS "book_id"
			, "PREP_EXCEP"."publisher_id" AS "publisher_id"
			, "PREP_EXCEP"."genre_id" AS "genre_id"
			, COALESCE(UPPER( "PREP_EXCEP"."book_id"::text),"MEX_SRC"."KEY_ATTRIBUTE_INTEGER") AS "book_id_BK"
			, UPPER( "PREP_EXCEP"."publisher_id"::text) AS "publisher_id_FK_publisherid_BK"
			, UPPER( "PREP_EXCEP"."genre_id"::text) AS "genre_id_FK_genreid_BK"
			, "PREP_EXCEP"."title" AS "title"
			, "PREP_EXCEP"."published_year" AS "published_year"
			, "PREP_EXCEP"."isbn" AS "isbn"
			, "PREP_EXCEP"."language" AS "language"
			, "PREP_EXCEP"."number_of_pages" AS "number_of_pages"
			, "PREP_EXCEP"."format" AS "format"
			, "PREP_EXCEP"."edition" AS "edition"
			, "PREP_EXCEP"."description" AS "description"
			, "PREP_EXCEP"."cover_image_url" AS "cover_image_url"
			, "PREP_EXCEP"."available_copies" AS "available_copies"
			, "PREP_EXCEP"."total_copies" AS "total_copies"
			, "PREP_EXCEP"."average_rating" AS "average_rating"
			, "PREP_EXCEP"."dimensions" AS "dimensions"
			, "PREP_EXCEP"."weight" AS "weight"
			, "PREP_EXCEP"."keywords" AS "keywords"
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
	;
END;



END;
$function$;
 
 
