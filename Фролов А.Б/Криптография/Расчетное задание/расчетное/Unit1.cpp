//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormShow(TObject *Sender)
{
s->Cells[0][0]="�����\\�";
s->Cells[0][1]="1";
s->Cells[0][2]="2";
s->Cells[0][3]="3";

s->Cells[1][0]="p(k)";
s->Cells[1][1]="0,5";
s->Cells[1][2]="0,25";
s->Cells[1][3]="0,25";

s->Cells[2][0]="1";
s->Cells[2][1]="1";
s->Cells[2][2]="2";
s->Cells[2][3]="1";

s->Cells[3][0]="2";
s->Cells[3][1]="1";
s->Cells[3][2]="2";
s->Cells[3][3]="2";

s->Cells[4][0]="3";
s->Cells[4][1]="1";
s->Cells[4][2]="1";
s->Cells[4][3]="2";

s->Cells[5][0]="4";
s->Cells[5][1]="2";
s->Cells[5][2]="2";
s->Cells[5][3]="1";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
          double p=0;
          int x=Edit1->Text.ToInt();
          AnsiString a=Edit4->Text;
          for(int i=1;i<s->RowCount;i++)
          {
                if(s->Cells[x+1][i]==a)
                        p+=s->Cells[1][i].ToDouble();
          }
          Label3->Caption="P_����("+AnsiString(x)+","+a+")="+p;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::efdweClick(TObject *Sender)
{
          double p=0;
          double pp=0;
          int x =Edit1->Text.ToInt();
          int xx=Edit2->Text.ToInt();
          AnsiString a =Edit4->Text;
          AnsiString aa=Edit3->Text;
          for(int i=1;i<s->RowCount;i++)
          {
                if(s->Cells[x+1][i]==a)
                {
                        p+=s->Cells[1][i].ToDouble();
                        if(s->Cells[xx+1][i]==aa)
                                pp+=s->Cells[1][i].ToDouble();
                }
          }
          if(p!=0)
          Label3->Caption="P_����("+AnsiString(x)+","+a+","+xx+","+aa+")="+(pp/p);

}

//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{

          AnsiString as[]= {"1", "2"};
          int xcount=s->ColCount-1;

          for(int x=1;x<xcount;x++)
          for(int ia=0;ia<2;ia++)
          {
                double max=0;
                int xmax=-1;
                int iamax=0;
                for(int xx=1;xx<xcount;xx++)
                for(int iaa=0;iaa<2;iaa++)
                {
                        double p=0;
                        double pp=0;
                        AnsiString a =as[ia];
                        AnsiString aa=as[iaa];
                        for(int i=1;i<s->RowCount;i++)
                        {
                                if(s->Cells[x+1][i]==a)
                                {
                                        p+=s->Cells[1][i].ToDouble();
                                        if(s->Cells[xx+1][i]==aa)
                                                pp+=s->Cells[1][i].ToDouble();
                                }
                        }
                        if(xx!=x)
                        if(p!=0)
                        if((pp/p)>max)
                        {
                                iamax=iaa;
                                xmax=xx;
                        }
                }
                Memo1->Text=Memo1->Text+"("+AnsiString(x)+","+as[ia]+") -> ("+xmax+","+as[iamax]+")\r\n";
          }

}
//---------------------------------------------------------------------------
