package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol959")]
   public class QuestCompletedDialogBox extends MovieClip
   {
      
      public var button:YellowButton;
      
      public var msgText:TextField;
      
      public var titleText:TextField;
      
      public function QuestCompletedDialogBox()
      {
         super();
         LangManager.initTextField(this.titleText,true);
         LangManager.initTextField(this.msgText);
         this.titleText.text = LangManager.getString(182);
      }
      
      public function show(msg:String, buttonText:String) : void
      {
         if(msg == "")
         {
            return;
         }
         this.msgText.text = msg;
         this.button.setText(buttonText);
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.button.addEventListeners();
         if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.disableInput();
         }
         this.visible = true;
      }
      
      public function showHTML(msg:String) : *
      {
         this.msgText.htmlText = msg;
      }
      
      public function onClick(mouseEvent:MouseEvent) : void
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.button.removeEventListeners();
         if(GameEngine.isAdventureMode())
         {
            InputManager.setAdventureMode();
         }
         else if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.setBattleMode();
         }
         this.visible = false;
         if(!OverworldHUD.instance.lootDialog.visible)
         {
            OverworldHUD.instance.initForAdventureMode();
            OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_REFRESHROOM);
         }
      }
   }
}

