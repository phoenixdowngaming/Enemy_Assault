README
======

Mission: [ Enemy Assault ]
Version: [ 3-0-2 ]
Developer(s): [ Ghost email: ghost644@gmail.com]
Description: [ Complete the tasks given ]


README CONTENTS
===============

01. VERSION HISTORY
02. COPYRIGHT STATEMENT
03. TERMS OF USE
04. LEGAL DISCLAIMER
05. INSTALLATION
06. REQUIRED ADDONS
07. NOTES


01. VERSION HISTORY
===================

Version | Date | Notes

[ 3-0-2 ] | [ 26 DEC 2016 ] | [
-Removed support for some mods. Only RHS and Fir F16 are support currently
-Adjusted units assigned to certain com menu items
]

[ 3-0-1 ] | [ 26 DEC 2016 ] | [
-Fixed spawning direction of vehicle assets
-Fixed roles not having specific call ins under com menu
-Adjusted enemy sides
]

[ 3-0-0 ] | [ 4 JAN 2016 ] | [
-Removed Raven Lifter support as it is not needed now
-Removed Nimitz Carrier
-Removed Slingload
-Removed VAS
-Removed AGM support
-Removed INS Revive system
-Removed Enemy type param
-Removed FA18X support
-Removed Shk_taskmaster dependency
-Disabled dynamic weather for now
-Revive and respawn is now using the BIS systems
-Added Team leader can deploy a respawn tent
-Added action at HALO board to clear all respawn tents
-Added BIS Group Management
-Added RHS Escalation option in MP Params. Mod has to be on server or option will not be valid
-Added Ghost Hotel as a side objective location.
-Added Zeus
-Added Cargo drop Support for all players. Players can now call in air drop of chosen vehicle. Delay is 30 mins. If C-130 mod is used then that will be the transport
-Added Remote designator call in for JTAC and UAV operators. face the direction you want the designator and call it in.
-Added basic drag of players which are alive
-Added new random task. Acquire container objective where you have to slingload or large truck transport a cargo container back to base
-Added Data terminal task
-Added a Weapon Sway MP Param
-Added Helicopter transport service under com menu.
-Added random dogs
-Added random civilians in cars and houses
-Added artillery call in via 0-8 menu for SL and JTAC 
-Added Convoy task
-Changed fatigue settings to stamina
-Converted spawn dialogs into functions
-Removed Xeno Squad Management
-Adjusted mission to use new helicopters
-Separated Mod jets into different categories: SU35, FA18, and USAF ACFT can be turned on and off individually
-Added action to "clear Obstruction" for the Bobcat support vehicle to clean up airfield as necessary
-Added Huron Containers to aircraft spawn point, Ammo and Cargo containers will have virtual arsenal
-Changed TAW View distance for CH View distance
-Adjusted Halo
-Changed vehicle spawn dialog backgrounds to better show icons
-Adjusted cargo drop
-Adjusted ammo drop
-Fixed paradrops
-Improved ieds. You can now disarm ieds
-Changed C-130 to USAF C130
-Fixed issue with tracking markers not showing blue color or names
-Improved tracking marker system to show vehicle player is driver of and how many passengers
-Added Firewill FA16C to spawn list if enabled in mp params
-Increased number of alive enemys for "Clear" objective to complete on side missions
-Adjusted aircraft spawn point to work better with larger aircraft
-Weather is set at mission start via mp params. Default is random
-Fog is set at mission start via mp params. Default is random
-Adjusted base object placement
-Added Call AC130 upstairs at computer if USAF Mod is used - Thanks Dixon
-Updated Igiload supported types
-Tasks located in buildings now have specific icons over radius marker instead of on town name.
-Improved overall objective spawning performance.
-Adjusted briefing notes with more information and pictures
-Grouped all players together
-Moved view distance setting to com menu 0-8
]

