//UNIT POOL
_unitPool = ["rhsusf_army_ucp_squadleader", "rhsusf_army_ucp_teamleader", "rhsusf_army_ucp_rifleman", "rhsusf_army_ucp_autorifleman", "rhsusf_army_ucp_grenadier", "rhsusf_army_ucp_teamleader", "rhsusf_army_ucp_autorifleman", "rhsusf_army_ucp_grenadier", "rhsusf_army_ucp_riflemanat"];

//GET THE POSITION OF THE SPAWN POINT OF CASUALTY
_cursorPos = _this select 0;

//DAMAGE AMOUNT, LOCATION, DAMAGE TYPE AND UNIT DIRECTION POOLS
_damageAmount = [0.9];
_damageLocation = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
_damageType = ["grenade","stab","bullet","falling"];
_randomDir = [0, 45, 90, 135, 180, 225, 270, 315];

//SPAWN AND INJURE THE AI
_newGroup = createGroup west;
_casualty_01 = _newGroup createUnit [selectRandom _unitPool, _cursorPos, [], 0, "FORM"];

_casualty_01 setDir selectRandom _randomDir;

[_casualty_01, true, 60, true] call ace_medical_fnc_setUnconscious;

[_casualty_01, selectRandom _damageAmount, selectRandom _damageLocation, selectRandom _damageType] call ace_medical_fnc_addDamageToUnit;
[_casualty_01, selectRandom _damageAmount, selectRandom _damageLocation, selectRandom _damageType] call ace_medical_fnc_addDamageToUnit;
[_casualty_01, selectRandom _damageAmount, selectRandom _damageLocation, selectRandom _damageType] call ace_medical_fnc_addDamageToUnit;
[_casualty_01, selectRandom _damageAmount, selectRandom _damageLocation, selectRandom _damageType] call ace_medical_fnc_addDamageToUnit;

_casualty_01 allowDamage false;

_casualty_01 addAction 
[ 
 "Clear casualty", 
 { 
    (_this select 0) doMove(getMarkerPos("marker_ai_clean"));
    sleep 10;
    deleteVehicle (_this select 0);
 }, 
 nil, 
 1.5, 
 false,   
 false,   
 "",    
 "true",   
 5,   
 false,  
 "",
 ""
];