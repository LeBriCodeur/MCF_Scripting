// Aroun
// fn_onload_game_memory.sqf
disableSerialization;
params["_display", ["_level", "medium", ["", 0]]];

private _allCtrl =  allControls _display - [_display displayCtrl 2412, _display displayCtrl 1000];
private _colordefault = [];
private _arrayCtrl = [];
winCtrl = [];
_level = if (_level < 3) then {3} else {_level};
_allCtrl = _allCtrl call BIS_fnc_arrayShuffle;

_difficulty = switch (_level) do {
	case "easy": { 3 };
	case "medium": { 5 };
	case "hard": { 10 };
	default { _level };
};

_allCtrl resize _difficulty;

uiNamespace setVariable ["DA3F_GameMemory_difficulty", _difficulty];
uiNamespace setVariable ["DA3F_GameMemory_winarr", _allCtrl];

[]spawn DA3F_fnc_exemple_game_memory;
[_display]spawn {
	params["_display"];
	disableSerialization;
	waitUntil{  sleep 0.03; isnull _display };
	winCtrl = nil;
};