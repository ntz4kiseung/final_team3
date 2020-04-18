SELECT 'CREATE SEQUENCE "' || TABLE_NAME || '_SEQ" NOCACHE;' FROM user_tables;

CREATE SEQUENCE "FAQ_SEQ" NOCACHE;
CREATE SEQUENCE "NOTICE_SEQ" NOCACHE;
CREATE SEQUENCE "DIRECT_QUESTION_SEQ" NOCACHE;
CREATE SEQUENCE "USER_ADDR_SEQ" NOCACHE;
CREATE SEQUENCE "USER_SUB_SEQ" NOCACHE;

CREATE SEQUENCE "DEL_USER_SEQ" NOCACHE;
CREATE SEQUENCE "FOLLOW_SEQ" NOCACHE;
CREATE SEQUENCE "USER_INTEREST_SEQ" NOCACHE;
CREATE SEQUENCE "USER_CERTIFICATION_SEQ" NOCACHE;
CREATE SEQUENCE "DEL_MESSAGE_SEQ" NOCACHE;

CREATE SEQUENCE "DEL_POST_SEQ" NOCACHE;
CREATE SEQUENCE "REPORT_POST_SEQ" NOCACHE;
CREATE SEQUENCE "REPORT_JOIN_SEQ" NOCACHE;
CREATE SEQUENCE "DEL_JOIN_SEQ" NOCACHE;
CREATE SEQUENCE "REVIEW_SUB_SEQ" NOCACHE;

CREATE SEQUENCE "DEL_REPLY_SEQ" NOCACHE;
CREATE SEQUENCE "REPORT_REPLY_SEQ" NOCACHE;