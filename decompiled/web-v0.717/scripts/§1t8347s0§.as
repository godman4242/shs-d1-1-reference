package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2515")]
   public class §1t8347s0§ extends §1t128s0§
   {
      
      public function §1t8347s0§()
      {
         super();
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         if(param3 > 10)
         {
            param3 = 10;
         }
         var _loc6_:Number = param3 / 10;
         scaleX = 1 + _loc6_;
         scaleY = scaleX;
         if(param4 == 1)
         {
            param3 = 20 * param3;
         }
         else if(param4 == 2)
         {
            param3 = 40 * param3;
         }
         else if(param4 == 3)
         {
            param3 = 60 * param3;
         }
         visible = true;
         §1t8100s0§ = true;
         this.velX = param1;
         this.velY = param2;
         ttl = 24 * 3;
         this.owner = param5;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         §1t8103s0§ = new §1t67s0§(param3,0,§1t67s0§.§1t9118s0§);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         this.§1t8107s0§();
         x += velX;
         if(§1t8100s0§)
         {
            if(§1t3255s0§())
            {
               if(§1t1543s0§.§1t3274s0§(this,§1t8103s0§))
               {
                  ttl = 6;
                  §1t8100s0§ = false;
               }
            }
            else if(§1t1543s0§.§1t10232s0§(this,§1t8103s0§,100,false,null,owner))
            {
               ttl = 6;
               §1t8100s0§ = false;
            }
         }
      }
      
      override public function §1t8107s0§() : *
      {
         if(ttl >= 0)
         {
            --ttl;
            if(ttl < 6)
            {
               §1t8100s0§ = false;
               this.alpha = ttl / 6;
               if(scaleX > 0)
               {
                  scaleX += 0.4;
               }
               else
               {
                  scaleX -= 0.4;
               }
               this.scaleY += 0.4;
            }
            if(ttl <= 0)
            {
               this.alpha = 1;
               this.§1t8113s0§();
            }
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

