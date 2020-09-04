params["_player"];

_player = name _player;

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
_hint_format = "";
if(_found == -1)then{	
	_hint_format = [
		"<t align='center' size='2' color='#CC5500'>TFR Kill House</t>",
		"<t size='1.5'>Run complete! Here is how you did.</t>",
		"<br/>",
		"<t color='#C3B091' align='left' size='1'>Best: </t><t align='left' size='1.25'>No Time Set</t>",
		"<t color='#C3B091' align='left' size='1'>Previous: </t><t align='left' size='1.25'>No Time Set</t>",
		"<br/>",
		"<t size='1.5' color='#E23D28' align='left'>Leaderboard:</t><br/>"
	];
	_hint_format =format[(_hint_format joinString "<br/>")];
} else {
	_my_score = _scores select _found;
	_hint_format = [
		"<t align='center' size='2' color='#CC5500'>TFR Kill House</t>",
		"<t size='1.5'>Here are your times:</t>",
		"<br/>",
		"<t color='#C3B091' align='left' size='1'>Best: </t><t align='left' size='1.25'>%1</t>",
		"<t color='#C3B091' align='left' size='1'>Previous: </t><t align='left' size='1.25'>%2</t>",
		"<br/>",
		"<t size='1.5' color='#E23D28' align='left'>Leaderboard:</t><br/>"
	];
	_scores sort true;
	_record_time = _scores select 0 select 0;

	_hint_format =format[(_hint_format joinString "<br/>"),[_my_score select 0, "MM:SS.MS"] call BIS_fnc_secondsToString,[_my_score select 2, "MM:SS.MS"] call BIS_fnc_secondsToString ];
};


_leaderboard_text = "";
{
	_score_data = _x;	
	_best_time = _score_data select 0;
	_player_name = _score_data select 1;
	_previous_time = _score_data select 2;
	_leaderboard_text = _leaderboard_text + format["<t align='left'>#%1</t> <t align='center'>%2</t> <t align='right'>%3</t><br/>",(_forEachIndex+1),_player_name,[_best_time, "MM:SS.MS"] call BIS_fnc_secondsToString];
}forEach _scores;

_leaderboard_hint = _hint_format+_leaderboard_text;

// hint parseText _leaderboard_hint;