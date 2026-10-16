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
Keď sa prvý raz objavila Akadémia Vaelgard, myslel si si, že hory majú zuby. Čierne veže boli vytesané priamo do hrebeňa a medzi nimi sa tiahli mosty také tenké, že na nich z diaľky nebolo vidieť zábradlie. Nad údolím krúžili draky. Nie ako legendy na erboch, ale ako živé bytosti, ktorých tiene prechádzali cez krajinu rýchlejšie než oblaky.

Na nádvorí stálo sto dvadsať uchádzačov. Do konca týždňa ich podľa povestí zostane polovica. Niektorí odídu. Niektorých odmietnu draky. A o niektorých sa vraj v záznamoch akadémie píše iba: „nevrátil sa z výšky“.

# character: Majsterka Seraya
„Vo Vaelgarde sa neučíte ovládať draka,“ povedala žena v tmavozelenom plášti. Jazvu mala od spánku až po kľúčnu kosť. „Ak ste sem prišli po moc, môžete sa otočiť. Drak nie je kôň s krídlami. Je to vôľa, ktorá vám dovolí sedieť na svojom chrbte.“

Za jej chrbtom sa ozval hlboký rev. Kamenná podlaha pod nohami zavibrovala.

# character: Majsterka Seraya
„Prvá skúška je jednoduchá. Vojdete do Siene ozveny. A poviete pravdu.“

* [Vojdem bez zaváhania.]
    ~ odvaha += 1
    -> sien_ozveny
* [Najprv budem sledovať ostatných.]
    ~ rozum += 1
    -> pozorovanie
* [Spýtam sa, čo sa stane tomu, kto zaklame.]
    ~ vzdor += 1
    -> otazka_serayi

=== pozorovanie ===
Prví traja uchádzači vyšli zo Siene bledí. Štvrtý nevyšiel vôbec; po chvíli ho priniesli dvaja liečitelia. Bol pri vedomí, ale odmietal hovoriť.

Vedľa teba stála nízka dievčina s medenými vlasmi a počítala sekundy medzi otvorením a zatvorením dverí.

# character: Liora
„Sieň nereaguje na odpoveď,“ zašepkala. „Reaguje na rozpor medzi tým, čo povieš, a tým, čomu veríš.“

* [Poďakujem jej a vojdem.]
    ~ sucit += 1
    -> sien_ozveny
* [Spýtam sa, ako to vie.]
    ~ tajomstvo += 1
    -> liora_tajomstvo

=== otazka_serayi ===
# player: Kadet
„A čo sa stane tomu, kto zaklame?“

Seraya sa na teba pozrela dlhšie, než bolo príjemné.

# character: Majsterka Seraya
„To závisí od toho, komu klame.“

Niekoľko kadetov sa zasmialo. Seraya nie.

# character: Majsterka Seraya
„Vojdi.“
-> sien_ozveny

=== liora_tajomstvo ===
Liora sa pousmiala bez veselosti.

# character: Liora
„Moja matka tu učila. Kým ju nevymazali zo zoznamu majstrov.“

Než sa stihneš spýtať prečo, zaznie tvoje meno.
-> sien_ozveny

=== sien_ozveny ===
Sieň bola prázdna, až na obrovské dračie rebro zavesené nad kruhom z čierneho skla. Keď si vstúpil do kruhu, všetky zvuky zmizli.

Hlas neprišiel zvonka. Ozval sa priamo v tebe.

# inscription: Sieň ozveny
ČOHO SA BOJÍŠ VIAC: ŽE ŤA DRAK ODMIETNE, ALEBO ŽE ŤA PRIJME?

* [Bojím sa odmietnutia.]
    ~ sucit += 1
    -> odpoved_odmietnutie
* [Bojím sa toho, čo zo mňa puto urobí.]
    ~ rozum += 1
    -> odpoved_puto
* [Nebojím sa ani jedného.]
    ~ odvaha += 1
    ~ vzdor += 1
    -> odpoved_vzdor

