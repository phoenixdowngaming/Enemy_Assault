call ghst_fnc_acquirelocations;
call ghst_fnc_unitlist;
_missiontype = selectRandom [1,2,3];
switch (_missiontype) do {
	case 1: {
			//launch next objective area
			call ghst_fnc_randomobj;
		};
	case 2: {
			//launch convoy
			if ((random 9) > 6) then {[(getmarkerpos "center"),[ghst_mapsize,ghst_mapsize],1000,(Ceil (random 6) + 6)] call ghst_fnc_convoy;} else {call ghst_fnc_randomobj;};
		};
	case 3: {
			//launch side objective area
			if ((count ghst_milarray > 0) and ((random 9) > 6)) then {call ghst_fnc_sideobj;} else {call ghst_fnc_randomobj;};
		};
	default {
			//launch next objective area
			call ghst_fnc_randomobj;
		};
};