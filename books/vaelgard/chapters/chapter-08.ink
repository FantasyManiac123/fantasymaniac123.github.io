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
Na sever ste vyrazili pred úsvitom.

Svet pod vami postupne mizol pod snehom.

Prvý deň ste preleteli ponad posledné dediny. Druhý deň zmizli cesty. Tretí deň už pod vami nebolo nič okrem ľadu, skál a tieňov mrakov.

Edran letel so Serisiným starým drakom Varom.

# character: Taren
„Pripomeň mi, prečo sme zobrali človeka, ktorého sme pred dvoma dňami zatkli.“

# character: Lyra
„Pretože jediný pozná cestu.“

# character: Taren
„To je presne dôvod, prečo zradcovia prežívajú prvé dejstvo.“

Nymar sa zasmial cez puto.

-> ladovec

=== ladovec ===
Na štvrtý deň sa pred vami otvorila trhlina v ľadovci.

Edran ukázal nadol.

# character: Majster Edran
„Musíme pristáť. Za hrebeňom sa nedá letieť.“

# player: Ty
„Prečo?“

# character: Majster Edran
„Pretože tam vietor nefúka.“

Taren zamrkal.

# character: Taren
„To znie príjemne.“

# character: Majster Edran
„Nie je.“

-> ticho

=== ticho ===
Za hrebeňom prestal existovať zvuk.

Nie stíchol.

Zmizol.

Nymarove krídla bili vzduch, ale nič si nepočul. Keď Lyra zakričala, videl si pohyb jej úst bez hlasu.

Potom zmizlo aj puto.

Prázdnota v hlave bola horšia než bolesť.

Nymar prudko klesol.

* [Sústrediť sa na spomienku na prvý let.]
    ~ puto += 2
    -> spojenie
* [Riadiť sa výcvikom a gestami.]
    ~ rozum += 2
    -> pristatie
* [Nechať Nymara konať úplne samostatne.]
    ~ sucit += 1
    -> nymar_sam

=== spojenie ===
Spomenul si si na okamih, keď Nymar prvýkrát otvoril krídla pod tebou.

Nie na slová.

Na pocit.

Na sekundu sa puto vrátilo.

Nie ako hlas.

Ako smer.

Nymar vyrovnal let.

-> pristatie

=== nymar_sam ===
Prestaneš sa snažiť viesť.

Nymar pochopil.

Bez puta, bez povelov, bez slov si bol iba pasažierom.

A on drakom.

Pristál dokonale.

Keď sa vám po chvíli spojenie vrátilo, cítil si z neho pobavenie.

# character: Nymar
„Mohli by sme to skúšať častejšie.“

-> pristatie

=== pristatie ===
Pristáli ste pri čiernych ruinách.

Zvuk sa pomaly vrátil.

Pred vami stálo Observatórium Aster.

Bolo väčšie, než naznačovali legendy.

Veža vyrastala priamo z ľadovca a na jej vrchole sa nachádzal obrovský bronzový kruh namierený na oblohu.

Dvere boli otvorené.

# character: Lyra
„To je vždy dobré znamenie.“

-> vnutro

=== vnutro ===
Vo vnútri nebol prach.

Niekto tu bol nedávno.

Na stole horela olejová lampa.

Taren vytiahol meč.

# character: Taren
„Máme spoločnosť.“

Z horného poschodia zišla žena v kožušinovom plášti.

# character: Neznáma žena
„Vaelgard.“

Edran zbledol.

# character: Majster Edran
„Mara.“

# character: Mara
„Edran.“

Lyra sa pozrela z jedného na druhého.

# character: Lyra
„Samozrejme, že sa poznajú.“

-> mara

=== mara ===
Mara bola poslednou členkou rádu astronómov, ktorí Observatórium strážili.

# character: Mara
„Pred šiestimi nocami sa Tichí objavili za severnou žiarou.“

# player: Ty
„Čo sú?“

# character: Mara
„Nie draky. Nie zvieratá. Možno ani živé bytosti tak, ako tomu rozumieme.“

Otvorila kovovú schránku.

Vnútri bol kus čiernej hmoty, ktorá pohlcovala svetlo.

Nymar cúvol.

# character: Nymar
„To je ono.“

# character: Mara
„Dotkli sa ťa?“

Nymar prikývol.

Mara sa pozrela na teba.

# character: Mara
„Potom už vedia cestu k Vaelgardu.“

-> teleskop

=== teleskop ===
Vystúpili ste na vrchol observatória.

Bronzový kruh nebol teleskop.

Bol to zosilňovač dračieho vnímania.

Mara ho aktivovala.

Nymar sa dotkol čelom kryštálu.

A ty si videl jeho očami.

Nie sever.

Nie oblohu.

Priestor medzi hviezdami.

Tam sa pohybovali stovky tmavých tvarov.

A jeden z nich bol obrovský.

# character: Nymar
„Pozerá sa na nás.“

* [Okamžite prerušiť spojenie.]
    ~ rozum += 1
    -> prerusenie
* [Vydržať a skúsiť zistiť viac.]
    ~ odvaha += 2
    ~ zranenie += 1
    -> pohlad
* [Skúsiť s bytosťou komunikovať.]
    ~ puto += 1
    ~ tajomstvo += 2
    -> kontakt

=== prerusenie ===
Odtrhol si Nymara od kryštálu.

Obaja ste spadli na podlahu.

