

if (!isServer) exitwith {};

private _marker_anom_burp		= _this select 0;
private _mobile_anomaly			= _this select 1;
private _device_detector		= _this select 2;
private _damage_protect			= _this select 3;
private _anti_burper_device		= _this select 4;

private _object_anom_burp = "Land_HelipadEmpty_F" createVehicle [getmarkerPos _marker_anom_burp select 0,getmarkerPos _marker_anom_burp select 1,2];
private _balta_sang = createVehicle ["BloodSplatter_01_Medium_New_F",[getmarkerPos _marker_anom_burp select 0,getmarkerPos _marker_anom_burp select 1,0], [], random 8, "CAN_COLLIDE"];
_balta_sang setdir (random 360);

if (_anti_burper_device	!="") then {
	anti_burper = _anti_burper_device; publicVariable "anti_burper";
	[_object_anom_burp,_anti_burper_device] execvm "AL_burpy\remove_burper.sqf";
};

if (_device_detector !="") then {
	detection_smugg = true; publicVariable "detection_smugg";
	detectiv_tool = _device_detector; publicVariable "detectiv_tool"; [_object_anom_burp] execvm "AL_burpy\ai_avoid_burper.sqf";
} else {detection_smugg = false; publicVariable "detection_smugg"; [_object_anom_burp] execvm "AL_burpy\ai_avoid_burper_vizible.sqf"};

if (_damage_protect !="") then {obj_prot_burper=_damage_protect; publicVariable "obj_prot_burper"};

[_object_anom_burp] execvm "AL_burpy\damage_trap.sqf";
[[_object_anom_burp],"AL_burpy\alias_burper_sfx.sqf"] remoteExec ["execVM",0,true];

private _DA3F_newPos = {
	params["_obj"];
	private _axe_x = if (random 100 < 50) then {50} else {-50};
	private _axe_y = if (random 100 < 50) then {75} else {-75};
	private _pos = _obj modelToWorld [_axe_x, _axe_y, 0];
	_pos
};

if (_mobile_anomaly) then {
	private _poz_ini_burp = [];
	private _new_poz = [];
	private _randPos = [];

	while {alive _object_anom_burp} do 
	{
		hint "La chose va bouger";
		// _poz_ini_burp = getPosATL _object_anom_burp;
		_randPos = [_object_anom_burp]call _DA3F_newPos;
		// [center, minDist, maxDist, objDist, waterMode, maxGrad, shoreMode, blacklistPos, defaultPos] call BIS_fnc_findSafePos
		_new_poz = [_randPos,50,75,10,0,0.1,0,[],[]] call BIS_fnc_findSafePos;
		_object_anom_burp setPos [_new_poz select 0,_new_poz select 1, _poz_ini_burp select 2];
		sleep 60 + random 60;
	};
};