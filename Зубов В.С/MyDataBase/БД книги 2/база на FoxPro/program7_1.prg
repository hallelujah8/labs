&&����� ������ � ����� �������
SELECT maintable.book_name,authortable.author,publishingtable.publishing ;
From  maintable,authortable,publishingtable,writingtable;
Where maintable.publ_cod=publishingtable.publ_cod ;
AND maintable.mbook_cod=writingtable.book_cod ;
AND writingtable.author_cod=authortable.autor_cod;
INTO TABLE NTable; &&Order BY b.author
CLOSE DATABASES
SELECT * From NTable
