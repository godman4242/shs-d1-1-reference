package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   public class §1t158s0§
   {
      
      internal var active:Boolean = true;
      
      internal var §1t2234s0§:MovieClip;
      
      internal var canvas:MovieClip;
      
      internal var §1t2235s0§:* = 20;
      
      internal var §1t2236s0§:* = 0;
      
      internal var §1t2237s0§:* = 0;
      
      internal var §1t2238s0§:* = 50;
      
      internal var §1t2239s0§:* = 10;
      
      internal var §1t2240s0§:* = 7;
      
      internal var §1t2241s0§:* = 2;
      
      internal var §1t2242s0§:* = 0.6;
      
      internal var §1t2243s0§:* = 30;
      
      internal var §1t2244s0§:§1t157s0§;
      
      internal var §1t2245s0§:int;
      
      internal var §1t2246s0§:int;
      
      internal var §1t2247s0§:int;
      
      internal var §1t2257s0§:ColorTransform = new ColorTransform(0,0,0,1,0,0,0,0);
      
      public function §1t158s0§()
      {
         super();
      }
      
      public function §1t2248s0§(param1:Boolean) : *
      {
         this.active = param1;
      }
      
      public function §1t2249s0§() : Boolean
      {
         return this.active;
      }
      
      public function §1t2250s0§(param1:int) : *
      {
         this.§1t2235s0§ = param1;
      }
      
      public function §1t2251s0§(param1:int) : *
      {
         this.§1t2240s0§ = param1;
      }
      
      public function §1t2252s0§(param1:int) : *
      {
         this.§1t2243s0§ = param1;
      }
      
      public function §1t2253s0§(param1:int) : *
      {
         this.§1t2239s0§ = param1;
      }
      
      public function destroy() : *
      {
         this.§1t2244s0§.§1t2288s0§(this);
      }
      
      public function §1t2254s0§() : §1t153s0§
      {
         return null;
      }
      
      public function §1t2255s0§(param1:MovieClip) : *
      {
         this.§1t2234s0§ = param1;
      }
      
      public function §1t2256s0§() : *
      {
         var _loc2_:Point = null;
         if(this.§1t2234s0§ == null)
         {
            return;
         }
         var _loc1_:MovieClip = this.§1t2234s0§.parent as MovieClip;
         if(_loc1_.scaleX < 0)
         {
            _loc2_ = new Point(-this.§1t2234s0§.x,this.§1t2234s0§.y);
            this.§1t2238s0§ = this.§1t2234s0§.rotation + this.§1t2245s0§;
            this.§1t2236s0§ = _loc2_.x + this.§1t2246s0§ + _loc1_.x;
         }
         else
         {
            _loc2_ = new Point(this.§1t2234s0§.x,this.§1t2234s0§.y);
            this.§1t2238s0§ = -this.§1t2234s0§.rotation - this.§1t2245s0§;
            this.§1t2236s0§ = _loc2_.x - this.§1t2246s0§ + _loc1_.x;
         }
         this.§1t2237s0§ = _loc2_.y + this.§1t2247s0§ + _loc1_.y;
      }
      
      public function update() : *
      {
         var _loc1_:Boolean = false;
         var _loc2_:§1t153s0§ = null;
         var _loc3_:int = 0;
         if(this.active)
         {
            this.§1t2256s0§();
            _loc1_ = §1t1525s0§.§1t9952s0§();
            _loc3_ = 0;
            while(_loc3_ < this.§1t2235s0§)
            {
               _loc2_ = this.§1t2254s0§();
               _loc3_++;
            }
            --this.§1t2235s0§;
         }
      }
   }
}

