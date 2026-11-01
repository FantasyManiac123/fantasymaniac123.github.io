VAR odvaha = 0
VAR rozum = 0
VAR sucit = 0
VAR vzdor = 0
VAR puto = 0
VAR tajomstvo = 0
VAR zranenie = 0
VAR drak = ""
VAR volba_cesty = ""

-> zaciatok

=== zaciatok ===
Brána Výberovej siene sa otvorila do obrovskej jaskyne osvetlenej pásmi ranného svetla. V kameni boli vytesané terasy a na nich čakali draky.

Nie klietky. Žiadne reťaze. Aspoň nie také, ktoré bolo vidieť.

Biely drak s modrými očami sledoval kadetov bez záujmu. Medená dračica nervózne švihala chvostom. Na najvyššej terase ležal čierny mladý drak, menší než ostatní, s jedným poškodeným rohom.

Keď si sa naňho pozrel, zdvihol hlavu.

# thought
N-17.

Nevedel si, prečo ti to označenie napadlo práve teraz.

Seris rozdelila kadetov do skupín.

# character: Inštruktorka Seris
„Nedotýkajte sa draka, kým sa nepriblíži on. Neutekajte. Nekričte. A ak vám poviem ľahnúť si, nebudete sa pýtať prečo.“

Taren stál vedľa teba.

# character: Taren
„Je povzbudivé, koľko pravidiel začína slovom ne.“

-> prvy_kruh

=== prvy_kruh ===
Prvá vstúpila Lyra. Medená dračica k nej prišla, ovoňala ju a odišla.

Druhý kadet dopadol horšie. Mladý zelený drak po ňom vyrazil tak prudko, že ho inštruktori museli stiahnuť z kruhu.

Potom zaznelo tvoje meno.

Vstúpil si medzi kamenné značky.

Tri draky sa pohli.

* [Zostať úplne pokojne stáť.]
    ~ rozum += 1
    -> cierny_prichadza
* [Pozerať čiernemu drakovi priamo do očí.]
    ~ odvaha += 1
    -> pohlad
* [Skloniť hlavu a nechať rozhodnutie na nich.]
    ~ sucit += 1
    -> respekt

=== pohlad ===
Čierny drak sa zastavil niekoľko krokov pred tebou.

Jeho oči neboli čierne. Boli strieborné.

Pozeral si naňho a mal si zvláštny pocit, že v miestnosti nie si skúšaný iba ty.

Potom sa ti v hlave objavila myšlienka, ktorá nebola tvoja.

# character: Neznámy hlas
„Prečo sa nebojíš?“

Zatajil si dych.

# player: Ty
„Bojím.“

Drak naklonil hlavu.

# character: Neznámy hlas
„Dobrá odpoveď.“

~ puto += 2
-> nymar

=== respekt ===
Sklonil si hlavu.

Počul si pazúry na kameni. Drak sa priblížil tak blízko, že si cítil teplo jeho dychu.

# character: Neznámy hlas
„Ostatní chcú, aby sme ich vybrali.“

Hlas zaznel priamo v tvojej mysli.

# character: Neznámy hlas
„Ty čakáš.“

# player: Ty
„Je to tvoje rozhodnutie.“

Dlhé ticho.

# character: Neznámy hlas
„Tak nech je.“

~ puto += 3
~ sucit += 1
-> nymar

=== cierny_prichadza ===
Čierny drak zišiel z terasy.

Seris stuhla.

# character: Inštruktorka Seris
„Nehýb sa.“

Drak obišiel kruh. Keď prechádzal okolo rektora, Avarova ruka sa mimovoľne dotkla kovového náramku na zápästí.

Drak zavrčal.

Potom prišiel k tebe.

# character: Neznámy hlas
„Ty máš v hlave priveľa otázok.“

# player: Ty
„A ty priveľa odpovedí?“

# character: Neznámy hlas
„Možno.“

~ rozum += 1
~ puto += 2
-> nymar

=== nymar ===
Drak položil čelo k tvojej dlani.

Svet zmizol.

Na okamih si videl oblohu z výšky, akú človek nemal poznať. Hory boli malé. Rieky vyzerali ako strieborné vlákna. Potom prišiel iný obraz: kamenná miestnosť, kovové kruhy, bolesť a hlas hovoriaci slovo „kotva“.

Odtiahol si ruku.

Drak tiež.

# character: Čierny drak
„Nymar.“

# player: Ty
„To je tvoje meno?“

# character: Nymar
„To je meno, ktoré som si nechal.“

~ drak = "Nymar"
~ puto += 2

Na okraji kruhu si všimol rektora. Nevyzeral prekvapene.

-> po_vybere

