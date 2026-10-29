package shs3_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3632")]
   public dynamic class PauseScreen_51 extends MovieClip
   {
      
      public var loadingtext:TextField;
      
      public var title_chinese:MovieClip;
      
      public var title_english:§1t5175s0§;
      
      public function PauseScreen_51()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         §1t1521s0§.§1t9290s0§(this.loadingtext,true);
         this.loadingtext.text = §1t1521s0§.getString(407);
         this.title_english.visible = false;
         this.title_chinese.visible = false;
         if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9271s0§)
         {
            this.title_english.visible = true;
         }
         else if(§1t1521s0§.getLanguage() == §1t1521s0§.CHINESE)
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

