/*
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 17:40:49
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29
 */

/* DROP TABLES */

-- START
DROP TABLE IF EXISTS "LIBPG_BV"."PIT_daily-snapshot_authors" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_BV"."PIT_daily-snapshot_books" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_BV"."PIT_daily-snapshot_genres" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_BV"."PIT_pit-detail_authors" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_BV"."PIT_pit-detail_books" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_BV"."PIT_pit-detail_genres" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_BV"."BRIDGE_books-brdg" 
CASCADE
;
DROP TABLE IF EXISTS "LibraryMgmt_FMC"."FMC_BV_LOADING_WINDOW_TABLE" 
CASCADE
;
DROP TABLE IF EXISTS "LibraryMgmt_FMC"."LOAD_CYCLE_INFO" 
CASCADE
;
DROP TABLE IF EXISTS "LibraryMgmt_FMC"."DV_LOAD_CYCLE_INFO" 
CASCADE
;

-- END


/* CREATE TABLES */

-- START

CREATE   TABLE "LIBPG_BV"."PIT_daily-snapshot_authors"
(
	 "PIT_daily-snapshot_authors_HKEY" VARCHAR(40)
	,"SNAPSHOT_TIMESTAMP" TIMESTAMP
	,"LOAD_CYCLE_ID" INTEGER
	,"authors_HKEY" VARCHAR(40)
	,"SAT_PGLIB_authors_HKEY" VARCHAR(40)
	,"SAT_PGLIB_authors_LOAD_DATE" TIMESTAMP
   ,CONSTRAINT "PIT_daily-snapshot_authors_PK" PRIMARY KEY ("PIT_daily-snapshot_authors_HKEY")   
   ,CONSTRAINT "PIT_daily-snapshot_authors_UK" UNIQUE ("authors_HKEY", "SNAPSHOT_TIMESTAMP")   
)
;

ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_authors" ADD CONSTRAINT "PIT_daily-snapshot_authors_FK" FOREIGN KEY ("authors_HKEY") REFERENCES "LIBPG_FL"."HUB_authors"("authors_HKEY");
 ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_authors" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_authors" ADD CONSTRAINT "PIT_daily-snapshot_authors_SAT_PGLIB_FK" FOREIGN KEY ("SAT_PGLIB_authors_HKEY", "SAT_PGLIB_authors_LOAD_DATE") REFERENCES "LIBPG_FL"."SAT_PGLIB_authors"("authors_HKEY", "LOAD_DATE");
 ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_authors" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_BV"."PIT_daily-snapshot_authors" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LIBPG_BV"."PIT_daily-snapshot_books"
(
	 "PIT_daily-snapshot_books_HKEY" VARCHAR(40)
	,"SNAPSHOT_TIMESTAMP" TIMESTAMP
	,"LOAD_CYCLE_ID" INTEGER
	,"books_HKEY" VARCHAR(40)
	,"SAT_PGLIB_books_HKEY" VARCHAR(40)
	,"SAT_PGLIB_books_LOAD_DATE" TIMESTAMP
   ,CONSTRAINT "PIT_daily-snapshot_books_PK" PRIMARY KEY ("PIT_daily-snapshot_books_HKEY")   
   ,CONSTRAINT "PIT_daily-snapshot_books_UK" UNIQUE ("books_HKEY", "SNAPSHOT_TIMESTAMP")   
)
;

ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_books" ADD CONSTRAINT "PIT_daily-snapshot_books_FK" FOREIGN KEY ("books_HKEY") REFERENCES "LIBPG_FL"."HUB_books"("books_HKEY");
 ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_books" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_books" ADD CONSTRAINT "PIT_daily-snapshot_books_SAT_PGLIB_FK" FOREIGN KEY ("SAT_PGLIB_books_HKEY", "SAT_PGLIB_books_LOAD_DATE") REFERENCES "LIBPG_FL"."SAT_PGLIB_books"("books_HKEY", "LOAD_DATE");
 ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_books" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_BV"."PIT_daily-snapshot_books" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LIBPG_BV"."PIT_daily-snapshot_genres"
