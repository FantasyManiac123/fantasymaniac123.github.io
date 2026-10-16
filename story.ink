VAR meno = "Cudzinec"

VAR sucit = 0
VAR vola = 0
VAR pochybnost = 0
VAR poznanie = 0

VAR ma_mincu = false
VAR ma_knihu = false
VAR poznal_kralovnu = false
VAR videl_sen = false
VAR zabil_strazcu = false

-> zaciatok


=== zaciatok ===


Keď si prvý raz uvidel mesto Ortheon, slnko zapadalo na východe. Nebola to metafora ani klam unavených očí. Stál si na kamennej ceste medzi žltou trávou a sledoval červený kotúč, ako sa pomaly ponára za vzdialené hory, hoci si s absolútnou istotou vedel, že ešte ráno vyšlo presne tam. Na západe sa medzitým obloha rozjasňovala.

Nikto z pútnikov okolo teba tomu nevenoval pozornosť. Starena vedúca somára si pohmkávala, dvaja kupci sa hádali o cenu soli a ozbrojený muž pred tebou si iba odkašľal a pokračoval smerom k mestským hradbám.

Ortheon ležal v údolí, ktoré nebolo zakreslené na žiadnej mape. Jeho veže boli príliš vysoké a príliš úzke, akoby ich stavitelia poznali iné zákony rovnováhy. Medzi nimi sa tiahli mosty a na najvyššej veži horel modrý oheň.

Pri bráne sedel starec.

Nemal stôl, zbraň ani znak mesta. Pred sebou mal iba drevenú misku a v nej jedinú čiernu mincu.

# character: Starec
„Pred vstupom musíš zaplatiť,“ povedal.

Pozrel si na otvorenú bránu. Stráže tam neboli.

# player: Cudzinec
„Komu?“

# character: Starec
„Sebe.“

Starec zdvihol mincu medzi dva prsty.

# character: Starec
„V Ortheone môžeš dostať všetko, čo si ochotný stratiť.“

* [Vziať mincu.]
    ~ ma_mincu = true
    ~ pochybnost += 1
    -> minca

* [Spýtať sa starca, čo tým myslí.]
    ~ poznanie += 1
    -> starec

* [Ignorovať ho a vstúpiť do mesta.]
    ~ vola += 1
    -> mesto


=== minca ===

Minca bola teplá. Na jednej strane mala vyrazenú tvár ženy so zatvorenými očami, na druhej strane nebolo nič. Keď si ju obrátil druhý raz, prázdna strana už prázdna nebola. Bola na nej tvoja vlastná tvár.

Pustil si ju.

Minca dopadla do prachu bez jediného zvuku.

Starec sa zasmial. „Každý ju pustí.“

# player: Cudzinec
„Čo to je?“

# character: Starec
„Dlh.“

# player: Cudzinec
„Komu niečo dlhujem?“

# character: Starec
„Ešte nie.“

Zdvihol mincu a podal ti ju znova. Tentoraz si ju prijal opatrnejšie.

# character: Starec
„Človek si myslí, že dlh vzniká tým, čo dostal,“ povedal starec. „To je omyl. Najväčšie dlhy vznikajú tým, čím sa človek rozhodol stať.“

Pozrel si na mesto za jeho chrbtom.

# player: Cudzinec
„A čo som sa rozhodol stať ja?“

Starec pokrčil plecami.

# character: Starec
„Keby som to vedel, nebola by to tvoja voľba.“

* [Vstúpiť do Ortheonu.]
    -> mesto

* [Vrátiť mu mincu.]
    ~ ma_mincu = false
    ~ sucit += 1
    -> vratena_minca


=== vratena_minca ===

Položil si mincu späť do drevenej misky. Starec sa na ňu dlho pozeral.

# character: Starec
„Zaujímavé.“

# player: Cudzinec
„Čo?“

# character: Starec
„Ľudia odmietajú dary zo strachu. Ty si ho odmietol preto, že si nechcel dlh.“

# player: Cudzinec
„Je v tom rozdiel?“

# character: Starec
„Obrovský.“

Prstom mincu otočil. Tentoraz na nej nebola tvoja tvár. Bola tam tvár starca.

# character: Starec
„Ale možno nie taký, aký si myslíš.“

Skôr než si sa stihol opýtať, minca sa rozpadla na čierny prach.

-> mesto


=== starec ===

# player: Cudzinec
„Čo znamená, že môžem dostať všetko, čo som ochotný stratiť?“

Starec sa oprel o múr.

# character: Starec
„Predstav si človeka, ktorý chce byť slobodný. Zbaví sa majetku, záväzkov, rodiny, mena a nakoniec minulosti. Keď stratí poslednú vec, ktorá ho s niečím spájala, stane sa dokonale slobodným.“

# player: Cudzinec
„To znie ako smrť.“

# character: Starec
„Možno.“

Usmial sa.

# character: Starec
„A teraz si predstav kráľa, ktorý chce absolútnu moc. Odstráni nepriateľov, priateľov, zákony, bohov a napokon všetkých ľudí, ktorí by ho mohli neposlúchnuť. Zostane jediným človekom v kráľovstve.“

# player: Cudzinec
„Potom nie je kráľom.“

# character: Starec
„Výborne.“

Starec sa postavil.

Až teraz si si všimol, že nemá tieň.

# character: Starec
„Takže už rozumieš Ortheonu.“

# player: Cudzinec
„Nie.“

# character: Starec
„Ešte lepšie.“

* [Vziať čiernu mincu.]
    ~ ma_mincu = true
    ~ pochybnost += 1
    -> mesto

* [Nevziať nič a vstúpiť.]
    ~ poznanie += 1
    -> mesto


