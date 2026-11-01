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
Rada Vaelgardu zasadala po prvýkrát s drakmi.

Praktický problém sa ukázal okamžite: zasadacia sieň bola postavená pre ľudí.

Sareth mala hlavu prestrčenú cez otvorené okno. Rok ležal na nádvorí a Taren mu opakoval diskusiu cez puto. Nymar odmietol zostať vonku a zabral polovicu priestoru pri dverách.

Na stole ležal list z tábora lovcov.

# character: Rektor Avar
„Východné kniežatstvá porušili dohodu z Arkenu.“

Starý generál Merovan udrel päsťou do stola.

# character: Generál Merovan
„Tak odpovedzme silou.“

# character: Nymar
„Koho silou?“

Generál sa otočil.

# character: Generál Merovan
„Prosím?“

# character: Nymar
„Keď hovoríš, že Vaelgard odpovie silou, myslíš ľudí aj drakov. Pýtal si sa drakov?“

V sále nastalo ticho.

* [Podporiť Nymara.]
    ~ sucit += 1
    ~ vzdor += 1
    -> spor_rady
* [Navrhnúť najprv prieskum.]
    ~ rozum += 2
    -> prieskum
* [Súhlasiť, že únosy drakov vyžadujú tvrdú odpoveď.]
    ~ odvaha += 1
    -> merovan

=== spor_rady ===
# player: Ty
„Ak má byť toto nová rada, nemôžeme používať staré pravidlá zakaždým, keď sú pohodlné.“

Merovan si ťa premeral.

# character: Generál Merovan
„Kadet poučuje radu o vojne.“

# player: Ty
„Nie. Kadet pripomína rade, kto v tej vojne bude lietať.“

Nymar spokojne vydýchol dym.

-> prieskum

=== merovan ===
# player: Ty
„Unášajú mláďatá. Nemôžeme čakať.“

# character: Nymar
„Súhlasím.“

Generál sa takmer usmial.

# character: Nymar
„Ale ja rozhodnem, či budem bojovať.“

Úsmev zmizol.

-> prieskum

=== prieskum ===
Rada rozhodla vyslať malú skupinu na hranicu.

Nie armádu. Kadetov.

# character: Lyra
„To je buď prejav dôvery, alebo spôsob, ako sa nás zbaviť.“

# character: Taren
„Prečo nie oboje?“

Vašou úlohou bolo dostať sa do mesta Arken, zistiť, kto organizuje lov drakov, a nevyvolať diplomatický incident.

Seris vám pri odchode zopakovala poslednú časť trikrát.

-> cesta

=== cesta ===
Leteli ste dva dni na východ.

Krajina sa menila. Hory ustúpili zeleným pahorkom, dedinám a širokým cestám. Ľudia pri pohľade na draky neutekali, ale ani nemávali.

V prvej dedine hostinský odmietol ubytovať jazdcov.

# character: Hostinský
„Draky zostanú za dedinou.“

# character: Taren
„Rok je čistotnejší než ja.“

# character: Hostinský
„Tomu verím.“

* [Rešpektovať pravidlo a prespať pri drakoch vonku.]
    ~ sucit += 1
    ~ puto += 1
    -> noc_cesta
* [Zaplatiť za celú stajňu.]
    ~ rozum += 1
    -> noc_cesta
* [Pohádať sa s hostinským.]
    ~ vzdor += 1
    -> klebety

=== klebety ===
Hádka pritiahla pozornosť miestnych.

Staršia žena pri peci si vás dlho prezerala.

# character: Starena
„Ak ste z Vaelgardu, mali by ste vedieť, čo sa o vás hovorí.“

# player: Ty
„Čo?“

# character: Starena
„Že draky už neposlúchajú. Že akadémia padá. Že jazdci prídu zobrať našich synov do vojny.“

Lyra stuhla.

# character: Lyra
„Kto to hovorí?“

# character: Starena
„Poslovia kniežaťa.“

~ tajomstvo += 1
-> noc_cesta

