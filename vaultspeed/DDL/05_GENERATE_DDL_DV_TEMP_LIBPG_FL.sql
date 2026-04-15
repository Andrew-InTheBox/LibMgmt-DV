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
DROP TABLE IF EXISTS "PostgresLibrary_STG"."LDS_PGLIB_book_author_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."LDS_PGLIB_checkouts_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."LDS_PGLIB_magazine_checkouts_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."LKS_PGLIB_books_genres_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."LKS_PGLIB_books_publishers_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."LKS_PGLIB_magazines_genres_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."LKS_PGLIB_magazines_publishers_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."SAT_PGLIB_authors_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."SAT_PGLIB_books_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."SAT_PGLIB_genres_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."SAT_PGLIB_magazines_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."SAT_PGLIB_publishers_TMP" 
CASCADE
;
DROP TABLE IF EXISTS "PostgresLibrary_STG"."SAT_PGLIB_users_TMP" 
CASCADE
;

-- END


/* CREATE TABLES */

-- START

CREATE   TABLE "PostgresLibrary_STG"."SAT_PGLIB_authors_TMP"
(
    "authors_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"first_name" VARCHAR
   ,"last_name" VARCHAR
   ,"author_id" INTEGER
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."SAT_PGLIB_authors_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."SAT_PGLIB_books_TMP"
(
    "books_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"book_id" INTEGER
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
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."SAT_PGLIB_books_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."SAT_PGLIB_genres_TMP"
(
    "genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"genre_id" INTEGER
   ,"genre_name" VARCHAR
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."SAT_PGLIB_genres_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."SAT_PGLIB_magazines_TMP"
(
    "magazines_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"magazine_id" INTEGER
   ,"title" VARCHAR
   ,"issn" VARCHAR
   ,"language" VARCHAR
   ,"format" VARCHAR
   ,"description" VARCHAR
   ,"cover_image_url" VARCHAR
   ,"available_copies" INTEGER
   ,"total_copies" INTEGER
   ,"issue_date" DATE
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."SAT_PGLIB_magazines_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."SAT_PGLIB_publishers_TMP"
(
    "publishers_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"name" VARCHAR
   ,"publisher_id" INTEGER
   ,"address" VARCHAR
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."SAT_PGLIB_publishers_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."SAT_PGLIB_users_TMP"
(
    "users_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"last_name" VARCHAR
   ,"first_name" VARCHAR
   ,"user_id" INTEGER
   ,"email" VARCHAR
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."SAT_PGLIB_users_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."LKS_PGLIB_books_genres_TMP"
(
    "LNK_books_genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"books_HKEY" VARCHAR(40)
   ,"genres_HKEY" VARCHAR(40)
   ,"last_updated" TIMESTAMP NOT NULL
   ,"genre_id" INTEGER
   ,"book_id" INTEGER
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."LKS_PGLIB_books_genres_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."LKS_PGLIB_books_publishers_TMP"
(
    "LNK_books_publishers_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"books_HKEY" VARCHAR(40)
   ,"last_updated" TIMESTAMP NOT NULL
   ,"publishers_HKEY" VARCHAR(40)
   ,"publisher_id" INTEGER
   ,"book_id" INTEGER
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."LKS_PGLIB_books_publishers_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."LKS_PGLIB_magazines_genres_TMP"
(
    "LNK_magazines_genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"magazines_HKEY" VARCHAR(40)
   ,"genres_HKEY" VARCHAR(40)
   ,"last_updated" TIMESTAMP NOT NULL
   ,"genre_id" INTEGER
   ,"magazine_id" INTEGER
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."LKS_PGLIB_magazines_genres_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."LKS_PGLIB_magazines_publishers_TMP"
(
    "LNK_magazines_publishers_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"magazines_HKEY" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"publishers_HKEY" VARCHAR(40)
   ,"last_updated" TIMESTAMP NOT NULL
   ,"magazine_id" INTEGER
   ,"publisher_id" INTEGER
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."LKS_PGLIB_magazines_publishers_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."LDS_PGLIB_book_author_TMP"
(
    "LND_book_author_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"book_id" INTEGER NOT NULL
   ,"author_id" INTEGER NOT NULL
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
   ,"authors_HKEY" VARCHAR(40)
   ,"books_HKEY" VARCHAR(40)
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."LDS_PGLIB_book_author_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."LDS_PGLIB_checkouts_TMP"
(
    "LND_checkouts_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"checkout_status_id" INTEGER
   ,"checkout_date" TIMESTAMP(6)
   ,"checkout_id" INTEGER NOT NULL
   ,"user_id" INTEGER
   ,"book_id" INTEGER
   ,"return_date" TIMESTAMP(6)
   ,"REF_checkout_status_id_FK" INTEGER
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
   ,"books_HKEY" VARCHAR(40)
   ,"users_HKEY" VARCHAR(40)
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."LDS_PGLIB_checkouts_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "PostgresLibrary_STG"."LDS_PGLIB_magazine_checkouts_TMP"
(
    "LND_magazine_checkouts_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"checkout_status_id" INTEGER
   ,"magazine_checkout_id" INTEGER NOT NULL
   ,"REF_checkout_status_id_FK" INTEGER
   ,"user_id" INTEGER
   ,"magazine_id" INTEGER
   ,"return_date" TIMESTAMP(6)
   ,"checkout_date" TIMESTAMP(6)
   ,"SOURCE" VARCHAR
   ,"EQUAL" NUMERIC
   ,"RECORD_TYPE" VARCHAR
   ,"magazines_HKEY" VARCHAR(40)
   ,"users_HKEY" VARCHAR(40)
)
;

COMMENT ON TABLE "PostgresLibrary_STG"."LDS_PGLIB_magazine_checkouts_TMP" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


-- END


