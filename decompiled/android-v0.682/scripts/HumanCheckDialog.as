package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol980")]
   public class HumanCheckDialog extends MovieClip
   {
      
      public var errortext:TextField;
      
      public var nametext:TextField;
      
      public var titletext:TextField;
      
      public var okbutton:YellowButton;
      
      internal var code:int = 0;
      
      public function HumanCheckDialog()
      {
         super();
         LangManager.initTextField(this.titletext);
         LangManager.initTextField(this.nametext);
         LangManager.initTextField(this.errortext);
         this.okbutton.setText(LangManager.getString(5));
      }
      
      public function show() : *
      {
         InputManager.disableInput();
         this.visible = true;
         this.errortext.visible = false;
         this.addEventListeners();
         this.nametext.text = "";
         this.code = Math.random() * 10000 + 10000;
         this.titletext.text = "Enter the code: " + this.code;
      }
      
      internal function addEventListeners() : *
      {
         this.okbutton.addEventListener(MouseEvent.CLICK,this.okClick);
         this.okbutton.addEventListeners();
      }
      
      internal function removeEventListeners() : *
      {
         this.okbutton.removeEventListener(MouseEvent.CLICK,this.okClick);
         this.okbutton.removeEventListeners();
      }
      
      internal function okClick(event:Event) : *
      {
         if(this.nametext.text == "")
         {
            return;
         }
         if(this.nametext.text == this.code.toString())
         {
            this.removeEventListeners();
            this.visible = false;
            InputManager.setAdventureMode();
            MovieClip(parent).removeChild(this);
         }
         else
         {
            this.errortext.visible = true;
         }
      }
   }
}

