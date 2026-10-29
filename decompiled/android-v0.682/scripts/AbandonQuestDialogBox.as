package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol849")]
   public class AbandonQuestDialogBox extends MovieClip
   {
      
      public var bodyBox:TextField;
      
      public var abandonButton:GreyButton;
      
      public var cancelButton:YellowButton;
      
      public function AbandonQuestDialogBox()
      {
         super();
         this.abandonButton.setText(LangManager.getString(40));
         this.cancelButton.setText(LangManager.getString(17));
         LangManager.initTextField(this.bodyBox);
      }
      
      public function addEventListeners() : void
      {
         this.abandonButton.addEventListener(MouseEvent.CLICK,this.onAbandonQuest);
         this.abandonButton.addEventListeners();
         this.cancelButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         this.cancelButton.addEventListeners();
      }
      
      public function removeEventListeners() : void
      {
         this.abandonButton.removeEventListener(MouseEvent.CLICK,this.onAbandonQuest);
         this.abandonButton.removeEventListeners();
         this.cancelButton.removeEventListener(MouseEvent.CLICK,this.onCancel);
         this.cancelButton.removeEventListeners();
      }
      
      public function onAbandonQuest(mouseEvent:MouseEvent) : void
      {
         MovieClip(parent).abandonQuest();
         this.removeEventListeners();
         this.visible = false;
      }
      
      public function onCancel(mouseEvent:MouseEvent) : void
      {
         this.removeEventListeners();
         this.visible = false;
      }
      
      public function show(questTitle:String) : *
      {
         this.addEventListeners();
         this.bodyBox.text = LangManager.getString(3) + "\n\"" + questTitle + "\"?";
         this.visible = true;
      }
   }
}