=== mesto ===

Za bránou nebolo mesto, ktoré si videl z kopca.

Neboli tu vysoké veže ani široké ulice. Pred tebou sa rozprestierala spleť úzkych kamenných domov. Balkóny sa takmer dotýkali a medzi nimi viseli stovky zvoncov. Ani jeden nezvonil, hoci ulicami fúkal silný vietor.

Ľudia kráčali pomaly a málokto sa rozprával. Niektorí mali na tvárach masky. Iní niesli malé zrkadlá otočené smerom od seba.

Na námestí stála socha kráľa bez hlavy. Na podstavci bol nápis:

# inscription: Nápis na soche
    BOL SOM SPRAVODLIVÝ,
# inscription: Nápis na soche
    PRETOŽE SOM NIKDY NEROZHODOVAL.

Pod tým niekto uhlíkom dopísal:

# inscription: Dopis pod sochou
    ZBABELEC.

A ešte nižšie inou rukou:

# inscription: Dopis pod sochou
    MUDRC.

Pri soche stála mladá žena v tmavom kabáte. Čítala všetky tri nápisy.

# character: Elara
„Ktorý z nich má pravdu?“ spýtala sa bez toho, aby sa na teba pozrela.

# player: Cudzinec
„Nepoznám toho kráľa.“

# character: Elara
„To som sa nepýtala.“

* [„Spravodlivý človek sa nemôže vyhýbať rozhodnutiam.“]
    ~ vola += 2
    -> elara

* [„Ak nepoznám okolnosti, nemôžem ho súdiť.“]
    ~ pochybnost += 2
    -> elara

* [„Možno majú pravdu všetci traja.“]
    ~ poznanie += 2
    -> elara

* [„Na názore mŕtveho kráľa nezáleží.“]
    ~ vola += 1
    ~ sucit -= 1
    -> elara


=== elara ===

Žena sa konečne otočila.

Mala sivé oči a na krku jazvu, ktorá pokračovala pod golier. Mohla mať tridsať rokov alebo päťdesiat. V Ortheone si už prestával dôverovať aj takým jednoduchým odhadom.

# character: Elara
„Volám sa Elara.“

Povedal si jej svoje meno.

# character: Elara
„Nie,“ odpovedala. „To je meno, ktoré ti dali.“

# player: Cudzinec
„Je v tom rozdiel?“

# character: Elara
„Dúfam.“

Ukázala na bezhlavého kráľa.

# character: Elara
„Volal sa Asterion. Posledný zákonný kráľ Ortheonu. Pred osemdesiatimi siedmimi rokmi odmietol rozhodnúť, ktorý z jeho dvoch synov má zdediť korunu. Tvrdil, že každý výber by bol nespravodlivý.“

# player: Cudzinec
„Čo sa stalo?“

# character: Elara
„Obaja sa korunovali.“

# player: Cudzinec
„Občianska vojna?“

# character: Elara
„Nie. Horšie.“

Na okamih sa jej v tvári objavilo niečo, čo mohlo byť pobavením.

# character: Elara
„Začala filozofia.“

Od neďalekého chrámu sa ozval zvon. Všetky malé zvonce nad ulicami odpovedali naraz.

Ľudia na námestí zastali.

Elara zbledla.

# character: Elara
„Do riti.“

# player: Cudzinec
„Čo sa deje?“

# character: Elara
„Mesto si na niečo spomenulo.“

V tej chvíli muž stojaci desať krokov od vás zmizol.

Nebolo svetlo, výkrik ani dym. Jednoducho tam prestal byť.

Jeho nákupná taška dopadla na zem.

Nikto okrem teba a Elary nezareagoval.

* [Rozbehnúť sa k miestu, kde muž zmizol.]
    ~ sucit += 1
    -> zmiznutie

* [Chytiť Elaru a žiadať vysvetlenie.]
    ~ vola += 1
    -> vysvetlenie

* [Pozorovať ostatných ľudí.]
    ~ poznanie += 1
    -> pozorovanie


=== pozorovanie ===

Predavačka ovocia zdvihla zo zeme jablko. Dieťa naháňalo holuba. Starý muž ďalej čistil okno svojho obchodu. Nikto sa nepozrel na opustenú tašku.

Potom si pochopil, čo je na tom nesprávne.

Nielenže ich zmiznutie muža nezaujímalo.

Oni si ho nepamätali.

# player: Cudzinec
„Elara.“

# character: Elara
„Áno.“

# player: Cudzinec
„Kto to bol?“

Otvorila ústa.

Nič nepovedala.

Jej výraz sa zmenil.

# character: Elara
„Ja...“

Pozrela na tašku.

# character: Elara
„Neviem.“

# player: Cudzinec
„Pred chvíľou si ho videla.“

# character: Elara
„Viem.“

# player: Cudzinec
„Tak kto bol?“

# character: Elara
„Neviem!“

Prvý raz zvýšila hlas.

Niekoľko ľudí sa otočilo.

Elara ťa chytila za ruku.

# character: Elara
„Musíme ísť.“

-> archiv


=== zmiznutie ===

Na dlažbe zostala taška. Chlieb, dve jablká, kus syra a malá drevená hračka.

Zdvihol si ju.

Bol to koník.

Na spodnej strane bolo nožom vyryté meno.

MIRA.

# player: Cudzinec
„Mal dieťa,“ povedal si.

Elara si kľakla vedľa teba.

# character: Elara
„Možno.“

# player: Cudzinec
„Čo znamená možno?“

# character: Elara
„Znamená to, že o päť minút nemusí existovať nikto, kto si bude pamätať, že ho mal.“

Pozrel si na dreveného koníka.

