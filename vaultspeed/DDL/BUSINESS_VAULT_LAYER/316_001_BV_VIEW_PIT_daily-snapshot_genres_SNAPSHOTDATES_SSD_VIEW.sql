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


DROP VIEW IF EXISTS "LIBPG_BV"."VIEW_PIT_daily-snapshot_genres_SNAPSHOTDATES";
CREATE  VIEW "LIBPG_BV"."VIEW_PIT_daily-snapshot_genres_SNAPSHOTDATES"  AS 
	WITH RECURSIVE "SNAPSHOTDATES"( "SNAPSHOT_TIMESTAMP" ) AS 
	( 
		SELECT 
			  date_trunc('DAY', MIN("HUB_SRC"."LOAD_DATE"))   AS "SNAPSHOT_TIMESTAMP"
		FROM "LIBPG_FL"."HUB_genres" "HUB_SRC"
		UNION ALL 
		SELECT 
			  "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP"  +  1 * interval'1 DAY'   AS "SNAPSHOT_TIMESTAMP"
		FROM "SNAPSHOTDATES" "SNAPSHOTDATES"
		INNER JOIN "LibraryMgmt_FMC"."FMC_BV_LOADING_WINDOW_TABLE" "BVLWT_SRC" ON  "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP"  +  1 * interval'1 DAY'   <= "BVLWT_SRC"."FMC_END_LW_TIMESTAMP"
	)
	SELECT 
		  "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
	FROM "SNAPSHOTDATES" "SNAPSHOTDATES"
	;

 
 
