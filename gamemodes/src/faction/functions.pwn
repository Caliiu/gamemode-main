Faction_IsInDuty(playerid)
{
	if (!IsPlayerLogged(playerid))
		return false;

	if (!Faction_IsGovEmployee(playerid))
		return true;

	return false;
}

Faction_IsGovEmployee(playerid)
{
	if (!IsPlayerLogged(playerid) || !CharacterData[playerid][e_CHARACTER_ID] || CharacterData[playerid][e_CHARACTER_FACTION] == -1)
		return -1;

	new id = Character_GetFaction(playerid);

	if (id == -1) return -1;

	switch (FactionData[id][e_FACTION_TYPE])
	{
		case FACTION_TYPE_MEDIC, FACTION_TYPE_POLICE, FACTION_TYPE_GOV: return true;
	}

	return -1;
}

Faction_GetPlayerType(playerid)
{
	if (!IsPlayerLogged(playerid) || !CharacterData[playerid][e_CHARACTER_ID] || CharacterData[playerid][e_CHARACTER_FACTION] == -1)
		return -1;

	new id = Character_GetFaction(playerid);

	if (id == -1) return -1;

	return FactionData[id][e_FACTION_TYPE];
}

SendFactionMessage(factionid, color, const msg[], va_args<>)
{
	if (!(0 <= factionid < MAX_FACTIONS) || !FactionData[factionid][e_FACTION_EXISTS])
		return false;

	new out[144];
	va_format(out, sizeof out, msg, va_start<3>);

	foreach (new i : Player)
	{
		if (CharacterData[i][e_CHARACTER_FACTION] != FactionData[factionid][e_FACTION_ID])
			continue;

		SendClientMessage(i, color, out);
	}
	
	return true;
}

Faction_ShowSkins(playerid)
{
    new factionid = Character_GetFaction(playerid);
    if (factionid == -1) return 0;

    new 
        dialog[2048], 
        count = 0,
        skinID
    ;

    new title[64];
    format(title, sizeof(title), "Uniformes - %s", FactionData[factionid][e_FACTION_NAME]);

    for (new i = 0; i < MAX_FACTION_SKINS; i++)
    {
        skinID = FactionData[factionid][e_FACTION_SKINS][i];

        if (skinID == 0) continue;

        strcat(dialog, va_return("%i\t", skinID));

        // strcat(dialog, "Uniforme da Facção");

        /*strcat(
            dialog, 
            va_return(
                "~n~~n~~n~~y~Modelo ID: %d~n~~w~Slot: %d", 
                skinID,
                i
            )
        );*/

        strcat(dialog, "\n");
        count++;
    }

    if(count == 0) return SendErrorMessage(playerid, "Esta facção não possui skins configuradas.");

    Dialog_Show(playerid, Dialog_PegarSkin, DIALOG_STYLE_PREVMODEL, title, dialog, "Vestir", "Voltar");
    return 1;
}

Faction_ShowWeapons(playerid)
{
    new factionid = Character_GetFaction(playerid);
    if (factionid == -1) return 0;

    new 
        string[1024], 
        count = 0,
        weaponID, 
        ammo,
        weaponName[32]
    ;

    string = "Arma\tMunição\n";

    for(new i = 0; i < MAX_FACTION_WEAPONS; i++)
    {
        weaponID = FactionData[factionid][e_FACTION_WEAPONS][i];
        ammo = FactionData[factionid][e_FACTION_AMMO][i];

        if (weaponID == 0) continue;

        GetWeaponName(weaponID, weaponName, sizeof(weaponName));

        format(string, sizeof(string), "%s%s\t%d munições\n", string, weaponName, ammo);
        count++;
    }

    if(count == 0) return SendErrorMessage(playerid, "Esta facção não possui armas configuradas.");

    Dialog_Show(playerid, Dialog_PegarArma, DIALOG_STYLE_TABLIST_HEADERS, "Arsenal - Armas", string, "Pegar", "Voltar");
    return 1;
}

