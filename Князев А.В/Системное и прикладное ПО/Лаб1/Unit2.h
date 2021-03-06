//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
#include <memory.h>
#include <stdio.h>
#include <vector>
template<class T>
class Stack
{
        T mas[100];
        int n;
        public:
        Stack():n(0) {}
        void push(T a)
        {
                if(n==100) return;
                mas[n++]=a;
        }
        T pop()
        {
                if(n==0) return 0;
                return mas[--n];
        }
        bool isempty()
        {
                return (n==0);
        }
};
struct Path
{
        unsigned a[100];
        unsigned n;
};
class AbstractGraf
{
        public:
        struct Node
        {
                unsigned B;
                Node* next;
        } *contact[100];

        unsigned m; // ���-�� �����
        unsigned n; // ���-�� ������
        AbstractGraf() : n(0), m(0) { memset(contact,0,sizeof(contact)); }
        void destroy(Node* a)
        {
                if(a->next!=0)
                destroy(a->next);
                delete a;
        }
        ~AbstractGraf()
        {
                for(unsigned i=0;i<n;i++)
                {
                        if(contact[i])destroy(contact[i]);
                }
        }
        virtual unsigned touch(unsigned,unsigned) = 0;
        virtual bool cond(Path,unsigned,unsigned,unsigned,unsigned) = 0;
        template <class GrafDrawer> std::vector<Path> search(GrafDrawer &dr,unsigned a, unsigned b, unsigned c, unsigned d)
        {
                std::vector<Path> searchres;
                int kk=0;
                int r[101];
                for(int i=0;i<101;i++)
                        r[i]=-1;
                Stack<unsigned> s;
                //unsigned lifo[101];
                r[a]=-2;
                unsigned t=a;
                s.push(a);
                //lifo[0]=a;
                //int k=1;
                int j=0;
                bool was = false;
                do
                {
                        if(j<n)
                        j=touch(j,t);
                        if(j<n)
                        {

                                if(r[j]==-1)
                                {
                                        //found. step forward.

                                        s.push(t);
                                        //lifo[k++]=t;

                                        r[j]=t;
                                        t=j;
                                        j=-1;
                                        if(t==c&&r[d]==-1)
                                        {
                                                j=d;
                                                s.push(t);
                                                //lifo[k++]=t;
                                                r[j]=t;
                                                t=j;
                                                j=-1;
                                                was=true;
                                        }
                                        if(t==b&&was)
                                        {
                                                kk++;
                                                for(int l=b;r[l]!=-2;l=r[l])
                                                        dr.nodeline(l,r[l]);
                                                Path p;
                                                p.n=0;
                                                for(int l=b;r[l]!=-2;l=r[l])
                                                        p.a[p.n++]=l;
                                                p.a[p.n++]=a;
                                                searchres.push_back(p);

                                                r[t]=-1;
                                                j=t;
                                                t= s.pop();
                                        }
                                }
                                j++;
                        }
                        else
                        {
                                //nothing found. step back.
                                r[t]=-1;
                                j=t+1;
                                t= s.pop(); //lifo[--k];
                                if(t==c) was=false;
                        }
                }
                while (!s.isempty());
                return searchres;
        }
};
class Graf : public AbstractGraf {
        public:
        //Graf(Graf &a) : n(a.n), m(a.m) { memcpy(contact,a.contact,10000); }

        void setAB(unsigned a, unsigned b)
        {
                if(a>b)
                {
                        unsigned t=b;
                        b=a;
                        a=t;
                }
                if(contact[a]==0)
                {
                        contact[a] = new Node;
                        contact[a]->B=b;
                        contact[a]->next=0;
                        m++;
                        return;
                }
                Node* t=contact[a];
                for(;;)
                {
                        if(t->B==b) return;
                        if(t->next==0)break;
                        t=t->next;
                }
                t->next = new Node;
                t->next->B=b;
                t->next->next=0;
                m++;
                return;
        }
        bool touchingAB(unsigned a, unsigned b)
        {
                if(a>b)
                {
                        unsigned t=b;
                        b=a;
                        a=t;
                }
                Node* t= contact[a];
                while(t!=0)
                {
                        if(t->B==b)return true;
                        t=t->next;
                }
                return false;
        }
        unsigned touch(unsigned j, unsigned t)
        {
                for(;j<n;j++)
                        if(touchingAB(t,j)) break;
                return j;

        }
        bool cond(Path p,unsigned a, unsigned b, unsigned c, unsigned d)
        {
                if (p.a[0]!=a) return false;
                if (p.a[n-1]!=b) return false;
                for(int i=0; i<p.n;i++)
                {
                        if(p.a[i]==c&&p.a[i+1]==d) return true;
                }
                return false;
        }
        unsigned newA() { contact[n]=0; return n++; }
        void fload(char filename[255])
        {
                for(unsigned i=0;i<n;i++)
                {
                        if(contact[i])destroy(contact[i]);
                }
                n=0;
                FILE* f = fopen(filename,"rb");
                if(!f)return;
                // reading uint, zero separated values
                Node* p=0;
                while(!feof(f))
                {
                        unsigned t = 0;
                        fread(&t,sizeof(t),1,f);
                        if(t==0)
                        {
                                n++;
                                contact[n]=0;
                                p=0;
                        }
                        else
                        {
                                if(p==0)
                                {
                                        contact[n] = new Node;
                                        p=contact[n];
                                }
                                else
                                {
                                        p->next = new Node;
                                        p=p->next;
                                }
                                p->B=t;
                                p->next=0;
                        }
                }
                fclose(f);
        }
        void fsave(char filename[255])
        {
                FILE* f = fopen(filename,"wb");
                if(!f)return;
                for(unsigned i=0;i<n;i++)
                {
                        unsigned t=0;
                        Node* p=contact[i];
                        while(p)
                        {
                                t=p->B;
                                fwrite(&t,sizeof(t),1,f);
                                p=p->next;
                        }
                        t=0;
                        if(i+1<n)fwrite(&t,sizeof(t),1,f);
                }
                fclose(f);
        }
        

};
//---------------------------------------------------------------------------
#endif
