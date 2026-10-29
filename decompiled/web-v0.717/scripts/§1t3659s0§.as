package
{
   import flash.display.MovieClip;
   
   public class §1t3659s0§ extends §1t158s0§
   {
      
      public static var typeCode:int = 0;
      
      public function §1t3659s0§(param1:MovieClip, param2:MovieClip, param3:§1t157s0§, param4:int, param5:int, param6:int)
      {
         super();
         this.canvas = param2;
         this.§1t2245s0§ = param4;
         this.§1t2246s0§ = param5;
         this.§1t2247s0§ = param6;
         this.§1t2234s0§ = param1;
         §1t2235s0§ = 20;
         §1t2236s0§ = 0;
         §1t2237s0§ = 0;
         §1t2238s0§ = 0;
         §1t2239s0§ = 10;
         §1t2240s0§ = 6;
         §1t2241s0§ = 2;
         §1t2242s0§ = 0.6;
         §1t2243s0§ = 24;
         this.§1t2244s0§ = param3;
      }
      
      override public function §1t2254s0§() : §1t153s0§
      {
         var _loc1_:§1t153s0§ = §1t2731s0§.getBloodParticle();
         if(_loc1_ != null)
         {
            _loc1_.init(§1t2236s0§,§1t2237s0§,§1t2238s0§,§1t2239s0§,§1t2240s0§,§1t2241s0§,§1t2243s0§,§1t2242s0§);
            canvas.addChild(_loc1_.getBitmap());
            §1t2244s0§.§1t2291s0§(_loc1_);
         }
         return _loc1_;
      }
   }
}

