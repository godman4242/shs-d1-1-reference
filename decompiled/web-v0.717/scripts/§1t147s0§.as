package
{
   import flash.geom.Point;
   
   public class §1t147s0§
   {
      
      public static var §1t11359s0§:int = 0;
      
      public static var §1t11360s0§:int = 1;
      
      public static var §1t11361s0§:int = 2;
      
      public static var §1t11362s0§:int = 3;
      
      public static var §1t11363s0§:int = 4;
      
      public static var §1t11364s0§:int = 5;
      
      public static var §1t11365s0§:int = 6;
      
      public static var §1t11366s0§:int = 7;
      
      public static var §1t11367s0§:int = 8;
      
      public static var §1t11368s0§:int = 9;
      
      public static var §1t11369s0§:int = 10;
      
      public static var §1t11370s0§:int = 11;
      
      public static var §1t11371s0§:int = 12;
      
      public static var §1t11372s0§:int = 13;
      
      public static var §1t11373s0§:int = 14;
      
      public static var §1t11374s0§:int = 15;
      
      public static var §1t11375s0§:int = 16;
      
      public static var §1t11376s0§:int = 17;
      
      public static var §1t11377s0§:int = 18;
      
      public static var §1t11378s0§:int = 19;
      
      public static var §1t11379s0§:int = 20;
      
      public static var §1t11380s0§:int = 21;
      
      public static var §1t11381s0§:int = 22;
      
      public static var §1t11382s0§:int = 23;
      
      public static var §1t11383s0§:int = 24;
      
      public static var §1t11384s0§:int = 25;
      
      public static var §1t11385s0§:int = 26;
      
      public static var §1t11386s0§:int = 27;
      
      public static var §1t11387s0§:int = 28;
      
      public static var §1t11388s0§:int = 29;
      
      public static var §1t11389s0§:int = 30;
      
      public static var §1t11390s0§:int = 31;
      
      public static var §1t11391s0§:int = 32;
      
      public static var §1t11392s0§:int = 33;
      
      public static var §1t11393s0§:int = 34;
      
      public static var §1t11394s0§:int = 35;
      
      public static var §1t11395s0§:int = 36;
      
      public static var §1t11396s0§:int = 37;
      
      public static var §1t11397s0§:int = 38;
      
      public static var §1t11398s0§:int = 39;
      
      public static var §1t11399s0§:int = 40;
      
      public static var §1t11400s0§:int = 41;
      
      public static var §1t11401s0§:int = 42;
      
      public static var §1t11402s0§:int = 43;
      
      public static var §1t11403s0§:int = 44;
      
      public static var §1t11404s0§:int = 45;
      
      public static var §1t11405s0§:int = 46;
      
      public static var §1t11406s0§:int = 47;
      
      public static var §1t11407s0§:int = 38;
      
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
      
      internal var x:int;
      
      internal var y:int;
      
      internal var roomid:int;
      
      internal var bg:int;
      
      internal var nodeid:int;
      
      internal var roomWidth:int;
      
      internal var isPrivate:int = 0;
      
      internal var §1t1746s0§:Array = [0,0,0,0];
      
      internal var dest:Array = [0,0,0,0];
      
      internal var §1t1748s0§:Array = new Array();
      
      internal var roomType:int;
      
      internal var roomName:String = "";
      
      internal var enterFrom:int = -1;
      
      internal var §1t1750s0§:int = -1;
      
      internal var §1t1751s0§:int = -1;
      
      internal var bgParam:int = 0;
      
      internal var bgParam2:* = 0;
      
      internal var §1t1752s0§:* = 0;
      
      internal var §1t1773s0§:uint;
      
      internal var §1t1774s0§:int = 0;
      
      internal var slots:Array = new Array();
      
      internal var §1t1776s0§:int = 0;
      
      public function §1t147s0§()
      {
         super();
      }
      
      internal static function §1t1253s0§(param1:int) : Boolean
      {
         return param1 == §1t70s0§.§1t9168s0§ || param1 == §1t70s0§.§1t9169s0§ || param1 == §1t70s0§.§1t9170s0§ || param1 == §1t70s0§.§1t9171s0§ || param1 == §1t70s0§.§1t9172s0§;
      }
      
      public static function §1t11408s0§(param1:§1t58s0§, param2:int, param3:int, param4:int, param5:int, param6:String, param7:Boolean = false, param8:int = 0) : String
      {
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc19_:Array = null;
         var _loc20_:int = 0;
         var _loc21_:String = null;
         var _loc22_:int = 0;
         var _loc23_:String = null;
         var _loc24_:int = 0;
         var _loc13_:Boolean = false;
         if(param2 == §1t70s0§.§1t9177s0§)
         {
            if(param1.rand(2) == 0)
            {
               param2 = §1t70s0§.§1t9165s0§;
            }
            else
            {
               param2 = §1t70s0§.§1t9168s0§;
            }
         }
         if(param2 == §1t70s0§.§1t9165s0§)
         {
            if(!param7)
            {
               _loc13_ = true;
               _loc9_ = "11";
               if(param5 < 3)
               {
                  _loc10_ = "11";
               }
               else if(param5 < 5)
               {
                  _loc10_ = "11|12";
               }
               else if(param5 < 7)
               {
                  _loc10_ = "11|12|13";
               }
               else if(param5 < 9)
               {
                  _loc10_ = "11|12|13|14";
               }
               else if(int(Math.random() * 3) > 0)
               {
                  _loc10_ = "11|12|13|14|15";
               }
               else
               {
                  _loc10_ = "11|12|13|14|15|16";
               }
            }
            else
            {
               _loc9_ = "17";
               _loc10_ = "17";
            }
         }
         else if(param2 == §1t70s0§.§1t9182s0§ || param2 == §1t70s0§.§1t9184s0§)
         {
            if(!param7)
            {
               _loc13_ = true;
               _loc9_ = "40";
               if(int(Math.random() * 3) > 0)
               {
                  _loc10_ = "40|41|42|43|44";
               }
               else
               {
                  _loc10_ = "40|41|42|43|44|45";
               }
            }
            else
            {
               _loc9_ = "46";
               _loc10_ = "46";
            }
         }
         else if(param2 == §1t70s0§.§1t9183s0§ || param2 == §1t70s0§.§1t9185s0§)
         {
            if(!param7)
            {
               _loc13_ = true;
               _loc9_ = "19";
               if(int(Math.random() * 3) > 0)
               {
                  _loc10_ = "19|20|21|22|23";
               }
               else
               {
                  _loc10_ = "19|20|21|22|23|24|48";
               }
            }
            else
            {
               _loc9_ = "25";
               _loc10_ = "25";
            }
         }
         else if(param2 == §1t70s0§.§1t9166s0§)
         {
            if(!param7)
            {
               _loc10_ = "76|79";
               _loc9_ = "76";
            }
            else
            {
               _loc10_ = "77";
               _loc9_ = "77";
               param5 = 97;
            }
         }
         else if(param2 == §1t70s0§.§1t9167s0§)
         {
            _loc10_ = "80|81";
            _loc9_ = "80";
         }
         else if(param2 == §1t70s0§.§1t9168s0§)
         {
            if(!param7)
            {
               _loc10_ = "65|66";
               _loc9_ = "65";
            }
            else
            {
               _loc10_ = "67";
               _loc9_ = "67";
            }
         }
         else if(param2 == §1t70s0§.§1t9169s0§)
         {
            _loc10_ = "72";
            _loc9_ = "72";
         }
         else if(param2 == §1t70s0§.§1t9170s0§)
         {
            _loc10_ = "73";
            _loc9_ = "73";
         }
         else if(param2 == §1t70s0§.§1t9171s0§)
         {
            _loc10_ = "74|75";
            _loc9_ = "74";
         }
         else if(param2 == §1t70s0§.§1t9172s0§)
         {
            _loc10_ = "78";
            _loc9_ = "78";
         }
         else
         {
            if(param2 != §1t70s0§.§1t9173s0§)
            {
               return "";
            }
            if(!param7)
            {
               _loc10_ = "31";
               _loc9_ = "31";
            }
            else
            {
               _loc10_ = "32";
               _loc9_ = "32";
            }
         }
         var _loc14_:Boolean = param2 == §1t70s0§.§1t9169s0§ || param2 == §1t70s0§.§1t9170s0§ || param2 == §1t70s0§.§1t9171s0§;
         var _loc15_:int = 0;
         if(!param7)
         {
            if(_loc13_)
            {
               _loc19_ = _loc10_.split("|");
            }
            if(§1t1253s0§(param2))
            {
               _loc20_ = 1;
            }
            else if(param2 == §1t70s0§.§1t9184s0§ || param2 == §1t70s0§.§1t9185s0§)
            {
               _loc20_ = Math.random() * 2 + 1;
            }
            else if(param5 < 20)
            {
               _loc20_ = Math.random() * 2 + 1;
            }
            else
            {
               _loc20_ = Math.random() * 3 + 1;
            }
            _loc21_ = "<xml>";
            _loc22_ = 0;
            while(_loc22_ < _loc20_)
            {
               if(param2 == §1t70s0§.§1t9173s0§ || param2 == §1t70s0§.§1t9166s0§)
               {
                  _loc11_ = Math.random() * 2 + 3;
               }
               else
               {
                  _loc11_ = Math.random() * 3 + 3;
               }
               _loc23_ = _loc10_;
               if(_loc13_)
               {
                  _loc24_ = int(_loc19_.length);
                  if(_loc22_ == 0)
                  {
                     _loc23_ = _loc19_[int(Math.random() * _loc24_)] + "|" + _loc19_[int(Math.random() * _loc24_)];
                  }
                  else if(_loc22_ == 1)
                  {
                     _loc23_ = _loc19_[int(Math.random() * _loc24_)] + "|" + _loc19_[int(Math.random() * _loc24_)] + "|" + _loc19_[int(Math.random() * _loc24_)];
                  }
                  else if(int(Math.random() * 2) == 0)
                  {
                     _loc23_ = _loc19_[int(Math.random() * _loc24_)] + "|" + _loc19_[int(Math.random() * _loc24_)] + "|" + _loc19_[int(Math.random() * _loc24_)] + "|" + _loc19_[int(Math.random() * _loc24_)];
                  }
               }
               if(_loc22_ == 0)
               {
                  _loc21_ = _loc21_ + "<wave><enemy><id>" + _loc23_ + "</id><lvl>" + param5 + "</lvl><qty>" + _loc11_ + "</qty></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave>";
               }
               else
               {
                  if(param2 == §1t70s0§.§1t9167s0§)
                  {
                     _loc10_ = "80";
                  }
                  if(param2 == §1t70s0§.§1t9184s0§ && _loc22_ == _loc20_ - 1)
                  {
                     _loc10_ = "87";
                     _loc21_ = _loc21_ + "<wave><enemy><id>" + _loc10_ + "</id><lvl>" + param5 + "</lvl><qty>" + _loc11_ * 2 + "</qty></enemy></wave>";
                  }
                  else if(param2 == §1t70s0§.§1t9185s0§ && _loc22_ == _loc20_ - 1)
                  {
                     _loc10_ = "86";
                     _loc21_ = _loc21_ + "<wave><enemy><id>" + _loc10_ + "</id><lvl>" + param5 + "</lvl><qty>" + _loc11_ * 2 + "</qty></enemy></wave>";
                  }
                  else if(_loc14_ || int(Math.random() * 2) == 0)
                  {
                     _loc21_ = _loc21_ + "<wave><enemy><x>" + -100 + "</x><id>" + _loc23_ + "</id><lvl>" + param5 + "</lvl><qty>" + _loc11_ + "</qty></enemy><enemy><x>" + (param3 + 100) + "</x><id>" + _loc23_ + "</id><lvl>" + param5 + "</lvl><qty>" + _loc11_ + "</qty></enemy></wave>";
                  }
                  else
                  {
                     _loc21_ = _loc21_ + "<wave><enemy><id>" + _loc23_ + "</id><lvl>" + param5 + "</lvl><qty>" + _loc11_ * 2 + "</qty></enemy></wave>";
                  }
               }
               _loc22_++;
            }
            _loc21_ += "</xml>";
         }
         else
         {
            if(_loc10_ == "17")
            {
               _loc10_ = §1t76s0§.§1t9198s0§.toString();
            }
            if(param2 == §1t70s0§.§1t9165s0§ || param2 == §1t70s0§.§1t9173s0§)
            {
               _loc15_ = 1;
               _loc21_ = "<xml><wave><enemy><x>650</x><id>" + _loc10_ + "</id><lvl>" + (param5 + 2) + "</lvl><qty>" + 1 + "</qty></enemy></wave></xml>";
            }
            else
            {
               _loc21_ = "<xml><wave><enemy><x>650</x><id>" + _loc10_ + "</id><lvl>" + (param5 + 2) + "</lvl><qty>" + 1 + "</qty></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave></xml>";
            }
         }
         var _loc16_:int = 2;
         var _loc17_:int = param5;
         if(param7)
         {
            if(param2 != §1t70s0§.§1t9166s0§)
            {
               _loc16_ = 1;
            }
            _loc17_ = param5 + 2;
         }
         var _loc18_:String = "0";
         if(_loc9_ == "67")
         {
            _loc18_ = "wolf_snarl";
         }
         return "<obj><id>9</id><x>" + param4 + "</x><property>" + _loc9_ + "," + _loc17_ + "," + _loc21_ + "," + _loc16_ + "," + _loc18_ + "," + param8 + "," + _loc15_ + "</property><name>" + param6 + "</name></obj>";
      }
      
      internal static function §1t11409s0§(param1:§1t58s0§, param2:int, param3:int, param4:int, param5:String) : String
      {
         var _loc6_:String = §1t76s0§.§1t9200s0§.toString();
         var _loc7_:int = param1.rand(4);
         var _loc8_:String = §1t11410s0§(_loc7_,param1,param2,param4,§1t76s0§.§1t9200s0§);
         if(_loc7_ == 0 || _loc7_ == 3)
         {
            return "<obj><id>9</id><x>" + param3 + "</x><property>" + _loc6_ + "," + (param4 + 1) + ",<xml>" + _loc8_ + "</xml>,0,0,0,1</property><name>" + param5 + "</name></obj>";
         }
         return "<obj><id>9</id><x>" + param3 + "</x><property>" + _loc6_ + "," + (param4 + 1) + ",<xml>" + _loc8_ + "</xml></property><name>" + param5 + "</name></obj>";
      }
      
      public static function §1t11410s0§(param1:int, param2:§1t58s0§, param3:int, param4:int, param5:int) : String
      {
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc13_:int = 0;
         var _loc15_:String = null;
         var _loc16_:int = 0;
         var _loc9_:Boolean = false;
         if(param1 != 3)
         {
            _loc10_ = param2.rand(3);
            if(_loc10_ == 0)
            {
               _loc10_ = §1t70s0§.§1t9165s0§;
            }
            else if(_loc10_ == 1)
            {
               _loc10_ = §1t70s0§.§1t9173s0§;
            }
            else if(_loc10_ == 2)
            {
               _loc10_ = §1t70s0§.§1t9168s0§;
            }
         }
         else
         {
            _loc10_ = param2.rand(6);
            if(_loc10_ == 0)
            {
               _loc10_ = §1t70s0§.§1t9169s0§;
            }
            else if(_loc10_ == 1)
            {
               _loc10_ = §1t70s0§.§1t9171s0§;
            }
            else if(_loc10_ == 2)
            {
               _loc10_ = §1t70s0§.§1t9168s0§;
            }
            else if(_loc10_ == 3)
            {
               _loc10_ = §1t70s0§.§1t9170s0§;
            }
            else if(_loc10_ == 4)
            {
               _loc10_ = §1t70s0§.§1t9173s0§;
            }
            else if(_loc10_ == 5)
            {
               _loc10_ = §1t70s0§.§1t9172s0§;
            }
         }
         if(_loc10_ == §1t70s0§.§1t9165s0§)
         {
            _loc9_ = true;
            if(param4 < 3)
            {
               _loc6_ = "11";
            }
            else if(param4 < 5)
            {
               _loc6_ = "11|12";
            }
            else if(param4 < 7)
            {
               _loc6_ = "11|12|13";
            }
            else if(param4 < 9)
            {
               _loc6_ = "11|12|13|14";
            }
            else if(int(Math.random() * 3) > 0)
            {
               _loc6_ = "11|12|13|14|15";
            }
            else
            {
               _loc6_ = "11|12|13|14|15|16";
            }
         }
         else if(_loc10_ == §1t70s0§.§1t9168s0§)
         {
            _loc6_ = "65|66";
         }
         else if(_loc10_ == §1t70s0§.§1t9173s0§)
         {
            _loc6_ = "31";
         }
         else if(_loc10_ == §1t70s0§.§1t9169s0§)
         {
            _loc6_ = "72";
         }
         else if(_loc10_ == §1t70s0§.§1t9171s0§)
         {
            _loc6_ = "75";
         }
         else if(_loc10_ == §1t70s0§.§1t9170s0§)
         {
            _loc6_ = "73";
         }
         else if(_loc10_ == §1t70s0§.§1t9172s0§)
         {
            _loc6_ = "78";
         }
         if(_loc9_)
         {
            _loc11_ = _loc6_.split("|");
         }
         var _loc12_:String = "";
         if(param1 == 0 || param1 == 3)
         {
            _loc13_ = 0;
         }
         else if(param4 < 20)
         {
            _loc13_ = param2.rand(2) + 1;
         }
         else
         {
            _loc13_ = param2.rand(3) + 1;
         }
         var _loc14_:int = 0;
         while(_loc14_ < _loc13_)
         {
            if(_loc10_ == §1t70s0§.§1t9168s0§ || _loc10_ == §1t70s0§.§1t9173s0§)
            {
               _loc7_ = param2.rand(2) + 2;
            }
            else
            {
               _loc7_ = param2.rand(3) + 3;
            }
            _loc15_ = _loc6_;
            if(_loc9_)
            {
               _loc16_ = int(_loc11_.length);
               if(_loc14_ == 0)
               {
                  _loc15_ = _loc11_[int(Math.random() * _loc16_)] + "|" + _loc11_[int(Math.random() * _loc16_)];
               }
               else if(_loc14_ == 1)
               {
                  _loc15_ = _loc11_[int(Math.random() * _loc16_)] + "|" + _loc11_[int(Math.random() * _loc16_)] + "|" + _loc11_[int(Math.random() * _loc16_)];
               }
               else if(int(Math.random() * 2) == 0)
               {
                  _loc15_ = _loc11_[int(Math.random() * _loc16_)] + "|" + _loc11_[int(Math.random() * _loc16_)] + "|" + _loc11_[int(Math.random() * _loc16_)] + "|" + _loc11_[int(Math.random() * _loc16_)];
               }
            }
            if(param1 == 2 && _loc14_ == _loc13_ - 1)
            {
               _loc12_ = _loc12_ + "<wave><enemy><id>" + _loc15_ + "</id><lvl>" + param4 + "</lvl><qty>" + _loc7_ * 2 + "</qty></enemy><enemy><x>650</x><id>" + param5.toString() + "</id><lvl>" + (param4 + 1) + "</lvl><qty>" + 1 + "</qty></enemy></wave>";
            }
            else if(_loc14_ == 0)
            {
               _loc12_ = _loc12_ + "<wave><enemy><id>" + _loc15_ + "</id><lvl>" + param4 + "</lvl><qty>" + _loc7_ + "</qty></enemy><friend><id>" + §1t76s0§.§1t9201s0§ + "</id><qty>" + 1 + "</qty></friend></wave>";
            }
            else if(int(Math.random() * 2) == 0)
            {
               _loc12_ = _loc12_ + "<wave><enemy><x>" + -100 + "</x><id>" + _loc15_ + "</id><lvl>" + param4 + "</lvl><qty>" + _loc7_ + "</qty></enemy><enemy><x>" + (param3 + 100) + "</x><id>" + _loc15_ + "</id><lvl>" + param4 + "</lvl><qty>" + _loc7_ + "</qty></enemy></wave>";
            }
            else
            {
               _loc12_ = _loc12_ + "<wave><enemy><id>" + _loc15_ + "</id><lvl>" + param4 + "</lvl><qty>" + _loc7_ * 2 + "</qty></enemy></wave>";
            }
            _loc14_++;
         }
         if(param1 == 0)
         {
            _loc12_ = "<wave><enemy><x>650</x><id>" + param5.toString() + "</id><lvl>" + (param4 + 1) + "</lvl><qty>" + 1 + "</qty></enemy></wave>";
         }
         else if(param1 == 1)
         {
            _loc12_ = _loc12_ + "<wave><enemy><x>650</x><id>" + param5.toString() + "</id><lvl>" + (param4 + 1) + "</lvl><qty>" + 1 + "</qty></enemy></wave>";
         }
         else if(param1 == 3)
         {
            _loc12_ = "<wave><enemy><x>650</x><id>" + _loc6_ + "</id><lvl>" + param4 + "</lvl><qty>" + 1 + "</qty></enemy><enemy><x>650</x><id>" + param5.toString() + "</id><lvl>" + (param4 + 1) + "</lvl><qty>" + 1 + "</qty></enemy></wave>";
         }
         return _loc12_;
      }
      
      public static function §1t11411s0§(param1:§1t58s0§, param2:int, param3:int, param4:int) : String
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:int = param3 / 300;
         var _loc8_:String = "";
         if(param2 == §1t70s0§.§1t9167s0§)
         {
            _loc5_ = 80;
            _loc7_ = 1;
            while(_loc7_ < _loc6_ - 1)
            {
               if(param1.rand(2) == 0)
               {
                  _loc8_ += "<obj><id>36</id><x>" + _loc7_ * 300 + "</x><property>" + _loc5_.toString() + "," + param4 + "</property></obj>";
               }
               _loc7_++;
            }
         }
         else if(param2 == §1t70s0§.§1t9166s0§)
         {
            if(param1.rand(5) == 0)
            {
               _loc8_ += "<obj><id>36</id><x>" + (param1.rand(param3 - 600) + 300) + "</x><property>77," + param4 + "</property></obj>";
            }
            else
            {
               _loc5_ = 76;
               _loc7_ = 1;
               while(_loc7_ < _loc6_ - 1)
               {
                  if(param1.rand(2) == 0)
                  {
                     _loc8_ += "<obj><id>36</id><x>" + _loc7_ * 300 + "</x><property>" + _loc5_.toString() + "," + param4 + "</property></obj>";
                  }
                  _loc7_++;
               }
            }
         }
         else if(param2 == §1t70s0§.§1t9165s0§)
         {
            _loc5_ = 13;
            _loc7_ = 1;
            while(_loc7_ < _loc6_ - 1)
            {
               if(param1.rand(2) == 0)
               {
                  _loc8_ += "<obj><id>36</id><x>" + _loc7_ * 300 + "</x><property>" + _loc5_.toString() + "," + param4 + "</property></obj>";
               }
               _loc7_++;
            }
         }
         else if(param2 == §1t70s0§.§1t9174s0§)
         {
            _loc5_ = 82;
            _loc7_ = 1;
            while(_loc7_ < _loc6_ - 1)
            {
               if(param1.rand(2) == 0)
               {
                  _loc8_ += "<obj><id>36</id><x>" + _loc7_ * 300 + "</x><property>" + _loc5_.toString() + "," + param4 + "</property></obj>";
               }
               _loc7_++;
            }
         }
         else if(param2 == §1t70s0§.§1t9173s0§)
         {
            _loc5_ = 28;
            _loc7_ = 1;
            while(_loc7_ < _loc6_ - 1)
            {
               if(param1.rand(2) == 0)
               {
                  _loc8_ += "<obj><id>36</id><x>" + _loc7_ * 300 + "</x><property>" + _loc5_.toString() + "," + param4 + "</property></obj>";
               }
               _loc7_++;
            }
         }
         else if(param2 == §1t70s0§.§1t9175s0§)
         {
            _loc7_ = 1;
            while(_loc7_ < _loc6_ - 1)
            {
               if(param1.rand(2) == 0)
               {
                  _loc8_ += "<obj><id>36</id><x>" + _loc7_ * 300 + "</x><property>" + (50 + param1.rand(4)) + "," + param4 + "</property></obj>";
               }
               _loc7_++;
            }
         }
         else if(param2 == §1t70s0§.§1t9168s0§)
         {
            _loc8_ += "<obj><id>36</id><x>" + (param1.rand(param3 - 600) + 300) + "</x><property>65," + param4 + "</property></obj>";
         }
         else if(param2 == §1t70s0§.§1t9169s0§)
         {
            _loc8_ += "<obj><id>36</id><x>" + (param1.rand(param3 - 600) + 300) + "</x><property>72," + param4 + "</property></obj>";
         }
         else if(param2 == §1t70s0§.§1t9170s0§)
         {
            _loc8_ += "<obj><id>36</id><x>" + (param1.rand(param3 - 600) + 300) + "</x><property>73," + param4 + "</property></obj>";
         }
         else if(param2 == §1t70s0§.§1t9171s0§)
         {
            _loc8_ += "<obj><id>36</id><x>" + (param1.rand(param3 - 600) + 300) + "</x><property>74," + param4 + "</property></obj>";
         }
         else if(param2 == §1t70s0§.§1t9172s0§)
         {
            _loc8_ += "<obj><id>36</id><x>" + (param1.rand(param3 - 600) + 300) + "</x><property>78," + param4 + "</property></obj>";
         }
         return _loc8_;
      }
      
      public static function §1t11412s0§(param1:§1t58s0§, param2:int, param3:int) : String
      {
         var _loc5_:int = 0;
         var _loc4_:String = "";
         if(param2 == §1t70s0§.§1t9175s0§)
         {
            _loc5_ = 50 + param1.rand(5);
         }
         else if(param2 == §1t70s0§.§1t9173s0§)
         {
            _loc5_ = 28;
         }
         else if(param2 == §1t70s0§.§1t9174s0§)
         {
            _loc5_ = 35;
         }
         var _loc6_:int = param3 / 300;
         var _loc7_:int = 1;
         while(_loc7_ < _loc6_ - 1)
         {
            if(param1.rand(2) == 0)
            {
               _loc4_ += "<obj><id>4</id><x>" + _loc7_ * 300 + "</x><property>" + _loc5_.toString() + "</property></obj>";
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public function init(param1:int, param2:int, param3:int, param4:int) : *
      {
         this.x = param1;
         this.y = param2;
         this.roomid = param1 << 8 | param2;
         this.bg = param3;
         this.nodeid = param4;
         this.roomWidth = 800 + §1t58s0§.random(600,this.roomid);
      }
      
      public function reset() : *
      {
         this.x = 0;
         this.y = 0;
         this.roomid = 0;
         this.bg = 0;
         this.nodeid = 0;
         this.roomWidth = 0;
         this.isPrivate = 0;
         this.roomType = 0;
         this.roomName = "";
         this.enterFrom = -1;
         this.§1t1750s0§ = -1;
         this.§1t1751s0§ = -1;
         this.bgParam = 0;
         this.bgParam2 = 0;
         this.§1t1752s0§ = 0;
         this.§1t1746s0§[0] = 0;
         this.§1t1746s0§[1] = 0;
         this.§1t1746s0§[2] = 0;
         this.§1t1746s0§[3] = 0;
         this.dest[0] = 0;
         this.dest[1] = 0;
         this.dest[2] = 0;
         this.dest[3] = 0;
         this.§1t1748s0§.length = 0;
         this.§1t1773s0§ = 0;
         this.§1t1774s0§ = 0;
         this.slots.length = 0;
         this.§1t1776s0§ = 0;
      }
      
      public function §1t1753s0§(param1:int) : *
      {
         this.bgParam = param1;
      }
      
      public function §1t1754s0§(param1:int, param2:int = 0) : *
      {
         this.bg = param1;
      }
      
      public function §1t928s0§() : int
      {
         return this.roomType;
      }
      
      public function §1t1755s0§(param1:int, param2:int = 0, param3:int = 0) : *
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Point = null;
         var _loc9_:String = null;
         this.roomType = param1;
         this.bgParam = param2;
         this.bgParam2 = param3;
         if(this.roomType == §1t11377s0§)
         {
            this.roomName = §1t1521s0§.getString(783);
         }
         else if(this.roomType == §1t11383s0§)
         {
            this.roomName = §1t1521s0§.getString(784);
         }
         else if(this.roomType == §1t11381s0§)
         {
            this.roomName = §1t1521s0§.getString(785);
         }
         else if(this.roomType == §1t11382s0§)
         {
            this.roomName = §1t1521s0§.getString(786);
         }
         else if(this.roomType == §1t11398s0§ || this.roomType == §1t11404s0§)
         {
            this.roomName = §1t1521s0§.getString(787);
         }
         else if(this.roomType == §1t11400s0§)
         {
            this.roomName = §1t1521s0§.getString(788);
         }
         else if(this.roomType == §1t11401s0§)
         {
            this.roomName = §1t1521s0§.getString(789);
         }
         else if(this.roomType == §1t11402s0§)
         {
            this.roomName = §1t1521s0§.getString(790);
         }
         else if(this.roomType == §1t11379s0§)
         {
            this.roomName = §1t1521s0§.getString(791);
         }
         else
         {
            _loc4_ = §1t70s0§.instance.§1t1134s0§(this.nodeid);
            _loc5_ = §1t136s0§.instance.§1t1826s0§(_loc4_);
            _loc6_ = "";
            _loc7_ = "";
            _loc8_ = §1t70s0§.instance.§1t1135s0§(this.nodeid);
            if(_loc8_.y <= 1)
            {
               _loc6_ = §1t1521s0§.getString(398);
            }
            else if(_loc8_.y >= 4)
            {
               _loc6_ = §1t1521s0§.getString(399);
            }
            if(_loc8_.x <= 1)
            {
               _loc7_ = §1t1521s0§.getString(401);
            }
            else if(_loc8_.x >= 4)
            {
               _loc7_ = §1t1521s0§.getString(400);
            }
            _loc9_ = _loc6_ + _loc7_;
            if(_loc9_ != "")
            {
               _loc9_ += " ";
            }
            switch(this.bg)
            {
               case §1t112s0§.§1t12562s0§ || §1t112s0§.§1t12598s0§:
                  this.roomName = _loc9_ + _loc5_ + " " + §1t1521s0§.getString(427);
                  break;
               case §1t112s0§.§1t12563s0§:
                  this.roomName = _loc9_ + _loc5_ + " " + §1t1521s0§.getString(428);
                  break;
               case §1t112s0§.§1t12569s0§:
                  this.roomName = _loc9_ + _loc5_ + " " + §1t1521s0§.getString(494);
                  break;
               case §1t112s0§.§1t12584s0§:
                  this.roomName = _loc9_ + _loc5_ + " " + §1t1521s0§.getString(1028);
                  break;
               case §1t112s0§.§1t12570s0§:
               case §1t112s0§.§1t12571s0§:
               case §1t112s0§.§1t12572s0§:
                  this.isPrivate = 2;
            }
         }
      }
      
      public function §1t1756s0§(param1:int, param2:int = 0) : *
      {
         this.§1t1746s0§[param1] = 1;
         this.dest[param1] = param2;
         if(this.§1t1750s0§ == -1)
         {
            this.§1t1750s0§ = param1;
         }
      }
      
      public function §1t1757s0§(param1:int) : *
      {
         this.§1t1746s0§[param1] = 0;
      }
      
      public function §1t1758s0§() : *
      {
         this.§1t1746s0§[this.§1t1750s0§] = 0;
      }
      
      public function §1t1759s0§() : *
      {
         this.§1t1746s0§[this.enterFrom] = 0;
      }
      
      public function §1t1760s0§(param1:int) : *
      {
         return this.§1t1746s0§[param1] == 1;
      }
      
      public function §1t1761s0§() : int
      {
         return this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3];
      }
      
      public function §1t1762s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         if(param1 == §1t9128s0§)
         {
            _loc2_ = §1t9129s0§;
         }
         else if(param1 == §1t9129s0§)
         {
            _loc2_ = §1t9128s0§;
         }
         else if(param1 == §1t9130s0§)
         {
            _loc2_ = §1t9131s0§;
         }
         else if(param1 == §1t9131s0§)
         {
            _loc2_ = §1t9130s0§;
         }
         this.§1t1746s0§[_loc2_] = 0;
         this.dest[_loc2_] = 0;
      }
      
      public function §1t1763s0§(param1:int, param2:int = 0) : *
      {
         if(param1 == §1t9128s0§)
         {
            this.§1t1746s0§[§1t9129s0§] = 1;
            this.dest[§1t9129s0§] = param2;
            if(this.enterFrom == -1)
            {
               this.enterFrom = §1t9129s0§;
            }
         }
         else if(param1 == §1t9129s0§)
         {
            this.§1t1746s0§[§1t9128s0§] = 1;
            this.dest[§1t9128s0§] = param2;
            if(this.enterFrom == -1)
            {
               this.enterFrom = §1t9128s0§;
            }
         }
         else if(param1 == §1t9130s0§)
         {
            this.§1t1746s0§[§1t9131s0§] = 1;
            this.dest[§1t9131s0§] = param2;
            if(this.enterFrom == -1)
            {
               this.enterFrom = §1t9131s0§;
            }
         }
         else if(param1 == §1t9131s0§)
         {
            this.§1t1746s0§[§1t9130s0§] = 1;
            this.dest[§1t9130s0§] = param2;
            if(this.enterFrom == -1)
            {
               this.enterFrom = §1t9130s0§;
            }
         }
      }
      
      public function getEnterFrom() : int
      {
         return this.enterFrom;
      }
      
      internal function §1t1764s0§() : Boolean
      {
         if(this.enterFrom == §1t9131s0§ && this.§1t1750s0§ == -1)
         {
            return true;
         }
         if(this.enterFrom == §1t9129s0§ && this.§1t1750s0§ == -1)
         {
            return true;
         }
         if(this.enterFrom == §1t9131s0§ && this.§1t1750s0§ == §1t9130s0§)
         {
            return true;
         }
         if(this.enterFrom == §1t9129s0§ && this.§1t1750s0§ == §1t9128s0§)
         {
            return true;
         }
         if(this.enterFrom == §1t9130s0§ && this.§1t1750s0§ == §1t9128s0§)
         {
            return true;
         }
         if(this.enterFrom == §1t9129s0§ && this.§1t1750s0§ == §1t9130s0§)
         {
            return true;
         }
         if(this.enterFrom == §1t9129s0§ && this.§1t1750s0§ == §1t9131s0§)
         {
            return true;
         }
         if(this.enterFrom == §1t9131s0§ && this.§1t1750s0§ == §1t9128s0§)
         {
            return true;
         }
         return false;
      }
      
      public function §1t1765s0§(param1:int, param2:int, param3:String, param4:String) : *
      {
         this.§1t1748s0§.push("<obj><id>" + param1 + "</id><x>" + param2 + "</x><property>" + param3 + "</property><name>" + param4 + "</name></obj>");
      }
      
      public function §1t1766s0§(param1:int, param2:int, param3:String, param4:String) : *
      {
         this.§1t1748s0§.unshift("<obj><id>" + param1 + "</id><x>" + param2 + "</x><property>" + param3 + "</property><name>" + param4 + "</name></obj>");
      }
      
      public function output(param1:§1t58s0§ = null) : §1t134s0§
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         if(this.roomType == §1t11359s0§)
         {
            return null;
         }
         var _loc2_:§1t134s0§ = new §1t134s0§(new XML());
         _loc2_.bg = this.bg;
         _loc2_.width = this.roomWidth;
         _loc2_.§1t1383s0§(this.roomName);
         _loc2_.roomid = this.roomid;
         _loc2_.enterFrom = this.enterFrom;
         _loc2_.isPrivate = this.isPrivate;
         _loc2_.bgParam = this.bgParam;
         _loc2_.bgParam2 = this.bgParam2;
         var _loc3_:int = int(this.dest[§1t9128s0§]);
         var _loc4_:int = int(this.dest[§1t9129s0§]);
         var _loc5_:int = int(this.dest[§1t9130s0§]);
         var _loc6_:int = int(this.dest[§1t9131s0§]);
         var _loc7_:Boolean = this.§1t1768s0§(this.§1t1746s0§);
         var _loc8_:int = this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3];
         if(this.roomType == §1t11368s0§)
         {
            if(this.bg == §1t112s0§.§1t12562s0§ || this.bg == §1t112s0§.§1t12598s0§)
            {
               _loc13_ = 0;
            }
            else if(this.bg == §1t112s0§.§1t12569s0§)
            {
               _loc13_ = 1;
            }
            else if(this.bg == §1t112s0§.§1t12584s0§)
            {
               _loc13_ = 4;
            }
         }
         else if(this.roomType == §1t11385s0§)
         {
            if(this.bg == §1t112s0§.§1t12562s0§ || this.bg == §1t112s0§.§1t12598s0§)
            {
               _loc13_ = 2;
            }
            else if(this.bg == §1t112s0§.§1t12569s0§)
            {
               _loc13_ = 3;
            }
            else if(this.bg == §1t112s0§.§1t12584s0§)
            {
               _loc13_ = 5;
            }
         }
         if(this.bg == §1t112s0§.§1t12581s0§ || this.bg == §1t112s0§.§1t12573s0§)
         {
            if(_loc7_ && this.§1t1746s0§[3] == 1 || !_loc7_ && this.§1t1746s0§[0] == 1)
            {
               this.roomWidth = 2150;
               _loc2_.width = this.roomWidth;
            }
         }
         else if(this.bg == §1t112s0§.§1t12577s0§ || this.bg == §1t112s0§.§1t12597s0§)
         {
            if(_loc7_ && this.§1t1746s0§[3] == 1 || !_loc7_ && this.§1t1746s0§[0] == 1)
            {
               this.roomWidth = 1350;
               _loc2_.width = this.roomWidth;
            }
         }
         else if(this.bg == §1t112s0§.§1t12584s0§)
         {
            if(_loc7_ && this.§1t1746s0§[3] == 1 || !_loc7_ && this.§1t1746s0§[0] == 1)
            {
               this.roomWidth = 1400;
               _loc2_.width = this.roomWidth;
            }
         }
         if(this.§1t1746s0§[§1t9128s0§] == 1)
         {
            if(_loc7_)
            {
               _loc9_ = this.roomWidth - 50;
               _loc10_ = §1t9130s0§;
            }
            else if(_loc8_ == 2)
            {
               if(this.§1t1746s0§[§1t9130s0§] == 0)
               {
                  _loc9_ = this.roomWidth - 250;
                  _loc10_ = §1t9136s0§;
               }
               else
               {
                  _loc9_ = 250;
                  _loc10_ = §1t9132s0§;
               }
            }
            else
            {
               _loc9_ = this.roomWidth / 2;
               _loc10_ = §1t9128s0§;
            }
            if(this.roomType != §1t11368s0§ && this.roomType != §1t11385s0§ || this.enterFrom == §1t9128s0§)
            {
               this.§1t1766s0§(0,_loc9_,_loc3_ + ",50,-1,1," + §1t9128s0§ + "," + _loc10_,"nexit");
               this.§1t1771s0§(_loc9_,100);
               if(_loc10_ != §1t9130s0§)
               {
                  if(this.§1t1780s0§())
                  {
                     this.§1t1748s0§.push("<obj><id>" + 20 + "</id><x>" + _loc9_ + "</x><property>" + this.bg + "," + this.bgParam + "</property></obj>");
                  }
                  else if(this.bg == §1t112s0§.§1t12581s0§ || this.bg == §1t112s0§.§1t12573s0§)
                  {
                     if(_loc9_ == 250)
                     {
                        _loc2_.bgParam2 = 1;
                     }
                     else if(_loc9_ == this.roomWidth / 2)
                     {
                        _loc2_.bgParam2 = 2;
                     }
                     else
                     {
                        _loc2_.bgParam2 = 3;
                     }
                  }
                  else if(this.bg == §1t112s0§.§1t12577s0§ || this.bg == §1t112s0§.§1t12597s0§)
                  {
                     if(_loc9_ == 250)
                     {
                        _loc2_.bgParam2 = 1;
                     }
                     else if(_loc9_ == this.roomWidth / 2)
                     {
                        _loc2_.bgParam2 = 3;
                     }
                     else
                     {
                        _loc2_.bgParam2 = 5;
                     }
                  }
                  else if(this.bg == §1t112s0§.§1t12584s0§)
                  {
                     if(_loc9_ == 250)
                     {
                        _loc2_.bgParam2 = 1;
                     }
                     else if(_loc9_ == this.roomWidth / 2)
                     {
                        _loc2_.bgParam2 = 3;
                     }
                     else
                     {
                        _loc2_.bgParam2 = 2;
                     }
                  }
                  else if(this.§1t1318s0§())
                  {
                     this.§1t1778s0§(_loc9_);
                     _loc2_.bgParam = 1;
                  }
               }
            }
            else
            {
               if(_loc9_ == this.roomWidth - 50)
               {
                  _loc9_ = this.roomWidth - 250;
               }
               this.§1t1771s0§(_loc9_,100);
               _loc11_ = "door_" + this.roomid.toString() + "_" + _loc9_.toString();
               if(this.bg == §1t112s0§.§1t12584s0§)
               {
                  if(_loc9_ == 250)
                  {
                     _loc2_.bgParam2 = 1;
                     _loc9_ = 250;
                  }
                  else if(_loc9_ == this.roomWidth / 2)
                  {
                     _loc2_.bgParam2 = 3;
                     _loc9_ = 570;
                  }
                  else
                  {
                     _loc2_.bgParam2 = 2;
                     _loc9_ = 850;
                  }
               }
               this.§1t1748s0§.push("<obj><id>" + 22 + "</id><x>" + _loc9_ + "</x><property>" + _loc3_ + ",50,-1,1," + §1t9128s0§ + "," + _loc10_ + "," + _loc13_ + "," + this.bgParam + "</property><name>" + _loc11_ + "</name></obj>");
            }
         }
         if(this.§1t1746s0§[§1t9129s0§] == 1)
         {
            if(_loc7_)
            {
               _loc9_ = 50;
               _loc10_ = §1t9131s0§;
            }
            else if(_loc8_ == 2)
            {
               if(this.§1t1746s0§[§1t9131s0§] == 0)
               {
                  _loc9_ = 250;
                  _loc10_ = §1t9137s0§;
               }
               else
               {
                  _loc9_ = this.roomWidth - 250;
                  _loc10_ = §1t9133s0§;
               }
            }
            else
            {
               _loc9_ = this.roomWidth / 2;
               _loc10_ = §1t9129s0§;
               if(this.§1t1746s0§[§1t9128s0§] == 1)
               {
                  _loc10_ = §1t9138s0§;
               }
            }
            if(this.roomType != §1t11368s0§ && this.roomType != §1t11385s0§ || this.enterFrom == §1t9129s0§)
            {
               this.§1t1766s0§(0,_loc9_,_loc4_ + ",50,-1,1," + §1t9129s0§ + "," + _loc10_,"sexit");
               this.§1t1771s0§(_loc9_,100);
            }
            else
            {
               if(_loc9_ == 50)
               {
                  _loc9_ = 250;
               }
               this.§1t1771s0§(_loc9_,100);
               _loc11_ = "door_" + this.roomid.toString() + "_" + _loc9_.toString();
               if(this.bg == §1t112s0§.§1t12584s0§)
               {
                  if(_loc9_ == 250)
                  {
                     _loc2_.bgParam2 = 1;
                     _loc9_ = 250;
                  }
                  else if(_loc9_ == this.roomWidth / 2)
                  {
                     _loc2_.bgParam2 = 3;
                     _loc9_ = 570;
                  }
                  else
                  {
                     _loc2_.bgParam2 = 2;
                     _loc9_ = 850;
                  }
               }
               this.§1t1748s0§.push("<obj><id>" + 22 + "</id><x>" + _loc9_ + "</x><property>" + _loc4_ + ",50,-1,1," + §1t9129s0§ + "," + _loc10_ + "," + _loc13_ + "," + this.bgParam + "</property><name>" + _loc11_ + "</name></obj>");
            }
         }
         if(this.§1t1746s0§[§1t9131s0§] == 1)
         {
            if(!_loc7_)
            {
               _loc9_ = 50;
               _loc10_ = §1t9131s0§;
            }
            else if(_loc8_ == 2)
            {
               if(this.§1t1746s0§[§1t9128s0§] == 0)
               {
                  _loc9_ = this.roomWidth - 250;
                  _loc10_ = §1t9136s0§;
               }
               else
               {
                  _loc9_ = 250;
                  _loc10_ = §1t9132s0§;
               }
            }
            else
            {
               _loc9_ = this.roomWidth / 2;
               _loc10_ = §1t9128s0§;
            }
            if(this.roomType != §1t11368s0§ && this.roomType != §1t11385s0§ || this.enterFrom == §1t9131s0§)
            {
               this.§1t1766s0§(0,_loc9_,_loc6_ + ",50,-1,1," + §1t9131s0§ + "," + _loc10_,"wexit");
               this.§1t1771s0§(_loc9_,100);
               if(_loc10_ != §1t9131s0§)
               {
                  if(this.§1t1780s0§())
                  {
                     this.§1t1748s0§.push("<obj><id>" + 20 + "</id><x>" + _loc9_ + "</x><property>" + this.bg + "," + this.bgParam + "</property></obj>");
                  }
                  else if(this.bg == §1t112s0§.§1t12581s0§ || this.bg == §1t112s0§.§1t12573s0§)
                  {
                     if(_loc9_ == 250)
                     {
                        _loc2_.bgParam2 = 1;
                     }
                     else if(_loc9_ == this.roomWidth / 2)
                     {
                        _loc2_.bgParam2 = 2;
                     }
                     else
                     {
                        _loc2_.bgParam2 = 3;
                     }
                  }
                  else if(this.bg == §1t112s0§.§1t12577s0§ || this.bg == §1t112s0§.§1t12597s0§)
                  {
                     if(_loc9_ == 250)
                     {
                        _loc2_.bgParam2 = 1;
                     }
                     else if(_loc9_ == this.roomWidth / 2)
                     {
                        _loc2_.bgParam2 = 3;
                     }
                     else
                     {
                        _loc2_.bgParam2 = 5;
                     }
                  }
                  else if(this.bg == §1t112s0§.§1t12584s0§)
                  {
                     if(_loc9_ == 250)
                     {
                        _loc2_.bgParam2 = 1;
                     }
                     else if(_loc9_ == this.roomWidth / 2)
                     {
                        _loc2_.bgParam2 = 3;
                     }
                     else
                     {
                        _loc2_.bgParam2 = 2;
                     }
                  }
                  else if(this.§1t1318s0§())
                  {
                     this.§1t1778s0§(_loc9_);
                     _loc2_.bgParam = 1;
                  }
               }
            }
            else
            {
               if(_loc9_ == 50)
               {
                  _loc9_ = 250;
               }
               this.§1t1771s0§(_loc9_,100);
               _loc11_ = "door_" + this.roomid.toString() + "_" + _loc9_.toString();
               if(this.bg == §1t112s0§.§1t12584s0§)
               {
                  if(_loc9_ == 250)
                  {
                     _loc2_.bgParam2 = 1;
                     _loc9_ = 250;
                  }
                  else if(_loc9_ == this.roomWidth / 2)
                  {
                     _loc2_.bgParam2 = 3;
                     _loc9_ = 570;
                  }
                  else
                  {
                     _loc2_.bgParam2 = 2;
                     _loc9_ = 850;
                  }
               }
               this.§1t1748s0§.push("<obj><id>" + 22 + "</id><x>" + _loc9_ + "</x><property>" + _loc6_ + ",50,-1,1," + §1t9131s0§ + "," + _loc10_ + "," + _loc13_ + "," + this.bgParam + "</property><name>" + _loc11_ + "</name></obj>");
            }
         }
         if(this.§1t1746s0§[§1t9130s0§] == 1)
         {
            if(!_loc7_)
            {
               _loc9_ = this.roomWidth - 50;
               _loc10_ = §1t9130s0§;
            }
            else if(_loc8_ == 2)
            {
               if(this.§1t1746s0§[§1t9129s0§] == 0)
               {
                  _loc9_ = 250;
                  _loc10_ = §1t9137s0§;
               }
               else
               {
                  _loc9_ = this.roomWidth - 250;
                  _loc10_ = §1t9133s0§;
               }
            }
            else
            {
               _loc9_ = this.roomWidth / 2;
               _loc10_ = §1t9129s0§;
            }
            if(this.roomType != §1t11368s0§ && this.roomType != §1t11385s0§ || this.enterFrom == §1t9130s0§)
            {
               this.§1t1766s0§(0,_loc9_,_loc5_ + ",50,-1,1," + §1t9130s0§ + "," + _loc10_,"eexit");
               this.§1t1771s0§(_loc9_,100);
            }
            else
            {
               if(_loc9_ == this.roomWidth - 50)
               {
                  _loc9_ = this.roomWidth - 250;
               }
               this.§1t1771s0§(_loc9_,100);
               _loc11_ = "door_" + this.roomid.toString() + "_" + _loc9_.toString();
               if(this.bg == §1t112s0§.§1t12584s0§)
               {
                  if(_loc9_ == 250)
                  {
                     _loc2_.bgParam2 = 1;
                     _loc9_ = 250;
                  }
                  else if(_loc9_ == this.roomWidth / 2)
                  {
                     _loc2_.bgParam2 = 3;
                     _loc9_ = 570;
                  }
                  else
                  {
                     _loc2_.bgParam2 = 2;
                     _loc9_ = 850;
                  }
               }
               this.§1t1748s0§.push("<obj><id>" + 22 + "</id><x>" + _loc9_ + "</x><property>" + _loc5_ + ",50,-1,1," + §1t9130s0§ + "," + _loc10_ + "," + _loc13_ + "," + this.bgParam + "</property><name>" + _loc11_ + "</name></obj>");
            }
         }
         if(this.§1t1781s0§())
         {
            this.§1t1779s0§(param1);
         }
         if(this.roomType == §1t11371s0§ || this.roomType == §1t11374s0§ || this.roomType == §1t11375s0§ || this.roomType == §1t11372s0§)
         {
            _loc2_.roomIcon = this.§1t1752s0§;
         }
         else
         {
            _loc2_.roomIcon = this.roomType;
         }
         _loc2_.objectList = new XMLList(this.§1t1748s0§.join(""));
         return _loc2_;
      }
      
      internal function §1t1768s0§(param1:Array) : Boolean
      {
         return §1t402s0§.§1t1768s0§(param1,this.enterFrom);
      }
      
      public function §1t1769s0§() : Boolean
      {
         return this.§1t1768s0§(this.§1t1746s0§);
      }
      
      internal function §1t1770s0§(param1:int) : *
      {
         switch(param1)
         {
            case 1:
               return 95;
            case 2:
               return 44;
            case 3:
               return 94;
            case 4:
               return 54;
            case 5:
               return 90;
            case 6:
               return 47;
            case 7:
               return 49;
            case 8:
               return 140;
            case 9:
               return 51;
            default:
               return 0;
         }
      }
      
      internal function §1t1771s0§(param1:int, param2:int) : *
      {
         var _loc4_:XML = null;
         var _loc3_:* = int(this.§1t1748s0§.length - 1);
         while(_loc3_ >= 0)
         {
            _loc4_ = XML(this.§1t1748s0§[_loc3_]);
            if(_loc4_.id == 21)
            {
               if(Math.abs(param1 - (int(_loc4_.x) + this.§1t1770s0§(int(_loc4_.property)) / 2)) < param2)
               {
                  this.§1t1748s0§.splice(_loc3_,1);
               }
            }
            _loc3_--;
         }
      }
      
      public function §1t1772s0§(param1:uint) : *
      {
         this.§1t1773s0§ = param1;
      }
      
      public function §1t1777s0§(param1:int, param2:int, param3:String, param4:§1t58s0§) : int
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this.§1t1776s0§ = param2;
         this.§1t1752s0§ = 1000 + param2;
         if(this.§1t1774s0§ == 0)
         {
            this.§1t1774s0§ = param1;
            this.slots = new Array(param1);
            if(param2 != 15)
            {
               if(this.bg == §1t112s0§.§1t12570s0§)
               {
                  _loc5_ = 0;
                  while(_loc5_ < param1)
                  {
                     this.slots[_loc5_] = 1;
                     _loc5_++;
                  }
               }
               else
               {
                  this.slots[0] = param4.rand(2) + 2;
                  _loc5_ = 1;
                  while(_loc5_ < param1)
                  {
                     this.slots[_loc5_] = param4.rand(2) + 15;
                     this.slots[_loc5_ + 1] = this.slots[_loc5_];
                     _loc5_ += 2;
                  }
               }
            }
            else
            {
               _loc5_ = 0;
               while(_loc5_ < param1)
               {
                  if(this.bg == §1t112s0§.§1t12570s0§)
                  {
                     this.slots[_loc5_] = 1;
                  }
                  else
                  {
                     this.slots[_loc5_] = param4.rand(2) + 2;
                  }
                  _loc5_++;
               }
            }
            this.roomWidth = param1 * 355;
            this.roomName = param3;
         }
         if(param2 != 0 && param2 != 15)
         {
            _loc6_ = §1t8615s0§.§1t12676s0§(param2);
            if(this.roomType == §1t11372s0§)
            {
               _loc7_ = param4.rand(param1 - _loc6_ - 1) + 1;
               this.slots[0] = §1t8615s0§.§1t12675s0§;
            }
            else
            {
               _loc7_ = param4.rand(param1 - _loc6_);
            }
            if(_loc7_ != 0 && §1t8615s0§.§1t12676s0§(this.slots[_loc7_]) == 2)
            {
               if(this.slots[_loc7_ - 1] == this.slots[_loc7_])
               {
                  this.slots[_loc7_ - 1] = §1t8615s0§.§1t12630s0§;
               }
            }
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               this.slots[_loc7_ + _loc5_] = param2;
               _loc5_++;
            }
         }
         return _loc7_;
      }
      
      internal function §1t1778s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         if(this.bg == §1t112s0§.§1t12570s0§)
         {
            return;
         }
         if(param1 == 250)
         {
            if(§1t8615s0§.§1t12676s0§(this.slots[0]) == 2)
            {
               if(this.bg == §1t112s0§.§1t12570s0§)
               {
                  this.slots[1] = 1;
               }
               else
               {
                  this.slots[1] = 2;
               }
            }
            if(this.slots[0] != 0 && this.slots[0] != 1 && this.slots[0] != 2 && this.slots[0] != 3 && this.slots[0] != 15 && this.slots[0] != 16)
            {
               this.slots[1] = this.slots[0];
            }
            this.slots[0] = §1t8615s0§.§1t12642s0§;
         }
         else if(param1 == this.roomWidth - 250)
         {
            if(§1t8615s0§.§1t12676s0§(this.slots[this.§1t1774s0§ - 2]) == 2)
            {
               if(this.bg == §1t112s0§.§1t12570s0§)
               {
                  this.slots[this.§1t1774s0§ - 2] = 1;
               }
               else
               {
                  this.slots[this.§1t1774s0§ - 2] = 3;
               }
            }
            if(this.slots[this.§1t1774s0§ - 1] != 0 && this.slots[this.§1t1774s0§ - 1] != 1 && this.slots[this.§1t1774s0§ - 1] != 2 && this.slots[this.§1t1774s0§ - 1] != 3 && this.slots[this.§1t1774s0§ - 1] != 15 && this.slots[this.§1t1774s0§ - 1] != 16)
            {
               this.slots[this.§1t1774s0§ - 2] = this.slots[this.§1t1774s0§ - 1];
            }
            this.slots[this.§1t1774s0§ - 1] = §1t8615s0§.§1t12642s0§;
         }
         else
         {
            _loc2_ = Math.floor((this.§1t1774s0§ - 1) / 2);
            if(§1t8615s0§.§1t12676s0§(this.slots[_loc2_]) == 2)
            {
               if(this.slots[_loc2_ - 1] == this.slots[_loc2_])
               {
                  if(this.bg == §1t112s0§.§1t12570s0§)
                  {
                     this.slots[_loc2_ - 1] = 1;
                  }
                  else
                  {
                     this.slots[_loc2_ - 1] = 2;
                  }
               }
               else if(this.slots[_loc2_ + 1] == this.slots[_loc2_])
               {
                  if(this.bg == §1t112s0§.§1t12570s0§)
                  {
                     this.slots[_loc2_ + 1] = 1;
                  }
                  else
                  {
                     this.slots[_loc2_ + 1] = 3;
                  }
               }
            }
            if(this.slots[_loc2_] != 0 && this.slots[_loc2_] != 1 && this.slots[_loc2_] != 2 && this.slots[_loc2_] != 3 && this.slots[_loc2_] != 15 && this.slots[_loc2_] != 16)
            {
               this.slots[_loc2_ + 1] = this.slots[_loc2_];
            }
            this.slots[_loc2_] = §1t8615s0§.§1t12642s0§;
         }
      }
      
      internal function §1t1779s0§(param1:§1t58s0§) : *
      {
         if(§1t8615s0§.§1t12676s0§(this.slots[this.§1t1774s0§ - 1]) == 2 && this.slots[this.§1t1774s0§ - 1] != this.slots[this.§1t1774s0§ - 2])
         {
            if(this.slots[this.§1t1774s0§ - 1] != 15 && this.slots[this.§1t1774s0§ - 1] != 16)
            {
               this.§1t1752s0§ = 0;
            }
            this.slots[this.§1t1774s0§ - 1] = §1t8615s0§.§1t12630s0§;
         }
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         while(_loc3_ < this.§1t1774s0§)
         {
            if(this.slots[_loc3_] == §1t8615s0§.§1t12642s0§)
            {
               _loc2_ = _loc3_;
            }
            else
            {
               this.§1t1765s0§(27,_loc3_ * 355,this.slots[_loc3_] + "," + this.§1t1773s0§,"building" + _loc3_);
               _loc3_ += §1t8615s0§.§1t12676s0§(this.slots[_loc3_]) - 1;
            }
            _loc3_++;
         }
         if(_loc2_ != -1)
         {
            this.§1t1765s0§(27,_loc2_ * 355,§1t8615s0§.§1t12642s0§.toString() + "," + this.§1t1773s0§,"junction");
         }
         else if(this.roomType == §1t11376s0§)
         {
            this.§1t1766s0§(76,this.roomWidth / 2,"","");
         }
      }
      
      internal function §1t1318s0§() : Boolean
      {
         return this.bg == §1t112s0§.§1t12570s0§ || this.bg == §1t112s0§.§1t12571s0§ || this.bg == §1t112s0§.§1t12572s0§;
      }
      
      internal function §1t1780s0§() : Boolean
      {
         return this.bg == §1t112s0§.§1t12562s0§ || this.bg == §1t112s0§.§1t12598s0§ || this.bg == §1t112s0§.§1t12569s0§;
      }
      
      internal function §1t1781s0§() : Boolean
      {
         return this.bg == §1t112s0§.§1t12570s0§ || this.bg == §1t112s0§.§1t12571s0§ || this.bg == §1t112s0§.§1t12572s0§;
      }
      
      public function §1t1782s0§(param1:int, param2:int, param3:int, param4:§1t58s0§, param5:Boolean) : *
      {
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc8_:Boolean = this.§1t1769s0§();
         if(param3 != 6)
         {
            param2 += 5;
         }
         if(this.roomType == §1t11377s0§)
         {
            if(this.§1t1750s0§ == §1t9131s0§ || this.§1t1750s0§ == §1t9129s0§)
            {
               if(§1t1523s0§.§1t7746s0§() == param3 && §1t1523s0§.§1t7746s0§() != 0)
               {
                  if(param3 == 1)
                  {
                     this.§1t1766s0§(3,150,"252,idle2,1","guard" + this.roomid);
                  }
                  else if(param3 == 2)
                  {
                     this.§1t1766s0§(3,150,"452,idle2,1","guard" + this.roomid);
                  }
                  else if(param3 == 3)
                  {
                     this.§1t1766s0§(3,150,"352,idle2,1","guard" + this.roomid);
                  }
                  else if(param3 == 4)
                  {
                     this.§1t1766s0§(3,150,"552,idle2,1","guard" + this.roomid);
                  }
                  else
                  {
                     this.§1t1766s0§(3,150,"652,idle2,1","guard0");
                  }
               }
               else if(param3 == 1)
               {
                  this.§1t1766s0§(9,150,"252," + param2 + ",<xml><wave><enemy><id>252</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else if(param3 == 2)
               {
                  this.§1t1766s0§(9,150,"452," + param2 + ",<xml><wave><enemy><id>452</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else if(param3 == 3)
               {
                  this.§1t1766s0§(9,150,"352," + param2 + ",<xml><wave><enemy><id>352</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else if(param3 == 4)
               {
                  this.§1t1766s0§(9,150,"552," + param2 + ",<xml><wave><enemy><id>552</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else if(param3 == 6)
               {
                  this.§1t1766s0§(9,150,"25," + param2 + ",<xml><wave><enemy><id>" + 25 + "</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else
               {
                  this.§1t1766s0§(9,150,"652," + param2 + ",<xml><wave><enemy><id>652</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
            }
            else if(§1t1523s0§.§1t7746s0§() == param3 && §1t1523s0§.§1t7746s0§() != 0)
            {
               if(param3 == 1)
               {
                  this.§1t1766s0§(3,this.roomWidth - 150,"252","guard" + this.roomid);
               }
               else if(param3 == 2)
               {
                  this.§1t1766s0§(3,this.roomWidth - 150,"452","guard" + this.roomid);
               }
               else if(param3 == 3)
               {
                  this.§1t1766s0§(3,this.roomWidth - 150,"352","guard" + this.roomid);
               }
               else if(param3 == 4)
               {
                  this.§1t1766s0§(3,this.roomWidth - 150,"552","guard" + this.roomid);
               }
               else
               {
                  this.§1t1766s0§(3,this.roomWidth - 150,"652","guard0");
               }
            }
            else if(param3 == 1)
            {
               this.§1t1766s0§(9,this.roomWidth - 150,"252," + param2 + ",<xml><wave><enemy><id>252</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else if(param3 == 2)
            {
               this.§1t1766s0§(9,this.roomWidth - 150,"452," + param2 + ",<xml><wave><enemy><id>452</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else if(param3 == 3)
            {
               this.§1t1766s0§(9,this.roomWidth - 150,"352," + param2 + ",<xml><wave><enemy><id>352</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else if(param3 == 4)
            {
               this.§1t1766s0§(9,this.roomWidth - 150,"552," + param2 + ",<xml><wave><enemy><id>552</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else if(param3 == 6)
            {
               this.§1t1766s0§(9,this.roomWidth - 150,"25," + param2 + ",<xml><wave><enemy><id>" + 25 + "</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else
            {
               this.§1t1766s0§(9,this.roomWidth - 150,"652," + param2 + ",<xml><wave><enemy><id>652</id><qty>" + 1 + "</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
         }
         else
         {
            if(this.roomType != §1t11404s0§ && this.roomType != §1t11406s0§ && param5)
            {
               this.isPrivate = §1t134s0§.§1t9234s0§;
               return;
            }
            _loc9_ = 3;
            if(this.roomType == §1t11379s0§ || this.roomType == §1t11405s0§ || this.roomType == §1t11402s0§)
            {
               _loc9_ = 1;
            }
            else if(this.roomType == §1t11406s0§)
            {
               _loc9_ = 0;
            }
            if(§1t1523s0§.§1t7746s0§() == param3 && §1t1523s0§.§1t7746s0§() != 0)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  if(param3 == 1)
                  {
                     this.§1t1765s0§(4,param4.rand(this.roomWidth),"252","guard" + this.roomid);
                  }
                  else if(param3 == 2)
                  {
                     this.§1t1765s0§(4,param4.rand(this.roomWidth),"452","guard" + this.roomid);
                  }
                  else if(param3 == 3)
                  {
                     this.§1t1765s0§(4,param4.rand(this.roomWidth),"352","guard" + this.roomid);
                  }
                  else if(param3 == 4)
                  {
                     this.§1t1765s0§(4,param4.rand(this.roomWidth),"552","guard" + this.roomid);
                  }
                  else
                  {
                     this.§1t1765s0§(4,param4.rand(this.roomWidth),"652","guard" + this.roomid);
                  }
                  _loc10_++;
               }
            }
            else
            {
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  if(param3 == 1)
                  {
                     if(param4.rand(3) == 0)
                     {
                        _loc11_ = "252," + param2 + ",<xml><wave><enemy><id>252</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>252</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>252</id><qty>8</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        _loc11_ = "252," + param2 + ",<xml><wave><enemy><id>252</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>252</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     this.§1t1765s0§(9,param4.rand(this.roomWidth),_loc11_,"guard" + this.roomid);
                  }
                  else if(param3 == 2)
                  {
                     if(param4.rand(3) == 0)
                     {
                        _loc11_ = "452," + param2 + ",<xml><wave><enemy><id>452</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>452</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>452</id><qty>8</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        _loc11_ = "452," + param2 + ",<xml><wave><enemy><id>452</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>452</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     this.§1t1765s0§(9,param4.rand(this.roomWidth),_loc11_,"guard" + this.roomid);
                  }
                  else if(param3 == 3)
                  {
                     if(param4.rand(3) == 0)
                     {
                        _loc11_ = "352," + param2 + ",<xml><wave><enemy><id>352</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>352</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>352</id><qty>8</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        _loc11_ = "352," + param2 + ",<xml><wave><enemy><id>352</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>352</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     this.§1t1765s0§(9,param4.rand(this.roomWidth),_loc11_,"guard" + this.roomid);
                  }
                  else if(param3 == 4)
                  {
                     if(param4.rand(3) == 0)
                     {
                        _loc11_ = "552," + param2 + ",<xml><wave><enemy><id>552</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>552</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>552</id><qty>8</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        _loc11_ = "552," + param2 + ",<xml><wave><enemy><id>552</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>552</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     this.§1t1765s0§(9,param4.rand(this.roomWidth),_loc11_,"guard" + this.roomid);
                  }
                  else if(param3 == 6)
                  {
                     this.§1t1748s0§.push(§1t11408s0§(param4,§1t70s0§.§1t9183s0§,this.roomWidth,param4.rand(this.roomWidth),param2,"guard" + this.roomid));
                  }
                  else
                  {
                     if(param4.rand(3) == 0)
                     {
                        _loc11_ = "652," + param2 + ",<xml><wave><enemy><id>652</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>652</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>652</id><qty>8</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        _loc11_ = "652," + param2 + ",<xml><wave><enemy><id>652</id><qty>4</qty><lvl>" + param2 + "</lvl></enemy></wave><wave><enemy><id>652</id><qty>6</qty><lvl>" + param2 + "</lvl></enemy></wave></xml>,2";
                     }
                     this.§1t1765s0§(9,param4.rand(this.roomWidth),_loc11_,"guard" + this.roomid);
                  }
                  _loc10_++;
               }
            }
         }
      }
      
      internal function §1t1783s0§() : Boolean
      {
         return this.roomType == §1t11362s0§ || this.roomType == §1t11391s0§ || this.roomType == §1t11392s0§ || this.roomType == §1t11393s0§ || this.roomType == §1t11394s0§ || this.roomType == §1t11395s0§;
      }
      
      public function §1t1784s0§(param1:int, param2:int, param3:int, param4:§1t58s0§, param5:int) : *
      {
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = 0;
         var _loc17_:String = null;
         var _loc18_:int = 0;
         var _loc19_:Point = null;
         var _loc20_:int = 0;
         var _loc21_:Array = null;
         var _loc22_:Boolean = false;
         var _loc23_:Point = null;
         var _loc24_:XMLList = null;
         var _loc25_:XMLList = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc6_:§1t58s0§ = §1t58s0§.§1t8804s0§(param5 * this.roomid);
         var _loc9_:Boolean = this.§1t1769s0§();
         if(this.roomType == §1t11361s0§ && (this.bg == §1t112s0§.§1t12562s0§ || this.bg == §1t112s0§.§1t12598s0§))
         {
            _loc10_ = this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3];
            if(_loc10_ == 2 && this.§1t1764s0§() && param4.rand(4) == 0)
            {
               if(param2 < 10)
               {
                  this.roomType = §1t11391s0§;
               }
               else if(param2 < 50)
               {
                  this.roomType = §1t11392s0§;
               }
               else
               {
                  this.roomType = §1t11393s0§;
               }
            }
         }
         else if(this.roomType == §1t11361s0§ && this.bg == §1t112s0§.§1t12584s0§)
         {
            _loc10_ = this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3];
            if(_loc10_ == 2)
            {
               if(param2 < 10)
               {
                  this.roomType = §1t11391s0§;
               }
               else if(param2 < 50)
               {
                  this.roomType = §1t11392s0§;
               }
               else
               {
                  this.roomType = §1t11393s0§;
               }
            }
         }
         else if(this.roomType == §1t11382s0§)
         {
            if(this.§1t1764s0§() && param4.rand(2) == 0)
            {
               if(param2 < 10)
               {
                  this.roomType = §1t11391s0§;
               }
               else if(param2 < 50)
               {
                  this.roomType = §1t11392s0§;
               }
               else
               {
                  this.roomType = §1t11393s0§;
               }
            }
            else
            {
               this.roomType = §1t11361s0§;
            }
         }
         else if(this.roomType == §1t11363s0§ && this.§1t1764s0§() && param4.rand(2) == 0)
         {
            this.roomType = §1t11395s0§;
         }
         if(this.roomType != §1t11370s0§ && this.roomType != §1t11397s0§ && this.roomType != §1t11380s0§ && !this.§1t1783s0§() && (param1 == §1t70s0§.§1t9165s0§ || param1 == §1t70s0§.§1t9182s0§ || param1 == §1t70s0§.§1t9184s0§) && (this.bg == §1t112s0§.§1t12562s0§ || this.bg == §1t112s0§.§1t12598s0§ || this.bg == §1t112s0§.§1t12569s0§))
         {
            _loc11_ = 50;
            _loc13_ = 0;
            while(_loc11_ < this.roomWidth - 150)
            {
               if(param4.rand(4) < 3)
               {
                  _loc12_ = param4.rand(8) + 1;
                  this.§1t1748s0§.push("<obj><id>" + 21 + "</id><x>" + _loc11_ + "</x><property>" + _loc12_ + "</property></obj>");
                  _loc11_ += this.§1t1770s0§(_loc12_) + 10;
               }
               else
               {
                  _loc11_ += 100;
               }
               _loc13_++;
            }
         }
         if(this.roomType == §1t11360s0§)
         {
            this.roomWidth = 800;
            if(this.enterFrom == §1t9129s0§ || this.enterFrom == §1t9131s0§)
            {
               this.§1t1771s0§(50,100);
            }
            else
            {
               this.§1t1771s0§(750,100);
            }
         }
         if(this.isPrivate != §1t134s0§.§1t9232s0§ && this.isPrivate != §1t134s0§.§1t9236s0§ && param1 != §1t70s0§.§1t9178s0§ && (this.roomType == §1t11361s0§ || this.roomType == §1t11363s0§ || this.roomType == §1t11364s0§ || this.roomType == §1t11368s0§ || this.roomType == §1t11385s0§ || this.roomType == §1t11386s0§ || this.roomType == §1t11372s0§ || this.roomType == §1t11373s0§ || this.roomType == §1t11384s0§))
         {
            _loc14_ = this.roomWidth / 200;
            _loc15_ = 0;
            _loc16_ = 1;
            while(_loc16_ < _loc14_ - 1)
            {
               if(param4.rand(3) > 0 || param1 == §1t70s0§.§1t9177s0§)
               {
                  _loc7_ = "aggro" + this.roomid;
                  this.§1t1748s0§.push(§1t11408s0§(param4,param1,this.roomWidth,200 * _loc16_,param2,_loc7_));
                  _loc15_++;
               }
               _loc16_ += 2;
            }
            if(_loc15_ == 0)
            {
               _loc16_ = 1;
               while(_loc16_ < _loc14_ - 1)
               {
                  if(param4.rand(3) < 2)
                  {
                     _loc7_ = "aggro" + this.roomid;
                     this.§1t1748s0§.push(§1t11408s0§(param4,param1,this.roomWidth,200 * _loc16_,param2,_loc7_));
                  }
                  _loc16_ += 2;
               }
            }
         }
         if(this.roomType == §1t11363s0§)
         {
            this.roomWidth = 800;
            if(param1 == §1t70s0§.§1t9165s0§ && param4.rand(2) == 0)
            {
               this.§1t1748s0§.push(§1t11409s0§(param4,this.roomWidth,param4.rand(this.roomWidth - 400) + 200,param2,"subboss"));
            }
            _loc7_ = "key" + this.roomid;
            if(this.§1t1746s0§[0] == 1 || this.§1t1746s0§[2] == 1)
            {
               this.§1t1748s0§.push("<obj><id>" + 16 + "</id><x>100</x><property>20</property><name>" + _loc7_ + "</name></obj>");
               this.§1t1771s0§(100,100);
            }
            else
            {
               this.§1t1748s0§.push("<obj><id>" + 16 + "</id><x>" + (this.roomWidth - 100) + "</x><property>20</property><name>" + _loc7_ + "</name></obj>");
               this.§1t1771s0§(this.roomWidth - 100,100);
            }
         }
         else if(this.roomType == §1t11365s0§)
         {
            _loc7_ = "boss" + this.roomid;
            _loc17_ = "goodlootchest" + this.roomid;
            if(this.bg == §1t112s0§.§1t12584s0§)
            {
               this.roomWidth = 1400;
               if(_loc9_ && this.enterFrom != §1t9128s0§ || !_loc9_ && this.enterFrom != §1t9130s0§)
               {
                  this.§1t1748s0§.push("<obj><id>" + 19 + "</id><x>" + (this.roomWidth - 150) + "</x><property>" + param2 + "</property><name>" + _loc17_ + "</name></obj>");
                  this.§1t1771s0§(this.roomWidth - 150,100);
               }
               else
               {
                  this.§1t1748s0§.push("<obj><id>" + 19 + "</id><x>150</x><property>" + param2 + "</property><name>" + _loc17_ + "</name></obj>");
                  this.§1t1771s0§(150,100);
               }
            }
            else
            {
               this.roomWidth = 1000;
               if(_loc9_ && this.enterFrom != §1t9128s0§ || !_loc9_ && this.enterFrom != §1t9130s0§)
               {
                  this.§1t1748s0§.push(§1t11408s0§(param4,param1,this.roomWidth,this.roomWidth - 300,param2,_loc7_,true,0));
                  if(param1 == §1t70s0§.§1t9166s0§)
                  {
                     this.roomWidth = 1200;
                     this.§1t1748s0§.push("<obj><id>" + 24 + "</id><x>" + (this.roomWidth - 100) + "</x><property>" + param5 + ",3</property><name>darumadoll" + this.roomid + "</name></obj>");
                     this.§1t1748s0§.push("<obj><id>" + 12 + "</id><x>300</x><property>1</property></obj>");
                     if(param2 > 50)
                     {
                        this.§1t1748s0§.push(§1t11408s0§(param4,param1,this.roomWidth,this.roomWidth - 500,param2,"ogre2",true,0));
                     }
                  }
                  if(this.bg == §1t112s0§.§1t12569s0§)
                  {
                     this.§1t1748s0§.push("<obj><id>30</id><x>" + (this.roomWidth - 50) + "</x><property>100</property><name>" + _loc17_ + "</name></obj>");
                  }
                  else
                  {
                     this.§1t1748s0§.push("<obj><id>" + 19 + "</id><x>" + (this.roomWidth - 150) + "</x><property>" + param2 + "</property><name>" + _loc17_ + "</name></obj>");
                  }
                  this.§1t1771s0§(this.roomWidth - 150,100);
               }
               else
               {
                  this.§1t1748s0§.push(§1t11408s0§(param4,param1,this.roomWidth,300,param2,_loc7_,true,1));
                  if(param1 == §1t70s0§.§1t9166s0§)
                  {
                     this.roomWidth = 1200;
                     this.§1t1748s0§.push("<obj><id>" + 24 + "</id><x>100</x><property>" + param5 + ",3</property><name>darumadoll" + this.roomid + "</name></obj>");
                     this.§1t1748s0§.push("<obj><id>" + 12 + "</id><x>" + (this.roomWidth - 300) + "</x><property>1</property></obj>");
                     if(param2 > 50)
                     {
                        this.§1t1748s0§.push(§1t11408s0§(param4,param1,this.roomWidth,500,param2,"ogre2",true,0));
                     }
                  }
                  if(this.bg == §1t112s0§.§1t12569s0§)
                  {
                     this.§1t1748s0§.push("<obj><id>30</id><x>50</x><property>100</property><name>" + _loc17_ + "</name></obj>");
                  }
                  else
                  {
                     this.§1t1748s0§.push("<obj><id>" + 19 + "</id><x>150</x><property>" + param2 + "</property><name>" + _loc17_ + "</name></obj>");
                  }
                  this.§1t1771s0§(150,100);
               }
            }
         }
         else if(this.roomType == §1t11364s0§)
         {
            this.roomWidth = 800;
            if(param1 == §1t70s0§.§1t9165s0§ && param4.rand(3) == 0)
            {
               this.§1t1748s0§.push(§1t11409s0§(param4,this.roomWidth,param4.rand(this.roomWidth - 400) + 200,param2,"subboss"));
            }
            _loc7_ = "lootchest" + this.roomid;
            if(param4.rand(2) == 0)
            {
               if(this.§1t1746s0§[0] == 1 || this.§1t1746s0§[2] == 1)
               {
                  if(this.bg == §1t112s0§.§1t12563s0§ && param1 != §1t70s0§.§1t9166s0§)
                  {
                     this.§1t1748s0§.push("<obj><id>2</id><x>100</x><property>8," + param2 + "</property><name>" + _loc7_ + "</name></obj>");
                  }
                  else if(this.bg == §1t112s0§.§1t12569s0§)
                  {
                     this.§1t1748s0§.push("<obj><id>30</id><x>50</x><property>0</property><name>" + _loc7_ + "</name></obj>");
                  }
                  else
                  {
                     this.§1t1748s0§.push("<obj><id>" + 18 + "</id><x>100</x><property>" + param2 + "</property><name>" + _loc7_ + "</name></obj>");
                  }
                  this.§1t1771s0§(100,100);
               }
               else
               {
                  if(this.bg == §1t112s0§.§1t12563s0§ && param1 != §1t70s0§.§1t9166s0§)
                  {
                     this.§1t1748s0§.push("<obj><id>2</id><x>" + (this.roomWidth - 100) + "</x><property>8," + param2 + "</property><name>" + _loc7_ + "</name></obj>");
                  }
                  else if(this.bg == §1t112s0§.§1t12569s0§)
                  {
                     this.§1t1748s0§.push("<obj><id>30</id><x>" + (this.roomWidth - 50) + "</x><property>0</property><name>" + _loc7_ + "</name></obj>");
                  }
                  else
                  {
                     this.§1t1748s0§.push("<obj><id>" + 18 + "</id><x>" + (this.roomWidth - 100) + "</x><property>" + param2 + "</property><name>" + _loc7_ + "</name></obj>");
                  }
                  this.§1t1771s0§(this.roomWidth - 100,100);
               }
            }
            else if(this.roomid > 10 && param4.rand(4) == 3)
            {
               _loc18_ = param4.rand(3);
               if(this.§1t1746s0§[0] == 1 || this.§1t1746s0§[2] == 1)
               {
                  this.§1t1748s0§.push("<obj><id>" + 60 + "</id><x>100</x><property>," + param2 + "," + _loc18_ + "</property><name>" + _loc7_ + "</name></obj>");
                  this.§1t1771s0§(100,100);
               }
               else
               {
                  this.§1t1748s0§.push("<obj><id>" + 60 + "</id><x>" + (this.roomWidth - 100) + "</x><property>," + param2 + "," + _loc18_ + "</property><name>" + _loc7_ + "</name></obj>");
                  this.§1t1771s0§(this.roomWidth - 100,100);
               }
            }
            else
            {
               this.roomType = §1t11361s0§;
            }
         }
         else if(this.roomType == §1t11366s0§)
         {
            this.roomWidth = 800;
            if(param1 == §1t70s0§.§1t9165s0§ && param4.rand(2) == 0)
            {
               this.§1t1748s0§.push(§1t11409s0§(param4,this.roomWidth,param4.rand(this.roomWidth - 400) + 200,param2,"subboss"));
            }
            _loc7_ = "goodlootchest" + this.roomid;
            if(this.§1t1746s0§[0] == 1 || this.§1t1746s0§[2] == 1)
            {
               this.§1t1748s0§.push("<obj><id>" + 19 + "</id><x>150</x><property>" + param2 + "</property><name>" + _loc7_ + "</name></obj>");
               this.§1t1771s0§(150,100);
            }
            else
            {
               this.§1t1748s0§.push("<obj><id>" + 19 + "</id><x>" + (this.roomWidth - 150) + "</x><property>" + param2 + "</property><name>" + _loc7_ + "</name></obj>");
               this.§1t1771s0§(this.roomWidth - 150,100);
            }
         }
         else if(this.roomType == §1t11370s0§)
         {
            this.roomWidth = 800;
            if(this.§1t1746s0§[0] == 1 || this.§1t1746s0§[2] == 1)
            {
               this.§1t1748s0§.push("<obj><id>" + 0 + "</id><x>50</x><property>-1," + param3 + ",-1</property></obj>");
               this.§1t1771s0§(50,100);
            }
            else
            {
               this.§1t1748s0§.push("<obj><id>" + 0 + "</id><x>" + (this.roomWidth - 50) + "</x><property>-1," + param3 + ",-1</property></obj>");
               this.§1t1771s0§(this.roomWidth - 50,100);
            }
         }
         else if(this.roomType == §1t11397s0§)
         {
            this.roomWidth = 800;
            if(this.§1t1746s0§[0] == 1 || this.§1t1746s0§[2] == 1)
            {
               this.§1t1748s0§.push("<obj><id>" + 0 + "</id><x>50</x><property>-2," + param3 + ",-1</property></obj>");
               this.§1t1771s0§(50,100);
            }
            else
            {
               this.§1t1748s0§.push("<obj><id>" + 0 + "</id><x>" + (this.roomWidth - 50) + "</x><property>-2," + param3 + ",-1</property></obj>");
               this.§1t1771s0§(this.roomWidth - 50,100);
            }
         }
         else if(this.roomType == §1t11396s0§)
         {
            _loc19_ = §1t70s0§.instance.§1t1133s0§(param5);
            _loc21_ = [-1];
            _loc16_ = 0;
            while(_loc16_ < 4)
            {
               _loc22_ = false;
               if(_loc16_ == §1t9128s0§)
               {
                  _loc23_ = new Point(_loc19_.x,_loc19_.y - 1);
               }
               else if(_loc16_ == §1t9129s0§)
               {
                  _loc23_ = new Point(_loc19_.x,_loc19_.y + 1);
               }
               else if(_loc16_ == §1t9130s0§)
               {
                  _loc23_ = new Point(_loc19_.x + 1,_loc19_.y);
               }
               else if(_loc16_ == §1t9131s0§)
               {
                  _loc23_ = new Point(_loc19_.x - 1,_loc19_.y);
               }
               while(!_loc22_)
               {
                  _loc20_ = _loc23_.x << 12 | _loc23_.y;
                  if(!§1t1524s0§.§1t7976s0§(_loc23_.x,_loc23_.y))
                  {
                     _loc22_ = true;
                     _loc20_ = -1;
                  }
                  if(§1t1524s0§.§1t9855s0§(_loc20_) == 0)
                  {
                     if(_loc16_ == §1t9128s0§)
                     {
                        --_loc23_.y;
                     }
                     else if(_loc16_ == §1t9129s0§)
                     {
                        ++_loc23_.y;
                     }
                     else if(_loc16_ == §1t9130s0§)
                     {
                        ++_loc23_.x;
                     }
                     else if(_loc16_ == §1t9131s0§)
                     {
                        --_loc23_.x;
                     }
                  }
                  else
                  {
                     _loc22_ = true;
                     _loc21_.push(§1t70s0§.instance.§1t1129s0§(_loc23_.x,_loc23_.y).§1t1320s0§());
                  }
               }
               _loc16_++;
            }
            this.roomWidth = 800;
            _loc14_ = int(_loc21_.length);
            if(this.§1t1746s0§[0] == 1 || this.§1t1746s0§[2] == 1)
            {
               _loc16_ = 0;
               while(_loc16_ < _loc14_)
               {
                  this.§1t1748s0§.push("<obj><id>" + 0 + "</id><x>" + (50 + _loc16_ * 100) + "</x><property>0," + param3 + "," + _loc21_[_loc16_] + "</property></obj>");
                  _loc16_++;
               }
               this.§1t1771s0§(50,100);
            }
            else
            {
               _loc16_ = int(_loc14_ - 1);
               while(_loc16_ >= 0)
               {
                  this.§1t1748s0§.push("<obj><id>" + 0 + "</id><x>" + (this.roomWidth - 50 - _loc16_ * 100) + "</x><property>0," + param3 + "," + _loc21_[_loc16_] + "</property></obj>");
                  _loc16_--;
               }
               this.§1t1771s0§(this.roomWidth - 50,100);
            }
         }
         else if(this.roomType != §1t11377s0§)
         {
            if(this.roomType == §1t11381s0§)
            {
               this.roomWidth = 1000;
               this.§1t1748s0§.push("<obj><id>" + 25 + "</id><x>" + this.roomWidth / 2 + "</x><property>6,0,0</property></obj>");
            }
            else if(this.roomType == §1t11383s0§)
            {
               this.roomWidth = 2000;
               this.bg = §1t112s0§.§1t12583s0§;
               _loc16_ = 0;
               while(_loc16_ < 3 + param4.rand(3))
               {
                  this.§1t1765s0§(4,param4.rand(this.roomWidth),"31","npc" + _loc16_);
                  _loc16_++;
               }
            }
            else if(this.roomType == §1t11386s0§)
            {
               this.roomWidth = 800;
               if(param1 == §1t70s0§.§1t9165s0§ && param4.rand(2) == 0)
               {
                  this.§1t1748s0§.push(§1t11409s0§(param4,this.roomWidth,param4.rand(this.roomWidth - 400) + 200,param2,"subboss"));
               }
               _loc7_ = "lever" + this.roomid;
               if(this.§1t1746s0§[0] == 1 || this.§1t1746s0§[2] == 1)
               {
                  this.§1t1748s0§.push("<obj><id>" + 33 + "</id><x>100</x><property>,5</property><name>" + _loc7_ + "</name></obj>");
                  this.§1t1771s0§(100,100);
               }
               else
               {
                  this.§1t1748s0§.push("<obj><id>" + 33 + "</id><x>" + (this.roomWidth - 100) + "</x><property>,5</property><name>" + _loc7_ + "</name></obj>");
                  this.§1t1771s0§(this.roomWidth - 100,100);
               }
            }
            else if(this.roomType == §1t11384s0§)
            {
               if(param1 == §1t70s0§.§1t9165s0§)
               {
                  this.§1t1748s0§.push(§1t11409s0§(param4,this.roomWidth,param4.rand(this.roomWidth - 400) + 200,param2,"subboss"));
               }
            }
            else if(this.roomType == §1t11387s0§)
            {
               this.§1t1765s0§(12,900,"1","");
               this.§1t1765s0§(38,950,"","innbar");
               this.§1t1765s0§(3,975,"148","innkeeper");
            }
            else if(this.roomType == §1t11389s0§)
            {
               this.§1t1765s0§(3,500,(50 + param4.rand(4)).toString() + ",sit,1","patron1");
               this.§1t1765s0§(3,640,"147,sit","croupier1");
               this.§1t1765s0§(37,570,"","gamblingtable1");
               _loc29_ = §1t123s0§.instance.§1t1590s0§(param5,this.roomid,§1t3317s0§.instance.§1t1848s0§());
               _loc16_ = 0;
               while(_loc16_ < _loc29_)
               {
                  this.§1t1765s0§(23,_loc6_.rand(this.roomWidth),_loc16_.toString(),"procgennpc" + _loc16_);
                  _loc16_++;
               }
               _loc29_ = param4.rand(3);
               _loc16_ = 0;
               while(_loc16_ < _loc29_)
               {
                  this.§1t1765s0§(4,500,(50 + _loc6_.rand(4)).toString(),"npc" + _loc16_);
                  _loc16_++;
               }
               this.§1t1765s0§(12,550,"1","");
            }
            else if(this.§1t1783s0§())
            {
               _loc24_ = null;
               _loc27_ = -1;
               if(this.roomType == §1t11362s0§ || this.roomType == §1t11395s0§)
               {
                  if(param2 < 10)
                  {
                     _loc27_ = §1t11391s0§;
                  }
                  else if(param2 < 50)
                  {
                     _loc27_ = §1t11392s0§;
                  }
                  else
                  {
                     _loc27_ = §1t11393s0§;
                  }
               }
               if(this.roomType == §1t11391s0§ || _loc27_ == §1t11391s0§)
               {
                  _loc26_ = param4.rand(4);
                  if(_loc26_ == 3)
                  {
                     _loc25_ = §1t1524s0§.§1t9844s0§.medium;
                  }
                  else
                  {
                     _loc25_ = §1t1524s0§.§1t9844s0§.easy;
                  }
               }
               else if(this.roomType == §1t11392s0§ || _loc27_ == §1t11392s0§)
               {
                  _loc26_ = param4.rand(5);
                  if(_loc26_ == 3)
                  {
                     _loc25_ = §1t1524s0§.§1t9844s0§.easy;
                  }
                  else if(_loc26_ == 4)
                  {
                     _loc25_ = §1t1524s0§.§1t9844s0§.hard;
                  }
                  else
                  {
                     _loc25_ = §1t1524s0§.§1t9844s0§.medium;
                  }
               }
               else if(this.roomType == §1t11393s0§ || _loc27_ == §1t11393s0§)
               {
                  _loc26_ = param4.rand(4);
                  if(_loc26_ == 3)
                  {
                     _loc25_ = §1t1524s0§.§1t9844s0§.medium;
                  }
                  else
                  {
                     _loc25_ = §1t1524s0§.§1t9844s0§.hard;
                  }
               }
               else if(this.roomType == §1t11394s0§)
               {
                  _loc25_ = §1t1524s0§.§1t9844s0§.veryhard;
               }
               if(§1t1524s0§.§1t9844s0§.§default§.toString() != "")
               {
                  _loc24_ = §1t1524s0§.§1t9844s0§.§default§.room;
               }
               else if(_loc25_.room.length() > 0)
               {
                  if(this.roomType == §1t11394s0§)
                  {
                     _loc28_ = this.roomid * §1t3317s0§.instance.§1t1848s0§();
                     _loc24_ = XMLList(_loc25_.room[§1t58s0§.random(_loc25_.room.length(),_loc28_)]);
                  }
                  else
                  {
                     _loc24_ = XMLList(_loc25_.room[param4.rand(_loc25_.room.length())]);
                  }
               }
               if(_loc24_ != null)
               {
                  if(_loc24_.width.toString() != "")
                  {
                     this.roomWidth = _loc24_.width;
                  }
                  else
                  {
                     this.roomWidth = 800;
                  }
                  _loc14_ = int(_loc24_.obj.length());
                  _loc16_ = 0;
                  while(_loc16_ < _loc14_)
                  {
                     this.§1t1748s0§.push(_loc24_.obj[_loc16_].toString());
                     _loc16_++;
                  }
               }
               else if(this.roomType == §1t11395s0§)
               {
                  this.roomType = §1t11363s0§;
               }
               else
               {
                  this.roomType = §1t11369s0§;
               }
               if(this.roomType == §1t11395s0§)
               {
                  this.roomWidth += 150;
                  _loc7_ = "key" + this.roomid;
                  this.§1t1748s0§.push("<obj><id>" + 16 + "</id><x>" + (this.roomWidth - 100) + "</x><property>20</property><name>" + _loc7_ + "</name></obj>");
               }
            }
         }
         if(param1 != §1t70s0§.§1t9183s0§)
         {
            if(this.roomType == §1t11371s0§ || this.roomType == §1t11373s0§ || this.roomType == §1t11372s0§ && param1 != §1t70s0§.§1t9177s0§ || this.roomType == §1t11374s0§ || this.roomType == §1t11375s0§ || this.roomType == §1t11376s0§)
            {
               _loc29_ = §1t123s0§.instance.§1t1590s0§(param5,this.roomid,§1t3317s0§.instance.§1t1848s0§());
               if(param1 == §1t70s0§.§1t9177s0§ && this.roomType == §1t11371s0§)
               {
                  _loc29_ += 2;
               }
               _loc16_ = 0;
               while(_loc16_ < _loc29_)
               {
                  this.§1t1765s0§(23,_loc6_.rand(this.roomWidth),_loc16_.toString(),"procgennpc" + _loc16_);
                  _loc16_++;
               }
               _loc29_ = param4.rand(3);
               _loc16_ = 0;
               while(_loc16_ < _loc29_)
               {
                  this.§1t1765s0§(4,param4.rand(this.roomWidth),(50 + param4.rand(4)).toString(),"npc" + _loc16_);
                  _loc16_++;
               }
            }
            else if(this.roomType == §1t11387s0§ || this.roomType == §1t11388s0§)
            {
               _loc29_ = §1t123s0§.instance.§1t1590s0§(param5,this.roomid,§1t3317s0§.instance.§1t1848s0§());
               _loc16_ = 0;
               while(_loc16_ < _loc29_)
               {
                  this.§1t1765s0§(23,_loc6_.rand(this.roomWidth - 200),_loc16_.toString(),"procgennpc" + _loc16_);
                  _loc16_++;
               }
               _loc29_ = param4.rand(2);
               _loc16_ = 0;
               while(_loc16_ < _loc29_)
               {
                  this.§1t1765s0§(4,param4.rand(this.roomWidth - 200),(50 + param4.rand(4)).toString(),"npc" + _loc16_);
                  _loc16_++;
               }
            }
            else if(this.roomType == §1t11390s0§)
            {
               _loc29_ = §1t123s0§.instance.§1t1590s0§(param5,this.roomid,§1t3317s0§.instance.§1t1848s0§());
               _loc16_ = 0;
               while(_loc16_ < _loc29_)
               {
                  this.§1t1765s0§(23,_loc6_.rand(this.roomWidth),_loc16_.toString(),"procgennpc" + _loc16_);
                  _loc16_++;
               }
            }
         }
         _loc6_.destroy();
      }
      
      public function §1t1785s0§() : *
      {
      }
   }
}

