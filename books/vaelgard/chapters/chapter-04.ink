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
Poplachové zvony Vaelgardu zneli celú noc.

Draci boli nepokojní. Niektorí odmietali jazdcov. Iní sa k nim tlačili tak blízko, akoby sa báli, že ich niečo odtrhne.

Nymar spal iba krátko. Keď otvoril oči, cítil si jeho únavu ešte skôr než vlastnú.

# character: Nymar
„Niečo pod nami dýcha.“

Rektor Avar zhromaždil vás, Lyru, Tarena, Seris a troch starších jazdcov pri zostupnej šachte.

# character: Rektor Avar
„Kotva je štyristo metrov pod akadémiou. Od poslednej noci vysiela impulzy každých sedemnásť minút.“

# character: Taren
„A čo presne urobíme, keď ju nájdeme?“

# character: Rektor Avar
„To zistíme, keď prežijeme cestu.“

-> zostup

=== zostup ===
Šachta bola príliš úzka na let. Draci museli zostupovať po kamenných rímsach.

Po treťom impulze sa Nymar zastavil.

Bolesť prešla putom ako horúci drôt.

~ zranenie += 1

# player: Ty
„Nymar?“

# character: Nymar
„Pokračuj.“

* [Trvať na prestávke.]
    ~ sucit += 1
    ~ puto += 1
    -> prestavka
* [Pokračovať, kým je cesta otvorená.]
    ~ odvaha += 1
    -> most
* [Skúsiť počas impulzu sledovať smer Kotvy.]
    ~ rozum += 1
    ~ tajomstvo += 1
    -> rezonancia

=== prestavka ===
Položil si dlaň na Nymarov krk.

# player: Ty
„Nie sme vojenská jednotka. Ak potrebuješ zastaviť, zastavíme.“

Avar sa obzrel, ale nič nepovedal.

Nymar zavrel oči.

# character: Nymar
„Toto je možno prvý rozkaz vo Vaelgarde, ktorý sa mi páči.“

Po chvíli ste pokračovali.

-> most

=== rezonancia ===
Keď prišiel ďalší impulz, nesnažil si sa mu brániť.

Na okamih si cítil stovky pút. Ľudské mysle. Dračie mysle. Strach, bolesť, dôveru, nenávisť.

A pod tým všetkým ešte niečo.

Nie stroj.

Vedomie.

# player: Ty
„Kotva je živá.“

Avar sa prudko otočil.

# character: Rektor Avar
„Čo?“

# player: Ty
„Niečo tam dole nás cíti.“

Nymar prikývol.

~ tajomstvo += 2
-> most

=== most ===
Podzemný most prechádzal cez dutinu takú veľkú, že svetlo lámp nedosiahlo na dno.

V polovici cesty sa ozval ďalší impulz.

Jeden zo starších drakov zreval a udrel krídlom do steny. Jeho jazdec spadol na kolená.

Potom sa z tmy pod mostom vynorili bledé tvory podobné drakom, ale bez očí.

# character: Seris
„Prázdni!“

Taren vytiahol meč.

# character: Taren
„Predpokladám, že to nie je priateľský názov.“

-> boj

=== boj ===
Prázdni liezli po stenách. Neboli veľkí, ale pohybovali sa rýchlo.

* [Držať líniu pri zranenom jazdcovi.]
    ~ sucit += 1
    ~ odvaha += 1
    -> obrana
* [S Nymarom preraziť dopredu.]
    ~ odvaha += 2
    -> utok
* [Pozorovať, ako Prázdni reagujú na impulzy Kotvy.]
    ~ rozum += 2
    ~ tajomstvo += 1
    -> vzorec

=== obrana ===
Postavil si sa medzi zraneného jazdca a prvého Prázdneho.

Nymar ho zrazil bokom chvostom.

# character: Nymar
„Vľavo.“

Uhol si sa pazúrom druhého tvora a Seris ho zasiahla kopijou.

Keď bol jazdec opäť na nohách, skupina pokračovala.

~ puto += 1
-> brana

=== utok ===
# player: Ty
„Nymar, dopredu!“

Vyrazili ste.

Na úzkom moste nebolo miesto na chybu. Nymar jedného tvora zhodil do priepasti, druhého zachytil čeľusťami.

Tretí sa vrhol na teba.

Tarenov meč ho zastavil.

# character: Taren
„Dlh zo schodov splatený.“

-> brana

=== vzorec ===
Všimol si si, že tesne pred každým impulzom Prázdni na okamih stuhnú.

# player: Ty
„Počkajte na impulz!“

Avar pochopil.

Keď Kotva znovu udrela, všetci zaútočili naraz.

Prázdni sa nestihli brániť.

# character: Rektor Avar
„Dobré.“

# player: Ty
„Pochváľte ma, keď nebudeme pod zemou obkľúčení slepými drakmi.“

-> brana

=== brana ===
Na konci mosta stála brána z čierneho kovu.

Nebola zamknutá.

Keď sa jej Nymar dotkol, otvorila sa sama.

Za ňou bola Kotva.

Nebola to veža ani stroj. Bola to obrovská dračia kostra zarastená kryštálmi. Z rebier viedli tisíce strieborných vlákien nahor do Vaelgardu.

Nymar prestal dýchať.

# character: Nymar
„Poznám ju.“

# player: Ty
„Koho?“

# character: Nymar
„Vaeloru.“

Avar zbledol.

