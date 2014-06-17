clearMap = {

	if (count wallArray <= 0) exitWith {};

	{
		deleteVehicle _x;

	} ForEach wallArray;

	wallArray = [];
	publicVariable "wallArray";


	if (count borderArray <= 0) exitWith {};

	{
		deleteVehicle _x;

	} ForEach borderArray;

	borderArray = [];
	publicVariable "borderArray";



	if (count markerArray <= 0) exitWith {};

	{
		deleteMarker _x;

	} ForEach borderArray;

	markerArray = [];
	publicVariable "markerArray";

	_str = 'Map cleared.';
	[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;

};
