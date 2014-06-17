_flag = _this select 3 select 0;
_base = _this select 3 select 1;
_enemyFlag = _this select 3 select 2;
_enemyBase = _this select 3 select 3;
_unit = _this select 0;
_player = _this select 1;
_id = _this select 2;

_state = false;
_orig = getPos _player;

samePosition = {

	if ((player distance _orig < 2) || !(alive player)) then {
		true
	} else {
		false
	};
};

_limit = 7;


player playMoveNow "AinvPknlMstpSlayWrflDnon_medic"; 
player disableAI "ANIM";

for [{_i=_limit},{_i>0},{_i=_i-1}] do {
		
	 
	hint format["Wait (%1s) to return the flag.", _i];
	_state = [] call samePosition;
	if (!_state || !(alive player)) exitWith { hint 'Return cancelled.'; };

	Sleep 1;
	
};

_state = [] call samePosition;

if (_state && alive player) then {
	_pos = getPos _base;
	_unit setPos _pos;
	_str = format['returned the %1 flag!', _flag];
	[[player, _str], "MSG_fnc_mpGlobalChat"] spawn BIS_fnc_MP;

	hint 'Returned the flag.';

} else {
	hint 'Return cancelled.';
};

	