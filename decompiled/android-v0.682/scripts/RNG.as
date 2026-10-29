package
{
   public class RNG
   {
      
      internal static var instance:RNG;
      
      internal var randomSeed:Number;
      
      public function RNG(seed:int)
      {
         super();
         this.randomSeed = seed;
         if(this.randomSeed < 0)
         {
            this.randomSeed = -this.randomSeed;
         }
         this.rnd();
      }
      
      public static function getRandAfterXTimes(seed:int, time:int, num:int) : *
      {
         if(instance == null)
         {
            instance = new RNG(seed);
         }
         else
         {
            instance.setSeed(seed);
         }
         for(var i:int = 0; i < time; i++)
         {
            instance.rnd();
         }
         return instance.rand(num);
      }
      
      public static function random(num:int, seed:int) : *
      {
         if(instance == null)
         {
            instance = new RNG(seed);
         }
         else if(seed >= 0)
         {
            instance.setSeed(seed);
         }
         return instance.rand(num);
      }
      
      public function setSeed(num:Number) : *
      {
         this.randomSeed = num;
         if(this.randomSeed < 0)
         {
            this.randomSeed = -this.randomSeed;
         }
         this.rnd();
      }
      
      public function getSeed() : Number
      {
         return this.randomSeed;
      }
      
      public function rnd() : Number
      {
         this.randomSeed = (this.randomSeed * 9301 + 49297) % 233280;
         return this.randomSeed / 233280;
      }
      
      public function rand(num:int) : int
      {
         return Math.floor(this.rnd() * num);
      }
   }
}

