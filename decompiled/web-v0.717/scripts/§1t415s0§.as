package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol817")]
   public class §1t415s0§ extends MovieClip
   {
      
      public static var §1t12540s0§:int = 0;
      
      public static var §1t12541s0§:int = 1;
      
      public static var §1t12542s0§:int = 2;
      
      public var road:MovieClip;
      
      internal var §1t7993s0§:int = 0;
      
      internal var §1t7994s0§:int;
      
      internal var §1t1181s0§:int;
      
      public function §1t415s0§()
      {
         super();
         stop();
      }
      
      public function reset() : *
      {
         this.§1t7993s0§ = 0;
         this.§1t7994s0§ = 0;
         this.§1t1181s0§ = 0;
      }
      
      public function §1t7995s0§(param1:int, param2:int, param3:int) : *
      {
         if(param1 == §1t112s0§.§1t12551s0§ || param1 == §1t112s0§.§1t12547s0§)
         {
            this.§1t7993s0§ = §1t12541s0§;
         }
         else if(param1 == §1t112s0§.§1t12549s0§ || param1 == §1t112s0§.§1t12554s0§)
         {
            this.§1t7993s0§ = §1t12540s0§;
         }
         else if(param1 == §1t112s0§.§1t12548s0§ || param1 == §1t112s0§.§1t12563s0§)
         {
            this.§1t7993s0§ = §1t12542s0§;
         }
         this.§1t1181s0§ = param2;
         this.§1t7994s0§ = param3;
         gotoAndStop(this.§1t7993s0§ * 16 + param3);
         if(param3 == 0)
         {
            this.road.gotoAndStop(16);
         }
         else
         {
            this.road.gotoAndStop(param3);
         }
      }
      
      public function §1t7996s0§() : int
      {
         return this.§1t7993s0§;
      }
      
      public function §1t7872s0§() : int
      {
         return this.§1t7993s0§;
      }
      
      public function §1t1318s0§() : Boolean
      {
         return this.§1t1181s0§ == §1t70s0§.§1t9140s0§;
      }
      
      public function §1t1300s0§() : Boolean
      {
         return this.§1t1181s0§ == §1t70s0§.§1t9145s0§ || this.§1t1181s0§ == §1t70s0§.§1t9163s0§;
      }
      
      public function §1t1298s0§() : Boolean
      {
         return this.§1t1181s0§ == §1t70s0§.§1t9146s0§;
      }
      
      public function §1t7997s0§() : Array
      {
         return [this.§1t7994s0§ & 1,this.§1t7994s0§ >> 1 & 1,this.§1t7994s0§ >> 2 & 1,this.§1t7994s0§ >> 3 & 1];
      }
      
      public function §1t7998s0§() : int
      {
         return this.§1t7994s0§;
      }
   }
}

