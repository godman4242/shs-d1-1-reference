package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2253")]
   public class §1t8402s0§ extends §1t128s0§
   {
      
      public function §1t8402s0§()
      {
         super();
         addFrameScript(49,this.frame50);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         if(param4 == 1)
         {
            param3 = 50;
         }
         else if(param4 == 2)
         {
            param3 = 100;
         }
         else if(param4 == 3)
         {
            param3 = 150;
         }
         visible = true;
         §1t8100s0§ = true;
         this.owner = param5;
      }
      
      override public function update() : *
      {
      }
      
      override internal function §1t8113s0§() : *
      {
         stop();
         §1t8100s0§ = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
      
      internal function frame50() : *
      {
         this.§1t8113s0§();
      }
   }
}

