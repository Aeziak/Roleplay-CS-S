#pragma semicolon 1

#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include <sdkhooks>
#include <morecolors>
#include <steamtools>
#include <smlib>

#define PLUGIN_VERSION		"0.1"
#define AUTHOR "Delachambre & Aeziak"
#define DESCRIPTION "Roleplay"
#define NAME "Roleplay"
#define MAX_PLAYERS 64

#define	SOUND_KEYACTIVE	"buttons/blip2.wav"
#define SOUND_TAZER 	"weapons/fx/rics/ric3.wav"
#define SOUND_FREEZE	"physics/glass/glass_impact_bullet4.wav"
#define SOUND_SALUT	"roleplay/salut.wav"
#define SOUND_KLAXONNE	"vehicles/mustang_horn.mp3"
#define SOUND_ENTRER	"roleplay/enter.mp3"

#define MODELS_IMPRIMANTE	"models/natalya/props/consolebox01_expl.mdl"
#define MODELS_MONEY	"models/props/cs_assault/money.mdl"
#define MODELS_PLANTE	"models/props/cs_office/plant01.mdl"
#define MODELS_PC		"models/props/cs_office/computer_monitor.mdl"
#define MODELS_CAISSE	"models/items/ammocrate_ar2.mdl"
#define MODELS_AMMO	"models/items/ammocrate_ar2.mdl"
#define MODELS_CASE "models/props/cs_office/cardboard_box02.mdl"

#define AFK_TIME	300.0
#define AFK_TIME_LEGENDARY	500.0
#define PRICE_GROUP	1000
#define RESPAWN_TIME	3
#define RESPAWN_TIME_LEGENDARY	15
#define EMBAUCHE_EXPIRE	0
#define EMBAUCHE_DAY	3
#define EMBAUCHE_EXPIRE_LEGENDARY	60
#define EMBAUCHE_DAY_LEGENDARY	1
#define MONEY_DEPART	5000
#define BANK_DEPART	0
#define REPUTATION_DEPART	100
#define GAIN_LEGENDARY		50
#define LIMIT_KIT	10
#define LIMIT_LEVELCUT		100
#define LIMIT_IMPRIMANTE	5
#define LIMIT_IMPRIMANTE_WITH_AMELIORATION	8
#define LIMIT_PLANTE	3
#define MONEY_BY_IMPRIMANTE	1
#define TIME_LOCATION	259200
#define DAYS_LOCATION	3
#define EF_NODRAW 32
#define VEHICLE_TYPE_AIRBOAT_RAYCAST	8

#define SKIN_DEFAULT	"models/player/balkancsgo/balkan/t_leet.mdl"
#define SKIN_POLICE_DEFAULT	"models/player/csgoct/ct/ct_gign.mdl"
#define SKIN_MAFIA	"models/player/vad36_professional/2020/t_phoenix.mdl"
#define SKIN_WILDLINGS	"models/player/wildlings/phoenix/t_phoenix.mdl"
#define SKIN_CYBERCRIMINAL	"models/player/vad36anarchist/t_phoenix.mdl"
#define SKIN_JAIL	"models/player/blackbirds/jailpublic/t_leet.mdl"
#define SKIN_FISHER	"models/player/elis/fsv2/fischer.mdl"
#define SKIN_NIKO	"models/player/slow/niko_bellic/slow.mdl"
#define SKIN_CHEF		"models/player/natalya/civilians/male_chef.mdl"

#define SKIN_PRISONNER1	"models/player/jailbait/t_guerilla/t_guerilla.mdl"
#define SKIN_PRISONNER2	"models/player/jailbait/t_leet/t_leet.mdl"
#define SKIN_PRISONNER3	"models/player/jailbait/t_phoenix/t_phoenix.mdl"

#define TIME_ECSTAZY	60.0
#define TIME_COCAINE	10.0
#define TIME_HEROINE	60.0
#define TIME_SHIT	60.0
#define TIME_WEED	60.0
#define TIME_CHAMPIGNONS	60.0
#define TIME_METH	90.0

#define PRICE_GLOCK	200
#define PRICE_USP	250
#define PRICE_P228	300
#define PRICE_DEAGLE	325
#define PRICE_FIVESEVEN	375
#define PRICE_ELITES 400
#define PRICE_TMP	650
#define PRICE_MAC10	700
#define PRICE_MP5	725
#define PRICE_M3	800
#define PRICE_UMP45	850
#define PRICE_XM1014	900
#define PRICE_GALIL	1000
#define PRICE_FAMAS	1125
#define PRICE_P90	1175
#define PRICE_AK47	1250
#define PRICE_SCOUT	1375
#define PRICE_M4A1	1550
#define PRICE_AUG 1750
#define PRICE_SG552	1750
#define PRICE_SG550	2100
#define PRICE_AWP	2375
#define PRICE_G3SG1	2500
#define PRICE_M249	2875
#define PRICE_CARTOUCHE	150

#define PRICE_GLOCK_ARMU	400
#define PRICE_USP_ARMU	450
#define PRICE_P228_ARMU	500
#define PRICE_DEAGLE_ARMU	525
#define PRICE_FIVESEVEN_ARMU	575
#define PRICE_ELITES_ARMU 600
#define PRICE_TMP_ARMU	850
#define PRICE_MAC10_ARMU	900
#define PRICE_MP5_ARMU	925
#define PRICE_M3_ARMU	1000
#define PRICE_UMP45_ARMU	1050
#define PRICE_XM1014_ARMU	1100
#define PRICE_GALIL_ARMU	1200
#define PRICE_FAMAS_ARMU	1325
#define PRICE_P90_ARMU	1375
#define PRICE_AK47_ARMU	1450
#define PRICE_SCOUT_ARMU	1575
#define PRICE_M4A1_ARMU	1750
#define PRICE_AUG_ARMU 1950
#define PRICE_SG552_ARMU	1950
#define PRICE_SG550_ARMU	2300
#define PRICE_AWP_ARMU	2575
#define PRICE_G3SG1_ARMU	2700
#define PRICE_M249_ARMU	3075
#define PRICE_CARTOUCHE_ARMU	350

#define PRICE_ECSTAZY	500
#define PRICE_COCAINE	400
#define PRICE_HEROINE	300
#define PRICE_SHIT	200
#define PRICE_WEED	100
#define PRICE_CHAMPIGNONS	80

#define PRICE_LEVELCUT	60
#define PRICE_CUTBURN	300
#define PRICE_CUTFREEZE	400
#define PRICE_CUTFLASH	200
#define PRICE_CUTSMALL	600
#define PRICE_CUTBIG	600

#define PRICE_GRENADE 400
#define PRICE_FLASH 300
#define PRICE_FUMIGENE 200
#define PRICE_GILET 500
#define PRICE_KEVLAR 700
#define PRICE_PERMISPROJECTILES	1000

#define PRICE_CB	200
#define PRICE_RIB	300
#define PRICE_COMPTE	800
#define PRICE_FICHE	1000

#define PRICE_CB_BANK	400
#define PRICE_RIB_BANK	600
#define PRICE_FICHE_BANK	2000

#define PRICE_COMPTE_DISTRIB	1000

#define PRICE_PERMISLOURD	1000
#define PRICE_PERMISLEGER	800
#define PRICE_DIPLOME	100

#define PRICE_PERMISLOURD_MNT	2000
#define PRICE_PERMISLEGER_MNT	1600
#define PRICE_DIPLOME_MNT	200

#define PRICE_TICKET10		10
#define PRICE_TICKET50		50
#define PRICE_TICKET100	100
#define PRICE_TICKET500	500
#define PRICE_TICKET1000	1000

#define PRICE_TROUSSE	500
#define PRICE_KIT 700
#define PRICE_SAC 1000
#define PRICE_CHIRURGIEJAMBES 2000
#define PRICE_CHIRURGIECOEUR 1500
#define PRICE_CHIRURGIETETE 1200

#define PRICE_ENQUETE 300

#define PRICE_CONTRATFLIC		1000
#define PRICE_CONTRATCIVIL	600

#define PRICE_IMPRIMANTE	150
#define PRICE_AMELIORATION	400
#define PRICE_OEIL	600
#define PRICE_REGENERATION	800

#define PRICE_HAMBURGER	350
#define PRICE_HAMBURGERFAT	600
#define PRICE_BIGMAC	900
#define PRICE_HAPPYMEAL	1500

#define PRICE_SKINPOLIZEI		2000
#define PRICE_SKINCHRISTMAS	2000
#define PRICE_SKINPINK			2000
#define PRICE_SKINTASKFORCE	2000
#define PRICE_SKINURBAN		2000
#define PRICE_SKINUMBRELLA	2000
#define PRICE_SKINFISHER		2000
#define PRICE_SKINNIKO			2000
#define PRICE_SKINCHEF			2000
#define PRICE_SKINKIRBYT		2000

#define g_bPrefix "{orangered}[Roleplay]{unique}"
#define g_bPrefixEvent "{blue}[{red}★ RP-Event ★{blue}]{green}"
#define g_bPrefixDev "{red}[DEV]{firebrick}"
#define g_bPrefixVip "{blue}[{red}★ VIP ★{blue}]{green}"
#define g_bPrefixPub "{olive}[Publicité]{normal}"
#define g_bPub1 "Bienvenue en ville !"
#define g_bPub2 "Notre Teamspeak : "
#define g_bPub3 "Notre Discord : https://discord.gg/SqTrzbKTnu"
#define g_bPub4 "Fondateur du serveur : {orangered}Aeziak{default}"
#define g_bPub5 "Pour devenir Admin veuillez voir les Fondateurs"

new Handle:TimerHud[MAXPLAYERS+1] = { INVALID_HANDLE, ...};
new Handle:TimerImprimante[MAXPLAYERS+1] = { INVALID_HANDLE, ...};
new Handle:TimerPlante[MAXPLAYERS+1] = { INVALID_HANDLE, ...};
new Handle:g_deadtimer[MAXPLAYERS+1] = { INVALID_HANDLE, ...};
new Handle:g_croche[MAXPLAYERS+1] = { INVALID_HANDLE, ...};
new Handle:g_TazerTimer[MAXPLAYERS+1] = { INVALID_HANDLE, ...};
new Handle:g_braquage[MAXPLAYERS+1] = { INVALID_HANDLE, ... };
new Handle:g_ThreadedHandle = null;
new Handle:FreezeTimer[MAXPLAYERS+1];
new Handle:Timers;
new Handle:gTimer;
new Handle:WeaponClean;
new Handle:Pub;
KeyValues g_kvZones;
KeyValues g_kvJobs;
KeyValues g_kvDoors;
KeyValues g_kvItems;
KeyValues g_kvActivities;
KeyValues g_kvSpawns;
KeyValues g_kvJailSpawns;

new lastbraquage = 0;

new bool:InQuery;
//new bool:ACTIVE_VEHICULE = true;
new bool:ACTIVE_LIMITATION = true;
new bool:ACTIVE_TRACEBAN = true;
new bool:reboot = false;
new bool:BraquageEnCours = false;
new bool:IsDisconnect[MAXPLAYERS+1];
new bool:isObserver[MAXPLAYERS+1];
new bool:Loaded[MAXPLAYERS+1];
new bool:godmod[MAXPLAYERS+1] = false;
new bool:IsCivil[MAXPLAYERS+1] = false;
new bool:IsInvisible[MAXPLAYERS+1] = false;
new bool:grab[MAXPLAYERS+1] = false;
new bool:IsTazed[MAXPLAYERS+1] = false;
new bool:AFK[MAXPLAYERS+1] = false;
new bool:g_InUse[MAXPLAYERS+1];
new bool:g_InDuck[MAXPLAYERS+1];
new bool:g_UseShoot[MAXPLAYERS+1];
new bool:Speedhack[MAXPLAYERS+1] = false;
new bool:crochetageon[MAXPLAYERS+1] = false;
new bool:OnCreationKit[MAXPLAYERS+1] = false;
new bool:IsPossibleToAfk[MAXPLAYERS+1] = false;
new bool:IsInFakeJob[MAXPLAYERS+1] = false;
new bool:CUTBURN_ACTIVE[MAXPLAYERS+1] = false;
new bool:CUTFREEZE_ACTIVE[MAXPLAYERS+1] = false;
new bool:CUTFLASH_ACTIVE[MAXPLAYERS+1] = false;
new bool:CUTSMALL_ACTIVE[MAXPLAYERS+1] = false;
new bool:CUTBIG_ACTIVE[MAXPLAYERS+1] = false;
new bool:fiche[MAXPLAYERS+1] = false;
new bool:HasDiplome[MAXPLAYERS+1] = false;
new bool:IsInChirurgieJambes[MAXPLAYERS+1] = false;
new bool:IsInChirurgieCoeur[MAXPLAYERS+1] = false;
new bool:IsInChirurgieTete[MAXPLAYERS+1] = false;
new bool:BoostDeagle[MAXPLAYERS+1] = false;
new bool:BoostLife[MAXPLAYERS+1] = false;
new bool:BoostCut[MAXPLAYERS+1] = false;
new bool:BoostInvisi[MAXPLAYERS+1] = false;
new bool:BoostVitesse[MAXPLAYERS+1] = false;
new bool:HasKillCible[MAXPLAYERS+1] = false;
new bool:OnContrat[MAXPLAYERS+1] = false;
new bool:HasAmeliorationElectronique[MAXPLAYERS+1] = false;
new bool:HasOeilBionique[MAXPLAYERS+1] = false;
new bool:HasRegenerationBionique[MAXPLAYERS+1] = false;
new bool:TimerDead[MAXPLAYERS+1] = false;
new bool:IsExitVehicle[MAXPLAYERS+1] = false;
new bool:CarHorn[MAXPLAYERS+1] = false;
new bool:IsInAreaMod[MAXPLAYERS+1] = false;

new jobs[MAXPLAYERS+1] = 0;
new TypeAccount[MAXPLAYERS+1] = 0;
new VipUsed[MAXPLAYERS+1] = 0;
new g_CountDead[MAXPLAYERS+1] = 0;
new givemoney[MAXPLAYERS+1] = 0;
new argent[MAXPLAYERS+1] = 0;
new money[MAXPLAYERS+1] = 0;
new dirtyMoney[MAXPLAYERS+1] = 0;
new playerIds[MAXPLAYERS+1] = 0;
new reputation[MAXPLAYERS+1] = 0;
new totalmoney[MAXPLAYERS+1] = 0;
new bank[MAXPLAYERS+1] = 0;
new rankid[MAXPLAYERS+1] = 0;
new beforeCouvertureRankId[MAXPLAYERS+1] = 0;
new beforeCouvertureJobId[MAXPLAYERS+1] = 0;
new jobid[MAXPLAYERS+1] = 0;
new groupe[MAXPLAYERS+1] = 0;
new capital[MAXPLAYERS+1] = 0;
new employers[MAXPLAYERS+1] = 0;
new quota[MAXPLAYERS+1] = 0;
new gObj[MAXPLAYERS+1] = 0;
new jailtime[MAXPLAYERS+1] = 0;
new IsInJail[MAXPLAYERS+1] = 0;
new salaire[MAXPLAYERS+1] = 0;
new salarychoose[MAXPLAYERS+1] = 0;
new rib[MAXPLAYERS+1] = 0;
new cb[MAXPLAYERS+1] = 0;
new compte[MAXPLAYERS+1] = 0;
new JailHours[MAXPLAYERS+1] = 0;
new JailMinutes[MAXPLAYERS+1] = 0;
new TempJailTime[MAXPLAYERS+1] = 0;
new TempJailHours[MAXPLAYERS+1] = 0;
new EmbaucheExpire[MAXPLAYERS+1] = 0;
new lastontime[MAXPLAYERS+1] = 0;
new vol[MAXPLAYERS+1] = 0;
new vis[MAXPLAYERS+1] = 0;
new PickupWeapon[MAXPLAYERS+1] = 0;
new piratage[MAXPLAYERS+1] = 0;
new Entiter[MAXPLAYERS+1] = 0;
new crochetage[MAXPLAYERS+1] = 0;
new channelle[MAXPLAYERS+1] = 0;
new enquete[MAXPLAYERS+1] = 0;
new CommanditeurID[MAXPLAYERS+1] = 0;
new TempCibleID[MAXPLAYERS+1] = 0;
new PriceContrat[MAXPLAYERS+1] = 0;
new cibleID[MAXPLAYERS+1] = 0;
new BoostDispo[MAXPLAYERS+1] = 0;
new convoquer[MAXPLAYERS+1] = 0;
new HasImprimante[MAXPLAYERS+1] = 0;
new HasPlante[MAXPLAYERS+1] = 0;
new braquagetime[MAXPLAYERS+1] = 0;


new g_areaShootCount = 0;
new g_countheure1 = 0;
new g_countheure2 = 0;
new g_countminute1 = 0;
new g_countminute2 = 0;
new g_days = 1;
new g_years = 2000;
new g_month = 1;
new RebootTimer;
new g_modelLaser;
new g_modelHalo;
new g_LightingSprite;
new g_BeamSpriteFollow;
new g_GlowSprite;
new g_WeaponParent;
new activeOffset = -1;
new clip1Offset = -1;
new clip2Offset = -1;
new secAmmoTypeOffset = -1;
new priAmmoTypeOffset = -1;
new CountVirer = 0;
new printer_owner[2048];
new plante_owner[2048];

new ColorTazer[4]		= {102, 102, 204, 255};
new ColorBeam[4]	= {102, 102, 204, 255};
new ColorVol[4]	= {14, 102, 14, 255};
new ColorPiratage[4]		= {255, 75, 75, 255 };
new ColorPick[4]	= {102, 255, 255, 255};
new ColorCrochetage[4]	= {102, 51, 51, 255};
new ColorEcstazy[4]	= {220, 22, 226, 255};
new ColorCocaine[4]	= {11, 234, 22, 255};
new ColorHeroine[4]	= {239, 11, 46, 255};
new ColorShit[4]	= {239, 239, 23, 255};
new ColorWeed[4]	= {41, 19, 239, 255};
new ColorChampignons[4]	= {66, 248, 255, 255};
new ColorContrat[4]	= {255, 255, 0, 255};

new String:MonthName[50];
new String:current_map[128];
new String:rpName[MAXPLAYERS+1][129];
new String:GroupNameClient[MAXPLAYERS+1][128];
new String:JobNameUser[MAXPLAYERS+1][40];
new String:RankNameUser[MAXPLAYERS+1][40];
new String:LastKillBy[MAXPLAYERS+1][90];
new String:ZoneUser[MAXPLAYERS+1][140];

new Float:g_Count[MAXPLAYERS+1] = 0.0;
new Float:AFK_TIMER[MAXPLAYERS+1] = 0.0;
new Float:FORCE_DISTANCE[MAXPLAYERS+1];
new Float:CurrentEyeAngle[MAXPLAYERS+1][3];


new Float:BUILD_ZONE[2][3] = {{}, {}};
new Float:MAP_ZONES[150][2][3];
new String:MAP_ZONES_NAME[150][150];

public Plugin:myinfo =
{
	name = NAME,
	description = DESCRIPTION,
	author = AUTHOR,
	version = PLUGIN_VERSION,
	url = "http://aeziak.fr"
};

public OnPluginStart()
{	
	HookEvent("round_start", OnRoundStart);
	
	HookEvent("player_death", OnPlayerDeath);
	HookEvent("player_connect", event_PlayerConnect, EventHookMode_Pre);
	HookEvent("player_team", OnPlayerTeam, EventHookMode_Pre);
	HookEvent("player_disconnect", event_PlayerDisconnect_Suppress, EventHookMode_Pre);
	
	HookEvent("weapon_fire", EventWeaponFire, EventHookMode_Pre);
	
	HookEvent("bullet_impact", OnBulletImpact, EventHookMode_Pre);
	
	RegConsoleCmd("sm_rpname", Command_Rename);
	RegConsoleCmd("sm_rename", Command_Rename);
	RegConsoleCmd("sm_renomme", Command_Rename);
	RegConsoleCmd("sm_renommer", Command_Rename);
	RegConsoleCmd("sm_fakejob", Command_Fakejob);
	RegConsoleCmd("sm_couverture", Command_Fakejob);
	RegConsoleCmd("sm_give", Command_Give);
	RegConsoleCmd("sm_money", Command_Money);
	RegConsoleCmd("sm_donner", Command_Give);
	RegConsoleCmd("sm_adminmenu", Command_AdminMenu);
	RegConsoleCmd("sm_reboot", Command_ShutdownServer);
	RegConsoleCmd("sm_godmod", Command_Godmod);
	RegConsoleCmd("sm_jobmenu", Command_Jobmenu);
	RegConsoleCmd("sm_lock", Command_Lock);
	RegConsoleCmd("sm_unlock", Command_Unlock);
	RegConsoleCmd("sm_cop", Command_Cop);
	RegConsoleCmd("sm_cops", Command_Cop);
	RegConsoleCmd("sm_+force", Command_Grab);
	RegConsoleCmd("sm_tazer", Command_Tazer);
	RegConsoleCmd("sm_teleport", Command_Teleport);
	RegConsoleCmd("sm_admspeed", Command_Speed);
	RegConsoleCmd("sm_enquete", Command_Enquete);
	RegConsoleCmd("sm_jaillist", Command_Jaillist);
	RegConsoleCmd("sm_del", Command_Rw);
	RegConsoleCmd("sm_salaire", Command_Salaire);
	RegConsoleCmd("sm_pay", Command_Salaire);
	RegConsoleCmd("sm_paie", Command_Salaire);
	RegConsoleCmd("sm_engager", Command_Engager);
	RegConsoleCmd("sm_recruter", Command_Engager);
	RegConsoleCmd("sm_recrute", Command_Engager);
	RegConsoleCmd("sm_promote", Command_Promote);
	RegConsoleCmd("sm_gradeup", Command_Promote);
	RegConsoleCmd("sm_promouvoire", Command_Promote);
	RegConsoleCmd("sm_demote", Command_Demote);
	RegConsoleCmd("sm_gradedown", Command_Demote);
	RegConsoleCmd("sm_retrograder", Command_Demote);
	RegConsoleCmd("sm_virer", Command_Virer);
	RegConsoleCmd("sm_renvoyer", Command_Virer);
	RegConsoleCmd("sm_demission", Command_Demission);
	RegConsoleCmd("sm_vol", Command_Vol);
	RegConsoleCmd("sm_pickpocket", Command_Pickpocket);
	RegConsoleCmd("sm_crocheter", Command_Crocheter);
	RegConsoleCmd("sm_crochetage", Command_Crocheter);
	RegConsoleCmd("sm_lockpick", Command_Crocheter);
	RegConsoleCmd("sm_piratage", Command_Piratage);
	RegConsoleCmd("sm_pick", Command_Pick);
	RegConsoleCmd("sm_item", Command_Item);
	RegConsoleCmd("sm_sac", Command_Item);
	RegConsoleCmd("sm_giveitem", Command_Giveitem);
	RegConsoleCmd("sm_autosell", Command_Autosell);
	RegConsoleCmd("sm_vendre", Command_Sell);
	RegConsoleCmd("sm_sell", Command_Sell);
	RegConsoleCmd("sm_activity", Command_Sellactivities);
	RegConsoleCmd("sm_chirurgie", Command_Sellactivities);
	RegConsoleCmd("sm_soins", Command_Sellactivities);
	RegConsoleCmd("sm_channel", Command_Channel);
	RegConsoleCmd("sm_search", Command_Search);
	RegConsoleCmd("sm_contrat", Command_Contrat);
	RegConsoleCmd("sm_conv", Command_Convocation);
	RegConsoleCmd("sm_convocation", Command_Convocation);
	RegConsoleCmd("sm_jugement", Command_Jugement);
	RegConsoleCmd("sm_build", Command_Build);
	RegConsoleCmd("sm_t", Command_Team);
	RegConsoleCmd("sm_team", Command_Team);
	RegConsoleCmd("sm_3rd", Command_3rd);
	RegConsoleCmd("sm_plante", Command_Plante);
	RegConsoleCmd("sm_perqui", Command_Perqui);
	RegConsoleCmd("sm_area", Command_Area);
	RegConsoleCmd("sm_validarea", Command_Validarea);
	RegConsoleCmd("sm_worldentity", Command_Worldentity);
	RegConsoleCmd("sm_setspawn", Command_Setspawn);
	RegConsoleCmd("sm_entity", Command_Entity);
	RegConsoleCmd("sm_braquage", Command_Braquage);
	RegConsoleCmd("sm_buy", Command_Buy);
	RegConsoleCmd("sm_buygroup", Command_Buygroup);
	RegConsoleCmd("sm_camera", Command_Camera);
	
	RegAdminCmd("sm_givemoney", Command_Givemoney, ADMFLAG_ROOT);
	
	RegConsoleCmd("explode", Block_CMD);
	RegConsoleCmd("kill", Block_CMD);
	RegConsoleCmd("coverme", Block_CMD);
	RegConsoleCmd("takepoint", Block_CMD);
	RegConsoleCmd("holdpos", Block_CMD);
	RegConsoleCmd("regroup", Block_CMD);
	RegConsoleCmd("followme", Block_CMD);
	RegConsoleCmd("takingfire", Block_CMD);
	RegConsoleCmd("go", Block_CMD);
	RegConsoleCmd("fallback", Block_CMD);
	RegConsoleCmd("sticktog", Block_CMD);
	RegConsoleCmd("getinpos", Block_CMD);
	RegConsoleCmd("stormfront", Block_CMD);
	RegConsoleCmd("report", Block_CMD);
	RegConsoleCmd("roger", Block_CMD);
	RegConsoleCmd("enemyspot", Block_CMD);
	RegConsoleCmd("needbackup", Block_CMD);
	RegConsoleCmd("sectorclear", Block_CMD);
	RegConsoleCmd("inposition", Block_CMD);
	RegConsoleCmd("reportingin", Block_CMD);
	RegConsoleCmd("getout", Block_CMD);
	RegConsoleCmd("negative", Block_CMD);
	RegConsoleCmd("enemydown", Block_CMD);
	RegConsoleCmd("jointeam", Block_CMD);
	
	HookUserMessage(GetUserMessageId("TextMsg"), TextMsg, true);
	HookUserMessage(GetUserMessageId("VGUIMenu"), VGUIMenu, true);
	
	CreateTimer(0.1, InitCapital);
	
	AddCommandListener(Say_Team, "say_team");
	AddCommandListener(Say, "say");
	
	activeOffset = FindSendPropInfo("CAI_BaseNPC", "m_hActiveWeapon");
	clip1Offset = FindSendPropInfo("CBaseCombatWeapon", "m_iClip1");
	clip2Offset = FindSendPropInfo("CBaseCombatWeapon", "m_iClip2");
	priAmmoTypeOffset = FindSendPropInfo("CBaseCombatWeapon", "m_iPrimaryAmmoCount");
	secAmmoTypeOffset = FindSendPropInfo("CBaseCombatWeapon", "m_iSecondaryAmmoCount");
	g_WeaponParent = FindSendPropInfo("CBaseCombatWeapon", "m_hOwnerEntity");
}

public OnMapStart()
{
	new Handle:mp_startmoney = INVALID_HANDLE;
	mp_startmoney = FindConVar("mp_startmoney");

	if (mp_startmoney != INVALID_HANDLE)
	{
		SetConVarBounds(mp_startmoney, ConVarBound_Lower, false);
	}
	
	new i;
	for (i=0; i<MAX_PLAYERS; i++)
	{
		gObj[i]=-1;
	}
	
	gTimer = CreateTimer(0.1, UpdateObjects, INVALID_HANDLE, TIMER_REPEAT);
	Pub = CreateTimer(130.0, Timer_Pub, _, TIMER_REPEAT);
	
	SetConVarInt(FindConVar("mp_ignore_round_win_conditions"), 1, true, false);
	SetConVarInt(FindConVar("sv_ignoregrenaderadio"), 1, true, false);
	SetConVarInt(FindConVar("mp_friendlyfire"), 1, true, false);
	SetConVarInt(FindConVar("mp_autokick"), 0, true, false);
	SetConVarInt(FindConVar("mp_autoteambalance"), 0, true, false);
	SetConVarInt(FindConVar("mp_roundtime"), 1, true, false);
	SetConVarInt(FindConVar("sv_alltalk"), 1, true, false);
	
	g_modelLaser = PrecacheModel("sprites/laser.vmt");
	g_modelHalo = PrecacheModel("materials/sprites/halo01.vmt");
	g_LightingSprite = PrecacheModel("sprites/lgtning.vmt");
	g_BeamSpriteFollow = PrecacheModel("materials/sprites/laserbeam.vmt");
	g_GlowSprite = PrecacheModel("sprites/blueglow2.vmt");
	
	AddFileToDownloadsTable("models/natalya/props/consolebox01_expl.mdl");
	AddFileToDownloadsTable("models/natalya/props/consolebox01_expl.dx80.vtx");
	AddFileToDownloadsTable("models/natalya/props/consolebox01_expl.dx90.vtx");
	AddFileToDownloadsTable("models/natalya/props/consolebox01_expl.phy");
	AddFileToDownloadsTable("models/natalya/props/consolebox01_expl.sw.vtx");
	AddFileToDownloadsTable("models/natalya/props/consolebox01_expl.vvd");

	AddFileToDownloadsTable("sound/vehicles/mustang_horn.mp3");
	AddFileToDownloadsTable("sound/roleplay/salut.wav");
	AddFileToDownloadsTable("sound/roleplay/enter.mp3");
	AddFileToDownloadsTable("sound/roleplay/sound_effects/couverture.mp3");

	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/t_base_fullfinger_glove.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/t_base_fullfinger_glove.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/t_base_fullfinger_glove_exp.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/t_base_fullfinger_glove_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/tm_balkan_v2_body_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/tm_balkan_v2_body_variantb.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/tm_balkan_v2_body_variantb_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/tm_balkan_v2_head_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/tm_balkan_v2_head_variantb.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/tm_balkan_v2_head_variantb_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/tm_balkan_v2_lower_body_variantc.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/balkan/tm_balkan_v2_lower_body_variantc.vtf");

	AddFileToDownloadsTable("materials/deadlydesire/props/atm/atm.vtf");
	AddFileToDownloadsTable("models/player/balkancsgo/balkan/t_leet.dx80.vtx");
	AddFileToDownloadsTable("models/player/balkancsgo/balkan/t_leet.dx90.vtx");
	AddFileToDownloadsTable("models/player/balkancsgo/balkan/t_leet.mdl");
	AddFileToDownloadsTable("models/player/balkancsgo/balkan/t_leet.phy");
	AddFileToDownloadsTable("models/player/balkancsgo/balkan/t_leet.sw.vtx");
	AddFileToDownloadsTable("models/player/balkancsgo/balkan/t_leet.vvd");

	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_body_varianta.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_body_varianta.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_body_varianta_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_hat_glasses_radio_varianta_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_hat_glasses_radio_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_hat_glasses_radio_variantb.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_head_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_head_variantb.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_head_variantb_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_lower_body_varianta.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_lower_body_varianta.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/ctm_fbi_v2_lower_body_varianta_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/w_ct_base_glove_exp.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/w_ct_base_glove_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/w_ct_fbi_glove.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36newcsgo/fbi/w_ct_fbi_glove.vtf");

	AddFileToDownloadsTable("models/player/csgoct/ct/ct_gign.dx80.vtx");
	AddFileToDownloadsTable("models/player/csgoct/ct/ct_gign.dx90.vtx");
	AddFileToDownloadsTable("models/player/csgoct/ct/ct_gign.mdl");
	AddFileToDownloadsTable("models/player/csgoct/ct/ct_gign.phy");
	AddFileToDownloadsTable("models/player/csgoct/ct/ct_gign.sw.vtx");
	AddFileToDownloadsTable("models/player/csgoct/ct/ct_gign.vvd");

	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/bare_arm_133.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/bare_arm_133.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/bare_arm_133_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_body_varh.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_body_varh.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_body_varh_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_head_normal_varh.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_head_varh.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_head_varh.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_lowerbody_normal_varh.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_lowerbody_varh.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/tm_professional_lowerbody_varh.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/w_t_base_fullfinger_glove.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/w_t_base_fullfinger_glove.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36_professional/2020/w_t_base_fullfinger_glove_normal.vtf");

	AddFileToDownloadsTable("models/player/vad36_professional/2020/t_phoenix.dx80.vtx");
	AddFileToDownloadsTable("models/player/vad36_professional/2020/t_phoenix.dx90.vtx");
	AddFileToDownloadsTable("models/player/vad36_professional/2020/t_phoenix.mdl");
	AddFileToDownloadsTable("models/player/vad36_professional/2020/t_phoenix.sw.vtx");
	AddFileToDownloadsTable("models/player/vad36_professional/2020/t_phoenix.vvd");

	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head_varianta.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head_varianta.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head_variantb.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head_variantd.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_head_variantd.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody_varianta.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody_varianta.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody_variantb.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody_variantd.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_lowerbody_variantd.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody_varianta.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody_varianta.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody_variantb.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody_variantd.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36anarchist/tm_anarchist_upperbody_variantd.vtf");

	AddFileToDownloadsTable("models/player/vad36anarchist/t_phoenix.dx80.vtx");
	AddFileToDownloadsTable("models/player/vad36anarchist/t_phoenix.dx90.vtx");
	AddFileToDownloadsTable("models/player/vad36anarchist/t_phoenix.mdl");
	AddFileToDownloadsTable("models/player/vad36anarchist/t_phoenix.phy");
	AddFileToDownloadsTable("models/player/vad36anarchist/t_phoenix.sw.vtx");
	AddFileToDownloadsTable("models/player/vad36anarchist/t_phoenix.vvd");

	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/bare_arm_103.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/bare_arm_103.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/bare_arm_133_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/t_base_fullfinger_glove.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/t_base_fullfinger_glove.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/t_base_fullfinger_glove_exp.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/t_base_fullfinger_glove_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_body_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_legs_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_v2_balaclava_normal.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_v2_balaclava_variantd.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_v2_balaclava_varianti_color.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_v2_body_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_v2_body_varianti_color.vtf");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_v2_legs_variantb.vmt");
	AddFileToDownloadsTable("materials/models/player/vad36csgomaster/phoenix/tm_phoenix_v2_legs_varianti_color.vtf");

	AddFileToDownloadsTable("models/player/wildlings/phoenix/t_phoenix.dx80.vtx");
	AddFileToDownloadsTable("models/player/wildlings/phoenix/t_phoenix.dx90.vtx");
	AddFileToDownloadsTable("models/player/wildlings/phoenix/t_phoenix.mdl");
	AddFileToDownloadsTable("models/player/wildlings/phoenix/t_phoenix.sw.vtx");
	AddFileToDownloadsTable("models/player/wildlings/phoenix/t_phoenix.vvd");

	AddFileToDownloadsTable("materials/models/player/blackbirds/jailpublic/t_leet.vtf");
	AddFileToDownloadsTable("materials/models/player/blackbirds/jailpublic/t_leet.vmt");
	AddFileToDownloadsTable("materials/models/player/blackbirds/jailpublic/t_leet_glass.vmt");

	AddFileToDownloadsTable("models/player/blackbirds/jailpublic/t_leet.mdl");
	AddFileToDownloadsTable("models/player/blackbirds/jailpublic/t_leet.vvd");
	AddFileToDownloadsTable("models/player/blackbirds/jailpublic/t_leet.sw.vtx");
	AddFileToDownloadsTable("models/player/blackbirds/jailpublic/t_leet.dx80.vtx");
	AddFileToDownloadsTable("models/player/blackbirds/jailpublic/t_leet.dx90.vtx");
	AddFileToDownloadsTable("models/player/blackbirds/jailpublic/t_leet.phy");
	
	PrecacheModel(MODELS_AMMO, true);
	PrecacheModel(MODELS_CAISSE, true);
	PrecacheModel(MODELS_IMPRIMANTE, true);
	PrecacheModel(MODELS_PC, true);
	PrecacheModel(MODELS_MONEY, true);
	PrecacheModel(MODELS_CASE, true);
	PrecacheModel(MODELS_PLANTE, true);
	PrecacheModel(SKIN_DEFAULT, true);
	PrecacheModel(SKIN_POLICE_DEFAULT, true);
	PrecacheModel(SKIN_MAFIA, true);
	PrecacheModel(SKIN_WILDLINGS, true);
	PrecacheModel(SKIN_CYBERCRIMINAL, true);
	PrecacheModel(SKIN_JAIL, true);
	PrecacheModel(SKIN_FISHER, true);
	PrecacheModel(SKIN_NIKO, true);
	PrecacheModel(SKIN_CHEF, true);
	PrecacheModel(SKIN_PRISONNER1, true);
	PrecacheModel(SKIN_PRISONNER2, true);
	PrecacheModel(SKIN_PRISONNER3, true);
	
	PrecacheSound(SOUND_KEYACTIVE, true);
	PrecacheSound(SOUND_FREEZE, true);
	PrecacheSound(SOUND_SALUT, true);
	PrecacheSound(SOUND_KLAXONNE, true);
	PrecacheSound(SOUND_ENTRER, true);
	PrecacheSound("sound/roleplay/sound_effects/couverture.mp3", true);
	
	DownloadAndPrecacheDistrib();
	
	GetCurrentMap(current_map, sizeof(current_map));
	
	Connect_Threaded_SQL();
	GetHeure();
	startheure();
	InitMapZones();
	InitDoors();
	InitJobs();
	initSpawns();
	initJailSpawns();
	ReloadDoorsKV();
	ReloadItemsKV();
	ReloadActivitiesKV();
	g_kvZones = new KeyValues("MapZones");
	g_kvZones.ImportFromFile("addons/sourcemod/configs/roleplay/maps.txt");

	g_kvJobs = new KeyValues("Jobs");
	g_kvJobs.ImportFromFile("addons/sourcemod/configs/roleplay/jobs.txt");

	g_kvDoors = new KeyValues("DoorGroups");
	g_kvDoors.ImportFromFile("addons/sourcemod/configs/roleplay/doorGroups.txt");

	g_kvItems = new KeyValues("Items");
	g_kvItems.ImportFromFile("addons/sourcemod/configs/roleplay/items.txt");

	g_kvActivities = new KeyValues("Activities");
	g_kvActivities.ImportFromFile("addons/sourcemod/configs/roleplay/activities.txt");

	g_kvSpawns = new KeyValues("Spawns");
	g_kvSpawns.ImportFromFile("addons/sourcemod/configs/roleplay/spawns.txt");

	g_kvJailSpawns = new KeyValues("JailSpawns");
	g_kvJailSpawns.ImportFromFile("addons/sourcemod/configs/roleplay/jailSpawns.txt");

}

public OnMapEnd()
{
	SaveTime();
	CloseHandle(Timers);
	CloseHandle(WeaponClean);
	CloseHandle(Pub);
	
	if (gTimer != INVALID_HANDLE)
		CloseHandle(gTimer);
}

public Action:OnRoundStart(Handle:event, const String:name[], bool:dontBroadcast)
{
	decl String:GameName[64];
	Format(GameName, sizeof(GameName), "RolePlay - alpha");
	Steam_SetGameDescription(GameName);
	
	if (StrEqual(current_map, "rp_riverside_b4"))
	{
		new ent = FindEntityByClassname(-1, "env_fog_controller");
	
		if (ent != -1)
		{
			AcceptEntityInput(ent, "TurnOff");
		}
		
		KillWeapon();
	}
	
	LockingDoors();
	
	WeaponClean = CreateTimer(60.0, Timer_Clean, _, TIMER_REPEAT);
	
	CreateTimer(300.0, SaveCapital, _, TIMER_REPEAT);
	
	SetNight();
	SetEntity();
	SetLights();
}

public Action:OnBulletImpact(Handle:event, const String:weaponName[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	new currentShot = g_areaShootCount;
	if (IsRootAdmin(client))
	{
		if (IsInAreaMod[client])
		{
			if (!g_UseShoot[client])
			{
				g_UseShoot[client] = true;
				
				static Float:pos[3];
				pos[0] = GetEventFloat(event,"x");
				pos[1] = GetEventFloat(event,"y");
				pos[2] = GetEventFloat(event,"z");
				BUILD_ZONE[currentShot][0] = pos[0];
				BUILD_ZONE[currentShot][1] = pos[1];
				BUILD_ZONE[currentShot][2] = pos[2];
				g_areaShootCount += 1;
				if (g_areaShootCount > 1) {
					g_areaShootCount = 0;
				}
				
				CPrintToChat(client, "%s : Coordonnées : %f %f %f", g_bPrefixDev, pos[0], pos[1], pos[2]);
			}
			else if (g_UseShoot[client])
			{
				g_UseShoot[client] = false;
			}
		}
	}
	
	return Plugin_Handled;
}

public Action:event_PlayerConnect(Handle:event, const String:name[], bool:dontBroadcast)
{
	if (!dontBroadcast)
	{
		decl String:clientName[33], String:networkID[22], String:address[32];
		GetEventString(event, "name", clientName, sizeof(clientName));
		GetEventString(event, "networkid", networkID, sizeof(networkID));
		GetEventString(event, "address", address, sizeof(address));

		new Handle:newEvent = CreateEvent("player_connect", true);
		SetEventString(newEvent, "name", clientName);
		SetEventInt(newEvent, "index", GetEventInt(event, "index"));
		SetEventInt(newEvent, "userid", GetEventInt(event, "userid"));
		SetEventString(newEvent, "networkid", networkID);
		SetEventString(newEvent, "address", address);

		FireEvent(newEvent, true);
		
		return Plugin_Handled;
	}

	return Plugin_Continue;
}


public Action:event_PlayerDisconnect_Suppress(Handle:event, const String:name[], bool:dontBroadcast)
{
	if (!dontBroadcast)
	{
		decl String:clientName[33], String:networkID[22], String:reason[65];
		GetEventString(event, "name", clientName, sizeof(clientName));
		GetEventString(event, "networkid", networkID, sizeof(networkID));
		GetEventString(event, "reason", reason, sizeof(reason));

		new Handle:newEvent = CreateEvent("player_disconnect", true);
		SetEventInt(newEvent, "userid", GetEventInt(event, "userid"));
		SetEventString(newEvent, "reason", reason);
		SetEventString(newEvent, "name", clientName);
		SetEventString(newEvent, "networkid", networkID);

		FireEvent(newEvent, true);
		
		return Plugin_Handled;
	}

	return Plugin_Continue;
}

public Action:OnPlayerTeam(Handle:event, const String:name[], bool:dontBroadcast)
{
	return Plugin_Handled;
}

public EventWeaponFire(Handle:event, String:name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	new String:sWeapon[32];
	
	if (IsValidAndAlive(client))
	{
		GetClientWeapon(client, sWeapon, sizeof(sWeapon));
		
		if (!HasDiplome[client] && !IsPolice(client) && !IsMoniteur(client))
		{
			if (!StrEqual(sWeapon, "weapon_knife"))
			{
				Recoil(client);
				PrintHintText(client, "Pour améliorer votre visée utilisez un diplôme de tir.");
			}
		}
	}
}

public Action:OnTakeDamage(victim, &attacker, &inflictor, &Float:damage, &damagetype)
{
	decl String:sWeapon[32];
	decl String:sInflictor[32];
	
	new Player;
	
	if (attacker > 0 && attacker <= MaxClients)
	{
		GetClientWeapon(attacker, sWeapon, sizeof(sWeapon));
		Player = attacker;
	}
	else
	{
		return Plugin_Handled;
	}
	
	GetEdictClassname(inflictor, sInflictor, sizeof(sInflictor));
	
	if (StrEqual(sInflictor, "prop_physics"))
	{
		damage = 0.0;
		return Plugin_Changed;
	}
	
	if (damagetype & DMG_VEHICLE)
	{
		if (StrEqual("prop_vehicle_driveable", sInflictor, false))
		{
			damage = 0.0;
			
			new Driver = GetEntPropEnt(inflictor, Prop_Send, "m_hPlayer");
			
			if (Driver != -1)
			{
				attacker = Driver;
				return Plugin_Changed;
			}
		}
	}
	
	if (IsInCellules(Player) || IsInMoniteur(Player) || IsInHopital(Player) || IsTazed[Player])
	{
		damage = 0.0;
			
		if (IsInCellules(Player) && IsPolice(Player))
		{
			if (StrEqual(sWeapon, "weapon_knife"))
			{
				CutJail(Player, victim);
			}
		}
			
		return Plugin_Changed;
	}
	
	if (IsValid(victim))
	{
		if (IsInCellules(victim) || IsInMoniteur(victim) || IsInHopital(victim))
		{
			damage = 0.0;
				
			return Plugin_Changed;
		}
		
		new InVehicule = GetEntPropEnt(victim, Prop_Send, "m_hVehicle");
	
		if (InVehicule != -1)
		{
			damage = 0.0;
			
			return Plugin_Changed;
		}
		
		if (GetClientTeam(Player) == 3)
		{
			if (StrEqual(sWeapon, "weapon_usp") || StrEqual(sWeapon, "weapon_m4a1"))
			{
				if (GetEntProp(Client_GetActiveWeapon(Player), Prop_Send, "m_bSilencerOn") == 1)
				{
					if (GetClientTeam(victim) > 1)
					{
						decl Float:Pos[3];
						
						GetClientEyeAngles(victim, Pos);
					
						new Float:position = Pos[1];
					
						Pos[1] = 30 + position;
						
						new Float:positions = Pos[2];
						Pos[2] = 10 + positions;
						
						SetEntPropVector(victim, Prop_Send, "m_vecPunchAngle", Pos);
					
						Client_ScreenFade(victim, 500, FFADE_OUT|FFADE_PURGE, 1, 250, 250, 250, 200, true);
						
						Ralentissement(victim, 0.7, 5.0);
					
						damage = 0.0;
					
						return Plugin_Changed;
					}
				}
			}
			else if (StrEqual(sWeapon, "weapon_tmp"))
			{
				if (GetClientTeam(victim) > 1)
				{
					decl Float:Pos2[3];
				
					GetClientEyeAngles(victim, Pos2);
					
					new Float:position = Pos2[1];
					
					Pos2[1] = 30 + position;
					
					new Float:positions = Pos2[2];
					Pos2[2] = 10 + positions;
					
					SetEntPropVector(victim, Prop_Send, "m_vecPunchAngle", Pos2);
					
					Client_ScreenFade(victim, 500, FFADE_OUT|FFADE_PURGE, 1, 250, 250, 250, 200, true);
					
					Ralentissement(victim, 0.7, 5.0);
					
					damage = 0.0;
					
					return Plugin_Changed;
				}
			}
			else if (StrEqual(sWeapon, "weapon_knife"))
			{
				CutJail(Player, victim);
				
				damage = 0.0;
			
				return Plugin_Changed;
			}
		}
	
		if (Player == inflictor)
		{
			if (StrEqual(sWeapon, "weapon_knife"))
			{
				if (CUTBURN_ACTIVE[Player])
				{
					BurnPlayer(victim);
					
					damage = 0.0;
					return Plugin_Changed;
				}
				
				if (CUTFREEZE_ACTIVE[Player])
				{
					FreezePlayer(victim);
					
					damage = 0.0;
					return Plugin_Changed;
				}
				
				if (CUTFLASH_ACTIVE[Player])
				{
					FlashPlayer(victim);
					
					damage = 0.0;
					return Plugin_Changed;
				}
				
				if (CUTSMALL_ACTIVE[Player])
				{
					SmallPlayer(victim, 10.0);
					
					damage = 0.0;
					return Plugin_Changed;
				}
				
				if (CUTBIG_ACTIVE[Player])
				{
					BigPlayer(victim, 10.0);
					
					damage = 0.0;
					return Plugin_Changed;
				}
				
			}
		}
		
		if (GetClientTeam(Player) == 3 && GetClientTeam(victim) == 2 || GetClientTeam(Player) == 2 && GetClientTeam(victim) == 3)
		{
			if (!StrEqual(sWeapon, "weapon_knife"))
			{
				damage *= 0.8;
				return Plugin_Changed;
			}
		}
		else if (GetClientTeam(Player) == 3 && GetClientTeam(victim) == 3 || GetClientTeam(Player) == 2 && GetClientTeam(victim) == 2)
		{
			damage *= 1.2;
			return Plugin_Changed;
		}
	}
	
	return Plugin_Continue;
}

public Action:OnWeaponCanUse(client, weapon)
{
	decl String:sWeapon[32]; 
	GetEdictClassname(weapon, sWeapon, sizeof(sWeapon));
	
	if(StrEqual(sWeapon, "weapon_hegrenade") || StrEqual(sWeapon, "weapon_smokegrenade") || StrEqual(sWeapon, "weapon_flashbang"))
	{
		if (!HasPermisProjectiles(client))
		{
			CPrintToChat(client, "%s : Vous devez posséder un permis projectiles pour ramasser une grenade.", g_bPrefix);
			return Plugin_Handled;
		}
		else
		{
			return Plugin_Continue;
		}
	}
	else
		return Plugin_Continue;
}  

public OnPostThink(client)
{
	new GroundEnt = GetEntPropEnt(client, Prop_Send, "m_hGroundEntity");
	
	if (GroundEnt > 0)
	{
		SetEntPropEnt(client, Prop_Send, "m_hGroundEntity", 0);
	}
}

public OnPreThink(client)
{
	GetClientEyeAngles(client, CurrentEyeAngle[client]);
}

public Action:OnPlayerRunCmd(client, &buttons, &impulse, Float:vel[3], Float:angles[3], &weapon)
{
	if (!IsValidAndAlive(client))
		return;
		
	if (vel[0] || vel[1] || vel[2])
	{
		if (AFK[client])
		{
			AFK[client] = false;
			
			CPrintToChatAll("%s : %N n'est plus {olive}absent {default}!", g_bPrefix, client);
			
			decl String:ClanTagRankName[20];
			
			GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
			CS_SetClientClanTag(client, ClanTagRankName);
		}
		
		AFK_TIMER[client] = GetGameTime();
	}
	else if (!AFK[client])
	{
		if (IsPossibleToAfk[client] && ((GetGameTime() - AFK_TIMER[client]) >= AFK_TIME))
		{
			CPrintToChatAll("%s : %N est {red}absent {default}!", g_bPrefix, client);
			AFK[client] = true;
				
			decl String:ClanTagRankName[20];
			
			GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
			CS_SetClientClanTag(client, ClanTagRankName);
		}
	}
	
	if (!g_InUse[client] && buttons & IN_USE)
	{
		g_InUse[client] = true;
		
		new Ent;
		new String:Name[200];
		new String:Classname[32];
		
		Ent = GetClientAimTarget(client, false);
		
		if (Ent != -1 && IsValidEntity(Ent))
		{
			Entity_GetName(Ent, Name, sizeof(Name));
		
			new Float:origin[3], Float:clientent[3];
			
			GetEntPropVector(Ent, Prop_Send, "m_vecOrigin", origin);
			GetEntPropVector(client, Prop_Send, "m_vecOrigin", clientent);
			
			new Float:distance = GetVectorDistance(origin, clientent);
			new Float:vec[3];
			
			GetClientAbsOrigin(client, vec);
			vec[2] += 10;
			
			GetEdictClassname(Ent, Classname, sizeof(Classname));
			
			decl String:modelname[128];
			GetEntPropString(Ent, Prop_Data, "m_ModelName", modelname, sizeof(modelname));

			decl String:Buffer[8][32];
			decl String:itemType[32];
			if (ExplodeString(Name, "_", Buffer, 3, 32) > 2) {
				itemType = Buffer[0];
				if (StrEqual(itemType, "item")) {
					new itemID = StringToInt(Buffer[1]);
					new quantity = 1;
					SaveInventory(client, itemID, Buffer[2], quantity);
					CPrintToChat(client, "%s : Vous avez ramassé {red}%i{default} {olive}%s{default}.", g_bPrefix, quantity, Buffer[2]);
					RemoveEdict(Ent);
				}
			}
						
			if (StrEqual(modelname, "models/props/cs_assault/money.mdl"))
			{
				new Float:Entvec[3];
				new Float:Plyrvec[3];
				new Float:distvec = 0.0;
				
				GetClientAbsOrigin(client, Plyrvec);
				GetEntPropVector(Ent, Prop_Send, "m_vecOrigin", Entvec);
				
				distvec = GetVectorDistance(Entvec, Plyrvec, false);
				
				if (distvec < 60)
				{
					decl String:FinalMoney[32];
					
					GetTargetName(Ent, FinalMoney, sizeof(FinalMoney));
					
					if (0 < StringToInt(FinalMoney))
					{
						RemoveEdict(Ent);
						
						money[client] += StringToInt(FinalMoney);
						
						CPrintToChat(client, "%s : Vous avez ramasser %s€ par terre.", g_bPrefix, FinalMoney);
					}
				}
			}
			decl String:Door[255];
			GetEdictClassname(Ent, Door, sizeof(Door));
			if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
			{
				new HammerID = Entity_GetHammerId(Ent);
				decl String:hammerIdBuffer[40];
				IntToString(HammerID, hammerIdBuffer, sizeof(hammerIdBuffer));
				new doorKeyCode = GetDoorKeyCode(hammerIdBuffer);
				PrintToServer("KeyCode : %i", doorKeyCode);
				if (doorKeyCode != -1 && doorKeyCode != -2) {
					BuildKeypadTypeMenu(client, hammerIdBuffer, doorKeyCode);
				}

			}
			PrintToServer("Distrib Name : %s", Name);
			if (StrEqual(Name, "distributeur") || StrContains(Name, "hacked_distributeur_") != -1)
			{
				if (distance <= 60)
				{
					Entiter[client] = Ent;
					new Handle:menu = CreateMenu(Menu_Bank);
					SetMenuTitle(menu, "Banque :");
					
					if (HasCompteCourant(client))
					{
						AddMenuItem(menu, "Deposit", "Déposer de l'argent");
						AddMenuItem(menu, "Retired", "Retirer de l'argent");
						
						if (IsChef(client))
						{
							AddMenuItem(menu, "Capital", "Déposer dans le capital");
						}
						if (IsBanquier(client)) {
							AddMenuItem(menu, "verifyATM", "Vérifier l'état du distributeur");
						}
						
						AddMenuItem(menu, "save", "Forcer la sauvegarde");
						DisplayMenu(menu, client, 30);
					}
					else
					{
						CPrintToChat(client, "%s : J'ai besoin d'un {olive}compte bancaire{default} pour pouvoir utiliser ce {olive}distributeur{default}.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous êtes trop loin du distributeur.", g_bPrefix);
				}
			}
			else if (StrEqual(Name, "caisse_kit"))
			{
				if (distance <= 60)
				{
					if (IsMafia(client) && IsInMafia(client))
						{
							if (!OnCreationKit[client])
							{
								if (GetItemInInventory(17, client) < LIMIT_KIT)
								{
									CreateTimer(6.0, Timer_Kit, client);
									
									SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
									SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 6);
									
									OnCreationKit[client] = true;
									
									SetEntityRenderColor(client, 255, 0, 0, 0);
									SetEntityMoveType(client, MOVETYPE_NONE);
								}
								else
								{
									CPrintToChat(client, "%s : Vous avez le maximum de kit de crochetage (%i/%d)", g_bPrefix, 0, LIMIT_KIT);
								}
							}
							else
							{
								CPrintToChat(client, "%s : Vous êtes déjà en cours de fabrication.", g_bPrefix);
							}
						}
					else
					{
						CPrintToChat(client, "%s : Vous ne pouvez pas utiliser cette caisse.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous êtes trop loin de la caisse.", g_bPrefix);
				}
			}
			else if (StrEqual(Name, "caisse_comico") || StrEqual(Name, "caisse_fbi"))
			{
				new timestamp;
				timestamp = GetTime();
				
				if ((timestamp - PickupWeapon[client]) < 15)
				{
					CPrintToChat(client, "%s : Vous devez attendre %i secondes avant de pouvoir prendre une arme.", g_bPrefix, (15 - (timestamp - PickupWeapon[client])) );
				}
				else
				{
					if (distance <= 60)
					{
						new Handle:menuarmu = CreateMenu(Menu_ArmuFlic);
						SetMenuTitle(menuarmu, "Armurerie du gouvernement :");
						
						if (StrEqual(Name, "caisse_comico"))
						{
							if (IsGardien(client))
							{
								AddMenuItem(menuarmu, "usp", "KM .45 Tactique");
								AddMenuItem(menuarmu, "m3", "Fusil à pompe Benelli M3");
							}
							else
							{
								AddMenuItem(menuarmu, "usp", "KM .45 Tactique");
								AddMenuItem(menuarmu, "m3", "Fusil à pompe Benelli M3");
								AddMenuItem(menuarmu, "mp5", "MP5 Navy");
								AddMenuItem(menuarmu, "famas", "Clarion 5.56 Famas");
							}
						}
						else if (StrEqual(Name, "caisse_fbi"))
						{
							if (IsFbi(client) || IsCia(client) || IsGti(client) || IsChefPolice(client))
							{
								AddMenuItem(menuarmu, "", "--- PROTECTIONS ---", ITEMDRAW_DISABLED);
								AddMenuItem(menuarmu, "kevlar", "Kevlar + Casque");
								AddMenuItem(menuarmu, "", "--- SOINS ---", ITEMDRAW_DISABLED);
								AddMenuItem(menuarmu, "soin", "Trousse de soins");
								AddMenuItem(menuarmu, "", "--- ARMES ---", ITEMDRAW_DISABLED);
								AddMenuItem(menuarmu, "scout", "Schmidt Scout");
								AddMenuItem(menuarmu, "m4", "Maverick M4A1");
								AddMenuItem(menuarmu, "five", "FN Five Seven");
								AddMenuItem(menuarmu, "deagle", "NightHawk Desert Eagle");
							}
							else
							{
								CPrintToChat(client, "%s : Vous n'avez pas le grade nécessaire.", g_bPrefix);
							}
						}
						
						DisplayMenu(menuarmu, client, 30);
					}
					else
					{
						CPrintToChat(client, "%s : Vous êtes trop éloigné de la caisse.", g_bPrefix);
					}
				}
			}
		}
	}
	else if(g_InUse[client] && !(buttons & IN_USE))
	{
		g_InUse[client] = false;
	}
	
	if (!g_InDuck[client] && buttons & IN_DUCK)
	{	
		new voiture = GetEntPropEnt(client, Prop_Send, "m_hVehicle");
		
		if (voiture != -1)
		{
			g_InDuck[client] = true;
			
			AcceptEntityInput(voiture, "TurnOn", -1, -1, 0);
		}	
	}
	else if (g_InDuck[client] && !(buttons & IN_DUCK))
	{
		g_InDuck[client] = false;
	}	
	
}

public Action:OnPlayerDeath(Handle:event, const String:name[], bool:dontBroadcast)
{
	new MoneyOffset = FindSendPropInfo("CCSPlayer", "m_iAccount");
	
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	new killer = GetClientOfUserId(GetEventInt(event, "attacker"));
	
	argent[killer] = GetEntData(killer, MoneyOffset, 4);
	
	if (client)
	{
		if (IsClientInGame(client))
		{
			if (!IsPlayerAlive(client))
			{
				g_CountDead[client] = RESPAWN_TIME;
				
				g_deadtimer[client] = CreateTimer(1.0, Timer_Dead, client, TIMER_REPEAT);
				IsTazed[client] = false;
				IsPossibleToAfk[client] = false;
				HasDiplome[client] = false;
				HasOeilBionique[client] = false;
				CarHorn[client] = false;
				g_Count[client] = 0.0;
				ClientCommand(client, "r_screenoverlay debug/yuv.vmt");
				
				if (money[client] > 0)
				{
					new random = (money[client] / 100) * 10;
					
					new FinalMoney = 0;
					
					if (0 <= money[client] - random)
					{
						CPrintToChat(client, "%s : %i€ sont tombées de vos poches en mourant.", g_bPrefix, random);
						
						FinalMoney = random;
					}
					else
					{
						CPrintToChat(client, "%s : %i€ sont tombées de vos poches en mourant.", g_bPrefix, money[client]);
						
						FinalMoney = money[client];
						
						money[client] = 0;
					}
					
					new ent;
					
					if((ent = CreateEntityByName("prop_physics")) != -1)
					{
						new Float:origin[3];
						GetClientEyePosition(client, origin);
						
						TeleportEntity(ent, origin, NULL_VECTOR, NULL_VECTOR);
						
						decl String:TargetName[32];
						Format(TargetName, sizeof(TargetName), "%i", FinalMoney);
						
						DispatchKeyValue(ent, "model", MODELS_MONEY);
						DispatchKeyValue(ent, "physicsmode", "2");
						DispatchKeyValue(ent, "massScale", "8.0");
						DispatchKeyValue(ent, "targetname", TargetName);
						DispatchSpawn(ent);
						
						SetEntityMoveType(ent, MOVETYPE_VPHYSICS);
						
						SetEntProp(ent, Prop_Send, "m_usSolidFlags", 8);
						SetEntProp(ent, Prop_Send, "m_CollisionGroup", 11);
					}
				}
			}
			
			if (killer > 0)
			{
				if (IsClientInGame(killer))
				{
					if (killer != client)
					{
						if (IsMafia(killer)) {
							if (IsMafiaLeader(client)) {
								rankid[client] = 5;
								rankid[killer] = 1;
							}
						}
						if (IsTriades(killer)) {
							if (IsTriadesLeader(client)) {
								rankid[client] = 5;
								rankid[killer] = 1;
							}
						}
						if ((GetClientTeam(killer) == 2) && (GetClientTeam(client) == 3))
						{
							argent[killer] += 300;
							SetEntData(killer, MoneyOffset, argent[killer], 4, true);
						}
						else if ((GetClientTeam(killer) == 3) && (GetClientTeam(client) == 2))
						{
							argent[killer] += 300;
							SetEntData(killer, MoneyOffset, argent[killer], 4, true);
						}
						else if ((GetClientTeam(killer) == 2) && (GetClientTeam(client) == 2))
						{
							argent[killer] -= 3300;
							SetEntData(killer, MoneyOffset, argent[killer], 4, true);
						}
						else if ((GetClientTeam(killer) == 3) && (GetClientTeam(client) == 3))
						{
							argent[killer] -= 3300;
							SetEntData(killer, MoneyOffset, argent[killer], 4, true);
						}
						
						DestroyLevel(killer);
						
						if (IsTueur(killer))
						{
							if (cibleID[killer] == client)
							{
								if (OnContrat[killer])
								{
									HasKillCible[killer] = true;
								}
							}
						}
					}
				}
				
				Format(LastKillBy[client], sizeof(LastKillBy[]), "%N", killer);
			}
			
			gObj[client] = -1;
			grab[client] = false;
			
			if (IsTazed[client] == true)
			{
				IsTazed[client] = false;
				g_Count[client] = 0.0;
			}
		}
	}
}

public Action:InitCapital(Handle:timer)
{
	decl String:query[200];
	
	new Handle:Get;
	
	for(new i=1; i<=18; i++)
	{
		decl String:error[256];
		new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

		Format(query, (sizeof(query) - 1), "SELECT capital FROM jobs WHERE id = '%i'", i);
		Get = SQL_Query(database, query);
		
		if (Get != INVALID_HANDLE)
		{
			while (SQL_FetchRow(Get))
			{
				capital[i] = SQL_FetchInt(Get, 0);
				employers[i] = 0;
				quota[i] = 99999;
			}
		}
		
		CloseHandle(database);
	}
}  

public Action:SaveCapital(Handle:timer)
{
	decl String:query[200];

	for(new i=1; i<=18; i++)
	{
		decl String:error[256];
		new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
		
		Format(query, (sizeof(query) - 1), "UPDATE jobs SET CAPITAL = '%i' WHERE id = '%i'", capital[i], i);
		SQL_FastQuery(database, query);
		
		CloseHandle(database);
	}
	
	for(new i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i) && !IsFakeClient(i))
		{
			DBSave(i);
		}
	}
}

public SauvegardeCapital(entreprise)
{
	decl String:query[200];

	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(query, (sizeof(query) - 1), "UPDATE jobs SET CAPITAL = '%i' WHERE id = '%i'", capital[entreprise], entreprise);
	SQL_FastQuery(database, query);

	CloseHandle(database);
}

public OnClientPutInServer(client)
{
	SDKHook(client, SDKHook_PreThink, OnPreThink);
	SDKHook(client, SDKHook_PostThink, OnPostThink);
}

public Action:OnClientPreAdminCheck(client)
{
	ResetInfos(client);
	CreateTimer(2.0, CreateSQLAccount, client);
	
	PrintToConsole(client, "~~~~~~%s~~~~~~", NAME);
	PrintToConsole(client, "~ %s generated by Sourcemod", NAME);
	PrintToConsole(client, "~ %s version (%s)", NAME, PLUGIN_VERSION);
	PrintToConsole(client, "~ Coded by %s", AUTHOR);
	
	SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);
	SDKHook(client, SDKHook_WeaponCanUse, OnWeaponCanUse);
}

public ResetInfos(client)
{
	IsCivil[client] = false;
	IsInvisible[client] = false;
	IsInAreaMod[client] = false;
	Speedhack[client] = false;
	IsInFakeJob[client] = false;
	godmod[client] = false;
	OnCreationKit[client] = false;
	IsPossibleToAfk[client] = false;
	CUTBURN_ACTIVE[client] = false;
	CUTFREEZE_ACTIVE[client] = false;
	CUTFLASH_ACTIVE[client] = false;
	CUTSMALL_ACTIVE[client] = false;
	CUTBIG_ACTIVE[client] = false;
	fiche[client] = false;
	HasDiplome[client] = false;
	IsInChirurgieJambes[client] = false;
	IsInChirurgieCoeur[client] = false;
	IsInChirurgieTete[client] = false;
	BoostDeagle[client] = false;
	BoostLife[client] = false;
	BoostCut[client] = false;
	BoostInvisi[client] = false;
	BoostVitesse[client] = false;
	HasKillCible[client] = false;
	OnContrat[client] = false;
	HasAmeliorationElectronique[client] = false;
	HasOeilBionique[client] = false;
	HasRegenerationBionique[client] = false;
	TimerDead[client] = false;
	IsExitVehicle[client] = false;
	CarHorn[client] = false;
	isObserver[client] = false;
	
	Entiter[client] = 0;
	gObj[client] = -1;
	FORCE_DISTANCE[client] = 0.0;
	salarychoose[client] = 0;
	g_Count[client] = 0.0;
	JailHours[client] = 0;
	JailMinutes[client] = 0;
	TempJailTime[client] = 0;
	TempJailHours[client] = 0;
	channelle[client] = 1;
	enquete[client] = 0;
	CommanditeurID[client] = 0;
	TempCibleID[client] = 0;
	PriceContrat[client] = 0;
	cibleID[client] = 0;
	BoostDispo[client] = 0;
	convoquer[client] = 0;
	HasImprimante[client] = 0;
	HasPlante[client] = 0;
	vol[client] = 0;
	vis[client] = 0;
	playerIds[client] = 0;
	PickupWeapon[client] = 0;
	braquagetime[client] = 0;

	strcopy(LastKillBy[client], sizeof(LastKillBy[]), "Personne");
}

public Action:CreateSQLAccount(Handle:Timer, any:client)
{
	if (IsValid(client))
	{
		new String:SteamId[64];
		GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
	
		if(StrEqual(SteamId, ""))
		{
			CreateTimer(2.0, CreateSQLAccount, client);
		}
		else
		{	
			InQuery = true;
			InitializeClientOnDB(client);
		}
	}
}

InitializeClientOnDB(client)
{
	decl String:SteamId[256];
	decl String:buffer[1000];
	decl String:Name[120];
	
	GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
	GetClientName(client, Name, sizeof(Name));
	
	if (ACTIVE_TRACEBAN)
	{
		decl String:IP[50];
		
		GetClientIP(client, IP, sizeof(IP), true);
		
	}
	
	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	/*Format(buffer, sizeof(buffer), "SELECT TYPE, VIP FROM rp_account WHERE SteamId = '%s';", SteamId);
	
	if (query)
	{
		SQL_Rewind(query);
		
		new bool:fetch = SQL_FetchRow(query);
		
		if (!fetch)
		{
			InsertPlayer(client);
		}
		else
		{
			TypeAccount[client] = SQL_FetchInt(query, 0);
			VipUsed[client] = SQL_FetchInt(query, 1);
		}
		
		CloseHandle(query);
	}*/
	
	Format(buffer, sizeof(buffer), "SELECT username, money, bank, rank_id, job_id, reputation, last_log_time, id, dirty_money FROM players WHERE steam_id = '%s';", SteamId);
	new Handle:query = SQL_Query(database, buffer);
	query = SQL_Query(database, buffer);
	
	if (query)
	{
		SQL_Rewind(query);
		
		new bool:fetch = SQL_FetchRow(query);
		
		if (!fetch)
		{
			InsertInDatabase(client, SteamId, Name);
		}
		else
		{
			decl String:newName[129];
			SQL_FetchString(query, 0, newName, sizeof(newName));
			rpName[client] = newName;
			money[client] = SQL_FetchInt(query, 1);
			dirtyMoney[client] = SQL_FetchInt(query, 8);
			bank[client] = SQL_FetchInt(query, 2);
			rankid[client] = SQL_FetchInt(query, 3);
			jobid[client] = SQL_FetchInt(query, 4);
			reputation[client] = SQL_FetchInt(query, 5);
			groupe[client] = 0;
			jailtime[client] = 0;
			IsInJail[client] = 0;
			rib[client] = 0;
			cb[client] = 0;
			compte[client] = 0;
			EmbaucheExpire[client] = 0;
			lastontime[client] = SQL_FetchInt(query, 6);
			SetRpName(client, rpName[client]);
			playerIds[client] = SQL_FetchInt(query, 7);
			InitPlayerInventory(client);
			
			decl String:lastconnexion[64];
			FormatTime(lastconnexion, sizeof(lastconnexion), "%x à %X", lastontime[client]);
	
			CPrintToChat(client, "%s : Votre dernière connexion date du\x04 %s.", g_bPrefix, lastconnexion);
		}
		
		CloseHandle(query);
	}
	
	IsDisconnect[client] = false;
	InQuery = false;
	Loaded[client] = true;
	
	InitSalary(client);
	
	EmitSoundToClient(client, SOUND_ENTRER, _, _, _, _, 0.8);
	
	strcopy(GroupNameClient[client], sizeof(GroupNameClient[]), "Aucun");
	
	g_CountDead[client] = RESPAWN_TIME;

	TimerHud[client] = CreateTimer(1.0, HudTimer, client, TIMER_REPEAT);
	TimerImprimante[client] = CreateTimer(3.0, ImprimanteTimer, client, TIMER_REPEAT);
	TimerPlante[client] = CreateTimer(600.0, PlanteTimer, client, TIMER_REPEAT);
	g_deadtimer[client] = CreateTimer(1.0, Timer_Dead, client, TIMER_REPEAT);
		
	CloseHandle(database);
}

public Action:Block_CMD(client, Args)
{
	return Plugin_Handled;
}

public SetRpName (client, String:newRpName[]) {
	CPrintToChat(client, "%s : Vous vous êtes renommé en {olive}%s{default}.", g_bPrefix, newRpName);
	SetClientName(client, newRpName);
}

public Connect_Threaded_SQL()
{
	if (g_ThreadedHandle != null)
	{
		PrintToServer("A threaded connection already exists, run the next test");
	}
		
	SQL_TConnect(Set_Threaded_SQL, "roleplay");	
}

public Set_Threaded_SQL(Handle:owner, Handle:hndl, const String:error[], any:data)
{
	PrintToServer("CallbackTest1() (owner %x) (hndl %x) (error \"%s\") (data %d)", owner, hndl, error, data);
	if (g_ThreadedHandle != null && hndl != null)
	{
		delete hndl;
	} else {
		g_ThreadedHandle = hndl;
	}
}

public InitMapZones () {

	decl String:buffer[1000];
	decl String:error[256];
	new counter = 0;
	new batchNumber = 0;

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(buffer, sizeof(buffer), "SELECT hideout_name, x, y, z, batch_id FROM hideout WHERE map = '%s';", current_map);
	new Handle:query = SQL_Query(database, buffer);

	if (query) {
		KeyValues kv = new KeyValues("MapZones");
		while (SQL_FetchRow(query)) {
			decl String:zoneName[150];
			SQL_FetchString(query, 0, zoneName, sizeof(zoneName));
			MAP_ZONES_NAME[counter] = zoneName;
			MAP_ZONES[counter][batchNumber][0] = SQL_FetchFloat(query, 1);
			MAP_ZONES[counter][batchNumber][1] = SQL_FetchFloat(query, 2);
			MAP_ZONES[counter][batchNumber][2] = SQL_FetchFloat(query, 3);
			decl String:finalBatchName[40];
			decl String:keyString[20];
			IntToString(counter, keyString, sizeof(keyString));
			IntToString(counter, finalBatchName, sizeof(finalBatchName));

			decl String:batchString[20];
			IntToString(batchNumber, batchString, sizeof(batchString));

			StrCat(finalBatchName, sizeof(finalBatchName), batchString);

			kv.JumpToKey(zoneName, true);
			kv.SetVector(finalBatchName, MAP_ZONES[counter][batchNumber]);
			kv.Rewind();

			batchNumber++;
			if (batchNumber > 1){
				batchNumber = 0;
				counter++;
			}
		}
		kv.ExportToFile("addons/sourcemod/configs/roleplay/maps.txt");
		delete kv;
	}		
	CloseHandle(query);
	CloseHandle(database);
}

public InitDoors () {
	decl String:buffer[1000];
	decl String:error[256];

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	Format(buffer, sizeof(buffer),"DELETE FROM doors WHERE steam_id IS NOT NULL;");

	if (!SQL_FastQuery(database, buffer)) {
		SQL_GetError(database, error, sizeof(error));
		PrintToServer("Failed to query from insert player (error: %s)", error);
	}
	CloseHandle(database);
}

public DeleteClientDoors (String:SteamID[]) {
	decl String:buffer[1000];
	decl String:error[256];

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	Format(buffer, sizeof(buffer),"DELETE FROM doors WHERE steam_id = '%s';", SteamID);

	if (!SQL_FastQuery(database, buffer)) {
		SQL_GetError(database, error, sizeof(error));
		PrintToServer("Failed to query from insert player (error: %s)", error);
	}
	CloseHandle(database);
}

public InitJobs () {
	decl String:buffer[1000];
	decl String:error[256];
	decl String:jobId[4];
	new rankTeam;
	decl String:rankId[4];
	decl String:rankName[150];
	decl String:jobName[150];

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	Format(buffer, sizeof(buffer), "SELECT r.job_id, r.rank_id, r.rank_name, r.rank_team, j.job_name FROM ranks r JOIN jobs j ON r.job_id = j.id;");
	new Handle:query = SQL_Query(database, buffer);

	if (query) {
		KeyValues kv = new KeyValues("Jobs");
		while (SQL_FetchRow(query)) {
			IntToString(SQL_FetchInt(query, 0), jobId, sizeof(jobId));
			IntToString(SQL_FetchInt(query, 1), rankId, sizeof(rankId));
			SQL_FetchString(query, 2, rankName, sizeof(rankName));
			rankTeam = SQL_FetchInt(query, 3);
			SQL_FetchString(query, 4, jobName, sizeof(jobName));

			kv.JumpToKey(jobId, true);
			kv.SetString(rankId, rankName);
			kv.SetString("jobName", jobName);
			kv.SetNum("team", rankTeam);
			kv.Rewind();
		}
		kv.ExportToFile("addons/sourcemod/configs/roleplay/jobs.txt");
		delete kv;
	}		
	CloseHandle(query);
	CloseHandle(database);
}

public ReloadDoorsKV () {

	decl String:buffer[1000];
	decl String:error[256];

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(buffer, sizeof(buffer), "SELECT steam_id, hammer_id, job_id, rank_id, keycode FROM doors WHERE map = '%s';", current_map);
	new Handle:query = SQL_Query(database, buffer);

	if (query)
	{
		KeyValues kv = new KeyValues("DoorGroups");
		while (SQL_FetchRow(query))
		{
			
			decl String:steamId[30];
			decl String:hammerId[40];
			new job_id = SQL_FetchInt(query, 2);
			new rank_id = SQL_FetchInt(query, 3);
			new keyCode = SQL_FetchInt(query, 4);
			SQL_FetchString(query, 0, steamId, sizeof(steamId));
			IntToString(SQL_FetchInt(query, 1), hammerId, sizeof(hammerId));

			kv.JumpToKey(hammerId, true);
			kv.SetString("owner", steamId);
			
			kv.SetNum("door_keycode", keyCode);
			if (job_id != 0) {
				kv.SetNum("job_id", job_id);
			}
			if (rank_id != 0) {
				kv.SetNum("rank_id", rank_id);
			}
			kv.Rewind();
		}
		kv.ExportToFile("addons/sourcemod/configs/roleplay/doorGroups.txt");
		delete kv;
	}		
	CloseHandle(query);
	CloseHandle(database);
	delete g_kvDoors;
	g_kvDoors = new KeyValues("DoorGroups");
	g_kvDoors.ImportFromFile("addons/sourcemod/configs/roleplay/doorGroups.txt");
}

public InitPlayerInventory (client) {
	decl String:buffer[1000];
	decl String:error[256];
	decl String:path[1000];
	

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(buffer, sizeof(buffer), "SELECT i.quantity, i.item_id, it.show_in_inventory, it.cs_weapon_id FROM inventory i JOIN players p ON p.id = i.player_id JOIN items it ON it.id = i.item_id WHERE p.id = '%i';", playerIds[client]);
	new Handle:query = SQL_Query(database, buffer);
	PrintToServer("SQL Command : %s", buffer);
	KeyValues kv = new KeyValues("Inventory");
	if (query)
	{
		while (SQL_FetchRow(query))
		{
			
			decl String:itemName[150];
			decl String:cs_weapon_id[150];

			new quantity = SQL_FetchInt(query, 0);
			new show_in_inventory = SQL_FetchInt(query, 2);
			IntToString(SQL_FetchInt(query, 1), itemName, sizeof(itemName));
			SQL_FetchString(query, 3, cs_weapon_id, sizeof(cs_weapon_id));

			kv.JumpToKey(itemName, true);
			kv.SetNum("quantity", quantity);
			kv.SetNum("show_in_inventory", show_in_inventory);
			kv.SetString("cs_weapon_id", cs_weapon_id);
			kv.Rewind();
		}
	}
	PrintToServer("Generate file for steamID : %i", playerIds[client]);
	Format(path, sizeof(path), "addons/sourcemod/configs/roleplay/players/%i.txt", playerIds[client]);
	kv.ExportToFile(path);
	delete kv;
	CloseHandle(query);
	CloseHandle(database);
}

public ReloadItemsKV () {

	decl String:buffer[1000];
	decl String:error[256];

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(buffer, sizeof(buffer), "SELECT item_name, cs_weapon_id, seller_job_id, seller_rank_id, price, id, show_in_inventory FROM items;");
	new Handle:query = SQL_Query(database, buffer);

	if (query)
	{
		KeyValues kv = new KeyValues("Items");
		while (SQL_FetchRow(query))
		{
			
			decl String:itemName[150];
			decl String:itemId[150];
			decl String:cs_weapon_id[150];

			SQL_FetchString(query, 0, itemName, sizeof(itemName));
			SQL_FetchString(query, 1, cs_weapon_id, sizeof(cs_weapon_id));
			new job_id = SQL_FetchInt(query, 2);
			new rank_id = SQL_FetchInt(query, 3);
			new price = SQL_FetchInt(query, 4);
			IntToString(SQL_FetchInt(query, 5), itemId, sizeof(itemId));
			new show_in_inventory = SQL_FetchInt(query, 6);

			kv.JumpToKey(itemId, true);
			kv.SetString("item_name", itemName);
			kv.SetString("cs_weapon_id", cs_weapon_id);
			kv.SetNum("seller_job_id", job_id);
			kv.SetNum("seller_rank_id", rank_id);
			kv.SetNum("price", price);
			kv.SetNum("show_in_inventory", show_in_inventory);
			kv.Rewind();
		}
		kv.ExportToFile("addons/sourcemod/configs/roleplay/items.txt");
		delete kv;
	}		
	CloseHandle(query);
	CloseHandle(database);
	delete g_kvItems;
	g_kvItems = new KeyValues("Items");
	g_kvItems.ImportFromFile("addons/sourcemod/configs/roleplay/items.txt");
}

public ReloadActivitiesKV () {

	decl String:buffer[1000];
	decl String:error[256];

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(buffer, sizeof(buffer), "SELECT activity_name, seller_job_id, seller_rank_id, price, id FROM activities;");
	new Handle:query = SQL_Query(database, buffer);

	if (query)
	{
		KeyValues kv = new KeyValues("Activities");
		while (SQL_FetchRow(query))
		{
			
			decl String:activityName[150];
			decl String:activityId[150];

			SQL_FetchString(query, 0, activityName, sizeof(activityName));
			new job_id = SQL_FetchInt(query, 1);
			new rank_id = SQL_FetchInt(query, 2);
			new price = SQL_FetchInt(query, 3);
			IntToString(SQL_FetchInt(query, 4), activityId, sizeof(activityId));

			kv.JumpToKey(activityId, true);
			kv.SetString("activity_name", activityName);
			kv.SetNum("seller_job_id", job_id);
			kv.SetNum("seller_rank_id", rank_id);
			kv.SetNum("price", price);
			kv.Rewind();
		}
		kv.ExportToFile("addons/sourcemod/configs/roleplay/activities.txt");
		delete kv;
	}		
	CloseHandle(query);
	CloseHandle(database);
	delete g_kvActivities;
	g_kvActivities = new KeyValues("Activities");
	g_kvActivities.ImportFromFile("addons/sourcemod/configs/roleplay/activities.txt");
}

public Action:TextMsg(UserMsg:msg_id, Handle:bf, const players[], playersNum, bool:reliable, bool:init)
{
	decl String:msg[400];
	BfReadString(bf, msg, sizeof(msg), false);

	if(StrContains(msg, "damage", false) != -1 || StrContains(msg, "-------", false) != -1 || StrContains(msg, "vertex", false) != -1)
	{
		return Plugin_Handled;
	}

	return Plugin_Continue;
}

public Action:VGUIMenu(UserMsg:msg_id, Handle:bf, const players[], playersNum, bool:reliable, bool:init)
{
	new String:buffer[5];
	BfReadString(bf, buffer, sizeof(buffer));
	
	if(StrEqual(buffer, "info"))
	{
		return Plugin_Handled;
	}
	
	return Plugin_Continue;
} 

public GetHeure()
{
	decl String:error[256];
	decl String:buffer[400];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	Format(buffer, sizeof(buffer), "SELECT day, month, year FROM date WHERE id = '1'");
	new Handle:query = SQL_Query(database, buffer);
	
	if (query)
	{
		new bool:fetch = SQL_FetchRow(query);
		
		if (fetch)
		{
			g_days = SQL_FetchInt(query, 0);
			g_month = SQL_FetchInt(query, 1);
			g_years = SQL_FetchInt(query, 2);
		}
		else
		{
			InsertHours();
		}
	}
	
	CloseHandle(query);
}

public startheure()
{
	Timers = CreateTimer(1.0, Timer_Horloge, _, TIMER_REPEAT);
}

public Action:Timer_Horloge(Handle:timer)
{
	g_countminute2 += 1;
	
	if (g_countminute2 >= 10)
	{
		g_countminute2 = 0;
		g_countminute1 = g_countminute1 + 1;
		
		if ((g_countminute1 >= 6) && (g_countminute2 >= 0))
		{
			g_countminute1 = 0;
			g_countheure2 = g_countheure2 + 1;
			
			if (g_countheure2 >= 10)
			{
				g_countheure2 = 0;
				g_countheure1 = g_countheure1 + 1;
			}
		}
	}
	
	if ((g_countheure1 >= 2) && (g_countheure2 >= 4))
	{
		g_countheure1 = 0;
		g_countheure2 = 0;
		
		g_days += 1;
		
		GiveSalary();
	}
	
	if (g_countheure1 == 0 && g_countheure2 == 8 && g_countminute1 == 0 && g_countminute2 == 0)
	{
		SetDay();
	}
	
	if (g_countheure1 == 2 && g_countheure2 == 1 && g_countminute1 == 0 && g_countminute2 == 0)
	{
		SetNight();
	}
	
	if (g_days >= 30)
	{
		g_month += 1;
		
		g_days = 1;
	}
	
	if (g_month >= 12)
	{
		g_month = 1;
		g_years += 1;
	}
}

void GetClientZone(KeyValues kv, Float:v[3], String:ZoneName[], int maxlen, String:parentNodeName[])
{
	decl String:kv_buffer[maxlen];
	new Float:pos[2][3];
	do
	{
		// You can read the section/key name by using kv.GetSectionName here.

		KvGetSectionName(kv, kv_buffer, maxlen);
		strcopy(kv_buffer, maxlen, kv_buffer);
		if (strlen(kv_buffer) > 3) {
			strcopy(parentNodeName, maxlen, kv_buffer);
		}
 
		if (kv.GotoFirstSubKey(false))
		{
			// Current key is a section. Browse it recursively.
			GetClientZone(kv, v, ZoneName, maxlen, parentNodeName);
			kv.GoBack();
		}
		else
		{
			// Current key is a regular key, or an empty section.
			if (kv.GetDataType(NULL_STRING) != KvData_None)
			{
				kv.GetVector(NULL_STRING, pos[0]);
				kv.GotoNextKey(false);
				kv.GetVector(NULL_STRING, pos[1]);
				if (IsInZone(v, pos[0], pos[1])) {
					strcopy(ZoneName, maxlen, parentNodeName);
					return;
				}
			}
		}
	} while (kv.GotoNextKey(false));
}

public GiveSalary()
{
	for (new i = 1; i <= MaxClients; i++)
	{
		if (IsValidAndAlive(i) && GetClientTeam(i) > 1)
		{
			if (!IsClientInJail(i))
			{
				if (!AFK[i])
				{
					new checkcapital = capital[jobid[i]];
					
					CPrintToChat(i, "%s : Vous avez reçu votre paie de %i€.", g_bPrefix, salaire[i]);
					
					if (jobid[i] > 1)
					{
						if (checkcapital >= salaire[i])
						{
							capital[jobid[i]] = checkcapital - salaire[i];
							
							if (HasRib(i))
							{
								if (HasCompteCourant(i))
								{
									bank[i] += salaire[i];
									
									if (HasFicheDePaie(i))
									{
										bank[i] += salaire[i];
									}
								}
								else
								{
									money[i] += salaire[i];
									CPrintToChat(i, "%s : Pour recevoir votre salaire en Banque, veuillez ouvrir un compte courant.", g_bPrefix);
									
									if (HasFicheDePaie(i))
									{
										money[i] += salaire[i];
									}
								}
							}
							else
							{
								money[i] += salaire[i];
								CPrintToChat(i, "%s : Pour recevoir votre salaire en Banque, veuillez acheter un RIB.", g_bPrefix);
								
								if (HasFicheDePaie(i))
								{
									money[i] += salaire[i];
								}
							}
						}
						else
						{
							CPrintToChat(i, "%s : Votre entreprise n'a pas les moyens de vous payer.", g_bPrefix);
							//FermetureEntreprise(jobid[i]);
						}
					}
					else
					{
						if (HasRib(i))
						{
							if (HasCompteCourant(i))
							{
								bank[i] += salaire[i];
								
								if (HasFicheDePaie(i))
								{
									bank[i] += salaire[i];
								}
							}
							else
							{
								money[i] += salaire[i];
								CPrintToChat(i, "%s : Pour recevoir votre salaire en Banque, veuillez ouvrir un compte courant.", g_bPrefix);
								
								if (HasFicheDePaie(i))
								{
									money[i] += salaire[i];
								}
							}
						}
						else
						{
							money[i] += salaire[i];
							CPrintToChat(i, "%s : Pour recevoir votre salaire en Banque, veuillez acheter un RIB.", g_bPrefix);
							
							if (HasFicheDePaie(i))
							{
								money[i] += salaire[i];
							}
						}
					}
					new dirtyMoneyDailyAmount = 0;
					if (GetClientDirtyMoney(i) > 0) {
						dirtyMoneyDailyAmount = GetClientDirtyMoney(i)/12;
						ClientDirtyMoneyTransaction(i, -dirtyMoneyDailyAmount);
						money[i] += dirtyMoneyDailyAmount;
						CPrintToChat(i, "%s : Vous récupérez une partie de votre {red}argent sale{default} en même temps que votre {olive}paie{default} pour que cela passe {red}inaperçu{default}.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(i, "%s : Vous n'avez pas reçu votre paye car vous êtes AFK.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(i, "%s : Vous n'avez pas reçu votre paye car vous êtes en prison.", g_bPrefix);
			}
		}
	}
}

public IsInRange (client, entity) {
	new Float:clientent[3], Float:entorigin[3];
	GetEntPropVector(client, Prop_Send, "m_vecOrigin", entorigin);
	GetEntPropVector(entity, Prop_Send, "m_vecOrigin", clientent);
	return GetVectorDistance(clientent, entorigin) < 90;
}

public IsValidAndAlive(client)
{
	if (IsValid(client) && IsPlayerAlive(client))
		return true;
	else
		return false;
}

public IsValid(client)
{
	if (client > 0 && client <= MaxClients && IsClientInGame(client))
		return true;
	else
		return false;
}

public GetClientReputation (client) {
	return reputation[client];
}

public SetClientReputation (client, newReputation) {
	if (newReputation < 0) {
		newReputation = 0;
	}
	reputation[client] = newReputation;
}

public GetClientSalary (client) {
	return salaire[client];
}

public SetClientSalary (client, salary) {
	salaire[client] = salary;
}

public ClientDirtyMoneyTransaction (client, amount) {
	new finalDirtyMoney = GetClientDirtyMoney(client) + amount;
	if (finalDirtyMoney >= 0) {
		SetClientDirtyMoney(client, GetClientDirtyMoney(client) + amount);
	} else {
		SetClientDirtyMoney(client, 0);
	}
	
}

public GetClientDirtyMoney (client) {
	return dirtyMoney[client];
}

public SetClientDirtyMoney (client, newDirtyMoney) {
	dirtyMoney[client] = newDirtyMoney;
}

public SetClientJobID (client, jobId) {
	jobid[client] = jobId;
}

public GetClientJobID (client) {
	return jobid[client];
}

public GetClientRankID (client) {
	return rankid[client];
}

public SetClientRankID (client, rankId) {
	rankid[client] = rankId;
}

public ClientHasJob (jobId, client) {
	return GetClientJobID(client) == jobId;
}

public ClientHasRank (rankId, client) {
	return GetClientRankID(client) == rankId;
}

public IsUnemployed(client)
{
	return ClientHasJob(1, client);
}

public IsPolice(client)
{
	return ClientHasJob(2, client);
}

public IsChefPolice(client)
{
	return ClientHasJob(2, client) && ClientHasRank(1, client);
}

public IsGti(client)
{
	return ClientHasJob(2, client) && ClientHasRank(2, client);
}

public IsCia(client)
{
	return ClientHasJob(2, client) && ClientHasRank(3, client);
}

public IsFbi(client)
{
	return ClientHasJob(2, client) && ClientHasRank(4, client);
}

public IsPolicier(client)
{
	return ClientHasJob(2, client) && ClientHasRank(5, client);
}

public IsGardien(client)
{
	return ClientHasJob(2, client) && ClientHasRank(6, client);
}

public IsChef(client)
{
	return ClientHasRank(1, client) && !ClientHasJob(1, client);
}

public IsCoChef(client)
{
	return ClientHasRank(2, client);
}

public IsDealer(client)
{
	return ClientHasJob(3, client);
}

public IsBanquier(client)
{
	return ClientHasJob(4, client);
}

public IsBricoleur(client)
{
	return ClientHasJob(5, client);
}

public IsMafia(client)
{
	return ClientHasJob(6, client);
}

public IsMafiaLeader(client)
{
	return ClientHasJob(6, client) && ClientHasRank(1, client);
}

public IsArmurier(client)
{
	return ClientHasJob(7, client);
}

public IsJustice(client)
{
	return ClientHasJob(8, client);
}

public IsPresidentJustice(client)
{
	return ClientHasJob(8, client) && ClientHasRank(1, client);
}

public IsHautJuge(client)
{
	return ClientHasJob(8, client) && ClientHasRank(2, client);
}

public IsJuge(client)
{
	return ClientHasJob(8, client) && ClientHasRank(2, client);
}

public IsAvocat(client)
{
	return ClientHasJob(8, client) && ClientHasRank(3, client);
}

public IsHopital(client)
{
	return ClientHasJob(9, client);
}

public IsChirurgien(client)
{
	return ClientHasJob(9, client) && ClientHasRank(3, client);
}

public IsInformaticien(client)
{
	return ClientHasJob(10, client);
}

public IsCyberCriminal(client) {
	return ClientHasJob(10, client) && (GetClientReputation(client) < 50);
}

public IsWildlings(client)
{
	return ClientHasJob(11, client);
}

public IsTriades(client)
{
	if (jobid[client] == 3)
		return true;
	else
		return false;
}

public IsCoach(client)
{
	if (jobid[client] == 6)
		return true;
	else
		return false;
}

public IsArtificier(client)
{
	if (jobid[client] == 7)
		return true;
	else
		return false;
}

public IsMoniteur(client)
{
	if (jobid[client] == 9)
		return true;
	else
		return false;
}

public IsLoto(client)
{
	if (jobid[client] == 10)
		return true;
	else
		return false;
}

public IsDetective(client)
{
	if (jobid[client] == 12)
		return true;
	else
		return false;
}

public IsTriadesLeader(client)
{
	if (jobid[client] == 3 && rankid[client] == 1)
		return true;
	else
		return false;
}

public IsDetectiveLeader(client)
{
	if (jobid[client] == 12 && rankid[client] == 1)
		return true;
	else
		return false;
}

public IsTueur(client)
{
	if (jobid[client] == 13)
		return true;
	else
		return false;
}

public IsMarshall(client)
{
	if (jobid[client] == 14 && rankid[client] == 5)
		return true;
	else
		return false;
}

public IsGardeOnu(client)
{
	if (jobid[client] == 14 && rankid[client] == 6)
		return true;
	else
		return false;
}

public IsTechnicien(client)
{
	if (jobid[client] == 15)
		return true;
	else
		return false;
}

public IsMacdonald(client)
{
	if (jobid[client] == 16)
		return true;
	else
		return false;
}

public IsAppartement(client)
{
	if (jobid[client] == 17)
		return true;
	else
		return false;
}

public Action:Command_Rename(client, args)
{
 	if (IsValidAndAlive(client))
 	{
		new String:arg1[64];
		new String:arg2[64];
		GetCmdArg(1, arg1, sizeof(arg1));
		GetCmdArg(2, arg2, sizeof(arg2));
		
		if (args <= 0)
		{
			CPrintToChat(client, "%s : veuillez indiquer votre {olive}prénom {default}et votre {olive}nom{default}", g_bPrefixDev);
			return Plugin_Handled;
		}
		
		decl String:newRpName[129];
		Format(newRpName, sizeof(newRpName)+1, "%s %s", arg1, arg2);
		
		SetRpName(client, newRpName);
		rpName[client] = newRpName;
	}
	
	return Plugin_Handled;
}

InsertPlayer(client)
{
	decl String:SteamId[64];
	decl String:buffer[400];
	
	GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
	
	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	Format(buffer, sizeof(buffer),"INSERT INTO account(player_id, vip) VALUES ((SELECT id FROM players WHERE steam_id = '%s'), 0)", SteamId);
	new Handle:query = SQL_Query(database, buffer);

	TypeAccount[client] = 0;
	VipUsed[client] = 0;
	
	CloseHandle(query);
	CloseHandle(database);
}

InsertInDatabase(client, const String:SteamId[], const String:Pseudo[])
{
	decl String:buffer[400];
	decl String:PseudoESC[129];
	
	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	SQL_FastQuery(database, "SET NAMES \"UTF8\"");
	
	SQL_EscapeString(database, Pseudo, PseudoESC, sizeof(PseudoESC));
	
	new totale = MONEY_DEPART + BANK_DEPART;
	
	Format(buffer, sizeof(buffer),"INSERT INTO players(steam_id, username, money) VALUES ('%s', '%s', '%i')", SteamId, PseudoESC, MONEY_DEPART);
	//new Handle:query = 

	if (!SQL_FastQuery(database, buffer)) {
		SQL_GetError(database, error, sizeof(error));
		PrintToServer("Failed to query from insert player (error: %s)", error);
	}
	
	Format(buffer, sizeof(buffer), "SELECT id FROM players WHERE steam_id = '%s';", SteamId);
	new Handle:query = SQL_Query(database, buffer);
	query = SQL_Query(database, buffer);
	
	if (query)
	{
		SQL_Rewind(query);
		
		new bool:fetch = SQL_FetchRow(query);
		
		if (fetch)
		{
			playerIds[client] = SQL_FetchInt(query, 0);
			InitPlayerInventory(client);
		}
	}

	money[client] = MONEY_DEPART;
	bank[client] = BANK_DEPART;
	dirtyMoney[client] = 0;
	totalmoney[client] = totale;
	reputation[client] = REPUTATION_DEPART;
	rpName[client] = PseudoESC;
	rankid[client] = 1;
	jobid[client] = 1;
	groupe[client] = 0;
	jailtime[client] = 0;
	IsInJail[client] = 0;
	rib[client] = 0;
	cb[client] = 0;
	EmbaucheExpire[client] = 0;
	
	//CloseHandle(query);
	CloseHandle(database);
	
	CPrintToChatAll("%s : Bienvenue à {floralwhite}%N{unique} (SteamId : {floralwhite}%s{unique}).", g_bPrefix, client, SteamId);
	CPrintToChat(client, "%s : Bienvenue sur le serveur RolePlay.", g_bPrefix);
	CPrintToChat(client, "%s : Vous trouverez divers renseignements à travers la ville.", g_bPrefix);
}

InsertHours()
{
	decl String:buffer[400];
	
	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	Format(buffer, sizeof(buffer),"INSERT INTO date(day, month, year) VALUES ('1', '1', '2000')");
	new Handle:query = SQL_Query(database, buffer);
	
	g_days = 1;
	g_month = 1;
	g_years = 2000;
	
	CloseHandle(query);
	CloseHandle(database);
	
	CPrintToChatAll("%s : La date à été initialisée pour la première fois.", g_bPrefixDev);
}

public InitSalary(client)
{
	decl String:query[500];
	
	decl String:error[500];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	Format(query, sizeof(query), "SELECT salary FROM ranks WHERE rank_id = '%i' AND job_id = '%i'", GetClientRankID(client), GetClientJobID(client));
	new Handle:GetSalary = SQL_Query(database, query);
	
	if (GetSalary)
	{
		while (SQL_FetchRow(GetSalary))
		{
			SetClientSalary(client, SQL_FetchInt(GetSalary, 0));
		}
	}
	
	CloseHandle(GetSalary);
	CloseHandle(database);
}

public OnClientDisconnect(client)
{
	if (IsValid(client))
	{
		new String:SteamId[32];
		
		DBSave(client);
		
		GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
		
		IsDisconnect[client] = true;
		Loaded[client] = false;
		gObj[client] = -1;
		g_Count[client] = 0.0;
		playerIds[client] = 0;
		PrintToServer("Player Disconnect");
		
		RemoveImprimante(client, SteamId);
		RemovePlante(client, SteamId);
		DeleteClientDoors(SteamId);
		
		SDKUnhook(client, SDKHook_OnTakeDamage, OnTakeDamage);
		SDKUnhook(client, SDKHook_WeaponCanUse, OnWeaponCanUse);
		
		if (IsTazed[client])
		{
			IsTazed[client] = false;
		}
		
		if(TimerHud[client] != INVALID_HANDLE)
		{
			KillTimer(TimerHud[client]);
			TimerHud[client] = INVALID_HANDLE;
		}
		
		if(TimerImprimante[client] != INVALID_HANDLE)
		{
			KillTimer(TimerImprimante[client]);
			TimerImprimante[client] = INVALID_HANDLE;
		}
		
		if(TimerPlante[client] != INVALID_HANDLE)
		{
			KillTimer(TimerPlante[client]);
			TimerPlante[client] = INVALID_HANDLE;
		}
		
		if(TimerDead[client])
		{
			KillTimer(g_deadtimer[client]);
			TimerDead[client] = false;
		}
	}
}

public DBSave(client)
{
	if (InQuery)
	{
		CreateTimer(1.0, DBSave_ReDo, client);
	}
	
	if (Loaded[client])
	{
		new GameTime = GetTime();
		
		decl String:error[256];
		decl String:PseudoESC[256];
		new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
		SQL_LockDatabase(database);
		
		new String:SteamId[32], String:query[999];
		GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
		
		/*Format(query, sizeof(query), "UPDATE account SET VIP = '%i' WHERE player_id = (SELECT id FROM players WHERE steam_id = '%s')", VipUsed[client], SteamId);				
		SQL_FastQuery(database, query);*/
		SQL_EscapeString(database, rpName[client], PseudoESC, sizeof(PseudoESC));

		if (IsInFakeJob[client]) {
			Format(query, sizeof(query), "UPDATE players SET money = '%i', dirty_money = '%i', bank = '%i', job_id = '%i', rank_id = '%i', reputation = '%i', username = '%s', last_log_time = '%i' WHERE steam_id = '%s'", money[client], dirtyMoney[client], bank[client], beforeCouvertureJobId[client], beforeCouvertureRankId[client], reputation[client], PseudoESC, GameTime, SteamId);				
		} else {
			Format(query, sizeof(query), "UPDATE players SET money = '%i', dirty_money = '%i', bank = '%i', job_id = '%i', rank_id = '%i', reputation = '%i', username = '%s', last_log_time = '%i' WHERE steam_id = '%s'", money[client], dirtyMoney[client], bank[client], jobid[client], rankid[client], reputation[client], PseudoESC, GameTime, SteamId);				
		}
		if (!SQL_FastQuery(database, query)) {
			SQL_GetError(database, error, sizeof(error));
			PrintToServer("Failed to query from DBSave (error: %s)", error);
		}
		
		SQL_UnlockDatabase(database);
		CloseHandle(database);
	}
}

public Action:DBSave_ReDo(Handle:Timer, any:Client)
{
	DBSave(Client);
	return Plugin_Handled;
}

public SaveTime()
{
	new String:query[256];
	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	Format(query, sizeof(query), "UPDATE rp_date SET DAY = %i, MONTH = %i, YEAR = %i WHERE ID = '1'", g_days, g_month, g_years);				
	SQL_FastQuery(database, query);
	
	CloseHandle(database);
}

public Action:hide(client, args)
{
	Client_SetHud(client, ( 1<<3 ));
}

stock Client_SetHud(client, flags)
{
	SetEntProp(client, Prop_Send, "m_iHideHUD", flags);
} 

public Action:Timer_Dead(Handle:timer, any:client)
{
	if (IsValid(client))
	{
		if (!IsPlayerAlive(client))
		{
			g_CountDead[client] -= 1;
			TimerDead[client] = true;
			
			if (g_CountDead[client] == 0)
			{
				if (IsTazed[client] == true)
				{
					IsTazed[client] = false;
				}
				
				ClientCommand(client, "r_screenoverlay 0");
	
				CPrintToChat(client, "%s : Vous venez de respawn.", g_bPrefix);
				
				decl String:ClanTagRankName[20];
				GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
				CS_SetClientClanTag(client, ClanTagRankName);
				
				ChooseSkin(client);
				
				if (IsPolice(client))
				{
					CS_SwitchTeam(client, 3);
					CS_RespawnPlayer(client);
					disarm(client);
					GivePlayerItem(client, "weapon_knife");
					SetEntProp(client, Prop_Data, "m_ArmorValue", 100);
				}
				else if (IsJustice(client))
				{
					if (IsJuge(client) || IsPresidentJustice(client)) {
						CS_SwitchTeam(client, 3);
					} else {
						CS_SwitchTeam(client, 2);
					}
					CS_RespawnPlayer(client);
					disarm(client);
					GivePlayerItem(client, "weapon_knife");
				}
				else if (IsDetectiveLeader(client))
				{
					CS_SwitchTeam(client, 3);
					CS_RespawnPlayer(client);
					disarm(client);
					GivePlayerItem(client, "weapon_knife");
				}
				else
				{
					CS_SwitchTeam(client, 2);
					CS_RespawnPlayer(client);
					disarm(client);
					GivePlayerItem(client, "weapon_knife");
					SetEntityHealth(client, 100);
				}
				
				if (IsCivil[client])
				{
					IsCivil[client] = false;
				}

				if (IsInFakeJob[client])
				{
					IsInFakeJob[client] = false;
				}
				
				ChooseSkin(client);
				
				if (jailtime[client] > 0)
				{
					JailSpawnClient(client);
					
					setClientInJail(client, 1);
					
					SetClientListeningFlags(client, VOICE_MUTED);
				}
				else
				{
					
					SpawnClient(client);
					
					if (IsInChirurgieJambes[client])
					{
						SetChirurgie(client, 1);
					}
					
					if (IsInChirurgieCoeur[client])
					{
						SetChirurgie(client, 2);
					}
					
					if (IsInChirurgieTete[client])
					{
						SetChirurgie(client, 3);
					}
				}
				
				TimerDead[client] = false;
				
				CreateTimer(12.0, Timer_CheckAfk, client);
				RegConsoleCmd("sm_hideradar", hide, "Will hide the clients radar");
				
				KillTimer(g_deadtimer[client]);
			}
		}
	}
}

public Action:Timer_CheckAfk(Handle:timer, any:client)
{
	if (IsValidAndAlive(client))
	{
		IsPossibleToAfk[client] = true;
	}
}

public initSpawns () {
	decl String:buffer[1000];
	decl String:error[256];
	decl String:IdentifierName[20];
	new i = 0;

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(buffer, sizeof(buffer), "SELECT pos_x, pos_y, pos_z FROM spawns WHERE map = '%s' AND spawn_name = 'spawns';", current_map);
	SQL_LockDatabase(database);
	new Handle:query = SQL_Query(database, buffer);
	KeyValues kv = new KeyValues("Spawns");
	if (query)
	{
		while (SQL_FetchRow(query))
		{
			
			new Float:pos[3] = {0.0, 0.0, 0.0};
			pos[0] = SQL_FetchFloat(query, 0);
			pos[1] = SQL_FetchFloat(query, 1);
			pos[2] = SQL_FetchFloat(query, 2);
			IntToString(i, IdentifierName, sizeof(IdentifierName));

			kv.JumpToKey(IdentifierName, true);
			kv.SetVector("spawn_pos", pos);
			kv.Rewind();
			i++;
		}
	} else {
		new Float:pos[3] = {0.0, 0.0, 0.0};
		IntToString(i, IdentifierName, sizeof(IdentifierName));

		kv.JumpToKey(IdentifierName, true);
		kv.SetVector("spawn_pos", pos);
		kv.Rewind();
	}
	kv.ExportToFile("addons/sourcemod/configs/roleplay/spawns.txt");
	delete kv;
	SQL_UnlockDatabase(database);
	CloseHandle(query);
	CloseHandle(database);
}

public initJailSpawns () {
	decl String:buffer[1000];
	decl String:error[256];
	decl String:IdentifierName[20];
	new i = 0;

	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(buffer, sizeof(buffer), "SELECT pos_x, pos_y, pos_z FROM spawns WHERE map = '%s' AND spawn_name = 'jails';", current_map);
	SQL_LockDatabase(database);
	new Handle:query = SQL_Query(database, buffer);
	KeyValues kv = new KeyValues("JailSpawns");
	if (query)
	{
		while (SQL_FetchRow(query))
		{
			
			new Float:pos[3] = {0.0, 0.0, 0.0};
			pos[0] = SQL_FetchFloat(query, 0);
			pos[1] = SQL_FetchFloat(query, 1);
			pos[2] = SQL_FetchFloat(query, 2);
			IntToString(i, IdentifierName, sizeof(IdentifierName));

			kv.JumpToKey(IdentifierName, true);
			kv.SetVector("spawn_pos", pos);
			kv.Rewind();
			i++;
		}
		
	} else {
		new Float:pos[3] = {0.0, 0.0, 0.0};
		IntToString(i, IdentifierName, sizeof(IdentifierName));

		kv.JumpToKey(IdentifierName, true);
		kv.SetVector("spawn_pos", pos);
		kv.Rewind();
	}
	kv.ExportToFile("addons/sourcemod/configs/roleplay/jailSpawns.txt");
	delete kv;
	SQL_UnlockDatabase(database);
	CloseHandle(query);
	CloseHandle(database);
}

public SpawnClient (client) {
	KeyValues kv = new KeyValues("Spawns");
	kv.ImportFromFile("addons/sourcemod/configs/roleplay/spawns.txt");

	new i = 0;
	decl String:IdentifierName[20];
	if (!kv.GotoFirstSubKey())
	{
		return 0;
	}

	while (kv.GotoNextKey()) {
		i++;
	}

	kv.Rewind();
	new value = GetRandomInt(0, i-1);
	IntToString(value, IdentifierName, sizeof(IdentifierName));
	if (kv.JumpToKey(IdentifierName)) {
		new Float:pos[3];
		kv.GetVector("spawn_pos", pos);
		TeleportEntity(client, pos, NULL_VECTOR, NULL_VECTOR);
	}
	kv.Rewind();
	delete kv;

	return 1;
}

public JailSpawnClient (client) {
	KeyValues kv = new KeyValues("JailSpawns");
	kv.ImportFromFile("addons/sourcemod/configs/roleplay/jailSpawns.txt");
	new i = 0;
	decl String:IdentifierName[20];
	if (!kv.GotoFirstSubKey())
	{
		return 0;
	}

	while (kv.GotoNextKey()) {
		i++;
	}

	kv.Rewind();
	new value = GetRandomInt(0, i-1);
	IntToString(value, IdentifierName, sizeof(IdentifierName));
	if (kv.JumpToKey(IdentifierName)) {
		new Float:pos[3];
		kv.GetVector("spawn_pos", pos);
		TeleportEntity(client, pos, NULL_VECTOR, NULL_VECTOR);
	}
	kv.Rewind();
	delete kv;

	return 1;
}

public disarm(player)
{
	new wepIdx;
	for (new f = 0; f < 6; f++)
		if (f < 6 && (wepIdx = GetPlayerWeaponSlot(player, f)) != -1)  
			RemovePlayerItem(player, wepIdx);
}

public Action:HudTimer(Handle:timer, any:client)
{
	if(!IsValid(client))
	{
		CloseHandle(TimerHud[client]);
		return Plugin_Stop;
	}
	else
	{
		new Handle:hBuffer = StartMessageOne("KeyHintText", client);
		
		GetMonth();
		
		decl String:ClanTagRankName[20];
		
		if (hBuffer)
		{
			GetRankName(rankid[client], jobid[client], JobNameUser[client], sizeof(JobNameUser[]));
			GetJobName(jobid[client], RankNameUser[client], sizeof(RankNameUser[]));
			GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
			GetZoneName(client, ZoneUser[client], sizeof(ZoneUser[]));
			
			CS_SetClientClanTag(client, ClanTagRankName);
			Client_SetDeaths(client, 0);
			Client_SetScore(client, 0);
			
			decl String:tmptext[1024];
			decl String:tmptext1[256];
			decl String:tmptext2[256];
			decl String:tmptext3[100];
			decl String:tmptext5[256];
			decl String:tmptext6[256];
			decl String:tmptext7[256];
			decl String:tmptext8[256];
			
			Format(tmptext1, sizeof(tmptext1), "Argent: %i€\nBanque: %i€\nArgent sale: %i€\n\nMétier: %s\nEmployeur: %s\nSalaire: %i€\n\n", money[client], bank[client], dirtyMoney[client], JobNameUser[client], RankNameUser[client], GetClientSalary(client));
			
			if (IsChefPolice(client) || IsChef(client) || IsCoChef(client))
			{
				Format(tmptext2, sizeof(tmptext2), "Capital: %i€\n", capital[jobid[client]]);
			}
			else
			{
				Format(tmptext2, sizeof(tmptext2), "");
			}
			
			TempJailTime[client] = jailtime[client];

			while (TempJailTime[client] >= 60)
			{
				new TEST = TempJailTime[client];
				TempJailTime[client] = TEST - 60;
				
				new TEST2 = TempJailHours[client];
				TempJailHours[client] = TEST2 + 1;
			}

			JailHours[client] = TempJailHours[client];
			TempJailHours[client] = 0;

			JailMinutes[client] = TempJailTime[client];
			TempJailTime[client] = 0;
			
			if (IsClientInJail(client))
			{
				Format(tmptext7, sizeof(tmptext7), "En prison: %i:%i\n", JailHours[client], JailMinutes[client]);
			}
			else
			{
				Format(tmptext7, sizeof(tmptext7), "");
			}
			
			Format(tmptext8, sizeof(tmptext8), "Réputation: %i\n", reputation[client]);
			Format(tmptext3, sizeof(tmptext3), "%i%i:%i%i - %i %s %i\n", g_countheure1, g_countheure2, g_countminute1, g_countminute2, g_days, MonthName, g_years);
			//Format(tmptext5, sizeof(tmptext5), "Groupe: %s\n", GroupNameClient[client]);
			Format(tmptext5, sizeof(tmptext5), "");
			Format(tmptext6, sizeof(tmptext6), "Zone: %s\n", ZoneUser[client]);
			
			Format(tmptext, sizeof(tmptext), "%s%s%s%s%s%s%s", tmptext1, tmptext2, tmptext5, tmptext8, tmptext3, tmptext6, tmptext7);
			
			BfWriteByte(hBuffer, 1);
			BfWriteString(hBuffer, tmptext);
			EndMessage();
		}
		
		if (!IsPlayerAlive(client))
		{
			PrintCenterText(client, "Vous allez réapparaître dans %i seconde%s.", g_CountDead[client], (g_CountDead[client] > 1 ? "s" : ""));
		}
		else
		{
			if (jailtime[client] > 0)
			{
				jailtime[client] -= 1;
			}
			
			if (AFK[client])
			{
				PrintCenterText(client, "Vous êtes absent");
			}
		}
	
		new entity = GetClientAimTarget(client, false);
		if (entity != -1) {
			decl String:Buffer[8][32];
			decl String:itemType[32];
			new String:Name[200];
			Entity_GetName(entity, Name, sizeof(Name));
			if (ExplodeString(Name, "_", Buffer, 3, 32) > 2) {
				new quantity = 1;
				itemType = Buffer[0];
				if (StrEqual(itemType, "item")) {
					PrintHintText(client, "Objet : %s\nQuantité : %i", Buffer[2], quantity);
					StopSound(client, SNDCHAN_STATIC, "UI/hint.wav");
				}
			}
		}

		new aim = GetClientAimTarget(client, true);
		
		if (aim != -1)
		{
			new health = GetClientHealth(aim);
			
			PrintHintText(client, "%N\nRéputation : %i", aim, GetClientReputation(aim));
			StopSound(client, SNDCHAN_STATIC, "UI/hint.wav");
		}
		
		if (jailtime[client] == 1)
		{
			FreePlayer(client);
		
			jailtime[client] = 0;
			setClientInJail(client, 0);
		}
		
		if (HasRegenerationBionique[client])
		{
			new kevlar = GetEntProp(client, Prop_Send, "m_ArmorValue", 4);
			
			if (kevlar < 100)
			{
				SetEntProp(client, Prop_Send, "m_ArmorValue", kevlar + 1, 1);
			}
		}
	}
	
	return Plugin_Continue;
}

public Action:ImprimanteTimer(Handle:timer, any:client)
{
	if(!IsValid(client))
	{
		CloseHandle(TimerImprimante[client]);
		return Plugin_Stop;
	}
	else
	{
		if (HasImprimante[client] > 0)
		{
			if (HasRib(client))
			{
				bank[client] += (MONEY_BY_IMPRIMANTE * HasImprimante[client]);
			}
			else
			{
				money[client] += (MONEY_BY_IMPRIMANTE * HasImprimante[client]);
			}
		}
	}
	
	return Plugin_Continue;
}

public Action:PlanteTimer(Handle:timer, any:client)
{
	if(!IsValid(client))
	{
		CloseHandle(TimerPlante[client]);
		return Plugin_Stop;
	}
	else
	{
		if (HasPlante[client] > 0)
		{
			GiveAwayDrogue(client, HasPlante[client]);
		}
	}
	
	return Plugin_Continue;
}

public GetMonth()
{
	if (g_month == 1)
	{
		Format(MonthName, sizeof(MonthName), "Janvier");
	}
	else if (g_month == 2)
	{
		Format(MonthName, sizeof(MonthName), "Février");
	}
	else if (g_month == 3)
	{
		Format(MonthName, sizeof(MonthName), "Mars");
	}
	else if (g_month == 4)
	{
		Format(MonthName, sizeof(MonthName), "Avril");
	}
	else if (g_month == 5)
	{
		Format(MonthName, sizeof(MonthName), "Mai");
	}
	else if (g_month == 6)
	{
		Format(MonthName, sizeof(MonthName), "Juin");
	}
	else if (g_month == 7)
	{
		Format(MonthName, sizeof(MonthName), "Juillet");
	}
	else if (g_month == 8)
	{
		Format(MonthName, sizeof(MonthName), "Août");
	}
	else if (g_month == 9)
	{
		Format(MonthName, sizeof(MonthName), "Septembre");
	}
	else if (g_month == 10)
	{
		Format(MonthName, sizeof(MonthName), "Octobre");
	}
	else if (g_month == 11)
	{
		Format(MonthName, sizeof(MonthName), "Novembre");
	}
	else if (g_month == 12)
	{
		Format(MonthName, sizeof(MonthName), "Décembre");
	}
}

public SetNight()
{
	new maxent = GetMaxEntities(), String:szClass[65], String:Name[200];

	for (new i = MaxClients; i <= maxent; i++)
	{
		if(IsValidEdict(i) && IsValidEntity(i))
		{
			GetEdictClassname(i, szClass, sizeof(szClass));
			
			if (StrEqual("point_spotlight", szClass))
			{
				Entity_GetName(i, Name, sizeof(Name));
				
				if (StrEqual(Name, "night_spotlight"))
				{
					AcceptEntityInput(i, "LightOn");
				}
			}
			else if (StrEqual("light_spot", szClass))
			{
				Entity_GetName(i, Name, sizeof(Name));
				
				if (StrEqual(Name, "night_light"))
				{
					AcceptEntityInput(i, "TurnOn");
				}
			}
			else if(StrEqual("env_sun", szClass))
			{
				AcceptEntityInput(i, "TurnOff");
			}
			else if(StrEqual("light_environment", szClass))
			{
				AcceptEntityInput(i, "TurnOff");
			}
			else if(StrEqual("func_brush", szClass))
			{
				Entity_GetName(i, Name, sizeof(Name));
		
				if (StrEqual(Name, "night_skybox"))
				{
					DispatchKeyValue(i, "renderamt", "255");
				}
			}
			else if(StrEqual("func_dustmotes", szClass))
			{
				Entity_GetName(i, Name, sizeof(Name));
		
				if (StrEqual(Name, "particules_lights_nuit"))
				{
					AcceptEntityInput(i, "TurnOn");
				}
			}
		}
	}
}

public SetDay()
{
	new maxent = GetMaxEntities(), String:szClass[65], String:Name[200];

	for (new i = MaxClients; i <= maxent; i++)
	{
		if(IsValidEdict(i) && IsValidEntity(i))
		{
			GetEdictClassname(i, szClass, sizeof(szClass));
			
			if (StrEqual("point_spotlight", szClass))
			{
				Entity_GetName(i, Name, sizeof(Name));
				
				if (StrEqual(Name, "night_spotlight"))
				{
					AcceptEntityInput(i, "LightOff");
				}
			}
			else if (StrEqual("light_spot", szClass))
			{
				Entity_GetName(i, Name, sizeof(Name));
				
				if (StrEqual(Name, "night_light"))
				{
					AcceptEntityInput(i, "TurnOff");
				}
			}
			else if(StrEqual("env_sun", szClass))
			{
				AcceptEntityInput(i, "TurnOn");
			}
			else if(StrEqual("light_environment", szClass))
			{
				AcceptEntityInput(i, "TurnOn");
			}
			else if(StrEqual("func_brush", szClass))
			{
				Entity_GetName(i, Name, sizeof(Name));
		
				if (StrEqual(Name, "night_skybox"))
				{
					DispatchKeyValue(i, "renderamt", "0");
				}
			}
			else if(StrEqual("func_dustmotes", szClass))
			{
				Entity_GetName(i, Name, sizeof(Name));
		
				if (StrEqual(Name, "particules_lights_nuit"))
				{
					AcceptEntityInput(i, "TurnOff");
				}
			}
		}
	}
}

public Action:Command_Give(client, args)
{			
	new String:arg1[32];
	GetCmdArg(1, arg1, sizeof(arg1));
	
	if (args <= 0)
	{
		CPrintToChat(client, "%s : Usage: sm_give 'montant'", g_bPrefix);
		return Plugin_Handled;
	}
	
	if (IsValidAndAlive(client))
	{
		if (jailtime[client] <= 0)
		{
			new debit_amt = StringToInt(arg1, 10);
			
			if (debit_amt < 0)
			{
				CPrintToChat(client, "%s : Vous ne pouvez pas donné une somme négative.", g_bPrefix);
				return Plugin_Handled;
			}
			
			if (debit_amt > money[client])
			{
				CPrintToChat(client, "%s : Vous n'avez pas assez d'argent.", g_bPrefix);
				return Plugin_Handled;
			}

			decl Ent;
			decl String:ClassName[255];
			
			Ent = GetClientAimTarget(client, true);
			
			if(Ent != -1)
			{
				GetEdictClassname(Ent, ClassName, 255);
			
				money[Ent] += debit_amt;
			
				money[client] -= debit_amt;
			
				CPrintToChat(client, "%s : Tu as donné %i€ à %N.", g_bPrefix, debit_amt, Ent);
				CPrintToChat(Ent, "%s : Tu as reçu %i€ par %N.", g_bPrefix, debit_amt, client);
			}
			else 
			{
				CPrintToChat(client, "%s : Tu dois regarder un joueur.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous ne pouvez pas donner d'argent en prison.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Money(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			seekplayers(client);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

seekplayers(client)
{
	if(client > 0 && client <= MaxClients && !IsFakeClient(client))
	{
		decl String:sMenuText[64];
		sMenuText[0] = '\0';
		
		new Handle:menu = CreateMenu(menu_money);
		SetMenuTitle(menu, "Donner de l'argent à :");
		SetMenuExitButton(menu, true);
		
		ajoutplayers(menu);
		
		DisplayMenu(menu, client, MENU_TIME_FOREVER);
	}
}

public ajoutplayers(Handle:menu)
{
	decl String:user_id[12];
	decl String:name[MAX_NAME_LENGTH];
	decl String:display[MAX_NAME_LENGTH+15];
	
	for (new i = 1; i <= MaxClients; i++)
	{
		if(IsValidAndAlive(i))
		{
			IntToString(GetClientUserId(i), user_id, sizeof(user_id));
			
			GetClientName(i, name, sizeof(name));
			
			Format(display, sizeof(display), "%s", name);
			
			AddMenuItem(menu, user_id, display);
		}
	}
}

public menu_money(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[64];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		
		new UserID = StringToInt(info);
		givemoney[client] = GetClientOfUserId(UserID);
		
		new Handle:menuc = CreateMenu(menu_givemoney);
		SetMenuTitle(menuc, "Choisis le montant : %N", givemoney[client]);
		AddMenuItem(menuc, "1", "1000");
		AddMenuItem(menuc, "2", "10000");
		AddMenuItem(menuc, "3", "100000");
		AddMenuItem(menuc, "4", "1000000");
		DisplayMenu(menuc, client, MENU_TIME_FOREVER);
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public menu_givemoney(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[32];
		GetMenuItem(menu, param2, info, sizeof(info));
		
		if (StrEqual(info, "1"))
		{
			bank[givemoney[client]] = bank[givemoney[client]] + 1000;
			CPrintToChat(givemoney[client], "%s : Vous avez reçu 1000€ en banque par %N", g_bPrefix, client);
			CPrintToChat(client, "%s : Vous avez donné 1000€ à %N", g_bPrefix, givemoney[client]);
			givemoney[client] = 0;
		}
		else if (StrEqual(info, "2"))
		{
			bank[givemoney[client]] = bank[givemoney[client]] + 10000;
			CPrintToChat(givemoney[client], "%s : Vous avez reçu 10000€ en banque par %N", g_bPrefix, client);
			CPrintToChat(client, "%s : Vous avez donné 10000€ à %N", g_bPrefix, givemoney[client]);
			givemoney[client] = 0;
		}
		else if (StrEqual(info, "3"))
		{
			bank[givemoney[client]] = bank[givemoney[client]] + 100000;
			CPrintToChat(givemoney[client], "%s : Vous avez reçu 100000€ en banque par %N", g_bPrefix, client);
			CPrintToChat(client, "%s : Vous avez donné 100000€ à %N", g_bPrefix, givemoney[client]);
			givemoney[client] = 0;
		}
		else if (StrEqual(info, "4"))
		{
			bank[givemoney[client]] = bank[givemoney[client]] + 1000000;
			CPrintToChat(givemoney[client], "%s : Vous avez reçu 1000000€ en banque par %N", g_bPrefix, client);
			CPrintToChat(client, "%s : Vous avez donné 1000000€ à %N", g_bPrefix, givemoney[client]);
			givemoney[client] = 0;
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public Action:Command_AdminMenu(client, args)
{
	if (IsValid(client))
	{
		if (IsRootAdmin(client))
		{
			BuildAdminMenu(client);
		}
	}
	
	return Plugin_Handled;
}

BuildAdminMenu(client)
{
	new Handle:adminMenu = CreateMenu(Menu_Admin);
	
	SetMenuTitle(adminMenu, "Menu Admin Roleplay :");
	
	AddMenuItem(adminMenu, "", "-----SERVER-----", ITEMDRAW_DISABLED);
	AddMenuItem(adminMenu, "reboot", "Redémarrer le serveur");
	AddMenuItem(adminMenu, "", "-----CLIENT-----", ITEMDRAW_DISABLED);
	AddMenuItem(adminMenu, "job", "Jobmenu");
	AddMenuItem(adminMenu, "chef", "Virer un Chef");
	AddMenuItem(adminMenu, "god", "Mode Dieu");
	AddMenuItem(adminMenu, "noclip", "Mode Noclip");
	AddMenuItem(adminMenu, "invis", "Mode Invisible");
	AddMenuItem(adminMenu, "teleport", "Téléportation");
	AddMenuItem(adminMenu, "speed", "SpeedHack");
	AddMenuItem(adminMenu, "ammo", "Munitions illimitées");
	AddMenuItem(adminMenu, "", "-----ENTITY-----", ITEMDRAW_DISABLED);
	AddMenuItem(adminMenu, "description", "Description Entity");
	AddMenuItem(adminMenu, "", "-----ZONES-----", ITEMDRAW_DISABLED);
	AddMenuItem(adminMenu, "area", "Mod Area");
	
	DisplayMenu(adminMenu, client, MENU_TIME_FOREVER);
}

public Menu_Admin(Handle:adminMenu, MenuAction:action, param1, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		GetMenuItem(adminMenu, param2, info, sizeof(info));
		
		if (StrEqual(info, "reboot"))
		{
			FakeClientCommandEx(param1, "sm_reboot");
		}
		else if (StrEqual(info, "job"))
		{
			FakeClientCommandEx(param1, "sm_jobmenu");
		}
		else if (StrEqual(info, "chef"))
		{
			VirerChef(param1);
		}
		else if (StrEqual(info, "god"))
		{
			FakeClientCommandEx(param1, "sm_godmod");
		}
		else if (StrEqual(info, "description"))
		{
			FakeClientCommandEx(param1, "sm_entity");
		}
		else if (StrEqual(info, "area"))
		{
			FakeClientCommandEx(param1, "sm_area");
		}
		else if (StrEqual(info, "teleport"))
		{
			FakeClientCommandEx(param1, "sm_teleport");
		}
		else if (StrEqual(info, "noclip"))
		{
			FakeClientCommandEx(param1, "sm_admnoclip");
		}
		else if (StrEqual(info, "invis"))
		{
			if (IsInvisible[param1])
			{
				SDKUnhook(param1, SDKHook_SetTransmit, Hook_SetTransmit);
				CPrintToChat(param1, "%s : Vous êtes désormais visible.", g_bPrefix);
				
				IsInvisible[param1] = false;
			}
			else
			{
				SDKHook(param1, SDKHook_SetTransmit, Hook_SetTransmit);
				CPrintToChat(param1, "%s : Vous êtes désormais invisible.", g_bPrefix);
				
				IsInvisible[param1] = true;
			}	
		}
		else if (StrEqual(info, "ammo"))
		{
			FakeClientCommandEx(param1, "sm_admammo");
		}
		else if (StrEqual(info, "speed"))
		{
			FakeClientCommandEx(param1, "sm_admspeed");
		}
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(adminMenu);
		}
	}
}

public Action:Command_ShutdownServer(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			if (!reboot)
			{
				CPrintToChatAll("%s :  Redémarrage du serveur dans 20 secondes.", g_bPrefix);
				
				RebootTimer = 20;
				
				for (new i = 1; i <= MaxClients; i++)
				{
					if (IsValid(i)) 
					{
						DBSave(i);
					}
				}
				
				CreateTimer(1.0, ShutdownServer, _, TIMER_REPEAT);
				
				reboot = true;
			}
			else
			{
				CPrintToChat(client, "%s : le serveur est déjà en reboot.", g_bPrefix);
			}
		}
	}
	
	return Plugin_Handled;
}

public Action:ShutdownServer(Handle:timer)
{
	RebootTimer -= 1;

	CPrintToChatAll("%s : Redémarrage du serveur dans %i secondes.", g_bPrefix, RebootTimer);
	
	if (RebootTimer == 0)
	{
		RebootTimer = 0;
	
		CPrintToChatAll("%s : Redémarrage en cours...", g_bPrefix);
	
		ServerCommand("sm_plugins unload cssrp");
		ServerCommand("exit");
	}
}

public Action:Command_Godmod(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (GetUserFlagBits(client) & ADMFLAG_ROOT)
		{
			if (!godmod[client])
			{
				SetEntProp(client, Prop_Data, "m_takedamage", 0, 1);
				CPrintToChat(client, "%s : Vous avez activer le godmod.", g_bPrefix);
				
				godmod[client] = true;
			}
			else
			{
				SetEntProp(client, Prop_Data, "m_takedamage", 2, 1);
				CPrintToChat(client, "%s : Vous avez désactiver le godmod.", g_bPrefix);
				
				godmod[client] = false;
			}
		}
	}
}

void GetRankNameKV(KeyValues kv, rid, jid, String:TagName[], maxlen)
{
	decl String:jobId[4];
	decl String:rankId[4];
	decl String:rankName[150];
	IntToString(jid, jobId, sizeof(jobId));
	IntToString(rid, rankId, sizeof(rankId));
	if (kv.JumpToKey(jobId)) {
		kv.GetString(rankId, rankName, sizeof(rankName));
		//PrintToServer("%s", rankName);
		if (!StrEqual("", rankName, false)) {
			strcopy(TagName, maxlen, rankName);
		} else {
			strcopy(TagName, maxlen, "not found");
		}
	}
	kv.Rewind();
}

void GetJobNameKV(KeyValues kv, jid, String:JobName[], maxlen)
{
	decl String:jobId[4];
	decl String:jobName[150];
	IntToString(jid, jobId, sizeof(jobId));
	if (g_kvJobs.JumpToKey(jobId)) {
		g_kvJobs.GetString("jobName", jobName, sizeof(jobName));
		if (!StrEqual("", jobName, false)) {
			strcopy(JobName, maxlen, jobName);
		} else {
			strcopy(JobName, maxlen, "not found");
		}
	}
	kv.Rewind();
}

GetClanTagName(client, jid, rid, String:TagName[], maxlen)
{
	if (AFK[client]) {
		Format(TagName, maxlen, "Absent -");
	} else if (IsCyberCriminal(client)) {
		Format(TagName, maxlen, "Cybercriminel -");
	} else {
		GetRankNameKV(g_kvJobs, jid, rid, TagName, maxlen);
		StrCat(TagName, maxlen, " -");
	}
}

GetRankName(jid, rid, String:RankName[], maxlen)
{
	GetRankNameKV(g_kvJobs, jid, rid, RankName, maxlen);
}

GetJobName(jid, String:JobName[], maxlen)
{
	GetJobNameKV(g_kvJobs, jid, JobName, maxlen);
}

ModifySpeed(client, Float:speed)
{
	if (IsValidAndAlive(client))
	{
		SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", speed);
	}
}

public Action:Command_Jobmenu(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			LoopPlayers(client);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

LoopPlayers(client)
{
	if(client > 0 && client <= MaxClients && !IsFakeClient(client))
	{
		decl String:sMenuText[64];
		sMenuText[0] = '\0';
		
		new Handle:menu = CreateMenu(MenuHandler_LoopPlayers);
		SetMenuTitle(menu, "Choisis le joueur :");
		SetMenuExitButton(menu, true);
		
		Addplayers(menu);
		
		DisplayMenu(menu, client, MENU_TIME_FOREVER);
	}
}

public Addplayers(Handle:menu)
{
	decl String:user_id[12];
	decl String:name[MAX_NAME_LENGTH];
	decl String:display[MAX_NAME_LENGTH+15];
	
	for (new i = 1; i <= MaxClients; i++)
	{
		if(IsValid(i))
		{
			IntToString(GetClientUserId(i), user_id, sizeof(user_id));
			
			GetClientName(i, name, sizeof(name));
			
			Format(display, sizeof(display), "%s", name);
			
			AddMenuItem(menu, user_id, display);
		}
	}
}

public MenuHandler_LoopPlayers(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[64];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		
		new UserID = StringToInt(info);
		jobs[client] = GetClientOfUserId(UserID);
				
		new String:lastembauche[64];
		FormatTime(lastembauche, sizeof(lastembauche), "%x à %X", EmbaucheExpire[jobs[client]]);
		
		new Handle:menuc = CreateMenu(jobmenu);
		
		SetMenuTitle(menuc, "Choisis le secteur pour : %N", jobs[client]);
		KeyValues kv = new KeyValues("Jobs");
		kv.ImportFromFile("addons/sourcemod/configs/roleplay/jobs.txt");
		if (!kv.GotoFirstSubKey())
		{
			return 0;
		}

		do
		{
			decl String:JobName[128];
			decl String:JobID[128];
			KvGetSectionName(kv, JobID, sizeof(JobID));
			kv.GetString("jobName", JobName, sizeof(JobName));
			AddMenuItem(menuc, JobID, JobName);
		} while (kv.GotoNextKey());
		delete kv;
		
		DisplayMenu(menuc, client, MENU_TIME_FOREVER);
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}

	return 1;
}

public jobmenu(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[32];
		new String:rankIdentifier[32];
		GetMenuItem(menu, param2, info, sizeof(info));
		
		if (jobid[jobs[client]] > 0)
		{
			employers[jobid[jobs[client]]] -= 1;
		}
			
		//jobid[jobs[client]] = StringToInt(info);
		new jobID = StringToInt(info);
		new Handle:menub = CreateMenu(jobmenu_final);
		SetMenuTitle(menub, "Choisis le rang pour : %N", jobs[client]);
		KeyValues kv = new KeyValues("Jobs");
		kv.ImportFromFile("addons/sourcemod/configs/roleplay/jobs.txt");
		new i = 1;
		IntToString(i, rankIdentifier, sizeof(rankIdentifier));
		if (kv.JumpToKey(info)) {
			while (kv.GetNum(rankIdentifier, -1) != -1) {
				new String:rankName[64];
				new String:menuOption[80];
				kv.GetString(rankIdentifier, rankName, sizeof(rankName));
				Format(menuOption, sizeof(menuOption), "%i_%i", jobID, i);
				AddMenuItem(menub, menuOption, rankName);
				i++;
				IntToString(i, rankIdentifier, sizeof(rankIdentifier));
			}
		}
		delete kv;
			
		DisplayMenu(menub, client, MENU_TIME_FOREVER);
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public jobmenu_final(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{

		new String:info[32];
		GetMenuItem(menu, param2, info, sizeof(info));
		decl String:Buffer[8][32];
		
		ExplodeString(info, "_", Buffer, 2, 32);
		PrintToServer("Selected option : %s : %s", Buffer[0], Buffer[1]);
		//rankid[jobs[client]] = StringToInt(info);
		jobid[jobs[client]] = StringToInt(Buffer[0]);
		rankid[jobs[client]] = StringToInt(Buffer[1]);
		
		new GameTime = GetTime();
		
		if (IsPolice(jobs[client]) || IsJuge(jobs[client]) || IsPresidentJustice(client) || IsDetectiveLeader(jobs[client]))
		{
			CS_SwitchTeam(jobs[client], CS_TEAM_CT);
		}
		else
		{
			CS_SwitchTeam(jobs[client], CS_TEAM_T);
		}
		
		ChooseSkin(jobs[client]);
		
		decl String:ClanTagRankName[20];
		GetClanTagName(jobs[client], rankid[jobs[client]], jobid[jobs[client]], ClanTagRankName, sizeof(ClanTagRankName));

		CS_SetClientClanTag(jobs[client], ClanTagRankName);
		
		GetRankName(rankid[jobs[client]], jobid[jobs[client]], JobNameUser[jobs[client]], sizeof(JobNameUser[]));
		
		CPrintToChat(client, "%s : Vous avez promu %N en tant que %s.", g_bPrefix, jobs[client], JobNameUser[jobs[client]]);
		CPrintToChat(jobs[client], "%s : Vous avez été promu %s par %N.", g_bPrefix, JobNameUser[jobs[client]], client);
		
		InitSalary(jobs[client]);
		
		employers[jobid[jobs[client]]] += 1;
		
		SauvegardeCapital(jobid[jobs[client]]);
		
		if (ACTIVE_LIMITATION)
		{
			if (!IsRootAdmin(jobs[client]))
			{
				EmbaucheExpire[jobs[client]] = GameTime + EMBAUCHE_EXPIRE;
			}
		}
		
		DBSave(jobs[client]);
		
		jobs[client] = 0;
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public Action:Command_Lock(client, args)
{
	decl Ent;
	decl String:Door[255];
	decl String:hammerIdBuffer[40];
	decl String:ownerSteamId[30];
	decl String:entity_name[128];

	Ent = GetClientAimTarget(client, false);
	
	if (IsValidAndAlive(client))
	{
		if (Ent != -1)
		{
			GetEdictClassname(Ent, Door, sizeof(Door));
			Entity_GetName(Ent, entity_name, sizeof(entity_name));
			
			if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
			{
				new HammerID = Entity_GetHammerId(Ent);
				IntToString(HammerID, hammerIdBuffer, sizeof(hammerIdBuffer));
				
				if (Entity_IsLocked(Ent))
				{
					CPrintToChat(client, "%s : La porte est déjà fermée.", g_bPrefix);
				}
				else
				{
					if (g_kvDoors.JumpToKey(hammerIdBuffer))
					{
						new job_id = g_kvDoors.GetNum("job_id", -1);
						new rank_id = g_kvDoors.GetNum("rank_id", -1);
						g_kvDoors.GetString("owner", ownerSteamId, sizeof(ownerSteamId));
						new String:SteamId[32];
						GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
						if (StrEqual(ownerSteamId, SteamId, false)) {
							lockdoor(Ent, client);
						} else if ((rank_id != -1 && rank_id == rankid[client]) && (job_id != -1 && job_id == jobid[client])) {
							lockdoor(Ent, client);
						} else if (rank_id == -1 && job_id != -1 && job_id == jobid[client] && GetClientJobID(client) != 1) {
							lockdoor(Ent, client);
						} else {
							CPrintToChat(client, "%s : Vous {red}n'avez pas{default} les clefs de cette porte.", g_bPrefix);
						}
					} else {
						CPrintToChat(client, "%s : Vous {red}n'avez pas{default} les clefs de cette porte.", g_bPrefix);
					}
					g_kvDoors.Rewind();
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez {red}viser{default} une porte.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous devez {red}viser{default} une porte.", g_bPrefix);
		}
	}

	return Plugin_Handled;
}

public Action:Command_Unlock(client, args)
{
	decl Ent;
	decl String:Door[255];
	decl String:hammerIdBuffer[40];
	decl String:ownerSteamId[30];
	decl String:entity_name[128];

	Ent = GetClientAimTarget(client, false);
	
	if (IsValidAndAlive(client))
	{
		if (Ent != -1)
		{
			GetEdictClassname(Ent, Door, sizeof(Door));
			Entity_GetName(Ent, entity_name, sizeof(entity_name));
			
			if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
			{
				new HammerID = Entity_GetHammerId(Ent);
				IntToString(HammerID, hammerIdBuffer, sizeof(hammerIdBuffer));
				
				if (!Entity_IsLocked(Ent))
				{
					CPrintToChat(client, "%s : La porte est déjà ouverte.", g_bPrefix);
				}
				else
				{	 
					if (g_kvDoors.JumpToKey(hammerIdBuffer))
					{
						new job_id = g_kvDoors.GetNum("job_id", -1);
						new rank_id = g_kvDoors.GetNum("rank_id", -1);
						g_kvDoors.GetString("owner", ownerSteamId, sizeof(ownerSteamId));
						new String:SteamId[32];
						GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
						if (StrEqual(ownerSteamId, SteamId, false)) {
							unlockdoor(Ent, client);
						} else if ((rank_id != -1 && rank_id == rankid[client]) && (job_id != -1 && job_id == jobid[client])) {
							unlockdoor(Ent, client);
						} else if (rank_id == -1 && job_id != -1 && job_id == jobid[client] && GetClientJobID(client) != 1) {
							unlockdoor(Ent, client);
						} else {
							CPrintToChat(client, "%s : Vous {red}n'avez pas{default} les clefs de cette porte.", g_bPrefix);
						}
					} else {
						CPrintToChat(client, "%s : Vous {red}n'avez pas{default} les clefs de cette porte.", g_bPrefix);
					}
					g_kvDoors.Rewind();
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez {red}viser{default} une porte.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous devez {red}viser{default} une porte.", g_bPrefix);
		}
	}

	return Plugin_Handled;
}

stock LockingDoors()
{
	LockingEntity("func_door_rotating");
	LockingEntity("prop_door_rotating");
	LockingEntity("func_door");
}

stock LockingEntity(const String:ClassName[])
{
	new entity = -1;
	new hammerID = 0;
	
	while ((entity = FindEntityByClassname(entity, ClassName)) != INVALID_ENT_REFERENCE)
	{
		if(IsValidEdict(entity) && IsValidEntity(entity))
		{
			hammerID = Entity_GetHammerId(entity);
			decl String:hammerIdBuffer[40];
			IntToString(hammerID, hammerIdBuffer, sizeof(hammerIdBuffer));
			if (GetDoorsJob(hammerIdBuffer)) {
				SetEntProp(entity, Prop_Data, "m_bLocked", 1, 1);
			}
		}
	}
}

public Action:Command_Cop(client, args)
{
	if (IsChefPolice(client) || IsGti(client) || IsCia(client) || IsFbi(client))
	{
		if (!IsCivil[client])
		{
			CS_SwitchTeam(client, 2);
			CPrintToChat(client, "%s : Vous êtes désormais en civil.", g_bPrefix);
			IsCivil[client] = true;
		}
		else
		{
			CS_SwitchTeam(client, 3);
			CPrintToChat(client, "%s : Vous êtes désormais en policier.", g_bPrefix);
			IsCivil[client] = false;
		}
		
		ChooseSkin(client);
		
		decl String:ClanTagRankName[20];
		GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
		CS_SetClientClanTag(client, ClanTagRankName);
	}
	else
	{
		CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
	}
	
	return Plugin_Handled;
}

public Action:Hook_SetTransmit(entity, client) 
{ 
	if (entity != client)
	{
		return Plugin_Handled;
	}
	
	return Plugin_Continue; 
}

public lockdoor(porte, client)
{
	if (IsValidEntity(porte))
	{
		Entity_Lock(porte);
		EmitSoundToAll("doors/default_locked.wav", porte, SNDCHAN_AUTO, SNDLEVEL_NORMAL);
		CPrintToChat(client, "%s : Vous avez {red}verouillé{default} la porte.", g_bPrefix);
	}
}

public unlockdoor(porte, client)
{
	if (IsValidEntity(porte))
	{
		Entity_UnLock(porte);
		EmitSoundToAll("doors/latchunlocked1.wav", porte, SNDCHAN_AUTO, SNDLEVEL_NORMAL);
		CPrintToChat(client, "%s : Vous avez {olive}déverrouillé{default} la porte.", g_bPrefix);
	}
}

public Action:Command_Grab(client, args)
{ 
	if (!IsValidAndAlive(client) || (client > MaxClients))
		return Plugin_Handled;
		
	if (grab[client])
	{
		gObj[client] = -1;
		grab[client] = false;
	
		return Plugin_Handled;
	}
	else
	{
		Grab(client);
	}
	
	return Plugin_Handled;
}

stock Grab(client)
{
	new ent;
	new Float:VecPos_Ent[3], Float:VecPos_Client[3];
	
	ent = GetObject(client, false);
	
	if (ent == -1)
		return;
	
	ent = EntRefToEntIndex(ent);
	
	if (ent == INVALID_ENT_REFERENCE)
		return;

	new String:edictname[128];
	GetEdictClassname(ent, edictname, sizeof(edictname));
	
	if (gObj[client] == ent)
	{
		if (grab[client])
		{
			gObj[client] = -1;
			grab[client] = false;
		}
	}
	else
	{
		new Float:entorigin[3], Float:clientent[3];
		GetEntPropVector(ent, Prop_Send, "m_vecOrigin", entorigin);
		GetEntPropVector(client, Prop_Send, "m_vecOrigin", clientent);
		
		new Float:distance = GetVectorDistance(entorigin, clientent);
		
		if (distance <= 1000.0)
		{
			if (!grab[client])
			{
				if (StrEqual(edictname, "player"))
				{
					if (jobid[client] > 0)
					{
						if (!IsTazed[ent])
						{
							if (IsPolice(ent) && !IsPolice(client))
							{
								CPrintToChat(client, "%s : Vous ne pouvez pas porté un policier", g_bPrefix);
								return;
							}
							else
							{
								if (IsPolice(client) && !IsPolice(ent))
								{
									gObj[client] = ent;
									grab[client] = true;
								}
								else
								{
									if (GetClientJobID(client) == GetClientJobID(ent) && GetClientRankID(client) < GetClientRankID(ent) || GetClientRankID(ent) == 0)
									{
										if (IsPolice(client) || IsMarshall(client) || IsGardeOnu(client))
										{
											gObj[client] = ent;
											grab[client] = true;
										}
										else if (ArePlayersInSameZone(client, ent)) {
											if (IsPlayerInHisHideout(client)) {
												gObj[client] = ent;
												grab[client] = true;
											} else {
												CPrintToChat(client, "%s : Le joueur ciblé n'est pas dans votre planque.", g_bPrefix); 
												return;
											}
											
										}
									}
									else
									{
										CPrintToChat(client, "%s : Vous ne pouvez pas porter ce joueur.", g_bPrefix);
										return;
									}
								}
							}
							
							if (GetEntityMoveType(ent) == MOVETYPE_NONE)
							{
								if (strncmp("player", edictname, 5, false)!=0)
								{
									SetEntityMoveType(ent, MOVETYPE_VPHYSICS);
								}
								else
								{
									SetEntityMoveType(ent, MOVETYPE_WALK);
									return;
								}
							}
						}
						else
						{
							CPrintToChat(client, "%s : Vous ne pouvez pas porté un joueur tazé.", g_bPrefix);
							return;
						}
					}
					else
					{
						CPrintToChat(client, "%s : Vous ne pouvez pas porté un joueur.", g_bPrefix);
						return;
					}
				}
				else if(StrEqual(edictname, "prop_vehicle_driveable"))
				{
					CPrintToChat(client, "%s : Vous ne pouvez pas porté un véhicule.", g_bPrefix);
					return;
				}
				else if (StrEqual(edictname, "prop_physics") || StrEqual(edictname, "prop_physics_multiplayer"))
				{
					if (IsValidEdict(ent) && IsValidEntity(ent)) 
					{
						new String:name[200];
						
						Entity_GetName(ent, name, sizeof(name));
						
						if (!StrEqual(name, "caisse_kit") && !StrEqual(name, "caisse_fbi") && !StrEqual(name, "caisse_comico") && !StrEqual(name, "distributeur"))
						{
							ent = ReplacePhysicsEntity(ent);
							
							SetEntPropEnt(ent, Prop_Data, "m_hPhysicsAttacker", client);
							SetEntPropFloat(ent, Prop_Data, "m_flLastPhysicsInfluenceTime", GetEngineTime());
							
							gObj[client] = ent;
							grab[client] = true;
						}
						else
						{
							return;
						}
					}
					else
					{
						return;
					}
				}
				else
				{
					return;
				}
				
				gObj[client] = EntIndexToEntRef(ent);

				GetEntPropVector(ent, Prop_Send, "m_vecOrigin", VecPos_Ent);
				GetClientEyePosition(client, VecPos_Client);
				FORCE_DISTANCE[client] = GetVectorDistance(VecPos_Ent, VecPos_Client, false);

				new Float:position[3];
				TeleportEntity(ent, NULL_VECTOR, NULL_VECTOR, position);
			}
			else
			{
				return;
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous être trop loin pour porter.", g_bPrefix);
			return;
		}
	}
}

public Action:UpdateObjects(Handle:timer)
{
	new Float:vecDir[3], Float:vecPos[3], Float:vecVel[3];
	new Float:viewang[3];

	for (new i = 1; i <= MaxClients; i++)
	{
		if (ValidGrab(i))
		{
			GetClientEyeAngles(i, viewang);
			GetAngleVectors(viewang, vecDir, NULL_VECTOR, NULL_VECTOR);
			GetClientEyePosition(i, vecPos);

			vecPos[0]+=vecDir[0]*FORCE_DISTANCE[i];
			vecPos[1]+=vecDir[1]*FORCE_DISTANCE[i];
			vecPos[2]+=vecDir[2]*FORCE_DISTANCE[i];
			
			GetEntPropVector(gObj[i], Prop_Send, "m_vecOrigin", vecDir);
			
			SubtractVectors(vecPos, vecDir, vecVel);
			ScaleVector(vecVel, 10.0);
			
			TeleportEntity(gObj[i], NULL_VECTOR, NULL_VECTOR, vecVel);
		}
	}
	
	return Plugin_Continue;
}

public Action:Command_Tazer(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsPolice(client) || IsMarshall(client) || IsGardeOnu(client))
		{
			new i = GetClientAimTarget(client, false);
		
			if (i != -1)
			{
				decl String:ClassName[64];
				GetEdictClassname(i, ClassName, sizeof(ClassName));
				
				if (StrEqual(ClassName, "player"))
				{	
					if (!IsTazed[i])
					{
						if (GetClientTeam(i) == 2)
						{
							new Float:entorigin[3], Float:clientent[3];
							GetEntPropVector(i, Prop_Send, "m_vecOrigin", entorigin);
							GetEntPropVector(client, Prop_Send, "m_vecOrigin", clientent);
							
							new Float:distance = GetVectorDistance(entorigin, clientent);
						
							if (distance <= 1000.0)
							{
								IsTazed[i] = true;
								
								g_Count[i] = 10.0;
								
								PrecacheSound(SOUND_TAZER);
								EmitSoundToAll(SOUND_TAZER, client, _, _, _, 1.0);
								
								PrecacheSound("bot/aah.wav", true);
								EmitSoundToAll("bot/aah.wav", i, _, _, _, 1.0);
								
								clientent[2] += 45;
								entorigin[2] += 45;
							
								TE_SetupBeamPoints(clientent, entorigin, g_LightingSprite, 0, 1, 0, 1.0, 20.0, 0.0, 2, 5.0, ColorTazer, 3);
								TE_SendToAll();

								SetEntityMoveType(i, MOVETYPE_NONE);
								
								g_TazerTimer[i] = CreateTimer(1.0, DoTazer, i);
							}
							else
							{
								CPrintToChat(client, "%s : Vous êtes trop loin pour tazer.", g_bPrefix);
							}
						}
						else
						{
							CPrintToChat(client, "%s : Vous ne pouvez pas tazer un membre du gouvernement.", g_bPrefix);
						}
					}
					else
					{
						CPrintToChat(client, "%s : Ce joueur est déjà tazé.", g_bPrefix);
					}
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez viser un joueur.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:DoTazer(Handle:timer, any:client)
{
	if (IsClientInGame(client))
	{
		if (g_Count[client] > 0.0)
		{
			g_Count[client] -= 1.0;
			
			CreateTimer(1.0, DoTazer, client);
			
			new Float:entorigin[3];
			GetEntPropVector(client, Prop_Send, "m_vecOrigin", entorigin);
		
			for(new ii=1; ii<8; ii++) 
			{
				entorigin[2]+= (ii*9);
			
				TE_SetupBeamRingPoint(entorigin, 45.0, 45.1, g_modelLaser, g_modelHalo, 0, 1, 0.1, 8.0, 1.0, ColorTazer, 1, 0);
			
				TE_SendToAll();

				entorigin[2]-= (ii*9);
			}
			
			if (IsPlayerAlive(client))
			{
				SetEntityMoveType(client, MOVETYPE_NONE);
			}
		}
		else
		{
			IsTazed[client] = false;
			g_Count[client] = 0.0;
		
			SetEntityMoveType(client, MOVETYPE_WALK);
		}
	}
	
	return Plugin_Continue;
}

public Action:DoTazerr(Handle:timer, any:client)
{
	if (IsClientInGame(client))
	{
		if (g_Count[client] > 0.0)
		{
			g_Count[client] -= 1.0;
			
			CreateTimer(1.0, DoTazerr, client);
			
			new Float:entorigin[3];
			GetEntPropVector(client, Prop_Send, "m_vecOrigin", entorigin);
		
			for(new ii=1; ii<8; ii++) 
			{
				entorigin[2]+= (ii*9);
			
				TE_SetupBeamRingPoint(entorigin, 45.0, 45.1, g_modelLaser, g_modelHalo, 0, 1, 0.1, 8.0, 1.0, ColorBeam, 1, 0);
			
				TE_SendToAll();

				entorigin[2]-= (ii*9);
			}
			
			if (IsPlayerAlive(client))
			{
				SetEntityMoveType(client, MOVETYPE_NONE);
			}
		}
		else
		{
			IsTazed[client] = false;
			g_Count[client] = 0.0;
		
			SetEntityMoveType(client, MOVETYPE_WALK);
		}
	}
	
	return Plugin_Continue;
}

public Action:Command_Teleport(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			BuildTeleportMenu(client);
		}
	}
	
	return Plugin_Handled;
}

BuildTeleportMenu(client)
{
	new Handle:teleportMenu = CreateMenu(Menu_Teleport);
	
	SetMenuTitle(teleportMenu, "Menu de téléportation :");
	AddMenuItem(teleportMenu, "1", "Se téléporter à un joueur");
	AddMenuItem(teleportMenu, "2", "Téléporter un joueur à soi");
	AddMenuItem(teleportMenu, "3", "Téléporté un joueur à un autre joueur");
	
	DisplayMenu(teleportMenu, client, MENU_TIME_FOREVER);
}

public Menu_Teleport(Handle:teleportMenu, MenuAction:action, param1, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		
		GetMenuItem(teleportMenu, param2, info, sizeof(info));
		
		new Handle:teleportMenu2 = CreateMenu(Menu_Teleport2);
		
		SetMenuTitle(teleportMenu2, "Veuillez choisir un joueur :");
		
		for (new i = 1; i <= MaxClients; i++)
		{
			if (IsClientInGame(i))
			{
				if (IsPlayerAlive(i))
				{
					decl String:Buffer[32];
					decl String:Name[64];
					
					Format(Buffer, 32, "%i_%s", i, info);
					
					GetClientName(i, Name, 64);
					
					AddMenuItem(teleportMenu2, Buffer, Name);
				}
			}
		}
		
		DisplayMenu(teleportMenu2, param1, MENU_TIME_FOREVER);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(teleportMenu);
		}
	}
}

public Menu_Teleport2(Handle:teleportMenu2, MenuAction:action, param1, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		GetMenuItem(teleportMenu2, param2, info, sizeof(info));
		
		decl String:Buffer[8][32];
		
		ExplodeString(info, "_", Buffer, 2, 32);
		
		new client = StringToInt(Buffer[0]);
		
		decl Float:TargetPos[3];
		
		if (StrEqual(Buffer[1], "1"))
		{
			GetClientAbsOrigin(client, TargetPos);
			
			TeleportEntity(param1, TargetPos, NULL_VECTOR, NULL_VECTOR);
			
			CPrintToChat(param1, "%s : Vous vous êtes téléporté à la position de %N", g_bPrefix, client);
		}
		else if (StrEqual(Buffer[1], "2"))
		{
			GetClientAbsOrigin(param1, TargetPos);
			
			TeleportEntity(client, TargetPos, NULL_VECTOR, NULL_VECTOR);
			
			CPrintToChat(param1, "%s : Vous avez téléporté %N à votre position.", g_bPrefix, client);
		}
		else if (StrEqual(Buffer[1], "3"))
		{
			new Handle:teleportMenu3 = CreateMenu(Menu_Teleport3);
			SetMenuTitle(teleportMenu3, "Veuillez choisir à qui téléporter ce joueur :");
			
			for (new i = 1; i <= MaxClients; i++)
			{
				if (IsClientInGame(i))
				{
					if (IsPlayerAlive(i))
					{
						decl String:Buffer2[32];
						decl String:Name[64];
						
						Format(Buffer2, 32, "%i_%i", i, client);
						
						GetClientName(i, Name, 64);
						
						AddMenuItem(teleportMenu3, Buffer2, Name);
					}
				}
			}
			
			DisplayMenu(teleportMenu3, param1, MENU_TIME_FOREVER);
		}
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(teleportMenu2);
		}
	}
}

public Menu_Teleport3(Handle:teleportMenu3, MenuAction:action, param1, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		GetMenuItem(teleportMenu3, param2, info, sizeof(info));
		
		decl String:Buffer[8][32];
		
		ExplodeString(info, "_", Buffer, 2, 32);
		
		new target = StringToInt(Buffer[0]);
		new client = StringToInt(Buffer[1]);
		
		decl Float:TargetPos[3];
		
		GetClientAbsOrigin(target, TargetPos);
		
		TeleportEntity(client, TargetPos, NULL_VECTOR, NULL_VECTOR);
		
		CPrintToChat(param1, "%s : Vous avez téléporté %N à %N.", g_bPrefix, client, target);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(teleportMenu3);
		}
	}
}

public Action:Command_Enquete(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsPolice(client))
		{
			new aim = GetClientAimTarget(client, true);
			
			if (aim != -1)
			{
				new String:SteamId[32];
				GetClientAuthId(aim, AuthId_Steam2, SteamId, sizeof(SteamId));
			
				new life = GetClientHealth(aim);
				
				new armor = GetEntProp(aim, Prop_Send, "m_ArmorValue");
				
				new String:TEXT[50];
				new String:TEXT1[50];
				new String:TEXT2[50];
				new String:TEXT3[50];
				new String:TEXT4[100];
				new String:TEXT6[100];
				new String:TEXT7[100];
				new String:TEXT8[50];
		
				if (IsValid(aim))
				{
					Format(TEXT, sizeof(TEXT), "STEAM_ID : %s", SteamId);
					Format(TEXT1, sizeof(TEXT1), "Vie : %d | Armure : %d", life, armor);
					Format(TEXT2, sizeof(TEXT2), "Métier : %s", JobNameUser[aim]);
					Format(TEXT3, sizeof(TEXT3), "Vue pour la dernière fois : %s", ZoneUser[aim]);
					Format(TEXT4, sizeof(TEXT4), "Dernière mort par : %s", LastKillBy[aim]);
					Format(TEXT6, sizeof(TEXT6), "RIB : %s | CB : %s", (HasRib(aim) ? "Actif" : "Inactif"), (HasCb(aim) ? "Actif" : "Inactif"));
					Format(TEXT7, sizeof(TEXT7), "Permis Lourd : %s | Permis Léger : %s", (HasPermisLourd(aim) ? "Actif" : "Inactif"), (HasPermisLeger(aim) ? "Actif" : "Inactif"));
					Format(TEXT8, sizeof(TEXT8), "Permis Projectiles : %s", (HasPermisProjectiles(aim) ? "Actif" : "Inactif"));
					
					new Handle:menu = CreateMenu(Menu_Enquete);
	
					SetMenuTitle(menu, "Enquête sur %N :", aim);
					
					AddMenuItem(menu, "", TEXT, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", TEXT1, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", TEXT2, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", TEXT6, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", TEXT7, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", TEXT8, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", TEXT3, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", TEXT4, ITEMDRAW_DISABLED);
					
					DisplayMenu(menu, client, 30);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez viser un joueur.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Menu_Enquete(Handle:menu, MenuAction:action, param1, param2)
{
	if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public IsInZone(Float:clientPosition[3], Float:zone1[3], Float:zone2[3])
{
	decl Float:temp;

	if (zone1[0] > zone2[0]) {
		temp = zone2[0];
		zone2[0] = zone1[0];
		zone1[0] = temp;
	}

	if (zone1[1] > zone2[1]) {
		temp = zone2[1];
		zone2[1] = zone1[1];
		zone1[1] = temp;
	}

	if (zone1[2] > zone2[2]) {
		temp = zone2[2];
		zone2[2] = zone1[2];
		zone1[2] = temp;
	}

	if (clientPosition[0] >= zone1[0] && clientPosition[0] <= zone2[0] && clientPosition[1] >= zone1[1] && clientPosition[1] <= zone2[1] && clientPosition[2] >= zone1[2] && clientPosition[2] <= zone2[2]) {
		return true;
	} else {
		return false;
	}
}

public GetZoneName(client, String:ZoneName[], maxlen)
{
	if(IsValidAndAlive(client))
	{
		decl String:tempName[150];
		decl String:parentNode[150];
		strcopy(tempName, maxlen, "Extérieur");
		
		new Float:v[3];
		GetEntPropVector(client, Prop_Send, "m_vecOrigin", v);
		GetClientZone(g_kvZones, v, tempName, maxlen, parentNode);
		strcopy(ZoneName, maxlen, tempName);
	}
	else
	{
		strcopy(ZoneName, maxlen, "Extérieur");
	}
}

Ralentissement(client, Float:speed, Float:duration)
{
	if (IsClientInGame(client))
	{
		if (IsPlayerAlive(client))
		{
			SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", speed);
		
			if (duration > 0)
			{
				CreateTimer(duration, ResetSpeed, client);
			}
		}
	}
}

public Action:ResetSpeed(Handle:timer, any:param1)
{
	if (IsClientInGame(param1))
	{
		SetEntPropFloat(param1, Prop_Data, "m_flLaggedMovementValue", 1.0);
	}
	
	return Plugin_Continue;
}

public Action:CutJail(client, Ent)
{
	if (IsValidAndAlive(client))
	{
		if (IsPolice(client))
		{
			if (!IsInvisible[client])
			{
				if (Ent != -1)
				{
					if (!IsPolice(Ent))
					{
						JailSpawnClient(Ent);
						
						BuildJailMenu(client, Ent);
						
						setClientInJail(Ent, 1);
						jailtime[Ent] = 720;
						
						disarm(Ent);										
						GivePlayerItem(Ent, "weapon_knife");
						
						CPrintToChat(client, "%s : Vous avez emprisonner %N. Veuillez sélectionner une peine.", g_bPrefix, Ent);
						CPrintToChat(Ent, "%s : Vous avez été emprisonner par %N. En attente de peine.", g_bPrefix, client);
						
						SetEntityMoveType(Ent, MOVETYPE_WALK);
						
						SetClientListeningFlags(Ent, VOICE_MUTED);
						
						ModifySpeed(Ent, 1.0);
						
						SetEntityGravity(Ent, 1.0);
						
						SetEntityRenderColor(Ent, 255, 255, 255, 255);
						
						if (crochetageon[Ent])
						{
							crochetageon[Ent] = false;
							SetEntPropFloat(Ent, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
							SetEntProp(Ent, Prop_Send, "m_iProgressBarDuration", 0);
						}
						
						if (IsTazed[Ent])
						{
							IsTazed[Ent] = false;
						}
						
						ChooseSkin(Ent);
						
						decl String:ClanTagRankName[20];
		
						GetClanTagName(Ent, rankid[Ent], jobid[Ent], ClanTagRankName, sizeof(ClanTagRankName));
						CS_SetClientClanTag(Ent, ClanTagRankName);
						
						if (!IsInCellules(Ent))
						{
							JailSpawnClient(Ent);
						}
					}
					else
					{
						CPrintToChat(client, "%s : Vous ne pouvez pas emprisonner un membre du gouvernement.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous devez viser un joueur.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous ne pouvez pas emprisonner en étant invisible.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
}

Handle:BuildJailMenu(client, Player)
{
	decl String:Buffer[32];
	
	new Handle:jail_menu = CreateMenu(Menu_Jail);
	SetMenuTitle(jail_menu, "Combien de temps doit rester %N ?", Player);
	
	Format(Buffer, sizeof(Buffer), "%i_1", Player);
	AddMenuItem(jail_menu, Buffer, "Annuler la peine / Libérer");
	
	if (GetClientJobID(client) == 2)
	{
		if (GetClientRankID(client) == 1)
		{
			Format(Buffer, sizeof(Buffer), "%i_2", Player);
			AddMenuItem(jail_menu, Buffer, "Garde à vue");
		}
		
		Format(Buffer, sizeof(Buffer), "%i_3", Player);
		AddMenuItem(jail_menu, Buffer, "Meurtre");
		
		Format(Buffer, sizeof(Buffer), "%i_4", Player);
		AddMenuItem(jail_menu, Buffer, "Tentative de meurtre");
		
		Format(Buffer, sizeof(Buffer), "%i_5", Player);
		AddMenuItem(jail_menu, Buffer, "Vol");
		
		Format(Buffer, sizeof(Buffer), "%i_6", Player);
		AddMenuItem(jail_menu, Buffer, "Nuisance sonore");
		
		Format(Buffer, sizeof(Buffer), "%i_7", Player);
		AddMenuItem(jail_menu, Buffer, "Insultes envers les forces de l'ordre");
		
		Format(Buffer, sizeof(Buffer), "%i_8", Player);
		AddMenuItem(jail_menu, Buffer, "Obstruction envers la police");
		
		Format(Buffer, sizeof(Buffer), "%i_9", Player);
		AddMenuItem(jail_menu, Buffer, "Fuite / Refus d'obtempérer");
		
		Format(Buffer, sizeof(Buffer), "%i_10", Player);
		AddMenuItem(jail_menu, Buffer, "Abus +force");
		
		Format(Buffer, sizeof(Buffer), "%i_11", Player);
		AddMenuItem(jail_menu, Buffer, "Possession d'armes illégales");
		
		Format(Buffer, sizeof(Buffer), "%i_12", Player);
		AddMenuItem(jail_menu, Buffer, "Mutinerie / Evasion");
		
		Format(Buffer, sizeof(Buffer), "%i_13", Player);
		AddMenuItem(jail_menu, Buffer, "Intrusion propriété privée");
		
		Format(Buffer, sizeof(Buffer), "%i_14", Player);
		AddMenuItem(jail_menu, Buffer, "Intrusion poste de police");
		
		Format(Buffer, sizeof(Buffer), "%i_15", Player);
		AddMenuItem(jail_menu, Buffer, "Trafique Illégale");
		
		Format(Buffer, sizeof(Buffer), "%i_16", Player);
		AddMenuItem(jail_menu, Buffer, "Tir dans la rue");
		
		Format(Buffer, sizeof(Buffer), "%i_17", Player);
		AddMenuItem(jail_menu, Buffer, "Imprimantes illégales");
	
		Format(Buffer, sizeof(Buffer), "%i_18", Player);
		AddMenuItem(jail_menu, Buffer, "Crochetage");
		
		Format(Buffer, sizeof(Buffer), "%i_19", Player);
		AddMenuItem(jail_menu, Buffer, "Vente de produits illicites");
	}
	
	DisplayMenu(jail_menu, client, MENU_TIME_FOREVER);
	
	return Handle:0;
}

public Menu_Jail(Handle:jail_menu, MenuAction:action, param1, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		
		new Player;
		new number;
		
		GetMenuItem(jail_menu, param2, info, sizeof(info));
		
		decl String:Buffer[8][32];
		
		ExplodeString(info, "_", Buffer, 2, 32);
		
		Player = StringToInt(Buffer[0]);
		number = StringToInt(Buffer[1]);
		
		if (IsValidEntity(Player))
		{
			decl String:SteamId[64];
			decl String:CopSteamId[64];
			
			GetClientAuthId(Player, AuthId_Steam2, SteamId, sizeof(SteamId));
			GetClientAuthId(param1, AuthId_Steam2, SteamId, sizeof(SteamId));
			
			GetClientName(param1, CopSteamId, sizeof(CopSteamId));
			
			if (number == 1)
			{
				FreePlayer(Player);
				
				CPrintToChat(param1, "%s : Vous avez libérer %N.", g_bPrefix, Player);
			}
			if (number == 2)
			{
				jailtime[Player] = 390;
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour une Garde à Vue.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour une Garde à Vue.", g_bPrefix, CopSteamId);
			}
			if (number == 3)
			{
				Jail(Player, param1, 1200, 1800);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Meurtre.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Meurtre.", g_bPrefix, CopSteamId);
			}
			if (number == 4)
			{
				Jail(Player, param1, 560, 750);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour tentative de meurtre.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour tentative de meurtre.", g_bPrefix, CopSteamId);
			}
			if (number == 5)
			{
				Jail(Player, param1, 560, 300);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Vol.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Vol.", g_bPrefix, CopSteamId);
			}
			if (number == 6)
			{
				Jail(Player, param1, 330, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Nuissance Sonore.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Nuissance Sonore.", g_bPrefix, CopSteamId);
			}
			if (number == 7)
			{
				Jail(Player, param1, 390, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Insultes.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Insultes.", g_bPrefix, CopSteamId);
			}
			if (number == 8)
			{
				Jail(Player, param1, 300, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Obstruction envers la police.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Obstruction envers la police.", g_bPrefix, CopSteamId);
			}
			if (number == 9)
			{
				Jail(Player, param1, 390, 250);
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Fuite / Refus d'obtempérer.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Fuite / Refus d'obtempérer.", g_bPrefix, CopSteamId);
			}
			if (number == 10)
			{
				Jail(Player, param1, 280, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Abus +force.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Abus +force.", g_bPrefix, CopSteamId);
			}
			if (number == 11)
			{
				Jail(Player, param1, 280, 800);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Possession d'armes illégale.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Possession d'armes illégale.", g_bPrefix, CopSteamId);
			}
			if (number == 12)
			{
				Jail(Player, param1, 390, 150);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Mutinerie / Evasion.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Mutinerie / Evasion.", g_bPrefix, CopSteamId);
			}
			if (number == 13)
			{
				Jail(Player, param1, 280, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Intrusion propriété privée.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Intrusion propriété privée.", g_bPrefix, CopSteamId);
			}
			if (number == 14)
			{
				Jail(Player, param1, 390, 200);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Intrusion poste de police.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Intrusion poste de police.", g_bPrefix, CopSteamId);
			}
			if (number == 15)
			{
				Jail(Player, param1, 390, 600);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Trafique Illégale.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Trafique Illégale.", g_bPrefix, CopSteamId);
			}
			if (number == 16)
			{
				Jail(Player, param1, 390, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Tir dans la rue.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Tir dans la rue.", g_bPrefix, CopSteamId);
			}
			if (number == 17)
			{
				Jail(Player, param1, 390, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Imprimantes illégales.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Imprimantes illégales.", g_bPrefix, CopSteamId);
			}
			if (number == 18)
			{
				Jail(Player, param1, 390, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Crochetage.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Crochetage.", g_bPrefix, CopSteamId);
			}
			if (number == 19)
			{
				Jail(Player, param1, 390, 100);
				
				CPrintToChat(param1, "%s : Vous avez emprisonner %N pour Vente de produits illicites.", g_bPrefix, Player);
				CPrintToChat(Player, "%s : Vous avez été emprisonner par %N pour Vente de produits illicites.", g_bPrefix, CopSteamId);
			}
		}
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(jail_menu);
		}
	}
	
	return 0;
}

Jail(Player, Cop, Time, Amende)
{
	decl String:ItemAccepter[32];
	decl String:ItemRefuser[32];
	
	if (IsValid(Player))
	{
		jailtime[Player] = Time;
		
		new Handle:caution_menu = CreateMenu(Menu_Caution);
		SetMenuTitle(caution_menu, "Votre caution s'élève à %i€. Voulez-vous la payer?", Amende);
		
		Format(ItemAccepter, sizeof(ItemAccepter), "%i_%i_%i_a", Cop, Time, Amende);
		AddMenuItem(caution_menu, ItemAccepter, "Accepter de payer la caution.");
		
		Format(ItemRefuser, sizeof(ItemRefuser), "%i_%i_%i_r", Cop, Time, Amende);
		AddMenuItem(caution_menu, ItemRefuser, "Refuser de payer la caution.");
		
		SetMenuExitButton(caution_menu, false);
		
		DisplayMenu(caution_menu, Player, MENU_TIME_FOREVER);
		
		disarm(Player);
		
		GivePlayerItem(Player, "weapon_knife");
	}
}

public Menu_Caution(Handle:caution_menu, MenuAction:action, param1, param2)
{
	if (action == MenuAction_Select)
	{
		new Cop = 0;
		new Time = 0;
		new Amende = 0;
		
		decl String:info[32];
		GetMenuItem(caution_menu, param2, info, sizeof(info));
		
		decl String:Buffer[16][32];
		
		ExplodeString(info, "_", Buffer, 4, 32);
		
		Cop = StringToInt(Buffer[0]);
		Time = StringToInt(Buffer[1]);
		Amende = StringToInt(Buffer[2]);
		
		if (IsValid(Cop) && IsValid(param1))
		{
			if (StrEqual(Buffer[3], "a"))
			{
				new total = money[param1] - Amende;
				
				new totalbank = bank[param1] - Amende;
				
				if (0 <= total)
				{
					new after = money[param1];
					money[param1] = after - Amende;
					
					new afterr = money[Cop];
					money[Cop] = Amende / 2 + afterr;
					
					new afterrr = capital[2];
					capital[2] = Amende / 2 + afterrr;
					
					jailtime[param1] = Time / 2;
					
					CPrintToChat(param1, "%s : Vous avez payer une amande de %i€. Vous ne purgerez que la moitié de votre peine.", g_bPrefix, Amende);
					CPrintToChat(Cop, "%s : %N a payer une amande de %i€, il ne purgera donc que la moitié de sa peine.", g_bPrefix, param1, Amende);
				}
				else
				{
					if (0 <= totalbank)
					{
						new later = bank[param1];
						bank[param1] = later - Amende;
						
						new laterr = money[Cop];
						money[Cop] = Amende / 2 + laterr;
						
						new capi = capital[2];
						capital[2] = Amende / 2 + capi;
						
						jailtime[param1] = Time / 2;
						
						CPrintToChat(param1, "%s : Vous avez payer une amande de %i€. Vous ne purgerez que la moitié de votre peine.", g_bPrefix, Amende);
						CPrintToChat(Cop, "%s : %N a payer une amande de %i€, il ne purgera donc que la moitié de sa peine.", g_bPrefix, param1, Amende);
					}
				}
			}
			else if (StrEqual(Buffer[3], "r"))
			{
				CPrintToChat(param1, "%s : Vous avez refusé de payer votre caution, votre peine reste inchangée.", g_bPrefix);
				CPrintToChat(Cop, "%s : %N a refusé de payer sa caution.", g_bPrefix, param1);
			}
		}
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(caution_menu);
		}
	}
}

FreePlayer(client)
{
	if (IsValidAndAlive(client))
	{
		if (IsInCellules(client))
		{
			SpawnClient(client);
		}

		SetClientListeningFlags(client, VOICE_NORMAL);

		jailtime[client] = 0;
		setClientInJail(client, 0);

		disarm(client);

		GivePlayerItem(client, "weapon_knife");

		CPrintToChat(client, "%s : Vous avez été libérer de prison.", g_bPrefix);

		ChooseSkin(client);

		decl String:ClanTagRankName[20];

		GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
		CS_SetClientClanTag(client, ClanTagRankName);
	}
}

public Action:Say(client, String:command[], args)
{
	if (IsValid(client))
	{
		if (!IsFakeClient(client))
		{
			decl String:Arg[256];
			GetCmdArgString(Arg, sizeof(Arg));
			StripQuotes(Arg);
			TrimString(Arg);
			
			decl String:JobName[40]; 
	
			if (IsCyberCriminal(client)) {
				Format(JobName, sizeof(JobName), "Cybercriminel");
			} else {
				GetRankName(rankid[client], jobid[client], JobName, sizeof(JobName));
			}
			
			if (!IsPlayerAlive(client))
			{
				CPrintToChat(client, "%s : Vous devez être en vie pour parler.", g_bPrefix);
				return Plugin_Handled;
			}
			
			if (!IsPolice(client) && IsInCellules(client))
			{
				CPrintToChat(client, "%s : Les prisonniers n'ont pas l'autorisation de parler.", g_bPrefix);
				return Plugin_Handled;
			}

			if (IsClientInJail(client))
			{
				CPrintToChat(client, "%s : Les prisonniers n'ont pas l'autorisation de parler.", g_bPrefix);
				return Plugin_Handled;
			}

			if (strncmp(Arg, "/", 1) == 0 || strncmp(Arg, "!", 1) == 0) {
				return Plugin_Handled;
			}
			
			if (channelle[client] == 1)
			{
				if (GetClientTeam(client) == 2)
				{
					CPrintToChatAll("{red}%s{default} - {gray}%N {default}: %s", JobName, client, Arg);
					return Plugin_Handled;
				}
				else if (GetClientTeam(client) == 3)
				{
					CPrintToChatAll("{blue}%s{default} - {gray}%N {default}: %s", JobName, client, Arg);
					return Plugin_Handled;
				}
			}
			else if (channelle[client] == 2)
			{
				CPrintToChatAll("{gray}ANNONCES{default} - {gray}%N {default}: %s", client, Arg);
				return Plugin_Handled;
			}
			else if (channelle[client] == 3)
			{
				CPrintToChatAll("{olive}COMMERCE{default} - {gray}%N {default}: %s", client, Arg);
				return Plugin_Handled;
			}
			else if (channelle[client] == 4)
			{
				CPrintToChatAll("{red}ADMIN{default} - {gray}%N {default}: %s", client, Arg);
				return Plugin_Handled;
			}
		}
	}
	
	return Plugin_Continue;
}

public Action:Say_Team(client, String:command[], args)
{
	if (client > 0)
	{
		if (!IsFakeClient(client))
		{
			decl String:Arg[256];
			GetCmdArgString(Arg, sizeof(Arg));
			StripQuotes(Arg);
			TrimString(Arg);
			
			for (new i = 1; i <= MaxClients; i++)
			{
				if (IsValid(i) && GetClientTeam(i) > 1)
				{
					if (entity_distance_stock(client, i) <= 600)
					{
						if (!IsInCellules(client))
						{
							CPrintToChatEx(i, client, "{unusual}PROXIMITÉ{default} - {teamcolor}%N : {default}%s", client, Arg);
						}
						else
						{
							CPrintToChatEx(i, client, "{red}PRISON{default} - {teamcolor}%N : {default}%s", client, Arg);
						}
					}
				}
			}
		}
	}
	
	return Plugin_Handled;
}

public Float:entity_distance_stock(ent1, ent2)
{
	decl Float:orig1[3];
	decl Float:orig2[3];
	
	GetEntPropVector(ent1, Prop_Send, "m_vecOrigin", orig1);
	GetEntPropVector(ent2, Prop_Send, "m_vecOrigin", orig2);
	
	return GetVectorDistance(orig1, orig2);
}

public Action:Command_Jaillist(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsPolice(client))
		{
			ShowPrisonner(client);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
		}
		
		return Plugin_Handled;
	}
	
	return Plugin_Handled;
}

ShowPrisonner(client)
{
	if(client > 0 && client <= MaxClients && !IsFakeClient(client))
	{
		decl String:sMenuText[64];
		sMenuText[0] = '\0';
		
		new Handle:menu = CreateMenu(Menu_Prisonnier);
		SetMenuTitle(menu, "Liste des prisonniers :");
		SetMenuExitButton(menu, true);
		
		AddPrisonniers(menu);
		
		DisplayMenu(menu, client, MENU_TIME_FOREVER);
	}
}

public AddPrisonniers(Handle:menu)
{
	decl String:user_id[12];
	decl String:name[MAX_NAME_LENGTH];
	decl String:display[MAX_NAME_LENGTH+15];
	
	for (new i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i) && jailtime[i] > 0)
		{
			IntToString(GetClientUserId(i), user_id, sizeof(user_id));
			
			GetClientName(i, name, sizeof(name));
		
			Format(display, sizeof(display), "%s en prison pendant %i:%i", name, JailHours[i], JailMinutes[i]);
	
			AddMenuItem(menu, user_id, display, ITEMDRAW_DISABLED);
		}
	}
}

public Menu_Prisonnier(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public Action:Command_Rw(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsPolice(client))
		{	
			new Ent;
			Ent = GetClientAimTarget(client, false);

			if (Ent != -1)
			{
				new String:Classname[32];
				GetEdictClassname(Ent, Classname, sizeof(Classname));

				if (StrContains(Classname, "weapon_", false) != -1)
				{
					RemoveEdict(Ent);
					
					CPrintToChat(client, "%s : Vous avez supprimé l'arme au sol.", g_bPrefix);
				}
				else
				{
					CPrintToChat(client, "%s : Veuillez viser une arme.", g_bPrefix);
				}
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Speed(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			if (Speedhack[client])
			{
				Speedhack[client] = false;
				CPrintToChat(client, "%s : Vous avez désactiver le speedhack.", g_bPrefix);
				ModifySpeed(client, 1.0);
			}
			else
			{
				Speedhack[client] = true;
				CPrintToChat(client, "%s : Vous avez activer le speedhack.", g_bPrefix);
				ModifySpeed(client, 3.5);
			}
		}
	}
	
	return Plugin_Handled;
}

public Client_ResetAmmo(client)
{
	new zomg = GetEntDataEnt2(client, activeOffset);

	if (clip1Offset != -1)
	{
		SetEntData(zomg, clip1Offset, 200, 4, true);
	}

	if (clip2Offset != -1)
	{
		SetEntData(zomg, clip2Offset, 200, 4, true);
	}

	if (priAmmoTypeOffset != -1)
	{
		SetEntData(zomg, priAmmoTypeOffset, 200, 4, true);
	}

	if (secAmmoTypeOffset != -1)
	{
		SetEntData(zomg, secAmmoTypeOffset, 200, 4, true);
	}
}

public Menu_Bank(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[32];
		GetMenuItem(menu, param2, info, sizeof(info));
		
		if (StrEqual(info, "Deposit"))
		{
			if (money[client] <= 0)
			{
				CPrintToChat(client, "%s : Vous n'avez pas d'argent a déposé.", g_bPrefix);		
			}
			
			new Handle:menub = CreateMenu(deposit_menu);
			SetMenuTitle(menub, "Choisis la somme :");
			
			if (money[client] >= 10)
			{
				AddMenuItem(menub, "10", "10€");
			}
			if (money[client] >= 50)
			{
				AddMenuItem(menub, "50", "50€");
			}
			if (money[client] >= 100)
			{
				AddMenuItem(menub, "100", "100€");
			}
			if (money[client] >= 200)
			{
				AddMenuItem(menub, "200", "200€");
			}
			if (money[client] >= 500)
			{
				AddMenuItem(menub, "500", "500€");
			}
			if (money[client] >= 1000)
			{
				AddMenuItem(menub, "1000", "1000€");
			}
			if (money[client] >= 2000)
			{
				AddMenuItem(menub, "2000", "2000€");
			}
			if (money[client] >= 5000)
			{
				AddMenuItem(menub, "5000", "5000€");
			}
			if (money[client] >= 10000)
			{
				AddMenuItem(menub, "10000", "10000€");
			}
			if (money[client] >= 30000)
			{
				AddMenuItem(menub, "30000", "30000€");
			}
			if (money[client] >= 1)
			{
				AddMenuItem(menub, "all", "all");
			}
			
			DisplayMenu(menub, client, MENU_TIME_FOREVER);
		}
		else if (StrEqual(info, "Retired"))
		{
			if (bank[client] <= 0)
			{
				CPrintToChat(client, "%s : Tu n'as pas d'argent à retirer.", g_bPrefix);			
			}
			
			if (money[client] >= 200000)
			{
				CPrintToChat(client, "%s : Tu ne peut pas avoir plus d'argent sur toi.", g_bPrefix);	
			}
			else
			{
				new Handle:menuba = CreateMenu(retired_menu);
				SetMenuTitle(menuba, "Choisis la somme :");
				
				if (bank[client] >= 5)
				{
					AddMenuItem(menuba, "5", "5€");
				}
				if (bank[client] >= 10)
				{
					AddMenuItem(menuba, "10", "10€");
				}
				if (bank[client] >= 50)
				{
					AddMenuItem(menuba, "50", "50€");
				}
				if (bank[client] >= 100)
				{
					AddMenuItem(menuba, "100", "100€");
				}
				if (bank[client] >= 200)
				{
					AddMenuItem(menuba, "200", "200€");
				}
				if (bank[client] >= 500)
				{
					AddMenuItem(menuba, "500", "500€");
				}
				if (bank[client] >= 1000)
				{
					AddMenuItem(menuba, "1000", "1000€");
				}
				if (bank[client] >= 2000)
				{
					AddMenuItem(menuba, "2000", "2000€");
				}
				if (bank[client] >= 5000)
				{
					AddMenuItem(menuba, "5000", "5000€");
				}
				if (bank[client] >= 10000)
				{
					AddMenuItem(menuba, "10000", "10000€");
				}
				if (bank[client] >= 30000)
				{
					AddMenuItem(menuba, "30000", "30000€");
				}
				
				DisplayMenu(menuba, client, MENU_TIME_FOREVER);
			}
		}
		else if (StrEqual(info, "Capital"))
		{
			
			if (money[client] <= 0)
			{
				CPrintToChat(client, "%s : Vous n'avez pas d'argent a déposé.", g_bPrefix);		
			}
			
			new Handle:menuc = CreateMenu(capital_menu);
			SetMenuTitle(menuc, "Choisis la somme :");
			
			if (money[client] >= 10)
			{
				AddMenuItem(menuc, "10", "10€");
			}
			if (money[client] >= 50)
			{
				AddMenuItem(menuc, "50", "50€");
			}
			if (money[client] >= 100)
			{
				AddMenuItem(menuc, "100", "100€");
			}
			if (money[client] >= 200)
			{
				AddMenuItem(menuc, "200", "200€");
			}
			if (money[client] >= 500)
			{
				AddMenuItem(menuc, "500", "500€");
			}
			if (money[client] >= 1000)
			{
				AddMenuItem(menuc, "1000", "1000€");
			}
			if (money[client] >= 2000)
			{
				AddMenuItem(menuc, "2000", "2000€");
			}
			if (money[client] >= 5000)
			{
				AddMenuItem(menuc, "5000", "5000€");
			}
			if (money[client] >= 10000)
			{
				AddMenuItem(menuc, "10000", "10000€");
			}
			if (money[client] >= 30000)
			{
				AddMenuItem(menuc, "30000", "30000€");
			}
			if (money[client] >= 1)
			{
				AddMenuItem(menuc, "all", "all");
			}
			DisplayMenu(menuc, client, MENU_TIME_FOREVER);
		}
		else if (StrEqual(info, "save"))
		{
			DBSave(client);
			
			CPrintToChat(client, "%s : Sauvegarde des données avec succès !", g_bPrefix);
		}
		else if (StrEqual(info, "verifyATM")) {
			if (!crochetageon[client]) {
				Entiter[client] = GetClientAimTarget(client, false);
				
				new String:name[200];
				Entity_GetName(Entiter[client], name, sizeof(name));
					
				if (Entiter[client] != -1) {
					if (StrEqual(name, "distributeur") || StrContains(name, "hacked_distributeur_") != -1) {
						crochetageon[client] = true;
						SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
						SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 10);
						g_croche[client] = CreateTimer(10.0, Timer_VerifyATM, client, TIMER_REPEAT);
						SetEntityRenderColor(client, 0, 255, 0, 0);
						SetEntityMoveType(client, MOVETYPE_NONE);
					} else {
						CPrintToChat(client, "%s : Vous devez faire face à un {olive}distributeur{default}.", g_bPrefix);
					}
				} else {
					CPrintToChat(client, "%s : Vous devez faire face à un {olive}distributeur{default}.", g_bPrefix);
				}
			}
		}
		else if (StrEqual(info, "cc"))
		{
			if (money[client] >= PRICE_COMPTE_DISTRIB)
			{
				money[client] -= PRICE_COMPTE_DISTRIB;
				
				compte[client] = 1;
				
				CPrintToChat(client, "%s : Activation de votre compte courant effectuée.", g_bPrefix);
			}
			else
			{
				CPrintToChat(client, "%s : Vous n'avez pas assez d'argent pour finaliser la transaction.", g_bPrefix);
			}
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public deposit_menu(Handle:menub, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[32];
		decl String:Buffer[4][64];
		GetMenuItem(menub, param2, info, sizeof(info));
		
		new deposit_somme = StringToInt(info);
		
		if (deposit_somme < 0)
		{
			CPrintToChat(client, "%s : Vous ne pouvez pas déposé une somme négative.", g_bPrefix);
		}
		new String:Name[250];
		new Float:robbedMoney = 0;
		Entity_GetName(Entiter[client], Name, sizeof(Name));
		if (StrContains(Name, "hacked_distributeur_") != -1) {				
			ExplodeString(Name, "_", Buffer, 4, 64);
		}
		if (StrEqual(info, "all"))
		{
			CPrintToChat(client, "%s : Vous avez déposé tout votre argent.", g_bPrefix);
			if (StrContains(Name, "hacked_distributeur_") != -1) {
				robbedMoney = money[client] * 0.1;
				if (playerIds[StringToInt(Buffer[2])] == StringToInt(Buffer[3])) {
					money[StringToInt(Buffer[2])] += RoundToZero(robbedMoney);
				} else {
					saveSkimmedMoney(StringToInt(Buffer[3]), RoundToZero(robbedMoney));
				}
			}
			bank[client] = (money[client] - RoundToZero(robbedMoney)) + bank[client];
			money[client] = 0;
			
		}
		
		else if (money[client] >= deposit_somme)
		{
			if (StrContains(Name, "hacked_distributeur_") != -1) {	
				robbedMoney = deposit_somme * 0.1;
				PrintToServer("Client : %i - Player : %i", StringToInt(Buffer[2]), StringToInt(Buffer[3]));
				if (playerIds[StringToInt(Buffer[2])] == StringToInt(Buffer[3])) {
					money[StringToInt(Buffer[2])] += RoundToZero(robbedMoney);
				} else {
					saveSkimmedMoney(StringToInt(Buffer[3]), RoundToZero(robbedMoney));
				}
			}
			bank[client] += (deposit_somme - RoundToZero(robbedMoney));
			money[client] -= deposit_somme;
			
			CPrintToChat(client, "%s : Vous avez déposé %i€.", g_bPrefix, deposit_somme);
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menub);
	}
}

public saveSkimmedMoney (playerId, amount) {
	new String:buffer[800];
	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

	Format(buffer, sizeof(buffer), "SELECT money FROM players WHERE id = '%i';", playerId);
	SQL_LockDatabase(database);
	new Handle:query = SQL_Query(database, buffer);
	query = SQL_Query(database, buffer);
	
	if (query)
	{
		SQL_Rewind(query);
		
		new bool:fetch = SQL_FetchRow(query);
		
		if (fetch)
		{
			new newMoney = SQL_FetchInt(query, 0);
			newMoney = newMoney + amount;
			new String:updateQuery[800];
			SQL_UnlockDatabase(database);
			Format(updateQuery, sizeof(updateQuery), "UPDATE players SET money = '%i' WHERE id = '%i'", newMoney, playerId);			
			SQL_TQuery(g_ThreadedHandle, CallbackUpdateSkimmedMoney, updateQuery, playerId);
		}
	}
	SQL_UnlockDatabase(database);
	CloseHandle(query);
	CloseHandle(database);
}

public CallbackUpdateSkimmedMoney(Handle:owner, Handle:hndl, const String:error[], any:client)
{
	PrintToServer("error : %s", error);
	if (hndl == null)
	{
		PrintToServer("Failed to query from save Accounting (error: %s)", error);
	} else {
		PrintToServer("Success set salary !");
	}
}

public retired_menu(Handle:menuba, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[32];
		GetMenuItem(menuba, param2, info, sizeof(info));
	
		new retired_somme = StringToInt(info);
		
		if (retired_somme > bank[client])
		{
			CPrintToChat(client, "%s : Vous n'avez pas assez d'argent pour cette transaction.", g_bPrefix);	
		}
		else
		{
			bank[client] -= retired_somme;
			money[client] += retired_somme;
		
			CPrintToChat(client, "%s : Tu as retiré %i€.", g_bPrefix, retired_somme);
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menuba);
	}
}

public capital_menu(Handle:menub, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[32];
		GetMenuItem(menub, param2, info, sizeof(info));
		
		new deposit_somme = StringToInt(info);
		
		if (deposit_somme < 0)
		{
			CPrintToChat(client, "%s : Vous ne pouvez pas déposé une somme négative.", g_bPrefix);
		}
		
		if (StrEqual(info, "all"))
		{
			CPrintToChat(client, "%s : Vous avez déposé tout votre argent.", g_bPrefix);
			
			capital[jobid[client]] = capital[jobid[client]] + money[client];
			money[client] = 0;
		}
		else if (money[client] >= deposit_somme)
		{
			capital[jobid[client]] += deposit_somme;
			money[client] -= deposit_somme;
			
			CPrintToChat(client, "%s : Vous avez déposé %i€.", g_bPrefix, deposit_somme);
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menub);
	}
}

public Action:Timer_VerifyATM(Handle:timer, any:client)
{
	if (IsValidAndAlive(client))
	{
		new String:name[200];
		Entity_GetName(Entiter[client], name, sizeof(name));
		if (StrContains(name, "hacked_distributeur_") != -1) {
			DispatchKeyValue(Entiter[client], "targetname", "distributeur");
			CPrintToChat(client, "%s : Vous avez retiré un {red}dispositif illégal{default} attaché au {olive}distributeur{default} !", g_bPrefix);
			money[client] += 500;
		} else {
			CPrintToChat(client, "%s : Le {olive}distributeur{default} est aux normes !", g_bPrefix);
		}
		
		SetEntityMoveType(client, MOVETYPE_WALK);
		SetEntityRenderColor(client, 255, 255, 255, 255);
	
		crochetageon[client] = false;
		
		SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
		SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 0);
		
		KillTimer(g_croche[client]);
	}
}

public Action:Command_Salaire(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsChef(client) || IsCoChef(client))
		{
			BuildSalaireMenu(client);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
}

Handle:BuildSalaireMenu(client)
{
	new String:jobID[32];
	new String:rankIdentifier[32];
	new Handle:menu = CreateMenu(Menu_Salaire);
	SetMenuTitle(menu, "Modifier le salaire de :");
	IntToString(GetClientJobID(client), jobID, sizeof(jobID));

	if (IsChef(client) || IsCoChef(client)) {
		KeyValues kv = new KeyValues("Jobs");
		kv.ImportFromFile("addons/sourcemod/configs/roleplay/jobs.txt");
		new i = 1;
		IntToString(i, rankIdentifier, sizeof(rankIdentifier));
		if (kv.JumpToKey(jobID)) {
			while ((kv.GetNum(rankIdentifier, -1) != -1)) {
				if (i >= GetClientRankID(client)) {
					new String:rankName[64];
					new String:menuOption[80];
					kv.GetString(rankIdentifier, rankName, sizeof(rankName));
					Format(menuOption, sizeof(menuOption), "%i", i);
					AddMenuItem(menu, menuOption, rankName);
				}
				i++;
				IntToString(i, rankIdentifier, sizeof(rankIdentifier));
			}
		}
		delete kv;
	}
	
	DisplayMenu(menu, client, 30);
}

public Menu_Salaire(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[64];
		GetMenuItem(menu, param2, info, sizeof(info));
		
		salarychoose[client] = StringToInt(info);
		
		new Handle:menuc = CreateMenu(Menu_Choice);
		SetMenuTitle(menuc, "Nouveau salaire :");
		
		AddMenuItem(menuc, "1500", "1500€");
		AddMenuItem(menuc, "1400", "1400€");
		AddMenuItem(menuc, "1300", "1300€");
		AddMenuItem(menuc, "1200", "1200€");
		AddMenuItem(menuc, "1100", "1100€");
		AddMenuItem(menuc, "1000", "1000€");
		AddMenuItem(menuc, "900", "900€");
		AddMenuItem(menuc, "800", "800€");
		AddMenuItem(menuc, "700", "700€");
		AddMenuItem(menuc, "600", "600€");
		AddMenuItem(menuc, "500", "500€");
		AddMenuItem(menuc, "400", "400€");
		AddMenuItem(menuc, "300", "300€");
		AddMenuItem(menuc, "200", "200€");
		AddMenuItem(menuc, "100", "100€");
		AddMenuItem(menuc, "50", "50€");
		
		DisplayMenu(menuc, client, MENU_TIME_FOREVER);
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public Menu_Choice(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[64], String:query[254];
		GetMenuItem(menu, param2, info, sizeof(info));
		
		new salaryfinal = StringToInt(info);
				
		Format(query, sizeof(query), "UPDATE ranks SET salary = '%i' WHERE rank_id = '%i' AND job_id = '%i'", salaryfinal, salarychoose[client], GetClientJobID(client));				
		SQL_TQuery(g_ThreadedHandle, CallbackUpdateSalary, query, client);
		
		for (new i = 1; i <= MaxClients; i++)
		{
			if (IsClientInGame(i) && IsPlayerAlive(i) && (GetClientRankID(i) == salarychoose[client]) && (GetClientJobID(i) == GetClientJobID(client)))
			{
				SetClientSalary(i, salaryfinal);
			}
		}
				
		salarychoose[client] = 0;
		
		CPrintToChat(client, "%s : Salaire modifié avec succès. (%i€).", g_bPrefix, salaryfinal);
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public Action:Command_Engager(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsChef(client) || IsCoChef(client))
		{
			if (jailtime[client] <= 0)
			{
				if (employers[jobid[client]] < quota[jobid[client]])
				{
					new Ent = GetClientAimTarget(client, true);
					
					if (Ent != -1)
					{
						if (IsUnemployed(Ent))
						{
							BuildChoiceMenu(client, Ent);
						}
						else
						{
							CPrintToChat(client, "%s : Ce joueur a déjà un travail.", g_bPrefix);
						}
					}
					else
					{
						CPrintToChat(client, "%s : Vous devez viser un joueur.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous avez atteint le nombre maximum d'employers.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous ne pouvez pas engager un joueur en prison.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

Handle:BuildChoiceMenu(client, entity)
{
	decl String:JobName[20]; 
	decl String:Item[128];
	decl String:Item2[64];
	decl String:SteamId[64];

	GetRankName(GetHigherRankId(jobid[client]), jobid[client], JobName, sizeof(JobName));
	GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
	
	if (ACTIVE_LIMITATION)
	{
		Format(Item, sizeof(Item), "Si vous acceptez, il faudra attendre %d jours pour changer !", EMBAUCHE_DAY);
	}
	else
	{
		Format(Item, sizeof(Item), "Si vous acceptez, vous serez embauché dans l'entreprise !");
	}
	
	new Handle:menu = CreateMenu(Menu_ChoiceJob);

	SetMenuTitle(menu, "Voulez-vous être engagé(e) en tant que %s ?", JobName);
	
	AddMenuItem(menu, "", Item, ITEMDRAW_DISABLED);
	
	Format(Item2, sizeof(Item2), "oui-%s", SteamId);
	AddMenuItem(menu, Item2, "J'accepte");
	
	Format(Item2, sizeof(Item2), "non-%s", SteamId);
	AddMenuItem(menu, Item2, "Je refuse");
	
	DisplayMenu(menu, entity, 30);
}

public Menu_ChoiceJob(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[64];
		decl String:lastembauche[64];
		decl String:Buffer[90][64];
		decl String:SteamId[64];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
		
		ExplodeString(info, "-", Buffer, 2, 64);
		
		new GameTime = GetTime();
		
		FormatTime(lastembauche, sizeof(lastembauche), "%x à %X", EmbaucheExpire[client]);
		
		new Target = Client_FindBySteamId(Buffer[1]);

		if (Target != -1)
		{
			if (StrEqual(Buffer[0], "oui"))
			{
				if (ACTIVE_LIMITATION)
				{
					if (EmbaucheExpire[client] <= GameTime)
					{
						rankid[client] = GetHigherRankId(jobid[Target]);
						jobid[client] = jobid[Target];
						
						if (IsPolice(client))
						{
							CS_SwitchTeam(client, CS_TEAM_CT);
						}
						
						employers[jobid[client]] += 1;
						
						SauvegardeCapital(jobid[client]);
						
						CPrintToChat(Target, "%s : Vous avez engager %N dans votre entreprise.", g_bPrefix, client);
						CPrintToChat(client, "%s : Vous avez été engager par %N dans son entreprise.", g_bPrefix, Target);
						
						decl String:ClanTagRankName[20];
						GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));

						CS_SetClientClanTag(client, ClanTagRankName);
						
						InitSalary(client);
						
						EmbaucheExpire[client] = GameTime + EMBAUCHE_EXPIRE;
						
						decl String:error[256];
						decl String:buffer[399];
						new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
						
						Format(buffer, sizeof(buffer), "UPDATE players SET job_id = '%i', rank_id = '%i', WHERE steam_id = '%s'", jobid[client], rankid[client], SteamId);
						SQL_FastQuery(database, buffer);
						
						CloseHandle(database);
					}
					else
					{
						CPrintToChat(Target, "%s : Ce joueur ne peux toujours pas avoir de nouveau job. (Revenir le %s)", g_bPrefix, lastembauche);
						CPrintToChat(client, "%s : Vous ne pouvez pas être recruter avant le %s.", g_bPrefix, lastembauche);
					}
				}
				else
				{
					rankid[client] = 6;
					jobid[client] = jobid[Target];
					
					if (IsPolice(client))
					{
						CS_SwitchTeam(client, CS_TEAM_CT);
					}
					
					employers[jobid[client]] += 1;
					
					SauvegardeCapital(jobid[client]);
					
					CPrintToChat(Target, "%s : Vous avez engager %N dans votre entreprise.", g_bPrefix, client);
					CPrintToChat(client, "%s : Vous avez été engager par %N dans son entreprise.", g_bPrefix, Target);
					
					decl String:ClanTagRankName[20];
					GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));

					CS_SetClientClanTag(client, ClanTagRankName);
					
					InitSalary(client);
					
					EmbaucheExpire[client] = GameTime + EMBAUCHE_EXPIRE;
					
					decl String:error[256];
					decl String:buffer[399];
					new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
					
					Format(buffer, sizeof(buffer), "UPDATE `rp_players` SET `JOBID` = %i, `RANKID` = %i, `EMBAUCHEEXPIRE` = %i WHERE steam_id = '%s'", rankid[client], jobid[client], EmbaucheExpire[client], SteamId);
					SQL_FastQuery(database, buffer);
					
					CloseHandle(database);
				}
			}
			else if (StrEqual(Buffer[0], "non"))
			{
				CPrintToChat(Target, "%s : Le joueur %N a refuser de rejoindre votre entreprise.", g_bPrefix, client);
				CPrintToChat(client, "%s : Vous avez refuser de rejoindre l'entreprise de %N.", g_bPrefix, Target);
			}
		}
	}
}

public Action:Command_Promote(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsChef(client) || IsCoChef(client))
		{
			new GameTime = GetTime();
			
			new Ent = GetClientAimTarget(client, true);
			
			if (Ent != -1)
			{
				if (rankid[Ent] > 2 && rankid[Ent] < 7)
				{
					if (jobid[Ent] == jobid[client])
					{
						rankid[Ent] -= 1;
	
						decl String:RankName2[36];
						GetRankName(rankid[Ent], jobid[Ent], RankName2, sizeof(RankName2));
						
						CPrintToChat(Ent, "%s : Vous avez été promu au poste de %s par %N !", g_bPrefix, RankName2, client);
						CPrintToChat(client, "%s : Vous avez promu %N au poste de %s !", g_bPrefix, Ent, RankName2);
						
						decl String:ClanTagRankName[20];
						GetClanTagName(Ent, rankid[Ent], jobid[Ent], ClanTagRankName, sizeof(ClanTagRankName));

						CS_SetClientClanTag(Ent, ClanTagRankName);
						
						InitSalary(Ent);
						
						EmbaucheExpire[Ent] = GameTime + EMBAUCHE_EXPIRE;
					}
					else
					{
						CPrintToChat(client, "%s : Vous ne pouvez pas promouvoir ce joueur.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous ne pouvez pas promouvoir ce joueur.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez viser un joueur.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Demote(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsChef(client) || IsCoChef(client))
		{
			new Ent = GetClientAimTarget(client, true);
			
			if (Ent != -1)
			{
				if (rankid[Ent] > 1 && rankid[Ent] < 6)
				{
					if (jobid[Ent] == jobid[client])
					{
						rankid[Ent] += 1;
						
						decl String:RankName2[36];
						GetRankName(rankid[Ent], jobid[Ent], RankName2, sizeof(RankName2));
						
						CPrintToChat(Ent, "%s : Vous avez été rétrograder au poste de %s par %N !", g_bPrefix, RankName2, client);
						CPrintToChat(client, "%s : Vous avez rétrograder %N au poste de %s !", g_bPrefix, Ent, RankName2);
						
						decl String:ClanTagRankName[20];
						GetClanTagName(Ent, rankid[Ent], jobid[Ent], ClanTagRankName, sizeof(ClanTagRankName));

						CS_SetClientClanTag(Ent, ClanTagRankName);
						
						InitSalary(Ent);
					}
					else
					{
						CPrintToChat(client, "%s : Vous ne pouvez pas rétrograder ce joueur.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous ne pouvez pas rétrograder ce joueur.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez viser un joueur.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Virer(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (IsChef(client) || IsCoChef(client))
		{
			new Handle:g_VirerMenu = BuildVirerMenu(client);
			
			DisplayMenu(g_VirerMenu, client, 30);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

Handle:BuildVirerMenu(client)
{
	decl String:query[256];
	
	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	Format(query, sizeof(query), "SELECT steam_id, username, last_log_time, rank_id, job_id FROM players WHERE job_id = '%i';", jobid[client]);
	new Handle:job_list = SQL_Query(database, query);
	
	new Handle:virer = CreateMenu(Menu_Virer);
	
	SetMenuTitle(virer, "Sélectionnez un joueur :");
	
	if (job_list)
	{
		while (SQL_FetchRow(job_list))
		{
			decl String:SteamId[64];
			decl String:Item[128];
			decl String:Name[128];
			decl String:Exploded[100];
			
			SQL_FetchString(job_list, 0, SteamId, sizeof(SteamId));
			SQL_FetchString(job_list, 1, Name, sizeof(Name));
			
			new fitch = SQL_FetchInt(job_list, 2);
			new place = SQL_FetchInt(job_list, 3);
			new entreprise = SQL_FetchInt(job_list, 4);
			
			Format(Exploded, sizeof(Exploded), "%s-%i", SteamId, entreprise);
			
			if ((GetTime() + 604800) <= fitch)
			{
				Format(Item, sizeof(Item), "%s - Inactif", Name);
			}
			else
			{
				Format(Item, sizeof(Item), "%s - Actif", Name);
			}
			
			decl String:SteamId2[64];
			GetClientAuthId(client, AuthId_Steam2, SteamId2, sizeof(SteamId2));
			
			if (!StrEqual(SteamId, SteamId2))
			{
				if (place > 1)
				{
					AddMenuItem(virer, Exploded, Item);
					CountVirer += 1;
				}
			}
		}
	}
	
	CloseHandle(job_list);
	
	CloseHandle(database);
	
	return virer;
}

public Menu_Virer(Handle:virer, MenuAction:action, client, param2)
{
	if (IsValid(client))
	{
		if (CountVirer == 0)
		{
			CPrintToChat(client, "%s : Il n'y a personne à virer.", g_bPrefix);
		}
		else
		{
			if (action == MenuAction_Select)
			{
				decl String:info[32];
				decl String:query[256];
				decl String:Buffer[100][64];
				
				new enterprise;
		
				enterprise = StringToInt(Buffer[1]);
				
				GetMenuItem(virer, param2, info, sizeof(info));
				
				ExplodeString(info, "-", Buffer, 2, 64);
				
				decl String:error[256];
				new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
				
				Format(query, sizeof(query), "UPDATE players SET rank_id = '1', job_id = '1' WHERE steam_id = '%s';", Buffer[0]);
				SQL_FastQuery(database, query);
				
				new Target = Client_FindBySteamId(Buffer[0]);
				
				if (Target != -1)
				{
					if (GetClientTeam(Target) == 3)
					{
						CS_SwitchTeam(Target, 2);
					}
					
					employers[jobid[Target]] -= 1;
					
					SauvegardeCapital(jobid[Target]);
					
					rankid[Target] = 0;
					jobid[Target] = 0;
					
					decl String:ClanTagRankName[20];
					GetClanTagName(Target, rankid[Target], jobid[Target], ClanTagRankName, sizeof(ClanTagRankName));

					CS_SetClientClanTag(Target, ClanTagRankName);
					
					InitSalary(Target);
					
					CPrintToChat(client, "%s : Vous avez virer %N de votre entreprise.", g_bPrefix, Target);
					CPrintToChat(Target, "%s : Le joueur %N vous a virer de son entreprise.", g_bPrefix, client);
					
					CountVirer = 0;
				}
				else
				{
					CPrintToChat(client, "%s : Vous avez virer un joueur de votre entreprise.", g_bPrefix);
					
					employers[enterprise] -= 1;
				}
				
				CloseHandle(database);
			}
			else
			{
				if (action == MenuAction_End)
				{
					CloseHandle(virer);
				}
			}
		}
	}
}

public Action:Command_Demission(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (jobid[client] > 0)
		{
			new Handle:menu = CreateMenu(Menu_Demission);
			
			SetMenuTitle(menu, "Veux-tu démissioner ?");
			
			AddMenuItem(menu, "oui", "Oui je veux.");
			AddMenuItem(menu, "non", "Non merci.");
			
			DisplayMenu(menu, client, 30);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas de travail.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Menu_Demission(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[64];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		
		if (StrEqual(info, "oui"))
		{
			if (IsDealer(client))
			{
				new String:SteamId[32];
				GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));

				RemovePlante(client, SteamId);
			}
			
			employers[jobid[client]] -= 1;
			
			rankid[client] = 1;
			jobid[client] = 1;
			
			InitSalary(client);
			
			CPrintToChat(client, "%s : Vous avez quitter votre travail.", g_bPrefix);
			
			if (GetClientTeam(client) == 3)
			{
				CS_SwitchTeam(client, 2);
			}
			
			decl String:ClanTagRankName[20];
		
			GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
			CS_SetClientClanTag(client, ClanTagRankName);
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}


public Action:Command_Crocheter(client, Args)
{
	if (IsValidAndAlive(client)) {
		if (IsTriades(client) || IsMafia(client))
		{	
			if (!crochetageon[client])
			{
				new String:Door[255];
				
				Entiter[client] = GetClientAimTarget(client, false);
				
				if (Entiter[client] != -1)
				{
					GetEdictClassname(Entiter[client], Door, sizeof(Door));
					
					if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
					{
						if (Entity_IsLocked(Entiter[client]))
						{
							new timestamp;
							timestamp = GetTime();
							
							if ((timestamp - crochetage[client]) < 20)
							{
								CPrintToChat(client, "%s : Vous devez attendre %i secondes avant de pouvoir crocheté une porte.", g_bPrefix, (20 - (timestamp - crochetage[client])) );
							}
							else
							{
								new Float:entorigin[3], Float:clientent[3];
								GetEntPropVector(Entiter[client], Prop_Send, "m_vecOrigin", entorigin);
								GetEntPropVector(client, Prop_Send, "m_vecOrigin", clientent);
								new Float:distance = GetVectorDistance(entorigin, clientent);
								new Float:vec[3];
								GetClientAbsOrigin(client, vec);
								vec[2] += 10;

								if (distance > 80)
								{
									CPrintToChat(client, "%s : Vous êtes trop {red}loin {default}pour crocheter cette porte.", g_bPrefix);
								}
								else
								{
									crochetage[client] = GetTime();
									
									SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
									SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 8);
									
									g_croche[client] = CreateTimer(8.0, TimerCrochetage, client, TIMER_REPEAT);
									
									SetEntityRenderColor(client, 255, 0, 0, 0);
									SetEntityMoveType(client, MOVETYPE_NONE);
									
									TE_SetupBeamRingPoint(vec, 5.0, 800.0, g_modelLaser, g_modelHalo, 0, 15, 0.6, 15.0, 0.0, ColorCrochetage, 10, 0);
									TE_SendToAll();
									
									CPrintToChat(client, "%s : Vous {red}crochetez {default}la porte.", g_bPrefix);
																		
									crochetageon[client] = true;
								}
							}
						}
						else
						{
							CPrintToChat(client, "%s : La porte est déjà ouverte.", g_bPrefix);
						}
					}
					else
					{
						CPrintToChat(client, "%s : Veuillez visé une porte.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Veuillez visé une porte.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous êtes déjà en train de crocheté.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous devez faire partie d'un gang pour crocheter les portes", g_bPrefix);
		}
	}
}

public Action:Command_Vol(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (!IsInCellules(client))
		{
			new Ent = GetClientAimTarget(client, true);
			
			new timestamp;
			timestamp = GetTime();

			if (Ent != -1)
			{
				if (IsMafia(client) && IsMafia(Ent))
				{
					CPrintToChat(client, "%s : Vous ne pouvez pas voler votre collègue.", g_bPrefix);
				}
				else if (IsWildlings(client) && IsWildlings(Ent))
				{
					CPrintToChat(client, "%s : Vous ne pouvez pas voler votre collègue.", g_bPrefix);
				}
				else
				{
					if (!IsInvisible[Ent])
					{
						if (!AFK[Ent])
						{
							decl Float:client_vec[3];
							decl Float:plyr_vec[3];
							new Float:dist_vec;
							
							GetClientAbsOrigin(Ent, plyr_vec);
							GetClientAbsOrigin(client, client_vec);
							
							dist_vec = GetVectorDistance(plyr_vec, client_vec);
							
							if (dist_vec < 80)
							{
								new CashVoler;
								
								if (IsMafia(client) || IsWildlings(client)) {
									if (IsChef(client)) {
										CashVoler = GetRandomInt(1, 350);
									} else if (IsCoChef(client)) {
										CashVoler = GetRandomInt(1, 300);
									} else {
										CashVoler = GetRandomInt(1, 250);
									}
								} else {
									CashVoler = GetRandomInt(1, 70);
								}

								if (IsChef(client) || IsCoChef(client))
								{
									CashVoler = GetRandomInt(1, 300);
								}
								else if (rankid[client] == 3)
								{
									CashVoler = GetRandomInt(1, 250);
								}
								else if (rankid[client] == 4)
								{
									CashVoler = GetRandomInt(1, 200);
								}
								else if (rankid[client] == 5)
								{
									CashVoler = GetRandomInt(1, 150);
								}
								else
								{
									CashVoler = GetRandomInt(1, 100);
								}
								
								if (money[Ent] > 0)
								{
									if ((timestamp - vol[client]) < 30)
									{
										CPrintToChat(client, "%s : Vous devez attendre %i secondes avant de pouvoir volé.", g_bPrefix, (30 - (timestamp - vol[client])) );
									}
									else
									{
										new moneyVol = money[Ent];
										
										decl result;
										
										new after = CashVoler;
										moneyVol -= after;
										
										result = moneyVol - after;
										
										if (0 < result)
										{
											CPrintToChat(Ent, "%s : Un pickpocket vous a fais les poches et vous a volé %i€", g_bPrefix, CashVoler);
											CPrintToChat(client, "%s : Vous avez volé %i€ à %N.", g_bPrefix, CashVoler, Ent);
											
											new tg = money[Ent];
											money[Ent] = tg - CashVoler;
											
											ClientDirtyMoneyTransaction(client, CashVoler);
											new newReputation = GetClientReputation(client) - GetRandomInt(1, 5);
											SetClientReputation(client, newReputation);
											
											new later = capital[jobid[client]];
											capital[jobid[client]] = later + CashVoler;
										}
										else
										{
											CPrintToChat(Ent, "%s : Un pickpocket vous a fais les poches et vous a volé %i€", g_bPrefix, money[Ent]);
											CPrintToChat(client, "%s : Vous avez volé %i€ à %N.", g_bPrefix, money[Ent], Ent);
											
											new robbedMoney = money[client];
											ClientDirtyMoneyTransaction(client, robbedMoney);
											new newReputation = GetClientReputation(client) - GetRandomInt(1, 7);
											SetClientReputation(client, newReputation);
											
											money[Ent] = 0;
											
											new ptdr = capital[jobid[client]];
											capital[jobid[client]] = ptdr + robbedMoney;
										}

										if (reputation[client] < 0) {
											reputation[client] = 0;
										}
										
										vol[client] = GetTime();
										
										decl Float:vec[3];
										GetClientAbsOrigin(client, vec);
										
										vec[2] += 5;
										
										TE_SetupBeamRingPoint(vec, 5.0, 800.0, g_modelLaser, g_modelHalo, 0, 15, 0.6, 20.0, 0.5, ColorVol, 10, 0);
										TE_SendToAll();
									}
								}
								else
								{
									CPrintToChat(client, "%s : Ce joueur n'a pas d'argent sur lui.", g_bPrefix);
								}
							}
							else
							{
								CPrintToChat(client, "%s : Ce joueur est trop éloigné de vous.", g_bPrefix);
							}
						}
						else
						{
							CPrintToChat(client, "%s : Vous ne pouvez pas volé un joueur AFK.", g_bPrefix);
						}
					}
					else
					{
						CPrintToChat(client, "%s : Vous ne pouvez pas volé un joueur invisible.", g_bPrefix);
					}
				}
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous ne pouvez pas volé en jail.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Pickpocket(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (!IsInCellules(client))
		{
			if (IsWildlings(client)) {
				new Ent = GetClientAimTarget(client, true);
				if (Ent != -1) {
					if (IsInRange(client, Ent)) {
						if (!IsWildlings(Ent)) {
							new timestamp;
							timestamp = GetTime();
							if ((timestamp - vol[client]) < 10) {
								CPrintToChat(client, "%s : Vous devez attendre %i secondes avant de pouvoir volé.", g_bPrefix, (10 - (timestamp - vol[client])));
							} else {
								if (RobItem(client, Ent)) {
									vol[client] = GetTime();
									new newReputation = GetClientReputation(client) - GetRandomInt(1, 7);
									SetClientReputation(client, newReputation);
								} else {
									vol[client] = GetTime();
									CPrintToChat(client, "%s : Votre tentative de pickpocket a {red}échouée{default}.", g_bPrefix);
								}
							}
						}
					}
				}
			}			
		}
		else
		{
			CPrintToChat(client, "%s : Vous ne pouvez pas volé en jail.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

stock GetObject(client, bool:hitSelf=true)
{
	new ent = -1;
	
	if (IsClientInGame(client))
	{
		if (ValidGrab(client))
		{
			ent = EntRefToEntIndex(gObj[client]);
			return (ent);
		}

		ent = TraceToEntity(client);
		
		if (IsValidEntity(ent) && IsValidEdict(ent))
		{
			new String:edictname[64];
			GetEdictClassname(ent, edictname, 64);
			
			if (StrEqual(edictname, "worldspawn"))
			{
				if (hitSelf)
					ent = client;
				else
					ent = -1;
			}
		}
		else
		{
			ent = -1;
		}
	}
	
	return (ent);
}

stock bool:ValidGrab(client)
{
	if (IsClientInGame(client))
	{
		new obj = gObj[client];
		if (obj != -1 && IsValidEntity(obj) && IsValidEdict(obj))
			return (true);
	}
	else
	{
		gObj[client] = -1;
	}

	return (false);
}

stock ReplacePhysicsEntity(ent)
{
	new Float:VecPos_Ent[3], Float:VecAng_Ent[3];

	new String:model[128];
	GetEntPropString(ent, Prop_Data, "m_ModelName", model, 128);
	GetEntPropVector(ent, Prop_Send, "m_vecOrigin", VecPos_Ent);
	GetEntPropVector(ent, Prop_Send, "m_angRotation", VecAng_Ent);
	AcceptEntityInput(ent, "Wake");
	AcceptEntityInput(ent, "EnableMotion");
	AcceptEntityInput(ent, "EnableDamageForces");
	DispatchKeyValue(ent, "physdamagescale", "0.0");
	
	TeleportEntity(ent, VecPos_Ent, VecAng_Ent, NULL_VECTOR);
	SetEntityMoveType(ent, MOVETYPE_VPHYSICS);

	return (ent);
}

public TraceToEntity(client)
{
	new Float:vecClientEyePos[3], Float:vecClientEyeAng[3];
	GetClientEyePosition(client, vecClientEyePos);
	GetClientEyeAngles(client, vecClientEyeAng);

	TR_TraceRayFilter(vecClientEyePos, vecClientEyeAng, MASK_PLAYERSOLID, RayType_Infinite, TraceASDF, client);

	if (TR_DidHit(INVALID_HANDLE))
		return (TR_GetEntityIndex(INVALID_HANDLE));

	return (-1);
}

public bool:TraceASDF(entity, mask, any:data)
{
	return (data != entity);
}

public Action:Command_Piratage(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (IsCyberCriminal(client))
		{
			if (jailtime[client] <= 0)
			{
				Entiter[client] = GetClientAimTarget(client, false);
				
				new String:name[200];
				
				if (Entiter[client] != -1)
				{
					Entity_GetName(Entiter[client], name, sizeof(name));
					
					new timestamp;
					timestamp = GetTime();
					
					if ((timestamp - piratage[client]) < 40)
					{
						CPrintToChat(client, "%s : Vous devez attendre %i secondes avant de pouvoir pirater un distributeur.", g_bPrefix, (40 - (timestamp - piratage[client])) );
					}
					else
					{
						if (StrEqual(name, "distributeur") || StrContains(name, "hacked_distributeur_") != -1)
						{
							new Float:entorigin[3], Float:clientent[3];
							GetEntPropVector(Entiter[client], Prop_Send, "m_vecOrigin", entorigin);
							GetEntPropVector(client, Prop_Send, "m_vecOrigin", clientent);
							new Float:distance = GetVectorDistance(entorigin, clientent);
							new Float:vec[3];
							GetClientAbsOrigin(client, vec);
							vec[2] += 10;
							
							if (distance > 100)
							{
								CPrintToChat(client, "%s : Vous êtes trop loin pour pirater ce distributeur.", g_bPrefix);
							}
							else
							{
								piratage[client] = GetTime();
								
								SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
								SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 8);
								
								g_croche[client] = CreateTimer(8.0, Timer_Piratage, client, TIMER_REPEAT);
								
								SetEntityRenderColor(client, 255, 0, 0, 0);
								SetEntityMoveType(client, MOVETYPE_NONE);
								
								TE_SetupBeamRingPoint(vec, 5.0, 800.0, g_modelLaser, g_modelHalo, 0, 15, 0.6, 15.0, 0.0, ColorPiratage, 10, 0);
								TE_SendToAll();
								
								CPrintToChat(client, "%s : Vous piratez le distributeur.", g_bPrefix);
						
								crochetageon[client] = true;
								
								for (new i = 1; i <= MaxClients; i++)
								{
									if (IsValidAndAlive(i) && (IsPolice(i) || IsBanquier(i)))
									{
										CPrintToChat(i, "%s : Un distributeur est en cours de piratage.", g_bPrefix);
									}
								}
							}
						}
						else if (StrEqual(name, "distributeur_legendary"))
						{
							CPrintToChat(client, "%s : Vous ne pouvez pas pirater ce distributeur.", g_bPrefix);
						}
						else
						{
							CPrintToChat(client, "%s : Vous devez viser un distributeur.", g_bPrefix);
						}
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous devez viser un distributeur.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Tu ne peux pas piraté en prison.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:Timer_Piratage(Handle:timer, any:client)
{
	if (IsValidAndAlive(client))
	{
		new random = GetRandomInt(1, 200);
		
		switch (GetRandomInt(1, 3))
		{
			case 1:
			{
				new capitalID = GetRandomInt(2, 11);
				while (capitalID == 10)
				{
					capitalID = GetRandomInt(2, 11);
				}
				new String:JobName[64];
				GetJobName(capitalID, JobName, sizeof(JobName));
				new newRobbedCapital = capital[capitalID] -= random;
				if (capital[capitalID] > 0) {
					if (newRobbedCapital <= 0) {
						random = capital[capitalID];
					}
					new finalAmountCapital = random/3;
					new finalAmountClient = finalAmountCapital * 2;
					CPrintToChat(client, "%s : Vous avez {red}piraté{default} le distributeur ! Vous dérobez {olive}%i€{default} au capital de l'entreprise {red}%s{default}. Un tiers de l'argent va dans le capital de votre entreprise", g_bPrefix, random, JobName);
				
					ClientDirtyMoneyTransaction(client, finalAmountClient);
					new newReputation = GetClientReputation(client) - GetRandomInt(1, 3);
					SetClientReputation(client, newReputation);

					capital[jobid[client]] += finalAmountCapital;
					capital[capitalID] -= random;
					SauvegardeCapital(capitalID);
					SauvegardeCapital(jobid[client]);
				} else {
					CPrintToChat(client, "%s : Vous avez {red}piraté{default} le distributeur ! {red}Malheureusement{default} vous avez tenté de voler de l'argent au capital de l'entreprise {red}%s{default} qui n'a plus un sous ! Soyez plus vigilent la prochaine fois.", g_bPrefix, JobName);
				}
			}
		
			case 2:
			{
				CPrintToChat(client, "%s : Vous avez échoué le piratage.", g_bPrefix);
			}
			
			case 3:
			{
				CPrintToChat(client, "%s : Vous avez échoué le piratage.", g_bPrefix);
			}
		}
		
		SetEntityMoveType(client, MOVETYPE_WALK);
		SetEntityRenderColor(client, 255, 255, 255, 255);
	
		crochetageon[client] = false;
		
		SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
		SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 0);
		
		KillTimer(g_croche[client]);
	}
}

public Action:Command_Pick(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (IsMafia(client))
		{
			if (!IsInCellules(client))
			{
				new Ent = GetClientAimTarget(client, true);
				
				new timestamp;
				timestamp = GetTime();
				
				if (Ent != -1)
				{
					if (jobid[Ent] != jobid[client])
					{
						decl Float:client_vec[3];
						decl Float:plyr_vec[3];
						new Float:dist_vec;
						GetClientAbsOrigin(Ent, plyr_vec);
						GetClientAbsOrigin(client, client_vec);
						dist_vec = GetVectorDistance(plyr_vec, client_vec);
						
						if (dist_vec < 100)
						{
							decl String:WeaponName[32];
							Client_GetActiveWeaponName(Ent, WeaponName, sizeof(WeaponName));
							
							new weapon = Client_GetActiveWeapon(Ent);
							
							if (weapon != -1)
							{
								if (!StrEqual(WeaponName, "weapon_knife"))
								{
									if ((timestamp - vol[client]) < 30)
									{
										CPrintToChat(client, "%s : Vous devez attendre %i secondes avant de pouvoir volé.", g_bPrefix, (30 - (timestamp - vol[client])));
									}
									else
									{
										vol[client] = GetTime();
										
										new Ammo = Client_GetWeaponPlayerAmmo(Ent, WeaponName);
										
										new Clip = Weapon_GetPrimaryClip(weapon);
										
										Client_RemoveWeapon(Ent, WeaponName, true, false);
										
										new givedweapon = GivePlayerItem(client, WeaponName);
										
										Weapon_SetPrimaryAmmoCount(givedweapon, Ammo);
										
										Weapon_SetPrimaryClip(givedweapon, Clip);
										
										CPrintToChat(client, "%s : Vous avez voler l'arme de %N. (Arme: %s)", g_bPrefix, Ent, WeaponName);
										CPrintToChat(Ent, "%s : Quelqu'un vous a voler une arme.", g_bPrefix);
										
										decl Float:vec[3];
										GetClientAbsOrigin(client, vec);
										vec[2] += 5;
										
										TE_SetupBeamRingPoint(vec, 5.0, 800.0, g_modelLaser, g_modelHalo, 0, 15, 0.6, 20.0, 0.5, ColorPick, 10, 0);
										TE_SendToAll();
										TE_SetupBeamRingPoint(vec, 5.0, 800.0, g_modelLaser, g_modelHalo, 0, 15, 0.6, 20.0, 0.5, ColorPick, 10, 0);
										TE_SendToAll();
									}
								}
								else
								{
									CPrintToChat(client, "%s : Vous ne pouvez pas volé un couteau.", g_bPrefix);
								}
							}
							else
							{
								CPrintToChat(client, "%s : Ce joueur n'a aucune arme dans les mains.", g_bPrefix);
							}
						}
						else
						{
							CPrintToChat(client, "%s : Vous êtes trop loin du joueur.", g_bPrefix);
						}
					}
					else
					{
						CPrintToChat(client, "%s : Vous ne pouvez pas volé votre collègue.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous devez viser un joueur.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Tu ne peux pas volé en prison.", g_bPrefix);
			}

		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Giveitem(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsNotInJail(client)) {
			BuildGiveItemMenu(client);
		}
	}
	
	return Plugin_Handled;
}

Handle:BuildGiveItemMenu(client)
{
	decl String:buffer[128];
	decl String:path[1000];
	
	new Handle:Item = CreateMenu(Menu_GiveItem);
	SetMenuTitle(Item, "Les objets que vous pouvez sortir de votre sac :");
	
	Format(path, sizeof(path), "addons/sourcemod/configs/roleplay/players/%i.txt", playerIds[client]);

	KeyValues kv = new KeyValues("Inventory");
	kv.ImportFromFile(path);

	if (!kv.GotoFirstSubKey())
	{
		return Item;
	}

	do
	{
		new show_in_inventory = kv.GetNum("show_in_inventory", 0);
		if (show_in_inventory) {
			new quantity = kv.GetNum("quantity", 0);
			if (quantity > 0) {
				decl String:ItemName[128];
			   	decl String:ItemID[128];
			   	decl String:ItemNameDisplay[128];
				KvGetSectionName(kv, ItemID, sizeof(ItemID));
				g_kvItems.JumpToKey(ItemID, true);
				g_kvItems.GetString("item_name", ItemName, sizeof(ItemName));
				Format(ItemNameDisplay, sizeof(ItemNameDisplay), "%s", ItemName);
				Format(ItemName, sizeof(ItemName), "%s_%s", ItemID, ItemName);
				Format(buffer, sizeof(buffer), "%s (Quantité: %i)", ItemNameDisplay, quantity);
				AddMenuItem(Item, ItemName, buffer);
				g_kvItems.Rewind();
			}
		}
	} while (kv.GotoNextKey());

	delete kv;
	g_kvItems.Rewind();
	
	DisplayMenu(Item, client, MENU_TIME_FOREVER);
	return Item;
}

public Menu_GiveItem(Handle:Item, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select) {
		new String:itemUsed[64];
		decl String:Buffer[12][64];
		GetMenuItem(Item, param2, itemUsed, sizeof(itemUsed));

		PrintToServer("Option : %s", Buffer);
			
		ExplodeString(itemUsed, "_", Buffer, 2, 64);
			
		new itemID = StringToInt(Buffer[0]);
		strcopy(itemUsed, sizeof(itemUsed), Buffer[1]);
		if (IsValidAndAlive(client)) {
			new ent;
						
			if((ent = CreateEntityByName("prop_physics")) != -1)
			{
				new Float:origin[3];
				GetClientEyePosition(client, origin);
							
				TeleportEntity(ent, origin, NULL_VECTOR, NULL_VECTOR);
							
				decl String:TargetName[32];
				Format(TargetName, sizeof(TargetName), "item_%i_%s", itemID, itemUsed);
							
				DispatchKeyValue(ent, "model", MODELS_CASE);
				DispatchKeyValue(ent, "physicsmode", "2");
				DispatchKeyValue(ent, "massScale", "8.0");
				DispatchKeyValue(ent, "targetname", TargetName);
				DispatchSpawn(ent);
							
				SetEntityMoveType(ent, MOVETYPE_VPHYSICS);
							
				SetEntProp(ent, Prop_Send, "m_usSolidFlags", 8);
				SetEntProp(ent, Prop_Send, "m_CollisionGroup", 11);
				RemoveFromInventory(client, itemID, itemUsed, 1);
				CPrintToChat(client, "%s : Vous avez sorti : {olive}%s{default} de votre sac.", g_bPrefix, itemUsed);
				BuildGiveItemMenu(client);
			}
		} 
		else {
			if (action == MenuAction_End) {
				CloseHandle(Item);
			}
		}
	}
}

public OnStartTouch(ent, client)
{
	if (ent != -1 && IsValidEntity(ent) && IsValid(client))
	{
		AcceptEntityInput(ent, "Kill");
	
		new random = GetRandomInt(1, 400);
	
		money[client] += random;
	
		CPrintToChat(client, "%s : Vous avez ramassé un cadeau comprenant {green}%i€.", g_bPrefix, random);
		CPrintToChatAll("%s : Le cadeau viens d'être ramassé par{blue} %N{green} il contenait{blue} %i€.", g_bPrefixEvent, client, random);
	}
}


public Action:Command_Item(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsNotInJail(client)) {
			BuildItemMenu(client);
		}
	}
	
	return Plugin_Handled;
}

Handle:BuildItemMenu(client)
{
	decl String:buffer[128];
	decl String:path[1000];
	
	new Handle:Item = CreateMenu(Menu_Item);
	SetMenuTitle(Item, "Votre inventaire :");
	
	Format(path, sizeof(path), "addons/sourcemod/configs/roleplay/players/%i.txt", playerIds[client]);

	KeyValues kv = new KeyValues("Inventory");
	kv.ImportFromFile(path);

	if (!kv.GotoFirstSubKey())
	{
		return Item;
	}

	do
	{
		new showInInventory = kv.GetNum("show_in_inventory", 0);
		if (showInInventory) {
			new quantity = kv.GetNum("quantity", 0);
			if (quantity > 0) {
				decl String:ItemName[128];
			   	decl String:ItemID[128];
			   	decl String:ItemNameDisplay[128];
				KvGetSectionName(kv, ItemID, sizeof(ItemID));
				g_kvItems.JumpToKey(ItemID, true);
				g_kvItems.GetString("item_name", ItemName, sizeof(ItemName));
				Format(ItemNameDisplay, sizeof(ItemNameDisplay), "%s", ItemName);
				Format(ItemName, sizeof(ItemName), "%s_%s", ItemID, ItemName);
				Format(buffer, sizeof(buffer), "%s (Quantité: %i)", ItemNameDisplay, quantity);
				AddMenuItem(Item, ItemName, buffer);
				g_kvItems.Rewind();
			}
		}
		
	} while (kv.GotoNextKey());

	delete kv;
	g_kvItems.Rewind();
	
	DisplayMenu(Item, client, MENU_TIME_FOREVER);
	return Item;
}

public Menu_Item(Handle:Item, MenuAction:action, client, param2)
{
	new String:itemUsed[64];
	decl String:Buffer[12][64];
	GetMenuItem(Item, param2, itemUsed, sizeof(itemUsed));
		
	ExplodeString(itemUsed, "_", Buffer, 2, 64);
		
	new itemID = StringToInt(Buffer[0]);
	strcopy(itemUsed, sizeof(itemUsed), Buffer[1]);
	if (IsValidAndAlive(client))
	{
		switch (itemID) {
			case 1:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				SetDrogue(client, 6, 6, TIME_CHAMPIGNONS);
				CPrintToChat(client, "%s : Vous avez utilisé des {olive}%s{default}.", g_bPrefix, itemUsed);
			}
			case 2:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				SetDrogue(client, 4, 4, TIME_METH);
				CPrintToChat(client, "%s : Vous avez utilisé des {olive}%s{default}.", g_bPrefix, itemUsed);
			}
			case 18:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				SetDrogue(client, 1, 1, TIME_SHIT);
				CPrintToChat(client, "%s : Vous avez utilisé des {olive}%s{default}.", g_bPrefix, itemUsed);
			}
			case 19:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				SetDrogue(client, 2, 2, TIME_COCAINE);
				CPrintToChat(client, "%s : Vous avez utilisé des {olive}%s{default}.", g_bPrefix, itemUsed);
			}
			case 4:
			{
				if (LockPickDoor(client, false)) {
					RemoveFromInventory(client, itemID, itemUsed, 1);
					CPrintToChat(client, "%s : Vous être entrain de forcer une porte avec votre {red}%s{default}.", g_bPrefix, itemUsed);
				}
			}
			case 5:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_ak47", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 7:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_m4a1", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 8:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_m3", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 9:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_scout", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 10:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_awp", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 11:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_aug", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 12:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_glock", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 13:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_usp", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 14:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_deagle", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 15:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				Client_GiveWeaponAndAmmo(client, "weapon_fiveseven", true, 0);
				CPrintToChat(client, "%s : Vous venez de sortir votre {red}%s{default}.", g_bPrefix, itemUsed);
			}
			case 16:
			{
				ElectronicLock(client);
			}
			case 17:
			{
				if (LockPickDoor(client, true)) {
					RemoveFromInventory(client, itemID, itemUsed, 1);
					CPrintToChat(client, "%s : Vous être entrain de forcer une porte avec votre {red}%s{default}.", g_bPrefix, itemUsed);
				}				
			}
			case 20:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				SetEntProp(client, Prop_Send, "m_bHasNightVision", 1);
				CPrintToChat(client, "%s : Vous êtes équipé de {red}%s{default}.", g_bPrefix, itemUsed);				
			}
			case 22:
			{
				RemoveFromInventory(client, itemID, itemUsed, 1);
				BuildPCMenu(client, true);
				CPrintToChat(client, "%s : Vous avez utiliser une {red}%s{default}. {red}Attention ! Ceci est à usage unique{default}.", g_bPrefix, itemUsed);				
			}
			case 24:
			{
				if (ApplyCardSkimmer(client)) {
					RemoveFromInventory(client, itemID, itemUsed, 1);
				}		
			}
			case 6:
			{
				if (ReloadWeaponAmmos(client)) {
					RemoveFromInventory(client, itemID, itemUsed, 1);
					CPrintToChat(client, "%s : Vous venez d'utiliser des {olive}%s{default}.", g_bPrefix, itemUsed);
				}
			}
		}
	}
}

public ApplyCardSkimmer (client) {
	if (!crochetageon[client]) {
		Entiter[client] = GetClientAimTarget(client, false);
				
		new String:name[200];
		Entity_GetName(Entiter[client], name, sizeof(name));
					
		if (Entiter[client] != -1) {
			if (StrEqual(name, "distributeur")) {
				crochetageon[client] = true;
				SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
				SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 10);
				g_croche[client] = CreateTimer(10.0, Timer_SetCardSkimmer, client, TIMER_REPEAT);
				SetEntityRenderColor(client, 255, 0, 0, 0);
				SetEntityMoveType(client, MOVETYPE_NONE);
				return true;
			} else if (StrContains(name, "hacked_distributeur_") != -1) {
				CPrintToChat(client, "%s : Un {red}dispositif Card Skimmer{default} est déjà installé sur ce distributeur.", g_bPrefix);
			} else {
				CPrintToChat(client, "%s : Vous devez faire face à un {olive}distributeur{default}.", g_bPrefix);
			}
		} else {
			CPrintToChat(client, "%s : Vous devez faire face à un {olive}distributeur{default}.", g_bPrefix);
		}
	}
	return false;
}

public Action:Timer_SetCardSkimmer(Handle:timer, any:client)
{
	if (IsValidAndAlive(client))
	{
		new String:name[200];
		new String:newDistribName[250];
		Entity_GetName(Entiter[client], name, sizeof(name));
		if (StrEqual(name, "distributeur")) {
			Format(newDistribName, sizeof(newDistribName), "hacked_distributeur_%i_%i", client, playerIds[client]);
			DispatchKeyValue(Entiter[client], "targetname", newDistribName);
			CPrintToChat(client, "%s : Vous avez placer le {red}dispositif Card Skimmer{default} sur le distributeur avec succès !", g_bPrefix);
		} else {
			CPrintToChat(client, "%s : Un {red}dispositif Card Skimmer{default} est déjà installé sur ce distributeur.", g_bPrefix);
		}
		
		SetEntityMoveType(client, MOVETYPE_WALK);
		SetEntityRenderColor(client, 255, 255, 255, 255);
	
		crochetageon[client] = false;
		
		SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
		SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 0);
		
		KillTimer(g_croche[client]);
	}
}

public ReloadWeaponAmmos (client) {
	decl String:WeaponName[32];
	Client_GetActiveWeaponName(client, WeaponName, sizeof(WeaponName));
						
	new weapon = Client_GetActiveWeapon(client);
						
	if (weapon != -1)
	{
		if (!StrEqual(WeaponName, "weapon_knife"))
		{
			RemoveEdict(weapon);
			GivePlayerItem(client, WeaponName);
			return true;
		}
		else
		{
			CPrintToChat(client, "%s : Vous devez porter une {red}arme à feu{default} pour utiliser ces {olive}munitions{default} !", g_bPrefix);
			return false;
		}
	}

	return false;
}

public LockPickDoor (client, isKit) {
	if (isKit) {
		if (!IsMafia(client)) {
			CPrintToChat(client, "%s : Vous devez être mafieux pour utilisé cet objet.", g_bPrefix);
			return false;
		}
	}
	if (!crochetageon[client])
	{
		new String:Door[255];
		
		Entiter[client] = GetClientAimTarget(client, false);
		
		if (Entiter[client] != -1)
		{
			GetEdictClassname(Entiter[client], Door, sizeof(Door));
			
			if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
			{
				new HammerID = Entity_GetHammerId(Entiter[client]);
				decl String:hammerIdBuffer[40];
				IntToString(HammerID, hammerIdBuffer, sizeof(hammerIdBuffer));
				new doorKeyCode = GetDoorKeyCode(hammerIdBuffer);
				if (doorKeyCode != -1 && doorKeyCode != -2) {
					CPrintToChat(client, "%s : Vous ne {red}pouvez pas{default} forcer cette porte car elle est équipée d'une {olive}serrure électronique{default} !", g_bPrefix);
					return false;
				}
				if (Entity_IsLocked(Entiter[client]))
				{
					new timestamp;
					timestamp = GetTime();
					
					if ((timestamp - crochetage[client]) < 20)
					{
						CPrintToChat(client, "%s : Vous devez attendre %i secondes avant de pouvoir crocheté une porte.", g_bPrefix, (20 - (timestamp - crochetage[client])) );
					}
					else
					{
						new Float:entorigin[3], Float:clientent[3];
						GetEntPropVector(Entiter[client], Prop_Send, "m_vecOrigin", entorigin);
						GetEntPropVector(client, Prop_Send, "m_vecOrigin", clientent);
						new Float:distance = GetVectorDistance(entorigin, clientent);
						new Float:vec[3];
						GetClientAbsOrigin(client, vec);
						vec[2] += 10;

						if (distance > 80)
						{
							CPrintToChat(client, "%s : Vous êtes trop loin pour crocheter cette porte.", g_bPrefix);
						}
						else
						{
							crochetage[client] = GetTime();
							
							SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
							SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 8);
							
							g_croche[client] = CreateTimer(8.0, TimerCrochetage, client, TIMER_REPEAT);
							
							SetEntityRenderColor(client, 255, 0, 0, 0);
							SetEntityMoveType(client, MOVETYPE_NONE);
							
							TE_SetupBeamRingPoint(vec, 5.0, 800.0, g_modelLaser, g_modelHalo, 0, 15, 0.6, 15.0, 0.0, ColorCrochetage, 10, 0);
							TE_SendToAll();
							
							CPrintToChat(client, "%s : Vous crochetez la porte.", g_bPrefix);
							CPrintToChat(client, "%s : Vous avez utilisé un {green}kit de crochetage.", g_bPrefix);
														
							crochetageon[client] = true;
							return true;
						}
					}
				}
				else
				{
					CPrintToChat(client, "%s : La porte est déjà ouverte.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Veuillez visé une porte.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Veuillez visé une porte.", g_bPrefix);
		}
	}
	else
	{
		CPrintToChat(client, "%s : Vous êtes déjà en train de crocheté.", g_bPrefix);
	}

	return false;
}

public ElectronicLock (client) {
	decl entity;
	entity = GetClientAimTarget(client, false);
		
	if (entity != -1)
	{
		decl String:Door[255];
		GetEdictClassname(entity, Door, sizeof(Door));
				
		if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
		{
			new HammerID = Entity_GetHammerId(entity);
			decl String:HammerId[255];
			IntToString(HammerID, HammerId, sizeof(HammerId));
			if (IsProperty(client, HammerId)) {
				if (GetDoorKeyCode(HammerId) == -1) {
					BuildKeypadMenu(client, HammerId);
				} else {
					CPrintToChat(client, "%s : Cette porte possède déjà une {olive}serrure électronique{default} !", g_bPrefix);
					return false;
				}
			} else {
				CPrintToChat(client, "%s : Vous ne {red}pouvez pas{default} mettre de {olive}serrure électronique{default} sur cette porte car elle ne vous appartient pas !", g_bPrefix);
				return false;
			}
		} else {
			CPrintToChat(client, "%s : Vous ne {red}pouvez pas{default} mettre de {olive}serrure électronique{default} sur ça !", g_bPrefix);
			return false;
		}
	}

	return false;
}

public IsProperty (client, String:HammerID[]) {
	KeyValues kv = new KeyValues("DoorGroups");
	kv.ImportFromFile("addons/sourcemod/configs/roleplay/doorGroups.txt");
	
	if (kv.JumpToKey(HammerID)) {
		decl String:ownerSteamId[30];
		kv.GetString("owner", ownerSteamId, sizeof(ownerSteamId));
		new String:SteamId[32];
		GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));

		if (StrEqual(ownerSteamId, SteamId, false)) {
			return true;
		} else {
			CPrintToChat(client, "%s : Cette porte ne vous {red}appartient pas{default} !", g_bPrefix);
			return false;
		}
	}

	return false;
}

public GetDoorKeyCode (String:HammerID[]) {
	KeyValues kv = new KeyValues("DoorGroups");
	kv.ImportFromFile("addons/sourcemod/configs/roleplay/doorGroups.txt");
	
	if (kv.JumpToKey(HammerID)) {
		new keyCode = kv.GetNum("door_keycode", -1);
		return keyCode;
	}
	
	return -2;	
}

public GetDoorsJob (String:HammerID[]) {
	KeyValues kv = new KeyValues("DoorGroups");
	kv.ImportFromFile("addons/sourcemod/configs/roleplay/doorGroups.txt");
	
	if (kv.JumpToKey(HammerID)) {
		new job_id = kv.GetNum("job_id", 1);
		if (job_id == 1) {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

Handle:BuildKeypadMenu(client, String:HammerID[])
{	
	new Handle:Keypad = CreateMenu(Menu_Keypad);
	SetMenuTitle(Keypad, "Définissez votre code :");
	
	for (new i = 1; i < 10; i++) {
		decl String:buffer[128];
		decl String:displayName[128];
		Format(displayName, sizeof(displayName), "%i", i);
		Format(buffer, sizeof(buffer), "%s_%i", HammerID, i);
		AddMenuItem(Keypad, buffer, displayName);
	}

	decl String:buffer[128];
	decl String:displayName[128];
	Format(displayName, sizeof(displayName), "%i", 0);
	Format(buffer, sizeof(buffer), "%s_%i", HammerID, 0);
	AddMenuItem(Keypad, buffer, displayName);
	
	DisplayMenu(Keypad, client, MENU_TIME_FOREVER);
	return Keypad;
}

public Menu_Keypad(Handle:menu, MenuAction:action, client, param2)
{
	decl String:info[64];
	decl String:hammerID[64];
	decl String:Buffer[12][64];

	GetMenuItem(menu, param2, info, sizeof(info));
		
	ExplodeString(info, "_", Buffer, 2, 64);
	hammerID = Buffer[0];
	decl String:keyCode[64];
	keyCode = Buffer[1];
	if (action == MenuAction_Select)
	{				
		if (strlen(keyCode) >= 4) {
			if (SetKeyCode(hammerID, StringToInt(keyCode), client)) {
				CloseHandle(menu);
				CPrintToChat(client, "%s : Vous avez équipé cette porte d'une {olive}serrure électronique{default} avec le code : {red}%s{default} !", g_bPrefix, keyCode);
				return menu;
			}
		} else {
			new Handle:keyPadCode = CreateMenu(Menu_Keypad);
			decl String:title[64];
			Format(title, sizeof(title), "Définissez votre code - %s :", keyCode);
			SetMenuTitle(keyPadCode, title);
			for (new i = 1; i < 10; i++) {
				decl String:buffer[128];
				decl String:displayName[128];
				Format(buffer, sizeof(buffer), "%s%i", info, i);
				Format(displayName, sizeof(displayName), "%i", i);
				AddMenuItem(keyPadCode, buffer, displayName);
			}
			decl String:buffer[128];
			decl String:displayName[128];
			Format(buffer, sizeof(buffer), "%s%i", info, 0);
			Format(displayName, sizeof(displayName), "%i", 0);
			AddMenuItem(keyPadCode, buffer, displayName);
			DisplayMenu(keyPadCode, client, MENU_TIME_FOREVER);
		}
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(menu);
		}
	}

	return menu;
}

public SetKeyCode (String:HammerID[], keyCode, client) {
	decl String:buffer[300];
	Format(buffer, sizeof(buffer),"UPDATE doors SET keycode = '%i' WHERE hammer_id = '%i'", keyCode, StringToInt(HammerID));
	PrintToServer("request : %s", buffer);
	SQL_TQuery(g_ThreadedHandle, CallbackSetKeyCode, buffer, client);
	return true;
}

public CallbackSetKeyCode(Handle:owner, Handle:hndl, const String:error[], any:client)
{
	PrintToServer("error : %s", error);
	if (hndl == null)
	{
	} else {
		RemoveFromInventory(client, 16, "Serrure electronique", 1);
		ReloadDoorsKV();
	}
}

Handle:BuildKeypadTypeMenu(client, String:HammerID[], doorCode)
{	
	new Handle:Keypad = CreateMenu(Menu_TypeKeypad);
	SetMenuTitle(Keypad, "Saisissez le code de la porte :");
	
	for (new i = 1; i < 10; i++) {
		decl String:buffer[128];
		decl String:displayName[128];
		Format(displayName, sizeof(displayName), "%i", i);
		Format(buffer, sizeof(buffer), "%s_%i_%i", HammerID, doorCode, i);
		AddMenuItem(Keypad, buffer, displayName);
	}
	decl String:buffer[128];
	decl String:displayName[128];
	Format(displayName, sizeof(displayName), "%i", 0);
	Format(buffer, sizeof(buffer), "%s_%i_%i", HammerID, doorCode, 0);
	AddMenuItem(Keypad, buffer, displayName);
	
	DisplayMenu(Keypad, client, MENU_TIME_FOREVER);
	return Keypad;
}

public Menu_TypeKeypad(Handle:menu, MenuAction:action, client, param2)
{
	decl String:info[64];
	decl String:hammerID[64];
	decl String:Buffer[12][64];
	decl String:keyCode[64];
	decl String:doorCode[64];

	GetMenuItem(menu, param2, info, sizeof(info));
		
	ExplodeString(info, "_", Buffer, 3, 64);
	hammerID = Buffer[0];
	doorCode = Buffer[1];
	keyCode = Buffer[2];
	if (action == MenuAction_Select)
	{				
		if (strlen(keyCode) >= 4) {
			if (StringToInt(keyCode) == StringToInt(doorCode)) {
				new Ent;

				Ent = GetClientAimTarget(client, false);
				if (Ent != -1) {
					new String:Door[255];
					GetEdictClassname(Ent, Door, sizeof(Door));
					if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
					{
						new HammerID = Entity_GetHammerId(Ent);
						if (HammerID == StringToInt(hammerID)) {
							if (Entity_IsLocked(Ent))
							{
								unlockdoor(Ent, client);
							} else {
								lockdoor(Ent, client);
							}
						} else {
							CPrintToChat(client, "%s : Vous devez faire face à la {olive}porte{default} que vous essayer d'ouvrir !", g_bPrefix);
						}
					} else {
						CPrintToChat(client, "%s : Vous devez faire face à une {olive}porte{default} !", g_bPrefix);
					}
				} else {
					CPrintToChat(client, "%s : Vous devez faire face à la {olive}porte{default} !", g_bPrefix);
				}
			} else {
				CPrintToChat(client, "%s : Le code que vous avez saisis est {red}erroné{default} !", g_bPrefix);
			}
			CloseHandle(menu);
			return menu;
		} else {
			new Handle:keyPadCode = CreateMenu(Menu_TypeKeypad);
			decl String:title[64];
			Format(title, sizeof(title), "Saisissez le code de la porte - %s :", keyCode);
			SetMenuTitle(keyPadCode, title);
			for (new i = 1; i < 10; i++) {
				decl String:buffer[128];
				decl String:displayName[128];
				Format(buffer, sizeof(buffer), "%s%i", info, i);
				Format(displayName, sizeof(displayName), "%i", i);
				AddMenuItem(keyPadCode, buffer, displayName);
			}
			decl String:buffer[128];
			decl String:displayName[128];
			Format(buffer, sizeof(buffer), "%s%i", info, 0);
			Format(displayName, sizeof(displayName), "%i", 0);
			AddMenuItem(keyPadCode, buffer, displayName);
			DisplayMenu(keyPadCode, client, MENU_TIME_FOREVER);
		}
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(menu);
		}
	}

	return menu;
}

public Action:TimerCrochetage(Handle:timer, any:client)
{
	if (IsValidAndAlive(client))
	{
		new String:Door[255];
	
		if (Entiter[client] != -1)
		{
			GetEdictClassname(Entiter[client], Door, sizeof(Door));
			new maxChance = 9;
			if (IsMafia(client)) {
				maxChance = 6;
			}
			new odds = GetRandomInt(1, maxChance);
			if (odds <= 4) {
				if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
				{
					CPrintToChat(client, "%s : Vous avez crocheter la porte avec succès.", g_bPrefix);
						
					Entity_UnLock(Entiter[client]);
						
					AcceptEntityInput(Entiter[client], "Toggle", client, client);
				}
				else
				{
					CPrintToChat(client, "%s : Vous devez viser la porte, réessayez !", g_bPrefix);
				}
			} else {
				if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
				{
					CPrintToChat(client, "%s : Vous avez échoué le crochetage.", g_bPrefix);
				}
			}
			
			SetEntityMoveType(client, MOVETYPE_WALK);
			SetEntityRenderColor(client, 255, 255, 255, 255);
		
			crochetageon[client] = false;
			
			SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
			SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 0);
		
			if (g_croche[client] != INVALID_HANDLE)
			{
				KillTimer(g_croche[client]);
				g_croche[client] = INVALID_HANDLE;
			}
		}
	}
}

public Action:Timer_Kit(Handle:timer, any:client)
{
	if (IsValidAndAlive(client))
	{

		SaveInventory(client, 17, "Kit de crochetage", 1);
		
		OnCreationKit[client] = false;
		
		SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime()); 
		SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 0); 
		
		SetEntityRenderColor(client, 255, 255, 255, 255);
		SetEntityMoveType(client, MOVETYPE_WALK);
		CPrintToChat(client, "%s : Vous avez pris un kit de crochetage [%i/%d].", g_bPrefix, GetItemInInventory(17, client), LIMIT_KIT);
	}
}

public IsNotInJail (client) {
	return jailtime[client] <= 0;
}

public IsClientInJail (client) {
	return IsInJail[client];
}

public setClientInJail (client, isInJail) {
	IsInJail[client] = isInJail;
}

public Action:Command_Autosell(client, args) {
	if (IsValidAndAlive(client)) {
		if (IsNotInJail(client)) {
			BuildAutoSellMenu(client);
			PrintToServer("Performed autosell !");
		}
	}
	return Plugin_Handled;
}

Handle:BuildAutoSellMenu(client)
{
	decl String:Buffer[128];
	new i = 0;
	new Handle:menu = CreateMenu(Menu_Autosell);
	
	SetMenuTitle(menu, "Choisis le produit a vendre :");
	if (!g_kvItems.GotoFirstSubKey())
	{
		return menu;
	}
	do
	{
		new job_id = g_kvItems.GetNum("seller_job_id", -1);
		if (job_id == jobid[client]) {
			new price = g_kvItems.GetNum("price", 10);
			decl String:ItemName[128];
			decl String:ItemID[128];
			KvGetSectionName(g_kvItems, ItemID, sizeof(ItemID));
			g_kvItems.GetString("item_name", ItemName, sizeof(ItemName));
			new id = StringToInt(ItemID);
			Format(ItemName, sizeof(ItemName), "%s", ItemName);
			Format(Buffer, sizeof(Buffer), "%i_%i_%s", id, price, ItemName);
			AddMenuItem(menu, Buffer, ItemName);
			i++;
		}
	} while (g_kvItems.GotoNextKey());
	g_kvItems.Rewind();
	
	DisplayMenu(menu, client, 30);
	return menu;
}

public Menu_Autosell(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[64];
		
		new Price = 0;
		new id = 0;
		decl String:ItemID[64];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		
		decl String:Buffer[12][64];
		
		ExplodeString(info, "_", Buffer, 3, 64);
		
		id = StringToInt(Buffer[0]);
		Price = StringToInt(Buffer[1]);
		strcopy(ItemID, sizeof(ItemID), Buffer[2]);
		
		decl String:Quantite[128];
		
		new Handle:sell_menuQuantity = CreateMenu(Menu_AutosellPlayer);
		SetMenuTitle(sell_menuQuantity, "Choisissez la quantité :");
		
		Format(Quantite, sizeof(Quantite), "%i_%i_%s_1", id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "1");
		
		Format(Quantite, sizeof(Quantite), "%i_%i_%s_5", id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "5");
			
		Format(Quantite, sizeof(Quantite), "%i_%i_%s_10", id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "10");
		
		Format(Quantite, sizeof(Quantite), "%i_%i_%s_25", id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "25");
			
		Format(Quantite, sizeof(Quantite), "%i_%i_%s_50", id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "50");
			
		Format(Quantite, sizeof(Quantite), "%i_%i_%s_100", id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "100");
		
		DisplayMenu(sell_menuQuantity, client, MENU_TIME_FOREVER);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(menu);
		}
	}
}

public Menu_AutosellPlayer(Handle:sell_menuPlayer, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[64];
		
		new QuantityItem;
		decl String:ItemName[64];
		new PriceFinal;
		new ItemID;
		
		GetMenuItem(sell_menuPlayer, param2, info, sizeof(info));
		
		decl String:Buffer[20][64];
		ExplodeString(info, "_", Buffer, 4, 64);
		
		ItemID = StringToInt(Buffer[0]);
		strcopy(ItemName, sizeof(ItemName), Buffer[2]);
		QuantityItem = StringToInt(Buffer[3]);
		PriceFinal = StringToInt(Buffer[1]) * QuantityItem;

		AutoSell(client, ItemID, ItemName, QuantityItem, PriceFinal);
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(sell_menuPlayer);
	}
}

AutoSell(client, ItemID, String:item[], Quantity, Cost)
{
	new autoSellCost = Cost/2;
	
	if (MakeTransaction(client, client, -autoSellCost, Quantity, ItemID))
	{
		MakeTransaction(client, client, autoSellCost/2, Quantity, ItemID);

		CPrintToChat(client, "%s : Vous avez acheté %s (Quantité: %i) pour %i€", g_bPrefix, item, Quantity, autoSellCost);
		SaveInventory(client, ItemID, item, Quantity);

		return 1;
	}
	else
	{
		CPrintToChat(client, "%s : Vous n'avez pas l'argent nécessaire pour finaliser la transaction.", g_bPrefix);
	}
	
	return 0;
}

SaveInventory (client, ItemID, String:item[], Quantity) {
	decl String:buffer[2048];
	decl String:path[1000];
	decl String:ID[150];
	decl String:cs_weapon_id[150];
	new show_in_inventory = 0;
	
	Format(path, sizeof(path), "addons/sourcemod/configs/roleplay/players/%i.txt", playerIds[client]);
	PrintToServer("Generate file for steamID : %i", playerIds[client]);
	IntToString(ItemID, ID, sizeof(ID));

	KeyValues kvItems = new KeyValues("Items");
	kvItems.ImportFromFile("addons/sourcemod/configs/roleplay/items.txt");
	kvItems.JumpToKey(ID, true);
	show_in_inventory = kvItems.GetNum("show_in_inventory", 0);
	kvItems.GetString("cs_weapon_id", cs_weapon_id, sizeof(cs_weapon_id));
	kvItems.Rewind();
	delete kvItems;

	KeyValues kv = new KeyValues("Inventory");
	kv.ImportFromFile(path);
	kv.JumpToKey(ID, true);
	Quantity += kv.GetNum("quantity", 0);
	kv.SetNum("show_in_inventory", show_in_inventory);
	kv.SetString("cs_weapon_id", cs_weapon_id);

	kv.SetNum("quantity", Quantity);
	kv.SetString("item_name", item);
	kv.Rewind();
	kv.ExportToFile(path);
	delete kv;
	Format(buffer, sizeof(buffer),"DELETE FROM inventory WHERE player_id = '%i' AND item_id = '%i'", playerIds[client], ItemID);
	SQL_TQuery(g_ThreadedHandle, CallbackSaveInventory, buffer, client);
	Format(buffer, sizeof(buffer),"INSERT INTO inventory(player_id, item_id, quantity) VALUES ('%i', '%i', '%i')", playerIds[client], ItemID, Quantity);
	SQL_TQuery(g_ThreadedHandle, CallbackSaveInventory, buffer, client);
}

RemoveFromInventory (client, ItemID, String:item[], Quantity) {
	decl String:buffer[2048];
	decl String:path[1000];
	decl String:ID[150];
	
	Format(path, sizeof(path), "addons/sourcemod/configs/roleplay/players/%i.txt", playerIds[client]);
	PrintToServer("Generate file for steamID : %i", playerIds[client]);
	IntToString(ItemID, ID, sizeof(ID));

	KeyValues kv = new KeyValues("Inventory");
	kv.ImportFromFile(path);
	kv.JumpToKey(ID, true);
	Quantity = kv.GetNum("quantity", 0) - Quantity;
	kv.SetNum("quantity", Quantity);
	kv.SetString("item_name", item);
	kv.Rewind();
	kv.ExportToFile(path);
	delete kv;
	Format(buffer, sizeof(buffer),"DELETE FROM inventory WHERE player_id = '%i' AND item_id = '%i'", playerIds[client], ItemID);
	SQL_TQuery(g_ThreadedHandle, CallbackSaveInventory, buffer, client);
	Format(buffer, sizeof(buffer),"INSERT INTO inventory(player_id, item_id, quantity) VALUES ('%i', '%i', '%i')", playerIds[client], ItemID, Quantity);
	SQL_TQuery(g_ThreadedHandle, CallbackSaveInventory, buffer, client);
}

public CallbackSaveInventory(Handle:owner, Handle:hndl, const String:error[], any:client)
{
	PrintToServer("error : %s", error);
	if (hndl == null)
	{
		PrintToServer("Failed to query from save Inventory (error: %s)", error);
	} else {
		PrintToServer("Success !");
	}
}

public CallbackSaveAccounting(Handle:owner, Handle:hndl, const String:error[], any:client)
{
	PrintToServer("error : %s", error);
	if (hndl == null)
	{
		PrintToServer("Failed to query from save Accounting (error: %s)", error);
	} else {
		PrintToServer("Success accounting !");
	}
}

public CallbackUpdateSalary(Handle:owner, Handle:hndl, const String:error[], any:client)
{
	PrintToServer("error : %s", error);
	if (hndl == null)
	{
		PrintToServer("Failed to query from save Accounting (error: %s)", error);
	} else {
		PrintToServer("Success set salary !");
	}
}

public Action:Command_Sellactivities(client, args) 
{ 
	if (IsValidAndAlive(client))
	{
		if (jailtime[client] <= 0)
		{
			new BuyerIndex = GetClientAimTarget(client, true); 
			
			if (BuyerIndex != -1)
			{
				BuildSellActivityMenu(client, BuyerIndex);
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez viser un joueur", g_bPrefix);
			}
		}
		else 
		{
			CPrintToChat(client, "%s : Vous ne pouvez pas vendre en jail.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

Handle:BuildSellActivityMenu(client, Player)
{
	decl String:Buffer[128];
	
	new Handle:menu = CreateMenu(Menu_SellActivity);
		
	SetMenuTitle(menu, "Choisis le produit a vendre :");

	new i = 0;
	if (!g_kvActivities.GotoFirstSubKey())
	{
		return menu;
	}
	do
	{
		new job_id = g_kvActivities.GetNum("seller_job_id", -1);
		new rank_id = g_kvActivities.GetNum("seller_rank_id", -1);
		if (job_id == GetClientJobID(client)) {
			if (rank_id != -1) {
				if (rank_id == GetClientRankID(client)) {
					new price = g_kvActivities.GetNum("price", 10);
					decl String:ItemName[128];
					decl String:ItemID[128];
					KvGetSectionName(g_kvActivities, ItemID, sizeof(ItemID));
					g_kvActivities.GetString("activity_name", ItemName, sizeof(ItemName));
					new id = StringToInt(ItemID);
					Format(ItemName, sizeof(ItemName), "%s", ItemName);
					Format(Buffer, sizeof(Buffer), "%i_%i_%i_%s", Player, id, price, ItemName);
					AddMenuItem(menu, Buffer, ItemName);
					i++;
				}
			} else {
				new price = g_kvActivities.GetNum("price", 10);
				decl String:ItemName[128];
				decl String:ItemID[128];
				KvGetSectionName(g_kvActivities, ItemID, sizeof(ItemID));
				g_kvActivities.GetString("activity_name", ItemName, sizeof(ItemName));
				new id = StringToInt(ItemID);
				Format(ItemName, sizeof(ItemName), "%s", ItemName);
				Format(Buffer, sizeof(Buffer), "%i_%i_%i_%s", Player, id, price, ItemName);
				AddMenuItem(menu, Buffer, ItemName);
				i++;
			}
		}
	} while (g_kvActivities.GotoNextKey());
	g_kvActivities.Rewind();
		
	DisplayMenu(menu, client, 30);
	return menu;
}

public Menu_SellActivity(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[64];
		
		new SellPlayerID = 0;
		new Price = 0;
		new id = 0;
		decl String:ItemID[64];
				
		GetMenuItem(menu, param2, info, sizeof(info));
		
		decl String:Buffer[16][64];
		ExplodeString(info, "_", Buffer, 4, 64);

		SellPlayerID = StringToInt(Buffer[0]);
		id = StringToInt(Buffer[1]);
		strcopy(ItemID, sizeof(ItemID), Buffer[3]);
		Price = StringToInt(Buffer[2]);
		
		
		decl String:Choix[32];
		decl String:TEXT[32];
		
		new Handle:sell_menuPlayer = CreateMenu(Menu_SellActivityPlayer);
		
		if (SellPlayerID != client)
		{
			SetMenuTitle(sell_menuPlayer, "%N vous propose de vous vendre %s", client, ItemID);
		}
		
		Format(TEXT, sizeof(TEXT), "Prix : %i€", Price);
		AddMenuItem(sell_menuPlayer, "", TEXT, ITEMDRAW_DISABLED);
		
		Format(Choix, sizeof(Choix), "%i_%i_%s_%i_a", client, id, ItemID, Price);
		AddMenuItem(sell_menuPlayer, Choix, "Accepter l'offre");
		
		Format(Choix, sizeof(Choix), "%i_%i_%s_%i_r", client, id, ItemID, Price);
		AddMenuItem(sell_menuPlayer, Choix, "Décliner l'offre");
		
		DisplayMenu(sell_menuPlayer, SellPlayerID, 30);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(menu);
		}
	}
}

public Menu_SellActivityPlayer(Handle:sell_menuPlayer, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[64];
		
		new Vendeur;
		new id;
		decl String:ItemID[64];
		new PriceFinal;
		
		GetMenuItem(sell_menuPlayer, param2, info, sizeof(info));
		
		decl String:Buffer[20][64];
		ExplodeString(info, "_", Buffer, 5, 64);
		
		Vendeur = StringToInt(Buffer[0]);
		id = StringToInt(Buffer[1]);
		ItemID = Buffer[2];
		PriceFinal = StringToInt(Buffer[3]);
		
		if (StrEqual(Buffer[4], "a"))
		{
			SellActivity(Vendeur, client, id, ItemID, 1, PriceFinal);
		}
		else
		{
			CPrintToChat(Vendeur, "%s : %N a refuser votre offre.", g_bPrefix, client);
			CPrintToChat(client, "%s : Vous avez refuser l'offre de %N.", g_bPrefix, Vendeur);
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(sell_menuPlayer);
	}
}

SellActivity(client, Player, ItemID, String:item[], Quantity, Cost)
{	
	if (MakeTransaction(client, Player, -Cost, Quantity, ItemID))
	{
		MakeTransaction(client, client, Cost/2, Quantity, ItemID);

		CPrintToChat(Player, "%s : Vous avez acheté un %s à %N pour %i€", g_bPrefix, item, client, Cost);
		CPrintToChat(client, "%s : Vous avez vendu un %s à %N pour %i€", g_bPrefix, item, Player, Cost);
		switch (ItemID) {
			case 1:
			{
				SetChirurgie(Player, 1);
				IsInChirurgieJambes[Player] = true;
			}
			case 2:
			{
				SetChirurgie(Player, 2);
				IsInChirurgieCoeur[Player] = true;
			}
			case 3:
			{
				SetChirurgie(Player, 1);
				IsInChirurgieJambes[Player] = true;
			}
			case 4:
			{
				SetChirurgie(Player, 2);
				IsInChirurgieCoeur[Player] = true;
			}
			case 5:
			{
				SetChirurgie(Player, 1);
				IsInChirurgieJambes[Player] = true;
			}
			case 6:
			{
				SetChirurgie(Player, 2);
				IsInChirurgieCoeur[Player] = true;
			}
			case 7:
			{
				new ent;
						
				if((ent = CreateEntityByName("prop_physics")) != -1)
				{
					new Float:origin[3];
					GetClientEyePosition(client, origin);
								
					TeleportEntity(ent, origin, NULL_VECTOR, NULL_VECTOR);
								
					decl String:TargetName[64];
					Format(TargetName, sizeof(TargetName), "pc_%i_%i_%i", ent, Player, playerIds[Player]);
								
					DispatchKeyValue(ent, "model", MODELS_PC);
					DispatchKeyValue(ent, "physicsmode", "2");
					DispatchKeyValue(ent, "massScale", "8.0");
					DispatchKeyValue(ent, "targetname", TargetName);
					DispatchKeyValue (ent, "health", "200");
					DispatchKeyValue (ent, "ExplodeRadius", "16");
					DispatchKeyValue (ent, "ExplodeDamage", "0");
					DispatchKeyValue (ent, "Damagetype", "1");
					DispatchKeyValue (ent, "PerformanceMode", "0");
					DispatchSpawn(ent);
								
					SetEntityMoveType(ent, MOVETYPE_VPHYSICS);
								
					SetEntProp(ent, Prop_Send, "m_usSolidFlags", 8);
					SetEntProp(ent, Prop_Send, "m_CollisionGroup", 11);
				}
			}
		}

		return 1;
	}
	else
	{
		CPrintToChat(client, "%s : %N n'as pas assez d'argent pour finaliser la transaction.", g_bPrefix, Player);
		CPrintToChat(Player, "%s : Vous n'avez pas l'argent nécessaire pour finaliser la transaction.", g_bPrefix);
	}
	
	return 0;
}

public Action:Command_Sell(client, args) 
{ 
	if (IsValidAndAlive(client))
	{
		if (jailtime[client] <= 0)
		{
			new BuyerIndex = GetClientAimTarget(client, true); 
			
			if (BuyerIndex != -1)
			{
				BuildSellMenu(client, BuyerIndex);
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez viser un joueur", g_bPrefix);
			}
		}
		else 
		{
			CPrintToChat(client, "%s : Vous ne pouvez pas vendre en jail.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

Handle:BuildSellMenu(client, Player)
{
	decl String:Buffer[128];
	
	new Handle:menu = CreateMenu(Menu_Sell);
		
	SetMenuTitle(menu, "Choisis le produit a vendre :");

	new i = 0;
	if (!g_kvItems.GotoFirstSubKey())
	{
		return menu;
	}
	do
	{
		new job_id = g_kvItems.GetNum("seller_job_id", -1);
		if (job_id == jobid[client]) {
			new price = g_kvItems.GetNum("price", 10);
			decl String:ItemName[128];
			decl String:ItemID[128];
			KvGetSectionName(g_kvItems, ItemID, sizeof(ItemID));
			g_kvItems.GetString("item_name", ItemName, sizeof(ItemName));
			new id = StringToInt(ItemID);
			Format(ItemName, sizeof(ItemName), "%s", ItemName);
			Format(Buffer, sizeof(Buffer), "%i_%i_%i_%s", Player, id, price, ItemName);
			AddMenuItem(menu, Buffer, ItemName);
			i++;
		}
	} while (g_kvItems.GotoNextKey());
	g_kvItems.Rewind();
		
	DisplayMenu(menu, client, 30);
	return menu;
}

public Menu_Sell(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[256];
		
		new Price = 0;
		new id = 0;
		new SellPlayerID = 0;
		decl String:ItemID[64];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		
		decl String:Buffer[12][64];
		
		ExplodeString(info, "_", Buffer, 4, 64);
		
		SellPlayerID = StringToInt(Buffer[0]);
		id = StringToInt(Buffer[1]);
		Price = StringToInt(Buffer[2]);
		strcopy(ItemID, sizeof(ItemID), Buffer[3]);
		
		decl String:Quantite[256];
		
		new Handle:sell_menuQuantity = CreateMenu(Menu_Quantity);
		SetMenuTitle(sell_menuQuantity, "Choisissez la quantité :");
		
		Format(Quantite, sizeof(Quantite), "%i_%i_%i_%s_1", SellPlayerID, id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "1");
		
		Format(Quantite, sizeof(Quantite), "%i_%i_%i_%s_5", SellPlayerID, id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "5");
			
		Format(Quantite, sizeof(Quantite), "%i_%i_%i_%s_10", SellPlayerID, id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "10");
		
		Format(Quantite, sizeof(Quantite), "%i_%i_%i_%s_25", SellPlayerID, id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "25");
			
		Format(Quantite, sizeof(Quantite), "%i_%i_%i_%s_50", SellPlayerID, id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "50");
			
		Format(Quantite, sizeof(Quantite), "%i_%i_%i_%s_100", SellPlayerID, id, Price, ItemID);
		AddMenuItem(sell_menuQuantity, Quantite, "100");
		
		DisplayMenu(sell_menuQuantity, client, MENU_TIME_FOREVER);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(menu);
		}
	}
}

public Menu_Quantity(Handle:menu_quantity, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[256];
		
		new SellPlayerID = 0;
		new QuantityItem = 0;
		new Price = 0;
		new id = 0;
		decl String:ItemID[64];
				
		GetMenuItem(menu_quantity, param2, info, sizeof(info));
		
		decl String:Buffer[16][64];
		ExplodeString(info, "_", Buffer, 5, 64);

		SellPlayerID = StringToInt(Buffer[0]);
		id = StringToInt(Buffer[1]);
		strcopy(ItemID, sizeof(ItemID), Buffer[3]);
		QuantityItem = StringToInt(Buffer[4]);
		Price = StringToInt(Buffer[2]) * QuantityItem;
		
		
		decl String:Choix[256];
		decl String:TEXT[256];
		
		new Handle:sell_menuPlayer = CreateMenu(Menu_SellPlayer);
		
		if (SellPlayerID != client)
		{
			SetMenuTitle(sell_menuPlayer, "%N vous propose de vous vendre %s (Quantité: %i)", client, ItemID, QuantityItem);
		}
		
		Format(TEXT, sizeof(TEXT), "Prix : %i€", Price);
		AddMenuItem(sell_menuPlayer, "", TEXT, ITEMDRAW_DISABLED);
		
		Format(Choix, sizeof(Choix), "%i_%i_%i_%s_%i_a", client, id, QuantityItem, ItemID, Price);
		AddMenuItem(sell_menuPlayer, Choix, "Accepter l'offre");
		
		Format(Choix, sizeof(Choix), "%i_%i_%i_%s_%i_r", client, id, QuantityItem, ItemID, Price);
		AddMenuItem(sell_menuPlayer, Choix, "Décliner l'offre");
		
		DisplayMenu(sell_menuPlayer, SellPlayerID, 30);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(menu_quantity);
		}
	}
}

public Menu_SellPlayer(Handle:sell_menuPlayer, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[256];
		
		new Vendeur;
		new QuantityItem;
		new id;
		decl String:ItemID[64];
		new PriceFinal;
		
		GetMenuItem(sell_menuPlayer, param2, info, sizeof(info));
		
		decl String:Buffer[20][64];
		ExplodeString(info, "_", Buffer, 6, 64);
		
		Vendeur = StringToInt(Buffer[0]);
		id = StringToInt(Buffer[1]);
		QuantityItem = StringToInt(Buffer[2]);
		ItemID = Buffer[3];
		PriceFinal = StringToInt(Buffer[4]);
		
		if (StrEqual(Buffer[5], "a"))
		{
			Sell(Vendeur, client, id, ItemID, QuantityItem, PriceFinal);
		}
		else
		{
			CPrintToChat(Vendeur, "%s : %N a refuser votre offre.", g_bPrefix, client);
			CPrintToChat(client, "%s : Vous avez refuser l'offre de %N.", g_bPrefix, Vendeur);
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(sell_menuPlayer);
	}
}

Sell(client, Player, ItemID, String:item[], Quantity, Cost)
{	
	if (MakeTransaction(client, Player, -Cost, Quantity, ItemID))
	{
		MakeTransaction(client, client, Cost/2, Quantity, ItemID);

		CPrintToChat(Player, "%s : Vous avez acheté un %s (Quantité: %i) à %N pour %i€", g_bPrefix, item, Quantity, client, Cost);
		CPrintToChat(client, "%s : Vous avez vendu un %s (Quantité: %i) à %N pour %i€", g_bPrefix, item, Quantity, Player, Cost);
		SaveInventory(Player, ItemID, item, Quantity);

		return 1;
	}
	else
	{
		CPrintToChat(client, "%s : %N n'as pas assez d'argent pour finaliser la transaction.", g_bPrefix, Player);
		CPrintToChat(Player, "%s : Vous n'avez pas l'argent nécessaire pour finaliser la transaction.", g_bPrefix);
	}
	
	return 0;
}

public bool:MakeTransaction (client, target, amount, quantity, itemID) {
	new finalMoney = money[target] + amount;
	if (finalMoney >= 0) {
		if (amount > 0) {
			capital[jobid[client]] += amount;
		}
		money[target] += amount;
		decl String:buffer[400];
		Format(buffer, sizeof(buffer),"INSERT INTO accounting(from_player, to_player, quantity, price, item_id, job_id) VALUES ('%i', '%i', '%i', '%i', '%i', '%i')", playerIds[client], playerIds[target], quantity, amount, itemID, jobid[client]);
		SQL_TQuery(g_ThreadedHandle, CallbackSaveAccounting, buffer, client);
		return true;
	}

	return false;
}

public SetDrogue(TARGET, ID, EFFECT, Float:TIME)
{
	if (IsValidAndAlive(TARGET))
	{
		if (ID == 1)
		{
			SetEntityHealth(TARGET, 102);
			SetEntityGravity(TARGET, 0.6);
			TE_SetupBeamFollow(TARGET, g_BeamSpriteFollow, 0, 10.0, 5.0, 50.0, 3, ColorShit);
		}
		else if (ID == 2)
		{
			SetEntityHealth(TARGET, 125);
			ModifySpeed(TARGET, 1.7);
			TE_SetupBeamFollow(TARGET, g_BeamSpriteFollow, 0, 10.0, 5.0, 50.0, 3, ColorCocaine);
		}
		else if (ID == 3)
		{
			SetEntityHealth(TARGET, 250);
			ModifySpeed(TARGET, 1.3);
			TE_SetupBeamFollow(TARGET, g_BeamSpriteFollow, 0, 10.0, 5.0, 50.0, 3, ColorHeroine);
		}
		else if (ID == 4)
		{
			SetEntityHealth(TARGET, 200);
			ModifySpeed(TARGET, 1.4);
			TE_SetupBeamFollow(TARGET, g_BeamSpriteFollow, 0, 10.0, 5.0, 50.0, 3, ColorEcstazy);
		}
		else if (ID == 5)
		{
			SetEntityHealth(TARGET, 150);
			ModifySpeed(TARGET, 1.1);
			TE_SetupBeamFollow(TARGET, g_BeamSpriteFollow, 0, 10.0, 5.0, 50.0, 3, ColorWeed);
		}
		else if (ID == 6)
		{
			SetEntityHealth(TARGET, 125);
			SetEntityGravity(TARGET, 0.8);
			TE_SetupBeamFollow(TARGET, g_BeamSpriteFollow, 0, 10.0, 5.0, 50.0, 3, ColorChampignons);
		}
		
		TE_SendToAll();
		
		if (!HasOeilBionique[TARGET])
		{
			if (EFFECT == 1)
			{
				ClientCommand(TARGET, "r_screenoverlay models/effects/portalfunnel_sheet.vmt");
			}
			else if (EFFECT == 2)
			{
				ClientCommand(TARGET, "r_screenoverlay effects/com_shield002a.vmt");
			}
			else if (EFFECT == 3)
			{
				ClientCommand(TARGET, "r_screenoverlay effects/tp_eyefx/tp_eyefx.vmt");
			}
			else if (EFFECT == 4)
			{
				ClientCommand(TARGET, "r_screenoverlay debug/yuv.vmt");
			}
			else if (EFFECT == 5)
			{
				ClientCommand(TARGET, "r_screenoverlay models/props_combine/portalball001_sheet.vmt");
			}
			else if (EFFECT == 6)
			{
				ClientCommand(TARGET, "r_screenoverlay effects/tp_refract.vmt");
			}
		}
		
		CreateTimer(TIME, ResetDrugs, TARGET);
	}
}

public Action:ResetDrugs(Handle:timer, any:client)
{
	if (IsValid(client))
	{
		ModifySpeed(client, 1.0);
		
		SetEntityGravity(client, 1.0);
		
		ClientCommand(client, "r_screenoverlay 0");
		
		TE_SetupKillPlayerAttachments(client);
		TE_SendToClient(client);
	}
}

public Action:Timer_Cut(Handle:timer, any:client)
{
	if (IsValid(client))
	{
		if (CUTBURN_ACTIVE[client])
		{
			CUTBURN_ACTIVE[client] = false;
		}
		
		if (CUTFREEZE_ACTIVE[client])
		{
			CUTFREEZE_ACTIVE[client] = false;
		}
		
		if (CUTFLASH_ACTIVE[client])
		{
			CUTFLASH_ACTIVE[client] = false;
		}
		
		if (CUTSMALL_ACTIVE[client])
		{
			CUTSMALL_ACTIVE[client] = false;
		}
		
		if (CUTBIG_ACTIVE[client])
		{
			CUTBIG_ACTIVE[client] = false;
		}
	}
}

stock TE_SetupKillPlayerAttachments(player)
{
	TE_Start("KillPlayerAttachments");
	TE_WriteNum("m_nPlayer", player);
}

public BurnPlayer(client)
{
	if (IsValidAndAlive(client))
	{
		IgniteEntity(client, 6.0);
	}
}

public FreezePlayer(client)
{
	if (IsValidAndAlive(client))
	{
		SetEntityMoveType(client, MOVETYPE_NONE);
		
		new Float:vec[3];
		GetClientEyePosition(client, vec);
		vec[2] -= 50.0;
		EmitAmbientSound(SOUND_FREEZE, vec, client, SNDLEVEL_RAIDSIREN);
		
		TE_SetupGlowSprite(vec, g_GlowSprite, 4.0, 2.0, 50);
		TE_SendToAll();
		
		FreezeTimer[client] = CreateTimer(4.0, UnFreeze, client, TIMER_FLAG_NO_MAPCHANGE);
	}
}

public Action:UnFreeze(Handle:timer, any:client)
{
	if (FreezeTimer[client] != INVALID_HANDLE)
	{
		SetEntityMoveType(client, MOVETYPE_WALK);
		FreezeTimer[client] = INVALID_HANDLE;
	}
}

public FlashPlayer(client)
{
	if (IsValidAndAlive(client))
	{
		decl Float:Pos[3];
	
		GetClientEyeAngles(client, Pos);
	
		new Float:position = Pos[1];

		Pos[1] = 30 + position;
	
		new Float:positions = Pos[2];
		Pos[2] = 10 + positions;
	
		SetEntPropVector(client, Prop_Send, "m_vecPunchAngle", Pos);
	
		Client_ScreenFade(client, 500, FFADE_OUT|FFADE_PURGE, 1, 250, 250, 250, 200, true);
	}
}

public SmallPlayer(client, Float:time)
{
	if (IsValidAndAlive(client))
	{
		SetEntPropFloat(client, Prop_Send, "m_flModelScale", 0.8);
		
		CreateTimer(time, Timer_ResetSize, client);
	}
}

public BigPlayer(client, Float:time)
{
	if (IsValidAndAlive(client))
	{
		SetEntPropFloat(client, Prop_Send, "m_flModelScale", 1.2);
		
		CreateTimer(time, Timer_ResetSize, client);
	}
}

public Action:Timer_ResetSize(Handle:timer, any:client)
{
	if (IsValidAndAlive(client))
	{
		SetEntPropFloat(client, Prop_Send, "m_flModelScale", 1.0);
	}
}

public DestroyLevel(client)
{
	if (IsValidAndAlive(client))
	{
		new String:sWeaponName[64];
		GetClientWeapon(client, sWeaponName, sizeof(sWeaponName));
		
		if (StrEqual(sWeaponName, "weapon_knife"))
		{

		}
	}
}

GetTargetName(entity, String:buf[], len)
{
	GetEntPropString(entity, Prop_Data, "m_iName", buf, len);
}

public Action:Timer_Clean(Handle:timer)
{
	new maxent = GetMaxEntities(), String:weapon[64];
	
	for (new i=GetMaxClients();i<maxent;i++)
	{
		if (IsValidEdict(i) && IsValidEntity(i))
		{
			GetEdictClassname(i, weapon, sizeof(weapon));
			
			if (( StrContains(weapon, "weapon_") != -1 || StrContains(weapon, "item_") != -1 ) && GetEntDataEnt2(i, g_WeaponParent) == -1)
			{
				if (!IsInMafia(i) && !IsInTriades(i) && !IsInArmurerie(i) && !IsInDealer(i) && !IsInCoach(i) && !IsInArtificier(i) && !IsInBanque(i) && !IsInMoniteur(i) && !IsInLoto(i) && !IsInHopital(i) && !IsInDetective(i) && !IsInTueur(i) && !IsInJustice(i) && !IsInTechnicien(i) && !IsInMacdonald(i))
				{
					RemoveEdict(i);
				}
			}
		}
	}	
	
	return Plugin_Continue;
}

public HasPermisProjectiles(client)
{
	return false;
}

public HasRib(client)
{
	if (GetItemInInventory(23, client) > 0) {
		return true;
	} else {
		return false;
	}
}

public HasCb(client)
{
	if (cb[client] == 1)
		return true;
	else
		return false;
}

public RobItem (client, entity) {
	new hasRobbed = false;
	decl String:path[1000];
	Format(path, sizeof(path), "addons/sourcemod/configs/roleplay/players/%i.txt", playerIds[entity]);
	KeyValues kv = new KeyValues("Inventory");
	kv.ImportFromFile(path);

	decl String:IdentifierName[20];
	if (!kv.GotoFirstSubKey())
	{
		return 0;
	}

	do {
		new show_in_inventory = kv.GetNum("show_in_inventory", 0);
		new quantity = kv.GetNum("quantity", 0);
		PrintToServer("Item show in inventory : %i", show_in_inventory);
		if (show_in_inventory && quantity > 0) {
			new probability = GetRandomInt(1,9);
			if (probability == 1) {
				hasRobbed = true;
				decl String:itemID[128];
				decl String:itemName[128];
				KvGetSectionName(kv, itemID, sizeof(itemID));
				GetItemNameById(StringToInt(itemID), itemName, sizeof(itemName));
				PrintToServer("Item ID : %s", itemID);
				PrintToServer("Item Name : %s", itemName);
				RemoveFromInventory(entity, StringToInt(itemID), itemName, 1);
				SaveInventory(client, StringToInt(itemID), itemName, 1);
				CPrintToChat(client, "%s : Vous avez dérobé {red}1{default} {olive}%s{default}.", g_bPrefix, itemName);
				delete kv;
				return hasRobbed;
			}
		}
	} while (kv.GotoNextKey());
	delete kv;
	return hasRobbed;
}

public HasCompteCourant(client)
{
	if (GetItemInInventory(3, client) > 0) {
		return true;
	} else {
		return false;
	}
}

public HasWebcamRemote(client)
{
	if (GetItemInInventory(21, client) > 0) {
		return true;
	} else {
		return false;
	}
}

public GetItemInInventory (itemId, client) {
	decl String:path[1000];
	decl String:itemKey[20];
	IntToString(itemId, itemKey, sizeof(itemKey));
	Format(path, sizeof(path), "addons/sourcemod/configs/roleplay/players/%i.txt", playerIds[client]);

	KeyValues kv = new KeyValues("Inventory");
	kv.ImportFromFile(path);
	kv.JumpToKey(itemKey, true);
	new quantity = kv.GetNum("quantity", -1);
	kv.Rewind();
	delete kv;
	return quantity;
}

public GetItemNameById (itemId, String:itemName[], maxlen) {
	decl String:path[1000];
	decl String:itemKey[20];
	IntToString(itemId, itemKey, sizeof(itemKey));
	Format(path, sizeof(path), "addons/sourcemod/configs/roleplay/items.txt");

	KeyValues kv = new KeyValues("Inventory");
	kv.ImportFromFile(path);
	kv.JumpToKey(itemKey, true);
	kv.GetString("item_name", itemName, maxlen);
	kv.Rewind();
	delete kv;
}

public GetHigherRankId (jobID) {
	new String:jobIdentifier[32];
	IntToString(jobID, jobIdentifier, sizeof(jobIdentifier));
	new String:rankIdentifier[32];
	KeyValues kv = new KeyValues("Jobs");
	kv.ImportFromFile("addons/sourcemod/configs/roleplay/jobs.txt");
	new i = 1;
	IntToString(i, rankIdentifier, sizeof(rankIdentifier));
	if (kv.JumpToKey(jobIdentifier)) {
		while (kv.GetNum(rankIdentifier, -1) != -1) {
			i++;
			IntToString(i, rankIdentifier, sizeof(rankIdentifier));
		}
	}
	delete kv;
	return i-1;
}

public HasFicheDePaie(client)
{
	if (fiche[client])
		return true;
	else
		return false;
}

public HasPermisLourd(client)
{
	return false;
}

public HasPermisLeger(client)
{
	return false;
}

public FermetureEntreprise(entreprise)
{
	decl String:error[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	
	new String:query[300];
	
	Format(query, sizeof(query), "UPDATE rp_players SET JOBID = '0', RANKID = '0' WHERE RANKID = '%i'", entreprise);				
	SQL_FastQuery(database, query);
	
	Format(query, sizeof(query), "UPDATE rp_capital SET CAPITAL = '100000' WHERE ID = '%i'", entreprise);				
	SQL_FastQuery(database, query);
	
	capital[entreprise] = 100000;
	
	for (new i = 1; i <= MaxClients; i++)
	{
		if (IsValid(i) && jobid[i] == entreprise)
		{
			rankid[i] = 0;
			jobid[i] = 0;
			
			CPrintToChat(i, "%s : Vous avez été licencier suite à la fermeture de votre entreprise.", g_bPrefix);
			
			InitSalary(i);
			
			decl String:ClanTagRankName[20];
			GetClanTagName(i, rankid[i], jobid[i], ClanTagRankName, sizeof(ClanTagRankName));

			CS_SetClientClanTag(i, ClanTagRankName);
			
			if (GetClientTeam(i) == CS_TEAM_CT)
			{
				CS_SwitchTeam(i, CS_TEAM_T);
			}
		}
	}
}

public Action:Command_Channel(client, args)
{
	if (IsValidAndAlive(client))
	{
		BuildChannelMenu(client);
	}
	
	return Plugin_Handled;
}

BuildChannelMenu(client)
{
	new Handle:channels = CreateMenu(Menu_Channel);
	
	SetMenuTitle(channels, "Choisis ton channel de discussion :");
	
	AddMenuItem(channels, "1", "Channel Général");
	AddMenuItem(channels, "2", "Channel Annonces");
	AddMenuItem(channels, "3", "Channel Commerce");
	
	if (IsRootAdmin(client))
	{
		AddMenuItem(channels, "4", "Channel Informations");
	}
	
	DisplayMenu(channels, client, 30);
}

public Menu_Channel(Handle:channell, MenuAction:action, param1, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		
		GetMenuItem(channell, param2, info, sizeof(info));
		
		channelle[param1] = StringToInt(info);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(channell);
		}
	}
}

public Recoil(client)
{
	if (IsValidAndAlive(client))
	{
		decl Float:Pos[3];
		
		GetClientEyeAngles(client, Pos);
		
		new Float:position = Pos[1];

		Pos[1] = 30 + position;
		
		new Float:positions = Pos[2];
		Pos[2] = 10 + positions;
		
		SetEntPropVector(client, Prop_Send, "m_vecPunchAngle", Pos);
	}
}

public Action:Command_Search(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsMoniteur(client) || IsArtificier(client))
		{
			new target = GetClientAimTarget(client, true);
			
			if (target != -1)
			{
				BuildSearchMenu(client, target);
			}
			else
			{
				CPrintToChat(client, "%s : Veuillez viser un joueur.", g_bPrefix);
			}
		}
	}
	
	return Plugin_Handled;
}

BuildSearchMenu(client, cible)
{
	if (IsValid(cible))
	{
		new String:SteamId[32];
		GetClientAuthId(cible, AuthId_Steam2, SteamId, sizeof(SteamId));
		
		new String:TEXT[50];
		new String:TEXT1[50];
		new String:TEXT2[50];
		
		Format(TEXT, sizeof(TEXT), "STEAM_ID : %s", SteamId);
		Format(TEXT1, sizeof(TEXT1), "Permis Lourd : %s | Permis Léger : %s", (HasPermisLourd(cible) ? "Actif" : "Inactif"), (HasPermisLeger(cible) ? "Actif" : "Inactif"));
		Format(TEXT2, sizeof(TEXT2), "Permis Projectiles : %s", (HasPermisProjectiles(cible) ? "Actif" : "Inactif"));
		
		new Handle:menu = CreateMenu(Menu_Search);
		
		SetMenuTitle(menu, "Vérification des permis de %N :", cible);
		
		AddMenuItem(menu, "", TEXT);
		AddMenuItem(menu, "", TEXT1);
		AddMenuItem(menu, "", TEXT2);
	
		DisplayMenu(menu, client, 30);
	}
}

public Menu_Search(Handle:menu, MenuAction:action, param1, param2)
{
	if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public CreateGain(client, PriceTicket)
{
	if (IsValidAndAlive(client))
	{
		new random;
		new gain;
		
		gain = PriceTicket * 100;
		
		if (PriceTicket == 10)
		{
			random = GetRandomInt(1, 100);
			
			if (random == 99 || random == 1)
			{
				CPrintToChat(client, "%s : Vous avez gagner %i€.", g_bPrefix, gain);
				money[client] += gain;
			}
			else
			{
				CPrintToChat(client, "%s : Vous avez gratter votre ticket et rien gagner.", g_bPrefix);
			}
		}
		else if (PriceTicket == 50)
		{
			random = GetRandomInt(1, 150);
			
			if (random == 149 || random == 1)
			{
				CPrintToChat(client, "%s : Vous avez gagner %i€.", g_bPrefix, gain);
				money[client] += gain;
			}
			else
			{
				CPrintToChat(client, "%s : Vous avez gratter votre ticket et rien gagner.", g_bPrefix);
			}
		}
		else if (PriceTicket == 100)
		{
			random = GetRandomInt(1, 250);
			
			if (random == 249 || random == 1)
			{
				CPrintToChat(client, "%s : Vous avez gagner %i€.", g_bPrefix, gain);
				money[client] += gain;
			}
			else
			{
				CPrintToChat(client, "%s : Vous avez gratter votre ticket et rien gagner.", g_bPrefix);
			}
		}
		else if (PriceTicket == 500)
		{
			random = GetRandomInt(1, 300);
			
			if (random == 299 || random == 1)
			{
				CPrintToChat(client, "%s : Vous avez gagner %i€.", g_bPrefix, gain);
				money[client] += gain;
			}
			else
			{
				CPrintToChat(client, "%s : Vous avez gratter votre ticket et rien gagner.", g_bPrefix);
			}
		}
		else if (PriceTicket == 1000)
		{
			random = GetRandomInt(1, 400);
			
			if (random == 399 || random == 1)
			{
				CPrintToChat(client, "%s : Vous avez gagner %i€.", g_bPrefix, gain);
				money[client] += gain;
			}
			else
			{
				CPrintToChat(client, "%s : Vous avez gratter votre ticket et rien gagner.", g_bPrefix);
			}
		}
	}
}

public SetChirurgie(client, chirurgie)
{
	if (IsValidAndAlive(client))
	{
		new health = GetClientHealth(client);
		
		if (chirurgie == 1)
		{
			ModifySpeed(client, 1.4);
		}
		else if (chirurgie == 2)
		{
			SetEntityHealth(client,  health + 200);
		}
		else if (chirurgie == 3)
		{
			SetEntityGravity(client, 0.5);
		}
	}
}

public CreateSoin(client, soin)
{
	if (IsValidAndAlive(client))
	{
		if (soin == 1)
		{
			SetEntityHealth(client, 120);
		}
		else if (soin == 2)
		{
			SetEntityHealth(client, 160);
		}
		else if (soin == 3)
		{
			SetEntityHealth(client, 200);
		}
	}
}

public AddAllPlayers(Handle:menu)
{
	decl String:user_id[12];
	decl String:name[MAX_NAME_LENGTH];
	decl String:display[MAX_NAME_LENGTH+15];
	
	for (new i = 1; i <= MaxClients; i++)
	{
		if (IsValid(i))
		{
			IntToString(GetClientUserId(i), user_id, sizeof(user_id));
			
			GetClientName(i, name, sizeof(name));
			
			Format(display, sizeof(display), "%s", name);
			
			AddMenuItem(menu, user_id, display);
		}
	}
}

public Menu_Enquetes(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		new String:info[64];
		new String:TEXT[50];
		new String:TEXT1[50];
		new String:TEXT2[50];
		new String:TEXT3[50];
		new String:TEXT4[100];
		new String:TEXT6[100];
		new String:TEXT7[100];
		new String:TEXT8[50];
		new String:SteamId[32];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		
		new UserID = StringToInt(info);
		enquete[client] = GetClientOfUserId(UserID);
		
		if (IsValid(enquete[client]))
		{
			GetClientAuthId(enquete[client], AuthId_Steam2, SteamId, sizeof(SteamId));
			
			new life = GetClientHealth(enquete[client]);
	
			new armor = GetEntProp(enquete[client], Prop_Send, "m_ArmorValue");
			
			Format(TEXT, sizeof(TEXT), "STEAM_ID : %s", SteamId);
			Format(TEXT1, sizeof(TEXT1), "Vie : %d | Armure : %d", life, armor);
			Format(TEXT2, sizeof(TEXT2), "Métier : %s", JobNameUser[enquete[client]]);
			Format(TEXT3, sizeof(TEXT3), "Vue pour la dernière fois : %s", ZoneUser[enquete[client]]);
			Format(TEXT4, sizeof(TEXT4), "Dernière mort par : %s", LastKillBy[enquete[client]]);
			Format(TEXT6, sizeof(TEXT6), "RIB : %s | CB : %s", (HasRib(enquete[client]) ? "Actif" : "Inactif"), (HasCb(enquete[client]) ? "Actif" : "Inactif"));
			Format(TEXT7, sizeof(TEXT7), "Permis Lourd : %s | Permis Léger : %s", (HasPermisLourd(enquete[client]) ? "Actif" : "Inactif"), (HasPermisLeger(enquete[client]) ? "Actif" : "Inactif"));
			Format(TEXT8, sizeof(TEXT8), "Permis Projectiles : %s", (HasPermisProjectiles(enquete[client]) ? "Actif" : "Inactif"));
					
			new Handle:menuc = CreateMenu(Detective);
			SetMenuTitle(menuc, "Informations sur : %N", enquete[client]);
			
			AddMenuItem(menuc, "", TEXT, ITEMDRAW_DISABLED);
			AddMenuItem(menuc, "", TEXT1, ITEMDRAW_DISABLED);
			AddMenuItem(menuc, "", TEXT2, ITEMDRAW_DISABLED);
			AddMenuItem(menuc, "", TEXT6, ITEMDRAW_DISABLED);
			AddMenuItem(menuc, "", TEXT7, ITEMDRAW_DISABLED);
			AddMenuItem(menuc, "", TEXT8, ITEMDRAW_DISABLED);
			AddMenuItem(menuc, "", TEXT3, ITEMDRAW_DISABLED);
			AddMenuItem(menuc, "", TEXT4, ITEMDRAW_DISABLED);
			
			DisplayMenu(menuc, client, 60);
		}
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public Detective(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public Action:Command_Contrat(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (IsTueur(client))
		{
			new Ent = GetClientAimTarget(client, true);
			
			if (Ent != -1)
			{
				if (!OnContrat[client])
				{
					if (!IsPolice(Ent))
					{
						decl String:name[32];
						decl String:info[32];
						
						CommanditeurID[client] = Ent;
						
						new Handle:sell_menu_contrat = CreateMenu(Menu_Sell_Contrat);
						SetMenuTitle(sell_menu_contrat, "Veuillez choisir un contrat à proposer :");
						
						for (new i = 1; i <= MaxClients; i++)
						{
							if (IsValidAndAlive(i))
							{
								if (!IsTueur(i) && i != client && i != Ent)
								{
									GetClientName(i, name, sizeof(name));
									IntToString(i, info, sizeof(info));
									
									AddMenuItem(sell_menu_contrat, info, name);
								}
							}
						}
						
						DisplayMenu(sell_menu_contrat, client, MENU_TIME_FOREVER);
					}
					else
					{
						CPrintToChat(Ent, "%s : La police ne peux pas commandité de contrat.", g_bPrefix);
						CPrintToChat(client, "%s : La police ne peux pas commandité de contrat.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous êtes déjà en contrat.", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Veuillez visé un joueur.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Menu_Sell_Contrat(Handle:sell_menu_contrat, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[256];
		
		GetMenuItem(sell_menu_contrat, param2, info, sizeof(info));
		
		TempCibleID[client] = StringToInt(info);
		
		BuildContratMenu(client);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(sell_menu_contrat);
		}
	}
}

Handle:BuildContratMenu(client)
{
	if (IsValidAndAlive(client))
	{
		if (TempCibleID[client] != -1)
		{
			if (IsPolice(TempCibleID[client]))
			{
				PriceContrat[client] = PRICE_CONTRATFLIC;
			}
			else
			{
				PriceContrat[client] = PRICE_CONTRATCIVIL;
			}
			
			decl String:ItemAccepter[12];
			decl String:ItemRefuser[12];
			
			new Handle:menu_sellContrat = CreateMenu(Menu_SellContrat);
			SetMenuTitle(menu_sellContrat, "%N vous propose de vous vendre un contrat sur %N pour %i$", client, TempCibleID[client], PriceContrat[client]);
			
			Format(ItemAccepter, sizeof(ItemAccepter), "%i_a", client);
			AddMenuItem(menu_sellContrat, ItemAccepter, "Accepter l'offre");
			
			Format(ItemRefuser, sizeof(ItemRefuser), "%i_r", client);
			AddMenuItem(menu_sellContrat, ItemRefuser, "Décliner l'offre");
			
			SetMenuExitButton(menu_sellContrat, false);
			
			DisplayMenu(menu_sellContrat, CommanditeurID[client], MENU_TIME_FOREVER);
		}
		else
		{
			CPrintToChat(client, "%s : Votre cible est incorrecte.", g_bPrefix);
		}
	}
}

public Menu_SellContrat(Handle:menu_sellContrat, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		if (IsValid(client))
		{
			new Tueur;
			
			decl String:info[32];
			GetMenuItem(menu_sellContrat, param2, info, sizeof(info));
			
			decl String:Buffer[8][32];
			ExplodeString(info, "_", Buffer, 2, 32);
			
			Tueur = StringToInt(Buffer[0]);
			
			if (Tueur != -1)
			{
				CommanditeurID[Tueur] = client;
			
				cibleID[Tueur] = TempCibleID[Tueur];
			
				if (StrEqual(Buffer[1], "a"))
				{
					new moneyCommanditeur;
					
					if (HasCb(client))
					{
						moneyCommanditeur = bank[client];
					}
					else
					{
						moneyCommanditeur = money[client];
					}
					
					new prix = PriceContrat[Tueur];
					
					if (moneyCommanditeur >= prix)
					{
						if (HasCb(client))
						{
							bank[client] -= PriceContrat[Tueur];
						}
						else
						{
							money[client] -= PriceContrat[Tueur];
						}
						
						capital[jobid[Tueur]] += (PriceContrat[Tueur] / 2);
						
						money[Tueur] += PriceContrat[Tueur] / 2;
						
						if (IsTueur(Tueur))
						{
							if (rankid[Tueur] == 1)
							{
								BoostDispo[Tueur] = 5;
							}
							else if (rankid[Tueur] == 2)
							{
								BoostDispo[Tueur] = 5;
							}
							else if (rankid[Tueur] == 3)
							{
								BoostDispo[Tueur] = 4;
							}
							else if (rankid[Tueur] == 4)
							{
								BoostDispo[Tueur] = 3;
							}
							else if (rankid[Tueur] == 5)
							{
								BoostDispo[Tueur] = 2;
							}
							else if (rankid[Tueur] == 5)
							{
								BoostDispo[Tueur] = 1;
							}
						}
						
						new Handle:MenuAmelioration = BuildChooseMenu(Tueur);
						
						DisplayMenu(MenuAmelioration, Tueur, MENU_TIME_FOREVER);
						
						CreateTimer(1.0, UpdateContrat, Tueur);
						
						OnContrat[Tueur] = true;
						
						CPrintToChat(Tueur, "%s : %N a accepter le contrat.", g_bPrefix, client);
						CPrintToChat(client, "%s : Vous avez accepter le contrat.", g_bPrefix);
					}
					else
					{
						CPrintToChat(Tueur, "%s : %N n'as pas assez d'argent pour finaliser la transaction.", g_bPrefix, client);
						CPrintToChat(client, "%s : Vous n'avez pas l'argent nécessaire pour finaliser la transaction.", g_bPrefix);
						
						TempCibleID[Tueur] = 0;
						cibleID[Tueur] = 0;
					}
				}
				if (StrEqual(Buffer[1], "r"))
				{
					CPrintToChat(Tueur, "%s : %N a refuser votre offre.", g_bPrefix, client);
					CPrintToChat(client, "%s : Vous avez refuser l'offre de %N.", g_bPrefix, Tueur);
					
					TempCibleID[Tueur] = 0;
					cibleID[Tueur] = 0;
				}
			}
			else
			{
				CPrintToChat(client, "%s : Tueur Invalide, assassinat annulé.", g_bPrefix);
			}
		}
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(menu_sellContrat);
		}
	}
}

public Menu_ChooseBoost(Handle:menu_sellContrat, MenuAction:action, param1, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		GetMenuItem(menu_sellContrat, param2, info, sizeof(info));
		
		if (StrEqual(info, "Deagle"))
		{
			GivePlayerItem(param1, "weapon_deagle");
			
			BoostDeagle[param1] = true;
		}
		if (StrEqual(info, "Vitesse"))
		{
			ModifySpeed(param1, 1.5);
			
			BoostVitesse[param1] = true;
		}
		if (StrEqual(info, "Vie"))
		{
			SetEntityHealth(param1, 250);
			
			BoostLife[param1] = true;
		}
		if (StrEqual(info, "Invisible"))
		{
			SetEntityRenderMode(param1, RENDER_TRANSCOLOR);
			SetEntityRenderColor(param1, 255, 255, 255, 0);
	
			BoostInvisi[param1] = true;
		}
		if (StrEqual(info, "Cut"))
		{
			
			BoostCut[param1] = true;
		}
		
		BoostDispo[param1] -= 1;
		
		new Handle:MenuAmelioration = BuildChooseMenu(param1);
		
		DisplayMenu(MenuAmelioration, param1, MENU_TIME_FOREVER);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(menu_sellContrat);
		}
	}
}

public Action:UpdateContrat(Handle:timer, any:param1)
{
	if (IsValid(param1))
	{
		new Price = PriceContrat[param1] / 2;
		
		if (IsValid(cibleID[param1]) && IsValid(CommanditeurID[param1]))
		{
			if (IsPlayerAlive(param1))
			{
				if (jailtime[param1] == 0)
				{
					if (IsPlayerAlive(cibleID[param1]))
					{
						decl Float:tueur_vec[3];
						decl Float:cible_vec[3];
						
						GetClientAbsOrigin(param1, tueur_vec);
						GetClientAbsOrigin(cibleID[param1], cible_vec);
						
						tueur_vec[2] += 40.0;
						
						cible_vec[2] += 40.0;
						
						TE_SetupBeamPoints(tueur_vec, cible_vec, g_modelLaser, g_modelHalo, 0, 1, 1.0, 10.0, 10.0, 1, 1.0, ColorContrat, 1);
						TE_SendToClient(param1);
						
						CreateTimer(1.0, UpdateContrat, param1);
					}
					else
					{
						if (HasKillCible[param1])
						{
							CPrintToChat(CommanditeurID[param1], "%s : L'assassin a tué votre cible, contrat réussi.", g_bPrefix);
							CPrintToChat(param1, "%s : Vous avez tuer votre cible, contrat réussi.", g_bPrefix);
							FinContrat(param1);
						}
						else
						{
							CPrintToChat(CommanditeurID[param1], "%s : La cible est morte entre temps, contrat échoué.", g_bPrefix);
							CPrintToChat(param1, "%s : Votre cible est morte entre temps, contrat échoué.", g_bPrefix);
							
							money[CommanditeurID[param1]] += Price;
							FinContrat(param1);
						}
					}
				}
				else
				{
					CPrintToChat(CommanditeurID[param1], "%s : L'assassin est en jail, contrat échoué.", g_bPrefix);
					CPrintToChat(param1, "%s : Vous êtes en jail, contrat échoué.", g_bPrefix);
					
					money[CommanditeurID[param1]] += Price;
					FinContrat(param1);
				}
			}
			else
			{
				CPrintToChat(CommanditeurID[param1], "%s : L'assassin est mort, contrat échoué.", g_bPrefix);
				CPrintToChat(param1, "%s : Vous êtes mort, contrat échoué.", g_bPrefix);
				
				money[CommanditeurID[param1]] += Price;
				FinContrat(param1);
			}
		}
		else
		{
			CPrintToChat(CommanditeurID[param1], "%s : La cible s'est déconnectée, contrat échoué.", g_bPrefix);
	
			money[CommanditeurID[param1]] += Price;
			
			if (IsValid(param1))
			{
				CPrintToChat(param1, "%s : Votre cible s'est déconnectée, contrat arrêté.", g_bPrefix);
				
				FinContrat(param1);
			}
		}
	}
	else
	{
		if (IsValid(CommanditeurID[param1]))
		{
			CPrintToChat(CommanditeurID[param1], "%s : %N s'est déconnecté, vous êtes donc remboursé une partie de la somme.", g_bPrefix, param1);
			
			money[CommanditeurID[param1]] += 200;
		}
	}
}

public FinContrat(client)
{
	if (IsValid(client))
	{
		TempCibleID[client] = 0;
		cibleID[client] = 0;
		CommanditeurID[client] = 0;
		HasKillCible[client] = false;
		OnContrat[client] = false;
		
		if (BoostDeagle[client])
		{
			disarm(client);
			
			GivePlayerItem(client, "weapon_knife");
			
			BoostDeagle[client] = false;
		}
		
		if (BoostVitesse[client])
		{
			ModifySpeed(client, 1.0);
			
			BoostVitesse[client] = false;
		}
		
		if (BoostLife[client])
		{
			SetEntityHealth(client, 100);
			
			BoostLife[client] = false;
		}
		
		if (BoostCut[client])
		{
			BoostCut[client] = false;
		}
		
		if (BoostInvisi[client])
		{
			BoostInvisi[client] = false;
			
			SetEntityRenderMode(client, RENDER_NORMAL);
		}
	}
}

Handle:BuildChooseMenu(Tueur)
{
	new Handle:menu_ChooseBoost = CreateMenu(Menu_ChooseBoost);
	
	if (0 < BoostDispo[Tueur])
	{
		SetMenuTitle(menu_ChooseBoost, "Vous pouvez encore choisir %i améliorations:", BoostDispo[Tueur]);
		
		if (!BoostDeagle[Tueur])
		{
			AddMenuItem(menu_ChooseBoost, "Deagle", "Deagle");
		}
		if (!BoostVitesse[Tueur])
		{
			AddMenuItem(menu_ChooseBoost, "Vitesse", "Vitesse");
		}
		if (!BoostLife[Tueur])
		{
			AddMenuItem(menu_ChooseBoost, "Vie", "Vie Augmentée");
		}
		if (!BoostInvisi[Tueur])
		{
			AddMenuItem(menu_ChooseBoost, "Invisible", "Invisibilité");
		}
		if (!BoostCut[Tueur])
		{
			AddMenuItem(menu_ChooseBoost, "Cut", "Level Cut");
		}
	}
	return menu_ChooseBoost;
}

public Action:Command_Convocation(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (IsPresidentJustice(client) || IsHautJuge(client) || IsJuge(client) || IsAvocat(client))
		{
			BuildConvocationMenu(client);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

BuildConvocationMenu(client)
{
	if(client > 0 && client <= MaxClients && !IsFakeClient(client))
	{
		decl String:sMenuText[64];
		sMenuText[0] = '\0';
		
		new Handle:menu = CreateMenu(Menu_Convocation);
		SetMenuTitle(menu, "Choisis le joueur :");
		SetMenuExitButton(menu, true);
		
		AddConvocPlayers(menu);
		
		DisplayMenu(menu, client, MENU_TIME_FOREVER);
	}
}

public AddConvocPlayers(Handle:menu)
{
	decl String:user_id[12];
	decl String:name[MAX_NAME_LENGTH];
	decl String:display[MAX_NAME_LENGTH+15];
	
	for (new i = 1; i <= MaxClients; i++)
	{
		if (IsValid(i) && !IsPolice(i) && !IsJustice(i))
		{
			IntToString(GetClientUserId(i), user_id, sizeof(user_id));
			
			GetClientName(i, name, sizeof(name));
			
			Format(display, sizeof(display), "%s", name);
			
			AddMenuItem(menu, user_id, display);
		}
	}
}

public Menu_Convocation(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[64];
		GetMenuItem(menu, param2, info, sizeof(info));
		
		new UserID = StringToInt(info);
		convoquer[client] = GetClientOfUserId(UserID);
		
		if (IsValid(convoquer[client]))
		{
			CPrintToChatAll("({aqua}JUSTICE{unique}) :{fullred} %N {default}est convoqué par{aqua} Mr.%N {unique}au tribunal.", convoquer[client], client);
			
			for (new i = 1; i <= MaxClients; i++)
			{
				if (IsValid(i))
				{
					if (IsGardeOnu(i) || IsMarshall(i))
					{
						CPrintToChat(i, "({aqua}RADIO{unique}) :{fullred} %N {unique}est convoqué au tribunal, ramenez le !", convoquer[client]);
					}
				}
			}
			
			if (jailtime[convoquer[client]] > 0)
			{
				for (new i = 1; i <= MaxClients; i++)
				{
					if (IsValid(i) && IsPolice(i))
					{	
						CPrintToChat(i, "({aqua}RADIO{unique}) :{fullred} %N {unique}est convoqué, veuillez le transférer de la prison au tribunal.", convoquer[client]);
					}
				}
			}
			
			if (IsPlayerAlive(convoquer[client]))
			{
				SetEntityRenderColor(convoquer[client], 255, 255, 0, 255);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Le joueur %s est déconnecter.", g_bPrefix, info);
		}
	}
}

public Action:Command_Fakejob(client, args)
{
	if (IsDetective(client) || IsInFakeJob[client])
	{
		if (!IsInFakeJob[client]) {
			new randomRankId = GetRandomInt(3, 18);
			while (randomRankId == 12 || randomRankId == 14)
			{
				randomRankId = GetRandomInt(3, 18);
			}
			new randomJobId = GetRandomInt(3, 6);
			CS_SwitchTeam(client, 2);
			decl String:ClanTagRankName[40];
			
			beforeCouvertureRankId[client] = rankid[client];
			beforeCouvertureJobId[client] = jobid[client];
			rankid[client] = randomJobId;
			jobid[client] = randomRankId;
			GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
			CS_SetClientClanTag(client, ClanTagRankName);
			IsInFakeJob[client] = true;
			CPrintToChat(client, "%s : Vous êtes sous {blue}couverture{default} en tant que {blue}%s{default} !", g_bPrefix, ClanTagRankName);
			EmitSoundToClient(client, "sound/roleplay/sound_effects/couverture.mp3");
		} else {
			decl String:ClanTagRankName[40];

			rankid[client] = beforeCouvertureRankId[client];
			jobid[client] = beforeCouvertureJobId[client];
			GetClanTagName(client, rankid[client], jobid[client], ClanTagRankName, sizeof(ClanTagRankName));
			CS_SetClientClanTag(client, ClanTagRankName);
			if (IsDetectiveLeader(client)) {
				CS_SwitchTeam(client, 3);
			}
			IsInFakeJob[client] = false;
			CPrintToChat(client, "%s : Vous n'êtes {red}plus{default} sous {blue}couverture{default} !", g_bPrefix);
		}	
		
	}
	else
	{
		CPrintToChat(client, "%s : Vous n'avez pas le droit de faire ça !", g_bPrefix);
	}

	return Plugin_Handled;
}

public Action:Command_Jugement(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (IsPresidentJustice(client) || IsHautJuge(client) || IsJuge(client))
		{
			new Ent = GetClientAimTarget(client, true);
			
			if (Ent != -1)
			{
				if (IsInJustice(client))
				{
					if (IsInJustice(Ent))
					{
						if (!IsPolice(Ent) && !IsJustice(Ent))
						{
							decl String:Buffer[32];
							new Handle:Jugement = CreateMenu(Menu_Jugement);
							SetMenuTitle(Jugement, "Choissisez un jugement :");
							
							if (jailtime[Ent] > 0)
							{
								Format(Buffer, sizeof(Buffer), "%i_1", Ent);
								AddMenuItem(Jugement, Buffer, "Relaxer le joueur");
								
								Format(Buffer, sizeof(Buffer), "%i_2", Ent);
								AddMenuItem(Jugement, Buffer, "Réduire le temps de prison de moitié");
								
								Format(Buffer, sizeof(Buffer), "%i_3", Ent);
								AddMenuItem(Jugement, Buffer, "Doubler le temps de prison");
							}
							
							Format(Buffer, sizeof(Buffer), "%i_4", Ent);
							AddMenuItem(Jugement, Buffer, "Emprisonner le joueur 4H");
							
							Format(Buffer, sizeof(Buffer), "%i_5", Ent);
							AddMenuItem(Jugement, Buffer, "Emprisonner le joueur 6H");
							
							Format(Buffer, sizeof(Buffer), "%i_9", Ent);
							AddMenuItem(Jugement, Buffer, "Emprisonner le joueur 8H");
							
							Format(Buffer, sizeof(Buffer), "%i_6", Ent);
							AddMenuItem(Jugement, Buffer, "Emprisonner le joueur 12H");
							
							Format(Buffer, sizeof(Buffer), "%i_7", Ent);
							AddMenuItem(Jugement, Buffer, "Emprisonner le joueur 24H");
							
							DisplayMenu(Jugement, client, MENU_TIME_FOREVER);
						}
						else
						{
							CPrintToChat(client, "%s : Vous ne pouvez pas juger un membre du gouvernement.", g_bPrefix);
						}
					}
					else
					{
						CPrintToChat(client, "%s : L'accusé doit être dans le tribunal pour être jugé.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Vous devez être dans le tribunal pour rendre un jugement.", g_bPrefix);
				}				
			}
			else
			{
				CPrintToChat(client, "%s : Vous devez viser l'accusé.", g_bPrefix);
			}
		}
		else if (IsAvocat(client))
		{
			CPrintToChat(client, "%s : Seul les juges peuvent juger un joueur.", g_bPrefix);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Menu_Jugement(Handle:Jugement, MenuAction:action, param1, param2)
{
	if (IsValid(param1))
	{
		if (action == MenuAction_Select)
		{
			decl String:info[32];
			GetMenuItem(Jugement, param2, info, sizeof(info));
			
			decl String:Buffer[8][32];
			ExplodeString(info, "_", Buffer, 2, 32);
			
			new cible = StringToInt(Buffer[0]);
			
			if (cible)
			{
				if (StrEqual(Buffer[1], "1"))
				{
					FreePlayer(cible);
					
					CPrintToChatAll("%s : %N à décidé de {green}relaxer{unique} %N !", g_bPrefix, param1, cible);
				}
				if (StrEqual(Buffer[1], "2"))
				{
					jailtime[cible] -= (jailtime[cible] / 2);
					
					JailSpawnClient(cible);
					
					CPrintToChatAll("%s : Le Juge %N à décidé de {green}réduire{unique} la peine de %N de moitié.", g_bPrefix, param1, cible);
				}
				if (StrEqual(Buffer[1], "3"))
				{
					jailtime[cible] *= 2;
					
					JailSpawnClient(cible);
					
					CPrintToChatAll("%s : Le Juge %N à décidé de {red}doubler{unique} la peine de %N.", g_bPrefix, param1, cible);
				}
				if (StrEqual(Buffer[1], "4"))
				{
					jailtime[cible] = 240;
					setClientInJail(cible, 1);
					
					JailSpawnClient(cible);
					
					SetAmande(param1, cible, 100);
					
					CPrintToChatAll("%s : Le Juge %N à décidé {red}d'emprisonner{unique} %N durant {red}4H.", g_bPrefix, param1, cible);
				}
				if (StrEqual(Buffer[1], "5"))
				{
					jailtime[cible] = 360;
					setClientInJail(cible, 1);
					
					JailSpawnClient(cible);
					
					SetAmande(param1, cible, 150);
					
					CPrintToChatAll("%s : Le Juge %N à décidé {red}d'emprisonner{unique} %N durant {red}6H.", g_bPrefix, param1, cible);
				}
				if (StrEqual(Buffer[1], "6"))
				{
					jailtime[cible] = 720;
					setClientInJail(cible, 1);
					
					JailSpawnClient(cible);
					
					SetAmande(param1, cible, 300);
					
					CPrintToChatAll("%s : Le Juge %N à décidé {red}d'emprisonner{unique} %N durant {red}12H.", g_bPrefix, param1, cible);
				}
				if (StrEqual(Buffer[1], "7"))
				{
					jailtime[cible] = 1440;
					setClientInJail(cible, 1);
					
					JailSpawnClient(cible);
					
					SetAmande(param1, cible, 600);
					
					CPrintToChatAll("%s : Le Juge %N à décidé {red}d'emprisonner{unique} %N durant {red}24H.", g_bPrefix, param1, cible);
				}
				
				if (StrEqual(Buffer[1], "9"))
				{
					jailtime[cible] = 480;
					setClientInJail(cible, 1);
					
					JailSpawnClient(cible);
					
					SetAmande(param1, cible, 200);
					
					CPrintToChatAll("%s : Le Juge %N à décidé {red}d'emprisonner{unique} %N durant {red}8H.", g_bPrefix, param1, cible);
				}
				
				SetEntityMoveType(cible, MOVETYPE_WALK);
				SetClientListeningFlags(cible, VOICE_MUTED);
				
				disarm(cible);
				
				GivePlayerItem(cible, "weapon_knife");
				
				SetEntityRenderColor(cible, 255, 255, 255, 255);
			}
		}
		else
		{
			if (action == MenuAction_End)
			{
				CloseHandle(Jugement);
			}
		}
	}
}

public Action:Command_Build(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (0 > 0)
		{
			if (!HasAmeliorationElectronique[client])
			{
				if (HasImprimante[client] < LIMIT_IMPRIMANTE)
				{
					SpawnImprimante(client);
					HasImprimante[client] += 1;
					
					CPrintToChat(client, "%s : Vous avez spawn une imprimante à faux-billets [%i/%d].", g_bPrefix, HasImprimante[client], LIMIT_IMPRIMANTE);
					
				}
				else
				{
					CPrintToChat(client, "%s : Vous avez déjà trop d'imprimantes à faux-billet de posées [%i/%d]", g_bPrefix, HasImprimante[client], LIMIT_IMPRIMANTE);
				}
			}
			else
			{
				if (HasImprimante[client] < LIMIT_IMPRIMANTE_WITH_AMELIORATION)
				{
					SpawnImprimante(client);
					HasImprimante[client] += 1;
					
					CPrintToChat(client, "%s : Vous avez spawn une imprimante à faux-billets [%i/%d].", g_bPrefix, HasImprimante[client], LIMIT_IMPRIMANTE_WITH_AMELIORATION);
					
				}
				else
				{
					CPrintToChat(client, "%s : Vous avez déjà trop d'imprimantes à faux-billet de posées [%i/%d]", g_bPrefix, HasImprimante[client], LIMIT_IMPRIMANTE_WITH_AMELIORATION);
				}
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas d'imprimantes à faux-billets.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public SpawnImprimante(client)
{
	if (IsValidAndAlive(client))
	{
		decl String:SteamId[32];
		decl String:NameProps[100];
		decl Float:_origin[3], Float:_angles[3];
		GetClientEyePosition(client, _origin);
		GetClientEyeAngles(client, _angles);
		
		GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
		
		Format(NameProps, sizeof(NameProps), "%s-%N-imprim", SteamId, client);
		
		new Handle:trace = TR_TraceRayFilterEx( _origin, _angles, MASK_SOLID_BRUSHONLY, RayType_Infinite, TraceEntityFilterPlayers);
		
		if(!TR_DidHit(trace))
		{
			CPrintToChat(client, "%s : Impossible de choisir l'emplacement.", g_bPrefix);
			return;
		}
		
		decl Float:VecAngles[3], Float:position[3], VecOrigin[3], Float:VecDirection[3];
		TR_GetEndPosition(position, trace);
		
		new prop = CreateEntityByName("prop_physics_override");

		if (!IsModelPrecached(MODELS_IMPRIMANTE))
		{
			PrecacheModel(MODELS_IMPRIMANTE);
		}
		
		DispatchKeyValue(prop, "skin", "0");
		DispatchKeyValue(prop, "targetname", NameProps);
		SetEntityModel(prop, MODELS_IMPRIMANTE);
		DispatchKeyValueFloat (prop, "MaxPitch", 360.00);
		DispatchKeyValueFloat (prop, "MinPitch", -360.00);
		DispatchKeyValueFloat (prop, "MaxYaw", 90.00);
		DispatchSpawn(prop);

		GetClientEyeAngles(client, VecAngles);
		GetAngleVectors(VecAngles, VecDirection, NULL_VECTOR, NULL_VECTOR);
		VecOrigin[0] += VecDirection[0] * 32;
		VecOrigin[1] += VecDirection[1] * 32;
		VecOrigin[2] += VecDirection[2] * 1;
		VecAngles[0] = 0.0;
		VecAngles[1] += 180.0;
		VecAngles[2] = 0.0;
		
		DispatchKeyValueVector(prop, "Angles", VecAngles);
		DispatchKeyValue (prop, "health", "200");
		DispatchKeyValue (prop, "ExplodeRadius", "16");
		DispatchKeyValue (prop, "ExplodeDamage", "0");
		DispatchKeyValue (prop, "Damagetype", "1");
		DispatchKeyValue (prop, "PerformanceMode", "0");
		DispatchSpawn(prop);
		
		TeleportEntity(prop, position, NULL_VECTOR, NULL_VECTOR);
		
		printer_owner[prop] = client;
		
		HookSingleEntityOutput(prop, "OnBreak", OnPropPhysBreak);
	}
}

public OnPropPhysBreak(const String:output[], caller, activator, Float:delay)
{
	new owner = printer_owner[caller];
	
	if (IsValid(owner))
	{
		HasImprimante[owner] -= 1;
		
		CPrintToChat(owner, "%s : Vous avez perdu une imprimante de faux-billets.", g_bPrefix);
	}
	
	if (IsValidAndAlive(activator))
	{
		CPrintToChat(activator, "%s : Tu as cassé une imprimante de faux-billets.", g_bPrefix);
	}
	
	printer_owner[caller] = 0;
}

public bool:TraceEntityFilterPlayers( entity, contentsMask, any:data )
{
	return entity > MaxClients && entity != data;
}

public Action:Command_Team(client, Args)
{
	decl String:full[256];
	decl String:message[256];
	
	GetCmdArgString(full, sizeof(full));
	
	if (IsValidAndAlive(client))
	{
		if (Args > 0)
		{
			Format(message, sizeof(message), "{valve}(JOB) {teamcolor}%N : {unique}%s", client, full);
			
			for (new i = 1; i <= MaxClients; i++)
			{
				if (IsValid(i) && jobid[i] == jobid[client])
				{
					CPrintToChatEx(i, client, message);
				}
			}
		}
		else
		{
			CPrintToChat(client, "%s : veuillez entrer un message.", g_bPrefix);
			return Plugin_Handled;
		}
	}
	
	return Plugin_Handled;
}

public ChooseSkin(client)
{
	if (IsValidAndAlive(client))
	{
		if (IsPolice(client)) {
			SetEntityModel(client, SKIN_POLICE_DEFAULT);
		} else {
			if (IsClientInJail(client)) {
				SetEntityModel(client, SKIN_JAIL);
			} else if (IsMafia(client)){
				SetEntityModel(client, SKIN_MAFIA);
			} else if (IsCyberCriminal(client)) {
				SetEntityModel(client, SKIN_CYBERCRIMINAL);
			} else if (IsWildlings(client)) {
				SetEntityModel(client, SKIN_WILDLINGS);
			} else {
				SetEntityModel(client, SKIN_DEFAULT);
			}
		}
	}
}

public Action:Timer_Pub(Handle:timer)
{
	switch (GetRandomInt(1, 5))
	{
		case 1:
		{
			CPrintToChatAll("%s : %s", g_bPrefixPub, g_bPub1);
		}
		
		case 2:
		{
			CPrintToChatAll("%s : %s", g_bPrefixPub, g_bPub2);
		}
		
		case 3:
		{
			CPrintToChatAll("%s : %s", g_bPrefixPub, g_bPub3);
		}
		
		case 4:
		{
			CPrintToChatAll("%s : %s", g_bPrefixPub, g_bPub4);
		}
		
		case 5:
		{
			CPrintToChatAll("%s : %s", g_bPrefixPub, g_bPub5);
		}
	}
}

public SetAmande(juge, cible, price)
{
	if (IsValid(juge) && IsValid(cible))
	{
		if (money[cible] >= price)
		{
			money[cible] -= price;
			
			CPrintToChat(cible, "%s : Vous avez reçu une amende de %i€.", g_bPrefix, price);
		}
		else if (bank[cible] >= price)
		{
			bank[cible] -= price;
			
			CPrintToChat(cible, "%s : Vous avez reçu une amende de %i€.", g_bPrefix, price);
		}
		else
		{
			CPrintToChat(cible, "%s : Vous avez reçu une amende de %i€.", g_bPrefix, price);
			CPrintToChat(cible, "%s : Vous n'avez pas assez d'argent pour l'a payée, 4H de jail supplémentaire vous ont été ajoutés.", g_bPrefix);
			
			jailtime[cible] += 240;
		}
		
		money[juge] += (price / 2);
		capital[jobid[juge]] += (price / 2);
	}
}

public Menu_ArmuFlic(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		
		if (StrEqual(info, "usp"))
		{
			GivePlayerItem(client, "weapon_usp");
		}
		else if (StrEqual(info, "m3"))
		{
			GivePlayerItem(client, "weapon_m3");
		}
		else if (StrEqual(info, "scout"))
		{
			GivePlayerItem(client, "weapon_scout");
		}
		else if (StrEqual(info, "m4"))
		{
			GivePlayerItem(client, "weapon_m4a1");
		}
		else if (StrEqual(info, "famas"))
		{
			GivePlayerItem(client, "weapon_famas");
		}
		else if (StrEqual(info, "mp5"))
		{
			GivePlayerItem(client, "weapon_mp5navy");
		}
		else if (StrEqual(info, "five"))
		{
			GivePlayerItem(client, "weapon_fiveseven");
		}
		else if (StrEqual(info, "deagle"))
		{
			GivePlayerItem(client, "weapon_deagle");
		}
		else if (StrEqual(info, "kevlar"))
		{
			GivePlayerItem(client, "item_assaultsuit");
		}
		else if (StrEqual(info, "soin"))
		{
			if (IsChefPolice(client))
			{
				SetEntityHealth(client, 500);
			}
			else if (IsGti(client))
			{
				SetEntityHealth(client, 500);
			}
			else if (IsCia(client))
			{
				SetEntityHealth(client, 400);
			}
			else if (IsFbi(client))
			{
				SetEntityHealth(client, 300);
			}
			else if (IsPolicier(client))
			{
				SetEntityHealth(client, 200);
			}
			else if (IsGardien(client))
			{
				SetEntityHealth(client, 100);
			}
		}
		
		PickupWeapon[client] = GetTime();
	}
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public Action:Command_3rd(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (Client_IsInThirdPersonMode(client))
		{
			Client_SetThirdPersonMode(client, false);
		}
		else
		{
			Client_SetThirdPersonMode(client, true);
		}
	}
	
	return Plugin_Handled;
}

public RemoveImprimante(client, const String:SteamId[])
{
	if (HasImprimante[client] > 0)
	{
		HasImprimante[client] = 0;
		
		decl String:Buffer[12][150];
		decl String:Model[128];
		
		new maxent = GetMaxEntities(), String:szClass[65], String:Name[200];

		for (new i = MaxClients; i <= maxent; i++)
		{
			if (IsValidEdict(i) && IsValidEntity(i))
			{
				GetEdictClassname(i, szClass, sizeof(szClass));
				GetEntPropString(i, Prop_Data, "m_ModelName", Model, sizeof(Model));
				
				if (StrEqual("prop_physics", szClass) && StrEqual(Model, MODELS_IMPRIMANTE))
				{
					Entity_GetName(i, Name, sizeof(Name));
					
					ExplodeString(Name, "-", Buffer, 3, 150);
					
					if (StrEqual(Buffer[2], "imprim"))
					{
						if (StrEqual(Buffer[0], SteamId))
						{
							RemoveEdict(i);
						}
					}
				}
			}
		}
	}
}

public RemovePlante(client, const String:SteamId[])
{
	if (HasPlante[client] > 0)
	{
		HasPlante[client] = 0;
		
		decl String:Buffer[12][150];
		decl String:Model[128];
		
		new maxent = GetMaxEntities(), String:szClass[65], String:Name[200];

		for (new i = MaxClients; i <= maxent; i++)
		{
			if (IsValidEdict(i) && IsValidEntity(i))
			{
				GetEdictClassname(i, szClass, sizeof(szClass));
				GetEntPropString(i, Prop_Data, "m_ModelName", Model, sizeof(Model));
				
				if (StrEqual("prop_physics", szClass) && StrEqual(Model, MODELS_PLANTE))
				{
					Entity_GetName(i, Name, sizeof(Name));
					
					ExplodeString(Name, "-", Buffer, 3, 150);
					
					if (StrEqual(Buffer[2], "plante"))
					{
						if (StrEqual(Buffer[0], SteamId))
						{
							RemoveEdict(i);
						}
					}
				}
			}
		}
	}
}

public SetLights()
{
	new light_pole = CreateEntityByName("light_dynamic");
	DispatchKeyValueFloat(light_pole, "spotlight_radius", 20.0);
	DispatchKeyValueFloat(light_pole, "distance", 100.0);
	DispatchKeyValue(light_pole, "brightness", "8");
	DispatchKeyValue(light_pole, "_light", "0 0 255 0");
	DispatchKeyValue(light_pole, "style", "0");					
	DispatchKeyValue(light_pole, "renderamt", "200");
	DispatchSpawn(light_pole);
	TeleportEntity(light_pole, Float:{-225.083343, -906.394042, -1247.968750}, NULL_VECTOR, NULL_VECTOR);
	AcceptEntityInput(light_pole, "LightOn");
}

public ShowKnife(client)
{
	if (IsValidAndAlive(client))
	{
		new plyr_gun2 = GetPlayerWeaponSlot(client, 2);
		
		if (IsValidEntity(plyr_gun2) && IsValidEdict(plyr_gun2))
		{
			RemovePlayerItem(client, plyr_gun2);
			
			RemoveEdict(plyr_gun2);
			
			GivePlayerItem(client, "weapon_knife");
		}
		else
		{
			GivePlayerItem(client, "weapon_knife");
		}
	}
}

public VirerChef(client)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			decl String:error[256];
			decl String:query[256];
			
			new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
			
			Format(query, sizeof(query), "SELECT SteamId, PSEUDO, RANKID, LASTONTIME FROM `rp_players` WHERE `JOBID` = 1;");
			new Handle:job_list = SQL_Query(database, query);
			
			new Handle:virer = CreateMenu(Menu_VirerChef);
			
			SetMenuTitle(virer, "Sélectionnez un joueur :");
			
			if (job_list)
			{
				while (SQL_FetchRow(job_list))
				{
					decl String:SteamIdD[64];
					decl String:name[128];
					decl String:Namee[128];
					decl String:TEXT[60];
					
					SQL_FetchString(job_list, 0, SteamIdD, sizeof(SteamIdD));
					SQL_FetchString(job_list, 1, Namee, sizeof(Namee));
					
					new entreprise = SQL_FetchInt(job_list, 2);
					new fitch = SQL_FetchInt(job_list, 3);
					
					if ((GetTime() - 259200) >= fitch)
					{
						Format(name, sizeof(name), "%s - Inactif", Namee);
					}
					else
					{
						Format(name, sizeof(name), "%s - Actif", Namee);
					}
					
					Format(TEXT, sizeof(TEXT), "%i-%s", entreprise, SteamIdD);
					
					decl String:SteamId[64];
					
					GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
					
					if (!StrEqual(SteamIdD, SteamId))
					{
						AddMenuItem(virer, TEXT, name);
					}
				}
			}
			
			DisplayMenu(virer, client, MENU_TIME_FOREVER);
			
			CloseHandle(job_list);
			CloseHandle(database);
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
}

public Menu_VirerChef(Handle:virer, MenuAction:action, client, param2)
{
	if (action == MenuAction_Select)
	{
		decl String:info[32];
		decl String:query[256];
		
		GetMenuItem(virer, param2, info, sizeof(info));
		
		decl String:Buffer[8][32];
		
		ExplodeString(info, "-", Buffer, 2, 32);
		
		new entreprise = StringToInt(Buffer[0]);
		
		decl String:error[256];
		
		new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
		
		Format(query, sizeof(query), "UPDATE `rp_players` SET `JOBID` = 0, `RANKID` = 0 WHERE `SteamId` = '%s';", Buffer[1]);
		SQL_FastQuery(database, query);
		
		new mdr = Client_FindBySteamId(Buffer[1]);
		
		if (mdr != -1)
		{
			if (GetClientTeam(mdr) == 3)
			{
				CS_SwitchTeam(mdr, 2);
			}
			
			employers[jobid[mdr]] -= 1;
			
			rankid[mdr] = 0;
			jobid[mdr] = 0;
			
			decl String:ClanTagRankName[20];
			GetClanTagName(mdr, rankid[mdr], jobid[mdr], ClanTagRankName, sizeof(ClanTagRankName));

			CS_SetClientClanTag(mdr, ClanTagRankName);
			
			InitSalary(mdr);
			
			ChooseSkin(mdr);
			
			CPrintToChat(client, "%s : Vous avez virer %N de votre entreprise.", g_bPrefix, mdr);
			CPrintToChat(mdr, "%s : Le joueur %N vous a virer de son entreprise.", g_bPrefix, client);
		}
		else
		{
			CPrintToChat(client, "%s : Vous avez virer un joueur de votre entreprise.", g_bPrefix);
			
			employers[entreprise] -= 1;
		}
		
		CloseHandle(database);
	}
	else
	{
		if (action == MenuAction_End)
		{
			CloseHandle(virer);
		}
	}
}

public Action:Command_Plante(client, Args)
{
	if (IsValidAndAlive(client))
	{
		if (IsDealer(client))
		{
			if (!IsInCellules(client))
				{
					if (HasPlante[client] < LIMIT_PLANTE)
					{
						SpawnPlante(client);
						HasPlante[client] += 1;
						
						CPrintToChat(client, "%s : Vous avez spawn une Plante de Drogue [%i/%d].", g_bPrefix, HasPlante[client], LIMIT_PLANTE);
					}
					else
					{
						CPrintToChat(client, "%s : Vous avez déjà trop de Plantes de Drogue de posées [%i/%d]", g_bPrefix, HasPlante[client], LIMIT_PLANTE);
					}
				}
			else
			{
				CPrintToChat(client, "%s : Vous ne pouvez pas poser une plante en cellule.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès a cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public SpawnPlante(client)
{
	if (IsValidAndAlive(client))
	{
		decl String:SteamId[32];
		decl String:NameProps[100];
		decl Float:_origin[3], Float:_angles[3];
		GetClientEyePosition(client, _origin);
		GetClientEyeAngles(client, _angles);
		
		GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
		
		Format(NameProps, sizeof(NameProps), "%s-%N-plante", SteamId, client);
		
		new Handle:trace = TR_TraceRayFilterEx( _origin, _angles, MASK_SOLID_BRUSHONLY, RayType_Infinite, TraceEntityFilterPlayers);
		
		if(!TR_DidHit(trace))
		{
			CPrintToChat(client, "%s : Impossible de choisir l'emplacement.", g_bPrefix);
			return;
		}
		
		decl Float:VecAngles[3], Float:position[3], VecOrigin[3], Float:VecDirection[3];
		TR_GetEndPosition(position, trace);
		
		new prop = CreateEntityByName("prop_physics_override");

		if (!IsModelPrecached(MODELS_PLANTE))
		{
			PrecacheModel(MODELS_PLANTE);
		}
		
		DispatchKeyValue(prop, "skin", "0");
		DispatchKeyValue(prop, "targetname", NameProps);
		SetEntityModel(prop, MODELS_PLANTE);
		DispatchKeyValueFloat (prop, "MaxPitch", 360.00);
		DispatchKeyValueFloat (prop, "MinPitch", -360.00);
		DispatchKeyValueFloat (prop, "MaxYaw", 90.00);
		DispatchSpawn(prop);

		GetClientEyeAngles(client, VecAngles);
		GetAngleVectors(VecAngles, VecDirection, NULL_VECTOR, NULL_VECTOR);
		VecOrigin[0] += VecDirection[0] * 32;
		VecOrigin[1] += VecDirection[1] * 32;
		VecOrigin[2] += VecDirection[2] * 1;
		VecAngles[0] = 0.0;
		VecAngles[1] += 180.0;
		VecAngles[2] = 0.0;
		
		DispatchKeyValueVector(prop, "Angles", VecAngles);
		DispatchKeyValue (prop, "health", "200");
		DispatchKeyValue (prop, "ExplodeRadius", "16");
		DispatchKeyValue (prop, "ExplodeDamage", "0");
		DispatchKeyValue (prop, "Damagetype", "1");
		DispatchKeyValue (prop, "PerformanceMode", "0");
		DispatchSpawn(prop);
		
		TeleportEntity(prop, position, NULL_VECTOR, NULL_VECTOR);
		
		plante_owner[prop] = client;
		
		HookSingleEntityOutput(prop, "OnBreak", OnPlantePhysBreak);
	}
}

public OnPlantePhysBreak(const String:output[], caller, activator, Float:delay)
{
	new owner = plante_owner[caller];
	
	if (IsValid(owner))
	{
		HasPlante[owner] -= 1;
		
		CPrintToChat(owner, "%s : Vous avez perdu une Plante de Drogue.", g_bPrefix);
	}
	
	if (IsValidAndAlive(activator))
	{
		CPrintToChat(activator, "%s : Tu as cassé une Plante de Drogue.", g_bPrefix);
	}
	
	plante_owner[caller] = 0;
}

GiveAwayDrogue(client, quantity)
{
	if (IsValid(client))
	{
		switch (GetRandomInt(1, 6))
		{
			case 1:
			{
				CPrintToChat(client, "%s : Vous avez obtenu %i {red}Ecstazy{unique} grâce aux Plantes de Drogues.", g_bPrefix, quantity);
			}
			
			case 2:
			{
				CPrintToChat(client, "%s : Vous avez obtenu %i {red}Cocaine{unique} grâce aux Plantes de Drogues.", g_bPrefix, quantity);
			}
			
			case 3:
			{
				CPrintToChat(client, "%s : Vous avez obtenu %i {red}Heroine{unique} grâce aux Plantes de Drogues.", g_bPrefix, quantity);
			}
			
			case 4:
			{
				CPrintToChat(client, "%s : Vous avez obtenu %i {red}Shit{unique} grâce aux Plantes de Drogues.", g_bPrefix, quantity);
			}
			
			case 5:
			{
				CPrintToChat(client, "%s : Vous avez obtenu %i {red}Weed{unique} grâce aux Plantes de Drogues.", g_bPrefix, quantity);
			}
			
			case 6:
			{
				CPrintToChat(client, "%s : Vous avez obtenu %i {red}Champignons Hallucinogènes{unique} grâce aux Plantes de Drogues.", g_bPrefix, quantity);
			}
		}
	}
}

public Action:Command_Perqui(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsPolice(client))
		{
			if (IsChefPolice(client) || IsGti(client) || IsCia(client) || IsFbi(client))
			{
				CPrintToChatAll("{red}=>{unique} Perquisition de la {blue}Police");
				CPrintToChatAll("{red}=>{unique} Dirigée par {blue}%N", client);
				
				ServerCommand("sm_tsay cyan Perquisition Policière");
			}
			else
			{
				CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public DownloadAndPrecacheDistrib()
{
	AddFileToDownloadsTable("materials/deadlydesire/props/atm/atm.vmt");
	AddFileToDownloadsTable("materials/deadlydesire/props/atm/atm.vtf");
	AddFileToDownloadsTable("models/deadlydesire/props/atm01.dx80.vtx");
	AddFileToDownloadsTable("models/deadlydesire/props/atm01.dx90.vtx");
	AddFileToDownloadsTable("models/deadlydesire/props/atm01.mdl");
	AddFileToDownloadsTable("models/deadlydesire/props/atm01.phy");
	AddFileToDownloadsTable("models/deadlydesire/props/atm01.sw.vtx");
	AddFileToDownloadsTable("models/deadlydesire/props/atm01.vvd");
	
	PrecacheModel("models/deadlydesire/props/atm01.mdl", true);
}

public SetEntity()
{
	new Ent;

	decl String:buffer[256];
	decl String:error[256];
	decl String:entityName[256];
	decl String:entityModel[256];
	new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
	Format(buffer, sizeof(buffer), "SELECT name, pos_x, pos_y, pos_z, ang_x, ang_y, ang_z, model FROM world_entities WHERE map = '%s'", current_map);

	SQL_LockDatabase(database);

	new Handle:query = SQL_Query(database, buffer);
		
	if (query != INVALID_HANDLE)
	{
		while (SQL_FetchRow(query))
		{
			SQL_FetchString(query, 0, entityName, sizeof(entityName));

			SQL_FetchString(query, 7, entityModel, sizeof(entityModel));
			new Float:pos[3] = {0.0, 0.0, 0.0};
			new Float:ang[3] = {0.0, 0.0, 0.0};
			pos[0] = SQL_FetchFloat(query, 1);
			pos[1] = SQL_FetchFloat(query, 2);
			pos[2] = SQL_FetchFloat(query, 3);

			ang[0] = SQL_FetchFloat(query, 4);
			ang[1] = SQL_FetchFloat(query, 5);
			ang[2] = SQL_FetchFloat(query, 6);

			Ent = CreateEntityByName("prop_physics_override", -1);
		
			DispatchKeyValue(Ent, "Solid", "6");
			DispatchKeyValue(Ent, "model", entityModel);
			DispatchKeyValue(Ent, "targetname", entityName);
			SetEntProp(Ent, Prop_Send, "m_CollisionGroup", 5);
			SetEntProp(Ent, Prop_Send, "m_usSolidFlags", 16);
			SetEntProp(Ent, Prop_Send, "m_nSolidType", 6);
			
			DispatchSpawn(Ent);
			
			TeleportEntity(Ent, pos, ang, NULL_VECTOR);
			
			AcceptEntityInput(Ent, "DisableMotion", -1, -1, 0);
			SetEntityMoveType(Ent, MOVETYPE_NONE);
			SetEntProp(Ent, Prop_Data, "m_takedamage", 0, 1);

		}
	}

	SQL_UnlockDatabase(database);
	CloseHandle(query);
	CloseHandle(database);
	
}

public KillWeapon()
{
	new maxent = GetMaxEntities(), String:szClass[65];
	
	for (new i = MaxClients; i <= maxent; i++)
	{
		if(IsValidEdict(i) && IsValidEntity(i))
		{
			GetEdictClassname(i, szClass, sizeof(szClass));
			
			if(StrContains(szClass, "weapon_", false) != -1)
			{
				RemoveEdict(i);
			}
		}
	}
}

public Action:Command_Area(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			g_areaShootCount = 0;
			if (!IsInAreaMod[client])
			{
				CPrintToChat(client, "%s : Mode création de zones activé.", g_bPrefixDev);
				IsInAreaMod[client] = true;
				
				disarm(client);
				GivePlayerItem(client, "weapon_usp");
			}
			else
			{
				CPrintToChat(client, "%s : Mode création de zones désactivé.", g_bPrefixDev);
				IsInAreaMod[client] = false;
				
				disarm(client);
				GivePlayerItem(client, "weapon_knife");
			}
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Validarea(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			if (args <= 1)
			{
				CPrintToChat(client, "%s : veuillez indiquer le job_id et le nom de la planque a qui doit appartenir cette {red}planque{default}.", g_bPrefixDev);
				return Plugin_Handled;
			}
			decl String:arg1[128]; 
			decl String:arg2[50];
			decl String:arg3[22];
			decl String:arg4[25];
			decl String:arg5[23];
			decl String:arg6[25];

			decl String:buffer[400];			
			decl String:error[256];
			new batchId = 1;

			GetCmdArg(1, arg1, sizeof(arg1)); 
			GetCmdArg(2, arg2, sizeof(arg2));

			GetCmdArg(3, arg3, sizeof(arg3));
			GetCmdArg(4, arg4, sizeof(arg4));
			GetCmdArg(5, arg5, sizeof(arg5));
			GetCmdArg(6, arg6, sizeof(arg6));
			
			
			decl String:hideoutName[150];
			Format(hideoutName, sizeof(hideoutName), "%s %s %s %s %s", arg2, arg3, arg4, arg5, arg6);
			TrimString(hideoutName);

			new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));

			Format(buffer, sizeof(buffer), "SELECT IFNULL(MAX(batch_id)+1, 1) FROM hideout");
			new Handle:query = SQL_Query(database, buffer);
			query = SQL_Query(database, buffer);
			
			if (query)
			{
				SQL_Rewind(query);
				
				new bool:fetch = SQL_FetchRow(query);
				
				if (fetch)
				{
					batchId = SQL_FetchInt(query, 0);
				}
				
				CloseHandle(query);
			}
	
			for (new i = 0; i < 2; i++) {
				Format(buffer, sizeof(buffer),"INSERT INTO hideout(map, hideout_name, job_id, x, y, z, batch_id) VALUES ('%s', '%s', '%i', '%f', '%f', '%f', '%i')", current_map, hideoutName, StringToInt(arg1), BUILD_ZONE[i][0], BUILD_ZONE[i][1], BUILD_ZONE[i][2], batchId);
				
				if (!SQL_FastQuery(database, buffer)) {
					SQL_GetError(database, error, sizeof(error));
					PrintToServer("Failed to query from hideout (error: %s)", error);
				}
			}
			CloseHandle(database);
			CPrintToChat(client, "%s : Votre zone à bien été validé ! ({%f, %f, %f}, {%f, %f, %f}).", g_bPrefixDev, BUILD_ZONE[0][1], BUILD_ZONE[0][1], BUILD_ZONE[0][2], BUILD_ZONE[1][1], BUILD_ZONE[1][1], BUILD_ZONE[1][2]);
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Worldentity(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			decl String:entityName[128]; 
			decl String:entityModel[250];

			GetCmdArg(1, entityName, sizeof(entityName)); 
			GetCmdArg(2, entityModel, sizeof(entityModel));


			decl String:buffer[400];			
			decl String:error[256];
			new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
			new Float:pos[3];
			new Float:ang[3];
			GetEntPropVector(client, Prop_Send, "m_vecOrigin", pos);
			GetEntPropVector(client, Prop_Send, "m_angRotation", ang);
			ang[1] = ang[1] - 90;
			Format(buffer, sizeof(buffer),"INSERT INTO world_entities(map, name, pos_x, pos_y, pos_z, ang_x, ang_y, ang_z, model) VALUES ('%s', '%s', '%f', '%f', '%f', '%f', '%f', '%f', '%s')", current_map, entityName, pos[0], pos[1], pos[2], ang[0], ang[1], ang[2], entityModel);
			
			SQL_LockDatabase(database);
			if (!SQL_FastQuery(database, buffer)) {
				SQL_GetError(database, error, sizeof(error));
				PrintToServer("Failed to query from hideout (error: %s)", error);
			} else {
				CPrintToChat(client, "%s : Vous venez de créer l'entité %s avec le model %s !", g_bPrefix, entityName, entityModel);
			}
			SQL_UnlockDatabase(database);
			CloseHandle(database);
		}
	}
}

public Action:Command_Setspawn(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			decl String:spawnName[128]; 

			GetCmdArg(1, spawnName, sizeof(spawnName)); 

			decl String:buffer[400];
			decl String:error[256];
			new Handle:database = SQL_Connect("roleplay", true, error, sizeof(error));
			new Float:pos[3];
			GetEntPropVector(client, Prop_Send, "m_vecOrigin", pos);
			Format(buffer, sizeof(buffer),"INSERT INTO spawns(map, spawn_name, pos_x, pos_y, pos_z) VALUES ('%s', '%s', '%f', '%f', '%f')", current_map, spawnName, pos[0], pos[1], pos[2]);
			
			SQL_LockDatabase(database);
			if (!SQL_FastQuery(database, buffer)) {
				SQL_GetError(database, error, sizeof(error));
				PrintToServer("Failed to query from setspawn (error: %s)", error);
			} else {
				CPrintToChat(client, "%s : Vous venez de créer le spawn {olive}%s{default} !", g_bPrefix, spawnName);
			}
			SQL_UnlockDatabase(database);
			CloseHandle(database);
		}
	}
}

public Action:Command_Buy(client, args)
{
	if (IsValidAndAlive(client))
	{
		decl Ent;
		decl String:Door[255];

		Ent = GetClientAimTarget(client, false);
		if (Ent != -1) {
			GetEdictClassname(Ent, Door, sizeof(Door));
				
			if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door"))
			{
				new HammerID = Entity_GetHammerId(Ent);
				decl String:buffer[400];
				new String:SteamId[64];
				GetClientAuthId(client, AuthId_Steam2, SteamId, sizeof(SteamId));
				
				Format(buffer, sizeof(buffer),"INSERT INTO doors(hammer_id, steam_id, map) VALUES ('%i', '%s', '%s')", HammerID, SteamId, current_map);
				SQL_TQuery(g_ThreadedHandle, CallbackBuyDoor, buffer, client);

			} else {
				CPrintToChat(client, "%s : Vous ne {red}pouvez pas acheter{default} ça !", g_bPrefix);
			}
		} else {
			CPrintToChat(client, "%s : Vous {red}devez{default} être face à une porte !", g_bPrefix);
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Buygroup(client, args)
{
	if (IsValidAndAlive(client)) {
		if (IsRootAdmin(client)) {
			decl Ent;
			decl String:Door[255];
			Ent = GetClientAimTarget(client, false);
			if (Ent != -1) {
				if (args >= 1) {
					decl String:arg1[128];
					decl String:arg2[128];
					
					GetCmdArg(1, arg1, sizeof(arg1));
					new insertId = StringToInt(arg1);
					GetCmdArg(2, arg2, sizeof(arg2));
					new rankId = StringToInt(arg2); 
					
					GetEdictClassname(Ent, Door, sizeof(Door));
							
					if (StrEqual(Door, "func_door_rotating") || StrEqual(Door, "prop_door_rotating") || StrEqual(Door, "func_door")) {
						new HammerID = Entity_GetHammerId(Ent);
						decl String:buffer[400];

						if (args >= 2) {
							Format(buffer, sizeof(buffer),"INSERT INTO doors(hammer_id, job_id, rank_id, map) VALUES ('%i', '%i', '%i', '%s')", HammerID, insertId, rankId, current_map);
						} else {
							Format(buffer, sizeof(buffer),"INSERT INTO doors(hammer_id, job_id, map) VALUES ('%i', '%i', '%s')", HammerID, insertId, current_map);
						}
						PrintToServer("query : %s", buffer);
						SQL_TQuery(g_ThreadedHandle, CallbackBuyDoor, buffer, client);

					} else {
						CPrintToChat(client, "%s : Vous ne {red}pouvez pas acheter{default} ça !", g_bPrefix);
					}
				} else { 
					CPrintToChat(client, "%s : Utilisation de la commande {red}/buygroup {jobid} [{rankid}]{default}.", g_bPrefixDev);
				} 
			} else {
				CPrintToChat(client, "%s : Vous {red}devez{default} être face à une porte !", g_bPrefix);
			}
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_Camera(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (HasWebcamRemote(client)) {
			if (!GetClientIsObserver(client)) {
				BuildPCMenu(client, false);
			} else {
				SetClientIsObserver(client, false);
				SetClientViewEntity(client, client);
				Client_SetObserverMode(client, OBS_MODE_NONE, false);
				Client_SetDrawViewModel(client, true);
				Client_SetFOV(client, 90);
				CPrintToChat(client, "%s : Vous {red}n'êtes plus{default} entrain de regarder à travers votre {olive}webcam{default}.", g_bPrefix);
			}
		} else {
			CPrintToChat(client, "%s : Il vous faut un {olive}Controleur de webcam a distance{default} pour pouvoir consulter votre {olive}webcam{default}.", g_bPrefix);
		}
		
	}
	
	return Plugin_Handled;
}

Handle:BuildPCMenu(client, hack)
{
	decl String:itemType[128];
	new entity = -1;
	new i = 1;
	
	new Handle:Pc = CreateMenu(Menu_SelectPC);
	SetMenuTitle(Pc, "Pc disponibles :");

	while ((entity = FindEntityByClassname(entity, "prop_physics")) != INVALID_ENT_REFERENCE)
	{
		if(IsValidEdict(entity) && IsValidEntity(entity)) {
			new String:Name[200];
			Entity_GetName(entity, Name, sizeof(Name));

			decl String:Buffer[8][32];
			decl String:pcIdentifier[32];
			decl String:pcName[32];
			if (ExplodeString(Name, "_", Buffer, 4, 32) > 2) {
				itemType = Buffer[0];
				if (StringToInt(Buffer[3]) != playerIds[StringToInt(Buffer[2])]) {
					RemoveEdict(entity);
				} else {
					if (StrEqual(itemType, "pc")) {
						if (!hack) {
							if (StringToInt(Buffer[2]) == client) {
								IntToString(entity, pcIdentifier, sizeof(pcIdentifier));
								Format(pcName, sizeof(pcName), "PC #%i", i);
								AddMenuItem(Pc, pcIdentifier, pcName);
								i++;
							}
						} else {
							IntToString(entity, pcIdentifier, sizeof(pcIdentifier));
							decl String:playerName[120];
							GetClientName(StringToInt(Buffer[2]), playerName, sizeof(playerName));
							Format(pcName, sizeof(pcName), "PC de %s #%i", playerName, i);
							AddMenuItem(Pc, pcIdentifier, pcName);
							i++;
						}
					}
				}
			}
		}
	}
	
	DisplayMenu(Pc, client, MENU_TIME_FOREVER);
	return Pc;
}

public Menu_SelectPC(Handle:Pc, MenuAction:action, client, param2)
{
	new String:entityIdentifier[64];
	GetMenuItem(Pc, param2, entityIdentifier, sizeof(entityIdentifier));
	
	if (IsValidAndAlive(client))
	{
		if (StringToInt(entityIdentifier) != 0) {
			SetClientViewEntity(client, StringToInt(entityIdentifier));
			SetClientIsObserver(client, true);
			Client_SetObserverMode(client, OBS_MODE_DEATHCAM, false);
			Client_SetDrawViewModel(client, false);
			Client_SetFOV(client, 120);
			CPrintToChat(client, "%s : Vous êtes entrain de {olive}regarder{default} à travers la {olive}webcam{default}.", g_bPrefix);
		} else {
			CPrintToChat(client, "%s : Vous ne pouvez regarder à travers {red}aucune Webcam{default}.", g_bPrefix);
		}
	}
}

public SetClientIsObserver(client, observer) {
	isObserver[client] = observer;
}

public GetClientIsObserver (client) {
	return isObserver[client];
}

public CallbackBuyDoor(Handle:owner, Handle:hndl, const String:error[], any:client)
{
	PrintToServer("error : %s", error);
	if (hndl == null)
	{
		CPrintToChat(client, "%s : Vous ne {red}pouvez pas acheter{default} cette porte.", g_bPrefix);
	} else {
		ReloadDoorsKV();
		CPrintToChat(client, "%s : Vous {olive}possédez{default} les clés de cette porte.", g_bPrefix);
	}
}

public Action:Command_Entity(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsRootAdmin(client))
		{
			new entity = GetClientAimTarget(client, false);
			
			if (entity != -1)
			{
				if (IsValidEntity(entity))
				{
					new String:Text1[40];
					new String:Text2[40];
					new String:Text3[40];
					new String:Text4[40];
					new String:Text5[260];
					
					new EntHammerId = Entity_GetHammerId(entity);
					Format(Text1, sizeof(Text1), "Hammer ID : %i", EntHammerId);
					
					new String:szModel[128];
					GetEntPropString(entity, Prop_Data, "m_ModelName", szModel, sizeof(szModel));
					Format(Text2, sizeof(Text2), "Skin : %s", szModel);
					
					new Float:position[3];
					GetEntPropVector(entity, Prop_Send, "m_vecOrigin", position);
					Format(Text3, sizeof(Text3), "Position : %f %f %f", position[0], position[1], position[2]);
					
					new String:szClass[65];
					GetEdictClassname(entity, szClass, sizeof(szClass));
					Format(Text4, sizeof(Text4), "Type : %s", szClass);
					
					new String:szName[255];
					Entity_GetName(entity, szName, sizeof(szName));
					Format(Text5, sizeof(Text5), "Nom : %s", szName);
					
					new Handle:menu = CreateMenu(Menu_Entity);
	
					SetMenuTitle(menu, "Entité n°%i", entity);
					
					AddMenuItem(menu, "", Text1, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", Text2, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", Text3, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", Text4, ITEMDRAW_DISABLED);
					AddMenuItem(menu, "", Text5, ITEMDRAW_DISABLED);
					
					DisplayMenu(menu, client, MENU_TIME_FOREVER);
				}
				else
				{
					CPrintToChat(client, "%s : Veuillez viser une entité valide.", g_bPrefixDev);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Veuillez viser une entité valide.", g_bPrefixDev);
			}
		}
	}
	
	return Plugin_Handled;
}

public Menu_Entity(Handle:menu, MenuAction:action, client, param2)
{
	if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public IsRootAdmin(client)
{
	if (GetUserFlagBits(client) & ADMFLAG_ROOT)
		return true;
	else
		return false;
}

public Action:Command_Braquage(client, args)
{
	if (IsValidAndAlive(client))
	{
		if (IsInCoffreBanque(client))
		{
			if (!IsPolice(client) && GetClientTeam(client) == CS_TEAM_T)
			{
				new CTCount;
				for (new i = 1; i <= MaxClients; i++)
				{
					if (IsClientInGame(i))
					{
						if (IsPolice(i))
						{
							CTCount++;
						}
					}
				}

				if (CTCount >= 2)
				{
					if (!BraquageEnCours)
					{
						new time = GetTime();
						
						if (lastbraquage <= time)
						{
							CPrintToChat(client, "%s : Braquage en cours ...", g_bPrefix);
							CPrintToChat(client, "%s : Vous êtes en train de Braquer la Banque ! Restez-y 1 minute !", g_bPrefix);
							
							for (new i = 1; i <= MaxClients; i++)
							{
								if (IsValid(i) && IsPolice(i))
								{
									CPrintToChat(i, "%s : A TOUTES LES UNITEES, BRAQUAGE A LA BANQUE !!!", g_bPrefix);
								}
							}

							g_braquage[client] = CreateTimer(1.0, Braquage, client, TIMER_REPEAT);

							SetEntityRenderColor(client, 255, 0, 0, 0);
							
							SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime());
							SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 60);

							BraquageEnCours = true;
							braquagetime[client] = 0;
						}
						else
						{
							CPrintToChat(client, "%s : La banque a déjà été braquer récemment, veuillez patienter.", g_bPrefix);
						}
					}
					else
					{
						CPrintToChat(client, "%s : La banque est déjà en cours de braquage.", g_bPrefix);
					}
				}
				else
				{
					CPrintToChat(client, "%s : Il doit y avoir au moins 3 Policiers de connectés pour pouvoir Braquer la Banque !", g_bPrefix);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Vous n'avez pas accès à cette commande.", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous n'êtes pas dans le coffre de la Banque !", g_bPrefix);
		}
	}
}

public Action:Braquage(Handle:timer, any:client)
{
	if (IsClientInGame(client))
	{
		if (IsPlayerAlive(client))
		{
			braquagetime[client] += 1;
			
			if (BraquageEnCours)
			{
				if (braquagetime[client] >= 60)
				{
					if (IsInCoffreBanque(client))
					{
						new random = GetRandomInt(5000, 80000);
						
						CPrintToChat(client, "%s : Vous avez fini de braquer la Banque ! Vous gagnez {green}%i€.", g_bPrefix, (random / 2));
						
						money[client] += (random / 2);
						capital[jobid[client]] += (random / 2);
					}
					else
					{
						CPrintToChat(client, "%s : Vous n'êtes pas rester dans le coffre de la banque !", g_bPrefix);
					}

					SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime());
					SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 0);
					SetEntityRenderColor(client, 255, 255, 255, 255);

					braquagetime[client] = 0;
					BraquageEnCours = false;

					lastbraquage = GetTime();

					CloseHandle(g_braquage[client]);
				}
			}
			else
			{
				CPrintToChat(client, "%s : Il n'y a aucun braquage :o", g_bPrefix);
			}
		}
		else
		{
			CPrintToChat(client, "%s : Vous êtes mort, braquage annulé", g_bPrefix);
			CPrintToChatAll("%s : Braquage annulé, le braqueur est mort.", g_bPrefix);
			
			SetEntPropFloat(client, Prop_Send, "m_flProgressBarStartTime", GetGameTime());
			SetEntProp(client, Prop_Send, "m_iProgressBarDuration", 0);
			SetEntityRenderColor(client, 255, 255, 255, 255);
			
			braquagetime[client] = 0;
			BraquageEnCours = false;
			
			lastbraquage = GetTime();
			
			CloseHandle(g_braquage[client]);
		}
	}
	else
	{
		CPrintToChatAll("%s : Braquage annulé, le braqueur a déconnecter.", g_bPrefix);
		
		lastbraquage = GetTime();
	}
}

public Action:Command_Givemoney(client, args) 
{ 
	if (args >= 2) 
	{ 
		decl String:arg1[128]; 
		decl String:arg2[128]; 
	
		GetCmdArg(1, arg1, sizeof(arg1)); 
		GetCmdArg(2, arg2, sizeof(arg2)); 
	
		new iNum = StringToInt(arg2); 
		
		new Target = Client_FindBySteamId(arg1);
		
		if (Target != -1)
		{
			if (IsClientInGame(Target))
			{
				money[Target] += iNum; 
				CPrintToChat(Target, "%s : Félicitation ! Vous avez reçu %i€ pour votre achat en ligne.", g_bPrefix, iNum); 
			} 
		}
	} 
	else
	{ 
		ReplyToCommand(client, "Usage: sm_givemoney [SteamId] [amount]"); 
	} 
	
	return Plugin_Handled; 
}

public ArePlayersInSameZone (client, ent) {
	if (StrEqual(ZoneUser[client], ZoneUser[ent], false)) {
		return true;
	}
	else {
		return false;
	}
}

public IsPlayerInHisHideout (client) {
	switch (GetClientJobID(client)) {
		case 2:
		{
			return IsInComico(client);
		}
		case 3:
		{
			return IsInDealer(client);
		}
		case 4:
		{
			return IsInBanque(client);
		}
		case 5:
		{
			return IsInBricoleur(client);
		}
		case 6:
		{
			return IsInMafia(client);
		}
		case 7:
		{
			return IsInArmurerie(client);
		}
	}
	return false;
}

IsInComico(client)
{
	if (StrEqual(ZoneUser[client], "Le Commissariat", false)) {
		return true;
	} else {
		return false;
	}
}

IsInHopital(client)
{
	if (StrEqual(ZoneUser[client], "L'Hopital", false)) {
		return true;
	} else {
		return false;
	}
}

IsInArmurerie(client)
{
	if (StrEqual(ZoneUser[client], "L'Armurerie", false)) {
		return true;
	} else {
		return false;
	}
}

IsInCoach(client)
{
	if (StrEqual(ZoneUser[client], "Les Coachs", false)) {
		return true;
	} else {
		return false;
	}
}

IsInBricoleur(client)
{
	if (StrEqual(ZoneUser[client], "Les Bricoleurs", false)) {
		return true;
	} else {
		return false;
	}
}

IsInBanque(client)
{
	if (StrEqual(ZoneUser[client], "La Banque", false)) {
		return true;
	} else {
		return false;
	}
}

IsInLoto(client)
{
	if (StrEqual(ZoneUser[client], "Le Loto", false)) {
		return true;
	} else {
		return false;
	}
}

IsInArtificier(client)
{
	if (StrEqual(ZoneUser[client], "Les Artificiers", false)) {
		return true;
	} else {
		return false;
	}
}

IsInMafia(client)
{
	if (StrEqual(ZoneUser[client], "Les Mafieux", false)) {
		return true;
	} else {
		return false;
	}
}

IsInJustice(client)
{
	if (StrEqual(ZoneUser[client], "Palais de Justice", false)) {
		return true;
	} else {
		return false;
	}
}

IsInTueur(client)
{
	if (StrEqual(ZoneUser[client], "Les Tueurs", false)) {
		return true;
	} else {
		return false;
	}
}

IsInCellules (client) {
	if (StrEqual(ZoneUser[client], "Cellule de prison", false)) {
		return true;
	} else {
		return false;
	}
}

IsInTechnicien(client)
{
	if (StrEqual(ZoneUser[client], "Les Techniciens", false)) {
		return true;
	} else {
		return false;
	}
}

IsInMoniteur(client)
{
	if (StrEqual(ZoneUser[client], "Les Moniteurs", false)) {
		return true;
	} else {
		return false;
	}
}

IsInDetective(client)
{
	if (StrEqual(ZoneUser[client], "Detective", false)) {
		return true;
	} else {
		return false;
	}
}

IsInMacdonald(client)
{
	if (StrEqual(ZoneUser[client], "McDonald", false)) {
		return true;
	} else {
		return false;
	}
}

IsInTriades(client)
{
	if (StrEqual(ZoneUser[client], "La Triade", false)) {
		return true;
	} else {
		return false;
	}
}

IsInHotel(client)
{
	if (StrEqual(ZoneUser[client], "Hotel", false)) {
		return true;
	} else {
		return false;
	}
} 

IsInCoffreBanque(client)
{
	if (StrEqual(ZoneUser[client], "Coffre de la banque", false)) {
		return true;
	} else {
		return false;
	}
}

IsInDealer(client)
{
	if (StrEqual(ZoneUser[client], "Les Dealers", false)) {
		return true;
	} else {
		return false;
	}
}