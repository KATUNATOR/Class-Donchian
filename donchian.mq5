//+------------------------------------------------------------------+
//|                                           Donchian_indicator.mq5 |
//|                        Copyright 2014, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, Hinkel Kate"
#property link      "hinckel.katia@yandex.ru"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2
//--- plot High
#property indicator_label1  "High"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrTomato
#property indicator_style1  STYLE_SOLID
#property indicator_width1  3
//--- plot Low
#property indicator_label2  "low"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrPaleTurquoise
#property indicator_style2  STYLE_SOLID
#property indicator_width2  3
//---
#include <Cdonchian.mqh>
Cdonchian Don;
//--- input parameters
input int      period=5;
input int      size=20;
//--- indicator buffers
double         HighBuffer[];
double         LowBuffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Don.in_period=period;
   Don.in_size=size;
   Don.ini();
//--- indicator buffers mapping
   SetIndexBuffer(0,HighBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,LowBuffer,INDICATOR_DATA);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   ArrayCopy(Don.in_massH, high, 0, rates_total-size, size);
   ArrayCopy(Don.in_massL, low, 0, rates_total-size, size);
   Don.main();
   ArrayInitialize(HighBuffer,EMPTY_VALUE);
   ArrayInitialize(LowBuffer,EMPTY_VALUE);
   int j=0, i;
   for(i=rates_total-size; i<rates_total; i++)
     {
      HighBuffer[i]=Don.out_massH[j];
      LowBuffer[i]=Don.out_massL[j];
      j++;
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
