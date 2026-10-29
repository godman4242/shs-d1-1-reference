package
{
   public class BattleReport
   {
      
      internal var date:int;
      
      internal var attacker:int;
      
      internal var injured:int;
      
      internal var killed:int;
      
      internal var duration:int;
      
      internal var prosperityLost:int;
      
      internal var attackersKilled:int = 0;
      
      public function BattleReport(date:int, attacker:int, injured:int, killed:int, prosperityLost:int = 0, duration:int = 1, attackersKilled:int = 0)
      {
         super();
         this.date = date;
         this.attacker = attacker;
         this.injured = injured;
         this.killed = killed;
         this.prosperityLost = prosperityLost;
         this.duration = duration;
         this.attackersKilled = attackersKilled;
      }
   }
}

