/*
	File: fn_cfgInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in returning information about a vehicle from Config >> "CfgVehicles"
	
	Return:
	0: classname
	1: scope
	2: picture
	3: displayname
	4: vehicleclass
	5: side
	6: faction
	7: Base / Superclass
*/
_unit = _this select 3 select 0;
_player = _this select 0;
_id = _this select 2;

detach _unit;

hint 'Object released!';

_player removeAction _id;
_moveObject = _unit addAction["Move Object",VVS_fnc_moveOBJ,[""], -1, true, true, "_vehicle distance player < 3"];



