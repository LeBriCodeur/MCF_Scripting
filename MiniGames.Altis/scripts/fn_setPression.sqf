// Aroun
// fn_setPression.sqf

disableSerialization;
params["_ctrl"];
private _display = ctrlParent _ctrl;
private _progressPower = _display displayCtrl 1800;
private _progressWin = _display displayCtrl 1801;
if (DA3F_action) exitWith {};
DA3F_action = true;

if (mode_select) then {
	_progressPower progressSetPosition ((progressPosition _progressPower) + 0.05)
} else {
	_progressWin progressSetPosition ((progressPosition _progressWin) + value_add_pression / 10)
};

value_add_pression = (progressPosition _progressPower);
if ((progressPosition _progressWin) == 1) exitWith {
	hint parseText "<t color='#00FF00' size='1.1' >Gagné</t>";
	DA3F_action = false;
	closeDialog 0;
};

sleep 0.3;
DA3F_action = false;