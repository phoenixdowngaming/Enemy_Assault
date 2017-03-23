class GHST
{
	tag = "GHST";
	class functions
	{
		file = "functions";
		class functions {description = "core functions, called on mission start."; preInit = 1;};
	};
	class objectives
	{
		file = "functions\objectives";
		class acquirelocations {description = "get locations on map for objectives and tasks";};
		class randomobj {description = "select random location for main objective area";};
		class rescue {description = "rescue task";};
		class intel {description = "intel task";};
		class randomwreck {description = "random sea wreck task";};
		class randombuild {description = "random building task";};
		class sideobj {description = "random side location objective area";};
		class randomobjectives {description = "selection of random tasks and loop for checking when all tasks are complete";};
		class randomloc {description = "random destroy object placement task";};
		class randomcrash {description = "random crash task";};
		class objinbuild {description = "random object in building to be destroyed task";};
		class assassinate {description = "kill someone task";};
		class hostjoin {description = "part of rescue task so pow will join players group";};
		class itemfound {description = "part of intel task for item found";};
		class clear {description = "clear area task";};
		class putinbuild {description = "for putting all objects specified in buildings and placing random markers";};
		class randomacquire {description = "random object you have to bring back to base";};
		class dataterminal {description = "data terminal task";};
		class disableterminal {description = "complete terminal task";};
		class convoy {description = "destroy convoy";};
	};
	class spawn
	{
		file = "functions\spawn";
		class unitlist {description = "list of available enemy units"; preInit = 1;};
		class randespawn {description = "random enemy infantry patrol spawn near random players";};
		class eparadrop {description = "enemy para drop";};
		class ecounter {description = "enemy counter attack";};
		class eair {description = "random enemy air patrol";};
		class mines {description = "random mines";};
		class roofmgs2 {description = "random static weapons in buildings alternate version";};
		class ediverspawn {description = "random enemy diver spawn";};
		class espawn {description = "random enemy infantry patrol spawn at location";};
		class evehsentryspawn {description = "random enemy vehicle spawn near roads if available";};
		class civcars {description = "random civilian cars - vbieds";};
		class ieds {description = "random ieds";};
		class fillbuild {description = "fill random buildings at location with units";};
		class basedef {description = "static base defence vehicles";};
		class eboatspawn {description = "random enemy boat spawn";};
		class evehspawn {description = "random vehicle patrol spawn";};
		class animals {description = "random animal spawn";};
		class basearty {description = "static base arty vehicles";};
	};
	class client
	{
		file = "functions\client";
		class halo {description = "player halo";};
		class tracker {description = "tracking player spawned vehicles locally";};
		class ptracker {description = "tracking mission vehicles";};
		class remotedesignator {description = "deploys remote designator";};
		class ammodrop {description = "player ammo crate call in";};
		class airsupport {description = "player air support call in";};
		class ugvsupport {description = "player ugv call in";};
		class uavsupport {description = "player uav call in";};
		class respawntent {description = "player deploy respawn tent";};
		class puavsupport {description = "player AR-2 Darter call in";};
		class reload {description = "repair, rearm, refuel";};
		class playeraddactions {description = "adds various player actions on call";};
		class magazines {description = "compiles all magazines and loads them into cargo";};
		class boatpush {description = "ability to push a boat";};
		class obstruction_clear {description = "clears obstructions in front of specified vehicle";};
		class vehicle_actioninit {description = "adds various actions to specified vehicles";};
		class clear_respawn_tents {description = "clear respawn tents";};
	};
	class demo
	{
		file = "functions\demo";
		class attachdemo {description = "attach demo";};
		class detdemo {description = "detonate demo";};
		class pickupdemo {description = "pickup demo";};
		class timerdemo {description = "demo timer";};
		class demoplacement {description = "demo placement";};
	};
	class moveunits
	{
		file = "functions\moveunits";
		class drag {description = "adds drag option";};
		class release {description = "adds release drag option";};
		class loadvehicle {description = "adds load unit into vehicle option";};
	};
	class transport
	{
		file = "functions\transport";
		class init_transport {description = "init transport option";};
		class dest_transport {description = "transport destination";};
		class rtb_transport {description = "transport rtb";};
		class init_airlift {description = "init airlift option";};
	};
	class dlg
	{
		file = "functions\dlg";
		class cargodrop {description = "cargo drop call in";};
		class spawnboat {description = "spawn boat dialog";};
		class spawnair {description = "spawn aircraft dialog";};
		class spawnveh {description = "spawn vehicle dialog";};
	};
	class server
	{
		file = "functions\server";
		class randweather {description = "random weather to be spawned on server";};
	};
};