=== noc_cesta ===
V noci si sedel pri Nymarovi.

# character: Nymar
„Ľudia sa nás boja.“

# player: Ty
„Drakov?“

# character: Nymar
„Vaelgardu.“

Chvíľu ste sledovali oheň.

# character: Nymar
„Možno je rozdiel menší, než si myslíte.“

-> arken

=== arken ===
Arken bol obohnaný bielymi hradbami a červenými strechami. Draky do mesta nesmeli.

Museli ste ich nechať na lúke pri starej pevnosti.

# character: Nymar
„Nepáči sa mi to.“

# player: Ty
„Mne tiež.“

# character: Nymar
„Nie. Myslím mesto. Smrdí železom.“

Puto sa medzi vami natiahlo, keď si prešiel bránou.

Prvýkrát od Kotvy ste boli od seba tak ďaleko.

-> mesto

=== mesto ===
Lyra chcela ísť do knižnice obchodníckeho cechu. Taren navrhoval krčmy pri kasárňach.

* [Ísť s Lyrou po dokumentoch.]
    ~ rozum += 1
    -> kniznica
* [Ísť s Tarenom medzi vojakov.]
    ~ odvaha += 1
    -> krcma
* [Skúsiť cez trh zistiť, kto nakupuje kovové siete.]
    ~ tajomstvo += 1
    -> trh

=== kniznica ===
V cechových záznamoch ste našli objednávky na stovky kilogramov „leteckého zadržiavacieho zariadenia“.

Kupujúcim bola spoločnosť Ordan & Synovia.

# character: Lyra
„Spoločnosť vznikla pred šiestimi mesiacmi.“

# player: Ty
„Majiteľ?“

Lyra otočila register.

# character: Lyra
„Nikto. Vlastní ju iná spoločnosť.“

Po hodine sledovania papierovej stopy ste skončili pri mene: kancelár Veyr, hlavný poradca kniežaťa.

~ tajomstvo += 2
-> spojenie

=== krcma ===
Taren nepotreboval veľa času.

Po dvoch kolách piva sa vojaci začali chváliť.

# character: Vojak
„Knieža bude mať vlastných jazdcov. Nie tie vaelgardské bábky.“

# player: Ty
„Ako chce prinútiť draky, aby si ich vybrali?“

Vojak sa usmial.

# character: Vojak
„Naši učenci našli lepší spôsob.“

Taren pod stolom stisol päsť.

~ tajomstvo += 2
-> spojenie

=== trh ===
Kováč, ktorý vyrábal články sietí, najprv odmietal hovoriť.

Keď si mu ukázal poškodený hrot z pasce na Iri, zbledol.

# character: Kováč
„Povedali mi, že sú na gryfy.“

# player: Ty
„Kto?“

# character: Kováč
„Ľudia kancelára Veyra.“

# player: Ty
„Kde ich odvážajú?“

Kováč ukázal na severnú časť mesta.

# character: Kováč
„Stará mincovňa.“

-> spojenie

=== spojenie ===
Všetky stopy viedli k starej mincovni.

Po zotmení ste sa stretli pri kanáli.

# character: Lyra
„Veyr financuje lovcov.“

# character: Taren
„A vojaci hovoria o vlastných jazdcoch.“

# player: Ty
„Tak sa pozrime, čo razia v mincovni.“

-> mincovna

=== mincovna ===
Do budovy ste vošli starým odtokovým tunelom.

Vo vnútri neboli mince.

Boli tam laboratóriá.

Na kovových stoloch ležali kryštály podobné tým z Kotvy. V klietkach za sklom boli dračie šupiny, krv a kúsky kostí.

Lyra sa musela oprieť o stenu.

# character: Lyra
„Pokúšajú sa Kotvu napodobniť.“

Z vedľajšej miestnosti sa ozval výkrik.

Nie ľudský.

-> laboratorium

=== laboratorium ===
Za dverami ležal mladý drak pripútaný kovovými pásmi.