{ma_mincu:
Čierna minca vo vrecku sa náhle zohriala.
}

# player: Cudzinec
„Môžeme ho zachrániť?“

Elara sa na teba pozrela zvláštnym spôsobom.

# character: Elara
„Ty si nový.“

# player: Cudzinec
„To nie je odpoveď.“

# character: Elara
„Práve preto si nový.“

Vzala ťa za rameno.

# character: Elara
„Poď.“

-> archiv


=== vysvetlenie ===

# player: Cudzinec
„Čo sa s ním stalo?“

# character: Elara
„Neviem.“

# player: Cudzinec
„Klamstvo.“

# character: Elara
„Samozrejme, že klamem. Poznáme sa asi tri minúty.“

# player: Cudzinec
„Tak prečo mám ísť s tebou?“

Elara sa pozrela na miesto, kde muž stál.

# character: Elara
„Pretože o chvíľu zabudnem, že tam vôbec niekto bol.“

Na sekundu zavrela oči.

Keď ich otvorila, ustúpila.

# character: Elara
„Prečo sa držíme?“

Pustil si jej ruku.

Elara sa pozrela na prázdne miesto na námestí.

Potom na teba.

# character: Elara
„Už sa to začalo.“

# player: Cudzinec
„Čo?“

# character: Elara
„Presne.“

Chytila ťa za rukáv.

# character: Elara
„Archív. Hneď.“

-> archiv


=== archiv ===

Archív sa nachádzal pod chrámom, ale neviedli doň žiadne schody. Elara otvorila dvere v bočnej uličke a za nimi bola kamenná chodba klesajúca hlboko pod zem. Keď si sa obzrel, dvere už neexistovali.

# player: Cudzinec
„Prečo ma to neprekvapuje?“ spýtal si sa.

# character: Elara
„To je zlé znamenie.“

# player: Cudzinec
„Prečo?“

# character: Elara
„Ortheon vyhráva.“

Zišli ste do kruhovej miestnosti plnej kníh. Police pokrývali steny od podlahy až po strop a rebríky medzi nimi sa pohybovali bez ľudskej pomoci. Uprostred sedel muž s bielymi vlasmi a písal do knihy hrubej ako náhrobný kameň.

# character: Elara
„Archivár,“ povedala Elara.

Muž nezdvihol hlavu.

# character: Archivár
„Nie.“

# character: Elara
„Potrebujeme pomoc.“

# character: Archivár
„Nie.“

# character: Elara
„Zmizol ďalší človek.“

Pero sa zastavilo.

# character: Archivár
„Človek?“

Elara mlčala.

Pozrela na teba.

Uvedomil si si, že už si nepamätá námestie.

Vytiahol si dreveného koníka.

{ma_mincu:
Keď si siahol do vrecka, nahmatal si vedľa koníka aj čiernu mincu.
}

# player: Cudzinec
„Toto po ňom zostalo.“

Archivár konečne zdvihol oči.

# character: Archivár
„Aha.“

# player: Cudzinec
„Čo aha?“

# character: Archivár
„Ty si ho ešte pamätáš.“

# player: Cudzinec
„Áno.“

# character: Archivár
„To je nepríjemné.“

# player: Cudzinec
„Pre koho?“

Archivár sa usmial.

# character: Archivár
„To je správna otázka.“

-> archiv_rozhovor


=== archiv_rozhovor ===

Archivár zavrel knihu.

# character: Archivár
„Myslíš si, že minulosť už nastala?“

# player: Cudzinec
„Áno.“

# character: Archivár
„Prečo?“

# player: Cudzinec
„Pretože je to minulosť.“

# character: Archivár
„Definícia nie je dôkaz.“

Elara si sadla na stôl.

# character: Elara
„Prosím, nezačínaj.“

Archivár ju ignoroval.

# character: Archivár
„Ak zničím všetky záznamy o človeku, zabijem všetkých, ktorí ho poznali, a odstránim všetky následky jeho činov, existoval?“

* [„Áno. Pravda nezávisí od toho, či ju niekto pozná.“]
    ~ vola += 1
    ~ poznanie += 1
    -> pravda_existuje

* [„Ak po ňom nezostane vôbec nič, otázka stráca význam.“]
    ~ pochybnost += 2
    -> pravda_neista

* [„Existoval pre seba. To stačí.“]
    ~ sucit += 2
    -> pravda_cloveka

* [„Neviem.“]
    ~ pochybnost += 1
    ~ poznanie += 1
    -> neviem


=== pravda_existuje ===

Archivár prikývol.

# character: Archivár
„Realista.“

# player: Cudzinec
„Ak tomu tak chceš hovoriť.“

# character: Archivár
„Ja tomu nijako hovoriť nechcem. Mená sú spôsob, akým pochovávame myšlienky, aby sme ich už nemuseli skúmať.“

Elara prevrátila oči.

# character: Elara
„A preto s tebou nikto nechodí piť.“

# character: Archivár
„Ja nepijem.“

# character: Elara
„Presne.“

Archivár opäť otvoril knihu.

# character: Archivár
„Ak máš pravdu, Ortheon pácha zločin proti skutočnosti.“

# player: Cudzinec
„A ak nemám?“

# character: Archivár
„Potom iba upratuje.“

-> kniha


=== pravda_neista ===

Archivár sa usmial.

# character: Archivár
„Nebezpečná odpoveď.“

# player: Cudzinec
„Prečo?“

# character: Archivár
„Pretože je veľmi ťažké argumentovať proti človeku, ktorý pripustí, že možno neexistuje nič, čo by stálo za obranu.“

# player: Cudzinec
„To som nepovedal.“

# character: Archivár
„Ešte nie.“

