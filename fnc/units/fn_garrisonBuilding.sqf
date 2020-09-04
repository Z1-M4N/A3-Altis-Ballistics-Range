params["_building"];

if (true) then {
	_kill_house_config = missionNamespace getVariable ["kill_house_config_unit_selected","boko"];
	_kill_house_unit_count = missionNamespace getVariable ["kill_house_config_count_selected", 30];

	_kill_house_config = [_kill_house_config, kill_house_config_units] call TFR_fnc_getConfig;
	_faction_class = _kill_house_config select 1;
	_unit_list = _kill_house_config select 2;

	private _building_Pos = _building buildingPos -1;

	private _grp = switch (getNumber (configFile >> "CfgFactionClasses" >> _faction_class >> "side")) do { 
		case 0: { createGroup [EAST, TRUE] };
		case 1: { createGroup [WEST, TRUE] };
		default { createGroup [INDEPENDENT, TRUE] };
	};

	for "_i" from 1 to _kill_house_unit_count do {
		if (count _building_Pos == 0) exitWith {};
		private _rndPos = selectRandom _building_Pos;
		_building_Pos = _building_Pos - [_rndPos];
		_unit = [_grp, (selectRandom _unit_list), _rndPos, _building] call TFR_fnc_garrisonUnit;
		_unit setVariable ["KillHouse",_building,true];

		// Add Event Handler that will trigger when enemy count is 0.
		_unit addEventHandler ["killed", {
			params ["_unit","_killer"];
			_assigned_killhouse = _unit getVariable ["KillHouse",kh_1];
			_spawned_units = _assigned_killhouse getVariable ["SpawnedUnits",[]];

			if( (({alive _x} count _spawned_units) == 0) && _assigned_killhouse getVariable ["RangeLive",false] ) then {			
				_assigned_killhouse setVariable ["TimeCleared", time, true];
				_assigned_killhouse setVariable ["RangeLive", false, true];

				[_assigned_killhouse, _killer] remoteExec ["TFR_fnc_lodgeTime", 2, false];
				
				["Misc", "Firing_Drills", [["ROF", 3], true], "SIDE"] spawn BIS_fnc_kbTell; // Voice line
			};
		}];
	};

	_spawned_units = units _grp;
	_building setVariable ["SpawnedUnits",_spawned_units,true];
	_building setVariable ["RangeLive",true,true];
};