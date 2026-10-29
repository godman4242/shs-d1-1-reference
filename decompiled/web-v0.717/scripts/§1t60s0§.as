package
{
   import flash.utils.getDefinitionByName;
   
   public class §1t60s0§
   {
      
      public var §1t797s0§:int;
      
      public var step:int;
      
      internal var §1t799s0§:Boolean = false;
      
      internal var nodeid:int;
      
      internal var roomid:int;
      
      internal var §1t802s0§:int;
      
      internal var date:int;
      
      internal var §1t804s0§:int;
      
      internal var §1t805s0§:int;
      
      internal var §1t806s0§:int;
      
      internal var §1t807s0§:int = -1;
      
      public var §1t808s0§:int = -1;
      
      public var §1t809s0§:int = -1;
      
      public var §1t810s0§:int = -1;
      
      internal var §1t811s0§:String;
      
      public function §1t60s0§(param1:int = 0, param2:int = 0)
      {
         super();
         this.§1t797s0§ = param1;
         this.step = param2;
         this.§1t812s0§();
      }
      
      public static function parse(param1:String) : §1t60s0§
      {
         var _loc3_:* = undefined;
         if(param1 == "59,2")
         {
            §1t1523s0§.§1t1684s0§(60025,1,true);
            §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9681s0§);
            return null;
         }
         var _loc2_:Array = param1.split(",");
         if(_loc2_.length == 0)
         {
            return null;
         }
         if(_loc2_.length == 10 && _loc2_[0] == "p")
         {
            if(int(_loc2_[5]) != §1t3317s0§.instance.§1t1848s0§())
            {
               return null;
            }
            _loc3_ = new §1t60s0§(-1,_loc2_[1]);
            _loc3_.§1t815s0§(_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[8]);
            return _loc3_;
         }
         if(_loc2_.length == 2)
         {
            return new §1t60s0§(_loc2_[0],_loc2_[1]);
         }
         return null;
      }
      
      internal function §1t812s0§() : *
      {
         var _loc1_:§1t69s0§ = null;
         var _loc2_:§1t85s0§ = null;
         var _loc3_:XMLList = null;
         this.§1t804s0§ = -1;
         if(this.§1t797s0§ != -1)
         {
            _loc1_ = §1t1524s0§.§1t9871s0§(this.§1t797s0§);
            if(_loc1_ != null)
            {
               this.§1t807s0§ = _loc1_.type;
               _loc2_ = _loc1_.§1t1453s0§(this.step);
               if(_loc2_ != null)
               {
                  this.§1t804s0§ = _loc2_.nodeID;
                  _loc3_ = _loc2_.§1t1111s0§();
                  if(_loc3_ != null)
                  {
                     this.§1t805s0§ = _loc3_.room;
                     this.§1t811s0§ = _loc3_.name.toString();
                  }
               }
            }
         }
      }
      
      public function §1t813s0§() : *
      {
         ++this.step;
         this.§1t812s0§();
         this.§1t828s0§();
      }
      
      public function §1t814s0§() : Boolean
      {
         return !this.§1t799s0§ && this.§1t807s0§ == §1t1711s0§.§1t11267s0§;
      }
      
      public function §1t815s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : *
      {
         this.§1t799s0§ = true;
         this.nodeid = param1;
         this.roomid = param2;
         this.§1t802s0§ = param3;
         this.date = param4;
         this.§1t807s0§ = param5;
         this.§1t808s0§ = param6;
         this.§1t809s0§ = param8;
         this.§1t810s0§ = param7;
         if(param5 == §1t1799s0§.§1t11447s0§)
         {
            this.step = 3;
         }
         else
         {
            this.step = 1;
         }
         var _loc9_:§1t69s0§ = §1t123s0§.instance.§1t1604s0§(param1,param2,param3,param4,param5,param6,param7,param8);
         var _loc10_:§1t85s0§ = _loc9_.§1t1453s0§(this.step);
         if(_loc10_ != null)
         {
            this.§1t804s0§ = _loc10_.nodeID;
            this.§1t805s0§ = _loc10_.§1t1402s0§();
            if(param5 == §1t1799s0§.§1t11446s0§)
            {
               this.§1t806s0§ = §1t123s0§.instance.§1t1586s0§(param1,param2,param3,param4).§1t2219s0§();
            }
            else if(param5 == §1t1799s0§.§1t11447s0§)
            {
               this.§1t806s0§ = §1t123s0§.instance.§1t1587s0§(param1,param2,param3,param4).§1t2219s0§();
            }
            else
            {
               this.§1t806s0§ = -1;
            }
         }
      }
      
      public function §1t816s0§(param1:int, param2:int, param3:int, param4:int = -1) : Boolean
      {
         if(!this.§1t799s0§)
         {
            return false;
         }
         if(this.§1t822s0§() && this.step > 1)
         {
            return false;
         }
         if(param4 == -1)
         {
            return this.§1t799s0§ && this.§1t804s0§ == param1 && this.§1t805s0§ == param2 && this.date == param3;
         }
         return this.§1t799s0§ && this.§1t804s0§ == param1 && this.§1t805s0§ == param2 && this.date == param3 && this.§1t807s0§ == param4;
      }
      
      public function §1t817s0§(param1:int, param2:int, param3:int, param4:int, param5:Boolean) : *
      {
         return this.§1t799s0§ && this.nodeid == param1 && this.roomid == param2 && this.§1t802s0§ == param3 && this.date == param4 && this.§1t818s0§() == param5;
      }
      
      public function §1t818s0§() : Boolean
      {
         return this.§1t807s0§ == §1t1799s0§.§1t11447s0§;
      }
      
      public function getMarkedNode() : int
      {
         return this.§1t804s0§;
      }
      
      public function §1t820s0§() : int
      {
         return this.§1t805s0§;
      }
      
      public function §1t821s0§(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(this.§1t799s0§)
         {
            if(this.date != param4)
            {
               return false;
            }
            if(this.§1t807s0§ == §1t1799s0§.§1t11446s0§ || this.§1t807s0§ == §1t1799s0§.§1t11447s0§)
            {
               if(this.step == 1)
               {
                  return this.§1t804s0§ == param1 && this.§1t805s0§ == param2 && this.§1t806s0§ == param3;
               }
               if(this.step == 2)
               {
                  return this.nodeid == param1 && this.roomid == param2 && this.§1t802s0§ == param3;
               }
            }
         }
         return false;
      }
      
      internal function §1t822s0§() : Boolean
      {
         return this.§1t807s0§ == §1t1799s0§.§1t11448s0§ || this.§1t807s0§ == §1t1799s0§.§1t11433s0§ || this.§1t807s0§ == §1t1799s0§.§1t11434s0§ || this.§1t807s0§ == §1t1799s0§.§1t11435s0§ || this.§1t807s0§ == §1t1799s0§.§1t11436s0§;
      }
      
      public function §1t823s0§() : Boolean
      {
         return (this.§1t822s0§() || this.§1t807s0§ == §1t1799s0§.§1t11441s0§ || this.§1t807s0§ == §1t1799s0§.§1t11440s0§ || this.§1t807s0§ == §1t1799s0§.§1t11442s0§ || this.§1t807s0§ == §1t1799s0§.§1t11443s0§ || this.§1t807s0§ == §1t1799s0§.§1t11445s0§) && this.step == 1;
      }
      
      public function §1t824s0§() : *
      {
         var _loc1_:§1t69s0§ = null;
         var _loc2_:§1t85s0§ = null;
         if(this.§1t822s0§() || this.§1t807s0§ == §1t1799s0§.§1t11446s0§ || this.§1t807s0§ == §1t1799s0§.§1t11439s0§ || this.§1t807s0§ == §1t1799s0§.§1t11440s0§ || this.§1t807s0§ == §1t1799s0§.§1t11442s0§ || this.§1t807s0§ == §1t1799s0§.§1t11443s0§)
         {
            if(this.step == 1)
            {
               this.step = 2;
               this.§1t804s0§ = this.nodeid;
               this.§1t805s0§ = this.roomid;
               this.§1t806s0§ = this.§1t802s0§;
            }
         }
         else if(this.§1t807s0§ == §1t1799s0§.§1t11447s0§)
         {
            if(this.step == 3)
            {
               ++this.step;
               this.§1t804s0§ = this.nodeid;
               this.§1t805s0§ = this.roomid;
               this.§1t806s0§ = this.§1t802s0§;
            }
         }
         else
         {
            ++this.step;
            _loc1_ = §1t123s0§.instance.§1t1604s0§(this.nodeid,this.roomid,this.§1t802s0§,this.date,this.§1t807s0§,this.§1t808s0§,this.§1t810s0§,this.§1t809s0§);
            _loc2_ = _loc1_.§1t1453s0§(this.step);
            if(_loc2_ != null)
            {
               this.§1t804s0§ = _loc2_.nodeID;
               this.§1t805s0§ = _loc2_.§1t1402s0§();
               this.§1t806s0§ = -1;
            }
         }
         this.§1t828s0§();
      }
      
      public function §1t825s0§(param1:int, param2:int, param3:int) : *
      {
         return this.§1t804s0§ == param1 && this.§1t805s0§ == param2 && this.§1t806s0§ == param3;
      }
      
      public function §1t826s0§() : Boolean
      {
         if(this.§1t807s0§ == §1t1799s0§.§1t11446s0§ || this.§1t822s0§() || this.§1t807s0§ == §1t1799s0§.§1t11439s0§ || this.§1t807s0§ == §1t1799s0§.§1t11441s0§ || this.§1t807s0§ == §1t1799s0§.§1t11440s0§ || this.§1t807s0§ == §1t1799s0§.§1t11442s0§ || this.§1t807s0§ == §1t1799s0§.§1t11443s0§)
         {
            if(this.step == 2)
            {
               return true;
            }
         }
         else if(this.§1t807s0§ == §1t1799s0§.§1t11438s0§ || this.§1t807s0§ == §1t1799s0§.§1t11449s0§)
         {
            return true;
         }
         return false;
      }
      
      public function §1t827s0§(param1:Boolean) : Boolean
      {
         var _loc2_:§1t17s0§ = null;
         if(this.§1t807s0§ == §1t1799s0§.§1t11446s0§ || this.§1t807s0§ == §1t1799s0§.§1t11447s0§ || this.§1t807s0§ == §1t1799s0§.§1t11448s0§)
         {
            _loc2_ = §1t123s0§.instance.§1t1586s0§(this.nodeid,this.roomid,this.§1t802s0§,this.date,param1).§1t2217s0§();
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
         if(this.§1t807s0§ == §1t1799s0§.§1t11439s0§)
         {
            _loc2_ = §1t123s0§.instance.§1t1584s0§(this.nodeid,this.§1t809s0§,this.date).§1t2217s0§();
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
         if(this.§1t822s0§() || this.§1t807s0§ == §1t1799s0§.§1t11441s0§ || this.§1t807s0§ == §1t1799s0§.§1t11440s0§ || this.§1t807s0§ == §1t1799s0§.§1t11442s0§ || this.§1t807s0§ == §1t1799s0§.§1t11443s0§)
         {
            if(this.step == 2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §1t828s0§() : *
      {
         var _loc1_:§1t69s0§ = null;
         var _loc2_:§1t85s0§ = null;
         if(this.§1t799s0§)
         {
            _loc1_ = §1t123s0§.instance.§1t1604s0§(this.nodeid,this.roomid,this.§1t802s0§,this.date,this.§1t807s0§,this.§1t808s0§,this.§1t810s0§,this.§1t809s0§);
            _loc2_ = _loc1_.§1t1453s0§(this.step);
            if(_loc2_ != null)
            {
               §1t406s0§.instance.§1t6643s0§(_loc2_.title,_loc1_.type);
            }
            else
            {
               §1t406s0§.instance.§1t6643s0§("");
            }
         }
         else
         {
            _loc1_ = §1t1524s0§.§1t9871s0§(this.§1t797s0§);
            if(_loc1_ != null)
            {
               _loc2_ = §1t1524s0§.§1t9872s0§(this.§1t797s0§,this.step);
               if(_loc2_ != null)
               {
                  §1t406s0§.instance.§1t6643s0§(_loc2_.title,_loc1_.type);
               }
               else
               {
                  §1t406s0§.instance.§1t6643s0§("");
               }
            }
            else
            {
               §1t406s0§.instance.§1t6643s0§("");
            }
         }
      }
      
      public function §1t829s0§() : §1t57s0§
      {
         var _loc1_:§1t69s0§ = null;
         var _loc2_:§1t85s0§ = null;
         if(this.§1t799s0§)
         {
            return new §1t57s0§(this.getMarkedNode(),150);
         }
         _loc1_ = §1t1524s0§.§1t9871s0§(this.§1t797s0§);
         if(_loc1_ != null)
         {
            _loc2_ = §1t1524s0§.§1t9872s0§(this.§1t797s0§,this.step);
            return new §1t57s0§(_loc2_.teleportNodeID,_loc2_.teleportPosX);
         }
         return new §1t57s0§(this.getMarkedNode(),150);
      }
      
      public function toString() : String
      {
         var _loc1_:String = null;
         if(this.§1t799s0§)
         {
            if(this.date != §1t3317s0§.instance.§1t1848s0§())
            {
               return "";
            }
            return "p," + this.step + "," + this.nodeid + "," + this.roomid + "," + this.§1t802s0§ + "," + this.date + "," + this.§1t807s0§ + "," + this.§1t808s0§ + "," + this.§1t809s0§ + "," + this.§1t810s0§;
         }
         return this.§1t797s0§ + "," + this.step;
      }
   }
}

