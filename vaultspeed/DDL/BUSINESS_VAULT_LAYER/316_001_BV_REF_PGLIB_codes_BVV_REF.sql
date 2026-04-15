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


DROP VIEW IF EXISTS "LIBPG_BV"."REF_PGLIB_codes";
CREATE  VIEW "LIBPG_BV"."REF_PGLIB_codes"  AS 
	SELECT 
		  "DVT_SRC"."code_id" AS "code_id"
		, "DVT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "DVT_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "DVT_SRC"."code_type" AS "code_type"
		, "DVT_SRC"."code_value" AS "code_value"
		, "DVT_SRC"."code_description" AS "code_description"
		, "DVT_SRC"."is_active" AS "is_active"
	FROM "LIBPG_FL"."REF_PGLIB_codes" "DVT_SRC"
	;

 
 
