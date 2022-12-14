// ADD ACE INTERACTION FOR CIVILIANS FOOD RATIONS

_action = 	["Give Food","Give Food","",
				{
					{
						_index = (items player) find _x;
						if (_index > -1) exitWith
						{
							player removeItem _x;
							_target additem _x;
							_count = (missionNameSpace getVariable "TOUR_mreCount") + 1;
							missionNameSpace setVariable ["TOUR_mreCount", _count, true];
						};
					}forEach 
					[	
						"ACE_MRE_BeefStew",
						"ACE_MRE_ChickenTikkaMasala",
						"ACE_MRE_ChickenHerbDumplings",
						"ACE_MRE_CreamChickenSoup",
						"ACE_MRE_CreamTomatoSoup",
						"ACE_MRE_LambCurry",
						"ACE_MRE_MeatballsPasta",
						"ACE_MRE_SteakVegetables"
					] ;
				},
				{
					(!isNil {missionNameSpace getVariable "TOUR_mreCount"})
					&&
					(_target distance (getMarkerPos "TOUR_mkr_tskMRE") < 200)
					&&
					(
						{_x in (items player)}count 
						[	
							"ACE_MRE_BeefStew",
							"ACE_MRE_ChickenTikkaMasala",
							"ACE_MRE_ChickenHerbDumplings",
							"ACE_MRE_CreamChickenSoup",
							"ACE_MRE_CreamTomatoSoup",
							"ACE_MRE_LambCurry",
							"ACE_MRE_MeatballsPasta",
							"ACE_MRE_SteakVegetables"
						] > 0
					)
					&&
					(
						{_x in (items _target)}count 
						[	
							"ACE_MRE_BeefStew",
							"ACE_MRE_ChickenTikkaMasala",
							"ACE_MRE_ChickenHerbDumplings",
							"ACE_MRE_CreamChickenSoup",
							"ACE_MRE_CreamTomatoSoup",
							"ACE_MRE_LambCurry",
							"ACE_MRE_MeatballsPasta",
							"ACE_MRE_SteakVegetables"
						] == 0
					)		
				}
			] call ace_interact_menu_fnc_createAction;


["UK3CB_TKC_C_CIV", 0, ["ACE_MainActions"], _action ]spawn ace_interact_menu_fnc_addActionToClass;

waitUntil {!isNil {missionNameSpace getVariable "TOUR_backpackRadioON"}};
waitUntil {!isNil {missionNameSpace getVariable "TOUR_backpackRadioBroadcast"}};
waitUntil {!isNil {missionNameSpace getVariable "TOUR_backpackRadioRequest"}};

// RADIO 1 ACTIONS

_actionMusicRadio1 = 	["Next Tune","Next Tune","",
				{
					[TOUR_Radio_1, "next"] execVM "scripts\general\music.sqf";
				},
				{
					!isNil {(TOUR_Radio_1 getVariable "TOUR_soundSource")}
				}
			] call ace_interact_menu_fnc_createAction;
			
[TOUR_Radio_1, 0, ["ACE_MainActions"], _actionMusicRadio1 ]spawn ace_interact_menu_fnc_addActionToObject;

_actionToggleRadio1 = 	["Turn On","Turn On","",
				{
					[TOUR_Radio_1, "on"] execVM "scripts\general\music.sqf";
				},
				{
					isNil {(TOUR_Radio_1 getVariable "TOUR_soundSource")}	
				}
			] call ace_interact_menu_fnc_createAction;
			
[TOUR_Radio_1, 0, ["ACE_MainActions"], _actionToggleRadio1 ]spawn ace_interact_menu_fnc_addActionToObject;

_actionToggleRadio1 = 	["Turn Off","Turn Off","",
				{
					[TOUR_Radio_1, "off"] execVM "scripts\general\music.sqf";
				},
				{
					!isNil {(TOUR_Radio_1 getVariable "TOUR_soundSource")}	
				}
			] call ace_interact_menu_fnc_createAction;
			
[TOUR_Radio_1, 0, ["ACE_MainActions"], _actionToggleRadio1 ]spawn ace_interact_menu_fnc_addActionToObject;

// RADIO 2 ACTIONS

_actionMusicRadio2 = 	["Next Tune","Next Tune","",
				{
					[TOUR_Radio_2, "next"] execVM "scripts\general\music.sqf";
				},
				{
					!isNil {(TOUR_Radio_2 getVariable "TOUR_soundSource")}
				}
			] call ace_interact_menu_fnc_createAction;
			
[TOUR_Radio_2, 0, ["ACE_MainActions"], _actionMusicRadio2 ]spawn ace_interact_menu_fnc_addActionToObject;

_actionMusicRadio2 = 	["Turn On","Turn On","",
				{
					[TOUR_Radio_2, "on"] execVM "scripts\general\music.sqf";
				},
				{
					isNil {(TOUR_Radio_2 getVariable "TOUR_soundSource")}	
				}
			] call ace_interact_menu_fnc_createAction;
			
[TOUR_Radio_2, 0, ["ACE_MainActions"], _actionMusicRadio2 ]spawn ace_interact_menu_fnc_addActionToObject;

_actionMusicRadio2 = 	["Turn Off","Turn Off","",
				{
					[TOUR_Radio_2, "off"] execVM "scripts\general\music.sqf";
				},
				{
					!isNil {(TOUR_Radio_2 getVariable "TOUR_soundSource")}	
				}
			] call ace_interact_menu_fnc_createAction;
			
[TOUR_Radio_2, 0, ["ACE_MainActions"], _actionMusicRadio2 ]spawn ace_interact_menu_fnc_addActionToObject;

