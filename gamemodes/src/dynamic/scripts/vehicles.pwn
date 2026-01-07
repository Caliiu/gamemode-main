/*
	oooooo     oooo           oooo         o8o            oooo
	 `888.     .8'            `888         `"'            `888
	  `888.   .8'    .ooooo.   888 .oo.   oooo   .ooooo.   888   .ooooo.   .oooo.o
	   `888. .8'    d88' `88b  888P"Y88b  `888  d88' `"Y8  888  d88' `88b d88(  "8
	    `888.8'     888ooo888  888   888   888  888        888  888ooo888 `"Y88b.
	     `888'      888    .o  888   888   888  888   .o8  888  888    .o o.  )88b
	      `8'       `Y8bod8P' o888o o888o o888o `Y8bod8P' o888o `Y8bod8P' 8""888P'
	
*/

// Include
#include <YSI_Coding\y_hooks>

// Callbacks
hook OnVehicleSpawn(vehicleid)
{
	if (!IsValidVehicle(vehicleid))
		return false;

	// Non-private vehicle
	if (VehicleData[vehicleid][e_VEHICLE_TYPE] != VEHICLE_TYPE_PRIVATE)
	{
		VehicleData[vehicleid][e_VEHICLE_HEALTH] = GetVehicleMaxHealth(vehicleid);
		VehicleData[vehicleid][e_VEHICLE_FUEL] = GetVehicleMaxFuel(vehicleid);
		VehicleData[vehicleid][e_VEHICLE_ENGINE_LIFE] = GetVehicleMaxEngineLife(vehicleid);
		VehicleData[vehicleid][e_VEHICLE_BATTERY_LIFE] = GetVehicleMaxBatteryLife(vehicleid);
		VehicleData[vehicleid][e_VEHICLE_MILEAGE] = 0.0;

		VehicleData[vehicleid][e_VEHICLE_DAMAGE_PANELS] =
		VehicleData[vehicleid][e_VEHICLE_DAMAGE_DOORS] =
		VehicleData[vehicleid][e_VEHICLE_DAMAGE_LIGHTS] = 
		VehicleData[vehicleid][e_VEHICLE_DAMAGE_TIRES] = 0;
	}

	SetVehicleNumberPlate(vehicleid, VehicleData[vehicleid][e_VEHICLE_PLATE]);
	SetVehicleVirtualWorld(vehicleid, VehicleData[vehicleid][e_VEHICLE_WORLD]);
	LinkVehicleToInterior(vehicleid, VehicleData[vehicleid][e_VEHICLE_INTERIOR]);
	SetVehiclePos(vehicleid, VehicleData[vehicleid][e_VEHICLE_POS][0], VehicleData[vehicleid][e_VEHICLE_POS][1], VehicleData[vehicleid][e_VEHICLE_POS][2] + 0.5);
	SetVehicleZAngle(vehicleid, VehicleData[vehicleid][e_VEHICLE_POS][3]);
	UpdateVehicleDamageStatus(vehicleid, VehicleData[vehicleid][e_VEHICLE_DAMAGE_PANELS], VehicleData[vehicleid][e_VEHICLE_DAMAGE_DOORS], VehicleData[vehicleid][e_VEHICLE_DAMAGE_LIGHTS], VehicleData[vehicleid][e_VEHICLE_DAMAGE_TIRES]);
	SetVehicleHealth(vehicleid, VehicleData[vehicleid][e_VEHICLE_HEALTH]);
	ChangeVehicleColor(vehicleid, VehicleData[vehicleid][e_VEHICLE_COLOR1], VehicleData[vehicleid][e_VEHICLE_COLOR2]);
	ChangeVehiclePaintjob(vehicleid, VehicleData[vehicleid][e_VEHICLE_PAINTJOB]);

	/*for (new i = 0; i < CARMODTYPE_MAX; i++) 
	{
		AddVehicleComponent(vehicleid, VehicleData[vehicleid][e_VEHICLE_CARMODS]);
	}*/

	return true;
}

