package
{
   public class §1t17s0§
   {
      
      public static var §1t8733s0§:uint = 1;
      
      public static var §1t8734s0§:int = 80;
      
      public static var §1t8735s0§:int = 81;
      
      public static var §1t8736s0§:int = 82;
      
      public static var §1t8737s0§:int = 89;
      
      public static var §1t8738s0§:int = 125;
      
      public static var §1t8739s0§:int = 206;
      
      public static var §1t8740s0§:int = 207;
      
      public static var §1t8741s0§:int = 208;
      
      public static var §1t8742s0§:String = "0";
      
      internal static var §1t8744s0§:int = 99;
      
      internal const §1t457s0§:String = "soul";
      
      internal const §1t459s0§:String = "boosted";
      
      internal const §1t461s0§:String = "rare";
      
      internal const §1t463s0§:String = "special";
      
      internal const §1t465s0§:String = "normal";
      
      private var §1t467s0§:§1t98s0§ = new §1t98s0§();
      
      private var qty:§1t98s0§ = new §1t98s0§();
      
      internal var xp:§1t98s0§ = null;
      
      internal var §1t470s0§:int = 0;
      
      public var modifiers:Vector.<§1t18s0§> = new Vector.<§1t18s0§>();
      
      internal var §1t472s0§:String = "";
      
      internal var primaryColor:uint = §1t8733s0§;
      
      internal var secondaryColor:uint = §1t8733s0§;
      
      internal var §1t475s0§:Boolean = false;
      
      public var uses:int = 0;
      
      internal var weight:int = -1;
      
      internal var §1t478s0§:int = 0;
      
      internal var creator:String = "";
      
      internal var §1t480s0§:int;
      
      internal var §1t481s0§:int;
      
      internal var §1t482s0§:Boolean = false;
      
      internal var §1t521s0§:Array = null;
      
      public function §1t17s0§(param1:int = 0, param2:int = 1)
      {
         super();
         this.§1t467s0§.§1t695s0§(param1);
         this.qty.§1t695s0§(param2);
      }
      
      public static function clone(param1:§1t17s0§) : §1t17s0§
      {
         return §1t17s0§.parse(param1.toString());
      }
      
      public static function parse(param1:String) : §1t17s0§
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc2_:Array = param1.split(",");
         var _loc3_:§1t17s0§ = new §1t17s0§(int(_loc2_[0]),int(_loc2_[1]));
         if(_loc2_.length == 3)
         {
            _loc4_ = _loc2_[2].split("#");
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if(_loc4_[_loc6_] != "")
               {
                  _loc7_ = _loc4_[_loc6_].split("@");
                  _loc5_ = int(_loc7_[0]);
                  if(_loc5_ == §1t8734s0§)
                  {
                     _loc3_.primaryColor = uint(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8735s0§)
                  {
                     _loc3_.secondaryColor = uint(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8736s0§)
                  {
                     _loc3_.uses = int(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8741s0§)
                  {
                     _loc3_.§1t478s0§ = int(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8739s0§)
                  {
                     _loc3_.xp = new §1t98s0§();
                     _loc3_.xp.§1t695s0§(int(_loc7_[1]));
                  }
                  else if(_loc5_ == §1t8740s0§)
                  {
                     _loc3_.§1t470s0§ = int(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8737s0§)
                  {
                     _loc3_.§1t472s0§ = _loc7_[1];
                     if(!§1t8746s0§(_loc3_.§1t483s0§()))
                     {
                        _loc3_.§1t475s0§ = true;
                     }
                  }
                  else if(_loc5_ == §1t8738s0§)
                  {
                     _loc3_.§1t541s0§(_loc7_[1]);
                  }
                  else
                  {
                     _loc8_ = int(_loc7_[1]);
                     _loc3_.§1t493s0§(_loc5_,_loc8_);
                  }
               }
               _loc6_++;
            }
         }
         return _loc3_;
      }
      
      public static function §1t8745s0§(param1:String) : §1t17s0§
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc2_:Array = param1.split(",");
         var _loc3_:§1t17s0§ = new §1t17s0§(int(_loc2_[0]),1);
         if(_loc2_.length == 2)
         {
            _loc4_ = _loc2_[1].split("#");
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if(_loc4_[_loc6_] != "")
               {
                  _loc7_ = _loc4_[_loc6_].split("@");
                  _loc5_ = int(_loc7_[0]);
                  if(_loc5_ == §1t8734s0§)
                  {
                     _loc3_.primaryColor = uint(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8735s0§)
                  {
                     _loc3_.secondaryColor = uint(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8736s0§)
                  {
                     _loc3_.uses = int(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8741s0§)
                  {
                     _loc3_.§1t478s0§ = int(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8739s0§)
                  {
                     _loc3_.xp = new §1t98s0§();
                     _loc3_.xp.§1t695s0§(int(_loc7_[1]));
                  }
                  else if(_loc5_ == §1t8740s0§)
                  {
                     _loc3_.§1t470s0§ = int(_loc7_[1]);
                  }
                  else if(_loc5_ == §1t8737s0§)
                  {
                     _loc3_.§1t472s0§ = _loc7_[1];
                     if(!§1t8746s0§(_loc3_.§1t483s0§()))
                     {
                        _loc3_.§1t475s0§ = true;
                     }
                  }
                  else if(_loc5_ == §1t8738s0§)
                  {
                     _loc3_.§1t541s0§(_loc7_[1]);
                  }
                  else
                  {
                     _loc8_ = int(_loc7_[1]);
                     _loc3_.§1t493s0§(_loc5_,_loc8_);
                  }
               }
               _loc6_++;
            }
         }
         return _loc3_;
      }
      
      public static function §1t8746s0§(param1:int) : Boolean
      {
         return param1 == 2213 || param1 == 2214;
      }
      
      public function §1t483s0§() : int
      {
         return this.§1t467s0§.§1t697s0§();
      }
      
      public function §1t484s0§() : int
      {
         if(this.§1t480s0§ * 3 != this.§1t481s0§)
         {
            §1t3318s0§.instance.§1t1982s0§(this.toString() + " " + this.§1t480s0§ + " " + this.§1t481s0§ + " " + §1t1521s0§.getString(68) + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8892s0§));
            return 1;
         }
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         if(_loc1_ != 2217 && _loc1_ != 20112 && this.qty.§1t697s0§() > §1t8744s0§)
         {
            this.qty.§1t695s0§(§1t8744s0§);
         }
         this.§1t487s0§();
         return this.qty.§1t697s0§();
      }
      
      public function §1t485s0§(param1:int) : *
      {
         var _loc2_:int = this.§1t467s0§.§1t697s0§();
         if(_loc2_ != 2217 && _loc2_ != 20112 && param1 > §1t8744s0§)
         {
            param1 = §1t8744s0§;
         }
         this.qty.§1t695s0§(param1);
      }
      
      public function §1t486s0§(param1:int) : *
      {
         this.qty.§1t698s0§(param1);
         var _loc2_:int = this.§1t467s0§.§1t697s0§();
         if(_loc2_ != 2217 && _loc2_ != 20112 && this.qty.§1t697s0§() > §1t8744s0§)
         {
            this.qty.§1t695s0§(§1t8744s0§);
         }
      }
      
      internal function §1t487s0§() : *
      {
         this.§1t480s0§ = this.qty.§1t697s0§();
         this.§1t481s0§ = this.§1t480s0§ * 3;
      }
      
      public function toString() : String
      {
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         var _loc2_:String = _loc1_ + "," + this.qty.§1t697s0§();
         if(this.modifiers.length > 0 || this.primaryColor != §1t8733s0§ || this.secondaryColor != §1t8733s0§ || this.xp != null || this.uses > 0 || this.§1t475s0§ || this.creator != "")
         {
            _loc2_ += ",";
         }
         var _loc3_:* = 0;
         while(_loc3_ < this.modifiers.length)
         {
            _loc2_ += this.modifiers[_loc3_].§1t1211s0§ + "@" + this.modifiers[_loc3_].value + "#";
            _loc3_++;
         }
         if(this.primaryColor != §1t8733s0§)
         {
            _loc2_ += §1t8734s0§ + "@" + this.primaryColor + "#";
         }
         if(this.secondaryColor != §1t8733s0§)
         {
            _loc2_ += §1t8735s0§ + "@" + this.secondaryColor + "#";
         }
         if(this.uses != 0)
         {
            _loc2_ += §1t8736s0§ + "@" + this.uses + "#";
         }
         if(this.§1t478s0§ != 0)
         {
            _loc2_ += §1t8741s0§ + "@" + this.§1t478s0§ + "#";
         }
         if(this.xp != null)
         {
            _loc2_ += §1t8739s0§ + "@" + this.xp.§1t697s0§() + "#";
            if(this.§1t470s0§ != 0)
            {
               _loc2_ += §1t8740s0§ + "@" + this.§1t470s0§ + "#";
            }
         }
         if(this.§1t475s0§ || §1t8746s0§(_loc1_))
         {
            _loc2_ += §1t8737s0§ + "@" + this.§1t472s0§ + "#";
         }
         if(this.creator != "")
         {
            _loc2_ += §1t8738s0§ + "@" + this.creator + "#";
         }
         return _loc2_;
      }
      
      public function equals(param1:§1t17s0§) : Boolean
      {
         return this.§1t490s0§() == param1.§1t490s0§();
      }
      
      public function §1t490s0§() : String
      {
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         var _loc2_:String = String(_loc1_);
         if(this.modifiers.length > 0 || this.primaryColor != §1t8733s0§ || this.secondaryColor != §1t8733s0§ || this.xp != null || this.uses > 0 || this.§1t475s0§ || this.creator != "")
         {
            _loc2_ += ",";
         }
         var _loc3_:* = 0;
         while(_loc3_ < this.modifiers.length)
         {
            _loc2_ += this.modifiers[_loc3_].§1t1211s0§ + "@" + this.modifiers[_loc3_].value + "#";
            _loc3_++;
         }
         if(this.primaryColor != §1t8733s0§)
         {
            _loc2_ += §1t8734s0§ + "@" + this.primaryColor + "#";
         }
         if(this.secondaryColor != §1t8733s0§)
         {
            _loc2_ += §1t8735s0§ + "@" + this.secondaryColor + "#";
         }
         if(this.xp != null)
         {
            _loc2_ += §1t8739s0§ + "@" + this.xp.§1t697s0§() + "#";
            if(this.§1t470s0§ != 0)
            {
               _loc2_ += §1t8740s0§ + "@" + this.§1t470s0§ + "#";
            }
         }
         if(this.uses != 0)
         {
            _loc2_ += §1t8736s0§ + "@" + this.uses + "#";
         }
         if(this.§1t478s0§ != 0)
         {
            _loc2_ += §1t8741s0§ + "@" + this.§1t478s0§ + "#";
         }
         if(this.§1t475s0§ || §1t8746s0§(_loc1_))
         {
            _loc2_ += §1t8737s0§ + "@" + this.§1t472s0§ + "#";
         }
         if(this.creator != "")
         {
            _loc2_ += §1t8738s0§ + "@" + this.creator + "#";
         }
         return _loc2_;
      }
      
      internal function reset() : *
      {
         this.§1t521s0§ = null;
         this.qty.§1t695s0§(1);
         this.modifiers.length = 0;
         this.§1t472s0§ = "";
         this.primaryColor = §1t8733s0§;
         this.secondaryColor = §1t8733s0§;
         this.§1t475s0§ = false;
         this.uses = 0;
         this.xp = null;
         this.§1t470s0§ = 0;
         this.weight = -1;
         this.§1t478s0§ = 0;
         this.creator = "";
      }
      
      public function §1t492s0§(param1:String) : *
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Array = param1.split(",");
         this.reset();
         this.§1t467s0§.§1t695s0§(int(_loc2_[0]));
         if(_loc2_.length == 2)
         {
            _loc3_ = _loc2_[1].split("#");
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if(_loc3_[_loc5_] != "")
               {
                  _loc6_ = _loc3_[_loc5_].split("@");
                  _loc4_ = int(_loc6_[0]);
                  if(_loc4_ == §1t8734s0§)
                  {
                     this.primaryColor = uint(_loc6_[1]);
                  }
                  else if(_loc4_ == §1t8735s0§)
                  {
                     this.secondaryColor = uint(_loc6_[1]);
                  }
                  else if(_loc4_ == §1t8736s0§)
                  {
                     this.uses = int(_loc6_[1]);
                  }
                  else if(_loc4_ == §1t8741s0§)
                  {
                     this.§1t478s0§ = int(_loc6_[1]);
                  }
                  else if(_loc4_ == §1t8739s0§)
                  {
                     if(this.xp == null)
                     {
                        this.xp = new §1t98s0§();
                     }
                     this.xp.§1t695s0§(int(_loc6_[1]));
                  }
                  else if(_loc4_ == §1t8740s0§)
                  {
                     this.§1t470s0§ = int(_loc6_[1]);
                  }
                  else if(_loc4_ == §1t8737s0§)
                  {
                     this.§1t472s0§ = _loc6_[1];
                     if(!§1t8746s0§(this.§1t467s0§.§1t697s0§()))
                     {
                        this.§1t475s0§ = true;
                     }
                  }
                  else if(_loc4_ == §1t8738s0§)
                  {
                     this.§1t541s0§(_loc6_[1]);
                  }
                  else
                  {
                     _loc7_ = §1t1644s0§.instance.§1t1669s0§(_loc4_);
                     _loc8_ = int(_loc6_[1]);
                     if(_loc7_ != 0 && _loc8_ > _loc7_)
                     {
                        _loc8_ = _loc7_;
                     }
                     this.§1t493s0§(_loc4_,_loc8_);
                  }
               }
               _loc5_++;
            }
         }
      }
      
      internal function §1t493s0§(param1:int, param2:int) : *
      {
         var _loc3_:* = new §1t18s0§(param1,param2);
         this.modifiers.push(_loc3_);
      }
      
      public function §1t494s0§() : *
      {
         return §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§()).levelrestriction;
      }
      
      public function getLevel(param1:Boolean = false) : int
      {
         var _loc6_:§1t18s0§ = null;
         var _loc2_:int = this.§1t467s0§.§1t697s0§();
         var _loc3_:int = §1t1524s0§.§1t9862s0§(_loc2_).levelrestriction;
         var _loc4_:int = §1t1644s0§.instance.§1t1662s0§(_loc2_);
         if(_loc4_ == -1)
         {
            return 0;
         }
         var _loc5_:int = int(this.modifiers.length);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < _loc5_)
         {
            _loc6_ = this.modifiers[_loc9_];
            _loc8_ = §1t1644s0§.instance.§1t1671s0§(_loc6_.§1t1212s0§(),_loc6_.§1t1213s0§()) + 1;
            if(_loc4_ == §1t1644s0§.§1t11229s0§ && _loc6_.§1t1212s0§() == §1t1523s0§.§1t9408s0§ || _loc4_ == §1t1644s0§.§1t11230s0§ && _loc6_.§1t1212s0§() == §1t1523s0§.§1t9409s0§)
            {
               _loc8_ += _loc3_;
            }
            if(_loc8_ > _loc7_)
            {
               _loc7_ = _loc8_;
            }
            _loc9_++;
         }
         if(this.xp != null && this.§1t470s0§ != 0 && _loc7_ < this.§1t470s0§)
         {
            _loc7_ = this.§1t470s0§;
         }
         if(_loc7_ < _loc3_)
         {
            _loc7_ = _loc3_;
         }
         if(!param1 && _loc7_ > §1t1523s0§.§1t9470s0§)
         {
            _loc7_ = §1t1523s0§.§1t9470s0§;
         }
         if(_loc7_ == 0)
         {
            _loc7_ = 1;
         }
         return _loc7_;
      }
      
      public function §1t496s0§(param1:int) : §1t18s0§
      {
         return this.modifiers[param1];
      }
      
      public function §1t497s0§() : int
      {
         return this.modifiers.length;
      }
      
      public function §1t498s0§() : Boolean
      {
         return this.modifiers.length > 0;
      }
      
      public function §1t499s0§(param1:Vector.<§1t18s0§>) : *
      {
         var _loc3_:int = 0;
         this.§1t521s0§ = null;
         this.modifiers.length = 0;
         var _loc2_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_].§1t1212s0§();
            if(_loc3_ != 85 && _loc3_ != 86 && _loc3_ != 87 && _loc3_ != 88)
            {
               this.§1t493s0§(_loc3_,param1[_loc4_].§1t1213s0§());
            }
            _loc4_++;
         }
      }
      
      public function §1t500s0§() : Boolean
      {
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         return _loc1_ == 2122 || _loc1_ == 2123 || _loc1_ == 2124 || _loc1_ == 2148;
      }
      
      public function §1t501s0§() : Boolean
      {
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         return _loc1_ == 20103 || _loc1_ == 20104 || _loc1_ == 20105 || _loc1_ == 20106 || _loc1_ == 20107;
      }
      
      public function §1t502s0§() : Boolean
      {
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         return _loc1_ >= 20000 && _loc1_ < 30000;
      }
      
      public function §1t503s0§() : Boolean
      {
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         return _loc1_ >= 20060 && _loc1_ <= 20066;
      }
      
      public function §1t504s0§() : Boolean
      {
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc1_ == null)
         {
            return false;
         }
         return _loc1_.§1t854s0§() > 0;
      }
      
      public function §1t505s0§() : Boolean
      {
         if(this.§1t482s0§)
         {
            return true;
         }
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc1_ == null)
         {
            return false;
         }
         if(_loc1_.§1t854s0§() > 0 && §1t1523s0§.getLevel() < 10 && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9426s0§) == 0)
         {
            return true;
         }
         return _loc1_.nogive;
      }
      
      public function §1t506s0§() : Boolean
      {
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc1_ == null)
         {
            return true;
         }
         return !_loc1_.nodrop;
      }
      
      public function §1t507s0§() : Boolean
      {
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc1_ == null)
         {
            return false;
         }
         return _loc1_.type == 13;
      }
      
      public function §1t508s0§() : String
      {
         if(this.xp != null)
         {
            return this.§1t457s0§;
         }
         if(this.§1t482s0§)
         {
            return this.§1t459s0§;
         }
         var _loc1_:int = int(this.modifiers.length);
         var _loc2_:Boolean = this.§1t501s0§();
         if(this.§1t500s0§() || _loc2_)
         {
            _loc1_ = 0;
         }
         var _loc3_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc3_ != null && _loc3_.unique == 1 || this.§1t500s0§() || _loc2_ || this.§1t539s0§())
         {
            return "unique";
         }
         if(_loc1_ >= 3)
         {
            return this.§1t461s0§;
         }
         if(_loc1_ > 0)
         {
            return this.§1t463s0§;
         }
         return this.§1t465s0§;
      }
      
      public function §1t509s0§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = int(this.modifiers.length);
         var _loc3_:Boolean = this.§1t501s0§();
         if(this.§1t500s0§() || _loc3_)
         {
            _loc2_ = 0;
         }
         var _loc4_:int = this.§1t467s0§.§1t697s0§();
         var _loc5_:§1t104s0§ = §1t1524s0§.§1t9862s0§(_loc4_);
         if(!§1t406s0§.§1t9190s0§().§1t6466s0§.visible && (§1t406s0§.§1t9190s0§().§1t6488s0§.visible || §1t406s0§.§1t9190s0§().§1t6502s0§.visible))
         {
            if(this.xp != null)
            {
               _loc1_ += "<font color=\"#ff9900\">";
            }
            else if(_loc5_ != null && _loc5_.unique == 1 || this.§1t500s0§() || _loc3_ || this.§1t539s0§())
            {
               _loc1_ += "<font color=\"#b048f8\">";
            }
            else if(_loc2_ >= 3)
            {
               _loc1_ += "<font color=\"#0080ff\">";
            }
            else if(_loc2_ > 0)
            {
               _loc1_ += "<font color=\"#1eff00\">";
            }
            else
            {
               _loc1_ += "<font color=\"#FFFFFF\">";
            }
         }
         else if(this.xp != null)
         {
            _loc1_ += "<font color=\"#ff6600\">";
         }
         else if(_loc5_ != null && _loc5_.unique == 1 || this.§1t500s0§() || _loc3_ || this.§1t539s0§())
         {
            _loc1_ += "<font color=\"#6600cc\">";
         }
         else if(_loc2_ >= 3)
         {
            _loc1_ += "<font color=\"#003399\">";
         }
         else if(_loc2_ > 0)
         {
            _loc1_ += "<font color=\"#336600\">";
         }
         else
         {
            _loc1_ += "<font color=\"#000000\">";
         }
         if(this.creator != "")
         {
            if(this.§1t475s0§ && this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.creator + "\'s " + this.§1t472s0§;
            }
            else
            {
               _loc1_ += this.creator + "\'s " + §1t1644s0§.instance.§1t1666s0§(this);
            }
         }
         else if(this.§1t475s0§)
         {
            if(this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.§1t472s0§;
            }
            else
            {
               _loc1_ += §1t1644s0§.instance.§1t1668s0§(this);
            }
         }
         else if(this.§1t500s0§())
         {
            _loc1_ += §1t1644s0§.instance.§1t1667s0§(_loc4_,this.§1t526s0§(85),this.§1t527s0§());
         }
         else if(_loc3_)
         {
            _loc1_ += §1t123s0§.instance.§1t1579s0§(this);
         }
         else
         {
            _loc1_ += §1t1644s0§.instance.§1t1666s0§(this);
         }
         return _loc1_ + "</font>";
      }
      
      public function §1t510s0§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = int(this.modifiers.length);
         var _loc3_:Boolean = this.§1t501s0§();
         if(this.§1t500s0§() || _loc3_)
         {
            _loc2_ = 0;
         }
         var _loc4_:int = this.§1t467s0§.§1t697s0§();
         if(this.xp != null)
         {
            _loc1_ += "<font color=\"#ff9900\">";
         }
         else if(§1t1524s0§.§1t9862s0§(_loc4_).unique == 1 || this.§1t500s0§() || _loc3_ || this.§1t539s0§())
         {
            _loc1_ += "<font color=\"#b048f8\">";
         }
         else if(_loc2_ >= 3)
         {
            _loc1_ += "<font color=\"#0080ff\">";
         }
         else if(_loc2_ > 0)
         {
            _loc1_ += "<font color=\"#1eff00\">";
         }
         else
         {
            _loc1_ += "<font color=\"#FFFFFF\">";
         }
         if(this.creator != "")
         {
            if(this.§1t475s0§ && this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.creator + "\'s " + this.§1t472s0§;
            }
            else
            {
               _loc1_ += this.creator + "\'s " + §1t1644s0§.instance.§1t1666s0§(this);
            }
         }
         else if(this.§1t475s0§)
         {
            if(this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.§1t472s0§;
            }
            else
            {
               _loc1_ += §1t1644s0§.instance.§1t1668s0§(this);
            }
         }
         else if(this.§1t500s0§())
         {
            _loc1_ += §1t1644s0§.instance.§1t1667s0§(_loc4_,this.§1t526s0§(85),this.§1t527s0§());
         }
         else if(_loc3_)
         {
            _loc1_ += §1t123s0§.instance.§1t1579s0§(this);
         }
         else
         {
            _loc1_ += §1t1644s0§.instance.§1t1666s0§(this);
         }
         return _loc1_ + "</font>";
      }
      
      public function §1t511s0§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = int(this.modifiers.length);
         var _loc3_:Boolean = this.§1t501s0§();
         if(this.§1t500s0§() || _loc3_)
         {
            _loc2_ = 0;
         }
         var _loc4_:int = this.§1t467s0§.§1t697s0§();
         if(this.xp != null)
         {
            _loc1_ += "<font color=\"#ff9900\">[";
         }
         else if(§1t1524s0§.§1t9862s0§(_loc4_).unique == 1 || this.§1t500s0§() || _loc3_ || this.§1t539s0§())
         {
            _loc1_ += "<font color=\"#b048f8\">[";
         }
         else if(_loc2_ >= 3)
         {
            _loc1_ += "<font color=\"#0080ff\">[";
         }
         else if(_loc2_ > 0)
         {
            _loc1_ += "<font color=\"#1eff00\">[";
         }
         else
         {
            _loc1_ += "<font color=\"#FFFFFF\">[";
         }
         if(this.creator != "")
         {
            if(this.§1t475s0§ && this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.creator + "\'s " + this.§1t472s0§;
            }
            else
            {
               _loc1_ += this.creator + "\'s " + §1t1644s0§.instance.§1t1666s0§(this);
            }
         }
         else if(this.§1t475s0§)
         {
            if(this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.§1t472s0§;
            }
            else
            {
               _loc1_ += §1t1644s0§.instance.§1t1668s0§(this);
            }
         }
         else if(this.§1t500s0§())
         {
            _loc1_ += §1t1644s0§.instance.§1t1667s0§(_loc4_,this.§1t526s0§(85),this.§1t527s0§());
         }
         else if(_loc3_)
         {
            _loc1_ += §1t123s0§.instance.§1t1579s0§(this);
         }
         else
         {
            _loc1_ += §1t1644s0§.instance.§1t1666s0§(this);
         }
         return _loc1_ + "]</font>";
      }
      
      public function §1t512s0§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = int(this.modifiers.length);
         var _loc3_:Boolean = this.§1t501s0§();
         if(this.§1t500s0§() || _loc3_)
         {
            _loc2_ = 0;
         }
         var _loc4_:int = this.§1t467s0§.§1t697s0§();
         if(this.xp != null)
         {
            _loc1_ += "<font color=\"#ff9900\">";
         }
         else if(§1t1524s0§.§1t9862s0§(_loc4_).unique == 1 || this.§1t500s0§() || _loc3_ || this.§1t539s0§())
         {
            _loc1_ += "<font color=\"#b048f8\">";
         }
         else if(_loc2_ >= 3)
         {
            _loc1_ += "<font color=\"#0080ff\">";
         }
         else if(_loc2_ > 0)
         {
            _loc1_ += "<font color=\"#1eff00\">";
         }
         else
         {
            _loc1_ += "<font color=\"#FFFFFF\">";
         }
         if(this.creator != "")
         {
            if(this.§1t475s0§ && this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.creator + "\'s " + this.§1t472s0§;
            }
            else
            {
               _loc1_ += this.creator + "\'s " + §1t1644s0§.instance.§1t1666s0§(this);
            }
         }
         else if(this.§1t475s0§)
         {
            if(this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.§1t472s0§;
            }
            else
            {
               _loc1_ += §1t1644s0§.instance.§1t1668s0§(this);
            }
         }
         else if(this.§1t500s0§())
         {
            _loc1_ += §1t1644s0§.instance.§1t1667s0§(_loc4_,this.§1t526s0§(85),this.§1t527s0§());
         }
         else
         {
            _loc1_ += §1t1644s0§.instance.§1t1666s0§(this);
         }
         return _loc1_ + "</font>";
      }
      
      public function §1t513s0§() : String
      {
         var _loc1_:String = "";
         var _loc2_:Boolean = this.§1t501s0§();
         if(this.creator != "")
         {
            if(this.§1t475s0§ && this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ += this.creator + "\'s " + this.§1t472s0§;
            }
            else
            {
               _loc1_ += this.creator + "\'s " + §1t1644s0§.instance.§1t1666s0§(this);
            }
         }
         else if(this.§1t475s0§)
         {
            if(this.§1t472s0§ != §1t8742s0§)
            {
               _loc1_ = this.§1t472s0§;
            }
            else
            {
               _loc1_ = §1t1644s0§.instance.§1t1668s0§(this);
            }
         }
         else if(this.§1t500s0§())
         {
            _loc1_ = §1t1644s0§.instance.§1t1667s0§(this.§1t467s0§.§1t697s0§(),this.§1t526s0§(85),this.§1t527s0§());
         }
         else if(_loc2_)
         {
            _loc1_ = §1t123s0§.instance.§1t1579s0§(this);
         }
         else
         {
            _loc1_ = §1t1644s0§.instance.§1t1666s0§(this);
         }
         return _loc1_;
      }
      
      public function §1t514s0§() : String
      {
         var _loc1_:int = this.§1t536s0§();
         var _loc2_:String = "";
         if(_loc1_ >= 0)
         {
            if(this.uses == 0)
            {
               _loc2_ = §1t1521s0§.getString(639);
            }
            else if(this.uses == 1)
            {
               _loc2_ = §1t1521s0§.getString(392);
            }
            else if(_loc1_ == 0)
            {
               _loc2_ = "<font color=\"#FF0000\">" + §1t1521s0§.getString(387) + "</font>";
            }
            else if(_loc1_ < 25)
            {
               _loc2_ = §1t1521s0§.getString(388);
            }
            else if(_loc1_ < 50)
            {
               _loc2_ = §1t1521s0§.getString(389);
            }
            else if(_loc1_ < 75)
            {
               _loc2_ = §1t1521s0§.getString(390);
            }
            else
            {
               _loc2_ = §1t1521s0§.getString(391);
            }
         }
         if(this.§1t482s0§)
         {
            if(_loc2_ == "")
            {
               _loc2_ = §1t1521s0§.getString(11496);
            }
            else
            {
               _loc2_ += "\n" + §1t1521s0§.getString(11496);
            }
         }
         var _loc3_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc3_ == null)
         {
            return "?";
         }
         if(_loc2_ != "" && §1t1521s0§.getString(_loc3_.§1t892s0§) != "")
         {
            _loc2_ += "\n\n";
         }
         return _loc2_ + §1t1521s0§.getString(_loc3_.§1t892s0§);
      }
      
      internal function §1t515s0§(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         if(param1 > param2)
         {
            _loc3_ = "<font color=\"#00A606\">" + String(param1) + "</font>";
         }
         else if(param1 < param2)
         {
            _loc3_ = "<font color=\"#FF0000\">" + String(param1) + "</font>";
         }
         else if(param1 == param2)
         {
            _loc3_ = String(param1);
         }
         return _loc3_;
      }
      
      internal function §1t516s0§(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         if(param1 > param2)
         {
            _loc3_ = "<font color=\"#00A606\">" + String(param2) + "</font>";
         }
         else if(param1 < param2)
         {
            _loc3_ = "<font color=\"#FF0000\">" + String(param2) + "</font>";
         }
         else if(param1 == param2)
         {
            _loc3_ = String(param2);
         }
         return _loc3_;
      }
      
      internal function §1t517s0§(param1:int, param2:int, param3:int, param4:int) : String
      {
         var _loc5_:String = "";
         if(param1 > param3)
         {
            _loc5_ += "<font color=\"#00A606\">" + param1 + "</font>";
         }
         else if(param1 < param3)
         {
            _loc5_ += "<font color=\"#FF0000\">" + param1 + "</font>";
         }
         else if(param1 == param3)
         {
            _loc5_ += "" + param1;
         }
         _loc5_ += " - ";
         if(param2 > param4)
         {
            _loc5_ += "<font color=\"#00A606\">" + param2 + "</font>";
         }
         else if(param2 < param4)
         {
            _loc5_ += "<font color=\"#FF0000\">" + param2 + "</font>";
         }
         else if(param2 == param4)
         {
            _loc5_ += param2 + "";
         }
         return _loc5_;
      }
      
      public function §1t518s0§() : String
      {
         var _loc8_:Array = null;
         var _loc9_:* = undefined;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:§1t104s0§ = null;
         var _loc15_:int = 0;
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(_loc1_);
         if(_loc2_ == null)
         {
            return "";
         }
         var _loc3_:String = "";
         var _loc4_:int = _loc2_.type;
         var _loc5_:Array = this.§1t522s0§();
         var _loc6_:§1t17s0§ = null;
         var _loc7_:§1t104s0§ = null;
         if(this.xp != null)
         {
            _loc3_ += §1t1521s0§.getString(500) + "\n";
            _loc3_ += §1t1521s0§.getString(11072) + "\n\n";
         }
         if(_loc4_ != 10 && _loc4_ != 12 && _loc4_ != 13)
         {
            _loc6_ = §1t1523s0§.§1t7316s0§[_loc4_];
            _loc7_ = §1t1524s0§.§1t9862s0§(_loc6_.§1t483s0§());
            if(_loc2_.mindamage > 0 || _loc2_.maxdamage > 0)
            {
               if(_loc7_)
               {
                  if(_loc6_.§1t535s0§() && this.§1t535s0§())
                  {
                     _loc3_ += §1t1521s0§.getString(108) + ": 1 - 1 (" + §1t1521s0§.getString(199) + ": 1 - 1)\n";
                  }
                  else if(this.§1t535s0§())
                  {
                     _loc3_ += §1t1521s0§.getString(108) + ": <font color=\'#FF0000\'>1 - 1</font> (" + §1t1521s0§.getString(199) + ": " + (_loc7_.mindamage + _loc6_.§1t523s0§(6)) + " - " + (_loc7_.maxdamage + _loc6_.§1t523s0§(6)) + ")\n";
                  }
                  else if(_loc6_.§1t535s0§())
                  {
                     _loc3_ += §1t1521s0§.getString(108) + ": " + this.§1t517s0§(_loc2_.mindamage + this.§1t523s0§(6),_loc2_.maxdamage + this.§1t523s0§(6),1,1) + " (" + §1t1521s0§.getString(199) + ": <font color=\'#FF0000\'>1 - 1</font>)\n";
                  }
                  else
                  {
                     _loc3_ += §1t1521s0§.getString(108) + ": " + this.§1t517s0§(_loc2_.mindamage + this.§1t523s0§(6),_loc2_.maxdamage + this.§1t523s0§(6),_loc7_.mindamage + _loc6_.§1t523s0§(6),_loc7_.maxdamage + _loc6_.§1t523s0§(6)) + " (" + §1t1521s0§.getString(199) + ": " + (_loc7_.mindamage + _loc6_.§1t523s0§(6)) + " - " + (_loc7_.maxdamage + _loc6_.§1t523s0§(6)) + ") \n";
                  }
               }
               else if(this.§1t535s0§())
               {
                  _loc3_ += "<font color=\'#FF0000\'>" + §1t1521s0§.getString(108) + ": 1 - 1</font>\n";
               }
               else
               {
                  _loc3_ += §1t1521s0§.getString(108) + ": " + (_loc2_.mindamage + this.§1t523s0§(6)) + " - " + (_loc2_.maxdamage + this.§1t523s0§(6)) + "\n";
               }
            }
            if(_loc2_.defense + this.§1t523s0§(7) != 0 || _loc7_ != null && _loc7_.defense + _loc6_.§1t523s0§(7) != 0)
            {
               if(_loc7_)
               {
                  if(_loc2_.defense + this.§1t523s0§(7) == 0)
                  {
                     _loc3_ += §1t1521s0§.getString(117) + ": " + this.§1t515s0§(_loc2_.defense + this.§1t523s0§(7),_loc7_.defense + _loc6_.§1t523s0§(7)) + " (" + §1t1521s0§.getString(199) + ": " + (_loc7_.defense + _loc6_.§1t523s0§(7)) + ")\n";
                  }
                  else
                  {
                     _loc3_ += §1t1521s0§.getString(117) + ": +" + this.§1t515s0§(_loc2_.defense + this.§1t523s0§(7),_loc7_.defense + _loc6_.§1t523s0§(7)) + " (" + §1t1521s0§.getString(199) + ": " + (_loc7_.defense + _loc6_.§1t523s0§(7)) + ")\n";
                  }
               }
               else
               {
                  _loc3_ += §1t1521s0§.getString(117) + ": +" + (_loc2_.defense + this.§1t523s0§(7)) + "\n";
               }
            }
            else if(Boolean(_loc7_) && _loc7_.defense != 0)
            {
               _loc3_ += §1t1521s0§.getString(117) + ": +" + this.§1t515s0§(0,_loc7_.defense + _loc6_.§1t523s0§(7)) + " (" + §1t1521s0§.getString(199) + ": " + (_loc7_.defense + _loc6_.§1t523s0§(7)) + ")\n";
            }
         }
         if(_loc6_ == null || _loc6_.§1t483s0§() == 0 || _loc4_ == 10 || _loc4_ == 12 || _loc4_ == 13)
         {
            _loc8_ = this.§1t522s0§();
         }
         else
         {
            _loc8_ = _loc6_.§1t522s0§().concat(this.§1t522s0§());
            _loc8_.sortOn("1t1211s0");
            _loc11_ = 0;
            while(_loc11_ < _loc8_.length - 1)
            {
               _loc12_ = _loc11_ + 1;
               while(_loc12_ < _loc8_.length)
               {
                  if(_loc8_[_loc11_].§1t1212s0§() === _loc8_[_loc12_].§1t1212s0§())
                  {
                     _loc8_.splice(_loc12_,1);
                  }
                  _loc12_++;
               }
               _loc11_++;
            }
         }
         _loc9_ = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc13_ = false;
            switch(int(_loc8_[_loc9_].§1t1211s0§))
            {
               case 0:
                  _loc3_ += §1t1521s0§.getString(110);
                  _loc13_ = true;
                  break;
               case 1:
                  _loc3_ += §1t1521s0§.getString(111);
                  _loc13_ = true;
                  break;
               case 2:
                  _loc3_ += §1t1521s0§.getString(112);
                  _loc13_ = true;
                  break;
               case 3:
                  _loc3_ += §1t1521s0§.getString(113);
                  _loc13_ = true;
                  break;
               case 4:
                  _loc3_ += §1t1521s0§.getString(114);
                  _loc13_ = true;
                  break;
               case 5:
                  _loc3_ += §1t1521s0§.getString(115);
                  _loc13_ = true;
                  break;
               case 6:
                  if(_loc2_.mindamage == 0 && _loc2_.maxdamage == 0)
                  {
                     _loc3_ += §1t1521s0§.getString(116);
                     _loc13_ = true;
                  }
                  break;
               case 7:
                  break;
               case 8:
                  _loc3_ += §1t1521s0§.getString(118);
                  _loc13_ = true;
                  break;
               case 9:
                  if(_loc8_[_loc9_].value > 0)
                  {
                     _loc3_ += §1t1521s0§.getString(119);
                     _loc13_ = true;
                  }
                  break;
               case 10:
                  _loc3_ += §1t1521s0§.getString(120);
                  _loc13_ = true;
                  break;
               case 11:
                  _loc3_ += §1t1521s0§.getString(63);
                  _loc13_ = true;
                  break;
               case 12:
                  _loc3_ += §1t1521s0§.getString(64);
                  _loc13_ = true;
                  break;
               case 13:
                  _loc3_ += §1t1521s0§.getString(102);
                  _loc13_ = true;
                  break;
               case 14:
                  _loc3_ += §1t1521s0§.getString(121);
                  _loc13_ = true;
                  break;
               case 15:
                  _loc3_ += §1t1521s0§.getString(59);
                  _loc13_ = true;
                  break;
               case 16:
                  _loc3_ += §1t1521s0§.getString(122);
                  _loc13_ = true;
                  break;
               case 21:
                  if(_loc1_ == 2213)
                  {
                     _loc3_ += §1t1521s0§.getString(825,[this.§1t472s0§]) + "\n";
                  }
                  else if(_loc1_ == 2214)
                  {
                     _loc3_ += §1t1521s0§.getString(826,[this.§1t472s0§]) + "\n";
                  }
                  break;
               case 28:
                  _loc3_ += §1t1521s0§.getString(507);
                  _loc13_ = true;
                  break;
               case 29:
                  _loc3_ += §1t1521s0§.getString(508);
                  _loc13_ = true;
                  break;
               case 30:
                  _loc3_ += §1t1521s0§.getString(509);
                  _loc13_ = true;
                  break;
               case 31:
                  _loc3_ += §1t1521s0§.getString(510);
                  _loc13_ = true;
                  break;
               case §1t1523s0§.§1t1239s0§:
                  _loc3_ += §1t1521s0§.getString(871);
                  _loc13_ = true;
                  break;
               case §1t1523s0§.§1t1240s0§:
                  _loc3_ += §1t1521s0§.getString(872);
                  _loc13_ = true;
                  break;
               case §1t1523s0§.§1t1241s0§:
                  _loc3_ += §1t1521s0§.getString(873);
                  _loc13_ = true;
                  break;
               case §1t1523s0§.§1t1242s0§:
                  _loc3_ += §1t1521s0§.getString(874);
                  _loc13_ = true;
                  break;
               case §1t1523s0§.§1t1243s0§:
                  _loc3_ += §1t1521s0§.getString(875);
                  _loc13_ = true;
                  break;
               case §1t1523s0§.§1t1244s0§:
                  _loc3_ += §1t1521s0§.getString(876);
                  _loc13_ = true;
                  break;
               case 102:
                  _loc3_ += §1t1521s0§.getString(640) + §1t70s0§.instance.§1t1154s0§(_loc8_[_loc9_].value) + "\n";
                  break;
               case 103:
               case 106:
                  _loc14_ = §1t1524s0§.§1t9862s0§(_loc8_[_loc9_].value);
                  if(_loc14_ != null)
                  {
                     _loc3_ += "- " + §1t1521s0§.getString(_loc14_.§1t891s0§) + "\n";
                  }
                  break;
               case 25:
            }
            if(_loc13_)
            {
               if(_loc4_ == 10 || _loc4_ == 12 || _loc4_ == 13)
               {
                  _loc15_ = int(_loc8_[_loc9_].value);
                  if(_loc15_ > 0)
                  {
                     _loc3_ += ": +" + _loc15_ + "\n";
                  }
                  else if(_loc15_ < 0)
                  {
                     _loc3_ += ": " + _loc15_ + "\n";
                  }
               }
               else if(_loc6_ == null || _loc6_.§1t483s0§() == 0)
               {
                  _loc15_ = this.§1t523s0§(_loc8_[_loc9_].§1t1212s0§());
                  if(_loc15_ > 0)
                  {
                     _loc3_ += ": +" + _loc15_ + "\n";
                  }
                  else if(_loc15_ < 0)
                  {
                     _loc3_ += ": " + _loc15_ + "\n";
                  }
               }
               else
               {
                  _loc15_ = this.§1t523s0§(_loc8_[_loc9_].§1t1212s0§());
                  if(_loc15_ > 0)
                  {
                     _loc3_ += ": +" + this.§1t515s0§(_loc15_,_loc6_.§1t523s0§(_loc8_[_loc9_].§1t1211s0§)) + " (" + §1t1521s0§.getString(199) + ": " + _loc6_.§1t523s0§(_loc8_[_loc9_].§1t1211s0§) + ")\n";
                  }
                  else
                  {
                     _loc3_ += ": " + this.§1t515s0§(_loc15_,_loc6_.§1t523s0§(_loc8_[_loc9_].§1t1211s0§)) + " (" + §1t1521s0§.getString(199) + ": " + _loc6_.§1t523s0§(_loc8_[_loc9_].§1t1211s0§) + ")\n";
                  }
               }
            }
            _loc9_++;
         }
         if(_loc2_.weight > 0 || this.§1t478s0§ > 0)
         {
            _loc3_ += §1t1521s0§.getString(139) + ": " + (_loc2_.weight + this.§1t478s0§) + "\n";
         }
         var _loc10_:int = this.getLevel();
         if(_loc10_ > 0 && §1t1523s0§.getLevel() < _loc10_)
         {
            _loc3_ += "<font color=\"#FF0000\">" + §1t1521s0§.getString(124) + ": " + _loc10_ + "</font>\n";
         }
         if(_loc1_ >= 20000)
         {
            _loc3_ += §1t1521s0§.getString(207) + "\n";
         }
         return _loc3_;
      }
      
      public function §1t519s0§() : String
      {
         var _loc6_:§1t18s0§ = null;
         var _loc7_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(_loc1_);
         if(_loc2_ == null)
         {
            return "";
         }
         var _loc3_:String = "";
         var _loc4_:int = _loc2_.type;
         if(this.xp != null)
         {
            _loc11_ = this.getLevel();
            if(_loc11_ < §1t1523s0§.§1t9470s0§)
            {
               _loc3_ += §1t1521s0§.getString(500) + "\n";
               _loc3_ += §1t1521s0§.getString(47,[_loc11_.toString()]) + " (" + this.xp.§1t697s0§() + " / " + this.§1t551s0§(_loc11_) + ")\n\n";
            }
            else
            {
               _loc3_ += §1t1521s0§.getString(500) + "\n";
               _loc3_ += §1t1521s0§.getString(501) + "\n\n";
            }
         }
         if(_loc4_ != 10 && _loc4_ != 12)
         {
            if(_loc2_.mindamage > 0 || _loc2_.maxdamage > 0)
            {
               if(this.§1t535s0§())
               {
                  _loc3_ += "<font color=\"#FF0000\">" + §1t1521s0§.getString(108) + ": 1 - 1</font>\n";
               }
               else
               {
                  _loc3_ += §1t1521s0§.getString(108) + ": " + (_loc2_.mindamage + this.§1t523s0§(6)) + " - " + (_loc2_.maxdamage + this.§1t523s0§(6)) + "\n";
               }
            }
            if(_loc2_.defense != 0)
            {
               _loc3_ += §1t1521s0§.getString(117) + ": +" + (_loc2_.defense + this.§1t523s0§(7)) + "\n";
            }
         }
         var _loc5_:Array = this.§1t522s0§();
         var _loc8_:int = int(_loc5_.length);
         var _loc9_:* = 0;
         while(_loc9_ < _loc8_)
         {
            _loc12_ = false;
            _loc6_ = _loc5_[_loc9_];
            _loc7_ = _loc6_.§1t1212s0§();
            switch(_loc7_)
            {
               case 0:
                  _loc3_ += §1t1521s0§.getString(110);
                  _loc12_ = true;
                  break;
               case 1:
                  _loc3_ += §1t1521s0§.getString(111);
                  _loc12_ = true;
                  break;
               case 2:
                  _loc3_ += §1t1521s0§.getString(112);
                  _loc12_ = true;
                  break;
               case 3:
                  _loc3_ += §1t1521s0§.getString(113);
                  _loc12_ = true;
                  break;
               case 4:
                  _loc3_ += §1t1521s0§.getString(114);
                  _loc12_ = true;
                  break;
               case 5:
                  _loc3_ += §1t1521s0§.getString(115);
                  _loc12_ = true;
                  break;
               case 6:
                  if(_loc2_.mindamage == 0 && _loc2_.maxdamage == 0)
                  {
                     _loc3_ += §1t1521s0§.getString(116);
                     _loc12_ = true;
                  }
                  break;
               case 7:
                  if((_loc2_.mindamage > 0 || _loc2_.maxdamage > 0 || _loc4_ == 11) && _loc2_.defense == 0)
                  {
                     if(_loc6_.§1t1213s0§() != 0)
                     {
                        _loc3_ += §1t1521s0§.getString(117);
                        _loc12_ = true;
                     }
                  }
                  break;
               case 8:
                  _loc3_ += §1t1521s0§.getString(118);
                  _loc12_ = true;
                  break;
               case 9:
                  if(_loc6_.§1t1213s0§() > 0)
                  {
                     _loc3_ += §1t1521s0§.getString(119);
                     _loc12_ = true;
                  }
                  break;
               case 10:
                  _loc3_ += §1t1521s0§.getString(120);
                  _loc12_ = true;
                  break;
               case 11:
                  _loc3_ += §1t1521s0§.getString(63);
                  _loc12_ = true;
                  break;
               case 12:
                  _loc3_ += §1t1521s0§.getString(64);
                  _loc12_ = true;
                  break;
               case 13:
                  _loc3_ += §1t1521s0§.getString(102);
                  _loc12_ = true;
                  break;
               case 14:
                  _loc3_ += §1t1521s0§.getString(121);
                  _loc12_ = true;
                  break;
               case 15:
                  _loc3_ += §1t1521s0§.getString(59);
                  _loc12_ = true;
                  break;
               case 16:
                  _loc3_ += §1t1521s0§.getString(122);
                  _loc12_ = true;
                  break;
               case 28:
                  _loc3_ += §1t1521s0§.getString(507);
                  _loc12_ = true;
                  break;
               case 29:
                  _loc3_ += §1t1521s0§.getString(508);
                  _loc12_ = true;
                  break;
               case 30:
                  _loc3_ += §1t1521s0§.getString(509);
                  _loc12_ = true;
                  break;
               case 31:
                  _loc3_ += §1t1521s0§.getString(510);
                  _loc12_ = true;
                  break;
               case §1t1523s0§.§1t1239s0§:
                  _loc3_ += §1t1521s0§.getString(871);
                  _loc12_ = true;
                  break;
               case §1t1523s0§.§1t1240s0§:
                  _loc3_ += §1t1521s0§.getString(872);
                  _loc12_ = true;
                  break;
               case §1t1523s0§.§1t1241s0§:
                  _loc3_ += §1t1521s0§.getString(873);
                  _loc12_ = true;
                  break;
               case §1t1523s0§.§1t1242s0§:
                  _loc3_ += §1t1521s0§.getString(874);
                  _loc12_ = true;
                  break;
               case §1t1523s0§.§1t1243s0§:
                  _loc3_ += §1t1521s0§.getString(875);
                  _loc12_ = true;
                  break;
               case §1t1523s0§.§1t1244s0§:
                  _loc3_ += §1t1521s0§.getString(876);
                  _loc12_ = true;
                  break;
               case 82:
               case 78:
               case 79:
                  break;
               default:
                  if(_loc7_ < 2000 && _loc7_ > 100)
                  {
                     _loc3_ += §1t1521s0§.getString(123) + ": " + _loc6_.§1t1212s0§();
                  }
            }
            if(_loc12_)
            {
               _loc13_ = _loc6_.§1t1213s0§();
               if(_loc13_ > 0)
               {
                  _loc3_ += ": +" + _loc13_ + "\n";
               }
               else if(_loc13_ < 0)
               {
                  _loc3_ += ": " + _loc13_ + "\n";
               }
            }
            _loc9_++;
         }
         if(_loc2_.weight > 0 || this.§1t478s0§ > 0)
         {
            _loc3_ += §1t1521s0§.getString(139) + ": " + (_loc2_.weight + this.§1t478s0§) + "\n";
         }
         var _loc10_:int = this.getLevel();
         if(_loc10_ > 0 && §1t1523s0§.getLevel() < _loc10_)
         {
            _loc3_ += "<font color=\"#FF0000\">" + §1t1521s0§.getString(124) + ": " + _loc10_ + "</font>\n";
         }
         if(_loc1_ >= 20000)
         {
            _loc3_ += §1t1521s0§.getString(207) + "\n";
         }
         return _loc3_;
      }
      
      public function §1t520s0§() : *
      {
         this.§1t521s0§ = null;
      }
      
      public function §1t522s0§() : Array
      {
         var _loc6_:§1t18s0§ = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(this.§1t521s0§ != null)
         {
            return this.§1t521s0§;
         }
         this.§1t521s0§ = new Array();
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc1_ == null)
         {
            return this.§1t521s0§;
         }
         var _loc2_:int = _loc1_.type;
         var _loc3_:int = 0;
         var _loc4_:int = -1;
         var _loc5_:int = int(this.modifiers.length);
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc6_ = this.modifiers[_loc8_];
            _loc7_ = _loc6_.§1t1212s0§();
            if(_loc2_ == 11 && _loc7_ == §1t1523s0§.§1t9409s0§)
            {
               _loc3_ += _loc6_.§1t1213s0§();
            }
            else if((_loc2_ == 0 || _loc2_ == 3) && _loc7_ == §1t1523s0§.§1t9408s0§)
            {
               _loc3_ += _loc6_.§1t1213s0§();
            }
            else
            {
               this.§1t521s0§.push(new §1t18s0§(_loc7_,_loc6_.§1t1213s0§()));
               if(_loc7_ == §1t1523s0§.§1t9403s0§)
               {
                  _loc4_ = this.§1t521s0§.length - 1;
               }
            }
            _loc8_++;
         }
         if(_loc3_ > 0)
         {
            if(_loc4_ == -1)
            {
               this.§1t521s0§.push(new §1t18s0§(§1t1523s0§.§1t9403s0§,_loc3_));
            }
            else
            {
               this.§1t521s0§[_loc4_].value += _loc3_;
               if(this.§1t521s0§[_loc4_].value > 173)
               {
                  this.§1t521s0§[_loc4_].value = 173;
               }
            }
         }
         var _loc9_:int = _loc1_.modifierXML.length();
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = false;
            _loc11_ = int(_loc1_.modifierXML[_loc8_].id);
            if(_loc11_ != 103 && _loc11_ != 106)
            {
               _loc12_ = 0;
               while(_loc12_ < this.§1t521s0§.length)
               {
                  _loc6_ = this.§1t521s0§[_loc12_];
                  if(_loc6_.§1t1212s0§() == _loc11_)
                  {
                     _loc6_.value += _loc1_.modifierXML[_loc8_].value;
                     _loc10_ = true;
                     break;
                  }
                  _loc12_++;
               }
            }
            if(!_loc10_)
            {
               this.§1t521s0§.push(new §1t18s0§(_loc11_,_loc1_.modifierXML[_loc8_].value));
            }
            _loc8_++;
         }
         return this.§1t521s0§;
      }
      
      public function §1t523s0§(param1:int) : int
      {
         var _loc2_:Array = this.§1t522s0§();
         var _loc3_:* = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].§1t1211s0§ == param1)
            {
               return _loc2_[_loc3_].value;
            }
            _loc3_++;
         }
         return 0;
      }
      
      internal function §1t524s0§(param1:int) : §1t18s0§
      {
         var _loc2_:int = int(this.modifiers.length);
         var _loc3_:* = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.modifiers[_loc3_].§1t1212s0§() == param1)
            {
               return this.modifiers[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      internal function §1t525s0§() : §1t18s0§
      {
         var _loc1_:int = int(this.modifiers.length);
         if(_loc1_ == 0)
         {
            return null;
         }
         return this.modifiers[int(Math.random() * _loc1_)];
      }
      
      public function §1t526s0§(param1:int) : int
      {
         var _loc2_:int = int(this.modifiers.length);
         var _loc3_:* = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.modifiers[_loc3_].§1t1212s0§() == param1)
            {
               return this.modifiers[_loc3_].§1t1213s0§();
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function §1t527s0§() : uint
      {
         return this.primaryColor;
      }
      
      public function §1t528s0§() : int
      {
         return this.secondaryColor;
      }
      
      public function §1t529s0§(param1:uint) : *
      {
         this.primaryColor = param1;
      }
      
      public function §1t530s0§(param1:int) : *
      {
         this.secondaryColor = param1;
      }
      
      public function §1t531s0§(param1:int = 1) : *
      {
         if(this.uses == 0)
         {
            return;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc2_ == null || _loc2_.durability == 0 || this.uses >= _loc2_.durability)
         {
            return;
         }
         this.uses += param1;
      }
      
      public function §1t532s0§(param1:int) : *
      {
         this.uses = param1;
      }
      
      public function §1t533s0§(param1:int) : *
      {
         if(this.uses == 0)
         {
            return;
         }
         this.uses -= param1;
         if(this.uses <= 0)
         {
            this.uses = 1;
         }
      }
      
      public function §1t534s0§() : *
      {
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc1_ == null)
         {
            return false;
         }
         if(_loc1_.durability == 0)
         {
            return false;
         }
         this.uses = _loc1_.durability + this.§1t523s0§(83);
      }
      
      public function §1t535s0§() : Boolean
      {
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc1_ == null)
         {
            return false;
         }
         if(_loc1_.durability == 0)
         {
            return false;
         }
         return this.uses >= _loc1_.durability + this.§1t523s0§(83);
      }
      
      public function §1t536s0§() : int
      {
         var _loc1_:int = 0;
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc2_ == null || _loc2_.durability == 0)
         {
            if(_loc2_.durability == 0 && this.uses > 0)
            {
               this.uses = 0;
            }
            return -1;
         }
         _loc1_ = _loc2_.durability + this.§1t523s0§(83);
         var _loc3_:int = (_loc1_ - this.uses) / _loc1_ * 100;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         return _loc3_;
      }
      
      public function §1t537s0§() : *
      {
         this.§1t475s0§ = true;
         this.§1t472s0§ = §1t8742s0§;
      }
      
      public function §1t538s0§() : Boolean
      {
         return this.§1t472s0§ == §1t8742s0§;
      }
      
      public function §1t539s0§() : Boolean
      {
         return this.§1t475s0§ && this.§1t472s0§ != §1t8742s0§;
      }
      
      public function §1t540s0§(param1:String) : *
      {
         var _loc2_:* = 0;
         if(this.§1t538s0§())
         {
            _loc2_ = int(this.modifiers.length - 1);
            while(_loc2_ >= 0)
            {
               if(this.modifiers[_loc2_].§1t1211s0§ == 85 || this.modifiers[_loc2_].§1t1211s0§ == 86 || this.modifiers[_loc2_].§1t1211s0§ == 87 || this.modifiers[_loc2_].§1t1211s0§ == 88)
               {
                  this.modifiers.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
         this.§1t475s0§ = true;
         this.§1t472s0§ = param1;
      }
      
      public function §1t541s0§(param1:String) : *
      {
         this.creator = param1;
         if(this.§1t475s0§ && this.§1t472s0§ == §1t8742s0§)
         {
            this.§1t475s0§ = false;
         }
      }
      
      public function §1t542s0§(param1:String) : *
      {
         this.§1t475s0§ = false;
         this.§1t472s0§ = param1;
      }
      
      public function §1t543s0§() : Boolean
      {
         if(this.§1t484s0§() > 1)
         {
            return true;
         }
         if(this.primaryColor != §1t8733s0§ || this.secondaryColor != §1t8733s0§)
         {
            return false;
         }
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         return _loc1_ < 3000 && !this.§1t544s0§(_loc1_) && !this.§1t500s0§() || §1t1524s0§.§1t9862s0§(_loc1_).unique == 0 && !this.§1t498s0§() && this.uses == 0 && !this.§1t475s0§;
      }
      
      internal function §1t544s0§(param1:int) : Boolean
      {
         return param1 == 2129 || §1t8746s0§(param1);
      }
      
      public function §1t545s0§() : int
      {
         var _loc1_:§1t104s0§ = null;
         if(this.weight != -1)
         {
            return (this.weight + this.§1t478s0§) * this.§1t484s0§();
         }
         _loc1_ = §1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§());
         if(_loc1_ != null)
         {
            this.weight = _loc1_.weight;
         }
         else
         {
            this.weight = 0;
         }
         return (this.weight + this.§1t478s0§) * this.§1t484s0§();
      }
      
      public function §1t546s0§() : int
      {
         if(this.§1t467s0§.§1t697s0§() < 3000)
         {
            return 1;
         }
         if(this.§1t545s0§() >= 10)
         {
            return (1 + this.§1t497s0§()) * 10;
         }
         return (1 + this.§1t497s0§()) * 5;
      }
      
      public function §1t547s0§() : Boolean
      {
         var _loc1_:int = this.§1t467s0§.§1t697s0§();
         return _loc1_ >= 3000 && !this.§1t502s0§() && §1t1524s0§.§1t9862s0§(_loc1_).unique == 0 && !this.§1t498s0§() && !this.§1t475s0§;
      }
      
      public function §1t548s0§(param1:int = 0) : *
      {
         var _loc2_:int = this.getLevel();
         if(this.xp == null)
         {
            this.xp = new §1t98s0§();
            this.§1t470s0§ = _loc2_;
         }
         this.xp.§1t695s0§(param1);
      }
      
      public function §1t549s0§() : Boolean
      {
         return this.xp != null;
      }
      
      public function §1t550s0§(param1:int) : Boolean
      {
         if(this.xp == null)
         {
            return false;
         }
         var _loc2_:int = this.§1t470s0§;
         if(_loc2_ == 0)
         {
            _loc2_ = this.getLevel();
         }
         if(_loc2_ >= §1t1523s0§.§1t9470s0§)
         {
            return false;
         }
         var _loc3_:int = §1t1523s0§.getLevel();
         if(_loc2_ > _loc3_)
         {
            return false;
         }
         this.xp.§1t698s0§(param1);
         var _loc4_:int = this.xp.§1t697s0§();
         var _loc5_:int = this.§1t551s0§(_loc2_);
         if(_loc4_ >= _loc5_)
         {
            if(_loc2_ == _loc3_)
            {
               this.xp.§1t695s0§(_loc5_);
               return false;
            }
            this.§1t470s0§ = _loc2_ + 1;
            this.xp.§1t695s0§(0);
            §1t1644s0§.instance.§1t1675s0§(this,this.§1t470s0§);
            this.§1t521s0§ = null;
            return true;
         }
         return false;
      }
      
      internal function §1t551s0§(param1:int) : int
      {
         var _loc2_:int = (§1t1523s0§.§1t5928s0§(param1 + 1) - §1t1523s0§.§1t5928s0§(param1)) / 3;
         if(_loc2_ > 10000)
         {
            return Math.floor(_loc2_ / 1000) * 1000;
         }
         if(_loc2_ > 1000)
         {
            return Math.floor(_loc2_ / 100) * 100;
         }
         return _loc2_;
      }
      
      public function §1t552s0§() : *
      {
         var _loc2_:§1t18s0§ = null;
         this.§1t521s0§ = null;
         this.xp.§1t695s0§(0);
         this.§1t470s0§ = 1;
         this.§1t478s0§ = 0;
         var _loc1_:int = int(this.modifiers.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.modifiers[_loc3_];
            _loc2_.value = 1;
            _loc3_++;
         }
      }
   }
}

