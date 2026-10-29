package
{
   public class XMLRoomData
   {
      
      public static var ROOMTYPE_DEFAULT:int = 0;
      
      public static var ROOMTYPE_DOJO:int = 3;
      
      public static var ROOMTYPE_HELL:int = 8;
      
      public static var ROOMTYPE_PVP:int = 9;
      
      public static var ROOMTYPE_PVPDOJO:int = 10;
      
      public static var ROOMTYPE_PVPCLAN:int = 11;
      
      internal var roomid:int;
      
      internal var bg:int = 0;
      
      internal var width:int = 1600;
      
      internal var roomName:String = "";
      
      internal var isPrivate:int = 0;
      
      internal var canExit:Boolean = false;
      
      internal var objectList:XMLList;
      
      internal var enterx:int = 150;
      
      internal var enterFrom:int = 0;
      
      internal var bgParam:int = 0;
      
      internal var bgParam2:int = 0;
      
      internal var roomIcon:int = 0;
      
      public function XMLRoomData(xml:XML)
      {
         super();
         if(xml == null)
         {
            this.objectList = new XMLList();
            return;
         }
         if(xml.id.toString() != "")
         {
            this.roomid = xml.id;
         }
         if(xml.bg.toString() != "")
         {
            this.bg = xml.bg;
         }
         else
         {
            this.bg = 0;
         }
         if(xml.width.toString() != "" || int(xml.width) >= StatsManager.stageWidth)
         {
            this.width = xml.width;
         }
         else
         {
            this.width = 1600;
         }
         if(xml.obj.toString() != "")
         {
            this.objectList = xml.obj;
         }
         if(xml.§private§.toString() != "")
         {
            this.isPrivate = xml.§private§;
         }
         else
         {
            this.isPrivate = 0;
         }
         if(xml.exit.toString() != "")
         {
            this.canExit = xml.exit == 1;
         }
         else
         {
            this.canExit = false;
         }
         if(xml.roomname.toString() != "")
         {
            this.roomName = LangManager.getString(int(xml.roomname));
         }
         else
         {
            this.roomName = "";
         }
         if(xml.enterx.toString() != "")
         {
            this.enterx = xml.enterx;
         }
         else
         {
            this.enterx = 150;
         }
         if(xml.enterfrom.toString() != "")
         {
            this.enterFrom = xml.enterfrom;
         }
         else
         {
            this.enterFrom = 0;
         }
         if(xml.bgparam.toString() != "")
         {
            this.bgParam = xml.bgparam;
         }
         else
         {
            this.bgParam = 0;
         }
         if(xml.bgparam2.toString() != "")
         {
            this.bgParam2 = xml.bgparam2;
         }
         else
         {
            this.bgParam2 = 0;
         }
         if(xml.icon.toString() != "")
         {
            this.roomIcon = xml.icon;
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
      
      public function getName() : String
      {
         return this.roomName;
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
         return this.isPrivate == ROOMTYPE_PVP || this.isPrivate == ROOMTYPE_PVPDOJO || this.isPrivate == ROOMTYPE_PVPCLAN;
      }
   }
}

