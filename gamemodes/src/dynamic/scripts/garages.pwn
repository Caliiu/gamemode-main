/*

	  .oooooo.                                                               
	d8P'  `Y8b                                                              
	888            .oooo.   oooo d8b  .oooo.    .oooooooo  .ooooo.   .oooo.o 
	888           `P  )88b  `888""8P `P  )88b  888' `88b  d88' `88b d88(  "8 
	888     ooooo  .oP"888   888      .oP"888  888   888  888ooo888 `"Y88b.  
	`88.    .88'  d8(  888   888     d8(  888  `88bod8P'  888    .o o.  )88b 
	`Y8bood8P'   `Y888""8o d888b    `Y888""8o `8oooooo.  `Y8bod8P' 8""888P' 
											d"     YD                     
											"Y88888P'              

*/

// Include
#include <YSI_Coding\y_hooks>

new Text: s_gtdGaragem[24];
new PlayerText: s_ptdGaragem[MAX_PLAYERS][13];

// Functions	
Garage_Load()
{
	Iter_Clear(Garages);

	inline Garage_OnLoaded()
	{
		new rows;
		rows = cache_num_rows();

		for (new i = 0; i < MAX_GARAGES; i++)
		{
			// Reset
			if (i >= rows) {
				GarageData[i] = GarageData[MAX_GARAGES];
				continue;
			}

			// Get values
			GarageData[i][e_GARAGE_EXISTS] = true;

			cache_get_value_name_int(i, "ID", GarageData[i][e_GARAGE_ID]);
            cache_get_value_name_int(i, "Type", GarageData[i][e_GARAGE_TYPE]);
			cache_get_value_name_int(i, "Icone", GarageData[i][e_GARAGE_ICON]);

			cache_get_value_name_float(i, "PosX", GarageData[i][e_GARAGE_POS][0]);
			cache_get_value_name_float(i, "PosY", GarageData[i][e_GARAGE_POS][1]);
			cache_get_value_name_float(i, "PosZ", GarageData[i][e_GARAGE_POS][2]);

			cache_get_value_name_int(i, "Interior", GarageData[i][e_GARAGE_INTERIOR]);
			cache_get_value_name_int(i, "World", GarageData[i][e_GARAGE_WORLD]);

			cache_get_value_name_float(i, "SpawnPosX", GarageData[i][e_SPAWN_GARAGE_POS][0]);
			cache_get_value_name_float(i, "SpawnPosY", GarageData[i][e_SPAWN_GARAGE_POS][1]);
			cache_get_value_name_float(i, "SpawnPosZ", GarageData[i][e_SPAWN_GARAGE_POS][2]);
			cache_get_value_name_float(i, "SpawnPosA", GarageData[i][e_SPAWN_GARAGE_POS][3]);

			cache_get_value_name_int(i, "TaxPrice", GarageData[i][e_GARAGE_TAX]);
            cache_get_value_name_int(i, "OwnerID", GarageData[i][e_GARAGE_OWNER_ID]);

			Iter_Add(Garages, i);
			Garage_Refresh(i);
		}

		if (rows)
			printf("[Garage] Loaded %i garages.", rows);
		else
			print("[Garage] No garages to load.");
	}

	MySQL_TQueryInline(MYSQL_CUR_HANDLE, using inline Garage_OnLoaded, "SELECT * FROM `Garagens` LIMIT %i;", MAX_GARAGES);
	return true;
}

Garage_Create(playerid, TaxPrice)
{
	new id = Iter_Free(Garages);

	if (id != ITER_NONE)
	{
		inline Garage_OnCreated()
		{
			if (cache_affected_rows())
			{
				GarageData[id][e_GARAGE_ID] = cache_insert_id();

				Garage_Save(id);
				Garage_Refresh(id);
			}
		}

		GarageData[id] = GarageData[MAX_GARAGES];

        GarageData[id][e_GARAGE_OWNER_ID] = -1;
		GarageData[id][e_GARAGE_EXISTS] = true;
        GarageData[id][e_GARAGE_ICON] = 19134;

		GarageData[id][e_SPAWN_GARAGE_POS][0] = 
		GarageData[id][e_SPAWN_GARAGE_POS][1] = 
		GarageData[id][e_SPAWN_GARAGE_POS][2] = 
		GarageData[id][e_SPAWN_GARAGE_POS][3] = 0.0;

		GarageData[id][e_GARAGE_TAX] = TaxPrice;
        GarageData[id][e_GARAGE_TYPE] = 0;

		GetPlayerPos(playerid, GarageData[id][e_GARAGE_POS][0], GarageData[id][e_GARAGE_POS][1], GarageData[id][e_GARAGE_POS][2]);
	    GarageData[id][e_GARAGE_WORLD] = GetPlayerVirtualWorld(playerid);
		GarageData[id][e_GARAGE_INTERIOR] = GetPlayerInterior(playerid);

		Iter_Add(Garages, id);
		MySQL_TQueryInline(MYSQL_CUR_HANDLE, using inline Garage_OnCreated, "INSERT IGNORE INTO `Garagens` (`TaxPrice`) VALUES (%i);", TaxPrice);
	}

	return id;
}

