package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2562")]
   public class §1t8343s0§ extends §1t128s0§
   {
      
      public function §1t8343s0§()
      {
         super();
         addFrameScript(25,this.frame26);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         visible = true;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         this.velX = param1;
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(0,0,§1t67s0§.§1t9118s0§,-1,0,param3 * 1.5);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         if(visible)
         {
            x += velX;
            if(§1t3255s0§())
            {
               §1t1543s0§.§1t3274s0§(this,§1t8103s0§,400);
            }
            else
            {
               §1t1543s0§.§1t10232s0§(this,§1t8103s0§,400);
            }
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         stop();
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
      
      internal function frame26() : *
      {
         stop();
         this.§1t8113s0§();
      }
   }
}

