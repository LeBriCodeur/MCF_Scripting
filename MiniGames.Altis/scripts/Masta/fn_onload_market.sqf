// Aroun
// fn_onload_market.sqf
#include "..\..\DA3F_macros.hpp"

disableSerialization;
params["_display"];
private _listbox = _display displayCtrl 1500;
private _txt_cash = _display displayCtrl 1101;
private _items_list = Cfg_sub("Cfg_market", "shop_1",getArray, "items");

{
	_x params ["_item", "_info", "_priceBuy", "_priceSell"];
	_listbox lbAdd _item;
	_listbox lbSetData [lbSize _listbox -1, str _x];
} forEach _items_list;

_txt_cash ctrlSetStructuredText parseText format["<t color='#ABABAB' align='left' >Cash : </t><t color='#FEFEFE' align='right' >%1</t>", DA3F_cash];

DA3F_fnc_selchanged_market_list = {
	disableSerialization;
	params["_list", "_index"];
	private _display = ctrlParent _list;
	private _txt_info = _display displayCtrl 1100;
	private _data = _list lbData _index;
	_data = call compile format ["%1", _data];
	_data params ["_nameColor", "_codeColor", "_buy", "_sell"];
	_txt_info ctrlSetStructuredText parseText format["<t color='#ABABAB' align='left' >Item choisi : </t><t color='%2' align='right'>%1</t><br/><t color='#ABABAB' align='left' >Prix achat : </t><t color='#FEFEFE' align='right' >%3</t><br/><t color='#ABABAB' align='left' >Prix vente : </t><t color='#FEFEFE' align='right' >%4</t>", _nameColor, _codeColor, _buy, _sell];
	[_txt_info]call DA3F_fnc_heightText;
};

DA3F_fnc_btn_valide_market = {
	disableSerialization;
	params["_ctrl"];
	private _display = ctrlParent _ctrl;
	private _list = _display displayCtrl 1500;
	private _txt_cash = _display displayCtrl 1101;

	private _index = lbCurSel _list;
	if (_index isEqualTo -1) exitWith {};
	private _data = _list lbData _index;
	_data = call compile format ["%1", _data];
	_data params ["_nameColor", "_codeColor", "_buy", "_sell"];
	DA3F_cash = DA3F_cash - _buy;
	private _inv = player getVariable ["DA3F_inv", []];
	private _idx = _inv findIf {
		_x params ["_item", "_nrb"];
		_item isEqualTo _nameColor
	};

	if (_idx isEqualTo -1) then {
		_inv pushBack [_nameColor, 1]
	} else {
		private _arr = _inv # _idx;
		private _val = (_arr # 1) + 1;
		_arr set [1, _val];
		_inv set [_idx, _arr];
	};
	player setVariable ["DA3F_inv", _inv];
	_txt_cash ctrlSetStructuredText parseText format["<t color='#ABABAB' align='left' >Cash : </t><t color='#FEFEFE' align='right' >%1</t>", DA3F_cash];
	hint format["inventaire : \n%1", _inv];
};