Garage_Refresh(id)
{
	if (!(0 <= id < MAX_GARAGES) || !GarageData[id][e_GARAGE_EXISTS])
		return false;

	if (IsValidDynamicPickup(GarageData[id][e_GARAGE_ICON]))
	{
		DestroyDynamicPickup(GarageData[id][e_GARAGE_ICON]);
		GarageData[id][e_GARAGE_ICON] = INVALID_STREAMER_ID;
	}

	if (IsValidDynamicArea(GarageData[id][e_GARAGE_AREA]))
		DestroyDynamicArea(GarageData[id][e_GARAGE_AREA]);

	// Area
	GarageData[id][e_GARAGE_AREA] = CreateDynamicSphere(
		GarageData[id][e_GARAGE_POS][0], 
		GarageData[id][e_GARAGE_POS][1], 
		GarageData[id][e_GARAGE_POS][2], 
		2.5, 
		.worldid = GarageData[id][e_GARAGE_WORLD], 
		.interiorid = GarageData[id][e_GARAGE_INTERIOR]
	);

	// Icon
    GarageData[id][e_GARAGE_ICON] = CreateDynamicPickup(
        19134, 
        23, 
        GarageData[id][e_GARAGE_POS][0], 
        GarageData[id][e_GARAGE_POS][1], 
        GarageData[id][e_GARAGE_POS][2] - 0.4,
        GarageData[id][e_GARAGE_WORLD], 
        GarageData[id][e_GARAGE_INTERIOR]
    );
	

	return true;
}

Garage_Save(id)
{
	if (!(0 <= id < MAX_GARAGES) || !GarageData[id][e_GARAGE_EXISTS])
		return false;

	inline Garage_OnSaved() {}

	MySQL_TQueryInline(
		MYSQL_CUR_HANDLE,
		using inline Garage_OnSaved,
		"UPDATE IGNORE `Garagens` SET \
		`Icone`=%i,\
		`PosX`='%f',\
		`PosY`='%f',\
		`PosZ`='%f',\
		`World`=%i,\
		`Interior`=%i,\
		`SpawnPosX`='%f',\
		`SpawnPosY`='%f',\
		`SpawnPosZ`='%f',\
		`SpawnPosA`='%f',\
		`TaxPrice`=%i,\
		`Type`=%i,\
        `OwnerID`=%i \  
		WHERE `ID` = %i LIMIT 1;",
		GarageData[id][e_GARAGE_ICON],
		GarageData[id][e_GARAGE_POS][0],
		GarageData[id][e_GARAGE_POS][1],
		GarageData[id][e_GARAGE_POS][2],
		GarageData[id][e_GARAGE_WORLD],
		GarageData[id][e_GARAGE_INTERIOR],
		GarageData[id][e_SPAWN_GARAGE_POS][0],
		GarageData[id][e_SPAWN_GARAGE_POS][1],
		GarageData[id][e_SPAWN_GARAGE_POS][2],
		GarageData[id][e_SPAWN_GARAGE_POS][3],
		GarageData[id][e_GARAGE_TAX],
		GarageData[id][e_GARAGE_TYPE],
        GarageData[id][e_GARAGE_OWNER_ID],
		GarageData[id][e_GARAGE_ID]
	);

	return true;
}

Garage_Nearest(playerid, Float:radius=2.5)
{
	new idx = -1;

	foreach (new i : Garages)
	{
		if (GetPlayerInterior(playerid) != GarageData[i][e_GARAGE_INTERIOR])
			continue;

		if (GetPlayerVirtualWorld(playerid) != GarageData[i][e_GARAGE_WORLD])
			continue;

		if (GetPlayerDistanceFromPoint(playerid, GarageData[i][e_GARAGE_POS][0], GarageData[i][e_GARAGE_POS][1], GarageData[i][e_GARAGE_POS][2]) < radius)
		{
			idx = i;
			radius = GetPlayerDistanceFromPoint(playerid, GarageData[i][e_GARAGE_POS][0], GarageData[i][e_GARAGE_POS][1], GarageData[i][e_GARAGE_POS][2]);
		}
	}

	return idx;
}

Garage_Destroy(id)
{
	if (!(0 <= id < MAX_GARAGES) || !GarageData[id][e_GARAGE_EXISTS])
		return false;

	if (IsValidDynamicPickup(GarageData[id][e_GARAGE_ICON]))
		DestroyDynamicPickup(GarageData[id][e_GARAGE_ICON]);

	if (IsValidDynamicArea(GarageData[id][e_GARAGE_AREA]))
		DestroyDynamicArea(GarageData[id][e_GARAGE_AREA]);

	Iter_Remove(Garages, id);
	GarageData[id] = GarageData[MAX_GARAGES];

	new query[64];
	mysql_format (MYSQL_CUR_HANDLE, query, sizeof query, "DELETE FROM `Garagens` WHERE `ID` = %i;", GarageData[id][e_GARAGE_ID]);
	mysql_tquery (MYSQL_CUR_HANDLE, query);
	return true;
}

