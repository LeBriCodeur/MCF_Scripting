class market {
    idd = 241021;
    onload = "_this call DA3F_fnc_onload_market;";
    class ControlsBackground {
		class DA3F_bg : DA3F_BackG
		{
			idc = 1000;
			x = 0.270298 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.459405 * safezoneW;
			h = 0.448 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class DA3F_image : DA3F_Pix
		{
			idc = 1200;
			text = "icons\logo_unreallife_ca.paa";
			// text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.276861 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.446279 * safezoneW;
			h = 0.42 * safezoneH;
		};
		class DA3F_grp : DA3F_Ctrl_Grp
		{
			idc = 2300;
			x = 0.506563 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.203451 * safezoneW;
			h = 0.28 * safezoneH;
			class Controls
			{
				class DA3F_txt_info : DA3F_StructuredText
				{
					idc = 1100;
					x = 0.00656282 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.190325 * safezoneW;
					h = 0.252 * safezoneH;
				};
			};
		};
		class DA3F_txt_info_player : DA3F_StructuredText
		{
			idc = 1101;
			text = "cash 0"; //--- ToDo: Localize;
			x = 0.513126 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.190325 * safezoneW;
			h = 0.042 * safezoneH;
		};
    };
    class Controls {
		class DA3F_list_items : DA3F_RscListBox
		{
			idc = 1500;
			x = 0.289986 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.15751 * safezoneW;
			h = 0.28 * safezoneH;
			onlbselchanged = "_this call DA3F_fnc_selchanged_market_list";
		};
		class DA3F_btn_valide : DA3F_Btn
		{
			idc = 2400;
			text = "Valider"; //--- ToDo: Localize;
			x = 0.289986 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.15751 * safezoneW;
			h = 0.028 * safezoneH;
			onbuttonclick = "_this call DA3F_fnc_btn_valide_market;";
		};
		class DA3F_Close : DA3F_Btn_Close
		{
			idc = 2401;
			text = "X"; //--- ToDo: Localize;
			x = 0.710013 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.0196888 * safezoneW;
			h = 0.028 * safezoneH;
		};
    };
};