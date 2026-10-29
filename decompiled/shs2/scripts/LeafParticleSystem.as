package
{
   import flash.display.MovieClip;
   
   public class LeafParticleSystem extends ParticleSystem
   {
      
      public static var instance:LeafParticleSystem;
      
      public static var typeCode:int = 2;
      
      internal var changeSpeedCounter:int = 240;
      
      public var windSpeed:int = -5;
      
      public function LeafParticleSystem(param1:Number, param2:Number, param3:MovieClip)
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         windSpeed = -5;
         changeSpeedCounter = 10 * 24;
         super();
         instance = this;
         this.owner = param3;
         this.px = param1;
         this.py = param2;
         pnumber = 1;
         pangle = 0;
         panglevariance = 10;
         pvel = 9;
         pvelvariance = 12;
         pgravity = 0.1;
         pttl = 10 * 24;
         totalCount = 20;
         _loc4_ = 0;
         while(_loc4_ < totalCount / 2)
         {
            _loc5_ = new LeafParticle(param3,this);
            param3.addChild(_loc5_);
            particles.push(_loc5_);
            _loc5_.visible = false;
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < totalCount / 2)
         {
            _loc5_ = new LeafParticle2(MovieClip(param3.parent).leaflayer2,this);
            MovieClip(param3.parent).leaflayer2.addChild(_loc5_);
            particles.push(_loc5_);
            _loc5_.visible = false;
            _loc4_++;
         }
      }
      
      public function changeLeafSpeed(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < particles.length)
         {
            particles[_loc2_].changeLeafSpeed(param1);
            _loc2_++;
         }
      }
      
      override public function update() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
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
               if(Player.instance.isScrolling)
               {
                  windSpeed = -Math.random() * 10;
               }
               else
               {
                  windSpeed = Math.random() * 20 - 10;
               }
            }
            if(Math.random() * 50 < 1)
            {
               _loc3_ = 200;
               if(windSpeed > 0)
               {
                  _loc3_ = -200;
               }
               followMarker();
               _loc4_ = getNextParticle(pnumber);
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc4_[_loc5_].init(Math.random() * 720 + _loc3_,-10,pangle,panglevariance,pvel,pvelvariance,pttl,pgravity);
                  ++count;
                  _loc5_++;
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
      
      public function dropLeaves(param1:int) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = getNextParticle(10);
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_].init(param1 + Math.random() * 100 - 50,-Math.random() * 50,pangle,panglevariance,pvel,pvelvariance,pttl,pgravity);
            ++count;
            _loc3_++;
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

