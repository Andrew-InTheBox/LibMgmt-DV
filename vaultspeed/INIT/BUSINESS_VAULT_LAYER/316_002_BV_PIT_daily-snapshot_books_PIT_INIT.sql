CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."BV_PIT_daily-snapshot_books_PIT_INIT"() 
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

BEGIN -- PIT_TGT

	TRUNCATE TABLE "LIBPG_BV"."PIT_daily-snapshot_books"  CASCADE;

	INSERT INTO "LIBPG_BV"."PIT_daily-snapshot_books"(
		 "PIT_daily-snapshot_books_HKEY"
		,"books_HKEY"
		,"SNAPSHOT_TIMESTAMP"
		,"LOAD_CYCLE_ID"
		,"SAT_PGLIB_books_HKEY"
		,"SAT_PGLIB_books_LOAD_DATE"
	)
	WITH "SAT_SRC1" AS 
	( 
		SELECT 
			  "SAT_ED_SRC1"."books_HKEY" AS "books_HKEY"
			, "SAT_ED_SRC1"."LOAD_DATE" AS "LOAD_DATE"
			, COALESCE(LEAD("SAT_ED_SRC1"."LOAD_DATE")OVER(PARTITION BY "SAT_ED_SRC1"."books_HKEY" ORDER BY "SAT_ED_SRC1"."LOAD_DATE")
				, TO_TIMESTAMP('31/12/2999 23:59:59' , 'DD/MM/YYYY HH24:MI:SS'::varchar)) AS "LOAD_END_DATE"
			, "SAT_ED_SRC1"."DELETE_FLAG" AS "DELETE_FLAG"
		FROM "LIBPG_FL"."SAT_PGLIB_books" "SAT_ED_SRC1"
	)
	SELECT 
		  UPPER(ENCODE(DIGEST( "HUB_SRC"."books_HKEY"::text || '#' || TO_CHAR("SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP", 
			'DD/MM/YYYY HH24:MI:SS.US'::varchar) ,'SHA1'),'HEX')) AS "PIT_daily-snapshot_books_HKEY"
		, "HUB_SRC"."books_HKEY" AS "books_HKEY"
		, "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP" AS "SNAPSHOT_TIMESTAMP"
		, "BVLCI_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, COALESCE("SAT_SRC1"."books_HKEY","UNSAT_SRC1"."books_HKEY") AS "SAT_PGLIB_books_HKEY"
		, COALESCE("SAT_SRC1"."LOAD_DATE","UNSAT_SRC1"."LOAD_DATE") AS "SAT_PGLIB_books_LOAD_DATE"
	FROM "LIBPG_FL"."HUB_books" "HUB_SRC"
	INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  "MEX_SRC"."RECORD_TYPE" = 'U'
	INNER JOIN "LibraryMgmt_FMC"."LOAD_CYCLE_INFO" "BVLCI_SRC" ON  1 = 1
	INNER JOIN "LIBPG_BV"."VIEW_PIT_daily-snapshot_books_SNAPSHOTDATES" "SNAPSHOTDATES" ON  "HUB_SRC"."LOAD_DATE" <= "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP"
	LEFT OUTER JOIN "SAT_SRC1" "SAT_SRC1" ON  "HUB_SRC"."books_HKEY" = "SAT_SRC1"."books_HKEY" AND "SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP" >= "SAT_SRC1"."LOAD_DATE" AND 
		"SNAPSHOTDATES"."SNAPSHOT_TIMESTAMP" < "SAT_SRC1"."LOAD_END_DATE" AND "SAT_SRC1"."DELETE_FLAG" != 'Y'::text
	INNER JOIN "LIBPG_FL"."SAT_PGLIB_books" "UNSAT_SRC1" ON  "MEX_SRC"."LOAD_CYCLE_ID"::int = "UNSAT_SRC1"."LOAD_CYCLE_ID"
	;
END;



END;
$function$;
 
 
