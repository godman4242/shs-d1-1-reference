package
{
   public class §1t49s0§
   {
      
      public static var instance:§1t49s0§;
      
      public var username:String;
      
      public function §1t49s0§()
      {
         super();
         instance = this;
      }
      
      public function login() : *
      {
         var _loc1_:Object = §1t1540s0§.§1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         this.username = _loc1_.usertoken_gamerName;
         §1t7017s0§.instance.§1t7039s0§();
         §1t3318s0§.instance.§1t3349s0§(_loc1_.querystring_usertoken);
      }
      
      public function §1t1684s0§(param1:int, param2:int, param3:Boolean = false) : *
      {
         var _loc4_:String = "";
         if(param1 == 60001)
         {
            _loc4_ = "Online Duels Won";
         }
         else if(param1 == 60001)
         {
            _loc4_ = "War Room Rank";
         }
         else if(param1 == 60002)
         {
            _loc4_ = "Potatoes Harvested";
         }
         else if(param1 == 60003)
         {
            _loc4_ = "Ores Mined";
         }
         else if(param1 == 60004)
         {
            _loc4_ = "Broke a sword";
         }
         else if(param1 == 60005)
         {
            _loc4_ = "Swords repaired";
         }
         else if(param1 == 60006)
         {
            _loc4_ = "Coins spent";
         }
         else if(param1 == 60007)
         {
            _loc4_ = "Objects Searched";
         }
         else if(param1 == 60008)
         {
            _loc4_ = "";
         }
         else if(param1 == 60009)
         {
            _loc4_ = "Coins Given";
         }
         else if(param1 == 60010)
         {
            _loc4_ = "Villager Quests Completed";
         }
         else if(param1 == 60011)
         {
            _loc4_ = "Bounty Quests Completed";
         }
         else if(param1 == 60012)
         {
            _loc4_ = "Mushrooms Picked";
         }
         else if(param1 == 60013)
         {
            _loc4_ = "Flowers Picked";
         }
         else if(param1 == 60014)
         {
            _loc4_ = "Herbs Picked";
         }
         else if(param1 == 60015)
         {
            _loc4_ = "Super Bonus Prizes Collected";
         }
         else if(param1 == 60016)
         {
            _loc4_ = "Beheadings";
         }
         else if(param1 == 60017)
         {
            _loc4_ = "Enemies Killed";
         }
         else if(param1 == 60018)
         {
            _loc4_ = "War Room Kill Record";
         }
         else if(param1 == 60019)
         {
            _loc4_ = "Red Oni Killed";
         }
         else if(param1 == 60020)
         {
            _loc4_ = "Swords Forged";
         }
         else if(param1 == 60021)
         {
            _loc4_ = "Daily Trap Challenges Completed";
         }
         else if(param1 == 60022)
         {
            _loc4_ = "";
         }
         else if(param1 == 60023)
         {
            _loc4_ = "";
         }
         else if(param1 == 60024)
         {
            _loc4_ = "Profit made at the Market";
         }
         else if(param1 == 60025)
         {
            _loc4_ = "Completed Season 1";
         }
      }
   }
}

