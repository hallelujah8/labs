SET DEFA TO H:\FOX1\��1\
&& �������� ������������� ����
&& "��������������" ����
DECLARE MainMenu[3,2]
MainMenu[1,1]="�������"
MainMenu[2,1]="����������� ��..."
MainMenu[3,1]="�\<����"
MainMenu[1,2]="����� ������� ��������������� �������"
MainMenu[2,2]="���������� ������� �� ��������� ����"
MainMenu[3,2]="�����"

&& "������������ ����"
DECLARE Menu1[2], Menu2[3]
Menu1[1]="����� ��������� �������"
Menu1[2]="����� �� ��������� �������"
Menu2[1]="����������� �� ��������"
Menu2[2]="����������� �� ����"
Menu2[3]="����������� �� �����"

&& ��������� ����
MENU BAR MainMenu,3
MENU 1,Menu1,2
MENU 2,Menu2,3

&& ���� ����
DO WHILE .T.
	READ MENU BAR TO i,j SAVE
	DO CASE
		
		CASE i=1
			DO CASE
			  CASE j=1		
               SELECT main.izdelie AS "�������",firm.firm_name AS "�����", firm.firm_adr AS "�����";
               FROM main, firm WHERE ((main.izdelie_kl=firm.izdelie_kl) AND (firm.firm_adr = "�.�����"));
               ORDER BY main.izdelie
			  CASE j=2
               SELECT a.izdelie AS "�������",b.firm_name AS "�����", b.firm_adr AS "�����";
               FROM main a, firm b WHERE ((a.izdelie_kl=b.izdelie_kl) AND NOT (b.firm_adr="�.�����"));
               ORDER BY a.izdelie
			ENDCASE
		
		CASE i=2
			DO CASE
			  CASE j=1		
				SELECT * FROM main ORDER BY izdelie
			  CASE j=2
			 	SELECT * FROM main ORDER BY tip
			  CASE j=3
			 	SELECT * FROM main ORDER BY firm_name			 	
			ENDCASE

		CASE i=3			
			EXIT
	ENDCASE
ENDDO
