package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol847")]
   public class GreyButton extends MovieClip
   {
      
      public var buttonText:TextField;
      
      public function GreyButton()
      {
         super();
         this.buttonText.mouseEnabled = false;
         LangManager.initTextField(this.buttonText,true);
      }
      
      public function setText(input:String) : void
      {
         this.buttonText.text = input;
      }
      
      public function addEventListeners() : void
      {
      }
      
      public function removeEventListeners() : void
      {
      }
   }
}

