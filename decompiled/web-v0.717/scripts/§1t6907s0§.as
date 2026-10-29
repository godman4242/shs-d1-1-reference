package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol939")]
   public class §1t6907s0§ extends MovieClip
   {
      
      public var bg:MovieClip;
      
      public var canvas:§1t5016s0§;
      
      public var §1t6959s0§:TextField;
      
      public var shade:MovieClip;
      
      public var unknown:TextField;
      
      internal var §1t6961s0§:int = 0;
      
      internal var §1t6962s0§:int = 0;
      
      internal var image:MovieClip = null;
      
      internal var §1t6783s0§:Boolean = false;
      
      public function §1t6907s0§()
      {
         super();
         this.canvas.mouseEnabled = false;
         this.§1t6959s0§.mouseEnabled = false;
         this.unknown.visible = false;
         mouseChildren = false;
         this.shade.visible = false;
      }
      
      public function §1t6963s0§() : int
      {
         return this.§1t6961s0§;
      }
      
      public function §1t4491s0§() : int
      {
         return this.§1t6962s0§;
      }
      
      public function §1t6964s0§() : void
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.§1t5853s0§);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      public function §1t6965s0§() : void
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
      
      public function §1t6966s0§(param1:int, param2:int) : *
      {
         this.§1t6961s0§ = param1;
         this.§1t6962s0§ = param2;
         switch(this.§1t6962s0§)
         {
            case 0:
            case 1:
               this.§1t6959s0§.text = "";
               break;
            case 2:
               this.§1t6959s0§.text = "II";
               break;
            case 3:
               this.§1t6959s0§.text = "III";
               break;
            case 4:
               this.§1t6959s0§.text = "IV";
               break;
            case 5:
               this.§1t6959s0§.text = "V";
               break;
            case 6:
               this.§1t6959s0§.text = "VI";
               break;
            case 7:
               this.§1t6959s0§.text = "VII";
               break;
            case 8:
               this.§1t6959s0§.text = "VIII";
               break;
            case 9:
               this.§1t6959s0§.text = "IX";
               break;
            case 10:
               this.§1t6959s0§.text = "X";
         }
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
         }
         this.image = §1t1522s0§.§1t9317s0§(this.§1t6961s0§);
         if(this.image != null)
         {
            this.canvas.addChild(this.image);
            this.image.mouseEnabled = false;
            this.unknown.visible = false;
         }
         else
         {
            this.unknown.visible = true;
         }
         this.shade.visible = param2 == 0;
      }
      
      public function §1t6967s0§() : *
      {
         this.§1t6961s0§ = 0;
         this.§1t6962s0§ = 0;
         this.§1t6959s0§.text = "";
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
            this.image = null;
         }
         this.unknown.visible = false;
         this.shade.visible = false;
      }
      
      public function §1t6968s0§() : *
      {
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
            this.image = null;
         }
         this.unknown.visible = true;
         this.shade.visible = true;
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
      
      public function §1t1470s0§() : Boolean
      {
         if(this.§1t6961s0§ == 0)
         {
            return false;
         }
         return §1t1524s0§.§1t9863s0§(this.§1t6961s0§).§1t1470s0§();
      }
   }
}

