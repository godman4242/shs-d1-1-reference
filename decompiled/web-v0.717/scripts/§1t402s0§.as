package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3316")]
   public class §1t402s0§ extends MovieClip
   {
      
      public static var instance:§1t402s0§;
      
      public var canvas:§1t5016s0§;
      
      public var eastlabel:TextField;
      
      public var minimapPlayer:MovieClip;
      
      public var northlabel:TextField;
      
      public var §1t6337s0§:TextField;
      
      public var southlabel:TextField;
      
      public var westlabel:TextField;
      
      internal var minimapRoomList:Array = new Array();
      
      internal var isNSOrientation:Boolean;
      
      internal var roomWidth:int;
      
      internal var mcWidth:int;
      
      public function §1t402s0§()
      {
         super();
         instance = this;
         §1t1521s0§.§1t9290s0§(this.northlabel,true);
         §1t1521s0§.§1t9290s0§(this.southlabel,true);
         §1t1521s0§.§1t9290s0§(this.eastlabel,true);
         §1t1521s0§.§1t9290s0§(this.westlabel,true);
         this.northlabel.text = §1t1521s0§.getString(398);
         this.southlabel.text = §1t1521s0§.getString(399);
         this.eastlabel.text = §1t1521s0§.getString(400);
         this.westlabel.text = §1t1521s0§.getString(401);
         this.§1t6337s0§.mouseEnabled = false;
         buttonMode = true;
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            this.minimapRoomList[_loc1_] = new §1t403s0§();
            this.minimapRoomList[_loc1_].visible = false;
            this.canvas.addChild(this.minimapRoomList[_loc1_]);
            _loc1_++;
         }
      }
      
      public static function §1t9190s0§() : §1t402s0§
      {
         if(instance == null)
         {
            new §1t402s0§();
         }
         return instance;
      }
      
      public static function §1t1768s0§(param1:Array, param2:int) : Boolean
      {
         if(param2 == -2)
         {
            return true;
         }
         if(param2 == -3)
         {
            return false;
         }
         var _loc3_:int = param1[§1t70s0§.§1t9128s0§] + param1[§1t70s0§.§1t9129s0§];
         var _loc4_:int = param1[§1t70s0§.§1t9130s0§] + param1[§1t70s0§.§1t9131s0§];
         if(_loc3_ == 2 && _loc4_ != 2)
         {
            return true;
         }
         if(_loc4_ == 0 && _loc3_ == 1)
         {
            return true;
         }
         if(_loc3_ == 1 && _loc4_ == 1)
         {
            return param2 == §1t70s0§.§1t9128s0§ || param2 == §1t70s0§.§1t9129s0§;
         }
         return false;
      }
      
      public function §1t6343s0§(param1:int, param2:int, param3:Array) : *
      {
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:§1t134s0§ = null;
         var _loc10_:XMLList = null;
         var _loc14_:§1t403s0§ = null;
         var _loc4_:Point = §1t70s0§.instance.§1t1133s0§(param1);
         var _loc5_:Point = §1t70s0§.instance.§1t1135s0§(param1);
         if(param1 == §1t132s0§.§1t11336s0§)
         {
            this.§1t6337s0§.text = "";
         }
         else
         {
            this.§1t6337s0§.text = §1t1521s0§.getString(557) + "(" + (_loc4_.x - 341 + §1t7934s0§.§1t12538s0§) + "," + (_loc4_.y - 341 + §1t7934s0§.§1t12539s0§) + ")\n" + §1t1521s0§.getString(11515) + " " + §1t1521s0§.getString(319) + "(" + _loc5_.x + "," + _loc5_.y + ")";
         }
         var _loc11_:§1t70s0§ = §1t70s0§.§1t9190s0§();
         var _loc12_:Array = this.§1t6346s0§(param3[param2].getObjectList(),true);
         var _loc13_:int = 0;
         while(_loc13_ < 5)
         {
            if(_loc13_ == 4)
            {
               _loc6_ = param2;
            }
            else
            {
               _loc6_ = int(_loc12_[_loc13_]);
            }
            _loc9_ = param3[_loc6_];
            if(_loc9_ != null)
            {
               this.roomWidth = _loc9_.getWidth();
               _loc10_ = _loc9_.getObjectList();
               _loc7_ = this.§1t6346s0§(_loc10_,false);
               _loc8_ = _loc9_.getEnterFrom();
               this.isNSOrientation = §1t1768s0§(_loc7_,_loc8_);
               this.minimapRoomList[_loc13_].§1t6354s0§(this.roomWidth,this.isNSOrientation,_loc9_.getIcon(),_loc9_.roomid,§1t1525s0§.§1t9930s0§(_loc9_.roomid));
               this.minimapRoomList[_loc13_].initNodeExits(_loc7_);
               this.minimapRoomList[_loc13_].§1t6356s0§(_loc10_);
            }
            else
            {
               this.minimapRoomList[_loc13_].§1t6353s0§(true);
            }
            _loc13_++;
         }
         _loc14_ = this.minimapRoomList[4];
         _loc14_.x = 0;
         _loc14_.y = 0;
         _loc14_.visible = true;
         this.isNSOrientation = _loc14_.isNSOrientation;
         this.roomWidth = _loc14_.roomWidth;
         this.mcWidth = _loc14_.mcWidth;
         _loc13_ = 0;
         while(_loc13_ < 4)
         {
            _loc14_.§1t6358s0§(this.minimapRoomList[_loc13_],_loc13_);
            _loc13_++;
         }
         this.§1t6347s0§(§1t1523s0§.§1t9586s0§().§1t1555s0§(),§1t1523s0§.§1t9586s0§().§1t1559s0§().§1t6283s0§());
      }
      
      public function §1t6344s0§() : *
      {
         var _loc1_:§1t403s0§ = this.minimapRoomList[4];
         if(_loc1_ != null)
         {
            _loc1_.§1t5768s0§();
         }
      }
      
      public function §1t6345s0§() : *
      {
         var _loc1_:§1t403s0§ = this.minimapRoomList[4];
         if(_loc1_ != null)
         {
            _loc1_.§1t6355s0§();
         }
      }
      
      internal function §1t6346s0§(param1:XMLList, param2:Boolean) : Array
      {
         var _loc5_:Array = null;
         var _loc3_:Array = [0,0,0,0];
         var _loc4_:Array = [0,0,0,0];
         if(param1 == null)
         {
            return _loc3_;
         }
         var _loc6_:int = param1.length();
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            if(param1[_loc7_].id == 0 || param1[_loc7_].id == 22)
            {
               _loc5_ = String(param1[_loc7_].property).split(",");
               if(_loc5_.length >= 5)
               {
                  _loc3_[int(_loc5_[4])] = 1;
                  _loc4_[int(_loc5_[4])] = int(_loc5_[0]);
               }
            }
            _loc7_++;
         }
         if(!param2)
         {
            return _loc3_;
         }
         return _loc4_;
      }
      
      public function §1t6347s0§(param1:int, param2:Boolean) : *
      {
         if(this.isNSOrientation)
         {
            if(param2)
            {
               this.minimapPlayer.rotation = 0;
            }
            else
            {
               this.minimapPlayer.rotation = 180;
            }
            this.canvas.y = 77 + (param1 / this.roomWidth * this.mcWidth - this.mcWidth / 2);
            this.canvas.x = 77;
         }
         else
         {
            if(param2)
            {
               this.minimapPlayer.rotation = 90;
            }
            else
            {
               this.minimapPlayer.rotation = -90;
            }
            this.canvas.x = 77 - (param1 / this.roomWidth * this.mcWidth - this.mcWidth / 2);
            this.canvas.y = 77;
         }
      }
   }
}

