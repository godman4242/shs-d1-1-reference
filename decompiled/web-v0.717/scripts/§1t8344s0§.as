package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2536")]
   public class §1t8344s0§ extends §1t128s0§
   {
      
      public var inner:MovieClip;
      
      public function §1t8344s0§()
      {
         super();
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         visible = true;
         §1t8100s0§ = true;
         this.velX = param1;
         this.velY = param2;
         ttl = §1t8101s0§;
         this.owner = param5;
         if(param1 < 0)
         {
            scaleX = -1;
         }
         else
         {
            scaleX = 1;
         }
         §1t8103s0§ = new §1t67s0§(0,0,§1t67s0§.§1t9118s0§,-1,0,0,0,param3);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         x += velX;
         if(this.y != §1t1525s0§.§1t4467s0§())
         {
            velY += 3;
         }
         y += velY;
         if(this.y >= §1t1525s0§.§1t4467s0§() && velY != 0)
         {
            this.y = §1t1525s0§.§1t4467s0§();
            velY = -velY / 2;
            if(velY >= -1 && velY <= 1)
            {
               velY = 0;
            }
         }
         if(§1t3255s0§())
         {
            §1t1543s0§.§1t3274s0§(this,§1t8103s0§);
         }
         else
         {
            §1t1543s0§.§1t10232s0§(this,§1t8103s0§);
         }
         if(y < -10 || velX < 0 && x < -50 || velX > 0 && x > §1t1523s0§.stageWidth + 50)
         {
            this.§1t8113s0§();
            return;
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         §1t1712s0§.unregister(this);
         §1t1525s0§.§1t9942s0§().removeChild(this);
      }
   }
}

