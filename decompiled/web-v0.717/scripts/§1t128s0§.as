package
{
   import flash.display.MovieClip;
   
   public class §1t128s0§ extends MovieClip
   {
      
      internal static var §1t12543s0§:Number = 3;
      
      internal static var §1t12544s0§:int = 0;
      
      internal static var §1t12545s0§:int = 1;
      
      internal var id:int;
      
      internal var velX:Number = 0;
      
      internal var velY:Number = 0;
      
      internal var §1t8100s0§:Boolean = false;
      
      internal var §1t8101s0§:int = 48;
      
      internal var ttl:int = this.§1t8101s0§;
      
      internal var §1t3277s0§:Boolean = false;
      
      internal var owner:§1t68s0§;
      
      internal var §1t8102s0§:Boolean = false;
      
      internal var §1t8103s0§:§1t67s0§;
      
      internal var §1t8104s0§:Boolean = false;
      
      public function §1t128s0§()
      {
         super();
      }
      
      public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
      }
      
      public function update() : *
      {
      }
      
      public function §1t8105s0§() : Boolean
      {
         return this.§1t8100s0§;
      }
      
      public function §1t8106s0§(param1:Boolean) : *
      {
         this.§1t8100s0§ = param1;
      }
      
      public function §1t8107s0§() : *
      {
         if(this.ttl >= 0)
         {
            --this.ttl;
            if(this.ttl < 24)
            {
               this.alpha = this.ttl / 24;
            }
            if(this.ttl <= 0)
            {
               this.alpha = 1;
               this.§1t8113s0§();
            }
         }
      }
      
      public function §1t8108s0§() : Number
      {
         return this.velX;
      }
      
      public function §1t2289s0§(param1:int) : *
      {
         x -= param1;
      }
      
      public function §1t8109s0§() : *
      {
      }
      
      public function §1t8110s0§() : Boolean
      {
         return this.§1t8104s0§;
      }
      
      public function §1t8111s0§() : *
      {
      }
      
      public function §1t8112s0§() : *
      {
      }
      
      public function §1t3255s0§() : Boolean
      {
         if(this.owner == null)
         {
            return false;
         }
         return this.owner.§1t3255s0§;
      }
      
      internal function §1t8113s0§() : *
      {
      }
      
      public function §1t2292s0§() : *
      {
         §1t1643s0§.§1t11216s0§(this,-255);
      }
   }
}

