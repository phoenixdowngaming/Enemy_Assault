call ghst_fnc_acquirelocations;
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