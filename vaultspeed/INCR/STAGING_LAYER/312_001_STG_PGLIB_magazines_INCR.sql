CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."STG_PGLIB_magazines_INCR"() 
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

	TRUNCATE TABLE "PostgresLibrary_STG"."magazines"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."magazines"(
		 "magazines_HKEY"
		,"publishers_HKEY"
		,"genres_HKEY"
		,"LNK_magazines_publishers_HKEY"
		,"LNK_magazines_genres_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"SRC_BK"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"magazine_id"
		,"publisher_id"
		,"genre_id"
		,"magazine_id_BK"
		,"publisher_id_FK_publisherid_BK"
		,"genre_id_FK_genreid_BK"
		,"title"
		,"issn"
		,"language"
		,"format"
		,"description"
		,"cover_image_url"
		,"available_copies"
		,"total_copies"
		,"issue_date"
	)
	WITH "CALC_HASH_KEYS" AS 
	( 
		SELECT 
			  UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."magazine_id_BK" || '#' ,'SHA1'),'HEX')) AS "magazines_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."publisher_id_FK_publisherid_BK" || '#' ,'SHA1'),'HEX')) AS "publishers_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."genre_id_FK_genreid_BK" || '#' ,'SHA1'),'HEX')) AS "genres_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."magazine_id_BK" || '#' || 'PGLIB' || '#' || "EXT_SRC"."publisher_id_FK_publisherid_BK" || 
				'#' ,'SHA1'),'HEX')) AS "LNK_magazines_publishers_HKEY"
			, UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."magazine_id_BK" || '#' || 'PGLIB' || '#' || "EXT_SRC"."genre_id_FK_genreid_BK" || 
				'#' ,'SHA1'),'HEX')) AS "LNK_magazines_genres_HKEY"
			, "EXT_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "EXT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, 'PGLIB' ::text AS "SRC_BK"
			, "EXT_SRC"."last_updated" AS "last_updated"
			, "EXT_SRC"."__$operation" AS "__$operation"
			, "EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "EXT_SRC"."magazine_id" AS "magazine_id"
			, "EXT_SRC"."publisher_id" AS "publisher_id"
			, "EXT_SRC"."genre_id" AS "genre_id"
			, "EXT_SRC"."magazine_id_BK" AS "magazine_id_BK"
			, "EXT_SRC"."publisher_id_FK_publisherid_BK" AS "publisher_id_FK_publisherid_BK"
			, "EXT_SRC"."genre_id_FK_genreid_BK" AS "genre_id_FK_genreid_BK"
			, "EXT_SRC"."title" AS "title"
			, "EXT_SRC"."issn" AS "issn"
			, "EXT_SRC"."language" AS "language"
			, "EXT_SRC"."format" AS "format"
			, "EXT_SRC"."description" AS "description"
			, "EXT_SRC"."cover_image_url" AS "cover_image_url"
			, "EXT_SRC"."available_copies" AS "available_copies"
			, "EXT_SRC"."total_copies" AS "total_copies"
			, "EXT_SRC"."issue_date" AS "issue_date"
		FROM "PostgresLibrary_EXT"."magazines" "EXT_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  "MEX_SRC"."RECORD_TYPE" = 'U'
	)
	SELECT 
		  "CALC_HASH_KEYS"."magazines_HKEY" AS "magazines_HKEY"
		, "CALC_HASH_KEYS"."publishers_HKEY" AS "publishers_HKEY"
		, "CALC_HASH_KEYS"."genres_HKEY" AS "genres_HKEY"
		, "CALC_HASH_KEYS"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
		, "CALC_HASH_KEYS"."LNK_magazines_genres_HKEY" AS "LNK_magazines_genres_HKEY"
		, "CALC_HASH_KEYS"."LOAD_DATE" AS "LOAD_DATE"
		, "CALC_HASH_KEYS"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "CALC_HASH_KEYS"."SRC_BK" AS "SRC_BK"
		, "CALC_HASH_KEYS"."last_updated" AS "last_updated"
		, "CALC_HASH_KEYS"."__$operation" AS "__$operation"
		, "CALC_HASH_KEYS"."RECORD_TYPE" AS "RECORD_TYPE"
		, "CALC_HASH_KEYS"."magazine_id" AS "magazine_id"
		, "CALC_HASH_KEYS"."publisher_id" AS "publisher_id"
		, "CALC_HASH_KEYS"."genre_id" AS "genre_id"
		, "CALC_HASH_KEYS"."magazine_id_BK" AS "magazine_id_BK"
		, "CALC_HASH_KEYS"."publisher_id_FK_publisherid_BK" AS "publisher_id_FK_publisherid_BK"
		, "CALC_HASH_KEYS"."genre_id_FK_genreid_BK" AS "genre_id_FK_genreid_BK"
		, "CALC_HASH_KEYS"."title" AS "title"
		, "CALC_HASH_KEYS"."issn" AS "issn"
		, "CALC_HASH_KEYS"."language" AS "language"
		, "CALC_HASH_KEYS"."format" AS "format"
		, "CALC_HASH_KEYS"."description" AS "description"
		, "CALC_HASH_KEYS"."cover_image_url" AS "cover_image_url"
		, "CALC_HASH_KEYS"."available_copies" AS "available_copies"
		, "CALC_HASH_KEYS"."total_copies" AS "total_copies"
		, "CALC_HASH_KEYS"."issue_date" AS "issue_date"
	FROM "CALC_HASH_KEYS" "CALC_HASH_KEYS"
	;
END;



END;
$function$;
 
 