=== odpoved_odmietnutie ===
Čierne sklo sa pod tebou rozjasnilo mäkkým zeleným svetlom.

# thought
Pravda niekedy bolí menej, keď ju vyslovíš skôr, než ju niekto použije proti tebe.

Dvere sa otvorili.
-> vyber_drakov

=== odpoved_puto ===
Sklo pod nohami ukázalo na okamih obraz: tvoje oči, ale zrenice boli úzke ako u plaza. Potom obraz zmizol.

# inscription: Sieň ozveny
ROZUMNÝ STRACH.

Dvere sa otvorili.
-> vyber_drakov

=== odpoved_vzdor ===
Nič sa nestalo. Potom rebro nad tebou prasklo.

Hlas v tvojej hlave sa takmer pobavene zasmial.

# inscription: Sieň ozveny
LOŽ. ALE UŽITOČNÁ.

Keď vyjdeš, Seraya si všimne prasklinu v kosti a prižmúri oči.
-> vyber_drakov

=== vyber_drakov ===
Na druhý deň vás odviedli do Kaldery — obrovského krátera za akadémiou. Na skalných terasách odpočívali desiatky drakov: bronzové, sivé, modré, biele aj čierne. Kadeti nesmeli pristúpiť k nim. Draky mali pristúpiť ku kadetom.

Hodina prešla. Potom druhá. Jeden po druhom boli tvoji spolužiaci vyberaní.

Nakoniec zostali iba traja ľudia: ty, Liora a vysoký šľachtic menom Cassian Veyr.

Z najvyššej terasy zostúpil mladý drak s tmavozelenými šupinami. Mal poškodené ľavé krídlo a zlaté oči. Všetci stíchli.

# character: Cassian
„Ten je chybný.“

Drak otočil hlavu priamo k nemu. Cassian o krok ustúpil.

Potom drak pozrel na teba.

* [Zostanem stáť a pozriem mu do očí.]
    ~ odvaha += 2
    ~ drak = "Nymar"
    -> nymar
* [Kľaknem si, aby som nepôsobil ako hrozba.]
    ~ sucit += 2
    ~ drak = "Nymar"
    -> nymar
* [Nechám rozhodnutie úplne na ňom a odvrátim zrak.]
    ~ rozum += 2
    ~ drak = "Nymar"
    -> nymar

=== nymar ===
Drak sa zastavil tak blízko, že cítiš teplo jeho dychu. Potom sa tvojho čela dotkne špičkou ňufáka.

Svet sa roztrhne.

Nie bolesťou. Cudzou spomienkou.

Vidíš oblohu plnú ohňa. Veže Vaelgardu padajú. Draci bojujú proti jazdcom, ku ktorým sú pripútaní. A pod akadémiou sa otvára niečo obrovské, staršie než všetky kráľovstvá.

Potom stojíš opäť v kaldere.

# character: Majsterka Seraya
„Nymar si vybral.“

V jej hlase však nie je radosť. Je tam strach.

~ puto += 1
-> prvy_vecer

=== prvy_vecer ===
V internáte ti Liora bez zaklopania vojde do izby. V ruke drží zvitok s pečaťou akadémie.

# character: Liora
„Nymar patril mojej matke.“

Položí zvitok na stôl. Je to starý zoznam jazdcov. Pri mene profesorky Maery Thalenovej je červeným atramentom napísané: ZRADKYŇA. DRAK NEZAISTENÝ.

# character: Liora
„Oficiálne zomrela pri nehode. Ak si ťa Nymar vybral, možno vieš zistiť, čo sa naozaj stalo.“

* [Sľúbim Liore pomoc.]
    ~ sucit += 1
    ~ tajomstvo += 1
    -> vycvik
* [Poviem, že nechcem riskovať vylúčenie.]
    ~ rozum += 1
    -> vycvik
* [Najprv chcem vedieť, čo predo mnou skrýva.]
    ~ vzdor += 1
    -> liora_priznanie

