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

// Defines
#define SLOT_PLAYER_START   0
#define SLOT_PLAYER_END     19
#define SLOT_SEC_START      29
#define SLOT_SEC_END        48

// Enumerações
enum {
    SIDE_PLAYER,   
    SIDE_SECONDARY  
}

enum {
    INV_TIPO_NENHUM,
    INV_TIPO_CHAO,      // Drops no chão
    INV_TIPO_VEICULO,   // Porta-malas
    INV_TIPO_LOJA       // Lojas
}

// Variáveis Globais
new pInvSelectedSlot[MAX_PLAYERS];  	// Slot selecionado (-1 se nenhum)
new pInvSelectedSide[MAX_PLAYERS];  	// Lado (Player ou Secundário)
new pInvSelectedQtd[MAX_PLAYERS];   	// Quantidade selecionada no display
new bool:pInventoryOpen[MAX_PLAYERS]; 	// Se está aberto
new pInvSecondaryType[MAX_PLAYERS]; 	// O que está aberto? (Chão, Carro...)
new pInvSecID[MAX_PLAYERS];         	// ID do que está aberto (VehicleID, HouseID...)


// Calcula a coordenada exata atrás do veículo (Porta-Malas)
stock GetVehicleBootPos(vehicleid, &Float:x, &Float:y, &Float:z)
{
    new Float:vX, Float:vY, Float:vZ, Float:vA;
    GetVehiclePos(vehicleid, vX, vY, vZ);
    GetVehicleZAngle(vehicleid, vA);
    
    new Float:fX, Float:fY, Float:fZ;
    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, fX, fY, fZ);
    
    x = vX - (fY / 2.0 + 0.5) * floatsin(-vA, degrees);
    y = vY - (fY / 2.0 + 0.5) * floatcos(-vA, degrees);
    z = vZ;
}

// Procura o porta-malas mais próximo
stock GetClosestTrunk(playerid, Float:range = 2.0)
{
    new Float:pX, Float:pY, Float:pZ;
    GetPlayerPos(playerid, pX, pY, pZ);
    
    new closest = -1;
    new Float:dist = range;
    
    for(new i = 1; i < MAX_VEHICLES; i++)
    {
        if(GetVehicleModel(i) == 0) continue; 

        new Float:bX, Float:bY, Float:bZ;
        GetVehicleBootPos(i, bX, bY, bZ); 

        new Float:tempDist = GetPlayerDistanceFromPoint(playerid, bX, bY, bZ);
        if(tempDist < dist)
        {
            dist = tempDist;
            closest = i;
        }
    }
    return closest;
}

// Decide o que vai abrir no lado direito
stock DefinirAberturaInventario(playerid)
{
    // 1. Verifica Porta-Malas
    new vehicleid = GetClosestTrunk(playerid);
    if(vehicleid != -1)
    {
        // [TODO] Adicione aqui verificação se veículo está trancado
        pInvSecondaryType[playerid] = INV_TIPO_VEICULO;
        pInvSecID[playerid] = vehicleid;
        
        TextDrawSetString(s_tdInventory[30], "PORTA-MALAS"); 
        return 1;
    }

    // 2. Padrão: CHÃO
    pInvSecondaryType[playerid] = INV_TIPO_CHAO;
    pInvSecID[playerid] = 0;
    TextDrawSetString(s_tdInventory[30], "CHAO");
    
    return 1;
}

stock AtualizarDisplayQuantidade(playerid)
{
    new str[16];
    format(str, sizeof(str), "%d", pInvSelectedQtd[playerid]);
    PlayerTextDrawSetString(playerid, s_ptdInventorySlots[playerid][25], str);
    PlayerTextDrawShow(playerid, s_ptdInventorySlots[playerid][25]);
}