[ 2-9-0 ] | [ 09 SEP 2014 ] | [
-Removed MOD dependencies, all mods are optional and have an mp setting
-Option to use AGM Medical module and set params for it
-Option to Spawn EBU C130
-EBU C130 has a PARA/HALO system by Dixon/Ghost
-Added random side objective which may fire instead of main objective area. May be on land or in water
-Hemtt respawn point removed
-Removed CH49s from ramp
-Moved FA18 to spawn list instead of on map
-Moved Vehicle repair pad to a better area for taxing aircraft
-AAF aircraft can now be spawned at aircraft spawn board
-Put in check to see if vehicle spawn pad is clear and if not no vehicle is spawned
-vehicle spawn pad area will be cleared of empty vehicles when dialog is opened even if vehicles do not belong to player
-POW can now be a scientist or a journalist aswell as an officer or pilot
-TOD param now has any hour available default is still 1200
-Improved Rain and Weather system
-Added Option for Nimitz carrier in SW ocean as optional spawn
-Adjusted layout of MP Params
-Markers for unconscious players needing medical support
-Player now handles the spawn list for vehicles instead of server. Should eliminate some network traffic
-Adjusted place charge and demo charge action priority
-Demo and satchel charges can now be placed under water on objects but is still wip
-Added option for Konyo MH47E
-Added scores/ratings to tasks
-Added action menu icons and colors and adjusted sizes for various actions
-Improved HALO to have ventral backpack
-Added interior lights to Terminal area
-Added teleport action to move between base port and base terminal
-Moved tracked ammo boxes to open field
-Added various ramp lights to key areas
-Added various lights for key areas
-Option to use Raven's Lifter module for slingload and fast roping
-Removed Raven's Lifter Module from mission
-Player can now use Nimitz catapult for FA18s if both mods are selected
-Map center is now found without a marker placed in editor
-Converted most scripts to functions to improve performance
-Can now specify a random enemy type which will choose one of the enemy types each mission location
-Can now specify how many vehicles each player can spawn at a time
-Tasks in buildings that are destroyed during mission should now complete or fail as applicable when building collapses
-Added push boat action for any boat spawned
-Added Virtual Arsenal to all crates and at base. AmmoCrate drop uses arsenal as well
-Updated setloadout to use forceadduniform command
-Removed atvs at base and port since they are no longer needed
-New version of rooftopmgs function that should dynamically detect positions no matter what map is used
-Slingload error for "picturething" should not be an issue anymore
-Replaced Xeno reload with my own reload script
]

[ 2-8-0 ] | [ 22 JUN 2014 ] | [
-Fixed rain selection of %30,%60,%90 not working properly
-Fixed global marker creation for player spawned vehicles, was supposed to be local to player
-Adjusted cleanup
-Adjusted numerous scripts
-Fixed error with unload waypoint function
-Set AI General Skill to 0.4 instead of random. Should help with headshot AI
-Fixed paradrop crashing shortly after spawning
-Moved some objects at airfield
-Fixed random objectives from being completed/failed
-Improved finding random tower on island task. Search area is smaller and should be located somewhere near objective location. If nothing is found no task is created
-If player has a C4 or Satchel in their inventory then they have an option to place them on objects and detonate via action or shooting
-Updated VAS to Ver 2.6 and increased loadouts to 15
-Ammo boxes now explode when destroyed
-Added credits at mission start
-Added igiload scripts v0.9.10_RC_d
-Removed BASE VAS ammo box
-Removed VAS from Helicopters and HEMTT
-Players have VAS action when near BASE Terminal
-Players not getting "Settings" action when joining should be fixed now
-Added 3 tracked ammo boxes with VAS that can be loaded and transported
-Reduced chance of respawned vehicles colliding with ground
-Added flatbed truck for positioning of ammo crates
-Added FIA vehicles to the list of available spawn vehicles
-Moved player start position
-Removed Peral A-10C option
-Disabled my slingload script
-Added Raven's Lifter module for slingload and fast roping
-Adjusted some default param values
-Players will now respawn in cargo of spawn vehicle if it is more than 5m off the ground and has room
-Now when cleanup script is ran all craters within 2000 of base get removed. Should keep the runways cleaner
-Cleanup script also removes random gear around airfield
]

