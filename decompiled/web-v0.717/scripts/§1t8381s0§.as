package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2329")]
   public class §1t8381s0§ extends §1t128s0§
   {
      
      public var grass:MovieClip;
      
      public var wave:MovieClip;
      
      public function §1t8381s0§()
      {
         super();
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         var _loc6_:Number = NaN;
         _loc6_ = 1;
         if(param4 == 1)
         {
            _loc6_ = 1;
            param3 = 25;
         }
         else if(param4 == 2)
         {
            _loc6_ = 1.2;
            param3 = 50;
         }
         else if(param4 == 3)
         {
            _loc6_ = 1.3;
            param3 = 75;
         }
         this.scaleX = _loc6_;
         this.scaleY = _loc6_;
         visible = true;
         §1t8100s0§ = true;
         this.velX = param1;
         this.velY = param2;
         ttl = 30;
         this.owner = param5;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         §1t8103s0§ = new §1t67s0§(param3,0);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         §1t8107s0§();
         x += velX;
         if(§1t3255s0§())
         {
            §1t1543s0§.§1t3274s0§(this,§1t8103s0§);
         }
         else
         {
            §1t1543s0§.§1t10232s0§(this,§1t8103s0§);
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
   }
}