Elara zoskočila zo stola.

# character: Elara
„Prestaň ho skúšať.“

# character: Archivár
„Ja ho neskúšam.“

Archivár sa pozrel priamo na teba.

# character: Archivár
„Mesto áno.“

-> kniha


=== pravda_cloveka ===

Archivár sa prestal usmievať.

# character: Archivár
„To je veľmi ľudská odpoveď.“

# player: Cudzinec
„To mala byť urážka?“

# character: Archivár
„Nie. Varovanie.“

Elara sa na teba pozrela o niečo pozornejšie než predtým.

Archivár položil dlaň na svoju obrovskú knihu.

# character: Archivár
„Ak hodnota existencie vychádza zo samotného človeka, potom ani celý svet nemá právo rozhodnúť, že jeho život nemal význam.“

# player: Cudzinec
„Súhlasím.“

# character: Archivár
„Potom budeš mať s Ortheonom problém.“

-> kniha


=== neviem ===

Archivár sa rozosmial.

Nebolo v tom nič posmešné.

# character: Archivár
„Konečne.“

# player: Cudzinec
„Čo?“

# character: Archivár
„Človek, ktorý dokáže vysloviť dve najťažšie slová filozofie.“

Elara sa zamračila.

# character: Elara
„To sú dve slová?“

# character: Archivár
„V mojom rodnom jazyku áno.“

# character: Elara
„Hovoríme tvojím rodným jazykom.“

Archivár sa na chvíľu zamyslel.

# character: Archivár
„Do čerta.“

Prvý raz sa Elara usmiala.

-> kniha


=== kniha ===

Archivár vytiahol spod stola tenkú červenú knihu.

Na obálke nebol názov.

# character: Archivár
„Toto je kniha zajtrajška.“

# player: Cudzinec
„Proroctvo?“

# character: Archivár
„Nie. Proroctvá sú lacné. Toto je spomienka.“

# player: Cudzinec
„Na niečo, čo sa ešte nestalo?“

# character: Archivár
„Teraz začínaš chápať.“

Položil knihu pred teba.

Elara okamžite vstala.

# character: Elara
„Nie.“

# character: Archivár
„Musí si vybrať.“

# character: Elara
„Prišiel pred hodinou.“

# character: Archivár
„Práve preto.“

Pozrel si na knihu.

# player: Cudzinec
„Čo v nej je?“

Archivár pokrčil plecami.

# character: Archivár
„Tvoj zajtrajšok.“

# player: Cudzinec
„A ak ju neotvorím?“

# character: Archivár
„Potom ho budeš musieť prežiť.“

# player: Cudzinec
„A ak ju otvorím?“

# character: Archivár
„Tiež.“

Ticho.

# player: Cudzinec
„Tak aký je rozdiel?“

Archivár sa naklonil bližšie.

# character: Archivár
„Ak poznáš svoje budúce rozhodnutie a napriek tomu ho urobíš, bolo niekedy slobodné?“

Elara položila dlaň na knihu.

# character: Elara
„Neotváraj ju.“

Archivár položil dlaň na druhú stranu.

# character: Archivár
„Otvor ju.“

Vonku zazvonili zvony.

Tentoraz sa zachvela celá miestnosť.

{ma_mincu:
Čierna minca vo vrecku začala páliť.
}

* [Otvoriť knihu zajtrajška.]
    ~ ma_knihu = true
    ~ poznanie += 3
    -> zajtrajsi_den

* [Odmietnuť ju otvoriť.]
    ~ vola += 2
    -> slobodna_nevedomost

* [Spýtať sa Elary, prečo sa jej bojí.]
    ~ sucit += 1
    -> elarin_strach

* {ma_mincu} [Položiť na knihu čiernu mincu.]
    ~ pochybnost += 2
    -> minca_a_kniha


=== zajtrajsi_den ===

Otvoril si knihu.

Na prvej strane bolo napísané:

# inscription: Kniha zajtrajška
    ZAJTRA ZABIJEŠ ELARU.

Zavrel si ju.

Elara stála oproti tebe.

Archivár sa díval do stola.

Nikto nič nepovedal.

Po chvíli sa Elara nadýchla.

# character: Elara
„Tak?“

* [Povedať jej pravdu.]
    ~ sucit += 2
    -> povedat_pravdu

* [Zaklamať.]
    ~ vola += 1
    -> klamstvo

* [Spýtať sa Archivára, či sa budúcnosť dá zmeniť.]
    ~ poznanie += 1
    -> buducnost


=== povedat_pravdu ===

# player: Cudzinec
„Píše sa tam, že ťa zajtra zabijem.“

Elara sa ani nepohla.

# character: Elara
„Aha.“

# player: Cudzinec
„Aha?“

# character: Elara
„Čakala som horšie.“

# player: Cudzinec
„Čo je horšie než to?“

# character: Elara
„Že by som zabila ja teba.“

# player: Cudzinec
„Prečo je to horšie?“

# character: Elara
„Pre mňa by bolo.“

Archivár potichu zatvoril svoju knihu.

Elara sa na teba pozrela.

# character: Elara
„Chceš ma zabiť?“

# player: Cudzinec
„Nie.“

# character: Elara
„Tak máme problém.“

# player: Cudzinec
„Prečo?“

# character: Elara
„Pretože teraz nevieme, či ma zajtra nezabiješ preto, že si to čítal, alebo napriek tomu, že si to čítal.“

Pozrela na červenú knihu.

# character: Elara
„A presne preto tú prekliatu vec nenávidím.“

-> buducnost


=== klamstvo ===

# player: Cudzinec
„Nič.“

Elara prižmúrila oči.

