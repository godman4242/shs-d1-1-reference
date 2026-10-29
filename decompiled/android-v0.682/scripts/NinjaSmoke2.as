package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol144")]
   public dynamic class NinjaSmoke2 extends MovieClip
   {
      
      public function NinjaSmoke2()
      {
         super();
         addFrameScript(4,this.frame5);
      }
      
      internal function frame5() : *
      {
         stop();
         MovieClip(parent).removeChild(this);
      }
   }
}

