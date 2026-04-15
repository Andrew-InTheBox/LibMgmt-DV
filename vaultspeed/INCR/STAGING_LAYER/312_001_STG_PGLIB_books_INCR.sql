CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."STG_PGLIB_books_INCR"() 
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

BEGIN -- STG_TGT

	TRUNCATE TABLE "PostgresLibrary_STG"."books"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."books"(
		 "books_HKEY"
		,"publishers_HKEY"
		,"genres_HKEY"
		,"LNK_books_publishers_HKEY"
		,"LNK_books_genres_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"SRC_BK"
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
	WITH "CALC_HASH_KEYS" AS 
	( 
		SELECT 
			  UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."book_id_BK" || '#' ,'SHA1'),'HEX')) AS "books_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."publisher_id_FK_publisherid_BK" || '#' ,'SHA1'),'HEX')) AS "publishers_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."genre_id_FK_genreid_BK" || '#' ,'SHA1'),'HEX')) AS "genres_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."book_id_BK" || '#' || 'PGLIB' || '#' || "EXT_SRC"."publisher_id_FK_publisherid_BK" || 
				'#' ,'SHA1'),'HEX')) AS "LNK_books_publishers_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."book_id_BK" || '#' || 'PGLIB' || '#' || "EXT_SRC"."genre_id_FK_genreid_BK" || 
				'#' ,'SHA1'),'HEX')) AS "LNK_books_genres_HKEY"
			, "EXT_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "EXT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, 'PGLIB' ::text AS "SRC_BK"
			, "EXT_SRC"."last_updated" AS "last_updated"
			, "EXT_SRC"."__$operation" AS "__$operation"
			, "EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "EXT_SRC"."book_id" AS "book_id"
			, "EXT_SRC"."publisher_id" AS "publisher_id"
			, "EXT_SRC"."genre_id" AS "genre_id"
			, "EXT_SRC"."book_id_BK" AS "book_id_BK"
			, "EXT_SRC"."publisher_id_FK_publisherid_BK" AS "publisher_id_FK_publisherid_BK"
			, "EXT_SRC"."genre_id_FK_genreid_BK" AS "genre_id_FK_genreid_BK"
			, "EXT_SRC"."title" AS "title"
			, "EXT_SRC"."published_year" AS "published_year"
			, "EXT_SRC"."isbn" AS "isbn"
			, "EXT_SRC"."language" AS "language"
			, "EXT_SRC"."number_of_pages" AS "number_of_pages"
			, "EXT_SRC"."format" AS "format"
			, "EXT_SRC"."edition" AS "edition"
			, "EXT_SRC"."description" AS "description"
			, "EXT_SRC"."cover_image_url" AS "cover_image_url"
			, "EXT_SRC"."available_copies" AS "available_copies"
			, "EXT_SRC"."total_copies" AS "total_copies"
			, "EXT_SRC"."average_rating" AS "average_rating"
			, "EXT_SRC"."dimensions" AS "dimensions"
			, "EXT_SRC"."weight" AS "weight"
			, "EXT_SRC"."keywords" AS "keywords"
		FROM "PostgresLibrary_EXT"."books" "EXT_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  "MEX_SRC"."RECORD_TYPE" = 'U'
	)
	SELECT 
		  "CALC_HASH_KEYS"."books_HKEY" AS "books_HKEY"
		, "CALC_HASH_KEYS"."publishers_HKEY" AS "publishers_HKEY"
		, "CALC_HASH_KEYS"."genres_HKEY" AS "genres_HKEY"
		, "CALC_HASH_KEYS"."LNK_books_publishers_HKEY" AS "LNK_books_publishers_HKEY"
		, "CALC_HASH_KEYS"."LNK_books_genres_HKEY" AS "LNK_books_genres_HKEY"
		, "CALC_HASH_KEYS"."LOAD_DATE" AS "LOAD_DATE"
		, "CALC_HASH_KEYS"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "CALC_HASH_KEYS"."SRC_BK" AS "SRC_BK"
		, "CALC_HASH_KEYS"."last_updated" AS "last_updated"
		, "CALC_HASH_KEYS"."__$operation" AS "__$operation"
		, "CALC_HASH_KEYS"."RECORD_TYPE" AS "RECORD_TYPE"
		, "CALC_HASH_KEYS"."book_id" AS "book_id"
		, "CALC_HASH_KEYS"."publisher_id" AS "publisher_id"
		, "CALC_HASH_KEYS"."genre_id" AS "genre_id"
		, "CALC_HASH_KEYS"."book_id_BK" AS "book_id_BK"
		, "CALC_HASH_KEYS"."publisher_id_FK_publisherid_BK" AS "publisher_id_FK_publisherid_BK"
		, "CALC_HASH_KEYS"."genre_id_FK_genreid_BK" AS "genre_id_FK_genreid_BK"
		, "CALC_HASH_KEYS"."title" AS "title"
		, "CALC_HASH_KEYS"."published_year" AS "published_year"
		, "CALC_HASH_KEYS"."isbn" AS "isbn"
		, "CALC_HASH_KEYS"."language" AS "language"
		, "CALC_HASH_KEYS"."number_of_pages" AS "number_of_pages"
		, "CALC_HASH_KEYS"."format" AS "format"
		, "CALC_HASH_KEYS"."edition" AS "edition"
		, "CALC_HASH_KEYS"."description" AS "description"
		, "CALC_HASH_KEYS"."cover_image_url" AS "cover_image_url"
		, "CALC_HASH_KEYS"."available_copies" AS "available_copies"
		, "CALC_HASH_KEYS"."total_copies" AS "total_copies"
		, "CALC_HASH_KEYS"."average_rating" AS "average_rating"
		, "CALC_HASH_KEYS"."dimensions" AS "dimensions"
		, "CALC_HASH_KEYS"."weight" AS "weight"
		, "CALC_HASH_KEYS"."keywords" AS "keywords"
	FROM "CALC_HASH_KEYS" "CALC_HASH_KEYS"
	;
END;



END;
$function$;
 
 