# character: Nymar
„Ďakujem.“

Mara však hľadela na prístroj.

# character: Mara
„Už nás zaznamenal.“

-> utok

=== pohlad ===
Vydržal si.

Obraz sa priblížil.

Obrovský Tichý nebol jedna bytosť.

Bol zhlukom tisícov menších.

Uprostred nich bolo svetlo.

Niečo, čo poznáš.

Kotva.

# player: Ty
„Oni majú Kotvu.“

Edran zavrel oči.

# character: Majster Edran
„Nie. My máme ich.“

-> utok

=== kontakt ===
Namiesto ústretového slova si vyslal cez Nymara jednoduchú otázku.

Prečo?

Odpoveď neprišla v slovách.

Prišiel obraz.

Draky letiace medzi hviezdami.

Mestá horiace.

Kotvy vyrastajúce ako ihly.

A potom jediný pocit:

STRATA.

Nymar sa odtrhol od kryštálu.

# character: Nymar
„Oni nás nenávidia.“

# player: Ty
„Prečo?“

# character: Nymar
„Myslia si, že sme im niečo ukradli.“

~ tajomstvo += 1
-> utok

=== utok ===
Všetky lampy zhasli.

Vonku prestal fúkať vietor.

Mara vytiahla meč.

# character: Mara
„Prišli.“

Na oblohe sa objavil prvý Tichý.

Vyzeral ako diera vyrezaná do sveta.

Sareth vypustila oheň.

Plameň zmizol skôr, než sa bytosti dotkol.

# character: Lyra
„To nie je možné.“

# character: Edran
„Preto sme prehrali prvýkrát.“

-> obrana

=== obrana ===
Tichí klesali k observatóriu.

Mara ukázala na bronzový kruh.

# character: Mara
„Aster má obranu. Potrebuje však dračiu rezonanciu.“

# character: Nymar
„Kotvu.“

# character: Mara
„Nie. Dobrovoľné spojenie.“

Šesť drakov sa muselo spojiť cez jazdcov do jedinej siete.

* [Pripojiť sa bez váhania.]
    ~ odvaha += 1
    ~ puto += 2
    -> siet
* [Trvať na tom, aby každý drak výslovne súhlasil.]
    ~ sucit += 2
    -> suhlas
* [Hľadať technické riešenie bez spoločného puta.]
    ~ rozum += 2
    -> mechanizmus

=== suhlas ===
Každý jazdec sa obrátil na svojho draka.

Nymar sa dotkol čelom tvojho čela.

# character: Nymar
„Áno.“

Sareth prikývla Lyre.

Rok štuchol Tarena tak silno, že skoro spadol.

Var súhlasil posledný.

Mara sa usmiala.

# character: Mara
„Takto to malo fungovať od začiatku.“

-> siet

=== mechanizmus ===
Lyra s Edranom našli staré vedenia pod podlahou.

Aster nepotreboval ovládnuť drakov. Potreboval iba zosúladiť rytmus kryštálov.

# character: Lyra
„Takže žiadna centrálna Kotva.“

# character: Edran
„Presne.“

# player: Ty
„Sieť bez pána.“

Edran prikývol.

~ tajomstvo += 1
-> siet

=== siet ===
Keď sa spojenie otvorilo, prvýkrát si necítil iba Nymara.

Cítil si Sareth.

Roka.

Vara.

A ďalších drakov.

Nie ich myšlienky. Ich prítomnosť.

Bronzový kruh sa rozžiaril.

Tichí sa zastavili.

Potom svet explodoval do bieleho svetla.

-> po_utoku

=== po_utoku ===
Prebral si sa v snehu.

Observatórium stále stálo.

Tichí zmizli.

Nymar ležal vedľa teba.

# player: Ty
„Nymar?“

Otvoril jedno oko.

# character: Nymar
„Ak je toto smrť, je veľmi studená.“

Taren sa zasmial.

Mara však neoslavovala.

Pozerala na sever.

# character: Mara
„To bola iba prieskumná skupina.“

-> odhalenie

=== odhalenie ===
V podzemí observatória ste našli posledný záznam starého rádu.

Bol napísaný v dračom jazyku.

Nymar ho prečítal.

# character: Nymar
„Kotvy nepostavili ľudia.“

Edran prikývol.

# character: Majster Edran
„Prví draci ich postavili sami.“

# player: Ty
„Prečo by sa sami spútali?“

Mara položila čierny fragment na stôl.

# character: Mara
„Aby sa skryli pred Tichými.“

Lyra pochopila prvá.

# character: Lyra
„Puto medzi človekom a drakom nebolo väzenie.“

# character: Majster Edran
„Pôvodne nie.“

# character: Nymar
„Bola to maska.“

-> navrat

=== navrat ===
Na spiatočnú cestu ste sa pripravovali v tichosti.

Vaelgard mal nepriateľa na východe.

Teraz mal aj nepriateľa na severe.

A možno boli obe hrozby spojené.

Pred odletom ti Mara podala malý kryštál z observatória.

# character: Mara
„Aster zachytil ešte jeden signál.“

# player: Ty
„Odkiaľ?“

Ukázala na juh.

# character: Mara
„Z miesta, kde podľa všetkých máp nič nie je.“

Nymar roztiahol krídla.

# character: Nymar
„Začínam neznášať miesta, kde podľa máp nič nie je.“

# system
Kapitola VIII — Observatórium Aster — dokončená.
-> DONE
