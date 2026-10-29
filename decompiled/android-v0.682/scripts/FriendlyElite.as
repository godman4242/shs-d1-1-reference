package
{
   public class FriendlyElite extends EnemyPlayer
   {
      
      public function FriendlyElite(mcs:MCSCharacter = null)
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
         var playerHP:int = 0;
         playerHP = StatsManager.getPlayerStats(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
         var playerDEF:int = StatsManager.getPlayerStats(StatsManager.STAT_DEFENSE) + StatsManager.findBonusStat(StatsManager.STAT_DEFENSE);
         var playerATK:int = StatsManager.getMinDamage() + StatsManager.getDamageRange() / 2;
         minDamage = playerATK * 0.75;
         defense = playerDEF * 0.75;
         maxhp = playerHP * 0.75;
         setHP(maxhp);
         updateHealthBar();
         xp = 0;
         level = lvl;
      }
      
      override public function init(xml:XMLNpc) : *
      {
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
         mcs.setDisplayName(xml.name,16763904);
         charname = xml.name;
         mcs.setSpeechText("");
         reward = new XMLReward(xml.reward);
         mcs.showHealthBar();
         updateHealthBar();
         this.setLevel(StatsManager.getLevel());
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
   }
}

