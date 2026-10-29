package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3020")]
   public class §1t8390s0§ extends §1t128s0§
   {
      
      public function §1t8390s0§()
      {
         super();
         addFrameScript(11,this.frame12,34,this.frame35);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         if(param4 == 1)
         {
            param3 = 5;
            ttl = 24 * 2;
         }
         else if(param4 == 2)
         {
            param3 = 10;
            ttl = 24 * 3;
         }
         else if(param4 == 3)
         {
            param3 = 15;
            ttl = 24 * 4;
         }
         visible = true;
         §1t8100s0§ = true;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(param3,0,§1t67s0§.§1t9117s0§);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         if(§1t8100s0§)
         {
            if(§1t3255s0§())
            {
               §1t1543s0§.§1t3274s0§(this,§1t8103s0§,100);
            }
            else
            {
               §1t1543s0§.§1t10232s0§(this,§1t8103s0§,100);
            }
            --ttl;
            if(ttl <= 0)
            {
               §1t8100s0§ = false;
               gotoAndPlay("end");
               ttl = 12;
            }
         }
         else if(ttl > 0)
         {
            --ttl;
            if(ttl == 0)
            {
               this.§1t8113s0§();
            }
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
      
      internal function frame12() : *
      {
         stop();
      }
      
      internal function frame35() : *
      {
         stop();
      }
   }
}

