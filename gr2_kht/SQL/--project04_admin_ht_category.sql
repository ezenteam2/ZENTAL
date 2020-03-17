SELECT * FROM P4ITEM_CATEGORY ;
SELECT * FROM P4COUPON;
SELECT * FROM P4GRADE;
SELECT * FROM P4ADMIN;
SELECT * FROM P4MEMBER;
SELECT * FROM P4POINT;
SELECT * FROM P4MEMCOUPON;
SELECT * FROM P4CAROUSEL;
SELECT * FROM P4RECOMMEND;
SELECT * FROM P4ALARM;
SELECT * FROM P4EMONEY;
SELECT * FROM P4FAQ;
SELECT * FROM P4FAVOR_ITEM;
SELECT * FROM P4FOLLOW;
SELECT * FROM P4ITEM_QUERY;
SELECT * FROM P4MANAGE_INCOME;
SELECT * FROM P4NOTICE;
SELECT * FROM P4QNA;
SELECT * FROM P4RENT_ITEM;
SELECT * FROM P4RENTAL;
SELECT * FROM P4REPORT;
SELECT * FROM P4REQ_ITEM;



SELECT * FROM P4ITEM_CATEGORY;

/* 카테고리 리스트 */

SELECT CATE_DATE, CATE_ORDER, CATE_IMG, CATE_TITLE
FROM P4ITEM_CATEGORY
ORDER BY CATE_ORDER;

/* 카테고리 삭제 */

DELETE
FROM P4ITEM_CATEGORY
WHERE CATE_CODE = '12000000';

/* 카테고리 순서 변경 */

UPDATE P4ITEM_CATEGORY
SET CATE_ORDER = 8
WHERE CATE_CODE = 12000007;

/* 카테고리 등록 */

INSERT INTO P4ITEM_CATEGORY VALUES (CATE_CODE_SEQ.nextval, sysdate, '자동차', 10, 'www.ezenimgserver.com/cateimg10');

COMMIT;