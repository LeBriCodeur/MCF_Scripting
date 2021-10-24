class GameIndice {
	idd= 2010212;
	onload = "_this call DA3F_fnc_onload_game_indice";
	class controlsBackground {
		class bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.303112 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.387213 * safezoneW;
			h = 0.224 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class Txt_indice: DA3F_StructuredText
		{
			idc = 1100;
			x = 0.303112 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.387213 * safezoneW;
			h = 0.042 * safezoneH;
		};
	};
	class controls {
		class RscEdit_1400: DA3F_Edit
		{
			idc = 1400;
			x = 0.447497 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.105007 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class DA3F_btnValide : DA3F_Btn
		{
			idc = 2400;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.447497 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.105007 * safezoneW;
			h = 0.028 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_GameIndice_valide";
		};
		class DA3F_btnclose : DA3F_Btn_Close
		{
			idc = 2401;
			text = "Fermer"; //--- ToDo: Localize;
			x = 0.447497 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.105007 * safezoneW;
			h = 0.028 * safezoneH;
			onbuttonclick = "closeDialog 0";
		};
	};
};
