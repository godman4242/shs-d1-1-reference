package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2380")]
   public class §1t8370s0§ extends §1t128s0§
   {
      
      internal var kunaitype:int;
      
      public function §1t8370s0§(param1:int)
      {
         super();
         addFrameScript(0,this.frame1);
         this.kunaitype = param1;
         gotoAndStop(param1 + 1);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         visible = true;
         §1t8104s0§ = true;
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
         rotation = Math.atan(param2 / param1) * 57.2727;
         §1t8103s0§ = new §1t67s0§();
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
         if(this.kunaitype == 0)
         {
            if(param4 == 1)
            {
               §1t8103s0§.§1t1092s0§(20);
            }
            else if(param4 == 2)
            {
               §1t8103s0§.§1t1092s0§(40);
            }
            else if(param4 == 3)
            {
               §1t8103s0§.§1t1092s0§(60);
            }
            else if(param4 == 10)
            {
               §1t8103s0§.§1t1092s0§(10000);
            }
            §1t8103s0§.§1t1093s0§(0);
         }
         else if(this.kunaitype == 1)
         {
            §1t8103s0§.§1t1095s0§(param3);
         }
         else if(this.kunaitype == 2)
         {
            §1t8103s0§.§1t1096s0§(param3);
         }
         else if(this.kunaitype == 3)
         {
            §1t8103s0§.§1t1097s0§(param3);
         }
         else if(this.kunaitype == 4)
         {
            §1t8103s0§.§1t1098s0§(param3);
         }
         this.owner = param5;
      }
      
      override public function update() : *
      {
         if(!§1t8100s0§)
         {
            §1t8107s0§();
            return;
         }
         x += velX;
         y += velY;
         if(y < -10 || velX < 0 && x < -10 || velX > 0 && x > §1t1523s0§.stageWidth + 10)
         {
            this.§1t8113s0§();
            return;
         }
         if(§1t8104s0§)
         {
            if(y > §1t1525s0§.§1t4467s0§())
            {
               §1t8100s0§ = false;
               return;
            }
            if(§1t3255s0§())
            {
               if(§1t1543s0§.§1t3274s0§(this,§1t8103s0§,10,false,null,true))
               {
                  this.§1t8113s0§();
               }
            }
            else if(§1t1543s0§.§1t10232s0§(this,§1t8103s0§,100,false,null,owner,true))
            {
               this.§1t8113s0§();
            }
         }
         else
         {
            if(velX > 0)
            {
               rotation += 20;
            }
            else
            {
               rotation -= 20;
            }
            velY += §1t12543s0§;
         }
      }
      
      override public function §1t8109s0§() : *
      {
         §1t8104s0§ = false;
         velX = Math.random() * 30 - 15;
         velY = -(Math.random() * 5 + 5);
         gotoAndStop("broken");
         §1t1712s0§.§1t11331s0§(x,y);
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

