/*
*
*    File: init.sqf
*    ==============
*    Author: Aroun Le BriCodeur
*    ==========================
*    Description: * * * *
*
*/


DA3F_fnc_SoluceExo_1 = {
	waitUntil {!(isNull player)};
	sleep 1;
	hintc "Alors jeune codeur en herbe on veut la solution. \n:D oO -O oO\nOn est partie";
	sleep 3.5;
	hintc "L'exercice consistait à faire TP le joueur quand il arrive dans une zone et lui mettre un message avant le TP";
	sleep 3.5;
	hintc "La 1ere chose consiste à récupérer la position et le radius autour de cette zone dans le quel sera actif le TP si le joueur y rentre \net\nla position de destination (ici je récupère la position du joueur au lancement)\n\nprivate _pos = [1668.36,5500.08,0];\nprivate _radius = 3;\nprivate _destination = getPosWorld player;";
	sleep 3.5;
	private _pos = [1668.36,5500.08,0];
	private _radius = 3;
	private _destination = getPosWorld player;
	hint "Maintenant on va attendre que notre joueur arrive dans la zone. (Marche vers la zone blanche au sol)";
	waitUntil {sleep 0.03; ((position player) distance _pos) <= _radius};
	hintc "Le joueur est dans la zone.\n2 possibilités s'offre à nous pour attendre 5 sec.\nUne qui nous permet de voir un décompte et une ou l'on met un simple message.";
	private _time = time + 5; // ici on récupère le temps du jeu et on ajoute 5 sec au temps du jeu donc on prend de l'avance sur le temps du jeu.
	// en dessous le but est d'attendre que le temps du jeu arrive à notre temps que que nous avons décidé.

	/*
		en gros si il est
		12:00:00
		on vient stocker dans une variable '_time' ce temps et ajouter 5sec
		ce qui donne :
		12:00:05
		donc quand l'heure du jeu arrive à :
		12:00:05
		la condition est complète on peut continuer
	*/

	waitUntil {sleep 0.03; hintSilent format ["Tp dans :\n%1", [_time - time]call bis_fnc_timeToString]; time >= _time};
	hintc "ceci est donc la 1ere possibilité\nprivate _time = time + 5;\n
	waitUntil {hintSilent format [""Tp dans :\n%1"", [_time - time]call bis_fnc_timeToString]; time >= _time};\n\n bis_fnc_timeToString permet de sortir un format d'heure pour l'affichage du décompte";
	player setPosWorld _destination;
	sleep 4;
	hint "Maintenant retourne dans la zone. (Marche vers la zone blanche au sol)";
	waitUntil {sleep 0.03; ((position player) distance _pos) <= _radius};
	hint "Tp dans 5 secondes...";
	sleep 5;
	player setPosWorld _destination;
	hintc "la 2eme possibilité est donc celle qui vient de ce produire\n\nsleep 5;\n
	player setPosWorld _destination;";
	sleep 4;
	hint "Et voilà tu sais comment TP un joueur quand il arrive dans une zone.";
};

DA3F_fnc_Exo1 = {
	private _pos = [1668.36,5500.08,0];
	private _radius = 3;
	private _destination = getPosWorld player;
	waitUntil {sleep 0.03; ((position player) distance _pos) <= _radius};
	private _time = time + 5;
	waitUntil {sleep 0.03; hintSilent format ["Tp dans :\n%1", [_time - time]call bis_fnc_timeToString]; time >= _time};
	player setPosWorld _destination;
};

0 spawn DA3F_fnc_SoluceExo_1;
