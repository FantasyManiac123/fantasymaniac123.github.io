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
Tri dni po Rade popola dorazila prvá správa z východu.

Prvý pluk Koruny prekročil rieku Eren.

Nebola to invázia.

Aspoň nie podľa Arkenu.

Oficiálne išlo o „ochranné cvičenie“.

# character: Taren
„Mám rád vojenské názvy. Keď niekto povie ochranné cvičenie, vždy si skontroluj, či na teba nemieri kopija.“

Na nádvorí sa pripravovali jazdci.

Nymar však sledoval juh.

Asterov kryštál od rána pulzoval.

{ tajomstvo >= 8:
    Vedel si už, že južný signál sa zosilňuje zakaždým, keď Koruna aktivuje väčšie množstvo umelých pút.
}

-> rozkaz

=== rozkaz ===
Avar vám dal nečakanú úlohu.

# character: Rektor Avar
„Nechcem, aby ste leteli na front.“

Merovan protestoval.

# character: Generál Merovan
„Sú to naši najskúsenejší kadeti.“

# character: Nymar
„To je deprimujúca veta.“

Avar položil na stôl mapu.

Na juhu bola prázdna plocha.

# character: Rektor Avar
„Nájdite zdroj signálu.“

{ vzdor >= 8:
    Pri stole sedel aj zástupca novovzniknutej Dračej rady, starý zelený drak Oth.

    # character: Oth
    „A vrátite sa, ak sa rozhodnete vrátiť. Nie preto, že vám to prikazujeme.“

    Merovan prevrátil oči.
}

-> odlet

=== odlet ===
Leteli ste na juh: ty s Nymarom, Lyra so Sareth, Taren s Rokom a Edran na Varovi.

Po dvoch dňoch sa krajina zmenila na červenú pustatinu.

Kompas sa začal otáčať.

Mapy prestali sedieť.

# character: Lyra
„Hora pred nami by nemala existovať.“

# character: Taren
„Konečne niečo, čo zodpovedá našim skúsenostiam.“

Hora mala dokonale zrezaný vrchol.

A na ňom stálo mesto.

-> mesto

=== mesto ===
Mesto bolo opustené.

Budovy boli obrovské, postavené pre tvory väčšie než ľudia.

Pre draky.

Nymar pristál na širokom námestí.

# character: Nymar
„Toto postavili moji.“

# player: Ty
„Ako staré je to?“

Edran sa dotkol kamennej steny.

# character: Majster Edran
„Staršie než všetky ľudské kráľovstvá.“

{ tajomstvo >= 7:
    Na stenách si spoznal symboly z komory pod Vaelgardom.
    ~ tajomstvo += 1
}

-> archiv

=== archiv ===
V strede mesta stála kupola.

Vo vnútri sa nachádzali tisíce kamenných tabúľ.

Nymar prečítal prvú.

Potom druhú.

Pri tretej prestal.

# player: Ty
„Čo tam je?“

# character: Nymar
„Mená.“

# player: Ty
„Koho?“

# character: Nymar
„Ľudí.“

Lyra sa zamračila.

# character: Lyra
„V dračom meste?“

Nymar pokračoval v čítaní.

# character: Nymar
„Prví jazdci.“

-> povod

=== povod ===
Záznamy rozprávali príbeh starší než Vaelgard.

Tichí prišli prvýkrát pred viac než tisíc rokmi.

Draky sa pred nimi nedokázali ukryť, pretože ich myseľ žiarila v rezonancii ako maják.

Potom jeden drak objavil niečo zvláštne.

Ľudská myseľ dokázala dračí signál rozptýliť.

Nie ovládnuť.

Skryť.

# character: Edran
„Preto vzniklo puto.“

# character: Lyra
„Draci si vybrali ľudí.“

# character: Nymar
„Nie ako jazdcov.“

Nymar sa pozrel na teba.

# character: Nymar
„Ako štíty.“

-> cena

=== cena ===
Ďalšie tabule opisovali cenu.

Čím dlhšie boli druhy prepojené, tým viac sa systém menil.

Ľudia začali puto používať na velenie.

