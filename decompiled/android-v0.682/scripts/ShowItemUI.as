package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2599")]
   public class ShowItemUI extends MovieClip
   {
      
      public var itemImage:ShopItem;
      
      public var itemName:TextField;
      
      public var button:SimpleButton;
      
      public var itemLevel:TextField;
      
      public var itemDesc:TextField;
      
      public function ShowItemUI()
      {
         super();
         LangManager.initTextField(this.itemName);
         LangManager.initTextField(this.itemDesc);
         this.itemImage.setDisplayOnly();
      }
      
      public function show(item:Item) : void
      {
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.visible = true;
         this.itemImage.setItemID(item.itemID,item.getShopItemType(),item.getPrimaryColor(),item.getSecondaryColor());
         this.itemImage.setQtyText("");
         this.itemName.htmlText = item.getNameBlackBG();
         if(item.getDesc() == "")
         {
            this.itemDesc.htmlText = item.getCompareAttributes();
         }
         else
         {
            this.itemDesc.htmlText = item.getDesc() + "\n\n" + item.getCompareAttributes();
         }
         if(item.getLevel() > 0)
         {
            this.itemLevel.text = LangManager.getString(47) + item.getLevel();
            this.itemDesc.y = 190;
         }
         else
         {
            this.itemLevel.text = "";
            this.itemDesc.y = 180;
         }
      }
      
      public function onClick(mouseEvent:MouseEvent) : void
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.visible = false;
      }
   }
}

