CREATE OR REPLACE FUNCTION "LibraryMgmt_PROC"."FMC_UPD_RUN_STATUS_BV_LIBPG"(p_LOAD_CYCLE_ID varchar,
p_success_flag varchar) 
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

BEGIN -- HIST_UPD

	UPDATE "LibraryMgmt_FMC"."FMC_LOADING_HISTORY" "HIST_UPD"
	SET 
		 "success_flag" =  p_success_flag::int
		,"load_end_date" =  CURRENT_TIMESTAMP
	WHERE "HIST_UPD"."LOAD_CYCLE_ID" =  p_LOAD_CYCLE_ID::int
	;
END;



END;
$function$;
 
 
