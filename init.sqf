waitUntil {!isNull player};
[] execVM "briefing.sqf";	// Loads the briefing for players.

_action = ["RemoveBodyBag", "Burn the body", "", {deleteVehicle _target}, {true}] call ace_interact_menu_fnc_createAction; 
["ACE_bodyBagObject", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

/* Old implementation
this addAction  
["Configure and spawn enemies",  
{ 
	private _moduleGroup = createGroup sideLogic; 
	"ZEI_GarrisonBuilding" createUnit [ 
	getPosATL kh_1, 
	_moduleGroup, 
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation',       false, true];" 
	];
}, 
[], 
1, 
true, 
true, 
"", 
"_this distance _target < 5"];
*/

kill_house_config_units = [
	["boko",[
		"Boko Haram",
		"CFP_O_BOKOHARAM",
		[
			"CFP_O_BH_Team_Leader_01",
			"CFP_O_BH_Sniper_SVD_01",
			"CFP_O_BH_Sniper_Enfield_01",
			"CFP_O_BH_Rifleman_AT_AK47_01",
			"CFP_O_BH_Rifleman_AK74_01",
			"CFP_O_BH_Rifleman_AK47_01",
			"CFP_O_BH_Medic_AK47_01",
			"CFP_O_BH_Machine_Gunner_PKM_01",
			"CFP_O_BH_Explosive_Specialist_01"
		]
	]],
	["wagner",[
		"Wagner PMC",
		"CFP_O_WAGNER_WDL",
		[
			"CFP_O_WAGNER_Field_Technician_WDL_01",
			"CFP_O_WAGNER_Field_Medic_WDL_01",
			"CFP_O_WAGNER_Team_Coordinator_WDL_01",
			"CFP_O_WAGNER_Marksman_WDL_01",
			"CFP_O_WAGNER_Field_Specialist_RPG_18_WDL_01",
			"CFP_O_WAGNER_Field_Specialist_RPK_WDL_01",
			"CFP_O_WAGNER_Security_Contractor_AK74_GL_WDL_01",
			"CFP_O_WAGNER_Security_Contractor_AKMN_WDL_01"
		]
	]]
];

kill_house_config_unit_count = [5,10,15,20,25,30,40,50,60];

// kill_house_config_unit_selected = 'boko';
// kill_house_config_count_selected = 30;

kill_house_config_unit_selected = missionNameSpace getVariable ["kill_house_config_unit_selected", 'boko'];
kill_house_config_count_selected = missionNameSpace getVariable ["kill_house_config_count_selected", 30];


_action = ["KHConfig","Kill House Config","",{},{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
[kh_controller, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["KHConfig_units","Change Faction","",{},{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
[kh_controller, 0, ["ACE_MainActions","KHConfig"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["KHConfig_count","Spawn Number","",{},{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
[kh_controller, 0, ["ACE_MainActions","KHConfig"], _action] call ace_interact_menu_fnc_addActionToObject;


{	
	_keyName = format["KH_Config_unit_%1",(_x select 0)];
	_keyName_text = format["%1",(_x select 1) select 0];
	_param_unit = (_x select 0);
	_action = [_keyName,_keyName_text,"",{
		params ["_target", "_player", "_params"];
		missionNamespace setVariable ["kill_house_config_unit_selected", (_params select 0), true];
		hint format["Faction type set to %1", _params select 0];
	},{true},{},[_param_unit], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
	[kh_controller, 0, ["ACE_MainActions","KHConfig","KHConfig_units"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach kill_house_config_units;


{
	_keyName = format["KH_Config_count_%1",_x];
	_keyName_text = format["%1",_x];
	_param_number = _x;
	_action = [_keyName,_keyName_text,"",{
		params ["_target", "_player", "_params"];
		missionNamespace setVariable ["kill_house_config_count_selected", (_params select 0), true];
		hint format["spawn count set to %1", (_params select 0)];
	},{true},{},[_param_number], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
	[kh_controller, 0, ["ACE_MainActions","KHConfig","KHConfig_count"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach kill_house_config_unit_count;


_action = ["BeginKillHouse","Spawn Killhouse","",
{
	if(kh_1 getVariable ["RangeLive", false]) then {		
		hint "Range is not clear!";
	} else {
		_unit_list = kh_1 getVariable ["SpawnedUnits",[]];
		if((count _unit_list) > 0) then {
			{
				deleteVehicle _x;
			}forEach _unit_list;
		};
		[kh_1] call TFR_fnc_garrisonBuilding;
	};
},{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
[kh_controller, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


// Temporary disable until polished.
// _action = ["CheckTimes","View Leaderboard","",
// {
// 	params ["_target", "_player", "_params"];
// 	[_player] spawn TFR_fnc_checkTimes;
// },{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
// [kh_controller, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

 
// Changes will need to be made to the BIS_rangeOfficer at the moment.
/*_action = ["BeginTimer","Ready","",
{
	params ["_target", "_player", "_params"];
	[_target, _player, _params] spawn {
		// SFX
		params ["_target", "_player", "_params"];		
		["Timing", "Firing_Drills", [["ROF", 0], true], "SIDE"] spawn BIS_fnc_kbTell;
		[format["%1 to start in...", name _player]] remoteExec ["systemChat" , remoteExecutedOwner, false];
		sleep 2;	
		["Timing", "Firing_Drills", [["ROF", 18], true], "SIDE"] spawn BIS_fnc_kbTell;
		[format["(%1) 3", name _player]] remoteExec ["systemChat" , remoteExecutedOwner, false]; 
		sleep 1;	
		["Timing", "Firing_Drills", [["ROF", 17], true], "SIDE"] spawn BIS_fnc_kbTell;
		[format["(%1) 2", name _player]] remoteExec ["systemChat" , remoteExecutedOwner, false];
		sleep 1;
		["Timing", "Firing_Drills", [["ROF", 16], true], "SIDE"] spawn BIS_fnc_kbTell;
		[format["(%1) 1", name _player]] remoteExec ["systemChat" , remoteExecutedOwner, false];
		sleep 1;
		["Timing", "Firing_Drills", [["ROF", 4], true], "SIDE"] spawn BIS_fnc_kbTell;
		sleep 0.5;
		[format["%1 Start", name _player]] remoteExec ["systemChat" , remoteExecutedOwner, false];
		playSound "FD_Start_F";

		// systemChat format["timer started at %1", time];
		kh_1 setVariable ["TimeStarted", time, true];

		// Invalidate on unconscious
		_player setVariable["runValid", true, true];
		["ace_unconscious", {
			params["_player","_state"];
			if(_state) then{
				_player setVariable["runValid", false, true];
			};
		}] call CBA_fnc_addEventHandler;
	};
}
,{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;

[BIS_rangeOfficer, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;*/



/*
spawn units
standup
disable path
disable radio protocol
disable suppression
*/


_action = ["halo","Move to jump plane","",{
	params ["_target", "_player", "_params"];
	[_player] spawn TFR_fnc_moveToAircraft;
},{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;

[halo_sign, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// _redeploy = "Land_InfoStand_V1_F" createVehicle [0,0,0];

_action = ["mapRedeploy","Redeploy","",{[false] spawn TFR_fnc_initredeploy;},{true},{},[], [0,0,0], 25] call ace_interact_menu_fnc_createAction;
["B_Quadbike_01_F", 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;