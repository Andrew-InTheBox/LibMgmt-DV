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
DROP TABLE IF EXISTS "LIBPG_FL"."REF_PGLIB_codes" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LDS_PGLIB_book_author" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LDS_PGLIB_checkouts" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LDS_PGLIB_magazine_checkouts" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LND_book_author" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LND_checkouts" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LND_magazine_checkouts" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LKS_PGLIB_books_genres" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LKS_PGLIB_books_publishers" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LKS_PGLIB_magazines_genres" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LKS_PGLIB_magazines_publishers" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LNK_books_genres" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LNK_books_publishers" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LNK_magazines_genres" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."LNK_magazines_publishers" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."SAT_PGLIB_authors" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."SAT_PGLIB_books" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."SAT_PGLIB_genres" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."SAT_PGLIB_magazines" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."SAT_PGLIB_publishers" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."SAT_PGLIB_users" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."HUB_authors" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."HUB_books" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."HUB_genres" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."HUB_magazines" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."HUB_publishers" 
CASCADE
;
DROP TABLE IF EXISTS "LIBPG_FL"."HUB_users" 
CASCADE
;

-- END


/* CREATE TABLES */

-- START

CREATE   TABLE "LIBPG_FL"."HUB_authors"
(
    "authors_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"SRC_BK" VARCHAR NOT NULL
   ,"author_id_BK" VARCHAR(1500)
   ,CONSTRAINT "HUB_authors_PK" PRIMARY KEY ("authors_HKEY")   
   ,CONSTRAINT "HUB_authors_UK" UNIQUE ("SRC_BK", "author_id_BK")   
)
;

COMMENT ON TABLE "LIBPG_FL"."HUB_authors" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."HUB_books"
(
    "books_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"SRC_BK" VARCHAR NOT NULL
   ,"book_id_BK" VARCHAR(1500)
   ,CONSTRAINT "HUB_books_PK" PRIMARY KEY ("books_HKEY")   
   ,CONSTRAINT "HUB_books_UK" UNIQUE ("SRC_BK", "book_id_BK")   
)
;

COMMENT ON TABLE "LIBPG_FL"."HUB_books" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."HUB_genres"
(
    "genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"SRC_BK" VARCHAR NOT NULL
   ,"genre_id_BK" VARCHAR(1500)
   ,CONSTRAINT "HUB_genres_PK" PRIMARY KEY ("genres_HKEY")   
   ,CONSTRAINT "HUB_genres_UK" UNIQUE ("SRC_BK", "genre_id_BK")   
)
;

COMMENT ON TABLE "LIBPG_FL"."HUB_genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."HUB_magazines"
(
    "magazines_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"SRC_BK" VARCHAR NOT NULL
   ,"magazine_id_BK" VARCHAR(1500)
   ,CONSTRAINT "HUB_magazines_PK" PRIMARY KEY ("magazines_HKEY")   
   ,CONSTRAINT "HUB_magazines_UK" UNIQUE ("SRC_BK", "magazine_id_BK")   
)
;

COMMENT ON TABLE "LIBPG_FL"."HUB_magazines" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."HUB_publishers"
(
    "publishers_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"SRC_BK" VARCHAR NOT NULL
   ,"publisher_id_BK" VARCHAR(1500)
   ,CONSTRAINT "HUB_publishers_PK" PRIMARY KEY ("publishers_HKEY")   
   ,CONSTRAINT "HUB_publishers_UK" UNIQUE ("SRC_BK", "publisher_id_BK")   
)
;

COMMENT ON TABLE "LIBPG_FL"."HUB_publishers" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."HUB_users"
(
    "users_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"SRC_BK" VARCHAR NOT NULL
   ,"user_id_BK" VARCHAR(1500)
   ,CONSTRAINT "HUB_users_PK" PRIMARY KEY ("users_HKEY")   
   ,CONSTRAINT "HUB_users_UK" UNIQUE ("SRC_BK", "user_id_BK")   
)
;

