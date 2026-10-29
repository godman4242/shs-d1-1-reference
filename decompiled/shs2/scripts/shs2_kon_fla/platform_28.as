package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2140")]
   public dynamic class platform_28 extends MovieClip
   {
      
      public var deco2:MovieClip;
      
      public var deco1:MovieClip;
      
      public var platform:MovieClip;
      
      public function platform_28()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function init() : *
      {
         deco1.visible = Math.random() * 2 > 1;
         deco2.visible = Math.random() * 2 > 1;
      }
      
      internal function frame1() : *
      {
      }
   }
}