# character: Elara
„Prázdna?“

# player: Cudzinec
„Áno.“

Archivár sa na teba nepozrel.

To bolo horšie, než keby sa pozrel.

# character: Elara
„Tak poďme,“ povedala Elara.

Keď prešla okolo teba, na okamih si pocítil váhu knihy v rukách.

# thought
Zajtra ju zabiješ.

# thought
Ale teraz už existovala druhá otázka.

# thought
Bolo klamstvo prvým krokom k tomu zajtrajšku?

-> buducnost


=== buducnost ===

# player: Cudzinec
„Dá sa budúcnosť zmeniť?“ spýtal si sa.

Archivár odpovedal okamžite.

# character: Archivár
„Samozrejme.“

Uľavilo sa ti.

Potom pokračoval.

# character: Archivár
„Otázka je, či zmenená budúcnosť nebola od začiatku tou, ktorú si videl.“

# player: Cudzinec
„To je slovná hra.“

# character: Archivár
„Vitaj vo filozofii.“

Elara si obliekla kabát.

# character: Elara
„A teraz vitaj v praktickej filozofii. Niekto hore práve vymazáva ľudí z minulosti a ak tu zostaneme diskutovať o slobodnej vôli, čoskoro nebude existovať nikto, kto by tú diskusiu mohol prehrať.“

Archivár jej podal malý železný kľúč.

# character: Archivár
„Choďte ku kráľovnej.“

Elara stuhla.

# character: Elara
„Kráľovná je mŕtva.“

# character: Archivár
„To jej nikdy veľmi neprekážalo.“

-> cesta_kralovna


=== slobodna_nevedomost ===

Odsunul si knihu.

# player: Cudzinec
„Nechcem vedieť.“

Archivár sa zamračil.

# character: Archivár
„Prečo?“

# player: Cudzinec
„Pretože ak je budúcnosť pevná, poznanie mi nepomôže. A ak pevná nie je, nechcem, aby moje rozhodnutia ovplyvnila predstava toho, čo údajne urobím.“

Dlho mlčal.

# character: Archivár
„To nie je hlúpe.“

Elara sa zasmiala.

# character: Elara
„Od neho je to prakticky vyznanie lásky.“

Archivár ignoroval poznámku a schoval knihu.

# character: Archivár
„Možno je nevedomosť niekedy podmienkou slobody.“

# character: Elara
„Alebo výhovorkou,“ povedala Elara.

# character: Archivár
„Aj to.“

Podal jej železný kľúč.

# character: Archivár
„Choďte ku kráľovnej.“

# character: Elara
„Je mŕtva.“

# character: Archivár
„Áno.“

# player: Cudzinec
„Tak prečo tam ideme?“

Archivár sa vrátil k písaniu.

# character: Archivár
„Pretože to ešte nevie.“

-> cesta_kralovna


=== elarin_strach ===

# player: Cudzinec
„Prečo nechceš, aby som ju otvoril?“

Elara sa dívala na červenú obálku.

# character: Elara
„Pretože som ju otvorila ja.“

Archivár zdvihol hlavu.

# character: Archivár
„Elara.“

# character: Elara
„Má právo vedieť.“

# player: Cudzinec
„Čo si videla?“ spýtal si sa.

Jej sivé oči sa stretli s tvojimi.

# character: Elara
„Teba.“

Ticho.

# player: Cudzinec
„To je všetko?“

# character: Elara
„Nie.“

# player: Cudzinec
„Čo som robil?“

Elara odtiahla ruku od knihy.

# character: Elara
„Umieral si.“

* [Otvoriť knihu napriek tomu.]
    ~ ma_knihu = true
    ~ poznanie += 2
    -> zajtrajsi_den

* [Nechať knihu zatvorenú.]
    ~ sucit += 1
    ~ vola += 1
    -> slobodna_nevedomost


=== minca_a_kniha ===

Položil si čiernu mincu na červenú obálku.

Archivár vyskočil.

# character: Archivár
„Nie!“

Príliš neskoro.

Minca sa zaborila do knihy, akoby jej obálka bola z vody.

Všetky sviece zhasli.

V tme sa ozval hlas.

Tvoj hlas.

# system: Tvoj hlas
    „Ak toto počuješ, prehral som.“

Elara ťa chytila za ruku.

Hlas pokračoval.

# system: Tvoj hlas
    „Never Archivárovi. Never kráľovnej. A predovšetkým never mne.“

Potom sa sviece znovu zapálili.

Kniha bola preč.

Minca ležala na stole.

Na jej povrchu už nebola tvoja tvár.

Bola tam Elara.

Archivár bol bledý.

# character: Archivár
„Odkiaľ máš tú mincu?“

# player: Cudzinec
„Od starca pri bráne.“

# character: Elara
„Pri akej bráne?“

Pozrel si na Elaru.

Aj ona vyzerala zmätene.

V tej chvíli si pochopil.

Nikto okrem teba si nepamätal, že Ortheon má bránu.

~ videl_sen = true

-> cesta_kralovna


=== cesta_kralovna ===

Kráľovský palác stál na opačnom konci mesta. Cesta k nemu viedla cez štvrť, ktorú obyvatelia nazývali Tichá, hoci bola plná ľudí.

Nikto tam však nevydával zvuk.

Kováč udieral kladivom do rozžeraveného železa a nič si nepočul. Kolesá vozov sa otáčali po dlažbe bez rachotu. Dieťa plakalo bez hlasu.

# player: Cudzinec
„Čo je toto miesto?“ spýtal si sa.

Elara ti odpovedala až po niekoľkých krokoch.

