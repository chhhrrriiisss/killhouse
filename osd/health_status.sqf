///////////////////////////////////////////////////
//**MAX_HealthstatusBar 4.0**// 
//     script by Maxjoiner 2013     //
//	 Do not modified              //
//    without my permission         //
//---------------------------------------//
//Files nedeed are into download //
//folder in mission test (two files)//
//1 - Health.jpg                           //
//2 - Max_healthstatusbar.hpp    //
//in description.ext insert this:    // 
//#include <Max_HealthStatusBar.hpp>//
//to use in editor:                       //
//nul = [player] execVM             //
 //"maxhealthstatusbar.sqf"        // 
//////////////////////////////////////////////////

_unit = _this select 0;




while {alive _unit} do
{
sleep 0.5;

// titleRsc ["flagStatus", "PLAIN"];


if (damage  _unit >= 0 and damage  _unit < 0.1 and _unit == vehicle _unit)then{titleRsc ["health100", "PLAIN"]};
if (damage  _unit >= 0 and damage  _unit < 0.1 and _unit != vehicle _unit)then{titleRsc ["chealth100", "PLAIN"]};
if (damage _unit >= 0.1 and damage _unit < 0.2 and _unit == vehicle _unit)then{titleRsc ["health90", "PLAIN"]};
if (damage _unit >= 0.1 and damage _unit < 0.2 and _unit != vehicle _unit)then{titleRsc ["chealth90", "PLAIN"]};
if (damage _unit >= 0.2 and damage _unit < 0.3 and _unit == vehicle _unit)then{titleRsc ["health80", "PLAIN"]};
if (damage _unit >= 0.2 and damage _unit < 0.3 and _unit != vehicle _unit)then{titleRsc ["chealth80", "PLAIN"]};
if (damage _unit >= 0.3 and damage _unit < 0.4 and _unit == vehicle _unit)then{titleRsc ["health70", "PLAIN"]};
if (damage _unit >= 0.3 and damage _unit < 0.4 and _unit != vehicle _unit)then{titleRsc ["chealth70", "PLAIN"]};
if (damage _unit >= 0.4 and damage _unit < 0.5 and _unit == vehicle _unit)then{titleRsc ["health60", "PLAIN"]};
if (damage _unit >= 0.4 and damage _unit < 0.5 and _unit != vehicle _unit)then{titleRsc ["chealth60", "PLAIN"]};
if (damage _unit >= 0.5 and damage _unit < 0.6 and _unit == vehicle _unit)then{titleRsc ["health50", "PLAIN"]};
if (damage _unit >= 0.5 and damage _unit < 0.6 and _unit != vehicle _unit)then{titleRsc ["chealth50", "PLAIN"]};
if (damage _unit >= 0.6 and damage _unit < 0.7 and _unit == vehicle _unit)then{titleRsc ["health40", "PLAIN"]};
if (damage _unit >= 0.6 and damage _unit < 0.7 and _unit != vehicle _unit)then{titleRsc ["chealth40", "PLAIN"]};
if (damage _unit >= 0.7 and damage _unit < 0.8 and _unit == vehicle _unit)then{titleRsc ["health30", "PLAIN"]};
if (damage _unit >= 0.7 and damage _unit < 0.8 and _unit != vehicle _unit)then{titleRsc ["chealth30", "PLAIN"]};
if (damage _unit >= 0.8 and damage _unit < 0.9 and _unit == vehicle _unit)then{titleRsc ["health20", "PLAIN"]};
if (damage _unit >= 0.8 and damage _unit < 0.9 and _unit != vehicle _unit)then{titleRsc ["chealth20", "PLAIN"]};
if (damage _unit >= 0.9 and damage _unit < 1 and _unit == vehicle _unit)then{titleRsc ["health10", "PLAIN"]};
if (damage _unit >= 0.9 and damage _unit < 1 and _unit != vehicle _unit)then{titleRsc ["chealth10", "PLAIN"]};
if (damage _unit >=1)then{titleRsc ["health0", "PLAIN"]};
sleep 0.5;
if (damage _unit >= 0.8)then{titleRsc ["health0", "PLAIN"]};
};
if (true) exitWith {};