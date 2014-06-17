_flag = (_this select 3) select 0;
_base = (_this select 3) select 1;
_enemyFlag = (_this select 3) select 2;
_enemyBase = (_this select 3) select 3;
_unit = _this select 0;
_id = _this select 2;

_unit removeAction _id;

if ((side player == WEST && _flag == BLUFOR) || (side player == EAST && _flag == OPFOR)) then {
	_str = format['picked up the %1 flag!', _flag];
	[[player, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;
} else {
	_str = format['stole the %1 flag!', _flag];
	[[player, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;
};

_unit attachTo[player, [0,.3,-1.3]];

_str = Format['Drop %1 flag',_flag];
_menuID = player addAction[_str, 'modes\drop_flag.sqf', [_flag, _base, _enemyFlag, _enemyBase], -1, true, true, ""];

_items = [true, _menuID, [_flag, _base, _enemyFlag, _enemyBase]];
player setVariable['hasFlag', _items , true];

player addEventHandler['killed', {

	_hasFlag = player getVariable "hasFlag";

	if (_hasFlag select 0) then {


		_flag = (_hasFlag select 2) select 0;
		_base = (_hasFlag select 2) select 1;
		_enemyFlag = (_hasFlag select 2) select 2;
		_enemyBase = (_hasFlag select 2) select 3;
		_id = _hasFlag select 1;
		_run = [[],player,_menuID, [_flag, _base, _enemyFlag, _enemyBase]] execVM 'modes\drop_flag.sqf';

	};

	player removeAllEventHandlers "killed";
}];

// if(typeName _sp == "STRING") then
// {
// 	if(_sp == "") exitWith {closeDialog 0};
// 	VVS_SP = _sp;
// }
// 	else
// {
// 	if(typeName _sp == "ARRAY") then
// 	{
// 		if(count _sp == 0) exitWith {closeDialog 0;};
// 		VVS_SP = _sp select 0;
// 		VVS_Cfg = _sp select 1;
// 	};
// };
// disableSerialization;
// if(!(createDialog "VVS_Menu")) exitWith {}; //Couldn't create the menu