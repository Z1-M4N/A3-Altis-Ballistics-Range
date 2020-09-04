_position = _this select 0;
_strTypeToClean = _this select 1;
_radius = _this select 2;

_listObj = _position nearObjects [_strTypeToClean, _radius];
{deleteVehicle _x} foreach _listObj;