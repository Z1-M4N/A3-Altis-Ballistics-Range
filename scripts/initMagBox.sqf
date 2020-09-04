_ammoBox = _this select 0;

_ammoBox addAction 
["Get extra mags for current weapon", 
{
	_currentMag = currentMagazine (_this select 1);
	if (!(_currentMag isEqualTo "")) then {
	  (_this select 1) addMagazines [_currentMag,2]
	} else {
	  hint "Unavailable for empty launchers.";
	};
},
[],
1,
true,
true,
"",
"_this distance _target < 5"];