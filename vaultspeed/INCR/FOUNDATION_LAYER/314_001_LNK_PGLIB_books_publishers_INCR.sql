CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."LNK_PGLIB_books_publishers_INCR"() 
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

BEGIN -- LNK_TGT

	INSERT INTO "LIBPG_FL"."LNK_books_publishers"(
		 "LNK_books_publishers_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"publishers_HKEY"
		,"books_HKEY"
	)
	WITH "CHANGE_SET" AS 
	( 
		SELECT 
			  "STG_SRC1"."LNK_books_publishers_HKEY" AS "LNK_books_publishers_HKEY"
			, "STG_SRC1"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_SRC1"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, "STG_SRC1"."publishers_HKEY" AS "publishers_HKEY"
			, "STG_SRC1"."books_HKEY" AS "books_HKEY"
			, 0 AS "LOGPOSITION"
		FROM "PostgresLibrary_STG"."books" "STG_SRC1"
		WHERE  "STG_SRC1"."RECORD_TYPE" = 'S'
	)
	, "MIN_LOAD_TIME" AS 
	( 
		SELECT 
			  "CHANGE_SET"."LNK_books_publishers_HKEY" AS "LNK_books_publishers_HKEY"
			, "CHANGE_SET"."LOAD_DATE" AS "LOAD_DATE"
			, "CHANGE_SET"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, "CHANGE_SET"."publishers_HKEY" AS "publishers_HKEY"
			, "CHANGE_SET"."books_HKEY" AS "books_HKEY"
			, ROW_NUMBER()OVER(PARTITION BY "CHANGE_SET"."LNK_books_publishers_HKEY" ORDER BY "CHANGE_SET"."LOAD_DATE",
				"CHANGE_SET"."LOGPOSITION") AS "DUMMY"
		FROM "CHANGE_SET" "CHANGE_SET"
	)
	SELECT 
		  "MIN_LOAD_TIME"."LNK_books_publishers_HKEY" AS "LNK_books_publishers_HKEY"
		, "MIN_LOAD_TIME"."LOAD_DATE" AS "LOAD_DATE"
		, "MIN_LOAD_TIME"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "MIN_LOAD_TIME"."publishers_HKEY" AS "publishers_HKEY"
		, "MIN_LOAD_TIME"."books_HKEY" AS "books_HKEY"
	FROM "MIN_LOAD_TIME" "MIN_LOAD_TIME"
	LEFT OUTER JOIN "LIBPG_FL"."LNK_books_publishers" "LNK_SRC" ON  "MIN_LOAD_TIME"."LNK_books_publishers_HKEY" = "LNK_SRC"."LNK_books_publishers_HKEY"
	WHERE  "LNK_SRC"."LNK_books_publishers_HKEY" IS NULL AND "MIN_LOAD_TIME"."DUMMY" = 1
	;
END;



END;
$function$;
 
 