# character: Elara
„Pred sto rokmi tu žil filozof menom Var. Tvrdil, že väčšina ľudského utrpenia vzniká slovami. Klamstvá, urážky, príkazy, rozsudky, sľuby, ktoré sa nedajú splniť.“

# player: Cudzinec
„A?“

# character: Elara
„Mesto mu splnilo želanie.“

Pozrel si na nemých ľudí.

# player: Cudzinec
„To chcel?“

# character: Elara
„Nie.“

# player: Cudzinec
„Tak prečo—“

# character: Elara
„Ortheon nedáva ľuďom to, čo chcú.“

Elara zastala.

Pred vami sa týčil čierny palác.

# character: Elara
„Dáva im to, čo ich presvedčenie znamená, keď ho dotiahneš až do konca.“

Pred bránou stál jediný strážca.

Nemal tvár.

Na mieste očí, nosa a úst bola hladká koža.

Vytiahol meč.

Elara vytiahla svoj.

# character: Elara
„A teraz,“ povedala, „prichádza tá časť filozofie, pri ktorej ľudia zvyčajne začnú krvácať.“

* [Pokúsiť sa so strážcom komunikovať.]
    ~ sucit += 1
    -> strazca_rozhovor

* [Zaútočiť skôr než on.]
    ~ vola += 2
    -> boj_strazca

* [Hľadať inú cestu do paláca.]
    ~ pochybnost += 1
    -> ina_cesta


=== strazca_rozhovor ===

# player: Cudzinec
„Nechceme bojovať.“

Strážca naklonil hlavu.

Nemal ústa.

# character: Elara
„To som si mohol domyslieť.“

Elara držala meč pripravený.

Strážca ukázal na teba.

Potom na svoje srdce.

Potom na palác.

# player: Cudzinec
„Mám zomrieť, aby som mohol vstúpiť?“

Strážca zavrtel hlavou.

Ukázal na seba.

Na svoje srdce.

A potom ti podal meč.

Elara potichu zahrešila.

Pochopil si.

Strážca nechcel zabiť teba.

Chcel, aby si zabil jeho.

* [Odmietnuť.]
    ~ sucit += 2
    -> odmietnutie_strazcu

* [Splniť jeho želanie.]
    ~ zabil_strazcu = true
    ~ vola += 2
    -> smrt_strazcu


=== odmietnutie_strazcu ===

Položil si jeho meč na zem.

# player: Cudzinec
„Nie.“

Strážca sa nepohol.

# player: Cudzinec
„Ak chceš zomrieť, nemusím byť ja ten, kto to urobí.“

Strážca sklonil hlavu.

Potom si kľakol.

Elara naňho chvíľu pozerala.

# character: Elara
„Myslíš, že si urobil správnu vec?“

# player: Cudzinec
„Neviem.“

# character: Elara
„Dobré.“

# player: Cudzinec
„Archivár by bol na mňa hrdý.“

# character: Elara
„Tak som to nemyslela.“

Prešli ste okolo strážcu.

Nezastavil vás.

-> kralovna


=== smrt_strazcu ===

Vzal si meč.

Strážca si kľakol.

Nebolo v tom hrdinstvo. Žiadny posledný prejav, žiadna prosba, žiadna veľká pravda.

Len človek bez tváre, ktorý chcel zomrieť.

Urobil si to rýchlo.

Keď telo dopadlo na zem, Elara sa na teba nepozrela.

# player: Cudzinec
„Sám to chcel,“ povedal si.

# character: Elara
„Viem.“

# player: Cudzinec
„Tak prečo sa tváriš, akoby som ho zavraždil?“

# character: Elara
„Pretože súhlas človeka ešte neodpovedá na otázku, či je správne urobiť všetko, s čím súhlasí.“

Utrel si krv z čepele.

# player: Cudzinec
„A čo som mal urobiť?“

Elara otvorila bránu.

# character: Elara
„Neviem.“

# thought
Prvý raz ti tá odpoveď nepripadala múdra.

-> kralovna


=== boj_strazca ===

Strážca bol rýchlejší, než si čakal.

Jeho prvý úder si odrazil iba náhodou. Elara zaútočila zboku, ale strážca ustúpil a jej čepeľ prešla prázdnym vzduchom.

Boj netrval dlho.

Keď si dostal príležitosť, vrazil si mu čepeľ pod rebrá.

Strážca zostal stáť.

Potom položil ruku na tvoje rameno.

Nemal ústa, ale napriek tomu si vedel, že sa usmieva.

Zomrel spokojný.

# thought
To bolo horšie, než keby ťa preklínal.

~ zabil_strazcu = true

-> kralovna


=== ina_cesta ===

Obišli ste palác.

Na zadnej strane nebola brána, iba vysoká stena obrastená bielym brečtanom.

# player: Cudzinec
„Môžeme vyliezť.“

Elara sa pozrela hore.

# character: Elara
„Môžeme.“

# player: Cudzinec
„Ale?“

# character: Elara
„Palác nemá zadnú stranu.“

Pozrel si na stenu.

# player: Cudzinec
„Stojíme pri nej.“

# character: Elara
„Áno.“

# player: Cudzinec
„Tak ju má.“

# character: Elara
„To som si myslela aj ja.“

Obišli ste roh.

Ocitol si sa pred hlavnou bránou.

Strážca tam už nebol.

# player: Cudzinec
„Kam zmizol?“

Elara pokrčila plecami.

# character: Elara
„Možno sme sa rozhodli nebojovať.“

# player: Cudzinec
„Tak jednoducho?“

# character: Elara
„Nie. Jednoduché by bolo bojovať.“

-> kralovna


=== kralovna ===

Trónna sieň bola prázdna.

