// Aroun
// fn_btn_game_memory.sqf
disableSerialization;
params["_ctrl"];
private _difficulty = uiNamespace getVariable ["DA3F_GameMemory_difficulty", 0];
private _allCtrl = uiNamespace getVariable ["DA3F_GameMemory_winarr", []];

winCtrl pushBack _ctrl;
if (count winCtrl isEqualTo _difficulty) then {
	if (winCtrl isEqualTo _allCtrl) then {
		hint parseText "<t color='#00FF00' size='1.1' >Gagné</t>";
	} else {
		hint parseText "<t color='#FF0000' size='1.1' >Perdu</t>";
		[]spawn DA3F_fnc_exemple_game_memory;
	};
		winCtrl = [];
};