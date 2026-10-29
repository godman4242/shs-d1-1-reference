package
{
   public class XMLNpc
   {
      
      public static var INDEX_DUELIST:int = -1;
      
      public static var INDEX_SELF:int = -2;
      
      public static var INDEX_NPCHOLDER:int = -3;
      
      public static var INDEX_BOUNTYTARGET:int = -4;
      
      public static var INDEX_SUBBOSS:int = -5;
      
      public static var INDEX_PLAYER1:int = 700;
      
      public static var INDEX_PLAYER2:int = 701;
      
      public static var INDEX_PLAYER3:int = 702;
      
      public static var INDEX_PLAYER4:int = 703;
      
      public static var INDEX_PLAYER5:int = 704;
      
      public static var INDEX_PLAYER6:int = 705;
      
      public static var INDEX_PLAYER7:int = 706;
      
      public static var INDEX_PLAYER8:int = 707;
      
      public static var INDEX_PLAYER9:int = 708;
      
      public static var INDEX_PLAYER10:int = 709;
      
      public static var DEFAULT_EQSTRING:String = "4017|0|6019|0|8005|0|0|11017|12017|13002|13002|0|0";
      
      public static var NPCTYPE_COMMONER:int = 0;
      
      public static var NPCTYPE_OLDCOMMONER:int = 1;
      
      public static var NPCTYPE_NOBLE:int = 2;
      
      public static var NPCTYPE_FATNOBLE:int = 3;
      
      public static var NPCTYPE_FEMALE:int = 4;
      
      public static var NPCTYPE_SAMURAI:int = 5;
      
      public var id:int;
      
      public var name:String = "";
      
      public var lvl:int;
      
      public var ai:int;
      
      public var hp:int;
      
      public var currenthp:int;
      
      public var chi:int;
      
      public var currentchi:int;
      
      public var attack:int;
      
      public var defense:int;
      
      public var speed:int;
      
      public var skills:XMLList;
      
      public var mcs:XMLList;
      
      public var reward:XMLList;
      
      public var skillList:Vector.<IntStat> = null;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var minDamage:int;
      
      public var damageRange:int;
      
      public var slashUsage:int;
      
      public var controlledBy:int = 1;
      
      public var nid:String = "";
      
      public var rightPos:Boolean = true;
      
      public var equipmentStr:String = "";
      
      public var STAT_FIREATK:int = 0;
      
      public var STAT_WINDATK:int = 0;
      
      public var STAT_WATERATK:int = 0;
      
      public var STAT_EARTHATK:int = 0;
      
      public var STAT_FIREDEF:int = 0;
      
      public var STAT_WINDDEF:int = 0;
      
      public var STAT_WATERDEF:int = 0;
      
      public var STAT_EARTHDEF:int = 0;
      
      public var STAT_CRITICALDMG:int = 0;
      
      public var STAT_PIERCINGDMG:int = 0;
      
      public function XMLNpc(xml:XML)
      {
         super();
         if(xml == null)
         {
            return;
         }
         this.id = xml.id;
         this.lvl = xml.lvl;
         if(xml.name.toString() != "")
         {
            this.name = LangManager.getString(xml.name);
         }
         else
         {
            this.name = "?";
         }
         if(xml.ai.toString() != "")
         {
            this.ai = xml.ai;
         }
         else
         {
            this.ai = 1;
         }
         if(xml.hp.toString() != "")
         {
            this.hp = xml.hp;
         }
         else
         {
            this.hp = 1;
         }
         if(xml.chi.toString() != "")
         {
            this.chi = xml.chi;
         }
         else
         {
            this.chi = 1;
         }
         if(xml.attack.toString() != "")
         {
            this.attack = xml.attack;
         }
         else
         {
            this.attack = 1;
         }
         if(xml.defense.toString() != "")
         {
            this.defense = xml.defense;
         }
         else
         {
            this.defense = 0;
         }
         if(xml.speed.toString() != "")
         {
            this.speed = xml.speed;
         }
         else
         {
            this.speed = 1;
         }
         this.mcs = xml.mcs;
         this.skills = xml.skills;
         this.reward = xml.reward;
         if(xml.scalex.toString() != "")
         {
            this.scaleX = xml.scalex;
         }
         if(xml.scaley.toString() != "")
         {
            this.scaleY = xml.scaley;
         }
         if(xml.fire.toString() != "")
         {
            this.STAT_FIREATK = xml.fire;
            this.STAT_EARTHDEF = xml.fire;
         }
         if(xml.wind.toString() != "")
         {
            this.STAT_WINDATK = xml.wind;
            this.STAT_WATERDEF = xml.wind;
         }
         if(xml.water.toString() != "")
         {
            this.STAT_WATERATK = xml.water;
            this.STAT_FIREDEF = xml.water;
         }
         if(xml.earth.toString() != "")
         {
            this.STAT_EARTHATK = xml.earth;
            this.STAT_WINDDEF = xml.earth;
         }
      }
      
      public static function parseBattleStatsString(str:String) : Vector.<int>
      {
         var statIndex:int = 0;
         var playerStats:Vector.<int> = new Vector.<int>(StatsManager.playerStatsCount);
         var strArray:Array = str.split("|");
         for(var i:int = 0; i < strArray.length; i++)
         {
            switch(i)
            {
               case 0:
                  statIndex = StatsManager.STAT_HP;
                  break;
               case 1:
                  statIndex = StatsManager.STAT_MAXHP;
                  break;
               case 2:
                  statIndex = StatsManager.STAT_CHI;
                  break;
               case 3:
                  statIndex = StatsManager.STAT_MAXCHI;
                  break;
               case 4:
                  statIndex = StatsManager.STAT_ATTACK;
                  break;
               case 5:
                  statIndex = StatsManager.STAT_DEFENSE;
                  break;
               case 6:
                  statIndex = StatsManager.STAT_SPEED;
                  break;
               case 7:
                  statIndex = StatsManager.STAT_FIREATK;
                  break;
               case 8:
                  statIndex = StatsManager.STAT_WINDATK;
                  break;
               case 9:
                  statIndex = StatsManager.STAT_WATERATK;
                  break;
               case 10:
                  statIndex = StatsManager.STAT_EARTHATK;
                  break;
               case 11:
                  statIndex = StatsManager.STAT_BUFFTYPE;
                  break;
               case 12:
                  statIndex = StatsManager.STAT_BUFFEXPIRY;
                  break;
               case 13:
                  statIndex = StatsManager.STAT_BUFF2EXPIRY;
            }
            playerStats[statIndex] = strArray[i];
         }
         return playerStats;
      }
      
      public function createBust() : MCSBust
      {
         var bust:MCSBust = new MCSBust();
         bust.initMCSFromXML(this.mcs);
         return bust;
      }
      
      public function createMCS() : MCSCharacter
      {
         var char:MCSCharacter = new MCSCharacter();
         char.initMCSFromXML(this.mcs);
         if(this.scaleX != 1 || this.scaleY != 1)
         {
            char.changeScale(this.scaleX,this.scaleY);
         }
         return char;
      }
      
      public function initDuelist(playerName:String, playerLevel:int, statsStr:String, eqString:String, skillString:String, controller:int, networkID:String, standingOnRight:Boolean) : *
      {
         var strArray:Array = null;
         if(playerName.substr(0,4) == "bot_")
         {
            strArray = playerName.split("_");
            playerName = NameGenerator.getInstance().getSentryBotName(new RNG(int(strArray[1]) * 130 + int(strArray[2]) * 11));
         }
         if(statsStr == null || statsStr == "")
         {
            statsStr = "0|0|0|0|0|0|0|0|0|0|0|0|0|0";
            QueryManagerPIO.instance.client.errorLog.writeError("XMLNpc.initDuelist: statsStr null " + StatsManager.charname + " " + playerName,"","",null);
         }
         var stats:Vector.<int> = this.parsePlayerStatsString(statsStr);
         if(eqString == null || eqString == "")
         {
            eqString = DEFAULT_EQSTRING;
         }
         var equipment:Vector.<Item> = this.parseEquipmentString(eqString);
         this.equipmentStr = eqString;
         this.id = INDEX_DUELIST;
         this.name = playerName;
         this.nid = networkID;
         this.rightPos = standingOnRight;
         this.lvl = playerLevel;
         this.ai = 0;
         this.controlledBy = controller;
         this.currenthp = stats[StatsManager.STAT_HP];
         this.hp = stats[StatsManager.STAT_MAXHP] + StatsManager.findBonusStatFrom(StatsManager.STAT_MAXHP,equipment);
         this.currentchi = stats[StatsManager.STAT_CHI];
         this.chi = stats[StatsManager.STAT_MAXCHI] + StatsManager.findBonusStatFrom(StatsManager.STAT_MAXCHI,equipment);
         this.attack = stats[StatsManager.STAT_ATTACK] + StatsManager.findBonusStatFrom(StatsManager.STAT_ATTACK,equipment);
         this.defense = stats[StatsManager.STAT_DEFENSE] + StatsManager.findBonusStatFrom(StatsManager.STAT_DEFENSE,equipment);
         this.speed = stats[StatsManager.STAT_SPEED] + StatsManager.findBonusStatFrom(StatsManager.STAT_SPEED,equipment);
         if(GameEngine.isPvPRoomMode() && stats[StatsManager.STAT_BUFF2EXPIRY] != 0)
         {
            this.attack /= 2;
            this.defense /= 2;
            this.speed /= 2;
         }
         this.STAT_FIREATK = stats[StatsManager.STAT_FIREATK] + StatsManager.findBonusStatFrom(StatsManager.STAT_FIREATK,equipment);
         this.STAT_WINDATK = stats[StatsManager.STAT_WINDATK] + StatsManager.findBonusStatFrom(StatsManager.STAT_WINDATK,equipment);
         this.STAT_WATERATK = stats[StatsManager.STAT_WATERATK] + StatsManager.findBonusStatFrom(StatsManager.STAT_WATERATK,equipment);
         this.STAT_EARTHATK = stats[StatsManager.STAT_EARTHATK] + StatsManager.findBonusStatFrom(StatsManager.STAT_EARTHATK,equipment);
         this.STAT_FIREDEF = stats[StatsManager.STAT_WATERATK] + StatsManager.findBonusStatFrom(StatsManager.STAT_FIREDEF,equipment);
         this.STAT_WINDDEF = stats[StatsManager.STAT_EARTHATK] + StatsManager.findBonusStatFrom(StatsManager.STAT_WINDDEF,equipment);
         this.STAT_WATERDEF = stats[StatsManager.STAT_WINDATK] + StatsManager.findBonusStatFrom(StatsManager.STAT_WATERDEF,equipment);
         this.STAT_EARTHDEF = stats[StatsManager.STAT_FIREATK] + StatsManager.findBonusStatFrom(StatsManager.STAT_EARTHDEF,equipment);
         this.STAT_CRITICALDMG = StatsManager.findBonusStatFrom(StatsManager.STAT_CRITICALDMG,equipment);
         this.STAT_PIERCINGDMG = StatsManager.findBonusStatFrom(StatsManager.STAT_PIERCINGDMG,equipment);
         this.skillList = this.parseSkillStatsString(skillString);
         if(equipment[StatsManager.EQ_WEAPON] == null)
         {
            equipment[StatsManager.EQ_WEAPON] = new Item(0);
         }
         var itemdata:XMLItem = QuestEngine.getItemData(equipment[StatsManager.EQ_WEAPON].itemID);
         if(itemdata == null || equipment[StatsManager.EQ_WEAPON].itemID == 0)
         {
            if(itemdata == null)
            {
               trace("XMLNpc.initDuelist() - Item: " + equipment[StatsManager.EQ_WEAPON].itemID + " not found");
            }
            this.minDamage = this.attack;
            this.damageRange = 0;
            this.slashUsage = 48;
         }
         else
         {
            this.minDamage = this.attack + itemdata.mindamage;
            this.damageRange = itemdata.maxdamage - itemdata.mindamage;
            this.slashUsage = itemdata.slashusage;
            if(this.slashUsage < 48)
            {
               this.slashUsage = 48;
            }
         }
         var mcsStr:String = "<mcs>";
         mcsStr += "<armor>" + equipment[StatsManager.EQ_ARMOR].getItemID() + "</armor>";
         if(equipment[StatsManager.EQ_ARMOR].getPrimaryColor() != Item.NOCOLOR)
         {
            mcsStr += "<armorpcolor>" + equipment[StatsManager.EQ_ARMOR].getPrimaryColor() + "</armorpcolor>";
         }
         if(equipment[StatsManager.EQ_ARMOR].getSecondaryColor() != Item.NOCOLOR)
         {
            mcsStr += "<armorscolor>" + equipment[StatsManager.EQ_ARMOR].getSecondaryColor() + "</armorscolor>";
         }
         mcsStr += "<gloves>" + equipment[StatsManager.EQ_GLOVES].getItemID() + "</gloves>";
         mcsStr += "<hair>" + equipment[StatsManager.EQ_HAIR].getItemID() + "</hair>";
         mcsStr += "<hat>" + equipment[StatsManager.EQ_HAT].getItemID() + "</hat>";
         mcsStr += "<head>" + equipment[StatsManager.EQ_HEAD].getItemID() + "</head>";
         mcsStr += "<mask>" + equipment[StatsManager.EQ_MASK].getItemID() + "</mask>";
         mcsStr += "<neck>" + equipment[StatsManager.EQ_NECK].getItemID() + "</neck>";
         mcsStr += "<pants>" + equipment[StatsManager.EQ_PANTS].getItemID() + "</pants>";
         if(equipment[StatsManager.EQ_PANTS].getPrimaryColor() != Item.NOCOLOR)
         {
            mcsStr += "<pantspcolor>" + equipment[StatsManager.EQ_PANTS].getPrimaryColor() + "</pantspcolor>";
         }
         if(equipment[StatsManager.EQ_PANTS].getSecondaryColor() != Item.NOCOLOR)
         {
            mcsStr += "<pantsscolor>" + equipment[StatsManager.EQ_PANTS].getSecondaryColor() + "</pantsscolor>";
         }
         mcsStr += "<shoes>" + equipment[StatsManager.EQ_SHOES].getItemID() + "</shoes>";
         var weapon:int = equipment[StatsManager.EQ_WEAPON].getItemID();
         if(weapon == 0)
         {
            weapon = 13001;
         }
         mcsStr += "<weapon>" + weapon + "</weapon>";
         mcsStr += "<prop1>" + equipment[StatsManager.EQ_SCABBARD].getItemID() + "</prop1>";
         mcsStr += "</mcs>";
         this.mcs = new XMLList(mcsStr);
      }
      
      public function initProcGenNPC(nodeid:int, roomid:int, index:int, date:int, isBountyTarget:Boolean = false) : *
      {
         var npctype:int = 0;
         var dice:int = 0;
         var shirtlist:Array = null;
         var hairlist:Array = null;
         var hatlist:Array = null;
         var headlist:Array = null;
         var facialhairlist:Array = null;
         var pantslist:Array = null;
         var shoeslist:Array = null;
         var bossxml:XMLNpc = null;
         var seed:int = nodeid * date + roomid * (index + 3);
         var rng:RNG = new RNG(seed);
         var male:Boolean = true;
         dice = rng.rand(8);
         if(dice == 0 || dice == 6)
         {
            npctype = NPCTYPE_COMMONER;
         }
         else if(dice == 1)
         {
            npctype = NPCTYPE_OLDCOMMONER;
         }
         else if(dice == 2)
         {
            npctype = NPCTYPE_NOBLE;
         }
         else if(dice == 3)
         {
            npctype = NPCTYPE_FATNOBLE;
         }
         else if(dice == 4)
         {
            npctype = NPCTYPE_FEMALE;
         }
         else if(dice == 5 || dice == 7)
         {
            npctype = NPCTYPE_SAMURAI;
         }
         if(isBountyTarget)
         {
            npctype = NPCTYPE_SAMURAI;
         }
         if(npctype == NPCTYPE_SAMURAI)
         {
            dice = rng.rand(3);
            if(dice == 2)
            {
               male = false;
            }
         }
         var weaponlist:Array = [0];
         if(npctype == NPCTYPE_COMMONER)
         {
            this.name = NameGenerator.getInstance().getCommonerName(rng,male);
            shirtlist = [4007,4012,4013];
            hairlist = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
            hatlist = [0];
            headlist = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
            facialhairlist = [9000,9002,9004,9005,9012,9036,9037,9038,9039];
            pantslist = [11006,11007,11009,11010,11011,11012,11013,11020];
            shoeslist = [12005];
         }
         else if(npctype == NPCTYPE_OLDCOMMONER)
         {
            this.name = NameGenerator.getInstance().getCommonerName(rng,male);
            shirtlist = [4008,4010,4012,4013,4016,4017,4018,4019,4020];
            hairlist = [6005];
            hatlist = [0];
            headlist = [8003,8017,8020,8023];
            facialhairlist = [0,9003];
            pantslist = [11006,11007,11008,11009,11010,11011,11012,11013,11016,11017,11018,11019];
            shoeslist = [12003,12004,12005];
            if(rng.rand(2) == 1)
            {
               this.ai = 32;
            }
         }
         else if(npctype == NPCTYPE_NOBLE)
         {
            this.name = NameGenerator.getInstance().getNobleName(rng,male);
            shirtlist = [4008,4010];
            hairlist = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
            hatlist = [0,7004,7006];
            headlist = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
            facialhairlist = [9000,9002,9004,9005,9012,9036,9037,9038,9039];
            pantslist = [11008,11016,11017,11018,11019];
            shoeslist = [12001];
         }
         else if(npctype == NPCTYPE_FATNOBLE)
         {
            this.name = NameGenerator.getInstance().getNobleName(rng,male);
            shirtlist = [4014,4015];
            hairlist = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
            hatlist = [0,7004];
            headlist = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
            facialhairlist = [9000,9002,9004,9005,9012,9036,9037,9038,9039];
            pantslist = [11004,11008,11014,11015,11019];
            shoeslist = [12001];
         }
         else if(npctype == NPCTYPE_FEMALE)
         {
            male = false;
            this.name = NameGenerator.getInstance().getCommonerName(rng,male);
            shirtlist = [4107,4059,4060,4062];
            hairlist = [6500,6501,6502,6503,6504,6505,6506,6507,6508,6509,6518,6519];
            hatlist = [0,0,0,0,0,0,0,0,0,0,0,7003,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
            headlist = [8500,8501,8502,8503,8504,8505,8506];
            facialhairlist = [0];
            if(rng.rand(2) == 0)
            {
               pantslist = [11503];
               shoeslist = [12003,12004];
            }
            else
            {
               pantslist = [11501];
               shoeslist = [12001,12002,12005,12017];
            }
            this.ai = 33;
         }
         else if(npctype == NPCTYPE_SAMURAI)
         {
            if(male)
            {
               this.name = NameGenerator.getInstance().getSamuraiName(rng,true);
               shirtlist = [4000,4004,4007,4012,4013,4016,4017,4018,4019,4020];
               hairlist = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
               hatlist = [0,0,0,0,0,0,0,0,0,7003,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
               headlist = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
               facialhairlist = [9000,9002,9004,9005,9012,9036,9037,9038,9039];
               pantslist = [11002,11003,11004,11006,11007,11009,11010,11011,11012,11013,11016,11017,11018,11019,11020,11021,11022,11023,11024,11025,11026,11027,11028];
               shoeslist = [12000,12001,12005,12010];
               weaponlist = [13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13121,13124,13125,13126,13127,13128,13200,13201,13202,13203,13204,13205,13206,13207,13001,13002,13003,13008,13010,13011];
            }
            else
            {
               this.name = NameGenerator.getInstance().getSamuraiName(rng,false);
               shirtlist = [4107,4059,4060,4062];
               hairlist = [6500,6501,6502,6503,6504,6505,6506,6507,6508,6509,6518,6519];
               hatlist = [0,0,0,0,0,0,0,0,0,0,0,7003,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
               headlist = [8500,8501,8502,8503,8504,8505,8506];
               facialhairlist = [0];
               weaponlist = [13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13121,13124,13125,13126,13127,13128,13200,13201,13202,13203,13204,13205,13206,13207,13001,13002,13003,13008,13010,13011];
               if(rng.rand(2) == 0)
               {
                  pantslist = [11503];
                  shoeslist = [12003,12004];
               }
               else
               {
                  pantslist = [11501];
                  shoeslist = [12001,12002,12005,12017];
               }
            }
         }
         var shirt:int = int(shirtlist[rng.rand(shirtlist.length)]);
         var hair:int = int(hairlist[rng.rand(hairlist.length)]);
         var hat:int = int(hatlist[rng.rand(hatlist.length)]);
         var head:int = int(headlist[rng.rand(headlist.length)]);
         var facialhair:int = int(facialhairlist[rng.rand(facialhairlist.length)]);
         var pants:int = int(pantslist[rng.rand(pantslist.length)]);
         var shoes:int = int(shoeslist[rng.rand(shoeslist.length)]);
         var weapon:int = int(weaponlist[rng.rand(weaponlist.length)]);
         var mcsStr:String = "<mcs>";
         mcsStr += "<armor>" + shirt + "</armor>";
         mcsStr += "<gloves>5000</gloves>";
         mcsStr += "<hair>" + hair + "</hair>";
         mcsStr += "<hat>" + hat + "</hat>";
         mcsStr += "<head>" + head + "</head>";
         mcsStr += "<mask>" + facialhair + "</mask>";
         mcsStr += "<neck>10000</neck>";
         mcsStr += "<pants>" + pants + "</pants>";
         mcsStr += "<shoes>" + shoes + "</shoes>";
         mcsStr += "<weapon>" + weapon + "</weapon>";
         mcsStr += "<prop1>" + weapon + "</prop1>";
         mcsStr += "</mcs>";
         this.mcs = new XMLList(mcsStr);
         if(isBountyTarget)
         {
            bossxml = QuestEngine.getNPCData(18);
            this.id = INDEX_BOUNTYTARGET;
            this.ai = bossxml.ai;
            this.hp = bossxml.hp;
            this.chi = bossxml.chi;
            this.currenthp = bossxml.currenthp;
            this.currentchi = bossxml.currentchi;
            this.attack = bossxml.attack;
            this.defense = bossxml.defense;
            this.speed = bossxml.speed;
            this.reward = bossxml.reward;
            this.skills = bossxml.skills;
         }
      }
      
      public function getMCSString() : String
      {
         return this.mcs.armor + "|" + this.mcs.gloves + "|" + this.mcs.hair + "|" + this.mcs.hat + "|" + this.mcs.head + "|" + this.mcs.mask + "|" + this.mcs.neck + "|" + this.mcs.pants + "|" + this.mcs.shoes + "|" + this.mcs.weapon + "|" + this.mcs.prop1;
      }
      
      public function replaceMCS(eqString:String) : *
      {
         var equipment:Vector.<Item> = this.parseEquipmentString(eqString);
         this.equipmentStr = eqString;
         var mcsStr:String = "<mcs>";
         mcsStr += "<armor>" + equipment[StatsManager.EQ_ARMOR].getItemID() + "</armor>";
         if(equipment[StatsManager.EQ_ARMOR].getPrimaryColor() != Item.NOCOLOR)
         {
            mcsStr += "<armorpcolor>" + equipment[StatsManager.EQ_ARMOR].getPrimaryColor() + "</armorpcolor>";
         }
         if(equipment[StatsManager.EQ_ARMOR].getSecondaryColor() != Item.NOCOLOR)
         {
            mcsStr += "<armorscolor>" + equipment[StatsManager.EQ_ARMOR].getSecondaryColor() + "</armorscolor>";
         }
         mcsStr += "<gloves>" + equipment[StatsManager.EQ_GLOVES].getItemID() + "</gloves>";
         mcsStr += "<hair>" + equipment[StatsManager.EQ_HAIR].getItemID() + "</hair>";
         mcsStr += "<hat>" + equipment[StatsManager.EQ_HAT].getItemID() + "</hat>";
         mcsStr += "<head>" + equipment[StatsManager.EQ_HEAD].getItemID() + "</head>";
         mcsStr += "<mask>" + equipment[StatsManager.EQ_MASK].getItemID() + "</mask>";
         mcsStr += "<neck>" + equipment[StatsManager.EQ_NECK].getItemID() + "</neck>";
         mcsStr += "<pants>" + equipment[StatsManager.EQ_PANTS].getItemID() + "</pants>";
         if(equipment[StatsManager.EQ_PANTS].getPrimaryColor() != Item.NOCOLOR)
         {
            mcsStr += "<pantspcolor>" + equipment[StatsManager.EQ_PANTS].getPrimaryColor() + "</pantspcolor>";
         }
         if(equipment[StatsManager.EQ_PANTS].getSecondaryColor() != Item.NOCOLOR)
         {
            mcsStr += "<pantsscolor>" + equipment[StatsManager.EQ_PANTS].getSecondaryColor() + "</pantsscolor>";
         }
         mcsStr += "<shoes>" + equipment[StatsManager.EQ_SHOES].getItemID() + "</shoes>";
         var weapon:int = equipment[StatsManager.EQ_WEAPON].getItemID();
         if(weapon == 0)
         {
            weapon = 13001;
         }
         mcsStr += "<weapon>" + weapon + "</weapon>";
         mcsStr += "<prop1>" + equipment[StatsManager.EQ_SCABBARD].getItemID() + "</prop1>";
         mcsStr += "</mcs>";
         this.mcs = new XMLList(mcsStr);
      }
      
      public function isAnimal() : Boolean
      {
         return this.ai == 8 || this.ai == 10 || this.ai == 11 || this.ai == 12 || this.ai == 16 || this.ai == 17 || this.ai == 18 || this.ai == 19 || this.ai == 21 || this.ai == 24;
      }
      
      public function parseSkill() : *
      {
         var skillxml:XMLList = null;
         var skilllvl:int = 0;
         this.skillList = new Vector.<IntStat>();
         var max:int = int(this.skills.skill.length());
         for(var i:int = 0; i < max; i++)
         {
            skillxml = XMLList(this.skills.skill[i]);
            if(skillxml.lvl.toString() != "")
            {
               skilllvl = int(skillxml.lvl);
            }
            else
            {
               skilllvl = 1;
            }
            this.skillList.push(new IntStat(skillxml.id,skilllvl));
         }
      }
      
      public function getMastery(skillid:int) : int
      {
         if(this.skillList == null)
         {
            this.parseSkill();
         }
         var max:int = int(this.skillList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.skillList[i].getId() == skillid)
            {
               return this.skillList[i].getValue();
            }
         }
         return 0;
      }
      
      internal function parsePlayerStatsString(str:String) : Vector.<int>
      {
         var strArray:Array = str.split("|");
         if(strArray.length == 14 || strArray.length == 18)
         {
            return parseBattleStatsString(str);
         }
         var playerStats:Vector.<int> = new Vector.<int>(StatsManager.playerStatsCount);
         for(var i:int = 0; i < strArray.length - 1; i++)
         {
            playerStats[i] = strArray[i];
         }
         return playerStats;
      }
      
      internal function parseEquipmentString(str:String) : Vector.<Item>
      {
         var equipment:Vector.<Item> = new Vector.<Item>(13);
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            equipment[i] = Item.parseNoQty(strArray[i]);
         }
         return equipment;
      }
      
      internal function parseSkillStatsString(str:String) : Vector.<IntStat>
      {
         var skillStats:Vector.<IntStat> = new Vector.<IntStat>();
         if(str == null)
         {
            return skillStats;
         }
         var strArray:Array = str.split("|");
         for(var i:* = 0; i < strArray.length; i++)
         {
            skillStats.push(IntStat.parse(strArray[i]));
         }
         return skillStats;
      }
      
      public function getEquipmentStr() : *
      {
         return this.equipmentStr;
      }
      
      public function getClone() : XMLNpc
      {
         var xml:XMLNpc = new XMLNpc(null);
         xml.id = this.id;
         xml.name = this.name;
         xml.lvl = this.lvl;
         xml.ai = this.ai;
         xml.hp = this.hp;
         xml.currenthp = this.currenthp;
         xml.chi = this.chi;
         xml.currentchi = this.currentchi;
         xml.attack = this.attack;
         xml.defense = this.defense;
         xml.speed = this.speed;
         xml.skills = this.skills;
         xml.mcs = this.mcs;
         xml.reward = this.reward;
         xml.skillList = this.skillList;
         xml.minDamage = this.minDamage;
         xml.damageRange = this.damageRange;
         xml.slashUsage = this.slashUsage;
         xml.controlledBy = this.controlledBy;
         xml.nid = this.nid;
         xml.rightPos = this.rightPos;
         xml.equipmentStr = this.equipmentStr;
         return xml;
      }
   }
}

