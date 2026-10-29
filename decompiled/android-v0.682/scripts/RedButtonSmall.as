package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol204")]
   public class RedButtonSmall extends MovieClip
   {
      
      public var buttonText:TextField;
      
      public function RedButtonSmall()
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