Na konci miestnosti sedela na kamennom tróne kostra v bielych šatách. Na lebke mala zlatú korunu.

# character: Elara
„Vaše Veličenstvo,“ povedala Elara.

Kostra otvorila oči.

Boli modré.

# character: Kráľovná
„Meškáš.“

Elara stuhla.

# character: Elara
„Poznáte ma?“

# character: Kráľovná
„Poznala som ťa zajtra.“

Kráľovná sa pozrela na teba.

{ma_knihu:
# character: Kráľovná
„A ty si otvoril knihu.“
}

{videl_sen:
# character: Kráľovná
„A ty si počul svoj vlastný hlas.“
}

{zabil_strazcu:
# character: Kráľovná
„A zabil si človeka, ktorý si želal zomrieť. Zaujímavé.“
}

# player: Cudzinec
„Prečo ľudia miznú?“ spýtal si sa.

Kráľovná vstala.

Kosti pod šatami zapraskali.

# character: Kráľovná
„Pretože mesto umiera.“

# player: Cudzinec
„Mesto je živé?“

# character: Kráľovná
„Nie.“

Prišla bližšie.

# character: Kráľovná
„A práve v tom je problém.“

Za jej chrbtom sa otvorila stena.

Nebola za ňou ďalšia miestnosť.

Bola tam obloha.

Nie nočná obloha nad Ortheonom. Čierny priestor plný hviezd a uprostred neho niečo obrovské, čo sa pomaly otáčalo.

Vyzeralo to ako mesto poskladané do gule.

Ulice prechádzali jedna do druhej. Veže rástli dovnútra. Rieky tiekli smerom hore.

A medzi tým všetkým boli milióny svetiel.

# player: Cudzinec
„Čo to je?“

Kráľovná sa usmiala.

# character: Kráľovná
„Ortheon.“

Pozrel si cez okno na nemožné mesto.

# player: Cudzinec
„Tak kde sme?“

# character: Kráľovná
„V jeho spomienke.“

Elara zbledla.

# character: Elara
„To nie je možné.“

# character: Kráľovná
„Samozrejme, že je.“

Kráľovná sa otočila k nej.

# character: Kráľovná
„Veď si tu.“

-> pravda_mesta


=== pravda_mesta ===

Kráľovná ti vysvetlila, že skutočný Ortheon zanikol pred tisíc rokmi. Jeho poslední mágovia odmietli prijať smrť mesta a vytvorili zaklínadlo, ktoré malo zachovať všetko: každého človeka, každú ulicu, každý rozhovor, každú spomienku.

Zaklínadlo uspelo.

Príliš dobre.

Mesto si pamätalo všetko, a preto nedokázalo nič zabudnúť. Každá možnosť, ktorú človek mohol zvoliť, zostala niekde v jeho pamäti. Každé nevyslovené slovo. Každý človek, ktorý sa mohol narodiť. Každá budúcnosť, ktorá nikdy nenastala.

# character: Kráľovná
„A teraz už nemá miesto,“ povedala kráľovná.

# player: Cudzinec
„Miesto kde?“

# character: Kráľovná
„V sebe.“

Elara pochopila skôr než ty.

# character: Elara
„Preto vymazáva ľudí.“

Kráľovná prikývla.

# character: Kráľovná
„Najskôr zabúdalo kamene. Potom domy. Potom mená. Teraz ľudí.“

# player: Cudzinec
„Dá sa to zastaviť?“

# character: Kráľovná
„Áno.“

Samozrejme.

V Ortheone bola tá najhoršia odpoveď vždy áno.

# player: Cudzinec
„Ako?“

Kráľovná ukázala na tri dvere.

Prvé boli biele.

Druhé čierne.

Tretie nemali farbu. Keď si sa na ne prestal sústrediť, zabudol si, že tam sú.

# character: Kráľovná
„Mesto musí dostať nový princíp,“ povedala. „Novú odpoveď na otázku, čo stojí za zachovanie.“

# player: Cudzinec
„A ja mám rozhodnúť?“

# character: Kráľovná
„Nie.“

Kráľovná sa usmiala.

# character: Kráľovná
„Ty máš rozhodnúť, podľa čoho bude rozhodovať ono.“

-> tri_dvere


=== tri_dvere ===

Kráľovná ukázala na biele dvere.

# character: Kráľovná
„Za prvými je Pravda. Mesto zachová iba to, čo sa skutočne stalo. Všetky nenaplnené možnosti, sny a alternatívne životy zmiznú.“

Potom ukázala na čierne.

# character: Kráľovná
„Za druhými je Milosrdenstvo. Mesto nebude zachovávať udalosti, ale ľudí. Ich spomienky sa môžu meniť, ich minulosť môže byť nepresná, ale nikto už nebude vymazaný.“

Nakoniec ukázala na tretie.

# player: Cudzinec
„A tam?“

Kráľovná mlčala.

# player: Cudzinec
„Čo je za tretími?“

# character: Kráľovná
„Sloboda.“

Elara sa na ňu pozrela.

# character: Elara
„Čo to znamená?“

# character: Kráľovná
„Mesto prestane rozhodovať.“

# player: Cudzinec
„A čo sa stane?“

# character: Kráľovná
„Neviem.“

Ticho v trónnej sieni bolo absolútne.

Prvý raz si mal pocit, že kráľovná hovorí pravdu.

* [Vybrať Pravdu.]
    ~ poznanie += 3
    -> koniec_pravda

* [Vybrať Milosrdenstvo.]
    ~ sucit += 3
    -> koniec_milosrdenstvo

* [Vybrať Slobodu.]
    ~ vola += 3
    -> koniec_sloboda

* [Odmietnuť rozhodnúť.]
    ~ pochybnost += 3
    -> koniec_odmietnutie


