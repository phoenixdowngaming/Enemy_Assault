waituntil {! isnull player};

//RHS Escalation Detect
_PARAM_RHS = "PARAM_RHS" call BIS_fnc_getParamValue;
if ((isClass(configFile >> "CfgPatches" >> "rhs_main")) and (_PARAM_RHS == 1)) then {
	ghst_rhsmod = true;
	ghst_casplane = "RHS_A10";
	ghst_attachhelo = "RHS_AH64D_wd_AA";
	ghst_attachhelo2 = "RHS_MELB_AH6M_H";
	ghst_transportheli = "RHS_UH60M";

	ghst_airliftheli = "rhsusf_CH53E_USMC";
	ghst_escortheli = ["RHS_AH64D_wd_AA", "RHS_AH64D_wd_AA"];
} else {
	ghst_rhsmod = false;
	ghst_casplane = "B_Plane_CAS_01_F";
	ghst_casplane2 = "B_T_VTOL_01_armed_olive_F";
	ghst_attachhelo = "B_Heli_Attack_01_F";
	ghst_attachhelo2 = "B_Heli_Light_01_armed_F";
	ghst_transportheli = "B_Heli_Transport_01_camo_F";
	ghst_transportheli_lb = "B_Heli_Light_01_F";
	ghst_transportheli_bf = "B_T_VTOL_01_infantry_blue_F";
	ghst_airliftheli = "B_Heli_Transport_01_camo_F";
	ghst_escortheli = ["B_Heli_Attack_01_F"];
	ghst_escort_lb = ["B_Heli_Light_01_armed_F"];
};

//West Cargo Aircraft type
ghst_air_cargo = "B_T_VTOL_01_vehicle_olive_F";
if ghst_rhsmod then {ghst_air_cargo = "RHS_C130J";};

if ghst_rhsmod then {
	_vehlist = execvm "scripts\rhs_vehiclelist.sqf";
	_airlist = execvm "scripts\rhs_aircraftlist.sqf";
	_boatlist = execvm "scripts\rhs_boatlist.sqf";
} else {
	_vehlist = execvm "scripts\vehiclelist.sqf";
	_airlist = execvm "scripts\aircraftlist.sqf";
	_boatlist = execvm "scripts\boatlist.sqf";
};

#include "addnotes.sqf"

