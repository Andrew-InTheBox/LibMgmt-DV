CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."BV_PIT_pit-detail_authors_PIT_INCR"() 
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

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 16:41:38
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 16:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 16:38:27
 */


BEGIN 

BEGIN -- PIT_UPD

	WITH "SNAPSHOTDATES_UPD" AS 
	( 
		SELECT 
			  "SSDV_SRC_UPD"."authors_HKEY" AS "authors_HKEY"
			, "SSDV_SRC_UPD"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
		FROM "LIBPG_BV"."VIEW_PIT_pit-detail_authors_SNAPSHOTDATES" "SSDV_SRC_UPD"
		INNER JOIN "LibraryMgmt_FMC"."FMC_BV_LOADING_WINDOW_TABLE" "BVLWT_SRC_UPD" ON  1 = 1
		WHERE  "SSDV_SRC_UPD"."SNAPSHOT_TIMESTAMP" >= "BVLWT_SRC_UPD"."FMC_BEGIN_LW_TIMESTAMP"
	)
	, "SAT_SRC_UPD1" AS 
	( 
		SELECT 
			  "SAT_ED_SRC_UPD1"."authors_HKEY" AS "authors_HKEY"
			, "SAT_ED_SRC_UPD1"."last_updated" AS "LOAD_DATE"
			, COALESCE(LEAD("SAT_ED_SRC_UPD1"."last_updated")OVER(PARTITION BY "SAT_ED_SRC_UPD1"."authors_HKEY" ORDER BY "SAT_ED_SRC_UPD1"."last_updated")
				, TO_TIMESTAMP('31/12/2999 23:59:59' , 'DD/MM/YYYY HH24:MI:SS'::varchar)) AS "LOAD_END_DATE"
			, "SAT_ED_SRC_UPD1"."DELETE_FLAG" AS "DELETE_FLAG"
		FROM "LIBPG_FL"."SAT_PGLIB_authors" "SAT_ED_SRC_UPD1"
	)
	, "MIV_UPD" AS 
	( 
		SELECT 
			  UPPER(ENCODE(DIGEST( "HUB_SRC_UPD"."authors_HKEY"::text || '#' || TO_CHAR("SNAPSHOTDATES_UPD"."SNAPSHOT_TIMESTAMP",
				'DD/MM/YYYY HH24:MI:SS.US'::varchar) ,'SHA1'),'HEX')) AS "PIT_pit-detail_authors_HKEY"
			, "HUB_SRC_UPD"."authors_HKEY" AS "authors_HKEY"
			, "SNAPSHOTDATES_UPD"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
			, COALESCE("SAT_SRC_UPD1"."authors_HKEY","UNSAT_SRC_UPD1"."authors_HKEY") AS "SAT_PGLIB_authors_HKEY"
			, COALESCE("SAT_SRC_UPD1"."LOAD_DATE","UNSAT_SRC_UPD1"."LOAD_DATE") AS "SAT_PGLIB_authors_last_updated"
		FROM "LIBPG_FL"."HUB_authors" "HUB_SRC_UPD"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC_UPD" ON  "MEX_SRC_UPD"."RECORD_TYPE" = 'U'
		INNER JOIN "LibraryMgmt_FMC"."LOAD_CYCLE_INFO" "BVLCI_UPD" ON  1 = 1
		INNER JOIN "SNAPSHOTDATES_UPD" "SNAPSHOTDATES_UPD" ON  "SNAPSHOTDATES_UPD"."authors_HKEY" = "HUB_SRC_UPD"."authors_HKEY"
		LEFT OUTER JOIN "SAT_SRC_UPD1" "SAT_SRC_UPD1" ON  "HUB_SRC_UPD"."authors_HKEY" = "SAT_SRC_UPD1"."authors_HKEY" AND "SNAPSHOTDATES_UPD"."SNAPSHOT_TIMESTAMP" >= 
			"SAT_SRC_UPD1"."LOAD_DATE" AND "SNAPSHOTDATES_UPD"."SNAPSHOT_TIMESTAMP" < "SAT_SRC_UPD1"."LOAD_END_DATE" AND "SAT_SRC_UPD1"."DELETE_FLAG" != 'Y'::text
		INNER JOIN "LIBPG_FL"."SAT_PGLIB_authors" "UNSAT_SRC_UPD1" ON  "MEX_SRC_UPD"."LOAD_CYCLE_ID"::int = "UNSAT_SRC_UPD1"."LOAD_CYCLE_ID"
	)
	, "UPD_DATA_SRC" AS 
	( 
		SELECT 
			  "MIV_UPD"."PIT_pit-detail_authors_HKEY" AS "PIT_pit-detail_authors_HKEY"
			, "MIV_UPD"."authors_HKEY" AS "authors_HKEY"
			, "MIV_UPD"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
			, "MIV_UPD"."SAT_PGLIB_authors_HKEY" AS "SAT_PGLIB_authors_HKEY"
			, "MIV_UPD"."SAT_PGLIB_authors_last_updated" AS "SAT_PGLIB_authors_last_updated"
		FROM "MIV_UPD" "MIV_UPD"
		LEFT OUTER JOIN "LIBPG_BV"."PIT_pit-detail_authors" "PIT_SRC_UPD" ON  "MIV_UPD"."PIT_pit-detail_authors_HKEY" = "PIT_SRC_UPD"."PIT_pit-detail_authors_HKEY" AND "MIV_UPD"."SAT_PGLIB_authors_HKEY" =
			"PIT_SRC_UPD"."SAT_PGLIB_authors_HKEY" AND "MIV_UPD"."SAT_PGLIB_authors_last_updated" = "PIT_SRC_UPD"."SAT_PGLIB_authors_last_updated"
		WHERE  "PIT_SRC_UPD"."PIT_pit-detail_authors_HKEY" IS NULL
	)
	UPDATE "LIBPG_BV"."PIT_pit-detail_authors" "PIT_UPD_TGT"
	SET 
		 "SAT_PGLIB_authors_HKEY" =  "UPD_DATA_SRC"."SAT_PGLIB_authors_HKEY"
		,"SAT_PGLIB_authors_last_updated" =  "UPD_DATA_SRC"."SAT_PGLIB_authors_last_updated"
	FROM  "UPD_DATA_SRC"
	WHERE "PIT_UPD_TGT"."PIT_pit-detail_authors_HKEY" =  "UPD_DATA_SRC"."PIT_pit-detail_authors_HKEY"
	;
