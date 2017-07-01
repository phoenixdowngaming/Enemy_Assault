//Set Marker color for players
ghstMarkerplayers_color = {
	[(((side _this) call bis_fnc_sideID) call bis_fnc_sideType),true] call bis_fnc_sidecolor;
};

//player tracking markers
ghstMarkerPlayers = {
	private ["_alive_players","_unit","_marker","_pmark_color","_x","_markerDir","_markertext","_mark","_idx","_isplayer"];
	_alive_players = ghst_players;//(playableunits + switchableunits);//ghst_players;//
	{
		_unit = missionNamespace getVariable _x;
		_marker = _x;
		_markertext = "";
		_isplayer = false;
		_pmark_color = "ColorBLUFOR";
		if !(isNil "_unit") then {
		//if !(isnull _unit) then {
		
			if (hasInterface and isplayer _unit) then {_isplayer = true;};
			
			if ((ghst_player_markers find _marker) == -1) then {
				//_pmark_color = _unit call ghstMarkerplayers_color;
				_mark = [[0,0],_pmark_color,_marker,"","mil_triangle",[0.3,0.6]] call fnc_ghst_mark_local;
				ghst_player_markers pushback _mark;
				//diag_log _mark;
			};
			if (isNull objectParent _unit) then {
				_markertext = name _unit;
			};
			if !(isNull objectParent _unit) then {
				if ((driver vehicle _unit isEqualTo _unit) and (count crew vehicle _unit > 1)) then {
					_markertext = format ["%1 [%2 +%3]", (name _unit), (configFile >> "cfgVehicles" >> (typeOf vehicle _unit) >> "displayName") call BIS_fnc_getCfgData, count (crew vehicle _unit) -1];
				};
				if ((_unit in (crew vehicle _unit)) and (count crew vehicle _unit isEqualTo 1)) then {
					_markertext = format ["%1 [%2]", (name _unit), (configFile >> "cfgVehicles" >> (typeOf vehicle _unit) >> "displayName") call BIS_fnc_getCfgData];
				};
			};
/*			if !((vehicle _unit == _unit) or ((_unit in (crew vehicle _unit)) and ((count crew vehicle _unit > 1) or (count crew vehicle _unit == 1)))) then {
				_markertext = "";
			};*/
			if (_unit getVariable "BIS_revive_incapacitated") then {
				_markertext = format ["%1 [Down]", name _unit];
				_marker setMarkerColorLocal "ColorRed";
				_marker setMarkerPosLocal getPosASL _unit;
			} else {
				//_pmark_color = _unit call ghstMarkerplayers_color;
				_marker setMarkerColorLocal _pmark_color;
			};
/*			if !((vehicle _unit == _unit) or ((driver vehicle _unit == _unit) and ((count crew vehicle _unit > 1) or (count crew vehicle _unit == 1)))) then {
				_markertext = "";
			};*/
			
			if (alive _unit and _isplayer) then {
				_markerDir = getDir vehicle _unit;
				_marker setMarkerAlphaLocal 1;
				_marker setMarkerPosLocal getPosASL _unit;
				_marker setMarkerTextLocal _markertext;
				_marker setMarkerDirLocal _markerDir;
			} else {
				_marker setMarkerPosLocal [0,0];
				_marker setMarkerTextLocal "";
				_marker setMarkerAlphaLocal 0;
			};
		} else {
			_idx = ghst_player_markers find _marker;
			if !(_idx == -1) then {
				ghst_player_markers deleteAt _idx;
				deleteMarkerLocal _marker;
			};
		};
	} forEach _alive_players;//allPlayers;
};

