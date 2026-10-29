package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2406")]
   public class §1t8363s0§ extends §1t128s0§
   {
      
      internal var skilllvl:int;
      
      public function §1t8363s0§()
      {
         super();
         addFrameScript(1,this.frame2);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         visible = true;
         §1t8100s0§ = true;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(0,0,§1t67s0§.§1t9122s0§);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
         §1t8103s0§.§1t1086s0§(24 * 2);
         this.skilllvl = param4;
      }
      
      override public function update() : *
      {
         if(§1t3255s0§())
         {
            §1t1543s0§.§1t3274s0§(this,§1t8103s0§,200);
         }
         else if(§1t1543s0§.§1t10232s0§(this,§1t8103s0§,200))
         {
            §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11306s0§,0,0,0,0,0,this.skilllvl,owner);
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         stop();
         §1t8100s0§ = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
      
      internal function frame2() : *
      {
         this.§1t8113s0§();
      }
   }
}

