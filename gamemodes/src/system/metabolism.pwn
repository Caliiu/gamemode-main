/*
     ooo        ooooo               .              .o8                 oooo   o8o                             
     `88.       .888'             .o8             "888                 `888   `"'                             
      888b     d'888   .ooooo.  .o888oo  .oooo.    888oooo.   .ooooo.   888  oooo   .oooo.o ooo. .oo.  .oo.   
      8 Y88. .P  888  d88' `88b   888   `P  )88b   d88' `88b d88' `88b  888  `888  d88(  "8 `888P"Y88bP"Y88b  
      8  `888'   888  888ooo888   888    .oP"888   888   888 888   888  888   888  `"Y88b.   888   888   888  
      8    Y     888  888    .o   888 . d8(  888   888   888 888   888  888   888  o.  )88b  888   888   888  
     o8o        o888o `Y8bod8P'   "888" `Y888""8o  `Y8bod8P' `Y8bod8P' o888o o888o 8""888P' o888o o888o o888o 
                                                                                                                                                                                                                                                                                                                                      
*/

// Include
#include <YSI_Coding\y_hooks>

static PlayerText: s_ptdMetabolism[MAX_PLAYERS][10];

// Functions
hook OnPlayerConnect(playerid)
{
    s_ptdMetabolism[playerid][0] = CreatePlayerTextDraw(playerid, -7.000, -11.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, s_ptdMetabolism[playerid][0], 658.000, 463.000);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][0], 1);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][0], 269488383);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][0], 255);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][0], 1);

    s_ptdMetabolism[playerid][1] = CreatePlayerTextDraw(playerid, 224.000, 174.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdMetabolism[playerid][1], 159.000, 101.000);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][1], 1);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][1], -1962934017);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][1], 255);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][1], 1);

    s_ptdMetabolism[playerid][2] = CreatePlayerTextDraw(playerid, 231.000, 179.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdMetabolism[playerid][2], 146.000, 90.000);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][2], 1);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][2], 269488383);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][2], 255);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][2], 1);

    s_ptdMetabolism[playerid][3] = CreatePlayerTextDraw(playerid, 250.000, 188.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdMetabolism[playerid][3], 106.000, 72.000);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][3], 1);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][3], -1962934017);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][3], 255);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][3], 1);

    s_ptdMetabolism[playerid][4] = CreatePlayerTextDraw(playerid, 276.000, 202.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdMetabolism[playerid][4], 54.000, 42.000);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][4], 1);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][4], 269488383);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][4], 255);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][4], 1);

    s_ptdMetabolism[playerid][5] = CreatePlayerTextDraw(playerid, 293.000, 156.000, "/");
    PlayerTextDrawLetterSize(playerid, s_ptdMetabolism[playerid][5], 1.479, 11.900);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][5], 1);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][5], -1962934017);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][5], 150);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][5], 1);

    s_ptdMetabolism[playerid][6] = CreatePlayerTextDraw(playerid, 293.000, 156.000, "/");
    PlayerTextDrawLetterSize(playerid, s_ptdMetabolism[playerid][6], 1.449, 11.900);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][6], 1);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][6], -1962934017);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][6], 150);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][6], 1);

    s_ptdMetabolism[playerid][7] = CreatePlayerTextDraw(playerid, 237.000, 277.000, "SONOLENTO");
    PlayerTextDrawLetterSize(playerid, s_ptdMetabolism[playerid][7], 0.559, 3.099);
    PlayerTextDrawTextSize(playerid, s_ptdMetabolism[playerid][7], 12.000, 16.000);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][7], 1);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][7], 150);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][7], 1);

    s_ptdMetabolism[playerid][8] = CreatePlayerTextDraw(playerid, 304.000, 307.000, "Voce esta sonolento devido a falta de dormir");
    PlayerTextDrawLetterSize(playerid, s_ptdMetabolism[playerid][8], 0.200, 1.099);
    PlayerTextDrawTextSize(playerid, s_ptdMetabolism[playerid][8], 500.000, 500.000);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][8], 2);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][8], -1448498689);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][8], 150);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][8], 2);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][8], 1);

    s_ptdMetabolism[playerid][9] = CreatePlayerTextDraw(playerid, 302.000, 316.000, "Descanse imediatamente para recuperar as energias");
    PlayerTextDrawLetterSize(playerid, s_ptdMetabolism[playerid][9], 0.200, 1.099);
    PlayerTextDrawTextSize(playerid, s_ptdMetabolism[playerid][9], 500.000, 500.000);
    PlayerTextDrawAlignment(playerid, s_ptdMetabolism[playerid][9], 2);
    PlayerTextDrawColor(playerid, s_ptdMetabolism[playerid][9], -1448498689);
    PlayerTextDrawSetShadow(playerid, s_ptdMetabolism[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdMetabolism[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdMetabolism[playerid][9], 150);
    PlayerTextDrawFont(playerid, s_ptdMetabolism[playerid][9], 2);
    PlayerTextDrawSetProportional(playerid, s_ptdMetabolism[playerid][9], 1);

    return true;
}

Float:GetPlayerMetabolism(playerid)
{
    new keys, up, down;
    GetPlayerKeys(playerid, keys, up, down);
    
    if(keys & KEY_SPRINT || keys & KEY_JUMP) return 0.05;
    if(up != 0 || down != 0 || keys & KEY_HANDBRAKE) return 0.015;

    return 0.005;
}

Metabolism_Show(playerid)
{
	for (new i = 0; i < sizeof(s_ptdMetabolism[]); i++)
	{
		if (s_ptdMetabolism[playerid][i] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawShow(playerid, s_ptdMetabolism[playerid][i]);
		}
	}
}

Metabolism_Hide(playerid)
{
	for (new i = 0; i < sizeof(s_ptdMetabolism[]); i++)
	{
		if (s_ptdMetabolism[playerid][i] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawHide(playerid, s_ptdMetabolism[playerid][i]);
		}
	}
}

DoMicroSleep(playerid)
{
    if (!IsPlayerSpawned(playerid))
		return false;

    if (!IsPlayerLogged(playerid))
		return false;

    Metabolism_Show(playerid);
    PlayerPlaySound(playerid, 1131, 0.0, 0.0, 0.0); 

    SetTimerEx("EndMicroSleep", 1000, false, "i", playerid);
    
    if(IsPlayerInAnyVehicle(playerid)) 
    {
        new Float:vx, Float:vy, Float:vz;
        GetVehicleVelocity(GetPlayerVehicleID(playerid), vx, vy, vz);
        SetVehicleAngularVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.06); 
        SendClientMessage(playerid, -1, "Sono excessivo! Pare para dormir urgentemente.");
    }

    return true;
}