//vehicle tracking markers
ghstMarkerVehicles = {
	private ["_veh","_marker","_x"];
	{
		_veh = missionNamespace getVariable _x;
		_marker = _x;
		if !(isNil "_veh") then {
			if (alive _veh) then {
				if (count crew _veh < 1) then {
					_marker setMarkerAlphaLocal 1;
					_marker setMarkerPosLocal getPosASL _veh;
					_marker setMarkerTextLocal (getText (configFile >> "cfgVehicles" >> (typeOf _veh) >> "displayName"));
				} else {
					_marker setMarkerPosLocal getPosASL _veh;
					_marker setMarkerTextLocal "";
					_marker setMarkerAlphaLocal 0;
				};
			} else {
				_marker setMarkerPosLocal [0,0];
				_marker setMarkerTextLocal "";
				_marker setMarkerAlphaLocal 0;
			};
		} else {
			_marker setMarkerPosLocal [0,0];
			_marker setMarkerTextLocal "";
			_marker setMarkerAlphaLocal 0;
		};
	} forEach ghst_vehicles;
};

//Weather Update
//[1200] remoteExec ["fnc_ghst_UpdateWeather"];
fnc_ghst_UpdateWeather = {

	private ["_delay","_ghst_weather","_overcast","_rain","_winddir","_windstr","_delay"];
	
	_delay = _this select 0;//delay in seconds for transition
	//set weather
	_ghst_weather = missionNamespace getvariable "ghst_weather";

	_overcast = _ghst_weather select 0;
	_rain = _ghst_weather select 1;
	_winddir = _ghst_weather select 2;
	_windstr = _ghst_weather select 3;

	_delay setFog [0.1, 0.125, 0];
	_delay setOvercast _overcast;
	_delay setrain _rain;
	_delay setWindDir _winddir;
	_delay setWindStr _windstr;
};

//global switchmove
//[unit,"movement"] remoteExec ["fnc_ghst_global_switchmove"];
fnc_ghst_global_switchmove = {
	private ["_move","_unit"];
	_unit = _this select 0;//unit to animate
	_move = _this select 1;//movement in string format ""
	
	_unit switchmove _move;
};

//generic addaction function
fnc_ghst_addaction = {
	private ["_unit","_arg","_action"];
	_unit = _this select 0;
	_arg = _this select 1;
	
	_action = _unit addAction _arg;
	
	_action
};

//Task Complete
fnc_ghst_tsk_complete = {
	private ["_tsk"];
	_tsk = _this select 0;
	[_tsk,"succeeded"] call BIS_fnc_taskSetState;//SHK_Taskmaster_upd;
};

//global hint
//["message"] remoteExec ["fnc_ghst_global_hint"];
fnc_ghst_global_hint = {
	private ["_msg"];
	_msg = _this select 0;//message for hint
	
	hint _msg;
};

//global side chat
//["message"] remoteExec ["fnc_ghst_global_sidechat"];
//alternate
//["message",player] remoteExec ["fnc_ghst_global_sidechat"];
//["message",[west,"airbase"]] remoteExec ["fnc_ghst_global_sidechat"];
fnc_ghst_global_sidechat = {
	private ["_msg","_vars"];
	_msg = _this select 0;//message for hint
	_vars = param [1, [west,"Base"], [objNull, []], [1,2]];
	
	_vars sideChat _msg;
};

/*
using [_building] call BIS_fnc_buildingPositions; now
//building positions function for one building
//_build_positions = _building call fnc_ghst_find_positions;
fnc_ghst_build_positions = {

	private ["_i","_p","_b"];
	
	_i = 0;
	_b = [];
	_build_positions = [];
	_pIsEmpty = false;

	while { ! _pIsEmpty } do 
	{
		_p = _this buildingPos _i;

		if (( str _p != "[0,0,0]" ) and !(_this iskindof "Piers_base_F")) then
		{
			_b = _b + [_p];
		}
		else
		{
			_pIsEmpty = true;
		};
		
		_i = _i + 1;
	};
	if ((count _b > 0) and !(isNil "_b")) then {
		_build_positions = _build_positions + _b;
	};

	_build_positions
};
*/
//building positions function for array of buildings
//_all_build_positions = _buildingarray call fnc_ghst_all_positions;
fnc_ghst_all_positions = {
	
	private ["_all_build_positions","_pIsEmpty","_i","_p","_x"];

	_all_build_positions = [];
	
	{

		private ["_i","_p"];
		
		_i = 0;
		_pIsEmpty = false;

			while { ! _pIsEmpty } do 
			{
				_p = _x buildingPos _i;

				if (( str _p != "[0,0,0]" ) and !(_x iskindof "Piers_base_F")) then
				{
					//_all_build_positions = _all_build_positions + [_p];
					_all_build_positions pushback _p;
				}
				else
				{
					_pIsEmpty = true;
				};
				
				_i = _i + 1;
			};
			
	} foreach _this;
	
	_all_build_positions
};

