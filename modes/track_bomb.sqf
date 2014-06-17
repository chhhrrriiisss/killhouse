_target = _this select 0;

_markerName = format ["bomb%1",random 99999];

_marker = createMarker[_markerName, [0,0,0]];
_markerName setMarkerType "hd_objective";
_markerName setMarkerColor "ColorBlack";
_markerName setMarkerText " OBJECTIVE";

while {!isNull _target} do
{
  _markerName setMarkerDir 0;
  _markerName setMarkerPos (getPos _target);
  sleep 30;
};

deleteMarker _marker;