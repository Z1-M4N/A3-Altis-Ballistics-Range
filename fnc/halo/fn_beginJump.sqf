
_whitelight = jump_plane getVariable "whiteLight";
_redlight = jump_plane getVariable "greenLight";
_greenlight = jump_plane getVariable "redLight";

_jumpers = jump_plane getVariable ["jumpers",[]];


sleep 30;
_whitelight attachTo [_plane, [0, 8, 100] ];
_redlight attachTo [_plane, [0, 3, 0] ];
_plane animate ["ramp_bottom", 1]; 
_plane animate ["ramp_top", 1];
sleep 10; hint 'Green Light';
_whitelight attachTo [_plane, [0, 8, 100] ];
_redlight attachTo [_plane, [0, -6, 100] ];
_greenlight attachTo [_plane, [0, -15, 4] ];


jump_plane animate ["ramp_bottom", 0];
jump_plane animate ["ramp_top", 0];