=== po_vybere ===
Po Výbere zostalo z pôvodných sedemnástich kadetov jedenásť. Lyru si nakoniec vybrala medená dračica menom Sareth. Taren skončil s obrovským modrosivým drakom, ktorý ho pri prvom kontakte zhodil do blata.

# character: Taren
„Rozumieme si.“

# character: Lyra
„On ťa nenávidí.“

# character: Taren
„To je tiež forma porozumenia.“

Nymar sedel bokom.

* [Spýtať sa Nymara na obraz kovových kruhov.]
    ~ tajomstvo += 1
    -> otazka_kotva
* [Nechať ho oddychovať.]
    ~ sucit += 1
    ~ puto += 1
    -> vycvik_zeme
* [Spýtať sa Seris, prečo rektor poznal výsledok.]
    ~ vzdor += 1
    -> seris_vie

=== otazka_kotva ===
# player: Ty
„Keď sme sa spojili, videl som miestnosť. Kovové kruhy.“

Nymarove zrenice sa zúžili.

# character: Nymar
„Nie všetky spomienky, ktoré nosím, sú moje.“

# player: Ty
„Čie sú?“

# character: Nymar
„Drakov predo mnou.“

# player: Ty
„A kotva?“

Nymar odvrátil hlavu.

# character: Nymar
„To slovo tu nevyslovuj pred jazdcami.“

-> vycvik_zeme

=== seris_vie ===
Našiel si Seris pri sedlovni.

# player: Ty
„Rektor nevyzeral prekvapene, keď si ma vybral Nymar.“

# character: Inštruktorka Seris
„Rektor vyzerá prekvapene asi raz za desať rokov.“

# player: Ty
„Vedeli ste to?“

Seris prestala kontrolovať remene.

# character: Inštruktorka Seris
„Vedeli sme, že existuje možnosť.“

# player: Ty
„To nie je to isté, čo nám povedali.“

# character: Inštruktorka Seris
„Vaelgard ti bude často hovoriť pravdu v takom tvare, aby si si nevšimol, čo chýba.“

~ tajomstvo += 1
-> vycvik_zeme

=== vycvik_zeme ===
Prvé dni ste nelietali. Učili ste sa pohybovať pri drakoch, čítať napätie svalov pod šupinami a rozoznávať varovné pohyby chvosta.

Inštruktor Kael bol presvedčený, že každá chyba sa najlepšie opravuje opakovaním.

# character: Inštruktor Kael
„Ešte raz.“

Taren ležal v prachu.

# character: Taren
„Myslím, že môj drak už princíp pochopil.“

# character: Inštruktor Kael
„Ty nie.“

Nymar odmietal sedlo.

# character: Nymar
„Je smiešne.“

# player: Ty
„Je bezpečné.“

# character: Nymar
„To hovoria aj o reťaziach.“

* [Trvať na sedle, kým sa ho nenaučíte používať.]
    ~ rozum += 1
    -> sedlo
* [Skúsiť výcvik bez sedla.]
    ~ odvaha += 1
    ~ puto += 1
    -> bez_sedla
* [Spýtať sa, prečo prirovnal sedlo k reťazi.]
    ~ tajomstvo += 1
    -> retaze

=== sedlo ===
Nymar protestoval, ale nakoniec dovolil, aby si upevnil remene.

# character: Nymar
„Ak spadneš, budem tvrdiť, že som ťa varoval.“

# player: Ty
„Ak spadnem, nebudeš mať komu hovoriť, že si ma varoval.“

# character: Nymar
„To je nepríjemne logické.“

~ puto += 1
-> prvy_skok

=== bez_sedla ===
Kael sa zatváril, akoby si navrhol lietať posediačky dozadu.

# character: Inštruktor Kael
„Nie.“

Nymar si ľahol.

# character: Nymar
„Ja hovorím áno.“

Po dlhom spore vám Kael dovolil krátky tréning na zemi.

Držal si sa koreňa Nymarovho krku a prvýkrát si cítil jeho pohyb nie ako pohyb zvieraťa pod tebou, ale ako pokračovanie vlastnej rovnováhy.

~ puto += 2
-> prvy_skok

=== retaze ===
Nymar dlho mlčal.

# character: Nymar
„Keď som bol malý, počul som starších hovoriť o časoch pred Vaelgardom. Jazdec a drak sa vraj spájali iba dovtedy, kým obaja chceli.“

# player: Ty
„A dnes?“

# character: Nymar
„Dnes sa puto po Výbere uzatvára.“

# player: Ty
„Čím?“

# character: Nymar
„To je otázka, ktorú by si mal položiť svojim učiteľom.“

~ tajomstvo += 2
-> prvy_skok

=== prvy_skok ===
O týždeň neskôr prišiel prvý letový tréning. Nie skutočný let. Draci mali zoskočiť z nízkej skalnej plošiny, roztiahnuť krídla a pristáť na pieskovom nádvorí.

