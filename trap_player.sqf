trapPlayer = {

	_unit = _this select 0;
	_easing = 5;
	_buffer = 0.035;

	_bufferX = hDist * _buffer;
	_bufferY = vDist * _buffer;

	while {alive _unit} do
	{	

		_pos = getposATL _unit;
		_out = false;

		if (cameraView == "GROUP") then {
			_unit setDamage 1;
			_str = 'was killed for trying to cheat.';
			[[_unit, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;
		};

		if ( (_pos select 0) > ((endPos select 0)-_bufferX)  ) then {
			_dif = ( (_pos select 0) - ((endPos select 0)-_bufferX) ) / _easing;
			_pos = [(_pos select 0) - _dif, _pos select 1, _pos select 2];
			_out = true;
		};


		if ( (_pos select 1) > ((endPos select 1)-_bufferY) ) then {
			_dif = ( (_pos select 1) - ((endPos select 1)-_bufferY) ) / _easing;
			_pos = [_pos select 0, (_pos select 1) - _dif, _pos select 2];
			_out = true;
		};


		if ( (_pos select 0) < ((startPos select 0)+_bufferX) ) then {
			_dif = ( ((startPos select 0)+_bufferX)  - (_pos select 0) ) / _easing;
			_pos = [(_pos select 0) + _dif, _pos select 1, _pos select 2];
			_out = true;
		};


		if ( (_pos select 1) < ((startPos select 1)+_bufferY) ) then {
			_dif = ( ((startPos select 1)+_bufferY) - (_pos select 1) ) / _easing;
			_pos = [_pos select 0, (_pos select 1) + _dif, _pos select 2];
			_out = true;
		};

		if (_out) then {
			_unit setPos _pos;	
		};

	  	Sleep .5;
	};

	if(true) exitWith{};
};