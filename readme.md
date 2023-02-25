# Wand Text v2.10
* DPTP System - Wand Text v2.10
* Original version date: 2014-06-27.
* New version date: 2023-02-25.
* [neo-geo.hu](http://neo-geo.hu)
* PIC16F684, Thermal Fuse (acceleration switch assembly)

# Program működése
- A proram müködése rendkívűl egyszerű. Egy Timer0-ás megszakítás fut, amely másodpercenként okoz megszakítást, ezért óra mérés is készíthető
a programban. Ez a másodperces megszakítás emel egy tétlenségi változót, majd ha eléri a 30-at vagy is a 30mp tétlenséget, akkor
SLEEP üzemmódra vált vagy is aludni megy a kontroller. Gombnyomásra felébred az eszköz és folytatja a működését. A gomb megnyomására vált a szövegek közt,
az eszközt a megfelelő ütemben jobbra és ballra mozgatva kirajzolódik a LED játékából és annak a frissítéséből egy szöveg, amelyet 
előre meghatároztunk. Ezek a szövegek tetszőlegesen változtathatóak, de minden változáshoz ismételt programozásra van szükség, amely
az ICSP felületen megtörténhet egy PicKit2 vagy megfelelő programozó segítségével.

# Thermal Fuse
- Hő biztosítékból készítünk gyorsulás érzékelős kapcsolót. (helyetesíthető, ha van más ötleted, pl. xbox360 függőleges kapcsoló)
- videó a készítésről: [Kattints ide a videó megtekintéséhez!](https://youtu.be/Vj7QPg4JtCE)
- a hőbiztosítékot az egyik végénél, (jellemzően a csúcsosabb gyantás végénél) le kell vágni vagy a lábát levágva lecsiszolni, 
majd a belső részeket ki kell szedni. Ez után egy kisebb rugót és egy csapánygolyót a belsejébe kell helyezni, amelynek mozgása 
foglya a kapcsolást a biztosíték fala és a polus közt meteremteni. A levágott végénél ésszerően egy nyákdarabot addig csiszolni,
ameddig az pontosan nem illik be a hengerbe, majd ennek közepére a lábat befurni és a belső oldalán rögzíteni, hogy ne jöjjön ki.
A rögzítés nitteléssel vagy forrasztással is lehetséges. A lényeg, hogy az egyik lába a biztosítéknak VCC (ez logika kérdése is)
lesz, a másik lába viszont független (10K Ohm-os ellenálással le van húzva a terven) kell legyen, vagy is ez a lába fogja a kapcsllást 
érzékelni.

# További videók
- [DPTP System - WandClock 1.0](https://youtu.be/EMNUdDG5QfQ)
- [DPTP System - WandClock 2](https://youtu.be/C4ieYFhOSFA)
- [DPTP System - WandClock 3](https://youtu.be/fKSn2c8CGdg)
- [DPTP System - HandText 2.0](https://youtu.be/XQEPS1zDwPo)

# Ujratervezés
-  A programot először 2014-ben majd ebben az évben történő fejlesztések, továbbfejlesztések történtek meg.
- 2023-ban újra elővettem és normális terveket készítettem az eszközhőz és publikáltam, mert kiváló tanuló projekt lehet belőle.
- Az előző változathoz képest csak a LED portok változtak az optimális tervezhetőség miatt.