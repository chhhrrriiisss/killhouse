_unit = _this select 0;
// _box enableSimulation false;

// Sets civilians hostile towards blufor and opfor
(side JGN) setFriend [WEST, 0];
(side JGN) setFriend [EAST, 0];

_unit allowFleeing 0;

removeAllWeapons _unit;
removeAllItems _unit;

_unit setUnitAbility 0.1;
_unit setskill ["aimingAccuracy",1];
_unit setskill ["aimingShake",1];
_unit setskill ["aimingSpeed",1];
_unit setskill ["Endurance",1];
_unit setskill ["spotDistance",1];
_unit setskill ["spotTime",1];
_unit setskill ["courage",1];
_unit setskill ["reloadSpeed",1];
_unit setskill ["commanding",1];
_unit setskill ["general",1];

_unit addBackpack "B_OutdoorPack_blk";

_unit addMagazines ["150Rnd_762x51_Box_Tracer", 5];

_unit addWeapon "LMG_Zafir_pointer_F";
_unit assignItem "LMG_Zafir_pointer_F";

_avUniform = "U_B_Wetsuit";
_unit addUniform _avUniform;


_unit setVariable["isActive", false, true];



_unit setVariable ["selections", []];
_unit setVariable ["gethit", []];

_unit addEventHandler["fired",{

	(_this select 0) setVehicleAmmo 1;

}];

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
	_damage = _olddamage + ((_this select 2) - _olddamage) * .005;
	_gethit set [_i, _damage];
	// hint format['H:%1 D:%2', _olddamage, _damage];

	_rnd = random 100;

	if (_rnd > 80) then {
		_health =  (1-(damage _unit))*100;
		_str = format['TARGET HEALTH [ %1 ]', _health];
		[[CHAT, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;
	};

	_damage;

}];

_unit addEventHandler["explosion",{
	false;
}];

_unit addEventHandler["killed",{

	_killer = _this select 1;

	_str = 'killed the target!';
	[[_killer, _str], "MSG_fnc_mpGlobalChat", true, false] spawn BIS_fnc_MP;
	[[_killer], "SERVER_fnc_disarmBomb", true, false] spawn BIS_fnc_MP;

}];

_unit addEventHandler["respawn",{

	hint 'respawned';
}];

_unit addEventHandler["spawn", {

	hint 'spawned';

}];
