package
{
   public class §1t134s0§
   {
      
      public static var §1t9227s0§:int = 0;
      
      public static var §1t9228s0§:int = 1;
      
      public static var §1t9229s0§:int = 2;
      
      public static var §1t9230s0§:int = 3;
      
      public static var §1t9231s0§:int = 8;
      
      public static var §1t9232s0§:int = 9;
      
      public static var §1t9233s0§:int = 10;
      
      public static var §1t9234s0§:int = 11;
      
      public static var §1t9235s0§:int = 12;
      
      public static var §1t9236s0§:int = 13;
      
      public static var §1t9237s0§:int = 14;
      
      internal var roomid:int;
      
      internal var bg:int = 0;
      
      internal var width:int = 1600;
      
      internal var §1t1370s0§:int = -1;
      
      internal var §1t1371s0§:String = "";
      
      internal var isPrivate:int = 0;
      
      internal var canExit:Boolean = false;
      
      internal var objectList:XMLList;
      
      internal var enterx:int = 150;
      
      internal var enterFrom:int = 0;
      
      internal var bgParam:int = 0;
      
      internal var bgParam2:int = 0;
      
      internal var roomIcon:int = 0;
      
      public function §1t134s0§(param1:XML)
      {
         super();
         if(param1 == null)
         {
            this.objectList = new XMLList();
            return;
         }
         if(param1.id.toString() != "")
         {
            this.roomid = param1.id;
         }
         if(param1.bg.toString() != "")
         {
            this.bg = param1.bg;
         }
         else
         {
            this.bg = 0;
         }
         if(param1.width.toString() != "" || int(param1.width) >= §1t1523s0§.stageWidth)
         {
            this.width = param1.width;
         }
         else
         {
            this.width = 1600;
         }
         if(param1.obj.toString() != "")
         {
            this.objectList = param1.obj;
         }
         if(param1.§private§.toString() != "")
         {
            this.isPrivate = param1.§private§;
         }
         else
         {
            this.isPrivate = 0;
         }
         if(param1.exit.toString() != "")
         {
            this.canExit = param1.exit == 1;
         }
         else
         {
            this.canExit = false;
         }
         if(param1.roomname.toString() != "")
         {
            this.§1t1370s0§ = param1.roomname;
         }
         else
         {
            this.§1t1370s0§ = -1;
         }
         if(param1.enterx.toString() != "")
         {
            this.enterx = param1.enterx;
         }
         else
         {
            this.enterx = 150;
         }
         if(param1.enterfrom.toString() != "")
         {
            this.enterFrom = param1.enterfrom;
         }
         else
         {
            this.enterFrom = 0;
         }
         if(param1.bgparam.toString() != "")
         {
            this.bgParam = param1.bgparam;
         }
         else
         {
            this.bgParam = 0;
         }
         if(param1.bgparam2.toString() != "")
         {
            this.bgParam2 = param1.bgparam2;
         }
         else
         {
            this.bgParam2 = 0;
         }
         if(param1.icon.toString() != "")
         {
            this.roomIcon = param1.icon;
         }
         else
         {
            this.roomIcon = 0;
         }
      }
      
      public function getBG() : int
      {
         return this.bg;
      }
      
      public function getWidth() : int
      {
         return this.width;
      }
      
      public function §1t1382s0§() : String
      {
         if(this.§1t1370s0§ == -1)
         {
            return this.§1t1371s0§;
         }
         return §1t1521s0§.getString(this.§1t1370s0§);
      }
      
      public function §1t1383s0§(param1:String) : *
      {
         this.§1t1370s0§ = -1;
         this.§1t1371s0§ = param1;
      }
      
      public function getObjectList() : XMLList
      {
         return this.objectList;
      }
      
      public function getEnterX() : int
      {
         return this.enterx;
      }
      
      public function getEnterFrom() : int
      {
         return this.enterFrom;
      }
      
      public function getBGParam() : int
      {
         return this.bgParam;
      }
      
      public function getBGParam2() : int
      {
         return this.bgParam2;
      }
      
      public function getIcon() : int
      {
         return this.roomIcon;
      }
      
      public function isPvPRoom() : Boolean
      {
         return this.isPrivate == §1t9232s0§ || this.isPrivate == §1t9233s0§ || this.isPrivate == §1t9234s0§ || this.isPrivate == §1t9236s0§ || this.isPrivate == §1t9237s0§;
      }
   }
}

