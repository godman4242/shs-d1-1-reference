package
{
   import flash.display.MovieClip;
   
   public class BloodParticleSystem extends ParticleSystem
   {
      
      public static var typeCode:int = 1;
      
      public function BloodParticleSystem(param1:Number, param2:Number, param3:MovieClip)
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         super();
         this.owner = param3;
         this.px = param1;
         this.py = param2;
         pnumber = 15;
         pangle = 50;
         panglevariance = 10;
         pvel = 9;
         pvelvariance = 2;
         pgravity = 0.6;
         pttl = 25;
         totalCount = pnumber * pttl;
         _loc4_ = 0;
         while(_loc4_ < totalCount)
         {
            _loc5_ = new BloodParticle(param3,this);
            param3.addChild(_loc5_);
            particles.push(_loc5_);
            _loc5_.visible = false;
            _loc4_++;
         }
      }
   }
}

