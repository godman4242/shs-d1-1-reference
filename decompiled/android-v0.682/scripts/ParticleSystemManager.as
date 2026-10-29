package
{
   import flash.display.MovieClip;
   
   public class ParticleSystemManager
   {
      
      public static var instance:ParticleSystemManager;
      
      public static var quality:* = "HIGH";
      
      internal var emitters:Vector.<ParticleEmitter> = new Vector.<ParticleEmitter>();
      
      internal var particles:Vector.<Particle> = new Vector.<Particle>();
      
      public function ParticleSystemManager()
      {
         super();
      }
      
      public static function getInstance() : ParticleSystemManager
      {
         if(instance == null)
         {
            instance = new ParticleSystemManager();
         }
         return instance;
      }
      
      public function init() : *
      {
         this.destroy();
         BloodParticlePool.init();
      }
      
      public function destroy() : *
      {
         var max:int = int(this.particles.length);
         for(var i:int = 0; i < max; i++)
         {
            this.particles[i].destroy();
         }
         this.emitters.fixed = false;
         this.emitters.length = 0;
         this.emitters.fixed = true;
         this.particles.length = 0;
         BloodParticlePool.destroy();
      }
      
      public function createEmitter(type:int, marker:MovieClip, canvas:MovieClip, rotationTranslate:int = 0, xTranslate:int = 0, yTranslate:int = 0) : ParticleEmitter
      {
         var emitter:ParticleEmitter = null;
         switch(type)
         {
            case BloodParticleEmitter.typeCode:
               emitter = new BloodParticleEmitter(marker,canvas,this,rotationTranslate,xTranslate,yTranslate);
         }
         this.emitters.fixed = false;
         this.emitters.push(emitter);
         this.emitters.fixed = true;
         return emitter;
      }
      
      public function destroyEmitter(removeMe:ParticleEmitter) : *
      {
         var emitter:ParticleEmitter = null;
         var max:int = int(this.emitters.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            emitter = this.emitters[i];
            if(emitter == removeMe)
            {
               this.emitters.fixed = false;
               this.emitters.splice(i,1);
               this.emitters.fixed = true;
               return;
            }
         }
      }
      
      public function doScroll(dist:int) : *
      {
         var max:int = int(this.particles.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            this.particles[i].doScroll(dist);
         }
      }
      
      public function isAbleToSupport() : Boolean
      {
         var max:int = 0;
         if(quality == "HIGH")
         {
            max = 2;
         }
         else if(quality == "MEDIUM")
         {
            max = 1;
         }
         else if(quality == "LOW")
         {
            max = 1;
         }
         return this.emitters.length < max;
      }
      
      public function registerParticle(particle:Particle) : *
      {
         this.particles.push(particle);
      }
      
      public function redFreeze() : *
      {
         BloodParticlePool.redFreeze();
      }
      
      public function update() : *
      {
         var particle:Particle = null;
         var max:int = int(this.emitters.length);
         for(var i:* = 0; i < max; i++)
         {
            this.emitters[i].update();
         }
         max = int(this.particles.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            particle = this.particles[i];
            particle.update();
            if(particle.isDead())
            {
               this.particles.splice(i,1);
            }
         }
      }
   }
}

