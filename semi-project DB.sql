SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
--È¸¿ø
CREATE TABLE  member  (
	 Member_Id 	VARCHAR2(20)	PRIMARY KEY,
	 member_name 	VARCHAR2(21)	NOT NULL,
	 member_nick 	VARCHAR2(30)	NOT NULL,
	 member_Pw 	VARCHAR2(16)	NOT NULL,
	 member_phone 	VARCHAR2(11)	NOT NULL,
	 member_email 	VARCHAR2(50)	NULL,
	 member_post 	varchar2(6)	NOT NULL,
	 member_basic_addr 	VARCHAR2(150)	NOT NULL,
	 member_detail_addr 	VARCHAR2(150)	NOT NULL,
	 member_point 	number DEFAULT 100	NOT NULL,
	 member_join 	DATE 	DEFAULT sysdate	NOT NULL,
	 member_role 	VARCHAR2(12) DEFAULT 'ÀÏ¹ÝÈ¸¿ø'	NOT NULL,
	 agree_TOS 	varchar2(1)	not NULL,
     agree_privacy 	varchar2(1)	not NULL,
     agree_promotion varchar2(1)	not NULL,
     

     -- ¾ÆÀÌµð 
     -- ¿µ¹® ¼Ò¹®ÀÚ,¼ýÀÚ Æ÷ÇÔ 5~20±ÛÀÚ
    check(regexp_like(member_id,'^[a-z0-9-_]{5,20}$')),
    
    -- ºñ¹ø
    -- ¿µ¾î ´ë¼Ò¹®ÀÚ, ¼ýÀÚ, Æ¯¼ö¹®ÀÚ ÇÑ °³¾¿ Æ÷ÇÔÇÑ 8~16±ÛÀÚ
    check(
    regexp_like(member_pw, '[A-Z]+')    
    and
    regexp_like(member_pw, '[a-z]+')
    and
    regexp_like(member_pw, '[0-9]+')
    and
    regexp_like(member_pw, '[!@#$]+')
    and
    regexp_like(member_pw, '^[A-Za-z0-9!@#$]{8,16}$')
    ),
    
    -- ÀÌ¸§ 
    -- ¼º, ÀÌ¸§ Æ÷ÇÔ ÇÑ±Û 2±ÛÀÚ ÀÌ»ó 7±ÛÀÚ ÀÌÇÏ
    check(regexp_like(member_name,'^[°¡-ÆR]{2,7}$')),
    
    -- ´Ð³×ÀÓ 
    -- ÇÑ±Û, ¼ýÀÚ 2~10±ÛÀÚ
    check(regexp_like(member_nick, '^[°¡-ÆR0-9]{2,10}$')),
    
    -- ÀüÈ­¹øÈ£
    check (REGEXP_LIKE(member_phone,'^01[016789][1-9][0-9]{6,7}$')),
    
    -- ÀÌ¸ÞÀÏ
    -- '@'Æ÷ÇÔ
    check(instr(member_email, '@') > 0),
    
    -- ¿ìÆí¹øÈ£
    -- ¼ýÀÚ 5~6ÀÚ¸®
    check(regexp_like(member_post, '^[0-9]{5,6}$')),
    
    
    -- Æ÷ÀÎÆ®
    -- 0Á¡ ÀÌ»ó
    check(member_point >= 0),
    
    -- È¸¿ø±ÇÇÑ
    -- ÀÏ¹Ý È¤Àº °ü¸®ÀÚ
    check(member_role in ('ÀÏ¹ÝÈ¸¿ø','°ü¸®ÀÚ')),
 
 
    --ÀÌ¿ë¾à°ü ¸¶ÄÉÆÃ µ¿ÀÇ
    -- boolean  0 ¶Ç´Â 1 
     check (agree_TOS in('Y','N')), --ÇÊ¼öµ¿ÀÇ Y¸¸
     check (agree_privacy in('Y','N')), --ÇÊ¼öµ¿ÀÇ Y¸¸
     check (agree_promotion  in('Y','N')) --¼±ÅÃµ¿ÀÇ
);


