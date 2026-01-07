/*
     ooooo   ooooo                   .o8  
     `888'   `888'                  "888  
      888     888  oooo  oooo   .oooo888  
      888ooooo888  `888  `888  d88' `888  
      888     888   888   888  888   888  
      888     888   888   888  888   888  
     o888o   o888o  `V88V"V8P' `Y8bod88P" 
                                                                         
*/

// Include
#include <YSI_Coding\y_hooks>

// Variáveis
static PlayerText:s_ptdHud[MAX_PLAYERS][31];

// Callbacks
hook OnPlayerConnect(playerid)
{
    s_ptdHud[playerid][0] = CreatePlayerTextDraw(playerid, 292.000, 32.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][0], 58.000, -1.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][0], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][0], -1054597121);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][0], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][0], 1);

    s_ptdHud[playerid][1] = CreatePlayerTextDraw(playerid, 298.000, 31.000, "PAULISTA");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][1], 0.330, 1.399);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][1], 42.000, 32.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][1], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][1], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][1], 3);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][1], 1);

    s_ptdHud[playerid][2] = CreatePlayerTextDraw(playerid, 292.000, 46.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][2], 58.000, -1.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][2], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][2], -1054597121);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][2], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][2], 1);

    s_ptdHud[playerid][3] = CreatePlayerTextDraw(playerid, 308.000, 47.000, "NETWORK");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][3], 0.119, 0.499);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][3], 57.000, 46.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][3], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][3], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][3], 2);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][3], 1);

    s_ptdHud[playerid][4] = CreatePlayerTextDraw(playerid, 479.000, 327.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][4], 112.000, 119.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][4], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][4], -1884701441);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][4], 0);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][4], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][4], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdHud[playerid][4], 1214);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdHud[playerid][4], -250.000, 0.000, 0.000, 1.100);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdHud[playerid][4], 0, 0);

    s_ptdHud[playerid][5] = CreatePlayerTextDraw(playerid, 506.000, 327.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][5], 112.000, 119.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][5], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][5], -528262401);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][5], 0);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][5], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][5], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdHud[playerid][5], 1214);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdHud[playerid][5], -250.000, 0.000, 0.000, 1.100);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdHud[playerid][5], 0, 0);

    s_ptdHud[playerid][6] = CreatePlayerTextDraw(playerid, 533.000, 327.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][6], 112.000, 119.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][6], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][6], -10270721);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][6], 0);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][6], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][6], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdHud[playerid][6], 1214);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdHud[playerid][6], -250.000, 0.000, 0.000, 1.100);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdHud[playerid][6], 0, 0);

    s_ptdHud[playerid][7] = CreatePlayerTextDraw(playerid, 560.000, 327.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][7], 112.000, 119.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][7], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][7], 1887473919);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][7], 0);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][7], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][7], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdHud[playerid][7], 1214);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdHud[playerid][7], -250.000, 0.000, 0.000, 1.100);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdHud[playerid][7], 0, 0);

    s_ptdHud[playerid][8] = CreatePlayerTextDraw(playerid, 531.000, 426.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][8], 8.000, 11.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][8], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][8], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][8], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][8], 1);

    s_ptdHud[playerid][9] = CreatePlayerTextDraw(playerid, 532.000, 436.000, "v");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][9], 0.300, -1.500);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][9], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][9], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][9], 1);

    s_ptdHud[playerid][10] = CreatePlayerTextDraw(playerid, 555.000, 424.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][10], 14.000, 11.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][10], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][10], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][10], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][10], 1);

    s_ptdHud[playerid][11] = CreatePlayerTextDraw(playerid, 557.000, 428.500, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][11], 10.000, 2.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][11], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][11], -528262401);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][11], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][11], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][11], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][11], 1);

    s_ptdHud[playerid][12] = CreatePlayerTextDraw(playerid, 583.500, 423.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][12], 7.000, 8.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][12], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][12], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][12], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][12], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][12], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][12], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][12], 1);

    s_ptdHud[playerid][13] = CreatePlayerTextDraw(playerid, 587.500, 423.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][13], 7.000, 8.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][13], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][13], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][13], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][13], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][13], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][13], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][13], 1);

    s_ptdHud[playerid][14] = CreatePlayerTextDraw(playerid, 584.500, 423.000, "v");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][14], 0.479, 1.500);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][14], 33.000, 0.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][14], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][14], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][14], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][14], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][14], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][14], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][14], 1);

    s_ptdHud[playerid][15] = CreatePlayerTextDraw(playerid, 586.500, 427.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][15], 6.000, 5.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][15], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][15], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][15], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][15], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][15], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][15], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][15], 1);

    s_ptdHud[playerid][16] = CreatePlayerTextDraw(playerid, 613.000, 422.000, "Z");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][16], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][16], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][16], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][16], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][16], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][16], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][16], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][16], 1);

    s_ptdHud[playerid][17] = CreatePlayerTextDraw(playerid, -22.000, 361.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][17], 76.000, 80.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][17], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][17], 1887473919);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][17], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][17], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][17], 0);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][17], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][17], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdHud[playerid][17], 1214);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdHud[playerid][17], -250.000, 0.000, 0.000, 1.100);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdHud[playerid][17], 0, 0);

    s_ptdHud[playerid][18] = CreatePlayerTextDraw(playerid, 26.000, 422.000, "Sao Paulo");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][18], 0.159, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][18], 100.000, 100.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][18], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][18], -1061109505);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][18], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][18], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][18], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][18], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][18], 1);

    s_ptdHud[playerid][19] = CreatePlayerTextDraw(playerid, 26.000, 429.000, "Rua do Viado");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][19], 0.158, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][19], 100.000, 100.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][19], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][19], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][19], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][19], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][19], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][19], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][19], 1);

    s_ptdHud[playerid][20] = CreatePlayerTextDraw(playerid, 14.000, 424.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][20], 3.000, 12.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][20], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][20], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][20], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][20], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][20], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][20], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][20], 1);

    s_ptdHud[playerid][21] = CreatePlayerTextDraw(playerid, 11.000, 429.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][21], 9.000, 4.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][21], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][21], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][21], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][21], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][21], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][21], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][21], 1);

    s_ptdHud[playerid][22] = CreatePlayerTextDraw(playerid, 539.000, 407.000, "100");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][22], 0.159, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][22], -15.000, -2.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][22], 3);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][22], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][22], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][22], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][22], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][22], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][22], 1);

    s_ptdHud[playerid][23] = CreatePlayerTextDraw(playerid, 566.000, 407.000, "100");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][23], 0.159, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][23], -15.000, -2.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][23], 3);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][23], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][23], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][23], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][23], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][23], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][23], 1);

    s_ptdHud[playerid][24] = CreatePlayerTextDraw(playerid, 593.000, 407.000, "100");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][24], 0.159, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][24], -15.000, -2.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][24], 3);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][24], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][24], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][24], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][24], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][24], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][24], 1);

    s_ptdHud[playerid][25] = CreatePlayerTextDraw(playerid, 620.000, 407.000, "100");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][25], 0.159, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][25], -15.000, -2.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][25], 3);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][25], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][25], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][25], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][25], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][25], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][25], 1);

    s_ptdHud[playerid][26] = CreatePlayerTextDraw(playerid, 583.000, -34.000, "_");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][26], 76.000, 80.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][26], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][26], 1887473919);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][26], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][26], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][26], 0);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][26], 5);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][26], 0);
    PlayerTextDrawSetPreviewModel(playerid, s_ptdHud[playerid][26], 1214);
    PlayerTextDrawSetPreviewRot(playerid, s_ptdHud[playerid][26], -250.000, 0.000, 0.000, 1.100);
    PlayerTextDrawSetPreviewVehCol(playerid, s_ptdHud[playerid][26], 0, 0);

    s_ptdHud[playerid][27] = CreatePlayerTextDraw(playerid, 616.000, 30.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][27], 10.000, 10.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][27], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][27], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][27], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][27], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][27], 255);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][27], 4);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][27], 1);

    s_ptdHud[playerid][28] = CreatePlayerTextDraw(playerid, 620.000, 28.000, "L");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][28], 0.219, 1.098);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][28], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][28], 1887473919);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][28], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][28], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][28], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][28], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][28], 1);

    s_ptdHud[playerid][29] = CreatePlayerTextDraw(playerid, 591.000, 28.000, "Horario");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][29], 0.159, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][29], -15.000, -2.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][29], 1);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][29], -1061109505);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][29], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][29], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][29], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][29], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][29], 1);

    s_ptdHud[playerid][30] = CreatePlayerTextDraw(playerid, 611.000, 35.000, "00:00:00");
    PlayerTextDrawLetterSize(playerid, s_ptdHud[playerid][30], 0.159, 0.898);
    PlayerTextDrawTextSize(playerid, s_ptdHud[playerid][30], -15.000, -2.000);
    PlayerTextDrawAlignment(playerid, s_ptdHud[playerid][30], 3);
    PlayerTextDrawColor(playerid, s_ptdHud[playerid][30], -1);
    PlayerTextDrawSetShadow(playerid, s_ptdHud[playerid][30], 0);
    PlayerTextDrawSetOutline(playerid, s_ptdHud[playerid][30], 0);
    PlayerTextDrawBackgroundColor(playerid, s_ptdHud[playerid][30], 150);
    PlayerTextDrawFont(playerid, s_ptdHud[playerid][30], 1);
    PlayerTextDrawSetProportional(playerid, s_ptdHud[playerid][30], 1);

    return true;
}