=== koniec_pravda ===

Otvoril si biele dvere.

Nebolo za nimi svetlo.

Bola tam skutočnosť.

Ortheon sa zachvel.

Milióny nenaplnených životov zmizli v jedinom okamihu. Deti, ktoré sa nikdy nenarodili. Lásky, ktoré nikto nevyznal. Vojny, ktoré nezačali. Básne, ktoré nikto nenapísal. Odpustenia, ku ktorým nikdy nedošlo.

Zostalo iba to, čo bolo.

Elara stála vedľa teba.

# character: Elara
„Je to správne?“

Pozrel si na mesto.

Bolo menšie.

Oveľa menšie.

Ale prvý raz bolo tiché.

# player: Cudzinec
„Je to pravdivé,“ povedal si.

Elara sa smutne usmiala.

# character: Elara
„To som sa nepýtala.“

# inscription: Záver
KONIEC
# inscription: Záver
PRAVDA NEPOTREBUJE BYŤ LÁSKAVÁ.

-> END


=== koniec_milosrdenstvo ===

Otvoril si čierne dvere.

Každý človek, ktorého Ortheon vymazal, sa vrátil.

Na uliciach sa objavili tisíce ľudí. Potom desaťtisíce. Potom milióny.

Otcovia objímali deti, ktoré si ich nepamätali. Mŕtvi sa stretávali so živými. Ľudia si navzájom odporovali v tom, čo sa stalo včera, pred rokom alebo pred storočím.

Pravda sa začala rozpadať.

Ale nikto nezmizol.

Elara stála vedľa teba.

# character: Elara
„Teraz bude každý žiť vo vlastnej minulosti.“

# player: Cudzinec
„Možno.“

# character: Elara
„To môže byť strašné.“

# player: Cudzinec
„Áno.“

Pozrel si na ľudí pod palácom.

Hádali sa.

Plakali.

Smiali sa.

Žili.

# inscription: Záver
KONIEC
# inscription: Záver
MOŽNO ČLOVEK NIE JE TO, ČO SI PAMÄTÁ.
# inscription: Záver
MOŽNO JE TO TEN, KTO SI PAMÄTÁ.

-> END


=== koniec_sloboda ===

Otvoril si tretie dvere.

Nič sa nestalo.

Potom vyšlo slnko.

Na západe.

Elara sa rozosmiala.

# character: Elara
„To je všetko?“

Kráľovná sa pozrela z okna.

# character: Kráľovná
„Nie.“

Jej koruna dopadla na zem.

Kostra sa rozpadla.

Palác začal miznúť.

# character: Elara
„Čo si urobil?“ zakričala Elara.

# player: Cudzinec
„Neviem!“

Utekali ste.

Ulice sa menili pod nohami. Niektoré domy zmizli. Iné sa objavili. Ľudia starli a mladli. Zvony zvonili bez dôvodu.

Ortheon už nič nekontrolovalo.

Možno zomieral.

Možno sa prvý raz narodil.

Keď ste dobehli k mestskej bráne, sedel pri nej starec.

Usmieval sa.

# character: Starec
„Tak čo?“ spýtal sa. „Našiel si, čo si hľadal?“

# player: Cudzinec
„Nie.“

# character: Starec
„Výborne.“

Podal ti čiernu mincu.

Tentoraz si ju odmietol.

Nie zo strachu.

Nie z múdrosti.

Jednoducho preto, že si mohol.

# inscription: Záver
KONIEC
# inscription: Záver
SLOBODA NIE JE SPRÁVNA ODPOVEĎ.
# inscription: Záver
SLOBODA JE MOŽNOSŤ ODPOVEDAŤ ZLE.

-> END


=== koniec_odmietnutie ===

# player: Cudzinec
„Nie.“

Kráľovná sa zamračila.

# character: Kráľovná
„Musíš si vybrať.“

# player: Cudzinec
„Prečo?“

# character: Kráľovná
„Pretože mesto potrebuje odpoveď.“

# player: Cudzinec
„Potom nech si ju nájde.“

# character: Kráľovná
„Mesto nie je človek.“

# player: Cudzinec
„Tak prečo mu dávame právo rozhodovať o ľuďoch?“

Elara mlčala.

Kráľovná sa pomaly posadila na trón.

# character: Kráľovná
„Asterion povedal presne to isté.“

Pozrel si na ňu.

Bezhlavý kráľ.

Spravodlivý.

Zbabelec.

Mudrc.

# player: Cudzinec
„Čo sa s ním stalo?“

Kráľovná ukázala na teba.

# character: Kráľovná
„Stojí predo mnou.“

Svet sa zastavil.

Spomenul si si na veci, ktoré sa ti nikdy nestali.

Korunu.

Dvoch synov.

Vojnu, ktorá nebola vojnou.

Rozhodnutie, ktoré si odmietol urobiť.

A mesto, ktoré si vytvoril, aby už nikdy nemuselo nič stratiť.

Elara ustúpila.

# character: Elara
„Ty...“

# player: Cudzinec
„Nie,“ povedal si.

Ale tentoraz si nevedel, či odmietaš kráľovnú, mesto alebo vlastnú minulosť.

Vo vrecku si nahmatal čiernu mincu.

Na jednej strane bola tvoja tvár.

Na druhej tiež.

# inscription: Záver
KONIEC
# inscription: Záver
AJ ODMIETNUTIE ROZHODNÚŤ JE ROZHODNUTIE.

-> END

// =========================================================
// UKÁŽKA TYPOV TEXTU PRE READER
// Tento knot nie je napojený na hlavný príbeh; slúži ako vzor.
// =========================================================
