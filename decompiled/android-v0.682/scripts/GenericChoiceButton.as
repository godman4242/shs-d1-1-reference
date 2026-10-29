package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1056")]
   public class GenericChoiceButton extends MovieClip
   {
      
      public var buttonText:TextField;
      
      public function GenericChoiceButton(input:String = "", xValue:int = 0, yValue:int = 0)
      {
         super();
         LangManager.initTextField(this.buttonText);
         this.buttonText.text = input;
         this.buttonText.mouseEnabled = false;
         if(xValue != 0)
         {
            this.x = xValue;
         }
         if(yValue != 0)
         {
            this.y = yValue;
         }
      }
      
      public function setText(input:String) : void
      {
         this.buttonText.text = input;
      }
   }
}

