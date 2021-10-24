#include "..\..\DA3F_macros.hpp"
// Aroun
// fn_initRadioActif.sqf
// []spawn DA3F_fnc_initRadioActif;
private _arr_mrk = Cfg_ra(getArray, "markers");
private _arr_obj = Cfg_ra(getArray, "objects");
private _timeInterval = Cfg_ra(getNumber, "timeIntervalEffect");

private _txtDamage = Cfg_ra(getText, "messageEffect");
private _unit = objNull;
private _isInArea = false;
private _arrObj = [];



for "_i" from 0 to 1 step 0 do {
	{
		_unit = _x;
		_isInArea = false;
		//-- check mrk
		{
			_x params ["_mrk", "_radius"];
			_isInArea = if (_radius isEqualTo -1) then [{
				_unit inArea _mrk
			}, {
				_unit distance (markerPos _mrk) <= _radius
			}];
			if (_isInArea) exitWith {};
		} forEach _arr_mrk;

		//-- check obj
		{
			if (_isInArea) exitWith {};
			_x params ["_className", "_radius"];
			_arrObj = nearestObjects [_unit, [_className], _radius];
			if (!(_arrObj isEqualTo [])) then {
				_isInArea = true;
			};
		} forEach _arr_obj;

		if (_isInArea) then {
			private _lvl_ra = _unit getVariable ["DA3F_taux_ra", 0];
			_lvl_ra = _lvl_ra + ceil random 5;
			if (_lvl_ra > 100) then {
				_lvl_ra = 100;
			};
			_unit setVariable ["DA3F_taux_ra", _lvl_ra, true];
			hint format [_txtDamage, _lvl_ra, "%"];
			
		};
	} forEach allunits;
	sleep _timeInterval; // temps entre chaque itération (passage de la boucle)
};