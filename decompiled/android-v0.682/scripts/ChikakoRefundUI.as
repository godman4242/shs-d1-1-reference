package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1552")]
   public class ChikakoRefundUI extends MovieClip
   {
      
      public var inside:MovieClip;
      
      public function ChikakoRefundUI()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,69,this.frame70);
         LangManager.initTextField(this.inside.titlelabel);
         this.inside.titlelabel.text = LangManager.getString(722);
      }
      
      public function show() : *
      {
         gotoAndPlay(2);
         visible = true;
         SoundManager.instance.playRefund();
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

