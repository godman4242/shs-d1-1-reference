package
{
   import flash.geom.Point;
   
   public class §1t123s0§
   {
      
      public static var instance:§1t123s0§;
      
      public static var §1t11210s0§:int = 10;
      
      public static var §1t11211s0§:int = -1;
      
      public static var §1t11212s0§:int = -2;
      
      internal var §1t1563s0§:int;
      
      internal var §1t1564s0§:int;
      
      internal var §1t1565s0§:int;
      
      internal var §1t1566s0§:int;
      
      internal var §1t1567s0§:int;
      
      internal var §1t1568s0§:int;
      
      internal var §1t1569s0§:int;
      
      internal var §1t1570s0§:int;
      
      internal var §1t1571s0§:Array = [3000,3001,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13010,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13121,13124,13125,13126,13127,13128,13200,13201,13202,13203,13204,13205,13206,13207,13208];
      
      internal var §1t1572s0§:Array = [3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13130,13131,13133,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13209,13210,13211,13212,13213,13214,13215,13216];
      
      internal var §1t1573s0§:Array = [3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13156,13157,13159,13160,13161,13162,13163,13164,13165,13166,13167,13168,13169,13170,13171,13172,13173,13174,13175,13176,13177,13178,13179,13180,13181,13217,13218,13219,13223,13224,13225,13226,13227];
      
      internal var §1t1575s0§:Array = [16711680,16737792,16763904,39168,13311,6684927,16751103,6697728,16777215,10066329,0];
      
      internal var §1t1605s0§:Array = [§1t1521s0§.getString(11232),§1t1521s0§.getString(11233),§1t1521s0§.getString(11234),§1t1521s0§.getString(11235),§1t1521s0§.getString(11236),§1t1521s0§.getString(11237)];
      
      public function §1t123s0§()
      {
         super();
         if(instance != null)
         {
            return;
         }
         instance = this;
      }
      
      public static function §1t9190s0§() : §1t123s0§
      {
         if(instance == null)
         {
            new §1t123s0§();
         }
         return instance;
      }
      
      public static function destroy() : *
      {
         §1t123s0§.instance = null;
      }
      
      public function §1t1574s0§(param1:int, param2:int, param3:int = 0, param4:Boolean = false) : §1t17s0§
      {
         var _loc5_:§1t58s0§ = null;
         var _loc6_:int = 0;
         if(!param4)
         {
            _loc5_ = §1t58s0§.§1t8804s0§(param1 / param2 + §1t1523s0§.§1t9532s0§() + param3);
         }
         else
         {
            _loc5_ = §1t58s0§.§1t8804s0§(param1 / param2 + §1t1523s0§.§1t9532s0§() * 2 + param3);
         }
         var _loc7_:int = §1t70s0§.instance.§1t1139s0§(param1);
         if(_loc7_ < 30)
         {
            _loc6_ = int(this.§1t1571s0§[_loc5_.rand(this.§1t1571s0§.length)]);
         }
         else if(_loc7_ < 60)
         {
            _loc6_ = int(this.§1t1572s0§[_loc5_.rand(this.§1t1572s0§.length)]);
         }
         else
         {
            _loc6_ = int(this.§1t1573s0§[_loc5_.rand(this.§1t1573s0§.length)]);
         }
         §1t1644s0§.instance.§1t1658s0§(_loc5_.§1t780s0§());
         var _loc8_:§1t17s0§ = §1t1644s0§.instance.§1t1665s0§(_loc6_,_loc7_,true);
         §1t1644s0§.instance.§1t1660s0§();
         _loc8_.§1t537s0§();
         _loc5_.destroy();
         return _loc8_;
      }
      
      public function §1t1576s0§(param1:int) : §1t17s0§
      {
         var _loc4_:int = 0;
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1);
         var _loc3_:int = _loc2_.rand(3);
         if(_loc3_ == 0)
         {
            _loc4_ = 2122;
         }
         else if(_loc3_ == 1)
         {
            _loc4_ = 2123;
         }
         else if(_loc3_ == 2)
         {
            _loc4_ = 2124;
         }
         var _loc5_:int = _loc2_.rand(11);
         var _loc6_:uint = uint(this.§1t1575s0§[_loc5_]);
         var _loc7_:int = _loc2_.rand(§1t1644s0§.instance.§1t1654s0§);
         var _loc8_:§1t17s0§ = new §1t17s0§(_loc4_);
         _loc8_.§1t529s0§(_loc6_);
         _loc8_.§1t493s0§(85,_loc7_);
         _loc2_.destroy();
         return _loc8_;
      }
      
      public function §1t1577s0§(param1:int, param2:int) : §1t17s0§
      {
         var _loc3_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * param2);
         var _loc4_:int = 2148;
         var _loc5_:int = _loc3_.rand(11);
         var _loc6_:uint = uint(this.§1t1575s0§[_loc5_]);
         var _loc7_:int = _loc3_.rand(§1t1644s0§.instance.§1t1654s0§);
         var _loc8_:§1t17s0§ = new §1t17s0§(_loc4_);
         _loc8_.§1t529s0§(_loc6_);
         _loc8_.§1t493s0§(85,_loc7_);
         _loc3_.destroy();
         return _loc8_;
      }
      
      public function §1t1578s0§(param1:int, param2:int, param3:int, param4:int, param5:§1t17s0§ = null) : §1t17s0§
      {
         var _loc7_:§1t17s0§ = null;
         var _loc9_:int = 0;
         var _loc6_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * (param3 + 4));
         var _loc8_:Point = §1t70s0§.instance.§1t1136s0§(param1);
         _loc8_.x += _loc6_.rand(6) - 12;
         _loc8_.y += _loc6_.rand(6) - 12;
         _loc7_ = this.§1t1574s0§(_loc8_.x << 12 | _loc8_.y,param4);
         if(param5 == null)
         {
            param5 = this.§1t1587s0§(param1,param2,param3,param4).§1t2217s0§();
         }
         if(_loc7_.§1t513s0§() == param5.§1t513s0§())
         {
            _loc9_ = _loc6_.rand(10);
            if(_loc9_ == 0)
            {
               _loc7_ = new §1t17s0§(20054,5);
            }
            else if(_loc9_ == 1)
            {
               _loc7_ = new §1t17s0§(20055);
            }
            else if(_loc9_ == 2)
            {
               _loc7_ = new §1t17s0§(20056,5);
            }
            else if(_loc9_ == 3)
            {
               _loc7_ = new §1t17s0§(20057);
            }
            else if(_loc9_ == 4)
            {
               _loc7_ = new §1t17s0§(20060);
            }
            else if(_loc9_ == 5)
            {
               _loc7_ = new §1t17s0§(20061);
            }
            else if(_loc9_ == 6)
            {
               _loc7_ = new §1t17s0§(20062);
            }
            else if(_loc9_ == 7)
            {
               _loc7_ = new §1t17s0§(20063);
            }
            else if(_loc9_ == 8)
            {
               _loc7_ = new §1t17s0§(20064);
            }
            else if(_loc9_ == 9)
            {
               _loc7_ = new §1t17s0§(20065);
            }
         }
         _loc6_.destroy();
         return _loc7_;
      }
      
      public function §1t1579s0§(param1:§1t17s0§) : String
      {
         var _loc4_:String = null;
         var _loc2_:§1t76s0§ = this.§1t1581s0§(param1.§1t526s0§(85),param1.§1t526s0§(86),param1.§1t526s0§(87),param1.§1t526s0§(88));
         var _loc3_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1.§1t483s0§());
         if(_loc3_ == null)
         {
            _loc4_ = "?";
         }
         if(param1.§1t526s0§(88) != §1t3317s0§.instance.§1t1848s0§())
         {
            _loc4_ = §1t1521s0§.getString(903,[§1t1521s0§.getString(_loc3_.§1t891s0§)]);
         }
         else
         {
            _loc4_ = §1t1521s0§.getString(_loc3_.§1t891s0§);
         }
         return _loc4_ + " " + §1t1521s0§.getString(447,[_loc2_.§1t509s0§()]);
      }
      
      public function §1t1580s0§(param1:§1t17s0§) : String
      {
         var _loc3_:String = null;
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1.§1t483s0§());
         if(_loc2_ == null)
         {
            return "?";
         }
         return §1t1521s0§.getString(_loc2_.§1t891s0§);
      }
      
      public function §1t1581s0§(param1:int, param2:int, param3:int, param4:int) : §1t76s0§
      {
         var _loc5_:§1t76s0§ = new §1t76s0§(null);
         _loc5_.§1t1249s0§(param1,param2,param3,param4);
         return _loc5_;
      }
      
      public function §1t1582s0§(param1:int, param2:int, param3:int, param4:int, param5:Boolean = false) : String
      {
         var _loc6_:§1t76s0§ = new §1t76s0§(null);
         _loc6_.§1t1249s0§(param1,param2,param3,param4,param5);
         return _loc6_.§1t509s0§();
      }
      
      public function §1t1583s0§(param1:int, param2:int, param3:int) : §1t76s0§
      {
         var _loc4_:§1t76s0§ = new §1t76s0§(null);
         _loc4_.§1t1249s0§(param1,param2,§1t11210s0§,param3,true);
         return _loc4_;
      }
      
      public function §1t1584s0§(param1:int, param2:int, param3:int) : §1t124s0§
      {
         var _loc4_:Point = this.§1t1133s0§(param1);
         switch(param2)
         {
            case -1:
               break;
            case 0:
               --_loc4_.y;
               break;
            case 1:
               ++_loc4_.y;
               break;
            case 3:
               ++_loc4_.x;
               break;
            case 4:
               --_loc4_.x;
         }
         if(!§1t1524s0§.§1t7976s0§(_loc4_.x,_loc4_.y))
         {
            _loc4_ = this.§1t1133s0§(param1);
         }
         var _loc5_:§1t71s0§ = §1t70s0§.instance.§1t1126s0§(_loc4_.x,_loc4_.y);
         var _loc6_:int = _loc5_.§1t1310s0§();
         return new §1t124s0§(this.§1t1577s0§(_loc6_,param3),_loc6_);
      }
      
      public function §1t1585s0§(param1:int, param2:int, param3:int) : §1t124s0§
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:§1t71s0§ = null;
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:int = 0;
         var _loc4_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * param3 + (param2 + 6) * 5);
         var _loc5_:Point = this.§1t1133s0§(param1);
         switch(_loc4_.rand(6))
         {
            case 0:
               --_loc5_.y;
               break;
            case 1:
               --_loc5_.x;
               break;
            case 2:
            case 5:
               break;
            case 3:
               ++_loc5_.x;
               break;
            case 4:
               ++_loc5_.y;
         }
         if(!§1t1524s0§.§1t7976s0§(_loc5_.x,_loc5_.y))
         {
            _loc5_ = this.§1t1133s0§(param1);
         }
         if(_loc4_.rand(2) == 0)
         {
            _loc9_ = _loc5_.x * 6 + _loc4_.rand(6);
            _loc10_ = _loc5_.y * 6 + _loc4_.rand(6);
            _loc6_ = _loc9_ << 12 | _loc10_;
            _loc7_ = 0;
         }
         else
         {
            _loc11_ = §1t70s0§.instance.§1t1126s0§(_loc5_.x,_loc5_.y);
            if(!_loc11_.§1t1293s0§() || _loc11_.§1t1328s0§())
            {
               _loc5_ = this.§1t1133s0§(param1);
               _loc11_ = §1t70s0§.instance.§1t1126s0§(_loc5_.x,_loc5_.y);
            }
            _loc12_ = _loc11_.§1t1329s0§();
            _loc12_ = _loc12_.concat(_loc11_.§1t1330s0§());
            if(_loc11_.§1t1319s0§() != -1 && _loc11_.§1t1319s0§() != param1)
            {
               _loc12_.push(_loc11_.§1t1319s0§());
            }
            if(_loc11_.§1t1306s0§() != -1)
            {
               _loc12_.push(_loc11_.§1t1306s0§());
            }
            _loc6_ = int(_loc12_[_loc4_.rand(_loc12_.length)]);
         }
         var _loc8_:Array = §1t70s0§.instance.§1t1148s0§(_loc6_);
         if(_loc8_.length > 1 && §1t70s0§.instance.§1t1149s0§(_loc6_) != §1t70s0§.§1t9148s0§)
         {
            _loc13_ = int(_loc8_.length);
            _loc14_ = new Array();
            _loc15_ = 0;
            while(_loc15_ < _loc13_)
            {
               if(_loc8_[_loc15_] != null)
               {
                  _loc14_.push(_loc8_[_loc15_]);
               }
               _loc15_++;
            }
            _loc16_ = _loc4_.rand(_loc14_.length);
            _loc7_ = int(_loc14_[_loc16_].roomid);
         }
         _loc4_.destroy();
         return new §1t124s0§(this.§1t1574s0§(_loc6_,param3,_loc7_,true),_loc6_,_loc7_);
      }
      
      public function §1t1586s0§(param1:int, param2:int, param3:int, param4:int, param5:Boolean = false) : §1t124s0§
      {
         var _loc6_:§1t58s0§ = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(param5)
         {
            _loc6_ = §1t58s0§.§1t8804s0§((param1 * param4 + param2 * (param3 + 5)) * 3);
         }
         else
         {
            _loc6_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * (param3 + 2));
         }
         if(param3 == §1t11210s0§)
         {
            return this.§1t1585s0§(param1,param2,param4);
         }
         var _loc7_:Point = this.§1t1133s0§(param1);
         switch(_loc6_.rand(7))
         {
            case 0:
               --_loc7_.y;
               break;
            case 1:
               --_loc7_.x;
               break;
            case 2:
            case 5:
            case 6:
               break;
            case 3:
               ++_loc7_.x;
               break;
            case 4:
               ++_loc7_.y;
         }
         if(!§1t1524s0§.§1t7976s0§(_loc7_.x,_loc7_.y))
         {
            _loc7_ = this.§1t1133s0§(param1);
         }
         var _loc8_:§1t71s0§ = §1t70s0§.instance.§1t1126s0§(_loc7_.x,_loc7_.y);
         if(!_loc8_.§1t1293s0§() || _loc8_.§1t1328s0§())
         {
            _loc7_ = this.§1t1133s0§(param1);
            _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc7_.x,_loc7_.y);
         }
         var _loc9_:int = _loc8_.§1t1319s0§();
         var _loc10_:Array = _loc8_.§1t1329s0§();
         var _loc11_:Array = _loc8_.§1t1332s0§();
         if(!param5)
         {
            _loc13_ = _loc6_.rand(6);
            if(_loc13_ == 0)
            {
               _loc14_ = 0;
            }
            else if(_loc13_ == 1 || _loc13_ == 2)
            {
               _loc14_ = 1;
            }
            else if(_loc8_.§1t1311s0§() && _loc13_ == 3)
            {
               _loc14_ = 3;
            }
            else
            {
               _loc14_ = 1;
            }
         }
         else
         {
            _loc13_ = _loc6_.rand(5);
            if(_loc13_ == 0)
            {
               _loc14_ = 0;
            }
            else if(_loc13_ == 1)
            {
               _loc14_ = 1;
            }
            else if(_loc8_.§1t1311s0§() && _loc13_ == 2)
            {
               _loc14_ = 3;
            }
            else
            {
               _loc14_ = 1;
            }
         }
         if(_loc14_ == 0)
         {
            _loc12_ = int(_loc11_[_loc6_.rand(_loc11_.length)]);
         }
         else if(_loc14_ == 1)
         {
            _loc12_ = int(_loc10_[_loc6_.rand(_loc10_.length)]);
         }
         else if(_loc14_ == 3)
         {
            _loc12_ = _loc8_.§1t1310s0§();
         }
         var _loc15_:§1t124s0§ = this.§1t1588s0§(_loc14_,_loc12_,param4,_loc6_,param1,param2,param3);
         if(_loc15_ == null)
         {
            _loc14_ = 1;
            _loc12_ = int(_loc10_[_loc6_.rand(_loc10_.length)]);
            _loc15_ = this.§1t1588s0§(_loc14_,_loc12_,param4,_loc6_,param1,param2,param3);
         }
         _loc6_.destroy();
         return _loc15_;
      }
      
      public function §1t1587s0§(param1:int, param2:int, param3:int, param4:int) : §1t124s0§
      {
         return this.§1t1586s0§(param1,param2,param3,param4,true);
      }
      
      internal function §1t1588s0§(param1:int, param2:int, param3:int, param4:§1t58s0§, param5:int, param6:int, param7:int) : §1t124s0§
      {
         if(param1 == 0)
         {
            return new §1t124s0§(this.§1t1576s0§(param2),param2);
         }
         if(param1 == 1)
         {
            return new §1t124s0§(this.§1t1574s0§(param2,param3),param2);
         }
         if(param1 == 2)
         {
            return this.§1t1589s0§(param2,param3,param4,param5,param6,param7);
         }
         if(param1 == 3)
         {
            return new §1t124s0§(this.§1t1577s0§(param2,param3),param2);
         }
         return null;
      }
      
      internal function §1t1589s0§(param1:int, param2:int, param3:§1t58s0§, param4:int, param5:int, param6:int) : §1t124s0§
      {
         var _loc7_:Array = §1t70s0§.instance.§1t1148s0§(param1);
         var _loc8_:int = int(_loc7_.length);
         var _loc9_:* = new Array();
         var _loc10_:* = 1;
         while(_loc10_ < _loc8_)
         {
            if(_loc7_[_loc10_] != null && _loc7_[_loc10_].roomid % 3 == 0 && this.§1t1590s0§(param1,_loc7_[_loc10_].roomid,param2) > 0)
            {
               _loc9_.push(_loc7_[_loc10_]);
            }
            _loc10_++;
         }
         if(_loc9_.length == 0)
         {
            return null;
         }
         var _loc11_:int = param3.rand(_loc9_.length);
         var _loc12_:int = int(_loc9_[_loc11_].roomid);
         var _loc13_:int = 0;
         if(param4 == param1 && param5 == _loc12_ && param6 == _loc13_)
         {
            if(_loc9_.length == 1)
            {
               return null;
            }
            if(++_loc11_ >= _loc9_.length)
            {
               _loc11_ = 0;
            }
            _loc12_ = int(_loc9_[_loc11_].roomid);
            _loc13_ = param3.rand(this.§1t1590s0§(param1,_loc12_,param2));
         }
         return new §1t124s0§(this.§1t1578s0§(param1,_loc12_,_loc13_,param2),param1,_loc12_,_loc13_);
      }
      
      public function §1t1590s0§(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = param1 + param2 * param3;
         if(param2 < 14)
         {
            return §1t58s0§.random(2,_loc4_);
         }
         if(param2 < 100)
         {
            return 0;
         }
         if(param2 == 100 || param2 == 110 || param2 == 111)
         {
            return §1t58s0§.random(2,_loc4_);
         }
         return 0;
      }
      
      internal function §1t1133s0§(param1:int) : Point
      {
         var _loc2_:int = param1 >> 12 & 0x0FFF;
         var _loc3_:int = param1 & 0x0FFF;
         var _loc4_:int = Math.floor(_loc2_ / 6);
         var _loc5_:int = Math.floor(_loc3_ / 6);
         return new Point(_loc4_,_loc5_);
      }
      
      public function §1t827s0§(param1:Boolean) : int
      {
         var _loc2_:§1t60s0§ = §1t1523s0§.§1t9571s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§,param1);
         if(_loc2_ != null && _loc2_.§1t827s0§(param1))
         {
            return 1;
         }
         return 0;
      }
      
      public function §1t1591s0§(param1:§1t60s0§) : Boolean
      {
         var _loc2_:§1t17s0§ = null;
         if(param1.§1t807s0§ == §1t1799s0§.§1t11439s0§)
         {
            _loc2_ = this.§1t1584s0§(param1.nodeid,param1.§1t809s0§,param1.date).§1t2217s0§();
         }
         else
         {
            _loc2_ = this.§1t1586s0§(param1.nodeid,param1.roomid,param1.§1t802s0§,param1.date,param1.§1t818s0§()).§1t2217s0§();
         }
         if(§1t1523s0§.§1t9701s0§(_loc2_) == null)
         {
            if(§1t1523s0§.§1t9700s0§(_loc2_) != null)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      public function §1t1592s0§(param1:Boolean) : Boolean
      {
         var _loc2_:§1t17s0§ = this.§1t1586s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§,param1).§1t2217s0§();
         if(§1t1523s0§.§1t9701s0§(_loc2_) == null)
         {
            if(§1t1523s0§.§1t9700s0§(_loc2_) != null)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      public function §1t1593s0§(param1:Boolean) : *
      {
         var _loc2_:§1t17s0§ = this.§1t1586s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§,param1).§1t2217s0§();
         §1t1523s0§.§1t7692s0§(_loc2_);
         if(param1)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6185s0§(this.§1t1578s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§));
            §1t1523s0§.§1t9569s0§();
         }
      }
      
      public function §1t1594s0§(param1:Boolean) : *
      {
         if(param1)
         {
            this.§1t1567s0§ = §1t1799s0§.§1t11447s0§;
         }
         var _loc2_:int = §1t1523s0§.§1t9568s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§,this.§1t1567s0§,this.§1t1568s0§,this.§1t1569s0§,this.§1t1570s0§);
         if(_loc2_ != -1)
         {
            §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9681s0§);
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9427s0§,_loc2_);
            §1t3317s0§.instance.§1t1946s0§();
            §1t406s0§.instance.§1t6456s0§.§1t4235s0§();
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(195),§1t1521s0§.getString(5));
         }
      }
      
      public function §1t1595s0§() : *
      {
         §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9427s0§,-1);
         §1t406s0§.instance.§1t6456s0§.§1t4235s0§();
      }
      
      public function §1t1596s0§() : Boolean
      {
         var _loc1_:int = §1t1523s0§.§1t9569s0§();
         if(_loc1_ != -1)
         {
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9427s0§,_loc1_);
            §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9681s0§);
            §1t3317s0§.instance.§1t1946s0§();
            §1t406s0§.instance.§1t6456s0§.§1t4235s0§();
            return true;
         }
         return false;
      }
      
      public function getMarkedNode() : int
      {
         var _loc2_:§1t60s0§ = null;
         var _loc1_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9427s0§);
         if(_loc1_ == -1)
         {
            return -1;
         }
         if(_loc1_ >= §1t1523s0§.§1t9373s0§.length)
         {
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9427s0§,-1);
            return -1;
         }
         _loc2_ = §1t1523s0§.§1t9373s0§[_loc1_];
         if(_loc2_.§1t814s0§())
         {
            return -1;
         }
         return _loc2_.getMarkedNode();
      }
      
      public function §1t821s0§(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         var _loc5_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9427s0§);
         if(_loc5_ == -1)
         {
            return false;
         }
         if(_loc5_ >= §1t1523s0§.§1t9373s0§.length)
         {
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9427s0§,-1);
            return false;
         }
         return §1t1523s0§.§1t9373s0§[_loc5_].§1t821s0§(param1,param2,param3,param4);
      }
      
      private function §1t1597s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int = -1, param7:int = -1, param8:int = -1) : *
      {
         this.§1t1563s0§ = param1;
         this.§1t1564s0§ = param2;
         this.§1t1565s0§ = param3;
         this.§1t1566s0§ = param4;
         this.§1t1567s0§ = param5;
         this.§1t1568s0§ = param6;
         this.§1t1569s0§ = param7;
         this.§1t1570s0§ = param8;
      }
      
      public function §1t1598s0§(param1:Boolean) : *
      {
         §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9427s0§,-1);
         §1t1523s0§.§1t1598s0§(-1,true,param1);
         §1t406s0§.instance.§1t6456s0§.§1t4235s0§();
         if(param1)
         {
            this.§1t1596s0§();
         }
      }
      
      public function §1t1599s0§(param1:Boolean) : §1t125s0§
      {
         var _loc2_:§1t125s0§ = new §1t125s0§(-1);
         _loc2_.§1t1113s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§,param1);
         return _loc2_;
      }
      
      public function §1t1600s0§(param1:Boolean) : String
      {
         if(§1t1523s0§.§1t9564s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§,param1))
         {
            return "0";
         }
         if(§1t1523s0§.§1t9373s0§.length == §1t1523s0§.§1t9399s0§ && !§1t1523s0§.§1t817s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§,param1))
         {
            return "0";
         }
         return "1";
      }
      
      public function §1t1601s0§(param1:Boolean) : §1t17s0§
      {
         if(this.§1t1567s0§ == §1t1799s0§.§1t11439s0§)
         {
            return this.§1t1584s0§(this.§1t1563s0§,this.§1t1570s0§,this.§1t1566s0§).§1t2217s0§();
         }
         return this.§1t1586s0§(this.§1t1563s0§,this.§1t1564s0§,this.§1t1565s0§,this.§1t1566s0§,param1).§1t2217s0§();
      }
      
      public function §1t1602s0§(param1:int, param2:int, param3:int, param4:int) : §1t69s0§
      {
         var _loc5_:int = 0;
         var _loc6_:§1t71s0§ = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:§1t1799s0§ = null;
         if(param3 == 0 && param2 % 3 == 0)
         {
            return this.§1t1604s0§(param1,param2,param3,param4,§1t1799s0§.§1t11446s0§);
         }
         if(param3 == 10)
         {
            return this.§1t1604s0§(param1,param2,param3,param4,§1t1799s0§.§1t11448s0§);
         }
         _loc6_ = §1t70s0§.instance.§1t1127s0§(§1t70s0§.instance.§1t1134s0§(param1));
         if(_loc6_ == null)
         {
            return null;
         }
         _loc7_ = _loc6_.§1t1346s0§();
         if(_loc7_.length > 0)
         {
            _loc8_ = param1 * param4 + param2 * (param3 + 311);
            _loc9_ = _loc7_[§1t58s0§.random(_loc7_.length,_loc8_)];
            return this.§1t1604s0§(param1,param2,param3,param4,_loc9_.§1t807s0§,_loc9_.reason,_loc9_.§1t810s0§,_loc9_.§1t1800s0§);
         }
         return this.§1t1604s0§(param1,param2,param3,param4,§1t1799s0§.§1t11446s0§);
      }
      
      public function §1t1603s0§(param1:int, param2:int, param3:int, param4:int) : §1t69s0§
      {
         var _loc5_:int = param1 * param4 + param2 * (param3 + 311);
         var _loc6_:int = §1t58s0§.random(3,_loc5_);
         if(_loc6_ == 0)
         {
            return this.§1t1604s0§(param1,param2,param3,param4,§1t1799s0§.§1t11444s0§,§1t1799s0§.§1t11468s0§);
         }
         if(_loc6_ == 1)
         {
            return this.§1t1604s0§(param1,param2,param3,param4,§1t1799s0§.§1t11445s0§,§1t1799s0§.§1t11468s0§);
         }
         return this.§1t1604s0§(param1,param2,param3,param4,§1t1799s0§.§1t11446s0§,§1t1799s0§.§1t11468s0§);
      }
      
      public function §1t1604s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int = -1, param7:int = -1, param8:int = -1) : §1t69s0§
      {
         if(param5 == §1t1799s0§.§1t11446s0§ || param5 == §1t1799s0§.§1t11447s0§)
         {
            return this.§1t1606s0§(param1,param2,param3,param4,param6);
         }
         if(param5 == §1t1799s0§.§1t11448s0§)
         {
            return this.§1t1607s0§(param1,param2,param4);
         }
         if(param5 == §1t1799s0§.§1t11433s0§)
         {
            return this.§1t1608s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11434s0§)
         {
            return this.§1t1609s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11435s0§)
         {
            return this.§1t1610s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11436s0§)
         {
            return this.§1t1611s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11438s0§ || param5 == §1t1799s0§.§1t11437s0§)
         {
            return this.§1t1612s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11449s0§)
         {
            return this.§1t1613s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11439s0§)
         {
            return this.§1t1614s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11441s0§)
         {
            return this.§1t1615s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11440s0§)
         {
            return this.§1t1616s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11442s0§)
         {
            return this.§1t1617s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11443s0§)
         {
            return this.§1t1618s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11444s0§)
         {
            return this.§1t1619s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         if(param5 == §1t1799s0§.§1t11445s0§)
         {
            return this.§1t1620s0§(param1,param2,param3,param4,param6,param7,param8);
         }
         return this.§1t1606s0§(param1,param2,param3,param4);
      }
      
      public function §1t1606s0§(param1:int, param2:int, param3:int, param4:int, param5:int = -1) : §1t69s0§
      {
         var _loc6_:§1t85s0§ = new §1t85s0§(null);
         _loc6_.nodeID = param1;
         _loc6_.action = 0;
         _loc6_.title = "Town Quest";
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11446s0§,param5);
         var _loc7_:String = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         var _loc8_:§1t124s0§ = this.§1t1586s0§(param1,param2,param3,param4);
         var _loc9_:§1t17s0§ = _loc8_.§1t2217s0§();
         var _loc10_:String = _loc8_.§1t2220s0§(false);
         var _loc11_:§1t124s0§ = this.§1t1587s0§(param1,param2,param3,param4);
         var _loc12_:§1t17s0§ = _loc11_.§1t2217s0§();
         var _loc13_:String = _loc11_.§1t2220s0§(true);
         var _loc14_:§1t17s0§ = this.§1t1578s0§(param1,param2,param3,param4,_loc12_);
         var _loc15_:int = §1t70s0§.instance.§1t1139s0§(param1);
         var _loc16_:int = (§1t1523s0§.§1t5928s0§(_loc15_ + 1) - §1t1523s0§.§1t5928s0§(_loc15_)) / ((_loc15_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc16_ = 0;
         }
         var _loc17_:int = _loc15_ * 5;
         var _loc18_:int = _loc16_ / 4;
         var _loc19_:int = 10;
         if(_loc9_.§1t500s0§())
         {
            _loc16_ /= 2;
            _loc19_ = 5;
         }
         if(_loc12_.§1t500s0§())
         {
            _loc18_ /= 2;
         }
         var _loc20_:String = §1t1521s0§.getString(11256,[_loc9_.§1t510s0§()]);
         var _loc21_:String = §1t1521s0§.getString(11257,[_loc14_.§1t512s0§(),_loc12_.§1t510s0§()]);
         var _loc22_:String = "<intro>";
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11254) + "</text><gotolabel>trade</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(true) + "</condition></choice>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc22_ = _loc22_ + "<label>quest</label>";
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc20_ + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc10_ + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11240,[_loc9_.§1t510s0§()]) + "</text>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11241,[_loc9_.§1t513s0§()]) + "</text><gotolabel>completequest</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11242) + "</text><gotolabel>acceptquest</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc22_ = _loc22_ + "<label>completequest</label>";
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11244) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc16_ + "</modify><end>0</end></outcome>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc17_ + "</modify><end>0</end></outcome>");
         if(param5 != §1t1799s0§.§1t11468s0§)
         {
            _loc22_ += "<outcome><id>" + 50007 + "</id><modify>" + _loc19_ + "</modify><end>0</end></outcome>";
         }
         _loc22_ += "<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>";
         _loc22_ = _loc22_ + ("<outcome><id>" + 91 + "</id><modify>" + -1 + "</modify><end>1</end></outcome>");
         _loc22_ = _loc22_ + "<label>acceptquest</label>";
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11245) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc22_ = _loc22_ + "<outcome><end>-1</end></outcome>";
         _loc22_ = _loc22_ + "<label>trade</label>";
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11246) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc21_ + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc13_ + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11247,[_loc12_.§1t510s0§()]) + "</text>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11241,[_loc12_.§1t513s0§()]) + "</text><gotolabel>completetrade</gotolabel><condition><has><id>" + 92 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11248) + "</text><gotolabel>accepttrade</gotolabel><condition><has><id>" + 92 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11249) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc22_ = _loc22_ + "<label>completetrade</label>";
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11250) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc18_ + "</modify><end>0</end></outcome>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 92 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 92 + "</id><modify>" + -1 + "</modify><end>1</end></outcome>");
         _loc22_ = _loc22_ + "<label>accepttrade</label>";
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11245) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 92 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc22_ = _loc22_ + "<outcome><end>-1</end></outcome>";
         _loc22_ = _loc22_ + "<label>leave</label>";
         _loc22_ = _loc22_ + "<outcome><end>-1</end></outcome>";
         _loc22_ = _loc22_ + "</intro>";
         _loc6_.intro = _loc6_.§1t1403s0§(XMLList(_loc22_));
         var _loc23_:String = "";
         _loc23_ = _loc23_ + "<step>";
         _loc23_ = _loc23_ + ("<node>" + _loc8_.nodeid + "</node>");
         _loc23_ = _loc23_ + "<action>0</action>";
         _loc23_ = _loc23_ + ("<roomobj><room>" + _loc8_.roomid + "</room><id>-1</id></roomobj>");
         _loc23_ = _loc23_ + "</step>";
         var _loc24_:§1t85s0§ = new §1t85s0§(XML(_loc23_));
         var _loc25_:String = "<reward>";
         _loc25_ = _loc25_ + ("<exp>" + _loc16_ + "</exp>");
         _loc25_ = _loc25_ + ("<loot><id>" + 0 + "</id><qty>" + _loc17_ + "</qty></loot>");
         _loc25_ = _loc25_ + ("<loot><itemcode>" + _loc9_.§1t490s0§() + "</itemcode><qty>" + -1 + "</qty></loot>");
         if(param5 != §1t1799s0§.§1t11468s0§)
         {
            _loc25_ += "<loot><id>" + 50007 + "</id><qty>" + _loc19_ + "</qty></loot>";
         }
         _loc25_ += "</reward>";
         _loc24_.§1t1260s0§(new §1t77s0§(XMLList(_loc25_)));
         _loc24_.title = §1t1521s0§.getString(11251,[_loc9_.§1t513s0§(),_loc7_]);
         var _loc26_:String = "";
         _loc26_ = _loc26_ + "<step>";
         _loc26_ = _loc26_ + ("<node>" + param1 + "</node>");
         _loc26_ = _loc26_ + "<action>0</action>";
         _loc26_ = _loc26_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc26_ = _loc26_ + "</step>";
         var _loc27_:§1t85s0§ = new §1t85s0§(XML(_loc26_));
         _loc27_.title = §1t1521s0§.getString(11251,[_loc9_.§1t513s0§(),_loc7_]);
         _loc22_ = "<intro>";
         _loc22_ = _loc22_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11240,[_loc9_.§1t510s0§()]) + "</text>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11241,[_loc9_.§1t513s0§()]) + "</text><goto>3</goto><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><goto>5</goto></choice></option>");
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11244) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc22_ = _loc22_ + "<outcome><end>-1</end></outcome>";
         _loc22_ = _loc22_ + "</intro>";
         _loc27_.intro = _loc27_.§1t1403s0§(XMLList(_loc22_));
         _loc27_.§1t1260s0§(new §1t77s0§(XMLList(_loc25_)));
         var _loc28_:String = "";
         _loc28_ = _loc28_ + "<step>";
         _loc28_ = _loc28_ + ("<node>" + _loc11_.nodeid + "</node>");
         _loc28_ = _loc28_ + "<action>0</action>";
         _loc28_ = _loc28_ + ("<roomobj><room>" + _loc11_.roomid + "</room><id>-1</id></roomobj>");
         _loc28_ = _loc28_ + "</step>";
         var _loc29_:§1t85s0§ = new §1t85s0§(XML(_loc28_));
         _loc25_ = "<reward>";
         _loc25_ = _loc25_ + ("<exp>" + _loc18_ + "</exp>");
         _loc25_ = _loc25_ + ("<loot><id>" + _loc14_.§1t490s0§() + "</id></loot>");
         _loc25_ = _loc25_ + ("<loot><id>" + _loc12_.§1t490s0§() + "</id><qty>" + -1 + "</qty></loot>");
         _loc25_ = _loc25_ + "</reward>";
         _loc29_.§1t1260s0§(new §1t77s0§(XMLList(_loc25_)));
         _loc29_.title = §1t1521s0§.getString(11251,[_loc12_.§1t513s0§(),_loc7_]);
         var _loc30_:String = "";
         _loc30_ = _loc30_ + "<step>";
         _loc30_ = _loc30_ + ("<node>" + param1 + "</node>");
         _loc30_ = _loc30_ + "<action>0</action>";
         _loc30_ = _loc30_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc30_ = _loc30_ + "</step>";
         var _loc31_:§1t85s0§ = new §1t85s0§(XML(_loc30_));
         _loc31_.title = §1t1521s0§.getString(11251,[_loc12_.§1t513s0§(),_loc7_]);
         _loc22_ = "<intro>";
         _loc22_ = _loc22_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11247,[_loc12_.§1t510s0§()]) + "</text>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11247,[_loc12_.§1t513s0§()]) + "</text><goto>28</goto><condition><has><id>" + 92 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc22_ = _loc22_ + ("<choice><text>" + §1t1521s0§.getString(11249) + "</text><goto>5</goto></choice></option>");
         _loc22_ = _loc22_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11250) + "</text></dialogue>");
         _loc22_ = _loc22_ + ("<outcome><id>" + 92 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc22_ = _loc22_ + "<outcome><end>-1</end></outcome>";
         _loc22_ = _loc22_ + "</intro>";
         _loc31_.intro = _loc27_.§1t1403s0§(XMLList(_loc22_));
         _loc31_.§1t1260s0§(new §1t77s0§(XMLList(_loc25_)));
         var _loc32_:§1t69s0§ = new §1t69s0§(null);
         _loc32_.id = §1t11212s0§;
         _loc32_.startin = param1;
         _loc32_.name = "";
         _loc32_.level = 0;
         _loc32_.type = 3;
         _loc32_.startCondition = null;
         _loc32_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc32_.§1t1452s0§[0] = _loc6_;
         _loc32_.§1t1452s0§[1] = _loc24_;
         _loc32_.§1t1452s0§[2] = _loc27_;
         _loc32_.§1t1452s0§[3] = _loc29_;
         _loc32_.§1t1452s0§[4] = _loc31_;
         return _loc32_;
      }
      
      public function §1t1607s0§(param1:int, param2:int, param3:int) : §1t69s0§
      {
         var _loc20_:String = null;
         var _loc4_:§1t85s0§ = new §1t85s0§(null);
         _loc4_.nodeID = param1;
         _loc4_.action = 0;
         var _loc5_:int = §1t123s0§.§1t11210s0§;
         this.§1t1597s0§(param1,param2,_loc5_,param3,§1t1799s0§.§1t11448s0§);
         var _loc6_:int = §1t70s0§.instance.§1t1139s0§(param1);
         var _loc7_:int = (§1t1523s0§.§1t5928s0§(_loc6_ + 1) - §1t1523s0§.§1t5928s0§(_loc6_)) / ((_loc6_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc7_ = 0;
         }
         var _loc8_:int = _loc6_ * 6;
         var _loc9_:String = this.§1t1583s0§(param1,param2,param3).§1t509s0§();
         var _loc10_:§1t124s0§ = this.§1t1585s0§(param1,param2,param3);
         var _loc11_:§1t17s0§ = _loc10_.§1t2217s0§();
         var _loc12_:String = §1t1521s0§.getString(11258,[_loc9_,_loc11_.§1t510s0§()]);
         var _loc13_:String = §1t1521s0§.getString(11259,[_loc11_.§1t513s0§()]);
         var _loc14_:String = §1t1521s0§.getString(11260);
         var _loc15_:String = _loc10_.§1t2221s0§(_loc9_);
         var _loc16_:String = §1t1521s0§.getString(11261,[_loc9_]);
         var _loc17_:String = §1t1521s0§.getString(11262,[_loc9_]);
         var _loc18_:String = §1t1521s0§.getString(11263,[_loc9_]);
         var _loc19_:§1t58s0§ = §1t58s0§.§1t8804s0§((param1 * param3 + param2 * (_loc5_ + 5)) * 3);
         var _loc21_:int = _loc19_.rand(3);
         if(_loc21_ == 0)
         {
            _loc20_ = §1t1521s0§.getString(11264);
         }
         else if(_loc21_ == 1)
         {
            _loc20_ = §1t1521s0§.getString(11265);
         }
         else if(_loc21_ == 2)
         {
            _loc20_ = §1t1521s0§.getString(11266);
         }
         var _loc22_:String = "<text>" + §1t1521s0§.getString(11267,[_loc9_,_loc20_,_loc8_]) + "</text>";
         var _loc23_:String = "<intro>";
         _loc23_ = _loc23_ + "<option><text>auto</text>";
         _loc23_ = _loc23_ + ("<choice><text></text><gotolabel>start</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc23_ = _loc23_ + "<choice><text></text><gotolabel>empty</gotolabel></choice></option>";
         _loc23_ = _loc23_ + "<label>start</label>";
         _loc23_ = _loc23_ + _loc22_;
         _loc23_ = _loc23_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc12_ + "</text>");
         _loc23_ = _loc23_ + ("<choice><text>" + _loc13_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc23_ = _loc23_ + ("<choice><text>" + _loc14_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc23_ = _loc23_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc23_ = _loc23_ + "<label>complete</label>";
         _loc23_ = _loc23_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc7_ + "</modify><end>0</end></outcome>");
         _loc23_ = _loc23_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc8_ + "</modify><end>0</end></outcome>");
         _loc23_ = _loc23_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc23_ = _loc23_ + ("<outcome><id>" + 91 + "</id><modify>" + -1 + "</modify><end>0</end></outcome>");
         _loc23_ = _loc23_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc23_ = _loc23_ + "<label>accept</label>";
         _loc23_ = _loc23_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc15_ + "</text></dialogue>");
         _loc23_ = _loc23_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc23_ = _loc23_ + "<label>leave</label>";
         _loc23_ = _loc23_ + "<outcome><end>-1</end></outcome>";
         _loc23_ = _loc23_ + "<label>empty</label>";
         _loc23_ = _loc23_ + ("<text>" + §1t1521s0§.getString(11268) + "</text>");
         _loc23_ = _loc23_ + "<outcome><end>-1</end></outcome>";
         _loc23_ = _loc23_ + "</intro>";
         _loc4_.intro = _loc4_.§1t1403s0§(XMLList(_loc23_));
         var _loc24_:String = "";
         _loc24_ = _loc24_ + "<step>";
         _loc24_ = _loc24_ + ("<node>" + _loc10_.nodeid + "</node>");
         _loc24_ = _loc24_ + "<action>6</action>";
         _loc24_ = _loc24_ + "<bg>-1</bg>";
         var _loc25_:int = §1t70s0§.instance.§1t1139s0§(_loc10_.nodeid) + 2;
         _loc24_ += "<roomobj><room>" + _loc10_.roomid + "</room><id>" + 9 + "</id><name>aggrobounty</name><x>-1</x><property>" + §1t76s0§.§1t9199s0§ + "," + _loc25_.toString() + "</property></roomobj>";
         _loc21_ = _loc19_.rand(2);
         if(_loc21_ == 0)
         {
            _loc24_ += §1t147s0§.§1t11410s0§(0,_loc19_,1000,_loc25_,§1t76s0§.§1t9199s0§);
         }
         else
         {
            _loc24_ += §1t147s0§.§1t11410s0§(3,_loc19_,1000,_loc25_,§1t76s0§.§1t9199s0§);
         }
         _loc24_ += "</step>";
         var _loc26_:§1t85s0§ = new §1t85s0§(XML(_loc24_));
         var _loc27_:String = "<reward><loot><itemcode>" + _loc11_.§1t490s0§() + "</itemcode></loot></reward>";
         _loc26_.§1t1260s0§(new §1t77s0§(XMLList(_loc27_)));
         _loc26_.title = _loc16_;
         _loc26_.stitle = _loc17_;
         var _loc28_:String = "";
         _loc28_ = _loc28_ + "<step>";
         _loc28_ = _loc28_ + ("<node>" + param1 + "</node>");
         _loc28_ = _loc28_ + "<action>0</action>";
         _loc28_ = _loc28_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc28_ = _loc28_ + "</step>";
         var _loc29_:§1t85s0§ = new §1t85s0§(XML(_loc28_));
         _loc29_.title = _loc13_;
         _loc23_ = "<intro>";
         _loc23_ = _loc23_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc12_ + "</text>");
         _loc23_ = _loc23_ + ("<choice><text>" + _loc13_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc23_ = _loc23_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc23_ = _loc23_ + "<label>complete</label>";
         _loc23_ = _loc23_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc23_ = _loc23_ + "<label>leave</label>";
         _loc23_ = _loc23_ + "<outcome><end>-1</end></outcome>";
         _loc23_ = _loc23_ + "</intro>";
         _loc29_.intro = _loc29_.§1t1403s0§(XMLList(_loc23_));
         _loc27_ = "<reward>";
         _loc27_ = _loc27_ + ("<exp>" + _loc7_ + "</exp>");
         _loc27_ = _loc27_ + ("<loot><id>" + 0 + "</id><qty>" + _loc8_ + "</qty></loot>");
         _loc27_ = _loc27_ + ("<loot><itemcode>" + _loc11_.§1t490s0§() + "</itemcode><qty>" + -1 + "</qty></loot>");
         _loc27_ = _loc27_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc27_ = _loc27_ + "</reward>";
         _loc29_.§1t1260s0§(new §1t77s0§(XMLList(_loc27_)));
         var _loc30_:§1t69s0§ = new §1t69s0§(null);
         _loc30_.id = §1t11212s0§;
         _loc30_.startin = param1;
         _loc30_.name = _loc18_;
         _loc30_.level = 0;
         _loc30_.type = 3;
         _loc30_.startCondition = null;
         _loc30_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc30_.§1t1452s0§[0] = _loc4_;
         _loc30_.§1t1452s0§[1] = _loc26_;
         _loc30_.§1t1452s0§[2] = _loc29_;
         _loc19_.destroy();
         return _loc30_;
      }
      
      internal function §1t1608s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc13_:§1t124s0§ = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc45_:String = null;
         var _loc9_:Point = this.§1t1133s0§(param1);
         if(param7 == 0)
         {
            --_loc9_.y;
         }
         else if(param7 == 1)
         {
            ++_loc9_.y;
         }
         else if(param7 == 2)
         {
            ++_loc9_.x;
         }
         else if(param7 == 3)
         {
            --_loc9_.x;
         }
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         var _loc10_:§1t85s0§ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11433s0§,param5,param6,param7);
         var _loc11_:String = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         var _loc12_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         if(_loc8_.§1t1267s0§.length > 0)
         {
            _loc13_ = new §1t124s0§(null,_loc8_.§1t1267s0§[_loc12_.rand(_loc8_.§1t1267s0§.length)]);
         }
         else
         {
            _loc13_ = new §1t124s0§(null,_loc8_.§1t1264s0§[_loc12_.rand(_loc8_.§1t1264s0§.length)]);
         }
         var _loc14_:int = §1t70s0§.instance.§1t1145s0§(_loc13_.§1t2218s0§());
         if(_loc14_ == §1t70s0§.§1t9168s0§)
         {
            _loc15_ = §1t1521s0§.getString(11269);
            _loc16_ = "65";
            _loc17_ = "65|66";
         }
         else if(_loc14_ == §1t70s0§.§1t9169s0§)
         {
            _loc15_ = §1t1521s0§.getString(11270);
            _loc16_ = "72";
            _loc17_ = "72";
         }
         else if(_loc14_ == §1t70s0§.§1t9170s0§)
         {
            _loc15_ = §1t1521s0§.getString(11271);
            _loc16_ = "73";
            _loc17_ = "73";
         }
         else if(_loc14_ == §1t70s0§.§1t9171s0§)
         {
            _loc15_ = §1t1521s0§.getString(11272);
            _loc16_ = "74";
            _loc17_ = "74|74|74|75";
         }
         else if(_loc14_ == §1t70s0§.§1t9172s0§)
         {
            _loc15_ = §1t1521s0§.getString(11273);
            _loc16_ = "78";
            _loc17_ = "78";
         }
         var _loc18_:String = §1t1521s0§.getString(11242);
         var _loc19_:String = §1t1521s0§.getString(11245);
         var _loc20_:String = §1t1521s0§.getString(11275);
         var _loc21_:String = §1t1521s0§.getString(11276);
         var _loc22_:String = §1t1521s0§.getString(11277);
         var _loc23_:String = §1t1521s0§.getString(11278,[_loc15_]);
         var _loc24_:String = §1t1521s0§.getString(11278,[_loc15_]);
         var _loc25_:String = §1t1521s0§.getString(11279,[_loc11_]);
         var _loc26_:String = §1t1521s0§.getString(11278,[_loc15_]);
         var _loc27_:String = §1t1521s0§.getString(11274,[_loc26_]);
         var _loc28_:String = "";
         var _loc29_:String = "";
         if(param5 == §1t1799s0§.§1t11451s0§)
         {
            _loc28_ = §1t1521s0§.getString(11280);
            _loc29_ = §1t1521s0§.getString(11281,[_loc15_,§1t70s0§.instance.§1t1155s0§(_loc13_.nodeid,_loc13_.roomid)]);
         }
         else if(param5 == §1t1799s0§.§1t11450s0§)
         {
            _loc28_ = §1t1521s0§.getString(11282,[_loc15_]);
            _loc29_ = §1t1521s0§.getString(11283,[_loc15_,§1t70s0§.instance.§1t1155s0§(_loc13_.nodeid,_loc13_.roomid)]);
            _loc26_ = §1t1521s0§.getString(11284,[_loc15_]);
         }
         else if(param5 == §1t1799s0§.§1t11463s0§)
         {
            _loc45_ = "";
            if(param7 == 0)
            {
               _loc45_ = §1t1521s0§.getString(11170);
            }
            else if(param7 == 1)
            {
               _loc45_ = §1t1521s0§.getString(11171);
            }
            else if(param7 == 2)
            {
               _loc45_ = §1t1521s0§.getString(11172);
            }
            else if(param7 == 3)
            {
               _loc45_ = §1t1521s0§.getString(11173);
            }
            _loc26_ = §1t1521s0§.getString(11285,[_loc15_,_loc8_.§1t1276s0§]);
            _loc28_ = §1t1521s0§.getString(11286,[_loc15_,_loc45_]);
            _loc29_ = §1t1521s0§.getString(11287,[_loc8_.§1t1276s0§,_loc15_]);
         }
         else
         {
            _loc28_ = §1t1521s0§.getString(11288,[_loc15_]);
            _loc29_ = §1t1521s0§.getString(11283,[_loc15_,§1t70s0§.instance.§1t1155s0§(_loc13_.nodeid,_loc13_.roomid)]);
         }
         var _loc30_:String = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc28_ + "</text></dialogue>";
         _loc30_ = _loc30_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc29_ + "</text></dialogue>");
         var _loc31_:int = §1t70s0§.instance.§1t1139s0§(param1);
         var _loc32_:int = (§1t1523s0§.§1t5928s0§(_loc31_ + 1) - §1t1523s0§.§1t5928s0§(_loc31_)) / ((_loc31_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc32_ = 0;
         }
         var _loc33_:int = _loc31_ * 5;
         var _loc34_:String = "<intro>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc34_ = _loc34_ + "<label>quest</label>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc34_ = _loc34_ + _loc30_;
         _loc34_ = _loc34_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc27_ + "</text>");
         _loc34_ = _loc34_ + ("<choice><text>" + _loc20_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + _loc18_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc34_ = _loc34_ + "<label>complete</label>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc22_ + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc32_ + "</modify><end>0</end></outcome>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc33_ + "</modify><end>0</end></outcome>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 91 + "</id><modify>" + -1 + "</modify><end>0</end></outcome>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc34_ = _loc34_ + "<label>accept</label>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc19_ + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc34_ = _loc34_ + "<label>leave</label>";
         _loc34_ = _loc34_ + "<outcome><end>-1</end></outcome>";
         _loc34_ = _loc34_ + "<label>talk</label>";
         _loc34_ = _loc34_ + this.§1t1621s0§(_loc12_,_loc8_);
         _loc34_ = _loc34_ + "<outcome><end>-1</end></outcome>";
         _loc34_ = _loc34_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc34_));
         var _loc35_:String = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc35_)));
         var _loc36_:String = "";
         _loc36_ = _loc36_ + "<step>";
         _loc36_ = _loc36_ + ("<node>" + _loc13_.§1t2218s0§() + "</node>");
         _loc36_ = _loc36_ + "<action>1</action>";
         _loc36_ = _loc36_ + "<bg>-1</bg>";
         var _loc37_:int = §1t70s0§.instance.§1t1139s0§(_loc13_.§1t2218s0§());
         var _loc38_:int = _loc12_.rand(3) + 1;
         var _loc39_:int = §1t70s0§.instance.§1t1160s0§(_loc13_.§1t2218s0§());
         _loc36_ += "<roomobj><room>0</room><id>" + 9 + "</id><name>aggrowildlife</name><x>-1</x><property>" + _loc16_ + "," + _loc37_.toString() + "</property></roomobj>";
         var _loc40_:int = 0;
         while(_loc40_ < _loc38_)
         {
            if(_loc40_ == 0)
            {
               _loc36_ += "<wave><enemy><id>" + _loc17_ + "</id><lvl>" + _loc37_ + "</lvl><qty>" + (_loc12_.rand(4) + 1).toString() + "</qty><x>650</x></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave>";
            }
            else
            {
               _loc36_ += "<wave><enemy><x>" + -100 + "</x><y>" + §1t1525s0§.§1t4467s0§() + " </y><id>" + _loc17_ + "</id><lvl>" + _loc37_ + "</lvl><qty>" + _loc12_.rand(4).toString() + "</qty></enemy><enemy><x>" + (_loc39_ + 100) + "</x><y>" + §1t1525s0§.§1t4467s0§() + " </y><id>" + _loc17_ + "</id><lvl>" + _loc37_ + "</lvl><qty>" + _loc12_.rand(4).toString() + "</qty></enemy></wave>";
            }
            _loc40_++;
         }
         _loc36_ += "</step>";
         var _loc41_:§1t85s0§ = new §1t85s0§(XML(_loc36_));
         _loc35_ = "<reward>";
         _loc35_ = _loc35_ + "<forshow>1</forshow>";
         _loc35_ = _loc35_ + ("<exp>" + _loc32_ + "</exp>");
         _loc35_ = _loc35_ + ("<loot><id>" + 0 + "</id><qty>" + _loc33_ + "</qty></loot>");
         _loc35_ = _loc35_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc35_ = _loc35_ + "</reward>";
         _loc41_.§1t1260s0§(new §1t77s0§(XMLList(_loc35_)));
         _loc41_.title = _loc23_;
         _loc41_.stitle = _loc24_;
         var _loc42_:String = "";
         _loc42_ = _loc42_ + "<step>";
         _loc42_ = _loc42_ + ("<node>" + param1 + "</node>");
         _loc42_ = _loc42_ + "<action>0</action>";
         _loc42_ = _loc42_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc42_ = _loc42_ + "</step>";
         var _loc43_:§1t85s0§ = new §1t85s0§(XML(_loc42_));
         _loc43_.title = _loc25_ = "Return to " + _loc11_;
         _loc34_ = "<intro>";
         _loc34_ = _loc34_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc27_ + "</text>");
         _loc34_ = _loc34_ + ("<choice><text>" + _loc21_ + "</text><gotolabel>complete</gotolabel></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc34_ = _loc34_ + "<label>complete</label>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc22_ + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc34_ = _loc34_ + "<label>leave</label>";
         _loc34_ = _loc34_ + "<outcome><end>-1</end></outcome>";
         _loc34_ = _loc34_ + "</intro>";
         _loc43_.intro = _loc43_.§1t1403s0§(XMLList(_loc34_));
         _loc35_ = "<reward>";
         _loc35_ = _loc35_ + ("<exp>" + _loc32_ + "</exp>");
         _loc35_ = _loc35_ + ("<loot><id>" + 0 + "</id><qty>" + _loc33_ + "</qty></loot>");
         _loc35_ = _loc35_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc35_ = _loc35_ + "</reward>";
         _loc43_.§1t1260s0§(new §1t77s0§(XMLList(_loc35_)));
         var _loc44_:§1t69s0§ = new §1t69s0§(null);
         _loc44_.id = §1t11212s0§;
         _loc44_.startin = param1;
         _loc44_.name = _loc26_;
         _loc44_.level = 0;
         _loc44_.type = 3;
         _loc44_.startCondition = null;
         _loc44_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc44_.§1t1452s0§[0] = _loc10_;
         _loc44_.§1t1452s0§[1] = _loc41_;
         _loc44_.§1t1452s0§[2] = _loc43_;
         _loc12_.destroy();
         return _loc44_;
      }
      
      internal function §1t1609s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc17_:String = null;
         var _loc46_:String = null;
         var _loc9_:Point = this.§1t1133s0§(param1);
         if(param7 == 0)
         {
            --_loc9_.y;
         }
         else if(param7 == 1)
         {
            ++_loc9_.y;
         }
         else if(param7 == 2)
         {
            ++_loc9_.x;
         }
         else if(param7 == 3)
         {
            --_loc9_.x;
         }
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         var _loc10_:§1t85s0§ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11434s0§,param5,param6,param7);
         var _loc11_:String = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         var _loc12_:String = this.§1t1583s0§(param1,param2,param4).§1t509s0§();
         var _loc13_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         var _loc14_:Array = _loc8_.§1t1348s0§();
         var _loc15_:§1t124s0§ = new §1t124s0§(null,_loc14_[_loc13_.rand(_loc14_.length)]);
         var _loc16_:String = "11";
         var _loc18_:int = §1t70s0§.instance.§1t1143s0§(_loc8_.§1t1261s0§);
         if(_loc18_ < 3)
         {
            _loc17_ = "11";
         }
         else if(_loc18_ < 5)
         {
            _loc17_ = "11|12";
         }
         else if(_loc18_ < 7)
         {
            _loc17_ = "11|12|13";
         }
         else if(_loc18_ < 9)
         {
            _loc17_ = "11|12|13|14";
         }
         else if(int(Math.random() * 3) > 0)
         {
            _loc17_ = "11|12|13|14|15";
         }
         else
         {
            _loc17_ = "11|12|13|14|15|16";
         }
         var _loc19_:String = §1t1521s0§.getString(11242);
         var _loc20_:String = §1t1521s0§.getString(11245);
         var _loc21_:String = §1t1521s0§.getString(11275);
         var _loc22_:String = §1t1521s0§.getString(11275);
         var _loc23_:String = §1t1521s0§.getString(11277);
         var _loc24_:String = §1t1521s0§.getString(11291);
         var _loc25_:String = §1t1521s0§.getString(11292);
         var _loc26_:String = §1t1521s0§.getString(11279,[_loc11_]);
         var _loc27_:String = §1t1521s0§.getString(11293,[§1t70s0§.instance.§1t1153s0§(_loc15_.§1t2218s0§())]);
         var _loc28_:String = §1t1521s0§.getString(11274,[_loc27_]);
         var _loc29_:String = "";
         var _loc30_:String = "";
         if(param5 == §1t1799s0§.§1t11452s0§)
         {
            _loc29_ = §1t1521s0§.getString(11294);
            _loc30_ = §1t1521s0§.getString(11295,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
            _loc27_ = §1t1521s0§.getString(11296,[§1t70s0§.instance.§1t1153s0§(_loc15_.§1t2218s0§())]);
         }
         else if(param5 == §1t1799s0§.§1t11455s0§)
         {
            _loc29_ = §1t1521s0§.getString(11297);
            _loc30_ = §1t1521s0§.getString(11298,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
         }
         else if(param5 == §1t1799s0§.§1t11457s0§)
         {
            _loc29_ = §1t1521s0§.getString(11299);
            _loc30_ = §1t1521s0§.getString(11300);
            _loc15_.nodeid = param1;
         }
         else if(param5 == §1t1799s0§.§1t11458s0§)
         {
            _loc29_ = §1t1521s0§.getString(11301,[_loc8_.§1t1341s0§()]);
            _loc30_ = §1t1521s0§.getString(11302,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
         }
         else if(param5 == §1t1799s0§.§1t11463s0§)
         {
            _loc46_ = "";
            if(param7 == 0)
            {
               _loc46_ = §1t1521s0§.getString(11170);
            }
            else if(param7 == 1)
            {
               _loc46_ = §1t1521s0§.getString(11171);
            }
            else if(param7 == 2)
            {
               _loc46_ = §1t1521s0§.getString(11172);
            }
            else if(param7 == 3)
            {
               _loc46_ = §1t1521s0§.getString(11173);
            }
            _loc27_ = §1t1521s0§.getString(11303,[_loc8_.§1t1276s0§]);
            _loc29_ = §1t1521s0§.getString(11304,[_loc46_]);
            _loc30_ = §1t1521s0§.getString(11305,[_loc8_.§1t1276s0§]);
         }
         else if(param5 == §1t1799s0§.§1t11464s0§)
         {
            _loc29_ = §1t1521s0§.getString(11306);
            _loc30_ = §1t1521s0§.getString(11307,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
         }
         else
         {
            _loc29_ = §1t1521s0§.getString(11308);
            _loc30_ = §1t1521s0§.getString(11309,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
         }
         var _loc31_:String = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc29_ + "</text></dialogue>";
         _loc31_ = _loc31_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc30_ + "</text></dialogue>");
         var _loc32_:int = §1t70s0§.instance.§1t1139s0§(param1);
         var _loc33_:int = (§1t1523s0§.§1t5928s0§(_loc32_ + 1) - §1t1523s0§.§1t5928s0§(_loc32_)) / ((_loc32_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc33_ = 0;
         }
         var _loc34_:int = _loc32_ * 5;
         var _loc35_:String = "<intro>";
         _loc35_ = _loc35_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc35_ = _loc35_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc35_ = _loc35_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc35_ = _loc35_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc35_ = _loc35_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc35_ = _loc35_ + "<label>quest</label>";
         _loc35_ = _loc35_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc35_ = _loc35_ + _loc31_;
         _loc35_ = _loc35_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc28_ + "</text>");
         _loc35_ = _loc35_ + ("<choice><text>" + _loc21_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc35_ = _loc35_ + ("<choice><text>" + _loc19_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc35_ = _loc35_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc35_ = _loc35_ + "<label>complete</label>";
         _loc35_ = _loc35_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc23_ + "</text></dialogue>");
         _loc35_ = _loc35_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc33_ + "</modify><end>0</end></outcome>");
         _loc35_ = _loc35_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc34_ + "</modify><end>0</end></outcome>");
         _loc35_ = _loc35_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc35_ = _loc35_ + ("<outcome><id>" + 91 + "</id><modify>" + -1 + "</modify><end>0</end></outcome>");
         _loc35_ = _loc35_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc35_ = _loc35_ + "<label>accept</label>";
         _loc35_ = _loc35_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc20_ + "</text></dialogue>");
         _loc35_ = _loc35_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc35_ = _loc35_ + "<label>leave</label>";
         _loc35_ = _loc35_ + "<outcome><end>-1</end></outcome>";
         _loc35_ = _loc35_ + "<label>talk</label>";
         _loc35_ = _loc35_ + this.§1t1621s0§(_loc13_,_loc8_);
         _loc35_ = _loc35_ + "<outcome><end>-1</end></outcome>";
         _loc35_ = _loc35_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc35_));
         var _loc36_:String = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc36_)));
         var _loc37_:String = "";
         _loc37_ = _loc37_ + "<step>";
         _loc37_ = _loc37_ + ("<node>" + _loc15_.§1t2218s0§() + "</node>");
         _loc37_ = _loc37_ + "<action>1</action>";
         _loc37_ = _loc37_ + "<bg>-1</bg>";
         var _loc38_:int = §1t70s0§.instance.§1t1139s0§(_loc15_.§1t2218s0§());
         var _loc39_:int = _loc13_.rand(4) + 2;
         var _loc40_:int = §1t70s0§.instance.§1t1160s0§(_loc15_.§1t2218s0§());
         _loc37_ += "<roomobj><room>0</room><id>" + 9 + "</id><name>aggrooni</name><x>-1</x><property>" + _loc16_ + "," + _loc38_.toString() + "</property></roomobj>";
         var _loc41_:int = 0;
         while(_loc41_ < _loc39_)
         {
            if(_loc41_ == _loc39_ - 1)
            {
               _loc37_ += "<wave><enemy><x>" + -100 + "</x><id>" + _loc17_ + "</id><lvl>" + _loc38_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (_loc40_ + 100) + "</x><id>" + _loc17_ + "</id><lvl>" + _loc38_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty></enemy><enemy><id>" + §1t76s0§.§1t9199s0§.toString() + "</id><lvl>" + (_loc38_ + 2).toString() + "</lvl><qty>" + 1 + "</qty></enemy></wave>";
            }
            else if(_loc41_ == 0)
            {
               _loc37_ += "<wave><enemy><id>" + _loc17_ + "</id><lvl>" + _loc38_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty><x>650</x></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave>";
            }
            else
            {
               _loc37_ += "<wave><enemy><x>" + -100 + "</x><id>" + _loc17_ + "</id><lvl>" + _loc38_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (_loc40_ + 100) + "</x><id>" + _loc17_ + "</id><lvl>" + _loc38_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty></enemy></wave>";
            }
            _loc41_++;
         }
         _loc37_ += "</step>";
         var _loc42_:§1t85s0§ = new §1t85s0§(XML(_loc37_));
         _loc36_ = "<reward>";
         _loc36_ = _loc36_ + "<forshow>1</forshow>";
         _loc36_ = _loc36_ + ("<exp>" + _loc33_ + "</exp>");
         _loc36_ = _loc36_ + ("<loot><id>" + 0 + "</id><qty>" + _loc34_ + "</qty></loot>");
         _loc36_ = _loc36_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc36_ = _loc36_ + "</reward>";
         _loc42_.§1t1260s0§(new §1t77s0§(XMLList(_loc36_)));
         _loc42_.title = _loc24_;
         _loc42_.stitle = _loc25_;
         var _loc43_:String = "";
         _loc43_ = _loc43_ + "<step>";
         _loc43_ = _loc43_ + ("<node>" + param1 + "</node>");
         _loc43_ = _loc43_ + "<action>0</action>";
         _loc43_ = _loc43_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc43_ = _loc43_ + "</step>";
         var _loc44_:§1t85s0§ = new §1t85s0§(XML(_loc43_));
         _loc44_.title = _loc26_;
         _loc35_ = "<intro>";
         _loc35_ = _loc35_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc28_ + "</text>");
         _loc35_ = _loc35_ + ("<choice><text>" + _loc22_ + "</text><gotolabel>complete</gotolabel></choice>");
         _loc35_ = _loc35_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc35_ = _loc35_ + "<label>complete</label>";
         _loc35_ = _loc35_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc35_ = _loc35_ + "<label>leave</label>";
         _loc35_ = _loc35_ + "<outcome><end>-1</end></outcome>";
         _loc35_ = _loc35_ + "</intro>";
         _loc44_.intro = _loc44_.§1t1403s0§(XMLList(_loc35_));
         _loc36_ = "<reward>";
         _loc36_ = _loc36_ + ("<exp>" + _loc33_ + "</exp>");
         _loc36_ = _loc36_ + ("<loot><id>" + 0 + "</id><qty>" + _loc34_ + "</qty></loot>");
         _loc36_ = _loc36_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc36_ = _loc36_ + "</reward>";
         _loc44_.§1t1260s0§(new §1t77s0§(XMLList(_loc36_)));
         var _loc45_:§1t69s0§ = new §1t69s0§(null);
         _loc45_.id = §1t11212s0§;
         _loc45_.startin = param1;
         _loc45_.name = _loc27_;
         _loc45_.level = 0;
         _loc45_.type = 3;
         _loc45_.startCondition = null;
         _loc45_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc45_.§1t1452s0§[0] = _loc10_;
         _loc45_.§1t1452s0§[1] = _loc42_;
         _loc45_.§1t1452s0§[2] = _loc44_;
         _loc13_.destroy();
         return _loc45_;
      }
      
      internal function §1t1610s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc9_:Point = this.§1t1133s0§(param1);
         if(param7 == 0)
         {
            --_loc9_.y;
         }
         else if(param7 == 1)
         {
            ++_loc9_.y;
         }
         else if(param7 == 2)
         {
            ++_loc9_.x;
         }
         else if(param7 == 3)
         {
            --_loc9_.x;
         }
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         var _loc10_:§1t85s0§ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11435s0§,param5,param6,param7);
         var _loc11_:String = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         var _loc12_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         var _loc13_:Array = _loc8_.§1t1348s0§();
         var _loc14_:§1t124s0§ = new §1t124s0§(null,_loc13_[_loc12_.rand(_loc13_.length)]);
         var _loc15_:String = "76|79";
         var _loc16_:String = "76";
         var _loc17_:String = §1t1521s0§.getString(11242);
         var _loc18_:String = §1t1521s0§.getString(11245);
         var _loc19_:String = §1t1521s0§.getString(11275);
         var _loc20_:String = §1t1521s0§.getString(11276);
         var _loc21_:String = §1t1521s0§.getString(11277);
         var _loc22_:String = §1t1521s0§.getString(11311);
         var _loc23_:String = §1t1521s0§.getString(11311);
         var _loc24_:String = §1t1521s0§.getString(11279,[_loc11_]);
         var _loc25_:String = §1t1521s0§.getString(11312,[§1t70s0§.instance.§1t1153s0§(_loc14_.§1t2218s0§())]);
         var _loc26_:String = §1t1521s0§.getString(11274,[_loc25_]);
         var _loc27_:String = "";
         var _loc28_:String = "";
         if(param5 == §1t1799s0§.§1t11453s0§)
         {
            _loc27_ = §1t1521s0§.getString(11313);
            _loc28_ = §1t1521s0§.getString(11314,[§1t70s0§.instance.§1t1155s0§(_loc14_.nodeid,_loc14_.roomid)]);
         }
         else if(param5 == §1t1799s0§.§1t11464s0§)
         {
            _loc27_ = §1t1521s0§.getString(11315);
            _loc28_ = §1t1521s0§.getString(11316,[§1t70s0§.instance.§1t1155s0§(_loc14_.nodeid,_loc14_.roomid)]);
         }
         else if(param5 == §1t1799s0§.§1t11459s0§)
         {
            _loc27_ = §1t1521s0§.getString(11317);
            _loc28_ = §1t1521s0§.getString(11318);
            _loc14_.nodeid = param1;
         }
         else
         {
            _loc27_ = §1t1521s0§.getString(11319);
            _loc28_ = §1t1521s0§.getString(11320,[§1t70s0§.instance.§1t1155s0§(_loc14_.nodeid,_loc14_.roomid)]);
         }
         var _loc29_:String = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc27_ + "</text></dialogue>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc28_ + "</text></dialogue>");
         var _loc30_:int = §1t70s0§.instance.§1t1139s0§(param1);
         var _loc31_:int = (§1t1523s0§.§1t5928s0§(_loc30_ + 1) - §1t1523s0§.§1t5928s0§(_loc30_)) / ((_loc30_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc31_ = 0;
         }
         var _loc32_:int = _loc30_ * 5;
         var _loc33_:String = "<intro>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>quest</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc33_ = _loc33_ + _loc29_;
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc26_ + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc19_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc17_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>complete</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc21_ + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc31_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc32_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + -1 + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc33_ = _loc33_ + "<label>accept</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc18_ + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc33_ = _loc33_ + "<label>leave</label>";
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "<label>talk</label>";
         _loc33_ = _loc33_ + this.§1t1621s0§(_loc12_,_loc8_);
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc33_));
         var _loc34_:String = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         var _loc35_:String = "";
         _loc35_ = _loc35_ + "<step>";
         _loc35_ = _loc35_ + ("<node>" + _loc14_.§1t2218s0§() + "</node>");
         _loc35_ = _loc35_ + "<action>1</action>";
         _loc35_ = _loc35_ + "<bg>-1</bg>";
         var _loc36_:int = §1t70s0§.instance.§1t1139s0§(_loc14_.§1t2218s0§());
         var _loc37_:int = _loc12_.rand(3) + 2;
         var _loc38_:int = §1t70s0§.instance.§1t1160s0§(_loc14_.§1t2218s0§());
         _loc35_ += "<roomobj><room>0</room><id>" + 9 + "</id><name>aggrooni</name><x>-1</x><property>" + _loc16_ + "," + _loc36_.toString() + "</property></roomobj>";
         var _loc39_:int = 0;
         while(_loc39_ < _loc37_)
         {
            if(_loc39_ == 0)
            {
               _loc35_ += "<wave><enemy><id>" + _loc15_ + "</id><lvl>" + _loc36_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty><x>650</x></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave>";
            }
            else
            {
               _loc35_ += "<wave><enemy><x>" + -100 + "</x><id>" + _loc15_ + "</id><lvl>" + _loc36_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (_loc38_ + 100) + "</x><id>" + _loc15_ + "</id><lvl>" + _loc36_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty></enemy></wave>";
            }
            _loc39_++;
         }
         _loc35_ += "</step>";
         var _loc40_:§1t85s0§ = new §1t85s0§(XML(_loc35_));
         _loc34_ = "<reward>";
         _loc34_ = _loc34_ + "<forshow>1</forshow>";
         _loc34_ = _loc34_ + ("<exp>" + _loc31_ + "</exp>");
         _loc34_ = _loc34_ + ("<loot><id>" + 0 + "</id><qty>" + _loc32_ + "</qty></loot>");
         _loc34_ = _loc34_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc34_ = _loc34_ + "</reward>";
         _loc40_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         _loc40_.title = _loc22_;
         _loc40_.stitle = _loc23_;
         var _loc41_:String = "";
         _loc41_ = _loc41_ + "<step>";
         _loc41_ = _loc41_ + ("<node>" + param1 + "</node>");
         _loc41_ = _loc41_ + "<action>0</action>";
         _loc41_ = _loc41_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc41_ = _loc41_ + "</step>";
         var _loc42_:§1t85s0§ = new §1t85s0§(XML(_loc41_));
         _loc42_.title = _loc24_;
         _loc33_ = "<intro>";
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc26_ + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc20_ + "</text><gotolabel>complete</gotolabel></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>complete</label>";
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc33_ = _loc33_ + "<label>leave</label>";
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "</intro>";
         _loc42_.intro = _loc42_.§1t1403s0§(XMLList(_loc33_));
         _loc34_ = "<reward>";
         _loc34_ = _loc34_ + ("<exp>" + _loc31_ + "</exp>");
         _loc34_ = _loc34_ + ("<loot><id>" + 0 + "</id><qty>" + _loc32_ + "</qty></loot>");
         _loc34_ = _loc34_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc34_ = _loc34_ + "</reward>";
         _loc42_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         var _loc43_:§1t69s0§ = new §1t69s0§(null);
         _loc43_.id = §1t11212s0§;
         _loc43_.startin = param1;
         _loc43_.name = _loc25_;
         _loc43_.level = 0;
         _loc43_.type = 3;
         _loc43_.startCondition = null;
         _loc43_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc43_.§1t1452s0§[0] = _loc10_;
         _loc43_.§1t1452s0§[1] = _loc40_;
         _loc43_.§1t1452s0§[2] = _loc42_;
         _loc12_.destroy();
         return _loc43_;
      }
      
      internal function §1t1611s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc44_:String = null;
         var _loc9_:Point = this.§1t1133s0§(param1);
         if(param7 == 0)
         {
            --_loc9_.y;
         }
         else if(param7 == 1)
         {
            ++_loc9_.y;
         }
         else if(param7 == 2)
         {
            ++_loc9_.x;
         }
         else if(param7 == 3)
         {
            --_loc9_.x;
         }
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         var _loc10_:§1t85s0§ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11436s0§,param5,param6,param7);
         var _loc11_:String = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         var _loc12_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         var _loc13_:Array = _loc8_.§1t1348s0§();
         var _loc14_:§1t124s0§ = new §1t124s0§(null,_loc13_[_loc12_.rand(_loc13_.length)]);
         var _loc15_:String = "80";
         var _loc16_:String = "80";
         var _loc17_:String = §1t1521s0§.getString(11242);
         var _loc18_:String = §1t1521s0§.getString(11245);
         var _loc19_:String = §1t1521s0§.getString(11275);
         var _loc20_:String = §1t1521s0§.getString(11276);
         var _loc21_:String = §1t1521s0§.getString(11277);
         var _loc22_:String = §1t1521s0§.getString(11322);
         var _loc23_:String = §1t1521s0§.getString(11322);
         var _loc24_:String = §1t1521s0§.getString(11279,[_loc11_]);
         var _loc25_:String = §1t1521s0§.getString(11323,[§1t70s0§.instance.§1t1153s0§(_loc14_.§1t2218s0§())]);
         var _loc26_:String = §1t1521s0§.getString(11274,[_loc25_]);
         var _loc27_:String = "";
         var _loc28_:String = "";
         if(param5 == §1t1799s0§.§1t11464s0§)
         {
            _loc27_ = §1t1521s0§.getString(11324);
            _loc28_ = §1t1521s0§.getString(11325,[_loc8_.§1t1341s0§()]);
            _loc14_.nodeid = param1;
         }
         else if(param5 == §1t1799s0§.§1t11461s0§)
         {
            _loc27_ = §1t1521s0§.getString(11326);
            _loc28_ = §1t1521s0§.getString(11327);
            _loc14_.nodeid = param1;
         }
         else if(param5 == §1t1799s0§.§1t11463s0§)
         {
            _loc44_ = "";
            if(param7 == 0)
            {
               _loc44_ = §1t1521s0§.getString(11170);
            }
            else if(param7 == 1)
            {
               _loc44_ = §1t1521s0§.getString(11171);
            }
            else if(param7 == 2)
            {
               _loc44_ = §1t1521s0§.getString(11172);
            }
            else if(param7 == 3)
            {
               _loc44_ = §1t1521s0§.getString(11173);
            }
            _loc25_ = §1t1521s0§.getString(11328,[_loc8_.§1t1276s0§]);
            _loc27_ = §1t1521s0§.getString(11329,[_loc44_]);
            _loc28_ = §1t1521s0§.getString(11330,[_loc8_.§1t1276s0§]);
         }
         else
         {
            _loc27_ = §1t1521s0§.getString(11331);
            _loc28_ = §1t1521s0§.getString(11332,[§1t70s0§.instance.§1t1155s0§(_loc14_.nodeid,_loc14_.roomid)]);
         }
         var _loc29_:String = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc27_ + "</text></dialogue>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc28_ + "</text></dialogue>");
         var _loc30_:int = §1t70s0§.instance.§1t1139s0§(param1);
         var _loc31_:int = (§1t1523s0§.§1t5928s0§(_loc30_ + 1) - §1t1523s0§.§1t5928s0§(_loc30_)) / ((_loc30_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc31_ = 0;
         }
         var _loc32_:int = _loc30_ * 5;
         var _loc33_:String = "<intro>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>quest</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc33_ = _loc33_ + _loc29_;
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc26_ + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc19_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc17_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>complete</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc21_ + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc31_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc32_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + -1 + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc33_ = _loc33_ + "<label>accept</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc18_ + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc33_ = _loc33_ + "<label>leave</label>";
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "<label>talk</label>";
         _loc33_ = _loc33_ + this.§1t1621s0§(_loc12_,_loc8_);
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc33_));
         var _loc34_:String = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         var _loc35_:String = "";
         _loc35_ = _loc35_ + "<step>";
         _loc35_ = _loc35_ + ("<node>" + _loc14_.§1t2218s0§() + "</node>");
         _loc35_ = _loc35_ + "<action>1</action>";
         _loc35_ = _loc35_ + "<bg>-1</bg>";
         var _loc36_:int = §1t70s0§.instance.§1t1139s0§(_loc14_.§1t2218s0§());
         var _loc37_:int = _loc12_.rand(4) + 2;
         var _loc38_:int = §1t70s0§.instance.§1t1160s0§(_loc14_.§1t2218s0§());
         _loc35_ += "<roomobj><room>0</room><id>" + 9 + "</id><name>aggrooni</name><x>-1</x><property>" + _loc16_ + "," + _loc36_.toString() + "</property></roomobj>";
         var _loc39_:int = 0;
         while(_loc39_ < _loc37_)
         {
            if(_loc39_ == 0)
            {
               _loc35_ += "<wave><enemy><id>" + _loc15_ + "</id><lvl>" + _loc36_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty><x>650</x></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave>";
            }
            else
            {
               _loc35_ += "<wave><enemy><x>" + -100 + "</x><id>" + _loc15_ + "</id><lvl>" + _loc36_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (_loc38_ + 100) + "</x><id>" + _loc15_ + "</id><lvl>" + _loc36_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty></enemy></wave>";
            }
            _loc39_++;
         }
         _loc35_ += "</step>";
         var _loc40_:§1t85s0§ = new §1t85s0§(XML(_loc35_));
         _loc34_ = "<reward>";
         _loc34_ = _loc34_ + "<forshow>1</forshow>";
         _loc34_ = _loc34_ + ("<exp>" + _loc31_ + "</exp>");
         _loc34_ = _loc34_ + ("<loot><id>" + 0 + "</id><qty>" + _loc32_ + "</qty></loot>");
         _loc34_ = _loc34_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc34_ = _loc34_ + "</reward>";
         _loc40_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         _loc40_.title = _loc22_;
         _loc40_.stitle = _loc23_;
         var _loc41_:String = "";
         _loc41_ = _loc41_ + "<step>";
         _loc41_ = _loc41_ + ("<node>" + param1 + "</node>");
         _loc41_ = _loc41_ + "<action>0</action>";
         _loc41_ = _loc41_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc41_ = _loc41_ + "</step>";
         var _loc42_:§1t85s0§ = new §1t85s0§(XML(_loc41_));
         _loc42_.title = _loc24_;
         _loc33_ = "<intro>";
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc26_ + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc20_ + "</text><gotolabel>complete</gotolabel></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>complete</label>";
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc33_ = _loc33_ + "<label>leave</label>";
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "</intro>";
         _loc42_.intro = _loc42_.§1t1403s0§(XMLList(_loc33_));
         _loc34_ = "<reward>";
         _loc34_ = _loc34_ + ("<exp>" + _loc31_ + "</exp>");
         _loc34_ = _loc34_ + ("<loot><id>" + 0 + "</id><qty>" + _loc32_ + "</qty></loot>");
         _loc34_ = _loc34_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc34_ = _loc34_ + "</reward>";
         _loc42_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         var _loc43_:§1t69s0§ = new §1t69s0§(null);
         _loc43_.id = §1t11212s0§;
         _loc43_.startin = param1;
         _loc43_.name = _loc25_;
         _loc43_.level = 0;
         _loc43_.type = 3;
         _loc43_.startCondition = null;
         _loc43_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc43_.§1t1452s0§[0] = _loc10_;
         _loc43_.§1t1452s0§[1] = _loc40_;
         _loc43_.§1t1452s0§[2] = _loc42_;
         _loc12_.destroy();
         return _loc43_;
      }
      
      internal function §1t1612s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc10_:§1t85s0§ = null;
         var _loc11_:String = null;
         var _loc12_:§1t58s0§ = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:String = null;
         var _loc27_:String = null;
         var _loc29_:String = null;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc33_:String = null;
         var _loc34_:String = null;
         var _loc35_:String = null;
         var _loc36_:§1t85s0§ = null;
         var _loc37_:String = null;
         var _loc38_:§1t85s0§ = null;
         var _loc39_:§1t69s0§ = null;
         var _loc9_:Point = this.§1t1133s0§(param1);
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         _loc10_ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11438s0§,param5,param6,param7);
         _loc11_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         _loc12_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         if(param7 == -1)
         {
            param7 = _loc8_.§1t1344s0§();
         }
         if(_loc12_.rand(3) == 0)
         {
            _loc13_ = §1t70s0§.instance.§1t1163s0§(param7,true);
            _loc14_ = 1;
         }
         else
         {
            _loc13_ = §1t70s0§.instance.§1t1163s0§(param7,false);
            _loc14_ = 3;
         }
         if(_loc13_ == 2)
         {
            _loc15_ = 20060;
            _loc16_ = §1t1521s0§.getString(4237);
         }
         else if(_loc13_ == 3)
         {
            _loc15_ = 20061;
            _loc16_ = §1t1521s0§.getString(4238);
         }
         else if(_loc13_ == 4)
         {
            _loc15_ = 20062;
            _loc16_ = §1t1521s0§.getString(4239);
         }
         else if(_loc13_ == 5)
         {
            _loc15_ = 20063;
            _loc16_ = §1t1521s0§.getString(4240);
         }
         else if(_loc13_ == 6)
         {
            _loc15_ = 20064;
            _loc16_ = §1t1521s0§.getString(4241);
         }
         else if(_loc13_ == 7)
         {
            _loc15_ = 20065;
            _loc16_ = §1t1521s0§.getString(4242);
         }
         else if(_loc13_ == 8)
         {
            _loc15_ = 20066;
            _loc16_ = §1t1521s0§.getString(4243);
         }
         _loc17_ = §1t1521s0§.getString(11333,[_loc14_,_loc16_]);
         _loc20_ = §1t1521s0§.getString(11334,[_loc11_,_loc14_,_loc16_]);
         _loc18_ = §1t1521s0§.getString(11274,[_loc20_]);
         _loc19_ = §1t1521s0§.getString(11336,[_loc14_,_loc16_]);
         _loc21_ = §1t1521s0§.getString(11242);
         _loc22_ = §1t1521s0§.getString(11245);
         _loc23_ = §1t1521s0§.getString(11277);
         _loc24_ = §1t1521s0§.getString(11279,[_loc11_]);
         _loc25_ = §1t1521s0§.getString(11251,[_loc16_,_loc11_]);
         _loc26_ = "";
         _loc27_ = "";
         var _loc28_:int = _loc12_.rand(2);
         if(_loc28_ == 0)
         {
            _loc27_ = §1t1521s0§.getString(11337,[_loc16_]);
         }
         else
         {
            _loc27_ = §1t1521s0§.getString(11338,[_loc16_]);
         }
         if(param5 == §1t1799s0§.§1t11457s0§)
         {
            _loc26_ = §1t1521s0§.getString(11299);
         }
         else if(param5 == §1t1799s0§.§1t11459s0§)
         {
            _loc26_ = §1t1521s0§.getString(11317);
         }
         else if(param5 == §1t1799s0§.§1t11460s0§)
         {
            _loc26_ = §1t1521s0§.getString(11339);
         }
         else if(param5 == §1t1799s0§.§1t11461s0§)
         {
            _loc26_ = §1t1521s0§.getString(11326);
         }
         else if(param5 == §1t1799s0§.§1t11462s0§)
         {
            _loc26_ = §1t1521s0§.getString(11340);
         }
         else
         {
            _loc26_ = §1t1521s0§.getString(11341,[_loc8_.§1t1341s0§()]);
         }
         _loc29_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc26_ + "</text></dialogue>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc27_ + "</text></dialogue>");
         if(param7 != -1)
         {
            _loc29_ += "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11342,[§1t70s0§.instance.§1t1153s0§(param7)]) + "</text></dialogue>";
         }
         else
         {
            _loc29_ += "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11343) + "</text></dialogue>";
         }
         _loc30_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc31_ = (§1t1523s0§.§1t5928s0§(_loc30_ + 1) - §1t1523s0§.§1t5928s0§(_loc30_)) / ((_loc30_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc31_ = 0;
         }
         var _loc32_:int = _loc30_ * 5;
         _loc33_ = "<intro>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>quest</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc33_ = _loc33_ + _loc29_;
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc18_ + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc19_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + _loc15_ + "</id><qty>" + _loc14_ + "</qty><comp>gte</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc21_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + _loc15_ + "</id><qty>" + _loc14_ + "</qty><comp>lt</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>complete</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc23_ + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc31_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc32_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + _loc15_ + "</id><modify>-" + _loc14_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc33_ = _loc33_ + "<label>accept</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc22_ + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc33_ = _loc33_ + "<label>leave</label>";
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "<label>talk</label>";
         _loc33_ = _loc33_ + this.§1t1621s0§(_loc12_,_loc8_);
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc33_));
         _loc34_ = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         _loc35_ = "";
         _loc35_ = _loc35_ + "<step>";
         _loc35_ = _loc35_ + ("<node>" + param1 + "</node>");
         _loc35_ = _loc35_ + "<action>0</action>";
         _loc35_ = _loc35_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc35_ = _loc35_ + "</step>";
         _loc36_ = new §1t85s0§(XML(_loc35_));
         _loc34_ = "<reward>";
         _loc34_ = _loc34_ + "<forshow>1</forshow>";
         _loc34_ = _loc34_ + ("<exp>" + _loc31_ + "</exp>");
         _loc34_ = _loc34_ + ("<loot><id>" + 0 + "</id><qty>" + _loc32_ + "</qty></loot>");
         _loc34_ = _loc34_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc34_ = _loc34_ + "</reward>";
         _loc36_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         _loc36_.title = _loc20_;
         _loc37_ = "";
         _loc37_ = _loc37_ + "<step>";
         _loc37_ = _loc37_ + ("<node>" + param1 + "</node>");
         _loc37_ = _loc37_ + "<action>0</action>";
         _loc37_ = _loc37_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc37_ = _loc37_ + "</step>";
         _loc38_ = new §1t85s0§(XML(_loc37_));
         _loc38_.title = _loc24_;
         _loc33_ = "<intro>";
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc18_ + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc19_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + _loc15_ + "</id><qty>" + _loc14_ + "</qty><comp>gte</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>complete</label>";
         _loc33_ = _loc33_ + ("<outcome><id>" + _loc15_ + "</id><modify>-" + _loc14_ + "</modify></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc33_ = _loc33_ + "<label>leave</label>";
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "</intro>";
         _loc38_.intro = _loc38_.§1t1403s0§(XMLList(_loc33_));
         _loc34_ = "<reward>";
         _loc34_ = _loc34_ + ("<exp>" + _loc31_ + "</exp>");
         _loc34_ = _loc34_ + ("<loot><id>" + 0 + "</id><qty>" + _loc32_ + "</qty></loot>");
         _loc34_ = _loc34_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc34_ = _loc34_ + "</reward>";
         _loc38_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         _loc39_ = new §1t69s0§(null);
         _loc39_.id = §1t11212s0§;
         _loc39_.startin = param1;
         _loc39_.name = _loc25_;
         _loc39_.level = 0;
         _loc39_.type = 3;
         _loc39_.startCondition = null;
         _loc39_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc39_.§1t1452s0§[0] = _loc10_;
         _loc39_.§1t1452s0§[1] = _loc36_;
         _loc39_.§1t1452s0§[2] = _loc38_;
         _loc12_.destroy();
         return _loc39_;
      }
      
      internal function §1t1613s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc9_:Point = null;
         var _loc10_:§1t85s0§ = null;
         var _loc11_:String = null;
         var _loc12_:§1t58s0§ = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:String = null;
         var _loc30_:String = null;
         var _loc31_:String = null;
         var _loc32_:§1t85s0§ = null;
         var _loc33_:String = null;
         var _loc34_:§1t85s0§ = null;
         var _loc35_:§1t69s0§ = null;
         _loc9_ = this.§1t1133s0§(param1);
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         _loc10_ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11449s0§,param5,param6,param7);
         _loc11_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         _loc12_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         _loc13_ = _loc12_.rand(3) + 3;
         _loc14_ = 20040;
         _loc16_ = §1t1521s0§.getString(11345,[_loc13_,_loc11_]);
         _loc17_ = §1t1521s0§.getString(11346,[_loc11_,_loc13_]);
         _loc18_ = §1t1521s0§.getString(11242);
         _loc19_ = §1t1521s0§.getString(11245);
         _loc20_ = §1t1521s0§.getString(11277);
         _loc21_ = §1t1521s0§.getString(11347,[_loc11_]);
         _loc22_ = §1t1521s0§.getString(11274,[_loc21_]);
         if(param5 == §1t1799s0§.§1t11451s0§)
         {
            _loc23_ = §1t1521s0§.getString(11350);
            _loc24_ = §1t1521s0§.getString(11351);
         }
         else if(param5 == §1t1799s0§.§1t11459s0§)
         {
            _loc23_ = §1t1521s0§.getString(11352);
            _loc24_ = §1t1521s0§.getString(11353);
         }
         else
         {
            _loc23_ = §1t1521s0§.getString(11348);
            _loc24_ = §1t1521s0§.getString(11349);
         }
         _loc25_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc23_ + "</text></dialogue>";
         _loc25_ = _loc25_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc24_ + "</text></dialogue>");
         _loc26_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc27_ = (§1t1523s0§.§1t5928s0§(_loc26_ + 1) - §1t1523s0§.§1t5928s0§(_loc26_)) / ((_loc26_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc27_ = 0;
         }
         _loc28_ = _loc26_ * 5;
         _loc29_ = "<intro>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc29_ = _loc29_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc29_ = _loc29_ + "<label>quest</label>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc29_ = _loc29_ + _loc25_;
         _loc29_ = _loc29_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc22_ + "</text>");
         _loc29_ = _loc29_ + ("<choice><text>" + _loc16_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + _loc14_ + "</id><qty>" + _loc13_ + "</qty><comp>gte</comp></has></condition></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + _loc18_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + _loc14_ + "</id><qty>" + _loc13_ + "</qty><comp>lt</comp></has></condition></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc29_ = _loc29_ + "<label>complete</label>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc20_ + "</text></dialogue>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc27_ + "</modify><end>0</end></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc28_ + "</modify><end>0</end></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + _loc14_ + "</id><modify>-" + _loc13_ + "</modify><end>0</end></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc29_ = _loc29_ + "<label>accept</label>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc19_ + "</text></dialogue>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc29_ = _loc29_ + "<label>leave</label>";
         _loc29_ = _loc29_ + "<outcome><end>-1</end></outcome>";
         _loc29_ = _loc29_ + "<label>talk</label>";
         _loc29_ = _loc29_ + this.§1t1621s0§(_loc12_,_loc8_);
         _loc29_ = _loc29_ + "<outcome><end>-1</end></outcome>";
         _loc29_ = _loc29_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc29_));
         _loc30_ = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc30_)));
         _loc31_ = "";
         _loc31_ = _loc31_ + "<step>";
         _loc31_ = _loc31_ + ("<node>" + param1 + "</node>");
         _loc31_ = _loc31_ + "<action>0</action>";
         _loc31_ = _loc31_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc31_ = _loc31_ + "</step>";
         _loc32_ = new §1t85s0§(XML(_loc31_));
         _loc30_ = "<reward>";
         _loc30_ = _loc30_ + "<forshow>1</forshow>";
         _loc30_ = _loc30_ + ("<exp>" + _loc27_ + "</exp>");
         _loc30_ = _loc30_ + ("<loot><id>" + 0 + "</id><qty>" + _loc28_ + "</qty></loot>");
         _loc30_ = _loc30_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc30_ = _loc30_ + "</reward>";
         _loc32_.§1t1260s0§(new §1t77s0§(XMLList(_loc30_)));
         _loc32_.title = _loc17_;
         _loc33_ = "";
         _loc33_ = _loc33_ + "<step>";
         _loc33_ = _loc33_ + ("<node>" + param1 + "</node>");
         _loc33_ = _loc33_ + "<action>0</action>";
         _loc33_ = _loc33_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc33_ = _loc33_ + "</step>";
         _loc34_ = new §1t85s0§(XML(_loc33_));
         _loc34_.title = §1t1521s0§.getString(11279,[_loc11_]);
         _loc29_ = "<intro>";
         _loc29_ = _loc29_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc22_ + "</text>");
         _loc29_ = _loc29_ + ("<choice><text>" + _loc16_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + _loc14_ + "</id><qty>" + _loc13_ + "</qty><comp>gte</comp></has></condition></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc29_ = _loc29_ + "<label>complete</label>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11277) + "</text></dialogue>");
         _loc29_ = _loc29_ + ("<outcome><id>" + _loc14_ + "</id><modify>-" + _loc13_ + "</modify></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc29_ = _loc29_ + "<label>leave</label>";
         _loc29_ = _loc29_ + "<outcome><end>-1</end></outcome>";
         _loc29_ = _loc29_ + "</intro>";
         _loc34_.intro = _loc34_.§1t1403s0§(XMLList(_loc29_));
         _loc30_ = "<reward>";
         _loc30_ = _loc30_ + ("<exp>" + _loc27_ + "</exp>");
         _loc30_ = _loc30_ + ("<loot><id>" + 0 + "</id><qty>" + _loc28_ + "</qty></loot>");
         _loc30_ = _loc30_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc30_ = _loc30_ + "</reward>";
         _loc34_.§1t1260s0§(new §1t77s0§(XMLList(_loc30_)));
         _loc35_ = new §1t69s0§(null);
         _loc35_.id = §1t11212s0§;
         _loc35_.startin = param1;
         _loc35_.name = _loc21_;
         _loc35_.level = 0;
         _loc35_.type = 3;
         _loc35_.startCondition = null;
         _loc35_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc35_.§1t1452s0§[0] = _loc10_;
         _loc35_.§1t1452s0§[1] = _loc32_;
         _loc35_.§1t1452s0§[2] = _loc34_;
         _loc12_.destroy();
         return _loc35_;
      }
      
      internal function §1t1614s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc9_:Point = null;
         var _loc10_:§1t85s0§ = null;
         var _loc11_:String = null;
         var _loc12_:§1t124s0§ = null;
         var _loc13_:String = null;
         var _loc14_:§1t58s0§ = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:String = null;
         var _loc30_:String = null;
         var _loc31_:String = null;
         var _loc32_:§1t85s0§ = null;
         var _loc33_:String = null;
         var _loc34_:§1t85s0§ = null;
         var _loc35_:§1t69s0§ = null;
         _loc9_ = this.§1t1133s0§(param1);
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         _loc10_ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11439s0§,param5,param6,param7);
         _loc11_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         _loc12_ = this.§1t1584s0§(param1,param7,param4);
         _loc13_ = _loc12_.§1t2217s0§().§1t513s0§();
         _loc14_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         _loc15_ = §1t1521s0§.getString(11241,[_loc13_]);
         _loc16_ = §1t1521s0§.getString(11242);
         _loc17_ = §1t1521s0§.getString(11245);
         _loc18_ = §1t1521s0§.getString(11277);
         _loc19_ = §1t1521s0§.getString(11251,[_loc13_,_loc11_]);
         _loc20_ = §1t1521s0§.getString(11279,[_loc11_]);
         _loc21_ = §1t1521s0§.getString(11290,[_loc13_]);
         _loc22_ = §1t1521s0§.getString(11274,[_loc21_]);
         _loc23_ = "";
         _loc24_ = "";
         _loc23_ = §1t1521s0§.getString(11354);
         _loc24_ = §1t1521s0§.getString(11355,[_loc13_]);
         _loc25_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc23_ + "</text></dialogue>";
         _loc25_ = _loc25_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc24_ + "</text></dialogue>");
         _loc25_ = _loc25_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc12_.§1t2222s0§() + "</text></dialogue>");
         _loc26_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc27_ = (§1t1523s0§.§1t5928s0§(_loc26_ + 1) - §1t1523s0§.§1t5928s0§(_loc26_)) / ((_loc26_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc27_ = 0;
         }
         _loc28_ = _loc26_ * 5;
         _loc29_ = "<intro>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc29_ = _loc29_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc29_ = _loc29_ + "<label>quest</label>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc29_ = _loc29_ + _loc25_;
         _loc29_ = _loc29_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc22_ + "</text>");
         _loc29_ = _loc29_ + ("<choice><text>" + _loc15_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + _loc16_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc29_ = _loc29_ + "<label>complete</label>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc18_ + "</text></dialogue>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc27_ + "</modify><end>0</end></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc28_ + "</modify><end>0</end></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 91 + "</id><modify>" + -1 + "</modify><end>0</end></outcome>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc29_ = _loc29_ + "<label>accept</label>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc17_ + "</text></dialogue>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc29_ = _loc29_ + "<label>leave</label>";
         _loc29_ = _loc29_ + "<outcome><end>-1</end></outcome>";
         _loc29_ = _loc29_ + "<label>talk</label>";
         _loc29_ = _loc29_ + this.§1t1621s0§(_loc14_,_loc8_);
         _loc29_ = _loc29_ + "<outcome><end>-1</end></outcome>";
         _loc29_ = _loc29_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc29_));
         _loc30_ = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc30_)));
         _loc31_ = "";
         _loc31_ = _loc31_ + "<step>";
         _loc31_ = _loc31_ + ("<node>" + _loc12_.§1t2218s0§() + "</node>");
         _loc31_ = _loc31_ + "<action>0</action>";
         _loc31_ = _loc31_ + "<roomobj><room>0</room><id>-1</id></roomobj>";
         _loc31_ = _loc31_ + "</step>";
         _loc32_ = new §1t85s0§(XML(_loc31_));
         _loc30_ = "<reward>";
         _loc30_ = _loc30_ + "<forshow>1</forshow>";
         _loc30_ = _loc30_ + ("<exp>" + _loc27_ + "</exp>");
         _loc30_ = _loc30_ + ("<loot><id>" + 0 + "</id><qty>" + _loc28_ + "</qty></loot>");
         _loc30_ = _loc30_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc30_ = _loc30_ + "</reward>";
         _loc32_.§1t1260s0§(new §1t77s0§(XMLList(_loc30_)));
         _loc32_.title = _loc19_;
         _loc33_ = "";
         _loc33_ = _loc33_ + "<step>";
         _loc33_ = _loc33_ + ("<node>" + param1 + "</node>");
         _loc33_ = _loc33_ + "<action>0</action>";
         _loc33_ = _loc33_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc33_ = _loc33_ + "</step>";
         _loc34_ = new §1t85s0§(XML(_loc33_));
         _loc34_.title = _loc20_;
         _loc29_ = "<intro>";
         _loc29_ = _loc29_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc22_ + "</text>");
         _loc29_ = _loc29_ + ("<choice><text>" + _loc15_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc29_ = _loc29_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc29_ = _loc29_ + "<label>complete</label>";
         _loc29_ = _loc29_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11277) + "</text></dialogue>");
         _loc29_ = _loc29_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc29_ = _loc29_ + "<label>leave</label>";
         _loc29_ = _loc29_ + "<outcome><end>-1</end></outcome>";
         _loc29_ = _loc29_ + "</intro>";
         _loc34_.intro = _loc34_.§1t1403s0§(XMLList(_loc29_));
         _loc30_ = "<reward>";
         _loc30_ = _loc30_ + ("<exp>" + _loc27_ + "</exp>");
         _loc30_ = _loc30_ + ("<loot><id>" + 0 + "</id><qty>" + _loc28_ + "</qty></loot>");
         _loc30_ = _loc30_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc30_ = _loc30_ + "</reward>";
         _loc34_.§1t1260s0§(new §1t77s0§(XMLList(_loc30_)));
         _loc35_ = new §1t69s0§(null);
         _loc35_.id = §1t11212s0§;
         _loc35_.startin = param1;
         _loc35_.name = _loc21_;
         _loc35_.level = 0;
         _loc35_.type = 3;
         _loc35_.startCondition = null;
         _loc35_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc35_.§1t1452s0§[0] = _loc10_;
         _loc35_.§1t1452s0§[1] = _loc32_;
         _loc35_.§1t1452s0§[2] = _loc34_;
         _loc14_.destroy();
         return _loc35_;
      }
      
      internal function §1t1615s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc9_:Point = null;
         var _loc10_:§1t71s0§ = null;
         var _loc11_:§1t85s0§ = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:§1t58s0§ = null;
         var _loc15_:§1t124s0§ = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:String = null;
         var _loc27_:String = null;
         var _loc28_:String = null;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:String = null;
         var _loc33_:String = null;
         var _loc34_:String = null;
         var _loc35_:§1t85s0§ = null;
         var _loc36_:String = null;
         var _loc37_:§1t85s0§ = null;
         var _loc38_:§1t69s0§ = null;
         _loc9_ = this.§1t1133s0§(param1);
         _loc10_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         if(param7 == 0)
         {
            --_loc9_.y;
         }
         else if(param7 == 1)
         {
            ++_loc9_.y;
         }
         else if(param7 == 2)
         {
            ++_loc9_.x;
         }
         else if(param7 == 3)
         {
            --_loc9_.x;
         }
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         _loc11_ = new §1t85s0§(null);
         _loc11_.nodeID = param1;
         _loc11_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11441s0§,param5,param6,param7);
         _loc12_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         _loc13_ = _loc8_.§1t1320s0§();
         _loc14_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         _loc15_ = new §1t124s0§(null,_loc13_);
         _loc16_ = §1t1521s0§.getString(11275);
         _loc17_ = §1t1521s0§.getString(11276);
         _loc18_ = §1t1521s0§.getString(11242);
         _loc19_ = §1t1521s0§.getString(11245);
         _loc20_ = §1t1521s0§.getString(11357);
         _loc21_ = §1t1521s0§.getString(11358,[_loc10_.§1t1341s0§()]);
         _loc22_ = §1t1521s0§.getString(11274,[_loc21_]);
         _loc23_ = §1t1521s0§.getString(11359);
         _loc24_ = §1t1521s0§.getString(11279,[_loc12_]);
         _loc25_ = §1t1521s0§.getString(11360);
         _loc26_ = "";
         _loc27_ = "";
         _loc26_ = §1t1521s0§.getString(11361,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
         _loc27_ = §1t1521s0§.getString(11362);
         _loc28_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc26_ + "</text></dialogue>";
         _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc27_ + "</text></dialogue>");
         _loc29_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc30_ = (§1t1523s0§.§1t5928s0§(_loc29_ + 1) - §1t1523s0§.§1t5928s0§(_loc29_)) / ((_loc29_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc30_ = 0;
         }
         _loc31_ = _loc29_ * 5;
         _loc32_ = "<intro>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc32_ = _loc32_ + "<label>quest</label>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc32_ = _loc32_ + _loc28_;
         _loc32_ = _loc32_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc22_ + "</text>");
         _loc32_ = _loc32_ + ("<choice><text>" + _loc16_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + _loc18_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc32_ = _loc32_ + "<label>complete</label>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc20_ + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc30_ + "</modify><end>0</end></outcome>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc31_ + "</modify><end>0</end></outcome>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc32_ = _loc32_ + "<label>accept</label>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc19_ + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc32_ = _loc32_ + "<label>leave</label>";
         _loc32_ = _loc32_ + "<outcome><end>-1</end></outcome>";
         _loc32_ = _loc32_ + "<label>talk</label>";
         _loc32_ = _loc32_ + this.§1t1621s0§(_loc14_,_loc8_);
         _loc32_ = _loc32_ + "<outcome><end>-1</end></outcome>";
         _loc32_ = _loc32_ + "</intro>";
         _loc11_.intro = _loc11_.§1t1403s0§(XMLList(_loc32_));
         _loc33_ = "<reward></reward>";
         _loc11_.§1t1260s0§(new §1t77s0§(XMLList(_loc33_)));
         _loc34_ = "";
         _loc34_ = _loc34_ + "<step>";
         _loc34_ = _loc34_ + ("<node>" + _loc15_.§1t2218s0§() + "</node>");
         _loc34_ = _loc34_ + "<action>0</action>";
         _loc34_ = _loc34_ + "<roomobj><room>0</room><id>4</id><name>ninjacontact</name><x>-1</x><property>31</property></roomobj>";
         _loc34_ = _loc34_ + "</step>";
         _loc32_ = "<intro>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11363) + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<dialogue><id>31</id><text>" + §1t1521s0§.getString(11364) + "</text></dialogue>");
         _loc32_ = _loc32_ + "</intro>";
         _loc35_ = new §1t85s0§(XML(_loc34_));
         _loc33_ = "<reward>";
         _loc33_ = _loc33_ + "<forshow>1</forshow>";
         _loc33_ = _loc33_ + ("<exp>" + _loc30_ + "</exp>");
         _loc33_ = _loc33_ + ("<loot><id>" + 0 + "</id><qty>" + _loc31_ + "</qty></loot>");
         _loc33_ = _loc33_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc33_ = _loc33_ + "</reward>";
         _loc35_.§1t1260s0§(new §1t77s0§(XMLList(_loc33_)));
         _loc35_.intro = _loc35_.§1t1403s0§(XMLList(_loc32_));
         _loc35_.title = _loc21_;
         _loc35_.stitle = _loc23_;
         _loc36_ = "";
         _loc36_ = _loc36_ + "<step>";
         _loc36_ = _loc36_ + ("<node>" + param1 + "</node>");
         _loc36_ = _loc36_ + "<action>0</action>";
         _loc36_ = _loc36_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc36_ = _loc36_ + "</step>";
         _loc37_ = new §1t85s0§(XML(_loc36_));
         _loc37_.title = _loc24_;
         _loc32_ = "<intro>";
         _loc32_ = _loc32_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc22_ + "</text>");
         _loc32_ = _loc32_ + ("<choice><text>" + _loc17_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc32_ = _loc32_ + "<label>complete</label>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc20_ + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc32_ = _loc32_ + "<label>leave</label>";
         _loc32_ = _loc32_ + "<outcome><end>-1</end></outcome>";
         _loc32_ = _loc32_ + "</intro>";
         _loc37_.intro = _loc37_.§1t1403s0§(XMLList(_loc32_));
         _loc33_ = "<reward>";
         _loc33_ = _loc33_ + ("<exp>" + _loc30_ + "</exp>");
         _loc33_ = _loc33_ + ("<loot><id>" + 0 + "</id><qty>" + _loc31_ + "</qty></loot>");
         _loc33_ = _loc33_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc33_ = _loc33_ + "</reward>";
         _loc37_.§1t1260s0§(new §1t77s0§(XMLList(_loc33_)));
         _loc38_ = new §1t69s0§(null);
         _loc38_.id = §1t11212s0§;
         _loc38_.startin = param1;
         _loc38_.name = _loc25_;
         _loc38_.level = 0;
         _loc38_.type = 3;
         _loc38_.startCondition = null;
         _loc38_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc38_.§1t1452s0§[0] = _loc11_;
         _loc38_.§1t1452s0§[1] = _loc35_;
         _loc38_.§1t1452s0§[2] = _loc37_;
         _loc14_.destroy();
         return _loc38_;
      }
      
      internal function §1t1616s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc9_:Point = null;
         var _loc10_:§1t71s0§ = null;
         var _loc11_:§1t85s0§ = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:§1t58s0§ = null;
         var _loc15_:§1t124s0§ = null;
         var _loc16_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:String = null;
         var _loc27_:String = null;
         var _loc28_:Boolean = false;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:String = null;
         var _loc33_:String = null;
         var _loc34_:String = null;
         var _loc35_:§1t85s0§ = null;
         var _loc36_:String = null;
         var _loc37_:§1t85s0§ = null;
         var _loc38_:§1t69s0§ = null;
         _loc9_ = this.§1t1133s0§(param1);
         _loc10_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         if(param7 == 0)
         {
            --_loc9_.y;
         }
         else if(param7 == 1)
         {
            ++_loc9_.y;
         }
         else if(param7 == 2)
         {
            ++_loc9_.x;
         }
         else if(param7 == 3)
         {
            --_loc9_.x;
         }
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         _loc11_ = new §1t85s0§(null);
         _loc11_.nodeID = param1;
         _loc11_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11440s0§,param5,param6,param7);
         _loc12_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         _loc13_ = _loc8_.§1t1313s0§();
         _loc14_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         _loc15_ = new §1t124s0§(null,_loc13_);
         _loc16_ = §1t1521s0§.getString(11242);
         var _loc17_:String = §1t1521s0§.getString(11245);
         _loc18_ = §1t1521s0§.getString(11357);
         _loc19_ = §1t1521s0§.getString(11276);
         _loc20_ = §1t1521s0§.getString(11366,[_loc10_.§1t1341s0§()]);
         _loc21_ = §1t1521s0§.getString(11274,[_loc20_]);
         _loc22_ = §1t1521s0§.getString(448,[§1t1521s0§.getString(5055)]);
         _loc23_ = §1t1521s0§.getString(11279,[_loc12_]);
         _loc24_ = §1t1521s0§.getString(11367);
         _loc25_ = "";
         _loc26_ = "";
         if(param5 == §1t1799s0§.§1t11457s0§)
         {
            _loc25_ = §1t1521s0§.getString(11368,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
            _loc26_ = §1t1521s0§.getString(11362);
         }
         else if(param5 == §1t1799s0§.§1t11459s0§)
         {
            _loc25_ = §1t1521s0§.getString(11369,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
            _loc26_ = §1t1521s0§.getString(11362);
         }
         else if(param5 == §1t1799s0§.§1t11460s0§)
         {
            _loc25_ = §1t1521s0§.getString(11370,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
            _loc26_ = §1t1521s0§.getString(11371);
         }
         else if(param5 == §1t1799s0§.§1t11461s0§)
         {
            _loc25_ = §1t1521s0§.getString(11372,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
            _loc26_ = §1t1521s0§.getString(11362);
         }
         else if(param5 == §1t1799s0§.§1t11462s0§)
         {
            _loc25_ = §1t1521s0§.getString(11373,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
            _loc26_ = §1t1521s0§.getString(11374);
         }
         else
         {
            _loc25_ = §1t1521s0§.getString(11375,[_loc8_.§1t1341s0§(),§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
            _loc26_ = §1t1521s0§.getString(11376);
         }
         _loc27_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc25_ + "</text></dialogue>";
         _loc27_ = _loc27_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc26_ + "</text></dialogue>");
         _loc28_ = _loc10_.§1t1275s0§ < _loc8_.§1t1275s0§;
         _loc29_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc30_ = (§1t1523s0§.§1t5928s0§(_loc29_ + 1) - §1t1523s0§.§1t5928s0§(_loc29_)) / ((_loc29_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc30_ = 0;
         }
         _loc31_ = _loc29_ * 5;
         _loc32_ = "<intro>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc32_ = _loc32_ + "<label>quest</label>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc32_ = _loc32_ + _loc27_;
         _loc32_ = _loc32_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc21_ + "</text>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11275) + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + _loc16_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc32_ = _loc32_ + "<label>complete</label>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc18_ + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc30_ + "</modify><end>0</end></outcome>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc31_ + "</modify><end>0</end></outcome>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc32_ = _loc32_ + "<label>accept</label>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11245) + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc32_ = _loc32_ + "<label>leave</label>";
         _loc32_ = _loc32_ + "<outcome><end>-1</end></outcome>";
         _loc32_ = _loc32_ + "<label>talk</label>";
         _loc32_ = _loc32_ + this.§1t1621s0§(_loc14_,_loc8_);
         _loc32_ = _loc32_ + "<outcome><end>-1</end></outcome>";
         _loc32_ = _loc32_ + "</intro>";
         _loc11_.intro = _loc11_.§1t1403s0§(XMLList(_loc32_));
         _loc33_ = "<reward></reward>";
         _loc11_.§1t1260s0§(new §1t77s0§(XMLList(_loc33_)));
         _loc34_ = "";
         _loc34_ = _loc34_ + "<step>";
         _loc34_ = _loc34_ + ("<node>" + _loc15_.§1t2218s0§() + "</node>");
         _loc34_ = _loc34_ + "<action>0</action>";
         _loc34_ = _loc34_ + "<roomobj><room>0</room><id>4</id><name>merccaptain</name><x>-1</x><property>142</property></roomobj>";
         _loc34_ = _loc34_ + "</step>";
         if(!_loc28_)
         {
            _loc32_ = "<intro>";
            _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11363) + "</text></dialogue>");
            _loc32_ = _loc32_ + ("<dialogue><id>142</id><text>" + §1t1521s0§.getString(11377) + "</text></dialogue>");
            _loc32_ = _loc32_ + "</intro>";
         }
         else
         {
            _loc32_ = "<intro>";
            _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11363) + "</text></dialogue>");
            _loc32_ = _loc32_ + ("<dialogue><id>142</id><text>" + §1t1521s0§.getString(11378,[_loc8_.§1t1341s0§(),_loc10_.§1t1341s0§()]) + "</text></dialogue>");
            _loc32_ = _loc32_ + ("<option><id>142</id><text>" + §1t1521s0§.getString(11379) + "</text>");
            _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11380,[§1t1521s0§.getString(5055),500]) + "</text><gotolabel>smallbribe</gotolabel><condition><has><id>" + 11 + "</id><qty>" + 500 + "</qty><comp>gte</comp></has></condition></choice>");
            _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11380,[§1t1521s0§.getString(5055),1000]) + "</text><gotolabel>bigbribe</gotolabel><condition><has><id>" + 11 + "</id><qty>" + 1000 + "</qty><comp>gte</comp></has></condition></choice>");
            _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
            _loc32_ = _loc32_ + "<label>smallbribe</label>";
            _loc32_ = _loc32_ + ("<outcome><id>" + 11 + "</id><modify>" + -500 + "</modify><end>0</end></outcome>");
            _loc32_ = _loc32_ + "<goto>finish</goto>";
            _loc32_ = _loc32_ + "<label>bigbribe</label>";
            _loc32_ = _loc32_ + ("<outcome><id>" + 11 + "</id><modify>" + -1000 + "</modify><end>0</end></outcome>");
            _loc32_ = _loc32_ + "<goto>finish</goto>";
            _loc32_ = _loc32_ + "<label>finish</label>";
            _loc32_ = _loc32_ + ("<dialogue><id>142</id><text>" + §1t1521s0§.getString(11381) + "</text></dialogue>");
            _loc32_ = _loc32_ + "<outcome><end>1</end></outcome>";
            _loc32_ = _loc32_ + "<label>leave</label>";
            _loc32_ = _loc32_ + "<outcome><end>-1</end></outcome>";
            _loc32_ = _loc32_ + "</intro>";
         }
         _loc35_ = new §1t85s0§(XML(_loc34_));
         _loc33_ = "<reward>";
         _loc33_ = _loc33_ + "<forshow>1</forshow>";
         _loc33_ = _loc33_ + ("<exp>" + _loc30_ + "</exp>");
         _loc33_ = _loc33_ + ("<loot><id>" + 0 + "</id><qty>" + _loc31_ + "</qty></loot>");
         _loc33_ = _loc33_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc33_ = _loc33_ + "</reward>";
         _loc35_.§1t1260s0§(new §1t77s0§(XMLList(_loc33_)));
         _loc35_.intro = _loc35_.§1t1403s0§(XMLList(_loc32_));
         _loc35_.title = _loc20_;
         _loc35_.stitle = _loc22_;
         _loc36_ = "";
         _loc36_ = _loc36_ + "<step>";
         _loc36_ = _loc36_ + ("<node>" + param1 + "</node>");
         _loc36_ = _loc36_ + "<action>0</action>";
         _loc36_ = _loc36_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc36_ = _loc36_ + "</step>";
         _loc37_ = new §1t85s0§(XML(_loc36_));
         _loc37_.title = _loc23_;
         _loc32_ = "<intro>";
         _loc32_ = _loc32_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc21_ + "</text>");
         _loc32_ = _loc32_ + ("<choice><text>" + _loc19_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc32_ = _loc32_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc32_ = _loc32_ + "<label>complete</label>";
         _loc32_ = _loc32_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc18_ + "</text></dialogue>");
         _loc32_ = _loc32_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc32_ = _loc32_ + "<label>leave</label>";
         _loc32_ = _loc32_ + "<outcome><end>-1</end></outcome>";
         _loc32_ = _loc32_ + "</intro>";
         _loc37_.intro = _loc37_.§1t1403s0§(XMLList(_loc32_));
         _loc33_ = "<reward>";
         _loc33_ = _loc33_ + ("<exp>" + _loc30_ + "</exp>");
         _loc33_ = _loc33_ + ("<loot><id>" + 0 + "</id><qty>" + _loc31_ + "</qty></loot>");
         _loc33_ = _loc33_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc33_ = _loc33_ + "</reward>";
         _loc37_.§1t1260s0§(new §1t77s0§(XMLList(_loc33_)));
         _loc38_ = new §1t69s0§(null);
         _loc38_.id = §1t11212s0§;
         _loc38_.startin = param1;
         _loc38_.name = _loc24_;
         _loc38_.level = 0;
         _loc38_.type = 3;
         _loc38_.startCondition = null;
         _loc38_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc38_.§1t1452s0§[0] = _loc11_;
         _loc38_.§1t1452s0§[1] = _loc35_;
         _loc38_.§1t1452s0§[2] = _loc37_;
         _loc14_.destroy();
         return _loc38_;
      }
      
      internal function §1t1617s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:Point = null;
         var _loc9_:§1t71s0§ = null;
         var _loc10_:§1t85s0§ = null;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:§1t58s0§ = null;
         var _loc14_:§1t124s0§ = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:String = null;
         var _loc27_:String = null;
         var _loc28_:String = null;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:String = null;
         var _loc34_:String = null;
         var _loc35_:String = null;
         var _loc36_:String = null;
         var _loc37_:§1t85s0§ = null;
         var _loc38_:String = null;
         var _loc39_:§1t85s0§ = null;
         var _loc40_:§1t69s0§ = null;
         var _loc41_:int = 0;
         var _loc42_:int = 0;
         var _loc43_:String = null;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         _loc8_ = this.§1t1133s0§(param1);
         _loc9_ = §1t70s0§.instance.§1t1126s0§(_loc8_.x,_loc8_.y);
         _loc10_ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11442s0§,param5,param6,param7);
         _loc11_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         _loc12_ = _loc9_.§1t1313s0§();
         _loc13_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         _loc14_ = new §1t124s0§(null,_loc12_);
         _loc15_ = §1t1521s0§.getString(11383,[_loc9_.§1t1341s0§()]);
         _loc16_ = §1t1521s0§.getString(11274,[_loc15_]);
         _loc17_ = §1t1521s0§.getString(11275);
         _loc18_ = §1t1521s0§.getString(11276);
         _loc19_ = §1t1521s0§.getString(11242);
         _loc20_ = §1t1521s0§.getString(11245);
         _loc21_ = §1t1521s0§.getString(11277);
         _loc22_ = §1t1521s0§.getString(448,[§1t1521s0§.getString(5055)]);
         _loc23_ = §1t1521s0§.getString(448,[§1t1521s0§.getString(5055)]);
         _loc24_ = §1t1521s0§.getString(11279,[_loc11_]);
         _loc25_ = "";
         _loc26_ = "";
         _loc27_ = "";
         _loc25_ = §1t1521s0§.getString(11384);
         _loc26_ = §1t1521s0§.getString(11385,[§1t70s0§.instance.§1t1155s0§(_loc14_.nodeid,_loc14_.roomid)]);
         _loc27_ = §1t1521s0§.getString(11386);
         _loc28_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc25_ + "</text></dialogue>";
         _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc26_ + "</text></dialogue>");
         _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc27_ + "</text></dialogue>");
         _loc29_ = _loc13_.rand(3);
         _loc30_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc31_ = (§1t1523s0§.§1t5928s0§(_loc30_ + 1) - §1t1523s0§.§1t5928s0§(_loc30_)) / ((_loc30_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc31_ = 0;
         }
         _loc32_ = _loc30_ * 5;
         _loc33_ = "<intro>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>quest</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc33_ = _loc33_ + _loc28_;
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc16_ + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc17_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc19_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>complete</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc21_ + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc31_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc32_ + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc33_ = _loc33_ + "<label>accept</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc20_ + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc33_ = _loc33_ + "<label>leave</label>";
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "<label>talk</label>";
         _loc33_ = _loc33_ + this.§1t1621s0§(_loc13_,_loc9_);
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc33_));
         _loc34_ = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         _loc35_ = "";
         _loc35_ = _loc35_ + "<step>";
         _loc35_ = _loc35_ + ("<node>" + _loc14_.§1t2218s0§() + "</node>");
         _loc35_ = _loc35_ + "<roomobj><room>0</room><id>4</id><name>merccaptain</name><x>-1</x><property>142</property></roomobj>";
         _loc36_ = "";
         if(_loc29_ == 0)
         {
            _loc35_ += "<action>0</action>";
            _loc33_ = "<intro>";
            _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11387,[_loc9_.§1t1341s0§()]) + "</text></dialogue>");
            _loc33_ = _loc33_ + ("<dialogue><id>142</id><text>" + §1t1521s0§.getString(11388) + "</text></dialogue>");
            _loc33_ = _loc33_ + "</intro>";
         }
         else if(_loc29_ == 1)
         {
            _loc35_ += "<action>1</action>";
            _loc33_ = "<intro>";
            _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11387,[_loc9_.§1t1341s0§()]) + "</text></dialogue>");
            _loc33_ = _loc33_ + ("<option><id>142</id><text>" + §1t1521s0§.getString(11389) + "</text>");
            _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11390) + "</text><gotolabel>fight</gotolabel></choice>");
            _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11391) + "</text><gotolabel>leave</gotolabel></choice></option>");
            _loc33_ = _loc33_ + "<label>fight</label>";
            _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11392) + "</text></dialogue>");
            _loc33_ = _loc33_ + "<outcome><end>1</end></outcome>";
            _loc33_ = _loc33_ + "<label>leave</label>";
            _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
            _loc33_ = _loc33_ + "</intro>";
            _loc41_ = §1t70s0§.instance.§1t1139s0§(param1);
            _loc42_ = _loc13_.rand(3) + 3;
            _loc43_ = "33|34|35|36|37|38";
            _loc44_ = §1t70s0§.instance.§1t1160s0§(_loc14_.§1t2218s0§());
            _loc45_ = 0;
            while(_loc45_ < _loc42_)
            {
               if(_loc45_ == _loc42_ - 1)
               {
                  _loc35_ += "<wave><enemy><x>" + -100 + "</x><id>" + _loc43_ + "</id><lvl>" + _loc41_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (_loc44_ + 100) + "</x><id>" + _loc43_ + "</id><lvl>" + _loc41_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty></enemy><enemy><fatal>0</fatal><id>39</id><lvl>" + (_loc41_ + 2).toString() + "</lvl><qty>" + 1 + "</qty></enemy></wave>";
               }
               else if(_loc45_ == 0)
               {
                  _loc35_ += "<wave><enemy><id>" + _loc43_ + "</id><lvl>" + _loc41_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty><x>650</x></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave>";
               }
               else
               {
                  _loc35_ += "<wave><enemy><x>" + -100 + "</x><id>" + _loc43_ + "</id><lvl>" + _loc41_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (_loc44_ + 100) + "</x><id>" + _loc43_ + "</id><lvl>" + _loc41_ + "</lvl><qty>" + (_loc13_.rand(3) + 3).toString() + "</qty></enemy></wave>";
               }
               _loc45_++;
            }
            _loc36_ = "<ending>";
            _loc36_ = _loc36_ + ("<dialogue><id>142</id><text>" + §1t1521s0§.getString(11393) + "</text></dialogue>");
            _loc36_ = _loc36_ + "</ending>";
         }
         else
         {
            _loc35_ += "<action>0</action>";
            _loc33_ = "<intro>";
            _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11387,[_loc9_.§1t1341s0§()]) + "</text></dialogue>");
            _loc33_ = _loc33_ + ("<option><id>142</id><text>" + §1t1521s0§.getString(11394) + "</text>");
            _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11380,[§1t1521s0§.getString(5055),1000]) + "</text><gotolabel>bribe</gotolabel><condition><has><id>" + 11 + "</id><qty>" + 1000 + "</qty><comp>gte</comp></has></condition></choice>");
            _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
            _loc33_ = _loc33_ + "<label>bribe</label>";
            _loc33_ = _loc33_ + ("<outcome><id>" + 11 + "</id><modify>" + -1000 + "</modify><end>0</end></outcome>");
            _loc33_ = _loc33_ + ("<dialogue><id>142</id><text>" + §1t1521s0§.getString(11395) + "</text></dialogue>");
            _loc33_ = _loc33_ + "<outcome><end>1</end></outcome>";
            _loc33_ = _loc33_ + "<label>leave</label>";
            _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
            _loc33_ = _loc33_ + "</intro>";
         }
         _loc35_ += "</step>";
         _loc37_ = new §1t85s0§(XML(_loc35_));
         _loc34_ = "<reward>";
         _loc34_ = _loc34_ + "<forshow>1</forshow>";
         _loc34_ = _loc34_ + ("<exp>" + _loc31_ + "</exp>");
         _loc34_ = _loc34_ + ("<loot><id>" + 0 + "</id><qty>" + _loc32_ + "</qty></loot>");
         _loc34_ = _loc34_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc34_ = _loc34_ + "</reward>";
         _loc37_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         _loc37_.intro = _loc37_.§1t1403s0§(XMLList(_loc33_));
         _loc37_.title = _loc22_;
         _loc37_.stitle = _loc23_;
         if(_loc36_ != "")
         {
            _loc37_.ending = _loc37_.§1t1403s0§(XMLList(_loc36_));
         }
         _loc38_ = "";
         _loc38_ = _loc38_ + "<step>";
         _loc38_ = _loc38_ + ("<node>" + param1 + "</node>");
         _loc38_ = _loc38_ + "<action>0</action>";
         _loc38_ = _loc38_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc38_ = _loc38_ + "</step>";
         _loc39_ = new §1t85s0§(XML(_loc38_));
         _loc39_.title = _loc24_;
         _loc33_ = "<intro>";
         _loc33_ = _loc33_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc16_ + "</text>");
         _loc33_ = _loc33_ + ("<choice><text>" + _loc18_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc33_ = _loc33_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc33_ = _loc33_ + "<label>complete</label>";
         _loc33_ = _loc33_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11277) + "</text></dialogue>");
         _loc33_ = _loc33_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc33_ = _loc33_ + "<label>leave</label>";
         _loc33_ = _loc33_ + "<outcome><end>-1</end></outcome>";
         _loc33_ = _loc33_ + "</intro>";
         _loc39_.intro = _loc39_.§1t1403s0§(XMLList(_loc33_));
         _loc34_ = "<reward>";
         _loc34_ = _loc34_ + ("<exp>" + _loc31_ + "</exp>");
         _loc34_ = _loc34_ + ("<loot><id>" + 0 + "</id><qty>" + _loc32_ + "</qty></loot>");
         _loc34_ = _loc34_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc34_ = _loc34_ + "</reward>";
         _loc39_.§1t1260s0§(new §1t77s0§(XMLList(_loc34_)));
         _loc40_ = new §1t69s0§(null);
         _loc40_.id = §1t11212s0§;
         _loc40_.startin = param1;
         _loc40_.name = _loc15_;
         _loc40_.level = 0;
         _loc40_.type = 3;
         _loc40_.startCondition = null;
         _loc40_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc40_.§1t1452s0§[0] = _loc10_;
         _loc40_.§1t1452s0§[1] = _loc37_;
         _loc40_.§1t1452s0§[2] = _loc39_;
         _loc13_.destroy();
         return _loc40_;
      }
      
      internal function §1t1618s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc9_:Point = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:§1t85s0§ = null;
         var _loc13_:String = null;
         var _loc14_:§1t58s0§ = null;
         var _loc15_:§1t124s0§ = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:String = null;
         var _loc27_:String = null;
         var _loc28_:String = null;
         var _loc29_:String = null;
         var _loc30_:String = null;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:String = null;
         var _loc35_:String = null;
         var _loc36_:String = null;
         var _loc37_:§1t85s0§ = null;
         var _loc38_:String = null;
         var _loc39_:§1t85s0§ = null;
         var _loc40_:§1t69s0§ = null;
         _loc9_ = this.§1t1133s0§(param1);
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         _loc10_ = _loc8_.§1t1306s0§();
         _loc11_ = 0;
         while(_loc11_ < 4 && _loc10_ == -1)
         {
            if(_loc11_ == 0 && Boolean(§1t1524s0§.§1t7976s0§(_loc9_.x,_loc9_.y - 1)))
            {
               _loc10_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y - 1).§1t1306s0§();
            }
            else if(_loc11_ == 1 && Boolean(§1t1524s0§.§1t7976s0§(_loc9_.x,_loc9_.y + 1)))
            {
               _loc10_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y + 1).§1t1306s0§();
            }
            else if(_loc11_ == 2 && Boolean(§1t1524s0§.§1t7976s0§(_loc9_.x + 1,_loc9_.y)))
            {
               _loc10_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x + 1,_loc9_.y).§1t1306s0§();
            }
            else if(_loc11_ == 3 && Boolean(§1t1524s0§.§1t7976s0§(_loc9_.x - 1,_loc9_.y)))
            {
               _loc10_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x - 1,_loc9_.y).§1t1306s0§();
            }
            _loc11_++;
         }
         if(_loc10_ == -1)
         {
            return this.§1t1606s0§(param1,param2,param3,param4);
         }
         _loc12_ = new §1t85s0§(null);
         _loc12_.nodeID = param1;
         _loc12_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11443s0§,param5,param6,param7);
         _loc13_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         _loc14_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         _loc15_ = new §1t124s0§(null,_loc10_);
         _loc16_ = §1t1521s0§.getString(11396,[_loc8_.§1t1341s0§()]);
         _loc17_ = §1t1521s0§.getString(11242);
         var _loc18_:String = §1t1521s0§.getString(11245);
         _loc19_ = §1t1521s0§.getString(11275);
         _loc20_ = §1t1521s0§.getString(11276);
         _loc21_ = §1t1521s0§.getString(11277);
         _loc22_ = §1t1521s0§.getString(448,[§1t1521s0§.getString(5008)]);
         _loc23_ = §1t1521s0§.getString(448,[§1t1521s0§.getString(5008)]);
         _loc24_ = §1t1521s0§.getString(11279,[_loc13_]);
         _loc25_ = §1t1521s0§.getString(11397);
         _loc26_ = "";
         _loc27_ = "";
         _loc28_ = "";
         _loc29_ = "";
         _loc26_ = §1t1521s0§.getString(11398);
         _loc27_ = §1t1521s0§.getString(11399);
         _loc28_ = §1t1521s0§.getString(11400,[§1t70s0§.instance.§1t1155s0§(_loc15_.nodeid,_loc15_.roomid)]);
         _loc29_ = §1t1521s0§.getString(11401);
         _loc30_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc26_ + "</text></dialogue>";
         _loc30_ = _loc30_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc27_ + "</text></dialogue>");
         _loc30_ = _loc30_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc28_ + "</text></dialogue>");
         _loc30_ = _loc30_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc29_ + "</text></dialogue>");
         _loc31_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc32_ = (§1t1523s0§.§1t5928s0§(_loc31_ + 1) - §1t1523s0§.§1t5928s0§(_loc31_)) / ((_loc31_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc32_ = 0;
         }
         _loc33_ = _loc31_ * 5;
         _loc34_ = "<intro>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc34_ = _loc34_ + "<label>quest</label>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc34_ = _loc34_ + _loc30_;
         _loc34_ = _loc34_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc16_ + "</text>");
         _loc34_ = _loc34_ + ("<choice><text>" + _loc19_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + _loc17_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc34_ = _loc34_ + "<label>complete</label>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc21_ + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 9 + "</id><modify>" + _loc32_ + "</modify><end>0</end></outcome>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 11 + "</id><modify>" + _loc33_ + "</modify><end>0</end></outcome>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>0</end></outcome>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 50007 + "</id><modify>" + 5 + "</modify><end>1</end></outcome>");
         _loc34_ = _loc34_ + "<label>accept</label>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11245) + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc34_ = _loc34_ + "<label>leave</label>";
         _loc34_ = _loc34_ + "<outcome><end>-1</end></outcome>";
         _loc34_ = _loc34_ + "<label>talk</label>";
         _loc34_ = _loc34_ + this.§1t1621s0§(_loc14_,_loc8_);
         _loc34_ = _loc34_ + "<outcome><end>-1</end></outcome>";
         _loc34_ = _loc34_ + "</intro>";
         _loc12_.intro = _loc12_.§1t1403s0§(XMLList(_loc34_));
         _loc35_ = "<reward></reward>";
         _loc12_.§1t1260s0§(new §1t77s0§(XMLList(_loc35_)));
         _loc36_ = "";
         _loc36_ = _loc36_ + "<step>";
         _loc36_ = _loc36_ + ("<node>" + _loc15_.§1t2218s0§() + "</node>");
         _loc36_ = _loc36_ + "<action>0</action>";
         _loc36_ = _loc36_ + "<roomobj><room>0</room><id>4</id><name>monkcontact</name><x>-1</x><property>109</property></roomobj>";
         _loc36_ = _loc36_ + "</step>";
         _loc34_ = "<intro>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11402,[_loc8_.§1t1341s0§()]) + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<dialogue><id>109</id><text>" + §1t1521s0§.getString(11403) + "</text></dialogue>");
         _loc34_ = _loc34_ + "</intro>";
         _loc37_ = new §1t85s0§(XML(_loc36_));
         _loc35_ = "<reward>";
         _loc35_ = _loc35_ + "<forshow>1</forshow>";
         _loc35_ = _loc35_ + ("<exp>" + _loc32_ + "</exp>");
         _loc35_ = _loc35_ + ("<loot><id>" + 0 + "</id><qty>" + _loc33_ + "</qty></loot>");
         _loc35_ = _loc35_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc35_ = _loc35_ + "</reward>";
         _loc37_.§1t1260s0§(new §1t77s0§(XMLList(_loc35_)));
         _loc37_.intro = _loc37_.§1t1403s0§(XMLList(_loc34_));
         _loc37_.title = _loc22_;
         _loc37_.stitle = _loc23_;
         _loc38_ = "";
         _loc38_ = _loc38_ + "<step>";
         _loc38_ = _loc38_ + ("<node>" + param1 + "</node>");
         _loc38_ = _loc38_ + "<action>0</action>";
         _loc38_ = _loc38_ + ("<roomobj><room>" + param2 + "</room><id>-1</id></roomobj>");
         _loc38_ = _loc38_ + "</step>";
         _loc39_ = new §1t85s0§(XML(_loc38_));
         _loc39_.title = _loc24_;
         _loc34_ = "<intro>";
         _loc34_ = _loc34_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc16_ + "</text>");
         _loc34_ = _loc34_ + ("<choice><text>" + _loc20_ + "</text><gotolabel>complete</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 1 + "</qty><comp>gte</comp></has></condition></choice>");
         _loc34_ = _loc34_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc34_ = _loc34_ + "<label>complete</label>";
         _loc34_ = _loc34_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc21_ + "</text></dialogue>");
         _loc34_ = _loc34_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc34_ = _loc34_ + "<label>leave</label>";
         _loc34_ = _loc34_ + "<outcome><end>-1</end></outcome>";
         _loc34_ = _loc34_ + "</intro>";
         _loc39_.intro = _loc39_.§1t1403s0§(XMLList(_loc34_));
         _loc35_ = "<reward>";
         _loc35_ = _loc35_ + ("<exp>" + _loc32_ + "</exp>");
         _loc35_ = _loc35_ + ("<loot><id>" + 0 + "</id><qty>" + _loc33_ + "</qty></loot>");
         _loc35_ = _loc35_ + ("<loot><id>" + 50007 + "</id><qty>" + 5 + "</qty></loot>");
         _loc35_ = _loc35_ + "</reward>";
         _loc39_.§1t1260s0§(new §1t77s0§(XMLList(_loc35_)));
         _loc40_ = new §1t69s0§(null);
         _loc40_.id = §1t11212s0§;
         _loc40_.startin = param1;
         _loc40_.name = _loc25_;
         _loc40_.level = 0;
         _loc40_.type = 3;
         _loc40_.startCondition = null;
         _loc40_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc40_.§1t1452s0§[0] = _loc12_;
         _loc40_.§1t1452s0§[1] = _loc37_;
         _loc40_.§1t1452s0§[2] = _loc39_;
         _loc14_.destroy();
         return _loc40_;
      }
      
      internal function §1t1619s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:§1t71s0§ = null;
         var _loc9_:Point = null;
         var _loc10_:§1t85s0§ = null;
         var _loc11_:String = null;
         var _loc12_:§1t58s0§ = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc15_:int = 0;
         var _loc16_:String = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:int = 0;
         var _loc23_:String = null;
         var _loc24_:§1t69s0§ = null;
         _loc9_ = this.§1t1133s0§(param1);
         _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc9_.x,_loc9_.y);
         _loc10_ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 6;
         _loc10_.bg = -1;
         _loc10_.stagewidth = §1t70s0§.instance.§1t1160s0§(param1);
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11444s0§,param5,param6,param7);
         _loc11_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4);
         _loc12_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         _loc15_ = _loc12_.rand(4);
         if(_loc15_ == 0)
         {
            _loc13_ = §1t1521s0§.getString(11404);
         }
         else if(_loc15_ == 1)
         {
            _loc13_ = §1t1521s0§.getString(11405);
         }
         else if(_loc15_ == 2)
         {
            _loc13_ = §1t1521s0§.getString(11406);
         }
         else if(_loc15_ == 3)
         {
            _loc13_ = §1t1521s0§.getString(11407);
         }
         _loc15_ = _loc12_.rand(4);
         if(_loc15_ == 0)
         {
            _loc14_ = §1t1521s0§.getString(11408);
         }
         else if(_loc15_ == 1)
         {
            _loc14_ = §1t1521s0§.getString(11409);
         }
         else if(_loc15_ == 2)
         {
            _loc14_ = §1t1521s0§.getString(11410);
         }
         else if(_loc15_ == 3)
         {
            _loc14_ = §1t1521s0§.getString(11411);
         }
         _loc16_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc13_ + "</text></dialogue>";
         _loc17_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc18_ = (§1t1523s0§.§1t5928s0§(_loc17_ + 1) - §1t1523s0§.§1t5928s0§(_loc17_)) / ((_loc17_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc18_ = 0;
         }
         _loc19_ = _loc17_ * 5;
         _loc18_ /= 2;
         _loc19_ /= 2;
         _loc20_ = "<intro>";
         _loc20_ = _loc20_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc20_ = _loc20_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc20_ = _loc20_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>duel</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc20_ = _loc20_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc20_ = _loc20_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc20_ = _loc20_ + "<label>duel</label>";
         _loc20_ = _loc20_ + _loc16_;
         _loc20_ = _loc20_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11412,[_loc11_]) + "</text>");
         _loc20_ = _loc20_ + ("<choice><text>" + §1t1521s0§.getString(11413) + "</text><gotolabel>accept</gotolabel></choice>");
         _loc20_ = _loc20_ + ("<choice><text>" + §1t1521s0§.getString(11414) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc20_ = _loc20_ + "<label>accept</label>";
         _loc20_ = _loc20_ + "<outcome><end>1</end></outcome>";
         _loc20_ = _loc20_ + "<label>leave</label>";
         _loc20_ = _loc20_ + "<outcome><end>-1</end></outcome>";
         _loc20_ = _loc20_ + "<label>talk</label>";
         _loc20_ = _loc20_ + this.§1t1621s0§(_loc12_,_loc8_);
         _loc20_ = _loc20_ + "<outcome><end>-1</end></outcome>";
         _loc20_ = _loc20_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc20_));
         _loc21_ = "<ending>";
         _loc21_ = _loc21_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc14_ + "</text></dialogue>");
         _loc21_ = _loc21_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
         _loc21_ = _loc21_ + "</ending>";
         _loc10_.ending = _loc10_.§1t1403s0§(XMLList(_loc21_));
         _loc22_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc10_.wave = new Vector.<§1t116s0§>();
         _loc10_.wave.push(new §1t116s0§(XML("<wave><enemy><fatal>0</fatal><id>" + §1t76s0§.§1t9196s0§ + "</id><lvl>" + _loc22_.toString() + "</lvl><qty>" + 1 + "</qty><x>650</x></enemy></wave>")));
         _loc23_ = "<reward>";
         _loc23_ = _loc23_ + ("<exp>" + _loc18_ + "</exp>");
         _loc23_ = _loc23_ + ("<loot><id>" + 0 + "</id><qty>" + _loc19_ + "</qty></loot>");
         _loc23_ = _loc23_ + "</reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc23_)));
         _loc24_ = new §1t69s0§(null);
         _loc24_.id = §1t11212s0§;
         _loc24_.startin = param1;
         _loc24_.name = "";
         _loc24_.level = 0;
         _loc24_.type = 3;
         _loc24_.startCondition = null;
         _loc24_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc24_.§1t1452s0§[0] = _loc10_;
         _loc12_.destroy();
         return _loc24_;
      }
      
      internal function §1t1620s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : §1t69s0§
      {
         var _loc8_:Point = null;
         var _loc9_:§1t71s0§ = null;
         var _loc10_:§1t85s0§ = null;
         var _loc11_:String = null;
         var _loc12_:§1t58s0§ = null;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:§1t124s0§ = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:String = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:String = null;
         var _loc29_:String = null;
         var _loc30_:String = null;
         var _loc31_:String = null;
         var _loc32_:§1t85s0§ = null;
         var _loc33_:§1t69s0§ = null;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:String = null;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         _loc8_ = this.§1t1133s0§(param1);
         _loc9_ = §1t70s0§.instance.§1t1126s0§(_loc8_.x,_loc8_.y);
         _loc10_ = new §1t85s0§(null);
         _loc10_.nodeID = param1;
         _loc10_.action = 0;
         this.§1t1597s0§(param1,param2,param3,param4,§1t1799s0§.§1t11445s0§,param5,param6,param7);
         _loc11_ = §1t123s0§.instance.§1t1582s0§(param1,param2,param3,param4,true);
         _loc12_ = §1t58s0§.§1t8804s0§(param1 * param4 + param2 * 3);
         _loc13_ = _loc9_.§1t1329s0§();
         _loc14_ = int(_loc13_[_loc12_.rand(_loc13_.length)]);
         _loc15_ = _loc12_.rand(4);
         _loc16_ = new §1t124s0§(null,_loc14_);
         _loc17_ = §1t1521s0§.getString(11416);
         _loc18_ = §1t1521s0§.getString(11245);
         _loc19_ = §1t1521s0§.getString(11417);
         _loc20_ = §1t1521s0§.getString(11418,[_loc11_,§1t70s0§.instance.§1t1153s0§(_loc14_)]);
         _loc21_ = §1t1521s0§.getString(11274,[_loc20_]);
         _loc22_ = "";
         _loc23_ = "";
         _loc22_ = §1t1521s0§.getString(11419,[§1t70s0§.instance.§1t1153s0§(_loc14_)]);
         _loc23_ = §1t1521s0§.getString(11420);
         _loc24_ = "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc22_ + "</text></dialogue>";
         _loc24_ = _loc24_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc23_ + "</text></dialogue>");
         _loc25_ = §1t70s0§.instance.§1t1139s0§(param1);
         _loc26_ = (§1t1523s0§.§1t5928s0§(_loc25_ + 1) - §1t1523s0§.§1t5928s0§(_loc25_)) / ((_loc25_ + 1) * 1.2);
         if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
         {
            _loc26_ = 0;
         }
         _loc27_ = _loc25_ * 5;
         _loc26_ /= 2;
         _loc27_ /= 2;
         _loc28_ = "<intro>";
         _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11238) + "</text></dialogue>");
         _loc28_ = _loc28_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + this.§1t1605s0§[int(Math.random() * this.§1t1605s0§.length)] + "</text>");
         _loc28_ = _loc28_ + ("<choice><text>" + §1t1521s0§.getString(11253) + "</text><gotolabel>quest</gotolabel><condition>" + §1t123s0§.instance.§1t1600s0§(false) + "</condition></choice>");
         _loc28_ = _loc28_ + ("<choice><text>" + §1t1521s0§.getString(11289) + "</text><gotolabel>talk</gotolabel></choice>");
         _loc28_ = _loc28_ + ("<choice><text>" + §1t1521s0§.getString(11255) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc28_ = _loc28_ + "<label>quest</label>";
         _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + §1t1521s0§.getString(11239) + "</text></dialogue>");
         _loc28_ = _loc28_ + _loc24_;
         _loc28_ = _loc28_ + ("<option><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc21_ + "</text>");
         _loc28_ = _loc28_ + ("<choice><text>" + _loc17_ + "</text><gotolabel>accept</gotolabel><condition><has><id>" + 91 + "</id><qty>" + 0 + "</qty><comp>eq</comp></has></condition></choice>");
         _loc28_ = _loc28_ + ("<choice><text>" + §1t1521s0§.getString(11243) + "</text><gotolabel>leave</gotolabel></choice></option>");
         _loc28_ = _loc28_ + "<label>accept</label>";
         _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc18_ + "</text></dialogue>");
         _loc28_ = _loc28_ + ("<outcome><id>" + 91 + "</id><modify>" + 1 + "</modify><end>-1</end></outcome>");
         _loc28_ = _loc28_ + "<label>leave</label>";
         _loc28_ = _loc28_ + "<outcome><end>-1</end></outcome>";
         _loc28_ = _loc28_ + "<label>talk</label>";
         _loc28_ = _loc28_ + this.§1t1621s0§(_loc12_,_loc9_);
         _loc28_ = _loc28_ + "<outcome><end>-1</end></outcome>";
         _loc28_ = _loc28_ + "</intro>";
         _loc10_.intro = _loc10_.§1t1403s0§(XMLList(_loc28_));
         _loc29_ = "<reward></reward>";
         _loc10_.§1t1260s0§(new §1t77s0§(XMLList(_loc29_)));
         _loc30_ = "";
         _loc30_ = _loc30_ + "<step>";
         _loc30_ = _loc30_ + ("<node>" + _loc16_.§1t2218s0§() + "</node>");
         _loc30_ = _loc30_ + ("<roomobj><room>0</room><id>4</id><name>ronin</name><x>-1</x><property>" + §1t76s0§.§1t9198s0§ + "</property></roomobj>");
         _loc31_ = "";
         if(_loc15_ <= 2)
         {
            _loc30_ += "<action>0</action>";
            _loc28_ = "<intro>";
            _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc19_ + "</text></dialogue>");
            _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11421) + "</text></dialogue>");
            _loc28_ = _loc28_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
            _loc28_ = _loc28_ + "</intro>";
         }
         else
         {
            _loc30_ += "<action>1</action>";
            _loc28_ = "<intro>";
            _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9197s0§ + "</id><text>" + _loc19_ + "</text></dialogue>");
            _loc28_ = _loc28_ + ("<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + §1t1521s0§.getString(11422) + "</text></dialogue>");
            _loc28_ = _loc28_ + "</intro>";
            _loc34_ = §1t70s0§.instance.§1t1139s0§(param1);
            _loc35_ = _loc12_.rand(3) + 3;
            _loc36_ = "11|12|13|14|15|16";
            _loc37_ = §1t70s0§.instance.§1t1160s0§(_loc16_.§1t2218s0§());
            _loc38_ = 0;
            while(_loc38_ < _loc35_)
            {
               if(_loc38_ == _loc35_ - 1)
               {
                  _loc30_ += "<wave><enemy><x>" + -100 + "</x><id>" + _loc36_ + "</id><lvl>" + _loc34_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (_loc37_ + 100) + "</x><id>" + _loc36_ + "</id><lvl>" + _loc34_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty></enemy><enemy><id>" + §1t76s0§.§1t9196s0§ + "</id><lvl>" + (_loc34_ + 2).toString() + "</lvl><qty>" + 1 + "</qty></enemy></wave>";
               }
               else if(_loc38_ == 0)
               {
                  _loc30_ += "<wave><enemy><id>" + _loc36_ + "</id><lvl>" + _loc34_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty><x>650</x></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave>";
               }
               else
               {
                  _loc30_ += "<wave><enemy><x>" + -100 + "</x><id>" + _loc36_ + "</id><lvl>" + _loc34_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty></enemy><enemy><x>" + (_loc37_ + 100) + "</x><id>" + _loc36_ + "</id><lvl>" + _loc34_ + "</lvl><qty>" + (_loc12_.rand(3) + 3).toString() + "</qty></enemy></wave>";
               }
               _loc38_++;
            }
            _loc31_ = "<ending>";
            _loc31_ = _loc31_ + ("<outcome><id>" + 91 + "</id><modify>" + 2 + "</modify><end>1</end></outcome>");
            _loc31_ = _loc31_ + "</ending>";
         }
         _loc30_ += "</step>";
         _loc32_ = new §1t85s0§(XML(_loc30_));
         _loc29_ = "<reward>";
         _loc29_ = _loc29_ + ("<exp>" + _loc26_ + "</exp>");
         _loc29_ = _loc29_ + ("<loot><id>" + 0 + "</id><qty>" + _loc27_ + "</qty></loot>");
         _loc29_ = _loc29_ + "</reward>";
         _loc32_.§1t1260s0§(new §1t77s0§(XMLList(_loc29_)));
         _loc32_.intro = _loc32_.§1t1403s0§(XMLList(_loc28_));
         _loc32_.title = §1t1521s0§.getString(11418,[_loc11_,§1t70s0§.instance.§1t1153s0§(_loc14_)]);
         _loc32_.stitle = §1t1521s0§.getString(448,[_loc11_]);
         if(_loc31_ != "")
         {
            _loc32_.ending = _loc32_.§1t1403s0§(XMLList(_loc31_));
         }
         _loc33_ = new §1t69s0§(null);
         _loc33_.id = §1t11212s0§;
         _loc33_.startin = param1;
         _loc33_.name = _loc20_;
         _loc33_.level = 0;
         _loc33_.type = 3;
         _loc33_.startCondition = null;
         _loc33_.§1t1452s0§ = new Vector.<§1t85s0§>();
         _loc33_.§1t1452s0§[0] = _loc10_;
         _loc33_.§1t1452s0§[1] = _loc32_;
         _loc12_.destroy();
         return _loc33_;
      }
      
      internal function §1t1621s0§(param1:§1t58s0§, param2:§1t71s0§) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         _loc3_ = "";
         _loc4_ = param1.rand(8);
         _loc4_ = 6;
         if(_loc4_ == 0)
         {
            _loc3_ = §1t1521s0§.getString(11423);
         }
         else if(_loc4_ == 1)
         {
            _loc3_ = §1t1521s0§.getString(11424);
         }
         else if(_loc4_ == 2)
         {
            _loc3_ = §1t1521s0§.getString(11425);
         }
         else if(_loc4_ == 3)
         {
            _loc3_ = §1t1521s0§.getString(11426);
         }
         else if(_loc4_ == 4)
         {
            _loc3_ = §1t1521s0§.getString(11427);
         }
         else if(_loc4_ == 5)
         {
            _loc3_ = §1t1521s0§.getString(11428);
         }
         else if(_loc4_ == 6 && param2.§1t1286s0§.length > 0)
         {
            _loc3_ = this.§1t1622s0§(param1,param2);
         }
         else
         {
            _loc3_ = §1t1540s0§.§1t10034s0§();
         }
         return "<dialogue><id>" + §1t76s0§.§1t9198s0§ + "</id><text>" + _loc3_ + "</text></dialogue>";
      }
      
      internal function §1t1622s0§(param1:§1t58s0§, param2:§1t71s0§) : String
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         _loc3_ = int(param2.§1t1286s0§[param1.rand(param2.§1t1286s0§.length)]);
         _loc4_ = "...";
         if(_loc3_ == §1t2281s0§.§1t11537s0§)
         {
            _loc4_ = §1t1521s0§.getString(11429);
         }
         else if(_loc3_ == §1t2281s0§.§1t11538s0§)
         {
            _loc4_ = §1t1521s0§.getString(11430);
         }
         else if(_loc3_ == §1t2281s0§.§1t11539s0§)
         {
            _loc4_ = §1t1521s0§.getString(11431);
         }
         else if(_loc3_ == §1t2281s0§.§1t11540s0§)
         {
            _loc4_ = §1t1521s0§.getString(11432);
         }
         else if(_loc3_ == §1t2281s0§.§1t11541s0§)
         {
            _loc4_ = §1t1521s0§.getString(11433);
         }
         else if(_loc3_ == §1t2281s0§.§1t11542s0§)
         {
            _loc4_ = §1t1521s0§.getString(11434);
         }
         else if(_loc3_ == §1t2281s0§.§1t11543s0§)
         {
            _loc4_ = §1t1521s0§.getString(11435);
         }
         else if(_loc3_ == §1t2281s0§.§1t11544s0§)
         {
            _loc4_ = §1t1521s0§.getString(11436);
         }
         else if(_loc3_ == §1t2281s0§.§1t11545s0§)
         {
            _loc4_ = §1t1521s0§.getString(11437);
         }
         else if(_loc3_ == §1t2281s0§.§1t11546s0§)
         {
            _loc4_ = §1t1521s0§.getString(11438);
         }
         else if(_loc3_ == §1t2281s0§.§1t11547s0§)
         {
            _loc4_ = §1t1521s0§.getString(11439);
         }
         else if(_loc3_ == §1t2281s0§.§1t11548s0§)
         {
            _loc4_ = §1t1521s0§.getString(11440);
         }
         else if(_loc3_ == §1t2281s0§.§1t11549s0§)
         {
            _loc4_ = §1t1521s0§.getString(11441);
         }
         else if(_loc3_ == §1t2281s0§.§1t11550s0§)
         {
            _loc4_ = §1t1521s0§.getString(11442);
         }
         else if(_loc3_ == §1t2281s0§.§1t11551s0§)
         {
            _loc4_ = §1t1521s0§.getString(11443);
         }
         else if(_loc3_ == §1t2281s0§.§1t11552s0§)
         {
            _loc4_ = §1t1521s0§.getString(11444);
         }
         else if(_loc3_ == §1t2281s0§.§1t11553s0§)
         {
            _loc4_ = §1t1521s0§.getString(11445);
         }
         else if(_loc3_ == §1t2281s0§.§1t11554s0§)
         {
            _loc4_ = §1t1521s0§.getString(11446);
         }
         else if(_loc3_ == §1t2281s0§.§1t11555s0§)
         {
            _loc4_ = §1t1521s0§.getString(11447);
         }
         else if(_loc3_ == §1t2281s0§.§1t11556s0§)
         {
            _loc4_ = §1t1521s0§.getString(11448);
         }
         else if(_loc3_ == §1t2281s0§.§1t11557s0§)
         {
            _loc4_ = §1t1521s0§.getString(11449);
         }
         else if(_loc3_ == §1t2281s0§.§1t11558s0§)
         {
            _loc4_ = §1t1521s0§.getString(11450);
         }
         else if(_loc3_ == §1t2281s0§.§1t11559s0§)
         {
            _loc4_ = §1t1521s0§.getString(11451);
         }
         else if(_loc3_ == §1t2281s0§.§1t11560s0§)
         {
            _loc4_ = §1t1521s0§.getString(11452);
         }
         return _loc4_;
      }
   }
}