Garage_GetRealID(sqlid)
{
	foreach (new i : Garages)
	{
		if (!GarageData[i][e_GARAGE_EXISTS] || GarageData[i][e_GARAGE_ID] != sqlid)
			continue;

		return i;
	}

	return -1;
}

hook OnGameModeInit()
{
    // Textdraw Garagem
    s_gtdGaragem[0] = TextDrawCreate(188.000, 131.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[0], 269.000, 199.000);
    TextDrawAlignment(s_gtdGaragem[0], 1);
    TextDrawColor(s_gtdGaragem[0], 303174399);
    TextDrawSetShadow(s_gtdGaragem[0], 0);
    TextDrawSetOutline(s_gtdGaragem[0], 0);
    TextDrawBackgroundColor(s_gtdGaragem[0], 255);
    TextDrawFont(s_gtdGaragem[0], 4);
    TextDrawSetProportional(s_gtdGaragem[0], 1);

    s_gtdGaragem[1] = TextDrawCreate(179.000, 128.000, "LD_BEAT:chit");
    TextDrawTextSize(s_gtdGaragem[1], 16.000, 18.000);
    TextDrawAlignment(s_gtdGaragem[1], 1);
    TextDrawColor(s_gtdGaragem[1], 303174399);
    TextDrawSetShadow(s_gtdGaragem[1], 0);
    TextDrawSetOutline(s_gtdGaragem[1], 0);
    TextDrawBackgroundColor(s_gtdGaragem[1], 255);
    TextDrawFont(s_gtdGaragem[1], 4);
    TextDrawSetProportional(s_gtdGaragem[1], 1);

    s_gtdGaragem[2] = TextDrawCreate(179.000, 314.000, "LD_BEAT:chit");
    TextDrawTextSize(s_gtdGaragem[2], 16.000, 19.000);
    TextDrawAlignment(s_gtdGaragem[2], 1);
    TextDrawColor(s_gtdGaragem[2], 303174399);
    TextDrawSetShadow(s_gtdGaragem[2], 0);
    TextDrawSetOutline(s_gtdGaragem[2], 0);
    TextDrawBackgroundColor(s_gtdGaragem[2], 255);
    TextDrawFont(s_gtdGaragem[2], 4);
    TextDrawSetProportional(s_gtdGaragem[2], 1);

    s_gtdGaragem[3] = TextDrawCreate(449.000, 314.000, "LD_BEAT:chit");
    TextDrawTextSize(s_gtdGaragem[3], 17.000, 19.000);
    TextDrawAlignment(s_gtdGaragem[3], 1);
    TextDrawColor(s_gtdGaragem[3], 303174399);
    TextDrawSetShadow(s_gtdGaragem[3], 0);
    TextDrawSetOutline(s_gtdGaragem[3], 0);
    TextDrawBackgroundColor(s_gtdGaragem[3], 255);
    TextDrawFont(s_gtdGaragem[3], 4);
    TextDrawSetProportional(s_gtdGaragem[3], 1);

    s_gtdGaragem[4] = TextDrawCreate(448.000, 128.000, "LD_BEAT:chit");
    TextDrawTextSize(s_gtdGaragem[4], 18.000, 18.000);
    TextDrawAlignment(s_gtdGaragem[4], 1);
    TextDrawColor(s_gtdGaragem[4], 303174399);
    TextDrawSetShadow(s_gtdGaragem[4], 0);
    TextDrawSetOutline(s_gtdGaragem[4], 0);
    TextDrawBackgroundColor(s_gtdGaragem[4], 255);
    TextDrawFont(s_gtdGaragem[4], 4);
    TextDrawSetProportional(s_gtdGaragem[4], 1);

    s_gtdGaragem[5] = TextDrawCreate(182.000, 137.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[5], 281.000, 185.000);
    TextDrawAlignment(s_gtdGaragem[5], 1);
    TextDrawColor(s_gtdGaragem[5], 303174399);
    TextDrawSetShadow(s_gtdGaragem[5], 0);
    TextDrawSetOutline(s_gtdGaragem[5], 0);
    TextDrawBackgroundColor(s_gtdGaragem[5], 255);
    TextDrawFont(s_gtdGaragem[5], 4);
    TextDrawSetProportional(s_gtdGaragem[5], 1);

    s_gtdGaragem[6] = TextDrawCreate(191.000, 145.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[6], 2.000, 18.000);
    TextDrawAlignment(s_gtdGaragem[6], 1);
    TextDrawColor(s_gtdGaragem[6], -1176756737);
    TextDrawSetShadow(s_gtdGaragem[6], 0);
    TextDrawSetOutline(s_gtdGaragem[6], 0);
    TextDrawBackgroundColor(s_gtdGaragem[6], 255);
    TextDrawFont(s_gtdGaragem[6], 4);
    TextDrawSetProportional(s_gtdGaragem[6], 1);

    s_gtdGaragem[7] = TextDrawCreate(182.000, 199.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[7], 281.000, 26.000);
    TextDrawAlignment(s_gtdGaragem[7], 1);
    TextDrawColor(s_gtdGaragem[7], -1176756737);
    TextDrawSetShadow(s_gtdGaragem[7], 0);
    TextDrawSetOutline(s_gtdGaragem[7], 0);
    TextDrawBackgroundColor(s_gtdGaragem[7], 255);
    TextDrawFont(s_gtdGaragem[7], 4);
    TextDrawSetProportional(s_gtdGaragem[7], 1);

    s_gtdGaragem[8] = TextDrawCreate(170.000, 262.000, "PARTICLE:lamp_shad_64");
    TextDrawTextSize(s_gtdGaragem[8], 299.000, 68.000);
    TextDrawAlignment(s_gtdGaragem[8], 1);
    TextDrawColor(s_gtdGaragem[8], -1176756978);
    TextDrawSetShadow(s_gtdGaragem[8], 0);
    TextDrawSetOutline(s_gtdGaragem[8], 0);
    TextDrawBackgroundColor(s_gtdGaragem[8], 255);
    TextDrawFont(s_gtdGaragem[8], 4);
    TextDrawSetProportional(s_gtdGaragem[8], 1);

    s_gtdGaragem[9] = TextDrawCreate(211.000, 284.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[9], 45.000, 36.000);
    TextDrawAlignment(s_gtdGaragem[9], 1);
    TextDrawColor(s_gtdGaragem[9], -201);
    TextDrawSetShadow(s_gtdGaragem[9], 0);
    TextDrawSetOutline(s_gtdGaragem[9], 0);
    TextDrawBackgroundColor(s_gtdGaragem[9], 255);
    TextDrawFont(s_gtdGaragem[9], 4);
    TextDrawSetProportional(s_gtdGaragem[9], 1);

    s_gtdGaragem[10] = TextDrawCreate(212.000, 285.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[10], 43.000, 34.000);
    TextDrawAlignment(s_gtdGaragem[10], 1);
    TextDrawColor(s_gtdGaragem[10], 303174399);
    TextDrawSetShadow(s_gtdGaragem[10], 0);
    TextDrawSetOutline(s_gtdGaragem[10], 0);
    TextDrawBackgroundColor(s_gtdGaragem[10], 255);
    TextDrawFont(s_gtdGaragem[10], 4);
    TextDrawSetProportional(s_gtdGaragem[10], 1);

    s_gtdGaragem[11] = TextDrawCreate(261.000, 284.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[11], 45.000, 36.000);
    TextDrawAlignment(s_gtdGaragem[11], 1);
    TextDrawColor(s_gtdGaragem[11], -201);
    TextDrawSetShadow(s_gtdGaragem[11], 0);
    TextDrawSetOutline(s_gtdGaragem[11], 0);
    TextDrawBackgroundColor(s_gtdGaragem[11], 255);
    TextDrawFont(s_gtdGaragem[11], 4);
    TextDrawSetProportional(s_gtdGaragem[11], 1);

    s_gtdGaragem[12] = TextDrawCreate(262.000, 285.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[12], 43.000, 34.000);
    TextDrawAlignment(s_gtdGaragem[12], 1);
    TextDrawColor(s_gtdGaragem[12], 303174399);
    TextDrawSetShadow(s_gtdGaragem[12], 0);
    TextDrawSetOutline(s_gtdGaragem[12], 0);
    TextDrawBackgroundColor(s_gtdGaragem[12], 255);
    TextDrawFont(s_gtdGaragem[12], 4);
    TextDrawSetProportional(s_gtdGaragem[12], 1);

    s_gtdGaragem[13] = TextDrawCreate(311.000, 284.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[13], 45.000, 36.000);
    TextDrawAlignment(s_gtdGaragem[13], 1);
    TextDrawColor(s_gtdGaragem[13], -201);
    TextDrawSetShadow(s_gtdGaragem[13], 0);
    TextDrawSetOutline(s_gtdGaragem[13], 0);
    TextDrawBackgroundColor(s_gtdGaragem[13], 255);
    TextDrawFont(s_gtdGaragem[13], 4);
    TextDrawSetProportional(s_gtdGaragem[13], 1);

    s_gtdGaragem[14] = TextDrawCreate(312.000, 285.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[14], 43.000, 34.000);
    TextDrawAlignment(s_gtdGaragem[14], 1);
    TextDrawColor(s_gtdGaragem[14], 303174399);
    TextDrawSetShadow(s_gtdGaragem[14], 0);
    TextDrawSetOutline(s_gtdGaragem[14], 0);
    TextDrawBackgroundColor(s_gtdGaragem[14], 255);
    TextDrawFont(s_gtdGaragem[14], 4);
    TextDrawSetProportional(s_gtdGaragem[14], 1);

    s_gtdGaragem[15] = TextDrawCreate(361.000, 284.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[15], 45.000, 36.000);
    TextDrawAlignment(s_gtdGaragem[15], 1);
    TextDrawColor(s_gtdGaragem[15], -201);
    TextDrawSetShadow(s_gtdGaragem[15], 0);
    TextDrawSetOutline(s_gtdGaragem[15], 0);
    TextDrawBackgroundColor(s_gtdGaragem[15], 255);
    TextDrawFont(s_gtdGaragem[15], 4);
    TextDrawSetProportional(s_gtdGaragem[15], 1);

    s_gtdGaragem[16] = TextDrawCreate(362.000, 285.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[16], 43.000, 34.000);
    TextDrawAlignment(s_gtdGaragem[16], 1);
    TextDrawColor(s_gtdGaragem[16], 303174399);
    TextDrawSetShadow(s_gtdGaragem[16], 0);
    TextDrawSetOutline(s_gtdGaragem[16], 0);
    TextDrawBackgroundColor(s_gtdGaragem[16], 255);
    TextDrawFont(s_gtdGaragem[16], 4);
    TextDrawSetProportional(s_gtdGaragem[16], 1);

    s_gtdGaragem[17] = TextDrawCreate(407.000, 234.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[17], 47.000, 19.000);
    TextDrawAlignment(s_gtdGaragem[17], 1);
    TextDrawColor(s_gtdGaragem[17], 1768516095);
    TextDrawSetShadow(s_gtdGaragem[17], 0);
    TextDrawSetOutline(s_gtdGaragem[17], 0);
    TextDrawBackgroundColor(s_gtdGaragem[17], 255);
    TextDrawFont(s_gtdGaragem[17], 4);
    TextDrawSetProportional(s_gtdGaragem[17], 1);

    s_gtdGaragem[18] = TextDrawCreate(408.000, 235.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[18], 45.000, 17.000);
    TextDrawAlignment(s_gtdGaragem[18], 1);
    TextDrawColor(s_gtdGaragem[18], 303174399);
    TextDrawSetShadow(s_gtdGaragem[18], 0);
    TextDrawSetOutline(s_gtdGaragem[18], 0);
    TextDrawBackgroundColor(s_gtdGaragem[18], 255);
    TextDrawFont(s_gtdGaragem[18], 4);
    TextDrawSetProportional(s_gtdGaragem[18], 1);

    s_gtdGaragem[19] = TextDrawCreate(407.000, 242.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[19], 47.000, 4.000);
    TextDrawAlignment(s_gtdGaragem[19], 1);
    TextDrawColor(s_gtdGaragem[19], 303174399);
    TextDrawSetShadow(s_gtdGaragem[19], 0);
    TextDrawSetOutline(s_gtdGaragem[19], 0);
    TextDrawBackgroundColor(s_gtdGaragem[19], 255);
    TextDrawFont(s_gtdGaragem[19], 4);
    TextDrawSetProportional(s_gtdGaragem[19], 1);

    s_gtdGaragem[20] = TextDrawCreate(407.000, 258.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[20], 47.000, 19.000);
    TextDrawAlignment(s_gtdGaragem[20], 1);
    TextDrawColor(s_gtdGaragem[20], 1768516095);
    TextDrawSetShadow(s_gtdGaragem[20], 0);
    TextDrawSetOutline(s_gtdGaragem[20], 0);
    TextDrawBackgroundColor(s_gtdGaragem[20], 255);
    TextDrawFont(s_gtdGaragem[20], 4);
    TextDrawSetProportional(s_gtdGaragem[20], 1);

    s_gtdGaragem[21] = TextDrawCreate(408.000, 259.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[21], 45.000, 17.000);
    TextDrawAlignment(s_gtdGaragem[21], 1);
    TextDrawColor(s_gtdGaragem[21], 303174399);
    TextDrawSetShadow(s_gtdGaragem[21], 0);
    TextDrawSetOutline(s_gtdGaragem[21], 0);
    TextDrawBackgroundColor(s_gtdGaragem[21], 255);
    TextDrawFont(s_gtdGaragem[21], 4);
    TextDrawSetProportional(s_gtdGaragem[21], 1);

    s_gtdGaragem[22] = TextDrawCreate(407.000, 267.000, "LD_SPAC:white");
    TextDrawTextSize(s_gtdGaragem[22], 47.000, 4.000);
    TextDrawAlignment(s_gtdGaragem[22], 1);
    TextDrawColor(s_gtdGaragem[22], 303174399);
    TextDrawSetShadow(s_gtdGaragem[22], 0);
    TextDrawSetOutline(s_gtdGaragem[22], 0);
    TextDrawBackgroundColor(s_gtdGaragem[22], 255);
    TextDrawFont(s_gtdGaragem[22], 4);
    TextDrawSetProportional(s_gtdGaragem[22], 1);

    s_gtdGaragem[23] = TextDrawCreate(199.000, 94.000, "_");
    TextDrawTextSize(s_gtdGaragem[23], 205.000, 248.000);
    TextDrawAlignment(s_gtdGaragem[23], 1);
    TextDrawColor(s_gtdGaragem[23], -1);
    TextDrawSetShadow(s_gtdGaragem[23], 0);
    TextDrawSetOutline(s_gtdGaragem[23], 0);
    TextDrawBackgroundColor(s_gtdGaragem[23], 1);
    TextDrawFont(s_gtdGaragem[23], 5);
    TextDrawSetProportional(s_gtdGaragem[23], 0);
    TextDrawSetPreviewModel(s_gtdGaragem[23], 560);
    TextDrawSetPreviewRot(s_gtdGaragem[23], 0.000, 0.000, 55.000, 1.000);
    TextDrawSetPreviewVehCol(s_gtdGaragem[23], 16, 0);
    return true;
}


