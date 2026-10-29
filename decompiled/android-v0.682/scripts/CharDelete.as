package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2783")]
   public class CharDelete extends MovieClip
   {
      
      public var errormessage:TextField;
      
      public var prompt:TextField;
      
      public var submitbutton:GreyButtonSmall;
      
      public var gobackbutton:YellowButtonSmall;
      
      internal var deletename:String;
      
      public function CharDelete()
      {
         super();
         this.gobackbutton.setText(LangManager.getString(0));
         this.submitbutton.setText(LangManager.getString(1));
         LangManager.initTextField(this.prompt);
         this.prompt.text = LangManager.getString(2);
      }
      
      public function reAddListeners(input:String) : *
      {
         this.errormessage.text = "";
         this.deletename = input;
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.goBack);
         this.submitbutton.addEventListener(MouseEvent.CLICK,this.submitDelete);
         this.gobackbutton.addEventListeners();
         this.submitbutton.addEventListeners();
      }
      
      internal function removeListeners() : *
      {
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.goBack);
         this.submitbutton.removeEventListener(MouseEvent.CLICK,this.submitDelete);
         this.gobackbutton.removeEventListeners();
         this.submitbutton.removeEventListeners();
      }
      
      internal function goBack(event:MouseEvent) : *
      {
         this.removeListeners();
         visible = false;
         if(!StatsManager.singleCharacter)
         {
            TitleUI.instance.switchToCharacterSelect();
         }
         else
         {
            TitleUI.instance.switchToOptions();
         }
      }
      
      internal function submitDelete(event:MouseEvent) : *
      {
         this.removeListeners();
         TitleUI.instance.loadingScreenOn();
         QueryManager.instance.deleteCharacter(this.deletename);
         visible = false;
      }
      
      internal function serverResponse(input:*) : *
      {
         switch(input)
         {
            case 0:
               TitleUI.instance.loadingScreenOff();
               if(!StatsManager.singleCharacter)
               {
                  TitleUI.instance.switchToCharacterSelect();
               }
               else
               {
                  TitleUI.instance.switchToOptions();
               }
               GameEngine.resetTitleMCS();
               Tracker.instance.trackCharDelete();
               break;
            case 1:
            case 2:
            case 3:
               this.reAddListeners(this.deletename);
               TitleUI.instance.loadingScreenOff();
               this.errormessage.text = LangManager.getString(43);
               if(!StatsManager.singleCharacter)
               {
                  TitleUI.instance.switchToCharacterSelect();
               }
               else
               {
                  TitleUI.instance.switchToOptions();
               }
               visible = true;
               break;
            case 4:
            default:
               this.reAddListeners(this.deletename);
               TitleUI.instance.loadingScreenOff();
               this.errormessage.text = LangManager.getString(24);
               visible = true;
         }
      }
   }
}

