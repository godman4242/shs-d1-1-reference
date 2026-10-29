package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol172")]
   public dynamic class bladeslashfx extends MovieClip
   {
      
      public function bladeslashfx()
      {
         super();
         addFrameScript(4,this.frame5);
      }
      
      internal function frame5() : *
      {
         if(parent != null)
         {
            MovieClip(parent).removeChild(this);
         }
      }
   }
}

