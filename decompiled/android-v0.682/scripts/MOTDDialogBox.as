package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2761")]
   public class MOTDDialogBox extends MovieClip
   {
      
      public var button:YellowButton;
      
      public var msgText:TextField;
      
      public var title:TextField;
      
      public function MOTDDialogBox()
      {
         super();
         LangManager.initTextField(this.title,true);
         LangManager.initTextField(this.msgText,true);
         this.title.text = LangManager.getString(174);
      }
      
      public function show(msg:String, buttonText:String) : void
      {
         if(msg != "")
         {
            this.msgText.htmlText = msg;
            this.button.setText(buttonText);
            this.button.addEventListener(MouseEvent.CLICK,this.onClick);
            this.button.addEventListeners();
            if(!GameEngine.isOverworld() && !GameEngine.isTitle())
            {
               InputManager.disableInput();
            }
            this.visible = true;
         }
      }
      
      public function onClick(mouseEvent:MouseEvent) : void
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.button.removeEventListeners();
         if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.setBattleMode();
         }
         this.visible = false;
      }
   }
}

