_target = _this select 0;

_markerName = format ["track%1",random 99999];
_marker = createMarker[_markerName, [0,0,0]];
_markerName setMarkerType "hd_flag";
_markerName setMarkerColor "ColorBLUFOR";

if (_target == BLUFOR) then {
	_markerName setMarkerColor "ColorBLUFOR";
};

if (_target == OPFOR) then {
	_markerName setMarkerColor "ColorOPFOR";
};

while {!isNull _target} do
{
  _markerName setMarkerDir 0;
  _markerName setMarkerPos (getPos _target);
  sleep 2.5;
};

deleteMarker _marker;