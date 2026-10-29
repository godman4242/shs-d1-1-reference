package
{
   public class §1t28s0§
   {
      
      internal var roomType:int = 0;
      
      internal var §1t914s0§:int = 1;
      
      internal var §1t915s0§:int = 0;
      
      internal var §1t916s0§:§1t24s0§;
      
      internal var §1t917s0§:Vector.<§1t29s0§>;
      
      internal var §1t918s0§:Array;
      
      internal var §1t919s0§:int = 1;
      
      internal var §1t920s0§:int = 1;
      
      internal var §1t921s0§:int;
      
      internal var §1t922s0§:int;
      
      internal var §1t923s0§:int = -1;
      
      internal var §1t924s0§:int = -1;
      
      internal var §1t925s0§:Boolean = false;
      
      internal var §1t926s0§:§1t26s0§;
      
      public var §1t927s0§:Boolean = false;
      
      public function §1t28s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:§1t24s0§)
      {
         super();
         this.roomType = param1;
         this.§1t914s0§ = param2;
         this.§1t915s0§ = param3;
         this.§1t920s0§ = param4;
         this.§1t921s0§ = param5;
         this.§1t922s0§ = param6;
         this.§1t923s0§ = param7;
         this.§1t924s0§ = param8;
         this.§1t916s0§ = param9;
         this.§1t926s0§ = §1t24s0§.§1t8797s0§(param1);
         if(!param9.§1t576s0§)
         {
            this.§1t919s0§ = this.§1t926s0§.§1t919s0§;
         }
         else if(param1 == §1t24s0§.§1t8769s0§)
         {
            this.§1t919s0§ = 2;
         }
         else
         {
            this.§1t919s0§ = 1;
         }
         this.§1t917s0§ = new Vector.<§1t29s0§>();
         this.§1t918s0§ = new Array();
      }
      
      public static function §1t8815s0§(param1:String, param2:§1t24s0§) : §1t28s0§
      {
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = int(_loc3_[0]);
         var _loc5_:int = int(_loc3_[1]);
         var _loc6_:int = int(_loc3_[2]);
         var _loc7_:int = int(_loc3_[3]);
         var _loc8_:int = int(_loc3_[4]);
         var _loc9_:int = int(_loc3_[5]);
         var _loc10_:int = int(_loc3_[6]);
         var _loc11_:int = int(_loc3_[7]);
         if(_loc9_ <= 0)
         {
            _loc9_ = 1;
         }
         return param2.createRoom(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_);
      }
      
      public function §1t928s0§() : int
      {
         return this.roomType;
      }
      
      public function §1t929s0§() : int
      {
         return this.§1t914s0§;
      }
      
      public function §1t930s0§() : Boolean
      {
         return this.§1t926s0§.§1t960s0§ != -1;
      }
      
      public function §1t931s0§() : int
      {
         return this.§1t915s0§;
      }
      
      public function §1t932s0§() : int
      {
         if(this.§1t926s0§.§1t961s0§ == -1)
         {
            return 0;
         }
         if(this.§1t915s0§ == 0)
         {
            return 3;
         }
         if(this.§1t915s0§ == 1)
         {
            return 4;
         }
         if(this.§1t915s0§ == 2)
         {
            return 5;
         }
         return 0;
      }
      
      public function §1t933s0§() : int
      {
         return this.§1t920s0§;
      }
      
      public function §1t934s0§(param1:int) : *
      {
         this.§1t920s0§ += param1;
         if(this.§1t920s0§ > this.§1t926s0§.§1t962s0§)
         {
            this.§1t920s0§ = this.§1t926s0§.§1t962s0§;
         }
      }
      
      public function §1t935s0§() : int
      {
         return this.§1t926s0§.§1t919s0§ * this.§1t920s0§;
      }
      
      public function update(param1:int) : *
      {
         if(!this.§1t925s0§ && this.§1t924s0§ != -1 && param1 >= this.§1t924s0§)
         {
            this.§1t925s0§ = true;
            §1t412s0§.instance.§1t7625s0§(this.§1t921s0§,this.§1t922s0§);
         }
      }
      
      public function §1t936s0§(param1:int) : String
      {
         var _loc2_:int = 0;
         if((this.§1t930s0§() || this.roomType == §1t24s0§.§1t8767s0§) && this.§1t924s0§ != -1)
         {
            _loc2_ = this.§1t924s0§ - param1;
            if(_loc2_ <= 0)
            {
               return §1t1521s0§.getString(22031);
            }
            return §1t1521s0§.getString(22030,[this.§1t937s0§(_loc2_)]);
         }
         return "";
      }
      
      internal function §1t937s0§(param1:int) : String
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:int = param1 % 60;
         var _loc3_:int = (param1 - _loc2_) / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = (_loc3_ - _loc4_) / 60;
         if(_loc2_ < 10)
         {
            _loc6_ = "0" + _loc2_.toString();
         }
         else
         {
            _loc6_ = _loc2_.toString();
         }
         if(_loc4_ < 10 && _loc5_ > 0)
         {
            _loc7_ = "0" + _loc4_.toString();
         }
         else
         {
            _loc7_ = _loc4_.toString();
         }
         if(_loc5_ == 0)
         {
            return _loc7_ + ":" + _loc6_;
         }
         return _loc5_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function §1t621s0§(param1:int) : *
      {
         if(this.§1t930s0§())
         {
            this.§1t951s0§(param1);
            this.§1t925s0§ = false;
            this.§1t916s0§.§1t621s0§(this.§1t926s0§.getLevel(this.§1t915s0§),this.§1t938s0§());
         }
      }
      
      internal function §1t938s0§() : Number
      {
         if(this.§1t920s0§ == 2)
         {
            return 2.1;
         }
         if(this.§1t920s0§ == 3)
         {
            return 3.3;
         }
         return 1;
      }
      
      public function §1t939s0§(param1:int) : int
      {
         return this.§1t926s0§.getLevel(this.§1t915s0§).§1t939s0§(param1) * this.§1t938s0§();
      }
      
      public function §1t940s0§() : int
      {
         var _loc1_:§1t33s0§ = this.§1t926s0§.getLevel(this.§1t915s0§);
         if(this.§1t926s0§.§1t970s0§ == -1)
         {
            return 0;
         }
         return _loc1_.§1t939s0§(this.§1t926s0§.§1t970s0§) * this.§1t938s0§();
      }
      
      public function §1t941s0§() : int
      {
         var _loc1_:int = 0;
         if(this.§1t915s0§ == this.§1t926s0§.§1t971s0§())
         {
            return 0;
         }
         var _loc2_:§1t33s0§ = this.§1t926s0§.getLevel(this.§1t915s0§ + 1);
         if(this.§1t926s0§.§1t970s0§ == -1)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = _loc2_.§1t939s0§(this.§1t926s0§.§1t970s0§) * this.§1t938s0§();
         }
         return _loc1_ - this.§1t940s0§();
      }
      
      public function §1t942s0§() : int
      {
         var _loc1_:§1t33s0§ = this.§1t926s0§.getLevel(this.§1t915s0§);
         if(this.§1t926s0§.§1t969s0§ == -1)
         {
            return 0;
         }
         return _loc1_.§1t986s0§(this.§1t926s0§.§1t969s0§) * this.§1t938s0§();
      }
      
      public function §1t943s0§() : int
      {
         var _loc1_:int = 0;
         if(this.§1t915s0§ == this.§1t926s0§.§1t971s0§())
         {
            return 0;
         }
         var _loc2_:§1t33s0§ = this.§1t926s0§.getLevel(this.§1t915s0§ + 1);
         if(this.§1t926s0§.§1t969s0§ == -1)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = _loc2_.§1t986s0§(this.§1t926s0§.§1t969s0§) * this.§1t938s0§();
         }
         return _loc1_ - this.§1t942s0§();
      }
      
      public function §1t944s0§() : int
      {
         return this.§1t919s0§ * this.§1t920s0§;
      }
      
      internal function §1t945s0§() : int
      {
         return this.§1t944s0§() * 2;
      }
      
      public function §1t946s0§() : int
      {
         return this.§1t917s0§.length;
      }
      
      public function §1t947s0§(param1:§1t29s0§, param2:Boolean, param3:Boolean, param4:Boolean = true) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.§1t917s0§.length == this.§1t945s0§())
         {
            return false;
         }
         this.§1t917s0§.push(param1);
         _loc5_ = this.§1t945s0§();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            if(this.§1t918s0§[_loc6_] == null)
            {
               this.§1t918s0§[_loc6_] = param1;
               param1.§1t7335s0§(this,param2,param3);
               param1.§1t7340s0§(§1t412s0§.instance.§1t7587s0§(this.§1t921s0§) + 10,§1t412s0§.instance.§1t7587s0§(this.§1t921s0§) + this.§1t944s0§() * §1t24s0§.§1t8776s0§ - 10);
               if(!this.§1t916s0§.§1t576s0§)
               {
                  §1t412s0§.instance.§1t7594s0§(param1,this,_loc6_);
                  if(this.§1t930s0§() && param4)
                  {
                     this.§1t951s0§(§1t24s0§.§1t1847s0§());
                  }
                  else if(this.§1t952s0§() != -1 && !param4)
                  {
                     param1.§1t7336s0§(§1t24s0§.§1t1847s0§());
                  }
                  else if(this.roomType == §1t24s0§.§1t8770s0§)
                  {
                     param1.§1t7337s0§(§1t24s0§.§1t1847s0§());
                  }
               }
               return true;
            }
            _loc6_++;
         }
         return false;
      }
      
      public function §1t948s0§(param1:§1t29s0§) : *
      {
         var _loc2_:int = this.§1t917s0§.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.§1t917s0§.splice(_loc2_,1);
         }
         var _loc3_:int = this.§1t945s0§();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.§1t918s0§[_loc4_] == param1)
            {
               this.§1t918s0§[_loc4_] = null;
            }
            _loc4_++;
         }
         if(this.§1t930s0§())
         {
            this.§1t951s0§(§1t24s0§.§1t1847s0§());
         }
      }
      
      public function §1t949s0§(param1:Array) : Vector.<§1t29s0§>
      {
         var _loc4_:§1t29s0§ = null;
         var _loc5_:§1t29s0§ = null;
         var _loc2_:Vector.<§1t29s0§> = new Vector.<§1t29s0§>();
         var _loc3_:int = int(this.§1t917s0§.length);
         var _loc6_:Boolean = false;
         var _loc7_:* = int(_loc3_ - 1);
         while(_loc7_ >= 0)
         {
            _loc4_ = this.§1t917s0§[_loc7_];
            if(!_loc4_.§1t3312s0§() && Boolean(param1[_loc7_]))
            {
               _loc4_.§1t7241s0§ = null;
               _loc4_.§1t7306s0§ = true;
               _loc4_.§1t927s0§ = true;
               §1t412s0§.instance.§1t948s0§(_loc4_);
               _loc2_.push(_loc4_);
               this.§1t917s0§.splice(_loc7_,1);
            }
            else
            {
               _loc6_ = true;
            }
            _loc7_--;
         }
         this.§1t918s0§.length = 0;
         _loc3_ = int(this.§1t917s0§.length);
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            this.§1t918s0§[_loc7_] = this.§1t917s0§[_loc7_];
            _loc7_++;
         }
         §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
         return _loc2_;
      }
      
      public function §1t617s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§1t915s0§ < this.§1t926s0§.§1t971s0§())
         {
            ++this.§1t915s0§;
            if(this.§1t952s0§() != -1)
            {
               _loc1_ = int(this.§1t917s0§.length);
               _loc2_ = 0;
               while(_loc2_ < _loc1_)
               {
                  this.§1t917s0§[_loc2_].§1t7339s0§();
                  _loc2_++;
               }
            }
         }
      }
      
      public function §1t950s0§() : *
      {
         var _loc4_:§1t29s0§ = null;
         var _loc1_:int = §1t412s0§.instance.§1t7587s0§(this.§1t921s0§) + 10;
         var _loc2_:int = _loc1_ + this.§1t944s0§() * §1t24s0§.§1t8776s0§ - 20;
         var _loc3_:int = int(this.§1t917s0§.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this.§1t917s0§[_loc5_];
            _loc4_.§1t7340s0§(_loc1_,_loc2_);
            _loc5_++;
         }
      }
      
      public function §1t615s0§() : *
      {
         if(this.§1t917s0§.length > 0)
         {
         }
         this.§1t926s0§ = null;
      }
      
      public function §1t951s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(this.§1t917s0§.length == 0)
         {
            this.§1t923s0§ = -1;
            this.§1t924s0§ = -1;
         }
         else
         {
            _loc2_ = this.§1t926s0§.§1t960s0§;
            _loc3_ = 0;
            _loc4_ = int(this.§1t917s0§.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ += this.§1t917s0§[_loc5_].§1t7323s0§(_loc2_);
               _loc5_++;
            }
            _loc6_ = this.§1t919s0§ * this.§1t926s0§.§1t962s0§ * 2 * §1t29s0§.§1t12495s0§;
            _loc7_ = this.§1t926s0§.getLevel(this.§1t915s0§).§1t987s0§();
            _loc8_ = (_loc6_ - _loc3_) / _loc6_;
            _loc9_ = _loc7_ + _loc8_ * _loc7_;
            if(param1 >= this.§1t924s0§)
            {
               this.§1t923s0§ = param1;
               this.§1t924s0§ = param1 + _loc9_;
            }
            else
            {
               _loc10_ = param1 - this.§1t923s0§;
               this.§1t924s0§ = this.§1t923s0§ + _loc9_ - _loc10_;
            }
         }
         this.§1t927s0§ = true;
         §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9963s0§);
      }
      
      public function §1t952s0§() : int
      {
         return this.§1t926s0§.§1t961s0§;
      }
      
      public function §1t953s0§(param1:int) : *
      {
         this.§1t914s0§ = param1;
         §1t412s0§.instance.§1t7630s0§(this);
      }
      
      public function §1t954s0§() : Boolean
      {
         if(this.§1t916s0§.§1t576s0§)
         {
            return false;
         }
         return this.§1t926s0§.§1t961s0§ == -1 && this.roomType != §1t24s0§.§1t8770s0§;
      }
      
      public function §1t955s0§() : Vector.<§1t29s0§>
      {
         var _loc1_:Vector.<§1t29s0§> = new Vector.<§1t29s0§>();
         var _loc2_:int = int(this.§1t917s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(!this.§1t917s0§[_loc3_].§1t3312s0§())
            {
               _loc1_.push(this.§1t917s0§[_loc3_]);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function §1t956s0§() : String
      {
         var _loc1_:String = null;
         return this.§1t921s0§ + "," + this.§1t922s0§ + "," + this.roomType + "," + this.§1t914s0§ + "," + this.§1t915s0§ + "," + this.§1t920s0§ + "," + this.§1t923s0§ + "," + this.§1t924s0§;
      }
   }
}

