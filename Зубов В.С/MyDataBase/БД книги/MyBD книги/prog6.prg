&&������� ����������

SET DEFA TO D:\Downloads\����\MyBD

CLEAR
SELECT 1

WAIT WINDOW '����������� �� ����� ������������� � ����� �������'
USE main AGAIN ALIAS Books
INDEX ON Publisher+STR(Year) TO compos_indx

BROWSE TITLE "����� ������������� �� ������������� � ����� �������"

SET ORDER TO

WAIT WINDOW '�������� ������������ ��������'

INDEX ON Publisher TO Publ_indx
INDEX ON STR(Year) TO Year_indx
INDEX ON Title TO Title_indx
USE main AGAIN alias Books INDEX Publ_indx,Year_indx,Title_indx

WAIT WINDOW '��������� �� ������������'
SET ORDER TO 1
? "������� ������ ��� �������������� �� ������������",Recno(),title
BROWSE TITLE "�����, ������������������ �� ������������"

SET ORDER TO 2
? "������� ������ ��� �������������� �� ���� �������",Recno(),title
BROWSE TITLE "�����, ������������������ �� ���� �������"

SET ORDER TO 3
? "������� ������ ��� �������������� �� ��������",Recno(),title
BROWSE TITLE "�����, ������������������ �� ��������"

WAIT WINDOW '�������� ������� ����� ����� � ��������� "����������"'
?
? "�������� ������� ����� ����� � ��������� ����������"
key_= "����������"
SEEK key_
IF Found()
	? Title,Auth_surname,Publisher
	WAIT WINDOW Title+Auth_Surname
ELSE 
	? "����� ����� � ���� ���!"
	WAIT WINDOW '����� ����� � ���� ���!'
ENDIF