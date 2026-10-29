package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §1t172s0§ extends MovieClip
   {
      
      internal var ID:int;
      
      internal var §1t8152s0§:int;
      
      internal var §1t8153s0§:MovieClip;
      
      internal var connected:Boolean;
      
      public function §1t172s0§()
      {
         super();
      }
      
      public function §1t8154s0§(param1:*) : *
      {
         this.§1t8153s0§.visible = param1;
      }
      
      public function §1t8155s0§(param1:Boolean) : *
      {
         this.connected = param1;
         if(param1)
         {
            MovieClip(this).gotoAndStop(1);
         }
         else
         {
            MovieClip(this).gotoAndStop(5);
         }
      }
      
      public function §1t8156s0§() : void
      {
         this.addEventListener(MouseEvent.ROLL_OUT,this.§1t5853s0§);
         this.addEventListener(MouseEvent.MOUSE_UP,this.§1t8157s0§);
         this.addEventListener(MouseEvent.ROLL_OVER,this.§1t8157s0§);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.§1t8158s0§);
      }
      
      public function §1t5853s0§(param1:MouseEvent) : *
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
      
      public function §1t8157s0§(param1:MouseEvent) : *
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
      
      public function §1t8158s0§(param1:MouseEvent) : *
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
         this.removeEventListener(MouseEvent.ROLL_OUT,this.§1t5853s0§);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.§1t8157s0§);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.§1t8157s0§);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t8158s0§);
      }
   }
}

