_unit = _this select 1;
_id = _this select 2;
_limit = 5;
_i = 0;
_tryCount = 0;

cancelSpawn = {

	hint 'Spawn cancelled.';
	player setVariable['isSpawning', false, true];

	if (true) exitWith {};

};

player setVariable['cancelSpawn', false];

_cancelAction = player addAction ['<t color="#E54028">Cancel Spawn</t>', {

  player setVariable['cancelSpawn', true]; 
  _id = _this select 2;
	player removeAction _id; 

}, "player == target"];

_isSpawning = player getVariable "isSpawning";

if (_isSpawning) exitWith { hint 'You are already queued to spawn.'; };

player setVariable["isSpawning", true, true];

for [{_i=_limit},{_i>=0},{_i=_i-1}] do {
	
	Sleep 1;
	 
	hint format["Wait (%1s) to spawn.", _i];

	_cancel = player getVariable 'cancelSpawn';

	if (!(alive player) || _cancel) exitWith { 
		 [player] call cancelSpawn;
	};	
	
};

if (alive player && !(player getVariable 'cancelSpawn')) then {

	goSpawn = {

			if (player getVariable 'cancelSpawn') exitWith {
				 [player] call cancelSpawn;
			};

			_spawn = _this select 0;

			_unit setVariable ["selections", []];
			_unit setVariable ["gethit", []];
			_unit addEventHandler["HandleDamage",{

			_unit = _this select 0;
			_selections = _unit getVariable ["selections", []];
			_gethit = _unit getVariable ["gethit", []];
			_selection = _this select 1;
			if !(_selection in _selections) then
			{
				_selections set [count _selections, _selection];
				_gethit set [count _gethit, 0];
			};
			_i = _selections find _selection;
			_olddamage = _gethit select _i;
			_damage = _olddamage + ((_this select 2) - _olddamage) * .5;
			_gethit set [_i, _damage];

			_damage;

		}];

		_osd = [_unit] execVM "osd\health_status.sqf";

		_unit setPos _spawn;
	
		[_unit] spawn trapPlayer;
		[_unit] call saveGear;

		hint 'You spawned in.';
		player setVariable["hasSpawned", true, true];
		player removeAction _cancelAction;

	};

	randomPos = {

		_buffer = _this select 0;
		_bufferX = hDist * _buffer;
		_nhDist = hDist - (_bufferX * 2);
		_rndX = ceil (random (_nhDist));
		_bufferY = vDist * _buffer;
		_nvDist = vDist - (_bufferY * 2);
		_rndY = ceil (random (_nvDist));
		_rndPos = [(startPos select 0) -(_bufferX + _rndX), (startPos select 1) -(_bufferY + _rndY), 0];
		_rndPos
	};
	
	testSpawn = {
		_spawn = _this select 0;	
		
		_isPlayers = false;

		checkSurroundings = {

			_spawn = _this select 0;
			_playerRange = 30;
			_objectRange = 3;

			_nearPlayers = [];
			_nearPlayers = _spawn nearEntities [["Man"], _playerRange];

			_avoidList = [
				"Land_Cargo20_brick_red_F",
				"Land_Cargo40_military_green_F",
				"Land_Cargo20_blue_F",
				"Land_RampConcreteHigh_F",
				"Land_RazorWire_F",
				"Land_Airport_Tower_F",
				"Land_ScrapHeap_2_F",
				"Land_ReservoirTank_Airport_F",
				"Land_MilOffices_V1_F",
				"Land_Wreck_Heli_Attack_01_F",
				"Dirthump_1_F",
				"Land_i_House_Big_02_V1_F",
				"Land_spp_Transformer_F"
			];

			_nearObjects = [];
			_nearObjects = nearestObjects [_spawn, _avoidList, _objectRange];

			_isPlayers = false;
			_isObjects = false;
			_isClear = true;

			if (count _nearPlayers > 0) then {
				{	
					_pos = getposATL (_x);			

					if (_spawn distance _pos < _playerRange) exitWith {
						_isPlayers = true;				
					};

				} ForEach _nearPlayers;
			};

			if (count _nearObjects > 0) then {
				{	
					_pos = getposATL (_x);		

					if (_spawn distance _pos < _objectRange) exitWith {
						_isObjects = true;				
					};

				} ForEach _nearObjects;
			};

			if (_isPlayers || _isObjects) then {
				_isClear = false;
			} else {
				_isClear = true;
			};

			_isClear
		};

		if (gameMode == 5) then {

			_isClear = [_spawn] call checkSurroundings;

			if (_spawn distance getPos(JGN) > 20 &&
				_isClear) then {
				[_spawn] call goSpawn;
			} else {
				hint 'Finding a spawn...';

				_tryCount = _tryCount + 1;

				if (_tryCount > 100 || !alive player) then {
					player setVariable["isSpawning", false];
					hint 'Failed to spawn. Try again!';
				} else {
					[] call findSpawn;
				};				
			};
		};


		if (gameMode == 4) then {

			_isClear = [_spawn] call checkSurroundings;

			if (_spawn distance getPos(BOMBA) > 40 &&
				_isClear) then {
				[_spawn] call goSpawn;
			} else {
				hint 'Finding a spawn...';

				_tryCount = _tryCount + 1;

				if (_tryCount > 100 || !alive player) then {
					player setVariable["isSpawning", false];
					hint 'Failed to spawn. Try again!';
				} else {
					[] call findSpawn;
				};				
			};
		};

		if (gameMode == 1) then {

			_isClear = [_spawn] call checkSurroundings;

			if (_spawn distance getPos(BLUFOR_BASE) > 40 &&
				_spawn distance getPos(OPFOR_BASE) > 40 &&
				_isClear) then {
				[_spawn] call goSpawn;
			} else {
				hint 'Finding a spawn...';

				_tryCount = _tryCount + 1;

				if (_tryCount > 100 || !alive player) then {
					player setVariable["isSpawning", false];
					hint 'Failed to spawn. Try again!';
				} else {
					[] call findSpawn;
				};
				
				
			};
		};

	};
	
	findSpawn = {

		_buffer = 0;
		_pos = [_buffer] call randomPos;
		[_pos] call testSpawn;
	};

	[] call findSpawn;

} else {
	[player] call cancelSpawn;
};




