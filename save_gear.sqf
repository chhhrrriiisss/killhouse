saveGear = {
   loadSaved=True;
   _unit = _this select 0;

   if (goggles _unit != "") then {
      gGoggles = goggles _unit; 
      pGoggles=true;
   } else {pGoggles=false;};

   if (headGear _unit != "") then {
      gHeadGear = headGear _unit;
      pHeadGear=True;
   } else {pHeadGear=false;};

   if (uniform _unit != "") then {
      gUniform = uniform _unit;
      gUniformItems = uniformItems _unit;
      pUniform=true;
   } else {pUniform=false;};

   if (vest _unit != "") then {
      gVest = vest _unit;
      gVestItems = vestItems _unit;
      pVest=true;
   } else {pVest=false;};

   if (backPack _unit != "") then {
      gBackPack = backpack _unit;
      gBackPackItems = backPackItems _unit;
      pBackPack=true;
   } else {pBackPack=false;};

   if (primaryWeapon _unit != "") then {
      gPrimaryWeapon = primaryWeapon _unit;
      gPrimaryItems = primaryWeaponItems _unit;
      pPrimaryWeapon=true;
   } else {pPrimaryWeapon=false;};

   if (secondaryWeapon _unit != "") then {
      gSecondaryWeapon = secondaryWeapon _unit;
      gSecondaryItems = secondaryWeaponItems _unit;
      pSecondaryWeapon=true;
   } else {pSecondaryWeapon=false;};

   if (handGunWeapon _unit != "") then {
      gHandGunWeapon = handGunWeapon _unit;
      gHandGunItems = handgunItems _unit;
      pHandGunWeapon=true;
   } else {pHandGunWeapon=false;};

   if (count primaryWeaponMagazine _unit > 0) then {
      gPrimaryMag = primaryWeaponMagazine _unit;
      pPrimaryMag=true;
   } else {pPrimaryMag=false;};

   if (count secondaryWeaponMagazine _unit > 0) then {
       gSecondaryMag = secondaryWeaponMagazine _unit;
       pSecondaryMag=true;
   } else {pSecondaryMag=false;};

   if (count handGunmagazine _unit > 0) then {
      gHandGunMag = handGunMagazine _unit;
      pHandGunMag=true;
   } else {pHandGunMag=false;};

   hint 'Gear Saved.';

};