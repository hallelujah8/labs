&& ������������ ����� � ������� �� ����������� ���������
Set DEFA TO c:\ALANsProgs\work\FoxPro\MyLastDB\
*clear
select 1

use table1 IN 1 AGAIN alias main
INDEX ON firm TO main_indx            && �������������� �� �����

SELECT 2
USE table3 alias car_param

SELECT 3
USE table4 AGAIN alias car_firm
INDEX ON firm TO firm_ind
SET RELATION TO firm into main

&& ������� 1
*key_=Padr("AZLK",Len(firm))	&& ���� ������
SELECT 1
key_="GA"
SEEK key_								&& �����
IF Found()
	 ?Recno(),firm,main->title,car_param->motortype
ELSE 
	?"  ��� c ����� � GA*"
ENDIF

&& ������� 2
SET EXACT OFF
key_="Nissa"
SEEK key_								&& �����
DO WHILE (firm=key_)
	 ?Recno(),firm,main->title,car_param->motortype
	 SKIP
ENDDO
