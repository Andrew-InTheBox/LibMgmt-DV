CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."STG_PGLIB_users_INIT"() 
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

	TRUNCATE TABLE "PostgresLibrary_STG"."users"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."users"(
		 "users_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"SRC_BK"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"user_id"
		,"user_id_BK"
		,"first_name"
		,"last_name"
		,"email"
	)
	SELECT 
		  UPPER(ENCODE(DIGEST( 'PGLIB' || '#' || "EXT_SRC"."user_id_BK" || '#' ,'SHA1'),'HEX')) AS "users_HKEY"
		, "EXT_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "EXT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, 'PGLIB' AS "SRC_BK"
		, "EXT_SRC"."last_updated" AS "last_updated"
		, "EXT_SRC"."__$operation" AS "__$operation"
		, "EXT_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
		, "EXT_SRC"."user_id" AS "user_id"
		, "EXT_SRC"."user_id_BK" AS "user_id_BK"
		, "EXT_SRC"."first_name" AS "first_name"
		, "EXT_SRC"."last_name" AS "last_name"
		, "EXT_SRC"."email" AS "email"
	FROM "PostgresLibrary_EXT"."users" "EXT_SRC"
	INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  "MEX_SRC"."RECORD_TYPE" = 'U'
	;
END;



END;
$function$;
 
 
