-- CRYPTPACK 관련
-- 출처 : https://blog.naver.com/PostView.nhn?blogId=eureka6846&logNo=110076105943

-- 1. SYS 계정으로 권한 부여
grant execute on DBMS_CRYPTO to SAGYO;
-- [출처] 오라클 암호화 복호화 초간단 예제(dbms_crypto 편) 10G|작성자 유레카

-- 2. CRPYTPACK 껍데기 만들기
CREATE OR REPLACE PACKAGE CRYPTPACK
IS
    FUNCTION ENCRYPT (
        input_string        IN  VARCHAR2 ,
        key_data IN VARCHAR2 := '12345678'
    ) RETURN RAW;
    
    FUNCTION DECRYPT (
        input_string        IN  VARCHAR2 ,
        key_data IN VARCHAR2 := '12345678'
    ) RETURN VARCHAR2;
END CRYPTPACK;


-- 3. 실제 BODY 구성
CREATE OR REPLACE PACKAGE BODY CRYPTPACK
IS
-- 에러 발생시에 error code 와 message 를 받기 위한 변수 지정.
    SQLERRMSG   VARCHAR2(255);
    SQLERRCDE   NUMBER;

-- 암호화 함수 선언 key_data 는 입력하지 않을 시에 default 로 12345678 로 지정됨.
    FUNCTION encrypt (input_string IN VARCHAR2 , key_data IN VARCHAR2 := '12345678') 
     RETURN RAW
    IS
    
        key_data_raw        RAW(64);
        converted_raw       RAW(64);
        encrypted_raw       RAW(64);

    BEGIN

-- 들어온 data 와 암호키를 각각 RAW 로 변환한다.
        converted_raw := UTL_I18N.STRING_TO_RAW(input_string, 'AL32UTF8');
        key_data_raw     := UTL_I18N.STRING_TO_RAW(key_data, 'AL32UTF8');

-- DBMS_CRYPTO.ENCRYPT 로 암호화 하여 encrypted_raw 에 저장.
        encrypted_raw := 
             DBMS_CRYPTO.ENCRYPT(
                 src => converted_raw ,
-- typ 부분만 변경하면 원하는 알고리즘을 사용할 수 있다. 
--단, key value bype 가 다 다르니 확인해야 한다.
                 typ => DBMS_CRYPTO.DES_CBC_PKCS5 ,
                 key => key_data_raw ,
                 iv =>  NULL);
        
        RETURN encrypted_raw;
    END encrypt;

    FUNCTION decrypt (input_string IN VARCHAR2 , key_data IN VARCHAR2 := '12345678') 
     RETURN VARCHAR2
    IS
        converted_string    VARCHAR2(64);
        key_data_raw        RAW(64);
        decrypted_raw    VARCHAR2(64);

    BEGIN

        key_data_raw     := UTL_I18N.STRING_TO_RAW(key_data, 'AL32UTF8');
        
        decrypted_raw := 
            DBMS_CRYPTO.DECRYPT(
                 src => input_string ,
                 typ => DBMS_CRYPTO.DES_CBC_PKCS5 ,
                 key => key_data_raw ,
                 iv =>  NULL);

-- DBMS_CRYPTO.DECRYPT 수행 결과 나온 복호화된 raw data 를 varchar2 로 변환하면 끝!
        converted_string := UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8');

        RETURN converted_string;
    END decrypt ;
END CRYPTPACK;


-- 4. 예전에 쓰던 암호화 방식이랑 달라서 비밀번호 칸을 좀 늘려줘야 함.
alter table login modify (pwd VARCHAR2(40));