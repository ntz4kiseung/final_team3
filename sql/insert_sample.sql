------------------------------------------------------ ��� ------------------------------------------------------

--�� ROLE ���̺� INSERT ������
INSERT INTO ROLE(ROLEID, ROLENAME)
VALUES('RL00001','������');
INSERT INTO ROLE(ROLEID, ROLENAME)
VALUES('RL00002','ȸ��');

--�� FAQ ���̺� INSERT ������
INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'��û�� ������ ��� Ȯ���ϳ���?','�α��� �� �������������� ��û������ Ȯ���Ҽ� �ֽ��ϴ�.:)',TO_DATE('2019-07-03','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'������ �ؾ���ȴµ� ��� �ϳ���?','���̵�/��й�ȣ ã�� �޴��� ���� ������ ã���Ǽ� �ֽ��ϴ�. ��Ÿ ���ǻ����� �����ͷ� ���� �ֽø� ���� ó�� ���͵帮�ڽ��ϴ�.:)',TO_DATE('2019-07-01','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'�ı� ������ ��� �ϳ���? ','�ı������ sagyo ��å�� �Ұ��� �մϴ� ^^ �ı⸦ ����Ƕ��� ������ �����ֽñ� �ٶ��ϴ� :)',TO_DATE('2019-06-24','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'�̷� SAGYO�� �Ǿ����� ���ھ��!','���� SAGYO�� ���� ���̵� ���������� �������Ŵٸ� ���� �米 �����ͷ� �����ֽñ� �ٶ��ϴ� :)',TO_DATE('2019-05-23','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'�ο� ������ �ȵǳ���?','������ �ο����� ����Ǵ� SAGYO��  �ο� ������ ��ƽ��ϴ�. ������û(����û) �Ͻø� ����� �߻��� ������ �����ϴ� ���� ��Ź�帳�ϴ� :)',TO_DATE('2019-05-22','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'�����ִ� ������ �ȷο��ϸ� ���� �޶�������?','�����ִ� ������ �ȷο��ϸ� �ش� ������ ���� ���ֽ� ���� ������ ���� �����ϰ� ���� �� �ֽ��ϴ� :)',TO_DATE('2019-05-02','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'������ �����ϰ� ������.. ���� ȣ��Ʈ�� �� �� �������?','�米�� ������ ȸ���̶�� ������ ���Ӱ��� �� ������ �����մϴ� :)',TO_DATE('2019-05-01','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'�� ����� ���� �� ���� ��û�� �� �ֳ���?','�米�� 1�δ� 1���� ��Ģ�� �ؼ��ϰ� �ֽ��ϴ�. �� ����� �������� ������û�� �ϴ°��� �Ұ��� �մϴ�.',TO_DATE('2019-04-15','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'���ɻ�� �����ΰ���?','ȸ������ �����Ͻ� ���ɻ翡 ���� ȸ���Ե鿡�� �˸��� ������ ���� ���̰� �˴ϴ�. ���ɻ縦 �Է��Ҷ��� �����ϰ� �Է��� �ּ��� ^^ ',TO_DATE('2019-04-01','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'ȸ��Ż��� ��� �ϳ���?','������>ȸ��Ż�� ���� Ŭ���Ͻø� ȸ��Ż�� �����ϽǼ� �ֽ��ϴ�. ',TO_DATE('2019-03-22','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'ȸ�������� ��� �����ϳ���?','[����������]���� ȸ������ ���� ���� Ŭ���Ͻø� ȸ�������� �ٲٽǼ� �ֽ��ϴ�. ���̵�� ���� �Ұ��Ͽ��� ���� ���� ��Ź�帳�ϴ� :)',TO_DATE('2019-02-01','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'������ ������ �絵�ϰ������ �����Ѱ���?','������ ������ �絵�� �Ұ����մϴ�. ',TO_DATE('2019-01-22','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'��ȸ���� �米�� �̿��� �� �ֳ���?','�米�� �Խõ� ��� ������ ȸ������ ���̵� �Ϻκи� ���� �ֽ��ϴ�. ������ ���ؼ��� �米�� �������ּ��� ^^',TO_DATE('2019-01-01','YYYY-MM-DD'));

INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'������(ȣ��Ʈ)���� ������ �� �� �ֳ���?','���� ��û�� �ڸ�Ʈ �Է¶��� ���� ������ �Ͻ� �� �ֽ��ϴ�',TO_DATE('2018-12-24','YYYY-MM-DD'));


INSERT INTO FAQ(ID,TITLE, CONTENTS, FAQDATE)
VALUES(FAQ_SEQ.NEXTVAL,'�米(SAGYO)��? ','�米(SAGYO)�� �Ҽ� ���̴� �÷��� �Դϴ�.
���ɻ簡 ����� ������� ��� �����ϸ� �� �ູ�� �ϻ��� ����������� �����ִ� ���� �÷��� �Դϴ�. �米�� ���� ��ģ �ϻ�ӿ��� Ȱ���� ã�� �ٶ��ϴ�:) ',TO_DATE('2018-02-01','YYYY-MM-DD'));



-- FAQ ���̺� INSERT ������ �� 

--�� NOTICE ���̺� INSERT ������
INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'�������� ó����ħ ���� �ȳ�','�������� ó����ħ ���濡 ���Ͽ� �˷��帮���� �մϴ�.

ȸ���Ե鲲���� ����� �������� ó����ħ ������ Ȯ���Ͻð� ���� �̿뿡 ������ ���� �ʵ��� �����Ͽ� �ֽñ� �ٶ��ϴ�.


�� ����� �������� ó����ħ�� 2019�� 5�� 24���ڷ� ����˴ϴ�.



�� �������� ó����ħ ���濡 �����Ͻ��� �ʴ� ���, 


���� �������� ó����ħ �������� ���ϱ��� �米 ȣ��Ʈ �������͸� ���Ͽ� ȸ�翡 �ź��ǻ縦 

ǥ���ϰ� ���� �̿����� ������ �� �� ������, �����ϱ��� ������ �ź� �ǻ縦 ǥ������ �����ô� 

��� ����� �������� ó����ħ�� ������ ������ ���ֵ˴ϴ�.',TO_DATE('2018-02-01','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'����','����',TO_DATE('��¥','YYYY-MM-DD'));


INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'�� ���� ������ � �ð� �ȳ�','2018�� 2�� 15��(��)

- īī���� @SAGYO ���� � (10:00 ~ 15:00)

- ��ȭ ���Ǵ� ����� �ʽ��ϴ�



2018�� 2�� 16��(��)

- �� ���� ������ ��ȭ �� īī������ ��� ����� �ʽ��ϴ�.



2018�� 2�� 17��(��) ~ 2�� 18��(��)

- īī���� @SAGYO ���� � (10:00 ~ 19:00)

- ��ȭ ���Ǵ� ����� �ʽ��ϴ�



�� �� ���� ����, �Ϻ� ���ó���� �Ұ��� �� �ֽ��ϴ�.

�� ���� �� ���� ó���� 2/19(��)���� ���������� ó���� �����Դϴ�.',TO_DATE('2018-02-14','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'5�� ���ޱⰣ ������ ��ð� �ȳ�','�ȳ��ϼ���. ȸ���� :)
�米 �������Դϴ�.


����� ������ ���� 5���� �ٰ��Խ��ϴ�.
�ٷ����� �� �� ��̳� ��ü �޹��� ���Ͽ� ���ް� ���� ���̱⵵ �մϴ�.

����, ���� �Ⱓ �米 ���� �̿뿡 ������ ������ �ʵ��� �米 ������ ������ ���� �ȳ��� �帳�ϴ�.



[5�� ���� �ش���]

1) 5/1 ȭ���� : �ٷ����� ��

2) 5/7 ������ : ��̳� ��ü������

3) 5/22 ȭ���� : ����ź����


[������ ��ð� �ȳ�]

1. �米 ������ īī���� @SAGYO ����
> 10:00 am ~ 14:00 pm

2. ������(02-512-3662) ��ȭ ��� � X

�� �ָ����� �米 ������ īī������ ���� ��˴ϴ�.
�� ����(�ָ� ����)�� ��ȭ ����� ����� �ʽ��ϴ�.


2018�� 5�� �米�� �Բ�
��ſ� ���� �ǽñ� �ٶ��ϴ� :)


�����մϴ�.
�米 ������ �帲',TO_DATE('2018-04-30','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'6�� ������ ������ ����� �ȳ�','�ȳ��ϼ���. ȸ���� :)
�米 �������Դϴ�.


���� ������ �������� �����ϴ� 6���� �ٰ��Խ��ϴ�.
������ �� ���漱�ŷ� ���Ͽ� �ش��Ͽ��� ������ ��ð��� ���� �˴ϴ�.

����, ������ �� ��㿡 ������ ������ �ʵ��� ������ � ������ ���� �ȳ��� �帳�ϴ�.

��

[6�� ������ ����]

1) 6�� 6�� ������ : ������

2) 6�� 13�� ������ : ���漱��


[������ ��ð� �ȳ�]

1. �米 ������ īī���� @sagyo(�米) ����
> 10:00 am ~ 14:00 pm

2. ������ ��ȭ ��� � X

�� �ָ����� �米 ������ īī������ ���� �(10:00 ~ 19:00)�˴ϴ�.
�� ������(�ָ� ����)�� ��ȭ ����� ����� �ʽ��ϴ�.

��


2018�� 6���� �米�� �Բ�
��ſ� ������ �����ñ� �ٶ��ϴ� :)



�����մϴ�.
�米 ������ �帲',TO_DATE('2018-06-01','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'7�� 26�� �米 ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 �������Դϴ�.



�米 ���� ���� ���Ͽ� īī���� �÷���ģ�� �� ��ȭ ����� ������ ���� ���� ��� �����Դϴ�.

7�� 26��(��) 10:00~16:00
16�� ���� ���� �� ���� ó���� 7�� 27��(��)���� ���������� ó���� �����̴� ���� ��Ź�帳�ϴ�.



���� �ؽ��� ������ �ǰ� �����Ͻñ� �ٶ��ϴ�.



�����մϴ�.

�米 ������ �帲',TO_DATE('2018-07-05','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'[�����] �Ͻ����� ���� �̿� �Ұ��� ���� ��� �����帳�ϴ�','�ȳ��ϼ��� ȸ����

�米 ������ �Դϴ�.





8�� 9�� ����� ���� 10�� 30�к��� ���� 1�� 30�б��� �米Web���� �米 ���� ��ü Ȥ�� �Ϻΰ� �˻� �� ������ �ʴ� ������ �߻��Ͽ����ϴ�.





���� �ش� ������ �ذ�Ǿ�����, �米 ���� �̿� �� ������ ��� �˼��մϴ�.





�߰��� ���� ������ �߻����� �ʵ���, ���� �� �ý��� ��ġ���� �Ϸ��Ͽ� ��Ȱ�� ���� �̿��� �����ϰ� �Ǿ����ϴ�.





�ٽ� �ѹ� ������ ��� �˼��ϴٴ� ����� ���� �帮��, ������ �� ���� ���񽺸� �����ϱ� ���� �ּ��� ���ϰڽ��ϴ�.





�߰� ������� �� �ǵ���� �����ôٸ� cs@sagyo.com���� �����ֽø� ���� �亯�帮���� �ϰڽ��ϴ�.





