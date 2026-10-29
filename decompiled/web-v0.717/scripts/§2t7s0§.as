package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1415")]
   public class §2t7s0§ extends MovieClip
   {
      
      public static var instance:§2t7s0§;
      
      public var bg:MovieClip;
      
      public var canvas:§1t5016s0§;
      
      public var minimapPlayer:MovieClip;
      
      public var nodemark:§1t7000s0§;
      
      internal var minimapRoomList:Array;
      
      internal var isNSOrientation:Boolean;
      
      internal var mcWidth:int = 16;
      
      internal var roomWidth:int;
      
      internal var nodemarkxdiff:int;
      
      internal var nodemarkydiff:int;
      
      internal var nodeid:int;
      
      public function §2t7s0§()
      {
         var _loc2_:int = 0;
         this.minimapRoomList = new Array();
         super();
         instance = this;
         §1t1521s0§.§1t9290s0§(this.bg.northlabel,true);
         §1t1521s0§.§1t9290s0§(this.bg.southlabel,true);
         §1t1521s0§.§1t9290s0§(this.bg.eastlabel,true);
         §1t1521s0§.§1t9290s0§(this.bg.westlabel,true);
         this.bg.northlabel.text = §1t1521s0§.getString(398);
         this.bg.southlabel.text = §1t1521s0§.getString(399);
         this.bg.eastlabel.text = §1t1521s0§.getString(400);
         this.bg.westlabel.text = §1t1521s0§.getString(401);
         var _loc1_:int = 0;
         while(_loc1_ < 7)
         {
            this.minimapRoomList[_loc1_] = new Array(7);
            _loc2_ = 0;
            while(_loc2_ < 7)
            {
               this.minimapRoomList[_loc1_][_loc2_] = new §1t5257s0§();
               this.canvas.addChild(this.minimapRoomList[_loc1_][_loc2_]);
               this.minimapRoomList[_loc1_][_loc2_].x = _loc1_ * 20 - 77 + 17;
               this.minimapRoomList[_loc1_][_loc2_].y = _loc2_ * 20 - 77 + 17;
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public static function §1t9190s0§() : §2t7s0§
      {
         if(instance == null)
         {
            new §2t7s0§();
         }
         return instance;
      }
      
      public function §1t4235s0§() : *
      {
         this.setNodeId(this.nodeid);
      }
      
      public function setNodeId(param1:int) : *
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:XMLList = null;
         var _loc7_:§1t72s0§ = null;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Point = null;
         var _loc13_:Point = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Point = null;
         var _loc17_:Point = null;
         var _loc18_:Point = null;
         var _loc19_:Point = null;
         var _loc20_:int = 0;
         this.nodeid = param1;
         var _loc2_:Point = §1t70s0§.instance.§1t1133s0§(param1);
         var _loc3_:Point = §1t70s0§.instance.§1t1136s0§(param1);
         this.bg.§1t6337s0§.text = "sector (" + (_loc3_.x - 2047) + "," + (_loc3_.y - 2047) + ")\nterritory (" + (_loc2_.x - 341) + "," + (_loc2_.y - 341) + ")";
         var _loc8_:§1t70s0§ = §1t70s0§.§1t9190s0§();
         _loc9_ = §1t123s0§.instance.getMarkedNode();
         var _loc10_:int = 0;
         while(_loc10_ < 7)
         {
            _loc11_ = 0;
            while(_loc11_ < 7)
            {
               _loc4_ = _loc8_.§1t1161s0§(param1,_loc10_ - 3,_loc11_ - 3);
               if(_loc4_ == -1)
               {
                  this.minimapRoomList[_loc10_][_loc11_].visible = false;
               }
               else
               {
                  this.minimapRoomList[_loc10_][_loc11_].visible = true;
                  _loc7_ = §1t1524s0§.§1t9886s0§(_loc4_);
                  if(!_loc7_.§1t1175s0§)
                  {
                     _loc6_ = _loc7_.§1t1186s0§(false)[0].getObjectList();
                     _loc5_ = this.§1t6346s0§(_loc6_);
                  }
                  else
                  {
                     _loc5_ = _loc8_.§1t1156s0§(_loc4_);
                  }
                  this.minimapRoomList[_loc10_][_loc11_].initNodeExits(_loc5_);
                  this.minimapRoomList[_loc10_][_loc11_].initIcon(§1t70s0§.instance.§1t1149s0§(_loc4_));
                  if(_loc10_ == 3 && _loc11_ == 3)
                  {
                     this.isNSOrientation = _loc8_.§1t1157s0§(_loc5_);
                     if(!_loc7_.§1t1175s0§)
                     {
                        this.roomWidth = _loc7_.§1t1186s0§(false)[0].getWidth();
                     }
                     else
                     {
                        this.roomWidth = _loc8_.§1t1160s0§(_loc4_);
                     }
                  }
               }
               _loc11_++;
            }
            _loc10_++;
         }
         if(_loc9_ != -1)
         {
            _loc12_ = §1t70s0§.instance.§1t1136s0§(_loc9_);
            _loc13_ = §1t70s0§.instance.§1t1136s0§(param1);
            _loc14_ = _loc12_.x - _loc13_.x;
            _loc15_ = _loc12_.y - _loc13_.y;
            this.nodemarkxdiff = _loc14_ * 20;
            this.nodemarkydiff = _loc15_ * 20;
            this.nodemark.visible = true;
            _loc16_ = §1t70s0§.instance.§1t1133s0§(_loc9_);
            _loc17_ = §1t70s0§.instance.§1t1133s0§(param1);
            _loc18_ = §1t70s0§.instance.§1t1135s0§(param1);
            if(_loc16_ != _loc17_)
            {
               _loc20_ = _loc17_.x << 12 | _loc17_.y;
               if(_loc16_.x < _loc17_.x)
               {
                  _loc19_ = new Point(0,§1t71s0§.§1t9224s0§(_loc20_)[0]);
               }
               else if(_loc16_.x > _loc17_.x)
               {
                  _loc19_ = new Point(5,§1t71s0§.§1t9225s0§(_loc20_)[0]);
               }
               else if(_loc16_.y < _loc17_.y)
               {
                  _loc19_ = new Point(§1t71s0§.§1t9222s0§(_loc20_)[0],0);
               }
               else if(_loc16_.y > _loc17_.y)
               {
                  _loc19_ = new Point(§1t71s0§.§1t9223s0§(_loc20_)[0],5);
               }
            }
            else
            {
               _loc19_ = §1t70s0§.instance.§1t1135s0§(_loc9_);
            }
            this.drawPath(_loc18_,_loc19_);
         }
         else
         {
            this.nodemark.visible = false;
         }
         this.§1t6347s0§(§1t1523s0§.§1t9586s0§().§1t1555s0§(),§1t1523s0§.§1t9586s0§().§1t1559s0§().§1t6283s0§());
      }
      
      internal function drawPath(param1:Point, param2:Point) : *
      {
      }
      
      internal function §1t6346s0§(param1:XMLList) : Array
      {
         var _loc3_:Array = null;
         var _loc2_:Array = [0,0,0,0];
         if(param1 == null)
         {
            return _loc2_;
         }
         var _loc4_:int = param1.length();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(param1[_loc5_].id == 0)
            {
               _loc3_ = String(param1[_loc5_].property).split(",");
               if(_loc3_.length >= 5)
               {
                  _loc2_[int(_loc3_[4])] = 1;
               }
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function §1t6347s0§(param1:int, param2:Boolean) : *
      {
         var _loc3_:Boolean = false;
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
            this.canvas.y = 77 + (param1 / this.roomWidth * this.mcWidth - this.mcWidth / 2 + 2);
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
            this.canvas.x = 77 - (param1 / this.roomWidth * this.mcWidth - this.mcWidth / 2 + 2);
            this.canvas.y = 77;
         }
         if(this.nodemark.visible)
         {
            this.nodemark.x = this.canvas.x + this.nodemarkxdiff;
            this.nodemark.y = this.canvas.y + this.nodemarkydiff;
            _loc3_ = false;
            this.nodemark.rotation = 0;
            if(this.nodemark.x < 7)
            {
               this.nodemark.x = 7;
               _loc3_ = true;
               this.nodemark.rotation = -90;
            }
            else if(this.nodemark.x > 145)
            {
               this.nodemark.x = 145;
               _loc3_ = true;
               this.nodemark.rotation = 90;
            }
            if(this.nodemark.y < 11)
            {
               this.nodemark.y = 11;
               _loc3_ = true;
               if(this.nodemark.rotation == -90)
               {
                  this.nodemark.rotation = -45;
               }
               else if(this.nodemark.rotation == 90)
               {
                  this.nodemark.rotation = 45;
               }
               else
               {
                  this.nodemark.rotation = 0;
               }
            }
            else if(this.nodemark.y > 142)
            {
               this.nodemark.y = 142;
               _loc3_ = true;
               if(this.nodemark.rotation == -90)
               {
                  this.nodemark.rotation = 225;
               }
               else if(this.nodemark.rotation == 90)
               {
                  this.nodemark.rotation = 135;
               }
               else
               {
                  this.nodemark.rotation = 180;
               }
            }
            if(_loc3_)
            {
               this.nodemark.gotoAndStop(2);
            }
            else
            {
               this.nodemark.gotoAndStop(1);
            }
         }
      }
   }
}

