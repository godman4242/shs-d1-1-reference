package
{
   import flash.display.MovieClip;
   
   public class GrassParticleSystem extends ParticleSystem
   {
      
      public static var instance:GrassParticleSystem;
      
      public static var typeCode:int = 3;
      
      internal var changeSpeedCounter:int = 240;
      
      public var windSpeed:int = -10;
      
      public function GrassParticleSystem(param1:Number, param2:Number, param3:MovieClip)
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         windSpeed = -10;
         changeSpeedCounter = 10 * 24;
         super();
         instance = this;
         this.owner = param3;
         this.px = param1;
         this.py = param2;
         pnumber = 1;
         pangle = 270;
         panglevariance = 10;
         pvel = -10;
         pvelvariance = 5;
         pgravity = 0.1;
         pttl = 10 * 24;
         totalCount = 10;
         _loc4_ = 0;
         while(_loc4_ < totalCount)
         {
            _loc5_ = new GrassParticle(param3,this);
            param3.addChild(_loc5_);
            particles.push(_loc5_);
            _loc5_.visible = false;
            _loc4_++;
         }
      }
      
      override public function update() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(removeMe || Boolean(Player.instance.isRedFreeze))
         {
            return;
         }
         if(!active && count <= 0)
         {
            _loc2_ = 0;
            while(_loc2_ < totalCount)
            {
               owner.removeChild(particles[_loc2_]);
               _loc2_++;
            }
            removeMe = true;
         }
         if(!active && pnumber > 0)
         {
            --pnumber;
         }
         else if(active)
         {
            --changeSpeedCounter;
            if(changeSpeedCounter == 0)
            {
               changeSpeedCounter = 10 * 24;
               windSpeed = -Math.random() * 10 - 10;
            }
            if(Math.random() * 40 < 1)
            {
               followMarker();
               _loc3_ = getNextParticle(pnumber);
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc3_[_loc4_].init(900,Math.random() * 250 + 150,pangle,panglevariance,pvel,pvelvariance,pttl,pgravity);
                  ++count;
                  _loc4_++;
               }
            }
         }
         _loc1_ = 0;
         while(_loc1_ < particles.length)
         {
            particles[_loc1_].update();
            _loc1_++;
         }
      }
      
      public function desaturateAll() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < particles.length)
         {
            ColorCode.desaturate(particles[_loc1_]);
            _loc1_++;
         }
      }
      
      public function clearFilterAll() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < particles.length)
         {
            ColorCode.clearFilter(particles[_loc1_]);
            _loc1_++;
         }
      }
   }
}

