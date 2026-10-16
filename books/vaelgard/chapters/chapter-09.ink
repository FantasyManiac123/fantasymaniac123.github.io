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
Cesta z Asteru trvala päť dní.

Keď sa na horizonte konečne objavili veže Vaelgardu, čakal si úľavu. Namiesto nej si uvidel vojenský tábor.

Stovky stanov obkolesovali južnú cestu. Nad nimi viali zástavy troch kráľovstiev.

# character: Taren
„Boli sme preč päť dní.“

# character: Lyra
„Politici sú výkonní, keď ide o paniku.“

Nymar spomalil.

# character: Nymar
„Cítim veľa drakov. A veľa ľudí, ktorí sa ich boja.“

Pri pristátí vás čakala Seris.

# character: Inštruktorka Seris
„Rada spojencov prišla rokovať. Arken tvrdí, že ste napadli ich mesto a ukradli štátny výskum.“

# player: Ty
„Unášali draky.“

# character: Inštruktorka Seris
„Preto ešte nezačala vojna.“

-> pred_radou

=== pred_radou ===
Pred vstupom do siene ti Lyra chytila rukáv.

# character: Lyra
„Musíme sa rozhodnúť, čo povieme.“

V batožine ste mali záznamy Projektu Koruna. V hlave si mal spomienku na Tichých. A niekde na severe zostala Mara s dôkazom, že celý príbeh Kotvy bol nesprávny.

{ tajomstvo >= 6:
    Vďaka tomu, čo si počas posledných mesiacov zistil, si videl súvislosť, ktorú ostatní zatiaľ prehliadali: Koruna aj Aster pracovali s rovnakým princípom rezonancie.
    ~ tajomstvo += 1
}

* {tajomstvo >= 5} [Predložiť rade všetko — Korunu, Tichých aj skutočný pôvod Kotiev.]
    ~ vzdor += 1
    -> uplna_pravda
* [Ukázať iba dôkazy proti Arkenu.]
    ~ rozum += 1
    -> politicka_hra
* {puto >= 5} [Požiadať, aby pred radou prehovoril Nymar ako rovnocenný svedok.]
    ~ puto += 1
    -> nymar_pred_radou
* {sucit >= 5} [Najprv hovoriť s Caelom a zistiť, či je ochotný svedčiť.]
    ~ sucit += 1
    -> cael

=== cael ===
Cael, dobrovoľník Projektu Koruna, býval pod dohľadom v nemocničnom krídle.

Keď si vošiel, čakal, že ho budeš obviňovať.

# character: Cael
„Ak poviem pravdu, doma ma označia za zradcu.“

# player: Ty
„A ak ju nepovieš?“

Pozrel cez okno na Nymara.

# character: Cael
„Potom budú robiť ďalších jazdcov.“

{ sucit >= 7:
    # player: Ty
    „Nemusíš byť hrdina. Stačí, ak povieš, čo si videl.“

    Cael pomaly prikývol.
    ~ tajomstvo += 1
    -> cael_svedci
- else:
    Cael zaváhal.

    * [Sľúbiť mu ochranu Vaelgardu.]
        ~ sucit += 1
        -> cael_svedci
    * [Netlačiť naňho.]
        ~ rozum += 1
        -> politicka_hra
}

=== cael_svedci ===
Cael súhlasil.

To zmenilo všetko.

Neboli ste už iba kadeti obviňujúci cudzie kniežatstvo. Mali ste človeka, ktorý sa Projektu Koruna zúčastnil dobrovoľne.

-> rada

=== nymar_pred_radou ===
# player: Ty
„Nebudem hovoriť za Nymara.“

Seris zdvihla obočie.

# player: Ty
„Ak rokujú o drakoch, nech počujú draka.“

Nymar sa na teba dlho díval.

# character: Nymar
„To bude zábavné.“

-> rada

=== uplna_pravda ===
Rozhodol si sa nič neskrývať.

Lyra nevyzerala nadšene.

# character: Lyra
„Ak im povieme o Tichých, môžu spanikáriť.“

# player: Ty
„Ak im to nepovieme, budú sa pripravovať na nesprávnu vojnu.“

Nymar prikývol.

-> rada

=== politicka_hra ===
Dokumenty Koruny stačili na obhajobu vašej výpravy.

Aspoň si v to dúfal.

Tichí zatiaľ zostanú tajomstvom malej skupiny.

~ rozum += 1
-> rada

=== rada ===
Veľká sieň bola plná.

Králi, vyslanci, generáli, jazdci a po prvýkrát aj šesť drakov.

Vyslanec Arkenu, lord Halvek, vystúpil dopredu.

