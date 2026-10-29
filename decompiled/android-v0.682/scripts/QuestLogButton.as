package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol858")]
   public class QuestLogButton extends MovieClip
   {
      
      public var bg:MovieClip;
      
      public var titletext:TextField;
      
      internal var index:int;
      
      internal var gotSelected:Boolean = false;
      
      public function QuestLogButton(index:int)
      {
         super();
         this.index = index;
         LangManager.initTextField(this.titletext);
         this.titletext.mouseEnabled = false;
      }
      
      public function setTitle(str:String) : *
      {
         this.titletext.text = str;
      }
      
      public function getTitle() : String
      {
         return this.titletext.text;
      }
      
      public function setGotSelected(flag:Boolean) : *
      {
         if(flag == this.gotSelected)
         {
            return;
         }
         this.gotSelected = flag;
         if(flag)
         {
            this.bg.gotoAndStop("selected");
         }
         else
         {
            this.bg.gotoAndStop("unselected");
         }
      }
      
      public function addEventListeners() : *
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      public function removeEventListeners() : *
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         this.onMouseOut(null);
      }
      
      public function onMouseOver(mouseEvent:MouseEvent) : void
      {
         if(this.gotSelected)
         {
            this.bg.gotoAndStop("selectedover");
         }
         else
         {
            this.bg.gotoAndStop("unselectedover");
         }
      }
      
      public function onMouseOut(mouseEvent:MouseEvent) : void
      {
         if(this.gotSelected)
         {
            this.bg.gotoAndStop("selected");
         }
         else
         {
            this.bg.gotoAndStop("unselected");
         }
      }
      
      public function getIndex() : int
      {
         return this.index;
      }
   }
}