�����մϴ�



- �米 ������ �帲-',TO_DATE('2018-08-09','YYYY-MM-DD'));








-------------------- ���⼭  ���� �Ѳ����� ��Ʈ�� ���� �Ҳ��� 
INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'������(8.15) ������ ���� �ȳ�','�ȳ��ϼ���. ȸ���� :)
�米 �������Դϴ�.





�̹� 8�� 15��(������)���� ������ �޹��� ���Ͽ� ������ � �ð��� ����˴ϴ�.

��㿡 ������ ������ �ʵ��� ������ � ������ ���Ͽ� ���� �帳�ϴ�.

�� �米 App/Web ���񽺴� ���������� �̿��Ͻ� �� �ֽ��ϴ�.


��

[������ ���� � �ȳ�]

1. �米 ������ īī���� @sagyo(�米) ����
> ���� 10:00 ~ ���� 1:00 ����

2. ������ ��ȭ ��� � X

���� ����, ���ǻ����� īī�� �÷���ģ�� @sagyo(�米) Ȥ�� cs@frientrip.com���� �����ֽø� ���������� ó���ص帮���� �ϰڽ��ϴ�.

��


�����մϴ�.
�米 ������ �帲',TO_DATE('2018-08-14 ','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'8�� 30��(��) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 �������Դϴ�.





�米 ���� ���� ���Ͽ� īī���� �÷���ģ�� �� ��ȭ ����� ������ ���� ���� ��� �����Դϴ�.





- 8�� 30��(��) 10:00~16:00





16�� ���� ���Ǵ�

8�� 31��(��)���� ���������� ó���� �����̴� ���� ��Ź�帳�ϴ�.





�����մϴ�.

�米 ������ �帲',TO_DATE('2018-08-29','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'12�� 25��(ȭ����) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 �������Դϴ�.



12�� 25��(ȭ)�� ũ�������� �޹��� ���Ͽ� �����Ͱ� ������ ���� ���� ��� �����Դϴ�.



��㿡 ������ ������ �ʵ��� ���� ��Ź�帳�ϴ�.



��



[�米 ������ � �ð�]

- īī���� : ���� 11:00 ~ ���� 2:00 ����

- ��ȭ ��� : � ����



���� � ����, ���ǻ����� īī�� �÷���ģ�� @sagyo(�米) Ȥ�� cs@frientrip.com���� �����ֽø� ���������� ó���ص帮���� �ϰڽ��ϴ�.



��



��ſ� ���� �����ñ� �ٶ��ϴ� :)



�����մϴ�.

�米 ������ �帲',TO_DATE('2018-12-19 ','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'2019�� 1�� 1��(ȭ����) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 �������Դϴ�.



2019�� 1�� 1��(ȭ����)�� �޹��� ���Ͽ� �����Ͱ� ������ ���� ���� ��� �����Դϴ�.



��㿡 ������ ������ �ʵ��� ���� ��Ź�帳�ϴ�.



��



[�米 ������ � �ð�]

- īī���� : ���� 11:00 ~ ���� 2:00 ����

- ��ȭ��� : � ����



���� � ����, ���ǻ����� īī�� �÷���ģ�� @sagyo(�米) Ȥ�� cs@frientrip.com���� �����ֽø� ���������� ó���ص帮���� �ϰڽ��ϴ�.



��



��ſ� ���� �����ñ� �ٶ��ϴ� :)



�����մϴ�.

�米 ������ �帲',TO_DATE('2018-12-26','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'2019�� ���س�! ���� �� ���� �������� :)','�米 ȸ����!



2018�� �米�� �Բ�



���� ���� ��ȭ�� ������ּż� �����մϴ�



-



2019�� ���س⿡�� ȸ���Ե��� 



�� ���� ������Ȱ�� ����� ����



�ּ��� ���ϴ� �米�� �ǰڽ��ϴ�.



-



���� �� ���� �������� :)



�米 �� ���� �ϵ�',TO_DATE('2018-12-31','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'1�� 3��(�����) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 �������Դϴ�.



�米 ���� ���� ���Ͽ� īī���� �÷���ģ�� �� ��ȭ ����� ������ ���� ���� ��� �����Դϴ�.



<���� � ����>

- 2019�� 1�� 3��(��) 11:00~16:00



16�� ���� ���� �� ���� ó���� 1�� 4��(��)���� ���������� ó���� �����̴� ���� ��Ź�帳�ϴ�.



���� �� ���� �������� :)



�����մϴ�.
�米 ������ �帲',TO_DATE('2019-01-02','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'�� ���ޱⰣ (2/4 ~ 2/6) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 �������Դϴ�.



2/4 (��) ~ 2/6 (��) �� ���� �Ⱓ ���� �米 �����Ͱ� ���� ��� �����Դϴ�.



īī���� �÷���ģ�� ���� ���� ������ ����� �� ������, ���� ���� �� �米 ���� ���� �� ���ǿ� ���� ó�� �� �亯�� ���ѵǴ� ���غ�Ź�帳�ϴ�.





[�米 ������ ���� � �ȳ�]

- 2�� 4�� (��) ~ 2�� 6�� (��)

- īī���� : ���� 11:00 ~ ���� 2:00 ����

- ��ȭ �� ���� ��� �Ұ�





���ǻ����� īī�� �÷���ģ�� @sagyo(�米) ���� �����ֽø� 2/7 ����Ϻ��� ���������� ó���ص帮�ڽ��ϴ�.



��ſ� �� ���� �����ñ� �ٶ��ϴ� :)



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-01-30','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'2�� 14�� (�����) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 �������Դϴ�.



�米 ���� ���� ���Ͽ� īī���� �÷���ģ�� �� ��ȭ ����� ������ ���� ���� ��� �����Դϴ�.



<���� � ����>

- 2019�� 2�� 14��(��) 11:00~16:00



16�� ���� ���� �� ���� ó���� 2�� 15��(��)���� ���������� ó���� �����̴� ���� ��Ź�帳�ϴ�.



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-02-13','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'3�� 1�� (�ݿ���) ������ ���� � �ȳ�','�ȳ��ϼ���, ȸ���� :)

�米 �������Դϴ�.



3�� 1��(�ݿ���)�� ������ ���Ϸ� ���Ͽ� �米 �����Ͱ� ���� ��� �����Դϴ�.



īī�� �÷���ģ���� ���� ���� ������ ����� �� ������, ���� ���� �� �米 ���� ���� � ���� ó�� �� �亯�� ���ѵǴ� ���غ�Ź�帳�ϴ�.



��



[�米 ������ ���� � �ȳ�]

- īī���� : ���� 11:00 ~ ���� 2:00 ����

- ��ȭ �� ���� ��� �Ұ�



���ǻ����� īī�� �÷���ģ�� @sagyo(�米)���� �����ֽø� 3/4 �����Ͽ� ���������� ó���ص帮���� �ϰڽ��ϴ�.



��



��ſ� ���� �����ñ� �ٶ��ϴ�



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-02-27','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'3�� 7�� (�����) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)
�米 �������Դϴ�.



�米 ���� ���� ���Ͽ� īī���� �÷���ģ�� �� ��ȭ ����� ������ ���� ���� ��� �����Դϴ�.



<���� � ����>

- 2019�� 3�� 7��(��) 11:00~16:00



16�� ���� ���� �� ���� ó���� 3�� 8��(��)���� ���������� ó���� �����̴� ���� ��Ź�帳�ϴ�.



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-03-06','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'��ġ��� ���� �̿��� �ż� �� �̿���, �������� ó����ħ ���� �ȳ�','�ȳ��ϼ���.

�米 ������ �Դϴ�.



�׻� �米�� �̿��� �ּż� ����帮��, �米 ��ġ��ݼ��� �̿��� �ż� �� �̿���, �������� ó����ħ ���濡 ���Ͽ� �˷��帮���� �մϴ�.



ȸ���Ե鲲���� �ż��� ����Ʈ�� ��ġ��ݼ��� �̿��� �� �̿���, �������� ó����ħ ���� ������ Ȯ���Ͻð� ���� �̿뿡 ������ ���� �ʵ��� �����Ͽ� �ֽñ� �ٶ��ϴ�.



�� �ż� ��ġ��ݼ��� �̿��� �� ����� �̿���, �������� ó����ħ�� 2019�� 3�� 15���ڷ� ����˴ϴ�.



�� ��ġ��ݼ��� �̿��� �ż� �� �̿���, �������� ó����ħ ���濡 �����Ͻ��� �ʴ� ���, �� �ż� ��ġ��ݼ��� �̿��� �� ���� �̿���, �������� ó����ħ �������� ���ϱ��� �米 ȣ��Ʈ �������͸� ���Ͽ� ȸ�翡 �ź��ǻ縦 ǥ���ϰ� ���� �̿����� ������ �� �� ������, �����ϱ��� ������ �ź� �ǻ縦 ǥ������ �����ô� ��� �ż��� ��ġ��ݼ��� �̿��� �� ���� �̿���, �������� ó����ħ�� ������ ������ ���ֵ˴ϴ�.',TO_DATE('2019-03-08','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'3�� 20�� (��) �米 ������Ʈ ������Ʈ �ȳ�','�ȳ��ϼ��� ȸ����,

�米 �������Դϴ�.



�׻� �米�� �̿��� �ּż� ����帮��, ����(3/20 ��) �米 ������Ʈ�� ������Ʈ �� �����Դϴ�!',TO_DATE('2019-03-20','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'4�� 4�� (�����) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 ������ �Դϴ�.



4�� 4�� (��) 16�ú��� �米 �� ������ ��Ƽ��Ƽ ����(�米)�� ��ⷯ ���ϴ� :)



* �米 ��Ƽ��Ƽ ���̶�?

�米 �� ������ ���� ���� 1�޿� 1��! �米 ��Ƽ��Ƽ�� ����, ���� ü���غ��� ��� ��ȭ�Դϴ�.



�پ��� �米�� �����غ��� �� ���� �米�� ȸ���Ե鲲 �Ұ��� �帱 �� �ֵ��� ������ ���� ���ڽ��ϴ�!



�̷� ����, īī���� �÷���ģ�� �� ��ȭ ����� ������ ���� ���� ��ǿ��� ���� ��Ź�帳�ϴ�



<���� � ����>

- 2019�� 4�� 4��(��) 11:00~16:00



16�� ���� ���� �� ���� ó���� 4�� 5��(��)���� ���������� ó���� �����̴� ���� ��Ź�帳�ϴ�.



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-04-03','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'5�� 1�� (������) ������ ���� � �ȳ�','�ȳ��ϼ���, ȸ���� :)

�米 �������Դϴ�.



5�� 1��(������)�� �ٷ����� ���� �米 �����Ͱ� ���� ��� �����Դϴ�.

īī�� �÷���ģ���� ���� ���� ������ ����� �� ������, ���� ���� �� �米 ���� ���� � ���� ó�� �� �亯�� ���ѵǴ� ���غ�Ź�帳�ϴ�.



��



[�米 ������ ���� � �ȳ�]

- īī���� : ���� 11:00 ~ ���� 2:00 ����

- ��ȭ �� ���� ��� �Ұ�



���ǻ����� īī�� �÷���ģ�� @sagyo(�米)���� �����ֽø� 5/2 ����Ͽ� ���������� ó���ص帮���� �ϰڽ��ϴ�.