//Find Random Position in a rectangle radius
//_pos = [[1,1,2],[300,500,60]] call fnc_ghst_rand_position;
//_pos = ["marker",[]] call fnc_ghst_rand_position;
fnc_ghst_rand_position = {

	private ["_pos_mark","_radarray","_wateronly","_dir","_position_mark","_radx","_rady","_pos","_xpos","_ypos","_rx","_ry","_loop"];

	_pos_mark = _this select 0;//position or marker
	_radarray = _this select 1;//array of x,y radius and direction
	_wateronly = if (count _this > 2) then {_this select 2;} else {false;};//get position in water only

	if (typename _pos_mark == typename []) then {

		_position_mark = _pos_mark;//position array
		_radx = _radarray select 0;//radius A if position is Not a marker
		_rady = _radarray select 1;//radius B if position is Not a marker
		_dir = _radarray select 2;
		if (isnil "_dir") then {
		_dir = (random 360) * -1;//random direction if not given
		} else {
		_dir = (_radarray select 2) * -1;//specified direction
		};
		
	} else {

		_position_mark = (getmarkerpos _pos_mark);//getmarker position
		_radx = (getMarkerSize _pos_mark) select 0;//radius A if position is a marker
		_rady = (getMarkerSize _pos_mark) select 1;//radius b if position is a marker
		_dir = (markerDir _pos_mark) * -1;//Marker Direction
		
	};
	
	_loop = true;

	while {_loop} do {

		_rx = (random (_radx * 2)) - _radx;
		_ry = (random (_rady * 2)) - _rady;
		
		if (_dir != 0) then {

			_xpos = (abs(_position_mark select 0)) + ((cos _dir) * _rx - (sin _dir) * _ry);	
			_ypos = (abs(_position_mark select 1)) + ((sin _dir) * _rx + (cos _dir) * _ry);

		} else {
		
			_xpos = (abs(_position_mark select 0)) + _rx;
			_ypos = (abs(_position_mark select 1)) + _ry;	
		
		};	
		
		_pos = [_xpos,_ypos,0];

		if (!_wateronly and !(surfaceIsWater [_pos select 0,_pos select 1])) then {_loop = false};
		if (_wateronly and (surfaceIsWater [_pos select 0,_pos select 1])) then {_loop = false};
	};
	
	_pos

};

