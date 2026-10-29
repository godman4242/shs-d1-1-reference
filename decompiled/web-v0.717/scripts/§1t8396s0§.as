package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2273")]
   public class §1t8396s0§ extends §1t128s0§
   {
      
      public function §1t8396s0§()
      {
         super();
      }
      
      public function §1t8397s0§() : *
      {
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         if(param4 == 1)
         {
            §1t8101s0§ = 24 * 3;
         }
         else if(param4 == 2)
         {
            §1t8101s0§ = 24 * 4;
         }
         else if(param4 == 3)
         {
            §1t8101s0§ = 24 * 5;
         }
         ttl = §1t8101s0§;
         alpha = 0;
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
      }
      
      override public function update() : *
      {
         --ttl;
         if(ttl <= 0)
         {
            this.§1t8113s0§();
         }
         else if(ttl >= §1t8101s0§ - 5)
         {
            alpha = (§1t8101s0§ - ttl) / 5;
         }
         else if(ttl < 5)
         {
            alpha = ttl / 5;
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
   }
}

