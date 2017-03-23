_name = toArray name player;
_name resize 5;
_strname = toString _name;
if ( _strname == "{PDG}") then {
	
	if (isnil "_locselpos") exitwith {[[1,1,0],1] spawn fnc_ghst_full_cleanup;};
	hint format ["Mission Cleanup Initialized by %1.", name player];
}
else{
	hint format ["Sorry, %1. You are not a member of PDG and cannot skip missions.", name player];
}