��



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-04-29','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'5�� 2�� (�����) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 ������ �Դϴ�.



5�� 2�� (��) 16�ú��� �米 �� ������ ��Ƽ��Ƽ ����(�米)�� ��ⷯ ���ϴ� :)



* �米 ��Ƽ��Ƽ ���̶�?

�米 �� ������ ���� ���� 1�޿� 1��! �米 ��Ƽ��Ƽ�� ����, ���� ü���غ��� ��� ��ȭ�Դϴ�.



�پ��� �米�� �����غ��� �� ���� �米�� ȸ���Ե鲲 �Ұ��� �帱 �� �ֵ��� ������ ���� ���ڽ��ϴ�!

�̷� ����, īī���� �÷���ģ�� �� ��ȭ ����� ������ ���� ���� ��ǿ��� ���� ��Ź�帳�ϴ�



<���� � ����>

- 2019�� 5�� 2��(��) 11:00~16:00



16�� ���� ���� �� ���� ó���� 5�� 3��(��)���� ���������� ó���� �����̴� ���� ��Ź�帳�ϴ�.



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-04-30','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'5�� 6�� (������) ������ ���� � �ȳ�','�ȳ��ϼ���, ȸ���� :)

�米 �������Դϴ�.



5�� 6�� (������)�� ��̳� ��ü �޹��Ϸ� �米 �����Ͱ� ���� ��� �����Դϴ�.

īī�� �÷���ģ���� ���� ���� ������ ����� �� ������, ���� ���� �� �米 ���� ���� � ���� ó�� �� �亯�� ���ѵǴ� ���غ�Ź�帳�ϴ�.



��



[�米 ������ ���� � �ȳ�]

- īī���� : ���� 11:00 ~ ���� 2:00 ����

- ��ȭ �� ���� ��� �Ұ�



���ǻ����� īī�� �÷���ģ�� @sagyo(�米)���� �����ֽø� 5/7 ȭ���Ͽ� ���������� ó���ص帮���� �ϰڽ��ϴ�.



��



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-05-03','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'�������� ó����ħ ���� �ȳ�','�ȳ��ϼ���.

�米 �������Դϴ�.



�׻� �米�� �̿��� �ּż� ����帮��, �米 �������� ó����ħ ���濡 ���Ͽ� �˷��帮���� �մϴ�.



ȸ���Ե鲲���� ����� �������� ó����ħ ������ Ȯ���Ͻð� ���� �̿뿡 ������ ���� �ʵ��� �����Ͽ� �ֽñ� �ٶ��ϴ�.



�� ����� �������� ó����ħ�� 2019�� 5�� 24���ڷ� ����˴ϴ�.



�� �������� ó����ħ ���濡 �����Ͻ��� �ʴ� ���, ���� �������� ó����ħ �������� ���ϱ��� �米 ȣ��Ʈ �������͸� ���Ͽ� ȸ�翡 �ź��ǻ縦 ǥ���ϰ� ���� �̿����� ������ �� �� ������, �����ϱ��� ������ �ź� �ǻ縦 ǥ������ �����ô� ��� ����� �������� ó����ħ�� ������ ������ ���ֵ˴ϴ�.',TO_DATE('2019-05-17','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'6�� 6�� (�����) ������ ���� � �ȳ�','�ȳ��ϼ���, ȸ���� :)

�米 �������Դϴ�.



6�� 6�� (�����)�� ������ ���Ϸ� �米 �����Ͱ� ���� ��� �����Դϴ�.

īī�� �÷���ģ���� ���� ���� ������ ����� �� ������, ���� ���� �� �米 ���� ���� � ���� ó�� �� �亯�� ���ѵǴ� ���غ�Ź�帳�ϴ�.



��



[�米 ������ ���� � �ȳ�]

- īī���� : ���� 11:00 ~ ���� 2:00 ����

- ��ȭ �� ���� ��� �Ұ�



���ǻ����� īī�� �÷���ģ�� @sagyo(�米)���� �����ֽø� 6/7 �ݿ��Ͽ� ���������� ó���ص帮���� �ϰڽ��ϴ�.



��



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-06-04','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'�������� ó����ħ �� ��ġ��� ���� �̿��� ���� �ȳ�','�ȳ��ϼ���, ȸ����.

�米 �������Դϴ�.



�׻� �米�� �̿��� �ּż� ����帮��, �米 �������� ó����ħ �� ��ġ��� ���� �̿��� ���濡 ���Ͽ� �˷��帮���� �մϴ�.

ȸ���Ե鲲���� ����� �������� ó����ħ �� ��ġ��� ���� �̿��� ������ Ȯ���Ͻð� ���� �̿뿡 ������ ���� �ʵ��� �����Ͽ� �ֽñ� �ٶ��ϴ�.



�� ����� �������� ó����ħ �� ��ġ��� ���� �̿����� 2019�� 6�� 12���ڷ� ����˴ϴ�.



�� �������� ó����ħ �� ��ġ��� ���� �̿��� ���濡 �����Ͻ��� �ʴ� ���, �������� ó����ħ �� ��ġ��� ���� �̿��� �������� ���ϱ��� �米 �����͸� ���Ͽ� ȸ�翡 �ź��ǻ縦 ǥ���ϰ� ���� �̿����� ������ �� �� ������, �����ϱ��� ������ �ź� �ǻ縦 ǥ������ �����ô� ��� ����� �������� ó����ħ �� ��ġ��� ���� �̿����� ������ ������ ���ֵ˴ϴ�.



[������ ���� ä��]

- īī�� �÷���ģ�� @sagyo

- �̸��� cs@frientrip.com',TO_DATE('2019-06-11','YYYY-MM-DD'));

INSERT INTO NOTICE(ID,TITLE, CONTENTS, NOTICEDATE)
VALUES(NOTICE_SEQ.NEXTVAL,'6�� 13�� (�����) ������ ���� � �ȳ�','�ȳ��ϼ���. ȸ���� :)

�米 �������Դϴ�.



6�� 13�� (��) 16�ú��� �米 �� ������ ��Ƽ��Ƽ ����(�米)�� ��ⷯ ���ϴ� :)



* �米 ��Ƽ��Ƽ ���̶�?

�米 �� ������ ���� ���� 1�޿� 1��! �米 ��Ƽ��Ƽ�� ����, ���� ü���غ��� ��� ��ȭ�Դϴ�.



�پ��� �米�� �����غ��� �� ���� �米�� ȸ���Ե鲲 �Ұ��� �帱 �� �ֵ��� ������ ���� ���ڽ��ϴ�!

�̷� ����, īī�� �÷���ģ�� �� ��ȭ ����� ������ ���� ���� ��Ǵ� ���� ��Ź�����.



<���� � ����>

- 2019�� 6�� 13�� (��) 11:00~16:00



16�� ���� ���� �� ���� ó���� 6�� 14�� (��)���� ���������� ó���� �����̴� ���� ��Ź�帳�ϴ�.



�����մϴ�.

�米 ������ �帲',TO_DATE('2019-06-11','YYYY-MM-DD'));

-- NOTICE �� 

--�� GENDER ���̺� INSERT ������
INSERT INTO GENDER(GENDERID, GENDER) VALUES('GD00001','����');
INSERT INTO GENDER(GENDERID, GENDER) VALUES('GD00002','����');

--�� ADDR_SI ���̺� INSERT ������
INSERT INTO ADDR_SI(ADDRSIID, ADDRSINAME) VALUES(ADD_ID('ADDR_SI','ADDRSIID','SI'),'����');
INSERT INTO ADDR_SI(ADDRSIID, ADDRSINAME) VALUES(ADD_ID('ADDR_SI','ADDRSIID','SI'),'����');
INSERT INTO ADDR_SI(ADDRSIID, ADDRSINAME) VALUES(ADD_ID('ADDR_SI','ADDRSIID','SI'),'�λ�');
INSERT INTO ADDR_SI(ADDRSIID, ADDRSINAME) VALUES(ADD_ID('ADDR_SI','ADDRSIID','SI'),'��õ');
INSERT INTO ADDR_SI(ADDRSIID, ADDRSINAME) VALUES(ADD_ID('ADDR_SI','ADDRSIID','SI'),'����');

--�� INTEREST_MAIN ���̺� INSERT ������
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'������');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'����'||'&'||'����');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'����'||'&'||'DIY');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'����'||'&'||'����');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'�丮'||'&'||'����');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'�н�');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'���'||'&'||'����ũ');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'��Ƽ'||'&'||'�м�');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'�̵��');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'IT'||'&'||'��ũ');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'�ǰ�'||'&'||'�ְ�');
INSERT INTO INTEREST_MAIN(INTERMAINID, INTERMAINNAME) VALUES(ADD_ID('INTEREST_MAIN','INTERMAINID','IM'),'����');

--�� CERTIFICATION_CATE ���̺� INSERT ������
INSERT INTO CERTIFICATION_CATE(CERTIID, CERTINAME) VALUES(ADD_ID('CERTIFICATION_CATE', 'CERTIID', 'CT'),'ȸ������ �޴��� ����' );
INSERT INTO CERTIFICATION_CATE(CERTIID, CERTINAME) VALUES(ADD_ID('CERTIFICATION_CATE', 'CERTIID', 'CT'),'ȸ������ �̸��� ����' );
INSERT INTO CERTIFICATION_CATE(CERTIID, CERTINAME) VALUES(ADD_ID('CERTIFICATION_CATE', 'CERTIID', 'CT'),'���̵� ã�� �޴��� ����' );
INSERT INTO CERTIFICATION_CATE(CERTIID, CERTINAME) VALUES(ADD_ID('CERTIFICATION_CATE', 'CERTIID', 'CT'),'���̵� ã�� �̸��� ����' );
INSERT INTO CERTIFICATION_CATE(CERTIID, CERTINAME) VALUES(ADD_ID('CERTIFICATION_CATE', 'CERTIID', 'CT'),'��й�ȣ ã�� �޴��� ����' );
INSERT INTO CERTIFICATION_CATE(CERTIID, CERTINAME) VALUES(ADD_ID('CERTIFICATION_CATE', 'CERTIID', 'CT'),'��й�ȣ ã�� �̸��� ����' );

--�� MOOD ���̺� INSERT ������
INSERT INTO MOOD(MOODID, MOODNAME) VALUES(ADD_ID('MOOD','MOODID','MI'),'����');
INSERT INTO MOOD(MOODID, MOODNAME) VALUES(ADD_ID('MOOD','MOODID','MI'),'������');
INSERT INTO MOOD(MOODID, MOODNAME) VALUES(ADD_ID('MOOD','MOODID','MI'),'������');

--�� DRINK ���̺� INSERT ������
INSERT INTO DRINK(DRINKID,DRINK)
VALUES ('DR00001','���ְ���');
INSERT INTO DRINK(DRINKID,DRINK)
VALUES ('DR00002','���ֺҰ���');

--�� STATUS ���̺� INSERT ������
INSERT INTO STATUS(STATUSID, STATUSNAME)
VALUES(ADD_ID('STATUS', 'STATUSID', 'ST'), '���');
INSERT INTO STATUS(STATUSID, STATUSNAME)
VALUES(ADD_ID('STATUS', 'STATUSID', 'ST'), '�������');
INSERT INTO STATUS(STATUSID, STATUSNAME) 
VALUES(ADD_ID('STATUS', 'STATUSID', 'ST'), '����Ȯ��');
INSERT INTO STATUS(STATUSID, STATUSNAME) 
VALUES(ADD_ID('STATUS', 'STATUSID', 'ST'), '��������');

