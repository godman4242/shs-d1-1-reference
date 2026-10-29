package
{
   public class §1t418s0§
   {
      
      public static var §1t8816s0§:int = 0;
      
      public static var §1t8817s0§:int = 1;
      
      public static var §1t8818s0§:int = 2;
      
      public static var §1t8819s0§:int = 3;
      
      internal var mapid:int;
      
      internal var states:§1t998s0§;
      
      internal var mapactive:Boolean = false;
      
      internal var flagside:int = 0;
      
      internal var showflag:Boolean = false;
      
      public var territoryY:int;
      
      public function §1t418s0§(param1:int)
      {
         super();
         this.states = new §1t998s0§();
         this.mapid = param1;
         this.territoryY = (param1 & 0x0FFF) - 341 + §1t7934s0§.§1t12537s0§;
      }
      
      public function §1t1023s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         var _loc6_:Array = null;
         if(!this.states.contains(param1))
         {
            _loc6_ = new Array();
            _loc6_.push(new §1t2258s0§(param2,param3,param4));
            this.states.put(param1,_loc6_);
         }
         else
         {
            this.§1t1024s0§(param1,param2,param3,param4);
         }
         var _loc5_:int = §1t1523s0§.§1t7746s0§();
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9424s0§) == 0)
         {
            if(param1 == _loc5_ && param2 != §1t8816s0§ && param2 != §1t8819s0§ && param2 != §1t8818s0§)
            {
               this.showflag = true;
               this.flagside = param1;
            }
            if(param2 == §1t8817s0§ || param2 == §1t8819s0§)
            {
               this.mapactive = true;
            }
         }
         else
         {
            if(param1 == _loc5_ && param2 != §1t8816s0§)
            {
               this.showflag = true;
            }
            if(param2 == §1t8817s0§ || param2 == §1t8819s0§)
            {
               this.mapactive = true;
               this.showflag = true;
            }
            if(this.flagside != _loc5_)
            {
               this.flagside = param1;
            }
         }
      }
      
      public function §1t1024s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         var _loc6_:int = 0;
         var _loc7_:§1t2258s0§ = null;
         var _loc8_:int = 0;
         var _loc5_:Array = this.states.get(param1);
         if(_loc5_ == null)
         {
            this.§1t1023s0§(param1,param2,param3,param4);
         }
         else
         {
            _loc6_ = int(_loc5_.length);
            _loc7_ = null;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc7_ = _loc5_[_loc8_];
               if(_loc7_.xpos == param3 && _loc7_.§1t2259s0§ == param4)
               {
                  _loc7_.state = param2;
                  return;
               }
               _loc8_++;
            }
            _loc5_.push(new §1t2258s0§(param2,param3,param4));
         }
      }
      
      public function §1t1025s0§() : int
      {
         return this.mapid;
      }
      
      public function §1t1026s0§() : Boolean
      {
         return this.showflag;
      }
      
      public function §1t1027s0§() : Boolean
      {
         return this.mapactive;
      }
      
      public function §1t1028s0§(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:Array = this.states.get(param1);
         if(_loc4_ == null)
         {
            return 0;
         }
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc4_[_loc6_].xpos == param2 && _loc4_[_loc6_].§1t2259s0§ == param3)
            {
               return _loc4_[_loc6_].state;
            }
            _loc6_++;
         }
         return 0;
      }
      
      public function §1t1029s0§(param1:int, param2:int) : §1t57s0§
      {
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc3_:Array = this.states.§1t1006s0§();
         var _loc4_:Array = this.states.§1t1007s0§();
         var _loc5_:int = int(_loc3_.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc5_)
         {
            _loc6_ = _loc4_[_loc8_];
            _loc7_ = int(_loc6_.length);
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               if(_loc6_[_loc9_].xpos == param1 && _loc6_[_loc9_].§1t2259s0§ == param2)
               {
                  return new §1t57s0§(_loc3_[_loc8_],_loc6_[_loc9_].state);
               }
               _loc9_++;
            }
            _loc8_++;
         }
         return new §1t57s0§(0,0);
      }
      
      public function §1t1030s0§(param1:int) : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Array = this.states.get(param1);
         if(_loc4_ == null)
         {
            return 0;
         }
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc4_[_loc6_].state == 1)
            {
               return 1;
            }
            if(_loc4_[_loc6_].state == 3)
            {
               _loc2_ = true;
            }
            else if(_loc4_[_loc6_].state == 2)
            {
               _loc3_ = true;
            }
            _loc6_++;
         }
         if(_loc2_ && _loc3_)
         {
            return 1;
         }
         if(_loc3_)
         {
            return 2;
         }
         if(_loc2_)
         {
            return 3;
         }
         return 0;
      }
      
      public function §1t1031s0§() : int
      {
         return this.flagside;
      }
      
      public function §1t1032s0§() : Array
      {
         var _loc4_:int = 0;
         var _loc1_:Array = this.states.§1t1006s0§();
         var _loc2_:Array = new Array();
         var _loc3_:int = int(_loc1_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = int(_loc1_[_loc5_]);
            if(§1t1523s0§.§1t9663s0§(_loc4_) && !§1t3318s0§.instance.§1t3434s0§(_loc4_))
            {
               _loc2_.push(_loc4_.toString());
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function toString() : String
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:Array = this.states.§1t1006s0§();
         var _loc2_:Array = this.states.§1t1007s0§();
         var _loc3_:int = int(_loc1_.length);
         var _loc6_:String = "";
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_)
         {
            _loc4_ = _loc2_[_loc7_];
            _loc5_ = int(_loc4_.length);
            _loc8_ = 0;
            while(_loc8_ < _loc5_)
            {
               _loc6_ += this.mapid + "," + _loc1_[_loc7_] + "," + _loc4_[_loc8_].state + "," + _loc4_[_loc8_].xpos + "," + _loc4_[_loc8_].§1t2259s0§ + "|";
               _loc8_++;
            }
            _loc7_++;
         }
         return _loc6_;
      }
   }
}

