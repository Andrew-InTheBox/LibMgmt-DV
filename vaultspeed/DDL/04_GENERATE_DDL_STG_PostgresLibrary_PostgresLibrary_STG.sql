/*
 __     __          _ _                           _      __  ___  __   __   
 \ \   / /_ _ _   _| | |_ ___ ____   ___  ___  __| |     \ \/ _ \/ /  /_/   
  \ \ / / _` | | | | | __/ __|  _ \ / _ \/ _ \/ _` |      \/ / \ \/ /\      
   \ V / (_| | |_| | | |_\__ \ |_) |  __/  __/ (_| |      / / \/\ \/ /      
    \_/ \__,_|\__,_|_|\__|___/ .__/ \___|\___|\__,_|     /_/ \/_/\__/       
                             |_|                                            

Vaultspeed version: 6.0.0.5, generation date: 2026/03/17 17:40:49
DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12
 */

/* DROP TABLES */

-- START

DROP TABLE IF EXISTS "PostgresLibrary_STG"."authors" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."book_author" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."books" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."checkouts" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."genres" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."magazine_checkouts" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."magazines" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."publishers" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."users" 
CASCADE
;
-- END


/* CREATE TABLES */

-- START


CREATE   TABLE "PostgresLibrary_STG"."authors"
(
    "authors_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"SRC_BK" VARCHAR
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"author_id_BK" VARCHAR(1500)
   ,"author_id" INTEGER
   ,"first_name" VARCHAR
   ,"last_name" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."authors" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."book_author"
(
    "LND_book_author_HKEY" VARCHAR(40)
   ,"authors_HKEY" VARCHAR(40)
   ,"books_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"author_id_FK_authorid_BK" VARCHAR(1500)
   ,"book_id_FK_bookid_BK" VARCHAR(1500)
   ,"book_id" INTEGER
   ,"author_id" INTEGER
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."book_author" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."books"
(
    "books_HKEY" VARCHAR(40)
   ,"LNK_books_genres_HKEY" VARCHAR(40)
   ,"LNK_books_publishers_HKEY" VARCHAR(40)
   ,"genres_HKEY" VARCHAR(40)
   ,"publishers_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"SRC_BK" VARCHAR
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"book_id_BK" VARCHAR(1500)
   ,"genre_id_FK_genreid_BK" VARCHAR(1500)
   ,"publisher_id_FK_publisherid_BK" VARCHAR(1500)
   ,"book_id" INTEGER
   ,"publisher_id" INTEGER
   ,"genre_id" INTEGER
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

COMMENT ON TABLE "PostgresLibrary_STG"."books" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."checkouts"
(
    "LND_checkouts_HKEY" VARCHAR(40)
   ,"books_HKEY" VARCHAR(40)
   ,"users_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"book_id_FK_bookid_BK" VARCHAR(1500)
   ,"user_id_FK_userid_BK" VARCHAR(1500)
   ,"checkout_id" INTEGER
   ,"book_id" INTEGER
   ,"user_id" INTEGER
   ,"REF_checkout_status_id_FK" INTEGER
   ,"checkout_date" TIMESTAMP(6)
   ,"return_date" TIMESTAMP(6)
   ,"checkout_status_id" INTEGER
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."checkouts" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."genres"
(
    "genres_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"SRC_BK" VARCHAR
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"genre_id_BK" VARCHAR(1500)
   ,"genre_id" INTEGER
   ,"genre_name" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."magazine_checkouts"
(
    "LND_magazine_checkouts_HKEY" VARCHAR(40)
   ,"magazines_HKEY" VARCHAR(40)
   ,"users_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"magazine_id_FK_magazineid_BK" VARCHAR(1500)
   ,"user_id_FK_userid_BK" VARCHAR(1500)
   ,"magazine_checkout_id" INTEGER
   ,"magazine_id" INTEGER
   ,"user_id" INTEGER
   ,"REF_checkout_status_id_FK" INTEGER
   ,"checkout_date" TIMESTAMP(6)
   ,"return_date" TIMESTAMP(6)
   ,"checkout_status_id" INTEGER
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."magazine_checkouts" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."magazines"
(
    "magazines_HKEY" VARCHAR(40)
   ,"LNK_magazines_genres_HKEY" VARCHAR(40)
   ,"LNK_magazines_publishers_HKEY" VARCHAR(40)
   ,"genres_HKEY" VARCHAR(40)
   ,"publishers_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"SRC_BK" VARCHAR
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"magazine_id_BK" VARCHAR(1500)
   ,"publisher_id_FK_publisherid_BK" VARCHAR(1500)
   ,"genre_id_FK_genreid_BK" VARCHAR(1500)
   ,"magazine_id" INTEGER
   ,"publisher_id" INTEGER
   ,"genre_id" INTEGER
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

COMMENT ON TABLE "PostgresLibrary_STG"."magazines" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."publishers"
(
    "publishers_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"SRC_BK" VARCHAR
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"publisher_id_BK" VARCHAR(1500)
   ,"publisher_id" INTEGER
   ,"name" VARCHAR
   ,"address" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."publishers" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."users"
(
    "users_HKEY" VARCHAR(40)
   ,"LOAD_DATE" TIMESTAMP
   ,"SRC_BK" VARCHAR
   ,"LOAD_CYCLE_ID" INTEGER
   ,"last_updated" TIMESTAMP
   ,"__$operation" VARCHAR
   ,"RECORD_TYPE" VARCHAR
   ,"user_id_BK" VARCHAR(1500)
   ,"user_id" INTEGER
   ,"first_name" VARCHAR
   ,"last_name" VARCHAR
   ,"email" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."users" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


-- END