// Funções
Vehicle_Load(id = -1)
{
    inline Vehicle_OnLoaded()
    {
        new rows = cache_num_rows();
        if (!rows) return false;

        new 
            idx, model, 
            Float:posX, Float:posY, Float:posZ, Float:posA, 
            color1, color2;

        for (new i = 0; i < rows; i++)
        {
            // 1. Pegamos os dados ESSENCIAIS antes de criar o carro
            cache_get_value_name_int(i, "Modelo", model);
            cache_get_value_name_float(i, "PosX", posX);
            cache_get_value_name_float(i, "PosY", posY);
            cache_get_value_name_float(i, "PosZ", posZ);
            cache_get_value_name_float(i, "Angle", posA);
            cache_get_value_name_int(i, "Cor1", color1);
            cache_get_value_name_int(i, "Cor2", color2);

            // 2. Criamos o veículo JÁ na posição e rotação correta
            idx = CreateVehicle(model, posX, posY, posZ, posA, color1, color2, 60 * 60);

            if (IsValidVehicle(idx))
            {
                VehicleData[idx][e_VEHICLE_EXISTS] = true;
                
                // Salvamos na memória o que já usamos
                VehicleData[idx][e_VEHICLE_MODEL] = model;
                VehicleData[idx][e_VEHICLE_POS][0] = posX;
                VehicleData[idx][e_VEHICLE_POS][1] = posY;
                VehicleData[idx][e_VEHICLE_POS][2] = posZ;
                VehicleData[idx][e_VEHICLE_POS][3] = posA;
                VehicleData[idx][e_VEHICLE_COLOR1] = color1;
                VehicleData[idx][e_VEHICLE_COLOR2] = color2;

                // 3. Carregamos o resto dos dados
                cache_get_value_name_int(i, "ID", VehicleData[idx][e_VEHICLE_ID]);
                cache_get_value_name(i, "Nome", VehicleData[idx][e_VEHICLE_NAME], 32);
                cache_get_value_name(i, "Placa", VehicleData[idx][e_VEHICLE_PLATE], 16);
                cache_get_value_name_int(i, "Dono", VehicleData[idx][e_VEHICLE_OWNER]);
                cache_get_value_name_int(i, "Tipo", VehicleData[idx][e_VEHICLE_TYPE]);
                cache_get_value_name_int(i, "World", VehicleData[idx][e_VEHICLE_WORLD]);
                cache_get_value_name_int(i, "Interior", VehicleData[idx][e_VEHICLE_INTERIOR]);
                cache_get_value_name_int(i, "Paintjob", VehicleData[idx][e_VEHICLE_PAINTJOB]);
                cache_get_value_name_float(i, "Vida", VehicleData[idx][e_VEHICLE_HEALTH]);
                cache_get_value_name_float(i, "Quilômetros", VehicleData[idx][e_VEHICLE_MILEAGE]);
                cache_get_value_name_float(i, "VidaMotor", VehicleData[idx][e_VEHICLE_ENGINE_LIFE]);
                cache_get_value_name_float(i, "VidaBateria", VehicleData[idx][e_VEHICLE_BATTERY_LIFE]);
                cache_get_value_name_float(i, "Combustível", VehicleData[idx][e_VEHICLE_FUEL]);
                cache_get_value_name_int(i, "DamagePanels", VehicleData[idx][e_VEHICLE_DAMAGE_PANELS]);
                cache_get_value_name_int(i, "DamageDoors", VehicleData[idx][e_VEHICLE_DAMAGE_DOORS]);
                cache_get_value_name_int(i, "DamageLights", VehicleData[idx][e_VEHICLE_DAMAGE_LIGHTS]);
                cache_get_value_name_int(i, "DamageTires", VehicleData[idx][e_VEHICLE_DAMAGE_TIRES]);
                cache_get_value_name_int(i, "Seguro", VehicleData[idx][e_VEHICLE_INSURANCE]);
                cache_get_value_name_int(i, "Alarme", VehicleData[idx][e_VEHICLE_ALARM]);
                cache_get_value_name_int(i, "Imobilizador", VehicleData[idx][e_VEHICLE_IMMOB]);
                cache_get_value_name_int(i, "Trava", VehicleData[idx][e_VEHICLE_LOCK]);
                cache_get_value_name_int(i, "Localizador", VehicleData[idx][e_VEHICLE_TRACKER]);

				/*new carMods[CARMODTYPE_MAX], carModOut[64];
				cache_get_value_name(i, "Modificações", carModOut);
				sscanf(carModOut, "p<|>A<i>(0, 0)["#CARMODTYPE_MAX"]", carMods);
				VehicleData[idx][e_VEHICLE_CARMODS] = carMods;*/
                
                // Força o mundo virtual e interior corretos
                SetVehicleVirtualWorld(idx, VehicleData[idx][e_VEHICLE_WORLD]);
                LinkVehicleToInterior(idx, VehicleData[idx][e_VEHICLE_INTERIOR]);
            }
        }
    }

    if (id == -1)
        MySQL_TQueryInline(MYSQL_CUR_HANDLE, using inline Vehicle_OnLoaded, "SELECT * FROM `Veículos` WHERE `Tipo` != %i LIMIT %i;", VEHICLE_TYPE_PRIVATE, MAX_VEHICLES);
    else
        MySQL_TQueryInline(MYSQL_CUR_HANDLE, using inline Vehicle_OnLoaded, "SELECT * FROM `Veículos` WHERE `ID` = %i AND `Tipo` = %i LIMIT 1;", id, VEHICLE_TYPE_PRIVATE);

    return true;
}

