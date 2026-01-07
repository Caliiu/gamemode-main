/*
	ooooo                                                   .
	`888'                                                 .o8
	 888  ooo. .oo.   oooo    ooo  .ooooo.  ooo. .oo.   .o888oo  .ooooo.  oooo d8b oooo    ooo
	 888  `888P"Y88b   `88.  .8'  d88' `88b `888P"Y88b    888   d88' `88b `888""8P  `88.  .8'
	 888   888   888    `88..8'   888ooo888  888   888    888   888   888  888       `88..8'
	 888   888   888     `888'    888    .o  888   888    888 . 888   888  888        `888'
	o888o o888o o888o     `8'     `Y8bod8P' o888o o888o   "888" `Y8bod8P' d888b        .8'
	                                                                               .o..P'
	                                                                               `Y8P'
*/

// Include
#include <YSI_Coding\y_hooks>

new Text: s_tdInventory[51];
new PlayerText: s_ptdInventorySlots[MAX_PLAYERS][49];

hook OnGameModeInit()
{
    s_tdInventory[0] = TextDrawCreate(-23.000, -24.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[0], 731.000, 580.000);
    TextDrawAlignment(s_tdInventory[0], 1);
    TextDrawColor(s_tdInventory[0], 808464609);
    TextDrawSetShadow(s_tdInventory[0], 0);
    TextDrawSetOutline(s_tdInventory[0], 0);
    TextDrawBackgroundColor(s_tdInventory[0], 255);
    TextDrawFont(s_tdInventory[0], 4);
    TextDrawSetProportional(s_tdInventory[0], 1);

    s_tdInventory[1] = TextDrawCreate(92.000, 114.000, "INVENTARIO");
    TextDrawLetterSize(s_tdInventory[1], 0.230, 1.199);
    TextDrawAlignment(s_tdInventory[1], 1);
    TextDrawColor(s_tdInventory[1], -538976257);
    TextDrawSetShadow(s_tdInventory[1], 1);
    TextDrawSetOutline(s_tdInventory[1], 0);
    TextDrawBackgroundColor(s_tdInventory[1], 0);
    TextDrawFont(s_tdInventory[1], 1);
    TextDrawSetProportional(s_tdInventory[1], 1);

    s_tdInventory[2] = TextDrawCreate(139.000, 120.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[2], 150.000, 1.000);
    TextDrawAlignment(s_tdInventory[2], 1);
    TextDrawColor(s_tdInventory[2], -538976257);
    TextDrawSetShadow(s_tdInventory[2], 0);
    TextDrawSetOutline(s_tdInventory[2], 0);
    TextDrawBackgroundColor(s_tdInventory[2], 255);
    TextDrawFont(s_tdInventory[2], 4);
    TextDrawSetProportional(s_tdInventory[2], 1);

    s_tdInventory[3] = TextDrawCreate(93.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[3], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[3], 1);
    TextDrawColor(s_tdInventory[3], 1162167807);
    TextDrawSetShadow(s_tdInventory[3], 0);
    TextDrawSetOutline(s_tdInventory[3], 0);
    TextDrawBackgroundColor(s_tdInventory[3], 255);
    TextDrawFont(s_tdInventory[3], 4);
    TextDrawSetProportional(s_tdInventory[3], 1);

    s_tdInventory[4] = TextDrawCreate(133.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[4], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[4], 1);
    TextDrawColor(s_tdInventory[4], 1162167807);
    TextDrawSetShadow(s_tdInventory[4], 0);
    TextDrawSetOutline(s_tdInventory[4], 0);
    TextDrawBackgroundColor(s_tdInventory[4], 255);
    TextDrawFont(s_tdInventory[4], 4);
    TextDrawSetProportional(s_tdInventory[4], 1);

    s_tdInventory[5] = TextDrawCreate(173.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[5], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[5], 1);
    TextDrawColor(s_tdInventory[5], 1162167807);
    TextDrawSetShadow(s_tdInventory[5], 0);
    TextDrawSetOutline(s_tdInventory[5], 0);
    TextDrawBackgroundColor(s_tdInventory[5], 255);
    TextDrawFont(s_tdInventory[5], 4);
    TextDrawSetProportional(s_tdInventory[5], 1);

    s_tdInventory[6] = TextDrawCreate(213.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[6], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[6], 1);
    TextDrawColor(s_tdInventory[6], 1162167807);
    TextDrawSetShadow(s_tdInventory[6], 0);
    TextDrawSetOutline(s_tdInventory[6], 0);
    TextDrawBackgroundColor(s_tdInventory[6], 255);
    TextDrawFont(s_tdInventory[6], 4);
    TextDrawSetProportional(s_tdInventory[6], 1);

    s_tdInventory[7] = TextDrawCreate(253.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[7], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[7], 1);
    TextDrawColor(s_tdInventory[7], 1162167807);
    TextDrawSetShadow(s_tdInventory[7], 0);
    TextDrawSetOutline(s_tdInventory[7], 0);
    TextDrawBackgroundColor(s_tdInventory[7], 255);
    TextDrawFont(s_tdInventory[7], 4);
    TextDrawSetProportional(s_tdInventory[7], 1);

    s_tdInventory[8] = TextDrawCreate(93.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[8], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[8], 1);
    TextDrawColor(s_tdInventory[8], 1162167807);
    TextDrawSetShadow(s_tdInventory[8], 0);
    TextDrawSetOutline(s_tdInventory[8], 0);
    TextDrawBackgroundColor(s_tdInventory[8], 255);
    TextDrawFont(s_tdInventory[8], 4);
    TextDrawSetProportional(s_tdInventory[8], 1);

    s_tdInventory[9] = TextDrawCreate(133.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[9], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[9], 1);
    TextDrawColor(s_tdInventory[9], 1162167807);
    TextDrawSetShadow(s_tdInventory[9], 0);
    TextDrawSetOutline(s_tdInventory[9], 0);
    TextDrawBackgroundColor(s_tdInventory[9], 255);
    TextDrawFont(s_tdInventory[9], 4);
    TextDrawSetProportional(s_tdInventory[9], 1);

    s_tdInventory[10] = TextDrawCreate(173.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[10], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[10], 1);
    TextDrawColor(s_tdInventory[10], 1162167807);
    TextDrawSetShadow(s_tdInventory[10], 0);
    TextDrawSetOutline(s_tdInventory[10], 0);
    TextDrawBackgroundColor(s_tdInventory[10], 255);
    TextDrawFont(s_tdInventory[10], 4);
    TextDrawSetProportional(s_tdInventory[10], 1);

    s_tdInventory[11] = TextDrawCreate(213.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[11], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[11], 1);
    TextDrawColor(s_tdInventory[11], 1162167807);
    TextDrawSetShadow(s_tdInventory[11], 0);
    TextDrawSetOutline(s_tdInventory[11], 0);
    TextDrawBackgroundColor(s_tdInventory[11], 255);
    TextDrawFont(s_tdInventory[11], 4);
    TextDrawSetProportional(s_tdInventory[11], 1);

    s_tdInventory[12] = TextDrawCreate(253.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[12], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[12], 1);
    TextDrawColor(s_tdInventory[12], 1162167807);
    TextDrawSetShadow(s_tdInventory[12], 0);
    TextDrawSetOutline(s_tdInventory[12], 0);
    TextDrawBackgroundColor(s_tdInventory[12], 255);
    TextDrawFont(s_tdInventory[12], 4);
    TextDrawSetProportional(s_tdInventory[12], 1);

    s_tdInventory[13] = TextDrawCreate(93.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[13], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[13], 1);
    TextDrawColor(s_tdInventory[13], 1162167807);
    TextDrawSetShadow(s_tdInventory[13], 0);
    TextDrawSetOutline(s_tdInventory[13], 0);
    TextDrawBackgroundColor(s_tdInventory[13], 255);
    TextDrawFont(s_tdInventory[13], 4);
    TextDrawSetProportional(s_tdInventory[13], 1);

    s_tdInventory[14] = TextDrawCreate(133.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[14], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[14], 1);
    TextDrawColor(s_tdInventory[14], 1162167807);
    TextDrawSetShadow(s_tdInventory[14], 0);
    TextDrawSetOutline(s_tdInventory[14], 0);
    TextDrawBackgroundColor(s_tdInventory[14], 255);
    TextDrawFont(s_tdInventory[14], 4);
    TextDrawSetProportional(s_tdInventory[14], 1);

    s_tdInventory[15] = TextDrawCreate(173.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[15], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[15], 1);
    TextDrawColor(s_tdInventory[15], 1162167807);
    TextDrawSetShadow(s_tdInventory[15], 0);
    TextDrawSetOutline(s_tdInventory[15], 0);
    TextDrawBackgroundColor(s_tdInventory[15], 255);
    TextDrawFont(s_tdInventory[15], 4);
    TextDrawSetProportional(s_tdInventory[15], 1);

    s_tdInventory[16] = TextDrawCreate(213.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[16], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[16], 1);
    TextDrawColor(s_tdInventory[16], 1162167807);
    TextDrawSetShadow(s_tdInventory[16], 0);
    TextDrawSetOutline(s_tdInventory[16], 0);
    TextDrawBackgroundColor(s_tdInventory[16], 255);
    TextDrawFont(s_tdInventory[16], 4);
    TextDrawSetProportional(s_tdInventory[16], 1);

    s_tdInventory[17] = TextDrawCreate(253.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[17], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[17], 1);
    TextDrawColor(s_tdInventory[17], 1162167807);
    TextDrawSetShadow(s_tdInventory[17], 0);
    TextDrawSetOutline(s_tdInventory[17], 0);
    TextDrawBackgroundColor(s_tdInventory[17], 255);
    TextDrawFont(s_tdInventory[17], 4);
    TextDrawSetProportional(s_tdInventory[17], 1);

    s_tdInventory[18] = TextDrawCreate(93.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[18], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[18], 1);
    TextDrawColor(s_tdInventory[18], 1162167807);
    TextDrawSetShadow(s_tdInventory[18], 0);
    TextDrawSetOutline(s_tdInventory[18], 0);
    TextDrawBackgroundColor(s_tdInventory[18], 255);
    TextDrawFont(s_tdInventory[18], 4);
    TextDrawSetProportional(s_tdInventory[18], 1);

    s_tdInventory[19] = TextDrawCreate(133.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[19], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[19], 1);
    TextDrawColor(s_tdInventory[19], 1162167807);
    TextDrawSetShadow(s_tdInventory[19], 0);
    TextDrawSetOutline(s_tdInventory[19], 0);
    TextDrawBackgroundColor(s_tdInventory[19], 255);
    TextDrawFont(s_tdInventory[19], 4);
    TextDrawSetProportional(s_tdInventory[19], 1);

    s_tdInventory[20] = TextDrawCreate(173.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[20], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[20], 1);
    TextDrawColor(s_tdInventory[20], 1162167807);
    TextDrawSetShadow(s_tdInventory[20], 0);
    TextDrawSetOutline(s_tdInventory[20], 0);
    TextDrawBackgroundColor(s_tdInventory[20], 255);
    TextDrawFont(s_tdInventory[20], 4);
    TextDrawSetProportional(s_tdInventory[20], 1);

    s_tdInventory[21] = TextDrawCreate(213.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[21], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[21], 1);
    TextDrawColor(s_tdInventory[21], 1162167807);
    TextDrawSetShadow(s_tdInventory[21], 0);
    TextDrawSetOutline(s_tdInventory[21], 0);
    TextDrawBackgroundColor(s_tdInventory[21], 255);
    TextDrawFont(s_tdInventory[21], 4);
    TextDrawSetProportional(s_tdInventory[21], 1);

    s_tdInventory[22] = TextDrawCreate(253.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[22], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[22], 1);
    TextDrawColor(s_tdInventory[22], 1162167807);
    TextDrawSetShadow(s_tdInventory[22], 0);
    TextDrawSetOutline(s_tdInventory[22], 0);
    TextDrawBackgroundColor(s_tdInventory[22], 255);
    TextDrawFont(s_tdInventory[22], 4);
    TextDrawSetProportional(s_tdInventory[22], 1);

    s_tdInventory[23] = TextDrawCreate(93.000, 324.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[23], 197.000, 43.000);
    TextDrawAlignment(s_tdInventory[23], 1);
    TextDrawColor(s_tdInventory[23], 623191551);
    TextDrawSetShadow(s_tdInventory[23], 0);
    TextDrawSetOutline(s_tdInventory[23], 0);
    TextDrawBackgroundColor(s_tdInventory[23], 255);
    TextDrawFont(s_tdInventory[23], 4);
    TextDrawSetProportional(s_tdInventory[23], 1);

    s_tdInventory[24] = TextDrawCreate(255.000, 341.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[24], 7.000, 9.000);
    TextDrawAlignment(s_tdInventory[24], 1);
    TextDrawColor(s_tdInventory[24], 933655551);
    TextDrawSetShadow(s_tdInventory[24], 0);
    TextDrawSetOutline(s_tdInventory[24], 0);
    TextDrawBackgroundColor(s_tdInventory[24], 255);
    TextDrawFont(s_tdInventory[24], 4);
    TextDrawSetProportional(s_tdInventory[24], 1);

    s_tdInventory[25] = TextDrawCreate(276.000, 341.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[25], 7.000, 9.000);
    TextDrawAlignment(s_tdInventory[25], 1);
    TextDrawColor(s_tdInventory[25], -197708289);
    TextDrawSetShadow(s_tdInventory[25], 0);
    TextDrawSetOutline(s_tdInventory[25], 0);
    TextDrawBackgroundColor(s_tdInventory[25], 255);
    TextDrawFont(s_tdInventory[25], 4);
    TextDrawSetProportional(s_tdInventory[25], 1);

    s_tdInventory[26] = TextDrawCreate(296.000, 120.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[26], 54.000, 16.000);
    TextDrawAlignment(s_tdInventory[26], 1);
    TextDrawColor(s_tdInventory[26], 623191551);
    TextDrawSetShadow(s_tdInventory[26], 0);
    TextDrawSetOutline(s_tdInventory[26], 0);
    TextDrawBackgroundColor(s_tdInventory[26], 255);
    TextDrawFont(s_tdInventory[26], 4);
    TextDrawSetProportional(s_tdInventory[26], 1);

    s_tdInventory[27] = TextDrawCreate(296.000, 140.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[27], 54.000, 16.000);
    TextDrawAlignment(s_tdInventory[27], 1);
    TextDrawColor(s_tdInventory[27], 623191551);
    TextDrawSetShadow(s_tdInventory[27], 0);
    TextDrawSetOutline(s_tdInventory[27], 0);
    TextDrawBackgroundColor(s_tdInventory[27], 255);
    TextDrawFont(s_tdInventory[27], 4);
    TextDrawSetProportional(s_tdInventory[27], 1);

    s_tdInventory[28] = TextDrawCreate(296.000, 160.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[28], 54.000, 16.000);
    TextDrawAlignment(s_tdInventory[28], 1);
    TextDrawColor(s_tdInventory[28], 623191551);
    TextDrawSetShadow(s_tdInventory[28], 0);
    TextDrawSetOutline(s_tdInventory[28], 0);
    TextDrawBackgroundColor(s_tdInventory[28], 255);
    TextDrawFont(s_tdInventory[28], 4);
    TextDrawSetProportional(s_tdInventory[28], 1);

    s_tdInventory[29] = TextDrawCreate(357.000, 120.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[29], 175.000, 1.000);
    TextDrawAlignment(s_tdInventory[29], 1);
    TextDrawColor(s_tdInventory[29], -538976257);
    TextDrawSetShadow(s_tdInventory[29], 0);
    TextDrawSetOutline(s_tdInventory[29], 0);
    TextDrawBackgroundColor(s_tdInventory[29], 255);
    TextDrawFont(s_tdInventory[29], 4);
    TextDrawSetProportional(s_tdInventory[29], 1);

    s_tdInventory[30] = TextDrawCreate(534.000, 114.000, "LOJA");
    TextDrawLetterSize(s_tdInventory[30], 0.230, 1.199);
    TextDrawAlignment(s_tdInventory[30], 1);
    TextDrawColor(s_tdInventory[30], -538976257);
    TextDrawSetShadow(s_tdInventory[30], 1);
    TextDrawSetOutline(s_tdInventory[30], 0);
    TextDrawBackgroundColor(s_tdInventory[30], 0);
    TextDrawFont(s_tdInventory[30], 1);
    TextDrawSetProportional(s_tdInventory[30], 1);

    s_tdInventory[31] = TextDrawCreate(357.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[31], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[31], 1);
    TextDrawColor(s_tdInventory[31], 1162167807);
    TextDrawSetShadow(s_tdInventory[31], 0);
    TextDrawSetOutline(s_tdInventory[31], 0);
    TextDrawBackgroundColor(s_tdInventory[31], 255);
    TextDrawFont(s_tdInventory[31], 4);
    TextDrawSetProportional(s_tdInventory[31], 1);

    s_tdInventory[32] = TextDrawCreate(397.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[32], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[32], 1);
    TextDrawColor(s_tdInventory[32], 1162167807);
    TextDrawSetShadow(s_tdInventory[32], 0);
    TextDrawSetOutline(s_tdInventory[32], 0);
    TextDrawBackgroundColor(s_tdInventory[32], 255);
    TextDrawFont(s_tdInventory[32], 4);
    TextDrawSetProportional(s_tdInventory[32], 1);

    s_tdInventory[33] = TextDrawCreate(437.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[33], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[33], 1);
    TextDrawColor(s_tdInventory[33], 1162167807);
    TextDrawSetShadow(s_tdInventory[33], 0);
    TextDrawSetOutline(s_tdInventory[33], 0);
    TextDrawBackgroundColor(s_tdInventory[33], 255);
    TextDrawFont(s_tdInventory[33], 4);
    TextDrawSetProportional(s_tdInventory[33], 1);

    s_tdInventory[34] = TextDrawCreate(477.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[34], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[34], 1);
    TextDrawColor(s_tdInventory[34], 1162167807);
    TextDrawSetShadow(s_tdInventory[34], 0);
    TextDrawSetOutline(s_tdInventory[34], 0);
    TextDrawBackgroundColor(s_tdInventory[34], 255);
    TextDrawFont(s_tdInventory[34], 4);
    TextDrawSetProportional(s_tdInventory[34], 1);

    s_tdInventory[35] = TextDrawCreate(517.000, 132.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[35], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[35], 1);
    TextDrawColor(s_tdInventory[35], 1162167807);
    TextDrawSetShadow(s_tdInventory[35], 0);
    TextDrawSetOutline(s_tdInventory[35], 0);
    TextDrawBackgroundColor(s_tdInventory[35], 255);
    TextDrawFont(s_tdInventory[35], 4);
    TextDrawSetProportional(s_tdInventory[35], 1);

    s_tdInventory[36] = TextDrawCreate(357.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[36], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[36], 1);
    TextDrawColor(s_tdInventory[36], 1162167807);
    TextDrawSetShadow(s_tdInventory[36], 0);
    TextDrawSetOutline(s_tdInventory[36], 0);
    TextDrawBackgroundColor(s_tdInventory[36], 255);
    TextDrawFont(s_tdInventory[36], 4);
    TextDrawSetProportional(s_tdInventory[36], 1);

    s_tdInventory[37] = TextDrawCreate(397.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[37], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[37], 1);
    TextDrawColor(s_tdInventory[37], 1162167807);
    TextDrawSetShadow(s_tdInventory[37], 0);
    TextDrawSetOutline(s_tdInventory[37], 0);
    TextDrawBackgroundColor(s_tdInventory[37], 255);
    TextDrawFont(s_tdInventory[37], 4);
    TextDrawSetProportional(s_tdInventory[37], 1);

    s_tdInventory[38] = TextDrawCreate(437.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[38], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[38], 1);
    TextDrawColor(s_tdInventory[38], 1162167807);
    TextDrawSetShadow(s_tdInventory[38], 0);
    TextDrawSetOutline(s_tdInventory[38], 0);
    TextDrawBackgroundColor(s_tdInventory[38], 255);
    TextDrawFont(s_tdInventory[38], 4);
    TextDrawSetProportional(s_tdInventory[38], 1);

    s_tdInventory[39] = TextDrawCreate(477.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[39], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[39], 1);
    TextDrawColor(s_tdInventory[39], 1162167807);
    TextDrawSetShadow(s_tdInventory[39], 0);
    TextDrawSetOutline(s_tdInventory[39], 0);
    TextDrawBackgroundColor(s_tdInventory[39], 255);
    TextDrawFont(s_tdInventory[39], 4);
    TextDrawSetProportional(s_tdInventory[39], 1);

    s_tdInventory[40] = TextDrawCreate(517.000, 180.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[40], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[40], 1);
    TextDrawColor(s_tdInventory[40], 1162167807);
    TextDrawSetShadow(s_tdInventory[40], 0);
    TextDrawSetOutline(s_tdInventory[40], 0);
    TextDrawBackgroundColor(s_tdInventory[40], 255);
    TextDrawFont(s_tdInventory[40], 4);
    TextDrawSetProportional(s_tdInventory[40], 1);

    s_tdInventory[41] = TextDrawCreate(357.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[41], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[41], 1);
    TextDrawColor(s_tdInventory[41], 1162167807);
    TextDrawSetShadow(s_tdInventory[41], 0);
    TextDrawSetOutline(s_tdInventory[41], 0);
    TextDrawBackgroundColor(s_tdInventory[41], 255);
    TextDrawFont(s_tdInventory[41], 4);
    TextDrawSetProportional(s_tdInventory[41], 1);

    s_tdInventory[42] = TextDrawCreate(397.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[42], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[42], 1);
    TextDrawColor(s_tdInventory[42], 1162167807);
    TextDrawSetShadow(s_tdInventory[42], 0);
    TextDrawSetOutline(s_tdInventory[42], 0);
    TextDrawBackgroundColor(s_tdInventory[42], 255);
    TextDrawFont(s_tdInventory[42], 4);
    TextDrawSetProportional(s_tdInventory[42], 1);

    s_tdInventory[43] = TextDrawCreate(437.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[43], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[43], 1);
    TextDrawColor(s_tdInventory[43], 1162167807);
    TextDrawSetShadow(s_tdInventory[43], 0);
    TextDrawSetOutline(s_tdInventory[43], 0);
    TextDrawBackgroundColor(s_tdInventory[43], 255);
    TextDrawFont(s_tdInventory[43], 4);
    TextDrawSetProportional(s_tdInventory[43], 1);

    s_tdInventory[44] = TextDrawCreate(477.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[44], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[44], 1);
    TextDrawColor(s_tdInventory[44], 1162167807);
    TextDrawSetShadow(s_tdInventory[44], 0);
    TextDrawSetOutline(s_tdInventory[44], 0);
    TextDrawBackgroundColor(s_tdInventory[44], 255);
    TextDrawFont(s_tdInventory[44], 4);
    TextDrawSetProportional(s_tdInventory[44], 1);

    s_tdInventory[45] = TextDrawCreate(517.000, 227.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[45], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[45], 1);
    TextDrawColor(s_tdInventory[45], 1162167807);
    TextDrawSetShadow(s_tdInventory[45], 0);
    TextDrawSetOutline(s_tdInventory[45], 0);
    TextDrawBackgroundColor(s_tdInventory[45], 255);
    TextDrawFont(s_tdInventory[45], 4);
    TextDrawSetProportional(s_tdInventory[45], 1);

    s_tdInventory[46] = TextDrawCreate(357.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[46], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[46], 1);
    TextDrawColor(s_tdInventory[46], 1162167807);
    TextDrawSetShadow(s_tdInventory[46], 0);
    TextDrawSetOutline(s_tdInventory[46], 0);
    TextDrawBackgroundColor(s_tdInventory[46], 255);
    TextDrawFont(s_tdInventory[46], 4);
    TextDrawSetProportional(s_tdInventory[46], 1);

    s_tdInventory[47] = TextDrawCreate(397.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[47], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[47], 1);
    TextDrawColor(s_tdInventory[47], 1162167807);
    TextDrawSetShadow(s_tdInventory[47], 0);
    TextDrawSetOutline(s_tdInventory[47], 0);
    TextDrawBackgroundColor(s_tdInventory[47], 255);
    TextDrawFont(s_tdInventory[47], 4);
    TextDrawSetProportional(s_tdInventory[47], 1);

    s_tdInventory[48] = TextDrawCreate(437.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[48], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[48], 1);
    TextDrawColor(s_tdInventory[48], 1162167807);
    TextDrawSetShadow(s_tdInventory[48], 0);
    TextDrawSetOutline(s_tdInventory[48], 0);
    TextDrawBackgroundColor(s_tdInventory[48], 255);
    TextDrawFont(s_tdInventory[48], 4);
    TextDrawSetProportional(s_tdInventory[48], 1);

    s_tdInventory[49] = TextDrawCreate(477.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[49], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[49], 1);
    TextDrawColor(s_tdInventory[49], 1162167807);
    TextDrawSetShadow(s_tdInventory[49], 0);
    TextDrawSetOutline(s_tdInventory[49], 0);
    TextDrawBackgroundColor(s_tdInventory[49], 255);
    TextDrawFont(s_tdInventory[49], 4);
    TextDrawSetProportional(s_tdInventory[49], 1);

    s_tdInventory[50] = TextDrawCreate(517.000, 275.000, "LD_SPAC:white");
    TextDrawTextSize(s_tdInventory[50], 36.000, 43.000);
    TextDrawAlignment(s_tdInventory[50], 1);
    TextDrawColor(s_tdInventory[50], 1162167807);
    TextDrawSetShadow(s_tdInventory[50], 0);
    TextDrawSetOutline(s_tdInventory[50], 0);
    TextDrawBackgroundColor(s_tdInventory[50], 255);
    TextDrawFont(s_tdInventory[50], 4);
    TextDrawSetProportional(s_tdInventory[50], 1);

    return true;
}

