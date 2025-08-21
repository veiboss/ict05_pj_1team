-- 회원가입
INSERT INTO MEMBER_TB(MB_ID, 
						MB_NAME, 
						MB_EMAIL, 
						MB_PASSWORD, 
						MB_REG_DATE)
VALUES((SELECT NVL(max(MB_ID)+1, 1) FROM MEMBER_TB), 
		#{MB_NAME}, 
		#{MB_EMAIL}, 
		#{MB_PASSWORD}, 
		sysdate)

-- 로그인
SELECT COUNT(*) FROM MEMBER_TB 
 WHERE MB_EMAIL=#{MB_EMAIL}
   AND MB_PASSWORD=#{MB_PASSWORD}

-- 마이페이지
SELECT MB_NAME
	 , MB_EMAIL
  FROM MEMBER_TB
 WHERE MB_ID = #{MB_ID};

-- 내 설문 목록
SELECT MBS_ID
	 , MBS_SERVEY_DATE
  FROM MEMBER_SURVEY_TB 
 WHERE MB_ID = '';

-- 내 설문 결과 점수
SELECT MBS_SCORE
  FROM MEMBER_SURVEY_TB
 WHERE MB_ID = '';
  
-- 내 영양제 목록
SELECT MBD_DRUG_NAME
	 , MBD_DRUG_EFFECT
  FROM MEMBER_DRUG_TB
 WHERE MB_ID = '';

DELETE FROM MEMBER_DRUG_TB
 WHERE MBD_ID = '';

-- 내가 쓴 QnA 목록
SELECT QA_TITLE
	 , QA_CONTENT
  FROM QNA_TB
  WHERE MB_ID = '';

UPDATE QNA_TB
   SET QA_SHOW = 'N'
WHERE QA_ID = '';

-- 프로필 수정
SELECT MB_NAME
	 , MB_EMAIL
  FROM MEMBER_TB
 WHERE MB_ID = '';

UPDATE MEMBER_PROFILE_TB
   SET MBP_HEIGHT
     , MBP_WEIGHT
     , MBP_AGE
     , MBP_DISEASE
     , MBP_INT_PILL
 WHERE MBP_ID = #{MBP_ID}; 

-- 프로필 수정 > 탈퇴
SELECT COUNT(*) FROM MEMBER_TB 
 WHERE MB_PASSWORD = #{MB_PASSWORD}

-- 마이 > 내가 쓴 후기 > 수정
UPDATE RV_RATING
   SET RV_RATING = #{RV_RATING}
     , RV_CONTENT = #{RV_CONTENT}
 WHERE RV_ID = #{RV_ID}

-- 마이 > 내가 쓴 후기 > 삭제
UPDATE REVIEW_TB
   SET RV_SHOW = 'N'
 WHERE RV_ID = #{RV_ID}

-- 마이 > 내가 쓴 후기
SELECT rv.*,
       dr.DR_PRODUCT
  FROM REVIEW_TB rv
  JOIN DRUG_TB dr
    ON rv.DR_ID = dr.DR_ID
 WHERE rv.MB_NAME=#{MB_NAME}
 
-- FAQ 화면, 상세
SELECT FA_TITLE
    , FA_CONTENT
    , FA_ID
    , FA_WRITER_ID
    , FA_REG_DATE
  FROM FAQ_TB
 WHERE FA_SHOW = 'Y';

-- 영양제 검색
SELECT DR_PRODUCT
    , DR_MAIN_FUNCTION
  FROM DRUG_TB
 WHERE DR_MAIN_FUNCTION LIKE '%입력값%';

INSERT INTO MEMBER_DRUG_TB(DR_ID
                   , MBD_DRUG_NAME
                   , MBD_DRUG_EFFECT)
         VALUES (SELECT dt.DR_ID
                   , dt.DR_PRODUCT
                   , dt.DR_MAIN_FUNCTION
                 FROM DRUG_TB dt);

-- 영양제 상세
SELECT dt.DR_PRODUCT
    , dt.DR_ENTERPRISE
    , dt.DR_MAIN_FUNCTION
    , dt.DR_SERVE_USE
    , dt.DR_INTAKE_HINT
    , dt.DR_PRESERVATION
    , dt.DR_EXPIRATION_DATE
    , dt.DR_ID
  FROM DRUG_TB dt
 WHERE dt.DR_ID = dt.DR_ID;

SELECT rt.RV_ID
    , rt.MB_NAME
    , rt.RV_CONTENT
    , rt.RV_RATING
    , rt.RV_REG_DATE
  FROM REVIEW_TB rt
 WHERE rt.RV_SHOW = 'Y'
   AND rt.DR_ID = dt.DR_ID;

