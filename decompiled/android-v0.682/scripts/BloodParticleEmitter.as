package
{
   import flash.display.MovieClip;
   
   public class BloodParticleEmitter extends ParticleEmitter
   {
      
      public static var typeCode:int = 0;
      
      public function BloodParticleEmitter(marker:MovieClip, canvas:MovieClip, manager:ParticleSystemManager, rotationTranslate:int, xTranslate:int, yTranslate:int)
      {
         super();
         this.canvas = canvas;
         this.rotationTranslate = rotationTranslate;
         this.xTranslate = xTranslate;
         this.yTranslate = yTranslate;
         this.marker = marker;
         pnumber = 20;
         px = 0;
         py = 0;
         pangle = 0;
         panglevariance = 10;
         pvel = 6;
         pvelvariance = 2;
         pgravity = 0.6;
         pttl = 24;
         this.manager = manager;
      }
      
      override public function createParticle() : Particle
      {
         var particle:Particle = BloodParticlePool.getBloodParticle();
         if(particle != null)
         {
            particle.init(px,py,pangle,panglevariance,pvel,pvelvariance,pttl,pgravity);
            canvas.addChild(particle.getBitmap());
            manager.registerParticle(particle);
         }
         return particle;
      }
   }
}

