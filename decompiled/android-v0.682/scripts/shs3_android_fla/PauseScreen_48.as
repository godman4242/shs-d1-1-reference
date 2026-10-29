package shs3_android_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2945")]
   public dynamic class PauseScreen_48 extends MovieClip
   {
      
      public var loadingtext:TextField;
      
      public var title_english:shs3title_english;
      
      public var title_chinese:MovieClip;
      
      public function PauseScreen_48()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         LangManager.initTextField(this.loadingtext,true);
         this.loadingtext.text = LangManager.getString(407);
         this.title_english.visible = false;
         this.title_chinese.visible = false;
         if(LangManager.getLanguage() == LangManager.ENGLISH)
         {
            this.title_english.visible = true;
         }
         else if(LangManager.getLanguage() == LangManager.CHINESE)
         {
            this.title_chinese.visible = true;
         }
         else
         {
            this.title_english.visible = true;
         }
      }
   }
}

