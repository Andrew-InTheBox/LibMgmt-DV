CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."STG_PGLIB_magazines_INIT"() 
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
		, 'PGLIB' AS "SRC_BK"
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
	;
END;



END;
$function$;
 
 
