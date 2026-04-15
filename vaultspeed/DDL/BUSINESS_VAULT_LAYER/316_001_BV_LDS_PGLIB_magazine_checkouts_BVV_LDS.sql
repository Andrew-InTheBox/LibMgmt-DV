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


DROP VIEW IF EXISTS "LIBPG_BV"."LDS_PGLIB_magazine_checkouts";
CREATE  VIEW "LIBPG_BV"."LDS_PGLIB_magazine_checkouts"  AS 
	SELECT 
		  "DVT_SRC"."LND_magazine_checkouts_HKEY" AS "LND_magazine_checkouts_HKEY"
		, "DVT_SRC"."magazine_checkout_id" AS "magazine_checkout_id"
		, "DVT_SRC"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
		, "DVT_SRC"."user_id" AS "user_id"
		, "DVT_SRC"."magazine_id" AS "magazine_id"
		, "DVT_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "DVT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "DVT_SRC"."HASH_DIFF" AS "HASH_DIFF"
		, "DVT_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
		, "DVT_SRC"."last_updated" AS "last_updated"
		, "DVT_SRC"."checkout_status_id" AS "checkout_status_id"
		, "DVT_SRC"."return_date" AS "return_date"
		, "DVT_SRC"."checkout_date" AS "checkout_date"
	FROM "LIBPG_FL"."LDS_PGLIB_magazine_checkouts" "DVT_SRC"
	;

 
 
