// Loads the players loadout when they respawn. Important to keep otherwise the player may respawn with the default arma loadout.
player setUnitLoadout (player getVariable ["savedLoadout",[]]);