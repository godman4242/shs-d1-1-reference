package
{
   import flash.net.URLVariables;
   import playerio.§1t23s0§;
   
   public class §1t398s0§
   {
      
      internal var charname:String;
      
      internal var level:int;
      
      internal var equipment:String = §1t76s0§.§1t9212s0§;
      
      internal var loaded:Boolean;
      
      internal var username:String;
      
      public var wins:int = 0;
      
      internal var side:int;
      
      internal var bounty:int;
      
      internal var dan:int;
      
      internal var notFound:Boolean = false;
      
      internal var serverTime:int = 0;
      
      internal var online:Boolean = false;
      
      internal var prevName:String = "";
      
      internal var facebookID:String;
      
      internal var isFacebook:Boolean = false;
      
      public function §1t398s0§(param1:String)
      {
         super();
         this.charname = param1;
         this.loaded = false;
      }
      
      public function isLoaded() : Boolean
      {
         return this.loaded && (this.serverTime == 0 || §1t3317s0§.instance.§1t1847s0§() - this.serverTime < 300);
      }
      
      public function initData(param1:URLVariables, param2:int) : *
      {
         this.serverTime = param2;
         this.charname = param1.charname;
         this.level = int(param1.lvl);
         this.equipment = param1.eq;
         this.username = param1.username;
         this.bounty = param1.bounty;
         this.side = param1.side;
         this.dan = param1.dan;
         this.loaded = true;
         if(this.charname == §1t1523s0§.charname)
         {
            this.wins = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§);
         }
         else
         {
            this.wins = param1.wins;
         }
      }
      
      public function initDataPIO(param1:§1t23s0§, param2:int) : *
      {
         this.serverTime = param2;
         this.charname = param1.key;
         this.level = param1.playerlevel;
         this.equipment = param1.equipment;
         if(!this.isFacebook)
         {
            this.username = param1.key;
         }
         if(this.charname == §1t1523s0§.charname)
         {
            this.wins = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§);
         }
         else if(param1.wins != null)
         {
            this.wins = param1.wins;
         }
         else
         {
            this.wins = 0;
         }
         this.bounty = 0;
         if(param1.bounty != null)
         {
            this.bounty = param1.bounty;
         }
         this.side = param1.side;
         this.dan = param1.playeredan;
         if(param1.mod)
         {
            this.online = false;
         }
         else
         {
            this.online = param1.online;
         }
         if(param1.prevname != null)
         {
            this.prevName = param1.prevname;
         }
         if(param1.newname != null)
         {
            this.charname = param1.newname;
            §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9685s0§);
         }
         this.loaded = true;
      }
      
      public function setFacebook(param1:String, param2:String, param3:int, param4:String = "") : *
      {
         this.facebookID = param1;
         this.username = param2;
         this.wins = param3;
         this.isFacebook = true;
         if(param4 != "")
         {
            this.charname = param4;
         }
      }
      
      public function setFriend(param1:String, param2:int) : *
      {
         this.charname = param1;
         this.wins = param2;
         this.isFacebook = false;
      }
      
      public function setNotFound() : *
      {
         this.notFound = true;
         this.wins = 0;
         this.username = "Retired";
      }
   }
}

