// Aroun
// fn_GameIndice_valide.sqf
disableSerialization;
params["_ctrl"];
private _display = ctrlParent _ctrl;
private _txtWin = ctrlText (_display displayCtrl 1400);
private _win = uiNamespace getVariable ["DA3F_indice", "_mdp"];

if (_txtWin == _win) then {
	hint parseText "<t color='#00FF00' size='1.1' >Gagné</t>";
} else {
	hint parseText "<t color='#FF0000' size='1.1' >Perdu</t>";
};