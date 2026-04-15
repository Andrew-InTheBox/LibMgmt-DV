CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."BV_BRIDGE_books-brdg_BRIDGE_INIT"() 
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

BEGIN -- BRIDGE_TGT

	TRUNCATE TABLE "LIBPG_BV"."BRIDGE_books-brdg"  CASCADE;

	INSERT INTO "LIBPG_BV"."BRIDGE_books-brdg"(
		 "BRIDGE_books-brdg_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"books_HKEY"
		,"magazines_HKEY"
		,"publishers_HKEY"
		,"LNK_books_publishers_HKEY"
		,"LNK_magazines_publishers_HKEY"
		,"book_id_BK"
		,"magazine_id_BK"
		,"publisher_id_BK"
	)
	WITH "MIV" AS 
	( 
		SELECT 
			  UPPER(ENCODE(DIGEST(  "DVO_SRC1"."books_HKEY"::text || '#' || "DVO_SRC3"."publishers_HKEY"::text || '#' || 
				"DVO_SRC5"."magazines_HKEY"::text || '#'  ,'SHA1'),'HEX')) AS "BRIDGE_books-brdg_HKEY"
			, "BVLCI_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "BVLCI_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, "DVO_SRC1"."books_HKEY" AS "books_HKEY"
			, "DVO_SRC3"."publishers_HKEY" AS "publishers_HKEY"
			, "DVO_SRC5"."magazines_HKEY" AS "magazines_HKEY"
			, "DVO_SRC2"."LNK_books_publishers_HKEY" AS "LNK_books_publishers_HKEY"
			, "DVO_SRC4"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
			, "DVO_SRC1"."book_id_BK" AS "book_id_BK"
			, "DVO_SRC3"."publisher_id_BK" AS "publisher_id_BK"
			, "DVO_SRC5"."magazine_id_BK" AS "magazine_id_BK"
		FROM "LibraryMgmt_FMC"."LOAD_CYCLE_INFO" "BVLCI_SRC"
		INNER JOIN "LIBPG_FL"."HUB_books" "DVO_SRC1" ON 1 = 1
		INNER JOIN "LIBPG_FL"."LNK_books_publishers" "DVO_SRC2" ON "DVO_SRC2"."books_HKEY" = "DVO_SRC1"."books_HKEY"
		INNER JOIN "LIBPG_FL"."HUB_publishers" "DVO_SRC3" ON "DVO_SRC3"."publishers_HKEY" = "DVO_SRC2"."publishers_HKEY"
		INNER JOIN "LIBPG_FL"."LNK_magazines_publishers" "DVO_SRC4" ON "DVO_SRC4"."publishers_HKEY" = "DVO_SRC3"."publishers_HKEY"
		INNER JOIN "LIBPG_FL"."HUB_magazines" "DVO_SRC5" ON "DVO_SRC5"."magazines_HKEY" = "DVO_SRC4"."magazines_HKEY"
	)
	SELECT 
		  "MIV"."BRIDGE_books-brdg_HKEY" AS "BRIDGE_books-brdg_HKEY"
		, "MIV"."LOAD_DATE" AS "LOAD_DATE"
		, "MIV"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "MIV"."books_HKEY" AS "books_HKEY"
		, "MIV"."magazines_HKEY" AS "magazines_HKEY"
		, "MIV"."publishers_HKEY" AS "publishers_HKEY"
		, "MIV"."LNK_books_publishers_HKEY" AS "LNK_books_publishers_HKEY"
		, "MIV"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
		, "MIV"."book_id_BK" AS "book_id_BK"
		, "MIV"."magazine_id_BK" AS "magazine_id_BK"
		, "MIV"."publisher_id_BK" AS "publisher_id_BK"
	FROM "MIV" "MIV"
	;
END;



END;
$function$;
 
 