Draky začali zabúdať, prečo vôbec vzniklo.

Nakoniec bola postavená Kotva, aby stabilizovala tisíce pút naraz.

A z ochrany vznikla inštitúcia.

# character: Taren
„Takže obe strany zabudli polovicu príbehu.“

# character: Edran
„Ako väčšina dejín.“

* {puto >= 7} [Spýtať sa Nymara, či by si ťa vybral aj bez hrozby Tichých.]
    -> osobna_otazka
* {tajomstvo >= 8} [Pokračovať v hľadaní záznamov o Korune.]
    -> koruna_povod
* [Preskúmať spodné poschodia.]
    -> podzemie

=== osobna_otazka ===
# player: Ty
„Keby Tichí nikdy neexistovali... vybral by si si ma?“

Nymar zostal nezvyčajne dlho ticho.

# character: Nymar
„Na začiatku? Neviem.“

Otočil hlavu k tebe.

# character: Nymar
„Teraz áno.“

{ puto >= 9:
    Pocítil si odpoveď skôr, než ju vyslovil. Nebola v nej povinnosť ani stará mágia.

    Iba rozhodnutie.
    ~ puto += 1
}

-> podzemie

=== koruna_povod ===
V najstaršej časti archívu si našiel kresbu kruhu takmer totožného s Korunou.

# player: Ty
„Edran.“

Pozrel sa na kresbu a zbledol.

# character: Edran
„Arken nevynašiel umelú rezonanciu.“

Text pod diagramom preložil Nymar.

# character: Nymar
„Núdzové puto. Použiť iba so súhlasom oboch.“

Lyra pochopila.

# character: Lyra
„Koruna odstránila súhlas.“

~ tajomstvo += 2
-> podzemie

=== podzemie ===
Pod mestom ste našli stroj.

Nie Kotvu.

Nie Korunu.

Sieť tisícov kryštálov prepojených cez celú horu.

Asterov kryštál sa rozžiaril tak silno, že ho bolo treba položiť na zem.

# character: Edran
„Toto je zdroj signálu.“

# character: Nymar
„Nie.“

Pristúpil bližšie.

# character: Nymar
„Toto na signál odpovedá.“

Potom sa stroj zapol.

-> hlas

=== hlas ===
Všetky kryštály naraz vydali tón.

A v tvojej mysli sa objavil hlas.

Nie Tichý.

Dračí.

# character: Neznámy hlas
„Ak toto počujete, ochranná sieť zlyhala.“

Nymar stratil farbu v šupinách.

# character: Hlas
„Nespájajte Kotvy. Nezosilňujte rezonanciu. Tichí sledujú jednotný signál.“

Lyra sa pozrela na Edrana.

# character: Lyra
„Koruna robí presný opak.“

# character: Hlas
„Prežiť možno iba ako sieť bez stredu.“

-> utok

=== utok ===
Nad mestom zahrmelo.

Asterov kryštál praskol.

Nymar zdvihol hlavu.

# character: Nymar
„Niečo prichádza.“

Neboli to Tichí.

Na oblohe sa objavilo dvanásť drakov.

Na ich chrbtoch sedeli jazdci v bielych prilbách.

Koruna.

Prvý pluk vás našiel.

# character: Taren
„Takže ochranné cvičenie doletelo veľmi ďaleko.“

-> velitelka

=== velitelka ===
Pred formáciou pristála žena na čiernom drakovi.

Drak mal okolo hlavy kovový veniec.

Jeho oči boli otvorené, ale prázdne.

# character: Veliteľka Koruny
„Odovzdajte archív.“

# player: Ty
„Kto ste?“

# character: Veliteľka Koruny
„Veliteľka Sera Veyn.“

Edran stuhol.

# character: Edran
„Veyrova dcéra.“

Sera zosadla.

# character: Sera
„Vaelgard držal toto poznanie stáročia pre seba. My ho dáme všetkým.“

Nymar ukázal zuby.

# character: Nymar
„Spýtala si sa jeho?“

Čierny drak nereagoval.

-> volba_stret