hook OnPlayerConnect(playerid)
{
    // Textdraw Garagem
    s_ptdGaragem[playerid][0] = CreatePlayerTextDraw(playerid, 195.000, 145.000, "SULTAN");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][0], 0.150, 0.699);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][0], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][0], -80);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][0], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][0], 1);

    s_ptdGaragem[playerid][1] = CreatePlayerTextDraw(playerid, 195.000, 152.000, "SULTAN");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][1], 0.219, 1.199);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][1], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][1], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][1], 1);

    s_ptdGaragem[playerid][2] = CreatePlayerTextDraw(playerid, 214.000, 280.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdGaragem[playerid][2], 40.000, 44.000);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][2], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][2], 1);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][2], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][2], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdGaragem[playerid][2], 560);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdGaragem[playerid][2], 0.000, 0.000, 53.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdGaragem[playerid][2], 16, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdGaragem[playerid][2], 1);

    s_ptdGaragem[playerid][3] = CreatePlayerTextDraw(playerid, 264.000, 280.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdGaragem[playerid][3], 40.000, 44.000);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][3], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][3], 1);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][3], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][3], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdGaragem[playerid][3], 560);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdGaragem[playerid][3], 0.000, 0.000, 53.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdGaragem[playerid][3], 16, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdGaragem[playerid][3], 1);

    s_ptdGaragem[playerid][4] = CreatePlayerTextDraw(playerid, 314.000, 280.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdGaragem[playerid][4], 40.000, 44.000);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][4], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][4], 1);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][4], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][4], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdGaragem[playerid][4], 560);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdGaragem[playerid][4], 0.000, 0.000, 53.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdGaragem[playerid][4], 16, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdGaragem[playerid][4], 1);

    s_ptdGaragem[playerid][5] = CreatePlayerTextDraw(playerid, 363.000, 280.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdGaragem[playerid][5], 40.000, 44.000);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][5], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][5], 1);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][5], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][5], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdGaragem[playerid][5], 560);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdGaragem[playerid][5], 0.000, 0.000, 53.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdGaragem[playerid][5], 16, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdGaragem[playerid][5], 1);

    s_ptdGaragem[playerid][6] = CreatePlayerTextDraw(playerid, 431.000, 240.000, "RETIRAR");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][6], 0.209, 0.799);
    PlayerTextDrawTextSize(playerid, s_ptdGaragem[playerid][6], 7.000, 28.000);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][6], 2);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][6], -80);
    PlayerTextDrawUseBox(playerid, s_ptdGaragem[playerid][6], 1);
    PlayerTextDrawBoxColor(playerid, s_ptdGaragem[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][6], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, s_ptdGaragem[playerid][6], 1);

    s_ptdGaragem[playerid][7] = CreatePlayerTextDraw(playerid, 431.000, 264.000, "GUARDAR");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][7], 0.180, 0.799);
    PlayerTextDrawTextSize(playerid, s_ptdGaragem[playerid][7], 7.000, 28.000);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][7], 2);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][7], -80);
    PlayerTextDrawUseBox(playerid, s_ptdGaragem[playerid][7], 1);
    PlayerTextDrawBoxColor(playerid, s_ptdGaragem[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][7], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, s_ptdGaragem[playerid][7], 1);

    s_ptdGaragem[playerid][8] = CreatePlayerTextDraw(playerid, 446.000, 137.000, "FECHAR");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][8], 0.170, 0.699);
    PlayerTextDrawTextSize(playerid, s_ptdGaragem[playerid][8], 6.000, 21.000);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][8], 2);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][8], -1);
    PlayerTextDrawUseBox(playerid, s_ptdGaragem[playerid][8], 1);
    PlayerTextDrawBoxColor(playerid, s_ptdGaragem[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][8], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, s_ptdGaragem[playerid][8], 1);

    s_ptdGaragem[playerid][9] = CreatePlayerTextDraw(playerid, 189.000, 255.000, "Gasolina:");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][9], 0.140, 0.699);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][9], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][9], -80);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][9], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][9], 1);

    s_ptdGaragem[playerid][10] = CreatePlayerTextDraw(playerid, 189.000, 262.000, "Lataria:");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][10], 0.140, 0.699);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][10], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][10], -80);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][10], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][10], 1);

    s_ptdGaragem[playerid][11] = CreatePlayerTextDraw(playerid, 207.000, 263.000, "100");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][11], 0.119, 0.597);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][11], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][11], -80);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][11], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][11], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][11], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][11], 1);

    s_ptdGaragem[playerid][12] = CreatePlayerTextDraw(playerid, 210.000, 256.000, "100");
    PlayerTextDrawLetterSize(playerid, s_ptdGaragem[playerid][12], 0.119, 0.597);
    PlayerTextDrawAlignment(playerid, s_ptdGaragem[playerid][12], 1);
    PlayerTextDrawColor(playerid, s_ptdGaragem[playerid][12], -80);
    PlayerTextDrawSetShadow(playerid, s_ptdGaragem[playerid][12], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdGaragem[playerid][12], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdGaragem[playerid][12], 150);
    PlayerTextDrawFont(playerid, s_ptdGaragem[playerid][12], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdGaragem[playerid][12], 1);

    return true;
}

