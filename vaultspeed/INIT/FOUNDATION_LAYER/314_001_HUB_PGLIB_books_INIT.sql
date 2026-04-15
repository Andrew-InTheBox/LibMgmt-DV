CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."HUB_PGLIB_books_INIT"() 
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

BEGIN -- HUB_TGT

	TRUNCATE TABLE "LIBPG_FL"."HUB_books"  CASCADE;

	INSERT INTO "LIBPG_FL"."HUB_books"(
		 "books_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"book_id_BK"
		,"SRC_BK"
	)
	WITH "CHANGE_SET" AS 
	( 
		SELECT 
			  "STG_SRC1"."books_HKEY" AS "books_HKEY"
			, "STG_SRC1"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_SRC1"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, 0 AS "LOGPOSITION"
			, "STG_SRC1"."book_id_BK" AS "book_id_BK"
			, "STG_SRC1"."SRC_BK" AS "SRC_BK"
			, 0 AS "GENERAL_ORDER"
		FROM "PostgresLibrary_STG"."books" "STG_SRC1"
	)
	, "MIN_LOAD_TIME" AS 
	( 
		SELECT 
			  "CHANGE_SET"."books_HKEY" AS "books_HKEY"
			, "CHANGE_SET"."LOAD_DATE" AS "LOAD_DATE"
			, "CHANGE_SET"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, "CHANGE_SET"."book_id_BK" AS "book_id_BK"
			, "CHANGE_SET"."SRC_BK" AS "SRC_BK"
			, ROW_NUMBER()OVER(PARTITION BY "CHANGE_SET"."books_HKEY" ORDER BY "CHANGE_SET"."GENERAL_ORDER","CHANGE_SET"."LOAD_DATE",
				"CHANGE_SET"."LOGPOSITION") AS "DUMMY"
		FROM "CHANGE_SET" "CHANGE_SET"
	)
	SELECT 
		  "MIN_LOAD_TIME"."books_HKEY" AS "books_HKEY"
		, "MIN_LOAD_TIME"."LOAD_DATE" AS "LOAD_DATE"
		, "MIN_LOAD_TIME"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "MIN_LOAD_TIME"."book_id_BK" AS "book_id_BK"
		, "MIN_LOAD_TIME"."SRC_BK" AS "SRC_BK"
	FROM "MIN_LOAD_TIME" "MIN_LOAD_TIME"
	WHERE  "MIN_LOAD_TIME"."DUMMY" = 1
	;
END;



END;
$function$;
 
 
