package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2415")]
   public class §1t8359s0§ extends §1t128s0§
   {
      
      public function §1t8359s0§()
      {
         super();
         addFrameScript(16,this.frame17);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         var _loc6_:Number = NaN;
         _loc6_ = 1;
         if(param4 == 1)
         {
            _loc6_ = 1;
            param3 *= 0.8;
         }
         else if(param4 == 2)
         {
            _loc6_ = 1.1;
            param3 *= 0.9;
         }
         else if(param4 == 3)
         {
            _loc6_ = 1.2;
            param3 *= 1;
         }
         else if(param4 == 4)
         {
            _loc6_ = 1.3;
            param3 *= 1.1;
         }
         else if(param4 == 5)
         {
            _loc6_ = 1.4;
            param3 *= 1.2;
         }
         this.scaleX = _loc6_;
         this.scaleY = _loc6_;
         visible = true;
         §1t8100s0§ = true;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(0,0,2,-1,param3);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
      }
      
      override public function update() : *
      {
         if(§1t3255s0§())
         {
            §1t1543s0§.§1t3274s0§(this,§1t8103s0§,200);
         }
         else
         {
            §1t1543s0§.§1t10232s0§(this,§1t8103s0§,200);
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         stop();
         §1t8100s0§ = false;
         visible = false;
         if(parent != null)
         {
            MovieClip(parent).removeChild(this);
         }
         §1t1712s0§.unregister(this);
      }
      
      internal function frame17() : *
      {
         this.§1t8113s0§();
      }
   }
}

