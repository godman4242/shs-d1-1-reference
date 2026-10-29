package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2370")]
   public class §1t129s0§ extends §1t128s0§
   {
      
      internal static var §1t12612s0§:int = 0;
      
      internal static var §1t12613s0§:int = 1;
      
      internal static var §1t12614s0§:int = 2;
      
      internal static var §1t12615s0§:int = 3;
      
      internal var §1t8373s0§:int;
      
      internal var §1t8374s0§:int;
      
      public function §1t129s0§()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function §1t8375s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         visible = true;
         §1t8100s0§ = true;
         this.velX = param1;
         this.velY = param2;
         this.§1t8373s0§ = param3;
         ttl = 10 * 24;
         this.§1t8374s0§ = param4;
         if(param4 == 0)
         {
            gotoAndStop(1);
         }
         else if(param4 == 1)
         {
            gotoAndStop(2);
         }
         else
         {
            gotoAndStop(3);
         }
      }
      
      override public function update() : *
      {
         var _loc1_:MovieClip = §1t1523s0§.§1t9586s0§().mcs;
         if(!§1t8100s0§)
         {
            §1t8107s0§();
            return;
         }
         x += velX;
         y += velY;
         rotation += this.§1t8373s0§;
         velY += §1t12543s0§;
         if(this.y > §1t1525s0§.§1t4467s0§() - 15 && velY > 0)
         {
            if(velY < 5)
            {
               this.§1t8113s0§();
            }
            else
            {
               velY = -velY / 3;
               velX = velX * 3 / 4;
               this.§1t8373s0§ /= 2;
            }
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         §1t1712s0§.unregister(this);
         §1t1712s0§.§1t11322s0§(this);
         §1t1831s0§.§1t11500s0§(this);
         §1t1525s0§.§1t9942s0§().removeChild(this);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