hook OnPlayerConnect(playerid)
{
    // Slots Inventário
    s_ptdInventorySlots[playerid][0] = CreatePlayerTextDraw(playerid, 94.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][0], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][0], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][0], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][0], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][0], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][0], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][0], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][0], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][0], 1);

    s_ptdInventorySlots[playerid][1] = CreatePlayerTextDraw(playerid, 134.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][1], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][1], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][1], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][1], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][1], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][1], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][1], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][1], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][1], 1);

    s_ptdInventorySlots[playerid][2] = CreatePlayerTextDraw(playerid, 174.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][2], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][2], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][2], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][2], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][2], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][2], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][2], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][2], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][2], 1);

    s_ptdInventorySlots[playerid][3] = CreatePlayerTextDraw(playerid, 214.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][3], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][3], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][3], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][3], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][3], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][3], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][3], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][3], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][3], 1);

    s_ptdInventorySlots[playerid][4] = CreatePlayerTextDraw(playerid, 254.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][4], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][4], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][4], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][4], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][4], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][4], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][4], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][4], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][4], 1);

    s_ptdInventorySlots[playerid][5] = CreatePlayerTextDraw(playerid, 94.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][5], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][5], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][5], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][5], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][5], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][5], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][5], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][5], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][5], 1);

    s_ptdInventorySlots[playerid][6] = CreatePlayerTextDraw(playerid, 134.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][6], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][6], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][6], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][6], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][6], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][6], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][6], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][6], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][6], 1);

    s_ptdInventorySlots[playerid][7] = CreatePlayerTextDraw(playerid, 174.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][7], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][7], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][7], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][7], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][7], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][7], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][7], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][7], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][7], 1);

    s_ptdInventorySlots[playerid][8] = CreatePlayerTextDraw(playerid, 214.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][8], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][8], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][8], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][8], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][8], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][8], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][8], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][8], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][8], 1);

    s_ptdInventorySlots[playerid][9] = CreatePlayerTextDraw(playerid, 254.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][9], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][9], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][9], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][9], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][9], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][9], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][9], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][9], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][9], 1);

    s_ptdInventorySlots[playerid][10] = CreatePlayerTextDraw(playerid, 94.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][10], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][10], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][10], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][10], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][10], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][10], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][10], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][10], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][10], 1);

    s_ptdInventorySlots[playerid][11] = CreatePlayerTextDraw(playerid, 134.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][11], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][11], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][11], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][11], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][11], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][11], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][11], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][11], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][11], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][11], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][11], 1);

    s_ptdInventorySlots[playerid][12] = CreatePlayerTextDraw(playerid, 174.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][12], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][12], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][12], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][12], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][12], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][12], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][12], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][12], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][12], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][12], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][12], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][12], 1);

    s_ptdInventorySlots[playerid][13] = CreatePlayerTextDraw(playerid, 214.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][13], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][13], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][13], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][13], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][13], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][13], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][13], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][13], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][13], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][13], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][13], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][13], 1);

    s_ptdInventorySlots[playerid][14] = CreatePlayerTextDraw(playerid, 254.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][14], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][14], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][14], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][14], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][14], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][14], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][14], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][14], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][14], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][14], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][14], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][14], 1);

    s_ptdInventorySlots[playerid][15] = CreatePlayerTextDraw(playerid, 94.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][15], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][15], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][15], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][15], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][15], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][15], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][15], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][15], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][15], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][15], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][15], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][15], 1);

    s_ptdInventorySlots[playerid][16] = CreatePlayerTextDraw(playerid, 134.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][16], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][16], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][16], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][16], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][16], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][16], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][16], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][16], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][16], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][16], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][16], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][16], 1);

    s_ptdInventorySlots[playerid][17] = CreatePlayerTextDraw(playerid, 174.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][17], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][17], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][17], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][17], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][17], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][17], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][17], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][17], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][17], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][17], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][17], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][17], 1);

    s_ptdInventorySlots[playerid][18] = CreatePlayerTextDraw(playerid, 214.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][18], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][18], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][18], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][18], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][18], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][18], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][18], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][18], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][18], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][18], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][18], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][18], 1);

    s_ptdInventorySlots[playerid][19] = CreatePlayerTextDraw(playerid, 254.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][19], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][19], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][19], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][19], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][19], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][19], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][19], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][19], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][19], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][19], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][19], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][19], 1);

    // Informações do Item

    s_ptdInventorySlots[playerid][20] = CreatePlayerTextDraw(playerid, 97.000, 329.000, "_"); // OBJETO SELECIONADO
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][20], 29.000, 33.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][20], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][20], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][20], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][20], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][20], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][20], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][20], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][20], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][20], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][20], 0, 0);

    s_ptdInventorySlots[playerid][21] = CreatePlayerTextDraw(playerid, 127.000, 337.000, "MedKit");
    PlayerTextDrawLetterSize(playerid, s_ptdInventorySlots[playerid][21], 0.180, 0.898);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][21], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][21], -538976257);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][21], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][21], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][21], 0);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][21], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][21], 1);

    s_ptdInventorySlots[playerid][22] = CreatePlayerTextDraw(playerid, 127.000, 345.000, "Uitilzado para estacar uma ferida");
    PlayerTextDrawLetterSize(playerid, s_ptdInventorySlots[playerid][22], 0.128, 0.699);
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][22], 179.000, 0.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][22], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][22], 1616929023);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][22], 1);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][22], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][22], 0);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][22], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][22], 1);

    s_ptdInventorySlots[playerid][23] = CreatePlayerTextDraw(playerid, 256.500, 341.000, "+");
    PlayerTextDrawLetterSize(playerid, s_ptdInventorySlots[playerid][23], 0.180, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][23], 212.000, 10.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][23], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][23], -538976257);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][23], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][23], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][23], 0);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][23], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][23], 1);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][23], 1);

    s_ptdInventorySlots[playerid][24] = CreatePlayerTextDraw(playerid, 278.000, 342.000, "-");
    PlayerTextDrawLetterSize(playerid, s_ptdInventorySlots[playerid][24], 0.180, 0.597);
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][24], 233.000, 10.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][24], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][24], -538976257);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][24], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][24], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][24], 0);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][24], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][24], 1);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][24], 1);

    s_ptdInventorySlots[playerid][25] = CreatePlayerTextDraw(playerid, 269.000, 342.000, "83");
    PlayerTextDrawLetterSize(playerid, s_ptdInventorySlots[playerid][25], 0.140, 0.699);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][25], 2);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][25], -538976257);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][25], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][25], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][25], 0);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][25], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][25], 1);

    s_ptdInventorySlots[playerid][26] = CreatePlayerTextDraw(playerid, 316.500, 123.000, "Usar");
    PlayerTextDrawLetterSize(playerid, s_ptdInventorySlots[playerid][26], 0.180, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][26], 284.000, 10.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][26], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][26], -538976257);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][26], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][26], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][26], 0);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][26], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][26], 1);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][26], 1);

    s_ptdInventorySlots[playerid][27] = CreatePlayerTextDraw(playerid, 314.500, 143.000, "Enviar");
    PlayerTextDrawLetterSize(playerid, s_ptdInventorySlots[playerid][27], 0.180, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][27], 286.000, 10.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][27], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][27], -538976257);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][27], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][27], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][27], 0);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][27], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][27], 1);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][27], 1);

    s_ptdInventorySlots[playerid][28] = CreatePlayerTextDraw(playerid, 313.500, 163.000, "Dropar");
    PlayerTextDrawLetterSize(playerid, s_ptdInventorySlots[playerid][28], 0.180, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][28], 287.000, 10.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][28], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][28], -538976257);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][28], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][28], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][28], 0);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][28], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][28], 1);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][28], 1);

    // Slots de Chão/Loja/Bau
    s_ptdInventorySlots[playerid][29] = CreatePlayerTextDraw(playerid, 358.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][29], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][29], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][29], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][29], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][29], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][29], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][29], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][29], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][29], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][29], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][29], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][29], 1);

    s_ptdInventorySlots[playerid][30] = CreatePlayerTextDraw(playerid, 398.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][30], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][30], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][30], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][30], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][30], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][30], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][30], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][30], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][30], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][30], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][30], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][30], 1);

    s_ptdInventorySlots[playerid][31] = CreatePlayerTextDraw(playerid, 438.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][31], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][31], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][31], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][31], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][31], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][31], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][31], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][31], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][31], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][31], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][31], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][31], 1);

    s_ptdInventorySlots[playerid][32] = CreatePlayerTextDraw(playerid, 478.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][32], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][32], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][32], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][32], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][32], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][32], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][32], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][32], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][32], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][32], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][32], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][32], 1);

    s_ptdInventorySlots[playerid][33] = CreatePlayerTextDraw(playerid, 518.000, 133.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][33], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][33], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][33], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][33], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][33], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][33], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][33], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][33], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][33], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][33], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][33], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][33], 1);

    s_ptdInventorySlots[playerid][34] = CreatePlayerTextDraw(playerid, 358.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][34], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][34], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][34], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][34], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][34], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][34], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][34], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][34], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][34], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][34], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][34], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][34], 1);

    s_ptdInventorySlots[playerid][35] = CreatePlayerTextDraw(playerid, 398.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][35], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][35], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][35], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][35], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][35], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][35], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][35], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][35], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][35], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][35], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][35], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][35], 1);

    s_ptdInventorySlots[playerid][36] = CreatePlayerTextDraw(playerid, 438.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][36], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][36], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][36], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][36], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][36], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][36], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][36], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][36], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][36], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][36], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][36], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][36], 1);

    s_ptdInventorySlots[playerid][37] = CreatePlayerTextDraw(playerid, 478.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][37], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][37], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][37], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][37], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][37], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][37], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][37], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][37], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][37], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][37], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][37], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][37], 1);

    s_ptdInventorySlots[playerid][38] = CreatePlayerTextDraw(playerid, 518.000, 181.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][38], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][38], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][38], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][38], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][38], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][38], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][38], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][38], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][38], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][38], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][38], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][38], 1);

    s_ptdInventorySlots[playerid][39] = CreatePlayerTextDraw(playerid, 358.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][39], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][39], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][39], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][39], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][39], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][39], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][39], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][39], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][39], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][39], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][39], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][39], 1);

    s_ptdInventorySlots[playerid][40] = CreatePlayerTextDraw(playerid, 398.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][40], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][40], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][40], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][40], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][40], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][40], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][40], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][40], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][40], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][40], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][40], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][40], 1);

    s_ptdInventorySlots[playerid][41] = CreatePlayerTextDraw(playerid, 438.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][41], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][41], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][41], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][41], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][41], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][41], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][41], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][41], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][41], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][41], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][41], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][41], 1);

    s_ptdInventorySlots[playerid][42] = CreatePlayerTextDraw(playerid, 478.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][42], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][42], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][42], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][42], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][42], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][42], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][42], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][42], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][42], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][42], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][42], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][42], 1);

    s_ptdInventorySlots[playerid][43] = CreatePlayerTextDraw(playerid, 518.000, 228.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][43], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][43], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][43], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][43], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][43], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][43], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][43], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][43], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][43], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][43], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][43], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][43], 1);

    s_ptdInventorySlots[playerid][44] = CreatePlayerTextDraw(playerid, 358.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][44], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][44], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][44], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][44], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][44], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][44], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][44], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][44], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][44], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][44], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][44], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][44], 1);

    s_ptdInventorySlots[playerid][45] = CreatePlayerTextDraw(playerid, 398.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][45], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][45], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][45], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][45], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][45], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][45], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][45], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][45], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][45], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][45], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][45], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][45], 1);

    s_ptdInventorySlots[playerid][46] = CreatePlayerTextDraw(playerid, 438.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][46], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][46], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][46], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][46], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][46], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][46], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][46], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][46], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][46], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][46], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][46], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][46], 1);

    s_ptdInventorySlots[playerid][47] = CreatePlayerTextDraw(playerid, 478.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][47], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][47], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][47], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][47], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][47], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][47], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][47], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][47], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][47], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][47], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][47], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][47], 1);

    s_ptdInventorySlots[playerid][48] = CreatePlayerTextDraw(playerid, 518.000, 276.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdInventorySlots[playerid][48], 34.000, 41.000);
    PlayerTextDrawAlignment(playerid, s_ptdInventorySlots[playerid][48], 1);
    PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][48], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdInventorySlots[playerid][48], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdInventorySlots[playerid][48], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][48], 623191551);
    PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][48], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdInventorySlots[playerid][48], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][48], 663);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][48], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdInventorySlots[playerid][48], 0, 0);
    PlayerTextDrawSetSelectable(playerid, s_ptdInventorySlots[playerid][48], 1);

    return true;
}