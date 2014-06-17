generateMap = {
	
	if (!isServer) exitWith {}; // isn't server     

	#define WALLSIZE 2
	#define SPACING .25

	_borderEnabled = true;
	_borderWallEnabled = false;
	_percent = 0;
	_time = time;	

	[['Generating map...'], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;

	if (count wallArray > 0) then {
		_clean = [] call clearWalls;
	};

	_startPos = getPos WALLS_a;
	_endPos = getPos WALLS_b;

	_newStartPos = [(ceil (_startPos select 0)), (ceil (_startPos select 1)), 0];
	_newEndPos = [(ceil (_endPos select 0)), (ceil (_endPos select 1)), 0];

	WALLS_a setPos _newStartPos;
	WALLS_b setPos _newEndPos;

	_startPos = _newStartPos;
	_endPos = _newEndPos;

	_vDist = (_startPos select 1) - (_endPos select 1);
	_hDist = (_startPos select 0) - (_endPos select 0);

	_hNum = abs ( ceil(_hDist/WALLSIZE) );
	_vNum = abs ( ceil(_vDist/WALLSIZE) );

	_totalNum = _hNum*_vNum;

	_hCount = 1;
	_vCount = 1;

	mapReady = false;
	publicVariable "mapReady";
	_prev = ["",0];

	hDist = _hDist;
	vDist = _vDist;
	publicVariable "hDist";
	publicVariable "vDist";

	borderArray = [];
	startPos = _newStartPos;
	endPos = _newEndPos;

	publicVariable "startPos";
	publicVariable "endPos";

	_buildings = ["Land_BagBunker_Large_F",
	"Land_Radar_Small",
	"Land_Radar_Small",
	"Land_ReservoirTank_Airport_F",
	"Land_spp_Transformer_F",
	"Land_Stone_HouseSmall_V1_F",
	"Land_Unfinished_Building_01_F",
	"Land_spp_Transformer_ruins_F",
	"Land_Metal_Shed_F",
	"Land_i_Stone_HouseBig_V1_F",
	"Land_i_Stone_Shed_V1_F",
	"Land_i_Barracks_V2_F",
	"Land_i_Shop_02_V1_F",
	"Land_Wreck_Truck_F",
	"Land_Wreck_BRDM2_F",
	"Land_i_House_Big_02_V1_F",
	"Land_PowLines_Transformer_F",
	"Land_Stone_HouseSmall_V1_Ruins_F", 
	"Land_Unfinished_Building_01_ruins_F",
	"Land_Wreck_Heli_Attack_01_F",
	"Dirthump_1_F","Dirthump_1_F",
	"Dirthump_1_F","Dirthump_1_F",
	"Dirthump_1_F"];

	_debris = ["Land_Pallets_Stack_F",
	"Land_MarketShelter_F",
	"Land_ScrapHeap_2_F",
	"Land_RazorWire_F", 
	"Land_RazorWire_F", 
	"Land_RazorWire_F"];


	_wallTemplates = [
	[
	['Land_Shoot_House_Wall_Long_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_F', 90, 2.2, 1.9, 0] // 90 degree corner
	],
	[
	['Land_Shoot_House_Wall_Long_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_F', 90, 2.2, 1.9, 0] // 90 degree corner
	],
	[
	['Land_Shoot_House_Wall_Long_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_F', 90, 2.2, 1.9, 0] // 90 degree corner
	],
	[
	['Land_Shoot_House_Wall_Long_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_F', 90, 2.2, -1.9, 0] // -90 degree corner
	],
	[
	['Land_Shoot_House_Wall_Long_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_F', 90, 2.2, -1.9, 0], 
	['Land_Shoot_House_Panels_Windows_F', 0, 1.15, -1.95, 0] // zigzag window
	],
	[
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 4, 0, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 315, 3.5, 1.4, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 3.6, 1.4, 0] // long crouch wall x3 45
	],
	[
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, 0, 4, 0], // long crouch wall x3 R
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 1.9, 2, 0] 
	],
	[
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 4, 0, 0], // long crouch wall x3 
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 4, 0, 0] 
	],
	[
	['Land_Shoot_House_Tunnel_Stand_F', 45, 0, -1.2, 0],
	['Land_Shoot_House_Tunnel_Stand_F', 25, 1.45, 2.1, 0], // stand tunnel
	['Land_Shoot_House_Tunnel_Stand_F', 0, 0.65, 2.3, 0]
	],
	[
	['Land_Shoot_House_Tunnel_Stand_F', 90, 0, -1.2, 0],
	['Land_Shoot_House_Tunnel_Stand_F', 90, 2.8, 0, 0], // stand tunnel
	['Land_Shoot_House_Tunnel_Stand_F', 90, 2.8, 0, 0]
	],
	[
	['Land_Obstacle_Bridge_F', 90, 0, 0, 0],
	['Land_Shoot_House_Wall_Long_F', 0, 3.3, -.6, -1],
	['Land_Shoot_House_Wall_Long_F', 0, -4,  0, -1],
	['Land_Shoot_House_Wall_Long_F', 0, -4,  0, -1] // bridge east // bridge east
	],
	[
	['Land_Obstacle_Bridge_F', 90, 0, 0, 0],
	['Land_Shoot_House_Wall_Long_F', 0, 3.3, .6, -1],
	['Land_Shoot_House_Wall_Long_F', 0, -4,  0, -1],
	['Land_Shoot_House_Wall_Long_F', 0, -4,  0, -1] // bridge east // bridge east
	],
	[
	['Land_Shoot_House_Wall_Long_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_F', 90, 2.2, -2, 0], // mixed
	['Land_Shoot_House_Panels_Windows_F', 0, 1.1, 2, 0],
	['Land_Shoot_House_Panels_Windows_F', 0, 1.1, 0, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, -2.2, 2, 0]
	],
	[
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, 2.2, -2, 0], // mixed
	['Land_Shoot_House_Wall_Long_Crouch_F', 0, 2.2, 2, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, -2.2, 2, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, 0, 4, 0]	
	],
	[
	['Land_BagFence_Long_F', 0, 0, -1.2, 0],
	['Land_BagFence_Long_F', 0, -3, .4, 0],
	['Land_BagFence_Long_F', 0, 0, 0, .6],
	['Land_BagFence_Long_F', 90, -1.4, 1.5, 0],
	['Land_BagFence_Long_F', 90, 0, 0, .6],
	['Land_BagFence_Long_F', 0, -1.5, 1.5, 0],
	['Land_BagFence_Long_F', 0, 0, 0, .6],
	['Land_BagFence_Long_F', 0, -3, 0, 0] // sand bag squizzle
	],
	[
	['Land_BagFence_Long_F', 0, -3, .4, 0],
	['Land_BagFence_Long_F', 90, -1.4, -1.5, 0],
	['Land_BagFence_Long_F', 0, -1.5, 1.5, 0]
	],
	[
	['Land_CncBarrierMedium4_F', 90, 0, -1.2, 0],
	['Land_CncBarrierMedium4_F', 0, 3.8, 4.4, 0], 
	['Land_CncBarrierMedium4_F', 0, -7.6, -7.2, 0] 
	],
	[
	['Land_CncWall4_F', 0, 0, -1.2, 0],
	['Land_CncWall4_F', 90, 2.6, -2.6, 0] // -90 degree corner
	],
	[
	['Land_Shoot_House_Panels_Windows_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Panels_Windows_F', 90, 1.2, -1.2, 0], // -90 degree corner
	['Land_Shoot_House_Panels_Windows_F', 90, 0, -2, 0], // -90 degree corner
	['Land_Shoot_House_Panels_Vault_F', 0, 1.2, -1, 0] // -90 degree corner // -90 degree corner
	],
	[
	['Land_Shoot_House_Panels_Windows_F', 0, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_F', 0, 3, 0, 0],
	['Land_Shoot_House_Panels_Windows_F', 0, -1.8, 0, 0],
	['Land_Shoot_House_Wall_Long_F', 0, -3, 0, 0]
	],
	[
	['Land_CncBarrierMedium4_F', 315, 0, -1.2, 0],
	['Land_CncBarrierMedium4_F', 45, 5, .1, 0] //cnc zig zag
	],
	[
	['Land_Shoot_House_Wall_Long_F', 90, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_F', 90, 0, 4, 0], //cnc zig zagLand_Shoot_House_Wall_Long_Crouch_F,
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, 0, 4, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, 0, 4, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 45, -1.3, 3.4, 0]
	],

	[
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, 0, -1.2, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 90, 0, 4, 0],
	['Land_Shoot_House_Wall_Long_Crouch_F', 315, 1.3, 3.4, 0]
	]

	];

	_borderType = "TapeSign_F";

	for [{_i=1},{_i<=_totalNum},{_i=_i+1}] do 
	{
		_skip = false;
		_corner = false;

		if (_vCount >_vNum) exitWith {	};
		
		_rnd = (random 100);
		_pos = [((_startPos select 0) + (_hCount*WALLSIZE)), ((_startPos select 1) + (_vCount*WALLSIZE)), 0];

		createBorder = {

			_pos = _this select 0;
			_pos = [_pos select 0, _pos select 1, 0];
			_rot = _this select 1;

			_rndS = ceil (random 4) -1;	
			if (_rndS > 1) then {
			
				_wall = createVehicle [_borderType,_pos,[], 0, "CAN_COLLIDE"];

				[[_wall, false], "CLIENT_fnc_setSimulation", true, true] spawn BIS_fnc_MP;	
				_wall setDir _rot;
				_wall allowDamage false;
				borderArray set[count borderArray, _wall];

			};

			_marker = createMarker[format['%1', count borderArray],_pos];
			_marker setMarkerType "hd_dot";
			_marker setMarkerColor "ColorBlack";
			_marker setMarkerSize [.2,.2];

			markerArray set[count markerArray, _marker];		
		};

		

		if (_hCount == 1) then {
			// left side
			_pos = [(_startPos select 0), ((_startPos select 1) + (_vCount*WALLSIZE)), 0];			
			_b1 = [_pos, 270] call createBorder;
			_skip = true;
		};

		if (_hCount >= _hNum -1) then {
			// right
			_pos = [((_startPos select 0) + (_hCount*WALLSIZE) +  SPACING) , ((_startPos select 1) + (_vCount*WALLSIZE)), 0];
			_b2 = [_pos, 90] call createBorder;
			_skip = true;
		};

		if (_vCount == 1) then {
			//bottom
			_pos = [(_startPos select 0) +  (_hCount*WALLSIZE), (_startPos select 1) - SPACING, 0];
			_b3 = [_pos, 180] call createBorder;
			_skip = true;
		};

		if (_vCount >= _vNum - 1) then {
			// top
			_pos = [(_startPos select 0) +  (_hCount*WALLSIZE), ((_startPos select 1) +  (_vCount*WALLSIZE) + SPACING), 0];
			_b4 = [_pos, 0] call createBorder;
			_skip = true;
		};
		
		_wLength = 1;

		createTemplate = {

			_pos = _this select 0;
			_template = _this select 1;

			{
				_type = _x select 0;
				_rot = _x select 1;
				_xOffset = _x select 2;
				_yOffset = _x select 3;
				_zOffset = _x select 4;
				_vector = _x select 5;

				_pos = [(_pos select 0) + _xOffset, (_pos select 1) + _yOffset, _pos select 2];

				_wall = createVehicle [_type,_pos,[], 0, "CAN_COLLIDE"];

				_wall setDir _rot;

				_wall setVariable['health', 20];
					_wall addEventHandler['handleDamage', {	
					_u = _this select 0;
					_d = _this select 2; 
					_h = _u getVariable "health";
					_d = _d * 2;
					_nh = _h - _d;

					if (_nh <= 0) exitWith {
					_u setDamage 1;			
					};
					_d 
				}];

				_nPos = getPos _wall;
				_nPos = [_nPos select 0, _nPos select 1, (_nPos select 2) + _zOffset];
				_wall setPos _nPos;

				wallArray set[count wallArray, _wall];

			} ForEach _template;

		};

		_rnd = random 100;

		if (_rnd > 86) then {

			_pos = [((_startPos select 0) + (_hCount*WALLSIZE)), ((_startPos select 1) + (_vCount*WALLSIZE)), 0];
			// _pos = [_buffer] call randomPos;
			_num = ceil (random (count _wallTemplates)) -1;

			_seed = _wallTemplates select _num;
			// _seed = [_wallTemplates] call randomType;
			_wall = [_pos, _seed] call createTemplate;
		};
		
		_hCount = _hCount + WALLSIZE;

		if (_hCount > _hNum) then {	
			_hCount = 1;	
			_vCount = _vCount + WALLSIZE;	
		};

	};

	_margin = 1;

	randomPos = {

		_buffer = _this select 0;
		_bufferX = _hDist * _buffer;
		_nhDist = _hDist - (_bufferX * 2);
		_rndX = ceil (random (_nhDist));
		_bufferY = _vDist * _buffer;
		_nvDist = _vDist - (_bufferY * 2);
		_rndY = ceil (random (_nvDist));
		_rndPos = [(_startPos select 0) + -(_bufferX + _rndX), (_startPos select 1) + -(_bufferY + _rndY), 0];
		_rndPos
	};

	// Returns a random number based on the length of specified array
	randomType = {
		_array = _this select 0;
		_rnd = ceil (random (count _array)) -1;
		_type = _array select _rnd;
		_type
	};

	generateItems = {

		// get vars
		_type = _this select 0;
		_rarity = _this select 1;
		_skip = _this select 2;
		_buffer = _this select 3;
		_output = _this select 4;
		_collision = "CAN_COLLIDE";

		_rnd = random (1);

		if (_skip > _rnd) then {

			// _stringLength = _this select 5;
			_randomArray = _this select 7;
			_angle = _this select 8;
			_angleStep = _this select 9;
			_simulation = _this select 10;

			_rndPos = [_buffer] call randomPos;

			_scaledValue = (_hNum + _vNum) /2;
			_rnd = ceil (random (_scaledValue * _rarity));

			for [{_i=1},{_i<=_rnd},{_i=_i+1}] do 
			{
				_rndPos = [_buffer] call randomPos;

				if (count _randomArray > 0) then {
					_type = [_randomArray] call randomType;
				};

				_rndRot = ceil (random _angleStep);																																																								
				_rot = ceil (_angle*_rndRot);
				_obj = createVehicle [_type,_rndPos,[], 0, _collision];

				_obj enableSimulation false;
				[[_obj, _simulation], "CLIENT_fnc_setSimulation", true, true] spawn BIS_fnc_MP;
				_obj setDir _rot;

			 	_output set[count _output, _obj];
			};
		};

	};


	_containers2 = ["Land_Cargo20_blue_F", .1, 1, .1, wallArray, false, 0, [], 1, 360, false] call generateItems;
	_containers2 = ["Land_Cargo20_brick_red_F", .18, 1, .1, wallArray, false, 0, [], 1, 360, false] call generateItems;
	_containers = ["Land_Cargo40_military_green_F", .18, 1, .1, wallArray, false, 0, [], 1, 360, false] call generateItems;
	_cnchigh = ["Land_RampConcreteHigh_F", .2, 1,.1, wallArray, false, 0, [], 45, 8, true] call generateItems;
	_market = ["Land_MarketShelter_F", .2, 1,.1, wallArray, false, 0, [], 45, 8, false] call generateItems;
	_razor = ["Land_RazorWire_F", .4, 1,.1, wallArray, false, 0, [], 1, 360, false] call generateItems;
	_tower = ["Land_Airport_Tower_F", .001, .5, .4, wallArray, false, 0, [], 90, 4, true] call generateItems;
	_scrap = ["Land_ScrapHeap_2_F", .35, 1, .05, wallArray, false, 0, [], 1, 360, false] call generateItems;

	_scaleValue = ( (_hNum * _vNum) / 2) / 300;
	_rndH = ceil (random _scaleValue) +  (ceil (_scaleValue*.1));
	_cacheCount = _rndH;

	for [{_i=1},{_i<=_rndH},{_i=_i+1}] do 
	{	
		_buffer = 0;
		_pos = [_buffer] call randomPos;

		_box = createVehicle["Box_NATO_Wps_F",_pos,[], 0, "CAN_COLLIDE"];
		_box addEventHandler['handleDamage', {false }];

		_rndRot = ceil (random 360);
		_box setDir _rndRot;

		_magArray = [];
		_wepArray = [];
		_itemArray = [];

		_posArray = [
			['arifle_Mk20_GL_MRCO_pointer_F', 'W', 3],
			['arifle_Katiba_GL_ARCO_pointer_F', 'W', 3],
			['arifle_TRG21_GL_ACO_pointer_F', 'W', 3],
			['arifle_MX_GL_Hamr_pointer_F', 'W', 3],
			['30Rnd_556x45_Stanag_Tracer_Red', 'M', 6],
			['3Rnd_HE_Grenade_shell', 'M', 6],
			['1Rnd_HE_Grenade_shell', 'M', 4],
			['30Rnd_65x39_caseless_mag_Tracer', 'M', 6],
			['3Rnd_SmokeRed_Grenade_shell', 'M', 6],
			['1Rnd_SmokeRed_Grenade_shell', 'M', 6],
			['SmokeShell', 'M', 6],
			['SmokeShellOrange', 'M', 3],
			['HandGrenade', 'M', 3],
			['FirstAidKit', 'I', 10]
		];

		{				
			_name = _x select 0;
			_type = _x select 1;
			_chance = _x select 2;
			_rnd = ceil (random (_chance)) + 1;
			
			switch (_type) do {

				case "W":
				{					
					_wepArray set[count _wepArray, [_name, _rnd]];
				};

				case "M":
				{					
					_magArray set[count _magArray, [_name, _rnd]];
				};

				case "I":
				{					
					_itemArray set[count _itemArray, [_name, _rnd]];
				};

				default {};

			};				

		} ForEach _posArray;

		_rnd = ceil (random 3) + 1;

		_cargo = [
			[_box, _magArray, "M"],
			[_box, _wepArray, "W"],
			[_box, _itemArray, "I"]
		];

		_sendCargo = [_cargo, "CLIENT_fnc_syncCargo", true, true] spawn BIS_fnc_MP;

		wallArray set[count wallArray, _box];
	};


	// GENERATE POCKETS
	_scaledValue = (_hNum + _vNum) / 6;
	_rndH = (ceil (random _scaledValue) ) + 5;

	for [{_i=1},{_i<=_rndH},{_i=_i+1}] do 
	{
		_margin = (ceil (random 4) + 5);
		_buffer = .1;

		_pos = [_buffer] call randomPos;
		_nearObjs = nearestObjects [_pos, [], _margin];

		{
			deleteVehicle _x;	

		} ForEach _nearObjs;

		_rndO = ceil (random 100);

		if (_rndO > 70) then {

			_rndB = ceil (random ((count _buildings - 1)));
			_type = _buildings select _rndB;
			_obj = createVehicle [_type,_pos,[], 0, "CAN_COLLIDE"];
			

			_obj setVariable ["selections", []];
			_obj setVariable ["gethit", []];
			_obj addEventHandler["HandleDamage",{

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

				// _str = format['health: %1 damage: %2', damage _unit, _damage];
				// [[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;

				if (_damage > 0.8) then {
					_unit setDamage 1;
				};

				_damage
			}];


			_rndRot = random 360;
			_obj setDir _rndRot;
			wallArray set[count wallArray, _obj];

		};	
	};


	if (gameMode == 5) then { //jgn

		_buffer = .2;
		_firstPos = [_buffer] call randomPos;

		JGN setPos _firstPos;

		[JGN] execVM 'modes\track_jgn.sqf'; 
		[JGN] execVM 'modes\trap_jgn.sqf'; 
		[JGN] execVM 'modes\control_jgn.sqf'; 

	};




	if (gameMode == 4) then { //SND

		_buffer = .4;
		_firstPos = [_buffer] call randomPos;

		BOMBA setPos _firstPos;
		SITEA setPos _firstPos;
		

		_margin = abs ( ((_hDist + _vDist) /2 ) * .15);
		_marginSpawn = abs ( ((_hDist + _vDist) /2 ) * .25);

		{	
			if (SITEA distance (getPos _x) < (_margin/3)) then {
				wallArray = wallArray - [_x];
				deleteVehicle _x;
			};

			if (SITEA distance (getPos _x) < (_margin/3)) then {
				wallArray = wallArray - [_x];
				deleteVehicle _x;
			};
		} ForEach wallArray;

		LAPTOP setPos [_firstPos select 0, _firstPos select 1, .35];

	} else {

		BOMBA setPos [0,0,0];
		SITEA setPos [0,0,0];
		LAPTOP setPos [0,0,0];
	};


	// SETUP GAME MODES
	if (gameMode == 1) then { // CTF

		_westPos = [(_endPos select 0) -7, (_endPos select 1) -7, 0];
		_eastPos = [(_startPos select 0) + 7, (_startPos select 1) + 7, 0];

		_margin = abs ( ((_hDist + _vDist) /2 ) * .35);

		BLUFOR setPos _westPos;
		BLUFOR_BASE setPos _westPos;

		OPFOR setPos _eastPos;
		OPFOR_BASE setPos _eastPos;
		
		{	
			if (BLUFOR_BASE distance (getPos _x) < (_margin/3)) then {
				wallArray = wallArray - [_x];
				deleteVehicle _x;
			};

			if (OPFOR_BASE distance (getPos _x) < (_margin/3)) then {
				wallArray = wallArray - [_x];
				deleteVehicle _x;
			};
		} ForEach wallArray;

		[BLUFOR] execVM "modes\track_flag.sqf";
		[OPFOR] execVM "modes\track_flag.sqf";

	};

	if (gameMode != 1) then {

		BLUFOR setPos [0,0,0];
		BLUFOR_BASE setPos [0,0,0];
		OPFOR setPos [0,0,0];
		OPFOR_BASE setPos [0,0,0];

	};

	// CLEAN UP OUTSIDE OBJECTS
	{
		_pos = getPos _x;

		if ( (_pos select 0) >= (_endPos select 0) ||
			 (_pos select 1) >= (_endPos select 1) ||
			 (_pos select 0) <= (_startPos select 0) ||
			 (_pos select 1) <= (_startPos select 1) ) then {

			wallArray = wallArray - [_x];
			deleteVehicle _x;
		}

	} ForEach wallArray;
	// _debug = true;
	// if (_debug) then {

	// 	_pos = getMarkerPos "test";
	// 	_pos = [_pos select 0, _pos select 1, 15.5];

	// 	{	
	// 		_item = [_pos, _x] call createTemplate;

	// 	} ForEach _wallTemplates;
	// };

	publicVariable "wallArray";
	publicVariable "borderArray";
	publicVariable "markerArray";

	mapReady = true;
	publicVariable "mapReady";

	_newTime = time;
	_difTime = _newTime - _time; 

	_str = format['Map generated in (%1s).', _difTime];
	[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;

	if(true) exitWith{};

};