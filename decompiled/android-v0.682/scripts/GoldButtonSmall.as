package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol909")]
   public class GoldButtonSmall extends MovieClip
   {
      
      public var buttonText:TextField;
      
      public function GoldButtonSmall()
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

