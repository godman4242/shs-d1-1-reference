package
{
   public class StatsManager
   {
      
      public static var mainTimeLine:*;
      
      internal static var player:MCSPlayer;
      
      internal static var bust:MCSBust;
      
      public static var id:String;
      
      public static var victoryTaunt:String;
      
      public static var friendList:String;
      
      internal static var combo:int;
      
      public static var rank:int;
      
      public static var bounty:int;
      
      private static var honeyPotCheckSum:int;
      
      internal static var serverTimeVariable:int;
      
      internal static var activeQuestStr:String;
      
      public static var clientVersion:Number = 0.682;
      
      public static var FILE_MAPDATA:int = 0;
      
      public static var FILE_ACHIEVEMENTDATA:int = 1;
      
      public static var FILE_NODEDATA:int = 2;
      
      public static var FILE_QUESTDATA:int = 3;
      
      public static var FILE_ITEMDATA:int = 4;
      
      public static var FILE_NPCDATA:int = 5;
      
      public static var FILE_SKILLDATA:int = 6;
      
      public static var FILE_BGDATA:int = 7;
      
      public static var FILE_PREMIUMDATA:int = 8;
      
      public static var FILE_MAPBITMAPDATA:int = 9;
      
      public static var FILE_BGRESOURCE:int = 10;
      
      public static var FILE_IMAGERESOURCE:int = 11;
      
      public static var FILE_MUSICRESOURCE:int = 12;
      
      public static var FILE_SHS3RESOURCE:int = 13;
      
      public static var FILE_SOUNDRESOURCE:int = 14;
      
      public static var FILE_LANG_EN:int = 15;
      
      public static var FILE_LANG_ZHCN:int = 16;
      
      public static var FILE_LANG_JA:int = 17;
      
      public static var TOTALFILECOUNT:int = 18;
      
      public static var xmlFileIdArray:Array = [0,1,2,3,4,5,6,7,8,9];
      
      public static var resourceFileIdArray:Array = [10,11,12,13,14];
      
      public static var embeddedVersionArray:Array = new Array();
      
      public static var levelCap:int = 80;
      
      public static var expArray:Array = [0,550,1450,2950,5150,8350,12150,16350,20900,25900,31400,37400,43500,49850,56550,63900,71900,80300,89100,98300,108000,118300,129300,141100,154100,168100,183100,199100,216100,234100,253100,273100,294100,316100,339300,363300,389300,416800,445800,475800,507300,540300,574300,610300,647800,685800,725800,767800,812300,859300,908300,959300,1012300,1067300,1124300,1183300,1244800,1307800,1372800,1439800,1508800,1578800,1651800,1728800,1808800,1892800,1980800,2071800,2166800,2276800,2404800,2544800,2699800,2862800,3032800,3212800,3400800,3595800,3795800,4025800,4285800,4585800,4935800,5335800,5815800,6365800,6965800,7645800,8395800,9295800,10295800,11495800,12995800,14795800,16895800,19295800,22095800,25395800,29395800];
      
      public static var stageWidth:int = 800;
      
      public static var stageHeight:int = 480;
      
      public static var isFullScreen:Boolean = false;
      
      public static var stageScale:Number = 1;
      
      public static var stageOffsetX:Number = 0;
      
      public static var stageOffsetY:Number = 0;
      
      public static var stageFitWidth:Boolean = false;
      
      public static var stageShowingFriendBar:Boolean = true;
      
      public static var stageBaseWidth:int = 800;
      
      public static var stageBaseHeight:int = 480;
      
      public static var charname:String = "";
      
      public static var stance:int = 1;
      
      internal static var playerStatsCount:int = 44;
      
      private static var playerStats:Vector.<ObfuscatedObject> = new Vector.<ObfuscatedObject>(playerStatsCount);
      
      public static var equipment:Vector.<Item> = new Vector.<Item>(13);
      
      public static var skillStats:Vector.<IntStat> = new Vector.<IntStat>();
      
      public static var inventory:Vector.<Item> = new Vector.<Item>();
      
      public static var questItems:Vector.<Item> = new Vector.<Item>();
      
      public static var intStats:Vector.<ObfusIntStat> = new Vector.<ObfusIntStat>();
      
      public static var booleanStats:Vector.<BooleanStat> = new Vector.<BooleanStat>();
      
      public static var achievementStats:Vector.<ObfusIntStat> = new Vector.<ObfusIntStat>();
      
      public static var activeQuestList:Vector.<ActiveQuest> = new Vector.<ActiveQuest>();
      
      public static var completedQuestList:Vector.<CompletedQuest> = new Vector.<CompletedQuest>();
      
      public static var skillSlots:Vector.<IntStat> = new Vector.<IntStat>(8);
      
      public static var stash:Vector.<Item> = new Vector.<Item>();
      
      public static var facebookid:String = "";
      
      public static var facebookFriends:String = "";
      
      public static var giftNotification:String = "";
      
      public static var key:int = 0;
      
      public static var lever:int = 0;
      
      public static var chatShowing:Boolean = false;
      
      public static var bigMapShowing:Boolean = false;
      
      public static var chatMode:int = 0;
      
      internal static var multiplier:int = Math.random() * 5 + 2;
      
      private static var honeyPot:Vector.<int> = new Vector.<int>(playerStatsCount);
      
      internal static var nextAPUpdate:int = 0;
      
      internal static var nextDTUpdate:int = 0;
      
      internal static var nextWarTurn:int = 0;
      
      public static var purchasesMade:ObfuscatedObject = new ObfuscatedObject();
      
      internal static var APINTERVAL:int = 60;
      
      internal static var DTINTERVAL:int = 2 * 60;
      
      internal static var WARMOVEINTERVAL:int = 60 * 60;
      
      internal static var MAXQUESTS:int = 7;
      
      internal static var MAXDUELTOKENS:int = 30;
      
      internal static var MAJORCUSTOMCLANTHRESHHOLD:int = 40;
      
      internal static var STAT_HP:int = 0;
      
      internal static var STAT_MAXHP:int = 1;
      
      internal static var STAT_HPREGEN:int = 2;
      
      internal static var STAT_CHI:int = 3;
      
      internal static var STAT_MAXCHI:int = 4;
      
      internal static var STAT_CHIREGEN:int = 5;
      
      internal static var STAT_ATTACK:int = 6;
      
      internal static var STAT_DEFENSE:int = 7;
      
      internal static var STAT_SPEED:int = 8;
      
      internal static var STAT_XP:int = 9;
      
      internal static var STAT_LEVEL:int = 10;
      
      internal static var STAT_GOLD:int = 11;
      
      internal static var STAT_HGOLD:int = 12;
      
      internal static var STAT_AP:int = 13;
      
      internal static var STAT_MAXAP:int = 14;
      
      internal static var STAT_DUELTOKENS:int = 15;
      
      internal static var STAT_MAXDUELTOKENS:int = 16;
      
      internal static var STAT_SKILLPOINTS:int = 17;
      
      internal static var STAT_STATPOINTS:int = 18;
      
      internal static var STAT_LOCATION:int = 19;
      
      internal static var STAT_WINS:int = 20;
      
      internal static var STAT_SIDE:int = 21;
      
      internal static var STAT_WARMOVES:int = 22;
      
      internal static var STAT_WARMOVESMADE:int = 23;
      
      internal static var STAT_WARCOINSDONATED:int = 24;
      
      internal static var STAT_DAN:int = 25;
      
      internal static var STAT_MARKEDNODE:int = 26;
      
      internal static var STAT_DRAW:int = 27;
      
      internal static var STAT_FIREATK:int = 28;
      
      internal static var STAT_WINDATK:int = 29;
      
      internal static var STAT_WATERATK:int = 30;
      
      internal static var STAT_EARTHATK:int = 31;
      
      internal static var STAT_COINSINBANK:int = 36;
      
      internal static var STAT_ISFEMALE:int = 37;
      
      internal static var STAT_BUFFTYPE:int = 38;
      
      internal static var STAT_BUFFEXPIRY:int = 39;
      
      internal static var STAT_BUFF2EXPIRY:int = 40;
      
      internal static var STAT_PAIDSTORAGE:int = 41;
      
      internal static var STAT_CHIKAKOLOVE:int = 42;
      
      internal static var STAT_LOCATION_ROOM:int = 43;
      
      internal static var STAT_FIREDEF:int = 200;
      
      internal static var STAT_WINDDEF:int = 201;
      
      internal static var STAT_WATERDEF:int = 202;
      
      internal static var STAT_EARTHDEF:int = 203;
      
      internal static var STAT_CRITICALDMG:int = 204;
      
      internal static var STAT_PIERCINGDMG:int = 205;
      
      internal static var EQ_ARMOR:int = 0;
      
      internal static var EQ_GLOVES:int = 1;
      
      internal static var EQ_HAIR:int = 2;
      
      internal static var EQ_HAT:int = 3;
      
      internal static var EQ_HEAD:int = 4;
      
      internal static var EQ_MASK:int = 5;
      
      internal static var EQ_NECK:int = 6;
      
      internal static var EQ_PANTS:int = 7;
      
      internal static var EQ_SHOES:int = 8;
      
      internal static var EQ_WEAPON:int = 9;
      
      internal static var EQ_SCABBARD:int = 10;
      
      internal static var EQ_ACCESSORY1:int = 11;
      
      internal static var EQ_ACCESSORY2:int = 12;
      
      internal static var BUFF_XP:int = 0;
      
      internal static var BUFF_ATTACK:int = 1;
      
      internal static var BUFF_DEFENSE:int = 2;
      
      internal static var BUFF_SPEED:int = 3;
      
      internal static var BUFF_AP:int = 4;
      
      internal static var BUFF_DUELTOKENS:int = 5;
      
      internal static var BUFF_COINS:int = 6;
      
      internal static var BUFF_RARELOOT:int = 7;
      
      internal static var BUFF_MUTE:int = 8;
      
      internal static var BUFF_FULLMUTE:int = 9;
      
      internal static var BUFF_HELL:int = 10;
      
      internal static var BUFF_INJURED:int = 11;
      
      internal static var BUFF_MODERATOR:int = 12;
      
      public static var censored:Boolean = false;
      
      public static var hasChatNotification:Boolean = true;
      
      public static var recordDuels:Boolean = false;
      
      public static var autoSlash:Boolean = false;
      
      public static var autoAssignStats:Boolean = false;
      
      public static var hideBloodOption:Boolean = false;
      
      public static var doFullScreen:Boolean = false;
      
      public static var skipIntro:Boolean = true;
      
      public static var showNinjaServant:Boolean = true;
      
      internal static var unlimitedAP:Boolean = false;
      
      internal static var superDamage:Boolean = true;
      
      internal static var consoleEnabled:Boolean = true;
      
      internal static var canChangeSide:Boolean = true;
      
      internal static var warCheat:Boolean = false;
      
      internal static var saveToCookie:Boolean = true;
      
      internal static var singleCharacter:Boolean = true;
      
      internal static var impersonateUser:Boolean = false;
      
      internal static var isInvincible:Boolean = true;
      
      internal static var noAggro:Boolean = true;
      
      internal static var canEquipAllSkills:Boolean = false;
      
      internal static var canMultiClient:Boolean = true;
      
      internal static var hideNewFeatures:Boolean = false;
      
      public static var useLocalXML:Boolean = true;
      
      public static var useExternalResource:Boolean = true;
      
      public static var useExternalLang:Boolean = false;
      
      public static var useExternalXML:Boolean = true;
      
      public static var useExternalLogin:Boolean = false;
      
      public static var useFlashVarsLogin:Boolean = false;
      
      public static var language:String = LangManager.ENGLISH;
      
      public static var useCirrus:Boolean = true;
      
      public static var useFMS:Boolean = false;
      
      public static var showFriends:Boolean = true;
      
      public static var skipUpdateGlobalVar:Boolean = true;
      
      public static var offlineModeOnly:Boolean = false;
      
      public static var usePlayerIO:Boolean = true;
      
      public static var usePlayerIODevServer:Boolean = true;
      
      public static var usePlayerIOForDuels:Boolean = true;
      
      public static var server:* = "http://www.strawhatsamuraiduels.com/server/";
      
      public static var cookieName:String = "shsd";
      
      public static var useTestData:Boolean = false;
      
      public static var encryptedResource:Boolean = true;
      
      public static var serverSideDuel:Boolean = false;
      
      public static var showCutsceneTiming:Boolean = true;
      
      public static var hackReported:Boolean = false;
      
      public static var bonusPrizeCollected:Boolean = false;
      
      public static var didRebirth:Boolean = false;
      
      public static var isKongregate:Boolean = false;
      
      public static var isAndroid:Boolean = true;
      
      public static var isIOS:Boolean = false;
      
      public static var isMobile:Boolean = isAndroid || isIOS;
      
      internal static var timeLeft:int = 0;
      
      internal static var pingCounterMax:int = 6480;
      
      internal static var pingCounter:int = pingCounterMax;
      
      internal static var secCounter:int = 0;
      
      internal static var customClanName:String = "Player Clan";
      
      internal static var customClanColor:int = 16737792;
      
      internal static var customClanLogoId:int = 1;
      
      internal static var customClanLogoColor:int = 16777215;
      
      internal static var customClanAcronym:String = "PLC";
      
      internal static var customClanOwned:int = 0;
      
      internal static var customClanFounder:String = "?";
      
      internal static var PLAYERLEVEL:int = 0;
      
      internal static var PLAYERSTAT:int = 1;
      
      internal static var EQUIPMENT:int = 2;
      
      internal static var SKILL:int = 3;
      
      internal static var ITEM:int = 4;
      
      internal static var QUESTITEM:int = 5;
      
      internal static var INTSTAT:int = 6;
      
      internal static var BOOLEANSTAT:int = 7;
      
      internal static var ACTIVEQUEST:int = 8;
      
      internal static var COMPLETEDQUEST:int = 9;
      
      internal static var LOCATION:int = 10;
      
      internal static var TAUNT:int = 11;
      
      internal static var FRIENDLIST:int = 12;
      
      internal static var GLOBALVAR:int = 13;
      
      internal static var SKILLSLOT:int = 14;
      
      internal static var PLAYERSIDE:int = 15;
      
      internal static var PLAYERDAN:int = 16;
      
      internal static var STASH:int = 17;
      
      internal static var OPTIONS:int = 18;
      
      internal static var ACHIEVEMENTSTAT:int = 19;
      
      embeddedVersionArray[FILE_MAPDATA] = 1;
      embeddedVersionArray[FILE_ACHIEVEMENTDATA] = 1;
      embeddedVersionArray[FILE_NODEDATA] = 1;
      embeddedVersionArray[FILE_QUESTDATA] = 1;
      embeddedVersionArray[FILE_ITEMDATA] = 1;
      embeddedVersionArray[FILE_NPCDATA] = 1;
      embeddedVersionArray[FILE_SKILLDATA] = 1;
      embeddedVersionArray[FILE_BGDATA] = 1;
      embeddedVersionArray[FILE_PREMIUMDATA] = 1;
      embeddedVersionArray[FILE_MAPBITMAPDATA] = 1;
      embeddedVersionArray[FILE_BGRESOURCE] = 1;
      embeddedVersionArray[FILE_IMAGERESOURCE] = 1;
      embeddedVersionArray[FILE_MUSICRESOURCE] = 1;
      embeddedVersionArray[FILE_SHS3RESOURCE] = 1;
      embeddedVersionArray[FILE_SOUNDRESOURCE] = 1;
      embeddedVersionArray[FILE_LANG_EN] = 1;
      embeddedVersionArray[FILE_LANG_ZHCN] = 1;
      embeddedVersionArray[FILE_LANG_JA] = 1;
      unlimitedAP = false;
      superDamage = false;
      consoleEnabled = false;
      canChangeSide = false;
      warCheat = false;
      saveToCookie = true;
      singleCharacter = true;
      impersonateUser = false;
      isInvincible = false;
      noAggro = false;
      canEquipAllSkills = false;
      canMultiClient = false;
      hideNewFeatures = true;
      useLocalXML = false;
      useExternalResource = true;
      useExternalLang = true;
      useExternalXML = true;
      hideBloodOption = false;
      useExternalLogin = false;
      useFlashVarsLogin = false;
      skipUpdateGlobalVar = false;
      language = LangManager.ENGLISH;
      offlineModeOnly = false;
      server = "http://www.strawhatsamuraiduels.com/server/";
      skipIntro = false;
      useFMS = false;
      usePlayerIO = true;
      usePlayerIODevServer = false;
      usePlayerIOForDuels = true;
      useTestData = false;
      encryptedResource = true;
      serverSideDuel = false;
      showCutsceneTiming = false;
      isAndroid = true;
      isIOS = false;
      isMobile = isAndroid || isIOS;
      
      public function StatsManager()
      {
         super();
      }
      
      private static function populatePlayerStats(playerStats:Vector.<ObfuscatedObject>) : void
      {
         for(var i:int = 0; i < playerStats.length; i++)
         {
            playerStats[i] = new ObfuscatedObject();
         }
      }
      
      public static function getCharnameHash() : int
      {
         var sum:int = 0;
         for(var i:int = 0; i < charname.length; i++)
         {
            sum += charname.charCodeAt(i) * 2;
         }
         return sum;
      }
      
      public static function toggleBlood() : *
      {
         censored = !censored;
         QueryManager.instance.saveOptions();
      }
      
      public static function toggleNinjaServant() : *
      {
         showNinjaServant = !showNinjaServant;
         QueryManager.instance.saveOptions();
      }
      
      public static function toggleChat() : *
      {
         hasChatNotification = !hasChatNotification;
         QueryManager.instance.saveOptions();
      }
      
      public static function toggleRecordDuel() : *
      {
         recordDuels = !recordDuels;
         QueryManager.instance.saveOptions();
      }
      
      public static function toggleAutoSlash() : *
      {
         autoSlash = !autoSlash;
         QueryManager.instance.saveOptions();
      }
      
      public static function toggleAutoAssignStats() : *
      {
         autoAssignStats = !autoAssignStats;
         QueryManager.instance.saveOptions();
      }
      
      public static function toggleDoFullScreen() : *
      {
         doFullScreen = !doFullScreen;
         QueryManager.instance.saveOptions();
      }
      
      public static function isFacebook() : Boolean
      {
         return facebookid != "";
      }
      
      internal static function reset() : *
      {
         playerStats.fixed = false;
         playerStats = new Vector.<ObfuscatedObject>(playerStatsCount);
         populatePlayerStats(playerStats);
         playerStats.fixed = true;
         equipment.fixed = false;
         equipment.length = 0;
         equipment.fixed = true;
         skillStats.fixed = false;
         skillStats.length = 0;
         skillStats.fixed = true;
         skillSlots.fixed = false;
         skillSlots.length = 0;
         skillSlots.fixed = true;
         inventory.fixed = false;
         inventory.length = 0;
         inventory.fixed = true;
         questItems.fixed = false;
         questItems.length = 0;
         questItems.fixed = true;
         stash.fixed = false;
         stash.length = 0;
         stash.fixed = true;
         intStats.fixed = false;
         intStats.length = 0;
         intStats.fixed = true;
         achievementStats.fixed = false;
         achievementStats.length = 0;
         achievementStats.fixed = true;
         booleanStats.fixed = false;
         booleanStats.length = 0;
         booleanStats.fixed = true;
         activeQuestList.fixed = false;
         activeQuestList.length = 0;
         activeQuestList.fixed = true;
         completedQuestList.fixed = false;
         completedQuestList.length = 0;
         completedQuestList.fixed = true;
         combo = 0;
         nextAPUpdate = -1;
         nextDTUpdate = -1;
         nextWarTurn = -1;
         charname = "";
         customClanName = "Player Clan";
         customClanColor = 16737792;
         customClanLogoId = 1;
         customClanLogoColor = 16777215;
         customClanAcronym = "PLC";
         customClanOwned = 0;
         customClanFounder = "?";
      }
      
      public static function getPlayerStats(index:int) : *
      {
         return playerStats[index].getIntValue();
      }
      
      public static function setPlayerStats(index:int, val:int) : *
      {
         if(index >= playerStatsCount)
         {
            return;
         }
         checkHoneyPot();
         playerStats[index].setIntValue(val);
         honeyPot[index] = val;
         honeyPotCheckSum = calcHoneyPotCheckSum();
      }
      
      internal static function checkHoneyPot() : *
      {
         if(honeyPotCheckSum != calcHoneyPotCheckSum())
         {
            QueryManager.instance.reportHack("pot");
         }
      }
      
      internal static function calcHoneyPotCheckSum() : int
      {
         var total:int = 0;
         for(var i:int = 0; i < honeyPot.length; i++)
         {
            total += honeyPot[i];
         }
         return total;
      }
      
      public static function initNewPlayer(cname:String = "", hairid:int = 0, headid:int = 1, armorid:int = 4017, pantsid:int = 11017, hatid:int = 0, shoesid:int = 12017, isFemale:Boolean = false) : *
      {
         reset();
         charname = cname;
         playerStats.fixed = false;
         setPlayerStats(STAT_HP,10);
         setPlayerStats(STAT_MAXHP,10);
         setPlayerStats(STAT_HPREGEN,1);
         setPlayerStats(STAT_CHI,10);
         setPlayerStats(STAT_MAXCHI,10);
         setPlayerStats(STAT_CHIREGEN,1);
         setPlayerStats(STAT_ATTACK,1);
         setPlayerStats(STAT_DEFENSE,1);
         setPlayerStats(STAT_SPEED,1);
         setPlayerStats(STAT_XP,0);
         setPlayerStats(STAT_LEVEL,1);
         setPlayerStats(STAT_GOLD,100);
         setPlayerStats(STAT_HGOLD,0);
         setPlayerStats(STAT_AP,30);
         setPlayerStats(STAT_MAXAP,30);
         setPlayerStats(STAT_DUELTOKENS,20);
         setPlayerStats(STAT_MAXDUELTOKENS,20);
         setPlayerStats(STAT_SKILLPOINTS,0);
         setPlayerStats(STAT_STATPOINTS,0);
         setPlayerStats(STAT_LOCATION,8382465);
         setPlayerStats(STAT_WINS,0);
         if(isFemale)
         {
            setPlayerStats(STAT_ISFEMALE,1);
         }
         else
         {
            setPlayerStats(STAT_ISFEMALE,0);
         }
         playerStats.fixed = true;
         equipment.fixed = false;
         equipment[EQ_ARMOR] = new Item(armorid,1);
         equipment[EQ_GLOVES] = new Item(0,1);
         equipment[EQ_HAIR] = new Item(hairid,1);
         equipment[EQ_HAT] = new Item(hatid,1);
         equipment[EQ_HEAD] = new Item(headid,1);
         equipment[EQ_MASK] = new Item(0,1);
         equipment[EQ_NECK] = new Item(0,1);
         equipment[EQ_PANTS] = new Item(pantsid,1);
         equipment[EQ_SHOES] = new Item(shoesid,1);
         equipment[EQ_WEAPON] = new Item(0,1);
         equipment[EQ_SCABBARD] = new Item(13100,1);
         equipment[EQ_ACCESSORY1] = new Item(0,1);
         equipment[EQ_ACCESSORY2] = new Item(0,1);
         equipment.fixed = true;
         skillStats.fixed = false;
         skillStats.push(new IntStat(1000,1));
         skillStats.push(new IntStat(1001,1));
         skillStats.push(new IntStat(1002,1));
         skillStats.push(new IntStat(1003,1));
         skillStats.push(new IntStat(1042,1));
         skillStats.push(new IntStat(1049,1));
         skillStats.push(new IntStat(1050,1));
         skillStats.fixed = true;
         skillSlots.fixed = false;
         skillSlots[0] = new IntStat(1003,1);
         skillSlots.fixed = true;
         intStats.fixed = false;
         intStats.push(new ObfusIntStat(30004,4));
         intStats.fixed = true;
      }
      
      public static function update() : *
      {
         var buff2expiry:int = 0;
         var buffexpiry:int = 0;
         serverTimeVariable = QueryManager.instance.getServerTime();
         --pingCounter;
         if(pingCounter <= 0)
         {
            pingCounter = pingCounterMax;
            QueryManager.instance.saveModifiedCharData();
            trace("auto ping");
         }
         --secCounter;
         if(secCounter <= 0)
         {
            secCounter = 24;
            if(nextAPUpdate != -1)
            {
               regenAP(serverTimeVariable);
            }
            updateAPCounter(serverTimeVariable);
            if(nextDTUpdate != -1)
            {
               regenDT(serverTimeVariable);
            }
            updateDTCounter(serverTimeVariable);
            OverworldHUD.instance.warUI.updateWarMoveCounter(serverTimeVariable - nextWarTurn,serverTimeVariable);
            OverworldHUD.instance.payUI.update(serverTimeVariable);
            OverworldHUD.instance.interactUI.update(serverTimeVariable);
            buff2expiry = getPlayerStats(STAT_BUFF2EXPIRY);
            if(buff2expiry != 0)
            {
               if(buff2expiry < serverTimeVariable)
               {
                  setPlayerStats(STAT_BUFF2EXPIRY,0);
               }
               OverworldHUD.instance.updateBuff(BUFF_INJURED,buff2expiry - serverTimeVariable);
            }
            else
            {
               buffexpiry = getPlayerStats(STAT_BUFFEXPIRY);
               if(buffexpiry != 0)
               {
                  if(buffexpiry < serverTimeVariable)
                  {
                     setPlayerStats(STAT_BUFFEXPIRY,0);
                     if(getPlayerStats(STAT_BUFFTYPE) == BUFF_HELL && StageManager.getRoomPrivate() == 8)
                     {
                        StageManager.gotoRoom(257,290,8382465);
                     }
                  }
                  OverworldHUD.instance.updateBuff(getPlayerStats(STAT_BUFFTYPE),buffexpiry - serverTimeVariable);
               }
            }
         }
         DuelModeUI.instance.update();
         OverworldHUD.instance.warUI.update(serverTimeVariable);
         OverworldHUD.instance.worldMapUI.update();
      }
      
      public static function setNextWarTurn() : *
      {
         if(nextWarTurn - QueryManager.instance.getServerTime() < 0)
         {
            nextWarTurn = QueryManager.instance.getServerTime() + WARMOVEINTERVAL;
         }
      }
      
      public static function getWarRank() : int
      {
         var num:int = getStat(STAT_WARMOVESMADE) + int(getStat(STAT_WARCOINSDONATED) / 1000);
         if(num < 12 * 3)
         {
            return 0;
         }
         if(num < 12 * 3 + 12 * 4)
         {
            return 1;
         }
         if(num < 12 * 3 + 12 * 4 + 24 * 4)
         {
            return 2;
         }
         if(num < 12 * 3 + 12 * 4 + 24 * 4 + 36 * 4)
         {
            return 3;
         }
         if(num < 12 * 3 + 12 * 4 + 24 * 4 + 36 * 4 + 48 * 4)
         {
            return 4;
         }
         if(num < 12 * 3 + 12 * 4 + 24 * 4 + 36 * 4 + 48 * 4 + 60 * 5)
         {
            return 5;
         }
         if(num < 12 * 3 + 12 * 4 + 24 * 4 + 36 * 4 + 48 * 4 + 60 * 5 + 72 * 5)
         {
            return 6;
         }
         if(num < 12 * 3 + 12 * 4 + 24 * 4 + 36 * 4 + 48 * 4 + 60 * 5 + 72 * 5 + 84 * 5)
         {
            return 7;
         }
         if(num < 12 * 3 + 12 * 4 + 24 * 4 + 36 * 4 + 48 * 4 + 60 * 5 + 72 * 5 + 84 * 5 + 96 * 5)
         {
            return 8;
         }
         if(num < 5000)
         {
            return 9;
         }
         return 10;
      }
      
      public static function getWarMovesToNextRank() : int
      {
         var num:int = getWarRank();
         if(num == 0)
         {
            return 36;
         }
         if(num == 1)
         {
            return 84;
         }
         if(num == 2)
         {
            return 180;
         }
         if(num == 3)
         {
            return 324;
         }
         if(num == 4)
         {
            return 516;
         }
         if(num == 5)
         {
            return 816;
         }
         if(num == 6)
         {
            return 1176;
         }
         if(num == 7)
         {
            return 1596;
         }
         if(num == 8)
         {
            return 2076;
         }
         if(num == 9)
         {
            return 5000;
         }
         return 5000;
      }
      
      public static function getWarRankName() : String
      {
         var num:int = getWarRank();
         if(num == 0)
         {
            return LangManager.getString(330);
         }
         if(num == 1)
         {
            return LangManager.getString(331);
         }
         if(num == 2)
         {
            return LangManager.getString(332);
         }
         if(num == 3)
         {
            return LangManager.getString(333);
         }
         if(num == 4)
         {
            return LangManager.getString(334);
         }
         if(num == 5)
         {
            return LangManager.getString(335);
         }
         if(num == 6)
         {
            return LangManager.getString(336);
         }
         if(num == 7)
         {
            return LangManager.getString(337);
         }
         if(num == 8)
         {
            return LangManager.getString(338);
         }
         if(num == 9)
         {
            return LangManager.getString(339);
         }
         if(num == 10)
         {
            return LangManager.getString(403);
         }
         return "";
      }
      
      public static function getMaxWarMoves() : int
      {
         var num:int = getWarRank();
         if(num == 0)
         {
            return 3;
         }
         if(num == 1)
         {
            return 4;
         }
         if(num == 2)
         {
            return 4;
         }
         if(num == 3)
         {
            return 4;
         }
         if(num == 4)
         {
            return 4;
         }
         if(num == 5)
         {
            return 5;
         }
         if(num == 6)
         {
            return 5;
         }
         if(num == 7)
         {
            return 5;
         }
         if(num == 8)
         {
            return 5;
         }
         if(num == 9)
         {
            return 5;
         }
         if(num == 10)
         {
            return 6;
         }
         return 3;
      }
      
      public static function resetPingCounter() : *
      {
         pingCounter = pingCounterMax;
      }
      
      public static function refreshStats() : *
      {
         if(getPlayerStats(STAT_HP) > getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP))
         {
            setStat(STAT_HP,getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP));
         }
         if(getPlayerStats(STAT_CHI) > getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI))
         {
            setStat(STAT_CHI,getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI));
         }
         if(getPlayerStats(STAT_AP) >= getPlayerStats(STAT_MAXAP) + findBonusStat(STAT_MAXAP))
         {
            serverTimeVariable = QueryManager.instance.getServerTime();
            nextAPUpdate = -1;
            setStat(STAT_AP,getPlayerStats(STAT_MAXAP) + findBonusStat(STAT_MAXAP));
            timeLeft = 0;
            updateAPCounter(serverTimeVariable);
         }
         if(getPlayerStats(STAT_DUELTOKENS) >= MAXDUELTOKENS)
         {
            serverTimeVariable = QueryManager.instance.getServerTime();
            nextDTUpdate = -1;
            setStat(STAT_DUELTOKENS,MAXDUELTOKENS);
            timeLeft = 0;
            updateDTCounter(serverTimeVariable);
         }
         if(getPlayerStats(STAT_HP) <= 0)
         {
            setPlayerStats(STAT_HP,1);
         }
         if(getPlayerStats(STAT_CHI) < 0)
         {
            setPlayerStats(STAT_CHI,0);
         }
         if(getPlayerStats(STAT_AP) < 0)
         {
            setPlayerStats(STAT_AP,0);
         }
      }
      
      internal static function updateAPCounter(timeVariable:int) : *
      {
         var str:String = null;
         if(getPlayerStats(STAT_MAXAP) == getPlayerStats(STAT_AP))
         {
            InventoryUI.instance.updateAPRegen("");
            OverworldHUD.instance.updateAPtimer("");
         }
         else
         {
            str = String(nextAPUpdate - timeVariable);
            InventoryUI.instance.updateAPRegen(str);
            OverworldHUD.instance.updateAPtimer(str);
         }
      }
      
      internal static function updateDTCounter(timeVariable:int) : *
      {
         var str:String = null;
         if(getPlayerStats(STAT_DUELTOKENS) == MAXDUELTOKENS)
         {
            OverworldHUD.instance.updateTokenTimer("");
         }
         else
         {
            str = String(nextDTUpdate - timeVariable);
            OverworldHUD.instance.updateTokenTimer(str);
         }
      }
      
      public static function regenAP(timeVariable:int) : *
      {
         var timeDiff:int = 0;
         var diff:int = 0;
         var newAP:int = 0;
         var maxAP:int = 0;
         if(timeVariable >= nextAPUpdate)
         {
            timeDiff = timeVariable - nextAPUpdate;
            diff = Math.floor(timeDiff / APINTERVAL) + 1;
            if(StatsManager.hasBuff(StatsManager.BUFF_AP))
            {
               diff *= 2;
            }
            newAP = changeAP(diff);
            maxAP = getPlayerStats(STAT_MAXAP);
            if(newAP >= maxAP)
            {
               nextAPUpdate = -1;
               setStat(STAT_AP,maxAP);
               timeLeft = 0;
            }
            else
            {
               setNextAPUpdate(timeVariable,APINTERVAL - timeDiff % APINTERVAL);
            }
         }
         else
         {
            timeLeft = nextAPUpdate - timeVariable;
         }
      }
      
      public static function regenDT(timeVariable:int) : *
      {
         var timeDiff:int = 0;
         var diff:int = 0;
         var newDT:int = 0;
         var maxDT:int = 0;
         if(timeVariable >= nextDTUpdate)
         {
            timeDiff = timeVariable - nextDTUpdate;
            diff = Math.floor(timeDiff / DTINTERVAL) + 1;
            if(StatsManager.hasBuff(StatsManager.BUFF_DUELTOKENS))
            {
               diff *= 2;
            }
            newDT = changeDT(diff);
            maxDT = MAXDUELTOKENS;
            if(newDT >= maxDT)
            {
               nextDTUpdate = -1;
               setStat(STAT_DUELTOKENS,maxDT);
               timeLeft = 0;
            }
            else
            {
               setNextDTUpdate(timeVariable,DTINTERVAL - timeDiff % DTINTERVAL);
            }
         }
         else
         {
            timeLeft = nextDTUpdate - timeVariable;
         }
      }
      
      public static function initQuestLog() : void
      {
         activeQuestList = new Vector.<ActiveQuest>();
         completedQuestList = new Vector.<CompletedQuest>();
      }
      
      public static function getActiveQuestStep(questID:int) : int
      {
         var length:int = int(activeQuestList.length);
         for(var i:int = 0; i < length; i++)
         {
            if(activeQuestList[i].questID == questID)
            {
               return activeQuestList[i].step;
            }
         }
         return -1;
      }
      
      internal static function checkCompletedQuest(questID:int) : Boolean
      {
         var completedQuest:CompletedQuest = null;
         for(var i:* = int(completedQuestList.length - 1); i >= 0; i--)
         {
            completedQuest = completedQuestList[i];
            if(completedQuest.questID == questID)
            {
               if(completedQuest.completedTime == 0 || completedQuest.completedTime < serverTimeVariable - 24 * 60 * 60)
               {
                  return true;
               }
               return false;
            }
         }
         return false;
      }
      
      internal static function checkNotCompletedQuest(questID:int) : Boolean
      {
         var completedQuest:CompletedQuest = null;
         for(var i:* = int(completedQuestList.length - 1); i >= 0; i--)
         {
            completedQuest = completedQuestList[i];
            if(completedQuest.questID == questID)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function checkCompletedProcGenQuest(nodeid:int, roomid:int, index:int, date:int, forTrade:Boolean) : Boolean
      {
         var completedQuest:CompletedQuest = null;
         for(var i:* = int(completedQuestList.length - 1); i >= 0; i--)
         {
            completedQuest = completedQuestList[i];
            if(completedQuest.questID == -1 && completedQuest.nodeid == nodeid && completedQuest.roomid == roomid && completedQuest.index == index && completedQuest.completedTime == date && completedQuest.forTrade == forTrade)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function checkActiveQuest(questID_step:String) : Boolean
      {
         var questID:int = 0;
         var activeQuest:ActiveQuest = null;
         var strArray:Array = questID_step.split(",");
         var checkStep:int = -1;
         if(strArray.length == 2)
         {
            questID = int(strArray[0]);
            checkStep = int(strArray[1]);
         }
         else
         {
            questID = int(questID_step);
         }
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            activeQuest = activeQuestList[i];
            if(activeQuest.questID == questID)
            {
               if(checkStep == -1)
               {
                  return true;
               }
               return activeQuest.step == checkStep - 1;
            }
         }
         return false;
      }
      
      public static function addActiveQuests(questID:int, forceAdd:Boolean = false) : Boolean
      {
         trace("addActiveQuest" + questID);
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            if(activeQuestList[i].questID == questID)
            {
               return true;
            }
         }
         if(activeQuestList.length < MAXQUESTS || forceAdd)
         {
            activeQuestList.fixed = false;
            activeQuestList.push(new ActiveQuest(questID));
            activeQuestList.fixed = true;
            QueryManager.instance.reportDataModified(ACTIVEQUEST);
            StatsManager.setStat(StatsManager.STAT_MARKEDNODE,activeQuestList.length - 1);
            QueryManager.instance.saveModifiedCharData();
            OverworldHUD.instance.territorymap.refresh();
            return true;
         }
         return false;
      }
      
      public static function setActiveQuest(questID:int, step:int) : *
      {
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            if(activeQuestList[i].questID == questID)
            {
               activeQuestList[i].step = step;
               QueryManager.instance.reportDataModified(ACTIVEQUEST);
               StatsManager.setStat(StatsManager.STAT_MARKEDNODE,i);
               QueryManager.instance.saveModifiedCharData();
               OverworldHUD.instance.territorymap.refresh();
               StageManager.refreshRoomQuestObjects();
               return;
            }
         }
         activeQuestList.fixed = false;
         var activeQuest:ActiveQuest = new ActiveQuest(questID);
         activeQuest.step = step;
         activeQuestList.push(activeQuest);
         activeQuestList.fixed = true;
         QueryManager.instance.reportDataModified(ACTIVEQUEST);
         StatsManager.setStat(StatsManager.STAT_MARKEDNODE,activeQuestList.length - 1);
         QueryManager.instance.saveModifiedCharData();
         OverworldHUD.instance.territorymap.refresh();
         StageManager.refreshRoomQuestObjects();
      }
      
      public static function addProcGenDailyQuest(nodeid:int, roomid:int, npcindex:int, date:int, questType:int, questReason:int, questGiver:int, questTargetLocation:*) : int
      {
         var activeQuest:ActiveQuest = null;
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            if(activeQuestList[i].hasProcGenDailyQuest(nodeid,roomid,npcindex,date,questType == QuestItem.QUEST_TRADE))
            {
               return i;
            }
         }
         if(activeQuestList.length < MAXQUESTS)
         {
            activeQuestList.fixed = false;
            activeQuest = new ActiveQuest(-1);
            activeQuest.setProcGenDailyQuest(nodeid,roomid,npcindex,date,questType,questReason,questGiver,questTargetLocation);
            activeQuestList.push(activeQuest);
            activeQuestList.fixed = true;
            QueryManager.instance.reportDataModified(ACTIVEQUEST);
            return activeQuestList.length - 1;
         }
         return -1;
      }
      
      public static function checkProcGenDailyQuestItem() : int
      {
         var activeQuest:ActiveQuest = null;
         var output:int = -1;
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            activeQuest = activeQuestList[i];
            if(activeQuest.isProcGenDailyQuest && QuestGenerator.instance.playerHasNPCQuestItem(activeQuest))
            {
               activeQuest.procGenNextStep();
               output = i;
            }
         }
         return output;
      }
      
      public static function completeProcGenQuestStep(nodeid:int, roomid:int, index:int, date:int, questType:int) : Boolean
      {
         var currentStep:int = 0;
         var currentID:int = 0;
         var activeQuest:ActiveQuest = null;
         trace("completeProcGenQuestStep: " + nodeid + " " + roomid + " " + index + " " + date + " " + questType);
         var maxStep:int = int(QuestEngine.getQuestData(QuestGenerator.PROCGENQUEST).getStepList().length);
         var max:int = int(activeQuestList.length);
         for(var i:int = 0; i < max; i++)
         {
            activeQuest = activeQuestList[i];
            if(activeQuest.hasProcGenDailyQuest(nodeid,roomid,index,date,questType == QuestItem.QUEST_TRADE))
            {
               currentStep = activeQuestList[i].step;
               if(currentStep < maxStep - 1)
               {
                  activeQuestList[i].procGenNextStep();
                  QueryManager.instance.reportDataModified(ACTIVEQUEST);
                  OverworldHUD.instance.territorymap.refresh();
                  return false;
               }
            }
         }
         return false;
      }
      
      public static function hasProcGenQuestAtLocation(nodeid:int, roomid:int, questType:int) : int
      {
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            if(activeQuestList[i].hasProcGenQuestAtLocation(nodeid,roomid,QueryManager.instance.getServerDate(),questType))
            {
               return i;
            }
         }
         return -1;
      }
      
      public static function getProcGenQuest(nodeid:int, roomid:int, index:int, date:int, forTrade:Boolean) : ActiveQuest
      {
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            if(activeQuestList[i].hasProcGenDailyQuest(nodeid,roomid,index,date,forTrade))
            {
               return activeQuestList[i];
            }
         }
         return null;
      }
      
      public static function completeQuest(questID:int, isProcGenQuest:Boolean = false, forTrade:Boolean = false) : *
      {
         var completedQuest:CompletedQuest = null;
         var activeQuest:ActiveQuest = null;
         var i:* = 0;
         var removedActiveQuest:ActiveQuest = null;
         var max:int = 0;
         var previousquest:int = 0;
         if(isProcGenQuest)
         {
            completedQuest = QuestGenerator.instance.getCompletedQuest(forTrade);
            completedQuestList.fixed = false;
            completedQuestList.push(completedQuest);
            completedQuestList.fixed = true;
            QueryManager.instance.reportDataModified(COMPLETEDQUEST);
            for(i = int(activeQuestList.length - 1); i >= 0; i--)
            {
               activeQuest = activeQuestList[i];
               if(activeQuest.hasProcGenDailyQuest(completedQuest.nodeid,completedQuest.roomid,completedQuest.index,completedQuest.completedTime,forTrade))
               {
                  activeQuestList.fixed = false;
                  activeQuestList.splice(i,1);
                  activeQuestList.fixed = true;
                  if(activeQuest.questType == QuestItem.QUEST_BOUNTYBOARD)
                  {
                     StatsManager.reportAchievementStat(60011,1);
                  }
                  else
                  {
                     StatsManager.reportAchievementStat(60010,1);
                  }
                  QueryManager.instance.reportDataModified(ACTIVEQUEST);
                  break;
               }
            }
            removedActiveQuest = activeQuest;
            if(removedActiveQuest != null)
            {
               if(removedActiveQuest.isForTrade() && removedActiveQuest.targetroomid != -1 && removedActiveQuest.targetnpcindex != -1)
               {
                  for(i = int(activeQuestList.length - 1); i >= 0; i--)
                  {
                     activeQuest = activeQuestList[i];
                     if(activeQuest.hasTarget(removedActiveQuest.targetnodeid,removedActiveQuest.targetroomid,removedActiveQuest.targetnpcindex))
                     {
                        activeQuestList.fixed = false;
                        activeQuestList.splice(i,1);
                        activeQuestList.fixed = true;
                        QueryManager.instance.reportDataModified(ACTIVEQUEST);
                     }
                  }
               }
            }
         }
         else
         {
            trace("completeQuest: " + questID);
            max = int(activeQuestList.length);
            for(i = 0; i < max; i++)
            {
               if(activeQuestList[i].questID == questID)
               {
                  activeQuestList.fixed = false;
                  activeQuestList.splice(i,1);
                  activeQuestList.fixed = true;
                  QueryManager.instance.reportDataModified(ACTIVEQUEST);
                  completedQuestList.fixed = false;
                  if(QuestEngine.getQuestData(questID).type != 1)
                  {
                     if(QuestEngine.getQuestData(questID).type == 3)
                     {
                        completedQuestList.push(new CompletedQuest(questID,serverTimeVariable));
                     }
                     else
                     {
                        completedQuestList.push(new CompletedQuest(questID));
                     }
                  }
                  completedQuestList.fixed = true;
                  QueryManager.instance.reportDataModified(COMPLETEDQUEST);
                  break;
               }
            }
            previousquest = activeQuestList.length - 1;
            if(previousquest >= 0)
            {
               StatsManager.setStat(StatsManager.STAT_MARKEDNODE,previousquest);
               QueryManager.instance.saveModifiedCharData();
               OverworldHUD.instance.territorymap.refresh();
            }
            else
            {
               OverworldHUD.instance.setActiveQuestText("");
            }
            if(questID == 59)
            {
               reportAchievementStat(60025,1,true);
            }
         }
      }
      
      public static function completeQuestStep(questID:int) : Boolean
      {
         var currentStep:int = 0;
         var currentID:int = 0;
         trace("completeQuestStep: " + questID);
         var maxStep:int = int(QuestEngine.getQuestData(questID).getStepList().length);
         var max:int = int(activeQuestList.length);
         for(var i:int = 0; i < max; i++)
         {
            currentID = activeQuestList[i].questID;
            if(currentID == questID)
            {
               currentStep = activeQuestList[i].step;
               if(currentStep < maxStep - 1)
               {
                  activeQuestList[i].nextStep();
                  QueryManager.instance.reportDataModified(ACTIVEQUEST);
                  OverworldHUD.instance.territorymap.refresh();
                  return false;
               }
               completeQuest(questID);
               return true;
            }
         }
         return false;
      }
      
      public static function abandonQuest(activeQuest:ActiveQuest) : Boolean
      {
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            if(activeQuest == activeQuestList[i])
            {
               activeQuestList.fixed = false;
               activeQuestList.splice(i,1);
               activeQuestList.fixed = true;
               QueryManager.instance.reportDataModified(ACTIVEQUEST);
               return true;
            }
         }
         return false;
      }
      
      public static function roomHasActiveQuest(nodeId:int, roomId:int) : Boolean
      {
         var activeQuest:ActiveQuest = null;
         var max:int = int(activeQuestList.length);
         for(var i:int = 0; i < max; i++)
         {
            activeQuest = activeQuestList[i];
            if(activeQuest.getMarkedNode() == nodeId && activeQuest.getMarkedRoom() == roomId)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function roomHasActiveQuestInn(nodeId:int, roomId:int) : Boolean
      {
         var activeQuest:ActiveQuest = null;
         var max:int = int(activeQuestList.length);
         for(var i:int = 0; i < max; i++)
         {
            activeQuest = activeQuestList[i];
            if(activeQuest.getMarkedNode() == nodeId && activeQuest.getMarkedRoom() >= 100 && activeQuest.getMarkedRoom() < 110)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function roomHasActiveQuestGamblingDen(nodeId:int, roomId:int) : Boolean
      {
         var activeQuest:ActiveQuest = null;
         var max:int = int(activeQuestList.length);
         for(var i:int = 0; i < max; i++)
         {
            activeQuest = activeQuestList[i];
            if(activeQuest.getMarkedNode() == nodeId && activeQuest.getMarkedRoom() >= 110 && activeQuest.getMarkedRoom() < 120)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getXP() : int
      {
         return getPlayerStats(STAT_XP);
      }
      
      public static function getLevel() : int
      {
         var currentXP:int = getPlayerStats(STAT_XP);
         for(var q:int = 0; q < 99; q++)
         {
            if(expArray[q] > currentXP)
            {
               return q;
            }
         }
         return 99;
      }
      
      public static function getXPtoLevel() : int
      {
         return expArray[getLevel()] - getPlayerStats(STAT_XP);
      }
      
      public static function getXPLevelThreshhold(level:int) : int
      {
         return expArray[level];
      }
      
      public static function changeXP(num:int) : Boolean
      {
         var i:int = 0;
         var level:int = getLevel();
         var xp:int = changeStat(9,num);
         if(xp < 0)
         {
            setStat(9,0);
         }
         var newlevel:int = getLevel();
         if(!consoleEnabled && newlevel > levelCap)
         {
            QueryManager.instance.reportHack("changeXP levelcap");
            return false;
         }
         var leveldiff:int = newlevel - level;
         if(!consoleEnabled && leveldiff >= 5)
         {
            QueryManager.instance.reportHack("changeXP many levels");
            return false;
         }
         if(leveldiff > 0)
         {
            for(i = 0; i < leveldiff; i++)
            {
               trace("level up!");
               levelUp();
            }
            QueryManager.instance.saveModifiedCharData();
            OverworldHUD.instance.updateHUD();
            NetworkManager.instance.globalAnnouncement("",LangManager.getString(863,[getChatDisplayCharname(),getLevel()]));
            return true;
         }
         OverworldHUD.instance.updateHUD();
         return false;
      }
      
      public static function levelUp() : void
      {
         var statBucket:Array = null;
         var startpos:int = 0;
         var stat:int = 0;
         var i:* = undefined;
         changeStat(STAT_SKILLPOINTS,1);
         changeStat(STAT_STATPOINTS,3);
         setStat(STAT_LEVEL,getLevel());
         if(autoAssignStats)
         {
            statBucket = new Array(STAT_MAXHP,STAT_MAXCHI,STAT_ATTACK,STAT_DEFENSE,STAT_SPEED,STAT_MAXAP);
            startpos = getLevel() % statBucket.length;
            for(i = 0; i < 3; i++)
            {
               if(startpos + i >= statBucket.length)
               {
                  stat = statBucket[startpos + i] - statBucket.length;
               }
               else
               {
                  stat = int(statBucket[startpos + i]);
               }
               if(stat == STAT_MAXHP)
               {
                  changeStat(stat,5);
               }
               else if(stat == STAT_MAXCHI)
               {
                  changeStat(stat,5);
               }
               else if(stat == STAT_MAXAP)
               {
                  changeStat(stat,1);
               }
               else
               {
                  changeStat(stat,1);
               }
               trace("auto stat increase for " + stat);
               changeStat(STAT_STATPOINTS,-1);
            }
         }
         fullHealth();
         setStat(STAT_AP,getPlayerStats(STAT_MAXAP));
         setStat(STAT_DUELTOKENS,MAXDUELTOKENS);
         QueryManager.instance.reportDataModified(PLAYERLEVEL);
         OverworldHUD.instance.updateHUD();
      }
      
      public static function fullHealth() : *
      {
         setStat(STAT_HP,getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP));
         setStat(STAT_CHI,getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI));
         OverworldHUD.instance.updateHUD();
         player.setHP(getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP));
         player.setChi(getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI));
      }
      
      public static function partialHealth() : *
      {
         var maxhp:int = getStat(STAT_MAXHP) + findBonusStat(STAT_MAXHP);
         var newhp:int = maxhp * 0.75;
         if(newhp > maxhp)
         {
            newhp = maxhp;
         }
         setStat(STAT_HP,newhp);
         var maxchi:int = getStat(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI);
         var newchi:int = maxchi * 0.5;
         if(newchi > maxchi)
         {
            newchi = maxchi;
         }
         setStat(STAT_CHI,newchi);
         OverworldHUD.instance.updateHUD();
      }
      
      public static function saveHealthAfterBattle() : *
      {
         var maxhp:int = getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP);
         var newhp:int = getPlayer().getHP() + maxhp / 10 + findBonusStat(STAT_HPREGEN);
         if(newhp > maxhp)
         {
            newhp = maxhp;
         }
         setStat(STAT_HP,newhp);
         var maxchi:int = getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI);
         var newchi:int = getPlayer().getChi() + maxchi / 10 + findBonusStat(STAT_CHIREGEN);
         if(newchi > maxchi)
         {
            newchi = maxchi;
         }
         setStat(STAT_CHI,newchi);
      }
      
      public static function saveHealthAfterBattleNoRegen() : *
      {
         var maxhp:int = getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP);
         var newhp:int = getPlayer().getHP();
         if(newhp > maxhp)
         {
            newhp = maxhp;
         }
         setStat(STAT_HP,newhp);
         var maxchi:int = getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI);
         var newchi:int = getPlayer().getChi();
         if(newchi > maxchi)
         {
            newchi = maxchi;
         }
         setStat(STAT_CHI,newchi);
      }
      
      public static function createPlayer() : MCSPlayer
      {
         if(player == null)
         {
            player = new MCSPlayer();
            player.initMCS(equipment[EQ_ARMOR],equipment[EQ_GLOVES],equipment[EQ_HAIR],equipment[EQ_HAT],equipment[EQ_HEAD],equipment[EQ_MASK],equipment[EQ_NECK],equipment[EQ_PANTS],equipment[EQ_SHOES],equipment[EQ_WEAPON],equipment[EQ_SCABBARD].itemID);
            player.isFriendly = true;
         }
         return player;
      }
      
      public static function createPlayerBust() : MCSBust
      {
         if(bust == null)
         {
            bust = new MCSBust();
            if(equipment[0] == null)
            {
               bust.initMCS(new Item(0),new Item(0),new Item(0),new Item(0),new Item(0),new Item(0));
            }
            else
            {
               bust.initMCS(equipment[EQ_ARMOR],equipment[EQ_HAIR],equipment[EQ_HAT],equipment[EQ_HEAD],equipment[EQ_MASK],equipment[EQ_NECK]);
            }
         }
         return bust;
      }
      
      public static function refreshMCS() : *
      {
         if(getPlayerMCS() != null)
         {
            getPlayerMCS().initMCS(equipment[EQ_ARMOR],equipment[EQ_GLOVES],equipment[EQ_HAIR],equipment[EQ_HAT],equipment[EQ_HEAD],equipment[EQ_MASK],equipment[EQ_NECK],equipment[EQ_PANTS],equipment[EQ_SHOES],equipment[EQ_WEAPON],equipment[EQ_SCABBARD].itemID);
         }
         if(getPlayerBust() != null)
         {
            getPlayerBust().initMCS(equipment[EQ_ARMOR],equipment[EQ_HAIR],equipment[EQ_HAT],equipment[EQ_HEAD],equipment[EQ_MASK],equipment[EQ_NECK]);
         }
      }
      
      public static function getPlayer() : MCSPlayer
      {
         return player;
      }
      
      public static function getPlayerMCS() : MCSCharacter
      {
         if(player == null)
         {
            createPlayer();
         }
         return player.mcs;
      }
      
      public static function getPlayerBust() : MCSBust
      {
         if(bust == null)
         {
            createPlayerBust();
         }
         return bust;
      }
      
      public static function getLocation() : int
      {
         return getPlayerStats(STAT_LOCATION);
      }
      
      public static function initPlayer() : *
      {
         if(equipment[EQ_WEAPON].itemID == 0)
         {
            equipItem(EQ_WEAPON,new Item(13002,1));
         }
         player.initPlayer(0,getPlayerStats(STAT_HP),getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP),getPlayerStats(STAT_CHI),getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI),getPlayerStats(STAT_DEFENSE) + findBonusStat(STAT_DEFENSE),getBaseReload(),getMinDamage(),getDamageRange(),getBaseSlashLength(),getSlashUsage(),getStat(1000),getStat(1001),getStat(1002),getLevel());
         player.initAttackStats(getPlayerStats(STAT_ATTACK) + findBonusStat(STAT_ATTACK),getPlayerStats(STAT_FIREATK) + findBonusStat(STAT_FIREATK),getPlayerStats(STAT_WINDATK) + findBonusStat(STAT_WINDATK),getPlayerStats(STAT_WATERATK) + findBonusStat(STAT_WATERATK),getPlayerStats(STAT_EARTHATK) + findBonusStat(STAT_EARTHATK),findBonusStat(STAT_CRITICALDMG),findBonusStat(STAT_PIERCINGDMG));
         player.initElementDefenseStats(getPlayerStats(STAT_WATERATK) + findBonusStat(STAT_FIREDEF),getPlayerStats(STAT_EARTHATK) + findBonusStat(STAT_WINDDEF),getPlayerStats(STAT_WINDATK) + findBonusStat(STAT_WATERDEF),getPlayerStats(STAT_FIREATK) + findBonusStat(STAT_EARTHDEF));
      }
      
      internal static function getBaseReload() : int
      {
         return 48 + (getPlayerStats(STAT_SPEED) + findBonusStat(STAT_SPEED)) * 6;
      }
      
      internal static function getSkillCooldownModifier() : Number
      {
         var speed:int = getPlayerStats(STAT_SPEED) + findBonusStat(STAT_SPEED);
         if(hasBuff(BUFF_SPEED))
         {
            speed *= 1.5;
         }
         return getSkillCooldownModifierVal(speed);
      }
      
      internal static function getSkillCooldownModifierVal(speed:int) : Number
      {
         if(speed > 300)
         {
            speed = 300;
         }
         return 1 - speed / 300 * 0.5;
      }
      
      internal static function getMinDamage() : int
      {
         var basedamage:int = 0;
         if(equipment[EQ_WEAPON].itemID == 0)
         {
            return int(getPlayerStats(STAT_ATTACK) + findBonusStat(STAT_ATTACK));
         }
         var itemdata:XMLItem = QuestEngine.getItemData(equipment[EQ_WEAPON].itemID);
         if(itemdata == null || equipment[EQ_WEAPON].isBroken())
         {
            if(itemdata == null)
            {
               trace("StatsManager.getMinDamage() - Item: " + equipment[EQ_WEAPON].itemID + " not found");
            }
            basedamage = getPlayerStats(STAT_ATTACK) + findBonusStat(STAT_ATTACK) + 1;
         }
         else
         {
            basedamage = getPlayerStats(STAT_ATTACK) + findBonusStat(STAT_ATTACK) + itemdata.mindamage;
         }
         if(superDamage)
         {
            return 1000;
         }
         return basedamage;
      }
      
      internal static function getDamageRange() : int
      {
         if(equipment[EQ_WEAPON].itemID == 0 || equipment[EQ_WEAPON].isBroken())
         {
            return 0;
         }
         var itemdata:XMLItem = QuestEngine.getItemData(equipment[EQ_WEAPON].itemID);
         if(itemdata == null)
         {
            trace("StatsManager.getDamageRange() - Item: " + equipment[EQ_WEAPON].itemID + " not found");
            return 0;
         }
         return itemdata.maxdamage - itemdata.mindamage;
      }
      
      internal static function getBaseSlashLength() : int
      {
         var speed:int = getPlayerStats(STAT_SPEED) + findBonusStat(STAT_SPEED);
         if(hasBuff(BUFF_SPEED))
         {
            speed *= 1.5;
         }
         return getBaseSlashLengthVal(speed);
      }
      
      internal static function getBaseSlashLengthVal(speed:int) : int
      {
         var maxincrement:int = 90 + getPlayerStats(STAT_DAN) * 5;
         return int(120 + Math.floor(maxincrement * speed / (20 + speed)));
      }
      
      internal static function getSlashUsage() : int
      {
         var itemdata:XMLItem = QuestEngine.getItemData(equipment[EQ_WEAPON].itemID);
         if(itemdata == null || itemdata.slashusage < 48)
         {
            trace("StatsManager.getSlashUsage() - Item: " + equipment[EQ_WEAPON].itemID + " not found");
            return 48;
         }
         return itemdata.slashusage;
      }
      
      public static function findBonusStat(StatID:int, skipWeapon:Boolean = false) : int
      {
         var itemXML:XMLItem = null;
         var item:Item = null;
         var bonus:int = 0;
         var itemid:int = 0;
         var h:int = 0;
         if(StatsManager.equipment == null || StatsManager.equipment.length == 0)
         {
            return 0;
         }
         for(var q:* = 0; q < 13; q++)
         {
            if(q != EQ_HEAD && q != EQ_NECK && q != EQ_SCABBARD && q != EQ_HAIR && !(skipWeapon && q == EQ_WEAPON))
            {
               item = StatsManager.equipment[q];
               if(item != null)
               {
                  itemid = item.itemID;
                  itemXML = QuestEngine.getItemData(itemid);
                  if(itemXML != null)
                  {
                     if(StatID == STAT_DEFENSE)
                     {
                        bonus += int(itemXML.defense);
                     }
                     for(h = 0; h < itemXML.modifierXML.length(); h++)
                     {
                        if(itemXML.modifierXML[h].id == StatID)
                        {
                           bonus += int(itemXML.modifierXML[h].value);
                        }
                     }
                     for(h = 0; h < item.modifiers.length; h++)
                     {
                        if(item.modifiers[h].modifierID == StatID)
                        {
                           bonus += item.modifiers[h].value;
                        }
                     }
                  }
               }
            }
         }
         if(StatID == STAT_MAXHP && bonus + getPlayerStats(STAT_MAXHP) <= 0)
         {
            return -getPlayerStats(STAT_MAXHP) + 1;
         }
         return bonus;
      }
      
      public static function findWeight() : int
      {
         var itemXML:XMLItem = null;
         var item:Item = null;
         var q:int = 0;
         var weight:* = 0;
         for(q = 0; q < inventory.length; q++)
         {
            if(inventory[q].getQuantity() > 0)
            {
               itemXML = QuestEngine.getItemData(inventory[q].itemID);
               if(itemXML != null)
               {
                  weight += itemXML.weight * inventory[q].getQuantity();
               }
            }
         }
         for(q = 0; q < 13; q++)
         {
            if(q != EQ_HEAD && q != EQ_NECK && q != EQ_SCABBARD)
            {
               item = StatsManager.equipment[q];
               if(item != null)
               {
                  itemXML = QuestEngine.getItemData(item.itemID);
                  if(itemXML != null)
                  {
                     weight += itemXML.weight;
                  }
               }
            }
         }
         for(q = 0; q < questItems.length; q++)
         {
            if(questItems[q].getQuantity() > 0)
            {
               itemXML = QuestEngine.getItemData(questItems[q].itemID);
               if(itemXML != null)
               {
                  weight += itemXML.weight * questItems[q].getQuantity();
               }
            }
         }
         return weight;
      }
      
      public static function findBonusStatFrom(StatID:int, equipment:Vector.<Item>) : int
      {
         var item:Item = null;
         var itemXML:XMLItem = null;
         var bonus:int = 0;
         var itemid:int = 0;
         var h:int = 0;
         for(var q:* = 0; q < 13; q++)
         {
            if(q != EQ_HEAD && q != EQ_NECK && q != EQ_SCABBARD)
            {
               item = equipment[q];
               if(item != null)
               {
                  itemid = item.itemID;
                  itemXML = QuestEngine.getItemData(itemid);
                  if(itemXML != null)
                  {
                     if(StatID == STAT_DEFENSE)
                     {
                        bonus += int(itemXML.defense);
                     }
                     for(h = 0; h < itemXML.modifierXML.length(); h++)
                     {
                        if(itemXML.modifierXML[h].id == StatID)
                        {
                           bonus += int(itemXML.modifierXML[h].value);
                        }
                     }
                     for(h = 0; h < item.modifiers.length; h++)
                     {
                        if(item.modifiers[h].modifierID == StatID)
                        {
                           bonus += item.modifiers[h].value;
                        }
                     }
                  }
               }
            }
         }
         return bonus;
      }
      
      public static function checkSetStat() : *
      {
         var newSet:Boolean = false;
         var item:XMLItem = null;
         var h:int = 0;
         var g:* = undefined;
         var bonus:int = 0;
         var itemid:int = 0;
         var setArray:Array = new Array(new Array(),new Array());
         for(var q:* = 0; q < 13; q++)
         {
            newSet = true;
            if(q != 2 && q != 4 && q != 6 && q != 10)
            {
               itemid = StatsManager.equipment[q].itemID;
               item = QuestEngine.getItemData(itemid);
               if(item)
               {
                  for(h = 0; h < item.modifierXML.length(); h++)
                  {
                     if(item.modifierXML[h].id > 100 && item.modifierXML[h].id < 1000)
                     {
                        if(setArray.length > 0)
                        {
                           for(g = 0; g < setArray[0].length; g++)
                           {
                              if(int(item.modifierXML[h].id) == setArray[0][g])
                              {
                                 setArray[1][g] += 1;
                                 newSet = false;
                              }
                           }
                        }
                        if(newSet)
                        {
                           setArray[0].push(int(item.modifierXML[h].id));
                           setArray[1].push(1);
                        }
                     }
                  }
               }
            }
         }
      }
      
      public static function unAssignStatPoints() : *
      {
         setPlayerStats(STAT_MAXHP,10);
         var maxhp:int = getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP);
         setPlayerStats(STAT_HP,maxhp);
         setPlayerStats(STAT_MAXCHI,10);
         var maxchi:int = getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI);
         setPlayerStats(STAT_CHI,maxchi);
         setPlayerStats(STAT_ATTACK,1);
         setPlayerStats(STAT_DEFENSE,1);
         setPlayerStats(STAT_SPEED,1);
         var currentAP:int = getPlayerStats(STAT_AP);
         if(currentAP > 30)
         {
            currentAP = 30;
         }
         setPlayerStats(STAT_AP,currentAP);
         setPlayerStats(STAT_MAXAP,30);
         setPlayerStats(STAT_STATPOINTS,(getLevel() - 1) * 3);
         QueryManager.instance.reportDataModified(PLAYERSTAT);
         QueryManager.instance.saveModifiedCharData();
      }
      
      public static function unAssignSkillPoints() : *
      {
         skillStats.fixed = false;
         skillStats.length = 0;
         skillStats.push(new IntStat(1000,1));
         skillStats.push(new IntStat(1001,1));
         skillStats.push(new IntStat(1002,1));
         skillStats.push(new IntStat(1003,1));
         skillStats.push(new IntStat(1042,1));
         skillStats.push(new IntStat(1049,1));
         skillStats.push(new IntStat(1050,1));
         skillStats.fixed = true;
         skillSlots.fixed = false;
         skillSlots = new Vector.<IntStat>(8);
         skillSlots[0] = new IntStat(1003,1);
         skillSlots.fixed = true;
         setPlayerStats(STAT_SKILLPOINTS,getLevel() - 1 + getPlayerStats(STAT_DAN) * (levelCap - 1));
         QueryManager.instance.reportDataModified(SKILL);
         QueryManager.instance.reportDataModified(SKILLSLOT);
         QueryManager.instance.reportDataModified(PLAYERSTAT);
         QueryManager.instance.saveModifiedCharData();
         OverworldHUD.instance.skillUI.unAssignSkillPoints();
      }
      
      public static function unequipAll() : *
      {
         var itemList:Vector.<Item> = new Vector.<Item>();
         itemList.push(equipment[EQ_HAT]);
         itemList.push(equipment[EQ_ARMOR]);
         itemList.push(equipment[EQ_MASK]);
         itemList.push(equipment[EQ_GLOVES]);
         itemList.push(equipment[EQ_WEAPON]);
         itemList.push(equipment[EQ_PANTS]);
         itemList.push(equipment[EQ_SHOES]);
         itemList.push(equipment[EQ_ACCESSORY1]);
         itemList.push(equipment[EQ_ACCESSORY2]);
         addItemsToInventory(itemList);
         removeEquipment(EQ_HAT);
         removeEquipment(EQ_ARMOR);
         removeEquipment(EQ_MASK);
         removeEquipment(EQ_GLOVES);
         removeEquipment(EQ_WEAPON);
         removeEquipment(EQ_PANTS);
         removeEquipment(EQ_SHOES);
         removeEquipment(EQ_ACCESSORY1);
         removeEquipment(EQ_ACCESSORY2);
         QueryManager.instance.reportDataModified(ITEM);
         equipItem(EQ_ARMOR,new Item(4017,1));
         equipItem(EQ_PANTS,new Item(11017,1));
         equipItem(EQ_SHOES,new Item(12017,1));
         equipItem(EQ_WEAPON,new Item(0,1));
         equipItem(EQ_SCABBARD,new Item(13100,1));
         QueryManager.instance.reportDataModified(EQUIPMENT);
      }
      
      public static function doRebirth() : *
      {
         var activeQuest:ActiveQuest = null;
         didRebirth = true;
         unequipAll();
         setStat(STAT_XP,0);
         if(getPlayerStats(STAT_DAN) == 8)
         {
            changeStat(STAT_HGOLD,20);
         }
         else
         {
            changeStat(STAT_HGOLD,5);
         }
         if(getPlayerStats(STAT_DAN) < 9)
         {
            changeStat(STAT_DAN,1);
         }
         QueryManager.instance.reportDataModified(PLAYERDAN);
         NetworkManager.instance.globalAnnouncement("",LangManager.getString(864,[getChatDisplayCharname(),(getPlayerStats(STAT_DAN) + 1).toString()]));
         skillSlots.fixed = false;
         skillSlots = new Vector.<IntStat>(8);
         skillSlots[0] = new IntStat(1003,1);
         skillSlots.fixed = true;
         QueryManager.instance.reportDataModified(SKILLSLOT);
         for(var i:* = int(activeQuestList.length - 1); i >= 0; i--)
         {
            activeQuest = activeQuestList[i];
            if(activeQuest.isProcGenDailyQuest)
            {
               activeQuestList.splice(i,1);
            }
         }
         QueryManager.instance.reportDataModified(ACTIVEQUEST);
         unAssignStatPoints();
         OverworldHUD.getInstance().screenTransition.setTeleportTarget(8382465,0,200);
         OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORTDOWNED);
      }
      
      public static function leaveClan() : *
      {
         setStat(STAT_SIDE,0);
         setStat(STAT_WARMOVESMADE,0);
         setStat(STAT_WARCOINSDONATED,0);
         QueryManager.instance.delWarSentry(-1,StatsManager.id);
         QueryManager.instance.reportDataModified(PLAYERSTAT);
         QueryManager.instance.saveModifiedCharData();
         OverworldHUD.instance.leaveClan();
      }
      
      public static function isFemale() : Boolean
      {
         return getPlayerStats(STAT_ISFEMALE) == 1;
      }
      
      public static function changeSex() : *
      {
         var isFemale:int = getPlayerStats(STAT_ISFEMALE);
         if(isFemale == 1)
         {
            isFemale = 0;
         }
         else
         {
            isFemale = 1;
         }
         setPlayerStats(STAT_ISFEMALE,isFemale);
         if(isFemale == 0)
         {
            equipItem(EQ_HEAD,new Item(8006,1));
            equipItem(EQ_NECK,new Item(10000,1));
            if(equipment[EQ_ARMOR].itemID == 0 || equipment[EQ_ARMOR].itemID == 4001 || equipment[EQ_ARMOR].itemID == 4000)
            {
               equipItem(EQ_ARMOR,new Item(4000,1));
            }
            if(equipment[EQ_PANTS].itemID == 0 || equipment[EQ_PANTS].itemID == 11001 || equipment[EQ_PANTS].itemID == 11000)
            {
               equipItem(EQ_PANTS,new Item(11000,1));
            }
         }
         else
         {
            equipItem(EQ_HEAD,new Item(8500,1));
            equipItem(EQ_NECK,new Item(10001,1));
            if(equipment[EQ_ARMOR].itemID == 0 || equipment[EQ_ARMOR].itemID == 4001 || equipment[EQ_ARMOR].itemID == 4000)
            {
               equipItem(EQ_ARMOR,new Item(4001,1));
            }
            if(equipment[EQ_PANTS].itemID == 0 || equipment[EQ_PANTS].itemID == 11001 || equipment[EQ_PANTS].itemID == 11000)
            {
               equipItem(EQ_PANTS,new Item(11001,1));
            }
         }
         QueryManager.instance.reportDataModified(PLAYERSTAT);
         QueryManager.instance.reportDataModified(EQUIPMENT);
         QueryManager.instance.saveModifiedCharData();
      }
      
      public static function getSkillSlotCount() : int
      {
         return 3 + getStat(1008);
      }
      
      public static function getCarryingWeight() : int
      {
         return 100 + getStat(1009) * 20;
      }
      
      internal static function setNextAPUpdate(currentTime:int, requiredTime:int) : *
      {
         nextAPUpdate = currentTime + requiredTime;
      }
      
      internal static function setNextDTUpdate(currentTime:int, requiredTime:int) : *
      {
         nextDTUpdate = currentTime + requiredTime;
      }
      
      public static function checkAP(num:int) : Boolean
      {
         if(unlimitedAP)
         {
            return true;
         }
         var ap:int = getPlayerStats(STAT_AP);
         if(num <= ap)
         {
            changeAP(-num);
            return true;
         }
         return false;
      }
      
      public static function getAP() : int
      {
         return getPlayerStats(STAT_AP);
      }
      
      internal static function changeAP(num:int) : int
      {
         var newap:int = changeStat(13,num);
         var maxap:int = getPlayerStats(STAT_MAXAP);
         if(newap > maxap)
         {
            setStat(13,maxap);
            OverworldHUD.instance.updateHUD();
            InventoryUI.instance.updateAP();
            return maxap;
         }
         if(newap < 0)
         {
            setStat(13,0);
            OverworldHUD.instance.updateHUD();
            InventoryUI.instance.updateAP();
            return 0;
         }
         if(nextAPUpdate == -1)
         {
            serverTimeVariable = QueryManager.instance.getServerTime();
            setNextAPUpdate(serverTimeVariable,APINTERVAL);
         }
         OverworldHUD.instance.updateHUD();
         InventoryUI.instance.updateAP();
         return newap;
      }
      
      public static function addMaxAP(num:int) : *
      {
         changeStat(STAT_MAXAP,num);
         if(nextAPUpdate == -1)
         {
            setNextAPUpdate(serverTimeVariable,APINTERVAL);
         }
         OverworldHUD.instance.updateHUD();
      }
      
      public static function changeDT(num:int) : *
      {
         var newdt:int = changeStat(STAT_DUELTOKENS,num);
         var maxdt:int = MAXDUELTOKENS;
         if(newdt > maxdt)
         {
            setStat(STAT_DUELTOKENS,maxdt);
            OverworldHUD.instance.updateHUD();
            return maxdt;
         }
         if(newdt < 0)
         {
            setStat(STAT_DUELTOKENS,0);
            OverworldHUD.instance.updateHUD();
            return 0;
         }
         if(nextDTUpdate == -1)
         {
            serverTimeVariable = QueryManager.instance.getServerTime();
            setNextDTUpdate(serverTimeVariable,DTINTERVAL);
         }
         OverworldHUD.instance.updateHUD();
         return newdt;
      }
      
      public static function addItemsToInventory(itemList:Vector.<Item>, eligibleForItemAnnouncement:Boolean = false) : *
      {
         var item:Item = null;
         var max:int = int(itemList.length);
         for(var i:int = 0; i < max; i++)
         {
            item = itemList[i];
            if(eligibleForItemAnnouncement && item.getShopItemType() == "rare")
            {
               NetworkManager.instance.itemAnnouncement(item);
            }
            if(item != null && item.itemID != 0 && item.itemID != 20059)
            {
               addItemToInventory(item);
            }
         }
      }
      
      public static function addToInventory(id:int) : int
      {
         if(id >= 2000 && id < 30000)
         {
            return changeStat(id,1);
         }
         trace("StatsManager.addToInventory: id out of range");
         return 0;
      }
      
      public static function addItemToInventory(item:Item) : *
      {
         if(item.isQuestItem())
         {
            addSpecialItemToQuestItems(item);
         }
         else
         {
            addSpecialItemToInventory(item);
         }
      }
      
      private static function addSpecialItemToInventory(item:Item) : Item
      {
         inventory.fixed = false;
         if(item.canStack())
         {
            changeStat(item.itemID,item.getQuantity());
         }
         else
         {
            inventory.push(item);
         }
         inventory.fixed = true;
         QueryManager.instance.reportDataModified(ITEM);
         return item;
      }
      
      private static function addSpecialItemToQuestItems(item:Item) : Item
      {
         questItems.fixed = false;
         if(item.canStack())
         {
            changeStat(item.itemID,item.getQuantity());
         }
         else
         {
            questItems.push(item);
         }
         questItems.fixed = true;
         QueryManager.instance.reportDataModified(QUESTITEM);
         return item;
      }
      
      public static function removeItemFromInventory(item:Item) : Boolean
      {
         if(item.isQuestItem())
         {
            return removeSpecialItemFromQuestItems(item);
         }
         return removeSpecialItemFromInventory(item);
      }
      
      private static function removeSpecialItemFromInventory(item:Item) : Boolean
      {
         var found:Boolean = false;
         for(var i:int = 0; i < inventory.length; i++)
         {
            if(inventory[i].equals(item))
            {
               found = true;
               break;
            }
         }
         if(found)
         {
            item = inventory[i];
            if(item.getQuantity() > 1)
            {
               item.changeQuantity(-1);
            }
            else
            {
               inventory.fixed = false;
               inventory.splice(i,1);
               inventory.fixed = true;
            }
            QueryManager.instance.reportDataModified(ITEM);
         }
         return found;
      }
      
      private static function removeSpecialItemFromQuestItems(item:Item) : Boolean
      {
         var found:Boolean = false;
         for(var i:int = 0; i < questItems.length; i++)
         {
            if(questItems[i].equals(item))
            {
               found = true;
               break;
            }
         }
         if(found)
         {
            item = questItems[i];
            if(item.getQuantity() > 1)
            {
               item.changeQuantity(-1);
            }
            else
            {
               questItems.fixed = false;
               questItems.splice(i,1);
               questItems.fixed = true;
            }
            QueryManager.instance.reportDataModified(QUESTITEM);
         }
         return found;
      }
      
      public static function addItemToStash(item:Item) : Item
      {
         var found:Boolean = false;
         var i:int = 0;
         stash.fixed = false;
         if(!item.canStack())
         {
            stash.push(item);
         }
         else
         {
            found = false;
            for(i = 0; i < stash.length; i++)
            {
               if(stash[i].itemID == item.itemID)
               {
                  found = true;
                  stash[i].changeQuantity(1);
                  break;
               }
            }
            if(!found)
            {
               stash.push(new Item(item.itemID));
            }
         }
         stash.fixed = true;
         QueryManager.instance.reportDataModified(STASH);
         return item;
      }
      
      public static function removeItemFromStash(item:Item) : Boolean
      {
         var found:Boolean = false;
         for(var i:int = 0; i < stash.length; i++)
         {
            if(stash[i].equals(item))
            {
               found = true;
               break;
            }
         }
         if(found)
         {
            item = stash[i];
            if(item.getQuantity() > 1)
            {
               item.changeQuantity(-1);
            }
            else
            {
               stash.fixed = false;
               stash.splice(i,1);
               stash.fixed = true;
            }
            QueryManager.instance.reportDataModified(STASH);
         }
         return found;
      }
      
      public static function addGeneratedItemToInventory(itemID:int, nodelvl:int) : Item
      {
         var item:Item = ItemGenerator.instance.generateItem(itemID,nodelvl);
         inventory.fixed = false;
         inventory.push(item);
         inventory.fixed = true;
         QueryManager.instance.reportDataModified(ITEM);
         return item;
      }
      
      public static function updateWeaponUse(num:int = 1) : *
      {
         equipment[EQ_WEAPON].gotUsed(num);
         QueryManager.instance.reportDataModified(EQUIPMENT);
         if(equipment[EQ_WEAPON].isBroken())
         {
            trace("weapon broken");
         }
      }
      
      public static function repairEquippedWeapon(num:int) : *
      {
         equipment[EQ_WEAPON].repair(num);
         QueryManager.instance.reportDataModified(EQUIPMENT);
      }
      
      public static function breakEquippedWeapon() : *
      {
         equipment[EQ_WEAPON].breakWeapon();
         QueryManager.instance.reportDataModified(EQUIPMENT);
      }
      
      public static function getGold() : int
      {
         return getPlayerStats(STAT_GOLD);
      }
      
      internal static function getMaxCoins() : int
      {
         switch(getStat(1011))
         {
            case 0:
               return 1000;
            case 1:
               return 2000;
            case 2:
               return 4000;
            case 3:
               return 6000;
            case 4:
               return 8000;
            case 5:
               return 10000;
            default:
               return 1000;
         }
      }
      
      public static function isCoinPurseFull() : Boolean
      {
         return getPlayerStats(STAT_GOLD) >= getMaxCoins();
      }
      
      public static function changeGold(num:int) : int
      {
         var maxCoins:int = getMaxCoins();
         var newCoins:int = changeStat(11,num);
         if(newCoins > maxCoins)
         {
            newCoins = setStat(11,maxCoins);
         }
         return newCoins;
      }
      
      public static function getHeavenlyGold() : int
      {
         var hgold:int = getPlayerStats(STAT_HGOLD);
         if(usePlayerIO)
         {
            hgold += QueryManagerPIO.instance.getPayVaultCoins();
         }
         return hgold;
      }
      
      public static function addHeavenlyGold(num:int) : *
      {
         changeStat(STAT_HGOLD,num);
      }
      
      private static function changeHeavenlyGold(num:int, callbackSuccess:Function, callbackError:Function) : *
      {
         var currentHGold:* = undefined;
         var deductgold:int = 0;
         if(usePlayerIO)
         {
            currentHGold = getPlayerStats(STAT_HGOLD);
            if(num >= 0 || currentHGold >= -num)
            {
               changeStat(STAT_HGOLD,num);
               callbackSuccess();
            }
            else
            {
               deductgold = -num - currentHGold;
               QueryManagerPIO.instance.debitPayVaultCoins(deductgold,function():*
               {
                  setStat(STAT_HGOLD,0);
                  callbackSuccess();
               },callbackError);
            }
         }
         else
         {
            changeStat(STAT_HGOLD,num);
            callbackSuccess();
         }
      }
      
      public static function spendHeavenlyGold(num:int, callbackSuccess:Function, callbackError:Function) : *
      {
         if(!NetworkManager.instance.isGlobalPIOConnected())
         {
            callbackError();
            return;
         }
         if(getHeavenlyGold() >= num)
         {
            changeHeavenlyGold(-num,callbackSuccess,callbackError);
            changeStat(STAT_CHIKAKOLOVE,num);
            if(OverworldHUD.instance.interactUI.visible)
            {
               OverworldHUD.instance.interactUI.chikako.updateBar();
            }
         }
         else
         {
            callbackError();
         }
      }
      
      public static function increaseHP(num:int) : *
      {
         setPlayerStats(STAT_HP,getPlayerStats(STAT_HP) + num);
         var hp:int = getPlayerStats(STAT_HP);
         var maxhp:int = getPlayerStats(STAT_MAXHP) + findBonusStat(STAT_MAXHP);
         if(hp > maxhp)
         {
            setPlayerStats(STAT_HP,maxhp);
         }
         QueryManager.instance.reportDataModified(PLAYERSTAT);
         OverworldHUD.instance.updateHUD();
      }
      
      public static function increaseChi(num:int) : *
      {
         setPlayerStats(STAT_CHI,getPlayerStats(STAT_CHI) + num);
         var chi:int = getPlayerStats(STAT_CHI);
         var maxchi:int = getPlayerStats(STAT_MAXCHI) + findBonusStat(STAT_MAXCHI);
         if(chi > maxchi)
         {
            setPlayerStats(STAT_CHI,maxchi);
         }
         QueryManager.instance.reportDataModified(PLAYERSTAT);
         OverworldHUD.instance.updateHUD();
      }
      
      public static function getItemQty(id:int) : int
      {
         if(id >= 2000 && id < 30000)
         {
            return getStat(id);
         }
         trace("StatsManager.getItemQty: id out of range");
         return 0;
      }
      
      public static function changeItemQty(id:int, num:int) : int
      {
         if(id >= 2000 && id < 30000)
         {
            return changeStat(id,num);
         }
         trace("StatsManager.changeItemQty: id out of range");
         return 0;
      }
      
      public static function setItemQty(id:int, num:int) : *
      {
         if(id >= 2000 && id < 30000)
         {
            return setStat(id,num);
         }
         trace("StatsManager.setItemQty: id out of range");
         return 0;
      }
      
      public static function getReputation(nodeID:int) : int
      {
         return 100;
      }
      
      public static function getSide() : int
      {
         return getStat(STAT_SIDE);
      }
      
      public static function initCustomClan(_customClanName:String, _customClanColor:int, _customClanLogoId:int, _customClanLogoColor:int, _customClanAcronym:String, _customClanFounder:String, _customClanOwned:int) : *
      {
         customClanName = _customClanName;
         customClanColor = _customClanColor;
         customClanLogoId = _customClanLogoId;
         customClanLogoColor = _customClanLogoColor;
         customClanAcronym = _customClanAcronym;
         customClanFounder = _customClanFounder;
         customClanOwned = _customClanOwned;
      }
      
      public static function isCustomClanFounder() : Boolean
      {
         return charname == customClanFounder;
      }
      
      public static function getCustomClanName() : String
      {
         return customClanName;
      }
      
      public static function getCustomClanColor() : int
      {
         return customClanColor;
      }
      
      public static function getCustomClanAcronym() : String
      {
         return customClanAcronym;
      }
      
      public static function getCustomClanTextColor() : String
      {
         for(var str:String = getCustomClanColor().toString(16); str.length < 6; )
         {
            str = "0" + str;
         }
         return "#" + str;
      }
      
      public static function getCustomClanLogoId() : int
      {
         return customClanLogoId;
      }
      
      public static function getCustomClanLogoColor() : int
      {
         return customClanLogoColor;
      }
      
      public static function getCustomClanOwned() : int
      {
         return customClanOwned;
      }
      
      public static function getEnemyCustomClanColor() : int
      {
         return 3355443;
      }
      
      public static function getEnemyCustomClanTextColor() : String
      {
         return "#666666";
      }
      
      public static function isCustomClan(sideid:int) : Boolean
      {
         return sideid >= 7;
      }
      
      public static function hasKey() : Boolean
      {
         return key > 0;
      }
      
      public static function addKey() : *
      {
         ++key;
      }
      
      public static function removeKey() : *
      {
         --key;
      }
      
      public static function removeAllKey() : *
      {
         key = 0;
      }
      
      public static function hasLever() : Boolean
      {
         return lever == 2;
      }
      
      public static function addLever() : *
      {
         ++lever;
      }
      
      public static function removeAllLever() : *
      {
         lever = 0;
      }
      
      public static function setBigMapShowing(flag:Boolean) : *
      {
         bigMapShowing = flag;
      }
      
      public static function getBigMapShowing() : Boolean
      {
         return bigMapShowing;
      }
      
      public static function setChatShowing(flag:Boolean) : *
      {
         chatShowing = flag;
      }
      
      public static function getChatShowing() : Boolean
      {
         return chatShowing;
      }
      
      internal static function getStatType(id:int) : int
      {
         if(id < 50)
         {
            return PLAYERSTAT;
         }
         if(id < 70)
         {
            return EQUIPMENT;
         }
         if(id < 1000)
         {
            return PLAYERSTAT;
         }
         if(id < 2000)
         {
            return SKILL;
         }
         if(id < 20000)
         {
            return ITEM;
         }
         if(id < 30000)
         {
            return QUESTITEM;
         }
         if(id < 40000)
         {
            return INTSTAT;
         }
         if(id < 50000)
         {
            return BOOLEANSTAT;
         }
         if(id < 60000)
         {
            return GLOBALVAR;
         }
         return ACHIEVEMENTSTAT;
      }
      
      internal static function findSkillStat(id:int) : IntStat
      {
         var intStat:IntStat = null;
         var max:int = int(skillStats.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            intStat = skillStats[i];
            if(intStat.getId() == id)
            {
               return intStat;
            }
         }
         return null;
      }
      
      internal static function removeSkillStat(intStat:IntStat) : *
      {
         var max:int = int(skillStats.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(intStat == skillStats[i])
            {
               skillStats.fixed = false;
               skillStats.splice(i,1);
               skillStats.fixed = true;
               return;
            }
         }
      }
      
      internal static function findInventoryItem(id:int) : Item
      {
         var item:Item = null;
         var max:int = int(inventory.length);
         for(var i:int = 0; i < max; i++)
         {
            item = inventory[i];
            if(item.getItemID() == id && item.getModifierCount() == 0 && item.uses == 0)
            {
               return item;
            }
         }
         return null;
      }
      
      public static function countItemType(id:int) : int
      {
         var max:int = 0;
         var item:Item = null;
         var i:int = 0;
         var count:int = 0;
         if(id < 20000)
         {
            max = int(inventory.length);
            for(i = 0; i < max; i++)
            {
               item = inventory[i];
               if(item.getItemID() == id)
               {
                  count += item.getQuantity();
               }
            }
         }
         else
         {
            max = int(questItems.length);
            for(i = 0; i < max; i++)
            {
               item = questItems[i];
               if(item.getItemID() == id)
               {
                  count += item.getQuantity();
               }
            }
         }
         return count;
      }
      
      internal static function findSpecialInventoryItem(inputitem:Item) : Item
      {
         var max:int = int(inventory.length);
         for(var i:int = 0; i < max; i++)
         {
            if(inventory[i].equals(inputitem))
            {
               return inventory[i];
            }
         }
         return null;
      }
      
      internal static function findSpecialQuestItem(inputitem:Item) : Item
      {
         var max:int = int(questItems.length);
         for(var i:int = 0; i < max; i++)
         {
            if(questItems[i].equals(inputitem))
            {
               return questItems[i];
            }
         }
         return null;
      }
      
      private static function spliceOutInventoryItem(item:Item) : *
      {
         var max:int = int(inventory.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(item == inventory[i])
            {
               inventory.fixed = false;
               inventory.splice(i,1);
               inventory.fixed = true;
               QueryManager.instance.reportDataModified(ITEM);
               return;
            }
         }
      }
      
      internal static function findQuestItem(id:int) : Item
      {
         var item:Item = null;
         var max:int = int(questItems.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            item = questItems[i];
            if(item.getItemID() == id)
            {
               return item;
            }
         }
         return null;
      }
      
      private static function spliceOutQuestItem(item:Item) : *
      {
         var max:int = int(questItems.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(item == questItems[i])
            {
               questItems.fixed = false;
               questItems.splice(i,1);
               questItems.fixed = true;
               return;
            }
         }
      }
      
      internal static function findIntStat(id:int) : ObfusIntStat
      {
         var intStat:ObfusIntStat = null;
         var max:int = int(intStats.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            intStat = intStats[i];
            if(intStat.getId() == id)
            {
               return intStat;
            }
         }
         return null;
      }
      
      internal static function removeIntStat(intStat:ObfusIntStat) : *
      {
         var max:int = int(intStats.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(intStat == intStats[i])
            {
               intStats.fixed = false;
               intStats.splice(i,1);
               intStats.fixed = true;
               return;
            }
         }
      }
      
      internal static function findBooleanStat(id:int) : BooleanStat
      {
         var booleanStat:BooleanStat = null;
         var max:int = int(booleanStats.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            booleanStat = booleanStats[i];
            if(booleanStat.getId() == id)
            {
               return booleanStat;
            }
         }
         return null;
      }
      
      internal static function removeBooleanStat(booleanStat:BooleanStat) : *
      {
         var max:int = int(booleanStats.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(booleanStat == booleanStats[i])
            {
               booleanStats.fixed = false;
               booleanStats.splice(i,1);
               booleanStats.fixed = true;
               return;
            }
         }
      }
      
      internal static function findAchievementStat(id:int) : ObfusIntStat
      {
         var obfusIntStat:ObfusIntStat = null;
         var max:int = int(achievementStats.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            obfusIntStat = achievementStats[i];
            if(obfusIntStat.getId() == id)
            {
               return obfusIntStat;
            }
         }
         return null;
      }
      
      internal static function removeAchievementStat(obfusIntStat:ObfusIntStat) : *
      {
         var max:int = int(achievementStats.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(obfusIntStat == achievementStats[i])
            {
               achievementStats.fixed = false;
               achievementStats.splice(i,1);
               achievementStats.fixed = true;
               return;
            }
         }
      }
      
      public static function equipItem(slotid:int, item:Item) : *
      {
         var pcolor:int = 0;
         var scolor:int = 0;
         if(item.itemID < 20000 && item.itemID > 2999)
         {
            QueryManager.instance.reportDataModified(EQUIPMENT);
            equipment[slotid] = item;
            if(slotid == 9)
            {
               equipment[10] = new Item(item.itemID,1);
               setEquipment(10,item.itemID,pcolor,scolor);
            }
            pcolor = int(item.getPrimaryColor());
            scolor = item.getSecondaryColor();
            setEquipment(slotid,item.itemID,pcolor,scolor);
         }
         else
         {
            trace("not an equippable item");
         }
      }
      
      public static function removeEquipment(slotid:int) : *
      {
         if(slotid == EQ_ARMOR && isFemale())
         {
            setEquipment(EQ_ARMOR,4001);
            equipment[EQ_ARMOR] = new Item(4001);
            setEquipment(EQ_NECK,10001);
            equipment[EQ_NECK] = new Item(10001);
         }
         else if(slotid == EQ_PANTS && isFemale())
         {
            setEquipment(EQ_PANTS,11001);
            equipment[EQ_PANTS] = new Item(11001);
         }
         else
         {
            setEquipment(slotid,0);
            equipment[slotid] = new Item(0);
            if(slotid == 9)
            {
               equipment[10] = new Item(0);
            }
         }
         QueryManager.instance.reportDataModified(EQUIPMENT);
      }
      
      public static function setEquipment(slotid:int, itemid:int, pcolor:int = 1, scolor:int = 1) : *
      {
         var inventoryPlayerImage:MCSCharacter = OverworldHUD.instance.inventoryUI.getInventoryPlayerImage();
         switch(slotid)
         {
            case EQ_ARMOR:
               getPlayerMCS().setArmor(itemid,pcolor,scolor);
               inventoryPlayerImage.setArmor(itemid,pcolor,scolor);
               getPlayerBust().setArmor(itemid,pcolor,scolor);
               break;
            case EQ_GLOVES:
               getPlayerMCS().setGloves(itemid);
               inventoryPlayerImage.setGloves(itemid);
               break;
            case EQ_HAIR:
               getPlayerMCS().setHair(itemid);
               inventoryPlayerImage.setHair(itemid);
               getPlayerBust().setHair(itemid);
               break;
            case EQ_HAT:
               if(itemid == 7049)
               {
                  getPlayerMCS().setHat(0);
                  inventoryPlayerImage.setHat(0);
                  getPlayerBust().setHat(0);
               }
               else
               {
                  getPlayerMCS().setHat(itemid,pcolor,scolor);
                  inventoryPlayerImage.setHat(itemid,pcolor,scolor);
                  getPlayerBust().setHat(itemid,pcolor,scolor);
               }
               if(itemid == 0 || itemid == 7049)
               {
                  player.mcs.removeHat();
                  inventoryPlayerImage.removeHat();
                  bust.setHair(equipment[EQ_HAIR].itemID);
               }
               else
               {
                  player.mcs.wearHat();
                  inventoryPlayerImage.wearHat();
                  bust.setHair(6000);
               }
               break;
            case EQ_HEAD:
               getPlayerMCS().setHead(itemid);
               inventoryPlayerImage.setHead(itemid);
               getPlayerBust().setHead(itemid);
               break;
            case EQ_MASK:
               getPlayerMCS().setMask(itemid,pcolor,scolor);
               inventoryPlayerImage.setMask(itemid,pcolor,scolor);
               getPlayerBust().setMask(itemid,pcolor,scolor);
               break;
            case EQ_NECK:
               getPlayerMCS().setNeck(itemid);
               inventoryPlayerImage.setNeck(itemid);
               getPlayerBust().setNeck(itemid);
               break;
            case EQ_PANTS:
               getPlayerMCS().setPants(itemid,pcolor,scolor);
               inventoryPlayerImage.setPants(itemid,pcolor,scolor);
               break;
            case EQ_SHOES:
               getPlayerMCS().setShoes(itemid);
               inventoryPlayerImage.setShoes(itemid);
               break;
            case EQ_WEAPON:
               getPlayerMCS().setWeapon(itemid);
               inventoryPlayerImage.setWeapon(itemid);
               getPlayerMCS().setProp(itemid);
               inventoryPlayerImage.setProp(itemid);
               break;
            case EQ_ACCESSORY1:
               getPlayerMCS().setProp2(itemid);
               inventoryPlayerImage.setProp2(itemid);
         }
      }
      
      public static function setStat(id:int, val:int) : *
      {
         var skillStat:IntStat = null;
         var inventoryItem:Item = null;
         var questItem:Item = null;
         var intStat:ObfusIntStat = null;
         var obfusIntStat:ObfusIntStat = null;
         var booleanStat:BooleanStat = null;
         var duelistXML:XMLNpc = null;
         var dice:int = 0;
         var taunt:String = null;
         var statType:* = getStatType(id);
         QueryManager.instance.reportDataModified(statType);
         switch(statType)
         {
            case PLAYERSTAT:
               if(id == 91 || id == 92)
               {
                  if(val == -1)
                  {
                     QuestGenerator.instance.removeCurrentNPCQuestItem(id == 92);
                  }
                  else if(val == 1)
                  {
                     QuestGenerator.instance.addQuest(id == 92);
                  }
                  else if(val == 0)
                  {
                     QuestGenerator.instance.removeMarkedNode();
                  }
                  else if(val == 2)
                  {
                     QuestGenerator.instance.completeQuest(id == 92);
                  }
                  return;
               }
               if(id == 99)
               {
                  fullHealth();
                  return;
               }
               if(id == 100)
               {
                  if(val == 0)
                  {
                     autoSlash = false;
                  }
                  else
                  {
                     autoSlash = true;
                  }
                  return;
               }
               if(id == 102)
               {
                  OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                  return;
               }
               if(id == 107)
               {
                  OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_NOTHINGCLOSE);
                  return;
               }
               if(id == 108)
               {
                  player.setPosition(val,StageManager.getGroundY());
                  return;
               }
               if(id == 109)
               {
                  if(val == 0)
                  {
                     player.getMCS().setPose(MCSActor.SIT,0);
                  }
                  else if(val == 1)
                  {
                     player.getMCS().setPose(MCSActor.IDLE_BALANCED,0);
                  }
                  return;
               }
               if(id == 110)
               {
                  addActiveQuests(val,true);
                  return;
               }
               if(id == 111)
               {
                  SoundManager.instance.playMusic(val);
                  return;
               }
               if(id == 112)
               {
                  if(val == 0)
                  {
                     SoundManager.instance.playGoodKoto();
                  }
                  else if(val == 1)
                  {
                     SoundManager.instance.playDie();
                  }
                  else if(val == 2)
                  {
                     SoundManager.instance.playHit();
                  }
                  else if(val == 3)
                  {
                     SoundManager.instance.playDeflect();
                  }
                  return;
               }
               if(id == 113)
               {
                  OverworldHUD.instance.screenTransition.teleportTarget = val;
                  OverworldHUD.instance.screenTransition.teleportXPos = 150;
                  OverworldHUD.instance.screenTransition.teleportRoom = 0;
                  return;
               }
               if(id == 114)
               {
                  OverworldHUD.instance.screenTransition.teleportRoom = val;
                  return;
               }
               if(id == 115)
               {
                  OverworldHUD.instance.screenTransition.teleportXPos = val;
                  return;
               }
               if(id == 116)
               {
                  StageManager.keepPlayerInView();
                  return;
               }
               if(id == 118)
               {
                  duelistXML = QuestEngine.getNPCData(val);
                  if(duelistXML != null)
                  {
                     QuestEngine.putInDuelistHolder(val,duelistXML.getMCSString(),duelistXML.lvl);
                     dice = Math.random() * 8;
                     if(dice == 0)
                     {
                        taunt = LangManager.getString(472);
                     }
                     else if(dice == 1)
                     {
                        taunt = LangManager.getString(473);
                     }
                     else if(dice == 2)
                     {
                        taunt = LangManager.getString(474);
                     }
                     else if(dice == 3)
                     {
                        taunt = LangManager.getString(475);
                     }
                     else if(dice == 4)
                     {
                        taunt = LangManager.getString(476);
                     }
                     else if(dice == 5)
                     {
                        taunt = LangManager.getString(477);
                     }
                     else if(dice == 6)
                     {
                        taunt = LangManager.getString(478);
                     }
                     else if(dice == 7)
                     {
                        taunt = LangManager.getString(479);
                     }
                     DuelModeUI.instance.setOpponentTaunt(taunt);
                  }
                  return;
               }
               if(id == 119)
               {
                  OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
                  return;
               }
               if(id == 120)
               {
                  Overworld.doWhiteIn = true;
                  return;
               }
               if(id == 121)
               {
                  if(val == 0)
                  {
                     player.getMCS().faceLeft();
                  }
                  else
                  {
                     player.getMCS().faceRight();
                  }
                  return;
               }
               if(id == 126)
               {
                  StageManager.startShake(val);
                  return;
               }
               if(id == 127)
               {
                  if(val == 0)
                  {
                     player.getMCS().visible = false;
                  }
                  else
                  {
                     player.getMCS().visible = true;
                  }
                  return;
               }
               if(id == 128)
               {
                  StageManager.gotoRoom(OverworldHUD.instance.screenTransition.teleportRoom,OverworldHUD.instance.screenTransition.teleportXPos,OverworldHUD.instance.screenTransition.teleportTarget);
                  OverworldHUD.instance.initForCutscene(true);
                  return;
               }
               if(id == 129)
               {
                  OverworldHUD.instance.payUI.show();
                  return;
               }
               if(id == 130)
               {
                  OverworldHUD.instance.questDialogueUI.darkBlurBust(val);
                  return;
               }
               if(id == 39)
               {
                  val = QueryManager.instance.getServerTime() + val;
               }
               setPlayerStats(id,val);
               if(id == STAT_MARKEDNODE)
               {
                  if(val == -1)
                  {
                     OverworldHUD.instance.setActiveQuestText("");
                  }
                  else
                  {
                     activeQuestList[val].displayQuestTitleInNodeUI();
                  }
               }
               else if(id == STAT_LOCATION || id == STAT_LOCATION_ROOM)
               {
                  QueryManager.instance.reportDataModified(LOCATION);
                  QueryManager.instance.reportDataModified(PLAYERSTAT);
                  QueryManager.instance.saveModifiedCharData();
               }
               else if(id == STAT_SIDE)
               {
                  QueryManager.instance.reportDataModified(PLAYERSIDE);
                  QueryManager.instance.saveModifiedCharData();
               }
               else
               {
                  QueryManager.instance.reportDataModified(PLAYERSTAT);
               }
               break;
            case EQUIPMENT:
               trace("setStat does not manipulate Equipment");
               return 0;
            case SKILL:
               skillStat = findSkillStat(id);
               if(val == 0)
               {
                  if(skillStats != null)
                  {
                     removeSkillStat(skillStat);
                  }
               }
               else if(skillStat != null)
               {
                  skillStat.setValue(val);
               }
               else
               {
                  skillStats.fixed = false;
                  skillStats.push(new IntStat(id,val));
                  skillStats.fixed = true;
               }
               QueryManager.instance.reportDataModified(SKILL);
               break;
            case ITEM:
               inventoryItem = findInventoryItem(id);
               if(val == 0)
               {
                  if(inventoryItem != null)
                  {
                     spliceOutInventoryItem(inventoryItem);
                  }
               }
               else if(inventoryItem != null)
               {
                  inventoryItem.setQuantity(val);
               }
               else
               {
                  inventory.fixed = false;
                  inventory.push(new Item(id,val));
                  inventory.fixed = true;
               }
               QueryManager.instance.reportDataModified(ITEM);
               break;
            case QUESTITEM:
               questItem = findQuestItem(id);
               if(val == 0)
               {
                  if(questItem != null)
                  {
                     spliceOutQuestItem(questItem);
                  }
               }
               else if(questItem != null)
               {
                  questItem.setQuantity(val);
               }
               else
               {
                  questItems.fixed = false;
                  questItems.push(new Item(id,val));
                  questItems.fixed = true;
               }
               QueryManager.instance.reportDataModified(QUESTITEM);
               break;
            case INTSTAT:
               if(id == 30017)
               {
                  TutorialUI.instance.setState(val);
               }
               intStat = findIntStat(id);
               if(val == 0)
               {
                  if(intStat != null)
                  {
                     removeIntStat(intStat);
                  }
               }
               else if(intStat != null)
               {
                  intStat.setValue(val);
               }
               else
               {
                  intStats.fixed = false;
                  intStats.push(new ObfusIntStat(id,val));
                  intStats.fixed = true;
               }
               QueryManager.instance.reportDataModified(INTSTAT);
               break;
            case ACHIEVEMENTSTAT:
               obfusIntStat = findAchievementStat(id);
               if(val == 0)
               {
                  if(obfusIntStat != null)
                  {
                     removeAchievementStat(obfusIntStat);
                  }
               }
               else if(obfusIntStat != null)
               {
                  obfusIntStat.setValue(val);
               }
               else
               {
                  achievementStats.fixed = false;
                  achievementStats.push(new ObfusIntStat(id,val));
                  achievementStats.fixed = true;
               }
               QueryManager.instance.reportDataModified(ACHIEVEMENTSTAT);
               break;
            case BOOLEANSTAT:
               booleanStat = findBooleanStat(id);
               if(val == 0)
               {
                  if(booleanStat != null)
                  {
                     removeBooleanStat(booleanStat);
                  }
               }
               else if(booleanStat == null)
               {
                  booleanStats.fixed = false;
                  booleanStats.push(new BooleanStat(id,true));
                  booleanStats.fixed = true;
               }
               QueryManager.instance.reportDataModified(BOOLEANSTAT);
               break;
            case GLOBALVAR:
               trace("cannot setStat() for GLOBALVAR");
         }
      }
      
      public static function changeStat(id:int, val:int) : int
      {
         var skillStat:IntStat = null;
         var inventoryItem:Item = null;
         var questItem:Item = null;
         var intStat:ObfusIntStat = null;
         var obfusIntStat:ObfusIntStat = null;
         var booleanStat:BooleanStat = null;
         var statType:* = getStatType(id);
         QueryManager.instance.reportDataModified(statType);
         switch(statType)
         {
            case PLAYERSTAT:
               if(id == STAT_LOCATION)
               {
                  setPlayerStats(id,val);
                  QueryManager.instance.reportDataModified(LOCATION);
                  QueryManager.instance.saveModifiedCharData();
               }
               else
               {
                  if(id == 91 || id == 92)
                  {
                     if(val == -1)
                     {
                        QuestGenerator.instance.removeCurrentNPCQuestItem(id == 92);
                     }
                     else if(val == 1)
                     {
                        QuestGenerator.instance.addQuest(id == 92);
                     }
                     else if(val == 0)
                     {
                        QuestGenerator.instance.removeMarkedNode();
                     }
                     else if(val == 2)
                     {
                        QuestGenerator.instance.completeQuest(id == 92);
                     }
                     return 0;
                  }
                  setPlayerStats(id,getPlayerStats(id) + val);
                  QueryManager.instance.reportDataModified(PLAYERSTAT);
               }
               return getPlayerStats(id);
            case EQUIPMENT:
               trace("setStat does not manipulate Equipment");
               return 0;
            case SKILL:
               QueryManager.instance.reportDataModified(SKILL);
               skillStat = findSkillStat(id);
               if(skillStat != null)
               {
                  skillStat.changeValue(val);
                  if(skillStat.getValue() == 0)
                  {
                     removeSkillStat(skillStat);
                     return 0;
                  }
                  return skillStat.getValue();
               }
               if(val != 0)
               {
                  skillStats.fixed = false;
                  skillStats.push(new IntStat(id,val));
                  skillStats.fixed = true;
                  return val;
               }
               break;
            case ITEM:
               QueryManager.instance.reportDataModified(ITEM);
               inventoryItem = findInventoryItem(id);
               if(inventoryItem != null)
               {
                  inventoryItem.changeQuantity(val);
                  if(inventoryItem.getQuantity() <= 0)
                  {
                     spliceOutInventoryItem(inventoryItem);
                     return 0;
                  }
                  return inventoryItem.getQuantity();
               }
               if(val > 0)
               {
                  inventory.fixed = false;
                  inventory.push(new Item(id,val));
                  inventory.fixed = true;
                  return val;
               }
               break;
            case QUESTITEM:
               QueryManager.instance.reportDataModified(QUESTITEM);
               questItem = findQuestItem(id);
               if(questItem != null)
               {
                  questItem.changeQuantity(val);
                  if(questItem.getQuantity() <= 0)
                  {
                     spliceOutQuestItem(questItem);
                     return 0;
                  }
                  return questItem.getQuantity();
               }
               if(val > 0)
               {
                  questItems.fixed = false;
                  questItems.push(new Item(id,val));
                  questItems.fixed = true;
                  return val;
               }
               break;
            case INTSTAT:
               QueryManager.instance.reportDataModified(INTSTAT);
               intStat = findIntStat(id);
               if(intStat != null)
               {
                  if(id == 30018)
                  {
                     intStat.setValue(QueryManager.instance.getServerTime() + val);
                  }
                  else
                  {
                     intStat.changeValue(val);
                  }
                  if(intStat.getValue() == 0)
                  {
                     removeIntStat(intStat);
                     return 0;
                  }
                  return intStat.getValue();
               }
               if(val != 0)
               {
                  intStats.fixed = false;
                  intStats.push(new ObfusIntStat(id,val));
                  intStats.fixed = true;
                  return val;
               }
               break;
            case ACHIEVEMENTSTAT:
               QueryManager.instance.reportDataModified(ACHIEVEMENTSTAT);
               obfusIntStat = findAchievementStat(id);
               if(obfusIntStat != null)
               {
                  obfusIntStat.changeValue(val);
                  if(obfusIntStat.getValue() == 0)
                  {
                     removeAchievementStat(obfusIntStat);
                     return 0;
                  }
                  return obfusIntStat.getValue();
               }
               if(val != 0)
               {
                  achievementStats.fixed = false;
                  achievementStats.push(new ObfusIntStat(id,val));
                  achievementStats.fixed = true;
                  return val;
               }
               break;
            case BOOLEANSTAT:
               QueryManager.instance.reportDataModified(BOOLEANSTAT);
               booleanStat = findBooleanStat(id);
               if(val == 0)
               {
                  if(booleanStat != null)
                  {
                     removeBooleanStat(booleanStat);
                  }
               }
               else if(booleanStat == null)
               {
                  booleanStats.fixed = false;
                  booleanStats.push(new BooleanStat(id,true));
                  booleanStats.fixed = true;
               }
               return val;
            case GLOBALVAR:
               if(id == 50007)
               {
                  QueryManager.instance.updateTownProsperity(val);
               }
               else
               {
                  QueryManager.instance.updateGlobalVar(id,val);
               }
               return 0;
         }
         if(val != 0)
         {
            trace("StatManager.changeStat error");
         }
         return 0;
      }
      
      public static function getStat(id:int) : int
      {
         var skillStat:IntStat = null;
         var inventoryItem:Item = null;
         var questItem:Item = null;
         var intStat:ObfusIntStat = null;
         var obfusIntStat:ObfusIntStat = null;
         var booleanStat:BooleanStat = null;
         var chiSkillsCount:int = 0;
         var ninjaSkillsCount:int = 0;
         switch(getStatType(id))
         {
            case PLAYERSTAT:
               if(id == 10)
               {
                  return getLevel();
               }
               if(id == 91 || id == 92)
               {
                  return QuestGenerator.instance.isReadyToTurnInQuest(id == 92);
               }
               if(id >= playerStats.length)
               {
                  return 0;
               }
               return getPlayerStats(id);
               break;
            case EQUIPMENT:
               return equipment[id - 50].itemID;
            case SKILL:
               skillStat = findSkillStat(id);
               if(skillStat != null)
               {
                  return skillStat.getValue();
               }
               return 0;
               break;
            case ITEM:
               inventoryItem = findInventoryItem(id);
               if(inventoryItem != null)
               {
                  return inventoryItem.getQuantity();
               }
               return 0;
               break;
            case QUESTITEM:
               questItem = findQuestItem(id);
               if(questItem != null)
               {
                  return questItem.getQuantity();
               }
               return 0;
               break;
            case INTSTAT:
               intStat = findIntStat(id);
               if(intStat != null)
               {
                  return intStat.getValue();
               }
               return 0;
               break;
            case ACHIEVEMENTSTAT:
               if(id == 60001)
               {
                  return getWarRank();
               }
               if(id == 60022)
               {
                  chiSkillsCount = 0;
                  if(getStat(1005) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1006) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1042) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1043) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1044) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1045) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1046) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1047) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1048) > 0)
                  {
                     chiSkillsCount++;
                  }
                  if(getStat(1069) > 0)
                  {
                     chiSkillsCount++;
                  }
                  return chiSkillsCount;
               }
               if(id == 60023)
               {
                  ninjaSkillsCount = 0;
                  if(getStat(1007) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  if(getStat(1010) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  if(getStat(1012) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  if(getStat(1024) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  if(getStat(1051) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  if(getStat(1052) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  if(getStat(1053) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  if(getStat(1054) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  if(getStat(1055) > 0)
                  {
                     ninjaSkillsCount++;
                  }
                  return ninjaSkillsCount;
               }
               obfusIntStat = findAchievementStat(id);
               if(obfusIntStat != null)
               {
                  return obfusIntStat.getValue();
               }
               return 0;
               break;
            case BOOLEANSTAT:
               booleanStat = findBooleanStat(id);
               if(booleanStat != null)
               {
                  if(booleanStat.getValue())
                  {
                     return 1;
                  }
                  return 0;
               }
               return 0;
               break;
            default:
               return 0;
         }
      }
      
      public static function upgradeMAXHP() : Boolean
      {
         changeStat(1,1);
         changeStat(18,-1);
         return true;
      }
      
      public static function upgradeHPREGEN() : Boolean
      {
         changeStat(2,1);
         changeStat(18,-1);
         return true;
      }
      
      public static function upgradeMAXCHI() : Boolean
      {
         changeStat(4,1);
         changeStat(18,-1);
         return true;
      }
      
      public static function upgradeCHIREGEN() : Boolean
      {
         changeStat(5,1);
         changeStat(18,-1);
         return true;
      }
      
      public static function upgradeATK() : Boolean
      {
         changeStat(6,1);
         changeStat(18,-1);
         return true;
      }
      
      public static function upgradeDEF() : Boolean
      {
         changeStat(7,1);
         changeStat(18,-1);
         return true;
      }
      
      public static function upgradeSPD() : Boolean
      {
         changeStat(8,1);
         changeStat(18,-1);
         return true;
      }
      
      public static function checkConditions(conditionList:XMLList) : Boolean
      {
         var comparison:String = null;
         var questID:String = null;
         if(conditionList == null)
         {
            return true;
         }
         if(conditionList.toString() == "1")
         {
            return true;
         }
         if(conditionList.toString() == "0")
         {
            return false;
         }
         var has:XMLList = conditionList.has;
         for(var i:* = int(has.length() - 1); i >= 0; i--)
         {
            if(has[i].comp.toString() == "")
            {
               comparison = "gte";
            }
            else
            {
               comparison = has[i].comp;
            }
            if(!checkCondition(has[i].id,has[i].qty,comparison))
            {
               return false;
            }
         }
         var completedQuest:XMLList = conditionList.completedquest;
         for(i = int(completedQuest.length() - 1); i >= 0; i--)
         {
            questID = completedQuest[i];
            if(questID.charAt(0) == "!")
            {
               questID = questID.substr(1,questID.length - 1);
               if(checkNotCompletedQuest(int(questID)) == false)
               {
                  return false;
               }
            }
            else if(checkCompletedQuest(completedQuest[i]) == false)
            {
               return false;
            }
         }
         var activeQuest:XMLList = conditionList.activequest;
         if(activeQuest.length() == 0)
         {
            return true;
         }
         for(i = int(activeQuest.length() - 1); i >= 0; i--)
         {
            if(checkActiveQuest(activeQuest[i]) == true)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function checkCondition(id:int, val:int, comparison:String = "gte") : Boolean
      {
         var output:int = 0;
         var max:int = 0;
         var hasSkill:Boolean = false;
         var i:int = 0;
         if(comparison == "rand")
         {
            return Math.random() * id <= val;
         }
         if(id == STAT_LEVEL)
         {
            output = getLevel();
         }
         else if(id >= 28 && id <= 31)
         {
            output = getStat(id);
         }
         else if(id == 30018)
         {
            if(getStat(30018) - QueryManager.instance.getServerTime() <= 0)
            {
               output = 1;
            }
            else
            {
               output = 0;
            }
         }
         else
         {
            if(id == 63)
            {
               max = int(skillSlots.length);
               hasSkill = false;
               for(i = 0; i < max; i++)
               {
                  if(skillSlots[i] != null && skillSlots[i].getId() == val)
                  {
                     hasSkill = true;
                     break;
                  }
               }
               if(comparison == "eq")
               {
                  return hasSkill;
               }
               return !hasSkill;
            }
            if(id == 64)
            {
               if(comparison == "not")
               {
                  return !OverworldHUD.instance.playerPanelDisplay.isFriend;
               }
               return OverworldHUD.instance.playerPanelDisplay.isFriend;
            }
            if(id == 65)
            {
               return OverworldHUD.instance.playerPanelDisplay.facetoface;
            }
            output = getStat(id);
         }
         switch(comparison)
         {
            case "eq":
               return output == val;
            case "gte":
               return output >= val;
            case "gt":
               return output > val;
            case "lt":
               return output < val;
            case "lte":
               return output <= val;
            case "not":
               return output != val;
            default:
               return false;
         }
      }
      
      public static function addCombo(num:*) : *
      {
         combo += num;
         if(combo > 999)
         {
            combo = 999;
         }
         BattleUI.instance.showCombo(combo);
      }
      
      public static function resetCombo() : *
      {
         combo = 0;
         BattleUI.instance.hideCombo();
      }
      
      public static function hasBuff(bufftype:int) : Boolean
      {
         if(bufftype == BUFF_INJURED)
         {
            return getPlayerStats(STAT_BUFF2EXPIRY) > QueryManager.instance.getServerTime();
         }
         return getPlayerStats(STAT_BUFFTYPE) == bufftype && getPlayerStats(STAT_BUFFEXPIRY) > QueryManager.instance.getServerTime();
      }
      
      public static function setBuff(bufftype:int, durationSec:int) : *
      {
         if(bufftype == BUFF_INJURED)
         {
            setPlayerStats(STAT_BUFF2EXPIRY,QueryManager.instance.getServerTime() + durationSec);
         }
         else
         {
            if(hasBuff(BUFF_MODERATOR) && (bufftype == BUFF_MUTE || bufftype == BUFF_FULLMUTE))
            {
               return;
            }
            if((hasBuff(BUFF_MUTE) || hasBuff(BUFF_FULLMUTE) || hasBuff(BUFF_HELL) || hasBuff(BUFF_MODERATOR)) && bufftype != BUFF_FULLMUTE && bufftype != BUFF_HELL && bufftype != BUFF_MODERATOR)
            {
               return;
            }
            setPlayerStats(STAT_BUFFTYPE,bufftype);
            setPlayerStats(STAT_BUFFEXPIRY,QueryManager.instance.getServerTime() + durationSec);
         }
         QueryManager.instance.reportDataModified(PLAYERSTAT);
         QueryManager.instance.saveModifiedCharData();
         StatsManager.setChatShowing(false);
      }
      
      public static function getPlayerLevelString() : String
      {
         return getLevel().toString();
      }
      
      public static function getPlayerDanString() : String
      {
         return getPlayerStats(STAT_DAN).toString();
      }
      
      public static function getLocationString() : String
      {
         return getPlayerStats(STAT_LOCATION).toString();
      }
      
      public static function getPlayerStatsString() : String
      {
         var str:String = "";
         var max:int = int(playerStats.length);
         var checksum:int = 0;
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += getPlayerStats(i).toString();
            }
            else
            {
               str += getPlayerStats(i).toString() + "|";
            }
            checksum += getPlayerStats(i);
         }
         checksum %= 54321;
         return str + "|" + checksum.toString();
      }
      
      public static function parsePlayerStatsString(str:String) : *
      {
         playerStats.fixed = false;
         playerStats = new Vector.<ObfuscatedObject>(playerStatsCount);
         populatePlayerStats(playerStats);
         var strArray:Array = str.split("|");
         for(var i:int = 0; i < strArray.length - 1; i++)
         {
            setPlayerStats(i,strArray[i]);
         }
         playerStats.fixed = true;
      }
      
      public static function getBattleStatsString() : String
      {
         var str:String = "";
         var max:int = int(playerStats.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == STAT_HP || i == STAT_MAXHP || i == STAT_CHI || i == STAT_MAXCHI || i == STAT_ATTACK || i == STAT_DEFENSE || i == STAT_SPEED || i == STAT_FIREATK || i == STAT_WINDATK || i == STAT_WATERATK || i == STAT_EARTHATK || i == STAT_BUFFTYPE || i == STAT_BUFFEXPIRY || i == STAT_BUFF2EXPIRY)
            {
               if(i == STAT_BUFF2EXPIRY)
               {
                  str += getPlayerStats(i).toString();
               }
               else
               {
                  str += getPlayerStats(i).toString() + "|";
               }
            }
         }
         return str;
      }
      
      public static function getEquipmentString() : String
      {
         var str:String = "";
         var max:int = int(equipment.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += equipment[i].toStringNoQty();
            }
            else
            {
               str += equipment[i].toStringNoQty() + "|";
            }
         }
         return str;
      }
      
      public static function parseEquipmentString(str:String) : *
      {
         equipment.fixed = false;
         equipment.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            equipment.push(Item.parseNoQty(strArray[i]));
         }
         equipment.fixed = true;
      }
      
      public static function getSkillStatsString() : String
      {
         var str:String = "";
         var max:int = int(skillStats.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += skillStats[i];
            }
            else
            {
               str += skillStats[i] + "|";
            }
         }
         return str;
      }
      
      public static function parseSkillStatsString(str:String) : *
      {
         var intstat:IntStat = null;
         skillStats.fixed = false;
         skillStats.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            intstat = IntStat.parse(strArray[i]);
            if(intstat.getId() == SkillManager.SKILL_ROLL)
            {
               if(intstat.getValue() > 3)
               {
                  intstat.setValue(3);
               }
            }
            skillStats.push(intstat);
         }
         skillStats.fixed = true;
      }
      
      public static function getSkillSlotsString() : String
      {
         var str:String = "";
         var max:int = int(skillSlots.length);
         for(var i:int = 0; i < max; i++)
         {
            if(skillSlots[i] != null)
            {
               if(i == max - 1)
               {
                  str += skillSlots[i];
               }
               else
               {
                  str += skillSlots[i] + "|";
               }
            }
         }
         return str;
      }
      
      public static function parseSkillSlotsString(str:String) : *
      {
         skillSlots.fixed = false;
         skillSlots = new Vector.<IntStat>(8);
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            skillSlots[i] = IntStat.parse(strArray[i]);
         }
         skillSlots.fixed = true;
      }
      
      public static function getInventoryString() : String
      {
         if(inventory.length == 0)
         {
            return "-";
         }
         var str:String = "";
         var max:int = int(inventory.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += inventory[i];
            }
            else
            {
               str += inventory[i] + "|";
            }
         }
         return str;
      }
      
      public static function parseInventoryString(str:String) : *
      {
         if(str == "-")
         {
            inventory = new Vector.<Item>();
            return;
         }
         inventory.fixed = false;
         inventory.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            if(strArray[i] != "")
            {
               inventory.push(Item.parse(strArray[i]));
            }
         }
         inventory.fixed = true;
      }
      
      public static function getStashString() : String
      {
         if(stash.length == 0)
         {
            return "-";
         }
         var str:String = "";
         var max:int = int(stash.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += stash[i];
            }
            else
            {
               str += stash[i] + "|";
            }
         }
         return str;
      }
      
      public static function parseStashString(str:String) : *
      {
         if(str == "-")
         {
            stash = new Vector.<Item>();
            return;
         }
         stash.fixed = false;
         stash.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            if(strArray[i] != "")
            {
               stash.push(Item.parse(strArray[i]));
            }
         }
         stash.fixed = true;
      }
      
      public static function getOptionsString() : String
      {
         var str:String = "";
         if(SoundManager.instance.hasMusic)
         {
            str += "1";
         }
         else
         {
            str += "0";
         }
         if(SoundManager.instance.hasSound)
         {
            str += "1";
         }
         else
         {
            str += "0";
         }
         if(censored)
         {
            str += "1";
         }
         else
         {
            str += "0";
         }
         if(hasChatNotification)
         {
            str += "1";
         }
         else
         {
            str += "0";
         }
         if(recordDuels)
         {
            str += "1";
         }
         else
         {
            str += "0";
         }
         if(autoAssignStats)
         {
            str += "1";
         }
         else
         {
            str += "0";
         }
         if(showNinjaServant)
         {
            str += "1";
         }
         else
         {
            str += "0";
         }
         if(doFullScreen)
         {
            str += "1";
         }
         else
         {
            str += "0";
         }
         return str;
      }
      
      public static function parseOptionsString(str:String) : *
      {
         if(str.length == 7)
         {
            SoundManager.instance.hasMusic = str.charAt(0) == "1";
            SoundManager.instance.hasSound = str.charAt(1) == "1";
            censored = str.charAt(2) == "1";
            hasChatNotification = str.charAt(3) == "1";
            recordDuels = str.charAt(4) == "1";
            autoAssignStats = str.charAt(5) == "1";
            showNinjaServant = str.charAt(6) == "1";
            doFullScreen = str.charAt(7) == "1";
         }
         if(SoundManager.instance.hasMusic)
         {
            ResourceManager.loadMusicResource();
         }
         else
         {
            SoundManager.instance.stopMusic();
         }
         if(SoundManager.instance.hasSound)
         {
            ResourceManager.loadSoundResource();
         }
      }
      
      public static function parseGiftNotificationsString() : *
      {
         var giversArray:Array = null;
         var insideStrArray:Array = null;
         var item:Item = null;
         var giver:String = null;
         var itemString:String = null;
         var itemArray:Array = null;
         var j:* = undefined;
         if(giftNotification == "")
         {
            return;
         }
         inventory.fixed = false;
         var strArray:Array = giftNotification.split("^");
         var giftList:Vector.<Item> = new Vector.<Item>();
         for(var i:* = 0; i < strArray.length; i++)
         {
            giversArray = strArray[i].split("$");
            giver = giversArray[1];
            itemString = giversArray[0];
            itemArray = itemString.split("|");
            for(j = 0; j < itemArray.length; j++)
            {
               insideStrArray = itemArray[j].split(",");
               if(insideStrArray[0] == "11")
               {
                  changeGold(insideStrArray[1]);
                  OverworldHUD.instance.gotGiftDialog.addLootCoins(insideStrArray[1]);
                  OverworldHUD.instance.gotGiftDialog.addGiver(giver);
               }
               else if(insideStrArray[0] == "12")
               {
                  addHeavenlyGold(insideStrArray[1]);
                  OverworldHUD.instance.gotGiftDialog.addLootGold(insideStrArray[1]);
                  OverworldHUD.instance.gotGiftDialog.addGiver(giver);
               }
               else
               {
                  item = Item.parseNoQty(itemArray[j]);
                  giftList.push(item);
                  OverworldHUD.instance.gotGiftDialog.addLootItem(item);
                  OverworldHUD.instance.gotGiftDialog.addGiver(giver);
               }
            }
         }
         OverworldHUD.instance.gotGiftDialog.storeGiftList(giftList);
         QueryManager.instance.saveModifiedCharData();
         if(GameEngine.isAdventureMode())
         {
            player.stopMoving();
         }
         OverworldHUD.instance.gotGiftDialog.show();
         giftNotification = "";
      }
      
      public static function getQuestItemsString() : String
      {
         if(questItems.length == 0)
         {
            return "-";
         }
         var str:String = "";
         var max:int = int(questItems.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += questItems[i];
            }
            else
            {
               str += questItems[i] + "|";
            }
         }
         return str;
      }
      
      public static function parseQuestItemsString(str:String) : *
      {
         var item:Item = null;
         if(str == "-")
         {
            questItems = new Vector.<Item>();
            return;
         }
         questItems.fixed = false;
         questItems.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            if(strArray[i] != "")
            {
               item = Item.parse(strArray[i]);
               if(item.itemID >= 20000)
               {
                  questItems.push(item);
               }
            }
         }
         questItems.fixed = true;
      }
      
      public static function getIntStatsString() : String
      {
         if(intStats.length == 0)
         {
            return "-";
         }
         var str:String = "";
         var max:int = int(intStats.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += intStats[i];
            }
            else
            {
               str += intStats[i] + "|";
            }
         }
         return str;
      }
      
      public static function parseIntStatsString(str:String) : *
      {
         if(str == "-")
         {
            intStats = new Vector.<ObfusIntStat>();
            return;
         }
         intStats.fixed = false;
         intStats.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            intStats.push(ObfusIntStat.parse(strArray[i]));
         }
         intStats.fixed = true;
      }
      
      public static function getBooleanStatsString() : String
      {
         if(booleanStats.length == 0)
         {
            return "-";
         }
         var str:String = "";
         var max:int = int(booleanStats.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += booleanStats[i];
            }
            else
            {
               str += booleanStats[i] + "|";
            }
         }
         return str;
      }
      
      public static function parseBooleanStatsString(str:String) : *
      {
         if(str == "-")
         {
            booleanStats = new Vector.<BooleanStat>();
            return;
         }
         booleanStats.fixed = false;
         booleanStats.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            booleanStats.push(BooleanStat.parse(strArray[i]));
         }
         booleanStats.fixed = true;
      }
      
      public static function getAchievementStatsString() : String
      {
         if(achievementStats.length == 0)
         {
            return "-";
         }
         var str:String = "";
         var max:int = int(achievementStats.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += achievementStats[i];
            }
            else
            {
               str += achievementStats[i] + "|";
            }
         }
         return str;
      }
      
      public static function parseAchievementStatsString(str:String) : *
      {
         if(str == "-")
         {
            achievementStats = new Vector.<ObfusIntStat>();
            return;
         }
         achievementStats.fixed = false;
         achievementStats.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            achievementStats.push(ObfusIntStat.parse(strArray[i]));
         }
         achievementStats.fixed = true;
      }
      
      public static function getActiveQuestString() : String
      {
         if(activeQuestList.length == 0)
         {
            return "-";
         }
         var str:String = "";
         var max:int = int(activeQuestList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += activeQuestList[i];
            }
            else
            {
               str += activeQuestList[i] + "|";
            }
         }
         return str;
      }
      
      public static function setActiveQuestString(str:String) : *
      {
         activeQuestStr = str;
      }
      
      public static function parseActiveQuestString() : *
      {
         var activeQuest:ActiveQuest = null;
         var str:* = activeQuestStr;
         if(str == "-")
         {
            activeQuestList = new Vector.<ActiveQuest>();
            return;
         }
         activeQuestList.fixed = false;
         activeQuestList.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            activeQuest = ActiveQuest.parse(strArray[i]);
            if(activeQuest != null)
            {
               activeQuestList.push(activeQuest);
            }
         }
         activeQuestList.fixed = true;
      }
      
      public static function getCompletedQuestString() : String
      {
         if(completedQuestList.length == 0)
         {
            return "-";
         }
         var str:String = "";
         var max:int = int(completedQuestList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               str += completedQuestList[i].toString();
            }
            else
            {
               str += completedQuestList[i].toString() + "|";
            }
         }
         return str;
      }
      
      public static function parseCompletedQuestString(str:String) : *
      {
         var completedQuest:CompletedQuest = null;
         if(str == "-")
         {
            completedQuestList = new Vector.<CompletedQuest>();
            return;
         }
         completedQuestList.fixed = false;
         completedQuestList.length = 0;
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            completedQuest = CompletedQuest.parse(strArray[i]);
            if(completedQuest != null)
            {
               completedQuestList.push(completedQuest);
            }
         }
         completedQuestList.fixed = true;
      }
      
      public static function setTaunt(str:String) : *
      {
         victoryTaunt = str;
      }
      
      public static function getTaunt() : String
      {
         if(victoryTaunt != null)
         {
            victoryTaunt = victoryTaunt.split("&").join();
         }
         else
         {
            victoryTaunt = LangManager.getString(198);
         }
         return victoryTaunt;
      }
      
      public static function getFriendListString() : String
      {
         if(OverworldHUD.instance == null)
         {
            return "";
         }
         return OverworldHUD.instance.friendpanel.getFriendListStr();
      }
      
      public static function parseFriendListString(str:String) : *
      {
         if(str == null || str == "" || str == "-")
         {
            friendList = "";
         }
         else
         {
            friendList = str;
         }
         if(OverworldHUD.instance != null)
         {
            OverworldHUD.instance.friendpanel.init();
         }
      }
      
      public static function showKojuroAsPeddler() : Boolean
      {
         if(checkActiveQuest("20") && (checkActiveQuest("20,6") || checkActiveQuest("20,7") || checkActiveQuest("20,8")))
         {
            return false;
         }
         return !checkCompletedQuest(31);
      }
      
      public static function showChikakoAsNinja() : Boolean
      {
         return checkCompletedQuest(20);
      }
      
      public static function saveLocation(nodeid:int, roomid:int = 0) : *
      {
         if(getPlayerStats(STAT_LOCATION) != nodeid)
         {
            setStat(STAT_LOCATION,nodeid);
            setStat(STAT_LOCATION_ROOM,roomid);
         }
         else if(StageManager.getCurrentRoom() == roomid && getPlayerStats(STAT_LOCATION_ROOM) != roomid)
         {
            setStat(STAT_LOCATION_ROOM,roomid);
         }
      }
      
      public static function reportAchievementStat(id:int, val:int, doSet:Boolean = false) : *
      {
         if(isKongregate)
         {
            Kongregate.instance.reportAchievementStat(id,val,doSet);
         }
         var beforeArray:Array = QuestEngine.getAchievementCompletedArray();
         if(doSet)
         {
            setStat(id,val);
         }
         else
         {
            changeStat(id,val);
         }
         QueryManager.instance.saveModifiedCharData();
         var afterArray:Array = QuestEngine.getAchievementCompletedArray();
         var max:int = int(beforeArray.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(beforeArray[i] != afterArray[i])
            {
               OverworldHUD.instance.showAchievementUnlocked(i);
               break;
            }
         }
      }
      
      public static function getChatDisplayCharname() : String
      {
         var displayname:String = charname;
         var firstChar:String = displayname.substr(0,1);
         var restOfString:String = displayname.substr(1,displayname.length);
         return firstChar.toUpperCase() + restOfString;
      }
   }
}

