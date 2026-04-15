CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."STG_PGLIB_genres_INCR"() 
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

	TRUNCATE TABLE "PostgresLibrary_STG"."genres"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."genres"(
		 "genres_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"SRC_BK"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"genre_id"
		,"genre_id_BK"
		,"genre_name"
	)
	WITH "CALC_HASH_KEYS" AS 
	( 
		SELECT 
			  UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."genre_id_BK" || '#' ,'SHA1'),'HEX')) AS "genres_HKEY"
			, "EXT_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "EXT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, 'PGLIB' ::text AS "SRC_BK"
			, "EXT_SRC"."last_updated" AS "last_updated"
			, "EXT_SRC"."__$operation" AS "__$operation"
			, "EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "EXT_SRC"."genre_id" AS "genre_id"
			, "EXT_SRC"."genre_id_BK" AS "genre_id_BK"
			, "EXT_SRC"."genre_name" AS "genre_name"
		FROM "PostgresLibrary_EXT"."genres" "EXT_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  "MEX_SRC"."RECORD_TYPE" = 'U'
	)
	SELECT 
		  "CALC_HASH_KEYS"."genres_HKEY" AS "genres_HKEY"
		, "CALC_HASH_KEYS"."LOAD_DATE" AS "LOAD_DATE"
		, "CALC_HASH_KEYS"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "CALC_HASH_KEYS"."SRC_BK" AS "SRC_BK"
		, "CALC_HASH_KEYS"."last_updated" AS "last_updated"
		, "CALC_HASH_KEYS"."__$operation" AS "__$operation"
		, "CALC_HASH_KEYS"."RECORD_TYPE" AS "RECORD_TYPE"
		, "CALC_HASH_KEYS"."genre_id" AS "genre_id"
		, "CALC_HASH_KEYS"."genre_id_BK" AS "genre_id_BK"
		, "CALC_HASH_KEYS"."genre_name" AS "genre_name"
	FROM "CALC_HASH_KEYS" "CALC_HASH_KEYS"
	;
END;



END;
$function$;
 
 
