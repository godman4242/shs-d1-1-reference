package
{
   public class §1t61s0§
   {
      
      public var id:int;
      
      public var item:§1t17s0§;
      
      public var §1t846s0§:§1t98s0§ = new §1t98s0§();
      
      public var §1t847s0§:§1t98s0§ = new §1t98s0§();
      
      public var desc:String;
      
      public var text:String;
      
      public function §1t61s0§(param1:XML)
      {
         super();
         if(!param1.hasOwnProperty("id"))
         {
            return;
         }
         this.id = param1.id;
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.id);
         if(param1.value.toString() == "")
         {
            this.§1t846s0§.§1t695s0§(_loc2_.§1t1210s0§());
         }
         else
         {
            this.§1t846s0§.§1t695s0§(param1.value);
         }
         this.§1t847s0§.§1t695s0§(_loc2_.§1t854s0§());
         this.text = param1.text;
         this.desc = §1t1521s0§.getString(_loc2_.§1t892s0§);
      }
      
      public static function create(param1:int = 0, param2:int = 1, param3:String = "", param4:String = "") : §1t61s0§
      {
         var _loc5_:String = "<buy><id>" + param1 + "</id><value>" + param2 + "</value><desc>" + param3 + "</desc><text>" + param4 + "</text></buy>";
         return new §1t61s0§(new XML(_loc5_));
      }
      
      public function §1t849s0§() : *
      {
         if(this.item == null)
         {
            this.item = new §1t17s0§(this.id,1);
         }
      }
      
      public function §1t850s0§(param1:§1t58s0§) : *
      {
         var _loc2_:int = 0;
         var _loc3_:§1t104s0§ = null;
         if(this.item == null)
         {
            this.item = §1t406s0§.instance.§1t6488s0§.§1t6197s0§(§1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()),param1);
            this.item.uses = 1;
            _loc2_ = this.item.§1t483s0§();
            _loc3_ = §1t1524s0§.§1t9862s0§(_loc2_);
            this.id = _loc2_;
            this.§1t847s0§.§1t695s0§(0);
            this.§1t846s0§.§1t695s0§(_loc3_.§1t1210s0§() + this.item.getLevel() * 100);
            this.text = "";
            this.desc = §1t1521s0§.getString(_loc3_.§1t892s0§);
         }
      }
      
      public function §1t851s0§(param1:§1t58s0§) : *
      {
         var _loc2_:int = 0;
         var _loc3_:§1t104s0§ = null;
         if(this.item == null)
         {
            this.item = §1t406s0§.instance.§1t6488s0§.§1t6198s0§(§1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()),param1);
            this.item.uses = 1;
            _loc2_ = this.item.§1t483s0§();
            _loc3_ = §1t1524s0§.§1t9862s0§(_loc2_);
            this.id = _loc2_;
            this.§1t847s0§.§1t695s0§(0);
            this.§1t846s0§.§1t695s0§(_loc3_.§1t1210s0§() + this.item.getLevel() * 100);
            this.text = "";
            this.desc = §1t1521s0§.getString(_loc3_.§1t892s0§);
         }
      }
      
      public function §1t852s0§(param1:§1t58s0§) : *
      {
         var _loc2_:int = 0;
         var _loc3_:§1t104s0§ = null;
         if(this.item == null)
         {
            this.item = §1t406s0§.instance.§1t6488s0§.§1t6200s0§(§1t1523s0§.getLevel(),param1);
            _loc2_ = this.item.§1t483s0§();
            _loc3_ = §1t1524s0§.§1t9862s0§(_loc2_);
            this.id = _loc2_;
            this.§1t847s0§.§1t695s0§(5);
            this.§1t846s0§.§1t695s0§(0);
            this.text = "";
            this.desc = §1t1521s0§.getString(_loc3_.§1t892s0§);
         }
      }
      
      public function §1t853s0§(param1:int, param2:Boolean = false) : *
      {
         var _loc3_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         if(_loc3_ == null)
         {
            this.id = 0;
            this.§1t847s0§.§1t695s0§(0);
            this.§1t846s0§.§1t695s0§(0);
            this.text = "";
            this.desc = "Error";
            return;
         }
         this.id = param1;
         this.§1t847s0§.§1t695s0§(_loc3_.§1t854s0§());
         this.§1t846s0§.§1t695s0§(_loc3_.§1t1210s0§());
         this.text = "";
         this.desc = §1t1521s0§.getString(_loc3_.§1t892s0§);
         if(param2)
         {
            this.item = §1t1644s0§.instance.§1t1665s0§(param1,§1t1523s0§.getLevel(),true,true,true);
         }
         else if(param1 == 2129)
         {
            this.item = new §1t17s0§(param1,1);
            this.item.§1t493s0§(102,§1t1525s0§.§1t9935s0§());
         }
         else if(param1 == 2213 || param1 == 2214)
         {
            this.item = new §1t17s0§(param1,1);
            this.item.§1t493s0§(§1t1523s0§.§1t9422s0§,§1t1523s0§.§1t7746s0§());
            this.item.§1t542s0§(§1t1523s0§.§1t9654s0§());
         }
      }
      
      public function §1t532s0§(param1:int) : *
      {
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.id);
         if(_loc2_ != null)
         {
            if(_loc2_.durability > 0)
            {
               if(this.item == null)
               {
                  this.§1t849s0§();
               }
               this.item.uses = param1;
            }
         }
      }
      
      public function §1t761s0§() : int
      {
         return this.§1t846s0§.§1t697s0§();
      }
      
      public function §1t854s0§() : int
      {
         return this.§1t847s0§.§1t697s0§();
      }
   }
}

