#include "\a3\functions_f_mp_mark\Revive\defines.hpp"

systemChat "Saving initial loadout";
//Save initial loadout
[ player, [ missionNamespace, "GHST_Current_Gear" ] ] call BIS_fnc_saveInventory;


//Save loadout when ever we exit an arsenal
[ missionNamespace, "arsenalClosed", {
	systemChat "Arsenal closed";
	[ player, [ missionNamespace, "GHST_Current_Gear" ] ] call BIS_fnc_saveInventory;
}] call BIS_fnc_addScriptedEventHandler;

//Save backpack and items when killed
player addEventHandler [ "Killed", {
	params[
		"_unit",
		"_killer"
	];
	systemChat "Killed";
	if ( GET_STATE( _unit ) isEqualTo STATE_DOWNED ) then {
		systemChat "Downed - saving backpack and contents";
		_unit setVariable [ "backpack", backpack _unit ];
		_unit setVariable [ "backpack_items", backpackItems _unit ];
	};
	_arsenalNames = [];
	_arsenalDataLocal = [];
	_arsenalData = profilenamespace getvariable ["bis_fnc_saveInventory_data",[]];
	for "_i" from 0 to (count _arsenalData - 1) step 2 do {
		_name = _arsenalData select _i;
		_arsenalDataLocal = _arsenalDataLocal + [_name,_arsenalData select (_i + 1)];
		_nul = _arsenalNames pushBack ( format[ "missionnamespace:%1", _name ] );
	};
	missionnamespace setvariable ["bis_fnc_saveInventory_data",_arsenalDataLocal];
	[player,_arsenalNames] call bis_fnc_setrespawninventory;
}];


player addEventHandler [ "Respawn", {
	params[
		"_unit",
		"_corpse"
	];

	systemChat "Respawning";
	systemChat format[ "state %1", GET_STATE_STR(GET_STATE( _unit )) ];

	switch ( GET_STATE( _unit ) ) do {
		case STATE_INCAPACITATED : {
			systemChat "Incapacitated";
			_backpack = _corpse getVariable [ "backpack", "" ];
			if !( _backpack isEqualTo "" ) then {
				systemChat "Fixing units backpack and items";
				removeBackpackGlobal _unit;
				_unit addBackpackGlobal _backpack;
				_items = _corpse getVariable [ "backpack_items", [] ];
				{
					_unit addItemToBackpack _x;
				}forEach _items;
			};
		};
		case STATE_RESPAWNED : {
			h = _unit spawn {
				params[ "_unit" ];
				systemChat "Died or Respawned via menu";
				_templates = [];
				{
					{
						_nul = _templates pushBackUnique _x;
					}forEach ( getMissionConfigValue [ _x, [] ] );
				}forEach [ "respawntemplates", format[ "respawntemplates%1", str playerSide ] ];

				sleep playerRespawnTime;

				if ( { "menuInventory" == _x }count _templates > 0 ) then {
					systemChat "Respawning - saving menu inventory";
					[ _unit, [ missionNamespace, "GHST_Current_Gear" ] ] call BIS_fnc_saveInventory;
				}else{
					systemChat "Respawning - loading last saved";
					[ _unit, [ missionNamespace, "GHST_Current_Gear" ] ] call BIS_fnc_loadInventory;
						if (player hasweapon "laserdesignator") then {
							player addmagazine "laserbatteries";
						};
				};

				_unit setVariable [ "backpack", nil ];
				_unit setVariable [ "backpack_items", nil ];
			};
		};
	};
}];