CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."LKS_PGLIB_magazines_publishers_INIT"() 
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

BEGIN -- LKS_TGT

	TRUNCATE TABLE "LIBPG_FL"."LKS_PGLIB_magazines_publishers"  CASCADE;

	INSERT INTO "LIBPG_FL"."LKS_PGLIB_magazines_publishers"(
		 "LNK_magazines_publishers_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"DELETE_FLAG"
		,"last_updated"
		,"magazine_id"
		,"publisher_id"
	)
	WITH "STG_SRC" AS 
	( 
		SELECT 
			  "STG_INR_SRC"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
			, "STG_INR_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_INR_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, 'N'::text AS "DELETE_FLAG"
			, "STG_INR_SRC"."last_updated" AS "last_updated"
			, "STG_INR_SRC"."magazine_id" AS "magazine_id"
			, "STG_INR_SRC"."publisher_id" AS "publisher_id"
			, ROW_NUMBER()OVER(PARTITION BY "STG_INR_SRC"."magazines_HKEY" ORDER BY "STG_INR_SRC"."LOAD_DATE") AS "DUMMY"
		FROM "PostgresLibrary_STG"."magazines" "STG_INR_SRC"
	)
	SELECT 
		  "STG_SRC"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
		, "STG_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "STG_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "STG_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
		, "STG_SRC"."last_updated" AS "last_updated"
		, "STG_SRC"."magazine_id" AS "magazine_id"
		, "STG_SRC"."publisher_id" AS "publisher_id"
	FROM "STG_SRC" "STG_SRC"
	WHERE  "STG_SRC"."DUMMY" = 1
	;
END;



END;
$function$;
 
 
