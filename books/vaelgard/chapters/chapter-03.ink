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
Zakázaný archív nebol zakázaný v oficiálnych pravidlách. To by bolo príliš jednoduché.

V mapách akadémie jednoducho neexistoval.

Lyra ho našla porovnaním troch plánov Vaelgardu z rôznych storočí. V najstaršom bola pod východnou vežou zakreslená ďalšia úroveň. V novších plánoch bola skala na tom istom mieste podozrivo hrubá.

# character: Lyra
„Buď pred tristo rokmi zmenili geometriu hory, alebo niečo zamurovali.“

# character: Taren
„V tejto škole by som nevylučoval ani prvé.“

Nymar odmietol zostať v stajni.

# character: Nymar
„Ak idete hľadať pravdu o dračích putách, idem tiež.“

# player: Ty
„Do podzemného archívu?“

# character: Nymar
„Som si vedomý svojej veľkosti.“

Nakoniec súhlasil, že bude čakať v starej letovej šachte.

-> vstup

=== vstup ===
Za tapisériou v opustenej učebni ste našli kamennú škáru. Neboli tam dvere, iba kruh s tromi znakmi: oko, krídlo a plameň.

* [Skúmať mechanizmus.]
    ~ rozum += 2
    -> mechanizmus
* [Dotknúť sa znaku krídla.]
    ~ odvaha += 1
    -> pasca
* [Požiadať Nymara, či symboly pozná.]
    ~ tajomstvo += 1
    -> pamat_drakov

=== mechanizmus ===
Všimol si si, že oko bolo ošúchané menej než ostatné symboly. Krídlo a plameň sa dali stlačiť, oko otočiť.

Lyra našla na ráme vetu v starej dračej reči.

# inscription
VIDIEŤ. DÝCHAŤ. AŽ POTOM HORIEŤ.

Otočil si oko, stlačil krídlo a nakoniec plameň.

Stena sa otvorila.

-> archiv

=== pasca ===
Kameň pod nohami klesol.

Taren ťa strhol dozadu práve včas. Z otvoru vyšľahol prúd horúcej pary.

# character: Taren
„Výborne. Archív má názor na návštevníkov.“

Lyra si kľakla k mechanizmu.

# character: Lyra
„Nabudúce najprv premýšľame.“

~ zranenie += 1
-> mechanizmus

=== pamat_drakov ===
Nymar sa dotkol kameňa pazúrom.

# character: Nymar
„Oko znamená svedectvo. Krídlo slobodu. Plameň vôľu.“

# character: Lyra
„Poradie?“

Nymar zavrel oči.

# character: Nymar
„Vidieť. Dýchať. Horieť.“

Mechanizmus sa po správnej kombinácii otvoril.

~ tajomstvo += 1
-> archiv

=== archiv ===
Za stenou viedli schody hlboko do hory. Vzduch bol suchý a nehybný.

Archív tvorili stovky kamenných políc. Neboli tam knihy v bežnom zmysle. Boli tam kovové platne, dračie šupiny popísané runami a valce z tmavého skla.

Taren zdvihol jeden valec.

# character: Taren
„Ako sa číta toto?“

# character: Lyra
„Opatrne.“

Na konci sály stáli tri dvere.

* [Dvere označené symbolom jazdca.]
    -> dejiny_jazdcov
* [Dvere označené dračím okom.]
    -> dejiny_drakov
* [Dvere bez symbolu.]
    ~ tajomstvo += 1
    -> bez_symbolu

=== dejiny_jazdcov ===
Na stenách boli kroniky prvých jazdcov.

Dozvedel si sa, že pôvodné puto nebolo vytvárané akadémiou. Vznikalo spontánne medzi niektorými ľuďmi a drakmi a mohlo byť kedykoľvek ukončené.

Až počas Vojny troch nebies vznikol problém: draci začali odmietať bojovať.

Ľudia prehrávali.

Potom sa objavil mág menom Vaelor.

# inscription
VAELOR OBJAVIL KOTVU, ABY SA PUTÁ NEROZPADLI V ČASE NAJVÄČŠEJ NÚDZE.

Lyra čítala ďalší riadok.

# character: Lyra
„Nerozpadli.“

