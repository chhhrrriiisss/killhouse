_unit = _this select 0;

clearWeaponCargo _unit;
clearMagazineCargo _unit;
clearItemCargo _unit;

_unit addEventHandler['handleDamage', { false }];
_unit enableSimulation false;

_track = [_unit] execVM 'modes\track_bomb.sqf';
BOMBA setVariable["armed", false];
BOMBA setVariable["armedBy", ""];

_unit addAction["<t color='#E60000'>Arm Bomb</t>", {

	_armed = BOMBA getVariable "armed";

	if (_armed) exitWith { hint 'Bomb is already armed!'; };

	_player = _this select 1;

	_limit = 7;

	_dif = (ceil (random 4) ) - 2;

	_limit = _limit + _dif;

	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

	_soundToPlay = _soundPath + "audio\arm.ogg";
	playSound3D [_soundToPlay, BOMBA, false, getPos BOMBA, 1, 1, 50];

	_player playMoveNow "AinvPknlMstpSlayWrflDnon_medic"; 
	_player disableAI "ANIM";

	for [{_i=_limit},{_i>=0},{_i=_i-1}] do {	
		Sleep 1;		
		hint "Arming bomb...";

		_armed = BOMBA getVariable "armed";

		if (!alive _player || _armed) exitWith {
			hint "Arming failed.";
		};
	};

	if (alive _player) then {
		_str = 'armed the bomb!';	
		[[_player, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;
		[[_player], "SERVER_fnc_armBomb", true, false] spawn BIS_fnc_MP;
	};
	
} ,nil,1,false,true,"","((_target distance _this) < 2)"]; 

_unit addAction["<t color='#339900'>Disarm Bomb</t>", {

	_player = _this select 1;

	_limit = 7;

	_dif = (ceil (random 4) ) - 2;

	_limit = _limit + _dif;


	_armed = BOMBA getVariable "armed";

	if (!_armed) exitWith {	hint "Bomb isn't armed!";	};

	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

	_soundToPlay = _soundPath + "audio\disarm.ogg";
	playSound3D [_soundToPlay, BOMBA, false, getPos BOMBA, 1, 1, 50];

	_player playMoveNow "AinvPknlMstpSlayWrflDnon_medic"; 
	_player disableAI "ANIM";

	for [{_i=_limit},{_i>=0},{_i=_i-1}] do {	

		Sleep 1;		
		hint "Disarming bomb...";

		_armed = BOMBA getVariable "armed";
		if (!alive _player || !_armed) exitWith {
			hint "Disarm failed.";
		};

	};

	_armed = BOMBA getVariable "armed";
	if (alive _player && _armed) then {
		_str = 'disarmed the bomb!';	
		[[_player, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;
		[[_player], "SERVER_fnc_disarmBomb", true, false] spawn BIS_fnc_MP;
	};
	

} ,nil,1,false,true,"","((_target distance _this) < 2)"]; 

if(true) exitWith{};
