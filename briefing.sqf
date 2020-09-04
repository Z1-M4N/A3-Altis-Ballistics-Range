player createDiaryRecord 
["Diary",
	["ADMIN/LOG",
		"
			<br/>Respawn:
			<br/>Players will respawn at base, as normal.

			<br/><img image='img\briefing\briefing_admin_quad.paa' width='400' height='200'/>
			<br/>Getting Around:
			<br/>Players can use the quadbikes located around the area to teleport quickly from one facility to another.

			<br/><img image='img\briefing\briefing_admin_heal.paa' width='400' height='200'/>
			<br/>Healing and Medical:
			<br/>Players can use medical buildings and the healing station in the medical facility to receive a full heal.			
		"
	]
];

player createDiaryRecord 
["Diary",
	["FACILITIES",
		// Placeholder images need to be replaced with:
		// 'briefing_loc_medical.paa'
		// 'briefing_loc_vehicle_designator.paa'
		"
			Facilities and Features:<br/>
			<img image='img\briefing\briefing_range_rifle.paa' width='400' height='200'/>			
			Rifle Range:<br/>
			Contains targets up to a distance of 1600m away, graduated in 100m increments.<br/>
			Moving targets on range are calibrated to running (rifle down) and sprinting (with rifle)<br/> speeds, and are ranged at 300m and 600m.<br/>
			<br/>

			<img image='img\briefing\briefing_range_at.paa' width='400' height='200'/>
			AT Range:<br/>
			Contains respawning vehicle targets up to a distance of 500m away, graduated in 100m increments.<br/>
			Crates containing disposable launchers are also located in each firing station for quickly replacing launchers.<br/>
			<br/>
			TODO: Aerial target spawning and handling.<br/>

			<img image='img\briefing\briefing_range_mortar.paa' width='400' height='200'/>
			Mortar Range:<br/>
			1 mortar each from CUP, RHS, and Vanilla are located in this weapon station; Currently using targets on the AT range.<br/>
			<br/>

			<img image='img\briefing\briefing_range_grenade.paa' width='400' height='200'/>
			Grenade Range:<br/>
			Grenade targets located at approximately 20, 40 meters, and further. Further targets should be used for V-40 Mini grenade training.
			<br/>

			<img image='img\briefing\briefing_loc_medical_training.paa' width='400' height='200'/>
			<br/>
			Medical Centre:<br/>
			The Paramedic located in this station offers casualty spawning for medical training and practice.<br/>
			Injuries on the spawned casualty range from moderate to severe.<br/>
			Dead bodies can be put into bodybags and removed via the 'Burn Bodies' custom ACE interaction.<br/>
			<br/>

			<img image='img\briefing\briefing_loc_vehicle.paa' width='400' height='200'/>
			Vehicle Depot:<br/>
			Contains a variety of commonly-used air and ground assets in operations.<br/>
			<br/>
			A remote laser designator turret is located on the AT range which can be <br/>
			interfaced via UAV terminal to provide a laser deignation for pilots without the requirment for JTAC.<br/>
			<br/>
			TODO: Convoy targets spawning and handling. Planning to re-use functionality from ALTIS_POPULATED<br/>
		"
	]
];