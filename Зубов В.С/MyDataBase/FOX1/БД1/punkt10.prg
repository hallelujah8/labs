SET DEFA TO H:\FOX1\��1

CLEAR
SELECT 1

USE main AGAIN ALIAS toys
DEFINE WINDOW New FROM 1,1 TO 30,100 SYSTEM CLOSE FLOAT GROW MINIMIZE ZOOM
SHOW WINDOW New

&& ������ ������������� EDIT
EDIT FIELDS izdelie:20:R:H="�������",firm_name:10:R:H="�����";
FOR firm_name="Nikki";
FONT 'Verdana',10 STYLE 'B' PARTITION 40 LEDIT TITLE "������� Nikki" IN New

&& ������ ������������� BROWSE
BROWSE FIELDS izdelie:20:R:H="�������",price:10:R:H="����",;
izdelie:10:R:H="�������" FOR price=560;
STYLE 'B' Title "������� �� 560 �" IN New

HIDE WINDOW New
BROWSE
