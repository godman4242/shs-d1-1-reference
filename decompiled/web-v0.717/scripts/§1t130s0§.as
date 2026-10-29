package
{
   public class §1t130s0§ extends §1t128s0§
   {
      
      internal var §1t8373s0§:int;
      
      public function §1t130s0§()
      {
         super();
      }
      
      public function §1t8405s0§(param1:int, param2:int, param3:int) : *
      {
         visible = true;
         §1t8100s0§ = true;
         this.velX = param1;
         this.velY = param2;
         this.§1t8373s0§ = param3;
         ttl = §1t8101s0§;
      }
      
      override public function update() : *
      {
         if(!§1t8100s0§)
         {
            return;
         }
         x += velX;
         y += velY;
         rotation += this.§1t8373s0§;
         velY += §1t12543s0§;
         if(this.y > §1t1525s0§.§1t4467s0§() && velY > 0)
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
         var _loc1_:* = numChildren;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            removeChildAt(0);
            _loc2_++;
         }
         §1t1712s0§.unregister(this);
         §1t1831s0§.§1t11499s0§(this);
         §1t1525s0§.§1t9942s0§().removeChild(this);
      }
   }
}

