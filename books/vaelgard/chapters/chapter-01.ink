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
Studený vietor od severných štítov niesol vôňu snehu, živice a dymu, keď sa cesta po troch dňoch stúpania konečne prelomila cez horské sedlo. Vaelgard sa pred tebou neobjavil ako mesto. Vyrástol zo skaly. Sedem veží bolo zapustených priamo do čierneho hrebeňa a medzi nimi sa nad priepasťou tiahli mosty tenké ako čiary nakreslené uhlíkom.

Nad najvyššou vežou krúžil drak.

Bol tak ďaleko, že vyzeral ako tmavá jazva na oblohe, no každý pohyb jeho krídel menil vietor v sedle. Kone pred vozom zastali. Jeden sa vzopäl a kočiš zahrešil.

# thought
Celé detstvo som počúval, že človek si na pohľad na draka zvykne. Nikto nepovedal, koľko rokov to trvá.

Pri kamennom stĺpe stála mladá žena v tmavomodrom kabáte akadémie. Na golieri mala strieborný znak krídla preťatého mečom.

# character: Inštruktorka Seris
„Noví kadeti doprava. Batožina zostáva na voze. Ak v nej máte niečo, bez čoho nedokážete žiť, práve ste sa naučili prvú lekciu.“

Vedľa teba si vysoký chlapec s ryšavými vlasmi pritiahol vak bližšie k nohám.

# character: Taren
„To znie ako krádež s akademickým titulom.“

Dievča v sivom plášti sa naňho ani nepozrelo.

# character: Lyra
„Nie. Krádež býva diskrétnejšia.“

Seris ukázala k schodom vytesaným do skaly. Bolo ich niekoľko stoviek.

* [Bez rečí sa zaradiť medzi prvých.]
    ~ odvaha += 1
    -> schody
* [Pomôcť kadetovi, ktorému sa rozsypala batožina.]
    ~ sucit += 1
    -> batozina
* [Spýtať sa Seris, čo sa s vecami stane.]
    ~ rozum += 1
    -> otazka_seris
* [Poznamenať, že pravidlo nedáva zmysel.]
    ~ vzdor += 1
    -> vzdor_prichod

=== batozina ===
Mladšiemu kadetovi sa pri zosadnutí roztrhol kožený vak. Po kamennej ceste sa rozkotúľali jablká, dve knihy a drevená figúrka draka. Kým ostatní prechádzali okolo, pomohol si mu veci pozbierať.

# character: Kadet
„Eren. Vďaka.“

Keď si mu podal figúrku, všimol si si, že jedno krídlo bolo mnohokrát opravované.

# player: Ty
„Rodinná?“

Eren prikývol.

# character: Eren
„Otec ju vyrezal, keď som sa narodil. Tvrdil, že raz budem jazdec.“

Seris vás sledovala bez komentára. Keď ste skončili, iba kývla k schodom.

-> schody

=== otazka_seris ===
# player: Ty
„Čo bude s batožinou?“

# character: Inštruktorka Seris
„Prehľadaná, označená a doručená na internát. Chcela som zistiť, kto sa opýta a kto začne panikáriť.“

Taren sa potichu zasmial.

# character: Taren
„Takže prvá skúška bola paranoja.“

# character: Inštruktorka Seris
„Nie. Pozornosť.“

Seris si ťa na okamih premerala, akoby si práve získal bod v hre, ktorej pravidlá ti nikto nevysvetlil.

-> schody

=== vzdor_prichod ===
# player: Ty
„Ak chcete zistiť, či vieme poslúchať nezmyselné príkazy, mohli ste to povedať priamo.“

Na schodoch nastalo ticho.

Seris sa usmiala. Nebol to príjemný úsmev.

# character: Inštruktorka Seris
„A ak chcem zistiť, kto ich bude spochybňovať?“

# player: Ty
„Potom už odpoveď máte.“

# character: Inštruktorka Seris
„Mám.“

