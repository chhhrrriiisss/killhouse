_box = _this select 0;
_mode = _this select 3 select 0;

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