-- 영양제 상세, 후기 작성
INSERT INTO MEMBER_DRUG_TB (
    MBD_ID,
    MB_ID,
    DR_ID,
    MBD_DRUG_NAME,
    MBD_DRUG_EFFECT,
    MBD_WRITER_ID,
    MBD_REG_DATE
)
VALUES (
    (SELECT NVL(MAX(MBD_ID)+1, 1) FROM MEMBER_DRUG_TB),
    :mb_id,
    :dr_id,
    (SELECT DR_PRODUCT FROM DRUG_TB WHERE DR_ID = :dr_id),
    :effect_clob,          
    :writer_id,            
    SYSDATE
);

-- 전문가 Q&A
-- Q&A 메인
SELECT * 
  FROM (SELECT A.*
            , rownum AS rn 
          FROM (SELECT * 
                  FROM QNA_TB 
                 WHERE QA_SHOW = 'Y' 
                 ORDER BY QA_ID DESC) A) 
         WHERE rn BETWEEN #{start} AND #{end};
-- Q&A 답변 여부
SELECT COUNT(*) AS cnt 
  FROM QNA_TB 
 WHERE QA_SHOW = 'Y'

-- Q&A 글쓰기
INSERT INTO QNA_TB (QA_ID
              , MB_ID
              , QA_WRITER_ID
              , QA_TITLE
              , QA_CONTENT
              , QA_PRIVATE
              , QA_REG_DATE)
   VALUES ((SELECT NVL(MAX(QA_ID) + 1, 1) FROM QNA_TB)
         , MB_ID
         , QA_WRITER_ID
         , QA_TITLE
         , QA_CONTENT
         , QA_PRIVATE
         , SYSDATE);

-- Q&A 상세화면
SELECT qt.QA_ID
    , qt.QA_TITLE
    , qt.QA_CONTENT
    , qt.MB_ID
    , qt.QA_ANSWER
    , qt.QA_ANSWER_DATE
    , qt.QA_REG_DATE
    , qt.QA_PRIVATE
  FROM QNA_TB qt;
-- Q&A 상세화면 - 조회수 증가
UPDATE QNA_TB qt 
          SET QA_READCOUNT = QA_READCOUNT + 1 
        WHERE QA_ID = QA_ID;

-- Q&A 전문가 댓글작성
UPDATE QNA_TB
       SET QA_ANSWER      = #{qa_answer}
         , QA_ANSWER_DATE = SYSDATE
         , QA_MODIFY_ID   = #{qa_modify_id}
         , QA_MODIFY_DATE = SYSDATE
     WHERE QA_ID = #{qa_id};

-- 홈-설문 (로그인 o 홈화면)
SELECT 
    m.MB_ID,
    m.MB_NAME,
    s.MBS_ID,
    s.MBS_SCORE,
    s.MBS_REG_DATE
FROM MEMBER_TB m
JOIN MEMBER_SURVEY_TB s
  ON m.MB_ID = s.MB_ID
WHERE m.MB_ID = :member_id
ORDER BY s.MBS_REG_DATE DESC;

-- 홈-설문 (프로필 질문)

INSERT INTO MEMBER_PROFILE_TB (
    MBP_ID,
    MB_ID,
    MBS_ID,
    MBP_HEIGHT,
    MBP_WEIGHT,
    MBP_AGE,
    MBP_DISEASE,
    MBP_INT_PILL,
    MBP_WRITER_ID,
    MBP_REG_DATE
) VALUES (
    (SELECT NVL(MAX(MBP_ID)+1, 1) FROM MEMBER_PROFILE_TB),  -- 시퀀스 사용 (PK)
    :mb_id,                      -- 회원 ID (FK)
    :mbs_id,                     -- 설문 ID (FK, 필요 없으면 NULL 가능)
    :height,                     -- 키
    :weight,                     -- 몸무게
    :age,                        -- 나이
    :disease,                    -- 기저질환
    :interest_pill,              -- 관심 약
    :writer_id,                  -- 작성자 (보통 자기 자신의 MB_ID)
    SYSDATE                      -- 등록일 (현재 시간)
);

-------------------------------------------------------------------------------
-- 관리자 페이지
-------------------------------------------------------------------------------
-- 영양제 목록
SELECT * 
  FROM (SELECT A.*
            , rownum AS rn 
          FROM (SELECT * 
                  FROM DRUG_TB 
                 WHERE DR_SHOW = 'Y' 
                 ORDER BY DR_ID DESC) A) 
         WHERE rn BETWEEN #{start} AND #{end};
   
-- 영양제 상세
SELECT dt.DR_PRODUCT
    , dt.DR_ENTERPRISE
    , dt.DR_MAIN_FUNCTION
    , dt.DR_SERVE_USE
    , dt.DR_INTAKE_HINT
    , dt.DR_PRESERVATION
    , dt.DR_EXPIRATION_DATE
    , dt.DR_ID
  FROM DRUG_TB dt
 WHERE dt.DR_ID = dt.DR_ID;

