package
{
   public class XMLWorldNode
   {
      
      public static var OVERWRITE_NONE:int = 0;
      
      public static var OVERWRITE_FULL:int = 1;
      
      public static var OVERWRITE_PARTIAL:int = 2;
      
      public static var OVERWRITE_PARTIAL_KEEP0:int = 3;
      
      public static var OVERWRITE_CLANMISSIONLOCATION:int = 4;
      
      internal var id:int;
      
      internal var x:int;
      
      internal var y:int;
      
      internal var name:String = "";
      
      internal var condition:XMLList = null;
      
      internal var failtext:String = "";
      
      internal var level:int = 0;
      
      internal var searchList:XMLList = null;
      
      internal var shopXML:XMLList = null;
      
      internal var shopData:XMLShopData = null;
      
      internal var roomsXML:XMLList = null;
      
      internal var roomsData:Array;
      
      internal var isGenerated:Boolean = true;
      
      internal var isCached:Boolean = false;
      
      internal var overwrite:int = OVERWRITE_FULL;
      
      internal var type:int = -1;
      
      internal var theme:int = -1;
      
      public var connectsList:Vector.<int>;
      
      public var map:int;
      
      public var locationType:int;
      
      public function XMLWorldNode(xml:XML)
      {
         super();
         this.id = xml.id;
         this.x = xml.x;
         this.y = xml.y;
         if(xml.name.toString() != "")
         {
            this.name = LangManager.getString(xml.name);
         }
         else
         {
            this.name = NodeGenerator.getInstance().getNodeName(this.id);
         }
         if(xml.condition.toString() != "")
         {
            this.condition = xml.condition;
         }
         if(xml.failtext.toString() != "")
         {
            this.failtext = LangManager.getString(int(xml.failtext));
         }
         if(xml.lvl.toString() != "")
         {
            this.level = xml.lvl;
         }
         if(xml.overwrite.toString() != "")
         {
            this.overwrite = xml.overwrite;
         }
         if(xml.type.toString() != "")
         {
            this.locationType = xml.type;
         }
         if(xml.theme.toString() != "")
         {
            this.theme = xml.theme;
         }
         if(xml.search.toString() != "")
         {
            this.searchList = xml.search;
         }
         if(xml.shop.toString() != "")
         {
            this.shopXML = xml.shop;
         }
         if(xml.roomdata.room.toString() != "")
         {
            this.roomsXML = xml.roomdata.room;
         }
      }
      
      public function getShopData() : XMLShopData
      {
         if(this.shopXML != null)
         {
            this.shopData = new XMLShopData(this.shopXML);
            this.shopXML = null;
         }
         return this.shopData;
      }
      
      public function hasRooms() : Boolean
      {
         if(this.roomsXML != null)
         {
            return this.roomsXML.length() > 0;
         }
         return this.roomsData.length > 0;
      }
      
      internal function parseRoomXML() : *
      {
         var max:int = 0;
         var i:int = 0;
         if(this.roomsXML != null)
         {
            max = this.roomsXML.length();
            this.roomsData = new Array();
            for(i = 0; i < max; i++)
            {
               this.roomsData[this.roomsXML[i].id] = new XMLRoomData(this.roomsXML[i]);
            }
            this.roomsXML = null;
         }
      }
      
      public function getRoomData(generateInnerRooms:Boolean = true) : Array
      {
         var generatedRoomData:Array = null;
         var max:int = 0;
         var j:int = 0;
         var room0:Array = null;
         if(this.isGenerated || this.overwrite == OVERWRITE_NONE)
         {
            return NodeGenerator.getInstance().generateRooms(this.id,generateInnerRooms);
         }
         this.parseRoomXML();
         if(this.overwrite == OVERWRITE_PARTIAL)
         {
            generatedRoomData = NodeGenerator.instance.generateRooms(this.id,generateInnerRooms,this.locationType,this.theme,this.overwrite);
            max = 0;
            if(this.roomsData != null)
            {
               max = int(this.roomsData.length);
            }
            for(j = 0; j < max; j++)
            {
               if(this.roomsData[j] != null)
               {
                  generatedRoomData[j] = this.roomsData[j];
               }
            }
            return generatedRoomData;
         }
         if(this.overwrite == OVERWRITE_CLANMISSIONLOCATION || this.overwrite == OVERWRITE_PARTIAL_KEEP0)
         {
            generatedRoomData = NodeGenerator.instance.generateRooms(this.id,generateInnerRooms,this.locationType,this.theme,this.overwrite);
            max = 0;
            if(this.roomsData != null)
            {
               max = int(this.roomsData.length);
            }
            for(j = 0; j < max; j++)
            {
               if(this.roomsData[j] != null)
               {
                  generatedRoomData[j] = this.roomsData[j];
               }
            }
            room0 = NodeGenerator.instance.generateRooms(this.id,false);
            generatedRoomData[0] = room0[0];
            return generatedRoomData;
         }
         return this.roomsData;
      }
      
      public function getNodeExits() : Array
      {
         var strArray:Array = null;
         this.parseRoomXML();
         var exitList:Array = [0,0,0,0];
         var list:XMLList = this.roomsData[0].getObjectList();
         for(var i:int = 0; i < list.length(); i++)
         {
            if(list[i].id == 0)
            {
               strArray = list[i].property.split(",");
               if(strArray.length >= 5)
               {
                  exitList[strArray[4]] = 1;
               }
            }
         }
         return exitList;
      }
   }
}

