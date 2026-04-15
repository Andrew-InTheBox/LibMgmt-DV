CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."SAT_PGLIB_magazines_INCR"() 
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

BEGIN -- SAT_TEMP_TGT

	TRUNCATE TABLE "PostgresLibrary_STG"."SAT_PGLIB_magazines_TMP"  CASCADE;

	INSERT INTO "PostgresLibrary_STG"."SAT_PGLIB_magazines_TMP"(
		 "magazines_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"RECORD_TYPE"
		,"SOURCE"
		,"EQUAL"
		,"HASH_DIFF"
		,"DELETE_FLAG"
		,"last_updated"
		,"magazine_id"
		,"title"
		,"issn"
		,"language"
		,"format"
		,"description"
		,"cover_image_url"
		,"available_copies"
		,"total_copies"
		,"issue_date"
	)
	WITH "DIST_STG" AS 
	( 
		SELECT DISTINCT 
 			  "STG_DIS_SRC"."magazines_HKEY" AS "magazines_HKEY"
			, "STG_DIS_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		FROM "PostgresLibrary_STG"."magazines" "STG_DIS_SRC"
		WHERE  "STG_DIS_SRC"."RECORD_TYPE" = 'S'
	)
	, "TEMP_TABLE_SET" AS 
	( 
		SELECT 
			  "STG_TEMP_SRC"."magazines_HKEY" AS "magazines_HKEY"
			, "STG_TEMP_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_TEMP_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, TO_TIMESTAMP(NULL, 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "LOAD_END_DATE"
			, "STG_TEMP_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, 'STG' AS "SOURCE"
			, 1 AS "ORIGIN_ID"
			, UPPER(ENCODE(DIGEST(COALESCE(RTRIM(  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."title"),'~'),'#','\' || 
				'#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."issn"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."language"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."format"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."description"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."cover_image_url"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."available_copies"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_TEMP_SRC"."total_copies"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( TO_CHAR("STG_TEMP_SRC"."issue_date", 'DD/MM/YYYY'::varchar)),'~'),'#','\' || '#'))|| '#' ,'#' || '~'),'~') ,'SHA1'),'HEX')) AS "HASH_DIFF"
			, CASE WHEN "STG_TEMP_SRC"."__$operation" = 'D' THEN 'Y'::text ELSE 'N'::text END AS "DELETE_FLAG"
			, "STG_TEMP_SRC"."last_updated" AS "last_updated"
			, "STG_TEMP_SRC"."magazine_id" AS "magazine_id"
			, "STG_TEMP_SRC"."title" AS "title"
			, "STG_TEMP_SRC"."issn" AS "issn"
			, "STG_TEMP_SRC"."language" AS "language"
			, "STG_TEMP_SRC"."format" AS "format"
			, "STG_TEMP_SRC"."description" AS "description"
			, "STG_TEMP_SRC"."cover_image_url" AS "cover_image_url"
			, "STG_TEMP_SRC"."available_copies" AS "available_copies"
			, "STG_TEMP_SRC"."total_copies" AS "total_copies"
			, "STG_TEMP_SRC"."issue_date" AS "issue_date"
		FROM "PostgresLibrary_STG"."magazines" "STG_TEMP_SRC"
		WHERE  "STG_TEMP_SRC"."RECORD_TYPE" = 'S'
		UNION ALL 
		SELECT 
			  "SAT_SRC"."magazines_HKEY" AS "magazines_HKEY"
			, "SAT_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "SAT_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, MAX("SAT_SRC"."LOAD_DATE")OVER( PARTITION BY "SAT_SRC"."magazines_HKEY") AS "LOAD_END_DATE"
			, 'SAT' AS "RECORD_TYPE"
			, 'SAT' AS "SOURCE"
			, 0 AS "ORIGIN_ID"
			, "SAT_SRC"."HASH_DIFF" AS "HASH_DIFF"
			, "SAT_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
			, "SAT_SRC"."last_updated" AS "last_updated"
			, "SAT_SRC"."magazine_id" AS "magazine_id"
			, "SAT_SRC"."title" AS "title"
			, "SAT_SRC"."issn" AS "issn"
			, "SAT_SRC"."language" AS "language"
			, "SAT_SRC"."format" AS "format"
			, "SAT_SRC"."description" AS "description"
			, "SAT_SRC"."cover_image_url" AS "cover_image_url"
			, "SAT_SRC"."available_copies" AS "available_copies"
			, "SAT_SRC"."total_copies" AS "total_copies"
			, "SAT_SRC"."issue_date" AS "issue_date"
		FROM "LIBPG_FL"."SAT_PGLIB_magazines" "SAT_SRC"
		INNER JOIN "DIST_STG" "DIST_STG" ON  "SAT_SRC"."magazines_HKEY" = "DIST_STG"."magazines_HKEY"
	)
	SELECT 
		  "TEMP_TABLE_SET"."magazines_HKEY" AS "magazines_HKEY"
		, "TEMP_TABLE_SET"."LOAD_DATE" AS "LOAD_DATE"
		, "TEMP_TABLE_SET"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "TEMP_TABLE_SET"."RECORD_TYPE" AS "RECORD_TYPE"
		, "TEMP_TABLE_SET"."SOURCE" AS "SOURCE"
		, CASE WHEN "TEMP_TABLE_SET"."SOURCE" = 'STG' AND "TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."HASH_DIFF"::text =
			LAG("TEMP_TABLE_SET"."DELETE_FLAG"::text || "TEMP_TABLE_SET"."HASH_DIFF"::text,1)OVER(PARTITION BY "TEMP_TABLE_SET"."magazines_HKEY" ORDER BY "TEMP_TABLE_SET"."LOAD_DATE","TEMP_TABLE_SET"."ORIGIN_ID")THEN 1 ELSE 0 END AS "EQUAL"
		, "TEMP_TABLE_SET"."HASH_DIFF" AS "HASH_DIFF"
		, "TEMP_TABLE_SET"."DELETE_FLAG" AS "DELETE_FLAG"
		, "TEMP_TABLE_SET"."last_updated" AS "last_updated"
		, "TEMP_TABLE_SET"."magazine_id" AS "magazine_id"
		, "TEMP_TABLE_SET"."title" AS "title"
		, "TEMP_TABLE_SET"."issn" AS "issn"
		, "TEMP_TABLE_SET"."language" AS "language"
		, "TEMP_TABLE_SET"."format" AS "format"
		, "TEMP_TABLE_SET"."description" AS "description"
		, "TEMP_TABLE_SET"."cover_image_url" AS "cover_image_url"
		, "TEMP_TABLE_SET"."available_copies" AS "available_copies"
		, "TEMP_TABLE_SET"."total_copies" AS "total_copies"
		, "TEMP_TABLE_SET"."issue_date" AS "issue_date"
	FROM "TEMP_TABLE_SET" "TEMP_TABLE_SET"
	WHERE  "TEMP_TABLE_SET"."SOURCE" = 'STG' OR("TEMP_TABLE_SET"."LOAD_DATE" = "TEMP_TABLE_SET"."LOAD_END_DATE" AND "TEMP_TABLE_SET"."SOURCE" = 'SAT')
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO "LIBPG_FL"."SAT_PGLIB_magazines"(
		 "magazines_HKEY"
		,"LOAD_DATE"
		,"LOAD_CYCLE_ID"
		,"HASH_DIFF"
		,"DELETE_FLAG"
		,"last_updated"
		,"magazine_id"
		,"title"
		,"issn"
		,"language"
		,"format"
		,"description"
		,"cover_image_url"
		,"available_copies"
		,"total_copies"
		,"issue_date"
	)
	SELECT 
		  "SAT_TEMP_SRC_INUR"."magazines_HKEY" AS "magazines_HKEY"
		, "SAT_TEMP_SRC_INUR"."LOAD_DATE" AS "LOAD_DATE"
		, "SAT_TEMP_SRC_INUR"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "SAT_TEMP_SRC_INUR"."HASH_DIFF" AS "HASH_DIFF"
		, "SAT_TEMP_SRC_INUR"."DELETE_FLAG" AS "DELETE_FLAG"
		, "SAT_TEMP_SRC_INUR"."last_updated" AS "last_updated"
		, "SAT_TEMP_SRC_INUR"."magazine_id" AS "magazine_id"
		, "SAT_TEMP_SRC_INUR"."title" AS "title"
		, "SAT_TEMP_SRC_INUR"."issn" AS "issn"
		, "SAT_TEMP_SRC_INUR"."language" AS "language"
		, "SAT_TEMP_SRC_INUR"."format" AS "format"
		, "SAT_TEMP_SRC_INUR"."description" AS "description"
		, "SAT_TEMP_SRC_INUR"."cover_image_url" AS "cover_image_url"
		, "SAT_TEMP_SRC_INUR"."available_copies" AS "available_copies"
		, "SAT_TEMP_SRC_INUR"."total_copies" AS "total_copies"
		, "SAT_TEMP_SRC_INUR"."issue_date" AS "issue_date"
	FROM "PostgresLibrary_STG"."SAT_PGLIB_magazines_TMP" "SAT_TEMP_SRC_INUR"
	WHERE  "SAT_TEMP_SRC_INUR"."SOURCE" = 'STG' AND "SAT_TEMP_SRC_INUR"."EQUAL" = 0
	;
END;



END;
$function$;
 
 
