package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2584")]
   public class TutorialUI extends MovieClip
   {
      
      public static var instance:TutorialUI;
      
      public var line:DottedLine;
      
      public var bouncingarrow:ArrowBouncing;
      
      public var tutorialtext:TextField;
      
      internal var tutstate:int;
      
      public function TutorialUI()
      {
         super();
         instance = this;
         visible = false;
         this.bouncingarrow.stop();
         this.bouncingarrow.arrow.arrowtext.text = "";
      }
      
      public function getState() : int
      {
         return this.tutstate;
      }
      
      public function setState(num:int) : *
      {
         this.tutstate = num;
         if(num > 0)
         {
            visible = true;
         }
         this.tutorialtext.text = "";
         this.bouncingarrow.visible = true;
         this.line.visible = false;
         this.bouncingarrow.scaleY = 1;
         switch(num)
         {
            case 0:
               visible = false;
               this.bouncingarrow.stop();
               break;
            case 1:
               this.tutorialtext.text = LangManager.getString(628);
               this.bouncingarrow.visible = false;
               this.line.visible = true;
               break;
            case 2:
               this.bouncingarrow.x = 345;
               this.bouncingarrow.y = 390;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = LangManager.getString(631);
               break;
            case 3:
               this.bouncingarrow.x = 420;
               this.bouncingarrow.y = 390;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = LangManager.getString(81);
               break;
            case 4:
               this.bouncingarrow.x = 490;
               this.bouncingarrow.y = 390;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = LangManager.getString(60);
               this.bouncingarrow.scaleY = 1;
               break;
            case 5:
               this.bouncingarrow.x = 55;
               this.bouncingarrow.y = 390;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = LangManager.getString(208);
               break;
            case 6:
               this.bouncingarrow.x = 75;
               this.bouncingarrow.y = 80;
               this.bouncingarrow.scaleY = -1;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = "";
               break;
            case 7:
               this.bouncingarrow.x = 570;
               this.bouncingarrow.y = 390;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = LangManager.getString(633);
               this.bouncingarrow.scaleY = 1;
               break;
            case 8:
               this.bouncingarrow.x = 610;
               this.bouncingarrow.y = 121;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = "Chi Skills";
               this.bouncingarrow.scaleY = 1;
               break;
            case 9:
               this.bouncingarrow.x = 330;
               this.bouncingarrow.y = 70;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = "Equip";
               this.bouncingarrow.scaleY = 1;
               break;
            case 10:
               visible = false;
               break;
            case 11:
               if(StatsManager.getStat(30018) - QueryManager.instance.getServerTime() < 0)
               {
                  OverworldHUD.instance.showGetDailyPrize();
               }
               visible = false;
               this.tutstate = 0;
               break;
            case 12:
               this.bouncingarrow.x = 345;
               this.bouncingarrow.y = 390;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = LangManager.getString(707);
               break;
            case 13:
               this.bouncingarrow.scaleY = -1;
               this.bouncingarrow.x = 77;
               this.bouncingarrow.y = 72;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = "";
               break;
            case 14:
               this.bouncingarrow.scaleY = -1;
               this.bouncingarrow.x = 710;
               this.bouncingarrow.y = 240;
               this.bouncingarrow.play();
               this.bouncingarrow.arrow.arrowtext.text = "";
         }
      }
   }
}

