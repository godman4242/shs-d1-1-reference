package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2752")]
   public class §1t8454s0§ extends §1t112s0§
   {
      
      public var f_1:MovieClip;
      
      public var f_10:MovieClip;
      
      public var f_11:MovieClip;
      
      public var f_12:MovieClip;
      
      public var f_2:MovieClip;
      
      public var f_3:MovieClip;
      
      public var f_4:MovieClip;
      
      public var f_5:MovieClip;
      
      public var f_6:MovieClip;
      
      public var f_7:MovieClip;
      
      public var f_8:MovieClip;
      
      public var f_9:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var ff_2:MovieClip;
      
      public var ff_3:MovieClip;
      
      public var ff_4:MovieClip;
      
      public var ff_5:MovieClip;
      
      public var ff_6:MovieClip;
      
      public var ff_7:MovieClip;
      
      public var ground_1:MovieClip;
      
      public var ground_2:MovieClip;
      
      public var ground_3:MovieClip;
      
      public var ground_4:MovieClip;
      
      public var playercanvas:§1t5016s0§;
      
      public var redBG:RedBG;
      
      public function §1t8454s0§()
      {
         super();
         §1t2186s0§ = 1600;
         §1t2184s0§ = 400;
         §1t2185s0§ = true;
         this.redBG.visible = false;
         §1t2188s0§ = 7;
         §1t2189s0§ = 12;
         §1t2190s0§ = 0;
         §1t2191s0§ = 4;
         §1t2192s0§ = 0;
         §1t8126s0§();
         var _loc1_:uint = §1t70s0§.instance.§1t1164s0§(§1t1525s0§.§1t9935s0§());
         if(_loc1_ >= 1 && _loc1_ <= 4)
         {
            this.f_1.gotoAndStop(_loc1_ + 1);
            this.f_2.gotoAndStop(_loc1_ + 1);
            this.f_3.gotoAndStop(_loc1_ + 1);
            this.f_4.gotoAndStop(_loc1_ + 1);
            this.f_5.gotoAndStop(_loc1_ + 1);
            this.f_6.gotoAndStop(_loc1_ + 1);
         }
         else
         {
            this.f_1.gotoAndStop(1);
            this.f_2.gotoAndStop(1);
            this.f_3.gotoAndStop(1);
            this.f_4.gotoAndStop(1);
            this.f_5.gotoAndStop(1);
            this.f_6.gotoAndStop(1);
         }
      }
      
      override public function §1t2292s0§() : *
      {
         this.redBG.visible = true;
         super.§1t2292s0§();
      }
      
      override public function §1t3310s0§() : *
      {
         this.redBG.visible = false;
         super.§1t3310s0§();
      }
   }
}

