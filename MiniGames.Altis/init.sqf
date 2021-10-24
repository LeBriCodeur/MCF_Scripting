// Author : Aroun
// File : init.sqf
// File generated with Arma 3 Mission Creator by Aroun

["- Mini Games by DA3F -", "Bienvenue sur la mission mini games"]call DA3F_fnc_welcome;

DA3F_cash = 50000;
player setVariable ["DA3F_inv", []];

player setVariable ["DA3F_taux_ra", 0, true];

// appelé via initServer.sqf
// []spawn DA3F_fnc_initRadioActif;


DA3F_fnc_effectDown = {
	#include "DA3F_macros.hpp"
	for "_i" from 0 to 1 step 0 do {
		sleep Cfg_ra(getNumber, "timeIntervalEffectDown");
		private _val = player getVariable ["DA3F_taux_ra", 0];
		if (_val > 0) then {
			_val = _val - 1
		};
		player setVariable ["DA3F_taux_ra", _val];
		hint format [Cfg_ra(getText, "messageEffectDown"), _val, "%"];
	};
};

DA3F_fnc_damage_ra = {
	#include "DA3F_macros.hpp"
	private _val_ra = 0;
	for "_i" from 0 to 1 step 0 do {
		sleep Cfg_ra(getNumber, "timeIntervalDamage");
		_val_ra = ((player getVariable ["DA3F_taux_ra", 0]) / 100) / 10;
		player setDamage ((damage player) + _val_ra);
		hint format[Cfg_ra(getText, "messageDamage"), (1 - (damage player)) * 100, "%"]
	};
};

[]spawn DA3F_fnc_damage_ra;
[]spawn DA3F_fnc_effectDown;


DA3F_action = false;
player addAction ["Game Memory", {createDialog "GameMemory"}];
player addAction ["Game Pression", {createDialog "GamePression"}];
player addAction ["Game Search char", {createDialog "GameIndice"}];


DA3F_fnc_fixeRope = {
	params["_unit", "_caller", "_id", "_veh"];
	private _target = if (cursorObject isKindOf "car") then {cursorObject} else {objNull};
	player ropeDetach (ropes _veh select 0);
	
	_target ropeDetach (ropes _veh select 0);
	
	[_target, [0,0,-0.5]] ropeAttachTo (ropes _veh select 0);
	player removeAction _id;
	waitUntil {
		sleep 0.03;
		isNull (ropeAttachedTo _target) 
	};
	hint "Câble cassé.";
};

