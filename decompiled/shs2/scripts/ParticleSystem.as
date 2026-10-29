package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class ParticleSystem
   {
      
      internal var active:* = true;
      
      internal var px:* = 0;
      
      internal var py:* = 0;
      
      internal var count:* = 0;
      
      public var isExternal:Boolean = false;
      
      internal var pvelvariance:* = 2;
      
      internal var totalCount:*;
      
      internal var pvel:* = 9;
      
      internal var particles:* = new Array();
      
      internal var pnumber:* = 20;
      
      internal var owner:MovieClip;
      
      internal var marker:MovieClip = null;
      
      internal var indexpos:int = 0;
      
      internal var panglevariance:* = 10;
      
      internal var particleTimer:Timer;
      
      internal var pangle:* = 50;
      
      internal var pgravity:* = 0.6;
      
      internal var removeMe:Boolean = false;
      
      internal var pttl:* = 30;
      
      public function ParticleSystem()
      {
         totalCount = pnumber * pttl;
         super();
      }
      
      public function decreaseCount() : *
      {
         --count;
      }
      
      public function setActive(param1:Boolean) : *
      {
         active = param1;
      }
      
      public function setAngleVariance(param1:int) : *
      {
         panglevariance = param1;
      }
      
      public function getNextParticle(param1:*) : Array
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = new Array();
         _loc3_ = indexpos;
         while(_loc3_ < totalCount)
         {
            if(particles[_loc3_].isDead())
            {
               _loc2_.push(particles[_loc3_]);
               if(_loc2_.length == param1)
               {
                  indexpos = _loc3_ + 1;
                  if(indexpos >= totalCount)
                  {
                     indexpos = 0;
                  }
                  return _loc2_;
               }
            }
            _loc3_++;
         }
         indexpos = 0;
         return _loc2_;
      }
      
      public function setTTL(param1:int) : *
      {
         pttl = param1;
      }
      
      public function update() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(removeMe)
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
            followMarker();
            _loc3_ = getNextParticle(pnumber);
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc3_[_loc4_].init(px,py,pangle,panglevariance,pvel,pvelvariance,pttl,pgravity);
               ++count;
               _loc4_++;
            }
         }
         _loc1_ = 0;
         while(_loc1_ < particles.length)
         {
            particles[_loc1_].update();
            _loc1_++;
         }
      }
      
      public function setNumber(param1:int) : *
      {
         pnumber = param1;
      }
      
      public function isActive() : Boolean
      {
         return active;
      }
      
      public function followMarker() : *
      {
         var _loc1_:Point = null;
         if(marker == null)
         {
            return;
         }
         if(isExternal)
         {
            _loc1_ = new Point(marker.x,marker.y);
            _loc1_ = MovieClip(marker.parent).localToGlobal(_loc1_);
            this.px = _loc1_.x;
            this.py = _loc1_.y;
         }
         else
         {
            this.px = marker.x;
            this.py = marker.y;
         }
         this.pangle = marker.rotation;
      }
      
      public function setVel(param1:int) : *
      {
         pvel = param1;
      }
      
      public function setMarker(param1:MovieClip) : *
      {
         this.marker = param1;
      }
   }
}

