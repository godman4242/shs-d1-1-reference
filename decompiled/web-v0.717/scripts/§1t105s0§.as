package
{
   public class §1t105s0§
   {
      
      public var id:int;
      
      public var order:int;
      
      public var §1t891s0§:int;
      
      public var lvlreq:int;
      
      private var §1t892s0§:int;
      
      public var passive:Boolean;
      
      public var category:int;
      
      public var input:String;
      
      public var imageurl:String;
      
      public var req:XMLList;
      
      public var levelXML:XMLList;
      
      private var levelList:Vector.<XMLList> = new Vector.<XMLList>();
      
      public function §1t105s0§(param1:XML)
      {
         super();
         this.id = param1.id;
         this.order = param1.order;
         if(param1.displayname.toString() != "")
         {
            this.§1t891s0§ = param1.displayname;
         }
         else
         {
            this.§1t891s0§ = 5001;
         }
         if(param1.lvlreq.toString() != "")
         {
            this.lvlreq = param1.lvlreq;
         }
         else
         {
            this.lvlreq = 0;
         }
         this.req = XMLList(param1.req).copy();
         if(param1.passive != "1")
         {
            this.passive = false;
         }
         else
         {
            this.passive = true;
         }
         this.category = param1.category;
         if(param1.input != "")
         {
            this.input = this.§1t796s0§(param1.input);
         }
         else
         {
            this.input = "";
         }
         if(param1.imageurl != "")
         {
            this.imageurl = this.§1t796s0§(param1.imageurl);
         }
         else
         {
            this.imageurl = "";
         }
         if(param1.desc.toString() != "")
         {
            this.§1t892s0§ = param1.desc;
         }
         else
         {
            this.§1t892s0§ = -1;
         }
         this.levelXML = XMLList(param1.level).copy();
         this.§1t1471s0§();
      }
      
      internal function §1t796s0§(param1:String) : String
      {
         return param1.substr(0,1) + param1.substr(1);
      }
      
      public function §1t1461s0§(param1:int) : String
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:XMLList = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         this.§1t1471s0§();
         var _loc2_:String = "";
         _loc2_ += "<font size=\'16\' color=\'#FFFFFF\'>" + §1t1521s0§.getString(this.§1t891s0§) + "</font><br>";
         if(this.passive)
         {
            _loc2_ += "(" + §1t1521s0§.getString(160) + ")<br>";
         }
         _loc2_ += "<br>";
         if(this.§1t892s0§ != -1)
         {
            _loc2_ += §1t1521s0§.getString(this.§1t892s0§) + "<br><br>";
         }
         if(param1 == 0)
         {
            _loc2_ += "<font size=\'16\' color=\'#FFFFFF\'>" + §1t1521s0§.getString(157) + " (" + §1t1521s0§.getString(155) + " 1)</font><br>";
            if(this.levelList[0].desc != "")
            {
               _loc2_ += §1t1521s0§.getString(this.levelList[0].desc) + "<br>";
            }
            _loc3_ = this.§1t1463s0§(1);
            _loc4_ = this.§1t1465s0§(1) / 24;
            if(_loc3_ > 0)
            {
               _loc2_ += §1t1521s0§.getString(167) + ": " + _loc3_ + "<br>";
            }
            if(_loc4_ > 0)
            {
               _loc2_ += §1t1521s0§.getString(647) + ": " + _loc4_.toFixed(2) + " " + §1t1521s0§.getString(648) + "<br>";
            }
            _loc2_ += "<br>";
            if(!this.§1t1467s0§())
            {
               _loc2_ += "<font color=\'#FF0000\'>";
               if(§1t1523s0§.getLevel() < this.lvlreq)
               {
                  _loc2_ += §1t1521s0§.getString(124) + ": " + this.lvlreq.toString() + "<br>";
               }
               if(!§1t1523s0§.§1t640s0§(this.req))
               {
                  _loc5_ = this.req.has;
                  _loc8_ = int(_loc5_.length() - 1);
                  while(_loc8_ >= 0)
                  {
                     _loc6_ = int(_loc5_[_loc8_].id);
                     _loc7_ = int(_loc5_[_loc8_].qty);
                     if(!§1t1523s0§.§1t9722s0§(_loc6_,_loc7_))
                     {
                        if(_loc6_ < 2000 && _loc6_ >= 1000)
                        {
                           if(_loc7_ <= 1)
                           {
                              _loc2_ += §1t1521s0§.getString(302) + " " + §1t1521s0§.getString(§1t1524s0§.§1t9863s0§(_loc6_).§1t891s0§) + "<br>";
                           }
                           else
                           {
                              _loc2_ += §1t1521s0§.getString(302) + " " + §1t1521s0§.getString(§1t1524s0§.§1t9863s0§(_loc6_).§1t891s0§) + " " + §1t1521s0§.getString(120) + _loc7_ + "<br>";
                           }
                        }
                        else if(_loc6_ == 28)
                        {
                           _loc2_ += §1t1521s0§.getString(302) + " " + _loc7_ + " " + §1t1521s0§.getString(726) + "<br>";
                        }
                        else if(_loc6_ == 29)
                        {
                           _loc2_ += §1t1521s0§.getString(302) + " " + _loc7_ + " " + §1t1521s0§.getString(727) + "<br>";
                        }
                        else if(_loc6_ == 30)
                        {
                           _loc2_ += §1t1521s0§.getString(302) + " " + _loc7_ + " " + §1t1521s0§.getString(728) + "<br>";
                        }
                        else if(_loc6_ == 31)
                        {
                           _loc2_ += §1t1521s0§.getString(302) + " " + _loc7_ + " " + §1t1521s0§.getString(729) + "<br>";
                        }
                        else
                        {
                           _loc2_ += §1t1521s0§.getString(302) + " " + _loc6_ + ": " + _loc7_ + "<br>";
                        }
                     }
                     _loc8_--;
                  }
               }
               _loc2_ += "</font>";
            }
         }
         else
         {
            if(this.levelList.length > param1)
            {
               _loc2_ += "<font size=\'16\' color=\'#FFFFFF\'>" + §1t1521s0§.getString(156) + " (" + §1t1521s0§.getString(155) + " " + param1 + ")</font><br>";
               if(this.levelList[param1 - 1].desc != "")
               {
                  _loc2_ += §1t1521s0§.getString(this.levelList[param1 - 1].desc) + "<br>";
               }
               _loc3_ = this.§1t1463s0§(param1);
               _loc4_ = this.§1t1465s0§(param1) / 24;
               if(_loc3_ > 0)
               {
                  _loc2_ += §1t1521s0§.getString(167) + ": " + _loc3_ + "<br>";
               }
               if(_loc4_ > 0)
               {
                  _loc2_ += §1t1521s0§.getString(647) + ": " + _loc4_.toFixed(2) + " " + §1t1521s0§.getString(648) + "<br>";
               }
               _loc2_ += "<br>";
               _loc2_ += "<font size=\'16\' color=\'#FFFFFF\'>" + §1t1521s0§.getString(157) + " (" + §1t1521s0§.getString(155) + " " + String(param1 + 1) + ")</font><br>";
               if(this.levelList[param1].desc != "")
               {
                  _loc2_ += §1t1521s0§.getString(this.levelList[param1].desc) + "<br>";
               }
               _loc3_ = this.§1t1463s0§(param1 + 1);
               _loc4_ = this.§1t1465s0§(param1 + 1) / 24;
               if(_loc3_ > 0)
               {
                  _loc2_ += §1t1521s0§.getString(167) + ": " + _loc3_ + "<br>";
               }
               if(_loc4_ > 0)
               {
                  _loc2_ += §1t1521s0§.getString(647) + ": " + _loc4_.toFixed(2) + " " + §1t1521s0§.getString(648) + "<br>";
               }
            }
            else
            {
               _loc2_ += "<font size=\'16\' color=\'#FFFFFF\'>" + §1t1521s0§.getString(159) + "</font><br>";
               if(this.levelList[param1 - 1].desc != "")
               {
                  _loc2_ += §1t1521s0§.getString(this.levelList[param1 - 1].desc) + "<br>";
               }
               _loc3_ = this.§1t1463s0§(param1);
               _loc4_ = this.§1t1465s0§(param1) / 24;
               if(_loc3_ > 0)
               {
                  _loc2_ += §1t1521s0§.getString(167) + ": " + _loc3_ + "<br>";
               }
               if(_loc4_ > 0)
               {
                  _loc2_ += §1t1521s0§.getString(647) + ": " + _loc4_.toFixed(2) + " " + §1t1521s0§.getString(648) + "<br>";
               }
            }
            if(§1t1523s0§.getLevel() < this.lvlreq)
            {
               _loc2_ += "<font color=\'#FF0000\'>";
               if(§1t1523s0§.getLevel() < this.lvlreq)
               {
                  _loc2_ += "<br>" + §1t1521s0§.getString(124) + ": " + this.lvlreq.toString() + "<br>";
               }
               _loc2_ += "</font>";
            }
         }
         return _loc2_;
      }
      
      public function §1t1462s0§(param1:int) : String
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         this.§1t1471s0§();
         if(this.§1t1464s0§(param1) > 0)
         {
            _loc2_ = int(this.levelList[param1].required);
            _loc3_ = "";
            if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§) < _loc2_)
            {
               _loc3_ += "<font color=\'#FF0000\'>";
            }
            else
            {
               _loc3_ += "<font color=\'#FFFFFF\'>";
            }
            return _loc3_ + (§1t1521s0§.getString(158) + ": " + _loc2_ + "</font>");
         }
         return "";
      }
      
      public function §1t1463s0§(param1:int) : int
      {
         this.§1t1471s0§();
         param1--;
         if(param1 >= this.levelList.length || this.levelList[param1].chi.toString == "")
         {
            return 0;
         }
         return this.levelList[param1].chi;
      }
      
      public function §1t1464s0§(param1:int) : int
      {
         this.§1t1471s0§();
         if(param1 >= this.levelList.length || param1 < 0 || this.levelList[param1].required.toString == "")
         {
            return 0;
         }
         return this.levelList[param1].required;
      }
      
      public function §1t1465s0§(param1:int) : int
      {
         var _loc2_:int = 0;
         if(this.passive)
         {
            return 0;
         }
         this.§1t1471s0§();
         param1--;
         if(param1 >= this.levelList.length)
         {
            _loc2_ = this.levelList[this.levelList.length - 1].cooldown * 24;
         }
         else if(param1 < 0 || this.levelList[param1].cooldown.toString == "")
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = this.levelList[param1].cooldown * 24;
         }
         return _loc2_ * §1t1523s0§.§1t9589s0§();
      }
      
      public function §1t1466s0§() : Vector.<XMLList>
      {
         this.§1t1471s0§();
         return this.levelList;
      }
      
      public function §1t1467s0§() : Boolean
      {
         return §1t1523s0§.§1t9714s0§(this.id) == 0 && §1t1523s0§.getLevel() >= this.lvlreq && §1t1523s0§.§1t640s0§(this.req) && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§) >= this.§1t1464s0§(0);
      }
      
      public function §1t1468s0§() : Boolean
      {
         this.§1t1471s0§();
         var _loc1_:int = §1t1523s0§.§1t9714s0§(this.id);
         return _loc1_ > 0 && this.levelList.length > _loc1_ && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§) >= this.§1t1464s0§(_loc1_);
      }
      
      public function §1t1469s0§() : Boolean
      {
         var _loc1_:int = §1t1523s0§.§1t9714s0§(this.id);
         if(_loc1_ == 0 && §1t1523s0§.getLevel() >= this.lvlreq && §1t1523s0§.§1t640s0§(this.req) && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§) < this.§1t1464s0§(0))
         {
            return true;
         }
         if(_loc1_ > 0 && this.levelList.length > _loc1_ && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§) < this.§1t1464s0§(_loc1_))
         {
            return true;
         }
         return false;
      }
      
      public function §1t1470s0§() : Boolean
      {
         return !this.passive && §1t1523s0§.§1t9714s0§(this.id) > 0 && §1t1523s0§.getLevel() >= this.lvlreq;
      }
      
      private function §1t1471s0§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.levelXML != null)
         {
            _loc1_ = this.levelXML.length();
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.levelList.push(XMLList(this.levelXML[_loc2_]));
               _loc2_++;
            }
            this.levelXML = null;
         }
      }
   }
}