--�� SAME_GENDER ���̺� INSERT ������
INSERT INTO SAME_GENDER(SAMEGENDERID,SAMEGENDER)
VALUES ('SG00001' ,'������');
INSERT INTO SAME_GENDER(SAMEGENDERID,SAMEGENDER)
VALUES ('SG00002' ,'����');

--�� REPORT_CATE ���̺� INSERT ������
INSERT INTO REPORT_CATE(REPORTCATEID, REPORTCATENAME) VALUES(ADD_ID('REPORT_CATE', 'REPORTCATEID', 'RC'),'�弳' );
INSERT INTO REPORT_CATE(REPORTCATEID, REPORTCATENAME) VALUES(ADD_ID('REPORT_CATE', 'REPORTCATEID', 'RC'),'������' );
INSERT INTO REPORT_CATE(REPORTCATEID, REPORTCATENAME) VALUES(ADD_ID('REPORT_CATE', 'REPORTCATEID', 'RC'),'�ҹ��ڷ�' );
INSERT INTO REPORT_CATE(REPORTCATEID, REPORTCATENAME) VALUES(ADD_ID('REPORT_CATE', 'REPORTCATEID', 'RC'),'���ԡ�����' );
INSERT INTO REPORT_CATE(REPORTCATEID, REPORTCATENAME) VALUES(ADD_ID('REPORT_CATE', 'REPORTCATEID', 'RC'),'�Ǹ� ħ��' );
INSERT INTO REPORT_CATE(REPORTCATEID, REPORTCATENAME) VALUES(ADD_ID('REPORT_CATE', 'REPORTCATEID', 'RC'),'��Ÿ' );

--�� REPLY_USER_TYPE ���̺� INSERT ������
INSERT INTO REPLY_USER_TYPE(USERTYPEID, USERTYPENAME) 
VALUES(ADD_ID('REPLY_USER_TYPE', 'USERTYPEID', 'RU'), '������');
INSERT INTO REPLY_USER_TYPE(USERTYPEID, USERTYPENAME) 
VALUES(ADD_ID('REPLY_USER_TYPE', 'USERTYPEID', 'RU'), '��û��');

--�� POINT_CATE ���̺� INSERT ������
INSERT INTO POINT_CATE(BADGEPOINTCATEID, BADGEPOINTCATENAME) VALUES(ADD_ID('POINT_CATE', 'BADGEPOINTCATEID', 'BC'), 'Ī��');
INSERT INTO POINT_CATE(BADGEPOINTCATEID, BADGEPOINTCATENAME) VALUES(ADD_ID('POINT_CATE', 'BADGEPOINTCATEID', 'BC'), '����');
INSERT INTO POINT_CATE(BADGEPOINTCATEID, BADGEPOINTCATENAME) VALUES(ADD_ID('POINT_CATE', 'BADGEPOINTCATEID', 'BC'), '������');
INSERT INTO POINT_CATE(BADGEPOINTCATEID, BADGEPOINTCATENAME) VALUES(ADD_ID('POINT_CATE', 'BADGEPOINTCATEID', 'BC'), 'Ȱ��');




------------------------------------------------------ �ʷ� ------------------------------------------------------

--�� LOGIN ���̺� INSERT ������
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('admin001', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00001');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('B001',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BLUMBALD',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BRADOCUS',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BROGAN',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BAHEELA',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BERMEDA',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BERSON',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BJOREEN',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BLISSET',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('BRATHAID',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('EADWYNDA',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('EDAINE',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('EDROSINK',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('EITLIAS',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('ELLELL',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('ELRONE',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('EREDUI',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('ERVETAN',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('EVERETTE',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('EVROGAN',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('aberine', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('aladanne', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('anlant', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('armelorc', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('adalleif', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('alberic', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('annetia', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('arthisef', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('adiard', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('advice', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('divien', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('dymira', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('degink', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('dweald', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('duwaino', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('dogwen', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('derbonie', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('dunarea', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('dodulla', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('Dagona',CRYPTPACK.ENCRYPT('JAVA006$','JAVA006$'),'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('caroin', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('coimhin', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('channa', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('collerva', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('ciriel', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('cirdan', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('crowen', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('chrigh', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('chiania', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');
INSERT INTO LOGIN(USERID, PWD, ROLEID) VALUES('cointer', CRYPTPACK.ENCRYPT('JAVA006$', 'JAVA006$'), 'RL00002');

--�� ADDR_GU ���̺� INSERT ������
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '������', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '������', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '������', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���ϱ�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���Ǳ�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '������', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���α�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '��õ��', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '�����', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���빮��', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '������', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���۱�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '������', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���빮��', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '������', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���ϱ�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���ʱ�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���ı�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '��������', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '��걸', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '��õ��', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '����', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '���α�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '�߱�', 'SI00001');
INSERT INTO ADDR_GU(ADDRGUID, ADDRGUNAME, ADDRSIID) VALUES(ADD_ID('ADDR_GU', 'ADDRGUID', 'GU'), '�߶���', 'SI00001');

--�� INTEREST_SUB ���̺� INSERT ������
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'Ŭ���̹�','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�з��۶��̵�','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���⽺����','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����'||'&'||'��','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�䰡'||'&'||'�߷�','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ʶ��׽�','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����������','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00001');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ǾƳ�','IM00002');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��Ÿ(�Ǳ�)','IM00002');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00002');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'������'||'&'||'����','IM00002');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����ȭ','IM00002');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����ȭ','IM00002');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'Ķ���׶���'||'&'||'�����','IM00002');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00003');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���װ���','IM00003');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���','IM00003');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���','IM00003');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00003');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���׸���','IM00003');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00004');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��������','IM00004');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00004');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��������','IM00004');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ѽ�','IM00005');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�Ͻ�','IM00005');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ƽþ�����','IM00005');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���','IM00005');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��'||'&'||'�Ѱ�','IM00005');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����ŷ'||'&'||'����Ʈ','IM00005');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'Ŀ��'||'&'||'�ַ�','IM00005');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00006');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�Ϻ���','IM00006');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�߱���','IM00006');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'ö��','IM00006');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��ȸ'||'&'||'����','IM00006');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ڼҼ�','IM00007');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00007');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'������ǰ','IM00007');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ε���','IM00007');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ֽ�','IM00007');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�м�','IM00008');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���'||'&'||'����ũ��','IM00008');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����'||'&'||'�ν�','IM00008');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00009');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��ȭ','IM00009');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���','IM00009');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00009');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��ȭ'||'&'||'�Ҽ�','IM00009');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�����','IM00010');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��','IM00010');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��ǻ��','IM00010');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'��Ʈ��','IM00010');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ɸ�'||'&'||'���','IM00011');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����'||'&'||'������','IM00011');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ְ�','IM00011');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00012');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���Ͼƽþ�','IM00012');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�����ƽþ�'||'&'||'�����ƽþ�','IM00012');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����(�ϡ�����)','IM00012');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'����','IM00012');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�����'||'&'||'��','IM00012');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'�ߵ�'||'&'||'������ī','IM00012');
INSERT INTO INTEREST_SUB(INTERSUBID,INTERSUBNAME,INTERMAINID)
VALUES (ADD_ID('INTEREST_SUB' ,'INTERSUBID','IS'),'���þ�'||'&'||'����'||'&'||'�߾Ӿƽþ�','IM00012');


--�� POINT ���̺� INSERT ������
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '�ųʿ�', 'BC00001', '�ų��ִ� �������', '�ų��ִ� �������2', 'img/�ųʿ�.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '���Ŀ�', 'BC00001', '�����ִ� �������', '�����ִ� �������2', 'img/���Ŀ�.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '���ν�', 'BC00001', '�α��ִ� �������', '�α��ִ� �������2', 'img/���ν�.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '������', 'BC00002', '���ӿ� �����ϴ� �������', '���ӿ� �����ϴ� �������2', 'img/������.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '������', 'BC00002', '���ӿ� �ʴ� �������', '���ӿ� �ʴ� �������2', 'img/������.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '��ų�', 'BC00002', '��ų��� �������', '��ų��� �������2', 'img/��ų�.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '����ֿԴ�', 'BC00002', '������ �������� �������', '������ �������� �������2', 'img/����ֿԴ�.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '���߾�', 'BC00003', '������ ������ �߾ƴ� �������', '������ ������ �߾ƴ� �������2', 'img/���߾�.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '���۹���', 'BC00003', '���� ���忡��', '���� ���忡��2', 'img/���۹���.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '����� ����', 'BC00003', '������ �����ġ�� �������', '������ �����ġ�� �������2', 'img/���������.png', '3');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '����', 'BC00004', '���񿡰�', '���񿡰�2', 'img/����.png', '5');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '�Ϲ� ������', 'BC00004', '�Ϲ� ������', '�Ϲ� ������', 'img/�Ϲ�������.png', '15');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '��� ������', 'BC00004', '��� ������', '��� ������', 'img/���������.png', '30');
INSERT INTO POINT(BADGEPOINTID, BADGEPOINTNAME, BADGEPOINTCATEID, BADGEPOINTDESC1, BADGEPOINTDESC2, URL, CONDITION)
VALUES(ADD_ID('POINT', 'BADGEPOINTID', 'BP'), '���� ������', 'BC00004', '���� ������', '���� ������', 'img/����������.png', '50');


------------------------------------------------------ �Ķ� ------------------------------------------------------
--�� ADMIN ���̺� INSERT ������
INSERT INTO ADMIN(USERID) VALUES('admin001');

