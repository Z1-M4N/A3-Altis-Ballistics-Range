_this select 0 addaction ["Redeploy",										{[false] spawn TFR_fnc_initredeploy,		nil,1.5,false,false,"","",3,false,"",""}];

_this select 0 addaction ["Teleport to Rifle Range",						{(_this select 1) setpos (markerpos "marker_range_rifle"),		nil,1.5,false,false,"","",3,false,"",""}];
_this select 0 addaction ["Teleport to AT Range",							{(_this select 1) setpos (markerpos "marker_range_at"),			nil,1.5,false,false,"","",3,false,"",""}];
_this select 0 addaction ["Teleport to Killhouse (Construction Site)",		{(_this select 1) setpos (markerpos "marker_loc_kh_complex"),	nil,1.5,false,false,"","",3,false,"",""}];