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
Tri týždne po udalostiach pri Kotve sa Vaelgard navonok vrátil k poriadku.

Navonok.

Na raňajkách stále zostávalo niekoľko miest prázdnych. Niektorí draci po zmene puta odleteli a ich bývalí jazdci akadémiu opustili. Iné dvojice zostali spolu, ale správali sa k sebe inak — opatrnejšie, akoby sa po rokoch prvýkrát naozaj stretli.

Nymar sedel na okraji letovej terasy a sledoval údolie.

# character: Nymar
„Dnes nás pustia vysoko.“

# player: Ty
„Tešíš sa?“

# character: Nymar
„Ty nie?“

Prvý skutočný let mal viesť cez tri horské brány, ponad ľadovcové jazero a späť do Vaelgardu. Bez lana. Bez cvičnej plošiny. Bez inštruktora vedľa krídla.

# character: Nymar
„Tvoje srdce je zase hlučné.“

* [Priznať, že sa na let tešíš.]
    ~ odvaha += 1
    ~ puto += 1
    -> nastup
* [Prejsť si ešte raz trasu a núdzové postupy.]
    ~ rozum += 2
    -> nastup
* [Spýtať sa Nymara, či chce vôbec letieť.]
    ~ sucit += 1
    ~ puto += 1
    -> chce_letiet

=== chce_letiet ===
Nymar sa na teba pozrel zboku.

# character: Nymar
„Stále sa ma na to pýtaš.“

# player: Ty
„Teraz môžem.“

# character: Nymar
„Tak áno. Chcem.“

Roztiahol krídla.

# character: Nymar
„A chcem byť prvý.“

-> nastup

=== nastup ===
Na hlavnej terase čakali Lyra so Sareth, Taren so svojím modrosivým Rokom a ďalších šesť dvojíc.

Inštruktorka Seris rozvinula mapu.

# character: Inštruktorka Seris
„Prvá brána je jednoduchá. Druhá má bočný vietor. Za treťou sa rozdelíte do trojíc a vrátite sa cez jazero.“

# character: Taren
„A čo sa pokazí?“

# character: Inštruktorka Seris
„To je správna otázka.“

Seris ukázala na sever.

# character: Inštruktorka Seris
„Búrka prichádza skôr, než hlásili pozorovatelia. Máte dve hodiny.“

Lyra si všimla tmavý pás mrakov.

# character: Lyra
„Máme hodinu.“

Seris sa na ňu pozrela a prikývla.

-> vzlet

=== vzlet ===
Nymar sa rozbehol.

Tentoraz neprišiel pád.

Keď skočil z terasy, presne si vedel, kedy otvorí krídla. Puto medzi vami už nebolo cudzím hlasom v hlave. Bolo priestorom, v ktorom ste sa obaja pohybovali.

Vaelgard sa pod vami zmenšil.

Prvá brána bola dvojica kamenných ihiel. Preleteli ste medzi nimi tak blízko, že si videl lišajníky na skale.

# character: Nymar
„Rýchlejšie?“

* [Áno. Skúsiť predbehnúť Tarena.]
    ~ odvaha += 1
    -> preteky
* [Držať formáciu.]
    ~ rozum += 1
    -> druha_brana
* [Nechať Nymara vybrať tempo.]
    ~ puto += 1
    -> nymar_tempo

=== preteky ===
Rok prijal výzvu skôr než Taren.

Oba draky zrýchlili.

# character: Taren
„Toto určite nie je porušenie pravidiel!“

# player: Ty
„Určite je!“

Bočný vietor pri druhej bráne vás zasiahol v najhoršom okamihu.

* [Stiahnuť Nymara pod prúd.]
    ~ rozum += 1
    -> druha_brana
* [Preletieť cez náraz silou.]
    ~ odvaha += 1
    ~ zranenie += 1
    -> druha_brana

=== nymar_tempo ===
Nymar spomalil.

# player: Ty
„Čakal som, že zrýchliš.“

# character: Nymar
„Prečo?“

# player: Ty
„Povedal si, že chceš byť prvý.“

# character: Nymar
„Chcem byť prvý doma. To je iná disciplína.“

