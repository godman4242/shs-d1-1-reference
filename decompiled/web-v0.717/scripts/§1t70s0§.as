package
{
   import flash.geom.Point;
   
   public class §1t70s0§
   {
      
      public static var instance:§1t70s0§;
      
      internal static var §1t9127s0§:int = 32;
      
      public static var §1t9128s0§:int = 0;
      
      public static var §1t9129s0§:int = 1;
      
      public static var §1t9130s0§:int = 2;
      
      public static var §1t9131s0§:int = 3;
      
      public static var §1t9132s0§:int = 0;
      
      public static var §1t9133s0§:int = 1;
      
      public static var §1t9134s0§:int = 2;
      
      public static var §1t9135s0§:int = 3;
      
      public static var §1t9136s0§:int = 4;
      
      public static var §1t9137s0§:int = 5;
      
      public static var §1t9138s0§:int = 6;
      
      public static var §1t9139s0§:int = 0;
      
      public static var §1t9140s0§:int = 1;
      
      public static var §1t9141s0§:int = 2;
      
      public static var §1t9142s0§:int = 3;
      
      public static var §1t9143s0§:int = 4;
      
      public static var §1t9144s0§:int = 5;
      
      public static var §1t9145s0§:int = 6;
      
      public static var §1t9146s0§:int = 7;
      
      public static var §1t9147s0§:int = 8;
      
      public static var §1t9148s0§:int = 9;
      
      public static var §1t9149s0§:int = 10;
      
      public static var §1t9150s0§:int = 11;
      
      public static var §1t9151s0§:int = 12;
      
      public static var §1t9152s0§:int = 13;
      
      public static var §1t9153s0§:int = 14;
      
      public static var §1t9154s0§:int = 15;
      
      public static var §1t9155s0§:int = 16;
      
      public static var §1t9156s0§:int = 17;
      
      public static var §1t9157s0§:int = 18;
      
      public static var §1t9158s0§:int = 19;
      
      public static var §1t9159s0§:int = 20;
      
      public static var §1t9160s0§:int = 21;
      
      public static var §1t9161s0§:int = 22;
      
      public static var §1t9162s0§:int = 23;
      
      public static var §1t9163s0§:int = 24;
      
      public static var §1t9164s0§:int = 100;
      
      public static var §1t9165s0§:int = 0;
      
      public static var §1t9166s0§:int = 1;
      
      public static var §1t9167s0§:int = 2;
      
      public static var §1t9168s0§:int = 3;
      
      public static var §1t9169s0§:int = 4;
      
      public static var §1t9170s0§:int = 5;
      
      public static var §1t9171s0§:int = 6;
      
      public static var §1t9172s0§:int = 7;
      
      public static var §1t9173s0§:int = 8;
      
      public static var §1t9174s0§:int = 9;
      
      public static var §1t9175s0§:int = 10;
      
      public static var §1t9176s0§:int = 11;
      
      public static var §1t9177s0§:int = 13;
      
      public static var §1t9178s0§:int = 14;
      
      public static var §1t9179s0§:int = 15;
      
      public static var §1t9180s0§:int = 16;
      
      public static var §1t9181s0§:int = 17;
      
      public static var §1t9182s0§:int = 18;
      
      public static var §1t9183s0§:int = 19;
      
      public static var §1t9184s0§:int = 20;
      
      public static var §1t9185s0§:int = 21;
      
      internal static var §1t9186s0§:int = 20;
      
      internal static var §1t9187s0§:int = 5;
      
      internal static var §1t9188s0§:int = 20;
      
      internal static var §1t9189s0§:int = 5;
      
      internal var §1t1119s0§:§1t1120s0§;
      
      internal var §1t1121s0§:Array = new Array();
      
      internal var §1t1122s0§:Array = new Array();
      
      internal var §1t1123s0§:Array = new Array();
      
      internal var §1t1124s0§:Array = new Array();
      
      internal var §1t1138s0§:int = 3;
      
      public function §1t70s0§()
      {
         super();
         if(instance != null)
         {
            return;
         }
         instance = this;
         this.§1t1119s0§ = new §1t1120s0§();
      }
      
      public static function §1t9190s0§() : §1t70s0§
      {
         if(instance == null)
         {
            new §1t70s0§();
         }
         return instance;
      }
      
      public static function destroy() : *
      {
         §1t70s0§.instance.§1t1121s0§.length = 0;
         §1t70s0§.instance.§1t1122s0§.length = 0;
         §1t70s0§.instance.§1t1123s0§.length = 0;
         §1t70s0§.instance.§1t1124s0§.length = 0;
         §1t70s0§.instance = null;
      }
      
      public function §1t1125s0§(param1:int, param2:Boolean = true) : *
      {
         var _loc3_:Point = this.§1t1133s0§(param1);
         this.§1t1122s0§[0] = this.§1t1126s0§(_loc3_.x - 1,_loc3_.y - 1,param2);
         this.§1t1122s0§[1] = this.§1t1126s0§(_loc3_.x,_loc3_.y - 1,param2);
         this.§1t1122s0§[2] = this.§1t1126s0§(_loc3_.x + 1,_loc3_.y - 1,param2);
         this.§1t1122s0§[3] = this.§1t1126s0§(_loc3_.x - 1,_loc3_.y,param2);
         this.§1t1122s0§[4] = this.§1t1126s0§(_loc3_.x,_loc3_.y,param2);
         this.§1t1122s0§[5] = this.§1t1126s0§(_loc3_.x + 1,_loc3_.y,param2);
         this.§1t1122s0§[6] = this.§1t1126s0§(_loc3_.x - 1,_loc3_.y + 1,param2);
         this.§1t1122s0§[7] = this.§1t1126s0§(_loc3_.x,_loc3_.y + 1,param2);
         this.§1t1122s0§[8] = this.§1t1126s0§(_loc3_.x - 1,_loc3_.y + 1,param2);
         if(!param2)
         {
            §1t3317s0§.instance.§1t1978s0§(_loc3_.x,_loc3_.y);
         }
      }
      
      public function §1t1126s0§(param1:int, param2:int, param3:Boolean = true, param4:Boolean = false) : §1t71s0§
      {
         var _loc5_:int = param1 << 12 | param2;
         var _loc6_:§1t71s0§ = this.§1t1127s0§(_loc5_);
         if(_loc6_ == null)
         {
            _loc6_ = this.§1t1129s0§(param1,param2,param3);
            if(param3 || param4)
            {
               this.§1t1121s0§.push(_loc6_);
               if(this.§1t1121s0§.length > §1t9186s0§)
               {
                  this.§1t1121s0§.splice(0,§1t9187s0§);
               }
            }
         }
         return _loc6_;
      }
      
      internal function §1t1127s0§(param1:int) : §1t71s0§
      {
         var _loc3_:§1t71s0§ = null;
         var _loc2_:int = int(this.§1t1121s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.§1t1121s0§[_loc4_];
            if(_loc3_.getID() == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function §1t1128s0§() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.§1t1122s0§[1]);
         _loc1_.push(this.§1t1122s0§[3]);
         _loc1_.push(this.§1t1122s0§[5]);
         _loc1_.push(this.§1t1122s0§[7]);
         return _loc1_;
      }
      
      internal function §1t1129s0§(param1:int, param2:int, param3:Boolean = true) : §1t71s0§
      {
         var _loc4_:int = param1 << 12 | param2;
         var _loc5_:§1t71s0§ = new §1t71s0§(_loc4_);
         if(param3)
         {
            §1t3317s0§.instance.§1t1126s0§(param1,param2);
         }
         return _loc5_;
      }
      
      public function §1t1130s0§(param1:int, param2:int, param3:String) : *
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc4_:§1t71s0§ = this.§1t1126s0§(param1,param2,false,true);
         _loc4_.§1t1334s0§(param3);
         if(§1t1540s0§.§1t10033s0§())
         {
            if(§1t406s0§.instance != null && §1t406s0§.instance.§1t6496s0§.§1t6855s0§())
            {
               §1t406s0§.instance.§1t6496s0§.§1t1130s0§();
            }
            else
            {
               _loc5_ = false;
               _loc6_ = 0;
               while(_loc6_ < 9)
               {
                  if(this.§1t1122s0§[_loc6_] == null || !this.§1t1122s0§[_loc6_].§1t1335s0§())
                  {
                     _loc5_ = true;
                     break;
                  }
                  _loc6_++;
               }
               if(!_loc5_)
               {
                  §1t1540s0§.§1t10036s0§();
               }
            }
         }
      }
      
      public function §1t1131s0§(param1:int, param2:int, param3:String, param4:Array) : *
      {
         var _loc5_:§1t71s0§ = this.§1t1126s0§(param1,param2,true);
         _loc5_.§1t1336s0§(param3,param4);
      }
      
      public function §1t1132s0§(param1:int, param2:int, param3:String) : *
      {
         var _loc7_:int = 0;
         var _loc4_:Array = param3.split("|");
         var _loc5_:* = 0;
         var _loc6_:int = param1 - 1;
         while(_loc6_ <= param1 + 1)
         {
            _loc7_ = param2 - 1;
            while(_loc7_ <= param2 + 1)
            {
               this.§1t1130s0§(_loc6_,_loc7_,_loc4_[_loc5_++]);
               _loc7_++;
            }
            _loc6_++;
         }
         §1t1540s0§.§1t10037s0§();
      }
      
      public function §1t1133s0§(param1:int) : Point
      {
         var _loc2_:int = param1 >> 12 & 0x0FFF;
         var _loc3_:int = param1 & 0x0FFF;
         var _loc4_:int = Math.floor(_loc2_ / 6);
         var _loc5_:int = Math.floor(_loc3_ / 6);
         return new Point(_loc4_,_loc5_);
      }
      
      public function §1t1134s0§(param1:int) : int
      {
         var _loc2_:int = param1 >> 12 & 0x0FFF;
         var _loc3_:int = param1 & 0x0FFF;
         var _loc4_:int = Math.floor(_loc2_ / 6);
         var _loc5_:int = Math.floor(_loc3_ / 6);
         return _loc4_ << 12 | _loc5_;
      }
      
      public function §1t1135s0§(param1:int) : Point
      {
         var _loc2_:int = param1 >> 12 & 0x0FFF;
         var _loc3_:int = param1 & 0x0FFF;
         var _loc4_:int = _loc2_ % 6;
         var _loc5_:int = _loc3_ % 6;
         return new Point(_loc4_,_loc5_);
      }
      
      public function §1t1136s0§(param1:int) : Point
      {
         var _loc2_:int = param1 >> 12 & 0x0FFF;
         var _loc3_:int = param1 & 0x0FFF;
         return new Point(_loc2_,_loc3_);
      }
      
      public function §1t1137s0§(param1:int, param2:int) : §1t72s0§
      {
         var _loc3_:§1t72s0§ = new §1t72s0§(new XML());
         var _loc4_:int = param1 << 12 | param2;
         _loc3_.x = param1;
         _loc3_.y = param2;
         _loc3_.id = _loc4_;
         _loc3_.level = this.§1t1139s0§(_loc4_);
         _loc3_.§1t1182s0§(this.§1t1153s0§(_loc4_));
         _loc3_.roomsXML = null;
         var _loc5_:Point = this.§1t1133s0§(_loc4_);
         var _loc6_:§1t71s0§ = this.§1t1126s0§(_loc5_.x,_loc5_.y);
         var _loc7_:int = _loc6_.§1t1149s0§(_loc4_);
         if(_loc7_ == §1t9140s0§ && _loc6_.§1t1339s0§() > 0)
         {
            _loc3_.§1t1182s0§(_loc6_.§1t1341s0§());
         }
         else if(_loc7_ == §1t9148s0§)
         {
            _loc3_.§1t1182s0§(_loc6_.§1t1276s0§ + " " + §1t1521s0§.getString(1000));
         }
         else if(_loc7_ == §1t9149s0§)
         {
            _loc3_.§1t1182s0§(_loc6_.§1t1276s0§ + " " + §1t1521s0§.getString(1027));
         }
         else if(_loc7_ == §1t9141s0§)
         {
            _loc3_.§1t1182s0§(this.§1t1144s0§(_loc4_) + _loc6_.§1t1276s0§ + " " + §1t1521s0§.getString(1001));
         }
         else if(_loc7_ == §1t9142s0§)
         {
            _loc3_.§1t1182s0§(this.§1t1144s0§(_loc4_) + _loc6_.§1t1276s0§ + " " + §1t1521s0§.getString(1021));
         }
         else if(_loc7_ == §1t9143s0§)
         {
            _loc3_.§1t1182s0§(this.§1t1144s0§(_loc4_) + _loc6_.§1t1276s0§ + " " + §1t1521s0§.getString(1005));
         }
         else if(_loc7_ == §1t9160s0§)
         {
            _loc3_.§1t1182s0§(this.§1t1144s0§(_loc4_) + _loc6_.§1t1276s0§ + " " + §1t1521s0§.getString(1028));
         }
         else if(_loc7_ == §1t9151s0§)
         {
            _loc3_.§1t1182s0§(_loc6_.§1t1276s0§ + " " + §1t1521s0§.getString(1016));
         }
         else if(_loc7_ == §1t9162s0§)
         {
            _loc3_.§1t1182s0§(this.§1t1144s0§(_loc4_) + _loc6_.§1t1276s0§ + " " + §1t1521s0§.getString(1020));
         }
         return _loc3_;
      }
      
      public function §1t1139s0§(param1:int) : int
      {
         var _loc2_:Point = this.§1t1133s0§(param1);
         var _loc3_:int = Math.abs(_loc2_.x - 341) + Math.abs(_loc2_.y - 341) + this.§1t1138s0§;
         if(_loc3_ > 200)
         {
            _loc3_ = 200;
         }
         return _loc3_;
      }
      
      public function §1t1140s0§(param1:int) : Boolean
      {
         if(param1 == 1466699 || param1 == 1503572 || param1 == 1368424 || param1 == 1540387)
         {
            return true;
         }
         var _loc2_:int = this.§1t1143s0§(param1);
         return _loc2_ < this.§1t1138s0§ + 5;
      }
      
      public function §1t1141s0§(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 == 1397077 || param1 == 1397078)
         {
            return 0;
         }
         if(param1 == 1401173)
         {
            return 3;
         }
         if(param1 == 1405270)
         {
            return 4;
         }
         if(param1 == 1466699 || param1 == 1503572 || param1 == 1368424 || param1 == 1540387 || param1 == 1413461 || param1 == 1409366 || param1 == 1401176 || param1 == 1397081)
         {
            return 5;
         }
         _loc2_ = §1t58s0§.random(7,param1);
         if(_loc2_ == 0)
         {
            return 0;
         }
         if(_loc2_ == 1)
         {
            return 1;
         }
         if(_loc2_ == 2)
         {
            return 2;
         }
         if(_loc2_ == 3)
         {
            return 3;
         }
         if(_loc2_ == 4)
         {
            return 4;
         }
         if(_loc2_ == 5)
         {
            return 5;
         }
         return 0;
      }
      
      public function §1t1142s0§(param1:int) : Boolean
      {
         switch(param1)
         {
            case 1413463:
               return true;
            case 1458520:
               return true;
            case 1454424:
               return true;
            case 1470806:
               return true;
            case 1474900:
               return true;
            case 1483090:
               return true;
            case 1483089:
               return true;
            default:
               return false;
         }
      }
      
      public function §1t1143s0§(param1:int) : int
      {
         var _loc2_:int = param1 >> 12 & 0x0FFF;
         var _loc3_:int = param1 & 0x0FFF;
         var _loc4_:int = Math.abs(_loc2_ - 341) + Math.abs(_loc3_ - 341) + this.§1t1138s0§;
         if(_loc4_ > 100)
         {
            _loc4_ = 100;
         }
         return _loc4_;
      }
      
      internal function §1t1144s0§(param1:int) : *
      {
         var _loc2_:String = "";
         var _loc3_:String = "";
         var _loc4_:Point = §1t70s0§.instance.§1t1135s0§(param1);
         if(_loc4_.y <= 1)
         {
            _loc2_ = §1t1521s0§.getString(398);
         }
         else if(_loc4_.y >= 4)
         {
            _loc2_ = §1t1521s0§.getString(399);
         }
         if(_loc4_.x <= 1)
         {
            _loc3_ = §1t1521s0§.getString(401);
         }
         else if(_loc4_.x >= 4)
         {
            _loc3_ = §1t1521s0§.getString(400);
         }
         var _loc5_:String = _loc2_ + _loc3_;
         if(_loc5_ != "")
         {
            _loc5_ += " ";
         }
         return _loc5_;
      }
      
      public function §1t1145s0§(param1:int) : int
      {
         var _loc2_:int = §1t58s0§.random(5,param1);
         if(_loc2_ == 0)
         {
            return §1t9168s0§;
         }
         if(_loc2_ == 1)
         {
            return §1t9169s0§;
         }
         if(_loc2_ == 2)
         {
            return §1t9170s0§;
         }
         if(_loc2_ == 3)
         {
            return §1t9171s0§;
         }
         if(_loc2_ == 4)
         {
            return §1t9172s0§;
         }
         return §1t9168s0§;
      }
      
      internal function §1t1146s0§(param1:int) : Array
      {
         var _loc3_:Array = null;
         var _loc2_:int = int(this.§1t1124s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(this.§1t1124s0§[_loc4_] == param1)
            {
               return this.§1t1123s0§[_loc4_];
            }
            _loc4_++;
         }
         return null;
      }
      
      internal function §1t1147s0§(param1:int, param2:Array) : *
      {
         this.§1t1124s0§.push(param1);
         this.§1t1123s0§.push(param2);
         if(this.§1t1124s0§.length > §1t9188s0§)
         {
            this.§1t1124s0§.splice(0,§1t9189s0§);
            this.§1t1123s0§.splice(0,§1t9189s0§);
         }
      }
      
      public function §1t1148s0§(param1:int, param2:Boolean = true, param3:int = -1, param4:int = -1, param5:int = 0) : Array
      {
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:uint = 0;
         var _loc24_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:String = null;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:Boolean = false;
         var _loc36_:int = 0;
         var _loc38_:Array = null;
         var _loc39_:String = null;
         var _loc40_:int = 0;
         var _loc41_:int = 0;
         var _loc42_:int = 0;
         var _loc43_:int = 0;
         if(param5 == 0)
         {
            _loc38_ = this.§1t1146s0§(param1);
            if(_loc38_ != null)
            {
               return _loc38_;
            }
         }
         var _loc6_:Point = this.§1t1133s0§(param1);
         var _loc7_:§1t71s0§ = this.§1t1126s0§(_loc6_.x,_loc6_.y);
         if(param3 == -1)
         {
            param3 = _loc7_.§1t1149s0§(param1);
         }
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1);
         var _loc9_:Array = new Array();
         var _loc10_:§1t134s0§ = new §1t134s0§(new XML());
         _loc10_.bg = this.§1t1151s0§(param1);
         _loc10_.§1t1383s0§(this.§1t1153s0§(param1));
         if(Boolean(_loc7_.§1t1284s0§) && Boolean(_loc7_.§1t1300s0§(param1)))
         {
            _loc10_.isPrivate = §1t134s0§.§1t9234s0§;
         }
         var _loc11_:int = this.§1t1139s0§(param1);
         var _loc12_:int = _loc7_.§1t1339s0§();
         if(param3 == §1t9156s0§ || param3 == §1t9140s0§ && _loc12_ == 1)
         {
            _loc10_.width = 1600;
            _loc10_.§1t1383s0§(§1t1521s0§.getString(495,[_loc7_.§1t1341s0§()]));
            _loc10_.bg = §1t112s0§.§1t12578s0§;
         }
         else if(param3 == §1t9140s0§ && _loc12_ > 1)
         {
            if(_loc12_ == 2)
            {
               _loc10_.width = 1600;
            }
            else if(_loc12_ == 3)
            {
               _loc10_.width = 1600;
            }
            else if(_loc12_ == 4)
            {
               _loc10_.width = 2000;
            }
            else if(_loc12_ == 5)
            {
               _loc10_.width = 2000;
            }
            _loc10_.§1t1383s0§(§1t1521s0§.getString(495,[_loc7_.§1t1341s0§()]));
            if(_loc12_ == 2)
            {
               _loc10_.bg = §1t112s0§.§1t12551s0§;
            }
            else
            {
               _loc10_.bg = §1t112s0§.§1t12602s0§;
            }
         }
         else if(param3 == §1t9151s0§)
         {
            _loc10_.bg = §1t112s0§.§1t12579s0§;
            _loc10_.§1t1383s0§(_loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1016));
         }
         else if(param3 == §1t9162s0§)
         {
            _loc10_.bg = §1t112s0§.§1t12552s0§;
            _loc10_.§1t1383s0§(this.§1t1144s0§(param1) + _loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1020));
         }
         else if(param3 == §1t9152s0§)
         {
            _loc10_.bg = §1t112s0§.§1t12548s0§;
            _loc10_.§1t1383s0§(this.§1t1144s0§(param1) + _loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1021));
         }
         else if(param3 == §1t9148s0§)
         {
            _loc10_.width = 1600;
            _loc10_.§1t1383s0§(§1t1521s0§.getString(495,[_loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1000)]));
            _loc10_.bg = §1t112s0§.§1t12551s0§;
         }
         else if(param3 == §1t9149s0§)
         {
            _loc10_.width = 2200;
            _loc10_.§1t1383s0§(_loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1027));
            _loc10_.bg = §1t112s0§.§1t12576s0§;
         }
         else if(param3 == §1t9157s0§)
         {
            _loc10_.width = 1600;
            _loc10_.§1t1383s0§(§1t1521s0§.getString(1014));
            _loc10_.bg = §1t112s0§.§1t12593s0§;
         }
         else if(param3 == §1t9141s0§)
         {
            if(_loc8_.rand(3) == 0)
            {
               _loc10_.§1t1383s0§(this.§1t1144s0§(param1) + _loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1028));
               _loc10_.bg = §1t112s0§.§1t12556s0§;
            }
            else
            {
               _loc10_.§1t1383s0§(this.§1t1144s0§(param1) + _loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1001));
            }
         }
         else if(param3 == §1t9142s0§)
         {
            _loc10_.§1t1383s0§(this.§1t1144s0§(param1) + _loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1021));
         }
         else if(param3 == §1t9143s0§)
         {
            _loc10_.§1t1383s0§(this.§1t1144s0§(param1) + _loc7_.§1t1276s0§ + " " + §1t1521s0§.getString(1005));
         }
         else if(param3 == §1t9145s0§ || param3 == §1t9163s0§)
         {
            _loc10_.width = 2000;
         }
         else
         {
            _loc10_.width = this.§1t1160s0§(param1);
         }
         var _loc13_:String = "";
         var _loc18_:Array = this.§1t1156s0§(param1);
         var _loc19_:Boolean = this.§1t1157s0§(_loc18_);
         var _loc20_:int = this.§1t1161s0§(param1,0,-1);
         var _loc21_:int = this.§1t1161s0§(param1,0,1);
         var _loc22_:int = this.§1t1161s0§(param1,1,0);
         var _loc23_:int = this.§1t1161s0§(param1,-1,0);
         var _loc25_:int = 0;
         while(_loc25_ < 4)
         {
            _loc24_ += _loc18_[_loc25_];
            _loc25_++;
         }
         if(_loc18_[§1t9129s0§] == 1)
         {
            if(_loc19_)
            {
               _loc14_ = 50;
               _loc15_ = §1t9131s0§;
            }
            else if(_loc24_ == 2)
            {
               if(_loc18_[§1t9131s0§] == 0)
               {
                  _loc14_ = 250;
                  _loc15_ = §1t9137s0§;
               }
               else
               {
                  _loc14_ = _loc10_.width - 250;
                  _loc15_ = §1t9133s0§;
               }
            }
            else
            {
               _loc14_ = _loc10_.width / 2;
               _loc15_ = §1t9129s0§;
               if(_loc18_[§1t9128s0§] == 1)
               {
                  _loc15_ = 8;
               }
            }
            _loc13_ += "<obj><id>0</id><x>" + _loc14_ + "</x><property>0,50," + _loc21_ + ",1," + §1t9129s0§ + "," + _loc15_ + "</property></obj>";
         }
         if(_loc18_[§1t9128s0§] == 1)
         {
            if(_loc19_)
            {
               _loc14_ = _loc10_.width - 50;
               _loc15_ = §1t9130s0§;
            }
            else if(_loc24_ == 2)
            {
               if(_loc18_[§1t9130s0§] == 0)
               {
                  _loc14_ = _loc10_.width - 250;
                  _loc15_ = §1t9136s0§;
               }
               else
               {
                  _loc14_ = 250;
                  _loc15_ = §1t9132s0§;
               }
            }
            else
            {
               _loc14_ = _loc10_.width / 2;
               _loc15_ = §1t9128s0§;
            }
            _loc13_ += "<obj><id>0</id><x>" + _loc14_ + "</x><property>0,50," + _loc20_ + ",1," + §1t9128s0§ + "," + _loc15_ + "</property></obj>";
         }
         if(_loc18_[§1t9130s0§] == 1)
         {
            if(!_loc19_)
            {
               _loc14_ = _loc10_.width - 50;
               _loc15_ = §1t9130s0§;
            }
            else if(_loc24_ == 2)
            {
               if(_loc18_[§1t9129s0§] == 0)
               {
                  _loc14_ = 250;
                  _loc15_ = §1t9137s0§;
               }
               else
               {
                  _loc14_ = _loc10_.width - 250;
                  _loc15_ = §1t9133s0§;
               }
            }
            else
            {
               _loc14_ = _loc10_.width / 2;
               _loc15_ = §1t9129s0§;
            }
            _loc13_ += "<obj><id>0</id><x>" + _loc14_ + "</x><property>0,50," + _loc22_ + ",1," + §1t9130s0§ + "," + _loc15_ + "</property></obj>";
         }
         if(_loc18_[§1t9131s0§] == 1)
         {
            if(!_loc19_)
            {
               _loc14_ = 50;
               _loc15_ = §1t9131s0§;
            }
            else if(_loc24_ == 2)
            {
               if(_loc18_[§1t9128s0§] == 0)
               {
                  _loc14_ = _loc10_.width - 250;
                  _loc15_ = §1t9136s0§;
               }
               else
               {
                  _loc14_ = 250;
                  _loc15_ = §1t9132s0§;
               }
            }
            else
            {
               _loc14_ = _loc10_.width / 2;
               _loc15_ = §1t9128s0§;
            }
            _loc13_ += "<obj><id>0</id><x>" + _loc14_ + "</x><property>0,50," + _loc23_ + ",1," + §1t9131s0§ + "," + _loc15_ + "</property></obj>";
         }
         var _loc26_:Boolean = false;
         if(param3 == §1t9141s0§ || param3 == §1t9159s0§ || param3 == §1t9160s0§)
         {
            _loc26_ = true;
            if(_loc18_[§1t9129s0§] == 1 || _loc18_[§1t9131s0§] == 1)
            {
               _loc27_ = _loc10_.width - 300;
               _loc28_ = 50;
               _loc29_ = 1;
               if(_loc10_.bg == §1t112s0§.§1t12556s0§)
               {
                  _loc39_ = "1,11";
               }
               else
               {
                  _loc39_ = "1,1";
               }
            }
            else if(_loc18_[§1t9128s0§] == 1 || _loc18_[§1t9130s0§] == 1)
            {
               _loc27_ = 300;
               _loc28_ = 750;
               _loc29_ = 1;
               if(_loc10_.bg == §1t112s0§.§1t12556s0§)
               {
                  _loc39_ = "-1,11";
               }
               else
               {
                  _loc39_ = "-1,1";
               }
            }
            _loc13_ += "<obj><id>0</id><x>" + _loc27_ + "</x><property>" + _loc29_ + "," + _loc28_ + ",-1,0</property></obj>";
            _loc13_ = _loc13_ + ("<obj><id>52</id><x>" + _loc27_ + "</x><property>" + _loc39_ + "</property></obj>");
         }
         else if(param3 == §1t9142s0§ || param3 == §1t9143s0§ || param3 == §1t9152s0§)
         {
            _loc26_ = true;
            if(_loc18_[§1t9128s0§] == 1 || _loc18_[§1t9130s0§] == 1)
            {
               _loc27_ = 100;
               _loc29_ = 1;
               _loc28_ = 750;
               if(_loc10_.bg == §1t112s0§.§1t12548s0§)
               {
                  if(param3 == §1t9143s0§)
                  {
                     _loc13_ += "<obj><id>72</id><x>" + 100 + "</x><property>1</property></obj>";
                  }
                  else if(param3 == §1t9142s0§ || param3 == §1t9152s0§)
                  {
                     _loc13_ += "<obj><id>72</id><x>" + 100 + "</x><property>2</property></obj>";
                  }
               }
               else
               {
                  _loc27_ = 151;
                  _loc39_ = "-1,21";
                  _loc13_ += "<obj><id>52</id><x>" + _loc27_ + "</x><property>" + _loc39_ + "</property></obj>";
               }
            }
            else
            {
               _loc27_ = _loc10_.width - 100;
               _loc28_ = 50;
               _loc29_ = 1;
               if(_loc10_.bg == §1t112s0§.§1t12548s0§)
               {
                  _loc41_ = _loc10_.width;
                  if(_loc27_ > _loc41_ - 350)
                  {
                     _loc40_ = §1t99s0§.playerScrollMax + (_loc41_ - 800) / 4 + (§1t99s0§.playerScrollMin - 100);
                  }
                  else
                  {
                     _loc40_ = 450 + (_loc14_ - 450) / 4;
                  }
                  if(param3 == §1t9143s0§)
                  {
                     _loc13_ += "<obj><id>72</id><x>" + _loc40_ + "</x><property>1</property></obj>";
                  }
                  else if(param3 == §1t9142s0§ || param3 == §1t9152s0§)
                  {
                     _loc13_ += "<obj><id>72</id><x>" + _loc40_ + "</x><property>2</property></obj>";
                  }
               }
               else
               {
                  _loc27_ = _loc10_.width - 151;
                  _loc39_ = "1,21";
                  _loc13_ += "<obj><id>52</id><x>" + _loc27_ + "</x><property>" + _loc39_ + "</property></obj>";
               }
            }
            _loc13_ += "<obj><id>0</id><x>" + _loc27_ + "</x><property>" + _loc29_ + "," + _loc28_ + "</property></obj>";
            if(param3 == §1t9152s0§)
            {
               _loc30_ = 24;
               _loc31_ = "<property>" + param1 + "</property>";
               _loc32_ = 2;
               _loc33_ = 200;
               _loc36_ = _loc10_.width / _loc33_;
               _loc25_ = 0;
               while(_loc25_ < _loc36_ && !_loc34_)
               {
                  if(_loc8_.rand(_loc32_) == 0)
                  {
                     _loc13_ += "<obj><id>" + _loc30_ + "</id><x>" + (_loc8_.rand(_loc10_.width - 300) + 150) + "</x>" + _loc31_ + "</obj>";
                  }
                  _loc25_++;
               }
            }
         }
         else if(param3 == §1t9140s0§)
         {
            _loc26_ = true;
            _loc27_ = _loc10_.width / 2;
            _loc28_ = 50;
            _loc29_ = 1;
            _loc17_ = this.§1t1164s0§(param1);
            _loc13_ += "<obj><id>26</id><x>" + (_loc27_ - 250) + "</x><property>" + _loc7_.§1t1339s0§() + "</property></obj>";
            if(!_loc7_.§1t1328s0§())
            {
               if(_loc7_.§1t1339s0§() < 3 || _loc7_.§1t1342s0§() == 0 || _loc7_.§1t1342s0§() == §1t1523s0§.§1t7746s0§())
               {
                  _loc13_ += "<obj><id>0</id><x>" + _loc27_ + "</x><property>" + _loc29_ + "," + 50 + "</property></obj>";
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11558s0§) || _loc7_.§1t1345s0§(§1t2281s0§.§1t11557s0§) || _loc7_.§1t1345s0§(§1t2281s0§.§1t11556s0§))
               {
                  _loc13_ += "<obj><id>71</id><x>" + _loc27_ + "</x><property>" + _loc7_.§1t1342s0§() + ",1</property></obj>";
               }
               else
               {
                  _loc13_ += "<obj><id>71</id><x>" + _loc27_ + "</x><property>" + _loc7_.§1t1342s0§() + ",0</property></obj>";
               }
            }
            if(_loc12_ > 1)
            {
               _loc13_ += "<obj><id>25</id><x>" + _loc27_ + "</x><property>" + _loc7_.§1t1339s0§() + "," + _loc7_.§1t1342s0§() + "," + _loc17_ + "," + _loc7_.§1t1328s0§() + "</property></obj>";
            }
         }
         else if(param3 == §1t9156s0§)
         {
            _loc26_ = true;
            _loc27_ = _loc10_.width / 2;
            _loc28_ = 50;
            _loc29_ = 1;
            _loc13_ += "<obj><id>0</id><x>" + _loc27_ + "</x><property>" + _loc29_ + "," + 50 + "</property></obj>";
         }
         else if(param3 == §1t9155s0§ || param3 == §1t9161s0§)
         {
            _loc26_ = true;
            _loc27_ = _loc10_.width / 2;
            _loc13_ += "<obj><id>53</id><x>" + _loc27_ + "</x><property>1</property></obj>";
            _loc10_.bg = §1t112s0§.§1t12547s0§;
         }
         else if(param3 == §1t9158s0§)
         {
            _loc26_ = true;
            if(_loc18_[§1t9129s0§] == 1 || _loc18_[§1t9131s0§] == 1)
            {
               _loc27_ = _loc10_.width - 50;
               _loc28_ = 50;
               _loc29_ = 1;
            }
            else if(_loc18_[§1t9128s0§] == 1 || _loc18_[§1t9130s0§] == 1)
            {
               _loc27_ = 50;
               _loc28_ = 750;
               _loc29_ = 1;
            }
            _loc13_ += "<obj><id>0</id><x>" + _loc27_ + "</x><property>" + _loc29_ + "," + _loc28_ + ",-1,0</property></obj>";
            if(param4 == §1t9167s0§)
            {
               _loc10_.bg = §1t112s0§.§1t12553s0§;
            }
            else
            {
               _loc10_.bg = §1t112s0§.§1t12547s0§;
            }
         }
         else if(param3 == §1t9148s0§)
         {
            _loc26_ = true;
            _loc27_ = _loc10_.width / 2;
            _loc29_ = 1;
            _loc13_ += "<obj><id>0</id><x>" + (_loc27_ - 50).toString() + "</x><property>" + _loc29_ + ",750,-1,1</property></obj>";
            if(param1 != 8402944)
            {
               _loc13_ += "<obj><id>14</id><x>" + (_loc27_ + 350).toString() + "</x><property>30004</property></obj>";
            }
            _loc13_ += "<obj><id>28</id><x>" + _loc27_ + "</x><property></property></obj>";
         }
         else if(param3 == §1t9149s0§)
         {
            _loc26_ = true;
            _loc27_ = _loc10_.width / 2;
            _loc29_ = 1;
            _loc13_ += "<obj><id>0</id><x>" + _loc27_ + "</x><property>" + _loc29_ + "," + 50 + "</property></obj>";
         }
         else if(param3 == §1t9157s0§)
         {
            _loc26_ = true;
            if(_loc18_[§1t9129s0§] == 1 || _loc18_[§1t9131s0§] == 1)
            {
               _loc27_ = 1350;
            }
            else
            {
               _loc27_ = 250;
            }
            _loc29_ = 1;
            _loc13_ += "<obj><id>0</id><x>" + _loc27_ + "</x><property>" + _loc29_ + "," + 50 + "</property></obj>";
         }
         else if(param3 == §1t9150s0§)
         {
            _loc26_ = _loc8_.rand(2) == 0;
            if(_loc10_.width > 1000)
            {
               _loc27_ = 500 + _loc8_.rand(_loc10_.width - 1000);
            }
            else
            {
               _loc27_ = 400 + _loc8_.rand(_loc10_.width - 800);
            }
            if(!(_loc6_.x == 341 && _loc6_.y == 341) && !_loc7_.§1t1328s0§() && _loc8_.rand(3) == 0)
            {
               _loc13_ += "<obj><id>23</id><x>" + _loc27_ + "</x><property>0</property></obj>";
            }
            if(!_loc7_.§1t1328s0§() && _loc26_)
            {
               _loc13_ += "<obj><id>31</id><x>" + _loc27_ + "</x><property>1</property></obj>";
            }
            else
            {
               _loc13_ += "<obj><id>31</id><x>" + _loc27_ + "</x><property>0</property></obj>";
            }
         }
         else if(param3 == §1t9163s0§)
         {
            if(this.§1t1158s0§(_loc18_))
            {
               _loc27_ = 1000;
            }
            else if(_loc8_.rand(2) == 0)
            {
               _loc27_ = 500;
            }
            else
            {
               _loc27_ = 1500;
            }
            _loc13_ += "<obj><id>74</id><x>" + _loc27_ + "</x><property>" + _loc7_.§1t1277s0§ + "</property></obj>";
         }
         else if(_loc24_ == 1)
         {
            _loc30_ = 24;
            _loc31_ = "<property>" + param1 + "</property>";
            _loc32_ = 2;
            _loc33_ = 200;
            _loc36_ = _loc10_.width / _loc33_;
            _loc25_ = 0;
            while(_loc25_ < _loc36_ && !_loc34_)
            {
               if(_loc8_.rand(_loc32_) == 0 || _loc25_ == 0)
               {
                  _loc13_ += "<obj><id>" + _loc30_ + "</id><x>" + (_loc8_.rand(_loc10_.width - 300) + 150) + "</x>" + _loc31_ + "</obj>";
               }
               _loc25_++;
            }
         }
         _loc31_ = "";
         _loc32_ = 3;
         _loc33_ = 250;
         _loc34_ = false;
         var _loc35_:int = _loc8_.rand(4);
         switch(_loc35_)
         {
            case 0:
               _loc30_ = 2;
               _loc33_ = 250;
               break;
            case 1:
               _loc30_ = 17;
               _loc32_ = 2;
               _loc33_ = 200;
               break;
            default:
               _loc34_ = true;
         }
         if(param3 == §1t9156s0§ || param3 == §1t9140s0§ || param3 == §1t9148s0§ || param3 == §1t9149s0§ || param3 == §1t9151s0§ || _loc7_.§1t1328s0§())
         {
            _loc34_ = true;
         }
         _loc36_ = _loc10_.width / _loc33_;
         _loc25_ = 0;
         while(_loc25_ < _loc36_ && !_loc34_)
         {
            if(_loc8_.rand(_loc32_) == 0)
            {
               if(_loc30_ == 17)
               {
                  _loc13_ = "<obj><id>" + _loc30_ + "</id><x>" + (_loc8_.rand(_loc10_.width - 300) + 150) + "</x><property>" + (_loc8_.rand(2) + 1) + "</property></obj>" + _loc13_;
               }
               else if(_loc30_ == 2)
               {
                  _loc13_ += "<obj><id>" + _loc30_ + "</id><x>" + (_loc8_.rand(_loc10_.width - 300) + 150) + "</x><property>" + (_loc8_.rand(10) + 1) + "," + _loc11_ + "</property></obj>";
               }
            }
            _loc25_++;
         }
         var _loc37_:Boolean = false;
         if(param3 == §1t9156s0§ || _loc10_.isPrivate == §1t134s0§.§1t9234s0§ || _loc10_.isPrivate == §1t134s0§.§1t9236s0§)
         {
            _loc37_ = true;
         }
         if(!_loc37_ && param3 != §1t9148s0§ && param3 != §1t9149s0§ && _loc10_.isPrivate != 9 && !(param3 == §1t9153s0§ && _loc7_.§1t1345s0§(§1t2281s0§.§1t11559s0§)))
         {
            if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11558s0§) && param3 == §1t9140s0§)
            {
               if(int(Math.random() * 3) == 0)
               {
                  _loc36_ = _loc10_.width / 400;
                  _loc25_ = 1;
                  while(_loc25_ < _loc36_ - 1)
                  {
                     if(_loc8_.rand(2) == 0)
                     {
                        _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9167s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"zombie" + (_loc25_ - _loc25_ % 2).toString());
                     }
                     _loc25_++;
                  }
               }
               _loc37_ = true;
               if(_loc8_.rand(3) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9175s0§,_loc10_.width,§1t9167s0§);
               }
            }
            else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11550s0§) && param3 == §1t9151s0§)
            {
               _loc36_ = _loc10_.width / 300;
               _loc25_ = 1;
               while(_loc25_ < _loc36_ - 1)
               {
                  if(_loc8_.rand(2) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9167s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"zombie" + (_loc25_ - _loc25_ % 2).toString());
                  }
                  _loc25_++;
               }
               _loc37_ = true;
            }
            else if(param3 != §1t9140s0§ && _loc7_.§1t1345s0§(§1t2281s0§.§1t11554s0§) && int(Math.random() * 4) == 0)
            {
               _loc36_ = _loc10_.width / 300;
               _loc25_ = 1;
               while(_loc25_ < _loc36_ - 1)
               {
                  if(_loc8_.rand(2) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9167s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"zombie");
                  }
                  _loc25_++;
               }
               _loc37_ = true;
               if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11538s0§) && int(Math.random() * 3) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9165s0§,_loc10_.width,§1t9167s0§);
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11543s0§) && int(Math.random() * 4) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9174s0§,_loc10_.width,§1t9167s0§);
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11546s0§) && int(Math.random() * 5) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9173s0§,_loc10_.width,§1t9167s0§);
               }
            }
            if(!_loc37_)
            {
               if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11557s0§) && param3 == §1t9140s0§)
               {
                  if(int(Math.random() * 3) == 0)
                  {
                     _loc36_ = _loc10_.width / 400;
                     _loc25_ = 1;
                     while(_loc25_ < _loc36_ - 1)
                     {
                        _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9166s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"goblin" + (_loc25_ - _loc25_ % 2).toString());
                        _loc25_++;
                     }
                  }
                  _loc37_ = true;
                  if(_loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9175s0§,_loc10_.width,§1t9166s0§);
                  }
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11553s0§) && int(Math.random() * 4) == 0)
               {
                  if(_loc11_ > 15 && _loc24_ == 2 && int(Math.random() * 5) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9166s0§,_loc10_.width,_loc10_.width / 2,_loc11_,"ogre",true);
                  }
                  else
                  {
                     _loc36_ = _loc10_.width / 300;
                     _loc25_ = 1;
                     while(_loc25_ < _loc36_ - 1)
                     {
                        if(_loc8_.rand(2) == 0)
                        {
                           _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9166s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"goblin");
                        }
                        _loc25_++;
                     }
                  }
                  _loc37_ = true;
                  if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11537s0§) && _loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9165s0§,_loc10_.width,§1t9166s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11542s0§) && _loc8_.rand(4) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9174s0§,_loc10_.width,§1t9166s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11545s0§) && _loc8_.rand(5) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9173s0§,_loc10_.width,§1t9166s0§);
                  }
               }
               else if(param3 != §1t9140s0§ && _loc7_.§1t1345s0§(§1t2281s0§.§1t11553s0§))
               {
                  if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11537s0§) && _loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9165s0§,_loc10_.width,§1t9166s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11542s0§) && _loc8_.rand(4) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9174s0§,_loc10_.width,§1t9166s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11545s0§) && _loc8_.rand(5) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9173s0§,_loc10_.width,§1t9166s0§);
                  }
               }
            }
            if(!_loc37_)
            {
               if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11556s0§) && param3 == §1t9140s0§)
               {
                  if(int(Math.random() * 3) == 0)
                  {
                     _loc36_ = _loc10_.width / 400;
                     _loc25_ = 1;
                     while(_loc25_ < _loc36_ - 1)
                     {
                        _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9165s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"aggrobandits" + (_loc25_ - _loc25_ % 2).toString(),false);
                        _loc25_++;
                     }
                  }
                  _loc37_ = true;
                  if(_loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9175s0§,_loc10_.width,§1t9165s0§);
                  }
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11539s0§) && param3 == §1t9154s0§ && int(Math.random() * 3) == 0)
               {
                  _loc36_ = _loc10_.width / 300;
                  _loc25_ = 1;
                  while(_loc25_ < _loc36_ - 1)
                  {
                     if(_loc8_.rand(2) == 0)
                     {
                        _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9165s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"aggrobandits",false);
                     }
                     _loc25_++;
                  }
                  _loc37_ = true;
                  if(_loc8_.rand(2) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,this.§1t1145s0§(param1),_loc10_.width,§1t9165s0§);
                  }
               }
               else if(param3 != §1t9140s0§ && _loc7_.§1t1345s0§(§1t2281s0§.§1t11552s0§) && int(Math.random() * 2) == 0)
               {
                  _loc36_ = _loc10_.width / 300;
                  _loc25_ = 1;
                  while(_loc25_ < _loc36_ - 1)
                  {
                     if(_loc8_.rand(2) == 0)
                     {
                        _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9165s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"aggrobandits",false);
                     }
                     _loc25_++;
                  }
                  _loc37_ = true;
                  if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11541s0§) && _loc8_.rand(4) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9174s0§,_loc10_.width,§1t9165s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11544s0§) && _loc8_.rand(5) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9173s0§,_loc10_.width,§1t9165s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11540s0§) && _loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9165s0§,_loc10_.width,§1t9165s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11537s0§) && _loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9166s0§,_loc10_.width,§1t9165s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11538s0§) && _loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9167s0§,_loc10_.width,§1t9165s0§);
                  }
               }
               else if(param3 != §1t9140s0§ && param3 != §1t9148s0§ && param3 != §1t9149s0§ && param3 != §1t9151s0§ && int(Math.random() * 4) == 0)
               {
                  _loc36_ = _loc10_.width / 300;
                  _loc25_ = 1;
                  while(_loc25_ < _loc36_ - 1)
                  {
                     if(_loc8_.rand(2) == 0)
                     {
                        _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,§1t9165s0§,_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"aggrobandits",false);
                     }
                     _loc25_++;
                  }
                  _loc37_ = true;
                  if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11541s0§) && _loc8_.rand(4) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9174s0§,_loc10_.width,§1t9165s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11544s0§) && _loc8_.rand(5) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9173s0§,_loc10_.width,§1t9165s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11540s0§) && _loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9165s0§,_loc10_.width,§1t9165s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11537s0§) && _loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9166s0§,_loc10_.width,§1t9165s0§);
                  }
                  else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11538s0§) && _loc8_.rand(3) == 0)
                  {
                     _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9167s0§,_loc10_.width,§1t9165s0§);
                  }
               }
            }
            if(!_loc37_)
            {
               if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11551s0§) && param3 == §1t9154s0§ && int(Math.random() * 3) == 0 || _loc7_.§1t1345s0§(§1t2281s0§.§1t11555s0§) && _loc8_.rand(3) == 0 && param3 !== §1t9140s0§ && param3 != §1t9148s0§ && (_loc10_.bg == §1t112s0§.§1t12551s0§ || _loc10_.bg == §1t112s0§.§1t12547s0§ || _loc10_.bg == §1t112s0§.§1t12549s0§ || _loc10_.bg == §1t112s0§.§1t12575s0§))
               {
                  _loc13_ += §1t147s0§.§1t11408s0§(_loc8_,this.§1t1145s0§(param1),_loc10_.width,_loc8_.rand(_loc10_.width - 400) + 200,_loc11_,"wildlife");
                  _loc37_ = true;
               }
            }
            if(!_loc37_ && param3 != §1t9140s0§)
            {
               if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11541s0§) && int(Math.random() * 5) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9165s0§,_loc10_.width,§1t9174s0§);
                  _loc13_ = _loc13_ + §1t147s0§.§1t11412s0§(_loc8_,§1t9174s0§,_loc10_.width);
                  _loc37_ = true;
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11542s0§) && int(Math.random() * 5) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9166s0§,_loc10_.width,§1t9174s0§);
                  _loc13_ = _loc13_ + §1t147s0§.§1t11412s0§(_loc8_,§1t9174s0§,_loc10_.width);
                  _loc37_ = true;
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11543s0§) && (_loc7_.§1t1345s0§(§1t2281s0§.§1t11554s0§) || param3 == §1t9151s0§) && int(Math.random() * 5) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9167s0§,_loc10_.width,§1t9174s0§);
                  _loc13_ = _loc13_ + §1t147s0§.§1t11412s0§(_loc8_,§1t9174s0§,_loc10_.width);
                  _loc37_ = true;
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11544s0§) && int(Math.random() * 5) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9165s0§,_loc10_.width,§1t9173s0§);
                  _loc13_ = _loc13_ + §1t147s0§.§1t11412s0§(_loc8_,§1t9173s0§,_loc10_.width);
                  _loc37_ = true;
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11545s0§) && int(Math.random() * 5) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9166s0§,_loc10_.width,§1t9173s0§);
                  _loc13_ = _loc13_ + §1t147s0§.§1t11412s0§(_loc8_,§1t9173s0§,_loc10_.width);
                  _loc37_ = true;
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11546s0§) && (_loc7_.§1t1345s0§(§1t2281s0§.§1t11554s0§) || param3 == §1t9151s0§) && int(Math.random() * 5) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,§1t9167s0§,_loc10_.width,§1t9173s0§);
                  _loc13_ = _loc13_ + §1t147s0§.§1t11412s0§(_loc8_,§1t9173s0§,_loc10_.width);
                  _loc37_ = true;
               }
               else if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11547s0§) && param3 == §1t9154s0§ && int(Math.random() * 5) == 0)
               {
                  _loc13_ += §1t147s0§.§1t11411s0§(_loc8_,this.§1t1145s0§(param1),_loc10_.width,§1t9175s0§);
                  _loc13_ = _loc13_ + §1t147s0§.§1t11412s0§(_loc8_,§1t9175s0§,_loc10_.width);
                  _loc37_ = true;
               }
            }
         }
         if(!(_loc6_.x == 341 && _loc6_.y == 341) && !_loc37_ && _loc8_.rand(5) == 0 && int(Math.random() * 3) == 0)
         {
            _loc13_ += "<obj><id>" + 23 + "</id><x>" + (_loc8_.rand(_loc10_.width - 300) + 150) + "</x><property>0,1</property><name>procgenronin</name></obj>";
         }
         else if(!_loc37_ && int(Math.random() * 2) == 0)
         {
            _loc36_ = Math.random() * 7 + 1;
            _loc25_ = 0;
            while(_loc25_ < _loc36_)
            {
               _loc13_ = "<obj><id>61</id><x>" + int(Math.random() * _loc10_.width) + "</x></obj>" + _loc13_;
               _loc25_++;
            }
         }
         if(param3 == §1t9153s0§ && _loc7_.§1t1345s0§(§1t2281s0§.§1t11559s0§))
         {
            _loc36_ = _loc10_.width / 700;
            _loc25_ = 0;
            while(_loc25_ < _loc36_)
            {
               if(_loc8_.rand(2) == 0)
               {
                  _loc13_ += "<obj><id>34</id><x>" + (_loc8_.rand(_loc10_.width - 300) + 150) + "</x></obj>";
               }
               _loc25_++;
            }
            _loc36_ = _loc10_.width / 300;
            _loc25_ = 0;
            while(_loc25_ < _loc36_)
            {
               if(_loc8_.rand(2) == 0)
               {
                  _loc13_ += "<obj><id>4</id><x>" + (_loc8_.rand(_loc10_.width - 300) + 150) + "</x><property>82</property></obj>";
               }
               _loc25_++;
            }
            _loc13_ += "<obj><id>4</id><x>" + (_loc8_.rand(_loc10_.width - 300) + 150) + "</x><property>142</property><name>merccaptain</name></obj>";
         }
         _loc10_.objectList = new XMLList(_loc13_);
         _loc10_.roomid = 0;
         _loc9_.push(_loc10_);
         if(_loc26_ && param2)
         {
            if(_loc18_[§1t9128s0§] == 1)
            {
               _loc42_ = §1t9129s0§;
            }
            if(_loc18_[§1t9129s0§] == 1)
            {
               _loc42_ = §1t9128s0§;
            }
            if(_loc18_[§1t9130s0§] == 1)
            {
               _loc42_ = §1t9131s0§;
            }
            if(_loc18_[§1t9131s0§] == 1)
            {
               _loc42_ = §1t9130s0§;
            }
            if(_loc19_)
            {
               _loc43_ = §1t9131s0§;
            }
            else
            {
               _loc43_ = §1t9128s0§;
            }
            if(param3 == §1t9141s0§)
            {
               this.§1t1119s0§.§1t2102s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4,param5 == §1t72s0§.§1t9195s0§);
            }
            else if(param3 == §1t9159s0§)
            {
               this.§1t1119s0§.§1t2103s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4,param5 == §1t72s0§.§1t9195s0§);
            }
            else if(param3 == §1t9142s0§)
            {
               this.§1t1119s0§.§1t2106s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4);
            }
            else if(param3 == §1t9143s0§)
            {
               this.§1t1119s0§.§1t2104s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4);
            }
            else if(param3 == §1t9160s0§)
            {
               this.§1t1119s0§.§1t2105s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4);
            }
            else if(param3 == §1t9140s0§)
            {
               this.§1t1119s0§.§1t1964s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,_loc7_,_loc17_,param4);
            }
            else if(param3 == §1t9156s0§)
            {
               _loc7_ = new §1t71s0§(param1);
               _loc7_.§1t1275s0§ = 499;
               this.§1t1119s0§.§1t1964s0§(_loc27_,param1,_loc11_,§1t9128s0§,_loc9_,_loc7_,_loc17_,param4);
            }
            else if(param3 == §1t9155s0§)
            {
               this.§1t1119s0§.§1t2111s0§(_loc27_,param1,_loc11_,_loc43_,_loc9_,param4);
            }
            else if(param3 == §1t9161s0§)
            {
               this.§1t1119s0§.§1t2112s0§(_loc27_,param1,_loc11_,_loc43_,_loc9_,param4);
            }
            else if(param3 == §1t9148s0§)
            {
               this.§1t1119s0§.§1t2114s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4);
            }
            else if(param3 == §1t9149s0§)
            {
               this.§1t1119s0§.§1t2113s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4);
            }
            else if(param3 == §1t9157s0§)
            {
               this.§1t1119s0§.§1t2110s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4,param5 == §1t72s0§.§1t9195s0§);
            }
            else if(param3 == §1t9150s0§)
            {
               this.§1t1119s0§.§1t2116s0§(_loc27_,param1,_loc11_,_loc9_,param4);
            }
            else if(param3 == §1t9152s0§)
            {
               if(_loc7_.§1t1345s0§(§1t2281s0§.§1t11549s0§))
               {
                  this.§1t1119s0§.§1t2107s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4);
               }
               else
               {
                  this.§1t1119s0§.§1t2109s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4);
               }
            }
            else if(param3 == §1t9158s0§)
            {
               this.§1t1119s0§.§1t2108s0§(_loc27_,param1,_loc11_,_loc42_,_loc9_,param4,param5 == §1t72s0§.§1t9195s0§);
            }
         }
         if(param5 == 0 && _loc7_.§1t1335s0§())
         {
            this.§1t1147s0§(param1,_loc9_);
         }
         _loc8_.destroy();
         return _loc9_;
      }
      
      public function §1t1149s0§(param1:int) : int
      {
         var _loc2_:Point = this.§1t1133s0§(param1);
         var _loc3_:§1t71s0§ = this.§1t1126s0§(_loc2_.x,_loc2_.y);
         return _loc3_.§1t1149s0§(param1);
      }
      
      internal function §1t1150s0§(param1:int, param2:int) : int
      {
         var _loc5_:int = 0;
         var _loc3_:int = param1 << 12 | param2;
         var _loc4_:int = §1t58s0§.§1t8806s0§(_loc3_,0,4);
         if(_loc4_ == 0)
         {
            _loc5_ = §1t112s0§.§1t12547s0§;
         }
         else if(_loc4_ == 1)
         {
            _loc5_ = §1t112s0§.§1t12551s0§;
         }
         else if(_loc4_ == 2)
         {
            _loc5_ = §1t112s0§.§1t12549s0§;
         }
         else if(_loc4_ == 3)
         {
            _loc5_ = §1t112s0§.§1t12548s0§;
         }
         return _loc5_;
      }
      
      public function §1t1151s0§(param1:int) : int
      {
         var _loc2_:* = Math.floor((param1 >> 12 & 0x0FFF) / 3);
         var _loc3_:* = Math.floor((param1 & 0x0FFF) / 3);
         var _loc4_:int = this.§1t1150s0§(_loc2_,_loc3_);
         var _loc5_:int = §1t58s0§.§1t8806s0§(param1,0,9);
         var _loc6_:int = _loc4_;
         switch(_loc4_)
         {
            case §1t112s0§.§1t12551s0§:
               if(_loc5_ == 0)
               {
                  _loc6_ = §1t112s0§.§1t12554s0§;
               }
               break;
            case §1t112s0§.§1t12547s0§:
               if(_loc5_ <= 2)
               {
                  _loc6_ = §1t112s0§.§1t12561s0§;
               }
               else if(_loc5_ <= 5)
               {
                  _loc6_ = §1t112s0§.§1t12568s0§;
               }
               break;
            case §1t112s0§.§1t12549s0§:
               if(_loc5_ == 0)
               {
                  _loc6_ = §1t112s0§.§1t12547s0§;
               }
               break;
            case §1t112s0§.§1t12548s0§:
               if(_loc5_ == 0)
               {
                  _loc6_ = §1t112s0§.§1t12549s0§;
               }
               else if(_loc5_ == 1)
               {
                  _loc6_ = §1t112s0§.§1t12575s0§;
               }
         }
         return _loc6_;
      }
      
      internal function §1t1152s0§(param1:int) : Boolean
      {
         var _loc2_:Point = this.§1t1135s0§(param1);
         var _loc3_:Point = this.§1t1133s0§(param1);
         if(_loc2_.y == 0 && !§1t1524s0§.§1t7976s0§(_loc3_.x,_loc3_.y - 1))
         {
            return true;
         }
         if(_loc2_.y == 5 && !§1t1524s0§.§1t7976s0§(_loc3_.x,_loc3_.y + 1))
         {
            return true;
         }
         if(_loc2_.x == 5 && !§1t1524s0§.§1t7976s0§(_loc3_.x + 1,_loc3_.y))
         {
            return true;
         }
         if(_loc2_.x == 0 && !§1t1524s0§.§1t7976s0§(_loc3_.x - 1,_loc3_.y))
         {
            return true;
         }
         return false;
      }
      
      public function §1t1153s0§(param1:int) : String
      {
         var _loc2_:int = this.§1t1151s0§(param1);
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:Point = this.§1t1135s0§(param1);
         if(_loc5_.y <= 1)
         {
            _loc3_ = §1t1521s0§.getString(398);
         }
         else if(_loc5_.y >= 4)
         {
            _loc3_ = §1t1521s0§.getString(399);
         }
         if(_loc5_.x <= 1)
         {
            _loc4_ = §1t1521s0§.getString(401);
         }
         else if(_loc5_.x >= 4)
         {
            _loc4_ = §1t1521s0§.getString(400);
         }
         var _loc6_:String = _loc3_ + _loc4_;
         if(_loc6_ != "")
         {
            _loc6_ += " ";
         }
         var _loc7_:String = §1t136s0§.§1t9190s0§().§1t1826s0§(this.§1t1134s0§(param1));
         var _loc8_:String = "";
         switch(_loc2_)
         {
            case §1t112s0§.§1t12547s0§:
            case §1t112s0§.§1t12561s0§:
            case §1t112s0§.§1t12568s0§:
            case §1t112s0§.§1t12591s0§:
            case §1t112s0§.§1t12551s0§:
               _loc8_ = §1t1521s0§.getString(1003);
               break;
            case §1t112s0§.§1t12549s0§:
               _loc8_ = §1t1521s0§.getString(1002);
               break;
            case §1t112s0§.§1t12548s0§:
            case §1t112s0§.§1t12575s0§:
               _loc8_ = §1t1521s0§.getString(1015);
               break;
            case §1t112s0§.§1t12554s0§:
               _loc8_ = §1t1521s0§.getString(1006);
               break;
            case §1t112s0§.§1t12558s0§:
               _loc8_ = §1t1521s0§.getString(1022);
               break;
            case §1t112s0§.§1t12552s0§:
               _loc8_ = §1t1521s0§.getString(1020);
               break;
            case §1t112s0§.§1t12563s0§:
               _loc8_ = §1t1521s0§.getString(1021);
         }
         return _loc6_ + _loc7_ + " " + _loc8_;
      }
      
      public function §1t1154s0§(param1:int) : String
      {
         var _loc2_:Point = this.§1t1133s0§(param1);
         var _loc3_:Point = this.§1t1135s0§(param1);
         return §1t1521s0§.getString(557) + "(" + (_loc2_.x - 341 + §1t7934s0§.§1t12538s0§) + "," + (_loc2_.y - 341 + §1t7934s0§.§1t12539s0§) + ") " + §1t1521s0§.getString(319) + "(" + _loc3_.x + "," + _loc3_.y + ")";
      }
      
      public function §1t1155s0§(param1:int, param2:int) : String
      {
         var _loc4_:§1t134s0§ = null;
         var _loc3_:String = §1t1524s0§.§1t9886s0§(param1).§1t1153s0§();
         if(param2 != 0 && param2 != -1)
         {
            _loc4_ = §1t1524s0§.§1t9886s0§(param1).§1t1186s0§()[param2];
            if(_loc4_ != null && _loc3_ != _loc4_.§1t1382s0§())
            {
               _loc3_ += ", " + _loc4_.§1t1382s0§();
            }
         }
         return _loc3_;
      }
      
      public function §1t1156s0§(param1:int) : Array
      {
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc2_:§1t72s0§ = §1t1524s0§.§1t9885s0§(param1);
         if(_loc2_ == null || _loc2_.§1t1175s0§ || _loc2_.overwrite == §1t72s0§.§1t9193s0§ || _loc2_.overwrite == §1t72s0§.§1t9195s0§ || _loc2_.overwrite == §1t72s0§.§1t9194s0§)
         {
            _loc3_ = this.§1t1133s0§(param1);
            _loc4_ = this.§1t1135s0§(param1);
            return this.§1t1126s0§(_loc3_.x,_loc3_.y).§1t1156s0§(_loc4_.x,_loc4_.y);
         }
         return _loc2_.§1t1156s0§();
      }
      
      public function §1t1157s0§(param1:Array) : Boolean
      {
         var _loc2_:int = param1[§1t9128s0§] + param1[§1t9129s0§];
         var _loc3_:int = param1[§1t9130s0§] + param1[§1t9131s0§];
         if(_loc2_ == 2 && _loc3_ != 2)
         {
            return true;
         }
         if(_loc3_ == 0 && _loc2_ == 1)
         {
            return true;
         }
         if(_loc2_ == 1 && _loc3_ == 1)
         {
            return false;
         }
         return false;
      }
      
      internal function §1t1158s0§(param1:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = param1[§1t9128s0§] + param1[§1t9129s0§] + param1[§1t9130s0§] + param1[§1t9131s0§];
         if(_loc2_ == 2)
         {
            _loc3_ = param1[§1t9128s0§] + param1[§1t9129s0§];
            _loc4_ = param1[§1t9130s0§] + param1[§1t9131s0§];
            if(_loc3_ == 2 || _loc4_ == 2)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function §1t1159s0§(param1:Array) : Boolean
      {
         var _loc2_:int = param1[§1t9128s0§] + param1[§1t9129s0§] + param1[§1t9130s0§] + param1[§1t9131s0§];
         return _loc2_ == 1;
      }
      
      public function §1t1160s0§(param1:int) : int
      {
         return 800 + §1t58s0§.§1t8806s0§(param1,3,800);
      }
      
      internal function §1t1161s0§(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = (param1 >> 12 & 0x0FFF) + param2;
         var _loc5_:int = (param1 & 0x0FFF) + param3;
         if(_loc4_ < 0 || _loc4_ > 4094 || _loc5_ < 0 || _loc5_ > 4094)
         {
            return -1;
         }
         return _loc4_ << 12 | _loc5_;
      }
      
      internal function §1t1162s0§(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = (param1 >> 8 & 0xFF) + param2;
         var _loc5_:int = (param1 & 0xFF) + param3;
         return _loc4_ << 8 | _loc5_;
      }
      
      public function §1t1163s0§(param1:int, param2:Boolean) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!param2)
         {
            _loc3_ = §1t58s0§.random(4,param1 * 2);
            if(_loc3_ == 0)
            {
               return 2;
            }
            if(_loc3_ == 1)
            {
               return 3;
            }
            if(_loc3_ == 2)
            {
               return 4;
            }
            if(_loc3_ == 3)
            {
               return 5;
            }
            return;
         }
         _loc4_ = this.§1t1139s0§(param1);
         if(_loc4_ < 30)
         {
            return 6;
         }
         if(_loc4_ < 60)
         {
            return 7;
         }
         return 8;
      }
      
      public function §1t1164s0§(param1:int) : uint
      {
         var _loc2_:uint = uint(§1t58s0§.random(10,param1));
         if(_loc2_ == 0 || _loc2_ > 4)
         {
            _loc2_ = §1t1643s0§.§1t11224s0§(param1);
         }
         return _loc2_;
      }
   }
}