// Comandos
CMD:criargaragem(playerid, params[])
{
    if (!Admin_CheckTeam(playerid, e_ADMIN_TEAM_PROPERTY))
	    return false;

	static
	    price,
	    id;

	if (sscanf(params, "i", price))
		return SendUsageMessage(playerid, "/criargaragem [preço de retirada]");

	if (price < 1)
		return SendErrorMessage(playerid, "O valor minímo é R$1.");

	id = Garage_Create(playerid, price);

	if (id == ITER_NONE)
		return SendErrorMessage(playerid, "O servidor chegou ao limite máximo de garagens.");

	SendClientMessageEx(playerid, COLOR_GREEN, "Você criou com sucesso a garagem ID: %d.", id);
	return 1;
}

CMD:destruirgaragem(playerid, params[])
{
    if (!Admin_CheckTeam(playerid, e_ADMIN_TEAM_PROPERTY))
	    return false;

	static
	    id = 0;

	if (sscanf(params, "i", id))
		return SendUsageMessage(playerid, "/destruirgaragem [id da garagem]");

	if ((id < 0 || id >= MAX_GARAGES) || !GarageData[id][e_GARAGE_EXISTS])
		return SendErrorMessage(playerid, "Você especificou um ID de garagem inválido.");

	Garage_Destroy(id);
	SendClientMessageEx(playerid, COLOR_GREEN, "Você destruiu com sucesso a garagem ID: %d.", id);
	return 1;
}

