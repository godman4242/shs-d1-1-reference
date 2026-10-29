package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1131")]
   public class XCheckBox extends MovieClip
   {
      
      public var cross:MovieClip;
      
      public var buttonText:TextField;
      
      public function XCheckBox()
      {
         super();
         addFrameScript(0,this.frame1);
         this.buttonText.mouseEnabled = false;
         this.cross.mouseEnabled = false;
         LangManager.initTextField(this.buttonText,true);
      }
      
      public function setText(input:String) : void
      {
         this.buttonText.text = input;
      }
      
      public function setCheck(flag:Boolean) : *
      {
         this.cross.visible = flag;
      }
      
      public function toggleCheck() : *
      {
         this.cross.visible = !this.cross.visible;
      }
      
      public function addEventListeners() : void
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut,false,0,true);
      }
      
      public function removeEventListeners() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         this.onMouseOut(null);
      }
      
      public function onMouseOver(mouseEvent:MouseEvent) : void
      {
         this.buttonText.textColor = 16777215;
      }
      
      public function onMouseOut(mouseEvent:MouseEvent) : void
      {
         this.buttonText.textColor = 13421772;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

