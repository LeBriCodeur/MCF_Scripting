// fn_demoMasta.sqf

params[
	["_rand1", -1], 
	["_rand2", -1]
];

hint format ["Je suis l'élément 0 : %1\nJe suis l'élément 1 : %2\nJe suis l'élément 0 : %3\nJe suis l'élément 1 : %4\n", _rand1, _rand2, _this # 0, _this # 1];

(position player) params ["_posx", "_posy", "_posz"];
private _posz = (position player) param [2];

player setPos [(position player) # 0, (position player) # 1, _posz];

