-- 태그 생성 
insert into tag values(1,'피부'); 
insert into tag values(2,'노화/항산화'); 
insert into tag values(3,'피로/활력'); 
insert into tag values(4,'면역력'); 
insert into tag values(5,'모발/두피'); 
insert into tag values(6,'눈'); 
insert into tag values(7,'간'); 
insert into tag values(8,'관절/뼈'); 

---- 상품 더미데이터 생성 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO product (
      product_no,
      product_name,
      product_brand,
      product_price,
      product_stock,
      product_content,
      product_delivery_price,
      product_sell_count,
      product_join
    ) VALUES (
      i, -- 상품번호
      i || '번째약', -- 상품명
      ROUND(dbms_random.value(1,8)) || '번브랜드',
      ROUND(dbms_random.value(0, 99999)/1000)*1000, --가격
      ROUND(dbms_random.value(100, 1000)), -- 재고 수량
      i || '번째 상품설명', -- 상품 설명
      3000, -- 배송비
      ROUND(dbms_random.value(100, 1000)), -- 판매 수량
      sysdate -- 입고일
    );
  END LOOP;
END;

-- 상품 태그 생성 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO product_tag (
        product_no,
        tag_no
    ) VALUES (
      i, -- 1부터 100까지 순서대로 
      ROUND(dbms_random.value(1,8)) --1부터 8중 하나의 태그를 부여 
    );
  END LOOP;
END;


commit;