# player: Ty
„To znie nevinne.“

# character: Lyra
„Pretože to písali víťazi.“

~ tajomstvo += 2
-> hlbsie

=== dejiny_drakov ===
Za dverami boli šupiny s vyrytými znakmi.

Keď sa jednej dotkol Nymar, všetci ste cez puto začuli hlas.

# character: Starý drak
„Ľudia nás prosili o pomoc. Pomohli sme. Potom sa začali báť dňa, keď povieme nie.“

Ďalší hlas.

# character: Dračica
„Kotva nebola vytvorená, aby spájala. Bola vytvorená, aby zabránila odchodu.“

Nymar cúvol.

# character: Nymar
„To sú spomienky.“

# player: Ty
„Skutočné?“

# character: Nymar
„Draci si môžu klamať. Ale nie takto.“

~ tajomstvo += 3
~ puto += 1
-> hlbsie

=== bez_symbolu ===
Dvere neboli zamknuté.

Za nimi bola malá miestnosť a jediný stôl. Na ňom ležala nová kniha.

Nie stará kronika. Nová.

Na prvej strane boli mená súčasných kadetov.

Tvoje meno bolo označené čiernym kruhom.

Erenovo tiež.

# inscription
SUBJEKTY SO ZVÝŠENOU REZONANCIOU VYKAZUJÚ SCHOPNOSŤ VNÍMAŤ KOTVU. RIZIKO ODMIETNUTIA PROTOKOLU: VYSOKÉ.

# character: Taren
„Subjekty.“

Lyra obrátila stránku.

# character: Lyra
„To sme my.“

Na ďalšej strane bol podpis rektora Avara.

~ tajomstvo += 4
~ vzdor += 1
-> hlbsie

=== hlbsie ===
Všetky tri cesty viedli k tej istej komore.

Uprostred stál model Vaelgardu. Z každej dračej veže viedla strieborná niť do podzemia.

Nymar sa cez puto zachvel.

# character: Nymar
„Cítim to.“

# player: Ty
„Čo?“

# character: Nymar
„Ťah.“

Lyra sledovala strieborné nite.

# character: Lyra
„Kotva nie je predmet.“

# character: Taren
„Tak čo je?“

# character: Lyra
„Celá akadémia.“

V tej chvíli sa za vami rozsvietili lampy.

Rektor Avar stál pri schodoch.

-> avar

=== avar ===
# character: Rektor Avar
„Dúfal som, že budete pomalší.“

Taren siahol po krátkom meči.

Avar zdvihol prázdne ruky.

# character: Rektor Avar
„Ak by som vás chcel zatknúť, neprišiel by som sám.“

# player: Ty
„Vedeli ste o Kotve.“

# character: Rektor Avar
„Samozrejme.“

Nymar zavrčal.

# character: Nymar
„A nechal si nás spájať.“

Avar sa naňho pozrel.

# character: Rektor Avar
„Bez Kotvy by dračie légie neexistovali.“

# character: Nymar
„Možno by nemali.“

Ticho v komore bolo náhle ťažké.

* [Obviniť Avara, že zotročuje drakov.]
    ~ vzdor += 2
    -> obvinenie
* [Pýtať sa, prečo Kotvu stále používajú.]
    ~ rozum += 2
    -> dovod
* [Spýtať sa Nymara, čo chce on.]
    ~ sucit += 2
    ~ puto += 1
    -> nymar_chce

=== obvinenie ===
# player: Ty
„Nazývate to putom, ale ak jedna strana nemôže odísť, je to reťaz.“

Avarova tvár stvrdla.

# character: Rektor Avar
„A čo nazveš svet, v ktorom dračie rody opustia hranice a o mesiac neskôr zomrú tisíce ľudí?“

# player: Ty
„Strach nie je ospravedlnenie.“

# character: Rektor Avar
„Nie. Je to vysvetlenie.“

-> pravda_avara

=== dovod ===
# player: Ty
„Vojna skončila pred stáročiami. Prečo Kotvu stále používate?“

Avar sa pozrel na model akadémie.

# character: Rektor Avar
„Pretože vojna nikdy celkom neskončila. Za severnými horami sú rody, ktoré čakajú, kým Vaelgard zoslabne.“

