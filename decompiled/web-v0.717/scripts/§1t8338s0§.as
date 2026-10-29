package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2602")]
   public class §1t8338s0§ extends §1t128s0§
   {
      
      public function §1t8338s0§()
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
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(0,0,§1t67s0§.§1t9118s0§,-1,param3 * 1.5);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         if(visible)
         {
            if(§1t3255s0§())
            {
               §1t1543s0§.§1t3274s0§(this,§1t8103s0§,600);
            }
            else
            {
               §1t1543s0§.§1t10232s0§(this,§1t8103s0§,600);
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

