-- CRYPTPACK ����
-- ��ó : https://blog.naver.com/PostView.nhn?blogId=eureka6846&logNo=110076105943

-- 1. SYS �������� ���� �ο�
grant execute on DBMS_CRYPTO to SAGYO;
-- [��ó] ����Ŭ ��ȣȭ ��ȣȭ �ʰ��� ����(dbms_crypto ��) 10G|�ۼ��� ����ī

-- 2. CRPYTPACK ������ �����
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


-- 3. ���� BODY ����
CREATE OR REPLACE PACKAGE BODY CRYPTPACK
IS
-- ���� �߻��ÿ� error code �� message �� �ޱ� ���� ���� ����.
    SQLERRMSG   VARCHAR2(255);
    SQLERRCDE   NUMBER;

-- ��ȣȭ �Լ� ���� key_data �� �Է����� ���� �ÿ� default �� 12345678 �� ������.
    FUNCTION encrypt (input_string IN VARCHAR2 , key_data IN VARCHAR2 := '12345678') 
     RETURN RAW
    IS
    
        key_data_raw        RAW(64);
        converted_raw       RAW(64);
        encrypted_raw       RAW(64);

    BEGIN

-- ���� data �� ��ȣŰ�� ���� RAW �� ��ȯ�Ѵ�.
        converted_raw := UTL_I18N.STRING_TO_RAW(input_string, 'AL32UTF8');
        key_data_raw     := UTL_I18N.STRING_TO_RAW(key_data, 'AL32UTF8');

-- DBMS_CRYPTO.ENCRYPT �� ��ȣȭ �Ͽ� encrypted_raw �� ����.
        encrypted_raw := 
             DBMS_CRYPTO.ENCRYPT(
                 src => converted_raw ,
-- typ �κи� �����ϸ� ���ϴ� �˰����� ����� �� �ִ�. 
--��, key value bype �� �� �ٸ��� Ȯ���ؾ� �Ѵ�.
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

-- DBMS_CRYPTO.DECRYPT ���� ��� ���� ��ȣȭ�� raw data �� varchar2 �� ��ȯ�ϸ� ��!
        converted_string := UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8');

        RETURN converted_string;
    END decrypt ;
END CRYPTPACK;


-- 4. ������ ���� ��ȣȭ ����̶� �޶� ��й�ȣ ĭ�� �� �÷���� ��.
alter table login modify (pwd VARCHAR2(40));