_target = _this select 0;

_markerName = format ["track%1",random 99999];
_marker = createMarker[_markerName, [0,0,0]];
_markerName setMarkerType "hd_objective";
_markerName setMarkerColor "ColorRed";
_markerName setMarkerText " TARGET";
_markerName setMarkerSize [1,1];

while {!isNull _target || alive _target} do
{
  _markerName setMarkerDir (getDir _target);
  _markerName setMarkerPos (getPos _target);
  sleep 5;
};

deleteMarker _marker;