if (!isServer && (player != player)) then
{
  waitUntil {player == player};
  waitUntil {time > 10};
};


_unit = _this select 0;
_unit setVariable["markers",[]];
removeAllActions _unit; // fix admin action menu persisting

if (side _unit == west || side _unit == east) then {
	_unit addBackpack "B_Carryall_ocamo";
	clearAllItemsFromBackpack _unit;

};

_unit addeventhandler ["respawn", {

	_unit = _this select 0;
	[_unit] execVM 'player_respawn.sqf';
}];  

_unit addmpeventhandler ["mpkilled", {
	
	_unit = _this select 0;
	[_unit] execVM 'player_killed.sqf';
}];

_spawnScript = [_unit] execVM 'player_spawn.sqf';
