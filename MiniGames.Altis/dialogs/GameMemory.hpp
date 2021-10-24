class GameMemory {
	idd = 191021;
	onload = "[_this#0, getNumber(missionConfigFile >> ""Settings"" >> ""GameMemory"" >> ""level"")] call DA3F_fnc_onload_game_memory;";
	class controlsBackground {
		class DA3F_bgBtn : DA3F_BackG
		{
			idc = 1000;
			x = 0.375304 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.242828 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0.1,0.25,0.3,0.8};
		};
	};
	class controls {
		class DA3F_btn_13 : DA3F_btn
		{
			idc = 2412;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.381867 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.229702 * safezoneW;
			h = 0.028 * safezoneH;
			onbuttonclick = "closeDialog 0;";
		};
		class DA3F_btn_5 : DA3F_btn
		{
			idc = 2400;
			x = 0.381867 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackgroundFocused[] = {0.7,0.25,0,0};
			colorFocused[] = {1,0.55,0.1,0};
			colorBackground[] = {0.4,0.4,0.4,0.9};
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_6 : DA3F_btn_5
		{
			idc = 2401;
			x = 0.440934 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_7 : DA3F_btn_5
		{
			idc = 2402;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_8 : DA3F_btn_5
		{
			idc = 2403;
			x = 0.559066 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_9 : DA3F_btn_5
		{
			idc = 2404;
			x = 0.381867 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_10 : DA3F_btn_5
		{
			idc = 2405;
			x = 0.440934 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_11 : DA3F_btn_5
		{
			idc = 2406;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_12 : DA3F_btn_5
		{
			idc = 2407;
			x = 0.559066 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_4 : DA3F_btn_5
		{
			idc = 2408;
			x = 0.559066 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_1 : DA3F_btn_5
		{
			idc = 2409;
			x = 0.381867 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_2 : DA3F_btn_5
		{
			idc = 2410;
			x = 0.440934 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
		class DA3F_btn_3 : DA3F_btn_5
		{
			idc = 2411;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.0525034 * safezoneW;
			h = 0.07 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_game_memory";
		};
	};
};
