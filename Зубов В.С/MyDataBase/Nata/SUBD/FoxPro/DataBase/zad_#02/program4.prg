&& ����� 1:N � ������� BROWSE
&& � ������ ������ ����� 1:3
USE table_address IN 1 AGAIN ALIAS addr
INDEX ON association1_1 TO ass1_1
SELECT 0
USE table_employee IN 0 AGAIN
SET RELATION TO association1_1 INTO addr

BROWSE NOEDIT TITLE "�������" PARTITION 45 LEDIT;
FIELDS family_name:H="�������",name_:H="���",;
otchestvo:H="��������",addr->cite:H="�����",;
addr->street:H="�����",addr->house:H="���"