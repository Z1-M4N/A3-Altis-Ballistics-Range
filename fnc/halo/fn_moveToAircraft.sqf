params["_player"];

_player forceWalk false;
_player attachTo [jump_anchor,[0,-5,4995.5]];
detach _player; 

_player addEventHandler ["AnimChanged", {
	params["_player","_anim"];
	
	if(_anim in ["halofreefall_non","halofreefall_f","halofreefall_b","halofreefall_r","halofreefall_l"]) then {
		_dir = direction jump_plane;
		_speed = 125;
		_player setVelocity [(sin _dir*_speed),(cos _dir*_speed),0];
		
		_player removeAllEventHandlers "AnimChanged";
	};
}];
/*
_backpack = backpack player;

player addBackpack "B_Parachute";
player forceWalk false;

player attachTo [jumpTgt,[0,0,4995.5]];
detach player;

_jumpers = jump_plane getVariable ["jumpers",[]];
_jumpers pushBack _player;

player setDir (getDir player -180); 
player switchMove "";
*/
	
/*theLight = ("Chemlight_green" createVehicle (position player)); theLight attachTo [pad_1, [0,0,4997]]*/