END;


BEGIN -- PIT_TGT

	INSERT INTO "LIBPG_BV"."PIT_pit-detail_authors"(
		 "PIT_pit-detail_authors_HKEY"
		,"authors_HKEY"
		,"SNAPSHOT_TIMESTAMP"
		,"LOAD_CYCLE_ID"
		,"SAT_PGLIB_authors_HKEY"
		,"SAT_PGLIB_authors_last_updated"
	)
	WITH "SNAPSHOTDATES" AS 
	( 
		SELECT 
			  "SSDV_SRC"."authors_HKEY" AS "authors_HKEY"
			, "SSDV_SRC"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
		FROM "LIBPG_BV"."VIEW_PIT_pit-detail_authors_SNAPSHOTDATES" "SSDV_SRC"
		INNER JOIN "LibraryMgmt_FMC"."FMC_BV_LOADING_WINDOW_TABLE" "BVLWT_SRC" ON  1 = 1
		WHERE  "SSDV_SRC"."SNAPSHOT_TIMESTAMP" >= "BVLWT_SRC"."FMC_BEGIN_LW_TIMESTAMP"
	)
	, "SAT_SRC1" AS 
	( 
		SELECT 
			  "SAT_ED_SRC1"."authors_HKEY" AS "authors_HKEY"
			, "SAT_ED_SRC1"."last_updated" AS "LOAD_DATE"
			, COALESCE(LEAD("SAT_ED_SRC1"."last_updated")OVER(PARTITION BY "SAT_ED_SRC1"."authors_HKEY" ORDER BY "SAT_ED_SRC1"."last_updated")
				, TO_TIMESTAMP('31/12/2999 23:59:59' , 'DD/MM/YYYY HH24:MI:SS'::varchar)) AS "LOAD_END_DATE"
			, "SAT_ED_SRC1"."DELETE_FLAG" AS "DELETE_FLAG"
		FROM "LIBPG_FL"."SAT_PGLIB_authors" "SAT_ED_SRC1"
	)
	, "MIV" AS 
	( 
		SELECT 
			  UPPER(ENCODE(DIGEST( "HUB_SRC"."authors_HKEY"::text || '#' || TO_CHAR("SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP", 
				'DD/MM/YYYY HH24:MI:SS.US'::varchar) ,'SHA1'),'HEX')) AS "PIT_pit-detail_authors_HKEY"
			, "HUB_SRC"."authors_HKEY" AS "authors_HKEY"
			, "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
			, "BVLCI_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, COALESCE("SAT_SRC1"."authors_HKEY","UNSAT_SRC1"."authors_HKEY") AS "SAT_PGLIB_authors_HKEY"
			, COALESCE("SAT_SRC1"."LOAD_DATE","UNSAT_SRC1"."LOAD_DATE") AS "SAT_PGLIB_authors_last_updated"
		FROM "LIBPG_FL"."HUB_authors" "HUB_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  "MEX_SRC"."RECORD_TYPE" = 'U'
		INNER JOIN "LibraryMgmt_FMC"."LOAD_CYCLE_INFO" "BVLCI_SRC" ON  1 = 1
		INNER JOIN "SNAPSHOTDATES" "SNAPSHOTDATES" ON  "SNAPSHOTDATES"."authors_HKEY" = "HUB_SRC"."authors_HKEY"
		LEFT OUTER JOIN "SAT_SRC1" "SAT_SRC1" ON  "HUB_SRC"."authors_HKEY" = "SAT_SRC1"."authors_HKEY" AND "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP" >= "SAT_SRC1"."LOAD_DATE" AND 
			"SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP" < "SAT_SRC1"."LOAD_END_DATE" AND "SAT_SRC1"."DELETE_FLAG" != 'Y'::text
		INNER JOIN "LIBPG_FL"."SAT_PGLIB_authors" "UNSAT_SRC1" ON  "MEX_SRC"."LOAD_CYCLE_ID"::int = "UNSAT_SRC1"."LOAD_CYCLE_ID"
		WHERE  COALESCE("SAT_SRC1"."LOAD_DATE","UNSAT_SRC1"."LOAD_DATE")<= "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP"
	)
	, "DATA_SRC" AS 
	( 
		SELECT 
			  "MIV"."PIT_pit-detail_authors_HKEY" AS "PIT_pit-detail_authors_HKEY"
			, "MIV"."authors_HKEY" AS "authors_HKEY"
			, "MIV"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
			, "MIV"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, "MIV"."SAT_PGLIB_authors_HKEY" AS "SAT_PGLIB_authors_HKEY"
			, "MIV"."SAT_PGLIB_authors_last_updated" AS "SAT_PGLIB_authors_last_updated"
		FROM "MIV" "MIV"
		LEFT OUTER JOIN "LIBPG_BV"."PIT_pit-detail_authors" "PIT_SRC" ON  "MIV"."PIT_pit-detail_authors_HKEY" = "PIT_SRC"."PIT_pit-detail_authors_HKEY" AND "MIV"."SAT_PGLIB_authors_HKEY" =
			"PIT_SRC"."SAT_PGLIB_authors_HKEY" AND "MIV"."SAT_PGLIB_authors_last_updated" = "PIT_SRC"."SAT_PGLIB_authors_last_updated"
		WHERE  "PIT_SRC"."PIT_pit-detail_authors_HKEY" IS NULL
	)
	SELECT 
		  "DATA_SRC"."PIT_pit-detail_authors_HKEY" AS "PIT_pit-detail_authors_HKEY"
		, "DATA_SRC"."authors_HKEY" AS "authors_HKEY"
		, "DATA_SRC"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
		, "DATA_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "DATA_SRC"."SAT_PGLIB_authors_HKEY" AS "SAT_PGLIB_authors_HKEY"
		, "DATA_SRC"."SAT_PGLIB_authors_last_updated" AS "SAT_PGLIB_authors_last_updated"
	FROM "DATA_SRC" "DATA_SRC"
	;
END;



END;
$function$;
 
 
