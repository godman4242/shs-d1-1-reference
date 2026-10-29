package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2624")]
   public class §1t8332s0§ extends §1t128s0§
   {
      
      internal var §1t4425s0§:Boolean;
      
      public function §1t8332s0§()
      {
         super();
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         this.initArrow(param1,param2,param3,false,param5);
      }
      
      public function initArrow(param1:int, param2:int, param3:int, param4:Boolean, param5:§1t68s0§ = null) : *
      {
         gotoAndStop(1);
         §1t8104s0§ = true;
         visible = true;
         §1t8100s0§ = true;
         this.velX = param1;
         this.velY = param2;
         ttl = §1t8101s0§;
         if(param1 > 0)
         {
            scaleX = -1;
         }
         else
         {
            scaleX = 1;
         }
         var _loc6_:int = 0;
         if(param5 != null)
         {
            _loc6_ = param5.getLevel();
         }
         §1t8103s0§ = new §1t67s0§(param3,_loc6_);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
         if(param4)
         {
            §1t8103s0§.§1t1066s0§ = §1t67s0§.§1t9118s0§;
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
         if(§1t8104s0§)
         {
            rotation = Math.atan(velY / velX) * 57.2727 + 180;
            velY += §1t12543s0§;
            if(this.y > §1t1525s0§.§1t4467s0§() && velY > 0)
            {
               §1t8100s0§ = false;
               return;
            }
            if(§1t3255s0§())
            {
               if(§1t1543s0§.§1t3274s0§(this,§1t8103s0§))
               {
                  this.§1t8109s0§();
               }
            }
            else if(§1t1543s0§.§1t10232s0§(this,§1t8103s0§))
            {
               this.§1t8109s0§();
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
            if(y < -10 || velX < 0 && x < -10 || velX > 0 && x > §1t1523s0§.stageWidth + 10)
            {
               this.§1t8113s0§();
               return;
            }
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
         §1t1712s0§.unregister(this);
         §1t1525s0§.§1t9942s0§().removeChild(this);
      }
   }
}

