package
{
   public class §1t72s0§
   {
      
      public static var §1t9191s0§:int = 0;
      
      public static var §1t9192s0§:int = 1;
      
      public static var §1t9193s0§:int = 2;
      
      public static var §1t9194s0§:int = 3;
      
      public static var §1t9195s0§:int = 4;
      
      internal var id:int;
      
      internal var x:int;
      
      internal var y:int;
      
      internal var _name:int = -1;
      
      internal var §1t1168s0§:String = "";
      
      internal var §1t1169s0§:int = -1;
      
      internal var level:int = 0;
      
      internal var condition:XMLList = null;
      
      internal var searchList:XMLList = null;
      
      internal var roomsXML:XMLList = null;
      
      internal var shopXML:XMLList = null;
      
      internal var §1t1173s0§:§1t73s0§ = null;
      
      internal var roomsData:Array;
      
      internal var §1t1175s0§:Boolean = true;
      
      internal var isCached:Boolean = false;
      
      internal var overwrite:int = §1t9192s0§;
      
      internal var type:int = -1;
      
      internal var theme:int = -1;
      
      public var §1t1179s0§:Vector.<int>;
      
      public var map:int;
      
      public var §1t1181s0§:int;
      
      public function §1t72s0§(param1:XML)
      {
         super();
         this.id = param1.id;
         this.x = param1.x;
         this.y = param1.y;
         if(param1.name.toString() != "")
         {
            this._name = param1.name;
         }
         else
         {
            this._name = -1;
         }
         if(param1.failtext.toString() != "")
         {
            this.§1t1169s0§ = param1.failtext;
         }
         if(param1.lvl.toString() != "")
         {
            this.level = param1.lvl;
         }
         if(param1.overwrite.toString() != "")
         {
            this.overwrite = param1.overwrite;
         }
         if(param1.type.toString() != "")
         {
            this.§1t1181s0§ = param1.type;
         }
         if(param1.theme.toString() != "")
         {
            this.theme = param1.theme;
         }
         if(param1.condition.toString() != "")
         {
            this.condition = XMLList(param1.condition).copy();
         }
         if(param1.search.toString() != "")
         {
            this.searchList = XMLList(param1.search).copy();
         }
         if(param1.shop.toString() != "")
         {
            this.shopXML = XMLList(param1.shop).copy();
         }
         if(param1.roomdata.room.toString() != "")
         {
            this.roomsXML = XMLList(param1.roomdata.room).copy();
         }
      }
      
      public function §1t1153s0§() : String
      {
         if(this._name == -1)
         {
            if(this.§1t1168s0§ == "")
            {
               this.§1t1168s0§ = §1t70s0§.§1t9190s0§().§1t1153s0§(this.id);
            }
            return this.§1t1168s0§;
         }
         return §1t1521s0§.getString(this._name);
      }
      
      public function §1t1182s0§(param1:String) : *
      {
         this._name = -1;
         this.§1t1168s0§ = param1;
      }
      
      public function §1t1183s0§() : §1t73s0§
      {
         if(this.shopXML != null)
         {
            this.§1t1173s0§ = new §1t73s0§(this.shopXML);
            this.shopXML = null;
         }
         return this.§1t1173s0§;
      }
      
      public function §1t1184s0§() : Boolean
      {
         if(this.roomsXML != null)
         {
            return this.roomsXML.length() > 0;
         }
         return this.roomsData.length > 0;
      }
      
      internal function §1t1185s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.roomsXML != null)
         {
            _loc1_ = this.roomsXML.length();
            this.roomsData = new Array();
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.roomsData[this.roomsXML[_loc2_].id] = new §1t134s0§(this.roomsXML[_loc2_]);
               _loc2_++;
            }
            this.roomsXML = null;
         }
      }
      
      public function §1t1186s0§(param1:Boolean = true) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         if(this.§1t1175s0§ || this.overwrite == §1t9191s0§)
         {
            return §1t70s0§.§1t9190s0§().§1t1148s0§(this.id,param1);
         }
         this.§1t1185s0§();
         if(this.overwrite == §1t9193s0§)
         {
            _loc2_ = §1t70s0§.instance.§1t1148s0§(this.id,param1,this.§1t1181s0§,this.theme,this.overwrite);
            _loc3_ = 0;
            if(this.roomsData != null)
            {
               _loc3_ = int(this.roomsData.length);
            }
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(this.roomsData[_loc4_] != null)
               {
                  _loc2_[_loc4_] = this.roomsData[_loc4_];
               }
               _loc4_++;
            }
            return _loc2_;
         }
         if(this.overwrite == §1t9195s0§ || this.overwrite == §1t9194s0§)
         {
            if(this.id == §1t132s0§.§1t11336s0§)
            {
               _loc2_ = §1t132s0§.instance.§1t1148s0§();
               this.§1t1168s0§ = _loc2_[1].§1t1382s0§();
               if(_loc2_ != null)
               {
                  this.§1t1168s0§ = _loc2_[1].§1t1382s0§();
               }
               else
               {
                  _loc2_ = §1t70s0§.instance.§1t1148s0§(this.id,param1,this.§1t1181s0§,this.theme,this.overwrite);
               }
            }
            else
            {
               _loc2_ = §1t70s0§.instance.§1t1148s0§(this.id,param1,this.§1t1181s0§,this.theme,this.overwrite);
            }
            _loc3_ = 0;
            if(this.roomsData != null)
            {
               _loc3_ = int(this.roomsData.length);
            }
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(this.roomsData[_loc4_] != null)
               {
                  _loc2_[_loc4_] = this.roomsData[_loc4_];
               }
               _loc4_++;
            }
            _loc5_ = §1t70s0§.instance.§1t1148s0§(this.id,false);
            _loc2_[0] = _loc5_[0];
            return _loc2_;
         }
         return this.roomsData;
      }
      
      public function §1t1156s0§() : Array
      {
         var _loc4_:Array = null;
         this.§1t1185s0§();
         var _loc1_:Array = [0,0,0,0];
         var _loc2_:XMLList = this.roomsData[0].getObjectList();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length())
         {
            if(_loc2_[_loc3_].id == 0)
            {
               _loc4_ = _loc2_[_loc3_].property.split(",");
               if(_loc4_.length >= 5)
               {
                  _loc1_[_loc4_[4]] = 1;
               }
            }
            _loc3_++;
         }
         return _loc1_;
      }
   }
}

