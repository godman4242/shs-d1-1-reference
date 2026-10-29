package
{
   public class §1t58s0§
   {
      
      internal static var instance:§1t58s0§;
      
      internal static var §1t8803s0§:§1t855s0§ = new §1t855s0§(§1t58s0§,0,0,3);
      
      internal var randomSeed:Number;
      
      public function §1t58s0§(param1:int = 0)
      {
         super();
         this.randomSeed = param1;
         if(this.randomSeed < 0)
         {
            this.randomSeed = -this.randomSeed;
         }
         this.rnd();
      }
      
      public static function §1t8804s0§(param1:int) : §1t58s0§
      {
         var _loc2_:§1t58s0§ = §1t8803s0§.§1t866s0§();
         _loc2_.§1t779s0§(param1);
         return _loc2_;
      }
      
      public static function §1t8805s0§(param1:§1t58s0§) : *
      {
         §1t8803s0§.§1t867s0§(param1);
      }
      
      public static function §1t8806s0§(param1:int, param2:int, param3:int) : *
      {
         if(instance == null)
         {
            instance = new §1t58s0§(param1);
         }
         else
         {
            instance.§1t779s0§(param1);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            instance.rnd();
            _loc4_++;
         }
         return instance.rand(param3);
      }
      
      public static function random(param1:int, param2:int) : int
      {
         if(instance == null)
         {
            instance = new §1t58s0§(param2);
         }
         else if(param2 >= 0)
         {
            instance.§1t779s0§(param2);
         }
         return instance.rand(param1);
      }
      
      public function §1t779s0§(param1:Number) : *
      {
         this.randomSeed = param1;
         if(this.randomSeed < 0)
         {
            this.randomSeed = -this.randomSeed;
         }
         this.rnd();
      }
      
      public function §1t780s0§() : Number
      {
         return this.randomSeed;
      }
      
      public function rnd() : Number
      {
         this.randomSeed = (this.randomSeed * 9301 + 49297) % 233280;
         return this.randomSeed / 233280;
      }
      
      public function rand(param1:int) : int
      {
         return Math.floor(this.rnd() * param1);
      }
      
      public function destroy() : *
      {
         §1t58s0§.§1t8805s0§(this);
      }
   }
}

