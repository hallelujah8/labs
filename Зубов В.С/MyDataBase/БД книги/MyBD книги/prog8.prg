CLEAR
SET DEFA TO D:\Downloads\����\MyBD

&& 1 ������� �����, ���������� ����� 2000 � 2004 ������
SELECT Title AS "��������",Publisher AS "��������", Year AS "���" FROM main;
WHERE Year BETWEEN 2000 AND 2004 ORDER BY Title

&& 2 ������� ���� ������� � ���������� �� ����, ������������ �� �������
SELECT Authors.Surname, Authors.Name, Sum(main.edition),;
Authorinfo.birthdate FROM Authors, main, Authorinfo;
WHERE Authors.Author_id = Authorinfo.Author_id AND Authors.Author_id=main.Author_id;
GROUP BY Authors.Surname;
ORDER BY Authors.Surname ASC

&& 3 ���������� ������� HAVING, ������� ���� �� ������������ ���������
SELECT a.Title AS "��������", a.auth_surname AS "�������",;
COUNT(a.Title) AS "���-�� ����", b.Country AS "������"; 
FROM main a, authorinfo b GROUP BY a.auth_surname WHERE a.Author_id = b.Author_id;
HAVING b.Country = "�������" 

&& 4 ���������� ������� DISTINCT
SELECT DISTINCT a.Auth_surname AS "������" FROM main a, Authors b;
WHERE a.author_id = b.author_id ORDER BY a.Auth_surname

&& 5 ������� ������� ��������
SELECT a.Auth_surname AS "�������",Sum(a.Edition) AS "�����";
FROM main a WHERE a.Edition > (SELECT AVG(b.Edition);
FROM main b) ORDER BY a.Auth_surname DESC

&& 6 ������� ������ � ����� �������
SELECT a.Title, b.Surname, b.Name, c.Country FROM;
main a, Authors b, Authorinfo c WHERE a.author_id = b.author_id;
AND b.author_id = c.author_id INTO DBF NewTable ORDER BY c.Country DESC
CLOSE DATABASES
SELECT * FROM NewTable

&&�������� ����� ������� � �������� �� 
CREATE DBF TestBase( Title C(30), Author C(50),Edition I(4))
INSERT INTO TestBase (Title, Author, Edition);
VALUES ("FoxPro","������� ������",700)
INSERT INTO TestBase (Title, Author, Edition);
VALUES ("������������ �������","�������� ������",2000)
INSERT INTO TestBase (Title, Author, Edition);
VALUES ("��� ��� �����������","�������� ������ ������",300)
INSERT INTO TestBase (Title, Author, Edition);
VALUES ("�������� ��������","����� ���� ������",550)
CLOSE DATABASES
SELECT * FROM TestBase ORDER BY Author