//Find Random Position in a rectangle radius land and water
//_pos = [[1,1,2],[300,500,60]] call fnc_ghst_rand_position2;
//_pos = ["marker",[]] call fnc_ghst_rand_position2;
fnc_ghst_rand_position2 = {

	private ["_pos_mark","_radarray","_dir","_position_mark","_radx","_rady","_pos","_xpos","_ypos","_rx","_ry","_loop"];

	_pos_mark = _this select 0;//position or marker
	_radarray = _this select 1;//array of x,y radius and direction

	if (typename _pos_mark == typename []) then {

		_position_mark = _pos_mark;//position array
		_radx = _radarray select 0;//radius A if position is Not a marker
		_rady = _radarray select 1;//radius B if position is Not a marker
		_dir = _radarray select 2;
		if (isnil "_dir") then {
		_dir = (random 360) * -1;//random direction if not given
		} else {
		_dir = (_radarray select 2) * -1;//specified direction
		};
		
	} else {

		_position_mark = (getmarkerpos _pos_mark);//getmarker position
		_radx = (getMarkerSize _pos_mark) select 0;//radius A if position is a marker
		_rady = (getMarkerSize _pos_mark) select 1;//radius b if position is a marker
		_dir = (markerDir _pos_mark) * -1;//Marker Direction
		
	};
	
	_loop = true;

	while {_loop} do {

		_rx = (random (_radx * 2)) - _radx;
		_ry = (random (_rady * 2)) - _rady;
		
		if (_dir != 0) then {

			_xpos = (abs(_position_mark select 0)) + ((cos _dir) * _rx - (sin _dir) * _ry);	
			_ypos = (abs(_position_mark select 1)) + ((sin _dir) * _rx + (cos _dir) * _ry);

		} else {
		
			_xpos = (abs(_position_mark select 0)) + _rx;
			_ypos = (abs(_position_mark select 1)) + _ry;	
		
		};	
		
		_pos = [_xpos,_ypos,0];
		
		if !(isnil "_pos") then {_loop = false};

	};
	
	_pos

};

//simple cleanup
//call fnc_ghst_cleanup;
fnc_ghst_cleanup = {
	private["_x"];

	{if !(alive _x) then {deletevehicle _x;};} foreach vehicles;
	{deleteVehicle _x;} forEach allDead;
	{deleteGroup _x;} foreach allGroups;
	{deletevehicle _x;} foreach nearestObjects [(getmarkerpos "Respawn_West"),["CraterLong_small","CraterLong","WeaponHolder","GroundWeaponHolder"], 2000];
	
};

//deletes all vehicles and units that are dead around given position and radius and launches next objective area
//[(getmarkerpos "mark1"),500] call fnc_ghst_full_cleanup;
fnc_ghst_full_cleanup = {
	private["_x","_objmark","_rad","_PARAM_Enemy","_curtasks","_missiontype","_mapsize"];

	_objmark = _this select 0;//position
	_rad = _this select 1;//radius around position

	["All Tasks Complete, RTB for new tasking"]remoteExec ["fnc_ghst_global_sidechat"];
	[playableunits,5000,100] remoteExec ["fnc_ghst_addscore"];

	while {true} do {
		if ({ isPlayer _x and _x distance _objmark > (_rad + 500) } count playableunits == count playableunits) exitwith {};
		sleep 10;
	};
	//deletes current tasks including map task icons
	_curtasks = Ghst_Current_tasks;
	{_x call BIS_fnc_deleteTask} foreach _curtasks;

	{deletevehicle _x;} foreach ghst_mine_array;

	{deletevehicle _x;} foreach ghst_ied_array;
	
	{deletevehicle _x;} foreach ghst_animal_array;
	
	//AC-130 LDL_cam_rotating_center relocate
	if !(isnil "LDL_cam_rotating_center") then {
		LDL_cam_rotating_center setpos (getmarkerpos "center");
	};

	//{if ((faction _x == "IND_F") or (faction _x == "OPF_F") or (faction _x == "CIV_F")) then {deletevehicle _x;};} foreach (_objmark nearObjects ["ALL", _rad]);
	{if !(_x iskindof "Camping_base_F") then {deletevehicle _x;};} foreach (_objmark nearObjects ["ALL", _rad]);

	{if (((side _x == east) or (side _x == independent) or (side _x == civilian)) and !(vehicle _x isKindOf "Plane_Base_F")) then {deletevehicle _x;};} foreach allunits;

	{if !(alive _x) then {deletevehicle _x;};} foreach vehicles;

	{deleteVehicle _x;} forEach allDead;
	
	{deletevehicle _x;} foreach nearestObjects [(getmarkerpos "Respawn_West"),["CraterLong_small","CraterLong","WeaponHolder","GroundWeaponHolder"], 2000];

	//delete empty groups
	{deleteGroup _x;} foreach allGroups;
	
	call ghst_fnc_clear_respawn_tents;//remove respawn tents from map

	//Enemy Unit list
	call ghst_fnc_unitlist;

	_missiontype = selectRandom [1,2];
	switch (_missiontype) do {
		case 1: {
				//launch next objective area
				call ghst_fnc_randomobj;
			};
		case 2: {
				//launch side objective area
				if ((count ghst_milarray > 0) and ((random 9) > 6)) then {call ghst_fnc_sideobj;} else {call ghst_fnc_randomobj;};
			};
		default {
				//launch next objective area
				call ghst_fnc_randomobj;
			};
	};
	
};

