[] execVM "scripts\createCameraPlayer.sqf";

_action = ["TFR_Training","TFR Training","",{},{true},{},[], [0,0,0], 25] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["mapRedeploy","Redeploy","",{[false] spawn TFR_fnc_initredeploy;},{true},{},[], [0,0,0], 25] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","TFR_Training"], _action] call ace_interact_menu_fnc_addActionToObject;
