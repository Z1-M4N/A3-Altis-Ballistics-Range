_forced = param [0, false];

_myDisp = [] call TFR_fnc_openRedeployMap;
if(_forced)then{
	_myDisp displayAddEventHandler ["Unload", {
		if(player getVariable ["ACO_respawning", false]) then {
	    	[true] spawn TFR_fnc_initRedeploy;
	    };
	}];
};