//[grp,(getpos something), [300,300],[true,"ColorRed"],["SAFE", "NORMAL", "STAG COLUMN"],true(water only),underwater(needs wateronly)] call fnc_ghst_waypoints;
fnc_ghst_waypoints = {

	private ["_grp","_patrol_mark","_radarray","_markunitsarray","_markwps","_mcolor","_waypoint_params","_behave","_speed","_form","_wateronly","_underwater","_wppos","_w","_marktext","_marker","_randomz","_wpposasl"];

	_grp = _this select 0;
	_patrol_mark = _this select 1;
	_radarray = _this select 2;
	_markunitsarray = [_this, 3, [], [[]],[2]] call BIS_fnc_param;
		_markwps = [_markunitsarray, 0, false,[true]] call BIS_fnc_param;
		_mcolor = [_markunitsarray, 1, "ColorRed", [""]] call BIS_fnc_param;
	_waypoint_params = [_this, 4, [], [[]],[1,2,3]] call BIS_fnc_param;
		_behave = [_waypoint_params, 0, "AWARE", [""]] call BIS_fnc_param;
		_speed = [_waypoint_params, 1, "NORMAL", [""]] call BIS_fnc_param;
		_form = [_waypoint_params, 2, "STAG COLUMN", [""]] call BIS_fnc_param;
	_wateronly = [_this, 5, false,[true]] call BIS_fnc_param;
	_underwater = [_this, 6, false,[true]] call BIS_fnc_param;
	
	for "_w" from 0 to (3) do {
	
		_wppos = [_patrol_mark,_radarray,_wateronly] call fnc_ghst_rand_position;
		
		if (_wateronly and _underwater) then {
			_wpposasl = ATLtoASL _wppos;
			_randomz = random (_wpposasl select 2);
			_wppos = [_wpposasl select 0, _wpposasl select 1, _randomz];
		};
			
		_grp addwaypoint [_wppos, 10];
		[_grp, _w] setWPPos _wppos;
			if (_w == 3) then {
				[_grp, _w] setWaypointType "CYCLE";
			} else {
				[_grp, _w] setWaypointType "SAD";
			};
		[_grp, _w] setWaypointSpeed _speed;
		[_grp, _w] setWaypointBehaviour _behave;
		[_grp, _w] setWaypointFormation _form;
		[_grp, _w] setWaypointTimeout [10, 30, 60];
		[_grp, _w] setWaypointCompletionRadius 25;
		//sleep 0.1;

		//create markers for waypoints
		if (_markwps) then {
			_marktext = format ["%1 Waypoint %2",_grp, _w];
			_marker = [_wppos,_mcolor,_marktext] call fnc_ghst_mark_point;
		};
	};
	
};