if (player iskindof "B_recon_JTAC_F") then {
//[player,"Attackhelo"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_helosup", 0];
player setVariable ["ghst_helosup2", 0];

[player,"Casplane"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_cassup", 0];

//[player,"RemoteDesignator"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_remotedes", 0];
};

if (player iskindof "B_soldier_UAV_F") then {
[player,"UAV"] call BIS_fnc_addCommMenuItem;
	if (_PARAM_USAF == 1) then {
		[player,"UAV2"] call BIS_fnc_addCommMenuItem;
	};
player setVariable ["ghst_uavsup", 0];

//[player,"UGV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_ugvsup", [0,0]];

//[player,"PUAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_puavsup", 0];

//[player,"RemoteDesignator"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_remotedes", 0];
//[player,"Artillery"] call BIS_fnc_addCommMenuItem;
};

if (player iskindof "B_Soldier_SL_F") then {
[player,"AMMO"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_ammodrop", 0];

//[player,"PUAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_puavsup", 0];

[player,"RESPAWNTENT"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_respawntent", 0];
};

//[player,"CARGO"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_cargodrop", 0];
//[player,"Transport"] call BIS_fnc_addCommMenuItem;

[player,"Transport"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_transport", 0];
player setVariable ["ghst_airlift", 0];

[player,"Viewdistance"] call BIS_fnc_addCommMenuItem;
[player,"AdddesBat"] call BIS_fnc_addCommMenuItem;

waituntil { !(isnil "ghst_vehiclelist")};

//addactions for halo and vehspawn. Should ensure them showing even with jip
vehspawn addAction ["<t size='1.5' shadow='2' color='#FFA000'>Spawn Armor</t> <img size='3' color='#FFA000' shadow='2' image='\A3\armor_f_gamma\MBT_01\Data\UI\Slammer_M2A1_Base_ca.paa'/>", "call ghst_fnc_spawnveh", ["veh_spawn",45,ghst_armorlist], 6, true, true, "","alive _target"];
vehspawn setObjectTexture [0, "\A3\armor_f_gamma\MBT_01\Data\UI\Slammer_M2A1_Base_ca.paa"];
vehspawn addAction ["<t size='1.5' shadow='2' color='#ff634d'>Spawn Car</t> <img size='3' color='#ff634d' shadow='2' image='\A3\Soft_F_Exp\LSV_01\Data\UI\LSV_01_base_CA.paa'/>", "call ghst_fnc_spawnveh", ["veh_spawn",45,ghst_carlist], 6, true, true, "","alive _target"];
vehspawn addAction ["<t size='1.5' shadow='2' color='#9af2ff'>Spawn Static</t> <img size='3' color='#9af2ff' shadow='2' image='\A3\Static_f_gamma\data\ui\gear_StaticTurret_MG_CA.paa'/>", "call ghst_fnc_spawnveh", ["veh_spawn",45,ghst_staticvehlist], 6, true, true, "","alive _target"];

airspawn addAction ["<t size='1.5' shadow='2' color='#FFA000'>Spawn Aircraft</t> <img size='3' color='#FFA000' shadow='2' image='\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Plane_CAS_01_CA.paa'/>", "call ghst_fnc_spawnair", ["air_spawn",135], 6, true, true, "","alive _target"];
airspawn setObjectTexture [0, "\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Plane_CAS_01_CA.paa"];

boatspawn addAction ["<t size='1.5' shadow='2' color='#FFA000'>Spawn Boat</t> <img size='3' color='#FFA000' shadow='2' image='\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa'/>", "call ghst_fnc_spawnboat", ["boat_spawn",166], 6, true, true, "","alive _target"];
boatspawn setObjectTexture [0, "\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa"];

halo addAction ["<t size='1.5' shadow='2' color='#00ffff'>HALO</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [false,1000,60,false], 5, true, true, "","alive _target"];

halo addaction ["<t size='1.4' shadow='2' color='#FF0000'>Clear Respawn Tents</t>", "call ghst_fnc_clear_respawn_tents", [], 1, false, false, "","alive _target"];
halo setObjectTexture [0, "\A3\Characters_F\data\ui\icon_b_parachute_ca.paa"];

halo2 addAction ["<t size='1.5' shadow='2' color='#00ffff'>HALO</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [false,1000,60,false], 5, true, true, "","alive _target"];
halo2 setObjectTexture [0, "\A3\Characters_F\data\ui\icon_b_parachute_ca.paa"];

port_teleport addAction ["<t size='1.5' shadow='2' color='#8904B1'>Move to Port</t> <img size='3' color='#8904B1' shadow='2' image='\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa'/>", {player setposasl [getmarkerpos "spawn_board_3" select 0,getmarkerpos "spawn_board_3" select 1,1.5];}, [], 5, true, true, "","alive _target"];
port_teleport setObjectTexture [0, "\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa"];

boatspawn addAction ["<t size='1.5' shadow='2' color='#8904B1'>Move to Base</t> <img size='3' color='#8904B1' shadow='2' image='\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa'/>", {player setposatl [getmarkerpos "Respawn_West" select 0,getmarkerpos "Respawn_West" select 1,0.2];}, [], 5, false, true, "","alive _target"];

port_teleport addAction ["<t size='1.5' shadow='2' color='#FFA000'>Move to Ranget</t> <img size='3' color='#FFA000' shadow='2' image='\A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_X_CA.paa'/>", {player setposasl [getmarkerpos "range" select 0,getmarkerpos "range" select 1,0.2];}, [], 5, true, true, "","alive _target"];

range addAction ["<t size='1.5' shadow='2' color='#8904B1'>Move to Base</t> <img size='3' color='#8904B1' shadow='2' image='\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa'/>", {player setposatl [getmarkerpos "Respawn_West" select 0,getmarkerpos "Respawn_West" select 1,0.2];}, [], 5, false, true, "","alive _target"];
range  setObjectTexture [0, "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_X_CA.paa"];

ghst_local_vehicles = [];
ghst_players = ["p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16","p17","p18","p1_1","p2_1","p3_1","p4_1","p5_1","p6_1","p7_1","p8_1","p9_1","p10_1","p11_1","p12_1","p13_1","p14_1","p15_1","p16_1","p17_1"];
ghst_vehicles = ["heli_1","heli_2","vas1","vas2","vas3","bobcat_1","c130c_1","c130t_2"];

if ("PARAM_PIFF" call BIS_fnc_getParamValue == 1) then {
	[allplayers] call BIS_fnc_EXP_camp_IFF;
};
//player addEventHandler ["Killed", {call fnc_ghst_remrandomspawn}];  
//call fnc_ghst_remrandomspawn;
//systemChat "Saving initial loadout";

//call fnc_ghst_setrespawninventory;

//Save loadout when ever we exit an arsenal
[ missionNamespace, "arsenalClosed", {
	systemChat "Arsenal Loadout Saved";
	player setVariable ["GHST_Current_Gear",getUnitLoadout player];
}] call BIS_fnc_addScriptedEventHandler;

/*
//set weather
_delay = 86400;
waituntil {! isNil {missionNamespace getvariable "ghst_weather"}};

skipTime -24;
[_delay] call fnc_ghst_UpdateWeather;
skipTime 24;

sleep 1;

simulWeatherSync;
*/
[] spawn ghst_fnc_vehicle_actioninit;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
["RegisterGroup", [group player,leader group player,["insignia_GL", "Skull Squad", false]]] call BIS_fnc_dynamicGroups;

[] spawn ghst_fnc_ptracker;

sleep 30;
/*
// Info text
[str("Phoenix Down Gaming Presents") , str("2017 Enemy Assault") , str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("By Ghost // PDG Map Team")] spawn BIS_fnc_infoText;
*/
_msg = format ["Phoenix Down Gaming Presents: 2017 Enemy Assault  Created by Ghost -- with Edits by PDG Map Team"]; //leave spaces as they are for best results
[format["<t size='1' color='#1E90FF' t shadow='2'>%1</t>",_msg],0,0.8,10,2] call BIS_fnc_dynamicText;