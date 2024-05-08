CREATE DATABASE practicePRJ1;

USE practicePRJ1;

CREATE TABLE member
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(200) NOT NULL UNIQUE,
    password  VARCHAR(200) NOT NULL,
    nick_name VARCHAR(200) NOT NULL UNIQUE,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);

ALTER TABLE member
    CHANGE inserted inserted DATETIME NOT NULL DEFAULT NOW();

DESC member;
SELECT *
FROM member;

CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(200)  NOT NULL,
    content  VARCHAR(3000) NOT NULL,
    member_id INT REFERENCES member(id),
    inserted DATETIME      NOT NULL DEFAULT NOW()
);

DESC board;
SELECT *
FROM board;

INSERT INTO board
    (title, content, writer)
SELECT title, content, writer
FROM board;

ALTER TABLE board
    DROP COLUMN writer;
ALTER TABLE board
ADD COLUMN member_id INT REFERENCES member(id);

UPDATE board
SET member_id = 12
WHERE id > 0;

SELECT COUNT(*) FROM board;