Faction_ShowArsenal(playerid, id)
{
    new factionid = Character_GetFaction(playerid);
    if (factionid == -1) return 0;

    new 
        string[2048],
        itemName[64],
        itemID,
        amount
    ;

    string = "Item\tQuantidade\n";
    strcat(string, "{FFFF00}>> GUARDAR ITEM NO ARMÁRIO <<\t \n");

    for(new i = 0; i < MAX_LOCKER_SLOTS; i++)
    {
        itemID = FactionLockerData[factionid][id][e_FACTION_LOCKER_ITEMS][i];
        amount = FactionLockerData[factionid][id][e_FACTION_LOCKER_AMOUNT][i];

        if(itemID == 0 || amount <= 0)
        {
            strcat(string, "{A9A9A9}(Vazio)\t-\n"); 
        }
        else
        { 
            format(itemName, sizeof(itemName), "%s", ItemData[itemID][e_ITEM_NAME]); 
            format(string, sizeof(string), "%s%s\t%d\n", string, itemName, amount);
        }
    }

    SetPVarInt(playerid, "CurrentArsenalID", id);
    Dialog_Show(playerid, Dialog_Arsenal, DIALOG_STYLE_TABLIST_HEADERS, "Arsenal da Facção", string, "Selecionar", "Fechar");
    return 1;
}

// Dialogs
Dialog:Dialog_PegarArma(playerid, response, listitem, inputtext[])
{                                        
    if (!response) return callcmd::armario(playerid); 

    new factionid = Character_GetFaction(playerid);
    
    new count = 0;
    new selectedWeapon = 0;
    new selectedAmmo = 0;

    for (new i = 0; i < MAX_FACTION_WEAPONS; i++)
    {
        if (FactionData[factionid][e_FACTION_WEAPONS][i] == 0) continue;

        if (count == listitem)
        {
            selectedWeapon = FactionData[factionid][e_FACTION_WEAPONS][i];
            selectedAmmo   = FactionData[factionid][e_FACTION_AMMO][i];
            break;
        }
        count++;
    }

    if (selectedWeapon != 0)
    {
        GivePlayerWeapon(playerid, selectedWeapon, selectedAmmo);

        new wName[32];
        GetWeaponName(selectedWeapon, wName, sizeof(wName));
        
        SendServerMessage(playerid, "Você equipou uma %s com %d balas.", wName, selectedAmmo);
        
        PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0); 
        Faction_ShowWeapons(playerid);
    }
    return 1;
}

Dialog:Dialog_PegarSkin(playerid, response, listitem, inputtext[])
{
    if (!response) return callcmd::armario(playerid); 

    new factionid = Character_GetFaction(playerid);

    new count = 0;
    new selectedSkin = 0;

    for (new i = 0; i < MAX_FACTION_SKINS; i++)
    {
        if (FactionData[factionid][e_FACTION_SKINS][i] == 0) continue;

        if (count == listitem)
        {
            selectedSkin = FactionData[factionid][e_FACTION_SKINS][i];
            break;
        }
        count++;
    }

    if (selectedSkin != 0)
    {
        SetPlayerSkin(playerid, selectedSkin);
        // CharacterData[playerid][e_CHARACTER_DUTY_SKIN] = selectedSkin;
        PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
    }
    return 1;
}

Dialog:Dialog_Armario(playerid, response, listitem, inputtext[])
{
    if (!response) return 1;

    new factionid = Character_GetFaction(playerid);
    new fType = FactionData[factionid][e_FACTION_TYPE];

    if (fType != FACTION_TYPE_CRIMINAL)
    {
        switch(listitem)
        {
			case 0:
			{
				CharacterData[playerid][e_CHARACTER_FACTION_DUTY] = !CharacterData[playerid][e_CHARACTER_FACTION_DUTY];

				if (CharacterData[playerid][e_CHARACTER_FACTION_DUTY])
				{
					SetPlayerArmour(playerid, 100.0);
					SetPlayerColor(playerid, FactionData[factionid][e_FACTION_COLOR]);

					SendNearbyMessage(playerid, COLOR_PURPLE, 30.0, "* %s bateu o ponto e entrou em serviço.", Character_GetName(playerid));
				}
				else
				{
					SetPlayerArmour(playerid, 0.0); 
					SetPlayerColor(playerid, -1); 
					SetPlayerSkin(playerid, CharacterData[playerid][e_CHARACTER_SKIN]);

					SendNearbyMessage(playerid, COLOR_PURPLE, 30.0, "* %s bateu o ponto e está fora de serviço.", Character_GetName(playerid));
				}
			}
            case 1:
            {
                SetPlayerHealth(playerid, 100.0);
                PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
            }
            case 2: 
            {
				Faction_ShowSkins(playerid);
            }
            case 3: 
            {
                Faction_ShowWeapons(playerid);
            }
        }
    }
    else 
    {
        switch(listitem)
        {
            case 0: // Mudar Skin
            {
                Faction_ShowSkins(playerid);
            }
            case 1: // Pegar Armas
            {
                Faction_ShowWeapons(playerid);
            }
        }
    }
    return 1;
}