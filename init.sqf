// Create a mission entry for the server and client RPT file, easier to debug when you know what mission created the error
diag_log text ""; 
diag_log text format["|=============================   %1   =============================|", missionName]; // stamp mission name
diag_log text "";

_PARAM_RHS = "PARAM_RHS" call BIS_fnc_getParamValue;
if ((isClass(configFile >> "CfgPatches" >> "rhs_main")) and (_PARAM_RHS == 1)) then {
	ghst_rhsmod = true;
} else {
	ghst_rhsmod = false;
};

enableSaving [false, false];

CIVILIAN setFriend [WEST, 1];
WEST setFriend [CIVILIAN, 1];
EAST setFriend [CIVILIAN, 1];
INDEPENDENT setFriend [CIVILIAN, 1];

// Wait until player is initialized
if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};

tf_no_auto_long_range_radio = true;

call compile  preprocessfile "comm_menusub.sqf";

_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

execVM "scripts\NRE_earplugs.sqf";

//["Preload"] call BIS_fnc_arsenal;