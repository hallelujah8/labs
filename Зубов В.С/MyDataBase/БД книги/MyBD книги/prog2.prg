&&Set DEFA TO D:\Downloads\MyBD

&& ����������������
M = "main"
A = "Authors"
Ai = "Authorinfo"
C = "Books"
B = "&C->Title"


CLEAR

SELECT 1
USE &A IN 1 AGAIN ALIAS Auth 
INDEX ON author_id TO Auth_ind

SELECT 2
USE &M IN 2 AGAIN ALIAS Books 
INDEX ON author_id TO M_Auth_ind

SELECT 3
USE &Ai IN 3 AGAIN ALIAS Auth_info
INDEX ON author_id TO Auth_Inf_ind

SELECT 1
SET RELATION TO author_id INTO Books
SET RELATION TO author_id INTO Auth_info ADDITIVE

LIST Surname, Iif(Found(&B),Books->Title,"")

BROWSE NOEDIT TITLE "������" PARTITION 45 LEDIT;
FIELDS Surname:H="�������", Name:H="���",;
Patronymic:H="��������",&B:H="�������� �����"

&& ���������������� � ���������
SET DATE TO BRITISH
D="Date()+7"
? Dow(&D)