package
{
   public class §1t27s0§
   {
      
      public var id:int;
      
      private var §1t891s0§:int = -1;
      
      private var §1t892s0§:int = -1;
      
      internal var rank:int = 0;
      
      private var §1t894s0§:Array;
      
      private var §1t895s0§:Array;
      
      internal var §1t896s0§:int = -1;
      
      private var §1t897s0§:int = 0;
      
      internal var §1t898s0§:int = 0;
      
      internal var §1t899s0§:int = 0;
      
      internal var §1t900s0§:int = 100;
      
      internal var reward:§1t413s0§;
      
      internal var §1t902s0§:int = -1;
      
      private var §1t903s0§:int = 0;
      
      internal var §1t904s0§:Boolean = true;
      
      public var startCondition:XMLList;
      
      public function §1t27s0§(param1:XML)
      {
         super();
         this.id = param1.id;
         if(param1.name.toString() != "")
         {
            this.§1t891s0§ = param1.name;
         }
         else
         {
            this.§1t891s0§ = 5001;
         }
         if(param1.desc.toString() != "")
         {
            this.§1t892s0§ = param1.desc;
         }
         this.rank = param1.rank;
         this.§1t896s0§ = param1.time;
         this.§1t900s0§ = param1.success;
         this.reward = new §1t413s0§(param1.reward);
         if(param1.lvl.toString() != "")
         {
            this.§1t903s0§ = param1.lvl;
         }
         this.§1t894s0§ = new Array(§1t24s0§.§1t8761s0§);
         this.§1t894s0§[§1t24s0§.§1t8755s0§] = 0;
         if(param1.fstat.toString() != "")
         {
            this.§1t894s0§[§1t24s0§.§1t8756s0§] = int(param1.fstat);
         }
         else
         {
            this.§1t894s0§[§1t24s0§.§1t8756s0§] = 0;
         }
         if(param1.astat.toString() != "")
         {
            this.§1t894s0§[§1t24s0§.§1t8757s0§] = int(param1.astat);
         }
         else
         {
            this.§1t894s0§[§1t24s0§.§1t8757s0§] = 0;
         }
         if(param1.mstat.toString() != "")
         {
            this.§1t894s0§[§1t24s0§.§1t8758s0§] = int(param1.mstat);
         }
         else
         {
            this.§1t894s0§[§1t24s0§.§1t8758s0§] = 0;
         }
         if(param1.sstat.toString() != "")
         {
            this.§1t894s0§[§1t24s0§.§1t8759s0§] = int(param1.sstat);
         }
         else
         {
            this.§1t894s0§[§1t24s0§.§1t8759s0§] = 0;
         }
         if(param1.nstat.toString() != "")
         {
            this.§1t894s0§[§1t24s0§.§1t8760s0§] = int(param1.nstat);
         }
         else
         {
            this.§1t894s0§[§1t24s0§.§1t8760s0§] = 0;
         }
         this.§1t895s0§ = new Array(§1t24s0§.§1t8754s0§);
         this.§1t895s0§[§1t24s0§.§1t8747s0§] = 0;
         this.§1t895s0§[§1t24s0§.§1t8753s0§] = 0;
         if(param1.freq.toString() != "")
         {
            this.§1t895s0§[§1t24s0§.§1t8749s0§] = int(param1.freq);
         }
         else
         {
            this.§1t895s0§[§1t24s0§.§1t8749s0§] = 0;
         }
         if(param1.wreq.toString() != "")
         {
            this.§1t895s0§[§1t24s0§.§1t8750s0§] = int(param1.wreq);
         }
         else
         {
            this.§1t895s0§[§1t24s0§.§1t8750s0§] = 0;
         }
         if(param1.mreq.toString() != "")
         {
            this.§1t895s0§[§1t24s0§.§1t8752s0§] = int(param1.mreq);
         }
         else
         {
            this.§1t895s0§[§1t24s0§.§1t8752s0§] = 0;
         }
         if(param1.creq.toString() != "")
         {
            this.§1t895s0§[§1t24s0§.§1t8751s0§] = int(param1.creq);
         }
         else
         {
            this.§1t895s0§[§1t24s0§.§1t8751s0§] = 0;
         }
         if(param1.cost.toString() != "")
         {
            this.§1t895s0§[§1t24s0§.§1t8748s0§] = int(param1.cost);
         }
         else
         {
            this.§1t895s0§[§1t24s0§.§1t8748s0§] = 0;
         }
         if(param1.dmg.toString() != "")
         {
            this.§1t897s0§ = param1.dmg;
         }
         if(param1.dtimes.toString() != "")
         {
            this.§1t898s0§ = param1.dtimes;
         }
         if(param1.drisk.toString() != "")
         {
            this.§1t899s0§ = param1.drisk;
         }
         if(param1.pmax.toString() != "")
         {
            this.§1t902s0§ = param1.pmax;
         }
         if(param1.repeat.toString() != "")
         {
            this.§1t904s0§ = param1.repeat.toString() != "0";
         }
         if(param1.startCondition.toString() != "")
         {
            this.startCondition = XMLList(param1.startCondition).copy();
         }
      }
      
      public function §1t509s0§() : String
      {
         return §1t1521s0§.getString(this.§1t891s0§);
      }
      
      public function §1t514s0§() : String
      {
         if(this.§1t892s0§ == -1)
         {
            return "";
         }
         return §1t1521s0§.getString(this.§1t892s0§);
      }
      
      public function §1t887s0§(param1:Array) : int
      {
         var _loc2_:int = this.§1t900s0§;
         var _loc3_:int = 0;
         while(_loc3_ < §1t24s0§.§1t8761s0§)
         {
            if(this.§1t894s0§[_loc3_] > 0)
            {
               if(param1[_loc3_] > this.§1t894s0§[_loc3_])
               {
                  _loc2_ += 1;
               }
               else if(param1[_loc3_] < this.§1t894s0§[_loc3_])
               {
                  return 0;
               }
            }
            _loc3_++;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ > 100)
         {
            _loc2_ = 100;
         }
         return _loc2_;
      }
      
      public function §1t906s0§() : String
      {
         var _loc1_:int = this.§1t898s0§ * this.§1t899s0§;
         if(_loc1_ >= 100)
         {
            return §1t1521s0§.getString(22049);
         }
         if(_loc1_ >= 75)
         {
            return §1t1521s0§.getString(22050);
         }
         if(_loc1_ >= 50)
         {
            return §1t1521s0§.getString(22051);
         }
         if(_loc1_ > 0)
         {
            return §1t1521s0§.getString(22052);
         }
         return §1t1521s0§.getString(22053);
      }
      
      public function §1t907s0§(param1:Array, param2:int, param3:§1t24s0§) : Boolean
      {
         var _loc4_:int = 0;
         if(param2 == 0)
         {
            return false;
         }
         if(this.§1t902s0§ != -1 && this.§1t902s0§ != param2)
         {
            return false;
         }
         _loc4_ = 0;
         while(_loc4_ < §1t24s0§.§1t8761s0§)
         {
            if(param1[_loc4_] < this.§1t894s0§[_loc4_])
            {
               return false;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < §1t24s0§.§1t8754s0§)
         {
            if(param3.§1t579s0§(_loc4_) < this.§1t895s0§[_loc4_])
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      public function §1t885s0§(param1:int) : int
      {
         return this.§1t894s0§[param1];
      }
      
      public function §1t908s0§(param1:int) : int
      {
         return this.§1t895s0§[param1];
      }
      
      public function §1t909s0§() : Boolean
      {
         return !this.§1t904s0§;
      }
      
      public function §1t910s0§(param1:int) : int
      {
         param1 += this.id;
         if(this.§1t903s0§ != 0)
         {
            return this.§1t903s0§;
         }
         if(this.rank == 10)
         {
            return 80;
         }
         return (this.rank - 2) * 10 + §1t58s0§.random(20,param1) + 1;
      }
      
      public function §1t911s0§(param1:int) : int
      {
         if(this.§1t897s0§ != 0)
         {
            return this.§1t897s0§;
         }
         return this.§1t910s0§(param1) * 10;
      }
      
      public function §1t912s0§(param1:int) : int
      {
         var _loc2_:int = 0;
         if(this.§1t903s0§ != 0)
         {
            return this.reward.§1t912s0§();
         }
         _loc2_ = this.§1t910s0§(param1);
         return (§1t1523s0§.§1t5928s0§(_loc2_ + 1) - §1t1523s0§.§1t5928s0§(_loc2_)) / ((_loc2_ + 1) * 1.2);
      }
   }
}

