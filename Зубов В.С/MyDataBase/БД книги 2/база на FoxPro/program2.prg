 
  && ������ �� ��������
  clear
  && ������ � ���������� ���������� ���������
  ?"������ �� ��������"
  ?Upper("����� ���������� �������")
  ?Lower("����� ��������� �������")
  &&?"����� ������:"
  ?Len("����� ������")
  && �������� ��������� ��������� � ������
  ?"�������� ��������� ��������� � ������"
  ? "������"$"�������� ������"
  &&?"���������� ������� ��������� � ������ ����� �������"
  ?"���������-����, ������ -���� ������"
  ?At("����","���� ������")
  ?"��������� -�,������- ���� ������"
  ?At("�","���� ������")
  ?"��������� -�,������- ���� ������ ����� ����� ������� ���������"
  ?At("�","���� ������",2)
  ?"��������� -���,������- ������� ����� ����� ������� ���������"
  ?At("���","�������",2)
  &&?"���������� ������� ��������� � ������ � ����� �� ����"
  ?"��������� -����,������ -���� ������ "
  ?rat("����","���� ������")
  ?"��������� -�,������ -���� ������ "
  ?rat("����","���� ������")
  ?"��������� -�,������ -���� ������ ����� �������� ��������� "
  ?rat("�","���� ������",3)
  &&?"������� ��������� � ������"
  ?"^^",Padl("BASE",5,"/")
  ?Padc("BASE",5,"-")
  ?Padr("BASE",12,"/")
  &&?"����� ���������"
  ?"������- ����������� ���� ������, ��� c�����- ���� "
  ?Substr("����������� ���� ������",13,4)
  &&?"�������� �����"
  ?"����������� ���� ������"
  ?Left("����������� ���� ������",11)
  ?Right("����������� ���� ������",11)
  &&?"����� ��������� �� �������"
  ?Like("?������","��� ������� ���� ������")
  