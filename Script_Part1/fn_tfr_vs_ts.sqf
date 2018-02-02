/*
*
*       Dev'Arma 3 France
*       Community FR
*       [DA3F] Aroun Le BriCodeur
*       fn_tfr_vs_ts.sqf
*       Bloque l'écran du joueur si il ne se trouve pas dans le canal ou le serveur du TFR
*       Black screen avec message
*           [] spawn life_fnc_tfr_vs_ts; // pour du life à la fin de core\init.sqf ça devrait faire le taf
*               et bien sur script en function.hpp
*
*/
    while {true} do {
    // Mets le nom du serveur TS (sereur virtuel tout en haut de TS)
        private _DA3F_nameServer = "DevArmA3France";
    // Mets le nom du canal utilisé par TFR sur le TS
        private _DA3F_nameChanel = "TaskForceRadio";
    // Messge quand le joueur a TFR désactivé
        private _DA3F_msgNoTfr   = "C'est mieux si Task Force est activé";
    // Messge quand le joueur quitte TS ou canal
        private _DA3F_msgQuitTfr = format["Tu ne dois pas quitter le canal : %1 ou le serveur : %2",_nameChannel,_DA3F_nameServer];
    // Messge quand le joueur est de retour
        private _DA3F_msgBack    = format["Bon jeu avec : %1",_DA3F_nameServer];

            /*!!! NO EDIT !!! */
        private _DA3F_server     = [] call TFAR_fnc_getTeamSpeakServerName;
        private _DA3F_channel    = [] call TFAR_fnc_getTeamSpeakChannelName;

        if(!([] call TFAR_fnc_isTeamSpeakPluginEnabled)) then {
            cutText[format["%1",_DA3F_msgNoTfr],"BLACK"];
            waitUntil {([] call TFAR_fnc_isTeamSpeakPluginEnabled)};
            cutText["","PLAIN"];
        };

        if (_DA3F_server != _DA3F_nameServer or _DA3F_channel != _nameChannel) then {
            cutText[_DA3F_msgQuitTfr,"BLACK"];
            private _pos = getPosATL player;
            private _tp_NoTfr = switch (worldName) do
            {
                case "Altis": {[8413.94,25111.6,0]}; case "Malden": {[1690.49,12245.7,0]}; case "Tanoa": {[1164.43,588.896,0]}; case "Stratis": {[7110.63,6019.93,0]};
            };
            player setPosATL _tp_NoTfr;
            waitUntil {([] call TFAR_fnc_getTeamSpeakServerName) == _DA3F_nameServer and ([] call TFAR_fnc_getTeamSpeakChannelName) == _nameChannel};
            cutText["","PLAIN"];
            player setPosATL _pos;
            titleText [format["%1",_DA3F_msgBack],"BLACK in",10];
        };
        sleep 5;
    };
