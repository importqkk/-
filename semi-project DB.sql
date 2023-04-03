SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
--ȸ��
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
	 member_role 	VARCHAR2(12) DEFAULT '�Ϲ�ȸ��'	NOT NULL,
	 agree_TOS 	varchar2(1)	not NULL,
     agree_privacy 	varchar2(1)	not NULL,
     agree_promotion varchar2(1)	not NULL,
     

     -- ���̵� 
     -- ���� �ҹ���,���� ���� 5~20����
    check(regexp_like(member_id,'^[a-z0-9-_]{5,20}$')),
    
    -- ���
    -- ���� ��ҹ���, ����, Ư������ �� ���� ������ 8~16����
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
    
    -- �̸� 
    -- ��, �̸� ���� �ѱ� 2���� �̻� 7���� ����
    check(regexp_like(member_name,'^[��-�R]{2,7}$')),
    
    -- �г��� 
    -- �ѱ�, ���� 2~10����
    check(regexp_like(member_nick, '^[��-�R0-9]{2,10}$')),
    
    -- ��ȭ��ȣ
    check (REGEXP_LIKE(member_phone,'^01[016789][1-9][0-9]{6,7}$')),
    
    -- �̸���
    -- '@'����
    check(instr(member_email, '@') > 0),
    
    -- �����ȣ
    -- ���� 5~6�ڸ�
    check(regexp_like(member_post, '^[0-9]{5,6}$')),
    
    
    -- ����Ʈ
    -- 0�� �̻�
    check(member_point >= 0),
    
    -- ȸ������
    -- �Ϲ� Ȥ�� ������
    check(member_role in ('�Ϲ�ȸ��','������')),
 
 
    --�̿��� ������ ����
    -- boolean  0 �Ǵ� 1 
     check (agree_TOS in('Y','N')), --�ʼ����� Y��
     check (agree_privacy in('Y','N')), --�ʼ����� Y��
     check (agree_promotion  in('Y','N')) --���õ���
);


--�ֹ�
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
	 order_stat varchar2(21) DEFAULT '�����Ϸ�' not null,
     	member_Id 	REFERENCES member(member_id) on delete cascade,
    
    --������ �̸�
    -- ��, �̸� ���� �ѱ� 2���� �̻� 7���� ����
    check(regexp_like(order_receiver,'^[��-�R]{2,7}$')),
    
    -- ������ �����ȣ
    check(regexp_like(order_post, '^[0-9]{5,6}$')),
    
    -- ������ ���ּ�
    check(regexp_like(order_detail_addr,'^[��-�R\s-0-9]{2,50}$')),
    
    -- ������ ����ȣ
    check (REGEXP_LIKE(order_receiver_phone,'^01[016789][1-9][0-9]{6,7}$')),
    check(order_userPoint >=0 ),
    check(order_stat in('�����Ϸ�','����غ���','�����','��ۿϷ�'))
    
	 
);



--��ǰ
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
     
    -- ��ǰ�̸�
    -- �ѱ�, ����, ����, -,_ ��ȣ ���� 1~33����
    check(regexp_like(product_name,'^[a-z0-9��-�R-!@#$%^&*]{1,33}$')),
    
    -- ��ǰ ���� 0�� �̻�
    check(product_price >=0),
    
    -- ��ǰ ��� 0�� �̻�
    check(product_stock >=0),
    
    -- ��ǰ ��޺� 0�� �̻�
    check (product_delivery_price>=0),
    
    -- ��ǰ �Ǹ� ���� 0�� �̻�
    check(product_sell_count >=0)
);




--����
CREATE TABLE  Review  (
	 review_no 	number	PRIMARY KEY	 ,
	 review_content 	VARCHAR2(3000)	NOT NULL,
	 review_star 	number 	DEFAULT 0	NOT NULL,
	 review_time 	date 	DEFAULT sysdate	NOT NULL,
	 review_like 	number 	DEFAULT 0	NOT NULL,
     	product_no 	REFERENCES  product(product_no) on delete CASCADE,
     	member_Id REFERENCES member(member_id) on delete CASCADE,
     
     -- ���� ����
     --0 ~ 5��
     check(review_star BETWEEN 0 and 5),
     
     -- ���� ���ƿ�
     check (review_like >=0) 
     
);