(
	 "PIT_daily-snapshot_genres_HKEY" VARCHAR(40)
	,"SNAPSHOT_TIMESTAMP" TIMESTAMP
	,"LOAD_CYCLE_ID" INTEGER
	,"genres_HKEY" VARCHAR(40)
	,"SAT_PGLIB_genres_HKEY" VARCHAR(40)
	,"SAT_PGLIB_genres_LOAD_DATE" TIMESTAMP
   ,CONSTRAINT "PIT_daily-snapshot_genres_PK" PRIMARY KEY ("PIT_daily-snapshot_genres_HKEY")   
   ,CONSTRAINT "PIT_daily-snapshot_genres_UK" UNIQUE ("genres_HKEY", "SNAPSHOT_TIMESTAMP")   
)
;

ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_genres" ADD CONSTRAINT "PIT_daily-snapshot_genres_FK" FOREIGN KEY ("genres_HKEY") REFERENCES "LIBPG_FL"."HUB_genres"("genres_HKEY");
 ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_genres" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_genres" ADD CONSTRAINT "PIT_daily-snapshot_genres_SAT_PGLIB_FK" FOREIGN KEY ("SAT_PGLIB_genres_HKEY", "SAT_PGLIB_genres_LOAD_DATE") REFERENCES "LIBPG_FL"."SAT_PGLIB_genres"("genres_HKEY", "LOAD_DATE");
 ALTER TABLE "LIBPG_BV"."PIT_daily-snapshot_genres" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_BV"."PIT_daily-snapshot_genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LIBPG_BV"."PIT_pit-detail_authors"
(
	 "PIT_pit-detail_authors_HKEY" VARCHAR(40)
	,"SNAPSHOT_TIMESTAMP" TIMESTAMP
	,"LOAD_CYCLE_ID" INTEGER
	,"authors_HKEY" VARCHAR(40)
	,"SAT_PGLIB_authors_HKEY" VARCHAR(40)
	,"SAT_PGLIB_authors_last_updated" TIMESTAMP
   ,CONSTRAINT "PIT_pit-detail_authors_PK" PRIMARY KEY ("PIT_pit-detail_authors_HKEY")   
   ,CONSTRAINT "PIT_pit-detail_authors_UK" UNIQUE ("authors_HKEY", "SNAPSHOT_TIMESTAMP")   
)
;

ALTER TABLE "LIBPG_BV"."PIT_pit-detail_authors" ADD CONSTRAINT "PIT_pit-detail_authors_FK" FOREIGN KEY ("authors_HKEY") REFERENCES "LIBPG_FL"."HUB_authors"("authors_HKEY");
 ALTER TABLE "LIBPG_BV"."PIT_pit-detail_authors" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_BV"."PIT_pit-detail_authors" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LIBPG_BV"."PIT_pit-detail_books"
(
	 "PIT_pit-detail_books_HKEY" VARCHAR(40)
	,"SNAPSHOT_TIMESTAMP" TIMESTAMP
	,"LOAD_CYCLE_ID" INTEGER
	,"books_HKEY" VARCHAR(40)
	,"SAT_PGLIB_books_HKEY" VARCHAR(40)
	,"SAT_PGLIB_books_last_updated" TIMESTAMP
   ,CONSTRAINT "PIT_pit-detail_books_PK" PRIMARY KEY ("PIT_pit-detail_books_HKEY")   
   ,CONSTRAINT "PIT_pit-detail_books_UK" UNIQUE ("books_HKEY", "SNAPSHOT_TIMESTAMP")   
)
;

ALTER TABLE "LIBPG_BV"."PIT_pit-detail_books" ADD CONSTRAINT "PIT_pit-detail_books_FK" FOREIGN KEY ("books_HKEY") REFERENCES "LIBPG_FL"."HUB_books"("books_HKEY");
 ALTER TABLE "LIBPG_BV"."PIT_pit-detail_books" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_BV"."PIT_pit-detail_books" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LIBPG_BV"."PIT_pit-detail_genres"
(
	 "PIT_pit-detail_genres_HKEY" VARCHAR(40)
	,"SNAPSHOT_TIMESTAMP" TIMESTAMP
	,"LOAD_CYCLE_ID" INTEGER
	,"genres_HKEY" VARCHAR(40)
	,"SAT_PGLIB_genres_HKEY" VARCHAR(40)
	,"SAT_PGLIB_genres_last_updated" TIMESTAMP
   ,CONSTRAINT "PIT_pit-detail_genres_PK" PRIMARY KEY ("PIT_pit-detail_genres_HKEY")   
   ,CONSTRAINT "PIT_pit-detail_genres_UK" UNIQUE ("genres_HKEY", "SNAPSHOT_TIMESTAMP")   
)
;

