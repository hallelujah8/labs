Set DEFA TO H:\FOX1\��1
&& ������ �������������� dBASE-����
&& ���������� ��� �������� ����� ��������� ���� ������ 	
BaseName = ""	 

&& �������� ������������ ����
&& ������� ������ ���� ������
DEFINE POPUP ChooseBase;
PROMPT FILES LIKE *.dbf
ON SELECTION POPUP ChooseBase DO proc_select

&& ������� ������ � ����� ������
DEFINE POPUP BrowseBase
DEFINE BAR 1 OF BrowseBase PROMPT "����� ����";
SKIP FOR BaseName==""
ON SELECTION BAR 1 OF BrowseBase DO proc_all
DEFINE BAR 2 OF BrowseBase PROMPT "����� ������� Hallmark";
SKIP FOR BaseName!="main"
ON SELECTION BAR 2 OF BrowseBase DO proc_ast

&& �������� ����
DEFINE MENU MainMenu
DEFINE PAD ChooseBase_g OF MainMenu PROMPT "����� �������"
DEFINE PAD BrowseBase_g OF MainMenu PROMPT "����� �������"
DEFINE PAD Exit_g OF MainMenu PROMPT "�����"

&& ���������
ON PAD ChooseBase_g OF MainMenu ACTIVATE POPUP ChooseBase
ON PAD BrowseBase_g OF MainMenu ACTIVATE POPUP BrowseBase
ON SELECTION PAD Exit_g OF MainMenu DEACTIVATE MENU MainMenu

ACTIVATE MENU MainMenu 
RELEASE MENUS MainMenu EXTENDED

&& ������� �� ����� ���� � �������
&& �������� �� ����� � ������� ChooseBase
PROCEDURE proc_select
  PARAM n	
	BaseName=Prompt()
	n=Rat("\",BaseName)
	BaseName=Substr(BaseName,n+1)
ENDPROC
&& ������� �� ����� � ������� BrowseBase ����� 1
PROCEDURE proc_all
	SELECT * FROM &BaseName
ENDPROC
&& ������� �� ����� � ������� BrowseBase ����� 2
PROCEDURE proc_ast
	SET SKIP OF BAR 2 OF BROWSE DBF BaseName="main"
	SELECT * FROM &BaseName a WHERE a.firm_name="Hallmark"
ENDPROC
