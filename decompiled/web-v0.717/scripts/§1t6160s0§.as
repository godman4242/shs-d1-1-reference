package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1347")]
   public class §1t6160s0§ extends MovieClip
   {
      
      public var §1t5829s0§:TextField;
      
      public function §1t6160s0§()
      {
         super();
         this.§1t5829s0§.mouseEnabled = false;
         buttonMode = true;
         §1t1521s0§.§1t9290s0§(this.§1t5829s0§,true);
      }
      
      public function §1t5769s0§(param1:String) : *
      {
         if(this.§1t5829s0§.text != param1)
         {
            this.§1t5829s0§.text = param1;
         }
      }
      
      public function §1t5004s0§() : void
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.§1t5853s0§,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut,false,0,true);
      }
      
      public function removeEventListeners() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.§1t5853s0§);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         this.onMouseOut(null);
      }
      
      public function §1t5853s0§(param1:MouseEvent) : void
      {
         this.§1t5829s0§.textColor = 16777215;
      }
      
      public function onMouseOut(param1:MouseEvent) : void
      {
         this.§1t5829s0§.textColor = 13421772;
      }
   }
}