stock AtualizarInfoItem(playerid)
{
    new slot = pInvSelectedSlot[playerid];
    
    // Se nenhum slot selecionado
    if(slot == -1)
    {
        PlayerTextDrawSetString(playerid, s_ptdInventorySlots[playerid][21], "Nenhum Item");
        PlayerTextDrawSetString(playerid, s_ptdInventorySlots[playerid][22], "Selecione um item.");
        PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][20], -1); // Modelo vazio
        
        // Recarrega
        for(new i=20; i<=22; i++) PlayerTextDrawShow(playerid, s_ptdInventorySlots[playerid][i]);
        return;
    }

    new itemid, quantidade, cigarros_atuais;
    new bool:item_existe = false;

    // --- LÓGICA PARA PEGAR DADOS (JOGADOR) ---
    if(pInvSelectedSide[playerid] == SIDE_PLAYER)
    {
        // Verifica se existe usando sua variável 'e_INVENTORY_EXISTS' do código antigo
        if(InventoryData[playerid][slot][e_INVENTORY_EXISTS] && InventoryData[playerid][slot][e_INVENTORY_ITEM_AMOUNT] > 0)
        {
            itemid = InventoryData[playerid][slot][e_INVENTORY_ITEM];
            quantidade = InventoryData[playerid][slot][e_INVENTORY_ITEM_AMOUNT];
            cigarros_atuais = InventoryData[playerid][slot][e_INVENTORY_CIGARRETES];
            item_existe = true;
        }
    }
    else // Lado Secundário (Baú/Chão)
    {
        // [TODO] Aqui entra sua lógica do baú secundário
        // itemid = ...
    }

    if(item_existe && itemid != 0)
    {
        // 1. NOME DO ITEM (TD 21)
        new strNome[64];
        format(strNome, sizeof(strNome), "%.25s", ItemData[itemid][e_ITEM_NAME]);
        PlayerTextDrawSetString(playerid, s_ptdInventorySlots[playerid][21], strNome);
        
        // 2. DESCRIÇÃO / QUANTIDADE (TD 22)
        new strDesc[128];
        if(ItemData[itemid][e_ITEM_CATEGORY] == ITEM_CATEGORY_DRUGS && 
           ItemData[itemid][e_ITEM_SUB_CATEGORY] == ITEM_SUBCATEGORY_PACKAGE && 
           cigarros_atuais < ItemData[itemid][e_ITEM_CASE_CIGARRETES])
        {
            // Calcula quantos restam
            new restantes = ItemData[itemid][e_ITEM_CASE_CIGARRETES] - cigarros_atuais;
            format(strDesc, sizeof(strDesc), "~y~%d cigarro%s~n~~w~restantes", 
                restantes,
                (restantes <= 1) ? ("") : ("s")
            );
        }
        else 
        {
            // Item Comum
            format(strDesc, sizeof(strDesc), "~y~Quantidade:~n~~w~%d unidade%s", 
                quantidade,
                (quantidade <= 1) ? ("") : ("s")
            );
        }
        
        PlayerTextDrawSetString(playerid, s_ptdInventorySlots[playerid][22], strDesc);

        // 3. MODELO 3D (TD 20)
        PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][20], ItemData[itemid][e_ITEM_MODEL]);
        PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][20], 0.0, 0.0, 0.0, 1.0);
    }
    else
    {
        // Slot vazio
        PlayerTextDrawSetString(playerid, s_ptdInventorySlots[playerid][21], "Vazio");
        PlayerTextDrawSetString(playerid, s_ptdInventorySlots[playerid][22], "_");
        PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][20], -1);
    }
    
    for(new i=20; i<=22; i++) PlayerTextDrawShow(playerid, s_ptdInventorySlots[playerid][i]);
}

