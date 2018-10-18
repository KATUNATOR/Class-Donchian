//+------------------------------------------------------------------+
//|                                                    Cdonchian.mqh |
//|                                      Copyright 2014, Hinkel Kate |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, Hinkel Kate"
#property link      "hinckel.katia@yandex.ru"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Cdonchian class                                                  |
//+------------------------------------------------------------------+
class Cdonchian
  {
private:
   void              high_low();
public:
   void              ini();
   void              main();
   double            out_massH[];
   double            out_massL[];
   double            in_massH[];
   double            in_massL[];
   int               in_period;
   int               in_size;
//---
                     Cdonchian();
                    ~Cdonchian();
  };
//+------------------------------------------------------------------+
//| Class constructor                                                |
//+------------------------------------------------------------------+
Cdonchian::Cdonchian()
  {
  }
//+------------------------------------------------------------------+
//| Class destructor                                                 |
//+------------------------------------------------------------------+
Cdonchian::~Cdonchian()
  {
  }
//+------------------------------------------------------------------+
//| ini                                                              |   
//+------------------------------------------------------------------+
void Cdonchian::ini(void)
  {
   ArrayResize(in_massH,in_size);
   ArrayResize(in_massL,in_size);
   ArrayResize(out_massH,in_size);
   ArrayResize(out_massL,in_size);
  }
//+------------------------------------------------------------------+
//| main                                                             | 
//+------------------------------------------------------------------+
void Cdonchian::main(void)
  {
   high_low();
  }
//+------------------------------------------------------------------+
//| high_low                                                         | 
//+------------------------------------------------------------------+
void Cdonchian::high_low(void)
  {
   double H=-1000,L=1000;
   int j=1,i=in_size-1;
   while(i>-1)
     {
      if(in_massH[i]>H)
        {
         H=in_massH[i];
        }
      if(in_massL[i]<L)
        {
         L=in_massL[i];
        }
      if(j==in_period)
        {
         out_massH[i+(in_period-1)]=H;
         out_massL[i+(in_period-1)]=L;
         j=0;
         H=-1000;
         L=1000;
         i+=in_period-1;
        }
      j++;
      i--;
     }
   out_massH[in_period-2]=EMPTY_VALUE;
   out_massL[in_period-2]=EMPTY_VALUE;
  }
//+------------------------------------------------------------------+
