package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2267")]
   public class §1t8399s0§ extends §1t128s0§
   {
      
      internal var friction:Number = -1;
      
      internal var positiveVelX:Boolean = true;
      
      public function §1t8399s0§()
      {
         super();
         addFrameScript(34,this.frame35);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         if(param4 == 1)
         {
            param3 = 40;
         }
         else if(param4 == 2)
         {
            param3 = 80;
         }
         else if(param4 == 3)
         {
            param3 = 120;
         }
         visible = true;
         §1t8100s0§ = true;
         this.velX = param1;
         this.velY = param2;
         this.owner = param5;
         if(param1 < 0)
         {
            scaleX = -scaleX;
            this.friction = 1;
            this.positiveVelX = false;
         }
         §1t8103s0§ = new §1t67s0§(param3,0,§1t67s0§.§1t9118s0§);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         if(this.positiveVelX && velX < 0 && x < -10 || !this.positiveVelX && velX > 0 && x > §1t1523s0§.stageWidth + 10)
         {
            this.§1t8113s0§();
            return;
         }
         x += velX;
         velX += this.friction;
         if(§1t3255s0§())
         {
            §1t1543s0§.§1t3274s0§(this,§1t8103s0§);
         }
         else
         {
            §1t1543s0§.§1t10232s0§(this,§1t8103s0§);
         }
         if((this.positiveVelX && velX < 0 || !this.positiveVelX && velX > 0) && (owner.mcs.x - x) * (owner.mcs.x - x) < 2500 && owner.§1t3276s0§(this))
         {
            this.§1t8113s0§();
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
      
      internal function frame35() : *
      {
         gotoAndPlay(15);
      }
   }
}

