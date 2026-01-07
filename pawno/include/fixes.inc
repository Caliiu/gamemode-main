/*
*	module: fixes
*	author: *
*	last edit: 08/03/2023
*	desc: responsável por correções
*/

#include <a_samp>
#include <YSI_Players\y_android>

hook native SendClientMessage(playerid, color, message[])
{
	if (IsPlayerAndroid(playerid))
	{
		Internal_RemoveAccent(message);
	}

	return continue(playerid, color, message);
}

hook native ShowPlayerDialog(playerid, dialogid, style, caption[], info[], button1[], button2[])
{
	if (IsPlayerAndroid(playerid))
	{
		Internal_RemoveAccent(caption);
		Internal_RemoveAccent(info);
		Internal_RemoveAccent(button1);
		Internal_RemoveAccent(button2);
	}	

	return continue(playerid, dialogid, style, caption, info, button1, button2);
}

Internal_RemoveAccent(str[])
{
    new ComAcento[29] = "àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ";
	new SemAcento[29] = "aaeouaoaeioucuAAEOUAOAEIOUCU";
	for(new i = 0; i < strlen(str); i++)
	{
		for(new l = 0; l < sizeof(ComAcento); l++)
		{
			if(str[i] == ComAcento[l])
			{
				str[i] = SemAcento[l];
			}
	}
	}
	return 1;
}

forward IsPlayerAndroid(playerid);
public IsPlayerAndroid(playerid)
{
    if (IsAndroidPlayer(playerid))
        return true;

    return false;
}

stock FixText(const string[])
{
    new szFixed[1024], iPos, iLen;

    for(iLen = strlen(string); iPos < iLen; iPos ++)
        switch(string[iPos])
        {
            case '%':          szFixed[iPos] = 37;
            case '&':          szFixed[iPos] = 38;
            case '¡':          szFixed[iPos] = 64;
            case '°':          szFixed[iPos] = 124;
            case 'À':          szFixed[iPos] = 128;
            case 'Á':          szFixed[iPos] = 129;
            case 'Â':          szFixed[iPos] = 130;
            case 'Ä', 'Ã':     szFixed[iPos] = 131;
            case 'Ç':          szFixed[iPos] = 133;
            case 'È':          szFixed[iPos] = 134;
            case 'É':          szFixed[iPos] = 135;
            case 'Ê':          szFixed[iPos] = 136;
            case 'Ë':          szFixed[iPos] = 137;
            case 'Ì':          szFixed[iPos] = 138;
            case 'Í':          szFixed[iPos] = 139;
            case 'Î':          szFixed[iPos] = 140;
            case 'Ï':          szFixed[iPos] = 141;
            case 'Ò':          szFixed[iPos] = 142;
            case 'Ó':          szFixed[iPos] = 143;
            case 'Ô':          szFixed[iPos] = 144;
            case 'Ö', 'Õ':     szFixed[iPos] = 145;
            case 'Ù':          szFixed[iPos] = 146;
            case 'Ú':          szFixed[iPos] = 147;
            case 'Û':          szFixed[iPos] = 148;
            case 'Ü':          szFixed[iPos] = 149;
            case 'à':          szFixed[iPos] = 151;
            case 'á':          szFixed[iPos] = 152;
            case 'â':          szFixed[iPos] = 153;
            case 'ä', 'ã':     szFixed[iPos] = 154;
            case 'ç':          szFixed[iPos] = 156;
            case 'è':          szFixed[iPos] = 157;
            case 'é':          szFixed[iPos] = 158;
            case 'ê':          szFixed[iPos] = 159;
            case 'ë':          szFixed[iPos] = 160;
            case 'ì':          szFixed[iPos] = 161;
            case 'í':          szFixed[iPos] = 162;
            case 'î':          szFixed[iPos] = 163;
            case 'ï':          szFixed[iPos] = 164;
            case 'ò':          szFixed[iPos] = 165;
            case 'ó':          szFixed[iPos] = 166;
            case 'ô':          szFixed[iPos] = 167;
            case 'ö', 'õ':     szFixed[iPos] = 168;
            case 'ù':          szFixed[iPos] = 169;
            case 'ú':          szFixed[iPos] = 170;
            case 'û':          szFixed[iPos] = 171;
            case 'ü':          szFixed[iPos] = 172;
            case 'Ñ':          szFixed[iPos] = 173;
            case 'ñ':          szFixed[iPos] = 174;
            case '¿':          szFixed[iPos] = 175;
            case '`':          szFixed[iPos] = 177;
            default:           szFixed[iPos] = string[iPos];
          }
    return szFixed;
}

// TextDraws
hook native PlayerTextDrawSetString(playerid, PlayerText:text, const string[])
{
    if (IsPlayerAndroid(playerid))
    {
        new buffer[1024];
        format(buffer, sizeof(buffer), "%s", string);
        Internal_RemoveAccent(buffer); 
        
        return continue(playerid, _:text, buffer);
    }

    return continue(playerid, _:text, FixText(string));
}