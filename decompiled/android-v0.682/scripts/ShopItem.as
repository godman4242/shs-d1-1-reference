package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol787")]
   public class ShopItem extends MovieClip
   {
      
      public var costText:TextField;
      
      public var itemMCS:MCSItem;
      
      public var gold:MovieClip;
      
      public var coin:MovieClip;
      
      public var itemID:int;
      
      public var item:Item;
      
      public var id:int;
      
      public var index:int;
      
      internal var borderType:String = "normal";
      
      public var itemImage:MovieClip;
      
      private var gotSelected:Boolean;
      
      public var cost:int;
      
      public var hcost:int;
      
      internal var showType:int = 0;
      
      public function ShopItem()
      {
         super();
         this.mouseChildren = false;
         this.setGotSelected(false);
         this.coin.visible = false;
         this.gold.visible = false;
         this.costText.mouseEnabled = false;
      }
      
      public function setItem(itemRef:Item) : Item
      {
         this.borderType = itemRef.getShopItemType();
         gotoAndStop(this.borderType + "_default");
         this.item = itemRef;
         return this.item;
      }
      
      public function getItem() : Item
      {
         return this.item;
      }
      
      public function setCost(amt:int, hamt:int) : *
      {
         this.cost = amt;
         this.hcost = hamt;
         if(hamt > 0)
         {
            this.coin.visible = false;
            this.gold.visible = true;
            this.costText.text = hamt.toString();
            this.showType = 2;
         }
         else if(amt > 0)
         {
            this.coin.visible = true;
            this.gold.visible = false;
            this.costText.text = amt.toString();
            this.showType = 1;
         }
         else
         {
            this.coin.visible = true;
            this.gold.visible = false;
            this.costText.text = amt.toString();
            this.showType = 1;
         }
         this.costText.x = 10;
      }
      
      public function getCost() : int
      {
         return this.cost;
      }
      
      public function getHCost() : int
      {
         return this.hcost;
      }
      
      public function setQtyText(str:String) : *
      {
         this.costText.text = str;
         this.costText.x = 20;
         this.showType = 0;
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
            gotoAndStop(this.borderType + "_selected");
         }
         else
         {
            gotoAndStop(this.borderType + "_default");
         }
      }
      
      public function getItemID() : int
      {
         return this.itemID;
      }
      
      public function getItemName() : String
      {
         return QuestEngine.getItemData(this.itemID).displayname;
      }
      
      public function setItemID(id:int, btype:String, pcolor:uint = 1, scolor:uint = 1) : void
      {
         this.itemID = id;
         if(this.itemID == 0)
         {
            this.itemImage = null;
            this.itemMCS.clearItem();
         }
         else if(this.itemID == 1)
         {
            this.itemMCS.setConsumable(1);
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
         else if(this.itemID < 7000 && this.itemID > 5999)
         {
            this.itemMCS.setHair(this.itemID);
         }
         else if(this.itemID < 8000 && this.itemID > 6999)
         {
            this.itemMCS.setHat(this.itemID);
         }
         else if(this.itemID < 9000 && this.itemID > 7999)
         {
            this.itemMCS.setHead(this.itemID);
         }
         else if(this.itemID < 10000 && this.itemID > 8999)
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
               trace("ShopItem: out of range " + this.itemID);
               this.itemMCS.setConsumable(0);
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
         if(pcolor != Item.NOCOLOR)
         {
            this.itemMCS.setPrimaryColor(pcolor);
         }
         if(scolor != Item.NOCOLOR)
         {
            this.itemMCS.setSecondaryColor(scolor);
         }
         this.borderType = btype;
         gotoAndStop(this.borderType + "_default");
      }
      
      public function setPrimaryColor(color:uint) : *
      {
         this.itemMCS.setPrimaryColor(color);
      }
      
      public function setSecondaryColor(color:uint) : *
      {
         this.itemMCS.setSecondaryColor(color);
      }
      
      public function getPrimaryColor() : uint
      {
         return this.item.getPrimaryColor();
      }
      
      public function getSecondaryColor() : uint
      {
         return this.item.getSecondaryColor();
      }
      
      public function getBorderType() : String
      {
         return this.borderType;
      }
      
      public function setDisplayOnly() : *
      {
         gotoAndStop(this.borderType + "_default");
         this.setQtyText("");
      }
      
      public function hideAll() : *
      {
         if(this.itemImage)
         {
            this.itemImage.visible = false;
         }
         this.gold.visible = false;
         this.coin.visible = false;
         this.setQtyText("");
         this.itemID = 0;
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
            gotoAndStop(this.borderType + "_selectedmouseover");
         }
         else
         {
            gotoAndStop(this.borderType + "_mouseover");
         }
      }
      
      public function onMouseOut(mouseEvent:MouseEvent) : void
      {
         if(this.gotSelected)
         {
            gotoAndStop(this.borderType + "_selected");
         }
         else
         {
            gotoAndStop(this.borderType + "_default");
         }
      }
      
      public function setIndex(num:int) : *
      {
         this.index = num;
      }
      
      public function getIndex() : int
      {
         return this.index;
      }
   }
}

