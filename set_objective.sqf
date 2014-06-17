_unit = _this select 0;
_health = _this select 1;
_name = _this select 2;

_unit setVariable["name", _name, true];
_unit setVariable["health", _health, true];

_unit addEventHandler['handleDamage', { 


	_unit = _this select 0;

	_h = _unit getVariable "health";

	_d = _this select 2;
	_d = _d/5;

	_newH = _h - _d;

	if (_newH < 0) then {

		// _bomb = "Bo_GBU12_lgb" createVehicle(getPos _unit);
		_unit setDamage 1;
		_name = _unit getVariable "name";
		// OBJECTIVE globalChat Format['%1 has been destroyed!', _name];
	};

	_unit setVariable["health", _newH, true];

	// hint Format['health: %1, damage:%2, newhealth: %3', _h, _d, _newH];

	Sleep 3;

	false
}]

