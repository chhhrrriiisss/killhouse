trackPlayer = {

	_unit = _this select 0;

	_mark = false;
	_oldPos = getPos player;

	_marker = "";
	_markerArray = [];

	createMark = {
		_markerArray = _this select 0;
		_markerName = format ["player%1",random 99999];
		_marker = createMarker[_markerName, [0,0,0]];
		_markerName setMarkerShape "ICON";


		if (side player == WEST) then {
			_markerName setMarkerType "hd_dot";
			_markerName setMarkerColor "ColorBLUFOR";
		};

		if (side player == EAST) then {
			_markerName setMarkerType "hd_dot";
			_markerName setMarkerColor "ColorOPFOR";
		};

		if (side player == RESISTANCE) then {
			_markerName setMarkerType "hd_dot";
			_markerName setMarkerColor "ColorGreen";
		};

		// _str = format['%1', name player];
		// _markerName setMarkerText _str;
	  	_markerName setMarkerPos (getposATL player);
	  	_markerName setMarkerSize [1,1];

	  	_markerArray set[count _markerArray, _markerName];
	  	player setVariable["markers", _markerArray, true];
	};

	renderMarkers = {
		_markerArray = _this select 0;
		_length = count _markerArray;
		if (_length < 1) then { _length = 1};
		_step = 1 / _length;
		_opacity = 0;
		_tempArray = [];

		{
			_opacity = _opacity + _step;
			_x setMarkerAlpha _opacity;

			_tempArray set[count _tempArray, _x];

		} ForEach _markerArray;

		player setVariable["markers", _tempArray, true];

	};
	// };

	tryMarker = {

		_pos = _this select 0;
		_unit = _this select 1;
		_array = _this select 2;

		_moved = false;

		_limit = 10;

		for [{_i=_limit},{_i>=0},{_i=_i-1}] do {	

			Sleep 1;

			_newPos = getposATL _unit;		
			if (_newPos distance _pos > 4) exitWith {
				_moved = true;
			};
		};

		if (!_moved) then {
			_create = [_array] spawn createMark;
			//hint 'Camping detected.';
		};

	};

	while {alive _unit && !isNull _unit} do
	{	

		_pos = getposATL _unit;

		if (_pos distance _oldPos < 3) then {

			_m = [_pos, _unit, _markerArray] call tryMarker;

		};

		_oldPos = _pos;

		_r = [_markerArray] call renderMarkers;

		Sleep .5;
	};
};