stock AtualizarInventario(playerid)
{
    new itemid, model;

    // --- LADO ESQUERDO (JOGADOR) ---
    for(new i = 0; i <= 19; i++)
    {
        // Verifica se o slot existe E tem quantidade (Lógica do seu Inventory_Show)
        if(InventoryData[playerid][i][e_INVENTORY_EXISTS] && InventoryData[playerid][i][e_INVENTORY_ITEM_AMOUNT] > 0)
        {
            itemid = InventoryData[playerid][i][e_INVENTORY_ITEM];
            
            // Verifica se o modelo é válido (Evitar CJ)
            if(itemid != 0 && ItemData[itemid][e_ITEM_MODEL] != 0)
            {
                model = ItemData[itemid][e_ITEM_MODEL];
                
                // Configura e Mostra
                PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][i], 5); // Preview
                PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][i], model);
                PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][i], 0.0, 0.0, 0.0, 1.0);
                
                PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][i], -1);
                PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][i], 0x80808044);
            }
            else
            {
                // Item existe na DB mas está sem Model ID configurado (Erro de config)
                PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][i], 1);
                PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][i], 0x00000000);
                PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][i], 0x00000022);
            }
        }
        else
        {
            // Slot Vazio (Não existe ou qtd 0)
            PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][i], 1); // Texto normal (esconde boneco)
            PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][i], 0x00000000);
            PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][i], 0x00000022); 
        }
        PlayerTextDrawShow(playerid, s_ptdInventorySlots[playerid][i]);
    }

    // --- LADO DIREITO (SECUNDÁRIO) ---
    // Mantive a lógica da resposta anterior, mas lembre de aplicar 'EXISTS' aqui também
    // quando conectar com seu sistema de baú.
    for(new j = 0; j <= 19; j++)
    {
        new td_index = 29 + j;
        itemid = 0; 

        if(pInvSecondaryType[playerid] == INV_TIPO_VEICULO)
        {
            // Exemplo: if(VehicleData[vid][j][e_INV_EXISTS]) itemid = ...
        }
        else if(pInvSecondaryType[playerid] == INV_TIPO_CHAO)
        {
            // Exemplo chão
        }

        if(itemid != 0 && ItemData[itemid][e_ITEM_MODEL] != 0)
        {
             model = ItemData[itemid][e_ITEM_MODEL];
             PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][td_index], 5);
             PlayerTextDrawSetPreviewModel(playerid, s_ptdInventorySlots[playerid][td_index], model);
             PlayerTextDrawSetPreviewRot(playerid, s_ptdInventorySlots[playerid][td_index], 0.0, 0.0, 0.0, 1.0);
             PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][td_index], -1);
             PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][td_index], 0x80808044);
        }
        else
        {
            PlayerTextDrawFont(playerid, s_ptdInventorySlots[playerid][td_index], 1);
            PlayerTextDrawColor(playerid, s_ptdInventorySlots[playerid][td_index], 0x00000000);
            PlayerTextDrawBackgroundColor(playerid, s_ptdInventorySlots[playerid][td_index], 0x00000022);
        }
        PlayerTextDrawShow(playerid, s_ptdInventorySlots[playerid][td_index]);
    }
    
    // Atualiza o painel central para refletir a seleção atual
    AtualizarInfoItem(playerid);
}

stock AbrirInventario(playerid)
{
    // Define o que abre na direita (Carro/Chão)
    DefinirAberturaInventario(playerid);

    // Mostra Fundo Global
    for(new i = 0; i <= 50; i++) TextDrawShowForPlayer(playerid, s_tdInventory[i]);

    // Reseta variáveis
    pInvSelectedSlot[playerid] = -1;
    pInvSelectedQtd[playerid] = 1;
    pInvSelectedSide[playerid] = SIDE_PLAYER;

    // Mostra Botões Fixos
    for(new i = 23; i <= 28; i++) PlayerTextDrawShow(playerid, s_ptdInventorySlots[playerid][i]);
    
    AtualizarDisplayQuantidade(playerid);

    // Carrega Itens
    AtualizarInventario(playerid);

    // Habilita Mouse
    SelectTextDraw(playerid, 0xFF0000FF);
    pInventoryOpen[playerid] = true;
    return 1;
}

stock FecharInventario(playerid)
{
    for(new i = 0; i <= 50; i++) TextDrawHideForPlayer(playerid, s_tdInventory[i]);
    for(new i = 0; i < sizeof(s_ptdInventorySlots[]); i++) PlayerTextDrawHide(playerid, s_ptdInventorySlots[playerid][i]);

    CancelSelectTextDraw(playerid);
    pInventoryOpen[playerid] = false;
    return 1;
}



// Callbacks e Hooks
hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(clickedid == Text:INVALID_TEXT_DRAW)
    {
        if(pInventoryOpen[playerid])
        {
            FecharInventario(playerid);
            return 1;
        }
    }
    return 0;
}

