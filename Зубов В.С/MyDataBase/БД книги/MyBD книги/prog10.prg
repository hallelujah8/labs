SET DEFA TO D:\Downloads\����\MyBD
&& �������� ������������ FOX-����

DECLARE MyMenu[5]
MyMenu[1] = " ������� ����������� ����� "
MyMenu[2] = " ������� ���������� ����� "
MyMenu[3] = " ������� ��� ����� "
MyMenu[4] = "\-"
MyMenu[5] = " �\<���� "

@ 0,0 MENU MyMenu,5 TITLE "������������ ����" 

DO WHILE .T.  && �.�. ���� �� ������ "�����"
	READ MENU TO n SAVE
	DO CASE
		CASE n=1
			SELECT a.title AS "��������",a.auth_surname AS "�����",b.country AS "������";
			FROM main a, Authorinfo b WHERE ((a.author_id=b.author_id) AND NOT (b.country = "������"));
			ORDER BY a.title
		CASE n=2
			SELECT a.title AS "��������",a.auth_surname AS "�����",b.country AS "������";
			FROM main a, Authorinfo b WHERE ((a.author_id=b.author_id) AND (b.country = "������"));
			ORDER BY a.title
		CASE n=3
			SELECT a.title AS "��������",a.auth_surname AS "�����",b.country AS "������";
			FROM main a, Authorinfo b WHERE (a.author_id=b.author_id);
			ORDER BY a.title
		CASE n=5
			EXIT
	ENDCASE
ENDDO