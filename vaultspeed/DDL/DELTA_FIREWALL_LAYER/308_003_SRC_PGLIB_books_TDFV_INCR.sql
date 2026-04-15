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


DROP VIEW IF EXISTS "PostgresLibrary_DFV"."VW_books";
CREATE  VIEW "PostgresLibrary_DFV"."VW_books"  AS 
	WITH "DELTA_WINDOW" AS 
	( 
		SELECT 
			  ("LWT_SRC"."FMC_BEGIN_LW_TIMESTAMP"  AT TIME ZONE  'UTC' ) AT TIME ZONE  'PST'   AS "FMC_BEGIN_LW_TIMESTAMP"
			, ("LWT_SRC"."FMC_END_LW_TIMESTAMP"  AT TIME ZONE  'UTC' ) AT TIME ZONE  'PST'   AS "FMC_END_LW_TIMESTAMP"
		FROM "PostgresLibrary_MTD"."FMC_LOADING_WINDOW_TABLE" "LWT_SRC"
	)
	, "DELTA_VIEW_FILTER" AS 
	( 
		SELECT 
			  "CDC_SRC"."last_updated" AS "last_updated"
			, 'S' ::text AS "RECORD_TYPE"
			, "CDC_SRC"."book_id" AS "book_id"
			, "CDC_SRC"."publisher_id" AS "publisher_id"
			, "CDC_SRC"."genre_id" AS "genre_id"
			, "CDC_SRC"."title" AS "title"
			, "CDC_SRC"."published_year" AS "published_year"
			, "CDC_SRC"."isbn" AS "isbn"
			, "CDC_SRC"."language" AS "language"
			, "CDC_SRC"."number_of_pages" AS "number_of_pages"
			, "CDC_SRC"."format" AS "format"
			, "CDC_SRC"."edition" AS "edition"
			, "CDC_SRC"."description" AS "description"
			, "CDC_SRC"."cover_image_url" AS "cover_image_url"
			, "CDC_SRC"."available_copies" AS "available_copies"
			, "CDC_SRC"."total_copies" AS "total_copies"
			, "CDC_SRC"."average_rating" AS "average_rating"
			, "CDC_SRC"."dimensions" AS "dimensions"
			, "CDC_SRC"."weight" AS "weight"
			, "CDC_SRC"."keywords" AS "keywords"
		FROM "lib_mgmt"."books" "CDC_SRC"
		INNER JOIN "DELTA_WINDOW" "DELTA_WINDOW" ON  1 = 1
		WHERE  "CDC_SRC"."last_updated" > "DELTA_WINDOW"."FMC_BEGIN_LW_TIMESTAMP" AND "CDC_SRC"."last_updated" <= "DELTA_WINDOW"."FMC_END_LW_TIMESTAMP"
	)
	, "DELTA_VIEW" AS 
	( 
		SELECT 
			  "DELTA_VIEW_FILTER"."last_updated" AS "last_updated"
			, "DELTA_VIEW_FILTER"."RECORD_TYPE" AS "RECORD_TYPE"
			, "DELTA_VIEW_FILTER"."book_id" AS "book_id"
			, "DELTA_VIEW_FILTER"."publisher_id" AS "publisher_id"
			, "DELTA_VIEW_FILTER"."genre_id" AS "genre_id"
			, "DELTA_VIEW_FILTER"."title" AS "title"
			, "DELTA_VIEW_FILTER"."published_year" AS "published_year"
			, "DELTA_VIEW_FILTER"."isbn" AS "isbn"
			, "DELTA_VIEW_FILTER"."language" AS "language"
			, "DELTA_VIEW_FILTER"."number_of_pages" AS "number_of_pages"
			, "DELTA_VIEW_FILTER"."format" AS "format"
			, "DELTA_VIEW_FILTER"."edition" AS "edition"
			, "DELTA_VIEW_FILTER"."description" AS "description"
			, "DELTA_VIEW_FILTER"."cover_image_url" AS "cover_image_url"
			, "DELTA_VIEW_FILTER"."available_copies" AS "available_copies"
			, "DELTA_VIEW_FILTER"."total_copies" AS "total_copies"
			, "DELTA_VIEW_FILTER"."average_rating" AS "average_rating"
			, "DELTA_VIEW_FILTER"."dimensions" AS "dimensions"
			, "DELTA_VIEW_FILTER"."weight" AS "weight"
			, "DELTA_VIEW_FILTER"."keywords" AS "keywords"
		FROM "DELTA_VIEW_FILTER" "DELTA_VIEW_FILTER"
	)
	, "PREPJOINBK" AS 
	( 
		SELECT 
			  "DELTA_VIEW"."last_updated" AS "last_updated"
			, "DELTA_VIEW"."RECORD_TYPE" AS "RECORD_TYPE"
			, COALESCE("DELTA_VIEW"."book_id", CAST("MEX_BK_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "book_id"
			, COALESCE("DELTA_VIEW"."publisher_id", CAST("MEX_BK_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "publisher_id"
			, COALESCE("DELTA_VIEW"."genre_id", CAST("MEX_BK_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "genre_id"
			, "DELTA_VIEW"."title" AS "title"
			, "DELTA_VIEW"."published_year" AS "published_year"
			, "DELTA_VIEW"."isbn" AS "isbn"
			, "DELTA_VIEW"."language" AS "language"
			, "DELTA_VIEW"."number_of_pages" AS "number_of_pages"
			, "DELTA_VIEW"."format" AS "format"
			, "DELTA_VIEW"."edition" AS "edition"
			, "DELTA_VIEW"."description" AS "description"
			, "DELTA_VIEW"."cover_image_url" AS "cover_image_url"
			, "DELTA_VIEW"."available_copies" AS "available_copies"
			, "DELTA_VIEW"."total_copies" AS "total_copies"
			, "DELTA_VIEW"."average_rating" AS "average_rating"
			, "DELTA_VIEW"."dimensions" AS "dimensions"
			, "DELTA_VIEW"."weight" AS "weight"
			, "DELTA_VIEW"."keywords" AS "keywords"
		FROM "DELTA_VIEW" "DELTA_VIEW"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_BK_SRC" ON  1 = 1
		WHERE  "MEX_BK_SRC"."RECORD_TYPE" = 'N'
	)
	SELECT 
		  "PREPJOINBK"."last_updated" AS "last_updated"
		, "PREPJOINBK"."RECORD_TYPE" AS "RECORD_TYPE"
		, "PREPJOINBK"."book_id" AS "book_id"
		, "PREPJOINBK"."publisher_id" AS "publisher_id"
		, "PREPJOINBK"."genre_id" AS "genre_id"
		, "PREPJOINBK"."title" AS "title"
		, "PREPJOINBK"."published_year" AS "published_year"
		, "PREPJOINBK"."isbn" AS "isbn"
		, "PREPJOINBK"."language" AS "language"
		, "PREPJOINBK"."number_of_pages" AS "number_of_pages"
		, "PREPJOINBK"."format" AS "format"
		, "PREPJOINBK"."edition" AS "edition"
		, "PREPJOINBK"."description" AS "description"
		, "PREPJOINBK"."cover_image_url" AS "cover_image_url"
		, "PREPJOINBK"."available_copies" AS "available_copies"
		, "PREPJOINBK"."total_copies" AS "total_copies"
		, "PREPJOINBK"."average_rating" AS "average_rating"
		, "PREPJOINBK"."dimensions" AS "dimensions"
		, "PREPJOINBK"."weight" AS "weight"
		, "PREPJOINBK"."keywords" AS "keywords"
	FROM "PREPJOINBK" "PREPJOINBK"
	;

 
 