// COMMUNICATION ACTIONS - ANSWER

_actionStaticRadioPickup = 	["Answer Radio","Answer Radio","",
				{
					TOUR_cmdRadio execVM "scripts\control\radioReply.sqf";
				},
				{
					(missionNameSpace getVariable "TOUR_tskRadioState" == "calling")		
				}
			] call ace_interact_menu_fnc_createAction;
			
[TOUR_cmdRadio, 0, ["ACE_MainActions"], _actionStaticRadioPickup ]spawn ace_interact_menu_fnc_addActionToObject;

_actionAnswerPersonalRadio = 	["Answer Radio","Answer Radio","",
				{
					player execVM "scripts\control\radioReply.sqf";
				},
				{
					(missionNameSpace getVariable "TOUR_backpackRadioON") && (missionNameSpace getVariable "TOUR_tskRadioState" == "calling")		
				}
			] call ace_interact_menu_fnc_createAction;
			
[player, 1, ["ACE_SelfActions", "ACRE_Interact"], _actionAnswerPersonalRadio ]spawn ace_interact_menu_fnc_addActionToObject;

// COMMUNICATION ACTIONS - ON

_actionAnswerPersonalRadio = 	["Turn On Radio","Turn On Radio","",
				{
					missionNameSpace setVariable ["TOUR_backpackRadioON", true, true];
				},
				{
					!(missionNameSpace getVariable "TOUR_backpackRadioON") && 
					(
						((toLower (backpack player)) in	["uk3cb_baf_b_bergen_mtp_radio_h_a","uk3cb_baf_b_bergen_mtp_radio_h_b","uk3cb_baf_b_bergen_mtp_radio_l_a","uk3cb_baf_b_bergen_mtp_radio_l_b"])
					)	
				}
			] call ace_interact_menu_fnc_createAction;
			
[player, 1, ["ACE_SelfActions", "ACRE_Interact"], _actionAnswerPersonalRadio ]spawn ace_interact_menu_fnc_addActionToObject;

// COMMUNICATION ACTIONS - OFF

_actionAnswerPersonalRadio = 	["Turn Off Radio","Turn Off Radio","",
				{
					missionNameSpace setVariable ["TOUR_backpackRadioON", false, true];
				},
				{
					(missionNameSpace getVariable "TOUR_backpackRadioON") && 
					(
						((toLower (backpack player)) in	["uk3cb_baf_b_bergen_mtp_radio_h_a","uk3cb_baf_b_bergen_mtp_radio_h_b","uk3cb_baf_b_bergen_mtp_radio_l_a","uk3cb_baf_b_bergen_mtp_radio_l_b"])
					)	
				}
			] call ace_interact_menu_fnc_createAction;
			
[player, 1, ["ACE_SelfActions", "ACRE_Interact"], _actionAnswerPersonalRadio ]spawn ace_interact_menu_fnc_addActionToObject;

// COMMUNICATION ACTIONS - INTERNAL

_actionAnswerPersonalRadio = 	["Internal Radio","Internal Radio","",
				{
					missionNameSpace setVariable ["TOUR_backpackRadioBroadcast", false, true];
				},
				{
					(missionNameSpace getVariable "TOUR_backpackRadioON") && (missionNameSpace getVariable "TOUR_backpackRadioBroadcast") && 
					(
						((toLower (backpack player)) in	["uk3cb_baf_b_bergen_mtp_radio_h_a","uk3cb_baf_b_bergen_mtp_radio_h_b","uk3cb_baf_b_bergen_mtp_radio_l_a","uk3cb_baf_b_bergen_mtp_radio_l_b"])
					)	
				}
			] call ace_interact_menu_fnc_createAction;
			
[player, 1, ["ACE_SelfActions", "ACRE_Interact"], _actionAnswerPersonalRadio ]spawn ace_interact_menu_fnc_addActionToObject;

// COMMUNICATION ACTIONS - BROADCAST

_actionAnswerPersonalRadio = 	["Broadcast Radio","Broadcast Radio","",
				{
					missionNameSpace setVariable ["TOUR_backpackRadioBroadcast", true, true];
				},
				{
					(missionNameSpace getVariable "TOUR_backpackRadioON") && !(missionNameSpace getVariable "TOUR_backpackRadioBroadcast") && 
					(
						((toLower (backpack player)) in	["uk3cb_baf_b_bergen_mtp_radio_h_a","uk3cb_baf_b_bergen_mtp_radio_h_b","uk3cb_baf_b_bergen_mtp_radio_l_a","uk3cb_baf_b_bergen_mtp_radio_l_b"])
					)	
				}
			] call ace_interact_menu_fnc_createAction;
			
[player, 1, ["ACE_SelfActions", "ACRE_Interact"], _actionAnswerPersonalRadio ]spawn ace_interact_menu_fnc_addActionToObject;

// COMMUNICATION ACTIONS - DEPLOY

TOUR_playerActions = 
{
	player addAction ["<t color=""#d16a02"">"+"Request Deployment", { missionNameSpace setVariable ["TOUR_backpackRadioRequest", true, true]; }, 0, 10, true, false, "", 
	" !(missionNameSpace getVariable 'TOUR_backpackRadioRequest') && 
		(
			(alive player) && (canMove TOUR_chopper_1) && (vehicle player == TOUR_chopper_1) && (TOUR_chopper_1 distance getMarkerPos ""respawn_west"" < 300)
		)
	"];
};

[]call TOUR_playerActions;

player addEventHandler ["Respawn" ,
{
	[]call TOUR_playerActions;
}];