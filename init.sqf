[	
	2*60, // seconds to delete dead bodies (0 means don't delete) 
	60, // seconds to delete dead vehicles (0 means don't delete)
	2*60, // seconds to delete dropped weapons (0 means don't delete)
	10*60, // seconds to deleted planted explosives (0 means don't delete)
	2*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'repetitive_cleanup.sqf';

isFirst = true;

if (isServer) then {	
	westSpawnArray = [];
	eastSpawnArray = [];
	guerSpawnArray = [];
	gameMode = 4; // defaults to snd
	wallArray = [];
	borderArray = [];
	markerArray = [];
	bluforPoints = 0;
	opforPoints = 0;
	startPos = [0,0,0];
	endPos = [0,0,0];
	mapReady = false;
	hDist = 0;
	vDist = 0;
	publicVariable "hDist";
	publicVariable "vDist";
	publicVariable "mapReady";
	publicVariable "startPos";
	publicVariable "endPos";
	publicVariable "westSpawnArray";
	publicVariable "eastSpawnArray";
	publicVariable "guerSpawnArray";
	publicVariable "gameMode";
	publicVariable "wallArray";
	publicVariable "bluforPoints";
	publicVariable "opforPoints";
	publicVariable "borderArray";
	publicVariable "markerArray";
};

[] spawn {
	scriptName "initMission.hpp: mission start";

	[[1803.34, 5793.62, 0],"Killhouse Facility S1",100,60,180,-1,[]] spawn BIS_fnc_establishingShot;  // [ position, text, altitude(m), radius (m), viewing angle (Deg), direction (+1 = clockwide, -1 = anticlockwise)
	waitUntil {!isnil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing}};

};

// Gear Config
[] call compile preprocessFileLineNumbers "save_gear.sqf";
[] call compile preprocessFileLineNumbers "load_gear.sqf";

// Prevent players leaving the CQB area
[] call compile preprocessFileLineNumbers "trap_player.sqf"; 

// Weather Config
[] call compile preprocessFileLineNumbers "real_weather.sqf";

