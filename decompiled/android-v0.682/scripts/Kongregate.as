package
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   public class Kongregate
   {
      
      public static var instance:Kongregate;
      
      public static var loaded:Boolean = false;
      
      public var kongregate:*;
      
      public function Kongregate()
      {
         super();
         instance = this;
         var paramObj:Object = GameEngine.getLoaderInfo(StatsManager.mainTimeLine).parameters;
         var apiPath:String = paramObj.kongregate_api_path || "http://www.kongregate.com/flash/API_AS3_Local.swf";
         Security.allowDomain(apiPath);
         var request:URLRequest = new URLRequest(apiPath);
         var loader:Loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadComplete);
         loader.load(request);
         StatsManager.mainTimeLine.addChild(loader);
      }
      
      internal function loadComplete(event:Event) : void
      {
         this.kongregate = event.target.content;
         this.kongregate.services.connect();
         loaded = true;
         this.login();
      }
      
      public function login() : *
      {
         var user_id:Number = NaN;
         var authtoken:String = null;
         if(!loaded)
         {
            return;
         }
         if(StatsManager.consoleEnabled)
         {
            TitleUI.instance.loadingScreenOn();
            QueryManagerPIO.instance.loginKongregate(156909,"022a6f1a00d83f7a3647615f6f81290d61634163f0b03614b0f8b008ef63f2b0");
            return;
         }
         if(this.kongregate.services.isGuest())
         {
            this.kongregate.services.showRegistrationBox();
         }
         else
         {
            TitleUI.instance.loadingScreenOn();
            user_id = Number(this.kongregate.services.getUserId());
            authtoken = this.kongregate.services.getGameAuthToken();
            QueryManagerPIO.instance.loginKongregate(user_id,authtoken);
         }
      }
      
      public function buyGold(num:int, callback:Function) : *
      {
         var item:String = "coins" + num;
         this.kongregate.mtx.purchaseItems([item],callback);
      }
      
      public function getKreds(param:String = "") : *
      {
         this.kongregate.mtx.showKredPurchaseDialog(param);
      }
      
      public function reportAchievementStat(id:int, val:int, doSet:Boolean = false) : *
      {
         var statName:String = "";
         if(id == 60001)
         {
            statName = "Online Duels Won";
         }
         else if(id == 60001)
         {
            statName = "War Room Rank";
         }
         else if(id == 60002)
         {
            statName = "Potatoes Harvested";
         }
         else if(id == 60003)
         {
            statName = "Ores Mined";
         }
         else if(id == 60004)
         {
            statName = "Broke a sword";
         }
         else if(id == 60005)
         {
            statName = "Swords repaired";
         }
         else if(id == 60006)
         {
            statName = "Coins spent";
         }
         else if(id == 60007)
         {
            statName = "Objects Searched";
         }
         else if(id == 60008)
         {
            statName = "";
         }
         else if(id == 60009)
         {
            statName = "Coins Given";
         }
         else if(id == 60010)
         {
            statName = "Villager Quests Completed";
         }
         else if(id == 60011)
         {
            statName = "Bounty Quests Completed";
         }
         else if(id == 60012)
         {
            statName = "Mushrooms Picked";
         }
         else if(id == 60013)
         {
            statName = "Flowers Picked";
         }
         else if(id == 60014)
         {
            statName = "Herbs Picked";
         }
         else if(id == 60015)
         {
            statName = "Super Bonus Prizes Collected";
         }
         else if(id == 60016)
         {
            statName = "Beheadings";
         }
         else if(id == 60017)
         {
            statName = "Enemies Killed";
         }
         else if(id == 60018)
         {
            statName = "War Room Kill Record";
         }
         else if(id == 60019)
         {
            statName = "Red Oni Killed";
         }
         else if(id == 60020)
         {
            statName = "Swords Forged";
         }
         else if(id == 60021)
         {
            statName = "Daily Trap Challenges Completed";
         }
         else if(id == 60022)
         {
            statName = "";
         }
         else if(id == 60023)
         {
            statName = "";
         }
         else if(id == 60024)
         {
            statName = "Profit made at the Market";
         }
         else if(id == 60025)
         {
            statName = "Completed Season 1";
         }
         if(statName != "")
         {
            this.kongregate.stats.submit(statName,val);
         }
      }
   }
}