Vehicle_Save(id)
{
	if (!IsValidVehicle(id) || !(1 <= id < MAX_VEHICLES) || !VehicleData[id][e_VEHICLE_EXISTS] || VehicleData[id][e_VEHICLE_ID] == -1 || VehicleData[id][e_VEHICLE_TYPE] == VEHICLE_TYPE_TEMP)
		return false;

	inline Vehicle_OnSaved() {}

	// Vehicle Damage
	GetVehicleDamageStatus(id, VehicleData[id][e_VEHICLE_DAMAGE_PANELS], VehicleData[id][e_VEHICLE_DAMAGE_DOORS], VehicleData[id][e_VEHICLE_DAMAGE_LIGHTS], VehicleData[id][e_VEHICLE_DAMAGE_TIRES]);

	// Vehicle Mods
	new carModOut[64];

	/*for (new i = 0; i < CARMODTYPE_MAX; i++)
	{
		new mod = GetVehicleComponentInSlot(id, i);
		VehicleData[id][e_VEHICLE_CARMODS][i] = mod;
		strcat(carModOut, va_return("%s%i", (i > 0 ? ("|") : ("")), mod));
	}*/

	MySQL_TQueryInline(
		MYSQL_CUR_HANDLE,
		using inline Vehicle_OnSaved,
		"UPDATE IGNORE `Veículos` SET \
		`Nome`='%e',\
		`Placa`='%e',\
		`Dono`=%i,\
		`Tipo`=%i,\
		`Modelo`=%i,\
		`PosX`='%f',\
		`PosY`='%f',\
		`PosZ`='%f',\
		`Angle`='%f',\
		`World`=%i,\
		`Interior`=%i,\
		`Cor1`=%i,\
		`Cor2`=%i,\
		`Paintjob`=%i,\
		`Vida`='%f',\
		`Quilômetros`='%f',\
		`VidaMotor`='%f',\
		`VidaBateria`='%f',\
		`Combustível`='%f',\
		`DamageDoors`=%i,\
		`DamagePanels`=%i,\
		`DamageLights`=%i,\
		`DamageTires`=%i,\
		`Seguro`=%i,\
		`Alarme`=%i,\
		`Imobilizador`=%i,\
		`Trava`=%i,\
		`Localizador`=%i,\
		`Modificações`='%s' \
		WHERE `ID` = %i;",
		VehicleData[id][e_VEHICLE_NAME],
		VehicleData[id][e_VEHICLE_PLATE],
		VehicleData[id][e_VEHICLE_OWNER],
		VehicleData[id][e_VEHICLE_TYPE],
		VehicleData[id][e_VEHICLE_MODEL],
		VehicleData[id][e_VEHICLE_POS][0],
		VehicleData[id][e_VEHICLE_POS][1],
		VehicleData[id][e_VEHICLE_POS][2],
		VehicleData[id][e_VEHICLE_POS][3],
		VehicleData[id][e_VEHICLE_WORLD],
		VehicleData[id][e_VEHICLE_INTERIOR],
		VehicleData[id][e_VEHICLE_COLOR1],
		VehicleData[id][e_VEHICLE_COLOR2],
		VehicleData[id][e_VEHICLE_PAINTJOB],
		VehicleData[id][e_VEHICLE_HEALTH],
		VehicleData[id][e_VEHICLE_MILEAGE],
		VehicleData[id][e_VEHICLE_ENGINE_LIFE],
		VehicleData[id][e_VEHICLE_BATTERY_LIFE],
		VehicleData[id][e_VEHICLE_FUEL],
		VehicleData[id][e_VEHICLE_DAMAGE_DOORS],
		VehicleData[id][e_VEHICLE_DAMAGE_PANELS],
		VehicleData[id][e_VEHICLE_DAMAGE_LIGHTS],
		VehicleData[id][e_VEHICLE_DAMAGE_TIRES],
		VehicleData[id][e_VEHICLE_INSURANCE],
		VehicleData[id][e_VEHICLE_ALARM],
		VehicleData[id][e_VEHICLE_IMMOB],
		VehicleData[id][e_VEHICLE_LOCK],
		VehicleData[id][e_VEHICLE_TRACKER],
		carModOut,
		VehicleData[id][e_VEHICLE_ID]
	);

	return true;
}