--�� USER_ESSENTIAL ���̺� INSERT ������
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('Dagona', '��Ƽ��', '�����', TO_DATE('19950617','YYYY-MM-DD'), 'GD00001', '010-3311-3345','Dagona@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('divien', '�Ǿ�', '�̻��', TO_DATE('19920820','YYYY-MM-DD'), 'GD00002', '010-3122-3665','divien@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('dymira', 'ġ�Ϳ�', '���ȣ', TO_DATE('19910707','YYYY-MM-DD'), 'GD00001', '010-3201-3998','dymira@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('degink', '�����', '�ѱ⸰', TO_DATE('19960111','YYYY-MM-DD'), 'GD00001', '010-3457-3652','degink@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('dweald', 'ȣ����', '�̼���', TO_DATE('19930401','YYYY-MM-DD'), 'GD00002', '010-3222-3244','dweald@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('duwaino', '����', '���ټ�', TO_DATE('19901212','YYYY-MM-DD'), 'GD00002', '010-3211-3111','duwaino@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('dogwen', '�Ҵ�', '�����', TO_DATE('19890304','YYYY-MM-DD'), 'GD00001', '010-3454-3874','dogwen@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('derbonie', '�⸰', 'ȫ����', TO_DATE('19941118','YYYY-MM-DD'), 'GD00002', '010-3987-3965','derbonie@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('dunarea', '�罿', '�����', TO_DATE('19970105','YYYY-MM-DD'), 'GD00002', '010-3145-3654','dunarea@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('dodulla', '�ڳ���', '�Ѽ�ȣ', TO_DATE('19960308','YYYY-MM-DD'), 'GD00001', '010-3157-3984','dodulla@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('EADWYNDA', '����', '�����', TO_DATE('19880705','YYYY-MM-DD'), 'GD00002', '010-3788-3112','EADWYNDA@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('EDAINE', '��ѱ�', '������', TO_DATE('19900505','YYYY-MM-DD'), 'GD00002', '010-3554-3665','EDAINE@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('EDROSINK', '�ٶ���', '������', TO_DATE('19960602','YYYY-MM-DD'), 'GD00001', '010-3221-3114','EDROSINK@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('EITLIAS', '����', '��ȣ��', TO_DATE('19980712','YYYY-MM-DD'), 'GD00001', '010-3158-3336','EITLIAS@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('ELLELL', '�����ڱ�', '�ֺ���', TO_DATE('19930404','YYYY-MM-DD'), 'GD00002', '010-3334-3336','ELLELL@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('B001', 'ġŲ', 'ȫ�浿', TO_DATE('20100101','YYYY-MM-DD'), 'GD00001', '010-2001-2001','B001@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BLUMBALD', '����', '����ȣ', TO_DATE('20100102','YYYY-MM-DD'), 'GD00001', '010-2002-2002','BLUMBALD@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BRADOCUS', '����', '��ǥ��', TO_DATE('20100103','YYYY-MM-DD'), 'GD00001', '010-2003-2003','BRADOCUS@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BROGAN', '������', '������', TO_DATE('20100104','YYYY-MM-DD'), 'GD00001', '010-2004-2004','BROGAN@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BAHEELA', '���', '�ջ���', TO_DATE('20100105','YYYY-MM-DD'), 'GD00001', '010-2005-2005','BAHEELA@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BERMEDA', '����', '������', TO_DATE('20100101','YYYY-MM-DD'), 'GD00001', '010-2006-2006','BERMEDA@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BERSON', '�ܹ���', '������', TO_DATE('20100102','YYYY-MM-DD'), 'GD00001', '010-2007-2007','BERSON@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BJOREEN', '������ũ', '��ǥ��', TO_DATE('20100103','YYYY-MM-DD'), 'GD00001', '010-2008-2008','BJOREEN@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BLISSET', '��ī��', '������', TO_DATE('20100104','YYYY-MM-DD'), 'GD00001', '010-2009-2009','BLISSET@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('BRATHAID', '��������', '����ȯ', TO_DATE('20100105','YYYY-MM-DD'), 'GD00001', '010-2010-2010','BRATHAID@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('anlant', '���δϿ�', '������', TO_DATE('19870429','YYYY-MM-DD'), 'GD00001', '010-1658-1973','anlant@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('aberine', '����Ʈ����', '������', TO_DATE('19930917','YYYY-MM-DD'), 'GD00001', '010-1143-1579','aberine@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('aladanne', '���߽Ž�', '������', TO_DATE('19890422','YYYY-MM-DD'), 'GD00001', '010-1286-1953','aladanne@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('armelorc', '�÷Ͻ�', '�̴ٽ�', TO_DATE('19910217','YYYY-MM-DD'), 'GD00002', '010-1455-1768','armelorc@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('adalleif', '��������', '�μ���', TO_DATE('19950417','YYYY-MM-DD'), 'GD00002', '010-1357-1975','adalleif@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('alberic', '�ö�Ÿ�ʽ�', '������', TO_DATE('19901111','YYYY-MM-DD'), 'GD00001', '010-1224-1678','alberic@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('annetia', 'ī��з�', '�����', TO_DATE('19931225','YYYY-MM-DD'), 'GD00002', '010-1687-1887','annetia@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('arthisef', '����', '������', TO_DATE('19960101','YYYY-MM-DD'), 'GD00001', '010-1957-1562','arthisef@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('adiard', '������', '������', TO_DATE('19940930','YYYY-MM-DD'), 'GD00002', '010-1786-1353','adiard@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('advice', '����Ʈ����', '������', TO_DATE('19901017','YYYY-MM-DD'), 'GD00002', '010-1657-1768','advice@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('ELRONE', '�Ḯ��', '�ѽ���', TO_DATE('19910515','YYYY-MM-DD'), 'GD00001', '010-1657-1697','ELRONE@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('EREDUI', '�޸����', '���־�', TO_DATE('19940722','YYYY-MM-DD'), 'GD00001', '010-1476-1347','EREDUI@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('ERVETAN', '�󺥴�', '������', TO_DATE('20030927','YYYY-MM-DD'), 'GD00001', '010-1579-1798','ERVETAN@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('EVERETTE', '���϶�', '�Ѽ���', TO_DATE('19850311','YYYY-MM-DD'), 'GD00002', '010-1325-1258','EVERETTE@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('EVROGAN', '������', '������', TO_DATE('19940228','YYYY-MM-DD'), 'GD00002', '010-1582-1588','EVROGAN@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('caroin', '���׿��극����', '���̿�', TO_DATE('19930914','YYYY-MM-DD'), 'GD00001', '010-4111-4111','caroin@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('coimhin', '������������', '������', TO_DATE('19930915','YYYY-MM-DD'), 'GD00001', '010-4222-4222','caroin@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('channa', '����ũ����Ʈ', '�����', TO_DATE('19940815','YYYY-MM-DD'), 'GD00002', '010-4333-4333','channa@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('collerva', '�Ͻ�����', '�밡��', TO_DATE('19970215','YYYY-MM-DD'), 'GD00002', '010-4421-4421','collerva@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('ciriel', '�Ϳ�', '�̿���', TO_DATE('19970415','YYYY-MM-DD'), 'GD00002', '010-4522-4521','ciriel@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('cirdan', '�н����꿢����', '������', TO_DATE('19900525','YYYY-MM-DD'), 'GD00001', '010-4626-4561','cirdan@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('crowen', '����ü��', '�赿��', TO_DATE('19941225','YYYY-MM-DD'), 'GD00001', '010-4739-4769','crowen@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('chrigh', '������ġ', '���μ�', TO_DATE('19931105','YYYY-MM-DD'), 'GD00001', '010-4838-4881','chrigh@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('chiania', '�����ý��丮', '������', TO_DATE('19930105','YYYY-MM-DD'), 'GD00001', '010-4942-4588','chiania@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('cointer', '������������', '�缺��', TO_DATE('19930105','YYYY-MM-DD'), 'GD00001', '010-4014-4089','cointer@naver.com',SYSDATE);
INSERT INTO USER_ESSENTIAL(USERID, NICKNAME, NAME, BIRTH, GENDERID, TEL, EMAIL, REGISTERDATE)
VALUES('admin001', '������001', '����', TO_DATE('19800814','YYYY-MM-DD'), 'GD00001', '010-4111-4111','admin001@naver.com',SYSDATE);

--�� DIRECT_QUESTION ���̺� INSERT ������
INSERT INTO DIRECT_QUESTION(ID, TITLE, USERID, CONTENTS, DIRECTQUESTIONDATE) 
VALUES(DIRECT_QUESTION_SEQ.NEXTVAL, '������� ���߾��', 'B001', 'ǳ���ϰ� �ϴ� ���̴� û���� !', SYSDATE);
INSERT INTO DIRECT_QUESTION(ID, TITLE, USERID, CONTENTS, DIRECTQUESTIONDATE) 
VALUES(DIRECT_QUESTION_SEQ.NEXTVAL, '������̿���', 'BLUMBALD', '�׵��� ���� �󸶳� ưư�ϸ� �׵��� �Ǻΰ� �󸶳� �����ϸ�', SYSDATE);
INSERT INTO DIRECT_QUESTION(ID, TITLE, USERID, CONTENTS, DIRECTQUESTIONDATE) 
VALUES(DIRECT_QUESTION_SEQ.NEXTVAL, '������Դϴ�.', 'BRADOCUS', ' �Ƹ���� �Ҵ㽺���� ���Ÿ� �ξ� �츮 �λ�', SYSDATE);
INSERT INTO DIRECT_QUESTION(ID, TITLE, USERID, CONTENTS, DIRECTQUESTIONDATE) 
VALUES(DIRECT_QUESTION_SEQ.NEXTVAL, '�̻���� �ƴϾ�', 'BROGAN', ' �Ƹ���� �Ҵ㽺���� ����', SYSDATE);
INSERT INTO DIRECT_QUESTION(ID, TITLE, USERID, CONTENTS, DIRECTQUESTIONDATE) 
VALUES(DIRECT_QUESTION_SEQ.NEXTVAL, '�̻���� �½��ϴ�.', 'BAHEELA', '�׵��� �̻��� ���踦 ���� ǰ����', SYSDATE);

--�� USER_ADDR ���̺� INSERT ������
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'B001', 'GU00001');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'Dagona', 'GU00002');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'Dagona', 'GU00018');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BLUMBALD', 'GU00016');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BLUMBALD', 'GU00010');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BLUMBALD', 'GU00023');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BRADOCUS', 'GU00001');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BRADOCUS', 'GU00002');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'anlant', 'GU00017');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BROGAN', 'GU00005');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BROGAN', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BROGAN', 'GU00008');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BAHEELA', 'GU00006');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BAHEELA', 'GU00012');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BERMEDA', 'GU00021');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BERSON', 'GU00022');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BERSON', 'GU00024');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BERSON', 'GU00025');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BJOREEN', 'GU00002');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BJOREEN', 'GU00003');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BJOREEN', 'GU00007');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BLISSET', 'GU00010');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BLISSET', 'GU00015');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'BRATHAID', 'GU00014');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'aberine', 'GU00020');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'aberine', 'GU00019');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EADWYNDA', 'GU00017');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EADWYNDA', 'GU00013');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EADWYNDA', 'GU00012');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EDAINE', 'GU00008');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EDAINE', 'GU00007');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EDROSINK', 'GU00009');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EITLIAS', 'GU00022');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EITLIAS', 'GU00023');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'ELLELL', 'GU00012');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'ELRONE', 'GU00024');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'ELRONE', 'GU00001');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'ELRONE', 'GU00003');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EREDUI', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'ERVETAN', 'GU00006');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'ERVETAN', 'GU00008');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EVERETTE', 'GU00010');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EVROGAN', 'GU00014');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EVROGAN', 'GU00006');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'EVROGAN', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'aladanne', 'GU00005');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'armelorc', 'GU00011');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'armelorc', 'GU00013');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'armelorc', 'GU00015');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'adalleif', 'GU00021');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'adalleif', 'GU00019');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'alberic', 'GU00020');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'annetia', 'GU00015');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'annetia', 'GU00010');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'arthisef', 'GU00005');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'adiard', 'GU00001');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'adiard', 'GU00003');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'adiard', 'GU00002');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'advice', 'GU00002');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'advice', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'advice', 'GU00003');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'divien', 'GU00006');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'divien', 'GU00008');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'divien', 'GU00007');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dymira', 'GU00011');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dymira', 'GU00013');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'degink', 'GU00018');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dweald', 'GU00017');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dweald', 'GU00001');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'duwaino', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dogwen', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dogwen', 'GU00005');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dogwen', 'GU00022');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'derbonie', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dunarea', 'GU00023');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dunarea', 'GU00005');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'dodulla', 'GU00009');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'caroin', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'caroin', 'GU00021');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'caroin', 'GU00019');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'coimhin', 'GU00004');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'channa', 'GU00006');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'channa', 'GU00008');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'channa', 'GU00011');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'collerva', 'GU00013');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'ciriel', 'GU00015');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'ciriel', 'GU00021');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'cirdan', 'GU00022');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'crowen', 'GU00020');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'crowen', 'GU00012');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'crowen', 'GU00017');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'chrigh', 'GU00005');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'chiania', 'GU00024');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'chiania', 'GU00018');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'cointer', 'GU00019');
INSERT INTO USER_ADDR(ID, USERID, ADDRGUID) VALUES(USER_ADDR_SEQ.NEXTVAL, 'cointer', 'GU00005');

