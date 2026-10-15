ok. web and expo app project for avva ISP company.

administratorius, vadybininke->
Jie gali daryti viska ka linijos meistrai plius.
Jie gali valdyti esamu vartotoju duomenu baze. Siuo metu visi vartotojai saugomi excell faile (adresas, kaina, telefonas, vardas,pavarde, el pastas ir kt).
Noriu sukurti vartotoju valdymo sistema su kuria butu galima redaguoti kiekvieno kliento interneto/tv planus, atsaukti contracts, prideti naujus vartotojus, pazymeti skolininkus( nesu tikras del sito). importuoti/eksportuoti excell faila. Nesu tikras kaip praktikoje bus naudojama sistema ar bus patogiau redaguoti excell faila ir tada ji importuoti ir tada webe atlikti paieska ar kitus veiksmus.
vartotoju sistemoje turi buti filtravimas pagal pagr laukus. cia aisku galima prigalvoti visko.
 Taip pat admin/vadybininke gali sukurti todo tipo atjungimo uzduotis kiekviena menesi ir jas pateikti linijos meistrams atlikti. lape butu 4 stulpeliai  adresas,namo nr, buto nr, komentaras kuris yra nebutinas (atjungta, buvo atjungta, prisijunge prie kito tiekejo ir kt info) visa uzduoties laikotarpi i ja galima prideti papildomu atjungimo kol jos neuzbaige darbuotas- linijos meistras.
 Visi atlikti atjungimai saugomi istorijoje kuria gali patikrinti tiek vadyb tiek darbuotojas.
visa tai yra pateikiama web formatu.


linijos meitrai (tech) ->
todo uzduotis darbuotojas pazymi vernele checked ir palieka komentara. kai visas sarasas baigtas jis gali submit uzduoti ar kitaip parodyti, kad darbas atliktas.

Darbuotojas taip pat gali paieskti vartotoju duomenu baze, bet limituotai. Jis mato adresa, plana ar suma,skola, ar yra contracts ar ji nutraukta. cia dar mastau kaip turetu buti.
visa tai turi buti app formate suprantai pateikta darbuotojui.

1. visa tai lieka tik tai skirta linijos meistrams  ir appui.
2. telefonas skirtas pasiskambinti ar sumoketa skola. buna, kad veluoja mokejimai ir excell failas, skolos suma butu svarbu zinoti pokalbio metu jeigu zmogus galvoja sumoketi iskarto. el pastas ir vardas gal nereikalingi.
3. Sis klausimas man kyla del vadybininkes noro dirbti su sistema. gali buti pereinamas laikotarpis ir tarkim ikeltas naujas excell istrina viska ir rodo tik excell turini ir tarkime nustatymuose butu galima pakeisti prioriteta. nustatytus galetu keisti tik administratorius.
4. sismetos skoloms nera. buchaltere gauna duomenis is Jonavos paslaugos, kad nebuvo apmoketa ir fiksuoja skola. skolininkai yra dalis atjungimu. Kita dalis yra zmones pereje pas kitas isp imones ar apskritai atsisakantys paslaugu.
yra keletas planu
pagrindinis tv planas 5 eur,
papildomi tv kanalai 11 eur;
koduoti sporto kanalai 10 eur;
pliustv (pirmas tv +4eur visi kiti +2eur) internetine televizija;
internetas jeigu turi papildomus tv kanalus: 2.90 eur;
tik internetas: 9 eur;
5. Uzduotis skiriama bendrai visiems ir jie gyvai mato kurie adresai jau padaryti. atjungimai vyksta laiptineje i buta patekti nereikia. atjungimas atliekamas bet kokiu atveju. pavieniai pajungimai, nauji klientai ir skolu apmokejimai vyksta uz sistemos ribu. Manau turetu but susieja ir paspaudus salia mygtuka ar kazkokia kita funkcija rodyti ta informacija darbuotojui.
Nesu tikras del ar vadyb gali grazinti uzduoti? ta prasme pilnai atsaukti? praktikoje buna tik vienas kitas adresas atkrenta del skolos sumokejimo, bet si sistema lakiau skirta atlikti atjungimams, o ne kaupti tiklius duomenis.
6. rysys be interneto nebutinas. sismeta naudosis iki 10 zmoniu.

Visos duomenų bazės lentelės:

## [buildings]
Laukai:
    id: skaicius
- [street] ([tipas: tekstas])
- [house_number] ([tipas: tekstas])
- [fed_by_device_id] ([tipas: skaicius])

Ryšiai:
- [staircases]: 1 / many 
- [maintenance_note]: 1 / many 
- [devices]: many to one
- [contracts]: one to many

Taisyklės:
- unikalu gatve+namo nr


## [staircases]
Laukai:
    id: skaicius
- [building_id] ([tipas: skaicius])
- [number] ([tipas: skaicius])
- [door_code] ([tipas: tekstas])

Ryšiai:
- [Building]: many to one 

Taisyklės:
- building_id+number

## [devices]
Laukai:
    id: skaicius
- [type] ([tipas: vienas iš sąrašo])
- [location_note] ([tipas: tekstas])
- [installed_in_building_id] ([tipas: skaicius])
- [parent_device_id] ([tipas: skaicius|null])

