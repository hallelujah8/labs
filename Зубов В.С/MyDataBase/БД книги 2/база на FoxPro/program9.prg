  CLEAR
  SET DEFA TO "D:\���� �� FoxPro"
  && ������ ������������ FOX-����
  DECLARE MYMENU[5]
  MYMENU[1]="������� ��� ������� ���������� "
  MYMENU[2]="������� ��� �����"
 
  MYMENU[3]="������� �� ������� ����������"
  MYMENU[4]="\-"
  MYMENU[5]="�\<����"
  @0,0 MENU MYMENU,5 TITLE "������������ ����"
  Do WHILE .T. &&���� �� ������ "�����"
    READ MENU TO n SAVE
      DO CASE
          CASE n=1 
              SELECT maintable.book_name AS "��������",;
              maintable.imprintdat AS "����",;
              imprinttowntable.town AS"�����",;
              publishingtable.publishing AS"������������";
              From maintable,imprinttowntable,publishingtable;
              Where  ((maintable.town_cod=imprinttowntable.town_cod);
              AND(maintable.publ_cod=publishingtable.publ_cod) ;
              AND (maintable.genre_cod=1));
              ORDER BY maintable.imprintdat
           CASE  n=2
              SELECT maintable.book_name AS "��������",;
              maintable.imprintdat AS "����",;
              imprinttowntable.town AS"�����",;
              publishingtable.publishing AS"������������";
              From maintable,imprinttowntable,publishingtable;
              Where  ((maintable.town_cod=imprinttowntable.town_cod);
              AND(maintable.publ_cod=publishingtable.publ_cod));
              ORDER BY maintable.imprintdat
           CASE  n=3   
              SELECT maintable.book_name AS "��������",;
              maintable.imprintdat AS "����",;
              imprinttowntable.town AS"�����",;
              publishingtable.publishing AS"������������";
              From maintable,imprinttowntable,publishingtable;
              Where  ((maintable.town_cod=imprinttowntable.town_cod);
              AND(maintable.publ_cod=publishingtable.publ_cod) ;
              AND NOT (maintable.genre_cod=1));
              ORDER BY maintable.imprintdat
           CASE  n=5
              EXIT
     ENDCASE               
  ENDDO                
