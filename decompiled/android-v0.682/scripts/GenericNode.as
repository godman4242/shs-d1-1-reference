package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class GenericNode extends MovieClip
   {
      
      internal var ID:int;
      
      internal var nodeTypeID:int;
      
      internal var selectedArrow:MovieClip;
      
      internal var connected:Boolean;
      
      public function GenericNode()
      {
         super();
      }
      
      public function showSelectedArrow(flag:*) : *
      {
         this.selectedArrow.visible = flag;
      }
      
      public function setConnected(flag:Boolean) : *
      {
         this.connected = flag;
         if(flag)
         {
            MovieClip(this).gotoAndStop(1);
         }
         else
         {
            MovieClip(this).gotoAndStop(5);
         }
      }
      
      public function setEventListeners() : void
      {
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOver);
         this.addEventListener(MouseEvent.MOUSE_UP,this.onMouseHover);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseHover);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseClick);
      }
      
      public function onMouseOver(mouseEvent:MouseEvent) : *
      {
         if(this.connected)
         {
            MovieClip(this).gotoAndStop(1);
         }
         else
         {
            MovieClip(this).gotoAndStop(5);
         }
      }
      
      public function onMouseHover(mouseEvent:MouseEvent) : *
      {
         if(this.connected)
         {
            MovieClip(this).gotoAndStop(3);
         }
         else
         {
            MovieClip(this).gotoAndStop(5);
         }
      }
      
      public function onMouseClick(mouseEvent:MouseEvent) : *
      {
         if(this.connected)
         {
            MovieClip(this).gotoAndStop(4);
         }
         else
         {
            MovieClip(this).gotoAndStop(5);
         }
      }
      
      public function removeEventListeners() : *
      {
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOver);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseHover);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onMouseHover);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseClick);
      }
   }
}

