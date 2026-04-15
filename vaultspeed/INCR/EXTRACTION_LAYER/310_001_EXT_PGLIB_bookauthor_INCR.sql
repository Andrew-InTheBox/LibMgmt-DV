CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."EXT_PGLIB_bookauthor_INCR"() 
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

BEGIN -- EXT_TGT

	TRUNCATE TABLE "PostgresLibrary_EXT"."book_author"  CASCADE;

	INSERT INTO "PostgresLibrary_EXT"."book_author"(
		 "LOAD_CYCLE_ID"
		,"LOAD_DATE"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"book_id"
		,"author_id"
		,"author_id_FK_authorid_BK"
		,"book_id_FK_bookid_BK"
	)
	WITH "CALCULATE_BK" AS 
	( 
		SELECT 
			  "TDFV_SRC"."last_updated" AS "last_updated"
			, "MEX_SRC"."ATTRIBUTE_VARCHAR" AS "__$operation"
			, "TDFV_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "TDFV_SRC"."book_id" AS "book_id"
			, "TDFV_SRC"."author_id" AS "author_id"
			, UPPER( "TDFV_SRC"."author_id"::text) AS "author_id_FK_authorid_BK"
			, UPPER( "TDFV_SRC"."book_id"::text) AS "book_id_FK_bookid_BK"
		FROM "PostgresLibrary_DFV"."VW_book_author" "TDFV_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  1 = 1
		WHERE  "MEX_SRC"."RECORD_TYPE" = 'N'
	)
	, "EXT_UNION" AS 
	( 
		SELECT 
			  "LCI_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, TO_TIMESTAMP(NULL , 'DD/MM/YYYY HH24:MI:SS'::varchar) AS "LOAD_DATE"
			, "CALCULATE_BK"."last_updated" AS "last_updated"
			, "CALCULATE_BK"."__$operation" AS "__$operation"
			, "CALCULATE_BK"."RECORD_TYPE" AS "RECORD_TYPE"
			, "CALCULATE_BK"."book_id" AS "book_id"
			, "CALCULATE_BK"."author_id" AS "author_id"
			, "CALCULATE_BK"."author_id_FK_authorid_BK" AS "author_id_FK_authorid_BK"
			, "CALCULATE_BK"."book_id_FK_bookid_BK" AS "book_id_FK_bookid_BK"
		FROM "CALCULATE_BK" "CALCULATE_BK"
		INNER JOIN "PostgresLibrary_MTD"."LOAD_CYCLE_INFO" "LCI_SRC" ON  1 = 1
	)
	SELECT 
		  "EXT_UNION"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "EXT_UNION"."LOAD_DATE" AS "LOAD_DATE"
		, "EXT_UNION"."last_updated" AS "last_updated"
		, "EXT_UNION"."__$operation" AS "__$operation"
		, "EXT_UNION"."RECORD_TYPE" AS "RECORD_TYPE"
		, "EXT_UNION"."book_id" AS "book_id"
		, "EXT_UNION"."author_id" AS "author_id"
		, "EXT_UNION"."author_id_FK_authorid_BK" AS "author_id_FK_authorid_BK"
		, "EXT_UNION"."book_id_FK_bookid_BK" AS "book_id_FK_bookid_BK"
	FROM "EXT_UNION" "EXT_UNION"
	;
END;



END;
$function$;
 
 
