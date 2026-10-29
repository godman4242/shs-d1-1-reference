package
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   public class §1t1676s0§
   {
      
      public static var instance:§1t1676s0§;
      
      public static var loaded:Boolean = false;
      
      public static var §1t1834s0§:Boolean = false;
      
      public var §1t1677s0§:*;
      
      public function §1t1676s0§()
      {
         super();
         instance = this;
         var _loc1_:Object = §1t1540s0§.§1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         var _loc2_:String = _loc1_.querystring_kongregate_api_path || _loc1_.kongregate_api_path || "http://www.kongregate.com/flash/API_AS3_Local.swf";
         Security.allowDomain(_loc2_);
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:Loader = new Loader();
         _loc4_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§1t1678s0§);
         _loc4_.load(_loc3_);
         §1t1523s0§.§1t9365s0§.addChild(_loc4_);
      }
      
      internal function §1t1678s0§(param1:Event) : void
      {
         this.§1t1677s0§ = param1.target.content;
         this.§1t1677s0§.services.connect();
         loaded = true;
         if(§1t7017s0§.instance != null)
         {
            this.login();
         }
      }
      
      public function login() : *
      {
         var _loc1_:Number = NaN;
         var _loc2_:String = null;
         if(!loaded || §1t1834s0§)
         {
            return;
         }
         §1t1834s0§ = true;
         if(this.§1t1677s0§.services.isGuest())
         {
            this.§1t1677s0§.services.addEventListener("login",this.§1t1681s0§);
            §1t1834s0§ = false;
            this.§1t1677s0§.services.showRegistrationBox();
            §1t7017s0§.instance.§1t7030s0§();
         }
         else
         {
            §1t7017s0§.instance.§1t7039s0§();
            _loc1_ = Number(this.§1t1677s0§.services.getUserId());
            _loc2_ = this.§1t1677s0§.services.getGameAuthToken();
            §1t3318s0§.instance.§1t3347s0§(_loc1_,_loc2_);
            this.§1t1677s0§.stats.submit("loaded",1);
         }
      }
      
      public function §1t1680s0§() : *
      {
         this.§1t1677s0§.stats.submit("loaded",-1);
      }
      
      internal function §1t1681s0§(param1:Event) : *
      {
         this.login();
      }
      
      public function §1t1682s0§(param1:int, param2:Function) : *
      {
         var _loc3_:String = "coins" + param1;
         this.§1t1677s0§.mtx.purchaseItems([_loc3_],param2);
      }
      
      public function §1t1683s0§(param1:String = "") : *
      {
         this.§1t1677s0§.mtx.showKredPurchaseDialog(param1);
      }
      
      public function §1t1684s0§(param1:int, param2:int, param3:Boolean = false) : *
      {
         var _loc4_:String = "";
         if(param1 == 60000)
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
         if(_loc4_ != "")
         {
            this.§1t1677s0§.stats.submit(_loc4_,param2);
         }
      }
      
      internal function inviteFriend() : *
      {
         this.§1t1677s0§.services.showInvitationBox({
            "content":"I challenge you to a duel!",
            "filter":"not_played"
         });
      }
      
      internal function postToFeed(param1:String, param2:String = "") : *
      {
         if(param2 == "")
         {
            this.§1t1677s0§.services.showFeedPostBox(param1);
         }
         else
         {
            this.§1t1677s0§.services.showFeedPostBox({
               "content":param1,
               "image_uri":param2
            });
         }
      }
   }
}