hook OnCharacterLoaded(playerid)
{
    Hud_Show(playerid);
    return true;
}    

// Functions
Hud_Show(playerid)
{
	for (new i = 0; i < sizeof(s_ptdHud[]); i++)
	{
		if (s_ptdHud[playerid][i] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawShow(playerid, s_ptdHud[playerid][i]);
		}
	}
}

Hud_Hide(playerid)
{
	for (new i = 0; i < sizeof(s_ptdHud[]); i++)
	{
		if (s_ptdHud[playerid][i] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawHide(playerid, s_ptdHud[playerid][i]);
		}
	}
}

// Tasks
task UpdateHud[1000]()
{
    new horas, minutos, segundos;
    gettime(horas, minutos, segundos);
    
    new strTime[10];
    format(strTime, sizeof(strTime), "%02d:%02d:%02d", horas, minutos, segundos);

    foreach(new i : Player)
    {
        // Atualiza Hora
        PlayerTextDrawSetString(i, s_ptdHud[i][30], strTime);

        new Float:x, Float:y, Float:z;
        GetPlayerPos(i, x, y, z);

        // Atualiza Rua
        PlayerTextDrawSetString(i, s_ptdHud[i][19], ReturnStreet(x, y, true));

        // Atualiza Cidade
        PlayerTextDrawSetString(i, s_ptdHud[i][18], ReturnCity(x, y));

        // Atualização Fome Sede Sono 
        new strBarra[5];

        // Sede
        format(strBarra, sizeof(strBarra), "%d", floatround(CharacterData[i][e_CHARACTER_THIRST]));
        PlayerTextDrawSetString(i, s_ptdHud[i][22], strBarra);

        // Fome
        format(strBarra, sizeof(strBarra), "%d", floatround(CharacterData[i][e_CHARACTER_HUNGER]));
        PlayerTextDrawSetString(i, s_ptdHud[i][23], strBarra);

        // Sono
        format(strBarra, sizeof(strBarra), "%d", floatround(CharacterData[i][e_CHARACTER_SLEEP]));
        PlayerTextDrawSetString(i, s_ptdHud[i][25], strBarra);
    }

    return true;
}