CMD:editargaragem(playerid, params[])
{
 	if (!Admin_CheckTeam(playerid, e_ADMIN_TEAM_PROPERTY))
	    return false;

	static
	    id,
	    type[24],
	    string[128];

	if (sscanf(params, "ds[24]S()[128]", id, type, string))
 	{
 	    SendClientMessage(playerid, COLOR_BEGE, "_____________________________________________");
	 	SendClientMessage(playerid, COLOR_BEGE, "USE: /editargaragem [id] [opção]");
	    SendClientMessage(playerid, COLOR_BEGE, "[Opções]: localizacao, spawn, preco, tipo");
	    SendClientMessage(playerid, COLOR_BEGE, "_____________________________________________");
		return 1;
	}

	if ((id < 0 || id >= MAX_GARAGES) || !GarageData[id][e_GARAGE_EXISTS])
	    return SendErrorMessage(playerid, "Você especificou um ID de garagem inválido.");

	if (!strcmp(type, "localizacao", true))
	{
		GetPlayerPos(playerid, GarageData[id][e_GARAGE_POS][0], GarageData[id][e_GARAGE_POS][1], GarageData[id][e_GARAGE_POS][2]);

		GarageData[id][e_GARAGE_WORLD] = GetPlayerVirtualWorld(playerid);
		GarageData[id][e_GARAGE_INTERIOR] = GetPlayerInterior(playerid);

		Garage_Refresh(id);
		Garage_Save(id);

      	Admin_SendMessage(1, COLOR_LIGHTRED, "[PAINEL-ADMIN] %s ajustou a localização da garagem: %d.", AccountData[playerid][e_ACCOUNT_NAME], id);
	}
	else if (!strcmp(type, "spawn", true))
	{
		GetPlayerPos(playerid, GarageData[id][e_SPAWN_GARAGE_POS][0], GarageData[id][e_SPAWN_GARAGE_POS][1], GarageData[id][e_SPAWN_GARAGE_POS][2]);
		GetPlayerFacingAngle(playerid, GarageData[id][e_SPAWN_GARAGE_POS][3]);

		Garage_Save(id);
		Admin_SendMessage(1, COLOR_LIGHTRED, "[PAINEL-ADMIN] %s ajustou o spawn de veículos da garagem: %d.", AccountData[playerid][e_ACCOUNT_NAME], id);
	}

    else if (!strcmp(type, "tipo", true))
    {
        new typeint, factionid;
        if (sscanf(string, "dd", typeint, factionid)) 
        {
            SendClientMessage(playerid, COLOR_BEGE, "/editargaragem [garagem id] [tipo] [facção id (se for Facção)]");
            SendClientMessage(playerid, COLOR_BEGE, "[Tipos]:{FFFFFF} 0: Pessoal | 1: Facção | 2: Empresarial | 3: Emprego");
            return 1;
        }

        if (typeint < 0 || typeint > 3)
            return SendErrorMessage(playerid, "O valor é de 0 até 3.");

        GarageData[id][e_GARAGE_TYPE] = typeint;

        if (typeint == 1) 
        {
            if (!(0 <= factionid < MAX_FACTIONS) || !FactionData[factionid][e_FACTION_EXISTS])
                return SendErrorMessage(playerid, "Facção inválida.");

            GarageData[id][e_GARAGE_OWNER_ID] = factionid;
        }
        else
        {
            GarageData[id][e_GARAGE_OWNER_ID] = -1; 
        }

        Garage_Save(id);

        new typeName[16];
        switch (typeint)
        {
            case 0: typeName = "Pessoal";
            case 1: typeName = "Facção";
            case 2: typeName = "Empresarial";
            case 3: typeName = "Emprego";
            default: typeName = "Desconhecido";
        }

        new ownerName[32];
        if (typeint == 1) {
            format(ownerName, sizeof(ownerName), "%s", FactionData[factionid][e_FACTION_NAME]);
        }
        else {
            format(ownerName, sizeof(ownerName), "Nenhum");
        }

        Admin_SendMessage(1, COLOR_LIGHTRED, "[PAINEL-ADMIN] %s ajustou o tipo da garagem %i para \"%s\" (Owner: %s).", AccountData[playerid][e_ACCOUNT_NAME], id, typeName, ownerName);
    }

	else if (!strcmp(type, "preco", true))
	{
	    new price;

	    if (sscanf(string, "d", price))
	        return SendUsageMessage(playerid, "/editargaragem [id] [preço] [novo preço]");

	    if (price < 1)
	    	return SendErrorMessage(playerid, "O valor minímo é R$1.");

	    GarageData[id][e_GARAGE_TAX] = price;

	    Garage_Refresh(id);
	    Garage_Save(id);
       
       	Admin_SendMessage(1, COLOR_LIGHTRED, "[PAINEL-ADMIN] %s ajustou o preço de retirada da garagem: %d para %s.", AccountData[playerid][e_ACCOUNT_NAME], id, FormatMoney(price));
	}

	return true;
}

