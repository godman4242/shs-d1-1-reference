package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2404")]
   public class §1t8366s0§ extends §1t128s0§
   {
      
      public var hitarea:MovieClip;
      
      internal var ownerIsNetworkPlayer:Boolean = false;
      
      public function §1t8366s0§()
      {
         super();
         addFrameScript(0,this.frame1,40,this.frame41);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         param3 = 500;
         stop();
         if(param4 == 1)
         {
            ttl = 5 * 24;
         }
         else if(param4 == 2)
         {
            ttl = 4 * 24;
         }
         else if(param4 == 3)
         {
            ttl = 3 * 24;
         }
         visible = true;
         §1t8100s0§ = true;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(param3,0,§1t67s0§.§1t9118s0§);
         this.hitarea.visible = false;
         if(param5 != §1t1523s0§.§1t9586s0§())
         {
            visible = false;
         }
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
            this.ownerIsNetworkPlayer = param5.§1t3314s0§();
         }
      }
      
      override public function update() : *
      {
         --ttl;
         if(ttl == 0)
         {
            gotoAndPlay(2);
            visible = true;
         }
         if(currentFrame >= 16 && currentFrame < 26 && !§1t1525s0§.§1t9952s0§())
         {
            if(§1t3255s0§())
            {
               §1t1543s0§.§1t3274s0§(this.hitarea,§1t8103s0§,120,false,this);
            }
            else
            {
               §1t1543s0§.§1t10232s0§(this.hitarea,§1t8103s0§,120,false,this);
            }
            if(currentFrame == 16)
            {
               §1t1525s0§.§1t9960s0§(12);
            }
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         stop();
         visible = false;
         §1t8100s0§ = false;
         owner = null;
         §1t8103s0§ = null;
         this.ownerIsNetworkPlayer = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame41() : *
      {
         this.§1t8113s0§();
      }
   }
}

