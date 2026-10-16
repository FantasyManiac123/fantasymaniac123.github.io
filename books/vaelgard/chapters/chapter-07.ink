VAR odvaha = 0
VAR rozum = 0
VAR sucit = 0
VAR vzdor = 0
VAR puto = 0
VAR tajomstvo = 0
VAR zranenie = 0
VAR drak = ""

-> zaciatok

=== zaciatok ===
Keď ste sa vrátili z Arkenu, brány Vaelgardu boli zatvorené.

Nie kvôli vám.

Na oblohe krúžili hliadky a na každej veži horeli signálne ohne. Nymar pristál na južnej terase medzi dvoma ozbrojenými oddielmi.

# character: Nymar
„Toto nevyzerá ako privítanie.“

Seris vám vyšla v ústrety.

# character: Inštruktorka Seris
„Kým ste boli preč, zmizli ďalšie dva mladé draky.“

Lyra jej podala dokumenty Projektu Koruna.

# character: Lyra
„Potom vieme kam.“

Seris však pokrútila hlavou.

# character: Inštruktorka Seris
„Nie. Tieto zmizli zvnútra Vaelgardu.“

-> rada

=== rada ===
V zasadacej sieni sa tentoraz nikto nesťažoval na Nymarovu prítomnosť.

Na stole ležali mapy akadémie.

# character: Rektor Avar
„Nikto neprelomil vonkajšie brány. Nikto nepreletel cez hliadky.“

# player: Ty
„Tak ich niekto odviedol.“

# character: Generál Merovan
„Alebo odišli.“

Nymar zavrčal.

# character: Nymar
„Mláďatá neopustia hniezdisko uprostred noci bez dôvodu.“

Avar ukázal na starú časť akadémie.

# character: Rektor Avar
„Podzemné chodby.“

* [Preskúmať staré tunely.]
    ~ tajomstvo += 1
    -> tunely
* [Najprv vypočuť kadetov na nočnej službe.]
    ~ rozum += 1
    -> svedkovia
* [Spýtať sa drakov, čo cítili.]
    ~ puto += 1
    -> dracie_svedectvo

=== svedkovia ===
Kadet pri západnej veži tvrdil, že nič nevidel.

Druhý počul kovové údery pod podlahou.

Tretia kadetka sa zdráhala hovoriť.

# player: Ty
„Čo si videla?“

# character: Kadetka
„Majstra Edrana. Išiel do starej veže.“

Lyra zbledla.

# character: Lyra
„Edran učí dejiny puta.“

-> tunely

=== dracie_svedectvo ===
Staršie draky sa zhromaždili na nádvorí.

Ich odpovede neboli rovnaké, ale jedna vec sa opakovala.

Strach.

Nie strach mláďat.

Cudzí strach, ktorý sa šíril cez putá.

# character: Nymar
„Niekto používal rezonanciu.“

# player: Ty
„Korunu?“

# character: Nymar
„Niečo podobné.“

-> tunely

=== tunely ===
Vchod ste našli za starou mapou v učebni dejín.

Taren zdvihol lampu.

# character: Taren
„Ak sa za stenou objaví kostra bývalého rektora, odchádzam.“

# character: Lyra
„Prečo práve rektora?“

# character: Taren
„Kostry učiteľov sú tematické.“

Tunel klesal hlboko pod akadémiu.

Na stenách boli staré dračie znaky.

Nymar sa ich dotýkal ňufákom.

# character: Nymar
„Toto nie je ľudská chodba.“

-> komora

=== komora ===
Tunel sa otvoril do obrovskej kruhovej komory.

Uprostred stál kamenný kruh podobný Kotve — ale oveľa starší.

Pri ňom bol majster Edran.

A dve nezvestné mláďatá.

# player: Ty
„Edran.“

Muž sa pomaly otočil.

# character: Majster Edran
„Tak predsa ste našli cestu.“

# character: Lyra
„Vy ste ich uniesli?“

# character: Majster Edran
„Zachránil.“

Nymar sa postavil medzi Edrana a mláďatá.

# character: Nymar
„Pred čím?“

Edran položil ruku na kameň.

# character: Majster Edran
„Pred tým, čo prichádza.“

-> pravda

=== pravda ===
Edran vysvetlil, že Kotva nebola prvým zariadením svojho druhu.

Pod Vaelgardom existoval starší systém.

Nie na ovládanie drakov.

Na ich ukrytie.

# character: Majster Edran
„Pred tisíc rokmi neboli draky vládcami oblohy. Boli korisťou.“

# player: Ty
„Koho?“

Edran sa pozrel nahor, akoby videl cez kilometre skaly.

