CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."LKS_PGLIB_magazines_publishers_INCR"() 
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

BEGIN -- LKS_TEMP_TGT

	TRUNCATE TABLE "PostgresLibrary_STG"."LKS_PGLIB_magazines_publishers_TMP"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."LKS_PGLIB_magazines_publishers_TMP"(
		 "LNK_magazines_publishers_HKEY"
		,"publishers_HKEY"
		,"magazines_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"RECORD_TYPE"
		,"SOURCE"
		,"EQUAL"
		,"DELETE_FLAG"
		,"last_updated"
		,"magazine_id"
		,"publisher_id"
	)
	WITH "DIST_STG" AS 
	( 
		SELECT 
			  "STG_DIS_SRC"."magazines_HKEY" AS "magazines_HKEY"
			, "STG_DIS_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, MIN("STG_DIS_SRC"."LOAD_DATE") AS "MIN_LOAD_TIMESTAMP"
		FROM "PostgresLibrary_STG"."magazines" "STG_DIS_SRC"
		GROUP BY  "STG_DIS_SRC"."magazines_HKEY",  "STG_DIS_SRC"."LOAD_CYCLE_ID"
	)
	, "TEMP_TABLE_SET" AS 
	( 
		SELECT 
			  "STG_TEMP_SRC"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
			, "STG_TEMP_SRC"."publishers_HKEY" AS "publishers_HKEY"
			, "STG_TEMP_SRC"."magazines_HKEY" AS "magazines_HKEY"
			, "STG_TEMP_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_TEMP_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, TO_TIMESTAMP(NULL, 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "LOAD_END_DATE"
			, "STG_TEMP_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, 'STG' AS "SOURCE"
			, 1 AS "ORIGIN_ID"
			, CASE WHEN "STG_TEMP_SRC"."__$operation" = 'D' THEN 'Y'::text ELSE 'N'::text END AS "DELETE_FLAG"
			, "STG_TEMP_SRC"."last_updated" AS "last_updated"
			, "STG_TEMP_SRC"."magazine_id" AS "magazine_id"
			, "STG_TEMP_SRC"."publisher_id" AS "publisher_id"
		FROM "PostgresLibrary_STG"."magazines" "STG_TEMP_SRC"
		UNION 
		SELECT 
			  "LKS_SRC"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
			, "LNK_SRC"."publishers_HKEY" AS "publishers_HKEY"
			, "LNK_SRC"."magazines_HKEY" AS "magazines_HKEY"
			, "LKS_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "LKS_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, MAX("LKS_SRC"."LOAD_DATE")OVER(PARTITION BY "LNK_SRC"."magazines_HKEY") AS "LOAD_END_DATE"
			, 'SAT' AS "RECORD_TYPE"
			, 'LKS' AS "SOURCE"
			, 0 AS "ORIGIN_ID"
			, "LKS_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
			, "LKS_SRC"."last_updated" AS "last_updated"
			, "LKS_SRC"."magazine_id" AS "magazine_id"
			, "LKS_SRC"."publisher_id" AS "publisher_id"
		FROM "LIBPG_FL"."LKS_PGLIB_magazines_publishers" "LKS_SRC"
		INNER JOIN "LIBPG_FL"."LNK_magazines_publishers" "LNK_SRC" ON  "LKS_SRC"."LNK_magazines_publishers_HKEY" = "LNK_SRC"."LNK_magazines_publishers_HKEY"
		INNER JOIN "DIST_STG" "DIST_STG" ON  "LNK_SRC"."magazines_HKEY" = "DIST_STG"."magazines_HKEY"
	)
	SELECT 
		  "TEMP_TABLE_SET"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
		, "TEMP_TABLE_SET"."publishers_HKEY" AS "publishers_HKEY"
		, "TEMP_TABLE_SET"."magazines_HKEY" AS "magazines_HKEY"
		, "TEMP_TABLE_SET"."LOAD_DATE" AS "LOAD_DATE"
		, "TEMP_TABLE_SET"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "TEMP_TABLE_SET"."RECORD_TYPE" AS "RECORD_TYPE"
		, "TEMP_TABLE_SET"."SOURCE" AS "SOURCE"
		, CASE WHEN "TEMP_TABLE_SET"."SOURCE" = 'STG' AND "TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."publishers_HKEY"::text =
			LAG("TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."publishers_HKEY"::text,1)OVER(PARTITION BY "TEMP_TABLE_SET"."magazines_HKEY" ORDER BY "TEMP_TABLE_SET"."LOAD_DATE","TEMP_TABLE_SET"."ORIGIN_ID")THEN 1 ELSE 0 END AS "EQUAL"
		, "TEMP_TABLE_SET"."DELETE_FLAG" AS "DELETE_FLAG"
		, "TEMP_TABLE_SET"."last_updated" AS "last_updated"
		, "TEMP_TABLE_SET"."magazine_id" AS "magazine_id"
		, "TEMP_TABLE_SET"."publisher_id" AS "publisher_id"
	FROM "TEMP_TABLE_SET" "TEMP_TABLE_SET"
	WHERE  "TEMP_TABLE_SET"."SOURCE" = 'STG' OR("TEMP_TABLE_SET"."LOAD_DATE" = "TEMP_TABLE_SET"."LOAD_END_DATE" AND "TEMP_TABLE_SET"."SOURCE" = 'LKS')
	;
END;


BEGIN -- LKS_INUR_TGT

	INSERT INTO "LIBPG_FL"."LKS_PGLIB_magazines_publishers"(
		 "LNK_magazines_publishers_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"DELETE_FLAG"
		,"last_updated"
		,"magazine_id"
		,"publisher_id"
	)
	SELECT 
		  "LKS_TEMP_SRC_INUR"."LNK_magazines_publishers_HKEY" AS "LNK_magazines_publishers_HKEY"
		, "LKS_TEMP_SRC_INUR"."LOAD_DATE" AS "LOAD_DATE"
		, "LKS_TEMP_SRC_INUR"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "LKS_TEMP_SRC_INUR"."DELETE_FLAG" AS "DELETE_FLAG"
		, "LKS_TEMP_SRC_INUR"."last_updated" AS "last_updated"
		, "LKS_TEMP_SRC_INUR"."magazine_id" AS "magazine_id"
		, "LKS_TEMP_SRC_INUR"."publisher_id" AS "publisher_id"
	FROM "PostgresLibrary_STG"."LKS_PGLIB_magazines_publishers_TMP" "LKS_TEMP_SRC_INUR"
	WHERE  "LKS_TEMP_SRC_INUR"."SOURCE" = 'STG' AND "LKS_TEMP_SRC_INUR"."EQUAL" = 0
	;
END;



END;
$function$;
 
 