--�� USER_SUB ���̺� INSERT ������
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'aberine', 'https://www.facebook.com/aberine', '���� ���̽����� �ϴ� ����Ʈ�����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'Dagona', '���� ��α׸� �ϴ� ��Ƽ���Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'B001', 'https://www.instagram.com/B001', '���� �ν�Ÿ�� �ϴ� ġŲ�Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'caroin', 'https://www.facebook.com/caroin', '���� ���̽����� �ϴ� ���׿��극�����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'coimhin', 'https://blog.naver.com/coimhin', '���� ��α׸� �ϴ� �������������Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'channa', 'https://www.instagram.com/channa', '���� �ν�Ÿ�� �ϴ� ����ũ����Ʈ�Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS)
VALUES(USER_SUB_SEQ.NEXTVAL, 'collerva', 'https://www.facebook.com/collerva');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BLUMBALD', 'https://blog.naver.com/BLUMBALD', '���� ��α׸� �ϴ� �����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BRADOCUS', 'https://www.instagram.com/BRADOCUS', '���� �ν�Ÿ�� �ϴ� �����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BROGAN', 'https://www.facebook.com/BROGAN', '���� ���̽����� �ϴ� �������Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BAHEELA', 'https://blog.naver.com/BAHEELA', '���� ��α׸� �ϴ� ����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'ciriel', 'https://www.instagram.com/ciriel', '���� �ν�Ÿ�� �ϴ� �Ϳ��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'cirdan', 'https://www.facebook.com/cirdan', '���� ���̽����� �ϴ� �н����꿢�����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS)
VALUES(USER_SUB_SEQ.NEXTVAL, 'crowen', 'https://blog.naver.com/crowen');
INSERT INTO USER_SUB(ID, USERID,  INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'chrigh',  '���� �ƹ��͵� ���� ������ġ�Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'divien', 'https://www.facebook.com/divien', '���� ���̽����� �ϴ� �Ǿ��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'dymira', 'https://blog.naver.com/dymira', '���� ��α׸� �ϴ� ġ�Ϳ��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'degink', 'https://www.instagram.com/degink', '���� �ν�Ÿ�� �ϴ� ������Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS)
VALUES(USER_SUB_SEQ.NEXTVAL, 'dweald', 'https://www.facebook.com/dweald');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'duwaino', 'https://blog.naver.com/duwaino', '���� ��α׸� �ϴ� �����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'dogwen', 'https://www.instagram.com/dogwen', '���� �ν�Ÿ�� �ϴ� �Ҵ��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS)
VALUES(USER_SUB_SEQ.NEXTVAL, 'derbonie', 'https://www.facebook.com/derbonie');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'dodulla', 'https://www.instagram.com/dodulla', '���� �ν�Ÿ�� �ϴ� �ڳ����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'chiania', 'https://www.facebook.com/chiania', '���� ���̽����� �ϴ� �����ý��丮�Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'cointer', 'https://blog.naver.com/cointer', '���� ��α׸� �ϴ� �������������Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BERMEDA', 'https://www.instagram.com/BERMEDA', '���� �ν�Ÿ�� �ϴ� �����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BERSON', 'https://www.facebook.com/BERSON', '���� ���̽����� �ϴ� �ܹ����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BJOREEN', 'https://blog.naver.com/BJOREEN', '���� ��α׸� �ϴ� ������ũ�Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BLISSET', 'https://www.instagram.com/BLISSET', '���� �ν�Ÿ�� �ϴ� ��ī���Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'BRATHAID', 'https://www.facebook.com/BRATHAID', '���� ���̽����� �ϴ� ���������Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS)
VALUES(USER_SUB_SEQ.NEXTVAL, 'anlant', 'https://blog.naver.com/anlant');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'aladanne', 'https://www.instagram.com/aladanne', '���� �ν�Ÿ�� �ϴ� ���߽Ž��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'armelorc', 'https://www.facebook.com/armelorc', '���� ���̽����� �ϴ� �÷Ͻ��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS)
VALUES(USER_SUB_SEQ.NEXTVAL, 'adalleif', 'https://blog.naver.com/adalleif');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'alberic', 'https://www.instagram.com/alberic', '���� �ν�Ÿ�� �ϴ� �ö�Ÿ�ʽ��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'annetia', 'https://www.facebook.com/annetia', '���� ���̽����� �ϴ� ī��з��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'arthisef', 'https://blog.naver.com/arthisef', '���� ��α׸� �ϴ� �����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'adiard', 'https://www.instagram.com/adiard', '���� �ν�Ÿ�� �ϴ� �������Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'advice', 'https://www.facebook.com/advice', '���� ���̽����� �ϴ� ����Ʈ�����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID)
VALUES(USER_SUB_SEQ.NEXTVAL, 'EDAINE');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'EDROSINK', 'https://www.facebook.com/EDROSINK', '���� ���̽����� �ϴ� �ٶ����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID)
VALUES(USER_SUB_SEQ.NEXTVAL, 'EITLIAS');
INSERT INTO USER_SUB(ID, USERID)
VALUES(USER_SUB_SEQ.NEXTVAL, 'ELLELL');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'ELRONE', 'https://www.facebook.com/ELRONE', '���� ���̽����� �ϴ� �Ḯ���Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'EREDUI', 'https://blog.naver.com/EREDUI', '���� ��α׸� �ϴ� �޸�����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'ERVETAN', 'https://www.instagram.com/ERVETAN', '���� �ν�Ÿ�� �ϴ� �󺥴��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, SNS, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'EVERETTE', 'https://blog.naver.com/EVERETTE', '���� ��α׸� �ϴ� ���϶��Դϴ�.');
INSERT INTO USER_SUB(ID, USERID)
VALUES(USER_SUB_SEQ.NEXTVAL, 'EVROGAN');
INSERT INTO USER_SUB(ID, USERID, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'EADWYNDA', '���� �ƹ��͵� ���ϴ� �����Դϴ�.');
INSERT INTO USER_SUB(ID, USERID, INTRODUCE)
VALUES(USER_SUB_SEQ.NEXTVAL, 'dunarea', '���� ��α׸� �ϴ� �罿�Դϴ�.');

--�� DEL_USER ���̺� INSERT ������
INSERT INTO DEL_USER(ID,USERID,DELETEDATE)
VALUES(DEL_USER_SEQ.NEXTVAL,'ERVETAN',SYSDATE);
INSERT INTO DEL_USER(ID,USERID,DELETEDATE)
VALUES(DEL_USER_SEQ.NEXTVAL,'adalleif',SYSDATE);
INSERT INTO DEL_USER(ID,USERID,DELETEDATE)
VALUES(DEL_USER_SEQ.NEXTVAL,'BERSON',SYSDATE);
INSERT INTO DEL_USER(ID,USERID,DELETEDATE)
VALUES(DEL_USER_SEQ.NEXTVAL,'dogwen',SYSDATE);
INSERT INTO DEL_USER(ID,USERID,DELETEDATE)
VALUES(DEL_USER_SEQ.NEXTVAL,'cirdan',SYSDATE);

--�� FOLLOW ���̺� INSERT ������
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'B001','cointer',SYSDATE);
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'chiania','Dagona',SYSDATE);
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'BLUMBALD','crowen',SYSDATE);
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'chrigh','BRADOCUS',SYSDATE);
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'EITLIAS','anlant',SYSDATE);   
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'BROGAN','ciriel',SYSDATE);
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'collerva','BAHEELA',SYSDATE);
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'BROGAN','channa',SYSDATE);
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'EVERETTE','advice',SYSDATE);
INSERT INTO FOLLOW(ID,GIVEUSERID,TAKEUSERID,FOLLOWDATE)
VALUES(FOLLOW_SEQ.NEXTVAL,'arthisef','dunarea',SYSDATE);

--�� USER_INTEREST ���̺� INSERT ������
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'B001', 'IS00001');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'B001', 'IS00002');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'Dagona', 'IS00005');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'Dagona', 'IS00007');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BLUMBALD', 'IS00015');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BLUMBALD', 'IS00011');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BLUMBALD', 'IS00010');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BRADOCUS', 'IS00033');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BRADOCUS', 'IS00032');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'anlant', 'IS00062');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'anlant', 'IS00058');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'anlant', 'IS00004');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BROGAN', 'IS00005');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BROGAN', 'IS00012');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BAHEELA', 'IS00009');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BAHEELA', 'IS00013');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BAHEELA', 'IS00015');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BERMEDA', 'IS00017');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BERMEDA', 'IS00016');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BERMEDA', 'IS00014');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BERSON', 'IS00019');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BERSON', 'IS00001');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BJOREEN', 'IS00028');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BJOREEN', 'IS00029');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BLISSET', 'IS00039');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BLISSET', 'IS00040');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BLISSET', 'IS00020');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BRATHAID', 'IS00022');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'BRATHAID', 'IS00018');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'aberine', 'IS00030');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'aberine', 'IS00032');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EADWYNDA', 'IS00021');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EADWYNDA', 'IS00023');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EADWYNDA', 'IS00024');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EDAINE', 'IS00002');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EDROSINK', 'IS00033');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EDROSINK', 'IS00035');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EITLIAS', 'IS00047');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EITLIAS', 'IS00045');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EITLIAS', 'IS00044');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ELLELL', 'IS00051');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ELLELL', 'IS00054');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ELLELL', 'IS00048');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ELRONE', 'IS00059');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ELRONE', 'IS00060');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ELRONE', 'IS00063');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EREDUI', 'IS00064');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EREDUI', 'IS00065');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ERVETAN', 'IS00051');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ERVETAN', 'IS00050');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EVERETTE', 'IS00049');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EVERETTE', 'IS00033');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EVERETTE', 'IS00046');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EVROGAN', 'IS00038');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EVROGAN', 'IS00037');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'EVROGAN', 'IS00031');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'aladanne', 'IS00016');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'aladanne', 'IS00012');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'aladanne', 'IS00010');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'armelorc', 'IS00052');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'armelorc', 'IS00034');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'armelorc', 'IS00035');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'adalleif', 'IS00021');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'adalleif', 'IS00036');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'alberic', 'IS00019');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'alberic', 'IS00024');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'annetia', 'IS00039');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'arthisef', 'IS00015');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'arthisef', 'IS00001');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'arthisef', 'IS00049');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'adiard', 'IS00033');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'adiard', 'IS00004');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'adiard', 'IS00044');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'advice', 'IS00018');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'advice', 'IS00029');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'advice', 'IS00055');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'divien', 'IS00066');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'divien', 'IS00048');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dymira', 'IS00015');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dymira', 'IS00049');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'degink', 'IS00040');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'degink', 'IS00016');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'degink', 'IS00013');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dweald', 'IS00045');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dweald', 'IS00056');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dweald', 'IS00020');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'duwaino', 'IS00003');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'duwaino', 'IS00009');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dogwen', 'IS00017');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dogwen', 'IS00024');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'derbonie', 'IS00034');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'derbonie', 'IS00026');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dunarea', 'IS00015');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dunarea', 'IS00016');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dunarea', 'IS00064');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'dodulla', 'IS00058');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'caroin', 'IS00057');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'caroin', 'IS00019');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'caroin', 'IS00013');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'coimhin', 'IS00024');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'coimhin', 'IS00008');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'coimhin', 'IS00009');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'channa', 'IS00011');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'channa', 'IS00010');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'collerva', 'IS00052');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'collerva', 'IS00043');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'collerva', 'IS00026');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ciriel', 'IS00010');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'ciriel', 'IS00006');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'cirdan', 'IS00001');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'cirdan', 'IS00002');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'crowen', 'IS00006');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'chrigh', 'IS00008');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'chrigh', 'IS00015');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'chrigh', 'IS00062');
INSERT INTO USER_INTEREST(ID, USERID, INTERSUBID) VALUES(USER_INTEREST_SEQ.NEXTVAL, 'chiania', 'IS00051');

