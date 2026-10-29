package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol62")]
   public class LoadingScreen extends MovieClip
   {
      
      public var pp_7:MovieClip;
      
      public var ff_3:MovieClip;
      
      public var pp_8:MovieClip;
      
      public var ff_4:MovieClip;
      
      public var pp_9:MovieClip;
      
      public var fg_7:MovieClip;
      
      public var f_1:MovieClip;
      
      public var fg_8:MovieClip;
      
      public var ground_1:MovieClip;
      
      public var f_2:MovieClip;
      
      public var f_3:MovieClip;
      
      public var f_29:MovieClip;
      
      public var f_4:MovieClip;
      
      public var f_5:MovieClip;
      
      public var playercanvas:Canvas;
      
      public var f_6:MovieClip;
      
      public var lutbutton:SimpleButton;
      
      public var f_7:MovieClip;
      
      public var f_8:MovieClip;
      
      public var pp_1:MovieClip;
      
      public var f_9:MovieClip;
      
      public var versiontext:TextField;
      
      public var pp_2:MovieClip;
      
      public var pp_3:MovieClip;
      
      public var f_10:MovieClip;
      
      public var loadertext:TextField;
      
      public var tipstext:TextField;
      
      public var loadingtext:TextField;
      
      public var fg_1:MovieClip;
      
      public var pp_4:MovieClip;
      
      public var title_english:shs3title_english;
      
      public var fg_2:MovieClip;
      
      public var pp_5:MovieClip;
      
      public var f_30:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var title_chinese:MovieClip;
      
      public var pp_6:MovieClip;
      
      public var f_31:MovieClip;
      
      public var ff_2:MovieClip;
      
      public function LoadingScreen()
      {
         super();
         LangManager.initTextField(this.loadingtext,true);
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
         this.versiontext.text = "v" + StatsManager.clientVersion.toString();
         stop();
      }
      
      public function setTitleLoading() : *
      {
         this.loadingtext.visible = false;
         this.loadertext.visible = true;
         this.lutbutton.visible = true;
         this.versiontext.visible = true;
         this.tipstext.visible = false;
      }
      
      public function setGameLoading() : *
      {
         this.loadingtext.visible = true;
         this.loadertext.visible = false;
         this.lutbutton.visible = false;
         this.versiontext.visible = false;
         this.tipstext.visible = true;
         var str:String = LangManager.getString(90);
         if(this.loadingtext.text != str)
         {
            this.loadingtext.text = str;
         }
      }
   }
}