-> vaelora

=== vaelora ===
V lebke dávno mŕtvej dračice sa rozžiarilo strieborné svetlo.

Hlas zaznel vo všetkých mysliach naraz.

# character: Vaelora
„Konečne.“

Seris klesla na jedno koleno. Taren zanadával.

# character: Rektor Avar
„Vaelora bola drak mága Vaelora.“

# character: Vaelora
„Nie.“

Kryštály sa rozžiarili silnejšie.

# character: Vaelora
„Vaelor bol môj jazdec.“

Nymar sa priblížil ku kostre.

# character: Vaelora
„Keď ľudia prehrávali vojnu, prosil ma, aby som držala putá pokope. Súhlasila som.“

# player: Ty
„Takže Kotva bola dobrovoľná?“

# character: Vaelora
„Na jednu noc.“

Ticho.

# character: Vaelora
„Potom som požiadala, aby ma oslobodil.“

Avar zavrel oči.

# character: Vaelora
„Neurobil to.“

-> volba

=== volba ===
Vaelora vysvetlila, že jej vedomie prežilo v Kotve celé stáročia. Systém už nedokázala udržiavať.

Mali ste tri možnosti.

Kotvu opraviť a pokračovať v starom systéme.

Prerušiť ju okamžite a riskovať všetky existujúce putá.

Alebo ju premeniť tak, aby každé puto mohlo pokračovať iba so súhlasom oboch strán.

Avar sa pozrel na teba.

# character: Rektor Avar
„Tretia možnosť nikdy nebola v záznamoch.“

# character: Vaelora
„Pretože ste sa nikdy nespýtali Kotvy.“

* [Opraviť Kotvu. Príliš veľa životov závisí od stability.]
    ~ rozum += 2
    -> opravit
* [Zničiť Kotvu. Sloboda nemôže čakať na bezpečný okamih.]
    ~ vzdor += 2
    -> znicit
* [Premeniť Kotvu na dobrovoľné puto.]
    ~ sucit += 2
    ~ puto += 2
    -> premenit

=== opravit ===
Avar položil ruku na kryštál.

# character: Nymar
„Ak to urobíš, nič sa nezmení.“

Pozrel si na Nymara.

# player: Ty
„Zmení. Pretože teraz vieme, čo to je. A budeme hľadať bezpečný spôsob, ako to ukončiť.“

# character: Nymar
„To je sľub?“

# player: Ty
„Áno.“

Spolu ste stabilizovali praskajúce vlákna.

Vaelora nevydala ani hlásku.

Keď bolo po všetkom, jej svetlo bolo slabšie.

# character: Vaelora
„Tak ešte chvíľu.“

Nebolo to víťazstvo.

Ale hora prestala triasť.

-> epilog

=== znicit ===
# player: Ty
„Dosť.“

Avar vykročil.

# character: Rektor Avar
„Nevieš, čo to spôsobí.“

# player: Ty
„A vy ste štyristo rokov nevedeli, čo spôsobuje jej pokračovanie.“

Nymar položil pazúr na hlavný kryštál.

Ty dlaň vedľa neho.

Puto medzi vami sa naplo.

Potom kryštál praskol.

Bolesť bola absolútna.

Na okamih si necítil Nymara.

Potom sa v tme objavila jeho myseľ.

Nie pripútaná.

Prítomná.

# character: Nymar
„Som tu.“

Po celej hore začali draci kričať.

Niektorí odleteli.

Iní zostali.

~ puto += 3
-> epilog

=== premenit ===
# player: Ty
„Ak bolo prvé puto dobrovoľné, vráťme mu tú možnosť.“

# character: Rektor Avar
„Ako?“

Nymar pristúpil k Vaelore.

# character: Nymar
„Spolu.“

Dotkol si sa jeho krku.

Vaelora otvorila cez vás všetky putá Vaelgardu.

Stovky hlasov.

Každému zaznela rovnaká otázka.

# character: Vaelora
„Zostávaš?“

Niektoré putá zhasli.

Iné zosilneli.

Nymarova prítomnosť sa na okamih vzdialila.

Mohol odísť.

Skutočne mohol.

Potom sa vrátil.

# character: Nymar
„Zostávam.“

# player: Ty
„Prečo?“

# character: Nymar
„Teraz sa môžeš pýtať.“

Vaelora sa zasmiala. Bol to prvý pokojný dračí zvuk, ktorý si od nej počul.

Potom jej svetlo zhaslo.

~ puto += 5
~ tajomstvo += 2
-> epilog

=== epilog ===
O tri dni neskôr sa nad Vaelgardom znovu lietalo.

Nie všetci draci zostali. Nie všetci jazdci prijali to, čo sa stalo. Rektor Avar zvolal radu a po prvýkrát v dejinách akadémie na nej mali miesto aj draci bez jazdcov.

Lyra začala prepisovať dejiny Vaelgardu.

Taren tvrdil, že by ich najprv mali skrátiť.

Eren sa zotavoval.

A ty si stál s Nymarom na tej istej skalnej plošine, z ktorej ste prvýkrát skočili.

Pod vami sa rozprestierali hory.

# character: Nymar
„Kam teraz?“

Pozrel si na horizont.

Prvý rok na akadémii sa ešte ani poriadne nezačal.

# player: Ty
„Hore.“

Nymar roztiahol krídla.

# system
Koniec prvej časti Vaelgardu.
-> DONE