COMMENT ON TABLE "LIBPG_FL"."HUB_users" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."SAT_PGLIB_authors"
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
   ,CONSTRAINT "SAT_PGLIB_authors_UK" UNIQUE ("authors_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."SAT_PGLIB_authors" ADD CONSTRAINT "SAT_PGLIB_authors_FK" FOREIGN KEY ("authors_HKEY") REFERENCES "LIBPG_FL"."HUB_authors"("authors_HKEY");
 ALTER TABLE "LIBPG_FL"."SAT_PGLIB_authors" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."SAT_PGLIB_authors" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."SAT_PGLIB_books"
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
   ,CONSTRAINT "SAT_PGLIB_books_UK" UNIQUE ("books_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."SAT_PGLIB_books" ADD CONSTRAINT "SAT_PGLIB_books_FK" FOREIGN KEY ("books_HKEY") REFERENCES "LIBPG_FL"."HUB_books"("books_HKEY");
 ALTER TABLE "LIBPG_FL"."SAT_PGLIB_books" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."SAT_PGLIB_books" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."SAT_PGLIB_genres"
(
    "genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"genre_id" INTEGER
   ,"genre_name" VARCHAR
   ,CONSTRAINT "SAT_PGLIB_genres_UK" UNIQUE ("genres_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."SAT_PGLIB_genres" ADD CONSTRAINT "SAT_PGLIB_genres_FK" FOREIGN KEY ("genres_HKEY") REFERENCES "LIBPG_FL"."HUB_genres"("genres_HKEY");
 ALTER TABLE "LIBPG_FL"."SAT_PGLIB_genres" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."SAT_PGLIB_genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."SAT_PGLIB_magazines"
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
   ,CONSTRAINT "SAT_PGLIB_magazines_UK" UNIQUE ("magazines_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."SAT_PGLIB_magazines" ADD CONSTRAINT "SAT_PGLIB_magazines_FK" FOREIGN KEY ("magazines_HKEY") REFERENCES "LIBPG_FL"."HUB_magazines"("magazines_HKEY");
 ALTER TABLE "LIBPG_FL"."SAT_PGLIB_magazines" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."SAT_PGLIB_magazines" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."SAT_PGLIB_publishers"
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
   ,CONSTRAINT "SAT_PGLIB_publishers_UK" UNIQUE ("publishers_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."SAT_PGLIB_publishers" ADD CONSTRAINT "SAT_PGLIB_publishers_FK" FOREIGN KEY ("publishers_HKEY") REFERENCES "LIBPG_FL"."HUB_publishers"("publishers_HKEY");
 ALTER TABLE "LIBPG_FL"."SAT_PGLIB_publishers" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."SAT_PGLIB_publishers" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."SAT_PGLIB_users"
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
   ,CONSTRAINT "SAT_PGLIB_users_UK" UNIQUE ("users_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."SAT_PGLIB_users" ADD CONSTRAINT "SAT_PGLIB_users_FK" FOREIGN KEY ("users_HKEY") REFERENCES "LIBPG_FL"."HUB_users"("users_HKEY");
 ALTER TABLE "LIBPG_FL"."SAT_PGLIB_users" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."SAT_PGLIB_users" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LNK_books_genres"
(
    "LNK_books_genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"books_HKEY" VARCHAR(40) NOT NULL
   ,"genres_HKEY" VARCHAR(40) NOT NULL
   ,CONSTRAINT "LNK_books_genres_PK" PRIMARY KEY ("LNK_books_genres_HKEY")   
   ,CONSTRAINT "LNK_books_genres_UK" UNIQUE ("books_HKEY", "genres_HKEY")   
)
;

ALTER TABLE "LIBPG_FL"."LNK_books_genres" ADD CONSTRAINT "LNK_books_genres_books_FK" FOREIGN KEY ("books_HKEY") REFERENCES "LIBPG_FL"."HUB_books"("books_HKEY");
 ALTER TABLE "LIBPG_FL"."LNK_books_genres" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_FL"."LNK_books_genres" ADD CONSTRAINT "LNK_books_genres_genres_FK" FOREIGN KEY ("genres_HKEY") REFERENCES "LIBPG_FL"."HUB_genres"("genres_HKEY");
 ALTER TABLE "LIBPG_FL"."LNK_books_genres" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LNK_books_genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LNK_books_publishers"
(
    "LNK_books_publishers_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"books_HKEY" VARCHAR(40) NOT NULL
   ,"publishers_HKEY" VARCHAR(40) NOT NULL
   ,CONSTRAINT "LNK_books_publishers_PK" PRIMARY KEY ("LNK_books_publishers_HKEY")   
   ,CONSTRAINT "LNK_books_publishers_UK" UNIQUE ("books_HKEY", "publishers_HKEY")   
)
;

ALTER TABLE "LIBPG_FL"."LNK_books_publishers" ADD CONSTRAINT "LNK_books_publishers_books_FK" FOREIGN KEY ("books_HKEY") REFERENCES "LIBPG_FL"."HUB_books"("books_HKEY");
 ALTER TABLE "LIBPG_FL"."LNK_books_publishers" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_FL"."LNK_books_publishers" ADD CONSTRAINT "LNK_books_publishers_publishers_FK" FOREIGN KEY ("publishers_HKEY") REFERENCES "LIBPG_FL"."HUB_publishers"("publishers_HKEY");
 ALTER TABLE "LIBPG_FL"."LNK_books_publishers" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LNK_books_publishers" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LNK_magazines_genres"
(
    "LNK_magazines_genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"magazines_HKEY" VARCHAR(40) NOT NULL
   ,"genres_HKEY" VARCHAR(40) NOT NULL
   ,CONSTRAINT "LNK_magazines_genres_PK" PRIMARY KEY ("LNK_magazines_genres_HKEY")   
   ,CONSTRAINT "LNK_magazines_genres_UK" UNIQUE ("magazines_HKEY", "genres_HKEY")   
)
;

ALTER TABLE "LIBPG_FL"."LNK_magazines_genres" ADD CONSTRAINT "LNK_magazines_genres_genres_FK" FOREIGN KEY ("genres_HKEY") REFERENCES "LIBPG_FL"."HUB_genres"("genres_HKEY");
 ALTER TABLE "LIBPG_FL"."LNK_magazines_genres" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_FL"."LNK_magazines_genres" ADD CONSTRAINT "LNK_magazines_genres_magazines_FK" FOREIGN KEY ("magazines_HKEY") REFERENCES "LIBPG_FL"."HUB_magazines"("magazines_HKEY");
 ALTER TABLE "LIBPG_FL"."LNK_magazines_genres" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LNK_magazines_genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LNK_magazines_publishers"
(
    "LNK_magazines_publishers_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"magazines_HKEY" VARCHAR(40) NOT NULL
   ,"publishers_HKEY" VARCHAR(40) NOT NULL
   ,CONSTRAINT "LNK_magazines_publishers_PK" PRIMARY KEY ("LNK_magazines_publishers_HKEY")   
   ,CONSTRAINT "LNK_magazines_publishers_UK" UNIQUE ("magazines_HKEY", "publishers_HKEY")   
)
;

ALTER TABLE "LIBPG_FL"."LNK_magazines_publishers" ADD CONSTRAINT "LNK_magazines_publishers_magazines_FK" FOREIGN KEY ("magazines_HKEY") REFERENCES "LIBPG_FL"."HUB_magazines"("magazines_HKEY");
 ALTER TABLE "LIBPG_FL"."LNK_magazines_publishers" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_FL"."LNK_magazines_publishers" ADD CONSTRAINT "LNK_magazines_publishers_publishers_FK" FOREIGN KEY ("publishers_HKEY") REFERENCES "LIBPG_FL"."HUB_publishers"("publishers_HKEY");
 ALTER TABLE "LIBPG_FL"."LNK_magazines_publishers" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LNK_magazines_publishers" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LKS_PGLIB_books_genres"
(
    "LNK_books_genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"genre_id" INTEGER
   ,"book_id" INTEGER
   ,CONSTRAINT "LKS_PGLIB_books_genres_UK" UNIQUE ("LNK_books_genres_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."LKS_PGLIB_books_genres" ADD CONSTRAINT "LKS_PGLIB_books_genres_FK" FOREIGN KEY ("LNK_books_genres_HKEY") REFERENCES "LIBPG_FL"."LNK_books_genres"("LNK_books_genres_HKEY");
 ALTER TABLE "LIBPG_FL"."LKS_PGLIB_books_genres" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LKS_PGLIB_books_genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LKS_PGLIB_books_publishers"
(
    "LNK_books_publishers_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"publisher_id" INTEGER
   ,"book_id" INTEGER
   ,CONSTRAINT "LKS_PGLIB_books_publishers_UK" UNIQUE ("LNK_books_publishers_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."LKS_PGLIB_books_publishers" ADD CONSTRAINT "LKS_PGLIB_books_publishers_FK" FOREIGN KEY ("LNK_books_publishers_HKEY") REFERENCES "LIBPG_FL"."LNK_books_publishers"("LNK_books_publishers_HKEY");
 ALTER TABLE "LIBPG_FL"."LKS_PGLIB_books_publishers" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LKS_PGLIB_books_publishers" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LKS_PGLIB_magazines_genres"
(
    "LNK_magazines_genres_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"genre_id" INTEGER
   ,"magazine_id" INTEGER
   ,CONSTRAINT "LKS_PGLIB_magazines_genres_UK" UNIQUE ("LNK_magazines_genres_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."LKS_PGLIB_magazines_genres" ADD CONSTRAINT "LKS_PGLIB_magazines_genres_FK" FOREIGN KEY ("LNK_magazines_genres_HKEY") REFERENCES "LIBPG_FL"."LNK_magazines_genres"("LNK_magazines_genres_HKEY");
 ALTER TABLE "LIBPG_FL"."LKS_PGLIB_magazines_genres" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LKS_PGLIB_magazines_genres" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LKS_PGLIB_magazines_publishers"
(
    "LNK_magazines_publishers_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"magazine_id" INTEGER
   ,"publisher_id" INTEGER
   ,CONSTRAINT "LKS_PGLIB_magazines_publishers_UK" UNIQUE ("LNK_magazines_publishers_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."LKS_PGLIB_magazines_publishers" ADD CONSTRAINT "LKS_PGLIB_magazines_publishers_FK" FOREIGN KEY ("LNK_magazines_publishers_HKEY") REFERENCES "LIBPG_FL"."LNK_magazines_publishers"("LNK_magazines_publishers_HKEY");
 ALTER TABLE "LIBPG_FL"."LKS_PGLIB_magazines_publishers" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LKS_PGLIB_magazines_publishers" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LND_book_author"
(
    "LND_book_author_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"authors_HKEY" VARCHAR(40) NOT NULL
   ,"books_HKEY" VARCHAR(40) NOT NULL
   ,CONSTRAINT "LND_bookauthor_PK" PRIMARY KEY ("LND_book_author_HKEY")   
   ,CONSTRAINT "LND_bookauthor_UK" UNIQUE ("authors_HKEY", "books_HKEY")   
)
;

ALTER TABLE "LIBPG_FL"."LND_book_author" ADD CONSTRAINT "LND_bookauthor_authors_FK" FOREIGN KEY ("authors_HKEY") REFERENCES "LIBPG_FL"."HUB_authors"("authors_HKEY");
 ALTER TABLE "LIBPG_FL"."LND_book_author" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_FL"."LND_book_author" ADD CONSTRAINT "LND_bookauthor_books_FK" FOREIGN KEY ("books_HKEY") REFERENCES "LIBPG_FL"."HUB_books"("books_HKEY");
 ALTER TABLE "LIBPG_FL"."LND_book_author" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LND_book_author" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LND_checkouts"
(
    "LND_checkouts_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"books_HKEY" VARCHAR(40) NOT NULL
   ,"users_HKEY" VARCHAR(40) NOT NULL
   ,CONSTRAINT "LND_checkouts_PK" PRIMARY KEY ("LND_checkouts_HKEY")   
   ,CONSTRAINT "LND_checkouts_UK" UNIQUE ("books_HKEY", "users_HKEY")   
)
;

ALTER TABLE "LIBPG_FL"."LND_checkouts" ADD CONSTRAINT "LND_checkouts_books_FK" FOREIGN KEY ("books_HKEY") REFERENCES "LIBPG_FL"."HUB_books"("books_HKEY");
 ALTER TABLE "LIBPG_FL"."LND_checkouts" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_FL"."LND_checkouts" ADD CONSTRAINT "LND_checkouts_users_FK" FOREIGN KEY ("users_HKEY") REFERENCES "LIBPG_FL"."HUB_users"("users_HKEY");
 ALTER TABLE "LIBPG_FL"."LND_checkouts" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LND_checkouts" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LND_magazine_checkouts"
(
    "LND_magazine_checkouts_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"magazines_HKEY" VARCHAR(40) NOT NULL
   ,"users_HKEY" VARCHAR(40) NOT NULL
   ,CONSTRAINT "LND_magazinecheckouts_PK" PRIMARY KEY ("LND_magazine_checkouts_HKEY")   
   ,CONSTRAINT "LND_magazinecheckouts_UK" UNIQUE ("magazines_HKEY", "users_HKEY")   
)
;

ALTER TABLE "LIBPG_FL"."LND_magazine_checkouts" ADD CONSTRAINT "LND_magazinecheckouts_magazines_FK" FOREIGN KEY ("magazines_HKEY") REFERENCES "LIBPG_FL"."HUB_magazines"("magazines_HKEY");
 ALTER TABLE "LIBPG_FL"."LND_magazine_checkouts" DISABLE TRIGGER ALL;
ALTER TABLE "LIBPG_FL"."LND_magazine_checkouts" ADD CONSTRAINT "LND_magazinecheckouts_users_FK" FOREIGN KEY ("users_HKEY") REFERENCES "LIBPG_FL"."HUB_users"("users_HKEY");
 ALTER TABLE "LIBPG_FL"."LND_magazine_checkouts" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LND_magazine_checkouts" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LDS_PGLIB_book_author"
(
    "LND_book_author_HKEY" VARCHAR(40) NOT NULL
   ,"LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"HASH_DIFF" VARCHAR(40)
   ,"DELETE_FLAG" VARCHAR(3) NOT NULL
   ,"last_updated" TIMESTAMP NOT NULL
   ,"book_id" INTEGER NOT NULL
   ,"author_id" INTEGER NOT NULL
   ,CONSTRAINT "LDS_PGLIB_bookauthor_UK" UNIQUE ("LND_book_author_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."LDS_PGLIB_book_author" ADD CONSTRAINT "LDS_PGLIB_bookauthor_FK" FOREIGN KEY ("LND_book_author_HKEY") REFERENCES "LIBPG_FL"."LND_book_author"("LND_book_author_HKEY");
 ALTER TABLE "LIBPG_FL"."LDS_PGLIB_book_author" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LDS_PGLIB_book_author" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LDS_PGLIB_checkouts"
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
   ,CONSTRAINT "LDS_PGLIB_checkouts_UK" UNIQUE ("LND_checkouts_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."LDS_PGLIB_checkouts" ADD CONSTRAINT "LDS_PGLIB_checkouts_FK" FOREIGN KEY ("LND_checkouts_HKEY") REFERENCES "LIBPG_FL"."LND_checkouts"("LND_checkouts_HKEY");
 ALTER TABLE "LIBPG_FL"."LDS_PGLIB_checkouts" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LDS_PGLIB_checkouts" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."LDS_PGLIB_magazine_checkouts"
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
   ,CONSTRAINT "LDS_PGLIB_magazinecheckouts_UK" UNIQUE ("LND_magazine_checkouts_HKEY", "LOAD_DATE")   
)
;

ALTER TABLE "LIBPG_FL"."LDS_PGLIB_magazine_checkouts" ADD CONSTRAINT "LDS_PGLIB_magazinecheckouts_FK" FOREIGN KEY ("LND_magazine_checkouts_HKEY") REFERENCES "LIBPG_FL"."LND_magazine_checkouts"("LND_magazine_checkouts_HKEY");
 ALTER TABLE "LIBPG_FL"."LDS_PGLIB_magazine_checkouts" DISABLE TRIGGER ALL;
COMMENT ON TABLE "LIBPG_FL"."LDS_PGLIB_magazine_checkouts" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


CREATE   TABLE "LIBPG_FL"."REF_PGLIB_codes"
(
    "LOAD_DATE" TIMESTAMP NOT NULL
   ,"LOAD_CYCLE_ID" INTEGER NOT NULL
   ,"code_id" INTEGER NOT NULL
   ,"code_type" VARCHAR
   ,"code_value" VARCHAR
   ,"code_description" VARCHAR
   ,"is_active" BOOLEAN
   ,CONSTRAINT "PGLIB_codes_PK" PRIMARY KEY ("LOAD_DATE", "code_id")   
)
;

COMMENT ON TABLE "LIBPG_FL"."REF_PGLIB_codes" IS 'DV_NAME: LibraryPostgres - Release: Four(4) - Comment: turn off obj spec loading - Release date: 2026/03/17 17:39:12';


-- END


