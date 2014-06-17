_flag = (_this select 3) select 0;
_base = (_this select 3) select 1;
_enemyFlag = (_this select 3) select 2; 
_enemyBase = (_this select 3) select 3; 
_player = _this select 1;
_id = _this select 2;

detach _flag;
_pos = getPos _flag;
_flag setPos [_pos select 0, _pos select 1, 0];

player removeAction _id;

_flag addAction["Pickup Flag", "modes\pickup_flag.sqf", [_flag, _base, _enemyFlag, _enemyBase], -1, true, true, "player distance _this < 2"];

player setVariable["hasFlag",[], true];

_f1 = false;
_f2 = false;
_e1 = false;
_e2 = false;
_margin = 6;


addPoint = {
	_flag = _this select 0;

	if (_flag == BLUFOR) then {
		[[1, 0], "SERVER_fnc_mpScore", true, false] spawn BIS_fnc_MP; // blufor, opfor
	};

	if (_flag == OPFOR) then {
		[[0, 1], "SERVER_fnc_mpScore", true, false] spawn BIS_fnc_MP;
	};
};
// its a friendly flag in a friendly base
if ( _enemyFlag distance _base < _margin && _flag distance _base < _margin) then {	
		_f1 = true;
		[_flag] call addPoint;
		OPFOR setPos (getPos OPFOR_BASE);
		BLUFOR setPos (getPos BLUFOR_BASE);
};

// its a enemy flag in an enemy base
if ( _enemyFlag distance _enemyBase < _margin && _flag distance _enemyBase < _margin) then {	
		_e1 = true;
		[_enemyFlag] call addPoint;			
		OPFOR setPos (getPos OPFOR_BASE);
		BLUFOR setPos (getPos BLUFOR_BASE);
};

if (_f1) then {

	_str = format['scored a point for %1!', _flag];
	[[player, _str], "MSG_fnc_mpGlobalChat"] spawn BIS_fnc_MP;

};

if (_e1) then {
	_str = format['scored a point for %1!', _flag];
	[[player, _str], "MSG_fnc_mpGlobalChat"] spawn BIS_fnc_MP;
};

if (!_f1 && !_e1) then {
	_str = format['dropped the %1 flag!', _flag];
	[[player, _str], "MSG_fnc_mpGlobalChat"] spawn BIS_fnc_MP;
};

