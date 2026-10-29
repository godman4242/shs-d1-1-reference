package
{
   public class FriendlySpearElite extends EnemySpearElite
   {
      
      public function FriendlySpearElite(mcs:MCSCharacter = null)
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
      }
      
      override public function setLevel(lvl:int) : *
      {
         var playerHP:int = 0;
         playerHP = StatsManager.getPlayerStats(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
         var playerDEF:int = StatsManager.getPlayerStats(StatsManager.STAT_DEFENSE) + StatsManager.findBonusStat(StatsManager.STAT_DEFENSE);
         var playerATK:int = StatsManager.getMinDamage() + StatsManager.getDamageRange() / 2;
         damage = playerATK * 0.75;
         defense = playerDEF * 0.75;
         maxhp = playerHP * 0.75;
         setHP(maxhp);
         updateHealthBar();
         xp = 0;
         level = lvl;
      }
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         reset();
         if(mcs.y == StageManager.getGroundY())
         {
            startAction(WALK_STATE);
         }
         else
         {
            startAction(FALL_STATE);
         }
         STAT_FIREATK = xml.STAT_FIREATK;
         STAT_WINDATK = xml.STAT_WINDATK;
         STAT_WATERATK = xml.STAT_WATERATK;
         STAT_EARTHATK = xml.STAT_EARTHATK;
         STAT_FIREDEF = xml.STAT_FIREDEF;
         STAT_WINDDEF = xml.STAT_WINDDEF;
         STAT_WATERDEF = xml.STAT_WATERDEF;
         STAT_EARTHDEF = xml.STAT_EARTHDEF;
         reward = new XMLReward(xml.reward);
         mcs.setDisplayName(xml.name,16763904);
         this.setLevel(StatsManager.getLevel());
      }
   }
}

