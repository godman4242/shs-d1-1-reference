package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2643")]
   public class AdventureItem extends MovieClip
   {
      
      public var costText:TextField;
      
      public var itemMCS:MCSItem;
      
      public var bg:SimpleButton;
      
      public var itemID:int;
      
      public var item:Item;
      
      public var itemImage:MovieClip;
      
      public var qty:int;
      
      public function AdventureItem()
      {
         super();
         this.costText.mouseEnabled = false;
      }
      
      public function setItem(itemRef:Item) : Item
      {
         this.item = itemRef;
         return this.item;
      }
      
      public function setQty(amt:int) : *
      {
         this.qty = amt;
         this.costText.text = amt.toString();
      }
      
      public function getQty() : int
      {
         return this.qty;
      }
      
      public function getItemID() : int
      {
         return this.itemID;
      }
      
      public function setItemID(id:int) : void
      {
         this.itemID = id;
         if(this.itemID == 0)
         {
            this.itemImage = null;
            this.itemMCS.clearItem();
         }
         else if(this.itemID < 3000 && this.itemID > 1999)
         {
            this.itemMCS.setConsumable(this.itemID);
         }
         else if(this.itemID < 4000 && this.itemID > 2999)
         {
            this.itemMCS.setAccessory(this.itemID);
         }
         else if(this.itemID < 5000 && this.itemID > 3999)
         {
            this.itemMCS.setArmor(this.itemID);
         }
         else if(this.itemID < 6000 && this.itemID > 4999)
         {
            this.itemMCS.setGloves(this.itemID);
         }
         else if(!(this.itemID < 7000 && this.itemID > 5999))
         {
            if(this.itemID < 8000 && this.itemID > 6999)
            {
               this.itemMCS.setHat(this.itemID);
            }
            else if(!(this.itemID < 9000 && this.itemID > 7999))
            {
               if(this.itemID < 10000 && this.itemID > 8999)
               {
                  this.itemMCS.setMask(this.itemID);
               }
               else if(!(this.itemID < 11000 && this.itemID > 9999))
               {
                  if(this.itemID < 12000 && this.itemID > 10999)
                  {
                     this.itemMCS.setPants(this.itemID);
                  }
                  else if(this.itemID < 13000 && this.itemID > 11999)
                  {
                     this.itemMCS.setShoes(this.itemID);
                  }
                  else if(this.itemID < 13500 && this.itemID > 12999)
                  {
                     this.itemMCS.setWeapon(this.itemID);
                  }
                  else if(this.itemID < 30000 && this.itemID >= 20000)
                  {
                     this.itemMCS.setConsumable(this.itemID);
                  }
                  else
                  {
                     trace("out of range");
                     this.itemMCS.setConsumable(0);
                  }
               }
            }
         }
         if(this.itemImage != null)
         {
            addChild(this.itemImage);
            this.setChildIndex(this.costText,numChildren - 1);
            this.itemImage.x = 35;
            this.itemImage.y = 35;
            this.itemImage.mouseEnabled = false;
            this.itemImage.visible = true;
         }
         this.itemMCS.mouseEnabled = false;
      }
      
      public function hideAll() : *
      {
         if(this.itemImage)
         {
            this.itemImage.visible = false;
         }
         this.costText.text = "";
         this.itemID = 0;
      }
      
      public function addEventListeners() : *
      {
         this.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      public function removeEventListeners() : *
      {
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.onMouseOut(null);
      }
      
      public function onMouseOver(mouseEvent:MouseEvent) : void
      {
         this.costText.textColor = 13421772;
      }
      
      public function onMouseOut(mouseEvent:MouseEvent) : void
      {
         this.costText.textColor = 3355443;
      }
   }
}

