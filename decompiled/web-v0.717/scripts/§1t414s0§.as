package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1841")]
   public class §1t414s0§ extends MovieClip
   {
      
      public var icon:MovieClip;
      
      internal var velX:Number;
      
      internal var velY:Number;
      
      internal var ttl:int;
      
      internal var §1t7442s0§:int;
      
      internal var §1t7443s0§:int;
      
      internal var §1t7444s0§:int = 0;
      
      public function §1t414s0§()
      {
         super();
         this.icon.stop();
         scaleX = 1.2;
         scaleY = 1.2;
      }
      
      public function init(param1:int, param2:int, param3:int, param4:int, param5:int) : *
      {
         this.icon.gotoAndStop(param1 + 1);
         x = param2;
         y = param3;
         this.§1t7442s0§ = param4;
         this.§1t7443s0§ = param5;
         this.§1t7444s0§ = 0;
         this.velX = Math.random() * 16 - 8;
         this.velY = Math.random() * 16 - 8;
      }
      
      public function update() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         x += this.velX;
         y += this.velY;
         if(this.§1t7444s0§ == 0)
         {
            this.velX *= 0.9;
            this.velY *= 0.9;
            if(this.velX > -1 && this.velX < 1 && this.velY > -1 && this.velY < 1)
            {
               _loc1_ = this.§1t7442s0§ - x;
               _loc2_ = this.§1t7443s0§ - y;
               _loc3_ = Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_);
               if(_loc3_ == 0)
               {
                  _loc3_ = 1;
               }
               this.velX = _loc1_ * 20 / _loc3_;
               this.velY = _loc2_ * 20 / _loc3_;
               this.ttl = _loc2_ / this.velY;
               this.§1t7444s0§ = 1;
            }
         }
         else if(this.§1t7444s0§ == 1)
         {
            x += this.velX;
            y += this.velY;
            --this.ttl;
            if(this.ttl == 0)
            {
               this.destroy();
            }
         }
      }
      
      public function destroy() : *
      {
         §1t412s0§.instance.§1t7623s0§(this);
      }
   }
}

