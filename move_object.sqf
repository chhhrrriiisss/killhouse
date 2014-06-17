_unit = _this select 0;

activeUnit = _unit;
publicVariable "activeUnit";

_player = _this select 1;
_id = _this select 2;
_rotation = _this select 3 select 0;
_height = _this select 3 select 0;

_unit removeAction _id;
_player addAction['<t color="#E54028">Release Object</t>',"release_object.sqf",[_unit], -1, true, true, "player == _target"];


_dir = getDir _unit;
_playerDir = getDir _player;
_newDir = _dir - _playerDir;

_d = _player distance _unit;
_h = (getPos _player) select 2;
_unit attachTo[_player, [0,_d,_h]];
_unit setDir _newDir;