[ 2-7-0 ] | [ 20 MAR 2014 ] | [
-Updated for Patch 1.14
-Added and replaced Buzzard as require with proper faction aircraft
-Fixed issue with pow and officer being placed on roof tops
-Fixed issues with enemy paradrop
-Made enemy reinforcement numbers and type more random
-Cleanup now happens every minute ~
-Adjusted various scripts
-Made random time more random
-Added markers for tasks that are not placed in buildings. They have an error of around 100m
-Updated Ammodrop to have a 30min wait before it can be called again
-Markers are now a border only. Should have less clutter feel on map
-Fixed issue with pow and officer being placed on roof tops
-Fixed issues with enemy paradrop
-Enemy paradrop helicopter should not spawn over objective area
-Made enemy reinforcement numbers and type more random
-Cleanup happens when more than 50 objects are dead
-Major changes to various scripts to improve performance and future features
-Made random time more random
-Added markers for tasks that are not placed in buildings. They have an error of around 200m
-Updated Ammodrop to have a 30min wait before it can be called again
-Markers are now a border only. Should have less clutter feel on map
-Injured unit moves to healer instead of healer moving to injured unit when heal action is used
-Added line to prevent Task Force Radio long range backpack being automatically added
-Tasks and units should not spawn on Piers anymore. This should eliminate problems with pier collisions
-Enemy commanders without weapons are given a weapon now
-Enemy commanders should not flee as much
-Ammo crates now have chemlights near them
-Ammo Drop FAK are now useable
-Crashsite removed from tasks
-Adjusted fog levels for reduced fog more often
-Added random enemy patrols near random player from time to time that are deleted once all players are specified distance away
-Added random Mines and IEDs
-Increased civ vehicle numbers and distance
-Decreased main mission loop delay for quicker response to situations
-Removed some friendly units at airfield
-Added Spawn Boat Board marked on map at docks. You can now spawn any NATO boat up to 2. This number is shared for both gorund and iar vehicles
-Removed all NATO boats from mission as they are not needed now
-Added Spawn Aircraft Board marked on map. You can now spawn any NATO aircraft up to 2. This number is shared for both ground and air vehicles
-Removed most aircraft from ramp as they are not needed now
-Added general and aimingshake AISKILL parameter to all units in addition to aimingAccuracy and aimingSpeed
-Changed Grass Setting to Rain setting in mp params. You can choose to have rain or not
-Removed some enemy equipment from VAS
]

[ 2-6-0 ] | [ 22 FEB 2014 ] | [ 
-Improved placement of objects in buildings to help avoid placing them under rubble on pre-destroyed buildings
-Fixed addaction not showing for vehicle spawn
-Made AH-99 support variable local, eliminates net traffic
-Made UAV support variable local, eliminates net traffic
-Removed RPT reports for weather
-Adjusted some scripts
]

[ 2-5-0 ] | [ 21 FEB 2014 ] | [ 
-Adjusted Enemy Para. Paras should not collide with chopper as much. Chopper spawns just outside of Paradrop location for quicker response
-Adjusted various scripts
-Updated VAS to 2.4
-Improved Clean Up script. Should now remove static weapons, camo nets, and empty enemy vehicles within 1000ms of completed town
-Made removal of surrender animation of POW global.
-Adjusted random weather to be more dynamic
-Added option to use Peral A-10C
-If using mod jets like FA-18 or A-10C then JS SU-35 will be the enemy aircraft
-Added Medical HEMTT near JETs
-Added another base defense vehicle in field near ramp area
-Respawn at vehicle will now place you near it instead of in it - do not respawn when helicopter is flying or you will be placed on ground under it
-Moved ammo box to a more convenient location
-Removed paint schemes from Independant vehicles at base
-Fixed Dialog errors
]

[ 2-4-0 ] | [ 11 NOV 2013 ] | [ 
-Added a 15 sec respawn delay to options
-Updated shk_taskmaster
-Improved perfomance of some scripts
-Fixed error with spawn vehicle dialog
-Player should now be ejected from chute when less than 1m and be standing at end of HALO as long as player comes in at a proper speed
-Updated for Patch 1.08. Fixed issues that came up and added new Independent vehicles
-Made reinforcements more random to limit how often they spawn
]

[ 2-3-0 ] | [ 11 NOV 2013 ] | [ 
-Separated Support options so SL will only be able to call ammo crate, UAV Operator can only call in UAV or UGV, and JTAC can only call in AH-99 support
-Adjusted various scripts
-Disabled ability to carry unconscious players due to issues with carry animations
-Target vehicles will now be locked
-CH-49 and A-143 are now colored a dark green/blue instead of independent paint scheme
-Adjusted Hostage script, should now work for new updated
]

[ 2-2-0 ] | [ 09 NOV 2013 ] | [ 
-Changed enemy Air numbers from 3 to 2
-Adjusted number of units initially spawning at objective area
-Vehicle respawn should not cause helicopters to randomly explode - improved respawn script
-Added option to Disabled unit fatigue - off by default
-Removed markers for vehicle parking locations
-Buzzards only spawn on ramp if F/A 18 use is disabled
-UGV should now parachute where selected on map
-Disabled underwater obj for now - too many issues with underwater combat
-Disabled random patrol boats for now - rarely encounter and not worth cpu usage
-Adjusted AH-99 call in to leave area when fuel is less than a 1/4 or out of ammo or 30 minutes on station
-Adjusted briefing notes
-Various script tweaks
-Increased house task markers from 50x50 to 75x75 for more error of location
-Updated VAS to V2.1A
-Changed UAV to ATGM variant
-Changed Ammo Drop to be only Magazines - contents now available to all players
-Decreased Kavala and Aggelochori objective area size from 1000m to 500m
-Changed MP Param so you can choose to fight in Kavala only, Random number of locations, Half of all locations, or all locations
-Objects placed in buildings should not get destroyed as much. Objects were colliding occasionally and getting killed
-Added random wind strength and direction
-Added rating adjustment so player doesnt go negative for blowing civilian stuff up.
-POW will now be removed after completion of task so there will be no chance of failing after success
-Task Marker for POW should now delete when POW task is complete
-Random cars now spawn 800m around objective area instead of 1500
]