Vehicle_Spawn(vehicleid)
{
    if (!IsValidVehicle(vehicleid) || !VehicleData[vehicleid][e_VEHICLE_EXISTS]) 
        return 0;

    RepairVehicle(vehicleid);

    SetVehiclePos(vehicleid, VehicleData[vehicleid][e_VEHICLE_POS][0], VehicleData[vehicleid][e_VEHICLE_POS][1], VehicleData[vehicleid][e_VEHICLE_POS][2]);
    SetVehicleZAngle(vehicleid, VehicleData[vehicleid][e_VEHICLE_POS][3]);

    SetVehicleVirtualWorld(vehicleid, VehicleData[vehicleid][e_VEHICLE_WORLD]);
    LinkVehicleToInterior(vehicleid, VehicleData[vehicleid][e_VEHICLE_INTERIOR]);

    ChangeVehicleColor(vehicleid, VehicleData[vehicleid][e_VEHICLE_COLOR1], VehicleData[vehicleid][e_VEHICLE_COLOR2]);

    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, 0, 0, alarm, VehicleData[vehicleid][e_VEHICLE_LOCK], bonnet, boot, objective);
    
    SetVehicleHealth(vehicleid, VehicleData[vehicleid][e_VEHICLE_HEALTH]);

    return 1;
}

Vehicle_Create(playerid, type, model, color1, color2)
{
	new idx = CreateVehicle(model, 0.0, 0.0, 0.0, 0.0, color1, color2, 60 * 60);

	if (IsValidVehicle(idx))
	{
		VehicleData[idx] = VehicleData[0];

		VehicleData[idx][e_VEHICLE_ID] = -1;
		VehicleData[idx][e_VEHICLE_EXISTS] = true;
		VehicleData[idx][e_VEHICLE_MODEL] = model;
		VehicleData[idx][e_VEHICLE_TYPE] = type;
		VehicleData[idx][e_VEHICLE_OWNER] = -1;
		VehicleData[idx][e_VEHICLE_COLOR1] = color1;
		VehicleData[idx][e_VEHICLE_COLOR2] = color2;

		VehicleData[idx][e_VEHICLE_HEALTH] = GetVehicleMaxHealth(idx);
		VehicleData[idx][e_VEHICLE_FUEL] = GetVehicleMaxFuel(idx);
		VehicleData[idx][e_VEHICLE_ENGINE_LIFE] = GetVehicleMaxEngineLife(idx);
		VehicleData[idx][e_VEHICLE_BATTERY_LIFE] = GetVehicleMaxBatteryLife(idx);

		GetPlayerPos(playerid, VehicleData[idx][e_VEHICLE_POS][0], VehicleData[idx][e_VEHICLE_POS][1], VehicleData[idx][e_VEHICLE_POS][2]);
		GetPlayerFacingAngle(playerid, VehicleData[idx][e_VEHICLE_POS][3]);
		VehicleData[idx][e_VEHICLE_WORLD] = GetPlayerVirtualWorld(playerid);
		VehicleData[idx][e_VEHICLE_INTERIOR] = GetPlayerInterior(playerid);

		format (VehicleData[idx][e_VEHICLE_PLATE], 16, "");
		format (VehicleData[idx][e_VEHICLE_NAME], 32, Unpack(Model_Name(model)));

		if (type != VEHICLE_TYPE_TEMP)
		{
			inline Vehicle_OnCreated()
			{
				if (cache_affected_rows())
				{
					VehicleData[idx][e_VEHICLE_ID] = cache_insert_id();
					Vehicle_Save(idx);
				}
			}

			MySQL_TQueryInline(MYSQL_CUR_HANDLE, using inline Vehicle_OnCreated, "INSERT IGNORE INTO `Veículos` (`Nome`, `Tipo`, `Modelo`, `Cor1`, `Cor2`) VALUES ('%e', %i, %i, %i, %i);", Unpack(Model_Name(model)), type, model, color1, color2);
		}

		SetVehicleToRespawn(idx);
	}

	return idx;
}

