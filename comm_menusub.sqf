CasplanesubMenu =

[
["CAS Planes",true],

["CAS Planes", [0],"",-2,[["expression", ""]], "1", "0"], // header text 

["A-10", [2], "", -5, [["expression", "ghst_cassupport = [(getmarkerpos ""ghst_player_support""),ghst_casplane,30,[600, 600],30,[false,""ColorRed""],""ghst_cassup""] spawn ghst_fnc_airsupport;"]], "1", "1"],
["Blackfish", [3], "", -5, [["expression", "ghst_cassupport = [(getmarkerpos ""ghst_player_support""),ghst_casplane2,30,[600, 600],30,[false,""ColorRed""],""ghst_cassup""] spawn ghst_fnc_airsupport;"]], "1", "1"]

];

CashelosubMenu =

[
["Attack Helicopters",true],

["Attack Helicopters", [0],"",-2,[["expression", ""]], "1", "0"], // header text 

["AH-64", [2], "", -5, [["expression", "ghst_helosupport = [(getmarkerpos ""ghst_player_support""),ghst_attachhelo,30,[400, 150],30,[false,""ColorRed""],""ghst_helosup""] spawn ghst_fnc_airsupport;"]], "1", "1"],

["AH-6", [3], "", -5, [["expression", "ghst_helosupport = [(getmarkerpos ""ghst_player_support""),ghst_attachhelo2,30,[400, 150],30,[false,""ColorRed""],""ghst_helosup2""] spawn ghst_fnc_airsupport;"]], "1", "1"]

];

UavsubMenu =

[
["Unmanned Support",true],

["Unmanned Support", [0],"",-2,[["expression", ""]], "1", "0"], // header text 

["MQ-4A", [2], "", -5, [["expression", "ghst_uavsupport = [(getmarkerpos ""ghst_player_support""),""B_UAV_02_F"",500,30] spawn ghst_fnc_uavsupport;"]], "1", "1"],

["MQ-12 Falcon", [3], "", -5, [["expression", "ghst_ugvsupport = [(getmarkerpos ""ghst_player_support""),""B_T_UAV_03_F"",100,30] spawn ghst_fnc_uavsupport;"]], "1", "1"],

["UCAV Sentienl", [4], "", -5, [["expression", "ghst_uavsupport = [(getmarkerpos ""ghst_player_support""),""B_UAV_05_F"",100,30] spawn ghst_fnc_uavsupport;"]], "1", "1"],

["UGV Stomper RCWS", [5], "", -5, [["expression", "ghst_ugvsupport = [(getmarkerpos ""ghst_player_support""),""B_UGV_01_rcws_F"",2,30] spawn ghst_fnc_ugvsupport;"]], "1", "1"],

["AR-2", [6], "", -5, [["expression", "ghst_puavsupport = [""B_UAV_01_F"",5] spawn ghst_fnc_puavsupport;"]], "1", "1"]

];

CargodropsubMenu =

[
["Cargo Drop",true],

["Cargo Drop", [0],"",-2,[["expression", ""]], "1", "0"], // header text 

["Cars and Trucks", [2], "", -5, [["expression", "ghst_drop = [player,(getmarkerpos ""ghst_player_support""),ghst_air_cargo,ghst_carlist,200,30] spawn ghst_fnc_cargodrop;"]], "1", "1"],

["Armor", [3], "", -5, [["expression", "ghst_drop = [player,(getmarkerpos ""ghst_player_support""),ghst_air_cargo,ghst_armorlist,200,30] spawn ghst_fnc_cargodrop;"]], "1", "1"],

["Static", [3], "", -5, [["expression", "ghst_drop = [player,(getmarkerpos ""ghst_player_support""),ghst_air_cargo,ghst_staticvehlist,200,30] spawn ghst_fnc_cargodrop;"]], "1", "1"],

["Boats", [4], "", -5, [["expression", "ghst_drop = [player,(getmarkerpos ""ghst_player_support""),ghst_air_cargo,ghst_boatlist,200,30] spawn ghst_fnc_cargodrop;"]], "1", "1"]

];

TransportsubMenu =

[
["Helicopter Airlift",true],

["Helicopter Airlift", [0],"",-2,[["expression", ""]], "1", "0"], // header text 

["Ghost Hawk Transport", [2], "", -5, [["expression", "ghst_transport = [ghst_transportheli,ghst_escortheli,(getmarkerpos ""helortb""),50,30] spawn ghst_fnc_init_transport;"]], "1", "1"],

["Hummingbird Transport", [3], "", -5, [["expression", "ghst_transport = [ghst_transportheli_lb,ghst_escort_lb,(getmarkerpos ""helortb""),50,30] spawn ghst_fnc_init_transport;"]], "1", "1"],

["Blackfish Transport", [4], "", -5, [["expression", "ghst_transport = [ghst_transportheli_bf,ghst_escortheli,(getmarkerpos ""helortb""),50,30] spawn ghst_fnc_init_transport;"]], "1", "1"],

["Helicopter Cargo Lift", [5], "", -5, [["expression", "ghst_airlift = [ghst_airliftheli,(getmarkerpos ""object_drop_point""),50,15] spawn ghst_fnc_init_airlift;"]], "1", "1"]

];