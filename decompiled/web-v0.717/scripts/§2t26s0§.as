package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1041")]
   public class §2t26s0§ extends MovieClip
   {
      
      public var bg:SimpleButton;
      
      public var §1t6859s0§:TextField;
      
      public var itemMCS:§1t6290s0§;
      
      public var §1t467s0§:int;
      
      public var item:§1t17s0§;
      
      public var itemImage:MovieClip;
      
      public var qty:int;
      
      public function §2t26s0§()
      {
         super();
         this.§1t6859s0§.mouseEnabled = false;
      }
      
      public function setItem(param1:§1t17s0§) : §1t17s0§
      {
         this.item = param1;
         return this.item;
      }
      
      public function setQty(param1:int) : *
      {
         this.qty = param1;
         this.§1t6859s0§.text = param1.toString();
      }
      
      public function getQty() : int
      {
         return this.qty;
      }
      
      public function §1t483s0§() : int
      {
         return this.§1t467s0§;
      }
      
      public function §1t6872s0§(param1:int) : void
      {
         this.§1t467s0§ = param1;
         if(this.§1t467s0§ == 0)
         {
            this.itemImage = null;
            this.itemMCS.clearItem();
         }
         else if(this.§1t467s0§ < 3000 && this.§1t467s0§ > 1999)
         {
            this.itemMCS.§1t6297s0§(this.§1t467s0§);
         }
         else if(this.§1t467s0§ < 4000 && this.§1t467s0§ > 2999)
         {
            this.itemMCS.§1t6298s0§(this.§1t467s0§);
         }
         else if(this.§1t467s0§ < 5000 && this.§1t467s0§ > 3999)
         {
            this.itemMCS.§1t6245s0§(this.§1t467s0§);
         }
         else if(this.§1t467s0§ < 6000 && this.§1t467s0§ > 4999)
         {
            this.itemMCS.§1t6262s0§(this.§1t467s0§);
         }
         else if(!(this.§1t467s0§ < 7000 && this.§1t467s0§ > 5999))
         {
            if(this.§1t467s0§ < 8000 && this.§1t467s0§ > 6999)
            {
               this.itemMCS.§1t6240s0§(this.§1t467s0§);
            }
            else if(!(this.§1t467s0§ < 9000 && this.§1t467s0§ > 7999))
            {
               if(this.§1t467s0§ < 10000 && this.§1t467s0§ > 8999)
               {
                  this.itemMCS.§1t6243s0§(this.§1t467s0§);
               }
               else if(!(this.§1t467s0§ < 11000 && this.§1t467s0§ > 9999))
               {
                  if(this.§1t467s0§ < 12000 && this.§1t467s0§ > 10999)
                  {
                     this.itemMCS.§1t6264s0§(this.§1t467s0§);
                  }
                  else if(this.§1t467s0§ < 13000 && this.§1t467s0§ > 11999)
                  {
                     this.itemMCS.§1t6263s0§(this.§1t467s0§);
                  }
                  else if(this.§1t467s0§ < 13500 && this.§1t467s0§ > 12999)
                  {
                     this.itemMCS.§1t6265s0§(this.§1t467s0§);
                  }
                  else if(this.§1t467s0§ < 30000 && this.§1t467s0§ >= 20000)
                  {
                     this.itemMCS.§1t6297s0§(this.§1t467s0§);
                  }
                  else
                  {
                     this.itemMCS.§1t6297s0§(0);
                  }
               }
            }
         }
         if(this.itemImage != null)
         {
            addChild(this.itemImage);
            this.setChildIndex(this.§1t6859s0§,numChildren - 1);
            this.itemImage.x = 35;
            this.itemImage.y = 35;
            this.itemImage.mouseEnabled = false;
            this.itemImage.visible = true;
         }
         this.itemMCS.mouseEnabled = false;
      }
      
      public function §1t5224s0§() : *
      {
         if(this.itemImage)
         {
            this.itemImage.visible = false;
         }
         this.§1t6859s0§.text = "";
         this.§1t467s0§ = 0;
      }
      
      public function §1t5004s0§() : *
      {
         this.addEventListener(MouseEvent.MOUSE_OVER,this.§1t5853s0§);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      public function removeEventListeners() : *
      {
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t5853s0§);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.onMouseOut(null);
      }
      
      public function §1t5853s0§(param1:MouseEvent) : void
      {
         this.§1t6859s0§.textColor = 13421772;
      }
      
      public function onMouseOut(param1:MouseEvent) : void
      {
         this.§1t6859s0§.textColor = 3355443;
      }
   }
}