--ÁÖ¹®
CREATE TABLE  order_  (
	 order_no 	number	PRIMARY KEY	 ,
	 order_receiver 	varchar2(21)	NOT NULL,
     order_post varchar2(6) not null,
	 order_basic_addr 	VARCHAR2(150)	NOT NULL,
	 order_detail_addr 	VARCHAR2(150)	NOT NULL,
	 order_receiver_phone 	varchar2(11)	NOT NULL,
	 order_date 	DATE 	DEFAULT sysdate	NOT NULL,
	 order_request 	varchar2(300),
	 order_userPoint number DEFAULT 0,
	 order_stat varchar2(21) DEFAULT '°áÁ¦¿Ï·á' not null,
     	member_Id 	REFERENCES member(member_id) on delete cascade,
    
    --¼ö·ÉÀÎ ÀÌ¸§
    -- ¼º, ÀÌ¸§ Æ÷ÇÔ ÇÑ±Û 2±ÛÀÚ ÀÌ»ó 7±ÛÀÚ ÀÌÇÏ
    check(regexp_like(order_receiver,'^[°¡-ÆR]{2,7}$')),
    
    -- ¼ö·ÉÀÎ ¿ìÆí¹øÈ£
    check(regexp_like(order_post, '^[0-9]{5,6}$')),
    
    -- ¼ö·ÉÀÎ »ó¼¼ÁÖ¼Ò
    check(regexp_like(order_detail_addr,'^[°¡-ÆR\s-0-9]{2,50}$')),
    
    -- ¼ö·ÉÀÎ Æù¹øÈ£
    check (REGEXP_LIKE(order_receiver_phone,'^01[016789][1-9][0-9]{6,7}$')),
    check(order_userPoint >=0 ),
    check(order_stat in('°áÁ¦¿Ï·á','¹è¼ÛÁØºñÁß','¹è¼ÛÁß','¹è¼Û¿Ï·á'))
    
	 
);



--»óÇ°
CREATE TABLE  Product  (
	 product_no 	number	PRIMARY KEY	 ,
	 product_name 	varchar2(99)	NOT NULL,
	 product_brand	varchar2(30) 	NOT NULL,
	 product_price 	number	NOT NULL,
	 product_stock 	number 	DEFAULT 0	NOT NULL,
	 product_content 	varchar2(3000)	NOT NULL,
	 product_delivery_price 	number 	DEFAULT 3000	NOT NULL,
	 product_sell_count 	number 	DEFAULT 0	NOT NULL,
	 product_join 	date 	DEFAULT sysdate	NOT NULL,
     
    -- »óÇ°ÀÌ¸§
    -- ÇÑ±Û, ¿µ¾î, ¼ýÀÚ, -,_ ±âÈ£ Æ÷ÇÔ 1~33±ÛÀÚ
    check(regexp_like(product_name,'^[a-z0-9°¡-ÆR-!@#$%^&*]{1,33}$')),
    
    -- »óÇ° °¡°Ý 0¿ø ÀÌ»ó
    check(product_price >=0),
    
    -- »óÇ° Àç°í 0°³ ÀÌ»ó
    check(product_stock >=0),
    
    -- »óÇ° ¹è´Þºñ 0¿ø ÀÌ»ó
    check (product_delivery_price>=0),
    
    -- »óÇ° ÆÇ¸Å ¼ö·® 0°³ ÀÌ»ó
    check(product_sell_count >=0)
);




--¸®ºä
CREATE TABLE  Review  (
	 review_no 	number	PRIMARY KEY	 ,
	 review_content 	VARCHAR2(3000)	NOT NULL,
	 review_star 	number 	DEFAULT 0	NOT NULL,
	 review_time 	date 	DEFAULT sysdate	NOT NULL,
	 review_like 	number 	DEFAULT 0	NOT NULL,
     	product_no 	REFERENCES  product(product_no) on delete CASCADE,
     	member_Id REFERENCES member(member_id) on delete CASCADE,
     
     -- ¸®ºä º°Á¡
     --0 ~ 5Á¡
     check(review_star BETWEEN 0 and 5),
     
     -- ¸®ºä ÁÁ¾Æ¿ä
     check (review_like >=0) 
     
);

--¹®ÀÇ°Ô½ÃÆÇ
CREATE TABLE  QA  (
	 QA_no 	number	PRIMARY KEY,
	 QA_title 	varchar2(90) NOT NULL,
	 QA_content 	VARCHAR2(3000)	NOT NULL,
	 QA_answer 	VARCHAR2(3000),
	 QA_head 	VARCHAR2(12)	NOT NULL	,
	 QA_secret 	VARCHAR2(1) DEFAULT 0	NOT NULL,
     QA_group number,
	 QA_parent 	references QA(QA_no) on delete cascade,
	 QA_depth 	number 	DEFAULT 0	,
     QA_date date DEFAULT sysdate not null,
      QA_READ number default 0 not null,
     member_Id 	REFERENCES member(member_id) on delete set null,
     
     -- qa ¸»¸Ó¸®
     check (qa_head in('»óÇ°¹®ÀÇ','°áÁ¦¹®ÀÇ','±âÅ¸¹®ÀÇ')),
     
     -- qa ºñ¹Ð±Û
     --boolean 0 ¶Ç´Â 1 
     check (qa_secret in ('Y','N')),
     
     -- qa °èÃþÇü ±¸Á¶ 
     check (QA_group>0),
     check (QA_parent>0),
     --  ±íÀÌ´Â ¾ø°Å³ª 1°³°¡ ÃÖ´ë
     check (QA_depth in (0,1))
);


