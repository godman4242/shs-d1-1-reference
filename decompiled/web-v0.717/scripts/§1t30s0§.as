package
{
   public class §1t30s0§
   {
      
      public static const §1t8808s0§:int = 0;
      
      public static const §1t8809s0§:int = 1;
      
      public static const §1t8810s0§:int = 0;
      
      public static const §1t8811s0§:int = 1;
      
      public static const §1t8812s0§:int = 2;
      
      public static const §1t8813s0§:int = 3;
      
      internal var §1t869s0§:§1t27s0§;
      
      internal var startTime:int;
      
      internal var §1t871s0§:int;
      
      internal var §1t872s0§:int;
      
      internal var §1t873s0§:int;
      
      internal var §1t553s0§:Vector.<§1t29s0§>;
      
      public function §1t30s0§(param1:§1t27s0§, param2:Vector.<§1t29s0§>, param3:int, param4:int, param5:int)
      {
         super();
         this.§1t869s0§ = param1;
         this.§1t553s0§ = param2;
         this.startTime = param3;
         this.§1t872s0§ = param4;
         this.§1t873s0§ = param5;
         this.§1t871s0§ = param3 + param1.§1t896s0§;
      }
      
      public static function §1t8814s0§(param1:String, param2:§1t24s0§) : §1t30s0§
      {
         var _loc9_:int = 0;
         var _loc10_:§1t29s0§ = null;
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = int(_loc3_[0]);
         var _loc5_:int = int(_loc3_[1]);
         var _loc6_:int = int(_loc3_[2]);
         var _loc7_:int = int(_loc3_[3]);
         var _loc8_:Vector.<§1t29s0§> = new Vector.<§1t29s0§>();
         var _loc11_:int = 4;
         while(_loc11_ <= 7)
         {
            if(_loc3_[_loc11_] != "")
            {
               _loc9_ = int(_loc3_[_loc11_]);
               if(_loc9_ != 0)
               {
                  _loc10_ = param2.§1t607s0§(_loc9_);
                  if(_loc10_ != null)
                  {
                     _loc8_.push(_loc10_);
                  }
               }
            }
            _loc11_++;
         }
         var _loc12_:§1t27s0§ = §1t24s0§.§1t8800s0§(_loc4_);
         return new §1t30s0§(_loc12_,_loc8_,_loc5_,_loc6_,_loc7_);
      }
      
      public function §1t874s0§(param1:§1t24s0§) : *
      {
         var _loc2_:int = 0;
         while(_loc2_ < §1t24s0§.§1t8761s0§)
         {
            if(_loc2_ != §1t24s0§.§1t8747s0§ && _loc2_ != §1t24s0§.§1t8753s0§)
            {
               param1.§1t580s0§(_loc2_,-this.§1t869s0§.§1t908s0§(_loc2_));
            }
            _loc2_++;
         }
      }
      
      public function §1t875s0§(param1:int) : int
      {
         return this.§1t871s0§ - param1;
      }
      
      public function §1t876s0§(param1:*) : Number
      {
         var _loc2_:Number = (this.§1t869s0§.§1t896s0§ - this.§1t875s0§(param1)) / this.§1t869s0§.§1t896s0§;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         return _loc2_;
      }
      
      internal function §1t877s0§(param1:*) : int
      {
         if(this.§1t872s0§ == §1t8808s0§)
         {
            if(this.§1t871s0§ <= param1)
            {
               return §1t8812s0§;
            }
            return §1t8810s0§;
         }
         if(this.§1t872s0§ == §1t8809s0§)
         {
            if(this.§1t871s0§ <= param1)
            {
               return §1t8813s0§;
            }
            return §1t8811s0§;
         }
         return 0;
      }
      
      public function §1t878s0§(param1:*) : String
      {
         var _loc2_:int = this.§1t877s0§(param1);
         if(_loc2_ == §1t8810s0§)
         {
            return §1t1521s0§.getString(22054);
         }
         if(_loc2_ == §1t8811s0§)
         {
            return §1t1521s0§.getString(22055);
         }
         if(_loc2_ == §1t8812s0§)
         {
            return §1t1521s0§.getString(22056);
         }
         if(_loc2_ == §1t8813s0§)
         {
            return §1t1521s0§.getString(22057);
         }
         return "";
      }
      
      public function §1t879s0§(param1:int) : *
      {
         var _loc6_:int = 0;
         var _loc2_:Array = this.§1t884s0§(param1);
         var _loc3_:int = int(this.§1t553s0§.length);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            this.§1t553s0§[_loc5_].§1t7357s0§(§1t1523s0§.§1t9402s0§,_loc2_[_loc5_]);
            _loc4_ += _loc2_[_loc5_];
            _loc5_++;
         }
         this.§1t872s0§ = §1t8809s0§;
         if(_loc4_ == 0)
         {
            this.§1t871s0§ = 0;
         }
         else
         {
            _loc6_ = this.§1t871s0§ - param1;
            this.§1t871s0§ = param1 + _loc6_ / 2;
         }
      }
      
      public function §1t880s0§(param1:§1t24s0§, param2:int, param3:Boolean) : *
      {
         var _loc5_:§1t29s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc4_:int = int(this.§1t553s0§.length);
         if(this.§1t872s0§ == §1t8808s0§)
         {
            _loc7_ = this.§1t884s0§(param2);
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ = this.§1t553s0§[_loc6_];
               _loc5_.§1t927s0§ = true;
               _loc5_.§1t7357s0§(§1t1523s0§.§1t9402s0§,_loc7_[_loc6_]);
               if(param3)
               {
                  _loc5_.§1t7347s0§(10);
               }
               else
               {
                  _loc5_.§1t7347s0§(-10);
               }
               _loc6_++;
            }
         }
         else
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ = this.§1t553s0§[_loc6_];
               _loc5_.§1t927s0§ = true;
               _loc5_.§1t7347s0§(-10);
               _loc6_++;
            }
         }
         param1.§1t604s0§(this.§1t553s0§);
         this.§1t553s0§.length = 0;
      }
      
      public function §1t881s0§() : Boolean
      {
         var _loc1_:§1t58s0§ = §1t58s0§.§1t8804s0§(this.startTime);
         var _loc2_:Boolean = this.§1t869s0§.§1t887s0§(this.§1t883s0§(this.§1t871s0§)) > _loc1_.rand(100);
         _loc1_.destroy();
         return _loc2_;
      }
      
      public function §1t882s0§(param1:§1t24s0§) : *
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < §1t24s0§.§1t8761s0§)
         {
            if(_loc2_ != §1t24s0§.§1t8747s0§ && _loc2_ != §1t24s0§.§1t8753s0§)
            {
               param1.§1t580s0§(_loc2_,this.§1t869s0§.reward.§1t992s0§(_loc2_));
            }
            _loc2_++;
         }
         var _loc3_:int = this.§1t869s0§.reward.§1t992s0§(§1t24s0§.§1t8747s0§);
         if(this.§1t869s0§.rank == 1)
         {
            _loc4_ = 2;
         }
         else if(this.§1t869s0§.rank == 2)
         {
            _loc4_ = 4;
         }
         else if(this.§1t869s0§.rank == 3)
         {
            _loc4_ = 6;
         }
         else if(this.§1t869s0§.rank == 4)
         {
            _loc4_ = 8;
         }
         else if(this.§1t869s0§.rank == 5)
         {
            _loc4_ = 10;
         }
         var _loc5_:int = 1;
         var _loc6_:Boolean = this.§1t869s0§.rank >= 4;
         var _loc7_:Boolean = this.§1t869s0§.rank >= 8;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            param1.§1t623s0§(_loc4_,_loc5_,_loc6_,_loc7_,_loc2_);
            _loc2_++;
         }
         §1t412s0§.instance.§1t7624s0§();
      }
      
      public function §1t883s0§(param1:int) : Array
      {
         var _loc4_:int = 0;
         var _loc6_:§1t29s0§ = null;
         var _loc7_:int = 0;
         var _loc2_:Array = this.§1t884s0§(param1);
         var _loc3_:Array = new Array(§1t24s0§.§1t8761s0§);
         _loc4_ = 0;
         while(_loc4_ < §1t24s0§.§1t8761s0§)
         {
            _loc3_[_loc4_] = 0;
            _loc4_++;
         }
         var _loc5_:int = int(this.§1t553s0§.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.§1t553s0§[_loc4_];
            if(_loc2_[_loc4_] > 0)
            {
               _loc7_ = 0;
               while(_loc7_ < §1t24s0§.§1t8761s0§)
               {
                  _loc3_[_loc7_] += _loc6_.§1t7323s0§(_loc7_);
                  _loc7_++;
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function §1t884s0§(param1:int) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:int = int(this.§1t553s0§.length);
         var _loc3_:Array = new Array(_loc2_);
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = this.§1t553s0§[_loc4_].§1t3309s0§();
            _loc4_++;
         }
         if(this.§1t872s0§ == §1t8809s0§)
         {
            return _loc3_;
         }
         var _loc5_:§1t58s0§ = §1t58s0§.§1t8804s0§(this.startTime);
         if(param1 > this.§1t871s0§)
         {
            param1 = this.§1t871s0§;
         }
         var _loc6_:int = param1 - this.startTime;
         var _loc7_:int = this.§1t869s0§.§1t911s0§(this.§1t873s0§);
         var _loc8_:int = this.§1t869s0§.§1t898s0§;
         var _loc9_:int = this.§1t869s0§.§1t899s0§;
         var _loc10_:int = this.§1t869s0§.§1t896s0§ / _loc8_;
         var _loc11_:int = Math.floor(_loc6_ / _loc10_);
         var _loc12_:int = 0;
         while(_loc12_ < _loc11_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               if(_loc5_.rand(100) < _loc9_)
               {
                  _loc3_[_loc4_] -= _loc7_;
                  if(_loc3_[_loc4_] < 0)
                  {
                     _loc3_[_loc4_] = 0;
                  }
               }
               _loc4_++;
            }
            _loc12_++;
         }
         _loc5_.destroy();
         return _loc3_;
      }
      
      public function §1t885s0§(param1:int) : int
      {
         return this.§1t869s0§.§1t885s0§(param1);
      }
      
      public function hasEnded(param1:*) : Boolean
      {
         return this.§1t871s0§ <= param1;
      }
      
      public function §1t887s0§(param1:Array) : Number
      {
         if(this.§1t872s0§ == §1t8809s0§)
         {
            return 0;
         }
         return this.§1t869s0§.§1t887s0§(param1);
      }
      
      public function §1t888s0§() : Boolean
      {
         return this.§1t872s0§ == §1t8809s0§;
      }
      
      public function §1t889s0§() : int
      {
         return this.§1t869s0§.§1t912s0§(this.§1t873s0§);
      }
      
      public function §1t890s0§() : String
      {
         var _loc1_:String = null;
         _loc1_ = this.§1t869s0§.id + "," + this.startTime + "," + this.§1t872s0§ + "," + this.§1t873s0§ + ",";
         var _loc2_:int = int(this.§1t553s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            if(_loc3_ < _loc2_)
            {
               _loc1_ += this.§1t553s0§[_loc3_].npcid;
            }
            if(_loc3_ != 3)
            {
               _loc1_ += ",";
            }
            _loc3_++;
         }
         return _loc1_;
      }
   }
}

