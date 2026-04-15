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


DROP VIEW IF EXISTS "PostgresLibrary_DFV"."VW_checkouts";
CREATE  VIEW "PostgresLibrary_DFV"."VW_checkouts"  AS 
	WITH "DELTA_WINDOW" AS 
	( 
		SELECT 
			  ("LWT_SRC"."FMC_BEGIN_LW_TIMESTAMP"  AT TIME ZONE  'UTC' ) AT TIME ZONE  'PST'   AS "FMC_BEGIN_LW_TIMESTAMP"
			, ("LWT_SRC"."FMC_END_LW_TIMESTAMP"  AT TIME ZONE  'UTC' ) AT TIME ZONE  'PST'   AS "FMC_END_LW_TIMESTAMP"
		FROM "PostgresLibrary_MTD"."FMC_LOADING_WINDOW_TABLE" "LWT_SRC"
	)
	, "DELTA_VIEW_FILTER" AS 
	( 
		SELECT 
			  "CDC_SRC"."last_updated" AS "last_updated"
			, 'S' ::text AS "RECORD_TYPE"
			, "CDC_SRC"."checkout_id" AS "checkout_id"
			, "CDC_SRC"."book_id" AS "book_id"
			, "CDC_SRC"."user_id" AS "user_id"
			, "CDC_SRC"."checkout_status_id" AS "REF_checkout_status_id_FK"
			, "CDC_SRC"."checkout_date" AS "checkout_date"
			, "CDC_SRC"."return_date" AS "return_date"
			, "CDC_SRC"."checkout_status_id" AS "checkout_status_id"
		FROM "lib_mgmt"."checkouts" "CDC_SRC"
		INNER JOIN "DELTA_WINDOW" "DELTA_WINDOW" ON  1 = 1
		WHERE  "CDC_SRC"."last_updated" > "DELTA_WINDOW"."FMC_BEGIN_LW_TIMESTAMP" AND "CDC_SRC"."last_updated" <= "DELTA_WINDOW"."FMC_END_LW_TIMESTAMP"
	)
	, "DELTA_VIEW" AS 
	( 
		SELECT 
			  "DELTA_VIEW_FILTER"."last_updated" AS "last_updated"
			, "DELTA_VIEW_FILTER"."RECORD_TYPE" AS "RECORD_TYPE"
			, "DELTA_VIEW_FILTER"."checkout_id" AS "checkout_id"
			, "DELTA_VIEW_FILTER"."book_id" AS "book_id"
			, "DELTA_VIEW_FILTER"."user_id" AS "user_id"
			, "DELTA_VIEW_FILTER"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
			, "DELTA_VIEW_FILTER"."checkout_date" AS "checkout_date"
			, "DELTA_VIEW_FILTER"."return_date" AS "return_date"
			, "DELTA_VIEW_FILTER"."checkout_status_id" AS "checkout_status_id"
		FROM "DELTA_VIEW_FILTER" "DELTA_VIEW_FILTER"
	)
	, "PREPJOINBK" AS 
	( 
		SELECT 
			  "DELTA_VIEW"."last_updated" AS "last_updated"
			, "DELTA_VIEW"."RECORD_TYPE" AS "RECORD_TYPE"
			, COALESCE("DELTA_VIEW"."checkout_id", CAST("MEX_BK_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "checkout_id"
			, COALESCE("DELTA_VIEW"."book_id", CAST("MEX_BK_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "book_id"
			, COALESCE("DELTA_VIEW"."user_id", CAST("MEX_BK_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "user_id"
			, COALESCE("DELTA_VIEW"."REF_checkout_status_id_FK", CAST("MEX_BK_SRC"."KEY_ATTRIBUTE_INTEGER" AS INTEGER)) AS "REF_checkout_status_id_FK"
			, "DELTA_VIEW"."checkout_date" AS "checkout_date"
			, "DELTA_VIEW"."return_date" AS "return_date"
			, "DELTA_VIEW"."checkout_status_id" AS "checkout_status_id"
		FROM "DELTA_VIEW" "DELTA_VIEW"
		INNER JOIN "PostgresLibrary_MTD"."MTD_EXCEPTION_RECORDS" "MEX_BK_SRC" ON  1 = 1
		WHERE  "MEX_BK_SRC"."RECORD_TYPE" = 'N'
	)
	SELECT 
		  "PREPJOINBK"."last_updated" AS "last_updated"
		, "PREPJOINBK"."RECORD_TYPE" AS "RECORD_TYPE"
		, "PREPJOINBK"."checkout_id" AS "checkout_id"
		, "PREPJOINBK"."book_id" AS "book_id"
		, "PREPJOINBK"."user_id" AS "user_id"
		, "PREPJOINBK"."REF_checkout_status_id_FK" AS "REF_checkout_status_id_FK"
		, "PREPJOINBK"."checkout_date" AS "checkout_date"
		, "PREPJOINBK"."return_date" AS "return_date"
		, "PREPJOINBK"."checkout_status_id" AS "checkout_status_id"
	FROM "PREPJOINBK" "PREPJOINBK"
	;

 
 
