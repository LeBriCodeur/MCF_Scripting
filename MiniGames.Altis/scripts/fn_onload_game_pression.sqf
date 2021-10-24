// Aroun
// fn_onload_game_pression.sqf
disableSerialization;
params["_display"];
mode_select = true;
value_add_pression = 0.1;
private _progressPower = _display displayCtrl 1800;
private _progressWin = _display displayCtrl 1801;

waitUntil {
	sleep 0.5;
	_progressPower progressSetPosition ((progressPosition _progressPower)- 0.03);
	_progressWin progressSetPosition ((progressPosition _progressWin)- 0.02);
	isnull _display
};