#include <amxmodx>
#include <fakemeta>
#include <zombie_plague/add_commas>
//#include <zombie_plague/zombie_plague>
//#include <zombie_plague/zp_zombie_classes>

#define PLUGIN "[ZP] Aim Info"
#define VERSION "1.0"
#define AUTHOR "DadoDz"

native zp_get_user_zombie(id);
native zp_get_user_zombie_classname(id, classname[], len);

new g_playername[33][32];
new g_MsgSync;

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR);

    register_event("StatusValue", "event_show_info", "be", "1=2", "2!0");
    register_event("StatusValue", "event_hide_info", "be", "1=1", "2=0");

    g_MsgSync = CreateHudSyncObj();
}

public client_putinserver(id) get_user_name(id, g_playername[id], charsmax(g_playername[]));

public event_show_info(id)
{
	if (!is_user_bot(id) && is_user_connected(id) && is_user_alive(id)) 
	{
		static aimid, class[32], HealthString[16], ArmorString[16];
		aimid = read_data(2)
		
		if (!is_user_alive(aimid))
			return;

		add_commas(pev(aimid, pev_health), HealthString, charsmax(HealthString));
		add_commas(pev(aimid, pev_armorvalue), ArmorString, charsmax(ArmorString));

		if (zp_get_user_zombie(aimid))
			zp_get_user_zombie_classname(aimid, class, charsmax(class))
		else
			formatex(class, charsmax(class), "Human")
		
		if (zp_get_user_zombie(id) && zp_get_user_zombie(aimid))
		{
			set_hudmessage(255, 75, 40, -1.0, 0.60, 1, 0.01, 3.0, 0.01, 0.01, -1);
			ShowSyncHudMsg(id, g_MsgSync, "[Name: %s]^n[Class: %s - Health: %s]", g_playername[aimid], class, HealthString);
		}
		else if (!zp_get_user_zombie(id) && !zp_get_user_zombie(aimid))
		{
			set_hudmessage(0, 150, 255, -1.0, 0.60, 0, 6.0, 1.1, 0.0, 0.0, -1);
			ShowSyncHudMsg(id, g_MsgSync, "[Name: %s]^n[Class: %s - Health: %s - Armor: %s]", g_playername[aimid], class, HealthString, ArmorString);
		}
		else if (!zp_get_user_zombie(id) && zp_get_user_zombie(aimid))
		{
			set_hudmessage(255, 75, 40, -1.0, 0.60, 1, 0.01, 3.0, 0.01, 0.01, -1);
			ShowSyncHudMsg(id, g_MsgSync, "[Name: %s]^n[Class: %s - Health: %s]", g_playername[aimid], class, HealthString);
		}
	}
}

public event_hide_info(id) ClearSyncHud(id, g_MsgSync);
