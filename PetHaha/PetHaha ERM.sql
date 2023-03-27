
/* Drop Tables */

DROP TABLE PRe_Reply CASCADE CONSTRAINTS;
DROP TABLE PReply CASCADE CONSTRAINTS;
DROP TABLE PBoard CASCADE CONSTRAINTS;
DROP TABLE PMessage CASCADE CONSTRAINTS;
DROP TABLE PMember CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE PBoard
(
	Bnum number(10) NOT NULL,
	category number(2) NOT NULL,
	subject varchar2(50) NOT NULL,
	content varchar2(1000) NOT NULL,
	indate date DEFAULT SYSDATE NOT NULL,
	bimg1 varchar2(100),
	bimg2 varchar2(100),
	bimg3 varchar2(100),
	views number(10) DEFAULT 0 NOT NULL,
	thumbs number(10) DEFAULT 0 NOT NULL,
	report number(1) DEFAULT 0,
	id varchar2(20) NOT NULL,
	nick varchar2(50) NOT NULL,
	PRIMARY KEY (Bnum)
);


CREATE TABLE PMember
(
	id varchar2(20) NOT NULL,
	pwd varchar2(50) NOT NULL,
	nick varchar2(50) NOT NULL,
	phone varchar2(50) NOT NULL,
	name varchar2(20) NOT NULL,
	intro varchar2(1000),
	MemImg varchar2(100),
	point number(6) DEFAULT 0,
	kick number(1) DEFAULT 0,
	PRIMARY KEY (id, nick)
);


CREATE TABLE PMessage
(
	MSnum number(20) NOT NULL,
	toNick varchar2(20) NOT NULL,
	id varchar2(20) NOT NULL,
	nick varchar2(50) NOT NULL,
	Mcontent varchar2(1000) NOT NULL,
	indate date DEFAULT SYSDATE,
	answer varchar2(1000),
	Mcheck number(1) DEFAULT 0,
	PRIMARY KEY (MSnum)
);


CREATE TABLE PReply
(
	Rnum number(10) NOT NULL,
	Rwriter varchar2(30) NOT NULL,
	Rcontent varchar2(1000) NOT NULL,
	Rthumbs number(10) DEFAULT 0,
	indate date DEFAULT SYSDATE,
	Rreport number(1) DEFAULT 0,
	Bnum number(10) NOT NULL,
	id varchar2(20) NOT NULL,
	nick varchar2(50) NOT NULL,
	PRIMARY KEY (Rnum)
);


CREATE TABLE PRe_Reply
(
	ReRnum number(10) NOT NULL,
	Rnum number(10) NOT NULL,
	Bnum number(10) NOT NULL,
	id varchar2(20) NOT NULL,
	nick varchar2(50) NOT NULL,
	Rwriter varchar2(30) NOT NULL,
	ReRContent varchar2(1000) NOT NULL,
	ReRthumbs number(10) DEFAULT 0,
	indate date DEFAULT SYSDATE,
	ReRReport number(1) DEFAULT 0,
	PRIMARY KEY (ReRnum)
);



/* Create Foreign Keys */

ALTER TABLE PReply
	ADD FOREIGN KEY (Bnum)
	REFERENCES PBoard (Bnum)
;


ALTER TABLE PRe_Reply
	ADD FOREIGN KEY (Bnum)
	REFERENCES PBoard (Bnum)
;


ALTER TABLE PBoard
	ADD FOREIGN KEY (id, nick)
	REFERENCES PMember (id, nick)
;


ALTER TABLE PMessage
	ADD FOREIGN KEY (id, nick)
	REFERENCES PMember (id, nick)
;


ALTER TABLE PReply
	ADD FOREIGN KEY (id, nick)
	REFERENCES PMember (id, nick)
;


ALTER TABLE PRe_Reply
	ADD FOREIGN KEY (id, nick)
	REFERENCES PMember (id, nick)
;


ALTER TABLE PRe_Reply
	ADD FOREIGN KEY (Rnum)
	REFERENCES PReply (Rnum)
;

drop sequence pmessage_seq;
create sequence pmessage_seq start with 1;	

drop sequence pboard_seq;
create sequence pboard_seq start with 1;	

drop sequence preply_seq;
create sequence preply_seq start with 1;	

drop sequence pre_reply_seq;
create sequence pre_reply_seq start with 1;	

