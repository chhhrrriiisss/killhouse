_unit = _this select 0;

_unit setVariable["isSpawning", false, true];
_unit setVariable["hasSpawned", false, true];

[_unit] execVM 'player_jump.sqf';

trapSpawn = {

	_unit = _this select 0;
	_side = side _unit;
	
	_anchor = getMarkerPos "respawn_west";

	if (_side == west) then {
		_anchor = getMarkerPos "respawn_west";
	};

	if (_side == east) then {
		_anchor = getMarkerPos "respawn_east";
	};

	// limit in metres
	_limit = 20; 

	while {!(_unit getVariable "hasSpawned")} do
	{	

		_isSpawning = _unit getVariable "isSpawning";
		_current = getposATL _unit;
		_dist = _current distance _anchor;

		if (_dist > _limit) then {

				if (!(_isSpawning)) then {
						_unit setPos _anchor;
						hint "Do not leave the spawn area!";
				};
		};		

	  Sleep .5;

	};

};


_side = side _unit;

if (_side == west || _side == east) exitWith {
	[_unit] spawn trapSpawn;
};

if (_side == civilian) then {
	[_unit] execVM 'setup_admin.sqf';
};
	
if(true) exitWith{};