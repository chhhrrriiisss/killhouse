loadSaved=false;

loadGear = {

if (!loadSaved) exitWith {hint format ["No previous loadout was saved.", name player];};

_unit =_this select 0;

removeAllWeapons _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeBackPack _unit;

if (pGoggles) then {_unit addGoggles gGoggles;};
if (pUniform) then {_unit addUniform gUniform;};
if (pVest) then {_unit addVest gVest;};
if (pBackPack) then {_unit addBackPack gBackPack;clearAllItemsFromBackpack _unit;};
if (pHeadGear) then {_unit addHeadGear gHeadGear;};
if (pUniform) then {
   {
     if (isClass (configFile >> "cfgMagazines" >> _x)) then {_unit addMagazine _x;} else {_unit addWeapon _x;};
   } forEach gUniformItems;
};

if (pVest) then {
   {
     if (isClass (configFile >> "cfgMagazines" >> _x)) then {_unit addMagazine _x;} else {_unit addWeapon _x;};
   } forEach gVestItems;
};

if (pBackPack) then {
   {
     if (isClass (configFile >> "cfgMagazines" >> _x)) then {_unit addMagazine _x;} else {_unit addWeapon _x;};
   } forEach gBackPackItems;
};

if (pPrimaryMag) then {_unit addmagazine gPrimaryMag;};
if (pSecondaryMag) then {_unit addmagazine gSecondaryMag;};
if (phandGunMag) then {_unit addmagazine gHandGunMag;};

if (pPrimaryWeapon) then {
    _unit addWeapon gPrimaryWeapon;
   {_unit addPrimaryWeaponItem _x} forEach gPrimaryItems;
};

if (pSecondaryWeapon) then {
    _unit addWeapon gSecondaryWeapon;
   {_unit addsecondaryWeaponItem _x} forEach gSecondaryItems;
};

if (pHandGunWeapon) then {
    _unit addWeapon gHandGunWeapon;
   {_unit addhandGunItem _x} forEach gHandGunItems;
};

};