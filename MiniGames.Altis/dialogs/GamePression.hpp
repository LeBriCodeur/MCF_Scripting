class GamePression {
	idd = 201021;
	onload = "_this spawn DA3F_fnc_onload_game_pression";
	class controlsBackground {
		class DA3F_bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.303112 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.387213 * safezoneW;
			h = 0.476 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class DA3F_Progress_power : DA3F_Progress
		{
			idc = 1800;
			style = ST_VERTICAL;
			x = 0.605007 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0262517 * safezoneW;
			h = 0.42 * safezoneH;
		};
		class DA3F_Progress_win : DA3F_Progress
		{
			idc = 1801;
			style = ST_VERTICAL;
			x = 0.650947 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0262517 * safezoneW;
			h = 0.42 * safezoneH;
		};
		class Move_cursor : DA3F_pix
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.335927 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.236265 * safezoneW;
			h = 0.224 * safezoneH;
		};
	};
	class controls {
		class Move_cursor : DA3F_Ctrl_Grp
		{
			idc = 1500;
			text = "";
			x = 0.335927 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.236265 * safezoneW;
			h = 0.224 * safezoneH;
			onMouseMoving = "_this spawn DA3F_fnc_setPression;";
		};
		class Btn_switch : DA3F_Btn
		{
			idc = 2400;
			text = "Switch"; //--- ToDo: Localize;
			x = 0.335927 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.236265 * safezoneW;
			h = 0.028 * safezoneH;
			onbuttonclick = "mode_select = if (mode_select) then {false} else {true};";
		};
		class Btn_close : DA3F_Btn
		{
			idc = 2401;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.335927 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.236265 * safezoneW;
			h = 0.028 * safezoneH;
			onbuttonclick = "closeDialog 0";
		};
	};
};