# character: Lyra
„Takže klamete každému novému jazdcovi.“

# character: Rektor Avar
„Áno.“

Jeho jednoduchá odpoveď bola horšia než výhovorka.

-> pravda_avara

=== nymar_chce ===
# player: Ty
„Nymar. Čo chceš ty?“

Drak sa na teba dlho díval.

# character: Nymar
„Chcem mať možnosť povedať nie.“

Nikto v miestnosti neodpovedal.

# character: Nymar
„Možno by som zostal. Možno by som s tebou bojoval. Ale ak nemôžem odísť, nikdy nebudeš vedieť, či som zostal kvôli tebe.“

Tá veta bolela viac, než si čakal.

~ puto += 2
-> pravda_avara

=== pravda_avara ===
Avar pristúpil k modelu.

# character: Rektor Avar
„Kotva slabne.“

Lyra zdvihla oči.

# character: Rektor Avar
„Erenova nehoda nebola náhoda. Systém sa rozpadá. Ak praskne naraz, stovky existujúcich pút sa môžu pretrhnúť.“

# player: Ty
„Čo sa stane jazdcom?“

# character: Rektor Avar
„Nevieme.“

# character: Nymar
„A drakom?“

Avar mlčal.

To bola odpoveď.

# character: Rektor Avar
„Potrebujem ľudí a drakov, ktorí Kotvu dokážu vnímať. Preto ste boli označení.“

# player: Ty
„N-17.“

Avar prikývol.

# character: Rektor Avar
„Nymar sedemnásty. Sedemnásty drak jeho línie, ktorý reagoval na Kotvu.“

-> rozhodnutie

=== rozhodnutie ===
Avar vám ponúkol dohodu.

Pomôžete mu zostúpiť ku Kotve a zistiť, prečo sa rozpadá. On vám sprístupní celý archív.

Lyra mu neverila. Taren neveril nikomu, čo bola podľa neho efektívnejšia politika. Nymar zostal ticho.

* [Prijať dohodu. Potrebujete viac informácií.]
    ~ rozum += 2
    -> dohoda
* [Odmietnuť a žiadať okamžité zrušenie Kotvy.]
    ~ vzdor += 2
    -> odmietnutie
* [Prijať iba ak bude mať Nymar rovnaké slovo ako ty.]
    ~ sucit += 2
    ~ puto += 2
    -> podmienka

=== dohoda ===
# player: Ty
„Pomôžeme. Ale žiadne ďalšie polopravdy.“

# character: Rektor Avar
„Nemôžem ti sľúbiť, že sa ti bude pravda páčiť.“

# player: Ty
„To som nežiadal.“

Avar prikývol.

-> koniec

=== odmietnutie ===
# player: Ty
„Nie. Najprv ju vypnite.“

Avar pokrútil hlavou.

# character: Rektor Avar
„Ak by som vedel, ako ju bezpečne vypnúť, neboli by sme tu.“

Nymar sa k tebe naklonil.

# character: Nymar
„Ak chceme reťaz zlomiť, musíme najprv vedieť, kde je upevnená.“

Neochotne si pochopil, že má pravdu.

-> koniec

=== podmienka ===
# player: Ty
„Nebudem hovoriť za Nymara. Ak má byť súčasťou tejto výpravy, rozhodne sa sám.“

Avar sa pozrel na draka.

# character: Rektor Avar
„Súhlasíš?“

Nymar nechal otázku visieť vo vzduchu.

# character: Nymar
„Áno. Nie kvôli Vaelgardu.“

Jeho pohľad sa obrátil k tebe.

# character: Nymar
„Kvôli tomu, aby sme raz mohli rozhodovať bez neho.“

-> koniec

=== koniec ===
Keď ste opúšťali archív, začalo sa celé pohorie triasť.

Nebolo to zemetrasenie.

Všetci draci vo Vaelgarde naraz zarevali.

Nymar sa zrútil na predné nohy.

V tvojej mysli sa objavila jediná cudzia veta.

# character: Neznámy hlas
„Kotva sa prebúdza.“

# system
Kapitola III — Zakázaný archív — dokončená.
-> DONE