--���ǰԽ���
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
     
     -- qa ���Ӹ�
     check (qa_head in('��ǰ����','��������','��Ÿ����')),
     
     -- qa ��б�
     --boolean 0 �Ǵ� 1 
     check (qa_secret in ('Y','N')),
     
     -- qa ������ ���� 
     check (QA_group>0),
     check (QA_parent>0),
     --  ���̴� ���ų� 1���� �ִ�
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
      i, -- �۹�ȣ
      i || '��°����',
      i || '��°��������', --����
      i || '��°�亯', -- �亯
      CASE ROUND(dbms_random.value(0, 2))
        WHEN 0 THEN '��ǰ����'
        WHEN 1 THEN '��������'
        ELSE '��Ÿ����'
      END, -- ī�װ�
      CASE ROUND(dbms_random.value(0, 1))
      WHEN 0 THEN 'Y'
      ELSE 'N'
      END,-- ��б�
      ROUND(dbms_random.value(1,3)), -- �׷�
      ROUND(dbms_random.value(1,4)), --����
      ROUND(dbms_random.value(0,1)), --����
      sysdate, -- �ۼ��ð�
      ROUND(dbms_random.value(0,100)), --��ȸ��
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



--�̹�������
CREATE TABLE  img  (
	 img_no 	number	PRIMARY KEY,
	 img_name 	varchar2(100)	NOT NULL,
	 img_type 	varchar2(60)	NOT NULL,
	 img_size 	long	NOT NULL
    

         
);

--��ٱ���
CREATE TABLE  cart  (
     	product_no  references product(product_no) on delete cascade,
     	member_Id  REFERENCES member(member_id) on delete cascade,
	PRODUCT_COUNT number not null,
	primary key(member_id, product_no)

);

--�±�/ī�װ�
CREATE TABLE  tag  (
	 tag_no 	number	PRIMARY KEY,
	 tag_name 	varchar2(30)	NOT NULL
);

-- ��ǰ-�ֹ�
CREATE TABLE  order_product  (
	 product_count 	number	NOT NULL,
	 product_price 	number	NOT NULL,
     product_no 	REFERENCES product(product_no) on delete cascade,
	 order_no 	REFERENCES order_(order_no) on delete cascade,
	 primary key(product_no, order_no)
);



-- ��ǰ-�±�
CREATE TABLE  product_tag  (
	 product_no 	REFERENCES product(product_no) on delete cascade ,
	 tag_no 	REFERENCES tag(tag_no) on delete cascade,
     primary key(product_no, tag_no)
);

-- ����-���ƿ�
CREATE TABLE  review_like  (
	 review_no 	REFERENCES	review(review_no)	on delete cascade ,
	 member_Id 	REFERENCES member(member_id) on delete cascade,
	 primary key(review_no, member_id)
);

-- ��ǰ-�̹���
CREATE TABLE  product_img  (
	 product_no 	REFERENCES product(product_no)	on delete cascade ,
	 img_no 	REFERENCES	img(img_no) on delete cascade,
	 primary key(img_no, product_no) 
);

-- ��ǰ-���̹���
CREATE TABLE  detail_img  (
	 product_no 	REFERENCES product(product_no) on delete cascade	 ,
	 img_no 	REFERENCES	img(img_no) on delete cascade,
     primary key(img_no,product_no)
);

-- ����-�̹���
CREATE TABLE  review_img  (
	 img_no 	REFERENCES	img(img_no) on delete cascade,
	 review_no 	REFERENCES	review(review_no) on delete cascade,	 
	 primary key(img_no, review_no) 
);



commit;