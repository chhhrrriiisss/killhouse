_unit = _this select 1;
_id = _this select 2;

_isAdmin = serverCommandAvailable "#kick";

if (_isAdmin) then {

	[_unit] execVM 'setup_admin.sqf';

} else {

	hint 'You need to be an Admin.';
};

if(true) exitWith{};