package
{
   import flash.display.MovieClip;
   import flash.utils.Timer;
   
   public class ParticleSystem
   {
      
      internal var indexpos:int = 0;
      
      internal var pvel:* = 9;
      
      internal var active:* = true;
      
      internal var px:* = 0;
      
      internal var py:* = 0;
      
      internal var count:* = 0;
      
      internal var panglevariance:* = 10;
      
      internal var particleTimer:Timer;
      
      internal var pangle:* = 50;
      
      internal var pvelvariance:* = 2;
      
      internal var pttl:* = 30;
      
      internal var totalCount:*;
      
      internal var particles:* = new Array();
      
      internal var owner:MovieClip;
      
      internal var pgravity:* = 0.6;
      
      internal var pnumber:* = 20;
      
      internal var marker:MovieClip = null;
      
      internal var removeMe:Boolean = false;
      
      public function ParticleSystem()
      {
         totalCount = pnumber * pttl;
         super();
      }
      
      public function setNumber(param1:*) : *
      {
         pnumber = param1;
      }
      
      public function setActive(param1:Boolean) : *
      {
         active = param1;
      }
      
      public function decreaseCount() : *
      {
         --count;
      }
      
      public function setVel(param1:*) : *
      {
         pvel = param1;
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
      
      public function followMarker() : *
      {
         if(marker == null)
         {
            return;
         }
         this.px = marker.x;
         this.py = marker.y;
         this.pangle = marker.rotation;
      }
      
      public function setMarker(param1:MovieClip) : *
      {
         this.marker = param1;
      }
      
      public function isActive() : Boolean
      {
         return active;
      }
   }
}