=== liora_priznanie ===
# character: Liora
„Moja matka tvrdila, že puto jazdca a draka nie je prirodzené. Že akadémia ho pred stáročiami zmenila.“

Liora sa pozrie na dvere.

# character: Liora
„A potom zmizla.“

~ tajomstvo += 2
-> vycvik

=== vycvik ===
Nasledujúce týždne rozdelia tvoj život na tri veci: pád, bolesť a opakovanie. Učíš sa sedieť na Nymarovi bez sedla, čítať zmenu vetra podľa pohybu jeho krku a — čo je najťažšie — nerozmýšľať príliš hlasno. Puto prenáša viac než slová.

Nymar nehovorí ľudským hlasom. Jeho myšlienky prichádzajú ako obrazy, chute a pocity. Keď je podráždený, cítiš chuť železa. Keď sa teší na let, v hlave sa ti objaví vôňa dažďa.

Počas prvého letu sa poškodené krídlo zachveje a Nymar prudko stratí výšku.

* [Prinútim ho pokračovať. Musíme skúšku dokončiť.]
    ~ odvaha += 1
    ~ zranenie += 1
    -> pad
* [Okamžite preruším let a pristávam.]
    ~ sucit += 1
    ~ puto += 1
    -> pristatie
* [Nechám rozhodnúť Nymara.]
    ~ rozum += 1
    ~ puto += 1
    -> nymar_rozhodne

=== pad ===
Nymar sa pokúsi nabrať výšku. Krídlo vypovie službu. Padáte.

Tesne nad skalami sa mu podarí vyrovnať let, ale pri pristátí sa obaja kotúľate po tráve. Keď sa preberieš, Nymar nad tebou stojí a v jeho mysli cítiš jedinú ostrú emóciu: hnev.

~ zranenie += 1
-> nocny_archiv

=== pristatie ===
Nymar okamžite stočí krídla a klesne k horskej lúke. Keď zosadneš, oprie si čelo o tvoje rameno.

Na okamih cez puto uvidíš ďalšiu spomienku: Liorina matka pri podzemnej bráne. Seraya stojí vedľa nej.

~ tajomstvo += 1
-> nocny_archiv

=== nymar_rozhodne ===
Nymar chvíľu bojuje sám so sebou. Potom sa otočí späť k akadémii. Nie je to zbabelosť. Je to rozhodnutie bytosti, ktorá pozná svoje telo lepšie než ty.

V putu sa objaví pocit, ktorý prvý raz dokážeš preložiť takmer ako slovo.

# thought
Spolu.

~ puto += 2
-> nocny_archiv

=== nocny_archiv ===
V noci ťa zobudí Nymarov nepokoj. Cez puto cítiš chlad a obraz schodiska smerujúceho pod zem. Keď vyjdeš na chodbu, čaká tam Liora s lampou.

# character: Liora
„Aj tebe to ukázal?“

Vstup do zakázaného archívu stráži jediný kadet: Cassian.

# character: Cassian
„Vedel som, že niečo plánujete.“

* [Poviem mu pravdu a požiadam ho, aby šiel s nami.]
    ~ sucit += 1
    -> cassian_spojenec
* [Odvediem jeho pozornosť a nechám Lioru prekĺznuť dnu.]
    ~ rozum += 1
    -> archiv
* [Vyhrážam sa mu, že Nymar vie, kde spí.]
    ~ vzdor += 2
    -> cassian_hnev

=== cassian_spojenec ===
Cassian sa chvíľu tvári urazene. Potom si povzdychne.

# character: Cassian
„Môj brat zomrel pri väzbovej skúške. Ak akadémia klamala aj o tom, chcem to vedieť.“

~ tajomstvo += 1
-> archiv

=== cassian_hnev ===
Cassian zbledne.

# character: Cassian
„Raz zistíš, že drak nie je ospravedlnenie pre všetko.“

Nechá vás prejsť, ale vieš, že si si vytvoril nepriateľa.
-> archiv

