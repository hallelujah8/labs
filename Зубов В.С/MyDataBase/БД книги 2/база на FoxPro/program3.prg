    clear
    use placetable IN g again
    select g 
    LOCATE for room=2 and bookcase=1 and bookshelf=1
    x=place_cod
SET DEFA TO "D:\���� �� FoxPro"
use maintable AGAIN ALIAS main 
SET TEXTMERGE ON TO iform.txt WINDOW SHOW
\   ����� ���������� � 2-� ������� � 1-� ����� �� 1-� �����
\
SCAN FOR place_cod==x
\ �������� ����� <<book_name>>
\����� ����� <<numtoms>>,����� ���� <<tom>>, ����� ����� <<copies>> 
\
ENDSCAN
SET TEXTMERGE TO

             