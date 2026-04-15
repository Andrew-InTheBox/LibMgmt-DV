CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."EXT_PGLIB_users_INCR"() 
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

	TRUNCATE TABLE "PostgresLibrary_EXT"."users"  CASCADE;

	INSERT INTO "PostgresLibrary_EXT"."users"(
		 "LOAD_CYCLE_ID"
		,"LOAD_DATE"
		,"last_updated"
		,"__$operation"
		,"RECORD_TYPE"
		,"user_id"
		,"user_id_BK"
		,"first_name"
		,"last_name"
		,"email"
	)
	WITH "CALCULATE_BK" AS 
	( 
		SELECT 
			  "TDFV_SRC"."last_updated" AS "last_updated"
			, "MEX_SRC"."ATTRIBUTE_VARCHAR" AS "__$operation"
			, "TDFV_SRC"."RECORD_TYPE" AS "RECORD_TYPE"
			, "TDFV_SRC"."user_id" AS "user_id"
			, COALESCE(UPPER( "TDFV_SRC"."user_id"::text),"MEX_SRC"."KEY_ATTRIBUTE_INTEGER") AS "user_id_BK"
			, "TDFV_SRC"."first_name" AS "first_name"
			, "TDFV_SRC"."last_name" AS "last_name"
			, "TDFV_SRC"."email" AS "email"
		FROM "PostgresLibrary_DFV"."VW_users" "TDFV_SRC"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_SRC" ON  1 = 1
		WHERE  "MEX_SRC"."RECORD_TYPE" = 'N'
	)
	, "EXT_UNION" AS 
	( 
		SELECT 
			  "LCI_SRC"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
			, CURRENT_TIMESTAMP + row_number() over (PARTITION BY  "CALCULATE_BK"."user_id_BK"  ORDER BY  "CALCULATE_BK"."last_updated")
				* interval'2 microsecond'   AS "LOAD_DATE"
			, "CALCULATE_BK"."last_updated" AS "last_updated"
			, "CALCULATE_BK"."__$operation" AS "__$operation"
			, "CALCULATE_BK"."RECORD_TYPE" AS "RECORD_TYPE"
			, "CALCULATE_BK"."user_id" AS "user_id"
			, "CALCULATE_BK"."user_id_BK" AS "user_id_BK"
			, "CALCULATE_BK"."first_name" AS "first_name"
			, "CALCULATE_BK"."last_name" AS "last_name"
			, "CALCULATE_BK"."email" AS "email"
		FROM "CALCULATE_BK" "CALCULATE_BK"
		INNER JOIN "PostgresLibrary_MTD"."LOAD_CYCLE_INFO" "LCI_SRC" ON  1 = 1
	)
	SELECT 
		  "EXT_UNION"."LOAD_CYCLE_ID" AS "LOAD_CYCLE_ID"
		, "EXT_UNION"."LOAD_DATE" AS "LOAD_DATE"
		, "EXT_UNION"."last_updated" AS "last_updated"
		, "EXT_UNION"."__$operation" AS "__$operation"
		, "EXT_UNION"."RECORD_TYPE" AS "RECORD_TYPE"
		, "EXT_UNION"."user_id" AS "user_id"
		, "EXT_UNION"."user_id_BK" AS "user_id_BK"
		, "EXT_UNION"."first_name" AS "first_name"
		, "EXT_UNION"."last_name" AS "last_name"
		, "EXT_UNION"."email" AS "email"
	FROM "EXT_UNION" "EXT_UNION"
	;
END;



END;
$function$;
 
 