forward EndMicroSleep(playerid);
public EndMicroSleep(playerid)
{
    Metabolism_Hide(playerid);
}

// Tasks
ptask UpdateMetabolism[1000](playerid)
{
    foreach(new i : Player)
    {
        new Float:gasto = GetPlayerMetabolism(i);

        CharacterData[i][e_CHARACTER_HUNGER] -= gasto;
        CharacterData[i][e_CHARACTER_THIRST] -= (gasto * 1.2);

        if(IsPlayerInAnyVehicle(i)) 
            CharacterData[i][e_CHARACTER_SLEEP] -= 0.008; 
        else 
            CharacterData[i][e_CHARACTER_SLEEP] -= 0.004;

        if(CharacterData[i][e_CHARACTER_HUNGER] < 0.0) CharacterData[i][e_CHARACTER_HUNGER] = 0.0;
        if(CharacterData[i][e_CHARACTER_THIRST] < 0.0) CharacterData[i][e_CHARACTER_THIRST] = 0.0;
        if(CharacterData[i][e_CHARACTER_SLEEP] < 0.0) CharacterData[i][e_CHARACTER_SLEEP] = 0.0;

        if(CharacterData[i][e_CHARACTER_HUNGER] < 10.0) 
        {
            new keys, ud, lr;
            GetPlayerKeys(i, keys, ud, lr);

            if(keys & KEY_JUMP) { 
                ApplyAnimation(i, "PED", "IDLE_TIRED", 4.1, 0, 1, 1, 0, 0, 1);
                SendClientMessage(playerid, -1, "Você está com muita fome!");
            }
        }

        if(CharacterData[i][e_CHARACTER_THIRST] < 15.0) {
            if(GetPlayerDrunkLevel(i) < 2000) SetPlayerDrunkLevel(i, 3000);
        } else {
            if(GetPlayerDrunkLevel(i) > 2000) SetPlayerDrunkLevel(i, 0);
        }

        if(CharacterData[i][e_CHARACTER_SLEEP] < 5.0) 
        {
            if(random(100) < 15) {
                DoMicroSleep(i);
            }
        }
    }
    
    return true;
}