package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2855")]
   public class BattleIntroBar extends MovieClip
   {
      
      public var actionWord:MovieClip;
      
      internal var displayWord:String;
      
      public function BattleIntroBar()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,24,this.frame25);
         this.visible = false;
         LangManager.initTextField(this.actionWord.textmask.colorText);
      }
      
      public function init(action:int) : *
      {
         this.visible = true;
         this.actionWord.visible = false;
         switch(action)
         {
            case 1:
               this.displayWord = LangManager.getString(104);
               break;
            case 2:
               this.displayWord = LangManager.getString(105);
               break;
            case 3:
               this.displayWord = LangManager.getString(106);
               break;
            case 4:
            case 14:
               this.displayWord = LangManager.getString(107);
               break;
            case 8:
               this.displayWord = LangManager.getString(254);
               break;
            case 9:
            case 10:
               this.displayWord = LangManager.getString(104);
               break;
            case 1000:
               this.displayWord = "ENTERING PVP ZONE";
               break;
            case 1001:
               this.displayWord = "LEAVING PVP ZONE";
               break;
            case 0:
            case 5:
            case 11:
            case 6:
            case 12:
               this.displayWord = "";
               this.visible = false;
         }
         this.actionWord.textmask.colorText.text = this.displayWord;
      }
      
      public function introEnd() : *
      {
         this.visible = false;
      }
      
      internal function frame1() : *
      {
         this.actionWord.visible = false;
      }
      
      internal function frame6() : *
      {
         this.actionWord.visible = true;
      }
      
      internal function frame25() : *
      {
         this.introEnd();
         stop();
      }
   }
}