~ rozum += 1
-> druha_brana

=== druha_brana ===
Za druhou bránou sa vzduch zmenil. Teplý prúd stúpal z údolia a studený padal zo štítov.

Lyra so Sareth sa naklonili doľava.

# character: Lyra
„Mraky sú už nad Severnou stenou.“

V diaľke zablikalo.

Seris dala signál pokračovať k tretej bráne.

Potom sa ozval hrom.

Nie z oblohy.

Nymar prudko otočil hlavu k lesu pod vami.

# character: Nymar
„Drak.“

# player: Ty
„Kde?“

# character: Nymar
„Dole. A bojí sa.“

-> signal

=== signal ===
V lese sa medzi stromami objavil červený záblesk. Potom dym.

Seris dala signál: pokračovať podľa trasy.

# character: Nymar
„Cítim mláďa.“

* [Poslúchnuť Seris a pokračovať.]
    ~ rozum += 1
    -> tretia_brana
* [Odtrhnúť sa z formácie a ísť k lesu.]
    ~ vzdor += 1
    ~ sucit += 1
    -> les
* [Signalizovať Seris a žiadať povolenie preskúmať dym.]
    ~ rozum += 1
    ~ sucit += 1
    -> povolenie

=== povolenie ===
Seris najprv ukázala návrat do formácie.

Nymar zareval.

Z lesa odpovedal slabší hlas.

Seris zmenila signál.

Ty, Lyra a Taren ste mali päť minút.

-> les

=== tretia_brana ===
Pokračovali ste k tretej bráne, ale Nymar bol nepokojný.

Keď ste ju preleteli, búrka už zakryla cestu späť.

Seris otočila celú skupinu.

Pri návrate ste nad lesom uvideli oheň.

# character: Nymar
„Už tam ideme.“

Tentoraz si nenamietal.

-> les

=== les ===
Pristáli ste na malej čistine.

Medzi stromami ležalo dračie mláďa. Jedno krídlo malo zachytené v kovovej sieti. Okolo boli stopy topánok.

Lyra si kľakla k mechanizmu.

# character: Lyra
„Toto nie je lovecká pasca.“

Taren zdvihol kovový hrot.

# character: Taren
„Má znak.“

Na hrote bola vyrytá koruna obklopená tromi hviezdami.

Nymar zavrčal.

# character: Nymar
„Východné kniežatstvá.“

* [Najprv vyslobodiť mláďa.]
    ~ sucit += 2
    -> oslobodenie
* [Najprv preskúmať okolie. Lovci môžu byť blízko.]
    ~ rozum += 2
    -> stopy
* [Vyraziť po stopách okamžite.]
    ~ odvaha += 1
    -> prenasledovanie

=== oslobodenie ===
Sieť bola vyrobená tak, aby sa pri pohybe sťahovala.

Nymar držal mláďa pokojne, zatiaľ čo Lyra uvoľňovala kovové háky.

# character: Nymar
„Volá sa Iri.“

# player: Ty
„Poznáš ju?“

# character: Nymar
„Nie. Povedala mi.“

Keď sieť povolila, Iri sa pritlačila k Nymarovi.

~ puto += 1
-> stopy

=== stopy ===
Našli ste šesť rôznych odtlačkov topánok a hlboké ryhy po voze.

# character: Lyra
„Nie sú ďaleko.“

Taren sa pozrel k oblohe.

# character: Taren
„A my máme búrku, zranené mláďa a rozkaz vrátiť sa.“

Nymar zacítil vzduch.

# character: Nymar
„Ďalšie draky.“

# player: Ty
„Koľko?“

# character: Nymar
„Najmenej tri.“

-> prenasledovanie

=== prenasledovanie ===
Stopy viedli do úzkeho údolia.

Na jeho konci stáli dva vozy a tucet ozbrojených ľudí. V železných klietkach boli tri mladé draky.

Muž v červenom plášti zdvihol kuše.

# character: Neznámy veliteľ
„Jazdci Vaelgardu. Toto nie je vaša zem.“

Lyra sa zasmiala bez humoru.

# character: Lyra
„Sme dvadsať kilometrov od akadémie.“

# character: Veliteľ
„Hranice sa menia.“

