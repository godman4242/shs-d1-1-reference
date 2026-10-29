package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol491")]
   public dynamic class player_icon extends MovieClip
   {
      
      public var player:MovieClip;
      
      public function player_icon()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