//[grp,(getpos something), first wppos, [300,300],[true,"ColorRed"],["SAFE", "NORMAL", "WEDGE"]] call fnc_ghst_waypoints_unload;
fnc_ghst_waypoints_unload = {

	private ["_grp","_wppos","_patrol_mark","_radarray","_markunitsarray","_markwps","_mcolor","_waypoint_params","_behave","_speed","_form","_wppos","_w","_marktext","_marker"];

	_grp = _this select 0;
	_patrol_mark = _this select 1;
	_wppos = _this select 2;
	_radarray = _this select 3;
	_markunitsarray = [_this, 4, [], [[]],[2]] call BIS_fnc_param;
		_markwps = [_markunitsarray, 0, false,[true]] call BIS_fnc_param;
		_mcolor = [_markunitsarray, 1, "ColorRed", [""]] call BIS_fnc_param;
	_waypoint_params = [_this, 5, [], [[]],[1,2,3]] call BIS_fnc_param;
		_behave = [_waypoint_params, 0, "COMBAT", [""]] call BIS_fnc_param;
		_speed = [_waypoint_params, 1, "NORMAL", [""]] call BIS_fnc_param;
		_form = [_waypoint_params, 2, "STAG COLUMN", [""]] call BIS_fnc_param;

	for "_w" from 1 to (5) do {
	
		if (_w != 1) then {
		_wppos = [_patrol_mark,_radarray] call fnc_ghst_rand_position;
		};

		_grp addwaypoint [_wppos, 10];
		[_grp, _w] setWPPos _wppos;
			if (_w == 1) then {
				[_grp, _w] setWaypointType "UNLOAD";
				[_grp, _w] setWaypointBehaviour "SAFE";
				//[_grp, _w] setWaypointStatements ["true","unassignVehicle (driver vehicle this);"];
			};
			if !((_w == 1) or (_w == 5)) then {
				[_grp, _w] setWaypointType "SAD";
				[_grp, _w] setWaypointBehaviour _behave;
				[_grp, _w] setWaypointSpeed _speed;
				[_grp, _w] setWaypointFormation _form;
				[_grp, _w] setWaypointTimeout [10, 30, 60];
				[_grp, _w] setWaypointCompletionRadius 25;
			};
			if (_w == 5) then {
				[_grp, _w] setWaypointType "CYCLE";
			};
		//sleep 0.1;
		
		//create markers for waypoints
		if (_markwps) then {
			_marktext = format ["%1 Waypoint: %2 Type: %3",_grp, _w, waypointType [_grp,_w]];
			_marker = [_wppos,_mcolor,_marktext] call fnc_ghst_mark_point;
		};
	};
	
};

//Create one waypoint
//[grp,wppos, rad, "MOVE", "CARELESS", "NORMAL", "WEDGE"] call fnc_ghst_createwaypoint;
fnc_ghst_createwaypoint = {

	private ["_grp","_wppos","_rad","_type","_behave","_speed","_form","_wppos","_wp"];
	_grp = _this select 0;
	_wppos = _this select 1;
	_rad = param [2, 10, [0]];
	_type = param [3, "MOVE", [""]];
	_behave = param [4, "CARELESS", [""]];
	_speed = param [5, "NORMAL", [""]];
	_form = param [6, "WEDGE", [""]];
		
	_wp =_grp addwaypoint [_wppos, _rad];
	_wp setWPPos _wppos;
	_wp setWaypointType _type;
	_wp setWaypointBehaviour _behave;
	_wp setWaypointSpeed _speed;
	_wp setWaypointFormation _form;
	//_wp setWaypointCompletionRadius _rad;
	
	_wp
	
};

//create markerpoint with text
//[(getpos something),"ColorRed","marker text","mil_objective",[1,1],"Ellipse","Border"] call fnc_ghst_mark_point;
//output - marker
fnc_ghst_mark_point = {
	private ["_markwps","_mcolor","_mtext","_mtype","_msize","_mshape","_mbrush","_markname","_marker"];

	_markwps = _this select 0;
	_mcolor = _this select 1;
	_mtext = [_this, 2, "", [""]] call BIS_fnc_param;
	_mtype = [_this, 3, "mil_DOT", [""]] call BIS_fnc_param;
	_msize = [_this, 4, [1,1], [[]],[2]] call BIS_fnc_param;
	_mshape = [_this, 5, "ICON", [""]] call BIS_fnc_param;
	_mbrush = [_this, 6, "Border", [""]] call BIS_fnc_param;

	_markname = "ghst_mark" + str (_markwps) + str (random 99999);
	_marker = createMarker [_markname, _markwps]; 
	_marker setMarkerShape _mshape;
	if !(_mshape == "ICON") then {_marker setMarkerBrush _mbrush;};
	_marker setmarkertype _mtype;
	_marker setmarkersize _msize;
	_marker setmarkercolor _mcolor;
	_marker setmarkertext _mtext;
	
	_marker
	
};

