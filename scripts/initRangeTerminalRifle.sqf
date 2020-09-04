_terminal = _this select 0;

// Clean range
_terminal addaction [
"Reset Markers (All)",
{
	// Delete for players
	[{_allPlayers = call BIS_fnc_listPlayers;
	{ { deleteVehicle _x; } foreach (player getvariable ["hitMarkers",[]]) } foreach _allPlayers;}] remoteExec ["bis_fnc_call", 0];
	// Delete leftovers
	_objList = getPos (_this select 1) nearObjects ["Chemlight_green", 1600];
	{deleteVehicle _x} foreach _objList;
},
0,
0,
true,
true,
"",
"_this distance _target < 3"
];

// Skip an hour
_terminal addaction [
"Skip 1 hour",
{
	[{
		if (isServer) then 
		{ 
			skipTime 1;
		};
	}] remoteExec ["bis_fnc_call", 0];
},
0,
0,
false,
true,
"",
"_this distance _target < 3"
];

// Enable pop-up
_terminal addaction [
"Enable target pop-up",
{
	_targetRangeRifleArr = [
	tgt_lane_1_1,tgt_lane_1_2,tgt_lane_1_3,tgt_lane_1_4,
	tgt_lane_2_1,tgt_lane_2_2,tgt_lane_2_3,tgt_lane_2_4,
	tgt_lane_3_1,tgt_lane_3_2,tgt_lane_3_3,tgt_lane_3_4,
	tgt_lane_4_1,tgt_lane_4_2,tgt_lane_4_3,tgt_lane_4_4,
	tgt_lane_5_1,tgt_lane_5_2,tgt_lane_5_3,tgt_lane_5_4,
	tgt_lane_6_1,tgt_lane_6_2,tgt_lane_6_3,tgt_lane_6_4,
	tgt_lane_7_1,tgt_lane_7_2,tgt_lane_7_3,tgt_lane_7_4,
	tgt_lane_8_1,tgt_lane_8_2,tgt_lane_8_3,tgt_lane_8_4
	];
	{
	  [_x, true] remoteExec ["enableSimulationGlobal", 0];
	} forEach _targetRangeRifleArr;
	
	["Target pop-up enabled"] remoteExec ["hint", 0];
},
0,
0,
false,
true,
"",
"_this distance _target < 3"
];

// Disable pop-up
_terminal addaction [
"Disable target pop-up",
{
	_targetRangeRifleArr = [
	tgt_lane_1_1,tgt_lane_1_2,tgt_lane_1_3,tgt_lane_1_4,
	tgt_lane_2_1,tgt_lane_2_2,tgt_lane_2_3,tgt_lane_2_4,
	tgt_lane_3_1,tgt_lane_3_2,tgt_lane_3_3,tgt_lane_3_4,
	tgt_lane_4_1,tgt_lane_4_2,tgt_lane_4_3,tgt_lane_4_4,
	tgt_lane_5_1,tgt_lane_5_2,tgt_lane_5_3,tgt_lane_5_4,
	tgt_lane_6_1,tgt_lane_6_2,tgt_lane_6_3,tgt_lane_6_4,
	tgt_lane_7_1,tgt_lane_7_2,tgt_lane_7_3,tgt_lane_7_4,
	tgt_lane_8_1,tgt_lane_8_2,tgt_lane_8_3,tgt_lane_8_4
	];
	{
	  [_x, false] remoteExec ["enableSimulationGlobal", 0];
	} forEach _targetRangeRifleArr;
	
	["Target pop-up disabled"] remoteExec ["hint", 0];
},
0,
0,
false,
true,
"",
"_this distance _target < 3"
];
