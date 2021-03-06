//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"
#include <math.h>

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

void __fastcall TForm1::N4Click(TObject *Sender)
{
        MessageBoxA(Form1->Handle,"������������ ������ �1 \n ��������: �������� ���������\n ������ �-14-07\n �������������: ������ �������� ����������", "� ���������",0);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::N3Click(TObject *Sender)
{
        Form1->Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::N5Click(TObject *Sender)
{
        if(ofd->Execute())
                graf.fload(ofd->FileName.c_str());
        Repaint();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::N6Click(TObject *Sender)
{
        if(sfd->Execute())
                graf.fsave(sfd->FileName.c_str());
}
//---------------------------------------------------------------------------
struct TForm1::Drawer
{
        int mx,my,cx,cy;
        int n,b,r,R;
        double step;
        Drawer(int nn):n(nn)
        {
                mx=Form1->i->Width;
                my=Form1->i->Height;
                cx=mx/2;
                cy=my/2;
                int rr=(cx<cy?cx:cy);
                b=(rr/n)>>1;
                R= rr/(1+sin(M_PI/n));
                r= rr-R-b;
                step=2*M_PI/n;
        }
        void line(int x,int y,int xx,int yy)
        {
                Form1->i->Canvas->MoveTo(xx,yy);
                Form1->i->Canvas->LineTo(x,y);
        }
        void nodeline(int i,int j)
        {
                int x=cx+R*cos(step*j), y=cy+R*sin(step*j);
                int xx=cx+R*cos(step*i), yy=cy+R*sin(step*i);
                line(x,y,xx,yy);
        }
        void node(int j)
        {
                int x=cx+R*cos(step*j), y=cy+R*sin(step*j);
                Form1->i->Canvas->Ellipse(x-r,y-r,x+r,y+r);
                AnsiString s= IntToStr(j);
                int dx=Form1->i->Canvas->TextWidth(s)>>1, dy=Form1->i->Canvas->TextHeight(s)>>1;
                Form1->i->Canvas->TextOutA(x-dx,y-dy,s);
                s="";
                if(AnsiString(j)==Form1->EditA->Text) { s="������";Form1->i->Canvas->Font->Color=RGB(0,200,0); }
                if(AnsiString(j)==Form1->EditB->Text) { s="�����";Form1->i->Canvas->Font->Color=RGB(255,0,0); }
                if(AnsiString(j)==Form1->EditC->Text) { s="��������.";Form1->i->Canvas->Font->Color=RGB(250,250,100); }
                if(AnsiString(j)==Form1->EditD->Text) { s="�������.";Form1->i->Canvas->Font->Color=RGB(50,190,230); }
                Form1->i->Canvas->TextOutA(x-(Form1->i->Canvas->TextWidth(s)>>1),y-3*dy,s);
                Form1->i->Canvas->Font->Color=clBlack;
        }
};
void __fastcall TForm1::iPaint(TObject *Sender)
{
        if(!graf.n)return;

        Drawer dr(graf.n);
        int gg=l->ItemIndex;
        double step=2*M_PI/graf.n;
        double a=0;
        for(int j=0;j<graf.n;j++)
        {
                int x=dr.cx+dr.R*cos(a), y=dr.cy+dr.R*sin(a);
                for (int k=0;k<graf.n;k++)
                if(graf.touchingAB(j,k))
                        dr.line(dr.cx+dr.R*cos(k*step),dr.cy+dr.R*sin(k*step),x,y);
                a+=step;
        }
        //drawing linesssssss
        if(EditA->Text!=""&&EditB->Text!=""&&EditC->Text!=""&&EditD->Text!="")
        {
                i->Canvas->Pen->Color=RGB(250,80,100);
                i->Canvas->Pen->Width=5;
                std::vector<Path> a = graf.search<Drawer>(dr,StrToInt(EditA->Text),StrToInt(EditB->Text),StrToInt(EditC->Text),StrToInt(EditD->Text));
                StatusBar1->SimpleText=" ������� "+IntToStr(a.size())+" �����";
                l->Clear();
                int g=0;
                for(std::vector<Path>::iterator i = a.begin();i!=a.end();++i)
                {
                        Path p = *i;
                        AnsiString s=AnsiString(p.a[0]);
                        for(int j=1;j<p.n;j++)
                        s=s+","+AnsiString(p.a[j]);
                        l->AddItem(s,0);

                        if (gg==g)
                        {
                        Form1->i->Canvas->Pen->Color=RGB(50,80,100);
                        Form1->i->Canvas->Pen->Width=4;
                        for(int j=0;j<p.n-1;j++)
                                dr.nodeline(p.a[j],p.a[j+1]);
                        }
                        g++;
                }
                i->Canvas->Pen->Color=RGB(0,0,0);
                i->Canvas->Pen->Width=1;
        }
        i->Canvas->Brush->Color=clBtnFace;
        for(int j=0;j<graf.n;j++)
                dr.node(j);
};
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonNewAClick(TObject *Sender)
{
        graf.newA();
        Repaint();
}
//---------------------------------------------------------------------------


void __fastcall TForm1::iMouseDown(TObject *Sender, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
        int mx=i->Width, my=i->Height;
        int cx=mx/2, cy=my/2;
        int rr=(cx<cy?cx:cy);
        int n=graf.n;
        if(!n) { ButtonNewAClick(Sender); return; }
        int b=(rr/n)>>1;
        int R= rr/(1+sin(M_PI/n));
        int r= rr-R-b;
        double step=2*M_PI/n;
        double a=0;
        int res=-1;
        for(int j=0;j<n;j++)
        {
                        int x=cx+R*cos(a), y=cy+R*sin(a);
                        if((X-x)*(X-x)+(Y-y)*(Y-y)<=r*r)
                        res=j;
                        a+=step;
        }
        if(res==-1) ButtonNewAClick(Sender);
        if(Button==mbLeft)
        {
                temp=res;
        }
        else
        {
                if(EditA->Text=="")
                {
                        EditA->Text=res;
                        Repaint();
                        return;
                }
                if(EditB->Text=="")
                {
                        EditB->Text=res;
                        Repaint();
                        return;
                }
                if(EditC->Text=="")
                {
                        EditC->Text=res;
                        Repaint();
                        return;
                }
                if(EditD->Text=="")
                {
                        EditD->Text=res;
                        Repaint();
                        return;
                }
        }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::iMouseUp(TObject *Sender, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
        if(Button==mbLeft)
        {
                int mx=i->Width, my=i->Height;
                int cx=mx/2, cy=my/2;
                int rr=(cx<cy?cx:cy);
                int n=graf.n;
                if(!n)return;
                int b=(rr/n)>>1;
                int R= rr/(1+sin(M_PI/n));
                int r= rr-R-b;
                double step=2*M_PI/n;
                double a=0;
                int res=-1;
                for(int j=0;j<n;j++)
                {
                        int x=cx+R*cos(a), y=cy+R*sin(a);
                        if((X-x)*(X-x)+(Y-y)*(Y-y)<=r*r)
                        res=j;
                        a+=step;
                }
                if(res!=-1&&temp!=-1) graf.setAB(res,temp);
                Repaint();
        }
}
//---------------------------------------------------------------------------




void __fastcall TForm1::lClick(TObject *Sender)
{
        Repaint();
}
//---------------------------------------------------------------------------