Lyra sa prvýkrát pousmiala.

-> schody

=== schody ===
Schodisko viedlo popri skalnej stene bez zábradlia. Po pravej strane padala priepasť do hmly. Kadeti sa postupne prestávali rozprávať.

V polovici výstupu sa ozval rev. Nebol hlasný v bežnom zmysle. Skôr si ho cítil v hrudníku. Nad mostom preletel bronzový drak s jazdkyňou v sedle.

Eren zakopol.

* [Chytiť ho skôr, než spadne k okraju.]
    ~ sucit += 1
    ~ odvaha += 1
    -> zachrana_erena
* [Ustúpiť a nechať inštruktorov zasiahnuť.]
    ~ rozum += 1
    -> nadvorie

=== zachrana_erena ===
Chytil si ho za rukáv. Jeho topánka skĺzla z posledného centimetra kameňa a na okamih si obaja videli iba bielu hmlu pod sebou.

Taren vás schmatol zozadu a potiahol späť.

# character: Taren
„Mám rád dramatické zoznámenia, ale toto už bolo príliš.“

Eren zbledol.

# character: Eren
„Dlžím vám obom.“

# character: Lyra
„V tejto škole si dlhy nezapisuj. Do mesiaca by si potreboval účtovníka.“

-> nadvorie

=== nadvorie ===
Horné nádvorie Vaelgardu bolo väčšie, než sa zdalo z údolia. Do skaly boli vytesané kruhové plošiny s čiernymi stopami po pazúroch. Na jednej spal sivý drak veľký ako dom.

Nikto z kadetov sa k nemu nepriblížil.

Pri bráne čakal muž s bielymi vlasmi a jazvou cez ľavé oko. Na rozdiel od ostatných nemal zbraň.

# character: Rektor Avar
„Vitajte vo Vaelgarde. Väčšina z vás sem prišla s predstavou, že akadémia vás naučí ovládať draka.“

Odmlčal sa.

# character: Rektor Avar
„Ak si z dneška zapamätáte jedinú vetu, nech je to táto: drak nie je kôň s krídlami. Kto sa ho pokúsi vlastniť, zomrie. Kto sa ho pokúsi zlomiť, možno zomrie pomalšie.“

Sivý drak otvoril jedno oko.

# character: Rektor Avar
„Zajtra sa začne Výber. Dnes zistíme, či vôbec viete počúvať.“

-> skuska_zvuku

=== skuska_zvuku ===
Kadeti dostali kovové pásky na oči a odviedli ich do kruhovej sály. Keď ti Seris zakryla zrak, svet sa zmenšil na kroky, dych a vzdialené škrabanie pazúrov.

# character: Inštruktorka Seris
„V miestnosti sú štyri zvony. Jeden z nich zaznie. Ukážte smer.“

Ozval sa jemný tón. Takmer okamžite sa odrazil od kamenných stien.

* [Ukázať smer prvého zvuku.]
    ~ odvaha += 1
    -> chyba_ozvena
* [Počkať na ozvenu a porovnať oneskorenie.]
    ~ rozum += 2
    -> spravny_zvon
* [Sústrediť sa na reakciu tvora v miestnosti.]
    ~ tajomstvo += 1
    -> dych_draka

=== chyba_ozvena ===
Ukázal si doľava.

Seris ti stiahla pásku.

Zvonec visel napravo.

# character: Inštruktorka Seris
„Draci počujú ozveny lepšie než vy. Ak budete veriť prvému dojmu, hora vás zabije skôr než nepriateľ.“

Nebola to príjemná lekcia, ale zapamätal si si ju.

-> vecera

=== spravny_zvon ===
Nechal si prvý tón odraziť od stien. Druhá ozvena prišla neskôr zľava. Zdroj musel byť napravo.

Ukázal si.

Po stiahnutí pásky tam skutočne visel malý strieborný zvon.

Seris prikývla.