=== archiv ===
Pod archívom nájdete miestnosť bez kníh. Na stenách sú iba kovové dosky s menami drakov a jazdcov. Každé meno spája tenká strieborná ryha.

Liora nájde meno svojej matky. Ryha však nevedie k Nymarovi. Vedie hlbšie do skaly.

Za stenou objavíte mechanizmus. Keď sa ho dotkneš, Nymar v kaldere zareve tak silno, že to počujete aj cez stovky metrov kameňa.

Objaví sa Seraya.

# character: Majsterka Seraya
„Mali ste sa to dozvedieť až po treťom ročníku.“

* [Žiadam vysvetlenie.]
    ~ rozum += 1
    -> pravda
* [Obviním akadémiu, že zotročuje draky.]
    ~ vzdor += 1
    -> pravda
* [Spýtam sa, či Liorina matka ešte žije.]
    ~ sucit += 1
    -> pravda

=== pravda ===
Seraya položí dlaň na kovovú stenu.

# character: Majsterka Seraya
„Pred osemsto rokmi ľudia a draci uzavreli Pakt oblohy. Dobrovoľný. Ale pakt slabne. Naši predkovia preto vytvorili Kotvu — zariadenie, ktoré puto stabilizuje.“

# character: Liora
„Stabilizuje?“

# character: Majsterka Seraya
„Núti ho pretrvať.“

Ticho je horšie než priznanie.

Seraya vysvetlí, že Maera chcela Kotvu zničiť. Zistila však, že pod Vaelgardom spí prastarý drak Azhur, ktorého sny ovplyvňujú všetky ostatné draky. Kotva zároveň drží jeho vedomie v spánku.

# character: Majsterka Seraya
„Ak ju zničíme, oslobodíme putá. A možno zobudíme niečo, čo spáli polovicu kontinentu.“

Vtom sa hora otrasie.

~ tajomstvo += 2
-> utok

=== utok ===
Poplašné zvony znejú ešte skôr, než vybehnete na nádvorie. Nad Vaelgardom krúžia desiatky drakov bez jazdcov. Nie sú to útočníci. Sú vystrašení.

Kotva pod horou pulzuje. Nymar sa zvíja na zemi a ty cítiš, ako sa puto medzi vami mení na reťaz.

Z podzemia prichádza myšlienka taká obrovská, že na okamih prestaneš vedieť, kde končíš ty.

# system: AZHUR
OTVORTE.

Seraya prikáže kadetom brániť Kotvu. Liora chce ísť dole a vypnúť ju. Cassian stojí medzi vami.

* [Poslúchnem Serayu a budem brániť Kotvu.]
    ~ rozum += 2
    -> obrana
* [Pôjdem s Liorou Kotvu zničiť.]
    ~ vzdor += 2
    -> znicenie
* [Najprv sa pokúsim spojiť s Azhurovou mysľou cez Nymara.]
    ~ puto += 2
    -> azhur

=== obrana ===
Na hradbách vypukne chaos. Jazdci sa snažia dostať svoje draky pod kontrolu, no čím silnejšie ich nútia, tým prudšie sa draky bránia.

Nymar čaká na tvoj rozkaz.

{puto >= 3:
    Cítiš však, že tentoraz rozkaz nie je potrebný. Stačí zámer. Nymar ho prijme dobrovoľne.
- else:
    Puto medzi vami páli. Nymar poslúchne, ale jeho odpor cítiš ako cudziu bolesť.
}

* [Budem chrániť ľudí, nie zariadenie.]
    ~ sucit += 2
    -> azhur
* [Kotva musí vydržať za každú cenu.]
    ~ rozum += 2
    -> koniec_kotva

=== znicenie ===
S Liorou zostúpite k jadru Kotvy. Strieborné vlákna vedú zo zariadenia do skaly ako korene stromu.

# character: Liora
„Ak to rozbijeme, už to nevezmeme späť.“

