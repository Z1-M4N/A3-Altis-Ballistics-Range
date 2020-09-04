private ["_preDefDeploy","_mhqArray","_rallyPos"];

_preDefDeploy = [
    [
        [getMarkerPos "redeploy_medical" select 0,  getMarkerPos "redeploy_medical" select 1],
        {
            player setPos getMarkerPos "redeploy_medical";
            player setDir markerDir "redeploy_medical";

            player setVariable ["TFR_respawning",false];
        },
        "Medical Training",
        "Hone your skills as a medic",
        "",
        "img\redeploy\medical.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_at" select 0,  getMarkerPos "redeploy_at" select 1],
        {
            player setPos getMarkerPos "redeploy_at";
            player setDir markerDir "redeploy_at";

            player setVariable ["TFR_respawning",false];
        },
        "Anti Tank & Grenade Range",
        "Make vehicles explode with ease",
        "",
        "img\redeploy\at.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_cqb" select 0,  getMarkerPos "redeploy_cqb" select 1],
        {
            player setPos getMarkerPos "redeploy_cqb";
            player setDir markerDir "redeploy_cqb";

            player setVariable ["TFR_respawning",false];
        },
        "Killhouse",
        "Can you get the best time?",
        "",
        "img\redeploy\cqb.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_killage_arena" select 0,  getMarkerPos "redeploy_killage_arena" select 1],
        {
            player setPos getMarkerPos "redeploy_killage_arena";
            player setDir markerDir "redeploy_killage_arena";

            player setVariable ["TFR_respawning",false];
        },
        "MOUT - Suburb",
        "Military Operations on Urban Terrain. Fire and maneuver between buildings.",
        "",
        "img\redeploy\killage_arena.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_killage_road" select 0,  getMarkerPos "redeploy_killage_road" select 1],
        {
            player setPos getMarkerPos "redeploy_killage_road";
            player setDir markerDir "redeploy_killage_road";

            player setVariable ["TFR_respawning",false];
        },
        "MOUT - Road",
        "Military Operations on Urban Terrain. Handle crossing the road.",
        "",
        "img\redeploy\killage_road.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_mortars" select 0,  getMarkerPos "redeploy_mortars" select 1],
        {
            player setPos getMarkerPos "redeploy_mortars";
            player setDir markerDir "redeploy_mortars";

            player setVariable ["TFR_respawning",false];
        },
        "Mortars & Static Emplacements",
        "Fire Support with a boom",
        "",
        "img\redeploy\mortars.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_rifle_range" select 0,  getMarkerPos "redeploy_rifle_range" select 1],
        {
            player setPos getMarkerPos "redeploy_rifle_range";
            player setDir markerDir "redeploy_rifle_range";

            player setVariable ["TFR_respawning",false];
        },
        "Rifle Range",
        "Range to rest your accuracy from 100m to 1600m",
        "",
        "img\redeploy\rifle.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_short_range" select 0,  getMarkerPos "redeploy_short_range" select 1],
        {
            player setPos getMarkerPos "redeploy_short_range";
            player setDir markerDir "redeploy_short_range";

            player setVariable ["TFR_respawning",false];
        },
        "Close in Range",
        "For targets between 10 and 100 meters",
        "",
        "img\redeploy\short.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_vehicle" select 0,  getMarkerPos "redeploy_vehicle" select 1],
        {
            player setPos getMarkerPos "redeploy_vehicle";
            player setDir markerDir "redeploy_vehicle";

            player setVariable ["TFR_respawning",false];
        },
        "Vehicle Depot",
        "Practice in a whole range of vehicles",
        "",
        "img\redeploy\vehicle.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],
    [
        [getMarkerPos "redeploy_jtac" select 0,  getMarkerPos "redeploy_jtac" select 1],
        {
            player setPos getMarkerPos "redeploy_jtac";
            player setDir markerDir "redeploy_jtac";

            player setVariable ["TFR_respawning",false];
        },
        "JTAC/FO",
        "Call in support on the hostile crosses on the range.",
        "",
        "img\redeploy\jtac.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ],



    [
        [getMarkerPos "redeploy_halo" select 0,  getMarkerPos "redeploy_halo" select 1],
        {
            player setPos getMarkerPos "redeploy_halo";
            player setDir markerDir "redeploy_halo";

            player setVariable ["TFR_respawning",false];
        },
        "Halo Jump Course",
        "Jeronimo",
        "",
        "img\redeploy\halo.jpg",
        1,
        [getMarkerPos "respawn_west"]
    ]
    /*,
    [
        [getMarkerPos "redeploy_marine" select 0, getMarkerPos "redeploy_marine" select 1],
        {
            player setPos getMarkerPos "redeploy_marine";
            player setDir 100;

            player setVariable ["ACO_respawning",false];
        },
        "Marina Perth",
        "Marina resupply with water craft. HALO is NOT available.",
        "",
        "images\marine.jpg",
        1,
        [getMarkerPos "redeploy_marine"]
    ],
    [
        [getMarkerPos "redeploy_base" select 0, getMarkerPos "redeploy_base" select 1],
        {
            player setPos getMarkerPos "redeploy_base";
            player setDir 40;

            player setVariable ["ACO_respawning",false];
        },
        "Airbase Phoenix",
        "Airbase with helicopters, fixed wing aircraft and MEDIVAC facilities. HALO is available.",
        "",
        "images\airbase.jpg",
        1,
        [getMarkerPos "redeploy_base"]
    ]
    */
];


[
    "",
    [getMarkerPos "respawn_west" select 0, getMarkerPos "respawn_west" select 1],
    _preDefDeploy,
    [],
    [],
    [],
    0.8,
    false,
    1,
    true,
    "Task Force Raider Training Facility",
    true,
	"\A3\Ui_f\data\Map\GroupIcons\badge_rotate_%1_gs.paa"
] call TFR_fnc_strategicMapOpen;