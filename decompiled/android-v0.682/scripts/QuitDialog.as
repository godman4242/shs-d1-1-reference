package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1125")]
   public class QuitDialog extends MovieClip
   {
      
      public var prompt:TextField;
      
      public var submitbutton:GreyButtonSmall;
      
      public var gobackbutton:YellowButtonSmall;
      
      public function QuitDialog()
      {
         super();
         this.gobackbutton.setText(LangManager.getString(0));
         this.submitbutton.setText(LangManager.getString(1));
         LangManager.initTextField(this.prompt);
         this.prompt.text = LangManager.getString(73);
      }
      
      public function addListeners() : *
      {
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.goBack);
         this.submitbutton.addEventListener(MouseEvent.CLICK,this.submit);
         this.gobackbutton.addEventListeners();
         this.submitbutton.addEventListeners();
      }
      
      internal function removeListeners() : *
      {
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.goBack);
         this.submitbutton.removeEventListener(MouseEvent.CLICK,this.submit);
         this.gobackbutton.removeEventListeners();
         this.submitbutton.removeEventListeners();
      }
      
      internal function goBack(event:MouseEvent) : *
      {
         this.removeListeners();
         visible = false;
      }
      
      internal function submit(event:MouseEvent) : *
      {
         this.removeListeners();
         QueryManager.instance.saveModifiedCharData();
         OverworldHUD.instance.friendpanel.closePanel();
         if(GameEngine.isOverworld())
         {
            GameEngine.overworldToTitle();
         }
         else
         {
            NetworkManager.instance.leaveRoom();
            GameEngine.battleModeToTitle();
         }
         if(StatsManager.usePlayerIO)
         {
            NetworkManager.instance.disconnectGlobalPIO();
            NetworkManager.instance.disconnectChatPIO();
         }
      }
   }
}