Vehicle_Destroy(id)
{
	if (!IsValidVehicle(id) || !(1 <= id < MAX_VEHICLES) || !VehicleData[id][e_VEHICLE_EXISTS])
		return false;

	if (VehicleData[id][e_VEHICLE_TYPE] != VEHICLE_TYPE_TEMP)
	{
		inline Vehicle_OnDestroyed() {}

		MySQL_TQueryInline(MYSQL_CUR_HANDLE, using inline Vehicle_OnDestroyed, "DELETE IGNORE FROM `Veículos` WHERE `ID` = %i LIMIT 1;", VehicleData[id][e_VEHICLE_ID]);
	}

	DestroyVehicle(id);
	VehicleData[id] = VehicleData[0];
	return true;
}

Vehicle_Nearest(playerid, Float:radius=3.0)
{
	new idx = -1, Float:x, Float:y, Float:z;

	for (new i = 1, j = GetVehiclePoolSize() + 1; i < j; i++)
	{
		if (!IsValidVehicle(i) || !VehicleData[i][e_VEHICLE_EXISTS]) 
			continue;

		if (GetPlayerVirtualWorld(playerid) != GetVehicleVirtualWorld(i))
			continue;

		GetVehiclePos(i, x, y, z);

		if (GetPlayerDistanceFromPoint(playerid, x, y, z) < radius)
		{
			idx = i;
			radius = GetPlayerDistanceFromPoint(playerid, x, y, z);
		}
	}

	return idx;
}

Vehicle_CheckKeys(playerid, id)
{
	if (!IsPlayerConnected(playerid))
		return false;

	if (!IsValidVehicle(id))
		return false;

	if (AccountData[playerid][e_ACCOUNT_ADMIN] && AccountData[playerid][e_ACCOUNT_ADMIN_DUTY])
		return true;

	// Facção
	if (VehicleData[id][e_VEHICLE_TYPE] == VEHICLE_TYPE_FACTION && VehicleData[id][e_VEHICLE_OWNER] != CharacterData[playerid][e_CHARACTER_FACTION])
		return true;

	// Pessoal
	if (VehicleData[id][e_VEHICLE_TYPE] == VEHICLE_TYPE_PRIVATE && VehicleData[id][e_VEHICLE_OWNER] == CharacterData[playerid][e_CHARACTER_ID])
		return true;

	// Temporario
	if (VehicleData[id][e_VEHICLE_TYPE] == VEHICLE_TYPE_TEMP)
        return true;

	return false;
}

// SSCANF Key
SSCANF:vehicletype(const string[])
{
	if (IsNumeric(string))
	{
		new ret = strval(string);
		
		if (0 <= ret < MAX_VEHICLE_TYPE)
		{
			return ret;
		}
	}
	else
	{
		for (new i = 0; i < MAX_VEHICLE_TYPE; i++)
		{
			if (strfind(g_arrVehicleTypes[i], string, true) != -1)
			{
				return i;
			}
		}
	}
	return -1;
}

