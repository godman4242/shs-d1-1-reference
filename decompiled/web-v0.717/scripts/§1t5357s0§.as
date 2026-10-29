package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1815")]
   public class §1t5357s0§ extends MovieClip
   {
      
      public var inside:MovieClip;
      
      public function §1t5357s0§()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,69,this.frame70);
         §1t1521s0§.§1t9290s0§(this.inside.titlelabel);
         this.inside.titlelabel.text = §1t1521s0§.getString(722);
      }
      
      public function show() : *
      {
         gotoAndPlay(2);
         visible = true;
         §1t88s0§.instance.§1t1515s0§();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         this.inside.cacheAsBitmap = true;
      }
      
      internal function frame70() : *
      {
         stop();
         visible = false;
         this.inside.cacheAsBitmap = false;
      }
   }
}

