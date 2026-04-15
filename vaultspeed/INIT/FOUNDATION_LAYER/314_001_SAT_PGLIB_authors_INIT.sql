CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."SAT_PGLIB_authors_INIT"() 
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

BEGIN -- SAT_TGT

	TRUNCATE TABLE "LIBPG_FL"."SAT_PGLIB_authors"  CASCADE;

	INSERT INTO "LIBPG_FL"."SAT_PGLIB_authors"(
		 "authors_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"HASH_DIFF"
		,"DELETE_FLAG"
		,"last_updated"
		,"author_id"
		,"first_name"
		,"last_name"
	)
	WITH "STG_SRC" AS 
	( 
		SELECT 
			  "STG_INR_SRC"."authors_HKEY" AS "authors_HKEY"
			, "STG_INR_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_INR_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, UPPER(ENCODE(DIGEST(COALESCE(RTRIM(  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."first_name"),'~'),'#','\' || 
				'#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."last_name"),'~'),'#','\' || '#'))|| '#' ,'#' || '~'),'~') ,'SHA1'),'HEX')) AS "HASH_DIFF"
			, 'N'::text AS "DELETE_FLAG"
			, "STG_INR_SRC"."last_updated" AS "last_updated"
			, "STG_INR_SRC"."author_id" AS "author_id"
			, "STG_INR_SRC"."first_name" AS "first_name"
			, "STG_INR_SRC"."last_name" AS "last_name"
			, ROW_NUMBER()OVER(PARTITION BY "STG_INR_SRC"."authors_HKEY" ORDER BY "STG_INR_SRC"."LOAD_DATE","STG_INR_SRC"."LOAD_CYCLE_ID") AS "DUMMY"
		FROM "PostgresLibrary_STG"."authors" "STG_INR_SRC"
	)
	SELECT 
		  "STG_SRC"."authors_HKEY" AS "authors_HKEY"
		, "STG_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "STG_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "STG_SRC"."HASH_DIFF" AS "HASH_DIFF"
		, "STG_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
		, "STG_SRC"."last_updated" AS "last_updated"
		, "STG_SRC"."author_id" AS "author_id"
		, "STG_SRC"."first_name" AS "first_name"
		, "STG_SRC"."last_name" AS "last_name"
	FROM "STG_SRC" "STG_SRC"
	WHERE  "STG_SRC"."DUMMY" = 1
	;
END;



END;
$function$;
 
 
