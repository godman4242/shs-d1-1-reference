package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2617")]
   public class §1t8334s0§ extends §1t128s0§
   {
      
      internal var rot:int;
      
      public function §1t8334s0§()
      {
         super();
         addFrameScript(12,this.frame13);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         visible = true;
         §1t8100s0§ = true;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         this.velY = param2;
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(0,0,§1t67s0§.§1t9118s0§,-1,0,0,0,param3 * 1.5);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
         gotoAndStop(int(Math.random() * 2) + 1);
         if(int(Math.random() * 2) == 0)
         {
            this.rot = -30;
         }
         else
         {
            this.rot = 30;
         }
         ttl = 0;
      }
      
      public function setDelay(param1:int) : *
      {
         ttl = param1;
         if(ttl > 0)
         {
            visible = false;
         }
      }
      
      override public function update() : *
      {
         if(ttl > 0)
         {
            --ttl;
            if(ttl == 0)
            {
               visible = true;
            }
            return;
         }
         if(§1t8100s0§)
         {
            x += velX;
            y += velY;
            velY += §1t12543s0§;
            rotation += this.rot;
            if(§1t3255s0§())
            {
               §1t1543s0§.§1t3274s0§(this,§1t8103s0§,50);
            }
            else
            {
               §1t1543s0§.§1t10232s0§(this,§1t8103s0§,50);
            }
            if(this.y > §1t1525s0§.§1t4467s0§() && velY > 0)
            {
               §1t8100s0§ = false;
               gotoAndPlay("break");
               return;
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
      
      internal function frame13() : *
      {
         stop();
         this.§1t8113s0§();
      }
   }
}