Nymar cez puto necíti strach. Cíti čakanie.

* [Rozbijem Kotvu.]
    -> koniec_sloboda
* [Zastavím Lioru. Potrebujeme inú cestu.]
    ~ rozum += 1
    -> azhur

=== azhur ===
Položíš obe dlane na Nymarovu hlavu a prestaneš sa brániť cudzej mysli.

Svet sa zmení na sen.

Stojíš na planine pod oblohou bez hviezd. Pred tebou leží drak veľký ako pohorie. Azhur otvorí jediné oko.

# character: Azhur
„Ľudia nazvali reťaz paktom, pretože sa hanbili za slovo reťaz.“

# player: Kadet
„Ak ťa oslobodíme, zabiješ nás?“

Azhur sa nepohne.

# character: Azhur
„Ak zostanem spútaný, jedného dňa sa zobudím bez rozumu. Vtedy vás zabijem určite.“

Uvedomíš si tretiu možnosť. Kotvu netreba ani zachovať, ani rozbiť. Možno ju možno zmeniť tak, aby puto držala iba vtedy, keď ho prijmú obe strany.

{tajomstvo >= 3 && puto >= 3:
    Spomienky Nymara a Maery ti ukážu, ako. Maera túto úpravu pripravila pred svojím zmiznutím.
    * [Dokončím Maerinu úpravu Kotvy.]
        -> koniec_novy_pakt
}

* [Verím Azhurovi. Zničím Kotvu.]
    -> koniec_sloboda
* [Je to príliš veľké riziko. Zachovám Kotvu.]
    -> koniec_kotva

=== koniec_novy_pakt ===
S Liorou, Serayou a Cassianom pracujete až do úsvitu. Kotva sa nezlomí. Zmení sa.

Keď vyjde slnko, po celom Vaelgarde sa naraz prerušia staré nútené väzby. Niektoré draky odletia. Iné zostanú. Niektoré sa po chvíli vrátia k svojim jazdcom samy.

Nymar stojí pred tebou bez jedinej neviditeľnej reťaze.

# thought
Teraz môže odísť.

Drak roztiahne poškodené krídlo, pozrie na otvorenú oblohu a potom skloní telo, aby si mohol nasadnúť.

# character: Majsterka Seraya
„Zdá sa, kadet, že dnes začína nový prvý ročník.“

Akadémia Vaelgard prežije. Nie ako miesto, kde sa ľudia učia ovládať draky, ale ako miesto, kde sa dva druhy učia povedať áno — a kde nie znamená nie.

# inscription: KONIEC
NOVÝ PAKT
-> DONE

=== koniec_sloboda ===
Kotva praskne.

Bolesť zmizne tak náhle, až spadneš na kolená. Nad akadémiou sa draky rozletia všetkými smermi. Niektorí jazdci kričia ich mená. Niektoré draky sa vracajú. Iné nie.

Hora sa otvorí a Azhur vystúpi do ranného svetla. Je obrovský, starý a strašný. Vaelgard sa pripraví na smrť.

Azhur však iba roztiahne krídla.

Jedným úderom zmetie sneh z troch vrcholov. Druhým vzlietne.

Nymar zostane pri tebe.

Nie preto, že musí.

# inscription: KONIEC
OTVORENÁ OBLOHA
-> DONE

=== koniec_kotva ===
Kotva zostane nedotknutá. Azhurov hlas sa postupne stratí a draky sa upokoja.

Vaelgard ťa oslavuje ako kadeta, ktorý zabránil katastrofe. Seraya ti osobne pripne strieborný znak prvého letu.

Nymar stojí vedľa teba.

Keď sa ho dotkneš, puto je pevné. Bezpečné. Neprerušiteľné.

A prvý raz si nie si istý, či pocit, ktorý cezň cítiš, patrí jemu alebo tebe.

# thought
Možno na tom práve záleží najviac.

# inscription: KONIEC
STRÁŽCOVIA KOTVY
-> DONE
