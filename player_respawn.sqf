_unit = _this select 0;

_spawn = [_unit] execVM 'player_spawn.sqf';

_getItems = [_unit] call loadGear;

if(true) exitWith{};