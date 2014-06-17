_unit = _this select 0;

randomPos = {

	_buffer = _this select 0;

	_bufferX = hDist * _buffer;
	_nhDist = hDist - (_bufferX * 2);

	_rndX = ceil (random (_nhDist));

	_bufferY = vDist * _buffer;
	_nvDist = vDist - (_bufferY * 2);

	_rndY = ceil (random (_nvDist));

	_rndPos = [(startPos select 0) + -(_bufferX + _rndX), (startPos select 1) + -(_bufferY + _rndY), 0];

	_rndPos

};

_unit setVariable["shotAt", [false, ''], true];

isFiredAt = {
	Sleep 10;
	_unit = _this select 0;
	_unit setVariable["shotAt", [false, ''], true];
};

_unit addEventHandler['firedNear', {

	_unit = _this select 0;
	_shooter = _this select 1;
	_unit setVariable["shotAt", [true, _shooter], true];
	[_unit] spawn isFiredAt;
}];


while {!isNull _unit || alive _unit} do
{	

	_rnd = random (100);

		if (_rnd > 75) then {

		_targetPlayers = JGN nearEntities [["Man"], 100];	
		_nearPlayers = JGN nearEntities [["Man"], 40];		
		//_nearThreats = JGN nearObjects [["Man"], 40];	

		_noNear = true;
		_noTarget = true;

		if (count _nearPlayers > 0) then {

			_target = [];
			_dist = 40;
			{
				if (isPlayer _x) exitWith {
					_dist = (_x distance JGN);
					_target = _x;
					_noNear = false;
				};

			} ForEach _nearPlayers;

			if (!_noNear && _dist < 10) then {

				JGN doTarget _target;

				//_str = format["Panic engaging %1", (name _target)];
				//[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;	

				JGN doFire _target;
			} else {

				_rnd = random 100;

				if (!_noNear && _rnd < 75) then {

					JGN doTarget _target;

					//_str = format["Engaging %1", (name _target)];
					//[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;	

					JGN doFire _target;
				};

			};

		};

		if (count _targetPlayers > 0) then {

			_target = [];
			{
				if (isPlayer _x) exitWith {
					_target = _x;
					_noTarget = false;
				};

			} ForEach _targetPlayers;

			_rndSwitch = (random 100);
			_inc = _unit getVariable "shotAt";
			_firedNear = _inc select 0;

			if (_rndSwitch > 50 && _firedNear) then {
				_noNear = true;
			};

			if (!_noTarget && _noNear) then {
				_pos = getposATL(_target);

				JGN doMove _pos;

				//_str = format["Moving to %1 at %2", (name _target), _pos];
				//[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;	
			};
		};

		if (_noNear && _noTarget) then {	
			_buffer = .1;
			_pos = [_buffer] call randomPos;

			JGN doMove _pos;

			//_str = format["Moving to %1", _pos];
			//[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;	
		};

	};

	_sleep = 1;

	Sleep _sleep;

};

