// Aroun
// fn_onload_game_indice.sqf
disableSerialization;
params["_display"];
private _txtIndice = _display displayCtrl 1100;
private _chars = ["a","b","c","d","e","f","1","2","3","0"];
private _mdp = "";

_chars = _chars call BIS_fnc_arrayShuffle;
_chars resize 3;
_mdp = toUpper (_chars joinString "");
_chars = _chars call BIS_fnc_arrayShuffle;
uiNamespace setVariable ["DA3F_indice", _mdp];
systemChat _mdp;
_txtIndice ctrlSetStructuredText parseText format["<t color='#ABABAB' size='1.2' align='left' >Indice : </t><t color='#ABABAB' size='1.2' align='center' >%1</t>", toUpper (_chars joinString "")];