BEGIN
  FOR i IN 1..60 LOOP
    INSERT INTO QA(
      QA_NO,
      QA_TITLE,
      QA_CONTENT,
      QA_ANSWER,
      QA_HEAD,
      QA_SECRET,
      QA_GROUP,
      QA_PARENT,
      QA_DEPTH,
      QA_DATE,
      QA_READ,
      MEMBER_ID
    ) VALUES (
      i, -- ±Û¹øÈ£
      i || '¹øÂ°Á¦¸ñ',
      i || '¹øÂ°Áú¹®³»¿ë', --³»¿ë
      i || '¹øÂ°´äº¯', -- ´äº¯
      CASE ROUND(dbms_random.value(0, 2))
        WHEN 0 THEN '»óÇ°¹®ÀÇ'
        WHEN 1 THEN '°áÁ¦¹®ÀÇ'
        ELSE '±âÅ¸¹®ÀÇ'
      END, -- Ä«Å×°í¸®
      CASE ROUND(dbms_random.value(0, 1))
      WHEN 0 THEN 'Y'
      ELSE 'N'
      END,-- ºñ¹Ð±Û
      ROUND(dbms_random.value(1,3)), -- ±×·ì
      ROUND(dbms_random.value(1,4)), --Â÷¼ö
      ROUND(dbms_random.value(0,1)), --±íÀÌ
      sysdate, -- ÀÛ¼º½Ã°£
      ROUND(dbms_random.value(0,100)), --Á¶È¸¼ö
      'testuser' || i
    );
  END LOOP;
END;




SELECT qa_seq.CURRVAL
FROM dual;

SELECT qa_seq.NEXTVAL - 1
FROM dual;

ALTER SEQUENCE qa_seq
INCREMENT BY 9;



select*from qa;

drop table qa;



--ÀÌ¹ÌÁöÆÄÀÏ
CREATE TABLE  img  (
	 img_no 	number	PRIMARY KEY,
	 img_name 	varchar2(100)	NOT NULL,
	 img_type 	varchar2(60)	NOT NULL,
	 img_size 	long	NOT NULL
    

         
);

--Àå¹Ù±¸´Ï
CREATE TABLE  cart  (
     	product_no  references product(product_no) on delete cascade,
     	member_Id  REFERENCES member(member_id) on delete cascade,
	PRODUCT_COUNT number not null,
	primary key(member_id, product_no)

);

--ÅÂ±×/Ä«Å×°í¸®
CREATE TABLE  tag  (
	 tag_no 	number	PRIMARY KEY,
	 tag_name 	varchar2(30)	NOT NULL
);

-- »óÇ°-ÁÖ¹®
CREATE TABLE  order_product  (
	 product_count 	number	NOT NULL,
	 product_price 	number	NOT NULL,
     product_no 	REFERENCES product(product_no) on delete cascade,
	 order_no 	REFERENCES order_(order_no) on delete cascade,
	 primary key(product_no, order_no)
);



-- »óÇ°-ÅÂ±×
CREATE TABLE  product_tag  (
	 product_no 	REFERENCES product(product_no) on delete cascade ,
	 tag_no 	REFERENCES tag(tag_no) on delete cascade,
     primary key(product_no, tag_no)
);

-- ¸®ºä-ÁÁ¾Æ¿ä
CREATE TABLE  review_like  (
	 review_no 	REFERENCES	review(review_no)	on delete cascade ,
	 member_Id 	REFERENCES member(member_id) on delete cascade,
	 primary key(review_no, member_id)
);

-- »óÇ°-ÀÌ¹ÌÁö
CREATE TABLE  product_img  (
	 product_no 	REFERENCES product(product_no)	on delete cascade ,
	 img_no 	REFERENCES	img(img_no) on delete cascade,
	 primary key(img_no, product_no) 
);

-- »óÇ°-»ó¼¼ÀÌ¹ÌÁö
CREATE TABLE  detail_img  (
	 product_no 	REFERENCES product(product_no) on delete cascade	 ,
	 img_no 	REFERENCES	img(img_no) on delete cascade,
     primary key(img_no,product_no)
);

-- ¸®ºä-ÀÌ¹ÌÁö
CREATE TABLE  review_img  (
	 img_no 	REFERENCES	img(img_no) on delete cascade,
	 review_no 	REFERENCES	review(review_no) on delete cascade,	 
	 primary key(img_no, review_no) 
);



commit;