/*
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 17:40:49
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27
 */

/* DROP TABLES */

-- START

DROP TABLE IF EXISTS "PostgresLibrary_EXT"."authors" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_EXT"."book_author" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_EXT"."books" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_EXT"."checkouts" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_EXT"."genres" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_EXT"."magazine_checkouts" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_EXT"."magazines" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_EXT"."publishers" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_EXT"."users" 
CASCADE
;

-- END


/* CREATE TABLES */

-- START


CREATE   TABLE "PostgresLibrary_EXT"."authors"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"author_id" INTEGER
   ,"author_id_BK" VARCHAR(1500)
   ,"first_name" VARCHAR
   ,"last_name" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."authors" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


CREATE   TABLE "PostgresLibrary_EXT"."book_author"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"book_id" INTEGER
   ,"author_id" INTEGER
   ,"author_id_FK_authorid_BK" VARCHAR(1500)
   ,"book_id_FK_bookid_BK" VARCHAR(1500)
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."book_author" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


CREATE   TABLE "PostgresLibrary_EXT"."books"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"book_id" INTEGER
   ,"genre_id" INTEGER
   ,"publisher_id" INTEGER
   ,"book_id_BK" VARCHAR(1500)
   ,"genre_id_FK_genreid_BK" VARCHAR(1500)
   ,"publisher_id_FK_publisherid_BK" VARCHAR(1500)
   ,"title" VARCHAR
   ,"published_year" INTEGER
   ,"isbn" VARCHAR
   ,"language" VARCHAR
   ,"number_of_pages" INTEGER
   ,"format" VARCHAR
   ,"edition" VARCHAR
   ,"description" VARCHAR
   ,"cover_image_url" VARCHAR
   ,"available_copies" INTEGER
   ,"total_copies" INTEGER
   ,"average_rating" DOUBLE PRECISION
   ,"dimensions" VARCHAR
   ,"weight" DOUBLE PRECISION
   ,"keywords" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."books" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


CREATE   TABLE "PostgresLibrary_EXT"."checkouts"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"checkout_id" INTEGER
   ,"book_id" INTEGER
   ,"REF_checkout_status_id_FK" INTEGER
   ,"user_id" INTEGER
   ,"book_id_FK_bookid_BK" VARCHAR(1500)
   ,"user_id_FK_userid_BK" VARCHAR(1500)
   ,"checkout_date" TIMESTAMP(6)
   ,"return_date" TIMESTAMP(6)
   ,"checkout_status_id" INTEGER
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."checkouts" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


CREATE   TABLE "PostgresLibrary_EXT"."genres"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"genre_id" INTEGER
   ,"genre_id_BK" VARCHAR(1500)
   ,"genre_name" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


CREATE   TABLE "PostgresLibrary_EXT"."magazine_checkouts"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"magazine_checkout_id" INTEGER
   ,"REF_checkout_status_id_FK" INTEGER
   ,"magazine_id" INTEGER
   ,"user_id" INTEGER
   ,"magazine_id_FK_magazineid_BK" VARCHAR(1500)
   ,"user_id_FK_userid_BK" VARCHAR(1500)
   ,"checkout_date" TIMESTAMP(6)
   ,"return_date" TIMESTAMP(6)
   ,"checkout_status_id" INTEGER
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."magazine_checkouts" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


CREATE   TABLE "PostgresLibrary_EXT"."magazines"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"magazine_id" INTEGER
   ,"genre_id" INTEGER
   ,"publisher_id" INTEGER
   ,"magazine_id_BK" VARCHAR(1500)
   ,"genre_id_FK_genreid_BK" VARCHAR(1500)
   ,"publisher_id_FK_publisherid_BK" VARCHAR(1500)
   ,"title" VARCHAR
   ,"issn" VARCHAR
   ,"language" VARCHAR
   ,"format" VARCHAR
   ,"description" VARCHAR
   ,"cover_image_url" VARCHAR
   ,"available_copies" INTEGER
   ,"total_copies" INTEGER
   ,"issue_date" DATE
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."magazines" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


CREATE   TABLE "PostgresLibrary_EXT"."publishers"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"publisher_id" INTEGER
   ,"publisher_id_BK" VARCHAR(1500)
   ,"name" VARCHAR
   ,"address" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."publishers" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


CREATE   TABLE "PostgresLibrary_EXT"."users"
(
    "LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"user_id" INTEGER
   ,"user_id_BK" VARCHAR(1500)
   ,"first_name" VARCHAR
   ,"last_name" VARCHAR
   ,"email" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_EXT"."users" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12, 
SRC_NAME: PostgresLibrary - Release: PostgresLibrary(5) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:38:27';


-- END


