_terminal = _this select 0;

// Clean range
_terminal addaction [
"Clean area",
{
	[[getPos (_this select 1),"GroundWeaponHolder",100], "scripts\cleanTypeAroundTarget.sqf"] remoteExec ['BIS_fnc_execVM', 0, true];
	[[getPos (_this select 1),"WeaponHolderSimulated",100], "scripts\cleanTypeAroundTarget.sqf"] remoteExec ['BIS_fnc_execVM', 0, true];
},
0,
0,
true,
true,
"",
"_this distance _target < 3"
];
