package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2308")]
   public class §1t8392s0§ extends §1t128s0§
   {
      
      public var fire:MovieClip;
      
      public var skull:MovieClip;
      
      internal var §1t8393s0§:Boolean = true;
      
      public function §1t8392s0§()
      {
         super();
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         if(param4 == 1)
         {
            param3 = 10;
         }
         else if(param4 == 2)
         {
            param3 = 20;
         }
         else if(param4 == 3)
         {
            param3 = 30;
         }
         visible = true;
         §1t8100s0§ = true;
         this.velX = param1;
         this.velY = param2;
         if(param1 == 0 || param2 == 0)
         {
            this.§1t8393s0§ = false;
         }
         this.owner = param5;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         §1t8103s0§ = new §1t67s0§(param3,0,§1t67s0§.§1t9117s0§);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         x += velX;
         y += velY;
         if(§1t8100s0§)
         {
            if(y < -10 || velX < 0 && x < -10 || velX > 0 && x > §1t1523s0§.stageWidth + 10)
            {
               this.§1t8113s0§();
               return;
            }
            if(this.§1t8393s0§)
            {
               velY += §1t12543s0§;
               rotation = Math.atan(velY / velX) * 57.2727 + 180;
            }
            if(§1t3255s0§())
            {
               if(§1t1543s0§.§1t3274s0§(this,§1t8103s0§))
               {
                  ttl = 6;
                  §1t8100s0§ = false;
                  this.fire.visible = false;
                  if(!§1t1525s0§.§1t9952s0§())
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11310s0§,§1t1525s0§.§1t8131s0§() + x,§1t1525s0§.§1t9940s0§().§1t4467s0§(),0,0,0,1,owner);
                  }
               }
            }
            else if(§1t1543s0§.§1t10232s0§(this,§1t8103s0§))
            {
               ttl = 6;
               §1t8100s0§ = false;
               this.fire.visible = false;
               if(!§1t1525s0§.§1t9952s0§())
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11310s0§,§1t1525s0§.§1t8131s0§() + x,§1t1525s0§.§1t9940s0§().§1t4467s0§(),0,0,0,1,owner);
               }
            }
         }
         else
         {
            this.§1t8107s0§();
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
      
      override public function §1t2292s0§() : *
      {
         §1t1643s0§.§1t11216s0§(this,-255);
         this.fire.stop();
      }
   }
}