# character: Lord Halvek
„Vaelgard porušil hranice suverénneho kniežatstva.“

Lyra položila na stôl dokument Projekt Koruna.

# character: Lyra
„Vaše kniežatstvo unášalo draky.“

Halvek sa ani nepozrel na papier.

# character: Lord Halvek
„Draky nie sú občania.“

V sále sa ozvalo zavrčanie.

-> spor

=== spor ===
{ puto >= 6:
    Nymar vykročil dopredu bez toho, aby čakal na tvoje gesto.

    # character: Nymar
    „Tak čo som?“

    Halvek zbledol.

    # character: Lord Halvek
    „Zbraň Vaelgardu.“

    # character: Nymar
    „Zbraň, ktorá sa vás práve pýta otázku.“

    Niekoľko vyslancov sa nervózne obzrelo.

    ~ vzdor += 1
}

* {rozum >= 6} [Rozobrať právne rozpory v Arkenovej obhajobe.]
    ~ rozum += 1
    -> pravny_utok
* {vzdor >= 6} [Odmietnuť samotnú predstavu, že štáty môžu vlastniť drakov.]
    ~ vzdor += 2
    -> deklaracia
* {tajomstvo >= 6} [Odovzdať technické záznamy Koruny neutrálnym učencom.]
    ~ tajomstvo += 1
    -> dokaz_koruny
* [Nechať hovoriť Lyru.]
    -> lyra_hovori

=== pravny_utok ===
Pripomenul si dohodu z Arkenu, staré zmluvy s Vaelgardom a zákaz násilného vytvárania puta.

Halvek sa pokúsil tvrdiť, že umelá rezonancia nie je puto.

# player: Ty
„Potom nemôžete zároveň tvrdiť, že výsledkom sú dračí jazdci.“

Ticho v sále ti povedalo, že zásah bol presný.

~ tajomstvo += 1
-> prestavka

=== deklaracia ===
# player: Ty
„Celá táto diskusia stojí na otázke, komu patria draky. Odpoveď je nikomu.“

Generál Merovan sa zamračil.

# player: Ty
„Ani Arkenu. Ani kráľom. Ani Vaelgardu.“

Tentoraz zavrčali nie draky, ale niektorí ľudia.

Nymar stál pokojne vedľa teba.

# character: Nymar
„Konečne jednoduchá veta.“

-> prestavka

=== dokaz_koruny ===
Neutrálni učenci prešli schémy.

Jeden z nich po chvíli vstal.

# character: Učenec
„Tieto zariadenia spôsobujú bolesť obom účastníkom. Dlhodobé následky nepoznáme.“

Halvek stratil časť podpory.

-> prestavka

=== lyra_hovori ===
Lyra opísala laboratórium bez jediného zbytočného slova.

Keď skončila, ukázala krvou poškvrnenú stránku záznamu.

# character: Lyra
„Toto nie je výskum jazdcov. Toto je výroba poslušnosti.“

-> prestavka

=== prestavka ===
Počas prestávky sa situácia zhoršila.

Na nádvorí niekto napadol Caela.

Útočník utiekol, ale pri stene zostal nôž so znakom troch hviezd.

{ sucit >= 6:
    Cael prežil bez vážneho zranenia, pretože si pred zasadnutím požiadal Seris, aby pri ňom nechala stráž.
    ~ tajomstvo += 1
- else:
    Cael utrpel ranu do ramena. Nebola smrteľná, ale už nemohol pred radu predstúpiť.
    ~ zranenie += 1
}

Nymar zacítil vzduch.

# character: Nymar
„Útočník je stále v akadémii.“

* {puto >= 7} [Nasledovať Nymarov čuch a puto.]
    -> lov_nymar
* {rozum >= 6} [Uzavrieť brány a systematicky prehľadať akadémiu.]
    -> pasca
* {odvaha >= 6} [Vyraziť za útočníkom okamžite.]
    -> prenasledovanie
* [Zostať pri rade. Útok môže byť iba odvedenie pozornosti.]
    ~ rozum += 1
    -> hlasovanie

=== lov_nymar ===
Nymar ťa viedol cez kuchyne, nádvorie a starú vežu.

Puto medzi vami bolo také presné, že si vedel, kedy zacítil stopu ešte skôr, než zdvihol hlavu.

Našli ste útočníka pri podzemnom východe.

Nebránil sa.

# character: Zajatý agent
„Koruna už nie je projekt.“

# player: Ty
„Čo teda je?“

# character: Zajatý agent
„Armáda.“

-> varovanie

=== pasca ===
Seris uzavrela brány.

