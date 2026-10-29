package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3334")]
   public class §1t411s0§ extends MovieClip
   {
      
      public static var instance:§1t411s0§;
      
      public var canvas:§1t5016s0§;
      
      public var eastlabel:TextField;
      
      public var minimapPlayer:MovieClip;
      
      public var nodemark:§1t7000s0§;
      
      public var northlabel:TextField;
      
      public var §1t6337s0§:TextField;
      
      public var southlabel:TextField;
      
      public var westlabel:TextField;
      
      internal var minimapRoomList:Array;
      
      internal var isNSOrientation:Boolean;
      
      internal var mcWidth:int = 10;
      
      internal var roomWidth:int;
      
      internal var nodeid:int;
      
      internal var §1t7001s0§:int;
      
      internal var §1t7002s0§:int;
      
      internal var §1t7003s0§:§1t855s0§;
      
      internal var §1t7004s0§:§1t855s0§;
      
      internal var §1t7005s0§:Array;
      
      internal var §1t7007s0§:Array;
      
      internal var §1t7010s0§:Array;
      
      internal var §1t7012s0§:Boolean;
      
      internal var §1t7013s0§:Boolean;
      
      public function §1t411s0§()
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         this.minimapRoomList = new Array();
         this.§1t7005s0§ = new Array();
         this.§1t7007s0§ = new Array();
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
         _loc1_ = 0;
         while(_loc1_ < 6)
         {
            this.minimapRoomList[_loc1_] = new Array(6);
            _loc3_ = 0;
            while(_loc3_ < 6)
            {
               this.minimapRoomList[_loc1_][_loc3_] = new §1t5257s0§();
               this.canvas.addChild(this.minimapRoomList[_loc1_][_loc3_]);
               this.minimapRoomList[_loc1_][_loc3_].x = _loc1_ * 20 - 77 + 28;
               this.minimapRoomList[_loc1_][_loc3_].y = _loc3_ * 20 - 77 + 28;
               _loc3_++;
            }
            _loc1_++;
         }
         this.§1t7003s0§ = new §1t855s0§(§1t1472s0§,0,80,100,"reset",true);
         this.§1t7004s0§ = new §1t855s0§(Array,0,8,15,"",true);
         _loc1_ = 0;
         while(_loc1_ < 7)
         {
            _loc2_ = new §1t7000s0§();
            _loc2_.visible = false;
            _loc2_.gotoAndStop(3);
            addChild(_loc2_);
            this.§1t7005s0§.push(_loc2_);
            _loc1_++;
         }
      }
      
      public static function §1t9190s0§() : §1t411s0§
      {
         if(instance == null)
         {
            new §1t411s0§();
         }
         return instance;
      }
      
      public function §1t4235s0§() : *
      {
         this.setNodeId(this.nodeid);
      }
      
      public function setNodeId(param1:int) : *
      {
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:XMLList = null;
         var _loc8_:§1t72s0§ = null;
         var _loc9_:§1t70s0§ = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc13_:§1t60s0§ = null;
         var _loc15_:MovieClip = null;
         var _loc16_:int = 0;
         var _loc17_:Boolean = false;
         var _loc18_:Point = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:Point = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         this.nodeid = param1;
         var _loc2_:Point = §1t70s0§.instance.§1t1133s0§(param1);
         var _loc3_:Point = §1t70s0§.instance.§1t1135s0§(param1);
         var _loc4_:int = _loc2_.x * 6 << 12 | _loc2_.y * 6;
         this.§1t6337s0§.text = §1t1521s0§.getString(557) + "(" + (_loc2_.x - 341 + §1t7934s0§.§1t12538s0§) + "," + (_loc2_.y - 341 + §1t7934s0§.§1t12539s0§) + ")\n" + §1t1521s0§.getString(319) + "(" + _loc3_.x + "," + _loc3_.y + ")";
         _loc9_ = §1t70s0§.§1t9190s0§();
         _loc10_ = §1t123s0§.instance.getMarkedNode();
         _loc11_ = 0;
         while(_loc11_ < 6)
         {
            _loc16_ = 0;
            while(_loc16_ < 6)
            {
               _loc5_ = _loc9_.§1t1161s0§(_loc4_,_loc11_,_loc16_);
               if(_loc5_ == -1)
               {
                  this.minimapRoomList[_loc11_][_loc16_].visible = false;
               }
               else
               {
                  this.minimapRoomList[_loc11_][_loc16_].visible = true;
                  _loc8_ = §1t1524s0§.§1t9886s0§(_loc5_);
                  if(!_loc8_.§1t1175s0§)
                  {
                     _loc7_ = _loc8_.§1t1186s0§(false)[0].getObjectList();
                     _loc6_ = this.§1t6346s0§(_loc7_);
                  }
                  else
                  {
                     _loc6_ = _loc9_.§1t1156s0§(_loc5_);
                  }
                  this.minimapRoomList[_loc11_][_loc16_].initNodeExits(_loc6_);
                  this.minimapRoomList[_loc11_][_loc16_].initIcon(§1t70s0§.instance.§1t1149s0§(_loc5_));
                  if(_loc5_ == 8402942)
                  {
                     this.minimapRoomList[_loc11_][_loc16_].initIcon(§1t70s0§.§1t9143s0§);
                  }
                  else if(_loc5_ == 8493074)
                  {
                     this.minimapRoomList[_loc11_][_loc16_].initIcon(§1t70s0§.§1t9142s0§);
                  }
                  else if(_loc5_ == 8656914 || _loc5_ == 8906733)
                  {
                     this.minimapRoomList[_loc11_][_loc16_].initIcon(§1t70s0§.§1t9140s0§);
                  }
                  if(_loc5_ == param1)
                  {
                     this.minimapPlayer.x = this.minimapRoomList[_loc11_][_loc16_].x + 77;
                     this.minimapPlayer.y = this.minimapRoomList[_loc11_][_loc16_].y + 77;
                     this.§1t7001s0§ = this.minimapPlayer.x;
                     this.§1t7002s0§ = this.minimapPlayer.y;
                     this.isNSOrientation = _loc9_.§1t1157s0§(_loc6_);
                     if(!_loc8_.§1t1175s0§)
                     {
                        this.roomWidth = _loc8_.§1t1186s0§(false)[0].getWidth();
                     }
                     else
                     {
                        this.roomWidth = _loc9_.§1t1160s0§(_loc5_);
                     }
                  }
               }
               _loc16_++;
            }
            _loc11_++;
         }
         this.canvas.graphics.clear();
         if(_loc10_ != -1)
         {
            _loc18_ = §1t70s0§.instance.§1t1136s0§(_loc10_);
            _loc19_ = _loc18_.x - _loc2_.x * 6;
            _loc20_ = _loc18_.y - _loc2_.y * 6;
            this.nodemark.x = _loc19_ * 20 + 28;
            this.nodemark.y = _loc20_ * 20 + 28;
            this.nodemark.visible = true;
            this.nodemark.rotation = 0;
            _loc22_ = §1t70s0§.instance.§1t1134s0§(param1);
            if(this.nodemark.x <= 8)
            {
               _loc17_ = true;
               _loc23_ = this.§1t7008s0§(_loc2_,§1t70s0§.instance.§1t1133s0§(_loc10_),§1t70s0§.§1t9131s0§,_loc22_);
            }
            else if(this.nodemark.x > 145)
            {
               _loc17_ = true;
               _loc23_ = this.§1t7008s0§(_loc2_,§1t70s0§.instance.§1t1133s0§(_loc10_),§1t70s0§.§1t9130s0§,_loc22_);
            }
            else if(this.nodemark.y < 13)
            {
               _loc17_ = true;
               _loc23_ = this.§1t7008s0§(_loc2_,§1t70s0§.instance.§1t1133s0§(_loc10_),§1t70s0§.§1t9128s0§,_loc22_);
            }
            else if(this.nodemark.y > 144)
            {
               _loc17_ = true;
               _loc23_ = this.§1t7008s0§(_loc2_,§1t70s0§.instance.§1t1133s0§(_loc10_),§1t70s0§.§1t9129s0§,_loc22_);
            }
            if(_loc17_)
            {
               if(_loc22_ == 1438039 && _loc23_ == §1t70s0§.§1t9130s0§)
               {
                  _loc23_ = §1t70s0§.§1t9129s0§;
               }
               else if(_loc22_ == 1442135 && _loc23_ == §1t70s0§.§1t9131s0§)
               {
                  _loc23_ = §1t70s0§.§1t9129s0§;
               }
               this.nodemark.gotoAndStop(2);
               if(_loc23_ == §1t70s0§.§1t9128s0§)
               {
                  this.nodemark.y = 13;
                  this.nodemark.rotation = 0;
                  _loc21_ = new Point(§1t71s0§.§1t9222s0§(_loc22_)[0],0);
                  this.nodemark.x = this.minimapRoomList[_loc21_.x][_loc21_.y].x + 77;
               }
               else if(_loc23_ == §1t70s0§.§1t9129s0§)
               {
                  this.nodemark.y = 144;
                  this.nodemark.rotation = 180;
                  _loc21_ = new Point(§1t71s0§.§1t9223s0§(_loc22_)[0],5);
                  this.nodemark.x = this.minimapRoomList[_loc21_.x][_loc21_.y].x + 77;
               }
               else if(_loc23_ == §1t70s0§.§1t9130s0§)
               {
                  this.nodemark.x = 145;
                  this.nodemark.rotation = 90;
                  _loc21_ = new Point(5,§1t71s0§.§1t9225s0§(_loc22_)[0]);
                  this.nodemark.y = this.minimapRoomList[_loc21_.x][_loc21_.y].y + 77;
               }
               else if(_loc23_ == §1t70s0§.§1t9131s0§)
               {
                  this.nodemark.x = 8;
                  this.nodemark.rotation = -90;
                  _loc21_ = new Point(0,§1t71s0§.§1t9224s0§(_loc22_)[0]);
                  this.nodemark.y = this.minimapRoomList[_loc21_.x][_loc21_.y].y + 77;
               }
            }
            else
            {
               this.nodemark.gotoAndStop(1);
               this.nodemark.rotation = 0;
               _loc21_ = §1t70s0§.instance.§1t1135s0§(_loc10_);
            }
            this.drawPath(_loc3_,_loc21_,_loc17_);
         }
         else
         {
            this.nodemark.visible = false;
         }
         this.§1t6347s0§(§1t1523s0§.§1t9586s0§().§1t1555s0§(),§1t1523s0§.§1t9586s0§().§1t1559s0§().§1t6283s0§());
         var _loc12_:int = int(§1t1523s0§.§1t9373s0§.length);
         var _loc14_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9427s0§);
         _loc11_ = 0;
         while(_loc11_ < 7)
         {
            if(_loc11_ < _loc12_ && _loc11_ != _loc14_)
            {
               _loc13_ = §1t1523s0§.§1t9373s0§[_loc11_];
               if(!_loc13_.§1t814s0§())
               {
                  _loc10_ = _loc13_.getMarkedNode();
                  _loc18_ = §1t70s0§.instance.§1t1136s0§(_loc10_);
                  _loc19_ = _loc18_.x - _loc2_.x * 6;
                  _loc20_ = _loc18_.y - _loc2_.y * 6;
                  _loc15_ = this.§1t7005s0§[_loc11_];
                  _loc15_.x = _loc19_ * 20 + 28;
                  _loc15_.y = _loc20_ * 20 + 28;
                  _loc15_.visible = true;
                  if(_loc15_.x <= 8)
                  {
                     _loc15_.x = 8;
                  }
                  else if(_loc15_.x > 145)
                  {
                     _loc15_.x = 145;
                  }
                  if(_loc15_.y < 13)
                  {
                     _loc15_.y = 11;
                  }
                  else if(_loc15_.y > 144)
                  {
                     _loc15_.y = 144;
                  }
               }
               else
               {
                  this.§1t7005s0§[_loc11_].visible = false;
               }
            }
            else
            {
               this.§1t7005s0§[_loc11_].visible = false;
            }
            _loc11_++;
         }
      }
      
      internal function §1t7008s0§(param1:Point, param2:Point, param3:int, param4:int) : int
      {
         var _loc6_:§1t1472s0§ = null;
         var _loc7_:Point = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc5_:Point = new Point(param1.x - 341,param1.y - 341);
         param2.x -= 341;
         param2.y -= 341;
         this.§1t7012s0§ = false;
         this.§1t7013s0§ = false;
         this.§1t7007s0§.length = 0;
         this.§1t7009s0§(_loc5_.x,_loc5_.y,_loc5_.x,_loc5_.y,param2,0);
         if(this.§1t7012s0§)
         {
            _loc6_ = this.§1t7007s0§[param2.x][param2.y];
            _loc7_ = _loc6_.from;
            while(!_loc6_.from.equals(_loc5_))
            {
               _loc7_ = _loc6_.from;
               _loc6_ = this.§1t7007s0§[_loc7_.x][_loc7_.y];
            }
            if(_loc7_.x > _loc5_.x)
            {
               param3 = §1t70s0§.§1t9130s0§;
            }
            else if(_loc7_.x < _loc5_.x)
            {
               param3 = §1t70s0§.§1t9131s0§;
            }
            else if(_loc7_.y > _loc5_.y)
            {
               param3 = §1t70s0§.§1t9129s0§;
            }
            else if(_loc7_.y < _loc5_.y)
            {
               param3 = §1t70s0§.§1t9128s0§;
            }
         }
         else
         {
            _loc8_ = param2.x - _loc5_.x;
            _loc9_ = param2.y - _loc5_.y;
            _loc10_ = null;
            if(param3 == §1t70s0§.§1t9128s0§ && !§1t1524s0§.§1t7976s0§(param1.x,param1.y - 1))
            {
               if(_loc8_ > 0)
               {
                  _loc10_ = [§1t70s0§.§1t9130s0§,§1t70s0§.§1t9131s0§,§1t70s0§.§1t9129s0§];
               }
               else
               {
                  _loc10_ = [§1t70s0§.§1t9131s0§,§1t70s0§.§1t9130s0§,§1t70s0§.§1t9129s0§];
               }
            }
            else if(param3 == §1t70s0§.§1t9129s0§ && !§1t1524s0§.§1t7976s0§(param1.x,param1.y + 1))
            {
               if(_loc8_ > 0)
               {
                  _loc10_ = [§1t70s0§.§1t9130s0§,§1t70s0§.§1t9131s0§,§1t70s0§.§1t9128s0§];
               }
               else
               {
                  _loc10_ = [§1t70s0§.§1t9131s0§,§1t70s0§.§1t9130s0§,§1t70s0§.§1t9128s0§];
               }
            }
            else if(param3 == §1t70s0§.§1t9130s0§ && !§1t1524s0§.§1t7976s0§(param1.x + 1,param1.y))
            {
               if(_loc9_ > 0)
               {
                  _loc10_ = [§1t70s0§.§1t9129s0§,§1t70s0§.§1t9128s0§,§1t70s0§.§1t9131s0§];
               }
               else
               {
                  _loc10_ = [§1t70s0§.§1t9128s0§,§1t70s0§.§1t9129s0§,§1t70s0§.§1t9131s0§];
               }
            }
            else if(param3 == §1t70s0§.§1t9131s0§ && !§1t1524s0§.§1t7976s0§(param1.x - 1,param1.y))
            {
               if(_loc9_ > 0)
               {
                  _loc10_ = [§1t70s0§.§1t9129s0§,§1t70s0§.§1t9128s0§,§1t70s0§.§1t9130s0§];
               }
               else
               {
                  _loc10_ = [§1t70s0§.§1t9128s0§,§1t70s0§.§1t9129s0§,§1t70s0§.§1t9130s0§];
               }
            }
            if(_loc10_ != null)
            {
               _loc11_ = int(_loc10_.length);
               _loc13_ = 0;
               while(_loc13_ < _loc11_)
               {
                  _loc12_ = int(_loc10_[_loc13_]);
                  if(Boolean(_loc12_ == §1t70s0§.§1t9128s0§) && Boolean(§1t1524s0§.§1t7976s0§(param1.x,param1.y - 1)) || Boolean(_loc12_ == §1t70s0§.§1t9129s0§) && Boolean(§1t1524s0§.§1t7976s0§(param1.x,param1.y + 1)) || Boolean(_loc12_ == §1t70s0§.§1t9130s0§) && Boolean(§1t1524s0§.§1t7976s0§(param1.x + 1,param1.y)) || Boolean(_loc12_ == §1t70s0§.§1t9131s0§) && Boolean(§1t1524s0§.§1t7976s0§(param1.x - 1,param1.y)))
                  {
                     param3 = _loc12_;
                     break;
                  }
                  _loc13_++;
               }
            }
         }
         this.§1t7003s0§.§1t868s0§();
         this.§1t7004s0§.§1t868s0§();
         this.§1t7007s0§.length = 0;
         return param3;
      }
      
      internal function §1t7009s0§(param1:int, param2:int, param3:int, param4:int, param5:Point, param6:int) : *
      {
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(this.§1t7013s0§)
         {
            return false;
         }
         if(param6 > 8)
         {
            return false;
         }
         if(!§1t1524s0§.§1t7976s0§(param3 + 341,param4 + 341))
         {
            return false;
         }
         if(this.§1t7007s0§[param3] == null)
         {
            this.§1t7007s0§[param3] = this.§1t7004s0§.§1t866s0§();
         }
         if(this.§1t7007s0§[param3][param4] == null)
         {
            this.§1t7007s0§[param3][param4] = this.§1t7003s0§.§1t866s0§();
         }
         var _loc7_:§1t1472s0§ = this.§1t7007s0§[param3][param4];
         param6++;
         if(_loc7_.§1t1474s0§ > param6)
         {
            _loc7_.§1t1474s0§ = param6;
            _loc7_.§1t1476s0§(param1,param2);
            if(param3 == param5.x && param4 == param5.y)
            {
               this.§1t7012s0§ = true;
               if(param6 <= 3)
               {
                  this.§1t7013s0§ = true;
               }
               return;
            }
            _loc8_ = new Array();
            if(param5.x > param3)
            {
               _loc8_.push(§1t70s0§.§1t9130s0§);
               if(param5.y > param4)
               {
                  _loc8_.push(§1t70s0§.§1t9129s0§);
                  _loc8_.push(§1t70s0§.§1t9128s0§);
               }
               else
               {
                  _loc8_.push(§1t70s0§.§1t9128s0§);
                  _loc8_.push(§1t70s0§.§1t9129s0§);
               }
               _loc8_.push(§1t70s0§.§1t9131s0§);
            }
            else if(param5.x < param3)
            {
               _loc8_.push(§1t70s0§.§1t9131s0§);
               if(param5.y > param4)
               {
                  _loc8_.push(§1t70s0§.§1t9129s0§);
                  _loc8_.push(§1t70s0§.§1t9128s0§);
               }
               else
               {
                  _loc8_.push(§1t70s0§.§1t9128s0§);
                  _loc8_.push(§1t70s0§.§1t9129s0§);
               }
               _loc8_.push(§1t70s0§.§1t9130s0§);
            }
            else if(param5.x == param3)
            {
               if(param5.y > param4)
               {
                  _loc8_.push(§1t70s0§.§1t9129s0§);
                  if(param5.x > param3)
                  {
                     _loc8_.push(§1t70s0§.§1t9130s0§);
                     _loc8_.push(§1t70s0§.§1t9131s0§);
                  }
                  else
                  {
                     _loc8_.push(§1t70s0§.§1t9131s0§);
                     _loc8_.push(§1t70s0§.§1t9130s0§);
                  }
                  _loc8_.push(§1t70s0§.§1t9128s0§);
               }
               else
               {
                  _loc8_.push(§1t70s0§.§1t9128s0§);
                  if(param5.x > param3)
                  {
                     _loc8_.push(§1t70s0§.§1t9130s0§);
                     _loc8_.push(§1t70s0§.§1t9131s0§);
                  }
                  else
                  {
                     _loc8_.push(§1t70s0§.§1t9131s0§);
                     _loc8_.push(§1t70s0§.§1t9130s0§);
                  }
                  _loc8_.push(§1t70s0§.§1t9129s0§);
               }
            }
            _loc10_ = 0;
            while(_loc10_ < 4)
            {
               _loc9_ = int(_loc8_[_loc10_]);
               if(_loc9_ == §1t70s0§.§1t9128s0§)
               {
                  this.§1t7009s0§(param3,param4,param3,param4 - 1,param5,param6);
               }
               else if(_loc9_ == §1t70s0§.§1t9129s0§)
               {
                  this.§1t7009s0§(param3,param4,param3,param4 + 1,param5,param6);
               }
               else if(_loc9_ == §1t70s0§.§1t9130s0§)
               {
                  this.§1t7009s0§(param3,param4,param3 + 1,param4,param5,param6);
               }
               else if(_loc9_ == §1t70s0§.§1t9131s0§)
               {
                  this.§1t7009s0§(param3,param4,param3 - 1,param4,param5,param6);
               }
               _loc10_++;
            }
         }
      }
      
      internal function §1t7011s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§1t7010s0§ == null)
         {
            this.§1t7010s0§ = new Array();
            _loc1_ = 0;
            while(_loc1_ < 6)
            {
               this.§1t7010s0§[_loc1_] = new Array(6);
               _loc2_ = 0;
               while(_loc2_ < 6)
               {
                  this.§1t7010s0§[_loc1_][_loc2_] = new §1t1472s0§();
                  _loc2_++;
               }
               _loc1_++;
            }
         }
         else
         {
            _loc1_ = 0;
            while(_loc1_ < 6)
            {
               _loc2_ = 0;
               while(_loc2_ < 6)
               {
                  this.§1t7010s0§[_loc1_][_loc2_].reset();
                  _loc2_++;
               }
               _loc1_++;
            }
         }
      }
      
      internal function drawPath(param1:Point, param2:Point, param3:Boolean) : *
      {
         var _loc5_:Point = null;
         var _loc8_:§1t5257s0§ = null;
         var _loc9_:int = 0;
         this.§1t7011s0§();
         this.§1t7012s0§ = false;
         this.§1t7013s0§ = false;
         this.§1t7016s0§(param1.x,param1.y,param1.x,param1.y,param2,0);
         var _loc4_:§1t1472s0§ = this.§1t7010s0§[param2.x][param2.y];
         var _loc6_:Array = new Array();
         this.canvas.graphics.lineStyle(2,15658734);
         var _loc7_:§1t5257s0§ = this.minimapRoomList[param2.x][param2.y];
         if(param3)
         {
            if(param2.x == 0)
            {
               this.§1t7015s0§(8 - 77,_loc7_.y,_loc7_.x,_loc7_.y);
            }
            else if(param2.x == 5)
            {
               this.§1t7015s0§(145 - 77,_loc7_.y,_loc7_.x,_loc7_.y);
            }
            else if(param2.y == 0)
            {
               this.§1t7015s0§(_loc7_.x,13 - 77,_loc7_.x,_loc7_.y);
            }
            else if(param2.y == 5)
            {
               this.§1t7015s0§(_loc7_.x,144 - 77,_loc7_.x,_loc7_.y);
            }
         }
         _loc6_.push(param2);
         if(this.§1t7012s0§)
         {
            do
            {
               _loc5_ = _loc4_.from;
               _loc6_.push(_loc5_);
               _loc4_ = this.§1t7010s0§[_loc5_.x][_loc5_.y];
            }
            while(!_loc5_.equals(param1));
            _loc9_ = 0;
            while(_loc9_ < _loc6_.length - 1)
            {
               _loc7_ = this.minimapRoomList[_loc6_[_loc9_].x][_loc6_[_loc9_].y];
               _loc8_ = this.minimapRoomList[_loc6_[_loc9_ + 1].x][_loc6_[_loc9_ + 1].y];
               this.§1t7015s0§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y);
               _loc9_++;
            }
         }
      }
      
      internal function §1t7015s0§(param1:*, param2:*, param3:*, param4:*) : *
      {
         var _loc5_:int = 0;
         if(param3 < param1)
         {
            _loc5_ = param3;
            param3 = param1;
            param1 = _loc5_;
         }
         else if(param4 < param2)
         {
            _loc5_ = param4;
            param4 = param2;
            param2 = _loc5_;
         }
         this.canvas.graphics.moveTo(param1,param2);
         if(param2 == param4)
         {
            do
            {
               param1 += 2;
               this.canvas.graphics.lineTo(param1,param2);
               param1 += 4;
               this.canvas.graphics.moveTo(param1,param2);
            }
            while(param1 < param3);
         }
         else if(param1 == param3)
         {
            do
            {
               param2 += 2;
               this.canvas.graphics.lineTo(param1,param2);
               param2 += 4;
               this.canvas.graphics.moveTo(param1,param2);
            }
            while(param2 < param4);
         }
      }
      
      internal function §1t7016s0§(param1:int, param2:int, param3:int, param4:int, param5:Point, param6:int) : *
      {
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:§1t5257s0§ = null;
         if(this.§1t7013s0§)
         {
            return false;
         }
         if(param3 < 0 || param3 > 5 || param4 < 0 || param4 > 5)
         {
            return false;
         }
         var _loc7_:§1t1472s0§ = this.§1t7010s0§[param3][param4];
         param6++;
         if(_loc7_.§1t1474s0§ > param6)
         {
            _loc7_.§1t1474s0§ = param6;
            _loc7_.§1t1476s0§(param1,param2);
            if(param3 == param5.x && param4 == param5.y)
            {
               this.§1t7012s0§ = true;
               if(param6 <= 3)
               {
                  this.§1t7013s0§ = true;
               }
               return;
            }
            _loc8_ = new Array();
            if(param5.x > param3)
            {
               _loc8_.push(§1t70s0§.§1t9130s0§);
               if(param5.y > param4)
               {
                  _loc8_.push(§1t70s0§.§1t9129s0§);
                  _loc8_.push(§1t70s0§.§1t9128s0§);
               }
               else
               {
                  _loc8_.push(§1t70s0§.§1t9128s0§);
                  _loc8_.push(§1t70s0§.§1t9129s0§);
               }
               _loc8_.push(§1t70s0§.§1t9131s0§);
            }
            else if(param5.x < param3)
            {
               _loc8_.push(§1t70s0§.§1t9131s0§);
               if(param5.y > param4)
               {
                  _loc8_.push(§1t70s0§.§1t9129s0§);
                  _loc8_.push(§1t70s0§.§1t9128s0§);
               }
               else
               {
                  _loc8_.push(§1t70s0§.§1t9128s0§);
                  _loc8_.push(§1t70s0§.§1t9129s0§);
               }
               _loc8_.push(§1t70s0§.§1t9130s0§);
            }
            else if(param5.x == param3)
            {
               if(param5.y > param4)
               {
                  _loc8_.push(§1t70s0§.§1t9129s0§);
                  if(param5.x > param3)
                  {
                     _loc8_.push(§1t70s0§.§1t9130s0§);
                     _loc8_.push(§1t70s0§.§1t9131s0§);
                  }
                  else
                  {
                     _loc8_.push(§1t70s0§.§1t9131s0§);
                     _loc8_.push(§1t70s0§.§1t9130s0§);
                  }
                  _loc8_.push(§1t70s0§.§1t9128s0§);
               }
               else
               {
                  _loc8_.push(§1t70s0§.§1t9128s0§);
                  if(param5.x > param3)
                  {
                     _loc8_.push(§1t70s0§.§1t9130s0§);
                     _loc8_.push(§1t70s0§.§1t9131s0§);
                  }
                  else
                  {
                     _loc8_.push(§1t70s0§.§1t9131s0§);
                     _loc8_.push(§1t70s0§.§1t9130s0§);
                  }
                  _loc8_.push(§1t70s0§.§1t9129s0§);
               }
            }
            _loc10_ = 0;
            while(_loc10_ < 4)
            {
               _loc11_ = this.minimapRoomList[param3][param4];
               _loc9_ = int(_loc8_[_loc10_]);
               if(_loc9_ == §1t70s0§.§1t9128s0§ && _loc11_.§1t1746s0§[0] == 1)
               {
                  this.§1t7016s0§(param3,param4,param3,param4 - 1,param5,param6);
               }
               else if(_loc9_ == §1t70s0§.§1t9129s0§ && _loc11_.§1t1746s0§[1] == 1)
               {
                  this.§1t7016s0§(param3,param4,param3,param4 + 1,param5,param6);
               }
               else if(_loc9_ == §1t70s0§.§1t9130s0§ && _loc11_.§1t1746s0§[2] == 1)
               {
                  this.§1t7016s0§(param3,param4,param3 + 1,param4,param5,param6);
               }
               else if(_loc9_ == §1t70s0§.§1t9131s0§ && _loc11_.§1t1746s0§[3] == 1)
               {
                  this.§1t7016s0§(param3,param4,param3 - 1,param4,param5,param6);
               }
               _loc10_++;
            }
         }
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
            this.minimapPlayer.y = this.§1t7002s0§ - (param1 / this.roomWidth * this.mcWidth - this.mcWidth / 2);
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
            this.minimapPlayer.x = this.§1t7001s0§ + (param1 / this.roomWidth * this.mcWidth - this.mcWidth / 2);
         }
      }
   }
}