--�� USER_CERTIFIVATION ���̺� INSERT ������
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'B001','198587',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'B001','123456',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'B001','456512',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'B001','125442',SYSDATE,'CT00005');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'Dagona','123457',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BLUMBALD','245672',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BRADOCUS','213567',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BRADOCUS','257482',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'anlant','234561',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'anlant','321641',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'anlant','236547',SYSDATE,'CT00005');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BROGAN','123451',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BROGAN','985441',SYSDATE,'CT00004');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BROGAN','445672',SYSDATE,'CT00006');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BAHEELA','123451',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BAHEELA','877452',SYSDATE,'CT00004');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BERMEDA','122341',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BERMEDA','236571',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BERSON','215413',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BERSON','322142',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BJOREEN','366454',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BJOREEN','332141',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BLISSET','231541',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'BRATHAID','123141',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'aberine','231541',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EADWYNDA','123141',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EDAINE','123411',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EDAINE','222342',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EDROSINK','234567',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EDROSINK','336541',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EITLIAS','123456',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EITLIAS','236654',SYSDATE,'CT00005');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EITLIAS','324123',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'ELLELL','213451',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'ELRONE','985112',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EREDUI','784612',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'ERVETAN','123541',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'ERVETAN','233654',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EVERETTE','123541',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EVERETTE','233654',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EVERETTE','784612',SYSDATE,'CT00005');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EVROGAN','123452',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EVROGAN','665412',SYSDATE,'CT00004');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'EVROGAN','788541',SYSDATE,'CT00005');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'aladanne','213451',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'aladanne','874561',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'aladanne','966541',SYSDATE,'CT00006');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'armelorc','123154',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'adalleif','874634',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'alberic','123443',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'annetia','123154',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'arthisef','874634',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'adiard','123443',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'advice','123154',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'advice','123154',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'divien','123154',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'divien','874634',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dymira','123154',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dymira','123443',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'degink','123154',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'degink','874634',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'degink','874634',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dweald','123154',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dweald','123443',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'duwaino','213421',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'duwaino','654712',SYSDATE,'CT00004');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'duwaino','995412',SYSDATE,'CT00006');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dogwen','326541',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dogwen','998541',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'derbonie','326541',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'derbonie','998541',SYSDATE,'CT00005');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dunarea','123452',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dunarea','988541',SYSDATE,'CT00003');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dodulla','123452',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'dodulla','966521',SYSDATE,'CT00004');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'caroin','988541',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'coimhin','123452',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'coimhin','988541',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'channa','123452',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'channa','988541',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'collerva','234581',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'collerva','332145',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'ciriel','234581',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'cirdan','332145',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'cirdan','123451',SYSDATE,'CT00004');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'cirdan','955412',SYSDATE,'CT00006');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'crowen','234581',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'crowen','652142',SYSDATE,'CT00005');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'chrigh','332145',SYSDATE,'CT00001');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'chrigh','955412',SYSDATE,'CT00006');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'chiania','234581',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'cointer','332145',SYSDATE,'CT00002');
INSERT INTO USER_CERTIFICATION(ID,USERID,CODE,CERTIDATE,CERTIID)
VALUES(USER_CERTIFICATION_SEQ.NEXTVAL,'cointer','966541',SYSDATE,'CT00006');

--�� MESSAGE ���̺� INSERT ������
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'caroin', '�������ϵ����! ���׿��극����(caroin) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'coimhin', '�������ϵ����! ������������(coimhin) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'channa', '�������ϵ����! ����ũ����Ʈ(channa) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'collerva', '�������ϵ����! �Ͻ�����(collerva) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'ciriel', '�������ϵ����! �Ϳ�(ciriel) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'cirdan', '�������ϵ����! �н����꿢����(cirdan) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'crowen', '�������ϵ����! ����ü��(crowen) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'chrigh', '�������ϵ����! ������ġ(chrigh) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'chiania', '�������ϵ����! �����ý��丮(chiania) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'cointer', '�������ϵ����! ������������(cointer) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'admin001', '�������ϵ����! ������001(admin001) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'anlant', '�������ϵ����! ���δϿ�(anlant) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'aberine', '�������ϵ����! ����Ʈ����(aberine) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'aladanne', '�������ϵ����! ���߽Ž�(aladanne) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'armelorc', '�������ϵ����! �÷Ͻ�(armelorc) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'adalleif', '�������ϵ����! ��������(adalleif) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'alberic', '�������ϵ����! �ö�Ÿ�ʽ�(alberic) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'annetia', '�������ϵ����! ī��з�(annetia) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'arthisef', '�������ϵ����! ����(arthisef) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'adiard', '�������ϵ����! ������(adiard) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'advice', '�������ϵ����! ����Ʈ����(advice) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'ELRONE', '�������ϵ����! �Ḯ��(ELRONE) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'EREDUI', '�������ϵ����! �޸����(EREDUI) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'ERVETAN', '�������ϵ����! �󺥴�(ERVETAN) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'EVERETTE', '�������ϵ����! ���϶�(EVERETTE) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'EVROGAN', '�������ϵ����! ������(EVROGAN) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'Dagona', '�������ϵ����! ��Ƽ��(Dagona) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'divien', '�������ϵ����! �Ǿ�(divien) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'dymira', '�������ϵ����! ġ�Ϳ�(dymira) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'degink', '�������ϵ����! �����(degink) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'dweald', '�������ϵ����! ȣ����(dweald) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'duwaino', '�������ϵ����! ����(duwaino) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'dogwen', '�������ϵ����! �Ҵ�(dogwen) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'derbonie', '�������ϵ����! �⸰(derbonie) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'dunarea', '�������ϵ����! �罿(dunarea) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'dodulla', '�������ϵ����! �ڳ���(dodulla) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'EADWYNDA', '�������ϵ����! ����(EADWYNDA) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'EDAINE', '�������ϵ����! ��ѱ�(EDAINE) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'EDROSINK', '�������ϵ����! �ٶ���(EDROSINK) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'EITLIAS', '�������ϵ����! ����(EITLIAS) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'ELLELL', '�������ϵ����! �����ڱ�(ELLELL) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'B001', '�������ϵ����! ġŲ(B001) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BLUMBALD', '�������ϵ����! ����(BLUMBALD) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BRADOCUS', '�������ϵ����! ����(BRADOCUS) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BROGAN', '�������ϵ����! ������(BROGAN) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BAHEELA', '�������ϵ����! ���(BAHEELA) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BERMEDA', '�������ϵ����! ����(BERMEDA) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BERSON', '�������ϵ����! �ܹ���(BERSON) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BJOREEN', '�������ϵ����! ������ũ(BJOREEN) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BLISSET', '�������ϵ����! ��ī��(BLISSET) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);
INSERT INTO MESSAGE(MESSAGEID, GIVEUSERID, TAKEUSERID, CONTENTS, SENDDATE, CHECKDATE) VALUES(ADD_ID('MESSAGE', 'MESSAGEID', 'MS'), 'admin001', 'BRATHAID', '�������ϵ����! ��������(BRATHAID) ��! ���� SAGYO�� ����ּ���!', SYSDATE, SYSDATE);

--�� POST ���̺� INSERT ������
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'aberine', '�౸�� ���� �߰ſ� ����', 'GU00001', 'IS00003', TO_DATE('20190705','YYYY-MM-DD'), SYSDATE, '�츮 �౸�� ���� �����ϰ� ����� �غ���.', 'MI00001', 1, 2, 4, 'DR00001', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'BLUMBALD', '�󱸿� ���� ������ ���', 'GU00001', 'IS00003', TO_DATE('20190705','YYYY-MM-DD'), SYSDATE, '�츮 �౸�� ���� �����ϰ� ����� �غ���.', 'MI00002', 1, 2, 4, 'DR00001', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'BROGAN', '������ ���� ������ ���', 'GU00001', 'IS00003', TO_DATE('20190705','YYYY-MM-DD'), SYSDATE, '�츮 �౸�� ���� �����ϰ� ����� �غ���.', 'MI00002', 1, 2, 4, 'DR00001', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'EVERETTE', '�߱��� ���� ������ ���', 'GU00003', 'IS00003', TO_DATE('20190627','YYYY-MM-DD'), SYSDATE, '�츮 �߱��� ���� �����ϰ� ����� �غ���.', 'MI00002', 1, 2, 4, 'DR00001', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'EVROGAN', '�״Ͻ��� ���� ������ ���', 'GU00004', 'IS00003', TO_DATE('20190701','YYYY-MM-DD'), SYSDATE, '�츮 �״Ͻ��� ���� �����ϰ� ����� �غ���.', 'MI00002', 1, 2, 4, 'DR00001', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'BRATHAID', '�ʶ��׽� �̾߱��ؿ�~', 'GU00015', 'IS00007', TO_DATE('20190707','YYYY-MM-DD'), SYSDATE,'�ʶ��׽��ϴ� ����� �̾߱��ؿ�', 'MI00001', 2, 2, 6, 'DR00002', 'SG00001');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'collerva', 'Ƽ��Ƽ�� �߱��� ', 'GU00018', 'IS00036', TO_DATE('20190706','YYYY-MM-DD'), SYSDATE,'�����ϰ� �߱��� ���� ���� ���� �̾߱� �ؿ�', 'MI00002', 2, 4, 9, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'advice', 'DIY(���װ���) �̾߱� �ϽǺ�', 'GU00002', 'IS00018', TO_DATE('20190624','YYYY-MM-DD'), TO_DATE('20190619','YYYY-MM-DD'), '���װ���(���׺�Ʈ) ����� ���Ͽ쿡 ���� �̾߱� �ϽǺ�', 'MI00003', 1, 2, 3, 'DR00002', 'SG00001');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'dunarea', '�� ������ �������� ���� �̾߱� �ϽǺ�', 'GU00012', 'IS00064', TO_DATE('20190628','YYYY-MM-DD'), TO_DATE('20190621','YYYY-MM-DD'), '�� ���డ�� ���� �������� ���� �� �ƽôº� ã�ƿ�', 'MI00002', 1, 2, 4, 'DR00001', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');
INSERT INTO POST(POSTID, USERID, TITLE, ADDRGUID, INTERSUBID, MEETDATE, POSTDATE, CONTENTS, MOODID, LIMITGRADE, MINNUM, MAXNUM, DRINKID, SAMEGENDERID)
VALUES(ADD_ID('POST', 'POSTID','PT'), 'admin001', '�� ���� �׽�Ʈ ������', 'GU00001', 'IS00001', TO_DATE('20190710','YYYY-MM-DD'), SYSDATE, '�� ���� �׽�Ʈ �������Դϴ� ���� ��Ź�帳�ϴ�.', 'MI00002', 5, 2, 2, 'DR00002', 'SG00002');




