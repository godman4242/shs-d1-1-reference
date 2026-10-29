package
{
   public class §1t26s0§
   {
      
      public var id:int;
      
      private var §1t891s0§:int;
      
      private var §1t892s0§:int = -1;
      
      private var levelList:Vector.<§1t33s0§> = new Vector.<§1t33s0§>();
      
      public var towerreq:int = 0;
      
      public var §1t959s0§:int = 0;
      
      public var §1t960s0§:int = -1;
      
      public var §1t961s0§:int = -1;
      
      public var §1t919s0§:int = 1;
      
      public var §1t962s0§:int = 3;
      
      public var category:int = -1;
      
      public var order:int = -1;
      
      public var §1t965s0§:int = -1;
      
      public var bg:int = 0;
      
      public var §1t967s0§:Boolean = true;
      
      internal var §1t968s0§:int = -1;
      
      internal var §1t969s0§:int = -1;
      
      internal var §1t970s0§:int = -1;
      
      public function §1t26s0§(param1:XML)
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
         this.towerreq = param1.lvlreq;
         this.§1t959s0§ = param1.popreq;
         if(param1.slots.toString() != "")
         {
            this.§1t919s0§ = param1.slots;
         }
         if(param1.stat.toString() != "")
         {
            this.§1t960s0§ = param1.stat;
         }
         if(param1.train.toString() != "")
         {
            this.§1t961s0§ = param1.train;
         }
         if(param1.max.toString() != "")
         {
            this.§1t965s0§ = param1.max;
         }
         if(param1.nodestroy.toString() != "")
         {
            this.§1t967s0§ = false;
         }
         if(param1.bg.toString() != "")
         {
            this.bg = param1.bg;
         }
         var _loc2_:XMLList = XMLList(param1.level);
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.levelList.push(new §1t33s0§(_loc2_[_loc4_]));
            _loc4_++;
         }
         if(param1.maxslots.toString() != "")
         {
            this.§1t962s0§ = param1.maxslots;
         }
         if(param1.cat.toString() != "")
         {
            this.category = param1.cat;
         }
         if(param1.order.toString() != "")
         {
            this.order = param1.order;
         }
         if(param1.dicon.toString() != "")
         {
            this.§1t968s0§ = param1.dicon;
         }
         if(param1.gstat.toString() != "")
         {
            this.§1t969s0§ = param1.gstat;
         }
         if(param1.sstat.toString() != "")
         {
            this.§1t970s0§ = param1.sstat;
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
      
      public function getLevel(param1:int) : §1t33s0§
      {
         return this.levelList[param1];
      }
      
      public function §1t971s0§() : int
      {
         return this.levelList.length - 1;
      }
      
      public function §1t972s0§(param1:§1t24s0§) : Boolean
      {
         return this.§1t965s0§ == -1 || this.§1t965s0§ > param1.§1t627s0§(this.id);
      }
      
      public function §1t973s0§(param1:§1t24s0§) : Boolean
      {
         return this.§1t974s0§(0,param1);
      }
      
      public function §1t974s0§(param1:int, param2:§1t24s0§) : Boolean
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:§1t33s0§ = this.getLevel(param1);
         if(param1 == 0)
         {
            _loc6_ = _loc3_.§1t980s0§;
            _loc4_ = _loc6_ + _loc6_ / 4 * param2.§1t627s0§(this.id);
         }
         else
         {
            _loc4_ = _loc3_.§1t980s0§;
         }
         if(param2.§1t579s0§(§1t24s0§.§1t8748s0§) < _loc4_)
         {
            return false;
         }
         var _loc5_:int = 0;
         while(_loc5_ < §1t24s0§.§1t8754s0§)
         {
            if(_loc5_ != §1t24s0§.§1t8748s0§ && param2.§1t579s0§(_loc5_) < this.§1t976s0§(_loc5_,param1,param2))
            {
               return false;
            }
            _loc5_++;
         }
         if(param2.§1t577s0§() < _loc3_.§1t985s0§)
         {
            return false;
         }
         return true;
      }
      
      public function §1t975s0§() : int
      {
         return this.§1t969s0§ + 1;
      }
      
      public function §1t976s0§(param1:int, param2:int, param3:§1t24s0§) : int
      {
         var _loc5_:int = 0;
         var _loc4_:§1t33s0§ = this.levelList[param2];
         if(param1 == §1t24s0§.§1t8748s0§)
         {
            if(param2 == 0)
            {
               _loc5_ = _loc4_.§1t980s0§;
               return _loc5_ + _loc5_ / 4 * param3.§1t627s0§(this.id);
            }
            return _loc4_.§1t980s0§;
         }
         if(param1 == §1t24s0§.§1t8749s0§)
         {
            return _loc4_.§1t981s0§;
         }
         if(param1 == §1t24s0§.§1t8750s0§)
         {
            return _loc4_.§1t982s0§;
         }
         if(param1 == §1t24s0§.§1t8752s0§)
         {
            return _loc4_.§1t983s0§;
         }
         if(param1 == §1t24s0§.§1t8751s0§)
         {
            return _loc4_.§1t984s0§;
         }
         return 0;
      }
      
      public function §1t977s0§(param1:int) : Array
      {
         if(param1 > this.§1t971s0§())
         {
            return null;
         }
         return this.levelList[param1].§1t977s0§();
      }
      
      public function §1t595s0§(param1:int, param2:§1t24s0§) : *
      {
         var _loc3_:int = 0;
         while(_loc3_ < §1t24s0§.§1t8754s0§)
         {
            param2.§1t580s0§(_loc3_,-this.§1t976s0§(_loc3_,param1,param2));
            _loc3_++;
         }
      }
   }
}

