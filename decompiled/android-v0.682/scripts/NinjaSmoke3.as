package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol139")]
   public dynamic class NinjaSmoke3 extends MovieClip
   {
      
      public function NinjaSmoke3()
      {
         super();
         addFrameScript(5,this.frame6);
      }
      
      internal function frame6() : *
      {
         stop();
         MovieClip(parent).removeChild(this);
      }
   }
}

