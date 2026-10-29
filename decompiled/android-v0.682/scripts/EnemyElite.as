package
{
   public class EnemyElite extends EnemyPlayer
   {
      
      public function EnemyElite(mcs:MCSCharacter = null)
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
         this.isDuelist = false;
         this.isBoss = true;
      }
      
      override public function setLevel(lvl:int) : *
      {
         var factor:Number = NaN;
         mcs.setDisplayName(charname + " (" + lvl + ")",16777215);
         factor = lvl / level;
         level = lvl;
         minDamage = damage * factor;
         defense *= factor;
         maxhp *= factor;
         setHP(maxhp);
         updateHealthBar();
         xp = lvl * 5 + 45;
         var playerHP:int = StatsManager.getPlayerStats(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
         var playerDEF:int = StatsManager.getPlayerStats(StatsManager.STAT_DEFENSE) + StatsManager.findBonusStat(StatsManager.STAT_DEFENSE);
         var playerATK:int = StatsManager.getMinDamage() + StatsManager.getDamageRange() / 2;
         var playerLVL:int = StatsManager.getLevel();
         var lvldiff:int = lvl - playerLVL;
         var hitsToKillBoss:int = 10 + lvldiff;
         var hitsToKillPlayer:int = 18 - lvldiff;
         if(hitsToKillBoss <= 3)
         {
            hitsToKillBoss = 3;
         }
         if(hitsToKillPlayer <= 0)
         {
            hitsToKillPlayer = 1;
         }
         var playerhit:int = playerATK - defense;
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
         var bossHP:int = playerhit * hitsToKillBoss;
         if(bossHP > maxhp)
         {
            maxhp = bossHP;
            setHP(maxhp);
            updateHealthBar();
         }
         var bosshit:int = playerHP / hitsToKillPlayer;
         var bossATK:int = bosshit + playerDEF;
         if(bossATK > minDamage)
         {
            minDamage = bossATK;
         }
         if(lvl <= 5)
         {
            minDamage = 1;
            defense = 1;
         }
      }
      
      override public function init(xml:XMLNpc) : *
      {
         var balancedMastery:int = 0;
         var skilldata:XMLSkill = null;
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
         balancedMastery = xml.getMastery(1001);
         var heavyMastery:int = xml.getMastery(1002);
         initPlayer(xml.controlledBy,xml.currenthp,xml.hp,xml.currentchi,xml.chi,xml.defense,baseReload,xml.minDamage,xml.damageRange,baseSlashLength,xml.slashUsage,lightMastery,balancedMastery,heavyMastery,xml.lvl);
         initAttackStats(xml.attack,xml.STAT_FIREATK,xml.STAT_WINDATK,xml.STAT_WATERATK,xml.STAT_EARTHATK);
         initElementDefenseStats(xml.STAT_FIREDEF,xml.STAT_WINDDEF,xml.STAT_WATERDEF,xml.STAT_EARTHDEF);
         if(controlledBy == 1)
         {
            setHP(xml.hp);
         }
         nid = xml.nid;
         mcs.setDisplayName(xml.name + " (" + level + ")",16777215);
         charname = xml.name;
         if(controlledBy == 1)
         {
            if(isBoss && level > 70)
            {
               minDamage *= 1.4;
               maxhp *= 1.4;
               setHP(maxhp);
            }
            else if(isBoss && level > 50)
            {
               minDamage *= 1.3;
               maxhp *= 1.3;
               setHP(maxhp);
            }
            else if(level > 30)
            {
               minDamage *= 1.2;
               maxhp *= 1.2;
               setHP(maxhp);
            }
            else if(level < 10)
            {
               minDamage *= 0.8;
               maxhp *= 0.8;
               setHP(maxhp);
            }
         }
         mcs.setSpeechText("");
         reward = new XMLReward(xml.reward);
         mcs.showHealthBar();
         updateHealthBar();
         this.setLevel(xml.lvl);
         canSeeSlash = true;
         skillList = xml.skillList;
         var max:int = int(skillList.length);
         cooldownArray = new Array();
         for(var i:int = 0; i < max; i++)
         {
            skilldata = QuestEngine.getSkillData(skillList[i].getId());
            if(skilldata != null)
            {
               cooldownArray[skillList[i].getId()] = skilldata.getCooldown(skillList[i].getValue());
            }
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
      
      override public function die() : *
      {
         if(!hasSkill(SkillManager.SKILL_UNDYING))
         {
            super.die();
         }
         else
         {
            startAction(SKILL_UNDYING_STATE);
         }
      }
   }
}