// Comandos
CMD:criarveiculo(playerid, params[])
{
	if (!GetGVarInt("CLOSED_BETA") && !Admin_CheckTeam(playerid, e_ADMIN_TEAM_PROPERTY, .sendMessage = false) && !Admin_CheckTeam(playerid, e_ADMIN_TEAM_FACTION, .sendMessage = false))
		return SendErrorMessage(playerid, "Você não possui permissão para usar este comando.");

	static
		model, type, color1, color2;

	if (sscanf(params, "k<vehicle>k<vehicletype>ii", model, type, color1, color2))
	{
		SendClientMessage(playerid, COLOR_BEGE, "USE: /criarveiculo [Modelo/Nome] [Tipo] [Cor1] [Cor2]");

		new idx = 0, str[128] = "[Tipos]: ";

		for (new i = 0; i < MAX_VEHICLE_TYPE; i++)
		{
			strcat (str, va_return("%s%i. %s", (!idx ? ("") : (", ")), i, g_arrVehicleTypes[i]));

			idx += 1;

			if (!(idx % 5) || (i == (MAX_VEHICLE_TYPE - 1)))
			{
				SendClientMessage(playerid, COLOR_BEGE, str);

				str = "[Tipos]: ";
				idx = 0;
			}
		}

		return true;
	}

	if (!(400 <= model <= 611))
		return SendErrorMessage(playerid, "Você especificou um modelo inválido.");

	if (type < 0 || type >= MAX_VEHICLE_TYPE)
		return SendErrorMessage(playerid, "Você especificou um tipo inválido.");

	if (!(0 <= color1 <= 255) || !(0 <= color2 <= 255))
		return SendErrorMessage(playerid, "Use cores somente de 0 a 255.");

	new id = Vehicle_Create(playerid, type, model, color1, color2);

	if (id == INVALID_VEHICLE_ID)
		return SendErrorMessage(playerid, "Não foi possível criar o veículo.");

	Admin_SendMessage(1, COLOR_LIGHTRED, "[PAINEL-ADMIN] %s criou um %s com o tipo %s.", AccountData[playerid][e_ACCOUNT_NAME], VehicleData[id][e_VEHICLE_NAME], g_arrVehicleTypes[type]);
	SendClientMessageEx(playerid, COLOR_GREEN, "Você criou um %s ID: %i com o tipo %s.", VehicleData[id][e_VEHICLE_NAME], id, g_arrVehicleTypes[type]);
	return true;
}

CMD:destruirveiculo(playerid, params[])
{
	if (!Admin_CheckTeam(playerid, e_ADMIN_TEAM_PROPERTY, .sendMessage = false) && !Admin_CheckTeam(playerid, e_ADMIN_TEAM_FACTION, .sendMessage = false))
		return SendErrorMessage(playerid, "Você não possui permissão para usar este comando.");

	static
		id;

	if (sscanf(params, "i", id))
		return SendUsageMessage(playerid, "/destruirveiculo [VeículoID]");

	if (!IsValidVehicle(id) || !VehicleData[id][e_VEHICLE_EXISTS])
		return SendErrorMessage(playerid, "Você especificou um ID de veículo inválido.");

	Admin_SendMessage(1, COLOR_LIGHTRED, "[PAINEL-ADMIN] %s deletou o veículo %s (%i).", AccountData[playerid][e_ACCOUNT_NAME], VehicleData[id][e_VEHICLE_NAME], id);
	SendClientMessageEx(playerid, COLOR_GREEN, "Você deletou o veículo %s (%i).", VehicleData[id][e_VEHICLE_NAME], id);
	Vehicle_Destroy(id);
	return true;
}

