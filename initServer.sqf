// Auto clean of range hit markers
onPlayerDisconnected {
	// Delete lights in radius around the target in the middle of range
	_objList = getPos (tgt_lane_8_1) nearObjects ["Chemlight_green", 8500];
	{if (simulationEnabled _x) then {
		deleteVehicle _x
	};} foreach _objList;
};

// Jump Target and HALO Setup.
_whitelight =  createVehicle ["Land_Camping_Light_F", getMarkerPos "dz", [], 0, "NONE"]; 
_redlight = createVehicle ["Land_TentLamp_01_suspended_red_F", getMarkerPos "dz", [], 0, "NONE"];
_greenlight = createVehicle ["Reflector_Cone_01_wide_green_F", getMarkerPos "dz", [], 0, "NONE"];

_redlight attachTo [jump_plane, [0, 10, 100] ];
_greenlight attachTo [jump_plane, [0, 10, 100] ];  
_whitelight attachTo [jump_plane, [0, 10, 4] ];

jump_plane setVariable ["whiteLight", _whitelight, true];
jump_plane setVariable ["greenLight", _greenlight, true];
jump_plane setVariable ["redLight", _redlight, true];


jump_noise attachTo [jump_plane,[0,0,3]];
jump_plane attachTo [jump_anchor,[0,0,5000]];

jump_plane animate ["ramp_bottom", 1];
jump_plane animate ["ramp_top", 1];

_whitelight = jump_plane getVariable "whiteLight";
_redlight = jump_plane getVariable "greenLight";
_greenlight = jump_plane getVariable "redLight";