# character: Majster Edran
„Niečoho, čo sa vracia.“

* [Neveriť mu a zatknúť ho.]
    ~ rozum += 1
    -> zatknutie
* [Požiadať ho, aby ukázal dôkaz.]
    ~ tajomstvo += 2
    -> dokaz
* [Nechať Nymara rozhodnúť, či mu verí.]
    ~ puto += 2
    -> nymar_sudi

=== zatknutie ===
Taren vykročil dopredu.

Edran nekládol odpor.

Potom sa kamenný kruh rozžiaril.

Mláďatá začali kričať.

# character: Majster Edran
„Neskoro.“

-> prebudenie

=== dokaz ===
Edran stlačil tri kamene.

Stena komory sa otvorila.

Za ňou bola maľba staršia než akadémia.

Zobrazovala stovky drakov padajúcich z oblohy.

Nad nimi sa vznášali čierne tvary bez krídel.

# character: Lyra
„Čo sú zač?“

# character: Majster Edran
„Tichí.“

Nymar cúvol.

# character: Nymar
„Poznám to slovo.“

-> prebudenie

=== nymar_sudi ===
Nymar dlho hľadel Edranovi do očí.

# character: Nymar
„Bojíš sa.“

# character: Majster Edran
„Áno.“

# character: Nymar
„Ale nie nás.“

Edran prikývol.

# character: Nymar
„Hovorí pravdu. Ale nie celú.“

Edran sa smutne usmial.

# character: Majster Edran
„Draci sa učia rýchlo.“

-> prebudenie

=== prebudenie ===
Kameň pod vašimi nohami sa zachvel.

Všetky draky vo Vaelgarde naraz zarevali.

Cez puto ťa zasiahla Nymarova bolesť.

A potom niečo cudzie.

Tiché.

Chladné.

Vzdialené.

# character: Nymar
„Niečo sa ma dotklo.“

Na kamennom kruhu sa objavil obraz severnej oblohy.

Jedna hviezda zhasla.

Potom druhá.

# character: Majster Edran
„Začalo sa to.“

-> poplach

=== poplach ===
Vybehli ste z tunelov práve vo chvíli, keď zazneli zvony.

Na severe bola noc neprirodzene tmavá.

Draky odmietali vzlietnuť.

Niektoré sa tlačili k stenám.

Sareth sa triasla.

# character: Lyra
„Nikdy som ju takú nevidela.“

Nymar sa prinútil roztiahnuť krídla.

# character: Nymar
„Ja áno.“

# player: Ty
„Kedy?“

# character: Nymar
„V snoch.“

-> rozhodnutie

=== rozhodnutie ===
Rada sa zišla na nádvorí.

Edran stál pod strážou.

# character: Majster Edran
„Tichí lovia cez puto. Čím silnejšie puto, tým ľahšie vás nájdu.“

Merovan sa pozrel na Avara.

# character: Generál Merovan
„Tak putá prerušíme.“

Draky okolo vás začali vrčať.

# character: Nymar
„Skúste.“

* [Odmietnuť akékoľvek nútené prerušenie puta.]
    ~ vzdor += 2
    ~ puto += 1
    -> cesta_sever
* [Navrhnúť výpravu na sever a zistiť, čo sa deje.]
    ~ odvaha += 1
    ~ rozum += 1
    -> cesta_sever
* [Presvedčiť radu, aby najprv vypočula Edrana.]
    ~ sucit += 1
    ~ tajomstvo += 1
    -> edran_plan

=== edran_plan ===
Edran rozvinul starú mapu.

Na ďalekom severe označil miesto za hranicou známeho sveta.

# character: Majster Edran
„Observatórium Aster.“

# character: Rektor Avar
„To je legenda.“

# character: Majster Edran
„Nie.“

Edran ukázal na zhasnuté hviezdy.

# character: Majster Edran
„Je to varovanie.“

-> cesta_sever

=== cesta_sever ===
Avar rozhodol.

Malá výprava odletí k Observatóriu Aster.

Ty. Nymar. Lyra. Sareth. Taren. Rok.

A Edran.

# character: Taren
„Výborne. Tajomný zradca, koniec sveta a sever.“

# character: Lyra
„Máš lepší plán?“

# character: Taren
„Áno. Juh.“

Nymar sa pozrel k tmavému horizontu.

# character: Nymar
„Niečo tam na nás čaká.“

# player: Ty
„Vieš čo?“

# character: Nymar
„Nie.“

Odmlčal sa.

# character: Nymar
„Ale ono vie, kto sme.“

# system
Kapitola VII — Tichí — dokončená.
-> DONE
