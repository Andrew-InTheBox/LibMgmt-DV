CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."SAT_PGLIB_magazines_INIT"() 
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

BEGIN -- SAT_TGT

	TRUNCATE TABLE "LIBPG_FL"."SAT_PGLIB_magazines"  CASCADE;

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
	WITH "STG_SRC" AS 
	( 
		SELECT 
			  "STG_INR_SRC"."magazines_HKEY" AS "magazines_HKEY"
			, "STG_INR_SRC"."LOAD_DATE" AS "LOAD_DATE"
			, "STG_INR_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, UPPER(ENCODE(DIGEST(COALESCE(RTRIM(  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."title"),'~'),'#','\' || '#')
				)|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."issn"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."language"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."format"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."description"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."cover_image_url"),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."available_copies"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( "STG_INR_SRC"."total_copies"::text),'~'),'#','\' || '#'))|| '#' ||  UPPER(REPLACE(COALESCE(TRIM( TO_CHAR("STG_INR_SRC"."issue_date", 'DD/MM/YYYY'::varchar)),'~'),'#','\' || '#'))|| '#' ,'#' || '~'),'~') ,'SHA1'),'HEX')) AS "HASH_DIFF"
			, 'N'::text AS "DELETE_FLAG"
			, "STG_INR_SRC"."last_updated" AS "last_updated"
			, "STG_INR_SRC"."magazine_id" AS "magazine_id"
			, "STG_INR_SRC"."title" AS "title"
			, "STG_INR_SRC"."issn" AS "issn"
			, "STG_INR_SRC"."language" AS "language"
			, "STG_INR_SRC"."format" AS "format"
			, "STG_INR_SRC"."description" AS "description"
			, "STG_INR_SRC"."cover_image_url" AS "cover_image_url"
			, "STG_INR_SRC"."available_copies" AS "available_copies"
			, "STG_INR_SRC"."total_copies" AS "total_copies"
			, "STG_INR_SRC"."issue_date" AS "issue_date"
			, ROW_NUMBER()OVER(PARTITION BY "STG_INR_SRC"."magazines_HKEY" ORDER BY "STG_INR_SRC"."LOAD_DATE",
				"STG_INR_SRC"."LOAD_CYCLE_ID") AS "DUMMY"
		FROM "PostgresLibrary_STG"."magazines" "STG_INR_SRC"
	)
	SELECT 
		  "STG_SRC"."magazines_HKEY" AS "magazines_HKEY"
		, "STG_SRC"."LOAD_DATE" AS "LOAD_DATE"
		, "STG_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "STG_SRC"."HASH_DIFF" AS "HASH_DIFF"
		, "STG_SRC"."DELETE_FLAG" AS "DELETE_FLAG"
		, "STG_SRC"."last_updated" AS "last_updated"
		, "STG_SRC"."magazine_id" AS "magazine_id"
		, "STG_SRC"."title" AS "title"
		, "STG_SRC"."issn" AS "issn"
		, "STG_SRC"."language" AS "language"
		, "STG_SRC"."format" AS "format"
		, "STG_SRC"."description" AS "description"
		, "STG_SRC"."cover_image_url" AS "cover_image_url"
		, "STG_SRC"."available_copies" AS "available_copies"
		, "STG_SRC"."total_copies" AS "total_copies"
		, "STG_SRC"."issue_date" AS "issue_date"
	FROM "STG_SRC" "STG_SRC"
	WHERE  "STG_SRC"."DUMMY" = 1
	;
END;



END;
$function$;
 
 
