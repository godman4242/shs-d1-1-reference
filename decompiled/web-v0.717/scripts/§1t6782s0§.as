package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2125")]
   public class §1t6782s0§ extends MovieClip
   {
      
      public var bg:MovieClip;
      
      public var §1t5021s0§:TextField;
      
      internal var index:int;
      
      internal var §1t6783s0§:Boolean = false;
      
      public function §1t6782s0§(param1:int)
      {
         super();
         this.index = param1;
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§);
         this.§1t5021s0§.mouseEnabled = false;
      }
      
      public function §1t6784s0§(param1:String) : *
      {
         this.§1t5021s0§.text = param1;
      }
      
      public function §1t6785s0§() : String
      {
         return this.§1t5021s0§.text;
      }
      
      public function §1t6786s0§(param1:Boolean) : *
      {
         if(param1 == this.§1t6783s0§)
         {
            return;
         }
         this.§1t6783s0§ = param1;
         if(param1)
         {
            this.bg.gotoAndStop("selected");
         }
         else
         {
            this.bg.gotoAndStop("unselected");
         }
      }
      
      public function §1t5004s0§() : *
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.§1t5853s0§);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      public function removeEventListeners() : *
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.§1t5853s0§);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         this.onMouseOut(null);
      }
      
      public function §1t5853s0§(param1:MouseEvent) : void
      {
         if(this.§1t6783s0§)
         {
            this.bg.gotoAndStop("selectedover");
         }
         else
         {
            this.bg.gotoAndStop("unselectedover");
         }
      }
      
      public function onMouseOut(param1:MouseEvent) : void
      {
         if(this.§1t6783s0§)
         {
            this.bg.gotoAndStop("selected");
         }
         else
         {
            this.bg.gotoAndStop("unselected");
         }
      }
      
      public function §1t6787s0§() : int
      {
         return this.index;
      }
   }
}

