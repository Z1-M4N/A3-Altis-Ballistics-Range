params["_key","_config"];

_found_config = [];
{
	if( toLower(_x select 0) == toLower(_key) ) exitWith {
		_found_config = (_x select 1);
	};
} forEach _config;

_found_config