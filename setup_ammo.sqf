_box = _this select 0;

_box addAction["<t color='#E54028'>Settings</t>", 'settings.sqf']; 
_box addAction["<t color='#F18D05'>Select Gear</t>", "vas\open.sqf"]; 
_box addEventHandler['handleDamage', { false }]; 
clearWeaponCargo _box; 
clearMagazineCargo _box;   
_box addAction["<t color='#61AE24'>Spawn</t>", 'spawn_in.sqf']; 
