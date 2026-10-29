package
{
   import playerio.§1t23s0§;
   
   public class §1t132s0§
   {
      
      public static var instance:§1t132s0§;
      
      public static const §1t11336s0§:int = 100;
      
      internal var §1t1713s0§:§1t855s0§;
      
      internal var §1t1714s0§:§1t23s0§;
      
      public function §1t132s0§()
      {
         super();
         this.§1t1713s0§ = new §1t855s0§(§1t147s0§,0,0,50,"reset",false,false);
      }
      
      public static function §1t9190s0§() : §1t132s0§
      {
         if(instance == null)
         {
            instance = new §1t132s0§();
         }
         return instance;
      }
      
      public function §1t1715s0§(param1:§1t23s0§) : *
      {
         this.§1t1714s0§ = param1;
         var _loc2_:int = §1t1525s0§.§1t9935s0§();
         var _loc3_:int = §1t1525s0§.§1t7341s0§();
         §1t1523s0§.§1t9712s0§(30021,_loc2_);
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         §1t1525s0§.§1t9922s0§(1,50,§1t11336s0§);
         §1t1523s0§.§1t9763s0§(_loc2_,_loc3_);
      }
      
      public function §1t1148s0§() : Array
      {
         var _loc3_:§1t147s0§ = null;
         if(this.§1t1714s0§ == null)
         {
            return null;
         }
         var _loc1_:§1t24s0§ = §1t24s0§.§1t8785s0§(this.§1t1714s0§);
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(int(Math.random() * 1000));
         var _loc4_:Array = new Array();
         var _loc5_:int = 1;
         _loc3_ = this.§1t1713s0§.§1t866s0§();
         var _loc6_:int = 2;
         var _loc7_:int = 1;
         _loc3_.init(0,1,_loc6_,_loc7_);
         _loc4_[_loc5_] = _loc3_;
         _loc4_[_loc5_].§1t1755s0§(§1t147s0§.§1t11372s0§);
         _loc4_[_loc5_].§1t1765s0§(0,50,"-3,0","signpost");
         _loc4_[_loc5_].roomName = _loc1_.§1t578s0§();
         var _loc8_:int = int(_loc4_.length);
         var _loc9_:Array = new Array();
         var _loc10_:int = 1;
         while(_loc10_ < _loc8_)
         {
            _loc3_ = _loc4_[_loc10_];
            _loc3_.§1t1785s0§();
            _loc9_[_loc10_] = _loc3_.output();
            this.§1t1713s0§.§1t867s0§(_loc3_);
            _loc10_++;
         }
         _loc2_.destroy();
         return _loc9_;
      }
      
      public function §1t1716s0§() : *
      {
         §1t1540s0§.§1t10036s0§();
         §1t406s0§.instance.§1t6527s0§("Player does not own a house.",§1t1521s0§.getString(5));
      }
   }
}

