package
{
   import flash.geom.Point;
   
   public class EnemyPlayer extends MCSPlayer
   {
      
      internal var charname:String;
      
      internal var equipmentStr:String;
      
      internal var statStr:String;
      
      internal var skillStr:String;
      
      internal var tauntStr:String;
      
      internal var isDuelist:Boolean = false;
      
      internal var isBoss:Boolean = false;
      
      internal var id:String;
      
      internal var cooldownArray:Array;
      
      internal var side:int;
      
      internal var hasBowed:Boolean = false;
      
      internal var veryCloseRangeSkillList:Array = [SkillManager.SKILL_DEADLYCLEAVE,SkillManager.SKILL_DEATHTOUCH,SkillManager.SKILL_SPIRITTHIEF,SkillManager.SKILL_SLASHWAVE,SkillManager.SKILL_FIREBREATH,SkillManager.SKILL_GROUNDPUNCH,SkillManager.SKILL_WATERSPLASH,SkillManager.SKILL_WINDKICK,SkillManager.SKILL_SHUNPO,SkillManager.SKILL_THOUSANDSTABS,SkillManager.SKILL_CHIPUNCH,SkillManager.SKILL_CHIKICK,SkillManager.SKILL_CHIBURST,SkillManager.SKILL_HEAVENLYSWORDS,SkillManager.SKILL_FLASHBANG,SkillManager.SKILL_BACKTHROW];
      
      internal var closeRangeSkillList:Array = [SkillManager.SKILL_SLASHWAVE,SkillManager.SKILL_FIREBREATH,SkillManager.SKILL_GROUNDPUNCH,SkillManager.SKILL_WATERSPLASH,SkillManager.SKILL_WINDKICK,SkillManager.SKILL_SHUNPO,SkillManager.SKILL_DEADLYCLEAVE,SkillManager.SKILL_CHIBURST,SkillManager.SKILL_HEAVENLYSWORDS,SkillManager.SKILL_FLASHBANG,SkillManager.SKILL_WINDMILL,SkillManager.SKILL_BULLCHARGE,SkillManager.SKILL_PUNCHLUNGE];
      
      internal var midRangeSkillList:Array = [SkillManager.SKILL_WINDMILL,SkillManager.SKILL_DASHLEFT,SkillManager.SKILL_DASHRIGHT,SkillManager.SKILL_THOUSANDSTABS,SkillManager.SKILL_SHUNPO,SkillManager.SKILL_KUNAITHROW,SkillManager.SKILL_TRAP,SkillManager.SKILL_TRAPFIRE,SkillManager.SKILL_TRAPWATER,SkillManager.SKILL_TRAPWIND,SkillManager.SKILL_TRAPEARTH,SkillManager.SKILL_KUNAIFIRE,SkillManager.SKILL_KUNAIWATER,SkillManager.SKILL_KUNAIWIND,SkillManager.SKILL_KUNAIEARTH,SkillManager.SKILL_CHARGEDSHOT,SkillManager.SKILL_HEAVENLYSWORDS,SkillManager.SKILL_SHADOWCLONE,SkillManager.SKILL_MASSCLONE,SkillManager.SKILL_SUBSTITUTIONLOG,SkillManager.SKILL_BULLCHARGE,SkillManager.SKILL_PUNCHLUNGE];
      
      internal var longRangeSkillList:Array = [SkillManager.SKILL_KUNAITHROW,SkillManager.SKILL_TRAP,SkillManager.SKILL_TRAPFIRE,SkillManager.SKILL_TRAPWATER,SkillManager.SKILL_TRAPWIND,SkillManager.SKILL_TRAPEARTH,SkillManager.SKILL_KUNAIFIRE,SkillManager.SKILL_KUNAIWATER,SkillManager.SKILL_KUNAIWIND,SkillManager.SKILL_KUNAIEARTH,SkillManager.SKILL_CHARGEDSHOT,SkillManager.SKILL_HEAVENLYSWORDS,SkillManager.SKILL_SHADOWCLONE,SkillManager.SKILL_MASSCLONE,SkillManager.SKILL_SUBSTITUTIONLOG,SkillManager.SKILL_BULLCHARGE];
      
      internal var skillDataCache:Array = new Array();
      
      public function EnemyPlayer(mcs:MCSCharacter = null, isDuelist:Boolean = false, isBoss:Boolean = false)
      {
         super();
         if(mcs == null)
         {
            this.mcs = new MCSCharacter();
         }
         else
         {
            this.mcs = mcs;
         }
         startAction(FALL_STATE);
         aiCounterMax = 12;
         this.isDuelist = isDuelist;
         this.isBoss = isBoss;
      }
      
      override public function setLevel(lvl:int) : *
      {
         var factor:Number = NaN;
         var skilldata:XMLSkill = null;
         var namecolor:int = 0;
         var playerHP:int = 0;
         var playerDEF:int = 0;
         var playerATK:int = 0;
         var playerLVL:int = 0;
         var lvldiff:int = 0;
         var hitsToKillBoss:int = 0;
         var hitsToKillPlayer:int = 0;
         var playerhit:int = 0;
         var bossHP:int = 0;
         var bosshit:int = 0;
         var bossATK:int = 0;
         factor = lvl / level;
         level = lvl;
         minDamage = damage * factor;
         defense *= factor;
         maxhp *= factor;
         setHP(maxhp);
         updateHealthBar();
         if(this.isBoss || this.isDuelist)
         {
            xp = lvl * 5 + 45;
            namecolor = 16777215;
            mcs.setDisplayName(this.charname + " (" + lvl + ")",namecolor);
         }
         else
         {
            xp = lvl * 2 + 20;
         }
         if(this.isBoss)
         {
            playerHP = StatsManager.getPlayerStats(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
            playerDEF = StatsManager.getPlayerStats(StatsManager.STAT_DEFENSE) + StatsManager.findBonusStat(StatsManager.STAT_DEFENSE);
            playerATK = StatsManager.getMinDamage() + StatsManager.getDamageRange() / 2;
            playerLVL = StatsManager.getLevel();
            lvldiff = lvl - playerLVL;
            hitsToKillBoss = 8 + lvldiff;
            hitsToKillPlayer = 16 - lvldiff;
            if(hitsToKillBoss <= 0)
            {
               hitsToKillBoss = 1;
            }
            if(hitsToKillPlayer <= 0)
            {
               hitsToKillPlayer = 2;
            }
            playerhit = playerATK - defense;
            if(playerLVL <= 10 && playerhit < 1)
            {
               playerhit = 1;
            }
            else if(playerLVL <= 20 && playerhit < playerLVL / 8)
            {
               playerhit = playerLVL / 8;
            }
            else if(playerLVL <= 30 && playerhit < playerLVL / 6)
            {
               playerhit = playerLVL / 6;
            }
            else if(playerhit < playerLVL / 4)
            {
               playerhit = playerLVL / 4;
            }
            bossHP = playerhit * hitsToKillBoss;
            if(bossHP > maxhp)
            {
               maxhp = bossHP;
               setHP(maxhp);
               updateHealthBar();
            }
            bosshit = playerHP / hitsToKillPlayer;
            bossATK = bosshit + playerDEF;
            if(bossATK > minDamage)
            {
               minDamage = bossATK;
            }
         }
         if(lvl <= 5)
         {
            minDamage = 1;
            defense = 1;
         }
         this.generateSkillList();
         var max:int = int(skillList.length);
         this.cooldownArray = new Array();
         for(var i:int = 0; i < max; i++)
         {
            skilldata = QuestEngine.getSkillData(skillList[i].getId());
            if(skilldata != null)
            {
               this.cooldownArray[skillList[i].getId()] = skilldata.getCooldown(skillList[i].getValue());
            }
         }
         setStance(stance);
      }
      
      internal function generateSkillList() : *
      {
         skillList = new Vector.<IntStat>();
         var rng:RNG = new RNG(StageManager.getCurrentNode() * QueryManager.instance.getServerDate() + StageManager.getCurrentRoom() * 3);
         if(level >= 6)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1014,1));
            }
         }
         if(level >= 20)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1015,1));
            }
         }
         if(level >= 12)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1036,1));
            }
         }
         if(level >= 70)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1039,1));
            }
         }
         if(level >= 6)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1016,1));
            }
         }
         if(level >= 20)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1017,1));
            }
         }
         if(level >= 12)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1037,1));
            }
         }
         if(level >= 70)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1040,1));
            }
         }
         if(level >= 6)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1018,1));
            }
         }
         if(level >= 20)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1019,1));
            }
         }
         if(level >= 12)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1038,1));
            }
         }
         if(level >= 70)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1041,1));
            }
         }
         if(level >= 10)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1005,3));
            }
            else if(level >= 7)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1005,2));
               }
               else if(level >= 5)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1005,1));
                  }
               }
            }
         }
         if(level >= 20)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1006,3));
            }
            else if(level >= 17)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1006,2));
               }
               else if(level >= 15)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1006,1));
                  }
               }
            }
         }
         if(level >= 5)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1042,3));
            }
            else if(level >= 2)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1042,2));
               }
               else if(level >= 0)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1042,1));
                  }
               }
            }
         }
         if(level >= 30)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1043,3));
            }
            else if(level >= 27)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1043,2));
               }
               else if(level >= 25)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1043,1));
                  }
               }
            }
         }
         if(level >= 40)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1044,3));
            }
            else if(level >= 37)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1044,2));
               }
               else if(level >= 35)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1044,1));
                  }
               }
            }
         }
         if(level >= 50)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1045,3));
            }
            else if(level >= 47)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1045,2));
               }
               else if(level >= 45)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1045,1));
                  }
               }
            }
         }
         if(level >= 60)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1046,3));
            }
            else if(level >= 57)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1046,2));
               }
               else if(level >= 55)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1046,1));
                  }
               }
            }
         }
         if(level >= 70)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1047,3));
            }
            else if(level >= 67)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1047,2));
               }
               else if(level >= 65)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1047,1));
                  }
               }
            }
         }
         if(level >= 75)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1048,1));
            }
         }
         this.skillStr += skillList.push(new IntStat(1003,1));
         this.skillStr += skillList.push(new IntStat(1049,1));
         this.skillStr += skillList.push(new IntStat(1050,1));
         if(level >= 8)
         {
            skillList.push(new IntStat(1004,3));
         }
         else if(level >= 5)
         {
            skillList.push(new IntStat(1004,2));
         }
         else if(level >= 3)
         {
            skillList.push(new IntStat(1004,1));
         }
         if(level >= 30)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1007,3));
            }
            else if(level >= 20)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1007,2));
               }
               else if(level >= 10)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1007,1));
                  }
               }
            }
         }
         if(level >= 25)
         {
            if(rng.rand(2) == 0)
            {
               skillList.push(new IntStat(1010,3));
            }
            else if(level >= 22)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1010,2));
               }
               else if(level >= 20)
               {
                  if(rng.rand(2) == 0)
                  {
                     skillList.push(new IntStat(1010,1));
                  }
               }
            }
         }
         if(level >= 75)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1012,3));
            }
            else if(level >= 72)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1012,2));
               }
               else if(level >= 70)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1012,1));
                  }
               }
            }
         }
         if(level >= 20)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1024,3));
            }
            else if(level >= 17)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1024,2));
               }
               else if(level >= 15)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1024,1));
                  }
               }
            }
         }
         if(level >= 35)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1051,3));
            }
            else if(level >= 32)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1051,2));
               }
               else if(level >= 30)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1051,1));
                  }
               }
            }
         }
         if(level >= 45)
         {
            if(rng.rand(4) == 0)
            {
               skillList.push(new IntStat(1052,3));
            }
            else if(level >= 42)
            {
               if(rng.rand(4) == 0)
               {
                  skillList.push(new IntStat(1052,2));
               }
               else if(level >= 40)
               {
                  if(rng.rand(4) == 0)
                  {
                     skillList.push(new IntStat(1052,1));
                  }
               }
            }
         }
         if(level >= 55)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1053,3));
            }
            else if(level >= 52)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1053,2));
               }
               else if(level >= 50)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1053,1));
                  }
               }
            }
         }
         if(level >= 65)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1054,3));
            }
            else if(level >= 62)
            {
               if(rng.rand(3) == 0)
               {
                  skillList.push(new IntStat(1054,2));
               }
               else if(level >= 60)
               {
                  if(rng.rand(3) == 0)
                  {
                     skillList.push(new IntStat(1054,1));
                  }
               }
            }
         }
         if(level >= 80)
         {
            if(rng.rand(3) == 0)
            {
               skillList.push(new IntStat(1055,1));
            }
         }
         if(rng.rand(3) == 0)
         {
            STAT_FIREATK = rng.rand(level * 1.5);
         }
         else
         {
            STAT_FIREATK = 0;
         }
         if(STAT_FIREATK > 0)
         {
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1013,1));
               }
            }
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1025,1));
               }
            }
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1029,1));
               }
            }
         }
         if(rng.rand(3) == 0)
         {
            STAT_WATERATK = rng.rand(level * 1.5);
         }
         else
         {
            STAT_WATERATK = 0;
         }
         if(STAT_WATERATK > 0)
         {
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1026,1));
               }
            }
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1030,1));
               }
            }
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1035,1));
               }
            }
         }
         if(rng.rand(3) == 0)
         {
            STAT_WINDATK = rng.rand(level * 1.5);
         }
         else
         {
            STAT_WINDATK = 0;
         }
         if(STAT_WINDATK > 0)
         {
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1027,1));
               }
            }
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1031,1));
               }
            }
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1034,1));
               }
            }
         }
         if(rng.rand(3) == 0)
         {
            STAT_EARTHATK = rng.rand(level * 1.5);
         }
         else
         {
            STAT_EARTHATK = 0;
         }
         if(STAT_EARTHATK > 0)
         {
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1028,1));
               }
            }
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1032,1));
               }
            }
            if(level >= 20)
            {
               if(rng.rand(2) == 0)
               {
                  skillList.push(new IntStat(1033,1));
               }
            }
         }
      }
      
      override public function init(xml:XMLNpc) : *
      {
         var namecolor:int = 0;
         var max:int = 0;
         var skilldata:XMLSkill = null;
         var i:int = 0;
         var selectedStance:int = 0;
         reset();
         initMCSFromXML(xml.mcs);
         var itemdata:XMLItem = QuestEngine.getItemData(xml.mcs.weapon);
         if(itemdata == null)
         {
            itemdata = QuestEngine.getItemData(13002);
         }
         var baseReload:int = 48 + xml.speed * 6;
         var val:int = xml.speed;
         var maxincrement:int = 90;
         var baseSlashLength:int = 120 + Math.floor(maxincrement * val / (20 + val));
         var lightMastery:int = xml.getMastery(1000);
         var balancedMastery:int = xml.getMastery(1001);
         var heavyMastery:int = xml.getMastery(1002);
         initPlayer(xml.controlledBy,xml.currenthp,xml.hp,xml.currentchi,xml.chi,xml.defense,baseReload,xml.minDamage,xml.damageRange,baseSlashLength,xml.slashUsage,lightMastery,balancedMastery,heavyMastery,xml.lvl);
         initAttackStats(xml.attack,xml.STAT_FIREATK,xml.STAT_WINDATK,xml.STAT_WATERATK,xml.STAT_EARTHATK);
         initElementDefenseStats(xml.STAT_FIREDEF,xml.STAT_WINDDEF,xml.STAT_WATERDEF,xml.STAT_EARTHDEF);
         if(controlledBy == 1)
         {
            setHP(xml.hp);
         }
         nid = xml.nid;
         if(this.isDuelist || this.isBoss)
         {
            namecolor = 16777215;
            if(this.side != 0 && this.side != StatsManager.getSide())
            {
               namecolor = 10027008;
            }
            mcs.setDisplayName(xml.name + " (" + level + ")",namecolor);
            this.charname = xml.name;
            if(controlledBy == 1)
            {
               if(this.isBoss && level > 70)
               {
                  minDamage *= 1.25;
                  maxhp *= 1.25;
                  setHP(maxhp);
               }
               else if(this.isBoss && level > 50)
               {
                  minDamage *= 1.2;
                  maxhp *= 1.2;
                  setHP(maxhp);
               }
               else if(level > 30)
               {
                  minDamage *= 1.1;
                  maxhp *= 1.1;
                  setHP(maxhp);
               }
               else if(level < 10)
               {
                  minDamage *= 0.8;
                  maxhp *= 0.8;
                  setHP(maxhp);
               }
            }
         }
         else
         {
            mcs.setDisplayName("");
            minDamage = xml.attack;
            damageRange = 0;
         }
         mcs.setSpeechText("");
         reward = new XMLReward(xml.reward);
         mcs.showHealthBar();
         updateHealthBar();
         xp = level * 5 + 45;
         canSeeSlash = true;
         if(!this.isBoss)
         {
            skillList = xml.skillList;
            max = int(skillList.length);
            this.cooldownArray = new Array();
            for(i = 0; i < max; i++)
            {
               skilldata = QuestEngine.getSkillData(skillList[i].getId());
               if(skilldata != null)
               {
                  this.cooldownArray[skillList[i].getId()] = skilldata.getCooldown(skillList[i].getValue());
               }
            }
         }
         else
         {
            skillList = new Vector.<IntStat>();
         }
         if(xml.getMastery(1500) > 0)
         {
            setStance(REVERSED_STANCE);
         }
         else if(xml.getMastery(1501) > 0)
         {
            setStance(DUAL_STANCE);
         }
         else if(lightMastery == balancedMastery && balancedMastery == heavyMastery)
         {
            setStance(Math.random() * 3);
         }
         else
         {
            selectedStance = 1;
            if(lightMastery > balancedMastery && lightMastery >= heavyMastery)
            {
               selectedStance = 0;
            }
            if(heavyMastery > balancedMastery && heavyMastery >= lightMastery)
            {
               selectedStance = 2;
            }
            setStance(selectedStance);
         }
         if(mcs.y == StageManager.getGroundY())
         {
            startAction(IDLE_STATE);
         }
         else
         {
            startAction(FALL_STATE);
         }
      }
      
      public function initNetworkPlayer(id:String, nid:String, cname:String, charlvl:int, equip:String, stats:String, skills:String, taunt:String, side:int) : *
      {
         var npcXML:XMLNpc = null;
         controlledBy = 2;
         reset();
         mcs.initMCSFromEqString(equip);
         this.equipmentStr = equip;
         this.charname = cname;
         this.side = side;
         var namecolor:int = 16777215;
         mcs.setDisplayName(this.charname + " (" + charlvl + ")",namecolor);
         level = charlvl;
         this.nid = nid;
         this.id = id;
         dead = false;
         animFrozen = false;
         slashCommitted = false;
         hasSlash = false;
         hasSlashBuffer = false;
         slashArray.length = 0;
         slashArrayBuffer.length = 0;
         walkSpeed = 4;
         if(stats != null && stats != "")
         {
            this.statStr = stats;
            this.skillStr = skills;
            this.tauntStr = taunt;
            npcXML = new XMLNpc(null);
            if(this.equipmentStr == null)
            {
               QueryManagerPIO.instance.client.errorLog.writeError("EnemyPlayer.initNetworkPlayer: eqString null " + StatsManager.charname + " " + cname,"","",null);
            }
            npcXML.initDuelist(this.charname,charlvl,this.statStr,this.equipmentStr,this.skillStr,2,nid,true);
            this.init(npcXML);
         }
      }
      
      override public function update() : *
      {
         var max:int = 0;
         var i:int = 0;
         if(!dead && !animFrozen && (target == null || target.isDead()))
         {
            target = NPCManager.getNearestEnemy(getMapPosition(),!isFriendly);
            if(target == null)
            {
               startAction(IDLE_STATE);
            }
         }
         super.update();
         if(skillList != null)
         {
            max = int(skillList.length);
            for(i = 0; i < max; i++)
            {
               if(this.cooldownArray[skillList[i].getId()] > 0)
               {
                  --this.cooldownArray[skillList[i].getId()];
               }
            }
         }
      }
      
      override public function redFreeze() : *
      {
         cleanUpPlayer();
         mcs.hideHealthBar();
         mcs.setSpeechText("");
         if(mcs.alpha < 1)
         {
            mcs.visible = false;
         }
         else
         {
            ColorCode.makeDark(mcs,-255);
         }
         if(actionState != GOTLAUNCHED_STATE && actionState != DYING_STATE)
         {
            animFrozen = true;
         }
      }
      
      internal function interpolatePosition(networkPos:int, latencyms:int) : *
      {
         var latencyframes:int = latencyms / (1000 / 24);
      }
      
      override public function gotInput(lineArray:Vector.<Point>, isLine:Boolean, posX:int = -1) : *
      {
         if(getHP() <= 0 || dead || mcs == null)
         {
            return;
         }
         if(StageManager.isPeaceful())
         {
            isLine = false;
         }
         if(slashCommitted || actionState == FALL_STATE && stance != LIGHT_STANCE || actionState == GOTLAUNCHED_STATE || isDowned() || actionState == JUMP_STATE || actionState == FORWARDROLL_STATE)
         {
            if(isLine)
            {
               slashArrayBuffer = lineArrayDeepCopy(lineArray);
               hasSlashBuffer = true;
            }
         }
         else if(!slashCommitted)
         {
            if(isLine)
            {
               slashArray = lineArrayDeepCopy(lineArray);
               initSlash(slashArray[0]);
            }
            else if(actionState != FALL_STATE && actionState != GOTLAUNCHED_STATE && actionState != DOWNED_STATE && actionState != JUMP_STATE && actionState != FORWARDROLL_STATE)
            {
               initMove(lineArray[0]);
            }
         }
      }
      
      override internal function AI() : *
      {
         var dice:int = 0;
         var max:int = 0;
         var flag:Boolean = false;
         var i:int = 0;
         var pt:Point = null;
         var downedDist:int = 0;
         var skilllist:Array = null;
         var selectedSkill:int = 0;
         if(animFrozen || isUsingSkill() || actionState == FLINCH_STATE || actionState == STUN_STATE || actionState == SKILL_UNDYING_STATE)
         {
            return;
         }
         if(isDowned() || actionState == GOTLAUNCHED_STATE)
         {
            if(!(this.canUseSkill(SkillManager.SKILL_SMOKEBOMB) && this.getSkillLevel(SkillManager.SKILL_SMOKEBOMB) > 1))
            {
               return;
            }
            this.doSkill(SkillManager.SKILL_SMOKEBOMB);
         }
         if(level <= 3 && Math.random() * 5 < 1)
         {
            return;
         }
         if(target == null || target.isDead())
         {
            target = NPCManager.getNearestEnemy(getMapPosition(),!isFriendly);
            if(target == null)
            {
               if(getMapPosition() < 50 || getMapPosition() > StageManager.getGameStageWidth() - 50)
               {
                  moveTo(Math.random() * (StageManager.getGameStageWidth() - 100) + 50,StageManager.getGroundY());
               }
               return;
            }
         }
         if(StageManager.isPeaceful())
         {
            if(!this.hasBowed && GameEngine.isDuelMode())
            {
               this.hasBowed = true;
               startAction(IDLE_STATE);
               startAnim(MCSActor.BOW2);
            }
            if(actionState == IDLE_STATE && Math.abs(target.getMapPosition() - getMapPosition()) < 100)
            {
               moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
            }
            return;
         }
         if(target != null && target.getMCS().alpha < 1 || !target.getMCS().visible)
         {
            if(int(Math.random() * 3) == 0)
            {
               moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
            }
            return;
         }
         if(!isFriendly && canSeeSlash && level > 3 && StageManager.getPlayer().gotSlash() && int(Math.random() * 3) <= 1 && this.isUnderSlash())
         {
            this.doEvade();
         }
         else if(!(actionState == SLASH_STATE || actionState == SLASH_START_STATE || actionState == FALL_STATE))
         {
            if(hasSlash || mcs.animation == DOWNSTAB || mcs.animation == DOWNSTAB_UP)
            {
               max = int(inputArray.length);
               flag = false;
               i = 0;
               while(i < max && !flag)
               {
                  pt = inputArray[i];
                  if(target.mcs.hitTestPoint(pt.x,pt.y,true))
                  {
                     flag = true;
                  }
                  i++;
               }
               if(!flag)
               {
                  slashTarget();
               }
            }
            else if(target.isDowned())
            {
               this.doSkill(SkillManager.SKILL_HEAVENLYSWORDS,target.getMapPosition());
               downedDist = Math.abs(target.getMapPosition() - getMapPosition());
               if(this.canUseSkill(SkillManager.SKILL_AIRSTAB) && downedDist > 50 && downedDist < 200)
               {
                  faceTarget();
                  this.doSkill(SkillManager.SKILL_AIRSTAB);
               }
               else if(canStab)
               {
                  stabTarget();
               }
               else if(int(Math.random() * 2) == 0)
               {
                  slashDownedTarget();
               }
               else
               {
                  moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
               }
            }
            else if(canAirCombo && target.isAirborne())
            {
               if(Math.abs(target.getMapPosition() - getMapPosition()) < 120)
               {
                  if(stance == LIGHT_STANCE || stance == BALANCED_STANCE)
                  {
                     if(target.getMapPosition() < mcs.x)
                     {
                        slashDiagonalLeft();
                     }
                     else
                     {
                        slashDiagonalRight();
                     }
                  }
               }
            }
            else
            {
               dice = Math.random() * 4;
               if(dice == 0)
               {
                  faceTarget();
                  skilllist = this.getUsableSkills(target.getMapPosition() - getMapPosition());
                  if(skilllist.length > 0)
                  {
                     selectedSkill = int(skilllist[int(Math.random() * skilllist.length)]);
                     if(selectedSkill == SkillManager.SKILL_CHARGEDSHOT && this.canUseSkill(selectedSkill))
                     {
                        chargingTime = 48;
                     }
                     else if(selectedSkill == SkillManager.SKILL_SHUNPO && this.canUseSkill(selectedSkill))
                     {
                        actionState = SKILL_SHUNPO_STATE;
                        chargingTime = 96;
                     }
                     else if(selectedSkill == SkillManager.SKILL_THOUSANDSTABS && this.canUseSkill(selectedSkill))
                     {
                        actionState = SKILL_THOUSANDSTABS_STATE;
                        chargingTime = 96;
                     }
                     else if(selectedSkill == SkillManager.SKILL_DEADLYCLEAVE && this.canUseSkill(selectedSkill))
                     {
                        actionState = SKILL_THOUSANDSTABS_STATE;
                        chargingTime = 120;
                     }
                     if(this.doSkill(selectedSkill))
                     {
                        return;
                     }
                  }
               }
               if(reload < doReload)
               {
                  if(this.doSkill(SkillManager.SKILL_FOCUS))
                  {
                     return;
                  }
                  if(actionState == IDLE_STATE || actionState == POSE_STATE)
                  {
                     moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
                  }
               }
               else if(reload < 24)
               {
                  doReload = 24 + Math.random() * (maxreload - 24);
                  if(this.canUseSkill(SkillManager.SKILL_STEALTH))
                  {
                     this.doSkill(SkillManager.SKILL_STEALTH);
                     return;
                  }
                  moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
               }
               else
               {
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     if(canLaunch && !isAirborne())
                     {
                        launchTarget();
                     }
                     else
                     {
                        slashTarget();
                     }
                  }
                  else
                  {
                     slashTarget();
                  }
                  doReload = 0;
               }
            }
         }
      }
      
      override internal function getTargetPosition() : int
      {
         return target.getMapPosition();
      }
      
      override internal function getDamage() : int
      {
         if(this.isBoss)
         {
            return minDamage;
         }
         return super.getDamage();
      }
      
      internal function isUnderSlash() : Boolean
      {
         var pt:Point = null;
         var slashArray:Vector.<Point> = StageManager.getPlayer().getSlashArray();
         var offset:int = StageManager.getStagePosition();
         var max:int = int(slashArray.length);
         for(var i:int = 0; i < max; i++)
         {
            pt = slashArray[i];
            if(mcs.hitTestPoint(pt.x - offset,pt.y))
            {
               return true;
            }
         }
         return false;
      }
      
      internal function doEvade() : *
      {
         var startY:int = 0;
         var changeX:int = 0;
         var changeY:int = 0;
         if(this.doSkill(SkillManager.SKILL_ROLL))
         {
            return;
         }
         if(this.doSkill(SkillManager.SKILL_JUMP))
         {
            return;
         }
         if(this.doSkill(SkillManager.SKILL_DASHLEFT))
         {
            return;
         }
         if(this.doSkill(SkillManager.SKILL_DASHRIGHT))
         {
            return;
         }
         if(this.doSkill(SkillManager.SKILL_SMOKEBOMB))
         {
            return;
         }
         var startX:int = getMapPosition();
         var newangle:Number = 1.047;
         var slashDiag:* = slashLength;
         switch(int(Math.random() * 4))
         {
            case 0:
               startY = mcs.y - Math.random() * 100 - 80;
               changeY = -20 * Math.sin(1.047);
               changeX = 20 * Math.cos(1.047);
               break;
            case 1:
               startY = mcs.y - Math.random() * 100 - 80;
               changeY = -20 * Math.sin(1.047);
               changeX = -20 * Math.cos(1.047);
               break;
            case 2:
            case 3:
               startY = mcs.y - 50;
               if(mcs.x > target.mcs.x)
               {
                  changeX = 20;
               }
               else
               {
                  changeX = -20;
               }
               changeY = 0;
         }
         makeSlash(startX,startY,changeX,changeY);
      }
      
      override internal function createLoot() : *
      {
         if(dontGiveLoot && controlledBy == 2)
         {
            return;
         }
         if(GameEngine.action == 10 && this.isDuelist)
         {
            OverworldHUD.instance.warUI.warHexUI.killSentry(nid);
            QueryManager.instance.addWarMessage(OverworldHUD.instance.warUI.warHexUI.mapid,0,0,"[d]",OverworldHUD.instance.warUI.warHexUI.getDefeatMessage(this.charname,level));
            return;
         }
         if(this.isDuelist)
         {
            OverworldHUD.instance.lootDialog.addRandomLootItem(level);
            if(level <= 10 || int(Math.random() * 3) == 0)
            {
               OverworldHUD.instance.lootDialog.addLootCoins(Math.random() * level);
            }
         }
         else
         {
            super.createLoot();
         }
      }
      
      override internal function rewardXP() : *
      {
         if(dontGiveLoot && controlledBy == 2)
         {
            return;
         }
         var playerlevel:int = StatsManager.getLevel();
         if(this.isDuelist)
         {
            if(playerlevel < 10)
            {
               OverworldHUD.instance.lootDialog.addLootXP(calcXP(StatsManager.getLevel(),level,xp,false) * 3);
            }
            else
            {
               OverworldHUD.instance.lootDialog.addLootXP(calcXP(StatsManager.getLevel(),level,xp,true));
            }
         }
         else
         {
            OverworldHUD.instance.lootDialog.addLootXP(calcXP(StatsManager.getLevel(),level,xp,this.isBoss));
         }
      }
      
      public function updateBusy(busy:Boolean) : *
      {
         if(mcs == null)
         {
            return;
         }
         if(busy)
         {
            mcs.setDisplayName(this.charname + " (" + LangManager.getString(203) + ")",16777215);
            stopMoving(false);
         }
         else
         {
            mcs.setDisplayName(this.charname + " (" + level + ")",16777215);
         }
      }
      
      override internal function getSkillLevel(skillid:int) : int
      {
         if(skillList == null)
         {
            trace("EnemyPlayer:getSkillLevel called when skillList is null " + skillid);
            return 0;
         }
         var max:int = int(skillList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(skillList[i].getId() == skillid)
            {
               return skillList[i].getValue();
            }
         }
         return 0;
      }
      
      internal function hasSkill(skillid:int) : Boolean
      {
         var max:int = int(skillList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(skillList[i].getId() == skillid)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function canUseSkill(skillid:int) : Boolean
      {
         return this.hasSkill(skillid) && this.cooldownArray[skillid] == 0;
      }
      
      internal function getUsableSkills(dist:int) : Array
      {
         var list:Array = null;
         var output:Array = new Array();
         var distsq:int = dist * dist;
         if(distsq < 40000)
         {
            list = this.veryCloseRangeSkillList;
         }
         if(distsq < 90000)
         {
            list = this.closeRangeSkillList;
         }
         else if(distsq < 160000)
         {
            list = this.midRangeSkillList;
         }
         else
         {
            list = this.longRangeSkillList;
         }
         var max:int = int(list.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.canUseSkill(list[i]))
            {
               output.push(list[i]);
            }
         }
         return output;
      }
      
      internal function doSkill(skillid:int, xpos:int = -1, ypos:int = -1) : Boolean
      {
         var skilldata:XMLSkill = null;
         var skilllevel:int = 0;
         if(this.canUseSkill(skillid))
         {
            skilldata = this.skillDataCache[skillid];
            if(skilldata == null)
            {
               skilldata = QuestEngine.getSkillData(skillid);
               this.skillDataCache[skillid] = skilldata;
            }
            skilllevel = this.getSkillLevel(skillid);
            if(SkillManager.getInstance().startSkill(skillid,skilllevel,this,null,skilldata,xpos,ypos))
            {
               this.cooldownArray[skillid] = skilldata.getCooldown(skilllevel);
               return true;
            }
         }
         return false;
      }
      
      override public function gotNetworkDamage(newhp:int, launchTypeStr:String) : *
      {
         var launchType:int = 0;
         var flyVelX:int = 0;
         var flyVelY:int = 0;
         var chiDamage:int = 0;
         var strArray:Array = null;
         if(getMCS() == null)
         {
            trace("EnemyPlayer.gotNetworkDamage:getMCS()==null");
            return;
         }
         if(newhp <= 0 && GameEngine.isPvPRoomMode())
         {
            dontGiveLoot = true;
         }
         if(!GameEngine.isBattleMode() || StageManager.isRedFreeze())
         {
            if(!dead && newhp <= 0 && StageManager.isRedFreezeWaiting())
            {
               BattleUI.instance.setDraw();
               startAnim(DEATH_FORWARD);
            }
            return;
         }
         var launchPosX:int = -1;
         if(launchTypeStr == "")
         {
            launchType = Damage.LAUNCH_NONE;
         }
         else
         {
            strArray = launchTypeStr.split(",");
            launchType = int(strArray[0]);
            if(launchType == Damage.LAUNCH_AIR || launchType == Damage.LAUNCH_KNOCKDOWN)
            {
               flyVelX = int(strArray[1]);
               if(strArray.length >= 3)
               {
                  launchPosX = int(strArray[2]);
               }
            }
            else if(launchType == Damage.LAUNCH_FLY || launchType == Damage.LAUNCH_FLYAWAY || launchType == Damage.STUN || launchType == Damage.DEATHTOUCH)
            {
               flyVelX = int(strArray[1]);
               flyVelY = int(strArray[2]);
               if(strArray.length >= 4)
               {
                  launchPosX = int(strArray[3]);
               }
            }
            else if(launchType == Damage.KNEEGROIN)
            {
               flyVelX = int(strArray[1]);
               flyVelY = int(strArray[2]);
               chiDamage = int(strArray[3]);
            }
            else if(launchType == Damage.BACKTHROW)
            {
               flyVelX = int(strArray[1]);
               flyVelY = int(strArray[2]);
            }
         }
         var damage:int = getHP() - newhp;
         setHP(newhp);
         stunCounter = 0;
         getMCS().updateHealthBar(getHP() / maxhp);
         SoundManager.instance.playHit();
         if(damage > 0)
         {
            cancelStealth();
         }
         if(chargingFx != null)
         {
            if(damage > 0 || launchType != Damage.LAUNCH_NONE)
            {
               if(!(actionState == SKILL_CHICHARGE_STATE && launchType == Damage.LAUNCH_NONE))
               {
                  chargingFx.removeProjectile();
                  chargingFx = null;
               }
            }
         }
         if(getHP() <= 0)
         {
            if(GameEngine.isPlayBack())
            {
               InputManager.clearCanvas();
               StageManager.redFreeze();
            }
            else
            {
               die();
               NPCManager.externalRedFreezeCheck();
            }
         }
         else
         {
            if(launchPosX != -1)
            {
               setPosition(launchPosX,getMCS().y);
            }
            if((launchType == Damage.LAUNCH_AIR || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !isDowned())
            {
               if(flyVelX == 1)
               {
                  getMCS().faceRight();
               }
               else
               {
                  getMCS().faceLeft();
               }
               gotLaunched();
               launchType = Damage.LAUNCH_AIR;
            }
            else if(launchType == Damage.LAUNCH_KNOCKDOWN)
            {
               if(flyVelX == 1)
               {
                  getMCS().faceRight();
               }
               else
               {
                  getMCS().faceLeft();
               }
               gotKnockDown();
            }
            else if(launchType == Damage.LAUNCH_FLY)
            {
               gotFly(flyVelX,flyVelY);
            }
            else if(launchType == Damage.LAUNCH_FLYAWAY)
            {
               gotFlyAway(flyVelX,flyVelY);
            }
            else if(launchType == Damage.KNEEGROIN)
            {
               gotKneeGroin(flyVelX,flyVelY,chiDamage);
            }
            else if(launchType == Damage.BACKTHROW)
            {
               gotBackThrow(flyVelX,flyVelY);
            }
            else if(launchType == Damage.STUN)
            {
               gotStun(flyVelX,flyVelY);
            }
            else if(launchType == Damage.SUBSTITUTIONLOG)
            {
               doSubstitutionLog();
            }
            else if(!isDowned())
            {
               doFlinch();
            }
            if(launchType == Damage.DEATHTOUCH)
            {
               this.gotDeathTouch(flyVelX,flyVelY);
            }
            if(damage > 0)
            {
               ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,damage.toString(),0);
            }
         }
      }
      
      override internal function deathAnimEnd() : *
      {
         if(bloodEmitter != null)
         {
            bloodEmitter.destroy();
         }
         if(bloodEmitter2 != null)
         {
            bloodEmitter2.destroy();
         }
         if(StageManager.isRedFreeze())
         {
            return;
         }
         --ttl;
         if(ttl < 12)
         {
            mcs.alpha = ttl / 12;
         }
         if(ttl <= 0)
         {
            mcs.visible = false;
            if(!(controlledBy == 2 && GameEngine.isPvPRoomMode()))
            {
               mcs.disposeMCS();
               mcs = null;
            }
         }
      }
      
      override internal function gotDeathTouch(flyVelX:int, flyVelY:int) : *
      {
         var damage:int = 500;
         gotHitCounter = 0;
         gotHit(getMCS(),new Damage(damage,0,0));
         if(flyVelX != 0)
         {
            gotFly(flyVelX,flyVelY);
         }
         setChi(0);
      }
   }
}

