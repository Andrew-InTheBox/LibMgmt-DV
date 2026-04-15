/*
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 16:41:38
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 16:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 16:38:27
 */


DROP VIEW IF EXISTS "LIBPG_BV"."SAT_PGLIB_books";
CREATE  VIEW "LIBPG_BV"."SAT_PGLIB_books"  AS 
	SELECT 
		  "DVT_SRC"."books_HKEY" AS "books_HKEY"
		, "DVT_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "DVT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "DVT_SRC"."HASH_DIFF" AS "HASH_DIFF"
		, "DVT_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
		, "DVT_SRC"."last_updated" AS "last_updated"
		, "DVT_SRC"."book_id" AS "book_id"
		, "DVT_SRC"."title" AS "title"
		, "DVT_SRC"."published_year" AS "published_year"
		, "DVT_SRC"."isbn" AS "isbn"
		, "DVT_SRC"."language" AS "language"
		, "DVT_SRC"."number_of_pages" AS "number_of_pages"
		, "DVT_SRC"."format" AS "format"
		, "DVT_SRC"."edition" AS "edition"
		, "DVT_SRC"."description" AS "description"
		, "DVT_SRC"."cover_image_url" AS "cover_image_url"
		, "DVT_SRC"."available_copies" AS "available_copies"
		, "DVT_SRC"."total_copies" AS "total_copies"
		, "DVT_SRC"."average_rating" AS "average_rating"
		, "DVT_SRC"."dimensions" AS "dimensions"
		, "DVT_SRC"."weight" AS "weight"
		, "DVT_SRC"."keywords" AS "keywords"
	FROM "LIBPG_FL"."SAT_PGLIB_books" "DVT_SRC"
	;

 
 
