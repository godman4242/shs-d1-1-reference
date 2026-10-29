package shs3_android_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2942")]
   public dynamic class chatTextBattle_43 extends MovieClip
   {
      
      public var chatModeButton:YellowButtonSmall;
      
      public var words:TextField;
      
      public var chatEnterButton:ChatEnterButton;
      
      public var chatlog:TextField;
      
      public function chatTextBattle_43()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