------------------------------------------------------ ��Ȳ ------------------------------------------------------
--�� DEL_MESSAGE ���̺� INSERT ������
INSERT INTO DEL_MESSAGE(ID, MESSAGEID, DELETEDATE, USERID) VALUES(DEL_MESSAGE_SEQ.NEXTVAL, 'MS00001', SYSDATE, 'admin001');
INSERT INTO DEL_MESSAGE(ID, MESSAGEID, DELETEDATE, USERID) VALUES(DEL_MESSAGE_SEQ.NEXTVAL, 'MS00002', SYSDATE, 'admin001');

--�� DEL_POST ���̺� INSERT ������
INSERT INTO DEL_POST(ID, POSTID,DELETEDATE)VALUES(DEL_POST_SEQ.NEXTVAL,'PT00001',SYSDATE);

--�� REPORT_POST ���̺� INSERT ������
INSERT INTO REPORT_POST(ID, POSTID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE) VALUES(REPORT_POST_SEQ.NEXTVAL, 'PT00002','BLUMBALD','RC00001','���߾��',SYSDATE);
INSERT INTO REPORT_POST(ID, POSTID, USERID, REPORTCATEID, REPORTDETAIL, REPORTDATE) VALUES(REPORT_POST_SEQ.NEXTVAL, 'PT00003','BLUMBALD','RC00002','�������',SYSDATE);

--�� JOIN ���̺� INSERT ������
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00002','B001','ST00002','���� ��û �ؿ�~',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00002','Dagona','ST00002','���� ��û �մϴ�',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00003','anlant','ST00001','���� ��û �ؿ�~',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00003','BAHEELA','ST00001','���� ��û �մϴ�',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00003','BJOREEN','ST00002','���� ��û',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00003','BERMEDA','ST00002','���� �̾߱��ؿ�~ ���� ��û �մϴ�',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00004','EVERETTE','ST00001','�����մϴ�',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00004','alberic','ST00001','���� ��û �մϴ�',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00004','derbonie','ST00001','�����ϰ�;��',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00004','divien','ST00001','���� �̾߱��ϰ� �;��',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00005','EDROSINK','ST00003','�����մϴ�',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00005','dymira','ST00003','���� ��û �մϴ�',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00005','crowen','ST00003','�����ϰ�;��',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00005','chiania','ST00003','���� �̾߱��ϰ� �;��',SYSDATE);
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00007','arthisef','ST00003','�����մϴ�',TO_DATE('20190629','YYYY-MM-DD'));
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00007','alberic','ST00003','���� ��û �մϴ�',TO_DATE('20190628','YYYY-MM-DD'));
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00007','channa','ST00003','�����ϰ�;��',TO_DATE('20190629','YYYY-MM-DD'));
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00006','B001','ST00003','�����մϴ�',TO_DATE('20190625','YYYY-MM-DD'));
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00006','Dagona','ST00003','���� ��û �մϴ�',TO_DATE('20190626','YYYY-MM-DD'));
INSERT INTO JOIN (JOINID, POSTID,USERID, STATUSID,CONTENTS, JOINDATE)
VALUES (ADD_ID('JOIN', 'JOINID','JN'),'PT00006','cointer','ST00003','�����ϰ�;��',TO_DATE('20190626','YYYY-MM-DD'));
INSERT INTO JOIN(JOINID, POSTID, USERID, STATUSID, CONTENTS, JOINDATE)
VALUES(ADD_ID('JOIN', 'JOINID', 'JN'), 'PT00008', 'EDROSINK', 'ST00003', '��û�մϴ�1', TO_DATE('20190621', 'YYYY-MM-DD'));
INSERT INTO JOIN(JOINID, POSTID, USERID, STATUSID, CONTENTS, JOINDATE)
VALUES(ADD_ID('JOIN', 'JOINID', 'JN'), 'PT00008', 'BERMEDA', 'ST00003', '��û�մϴ�2', TO_DATE('20190621', 'YYYY-MM-DD'));
INSERT INTO JOIN(JOINID, POSTID, USERID, STATUSID, CONTENTS, JOINDATE)
VALUES(ADD_ID('JOIN', 'JOINID', 'JN'), 'PT00009', 'B001', 'ST00003', '��û�մϴ�1', TO_DATE('20190623', 'YYYY-MM-DD'));
INSERT INTO JOIN(JOINID, POSTID, USERID, STATUSID, CONTENTS, JOINDATE)
VALUES(ADD_ID('JOIN', 'JOINID', 'JN'), 'PT00009', 'derbonie', 'ST00003', '��û�մϴ�2', TO_DATE('20190623', 'YYYY-MM-DD'));

--�� REVIEW ���̺� INSERT ������
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00008', 'advice', 'EDROSINK', '4', TO_DATE('20190625', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00008', 'advice', 'BERMEDA', '4', TO_DATE('20190625', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00008', 'EDROSINK', 'advice', '4', TO_DATE('20190625', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00008', 'EDROSINK', 'BERMEDA', '4', TO_DATE('20190625', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00008', 'BERMEDA', 'advice', '4', TO_DATE('20190625', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00008', 'BERMEDA', 'EDROSINK', '4', TO_DATE('20190625', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00009', 'dunarea', 'B001', '4', TO_DATE('20190629', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00009', 'dunarea', 'derbonie', '4', TO_DATE('20190629', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00009', 'B001', 'dunarea', '4', TO_DATE('20190629', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00009', 'B001', 'derbonie', '4', TO_DATE('20190629', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00009', 'derbonie', 'dunarea', '4', TO_DATE('20190629', 'YYYY-MM-DD'));
INSERT INTO REVIEW(REVIEWID, POSTID, GIVEUSERID, TAKEUSERID, GRADE, REVIEWDATE)
VALUES(ADD_ID('REVIEW', 'REVIEWID', 'RV'), 'PT00009', 'derbonie', 'B001', '4', TO_DATE('20190629', 'YYYY-MM-DD'));


------------------------------------------------------ ��ȫ ------------------------------------------------------
--�� REPORT_JOIN ���̺� INSERT ������
INSERT INTO REPORT_JOIN(ID,JOINID,USERID,REPORTCATEID,REPORTDETAIL,REPORTDATE)
VALUES(REPORT_JOIN_SEQ.NEXTVAL,'JN00008','EREDUI','RC00004','���� �Ⱦ��!',SYSDATE);

--�� DEL_JOIN ���̺� INSERT ������
INSERT INTO DEL_JOIN(ID,JOINID,DELETEDATE)
VALUES(DEL_JOIN_SEQ.NEXTVAL,'JN00004',SYSDATE);
INSERT INTO DEL_JOIN(ID,JOINID,DELETEDATE)
VALUES(DEL_JOIN_SEQ.NEXTVAL,'JN00007',SYSDATE);


--�� REPLY ���̺� INSERT ������
INSERT INTO REPLY(REPLYID, JOINID, CONTENTS, REPLYDATE, USERTYPEID) VALUES(ADD_ID('REPLY', 'REPLYID', 'RV'), 'JN00001','���� ��û �Ϸ��߾��.',SYSDATE,'RU00001');
INSERT INTO REPLY(REPLYID, JOINID, CONTENTS, REPLYDATE, USERTYPEID) VALUES(ADD_ID('REPLY', 'REPLYID', 'RV'), 'JN00001','�����մϴ�.',SYSDATE,'RU00002');
INSERT INTO REPLY(REPLYID, JOINID, CONTENTS, REPLYDATE, USERTYPEID) VALUES(ADD_ID('REPLY', 'REPLYID', 'RV'), 'JN00002','KIN.',SYSDATE,'RU00002');
INSERT INTO REPLY(REPLYID, JOINID, CONTENTS, REPLYDATE, USERTYPEID) VALUES(ADD_ID('REPLY', 'REPLYID', 'RV'), 'JN00002','�弳 �Ű��߾��~',SYSDATE,'RU00001');

--�� REVIEW_SUB ���̺� INSERT ������
INSERT INTO REVIEW_SUB(ID,REVIEWID,BADGEPOINTID,CONTENTS)VALUES(REVIEW_SUB_SEQ.NEXTVAL,'RV00001','BP00001','�ڸ�Ʈ��');
INSERT INTO REVIEW_SUB(ID,REVIEWID,BADGEPOINTID,CONTENTS)VALUES(REVIEW_SUB_SEQ.NEXTVAL,'RV00005','BP00002','�ڸ�Ʈ����~');
INSERT INTO REVIEW_SUB(ID,REVIEWID,BADGEPOINTID,CONTENTS)VALUES(REVIEW_SUB_SEQ.NEXTVAL,'RV00007','BP00002','�ڸ�Ʈ����~~~');
INSERT INTO REVIEW_SUB(ID,REVIEWID,BADGEPOINTID,CONTENTS)VALUES(REVIEW_SUB_SEQ.NEXTVAL,'RV00011','BP00002','�ڸ�Ʈ����~');
INSERT INTO REVIEW_SUB(ID,REVIEWID,BADGEPOINTID,CONTENTS)VALUES(REVIEW_SUB_SEQ.NEXTVAL,'RV00012','BP00006','��ų�����Ʈ �ڸ�Ʈ����~');
INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'RV00013', 'BP00001', '�ڸ�Ʈ1');
INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'RV00014', 'BP00001', '�ڸ�Ʈ2');
INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'RV00015', 'BP00001', '�ڸ�Ʈ1');
INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'RV00016', 'BP00002', '�ڸ�Ʈ3');
INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'RV00017', 'BP00006', '�ڸ�Ʈ4');
INSERT INTO REVIEW_SUB(ID, REVIEWID, BADGEPOINTID, CONTENTS) VALUES(REVIEW_SUB_SEQ.NEXTVAL, 'RV00018', 'BP00002', '�ڸ�Ʈ5');

--�� USER_BADGE_LOG ���̺� INSERT ������
INSERT INTO USER_BADGE_LOG(BADGELOGID, USERID, BADGEPOINTID, GETREVIEWID, EXPIRATIONREVIEWID) VALUES(ADD_ID('USER_BADGE_LOG','BADGELOGID','BL'),'alberic','BP00002','RV00005','RV00005'); 

------------------------------------------------------ ���� ------------------------------------------------------
--�� DEL_REPLY ���̺� INSERT ������
INSERT INTO DEL_REPLY(ID,REPLYID,DELETEDATE)VALUES(DEL_REPLY_SEQ.NEXTVAL,'RV00002',SYSDATE);

--�� REPORT_REPLY ���̺� INSERT ������
INSERT INTO REPORT_REPLY(ID,REPLYID,USERID,REPORTCATEID,REPORTDETAIL,REPORTDATE)VALUES(REPORT_REPLY_SEQ.NEXTVAL,'RV00003','BLUMBALD','RC00001','�弳�̿���',SYSDATE);