if (isServer) then {

	[] call compile preprocessFileLineNumbers "generate_map.sqf";
	[] call compile preprocessFileLineNumbers "clear_map.sqf";

	MISSION_ROOT = call {
	    private "_arr";
	    _arr = toArray __FILE__;
	    _arr resize (count _arr - 8);
	    toString _arr
	};


	SERVER_fnc_setGameMode = {

		_mode = _this select 0;

		switch (_mode) do {

		case "CTF":
		{
			gameMode = 1;
		};

		case "DM":
		{
			gameMode = 2;
		};

		case "TDM":
		{
			gameMode = 3;
		};

		case "SND":
		{
			gameMode = 4;
		};

		case "JGN":
		{
			gameMode = 5;
		};

		default {};

		};

		publicVariable "gameMode";
		_str = format['Game mode changed to [ %1 ]', _mode];
		[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;		

	};

	SERVER_fnc_mpScore = {

		if (!isServer) exitWith {};

	 	_bluforChange = _this select 0;
		_opforChange = _this select 1;

		bluforPoints = bluforPoints + _bluforChange;
		opforPoints = opforPoints + _opforChange;

		_str = format['BLUFOR [ %1 ]  OPFOR [ %2 ]', bluforPoints, opforPoints];	
		[[CHAT, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;

		publicVariable "opforPoints";
		publicVariable "bluforPoints";

	};


	SERVER_fnc_armBomb = {

		if (!isServer) exitWith {};

		_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

		_unit = _this select 0;
		BOMBA setVariable["armed", true, true];
		_side = side _unit;
		BOMBA setVariable["armedBy", _side, true];

		if (_side == WEST) then {
			[[1, 0], "SERVER_fnc_mpScore", false, false] spawn BIS_fnc_MP; // blufor, opfor
		};

		if (_side == EAST) then {
			[[0, 1], "SERVER_fnc_mpScore", false, false] spawn BIS_fnc_MP; // blufor, opfor
		};

		_rnd = ceil (random 25);
		_limit = 60 + _rnd;

		for [{_i=_limit},{_i>=0},{_i=_i-1}] do {		
			Sleep 1;		

			_armed = BOMBA getVariable "armed";
			if (!_armed) exitWith {};

			_soundToPlay = _soundPath + "audio\beep.ogg";
			if (_i > 10) then { _soundToPlay = _soundPath + "audio\beep.ogg"; } else {
				_soundToPlay = _soundPath + "audio\dblbeep.ogg";
			};

			playSound3D [_soundToPlay, BOMBA, false, getPos BOMBA, 1, 1, 50];

			_str = format["Detonation in (%1s).", _i];
			[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;			

		};

		_armed = BOMBA getVariable "armed";

		if (_armed) then {

			_side = BOMBA getVariable "armedBy";

			if (_side == WEST) then {
				[[1, 0], "SERVER_fnc_mpScore", false, false] spawn BIS_fnc_MP; // blufor, opfor
			};

			if (_side == EAST) then {
				[[0, 1], "SERVER_fnc_mpScore", false, false] spawn BIS_fnc_MP; // blufor, opfor
			};

			_pos = getPos BOMBA;
			_pos = [_pos select 0, _pos select 1, 1.2];

			BOMBA setVariable[ "armed", false, true];
			_bomb = "Bo_GBU12_lgb" createVehicle _pos;
			_bomb2 = "Bo_GBU12_lgb" createVehicle _pos;

			if (_side == WEST) then {
				_side = "BLUFOR";
			} else {
				_side = "OPFOR";
			};

			_str = format['%1 detonated the bomb!', _side];
			[[CHAT, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;

			_soundToPlay = _soundPath + "audio\alarm.ogg";
			playSound3D [_soundToPlay, BOMBA, false, getPos BOMBA, 1, 1, 50];

			_str = "Bomb detonated.";
			[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;
		};



	};

	SERVER_fnc_disarmBomb = {

		if (!isServer) exitWith {};

		_armed = BOMBA getVariable "armed";

		if (_armed) then {

			_side = BOMBA getVariable "armedBy";

			if (_side == WEST) then {
				[[0, 2], "SERVER_fnc_mpScore", false, false] spawn BIS_fnc_MP; // blufor, opfor
			};

			if (_side == EAST) then {
				[[2, 0], "SERVER_fnc_mpScore", false, false] spawn BIS_fnc_MP; // blufor, opfor
			};

			BOMBA setVariable["armed", false, true];

			_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;	
			_soundToPlay = _soundPath + "audio\beep_off.ogg";
			playSound3D [_soundToPlay, BOMBA, false, getPos BOMBA, 1, 1, 50];

			_str = 'Bomb disarmed.';
			[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;	
		};

	};

	SERVER_fnc_mpClearWalls = {    

		if (!isServer) exitWith {}; // isn't server     
		_clear = [] call clearMap;
	};                            

	SERVER_fnc_mpGenerateWalls = {

		if (!isServer) exitWith {}; // isn't server     

		// _null = [] execVM 'generate_map.sqf';
		_generate = [] call generateMap;
		// (_this select 0) globalChat (_this select 1);
	};     

};

CLIENT_fnc_syncCargo = {	

	syncIt = {

		_obj = _x select 0;
		_items = _x select 1;
		_type = _x select 2;

		if (_type == "M") then {

			clearMagazineCargo _obj;
			{	
				_name = _x select 0;
				_quantity = _x select 1;				
				_obj addMagazineCargo[_name, _quantity];

			} ForEach _items;

		};

		if (_type == "W") then {

			clearWeaponCargo _obj;
			{	
				_name = _x select 0;
				_quantity = _x select 1;				
				_obj addWeaponCargo[_name, _quantity];

			} ForEach _items;
		};

		if (_type == "I") then {

			clearItemCargo _obj;
			{	
				_name = _x select 0;
				_quantity = _x select 1;				
				_obj addItemCargo[_name, _quantity];

			} ForEach _items;
		};

	};

	_array = _this;

	{
		_items = _x select 1;

		if (count _items > 0) then {

			_obj = _x select 0;
			_type = _x select 2;

			[_obj, _items, _type] call syncIt;

		};

	} ForEach _array;

};  

CLIENT_fnc_setSimulation = {

    (_this select 0) enableSimulation (_this select 1);

};          

MSG_fnc_mpHint = {
	_str =  _this select 0;
    hint _str;
};                                       

MSG_fnc_mpGlobalChat = {
     (_this select 0) globalChat (_this select 1);
};                                       
  
if (isServer) then {
	_generate = [] call generateMap;
	_weather = [] call realWeather;
};



