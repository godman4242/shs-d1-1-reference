package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol151")]
   public dynamic class NinjaSmoke extends MovieClip
   {
      
      public function NinjaSmoke()
      {
         super();
         addFrameScript(9,this.frame10,180,this.frame181);
      }
      
      internal function frame10() : *
      {
         stop();
         MovieClip(parent).removeChild(this);
      }
      
      internal function frame181() : *
      {
         stop();
         MovieClip(parent).removeChild(this);
      }
   }
}

