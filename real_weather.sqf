realWeather = {	
	// add handler
	if (local player) then {	
		"wcweather" addPublicVariableEventHandler {
			wcweather = _this select 1;
			60 setRain (wcweather select 0);
			60 setfog (wcweather select 1);
			60 setOvercast (wcweather select 2);
			setwind (wcweather select 3);
			setdate (wcweather select 4);
		};
	};

	// SERVER SIDE SCRIPT
	if (!isServer) exitWith{};

	private [
		"_lastrain",		
		"_rain",
		"_fog",
		"_overcast",
		"_wind"
	];

	// accelerate time 
	[] spawn {
		while {true} do {
			skiptime 0.01;
			sleep 10;
		};
	};

	_lastrain = 0;
	_rain = 0;
	_overcast = 0;

	while {true} do {
		_rain = random 1;
		if(_rain < 0.3) then {
			_overcast = (random 0.5);
		} else {
			_overcast = 0.7 + (random 0.3);
		};
		if((date select 3 > 2) and (date select 3 <6)) then {
			_fog = 0.4 + (random 0.6);
		} else {
			if((_lastrain > 0.6) and (_rain < 0.2)) then {
				_fog = random 0.3;
			} else {
				_fog = 0;
			};
		};
		if(random 1 > 0.95) then {
			_wind = [random 7, random 7, true];
		} else {
			_wind = [random 3, random 3, true];
		};
		_lastrain = _rain;

		wcweather = [_rain, _fog, _overcast, _wind, date];
		publicvariable "wcweather";

		60 setRain (wcweather select 0);
		60 setfog (wcweather select 1);
		60 setOvercast (wcweather select 2);
		setwind (wcweather select 3);
		sleep 300;
	};

};