DA3F_fnc_unwindRope = {
	params["_veh", "_caller"];
	ropeUnwind [(ropes _veh) # 0, 2, -2, true];
};

DA3F_fnc_deleteRope = {
	params["_veh", "_caller", "_id", "_id2"];

	private _myRope = player getVariable ["DA3F_rope", objNull];

	if (!isNull _myRope) then {
		ropeDestroy _myRope;
		player setVariable ["DA3F_rope", objNull];
	};
	
	{
		_veh removeAction _x;
	} forEach [_id, _id2];
	sleep 0.05;
	hint "Treuil coupé";
};

DA3F_fnc_createRope={

	params["_unit", "_caller", "_id"];
	private _myRope = player getVariable ["DA3F_rope", objNull];
	if (!isNull _myRope) then {
		ropeDestroy _myRope;
	};
	
	private _veh = cursorObject;
	
	_myRope = ropeCreate [_veh, [0,1.6,-1.2], _unit, [0.3,0,1], 10/*, [], ["RopeEnd", [0,0,0]]*/];
	player setVariable ["DA3F_rope", _myRope];
	// myRope = ropeCreate [_veh, [0,1.6,-1.2], _target, [0,0,2], 10, [], ["RopeEnd", [0,0,0.5]]];
	if (isNull _myRope) exitWith {};
	// waitUntil { sleep 0.03; ropeUnwound (ropes _veh select 0) };
	// hint "Treuil déroulé !";

	// Attach le câble sur un véhicule face à soit
	player addAction ["<t color='#F0F000'>Fixer le treuil</t>", DA3F_fnc_fixeRope, _veh, 0, false, false, "", "cursorObject isKindOf 'car' && player distance cursorObject <=4", 4];

	// Permet de tendre le câble ( /!\ pas possible de tirer un véhicule juste en enroulant le câble)
	private _id = _veh addAction ["<t color='#F0F000'>Enrouler le treuil</t>", DA3F_fnc_unwindRope, [], 0, false, false, "", "cursorObject isKindOf 'car' && player distance cursorObject <=4", 4];

	// Coupe et supprime le câble
	_veh addAction ["<t color='#F31400'>Couper le treuil</t>", DA3F_fnc_deleteRope, _id, 0, false, false, "", "cursorObject isKindOf 'car' && player distance cursorObject <=4", 4];

};

player addAction ["<t color='#00FF00'>Treuil</t>", DA3F_fnc_createRope, [], 0, false, false, "", "(typeOf cursorObject) isEqualTo 'B_MRAP_01_F' && player distance cursorObject <=4", 4, false];

player addAction ["show info", {
	sphere = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
	onEachFrame { 
		_begPos = positionCameraToWorld [0,0,0]; 
		_begPosASL = AGLToASL _begPos; 
		_endPos = positionCameraToWorld [0,0,1000]; 
		_endPosASL = AGLToASL _endPos; 
		_ins = lineIntersectsSurfaces [_begPosASL, _endPosASL, player, objNull, true, 1, "FIRE", "NONE"]; 
		if (_ins isEqualTo []) exitWith {sphere setPosASL [0,0,0]}; 
		_ins select 0 params ["_pos", "_norm", "_obj", "_parent"]; 
		if !(getModelInfo _parent select 2) exitWith {sphere setPosASL [0,0,0]}; 
		_ins2 = [_parent, "FIRE"] intersect [_begPos, _endPos]; 
		if (_ins2 isEqualTo []) exitWith {sphere setPosASL [0,0,0]}; 
		_ins2 select 0 params ["_name", "_dist"]; 
		_posASL = _begPosASL vectorAdd ((_begPosASL vectorFromTo _endPosASL) vectorMultiply _dist); 
		drawIcon3D ["", [1,1,1,1], ASLToAGL _posASL, 0, 0, 0, _name, 1, 0.03, "PuristaMedium"]; 
		sphere setPosASL _posASL; 
	};
}];

// []spawn { 
//  private _chars = ["a","b","c","d","e","f","1","2","3","0"]; 
//  private _mdp = "";
//  private _win = "";
//  _chars = _chars call BIS_fnc_arrayShuffle; 
//  _chars resize 3; 
//  saveMdp = _chars; 
//  hint str _chars; 
//  _mdp = toUpper (_chars joinString "");
//  sleep 2;
//  _chars = _chars call BIS_fnc_arrayShuffle;
//  hint str [_mdp, _chars]; 
// };

/*
[]spawn {
	private _chars = ["a","b","c","d","e","f","1","2","3","0"];
	_chars = _chars call BIS_fnc_arrayShuffle;
	_chars resize 3;
	saveMdp = _chars;
	hint str _chars;
	sleep 1;
	_chars = _chars call BIS_fnc_arrayShuffle;
	hint str _chars;
};
*/

/*
	*
		*
			* Masta *
		* 
	*
*/

/*

à voir :
	class et dialogue (voir héritage)

// -- Masta | Finir explication syntax du remoteExec (fn_demoMasta.sqf)
private _value = param[0];
params["_value"];

[]call DA3F_fnc_demoMasta;

	[_txt] remoteExec ["DA3F_fnc_demoMasta", ];

	[_txt] remoteExec ["DA3F_fnc_demoMasta", -2];

// -- SERVER
private _timeCountdown = 120;
private _time = time + _timeCountdown;
private _txt = "";
waitUntil {
	_txt = [_time - time ,"HH:MM:SS:MM"] call BIS_fnc_timeToString;
	[_txt] remoteExec ["DA3F_fnc_demoMasta", -2];
	// CLIENT 
	[player, cursorObject] remoteExec ["DA3F_fnc_appelDB", 2];
	//SERVER
		params["_player", "_house"];
		_dbinfo = call maBD;

		[_dbinfo] remoteExec ["DA3F_fnc_RECU_DB", _player];
		params["_infoDB"];

	time >= _time
}


private _calcul = {
	params["_a", "_b"];
	str (_a + _b)
};

private _result = [2, 2]call _calcul;

hint _result;

*/