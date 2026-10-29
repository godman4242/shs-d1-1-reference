package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol994")]
   public class DialogBoxBig extends MovieClip
   {
      
      public var button:YellowButton;
      
      public var msgText:TextField;
      
      public function DialogBoxBig()
      {
         super();
         LangManager.initTextField(this.msgText);
      }
      
      public function show(msg:String, buttonText:String, showOK:Boolean, auto:int = 0) : void
      {
         if(auto == 0)
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(auto);
         }
         this.msgText.text = msg;
         this.button.setText(buttonText);
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.button.addEventListeners();
         if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.disableInput();
         }
         this.button.visible = showOK;
         if(auto == 0 && this.msgText.numLines > 5)
         {
            gotoAndStop(2);
            this.msgText.text = msg;
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
         if(!GameEngine.isOverworld() && !GameEngine.isTitle() && !OverworldHUD.instance.inventoryUI.visible && (CutsceneManager.instance == null || !CutsceneManager.instance.isShowing()))
         {
            InputManager.setAdventureMode();
         }
         this.visible = false;
      }
   }
}