Ryšiai:
- [buildings] (kuriame yra): many to one
- [devices] (iš kurio gauna signalą): many to one  ← su savimi
- [buildings] (kuriuos maitina): one to many

tipai: 
optical_converter
amp_with_socket_power
amp_with_cable_power
Taisyklės:
- (pvz. unikalu: stiprintuvo id?)

## [maintenance_notes]
Laukai:
    id: skaicius
- [building_id] ([tipas:skaicius])
- [noted_on] ([tipas:   ])
- [note] ([tipas: tekstas])


Ryšiai:
- [Buildings]: many to one

Taisyklės:
- (pvz. unikalu: maintenance_note id?)

## [contracts]
Laukai:
   Id: skaicius
- [building_id] ([tipas: skaicius])
- [apartment_number] ([tipas: tekstas | null])
- [phone] ([tipas: tekstas])
- [first_name] ([tipas: tekstas | null])
- [last_name] ([tipas: tekstas| null])
- [email] ([tipas: tekstas | null])
- [debt_cents] ([tipas: skaicius centais])
- [is_active] ([tipas: boolean])

Ryšiai:
- [building]: many to one
- [contract_plans]: one to many

Taisyklės:
- viename bute gali būti viena aktyvi contracts. Atšauktų gali būti daug, nes jos lieka istorijai.

## [plans]
Laukai:
    id: skaicius
- [name] ([tipas: tekstas?])

Ryšiai:
- [contract_plans]: one to many


Taisyklės:
- unikalus plano pavadinimas


## [plan_prices]
Laukai:
    id: skaicius
- [plan_id] ([tipas:skaicius])
- [price_cents] ([tipas: skaicius])
- [price_with_extra_channels_cents] ([tipas: skaicius| null])
- [valid_from] ([tipas: date])


Ryšiai:
- [plans]: many to one


Taisyklės:
viena kaina nuo tos pacios datos




## [contract_plans]
Laukai:
    id: skaicius
- [contract_id] ([tipas:skaicius])
- [plan_id] ([tipas: skaicius])
- [quantity] ([tipas: skaicius| default = 1])

Ryšiai:
- [plans]: many to one
- [contracts]: many to one

Taisyklės:
- contracts turi unikalius planus. negali tureti dveju internetu.

## [disconnection_tasks]
Laukai:
    id: skaicius
- [month] ([tipas: data])
- [created_by] ([tipas: uuid])
- [is_completed] ([tipas: ne false, taip true])


Ryšiai:
- [disconnection_task_items]: one to many
- [profiles]: many to one


Taisyklės: viena uzduotis tam paciam menesiui
- 

## [disconnection_task_items]
Laukai:
    id: skaicius
- [task_id] ([tipas: skaicius])
- [contract_id] ([tipas: skaicius])
- [comment] ([tipas: tekstas|null])
- [is_disconnected] ([tipas: neatjungtas false, atjungas true]) 

Ryšiai:
- [disconnection_tasks]: many to one
- [contracts]: many to one


Taisyklės:
- adresas unikalus uzduotyje.

## [profiles]
Laukai:
    id: uuid
- [full_name] ([tipas:tekstas])
- [role] ([tipas: vienas is saraso])


Ryšiai:
- [disconnection_tasks]: one to many




┌──────────────────────┐
│     staircases       │
│──────────────────────│
│ id                   │
│ building_id ─────────┼──────────────┐ ① laiptinė priklauso pastatui
│ number               │              │
│ door_code            │              │
└──────────────────────┘              │
                                      ▼
                        ┌──────────────────────────┐
                        │        buildings         │
                        │──────────────────────────│
                        │ id                       │◄────────────┐
                        │ street                   │             │
                        │ house_number             │             │
                        │ fed_by_device_id ────────┼──────┐      │
                        └──────────────────────────┘      │      │
                           ② pastatas gauna signalą iš    │      │
                              įrenginio                   │      │
                                                          ▼      │
                        ┌──────────────────────────┐             │
                        │         devices          │             │
                        │──────────────────────────│             │
                        │ id                       │◄─────┐      │
                        │ type                     │      │      │
                        │ location_note            │      │      │
                        │ installed_in_building_id ┼──────┼──────┘
                        │ parent_device_id ────────┼──────┘   ③ įrenginys stovi pastate
                        └──────────────────────────┘
                           ④ įrenginys gauna signalą iš kito įrenginio (savo tėvo)
Keturios rodyklės
#	Laukas	Iš → Į	Sakinys	Tuščias?
①	staircases.building_id	staircases → buildings	„Ši laiptinė yra šiame pastate“	ne
②	buildings.fed_by_device_id	buildings → devices	„Šis pastatas gauna signalą iš šio įrenginio“	taip, pildysi palaipsniui
③	devices.installed_in_building_id	devices → buildings	„Šis įrenginys stovi šiame pastate“	taip, gali būti prie stulpo
④	devices.parent_device_id	devices → devices	„Šis įrenginys gauna signalą iš šio įrenginio“	taip, pirmas keitiklis