[ 2-1-0 ] | [ 03 NOV 2013 ] | [ 
-Adjusted Halo Automatic Chute Deployment height
-Adjust MP Params Slightly
-Improved Slingload - Now must fly between 10-16 and speed under 40kph
-Updated mission notes
-fixed Respawn Loadout. Now you should revive/respawn with what you died with
-Changed airfield patrol vehicle to a Hunter HMG
-Fixed issue where Independant were killing each other
-Put marker for rescued POWs. This point is where you command the POWs to go to for completion
-Adjusted autochute deployment height for HALO to 100
-Updated Task titles and descriptions to include the town name for those in the town. Also added a 50m red marker for objs in buildings. This has a 50m error. Marker should delete when task is complete - does not deletemarker for POW tasks
-Moved starting position to inside the main airport building. Ammo crate is also inside the building. Respawn at base is outside to avoid issues
-Added static medical HEMTT at base for healing
-Reorganized groups so pilots are there own group and crewman are grouped two groups of two units
-Added random air patrols, for now they will be independant fighters
-Added WIP vehicle spawning dialog which can be accessed at the Vehicle Spawn Board. Max of 2 vehicles per player
-Removed most vehicles from parking lot
-UH80 can only carry light cars, static weapons and boats now. Heavy Car types have to be carried by CH49. No armor can be lifted
-Added VAS to UH80 and CH49 and HEMTT
-Removed CH49 from spawn point
-Added Ammo Drop option for Squad Leader - currently only local to play who called it in
-Changed vehicle markers to grey
-Cleared base ammo box of items
-Adjusted when encounter forces spawn and what they do
-Tweaked cleanup script - should work  a lot better
-Added more unit types for assassination task
-Adjusted enemy unit spawn list
-Adjusted Weather. Should take effect sooner and should be clear more often
-Changed Huron back to Ghosthawk to fix respawn at dead body issue
]

[ 2-0-0 ] | [ 25 OCT 2013 ] | [ Updated slingload to use PIP (still WIP). Added HALO option at Altis Map in base. Updated mission notes]

[ 1-9-0 ] | [ 04 OCT 2013 ] | [ Updated INS Revive System to 3.0, updated mission for A3 V1.02 full release. Adjusted what type of vehicles can be slung under helicopters. Added various equipment for use. Added UAV and UGV call in. Random Static weapons will now spawn in certain buildings occasionally. Added random overall skill to every spawned infantry unit. Aim and speed is still defined by mp params. Included two Pilot positions for Planes. Mission is now a CO36. Option to enable JS FA18 Mod. Two variants and 3 aircraft total will spawn at soft hangers in SW of airfield. Made it so UGV and UAV will automatically connect to player when called in. You need to have the uav terminal first though. Removed UAV Settings button from player settings. ]



02. COPYRIGHT STATEMENT
=======================

This mission is (c)[ 2014 ] [ Ghost email: ghost644@gmail.com]. All rights reserved.



03. TERMS OF USE
================

This mission (hereafter 'Software') contains files to be used in the PC STEAM simulator ArmA 3. To use the Software you must agree to the following conditions of use:

1. [ Ghost email: ghost644@gmail.com] (hereafter 'The Author(s)') grant to you a personal, non-exclusive license to use the Software.

2. The commercial exploitation of the Software without written permission from The Author(s) is expressly prohibited.



04. LEGAL DISCLAIMER
====================

The Software is distributed without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose. The Software is not an official addon or tool. Use of the Software (in whole or in part) is entirely at your own risk.



05. INSTALLATION
================

To begin using the Software:

1. Move the folder [ enemy_assault_co36_v#.Island.pbo ] into the following (default) directory:

\Steam\steamapps\common\Arma 3\MPMissions



06. REQUIRED ADDONS
===================

To play this mission the following addons are required:

N/A

Note: these mods are optional-

Firewill FA16C, RHS Escalation


07. NOTES
=========

Special Thanks to all the people of Ghostland for all there dedication in testing my missions and Kylania for his scripting support

[ Requires ArmA 3 V1.66 and up. ]
