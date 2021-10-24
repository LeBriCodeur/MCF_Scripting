// Aroun
// fn_exemple_game_memory.sqf
disableSerialization;
private _allCtrl = uiNamespace getVariable ["DA3F_GameMemory_winarr", []];
private _ctrl = _allCtrl # 0;
private _display = ctrlParent _ctrl;
private _btnClose = _display displayCtrl 2412;
ctrlSetFocus _btnClose;
sleep 1;

{
	_colordefault = getArray(missionConfigFile >> "GameMemory" >> "controls" >> ctrlClassName _x >> "colorBackground");
	_x ctrlSetBackgroundColor [1, 0, 0, 1];
	sleep 0.5;
	_x ctrlSetBackgroundColor _colordefault;
} forEach _allCtrl;