# character: Inštruktorka Seris
„Dobre. Jazdec, ktorý premýšľa o priestore, má šancu prežiť oblohu.“

-> vecera

=== dych_draka ===
Zvuk zvona si takmer ignoroval. Za chrbtom si počul pomalý, hlboký dych. Keď zaznel tón, dych sa na zlomok sekundy zastavil.

Ukázal si smer, ku ktorému tvor obrátil hlavu.

Seris ti stiahla pásku. V tieni za mrežou ležal mladý čierny drak.

# character: Inštruktorka Seris
„Zaujímavé.“

# thought
Nikto nám nepovedal, že v miestnosti bude drak.

-> vecera

=== vecera ===
Jedáleň bola vytesaná do dutiny pod západnou vežou. Stoly boli dlhé a jednoduché. Na stenách viseli štíty jazdcov, ktorí zomreli počas služby.

Taren ti podržal miesto. Lyra sedela oproti nemu a čítala tenkú knihu aj počas jedla.

# character: Taren
„Máme teóriu.“

# character: Lyra
„Ty máš teóriu.“

# character: Taren
„Akadémia nás chce prvý týždeň vydesiť, aby sme potom považovali obyčajný pád z draka za príjemnú zmenu.“

* [Sadnúť si k nim a pýtať sa na Výber.]
    ~ rozum += 1
    -> rozhovor_vyber
* [Sadnúť si k Erenovi, ktorý je sám.]
    ~ sucit += 1
    -> rozhovor_eren
* [Prezrieť si štíty padlých jazdcov.]
    ~ tajomstvo += 1
    -> stity

=== rozhovor_vyber ===
Lyra zavrela knihu.

# character: Lyra
„Draci si vraj vyberajú podľa povahy. To je oficiálna verzia.“

# player: Ty
„A neoficiálna?“

# character: Lyra
„Že akadémia už pred Výberom vie, ku ktorým drakom nás pustí.“

Taren si odhryzol z chleba.

# character: Taren
„Lyra verí, že každé zamknuté dvere skrývajú sprisahanie.“

# character: Lyra
„Nie. Niektoré skrývajú metly.“

-> noc

=== rozhovor_eren ===
Eren mal pred sebou jedlo, ale takmer sa ho nedotkol.

# character: Eren
„Myslíš, že drak môže odmietnuť všetkých?“

# player: Ty
„Asi áno.“

# character: Eren
„Môj otec bol jazdec. Jeho drak zahynul pri Severnej bráne. Celá rodina predpokladá, že budem pokračovať.“

Chvíľu mlčal.

# character: Eren
„Nikto sa ma nespýtal, či to chcem.“

Tá veta ti zostala v hlave dlhšie než všetky reči rektora.

-> noc

=== stity ===
Na štítoch boli mená, roky a niekedy dve mená: jazdec a drak.

Na jednom starom štíte však bolo meno draka násilne vyškrabané.

Pod ním zostali iba slová:

# inscription
NEPADOL V BOJI. BOL UMLČANÝ.

Keď si sa dotkol kovu, za chrbtom sa ozval hlas.

# character: Lyra
„To tam včera nebolo.“

Otočil si sa.

# player: Ty
„Ako to vieš?“

# character: Lyra
„Pretože som sa pozerala.“

-> noc

=== noc ===
Internát bol vysoko v severnej veži. Vietor tlačil do okeníc a niekde v skalách pod vami draky vydávali hlboké, vzdialené zvuky.

Nemohol si zaspať.

Krátko po polnoci sa ozvalo trojité zaklopanie na dvere.

Bol to Taren.

# character: Taren
„Lyra našla niečo, čo by sme podľa všetkého nemali vidieť. Čo znamená, že to samozrejme musíme vidieť.“

* [Ísť s nimi.]
    ~ vzdor += 1
    ~ tajomstvo += 1
    -> nocna_chodba