//create markerlocal with text
//[(getpos something),"ColorRed","markname","marker text","mil_objective",[1,1],"Ellipse","Border"] call fnc_ghst_mark_local;
//output - marker
fnc_ghst_mark_local = {
	private ["_markwps","_mcolor","_mtext","_mtype","_msize","_mshape","_mbrush","_markname","_marker"];

	_markwps = _this select 0;
	_mcolor = [_this, 1, "ColorBlack", [""]] call BIS_fnc_param;
	_markname = _this select 2;
	_mtext = [_this, 3, "", [""]] call BIS_fnc_param;
	_mtype = [_this, 4, "mil_DOT", [""]] call BIS_fnc_param;
	_msize = [_this, 5, [1,1], [[]],[2]] call BIS_fnc_param;
	_mshape = [_this, 6, "ICON", [""]] call BIS_fnc_param;
	_mbrush = [_this, 7, "Border", [""]] call BIS_fnc_param;
	
	_marker = createMarkerlocal [_markname, _markwps]; 
	_marker setMarkerShapelocal _mshape;
	if !(_mshape == "ICON") then {_marker setMarkerBrushlocal _mbrush;};
	_marker setmarkertypelocal _mtype;
	_marker setmarkersizelocal _msize;
	_marker setmarkercolorlocal _mcolor;
	_marker setmarkertextlocal _mtext;
	
	_marker
	
};

//create unit with AI setting
//[_spawnpos,_egrp,_mansel,_aiSkill] call fnc_ghst_create_unit;
//output - unit
fnc_ghst_create_unit = {

	private ["_spawnpos","_egrp","_mansel","_aiSkill","_man"];

	_spawnpos = _this select 0;
	_egrp = _this select 1;
	_mansel = _this select 2;
	_aiSkill = [_this, 3, 0.5, [0]] call BIS_fnc_param;
	
	_man = _egrp createUnit [_mansel,_spawnpos, [], 0, "NONE"];
	
	[_man,_aiSkill] call fnc_ghst_aiskill;
	
	_man
	
};

//set AI skill
//[_mansel,_aiSkill] call fnc_ghst_aiskill;
fnc_ghst_aiskill = {

	private ["_aiSkill","_man"];

	_man = _this select 0;
	_aiSkill = _this select 1;
	
	_man setskill ["general",(_aiSkill + ((floor(random 4)) / 10))];//(0.4 + ((round(random 4)) / 10))
	_man setSkill ["aimingAccuracy",_aiSkill];
	_man setSkill ["aimingSpeed",_aiSkill];
	_man setSkill ["aimingShake",_aiSkill];
	_man setSkill ["reloadSpeed",_aiSkill];
	_man setSkill ["spotDistance",(_aiSkill + ((floor(random 4)) / 10))];
	_man setSkill ["spotTime",_aiSkill];
	_man setSkill ["courage",(_aiSkill + ((floor(random 4)) / 10))];
	_man setSkill ["commanding",(_aiSkill + ((floor(random 4)) / 10))];
	
};

//Add score and rating to unit
//[playableunits,5000(rating),100(score) remoteExec ["fnc_ghst_addscore"];
//[playableunits,5000,100] remoteExec ["fnc_ghst_addscore"];
fnc_ghst_addscore = {
	private ["_units","_rating","_score","_x"];
	_units = _this select 0;
	_rating = _this select 1;
	_score = _this select 2;
	{
		_x addrating _rating;
		_x addScore _score;
	} foreach _units;
};

