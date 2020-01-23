CREATE TABLE snsuser
(id VARCHAR2(50) PRIMARY KEY,
pwd VARCHAR2(50),
email VARCHAR2(50),
profile CLOB,
regdate DATE);

CREATE TABLE board_img(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(50) NOT NULL, -- 글 작성자의 id 
	content CLOB,
	likeCount NUMBER, -- 좋아요수
	regdate DATE
);

CREATE SEQUENCE board_img_seq;








