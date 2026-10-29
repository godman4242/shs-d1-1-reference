package
{
   import flash.net.URLVariables;
   import playerio.DatabaseObject;
   
   public class FriendItem
   {
      
      internal var id:String = "";
      
      internal var charname:String;
      
      internal var level:int;
      
      internal var equipment:String = XMLNpc.DEFAULT_EQSTRING;
      
      internal var loaded:Boolean;
      
      internal var username:String;
      
      public var wins:int = 0;
      
      internal var side:int;
      
      internal var bounty:int;
      
      internal var dan:int;
      
      internal var notFound:Boolean = false;
      
      internal var facebookID:String;
      
      internal var isFacebook:Boolean = false;
      
      public function FriendItem(id:String)
      {
         super();
         this.id = id;
         this.loaded = false;
      }
      
      public function isLoaded() : Boolean
      {
         return this.loaded;
      }
      
      public function initData(vars:URLVariables) : *
      {
         this.id = vars.id;
         this.charname = vars.charname;
         this.level = int(vars.lvl);
         this.equipment = vars.eq;
         this.username = vars.username;
         this.wins = vars.wins;
         this.bounty = vars.bounty;
         this.side = vars.side;
         this.dan = vars.dan;
         this.loaded = true;
      }
      
      public function initDataPIO(o:DatabaseObject) : *
      {
         this.id = o.key;
         this.charname = o.key;
         this.level = o.playerlevel;
         this.equipment = o.equipment;
         if(!this.isFacebook)
         {
            this.username = o.key;
         }
         this.wins = 0;
         if(o.wins != null)
         {
            this.wins = o.wins;
         }
         this.bounty = 0;
         if(o.bounty != null)
         {
            this.bounty = o.bounty;
         }
         this.side = o.side;
         this.dan = o.playeredan;
         this.loaded = true;
      }
      
      public function setFacebook(facebookID:String, username:String, wins:int, charname:String = "") : *
      {
         this.facebookID = facebookID;
         this.username = username;
         this.wins = wins;
         this.isFacebook = true;
         if(charname != "")
         {
            this.charname = charname;
         }
      }
      
      public function setFriend(id:String, wins:int) : *
      {
         this.id = id;
         this.wins = wins;
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

