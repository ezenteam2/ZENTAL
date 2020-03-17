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

/* 현재 등급 표시 */
SELECT MEM_GRADE 
FROM P4MEMBER
WHERE MEM_ID = 'userezenhj11';


/* 등급별 조건 및 혜택 보기 일반 */

SELECT GRADE_IMG, GRADE_TITLE, GRADE_CONDITION, GRADE_BENE
FROM P4GRADE pg 
WHERE GRADE_TITLE = '일반';

/* 등급별 조건 및 혜택 보기 실버 */

SELECT GRADE_IMG, GRADE_TITLE, GRADE_CONDITION, GRADE_BENE
FROM P4GRADE pg 
WHERE GRADE_TITLE = '실버';

/* 등급별 조건 및 혜택 보기 골드 */

SELECT GRADE_IMG, GRADE_TITLE, GRADE_CONDITION, GRADE_BENE
FROM P4GRADE pg 
WHERE GRADE_TITLE = '골드';

/* 등급별 조건 및 혜택 보기 VIP */

SELECT GRADE_IMG, GRADE_TITLE, GRADE_CONDITION, GRADE_BENE
FROM P4GRADE pg 
WHERE GRADE_TITLE = 'VIP';

/* 등급별 조건 및 혜택 보기 VVIP */

SELECT GRADE_IMG, GRADE_TITLE, GRADE_CONDITION, GRADE_BENE
FROM P4GRADE pg 
WHERE GRADE_TITLE = 'VVIP';