=== volba_stret ===
{ sucit >= 7:
    V prázdnom pohľade čierneho draka si si spomenul na Iri, Caela a všetkých, ktorých Koruna použila.
}

* {tajomstvo >= 9} [Ukázať Sere pôvodný záznam: Koruna je poškodená verzia núdzového puta.]
    -> sera_dokaz
* {puto >= 8} [Skúsiť cez Nymara osloviť čierneho draka.]
    -> cierny_drak
* {rozum >= 8} [Nalákať jednotku Koruny nad kryštálovú sieť a narušiť ich centrálnu rezonanciu.]
    -> pasca_koruna
* {odvaha >= 8} [Postaviť sa Sere vo vzdušnom súboji.]
    -> suboj
* [Ustúpiť do podzemia.]
    -> obliehanie

=== sera_dokaz ===
Hodil si pred Seru kamennú kópiu diagramu.

# player: Ty
„Prečítaj si poznámku.“

Sera sa zasmiala.

# character: Sera
„Dračie písmo nečítam.“

# character: Nymar
„Ja áno.“

Preložil vetu.

Použiť iba so súhlasom oboch.

Sera na okamih zaváhala.

{ tajomstvo >= 11:
    Ukázal si jej aj záznam o Tichých.

    # player: Ty
    „Vaša sieť ich priťahuje.“

    Nad mestom zhaslo slnko.

    Sera konečne zdvihla oči.
    -> prichod_tichych
- else:
    Sera rozkaz neodvolala.
    -> cierny_drak
}

=== cierny_drak ===
Nymar zavrel oči.

# character: Nymar
„Počuje ma.“

# player: Ty
„Dokáže odpovedať?“

# character: Nymar
„Koruna ho tlačí pod hladinu.“

{ puto >= 10:
    Vložil si do spojenia aj vlastnú myseľ.

    Nie rozkaz.

    Otvorené dvere.

    Čierny drak zrazu zažmurkal.

    # character: Čierny drak
    „Volám sa Khar.“

    Sera cúvla.

    # character: Sera
    „To nie je možné.“

    Khar sklonil hlavu a kovový veniec praskol.
    ~ puto += 1
    -> vzbura
- else:
    Khar sa zachvel, ale veniec vydržal.
    -> boj
}

=== pasca_koruna ===
Lyra pochopila plán okamžite.

Staré mesto používalo distribuovanú sieť. Koruna mala centrálny rytmus.

Keď jednotka preletela nad kryštálovým poľom, Edran aktivoval starý systém.

Koruny začali blikať každá inak.

Jazdci stratili koordináciu.

Draky nie.

Prvýkrát sa začali pohybovať podľa vlastnej vôle.

~ rozum += 2
-> vzbura

=== suboj ===
Nymar vyrazil proti Kharovi.

Sera bola výborne vycvičená.

Ale bojovala proti tebe aj proti vlastnému drakovi.

Pri treťom obrate Khar úmyselne neposlúchol.

Sera stratila výhodu.

# character: Nymar
„On nechce bojovať.“

* [Prerušiť útok.]
    ~ sucit += 1
    -> cierny_drak
* [Pokračovať proti Sere, nie proti Kharovi.]
    ~ odvaha += 1
    -> boj

=== obliehanie ===
Stiahli ste sa pod zem.

Koruna obsadila námestie.

Mali ste archív, ale nie cestu von.

Taren sa pozrel na kryštálovú sieť.

# character: Taren
„Prosím povedzte, že starí draci postavili aj tajný východ.“

Nymar prečítal značku na stene.

# character: Nymar
„Postavili.“

# character: Taren
„Začínam ich mať rád.“

Tunel vás však doviedol priamo pod jednotku Koruny.

-> pasca_koruna

=== boj ===
Sareth a Rok zaútočili na kovové vence, nie na draky.

Jeden po druhom praskali.

Každý oslobodený drak prestal bojovať.

Niektorí zhodili jazdcov do piesku. Iní iba pristáli.

Sera kričala rozkazy, ktoré už nikto neplnil.

-> vzbura

=== vzbura ===
Khar stál oproti Sere.

# character: Sera
„Ja som ťa zachránila.“

# character: Khar
„Nie.“

