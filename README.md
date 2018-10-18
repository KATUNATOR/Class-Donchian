# Class Donchian
Indicator for metatrading in MQL5

The idea is based on the classic Donchain channel

The class is optimized on speed, because of there is only 1 loop while instead of 2 for.

Class's instance requires: 

To fill up: double in_masH[], double in_masL[];
To set value: int in_period (количество баров в периоде), int in_size (размер массивов);
Call the procedure ini() for initialization;
Call the procedure main(), which creats 2 arrays (channels): double out_massH[],double out_massL[]
Donchian.mq5 stores an examle of using the class.
[Donchian in real life](Donchian.png)
