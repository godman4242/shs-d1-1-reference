package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   public class ParticleEmitter
   {
      
      internal var active:Boolean = true;
      
      internal var marker:MovieClip;
      
      internal var canvas:MovieClip;
      
      internal var pnumber:* = 20;
      
      internal var px:* = 0;
      
      internal var py:* = 0;
      
      internal var pangle:* = 50;
      
      internal var panglevariance:* = 10;
      
      internal var pvel:* = 7;
      
      internal var pvelvariance:* = 2;
      
      internal var pgravity:* = 0.6;
      
      internal var pttl:* = 30;
      
      internal var manager:ParticleSystemManager;
      
      internal var rotationTranslate:int;
      
      internal var xTranslate:int;
      
      internal var yTranslate:int;
      
      internal var blackColorTransform:ColorTransform = new ColorTransform(0,0,0,1,0,0,0,0);
      
      public function ParticleEmitter()
      {
         super();
      }
      
      public function setActive(flag:Boolean) : *
      {
         this.active = flag;
      }
      
      public function isActive() : Boolean
      {
         return this.active;
      }
      
      public function setNumber(num:int) : *
      {
         this.pnumber = num;
      }
      
      public function setVel(num:int) : *
      {
         this.pvel = num;
      }
      
      public function setTTL(num:int) : *
      {
         this.pttl = num;
      }
      
      public function setAngleVariance(num:int) : *
      {
         this.panglevariance = num;
      }
      
      public function destroy() : *
      {
         this.manager.destroyEmitter(this);
      }
      
      public function createParticle() : Particle
      {
         return null;
      }
      
      public function setMarker(marker:MovieClip) : *
      {
         this.marker = marker;
      }
      
      public function followMarker() : *
      {
         var pt:Point = null;
         if(this.marker == null)
         {
            return;
         }
         var parentMC:MovieClip = this.marker.parent as MovieClip;
         if(parentMC.scaleX < 0)
         {
            pt = new Point(-this.marker.x,this.marker.y);
            this.pangle = this.marker.rotation + this.rotationTranslate;
            this.px = pt.x + this.xTranslate + parentMC.x;
         }
         else
         {
            pt = new Point(this.marker.x,this.marker.y);
            this.pangle = -this.marker.rotation - this.rotationTranslate;
            this.px = pt.x - this.xTranslate + parentMC.x;
         }
         this.py = pt.y + this.yTranslate + parentMC.y;
      }
      
      public function update() : *
      {
         var redFreeze:Boolean = false;
         var particle:Particle = null;
         var i:int = 0;
         if(this.active)
         {
            this.followMarker();
            redFreeze = StageManager.isRedFreeze();
            for(i = 0; i < this.pnumber; i++)
            {
               particle = this.createParticle();
            }
            --this.pnumber;
         }
      }
   }
}