hook OPClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    // 1. CLIQUE NOS SLOTS DO JOGADOR
    for(new i = 0; i <= 19; i++)
    {
        if(playertextid == s_ptdInventorySlots[playerid][i])
        {
            pInvSelectedSlot[playerid] = i;
            pInvSelectedSide[playerid] = SIDE_PLAYER;
            pInvSelectedQtd[playerid] = 1; // Reseta qtd
            
            AtualizarDisplayQuantidade(playerid);
            PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
            AtualizarInfoItem(playerid);
            return 1;
        }
    }

    // 2. CLIQUE NOS SLOTS SECUNDÁRIOS
    for(new i = 29; i <= 48; i++)
    {
        if(playertextid == s_ptdInventorySlots[playerid][i])
        {
            pInvSelectedSlot[playerid] = i;
            pInvSelectedSide[playerid] = SIDE_SECONDARY;
            pInvSelectedQtd[playerid] = 1;

            AtualizarDisplayQuantidade(playerid);
            PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
            AtualizarInfoItem(playerid);
            return 1;
        }
    }

    // 3. BOTÃO MENOS (-)
    if(playertextid == s_ptdInventorySlots[playerid][24])
    {
        if(pInvSelectedSlot[playerid] != -1)
        {
            if(pInvSelectedQtd[playerid] > 1)
            {
                pInvSelectedQtd[playerid]--;
                AtualizarDisplayQuantidade(playerid);
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
            }
        }
        return 1;
    }

    // 4. BOTÃO MAIS (+)
    if(playertextid == s_ptdInventorySlots[playerid][23])
    {
        if(pInvSelectedSlot[playerid] != -1)
        {
            new max_amount = 0;
            new slot = pInvSelectedSlot[playerid];

            // Verifica Limites
            if(pInvSelectedSide[playerid] == SIDE_PLAYER)
            {
                max_amount = InventoryData[playerid][slot][e_INVENTORY_ITEM_AMOUNT];
            }
            else // Lado Secundário
            {
                // [TODO] Conectar com a variável real de quantidade do baú/chão
                max_amount = 999; 
            }

            if(pInvSelectedQtd[playerid] < max_amount)
            {
                pInvSelectedQtd[playerid]++;
                AtualizarDisplayQuantidade(playerid);
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
            }
            else
            {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0); // Som de erro
            }
        }
        return 1;
    }

    // 5. BOTÃO USAR
    if(playertextid == s_ptdInventorySlots[playerid][26])
    {
        if(pInvSelectedSlot[playerid] != -1 && pInvSelectedSide[playerid] == SIDE_PLAYER)
        {
            new slot = pInvSelectedSlot[playerid];
            new itemid = InventoryData[playerid][slot][e_INVENTORY_ITEM];
            
            if(itemid != 0)
            {
                SendClientMessage(playerid, -1, "Você usou o item!");
                // [TODO] UsarItem(playerid, slot);
            }
        }
        return 1;
    }

    // 6. BOTÃO ENVIAR (Trocar de Lado)
    if(playertextid == s_ptdInventorySlots[playerid][27])
    {
        if(pInvSelectedSlot[playerid] != -1)
        {
            if(pInvSelectedSide[playerid] == SIDE_PLAYER)
            {
                // Player -> Baú
                SendClientMessage(playerid, -1, "Movendo: Player -> Secundário");
                // [TODO] MoverItemParaBau(playerid, slot, pInvSelectedQtd[playerid]);
            }
            else
            {
                // Baú -> Player
                SendClientMessage(playerid, -1, "Movendo: Secundário -> Player");
                // [TODO] PegarItemDoBau(playerid, slot, pInvSelectedQtd[playerid]);
            }
            AtualizarInventario(playerid);
        }
        return 1;
    }

    // 7. BOTÃO DROPAR
    if(playertextid == s_ptdInventorySlots[playerid][28])
    {
        if(pInvSelectedSlot[playerid] != -1 && pInvSelectedSide[playerid] == SIDE_PLAYER)
        {
            new qtd = pInvSelectedQtd[playerid];
            
            new string[64];
            format(string, sizeof(string), "Você dropou %d itens.", qtd);
            SendClientMessage(playerid, -1, string);
            
            // [TODO] DroparItem(playerid, slot, qtd);
            
            AtualizarInventario(playerid);
        }
        return 1;
    }

    return 0;
}

// Comandos
CMD:inv(playerid)
{
    if(pInventoryOpen[playerid]) FecharInventario(playerid);
    else AbrirInventario(playerid);
    return 1;
}