Vedľa neho sedel chlapec asi v tvojom veku s kryštálovým kruhom okolo hlavy.

Obaja sa triasli.

Muž v bielom plášti zapisoval údaje.

# character: Učenec
„Rezonancia tridsaťdva. Zvýšte tlak.“

* [Okamžite zasiahnuť.]
    ~ odvaha += 2
    ~ sucit += 1
    -> oslobodit
* [Najprv ukradnúť výskumné záznamy.]
    ~ rozum += 2
    -> zaznamy
* [Skontaktovať Nymara cez puto.]
    ~ puto += 1
    -> volanie

=== zaznamy ===
Lyra stiahla zo stola zväzok papierov.

Na titulnej strane stálo:

# inscription
PROJEKT KORUNA
UMELÁ REZONANCIA BEZ DRAČIEHO SÚHLASU

# character: Lyra
„Máme dôkaz.“

Chlapec znovu vykríkol.

# player: Ty
„Teraz ich dostaneme von.“

-> oslobodit

=== volanie ===
Sústredil si sa na Nymara.

Vzdialenosť bolela.

# player: Ty
„Nymar.“

Najprv nič.

Potom teplo.

# character: Nymar
„Viem, kde si.“

# player: Ty
„Ako?“

# character: Nymar
„Pretože si nahnevaný tak hlasno, že ťa počuje polovica kraja.“

Za mestskými hradbami sa ozval dračí rev.

Alarm.

# character: Taren
„Predpokladám, že diskrétnosť skončila.“

-> oslobodit

=== oslobodit ===
Taren zložil strážcu. Lyra rozbila ovládací kryštál.

Kovové pásy povolili.

Mladý drak sa pokúsil postaviť, ale spadol.

Chlapec si strhol kruh z hlavy.

# character: Chlapec
„Prosím. Nezabíjajte ma.“

# player: Ty
„Kto si?“

# character: Chlapec
„Cael. Dobrovoľník.“

Lyra naňho neveriacky pozrela.

# character: Cael
„Povedali nám, že Vaelgard si draky necháva pre šľachtu. Že Koruna umožní jazdiť komukoľvek.“

# character: Taren
„A povedali ti, čo to robí drakovi?“

Cael sa pozrel na zviera.

# character: Cael
„Nie.“

-> unik

=== unik ===
Alarm zaplnil mincovňu.

Z chodieb prichádzali vojaci.

Nymar, Sareth a Rok preleteli ponad mestské hradby napriek šípom stráží.

Strecha laboratória sa roztrhla pod Nymarovými pazúrmi.

# character: Nymar
„Nastúp.“

* [Vziať Caela so sebou.]
    ~ sucit += 2
    ~ volba_cesty = "sever"
    -> let_prec
* [Vziať iba dôkazy a zraneného draka.]
    ~ rozum += 1
    ~ volba_cesty = "sever"
    -> let_prec
* [Zostať ešte chvíľu a zničiť laboratórium.]
    ~ vzdor += 2
    ~ volba_cesty = "rada"
    -> znicit_lab

=== znicit_lab ===
Sareth vypustila krátky prúd ohňa cez prázdnu časť haly.

Kryštálové zariadenia popraskali.

# character: Lyra
„Dúfam, že si si zapamätal, ako sme nemali vyvolať diplomatický incident.“

# character: Taren
„Myslím, že už je diplomatický.“

-> let_prec

=== let_prec ===
Vyleteli ste z Arkenu pod paľbou.

Nymar bol zúrivý.

# character: Nymar
„Oni tomu hovoria Koruna.“

# player: Ty
„Viem.“

# character: Nymar
„Aspoň Vaelgard mal slušnosť nazvať svoju reťaz Kotvou.“

Za vami zvonili mestské poplachy.

Pred vami bola dlhá cesta domov.

A v batožine dôkaz, že niekto práve začal vyrábať jazdcov bez Výberu.

# system
Kapitola VI — Koruna — dokončená.
-> DONE
