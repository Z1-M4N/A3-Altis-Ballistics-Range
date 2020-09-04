params["_building","_player"];

_validRun = _player getVariable["runValid", false];

if(_validRun) then {
	_start_time = _building getVariable ["TimeStarted", 0];
	_end_time = _building getVariable ["TimeCleared", 99999];

	_new_record = false;
	_new_pb = false;
	_player = name _player;

	_total_time = (_end_time - _start_time);
	// systemChat format ["start time: %1, clear time: %2, time to clear: %3", _start_time, _end_time, _total_time];
	[(_end_time - _start_time), "MM:SS.MS"] call BIS_fnc_secondsToString;

	[format["%1 posted a clean run time of %2", _player, [_total_time, "MM:SS.MS"] call BIS_fnc_secondsToString]] remoteExec ["systemChat" , 0, false];

	// Leaderboard disabled for now.
	_scores = profileNamespace getVariable ["TFR_Killhouse_1_timing_leaderboard",[]];

	//search for scores
	_found = -1;
	{
		_score = _x;
		if((_score select 1) == _player)then{
			_found = _forEachIndex;
		};
	}forEach _scores;

	_my_score=[];
	if(_found == -1)then{
		_my_score = [_total_time, _player, 0];
		_scores pushBack _my_score;
	} else {
		_my_score = _scores select _found;
	};

	_my_score set [2, _total_time];

	_scores sort true;
	_record_time = _scores select 0 select 0;

	if((_my_score select 0) > _total_time) then {
		_new_pb = true;
		_my_score set [0, _total_time];
	};

	if(_record_time > _total_time) then {
		_new_record = true;
	};

	if(_new_record) then {
		["Positive", "Firing_Drills", [["ROF", 6], true], "SIDE"] spawn BIS_fnc_kbTell;
	} else {
		if (_new_pb) then {
			["Positive", "Firing_Drills", [["ROF", 5], true], "SIDE"] spawn BIS_fnc_kbTell;
		};
	};

	// Zero divisor error here, double check.
	_scores set [_found, _my_score];
	profileNamespace setVariable ["TFR_Killhouse_1_timing_leaderboard",_scores];
	saveProfileNamespace;
	
	_hint_format = [
		"<t align='center' size='2' color='#CC5500'>TFR Kill House</t>",
		"<t size='1.5'>Run complete! Here is how you did.</t>",
		"<br/>",
		"<t color='#C3B091' align='left' size='1.25'>Final: </t><t align='left' size='1.25'>%1</t>",
		"<t color='#C3B091' align='left' size='1'>Best: </t><t align='left' size='1.25'>%2</t>",
		"<t color='#C3B091' align='left' size='1'>Previous: </t><t align='left' size='1.25'>%3</t>",
		"<br/>",
		"<t size='1.5' color='#E23D28' align='left'>Leaderboard:</t><br/>"
	];

	_hint_format =format[(_hint_format joinString "<br/>"),[_total_time, "MM:SS.MS"] call BIS_fnc_secondsToString,[_my_score select 0, "MM:SS.MS"] call BIS_fnc_secondsToString,[_my_score select 2, "MM:SS.MS"] call BIS_fnc_secondsToString ];

	_leaderboard_text = "";
	{
		_score_data = _x;	
		_best_time = _score_data select 0;
		_player_name = _score_data select 1;
		_previous_time = _score_data select 2;
		_leaderboard_text = _leaderboard_text + format["<t align='left'>#%1</t> <t align='center'>%2</t> <t align='right'>%3</t><br/>",(_forEachIndex+1),_player_name,[_best_time, "MM:SS.MS"] call BIS_fnc_secondsToString];
	}forEach _scores;

	_leaderboard_hint = _hint_format + _leaderboard_text;

	// hint parseText _leaderboard_hint;
} else {
  [format["%1 posted a time of %2 with deaths.", _player, [_total_time, "MM:SS.MS"] call BIS_fnc_secondsToString]] remoteExec ["systemChat" , 0, false];
};