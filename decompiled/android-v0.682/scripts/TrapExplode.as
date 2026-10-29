package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol133")]
   public dynamic class TrapExplode extends MovieClip
   {
      
      public function TrapExplode()
      {
         super();
         addFrameScript(6,this.frame7);
      }
      
      internal function frame7() : *
      {
         stop();
         MovieClip(parent).removeChild(this);
      }
   }
}

