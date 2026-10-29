package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1050")]
   public class OptionButton extends MovieClip
   {
      
      public var buttonText:TextField;
      
      internal var choiceXML:XMLQuestChoice;
      
      public function OptionButton(choice:XMLQuestChoice, xValue:int = 0, yValue:int = 0)
      {
         super();
         LangManager.initTextField(this.buttonText);
         this.buttonText.text = choice.text;
         this.choiceXML = choice;
         this.buttonText.mouseEnabled = false;
         x = xValue;
         y = yValue;
      }
      
      public function getGoto() : int
      {
         return this.choiceXML.goto;
      }
      
      public function getGotoLabel() : String
      {
         return this.choiceXML.gotolabel;
      }
      
      public function applyOutcome() : *
      {
         this.choiceXML.applyOutcome();
      }
   }
}

