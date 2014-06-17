_unit = _this select 0;

_unit setVariable["hasSpawned", true, true];

_pos = getMarkerPos "respawn_admin";

_pos = [_pos select 0, _pos select 1, 19];
player setPos _pos;
player allowDamage false;

removeHeadgear player:
removeGoggles player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player:
removeAllAssignedItems player;

player addUniform "U_OI_Scientist";

player addAction ['<t color="#E54028">Return to Admin Zone</t>', {

	_pos = getMarkerPos "respawn_admin";
	_pos = [_pos select 0, _pos select 1, 19];
  player setPos _pos;

}];

player addAction ['<t color="#00A1CB">Go to Start Corner</t>', {

	_pos = getPos WALLS_a;
	player setPos _pos;
}];

player addAction ['<t color="#00A1CB">Go to End Corner</t>', {

	_pos = getPos WALLS_b;
	player setPos _pos
;}];

player addAction['<t color="#E54028">Clear Map</t>', {
	[[], "SERVER_fnc_mpClearWalls", false, false, true,false,"","player ==_target"] spawn BIS_fnc_MP;
}];    
player addAction['<t color="#61AE24">Generate Map</t>', {
	[[], "SERVER_fnc_mpGenerateWalls", false, false, true,false,"","player ==_target"] spawn BIS_fnc_MP;
}];    
player addAction['<t color="#f18d05">Set Capture The Flag</t>', {	
	[["CTF"], "SERVER_fnc_setGameMode", false, false, true,false,"","player ==_target"] spawn BIS_fnc_MP;
}];
player addAction['<t color="#f18d05">Set Team Deathmatch</t>', {
	[["TDM"], "SERVER_fnc_setGameMode", false, false, true,false,"","player ==_target"] spawn BIS_fnc_MP;
}];
player addAction['<t color="#f18d05">Set Search and Destroy</t>', {
	[["SND"], "SERVER_fnc_setGameMode", false, false, true,false,"","player ==_target"] spawn BIS_fnc_MP;
}];
player addAction['<t color="#f18d05">Set Juggernaut</t>', {
	[["JGN"], "SERVER_fnc_setGameMode", false, false, true,false,"","player ==_target"] spawn BIS_fnc_MP;
}];


_str = format['%1 is now a game admin.', name _unit];
[[_str], "MSG_fnc_mpHint", true, false] spawn BIS_fnc_MP;

hint 'You are now a game admin.';

if(true) exitWith{};