ALTER TABLE "LIBPG_BV"."PIT_pit-detail_genres" ADD CONSTRAINT "PIT_pit-detail_genres_FK" FOREIGN KEY ("genres_HKEY") REFERENCES "LIBPG_FL"."HUB_genres"("genres_HKEY");
 ALTER TABLE "LIBPG_BV"."PIT_pit-detail_genres" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_BV"."PIT_pit-detail_genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LIBPG_BV"."BRIDGE_books-brdg"
(
	 "BRIDGE_books-brdg_HKEY" VARCHAR(40)
   ,CONSTRAINT "BRIDGE_books-brdg_PK" PRIMARY KEY ("BRIDGE_books-brdg_HKEY")   
	,"LOAD_DATE" TIMESTAMP
	,"LOAD_CYCLE_ID" INTEGER
	,"books_HKEY" VARCHAR(40)
	,"magazines_HKEY" VARCHAR(40)
	,"publishers_HKEY" VARCHAR(40)
	,"LNK_books_publishers_HKEY" VARCHAR(40)
	,"LNK_magazines_publishers_HKEY" VARCHAR(40)
	,"book_id_BK" VARCHAR(1500)
	,"magazine_id_BK" VARCHAR(1500)
	,"publisher_id_BK" VARCHAR(1500)
   ,CONSTRAINT "BRIDGE_books-brdg_UK" UNIQUE ("books_HKEY","magazines_HKEY","publishers_HKEY")   
)
;

ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" ADD CONSTRAINT "BRIDGE_books-brdg_books_FK" FOREIGN KEY ("books_HKEY") REFERENCES "LIBPG_FL"."HUB_books"("books_HKEY");
 ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" ADD CONSTRAINT "BRIDGE_books-brdg_books_publishers_FK" FOREIGN KEY ("LNK_books_publishers_HKEY") REFERENCES "LIBPG_FL"."LNK_books_publishers"("LNK_books_publishers_HKEY");
 ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" ADD CONSTRAINT "BRIDGE_books-brdg_publishers_FK" FOREIGN KEY ("publishers_HKEY") REFERENCES "LIBPG_FL"."HUB_publishers"("publishers_HKEY");
 ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" ADD CONSTRAINT "BRIDGE_books-brdg_magazines_publishers_FK" FOREIGN KEY ("LNK_magazines_publishers_HKEY") REFERENCES "LIBPG_FL"."LNK_magazines_publishers"("LNK_magazines_publishers_HKEY");
 ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" ADD CONSTRAINT "BRIDGE_books-brdg_magazines_FK" FOREIGN KEY ("magazines_HKEY") REFERENCES "LIBPG_FL"."HUB_magazines"("magazines_HKEY");
 ALTER TABLE "LIBPG_BV"."BRIDGE_books-brdg" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_BV"."BRIDGE_books-brdg" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LibraryMgmt_FMC"."FMC_BV_LOADING_WINDOW_TABLE"
(
	"FMC_BEGIN_LW_TIMESTAMP" TIMESTAMP,
	"FMC_END_LW_TIMESTAMP" TIMESTAMP
)
;

COMMENT ON TABLE "LibraryMgmt_FMC"."FMC_BV_LOADING_WINDOW_TABLE" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LibraryMgmt_FMC"."LOAD_CYCLE_INFO"
(
	"LOAD_CYCLE_ID" INTEGER,
	"LOAD_DATE" TIMESTAMP
)
;

COMMENT ON TABLE "LibraryMgmt_FMC"."LOAD_CYCLE_INFO" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


CREATE   TABLE "LibraryMgmt_FMC"."DV_LOAD_CYCLE_INFO"
(
	"DV_LOAD_CYCLE_ID" INTEGER
)
;

COMMENT ON TABLE "LibraryMgmt_FMC"."DV_LOAD_CYCLE_INFO" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
BV release: init(1) - Comment: initial release - Release date: 2026/03/17 17:39:29';


-- END