Keď ste stáli na okraji, zem bola zrazu veľmi ďaleko.

# character: Nymar
„Tvoje srdce je hlučné.“

# player: Ty
„Môžeš ho ignorovať.“

# character: Nymar
„Nemôžem. Teraz ho počujem skoro ako svoje.“

* [Dať Nymarovi signál na skok.]
    ~ odvaha += 2
    -> let
* [Požiadať o chvíľu na zosúladenie dychu.]
    ~ rozum += 1
    ~ puto += 1
    -> dych
* [Priznať, že sa bojíš.]
    ~ sucit += 1
    ~ puto += 1
    -> strach

=== dych ===
Dýchal si podľa rytmu Nymarovho hrudníka. Nádych. Výdych.

Po niekoľkých sekundách si prestal vnímať vietor ako nepriateľa.

# character: Nymar
„Teraz.“

-> let

=== strach ===
# player: Ty
„Bojím sa.“

# character: Nymar
„Aj ja.“

Prekvapene si sa dotkol jeho krku.

# player: Ty
„Ty?“

# character: Nymar
„Som mladý drak stojaci na skale s človekom priviazaným na chrbte. Čo si čakal?“

Zasmial si sa.

Napätie povolilo.

-> let

=== let ===
Nymar skočil.

Prvé dve sekundy boli pád.

Potom otvoril krídla.

Svet sa zmenil.

Vzduch už nebol prázdny priestor. Mal prúdy, tlak, teplotu a smer. Cítil si ich cez Nymara. Keď naklonil krídlo, tvoje telo vedelo, čo urobí skôr, než si to stihol premyslieť.

Pristátie bolo otrasné.

Ale stáli ste.

Taren pristál o chvíľu neskôr bokom a skončil v piesku.

# character: Taren
„Mám podozrenie, že zem je proti mne zaujatá.“

-> nehoda

=== nehoda ===
Pri ďalšom kole sa Erenov drak náhle strhol.

Niečo sa stalo s jeho putom. Eren vykríkol a zviera sa vo vzduchu prevrátilo.

* [Vyraziť s Nymarom za nimi bez rozkazu.]
    ~ odvaha += 2
    ~ vzdor += 1
    ~ volba_cesty = "vycvik"
    -> zachrana
* [Zakričať na inštruktorov a držať Nymara na mieste.]
    ~ rozum += 1
    ~ volba_cesty = "vycvik"
    -> zachrana_instruktor
* [Spýtať sa Nymara, čo cíti z cudzieho puta.]
    ~ tajomstvo += 1
    ~ volba_cesty = "archiv"
    -> citit_puto

=== zachrana ===
Nymar vyrazil skôr, než Kael stihol zakričať zákaz.

Leteli ste nízko nad nádvorím. Eren visel zo sedla iba na jednom remeni.

# character: Nymar
„Vľavo!“

Naklonil si sa. Nymar zachytil Erenovho draka krídlom a spomalil jeho rotáciu. Inštruktorka Seris pristála z druhej strany a dostala ich na zem.

Eren prežil.

Kael bol zúrivý.

# character: Inštruktor Kael
„Porušil si priamy rozkaz.“

# player: Ty
„A on žije.“

Kael mlčal.

~ sucit += 1
~ puto += 1
-> po_nehode

=== zachrana_instruktor ===
Seris vyrazila okamžite. Jej dračica zachytila Erena ešte vo vzduchu.

Keď pristáli, Eren bol v bezvedomí, ale živý.

Nymar sa díval na jeho draka.

# character: Nymar
„Nebola to chyba letu.“

-> po_nehode

=== citit_puto ===
# player: Ty
„Čo sa deje?“

Nymar na okamih zavrel oči.

# character: Nymar
„Bolesť. Nie jeho. Draka.“

# player: Ty
„Zranenie?“

# character: Nymar
„Nie. Niečo ho stiahlo zvnútra.“

Seris medzitým zachytila padajúcu dvojicu.

~ tajomstvo += 2
-> po_nehode

=== po_nehode ===
Večer akadémia oznámila, že išlo o „nestabilitu mladého puta“.

Lyra položila na stôl kúsok papiera.

Bol na ňom rovnaký symbol, aký si videl pri svojom mene pred Výberom.

# character: Lyra
„Eren ho mal tiež.“

# character: Taren
„Takže máme tajný zoznam, zvláštne putá a školu, ktorá vysvetľuje skoro smrteľnú nehodu dvoma slovami.“

# character: Lyra
„A archív, do ktorého študenti nesmú.“

Všetci traja ste sa pozreli na seba.

# system
Kapitola II — Prvé puto — dokončená.
-> DONE
