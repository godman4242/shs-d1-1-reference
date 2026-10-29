package
{
   public class §1t413s0§
   {
      
      public var loot:Vector.<§1t63s0§> = new Vector.<§1t63s0§>();
      
      public var forShow:Boolean = false;
      
      internal var exp:int = 0;
      
      private var §1t991s0§:Array;
      
      public function §1t413s0§(param1:XMLList)
      {
         super();
         this.§1t991s0§ = new Array(§1t24s0§.§1t8754s0§);
         if(param1 == null)
         {
            return;
         }
         if(param1.exp.toString() != "")
         {
            this.exp = param1.exp;
         }
         if(param1.food.toString() != "")
         {
            this.§1t991s0§[§1t24s0§.§1t8749s0§] = int(param1.food);
         }
         else
         {
            this.§1t991s0§[§1t24s0§.§1t8749s0§] = 0;
         }
         if(param1.wood.toString() != "")
         {
            this.§1t991s0§[§1t24s0§.§1t8750s0§] = int(param1.wood);
         }
         else
         {
            this.§1t991s0§[§1t24s0§.§1t8750s0§] = 0;
         }
         if(param1.metal.toString() != "")
         {
            this.§1t991s0§[§1t24s0§.§1t8752s0§] = int(param1.metal);
         }
         else
         {
            this.§1t991s0§[§1t24s0§.§1t8752s0§] = 0;
         }
         if(param1.cloth.toString() != "")
         {
            this.§1t991s0§[§1t24s0§.§1t8751s0§] = int(param1.cloth);
         }
         else
         {
            this.§1t991s0§[§1t24s0§.§1t8751s0§] = 0;
         }
         if(param1.coin.toString() != "")
         {
            this.§1t991s0§[§1t24s0§.§1t8748s0§] = int(param1.coin);
         }
         else
         {
            this.§1t991s0§[§1t24s0§.§1t8748s0§] = 0;
         }
         if(param1.npc.toString() != "")
         {
            this.§1t991s0§[§1t24s0§.§1t8747s0§] = int(param1.npc);
         }
         else
         {
            this.§1t991s0§[§1t24s0§.§1t8747s0§] = 0;
         }
         if(param1.item.toString() != "")
         {
            this.§1t991s0§[§1t24s0§.§1t8753s0§] = int(param1.item);
         }
         else
         {
            this.§1t991s0§[§1t24s0§.§1t8753s0§] = 0;
         }
         if(param1.forshow.toString() == "1")
         {
            this.forShow = true;
         }
         var _loc2_:int = int(param1.loot.length());
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.loot.push(new §1t63s0§(param1.loot[_loc3_]));
            _loc3_++;
         }
      }
      
      public function §1t992s0§(param1:int) : int
      {
         return this.§1t991s0§[param1];
      }
      
      public function §1t912s0§() : int
      {
         return this.exp;
      }
      
      public function §1t993s0§(param1:Array) : *
      {
         this.§1t991s0§[§1t24s0§.§1t8749s0§] = param1[0];
         this.§1t991s0§[§1t24s0§.§1t8750s0§] = param1[1];
         this.§1t991s0§[§1t24s0§.§1t8751s0§] = param1[2];
         this.§1t991s0§[§1t24s0§.§1t8752s0§] = param1[3];
      }
      
      public function §1t994s0§(param1:int) : *
      {
         this.§1t991s0§[§1t24s0§.§1t8748s0§] = param1;
      }
      
      public function §1t995s0§(param1:int, param2:int) : *
      {
         this.§1t991s0§[param1] = param2;
      }
      
      public function §1t996s0§() : Vector.<§1t63s0§>
      {
         return this.loot;
      }
      
      public function §1t997s0§() : Vector.<§1t17s0§>
      {
         var _loc3_:§1t63s0§ = null;
         var _loc4_:§1t17s0§ = null;
         var _loc1_:Vector.<§1t17s0§> = new Vector.<§1t17s0§>();
         var _loc2_:int = int(this.loot.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = this.loot[_loc5_];
            _loc4_ = new §1t17s0§(_loc3_.§1t760s0§(),_loc3_.getQty());
            _loc1_.push(_loc4_);
            _loc5_++;
         }
         return _loc1_;
      }
   }
}