CMD:editarveiculo(playerid, params[])
{
    if (!GetGVarInt("CLOSED_BETA") && !Admin_CheckTeam(playerid, e_ADMIN_TEAM_PROPERTY, .sendMessage = false) && !Admin_CheckTeam(playerid, e_ADMIN_TEAM_FACTION, .sendMessage = false))
        return SendErrorMessage(playerid, "Você não possui permissão.");

    static id, option[24], string[128];

    if (sscanf(params, "ds[24]S()[128]", id, option, string))
    {
        SendClientMessage(playerid, COLOR_BEGE, "USE: /editarveiculo [ID Veículo] [Opção] [Valor]");
        SendClientMessage(playerid, COLOR_WHITE, "OPÇÕES: local, tipo, cor1, cor2");
        return true;
    }

    if (id < 0 || id >= MAX_VEHICLES || !VehicleData[id][e_VEHICLE_EXISTS]) 
        return SendErrorMessage(playerid, "Veículo inválido ou inexistente.");

	if (!strcmp(option, "local", true))
    {
        if(IsPlayerInVehicle(playerid, id))
        {
            GetVehiclePos(id, VehicleData[id][e_VEHICLE_POS][0], VehicleData[id][e_VEHICLE_POS][1], VehicleData[id][e_VEHICLE_POS][2]);
            GetVehicleZAngle(id, VehicleData[id][e_VEHICLE_POS][3]);
        }
        else
        {
            GetPlayerPos(playerid, VehicleData[id][e_VEHICLE_POS][0], VehicleData[id][e_VEHICLE_POS][1], VehicleData[id][e_VEHICLE_POS][2]);
            GetPlayerFacingAngle(playerid, VehicleData[id][e_VEHICLE_POS][3]);
        }
        
        VehicleData[id][e_VEHICLE_WORLD] = GetPlayerVirtualWorld(playerid);
        VehicleData[id][e_VEHICLE_INTERIOR] = GetPlayerInterior(playerid);

        Vehicle_Save(id);
        Vehicle_Spawn(id); 

        if(!IsPlayerInVehicle(playerid, id)) {
            SetPlayerPos(playerid, VehicleData[id][e_VEHICLE_POS][0], VehicleData[id][e_VEHICLE_POS][1] + 2.0, VehicleData[id][e_VEHICLE_POS][2]);
        }
        
		Admin_SendMessage(1, COLOR_LIGHTRED, "[PAINEL-ADMIN] %s alterou a localização o veículo %s (%i).", AccountData[playerid][e_ACCOUNT_NAME], VehicleData[id][e_VEHICLE_NAME], id);
		SendClientMessageEx(playerid, COLOR_GREEN, "Você alterou a localização do veículo %s (%i).", VehicleData[id][e_VEHICLE_NAME], id);
    }
    else if (!strcmp(option, "tipo", true))
    {
        new typeint;
        if (sscanf(string, "d", typeint)) return SendClientMessage(playerid, COLOR_BEGE, "USE: /editarveiculo [ID] [tipo] [ID Tipo]");
        
        if (typeint < 0 || typeint >= MAX_VEHICLE_TYPE) return SendErrorMessage(playerid, "Tipo inválido.");

        VehicleData[id][e_VEHICLE_TYPE] = typeint;
        Vehicle_Save(id);
        Vehicle_Spawn(id);

		Admin_SendMessage(1, COLOR_LIGHTRED, "[PAINEL-ADMIN] %s alterou a localização do veículo %s (%i) para %s.", AccountData[playerid][e_ACCOUNT_NAME], VehicleData[id][e_VEHICLE_NAME], id, g_arrVehicleTypes[typeint]);
		SendClientMessageEx(playerid, COLOR_GREEN, "Você alterou a localização do veículo %s (%i) para %s.", VehicleData[id][e_VEHICLE_NAME], id, g_arrVehicleTypes[typeint]);
    }
    else if (!strcmp(option, "cor1", true))
    {
        new color1;
        if (sscanf(string, "d", color1)) return SendClientMessage(playerid, COLOR_BEGE, "USE: /editarveiculo [ID] [cor1] [ID Cor]");

        VehicleData[id][e_VEHICLE_COLOR1] = color1;
        Vehicle_Save(id);

        ChangeVehicleColor(id, VehicleData[id][e_VEHICLE_COLOR1], VehicleData[id][e_VEHICLE_COLOR2]);
    }

    else if (!strcmp(option, "cor2", true))
    {
        new color2;
        if (sscanf(string, "d", color2)) return SendClientMessage(playerid, COLOR_BEGE, "USE: /editarveiculo [ID] [cor2] [ID Cor]");

        VehicleData[id][e_VEHICLE_COLOR2] = color2;
        Vehicle_Save(id);

        ChangeVehicleColor(id, VehicleData[id][e_VEHICLE_COLOR1], VehicleData[id][e_VEHICLE_COLOR2]);
    }
    else
    {
        SendErrorMessage(playerid, "Opção inválida.");
    }
    return true;
}