* [Odmietnuť. Zajtra je Výber.]
    ~ rozum += 1
    -> rano
* [Najprv sa opýtať, čo našla.]
    ~ rozum += 1
    -> co_nasla

=== co_nasla ===
# player: Ty
„Čo presne našla?“

Taren sa obzrel na chodbu.

# character: Taren
„Zoznam kadetov. Pri každom je znak draka.“

# player: Ty
„Pred Výberom?“

# character: Taren
„Presne.“

* [Ísť sa na zoznam pozrieť.]
    ~ tajomstvo += 2
    -> nocna_chodba
* [Neriskovať vylúčenie.]
    ~ rozum += 1
    -> rano

=== nocna_chodba ===
Lyra čakala pri schodisku s lampou zakrytou kusom látky. Zaviedla vás do administratívneho krídla.

Na konci chodby boli dvere s mosadzným zámkom.

# character: Lyra
„Dokument je za nimi.“

# character: Taren
„A teraz prichádza časť plánu, ktorú Lyra nazýva improvizácia.“

* [Skúsiť zámok otvoriť sponou.]
    ~ rozum += 1
    -> kancelaria
* [Hľadať inú cestu.]
    ~ rozum += 2
    -> okno_kancelarie
* [Zaklopať a predstierať, že ste sa stratili.]
    ~ odvaha += 1
    -> straznik

=== okno_kancelarie ===
Našiel si úzku servisnú chodbu vedúcu k vonkajšiemu parapetu. Pod vami bola stometrová priepasť.

Taren pozrel na teba.

# character: Taren
„Keď som hovoril improvizácia, myslel som menej smrti.“

Prešli ste po parapete a otvorili nezabezpečené okno.

-> kancelaria

=== straznik ===
Zaklopal si.

Otvoril ospalý pisár.

# player: Ty
„Prepáčte. Severné schodisko je zatvorené a hľadáme internát.“

Muž vás chvíľu podozrievavo sledoval. Potom ukázal opačným smerom.

Keď zatváral dvere, Lyra zachytila nohou kus papiera, ktorý vietor vytiahol z kancelárie.

Na papieri bolo tvoje meno.

Vedľa neho symbol: čierny kruh so striebornou čiarou.

Lyra papier zložila.

-> utek

=== kancelaria ===
Na stole ležal zoznam.

Mená kadetov. Pri každom symbol, číslo a poznámka.

Našiel si svoje meno.

Vedľa neho stálo:

# inscription
KANDIDÁT: N-17
REZONANCIA: NEURČENÁ
DOHĽAD: POVINNÝ

# player: Ty
„Čo je N-17?“

Lyra zbledla.

# character: Lyra
„Neviem.“

Taren ukázal na spodnú časť stránky.

# character: Taren
„Ale zajtrajší Výber očividne nie je taký náhodný, ako tvrdia.“

Na chodbe sa ozvali kroky.

-> utek

=== utek ===
Utiekli ste cez servisné schodisko. Keď ste sa konečne dostali späť do internátu, všetci traja ste lapali po dychu.

Lyra ti podala odtrhnutý roh zoznamu.

# character: Lyra
„Nechaj si ho.“

# system
Získal si prvú stopu o tajomstve Vaelgardu.

~ tajomstvo += 1
-> rano

=== rano ===
Ráno sa nad Vaelgardom roztrhla hmla.

Na nádvorí stálo sedemnásť kadetov.

Za železnou bránou sa ozývali draky.

Rektor Avar prešiel pred radom.

# character: Rektor Avar
„Dnes si vás niektorý z nich možno vyberie. Niektorých nie. Ak vás drak odmietne, nie je to hanba.“

Jeho pohľad sa na okamih zastavil na tebe.

# character: Rektor Avar
„Ak vás prijme, váš život už nebude patriť iba vám.“

Brána sa začala otvárať.

# system
Kapitola I — Príchod — dokončená.
-> DONE
