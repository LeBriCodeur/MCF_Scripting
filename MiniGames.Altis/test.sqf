//Init.sqfif ((!isServer) && (player != player)) then {waitUntil {player == player};};

titleText ["BURPER anomaly script-DEMO", "BLACK FADED", 0.5];

setViewDistance 2000;

[] execVM "briefing.sqf";

sleep 5;

null = ["my_first_burp",true,"MineDetector","B_AssaultPack_blk","C_IDAP_UGV_02_Demining_F"] execVM "AL_burpy\alias_burper.sqf";
//null = ["my_first_burp",true,"","",""] execVM "AL_burpy\alias_burper.sqf"; 

///