* [Vyjednávať a získať čas.]
    ~ rozum += 2
    -> vyjednavanie
* [Zaútočiť skôr, než strelci zamieria na draky.]
    ~ odvaha += 2
    -> utok_tabor
* [Nechať Nymara hovoriť s uväznenými drakmi.]
    ~ puto += 1
    ~ tajomstvo += 1
    -> draci_plan

=== vyjednavanie ===
# player: Ty
„Ak patríte Východným kniežatstvám, útok na kadetov Vaelgardu znamená vojnu.“

Veliteľ sa pousmial.

# character: Veliteľ
„Kto hovorí o útoku? Odídete. My odídeme. Búrka zmaže stopy.“

# player: Ty
„A draky?“

# character: Veliteľ
„Majetok kniežaťa.“

Nymarov hnev prešiel putom ako oheň.

# character: Nymar
„Povedz mu, že majetok nesúhlasí.“

Rozhovor vám však dal čas. Sareth a Rok sa nenápadne rozostúpili.

-> utok_tabor

=== draci_plan ===
Nymar zavrel oči.

# character: Nymar
„Sú vystrašené, ale počujú ma.“

# player: Ty
„Dokážu rozbiť klietky?“

# character: Nymar
„Nie zvnútra.“

Lyra pochopila.

# character: Lyra
„Zámky.“

Taren si prehodil meč.

# character: Taren
„Konečne plán, ktorému rozumiem.“

-> utok_tabor

=== utok_tabor ===
Prvý blesk udrel do hrebeňa.

V tom istom okamihu ste vyrazili.

Nymar preletel nízko nad vozmi. Strelci sa rozutekali. Sareth vyrazila zámok prvej klietky chvostom.

Taren zoskočil z Roka priamo medzi dvoch mužov.

# character: Taren
„Toto je tá časť štúdia, ktorú som očakával!“

Veliteľ vytiahol krátku kušu a zamieril na Iri.

* [Kryť mláďa vlastným telom.]
    ~ sucit += 2
    ~ zranenie += 1
    -> koniec_boja
* [Zakričať Nymarovi.]
    ~ puto += 2
    -> nymar_zasah
* [Hodiť po veliteľovi zbraň.]
    ~ odvaha += 1
    -> koniec_boja

=== nymar_zasah ===
Nemusel si dokončiť vetu.

Nymar už vedel.

Jeho krídlo sa spustilo medzi kušu a mláďa. Šíp sa odrazil od šupín.

Nymar sa na teba pozrel.

# character: Nymar
„Nemusel si hovoriť.“

# player: Ty
„Viem.“

-> koniec_boja

=== koniec_boja ===
Keď dorazila Seris s ostatnými jazdcami, boj už končil.

Veliteľ utiekol do lesa, ale vozy zostali.

V jednom ste našli mapy, zásoby a list zapečatený tromi hviezdami.

Seris ho prečítala.

Jej tvár sa zmenila.

# player: Ty
„Čo tam je?“

# character: Inštruktorka Seris
„Rozkaz chytať mladé draky. Živé.“

# character: Lyra
„Prečo?“

Seris zložila list.

# character: Inštruktorka Seris
„Pretože niekto na východe sa pokúša vybudovať vlastný Vaelgard.“

-> navrat

=== navrat ===
Búrka vás chytila cestou späť.

Leteli ste v daždi tak hustom, že si nevidel koniec Nymarovho krídla. Navigovali ste takmer iba cez puto.

Keď sa konečne objavili svetlá akadémie, Nymar bol vyčerpaný.

Pristáli ste tvrdo.

Rektor Avar čakal na terase.

Seris mu podala list.

Avar ho prečítal a potom sa pozrel na severovýchod.

# character: Rektor Avar
„Takže začali.“

# player: Ty
„Kto?“

# character: Rektor Avar
„Ľudia, ktorí celé stáročia tvrdili, že Vaelgard má priveľa moci.“

# character: Nymar
„Možno mali pravdu.“

Avar sa naňho pozrel.

# character: Rektor Avar
„Možno.“

# system
Kapitola V — Prvý skutočný let — dokončená.
-> DONE