Jeho hlas bol slabý, ale zreteľný.

# character: Khar
„Ty si ma dostala.“

Sera spustila zbraň.

Potom sa obloha zatiahla.

Nie mrakmi.

-> prichod_tichych

=== prichod_tichych ===
Tichí prišli v desiatkach.

Koruna ich priviedla priamo k mestu.

Starý obranný systém sa rozžiaril.

# character: Edran
„Sieť bez stredu! Musíme spojiť všetkých drakov, ale nikoho nesmieme prinútiť.“

Bývalí draci Koruny boli vystrašení.

Niektorí ľudským jazdcom neverili.

{ sucit >= 8:
    Cael, Iri a všetky tvoje predchádzajúce rozhodnutia ti pripomenuli jednu vec: dôvera sa nedá urýchliť.
}

* {sucit >= 8 && puto >= 8} [Požiadať draky o pomoc bez podmienok.]
    -> dobrovolna_siet
* {rozum >= 9} [Rozdeliť sieť na malé nezávislé skupiny.]
    -> distribuovana_siet
* [Aktivovať celý systém naraz.]
    -> riziko

=== dobrovolna_siet ===
Nymar prehovoril k ostatným drakom.

# character: Nymar
„Nežiadame vás, aby ste nám verili.“

Pozrel na Tichých.

# character: Nymar
„Žiadame vás, aby ste sa rozhodli.“

Khar sa pripojil prvý.

Potom druhý drak.

Tretí.

Nakoniec všetci okrem jedného.

A to stačilo.

~ puto += 2
-> obrana_mesta

=== distribuovana_siet ===
Rozdelili ste drakov do trojíc.

Žiadne centrum.

Žiadny hlavný jazdec.

Žiadna Kotva.

Keď Tichí zaútočili na jeden uzol, ostatné pokračovali.

Starý systém presne na toto čakal tisíc rokov.

~ rozum += 2
-> obrana_mesta

=== riziko ===
Sieť sa zapla.

Na okamih fungovala.

Potom všetka rezonancia pretiekla cez Nymara.

Obaja ste padli.

~ zranenie += 2

Khar a Sareth však prevzali spojenie skôr, než sa sieť rozpadla.

-> obrana_mesta

=== obrana_mesta ===
Mesto sa rozžiarilo.

Nie jedným lúčom.

Tisíckami malých svetiel.

Tichí sa pokúsili nájsť centrum.

Žiadne nebolo.

Ich tvary sa rozpadli ako tiene pri východe slnka.

Jeden po druhom zmizli.

Keď bolo po všetkom, nikto neoslavoval.

Príliš veľa vecí sa práve zmenilo.

-> nasledky

=== nasledky ===
Sera sedela pri rozbitej Korune.

Khar stál ďaleko od nej.

# character: Sera
„Celý život mi hovorili, že Vaelgard drží draky v otroctve.“

# character: Nymar
„Niekedy to bola pravda.“

Sera zdvihla hlavu.

# character: Nymar
„To z vašej Koruny nerobí slobodu.“

{ sucit >= 9:
    * [Ponúknuť Sere, aby sa vrátila do Vaelgardu ako svedok.]
        ~ sucit += 1
        -> navrat
}
* [Vziať ju ako zajatkyňu.]
    ~ rozum += 1
    -> navrat
* [Nechať ju odísť bez Koruny.]
    ~ vzdor += 1
    -> navrat

=== navrat ===
Pred návratom ste skopírovali čo najviac z archívu.

Najdôležitejšia veta bola krátka:

# inscription
PUTO NIE JE REŤAZ.
PUTO NIE JE ROZKAZ.
PUTO JE DVOJHLASNÉ ROZHODNUTIE.

Nymar sa na nápis dlho díval.

# character: Nymar
„Toto by mali vytesať nad bránu Vaelgardu.“

# player: Ty
„Myslíš, že to bude stačiť?“

# character: Nymar
„Nie.“

Roztiahol krídla.

# character: Nymar
„Preto to bude dobrý začiatok.“

# system
Kapitola X — Mesto bez mena — dokončená.
-> DONE