//Save player gear
fnc_ghst_savegear = {
	private ["_unit","_dam","_veh"];
	_unit = _this select 0;
	_dam = _this select 2;
	
	if (! alive _unit || {_dam == 0}) exitWith {
		_dam
	};/*
	_veh = vehicle player;
	if ((_dam >= 0.8) or (damage _veh) > 0.8) then {
		if !(_veh == player) then {
			unassignvehicle player;
			player action ["Eject", _veh];
		};
	};*/
	if (_dam >= 0.8) then {
		//[player, [missionNamespace, "GHST_Current_Gear"]] call bis_fnc_saveInventory;
		player setVariable ["GHST_Current_Gear",getUnitLoadout player];
		//call fnc_ghst_setrespawninventory;

	};
	BIS_hitArray = _this; BIS_wasHit = true;
	_dam
};

//Load player gear
fnc_ghst_loadgear = {
	/*
	private ["_ppack"];
	_ppack = unitBackpack player;
	if !(isnil "_ppack") then {
		removeBackpackGlobal player;
	};*/
	//[player, [missionNamespace, "GHST_Current_Gear"]] call bis_fnc_loadInventory;
	player setUnitLoadout (player getVariable ["GHST_Current_Gear",[]]);
	if (player hasweapon "laserdesignator") then {
		player addmagazine "laserbatteries";
	};
};
/*
fnc_ghst_setrespawninventory = {
	//#include "\a3\functions_f_mp_mark\Revive\defines.hpp"
	private ["_arsenalNames","_arsenalDataLocal","_arsenalData","_name","_nul","_i"];
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
};
*/
//Stamina
fnc_ghst_stamina = {	
	private ["_unit"];
	_unit = _this select 0;
	
	_unit enableStamina false;
};

//Aim Sway Mod
fnc_ghst_aimsway = {	
	private ["_unit","_coef"];
	_unit = _this select 0;
	_coef = ("PARAM_AimSway" call BIS_fnc_getParamValue) / 10;
	
	_unit setCustomAimCoef _coef;
	_unit setUnitRecoilCoefficient 0.2 + _coef;
};

//headlessclient
fnc_ghst_headlessclient = {
	HCPresent = if ( isNil  "HC")  then {False} else {true};
	if (((_this select 0) == 1) and HCPresent) then {
		// Run on the HC only
		if !(isServer or hasInterface) then {
			execVM "init_HC.sqf";
		};
	} else {
		// Run on the server only
		if isServer then {
			execVM "init_HC.sqf";
		};
	};
};
/*
//removes random spawn from list
fnc_ghst_remrandomspawn = {
	private ["_display","_ctrl"];
    disableSerialization;
	waitUntil { !isNull ( uiNamespace getVariable [ "RscDisplayRespawn_display", displayNull ] ) };
	_display = uiNamespace getVariable "RscDisplayRespawn_display";
	_ctrl = _display displayCtrl BIS_fnc_respawnMenuPosition_ctrlList;
	if ( ( _ctrl lbText 0 ) isEqualTo "<Random>" ) then {
		_ctrl lbDelete 0;
	};
};
*/
//Timer
//3000 call fnc_ghst_timer;
fnc_ghst_timer = {
	private ["_playtime","_h","_m","_s","_hh","_mm","_ss","_playtimeHMS"];
	_timer = _this / 3600;
	_h = (_timer-(_timer % 1));
	_m = ((_timer % 1)*60)-((_timer % 1)*60) % 1;
	_s = (((_timer % 1)*3600)-((_timer % 1)*3600) % 1) - (_m*60);
	_hh = "";
	if (_h < 10) then {_hh = "0"};
	_mm = "";
	if (_m < 10) then {_mm = "0"};
	_ss = "";
	if (_s < 10) then {_ss = "0"};
	_timerHMS = format ["%1%2h:%3%4m:%5%6s",_hh,_h,_mm,_m,_ss,_s];
	_timerHMS
};
