package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol946")]
   public class QuestTextUI extends MovieClip
   {
      
      public var textBodyText:TextField;
      
      public function QuestTextUI()
      {
         super();
         this.visible = false;
         LangManager.initTextField(this.textBodyText);
         this.textBodyText.condenseWhite = true;
      }
      
      public function show(mainTxt:String) : *
      {
         this.textBodyText.htmlText = mainTxt;
         this.addEventListener(MouseEvent.CLICK,this.onHide);
         this.visible = true;
      }
      
      public function onHide(mouseEvent:MouseEvent) : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.onHide);
         this.visible = false;
         CutsceneManager.getInstance().nextStep();
      }
   }
}

