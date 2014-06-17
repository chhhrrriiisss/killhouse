_unit = _this select 0;

_unit removeAllEventHandlers "handleDamage";
 	
_array = _unit getVariable "markers";

{
	deleteMarker _x;

} ForEach _array;

_array = [];
_unit setVariable["markers", _array, true];

if(true) exitWith{};