SELECT rt.RV_ID
    , rt.MB_NAME
    , rt.RV_CONTENT
    , rt.RV_RATING
    , rt.RV_REG_DATE
  FROM REVIEW_TB rt
 WHERE rt.RV_SHOW = 'Y'
   AND rt.DR_ID = dt.DR_ID;

-- 영양제 등록
INSERT INTO DRUG_TB (
	DR_ID,
	DR_ENTERPRISE,
	DR_PRODUCT,
	DR_STATEMENT_ID,
	DR_REGIST_DATE,
	DR_EXPIRATION_DATE,
	DR_SUNGSANG,
	DR_SERVE_USE,
	DR_INTAKE_HINT,
	DR_MAIN_FUNCTION,
	DR_PRESERVATION,
	DR_BASE_STANDARD)
	VALUES (
		#{DR_ID},
		#{DR_ENTERPRISE},
		#{DR_PRODUCT},
		#{DR_STATEMENT_ID},
		#{DR_REGIST_DATE},
		#{DR_EXPIRATION_DATE},
		#{DR_SUNGSANG},
		#{DR_SERVE_USE},
		#{DR_INTAKE_HINT},
		#{DR_MAIN_FUNCTION},
		#{DR_PRESERVATION},
		#{DR_BASE_STANDARD}
	);

-- 영양제 수정
SELECT 	DR_ID,
		DR_ENTERPRISE,
		DR_PRODUCT,
		DR_STATEMENT_ID,
		DR_REGIST_DATE,
		DR_EXPIRATION_DATE,
		DR_SUNGSANG,
		DR_SERVE_USE,
		DR_INTAKE_HINT,
		DR_MAIN_FUNCTION,
		DR_PRESERVATION,
		DR_BASE_STANDARD
  FROM DRUG_TB dt
 WHERE dt.DR_ID = #{DR_ID};

UPDATE DRUG_TB
	SET DR_ENTERPRISE = #{DR_ENTERPRISE},
		DR_PRODUCT = #{DR_PRODUCT},
		DR_STATEMENT_ID = #{DR_STATEMENT_ID},
		DR_REGIST_DATE = #{DR_REGIST_DATE},
		DR_EXPIRATION_DATE = #{DR_EXPIRATION_DATE},
		DR_SUNGSANG = #{DR_SUNGSANG},
		DR_SERVE_USE = #{DR_SERVE_USE},
		DR_INTAKE_HINT = #{DR_INTAKE_HINT},
		DR_MAIN_FUNCTION = #{DR_MAIN_FUNCTION},
		DR_PRESERVATION = #{DR_PRESERVATION},
		DR_BASE_STANDARD = #{DR_BASE_STANDARD}
 WHERE DR_ID = #{DR_ID};

-- 전문가 Q&A
SELECT * 
  FROM (SELECT A.*
            , rownum AS rn 
          FROM (SELECT * 
                  FROM QNA_TB 
                 WHERE QA_SHOW = 'Y' 
                 ORDER BY QA_ID DESC) A) 
         WHERE rn BETWEEN #{start} AND #{end};

UPDATE QNA_TB
	SET QA_SHOW = 'N'
 WHERE QA_ID = #{QA_ID};

-- FAQ 목록
SELECT * 
  FROM (SELECT A.*
            , rownum AS rn 
          FROM (SELECT * 
                  FROM FAQ_TB 
                 WHERE FA_SHOW = 'Y' 
                 ORDER BY FA_ID DESC) A) 
         WHERE rn BETWEEN #{start} AND #{end};

-- FAQ 등록
INSERT INTO FAQ_TB (
   FA_ID,   
   FA_TITLE,   
   FA_CONTENT,   
   FA_SHOW,   
   FA_WRITER_ID,   
   FA_REG_DATE,   
   FA_MODIFY_ID,   
   FA_MODIFY_DATE)
  VALUES (
        #{FA_ID}
        #{FA_TITLE}
        #{FA_CONTENT}
        #{FA_SHOW}
        #{FA_WRITER_ID}
        #{FA_REG_DATE}
        #{FA_MODIFY_ID}
        #{FA_MODIFY_DATE});
           
-- FAQ 수정
SELECT FA_TITLE
    , FA_CONTENT
  FROM FAQ_TB;
  
UPDATE FAQ_TB 
   SET FA_TITLE, FA_CONTENT;
   
DELETE FROM FAQ_TB
 WHERE FA_ID = '';

-- 회원관리
SELECT *
  FROM MEMBER_TB

DELETE FROM MEMBER_TB
 WHERE MB_ID = '';