Lyra porovnala zoznam hostí so strážnymi záznamami.

Jeden sluha neexistoval.

Našli ste ho v sklade pri severnej bráne.

V topánke mal zašitý rozkaz.

# inscription
PRVÝ PLUK KORUNY JE PRIPRAVENÝ.
ČAKAŤ NA SIGNÁL.

-> varovanie

=== prenasledovanie ===
Uvidel si tieň miznúť za arkádou.

Bežal si za ním cez strechy nižšieho krídla.

Agent skočil na pripraveného koňa.

Ty si skočil za ním.

Po krátkom boji ste obaja skončili v blate pri bráne.

Taren dorazil o chvíľu neskôr.

# character: Taren
„Som urazený, že si začal bezomňa.“

U agenta ste našli rozkaz.

-> varovanie

=== varovanie ===
Správa sa dostala k rade.

Prvý pluk Koruny.

Umelo spojení jazdci.

Pripravení na boj.

Merovan okamžite žiadal mobilizáciu.

# character: Generál Merovan
„Teraz už nemáme čo riešiť.“

Vtedy sa ozval hlboký tón.

Nie zvon.

Asterov kryštál vo vrecku začal svietiť.

Nymar stuhol.

# character: Nymar
„Tichí.“

-> hlasovanie

=== hlasovanie ===
Rada mala rozhodnúť medzi vojnou na východe a prípravou na neznámu hrozbu zo severu.

{ tajomstvo >= 7:
    Mal si dostatok dôkazov, aby si vysvetlil, že Koruna svojou rezonanciou môže Tichých priťahovať.

    # player: Ty
    „Nie sú to dve vojny. Koruna vysiela presne ten druh signálu, ktorý Tichí sledujú.“

    Edran sa postavil.

    # character: Majster Edran
    „Má pravdu.“

    V sále sa prvýkrát zmenila otázka z „ktorého nepriateľa napadnúť?“ na „ako zabrániť obom katastrofám?“
    ~ tajomstvo += 1
}

* {tajomstvo >= 7 && rozum >= 6} [Navrhnúť spoločnú expedíciu k zdroju južného signálu.]
    ~ rozum += 1
    -> treti_cesta
* {vzdor >= 7 && puto >= 6} [Žiadať vznik samostatnej Dračej rady.]
    ~ vzdor += 1
    ~ puto += 1
    -> dracia_rada
* [Podporiť obranu Vaelgardu a odložiť útok.]
    ~ rozum += 1
    -> obrana
* [Podporiť zásah proti Projektu Koruna.]
    ~ odvaha += 1
    -> vojna

=== dracia_rada ===
Návrh vyvolal chaos.

Niekoľko šľachticov odišlo zo siene.

Ale draky zostali.

Avar sa postavil.

# character: Rektor Avar
„Vaelgard vznikol ako dohoda dvoch druhov. Ak jedna strana nemá hlas, dohoda je fikcia.“

Hlasovanie prešlo o jediný hlas.

Prvýkrát v dejinách vznikla Dračia rada.

Nymar sa k tebe naklonil.

# character: Nymar
„Teraz už len musíme prežiť, aby mala zmysel.“

-> koniec

=== treti_cesta ===
Rada schválila prieskum južného signálu.

Nie ako útek pred vojnou, ale ako pokus pochopiť spojenie medzi Korunou, Kotvami a Tichými.

Mara mala pravdu.

Na juhu bolo miesto, ktoré nebolo na žiadnej mape.

A vy ste tam mali letieť.

-> koniec

=== obrana ===
Vaelgard začal opevňovať hory.

Draky hliadkovali dobrovoľne, nie na rozkaz.

Napätie však rástlo.

Na východe sa zhromažďoval Prvý pluk Koruny.

Na severe mizli hviezdy.

-> koniec

=== vojna ===
Rada schválila obmedzený zásah proti základniam Koruny.

Merovan sa konečne usmial.

Nymar nie.

# character: Nymar
„Keď ľudia povedia obmedzená vojna, ako často zostane obmedzená?“

Nemal si odpoveď.

-> koniec

=== koniec ===
V tú noc si stál s Nymarom na najvyššej terase.

Pod vami horeli stovky táborových ohňov.

Nad vami chýbali tri hviezdy.

# character: Nymar
„Keď si prišiel do Vaelgardu, chcel si byť jazdcom?“

# player: Ty
„Myslel som si, že áno.“

# character: Nymar
„A teraz?“

Pozrel si na akadémiu, armády a temnú oblohu.

Odpoveď už nebola jednoduchá.

# system
Kapitola IX — Rada popola — dokončená.
-> DONE
