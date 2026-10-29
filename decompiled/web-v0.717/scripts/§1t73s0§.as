package
{
   public class §1t73s0§
   {
      
      public var name:int = 2002;
      
      public var npcID:int = 104;
      
      public var §1t836s0§:int = 2003;
      
      public var §1t837s0§:Vector.<§1t61s0§> = new Vector.<§1t61s0§>();
      
      public var §1t838s0§:Vector.<§1t61s0§> = new Vector.<§1t61s0§>();
      
      public function §1t73s0§(param1:XMLList)
      {
         super();
         if(!param1.hasOwnProperty("id"))
         {
            return;
         }
         this.name = int(param1.name);
         this.npcID = param1.npc;
         if(param1.welcome.toString() != "")
         {
            this.§1t836s0§ = param1.welcome;
         }
         var _loc2_:int = int(param1.sell.length());
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§1t837s0§.push(new §1t61s0§(param1.sell[_loc3_]));
            _loc3_++;
         }
         _loc2_ = int(param1.buy.length());
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.§1t838s0§.push(new §1t61s0§(param1.buy[_loc3_]));
            _loc3_++;
         }
      }
      
      public function §1t839s0§(param1:§1t58s0§) : *
      {
         var _loc7_:§1t61s0§ = null;
         this.npcID = 104;
         this.name = 2002;
         var _loc2_:Array = [13100,2119,2120,2501,2204,2202,2218,2210];
         var _loc3_:Array = [2115,2116,2117,2118,2140,2141,3000,3001,4037,4018,4019,11004,11012,11013,11016,11033,11018,11019,12001,12003,12004,12005,12010,13022];
         var _loc4_:int = _loc3_.length - (10 + _loc2_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_.splice(param1.rand(_loc3_.length),1);
            _loc5_++;
         }
         _loc2_ = _loc2_.concat(_loc3_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc7_ = new §1t61s0§(new XML());
            _loc7_.§1t853s0§(_loc2_[_loc6_]);
            _loc7_.§1t532s0§(1);
            this.§1t837s0§.push(_loc7_);
            _loc6_++;
         }
      }
      
      public function §1t840s0§(param1:§1t58s0§) : *
      {
         var _loc7_:§1t61s0§ = null;
         this.npcID = 148;
         this.name = 148;
         var _loc2_:Array = [2103,2104,2105,2216,2106,2107,2108];
         var _loc3_:Array = [2109,2110,2111,2112,2113,2114];
         var _loc4_:int = 3;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_.splice(param1.rand(_loc3_.length),1);
            _loc5_++;
         }
         _loc2_ = _loc2_.concat(_loc3_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc7_ = new §1t61s0§(new XML());
            _loc7_.§1t853s0§(_loc2_[_loc6_]);
            this.§1t837s0§.push(_loc7_);
            _loc6_++;
         }
      }
      
      public function §1t841s0§() : *
      {
         var _loc3_:§1t61s0§ = null;
         this.npcID = 52;
         this.name = 2012;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = new §1t61s0§(new XML());
            _loc3_.§1t853s0§(_loc1_[_loc2_]);
            this.§1t837s0§.push(_loc3_);
            _loc2_++;
         }
      }
      
      public function §1t842s0§() : *
      {
         var _loc9_:§1t61s0§ = null;
         var _loc10_:* = 0;
         var _loc1_:int = §1t3317s0§.instance.§1t1848s0§();
         §1t1644s0§.instance.§1t1658s0§(_loc1_ * Math.floor(§1t3317s0§.instance.§1t1847s0§() / (60 * 60)));
         var _loc2_:Array = §1t1524s0§.§1t9784s0§;
         var _loc3_:Array = §1t1524s0§.§1t9785s0§;
         var _loc4_:Array = §1t1524s0§.§1t9786s0§;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc9_ = new §1t61s0§(new XML());
            _loc9_.§1t853s0§(_loc2_[_loc5_]);
            if(!(_loc2_[_loc5_] == 2212 && (§1t1523s0§.§1t9553s0§() < 9 || §1t1523s0§.§1t9714s0§(2212) > 0 || §1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()) && §1t1523s0§.§1t9653s0§())))
            {
               if(!(_loc2_[_loc5_] == 2215 && !(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()) && §1t1523s0§.§1t9653s0§())))
               {
                  if(!(_loc2_[_loc5_] == 2213 && !§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§())))
                  {
                     this.§1t837s0§.push(_loc9_);
                  }
               }
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc9_ = new §1t61s0§(new XML());
            _loc9_.§1t853s0§(_loc3_[_loc5_],true);
            this.§1t837s0§.push(_loc9_);
            _loc5_++;
         }
         var _loc6_:int = _loc1_ * Math.floor(§1t3317s0§.instance.§1t1847s0§() / (60 * 60));
         var _loc7_:int = §1t58s0§.random(_loc4_.length,_loc6_);
         var _loc8_:Array = _loc4_[_loc7_];
         _loc5_ = 0;
         while(_loc5_ < _loc8_.length)
         {
            _loc9_ = new §1t61s0§(new XML());
            _loc9_.§1t853s0§(_loc8_[_loc5_],true);
            this.§1t837s0§.push(_loc9_);
            _loc5_++;
         }
         if(_loc3_.length == 0)
         {
            _loc10_ = §1t58s0§.random(_loc4_.length,_loc6_ * 15);
            if(_loc7_ == _loc10_)
            {
               if(_loc10_ == 0)
               {
                  _loc10_++;
               }
               else
               {
                  _loc10_--;
               }
            }
            _loc8_ = _loc4_[_loc10_];
            _loc5_ = 0;
            while(_loc5_ < _loc8_.length)
            {
               _loc9_ = new §1t61s0§(new XML());
               _loc9_.§1t853s0§(_loc8_[_loc5_],true);
               this.§1t837s0§.push(_loc9_);
               _loc5_++;
            }
         }
      }
      
      public function §1t843s0§(param1:int = 0) : *
      {
         var _loc5_:int = 0;
         var _loc6_:§1t61s0§ = null;
         var _loc10_:* = 0;
         var _loc2_:int = §1t3317s0§.instance.§1t1848s0§() + param1;
         §1t1644s0§.instance.§1t1658s0§(_loc2_ * Math.floor(§1t3317s0§.instance.§1t1847s0§() / (60 * 60)));
         var _loc3_:Array = §1t1524s0§.§1t9785s0§;
         var _loc4_:Array = §1t1524s0§.§1t9786s0§;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = new §1t61s0§(new XML());
            _loc6_.§1t853s0§(_loc3_[_loc5_],true);
            this.§1t837s0§.push(_loc6_);
            _loc5_++;
         }
         var _loc7_:int = _loc2_ * Math.floor(§1t3317s0§.instance.§1t1847s0§() / (60 * 60));
         var _loc8_:int = §1t58s0§.random(_loc4_.length,_loc7_);
         var _loc9_:Array = _loc4_[_loc8_];
         _loc5_ = 0;
         while(_loc5_ < _loc9_.length)
         {
            _loc6_ = new §1t61s0§(new XML());
            _loc6_.§1t853s0§(_loc9_[_loc5_],true);
            this.§1t837s0§.push(_loc6_);
            _loc5_++;
         }
         if(_loc3_.length == 0)
         {
            _loc10_ = §1t58s0§.random(_loc4_.length,_loc7_ * 15);
            if(_loc8_ == _loc10_)
            {
               if(_loc10_ == 0)
               {
                  _loc10_++;
               }
               else
               {
                  _loc10_--;
               }
            }
            _loc9_ = _loc4_[_loc10_];
            _loc5_ = 0;
            while(_loc5_ < _loc9_.length)
            {
               _loc6_ = new §1t61s0§(new XML());
               _loc6_.§1t853s0§(_loc9_[_loc5_],true);
               this.§1t837s0§.push(_loc6_);
               _loc5_++;
            }
         }
      }
      
      public function §1t844s0§(param1:§1t58s0§) : *
      {
         var _loc6_:§1t61s0§ = null;
         this.npcID = 52;
         this.name = 5062;
         var _loc2_:Array = [2205,6019,6020,6007,6009,6006,6010,6011,6013,6008,6014,6015,6017,6018,6002,6003,6004,6001,6012,6005,6021,6023,6024,6026,6034,6044,6043,6039,6040,6041,6042,6043,6035,6036,6037,8005,8006,8004,8500,8502,8503,8007,8003,7037,7038,7049,8012,8014,8501];
         var _loc3_:int = _loc2_.length - 16;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.splice(param1.rand(_loc2_.length),1);
            _loc4_++;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc6_ = new §1t61s0§(new XML());
            _loc6_.§1t853s0§(_loc2_[_loc5_]);
            this.§1t837s0§.push(_loc6_);
            _loc5_++;
         }
      }
   }
}

