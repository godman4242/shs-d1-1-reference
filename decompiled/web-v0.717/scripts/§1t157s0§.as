package
{
   import flash.display.MovieClip;
   
   public class §1t157s0§
   {
      
      public static var instance:§1t157s0§;
      
      public static var quality:* = "HIGH";
      
      internal var emitters:Vector.<§1t158s0§> = new Vector.<§1t158s0§>();
      
      internal var particles:Vector.<§1t153s0§> = new Vector.<§1t153s0§>();
      
      public function §1t157s0§()
      {
         super();
      }
      
      public static function §1t9190s0§() : §1t157s0§
      {
         if(instance == null)
         {
            instance = new §1t157s0§();
         }
         return instance;
      }
      
      public function init() : *
      {
         this.destroy();
         §1t2731s0§.init();
      }
      
      public function destroy() : *
      {
         var _loc1_:int = int(this.particles.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.particles[_loc2_].destroy();
            _loc2_++;
         }
         this.emitters.fixed = false;
         this.emitters.length = 0;
         this.emitters.fixed = true;
         this.particles.length = 0;
         §1t2731s0§.destroy();
      }
      
      public function §1t2287s0§(param1:int, param2:MovieClip, param3:MovieClip, param4:int = 0, param5:int = 0, param6:int = 0) : §1t158s0§
      {
         var _loc7_:§1t158s0§ = null;
         switch(param1)
         {
            case §1t3659s0§.typeCode:
               _loc7_ = new §1t3659s0§(param2,param3,this,param4,param5,param6);
         }
         this.emitters.fixed = false;
         this.emitters.push(_loc7_);
         this.emitters.fixed = true;
         return _loc7_;
      }
      
      public function §1t2288s0§(param1:§1t158s0§) : *
      {
         var _loc3_:§1t158s0§ = null;
         var _loc2_:int = int(this.emitters.length);
         var _loc4_:* = int(_loc2_ - 1);
         while(_loc4_ >= 0)
         {
            _loc3_ = this.emitters[_loc4_];
            if(_loc3_ == param1)
            {
               this.emitters.fixed = false;
               this.emitters.splice(_loc4_,1);
               this.emitters.fixed = true;
               return;
            }
            _loc4_--;
         }
      }
      
      public function §1t2289s0§(param1:int) : *
      {
         var _loc2_:int = int(this.particles.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            this.particles[_loc3_].§1t2289s0§(param1);
            _loc3_--;
         }
      }
      
      public function §1t2290s0§() : Boolean
      {
         var _loc1_:int = 0;
         if(quality == "HIGH")
         {
            _loc1_ = 2;
         }
         else if(quality == "MEDIUM")
         {
            _loc1_ = 1;
         }
         else if(quality == "LOW")
         {
            _loc1_ = 1;
         }
         return this.emitters.length < _loc1_;
      }
      
      public function §1t2291s0§(param1:§1t153s0§) : *
      {
         this.particles.push(param1);
      }
      
      public function §1t2292s0§() : *
      {
         §1t2731s0§.§1t2292s0§();
      }
      
      public function update() : *
      {
         var _loc3_:§1t153s0§ = null;
         var _loc1_:int = int(this.emitters.length);
         var _loc2_:* = 0;
         while(_loc2_ < _loc1_)
         {
            this.emitters[_loc2_].update();
            _loc2_++;
         }
         _loc1_ = int(this.particles.length);
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.particles[_loc2_];
            _loc3_.update();
            if(_loc3_.§1t2364s0§())
            {
               this.particles.splice(_loc2_,1);
            }
            _loc2_--;
         }
      }
   }
}

