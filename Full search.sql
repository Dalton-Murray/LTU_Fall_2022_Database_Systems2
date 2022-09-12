-- create database test;

-- use test;
-- create table books (
-- id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- author VARCHAR(30) NOT NULL,
-- title VARCHAR(255) NOT NULL,
-- body TEXT,
-- -- PRIMARY KEY (id),
-- FULLTEXT (title, body)
-- ) engine = InnoDB;


-- use test;
-- INSERT INTO test.books (author, title, body)
-- VALUES ('John Smith','Lorem ipsum dolor','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')

SELECT *
FROM
    test.books
WHERE
    MATCH(title, body)
    AGAINST("+ipsum -gold" IN BOOLEAN MODE) -- IN NATURAL LANGUAGE MODE
;                                           -- IN BOOLEAN MODE
                                                -- Can do advanced functions, +, -, "", <, >