CMD:testegaragem(playerid)
{
    if (Garage_Nearest(playerid) == -1)
        return SendErrorMessage(playerid, "Você não está perto de uma garagem.");

    Garage_ShowMenu(playerid);

    return true;
}

CMD:testegaragem2(playerid)
{
    if (Garage_Nearest(playerid) == -1)
        return SendErrorMessage(playerid, "Você não está perto de uma garagem.");

    Garage_HideMenu(playerid);

    return true;
}

Garage_ShowMenu(playerid)
{
	for (new i = 0; i < sizeof(s_gtdGaragem); i++)
	{
		if (s_gtdGaragem[i] != Text:INVALID_TEXT_DRAW) {
			TextDrawShowForPlayer(playerid, s_gtdGaragem[i]);
		}
	}
	for (new i = 0; i < sizeof(s_ptdGaragem[]); i++)
	{
		if (s_ptdGaragem[playerid][i] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawShow(playerid, s_ptdGaragem[playerid][i]);
		}
	}
}

Garage_HideMenu(playerid)
{
	for (new i = 0; i < sizeof(s_gtdGaragem); i++)
	{
		if (s_gtdGaragem[i] != Text:INVALID_TEXT_DRAW) {
			TextDrawHideForPlayer(playerid, s_gtdGaragem[i]);
		}
	}
	for (new i = 0; i < sizeof(s_ptdGaragem[]); i++)
	{
		if (s_ptdGaragem[playerid][i] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawHide(playerid, s_ptdGaragem[playerid][i]);
		}
	}
    CancelSelectTextDraw(playerid);
}