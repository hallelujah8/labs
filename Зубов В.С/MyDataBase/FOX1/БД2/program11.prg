SET DEFA TO C:\Documents and Settings\�����\������� ����\�����\FOX1\��2
&& �������� ������������ FOX-����

DECLARE MyMenu[5]
MyMenu[1] = " ������� ����������� ������ "
MyMenu[2] = " ������� ���������� ������ "
MyMenu[3] = " ������� ��� ����� "
MyMenu[4] = "\-"
MyMenu[5] = " �\<���� "

@ 0,0 MENU MyMenu,5 TITLE "������������ ����" 

DO WHILE .T.  && �.�. ���� �� ������ "�����"
	READ MENU TO n SAVE
	DO CASE
		CASE n=1
			SELECT a.nazvanie AS "��������", a.regesser AS "��������",b.country AS "������";
			FROM main a, video b WHERE ((a.regesser_id=b.regesser_id) AND NOT (b.country = "������"));
			ORDER BY a.regesser
		CASE n=2
			SELECT a.nazvanie AS "��������", b.familiya AS "��������", b.country AS "������";
			FROM main a, regeser_info b WHERE ((a.regesser_id=b.regesser_id) AND (b.country = "������"));
			ORDER BY a.nazvanie
		CASE n=3
			SELECT a.nazvanie AS "��������",a.regesser AS "��������",b.country AS "������";
			FROM main a, video b WHERE a.regesser_id=b.regesser_id;
			ORDER BY a.regesser
		CASE n=5
			EXIT
	ENDCASE
ENDDO
