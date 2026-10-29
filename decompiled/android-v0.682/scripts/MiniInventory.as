package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1193")]
   public class MiniInventory extends MovieClip
   {
      
      public var beltitem0:ShopItem;
      
      public var beltitem1:ShopItem;
      
      public var beltitem2:ShopItem;
      
      public var beltitem3:ShopItem;
      
      public var mouseoveritem:TextField;
      
      public var scrollleftbutton:ScrollButton;
      
      public var scrollrightbutton:ScrollButton;
      
      public var bg:MovieClip;
      
      public var beltitem4:ShopItem;
      
      internal var itemSlots:Vector.<ShopItem> = new Vector.<ShopItem>();
      
      internal var itemIndex:* = 0;
      
      internal var inventory:Vector.<Item>;
      
      internal var maxitem:int;
      
      public function MiniInventory()
      {
         super();
         this.itemSlots.push(this.beltitem0);
         this.itemSlots.push(this.beltitem1);
         this.itemSlots.push(this.beltitem2);
         this.itemSlots.push(this.beltitem3);
         this.itemSlots.push(this.beltitem4);
         LangManager.initTextField(this.mouseoveritem);
         this.mouseoveritem.text = LangManager.getString(143);
         for(var i:int = 0; i < 5; i++)
         {
            this.itemSlots[i].buttonMode = true;
         }
      }
      
      public function show() : *
      {
         this.inventory = StatsManager.inventory;
         this.inventory = this.inventory.concat(StatsManager.questItems);
         this.refreshItems();
         this.addEventListeners();
         this.visible = true;
      }
      
      public function refreshItems() : *
      {
         var i:int = 0;
         this.maxitem = this.inventory.length;
         var starti:int = 0;
         for(i = starti; i < 5; i++)
         {
            if(this.itemIndex + i < this.maxitem)
            {
               this.itemSlots[i].visible = true;
               this.itemSlots[i].setItemID(this.inventory[this.itemIndex + i].itemID,this.inventory[this.itemIndex + 1].getShopItemType());
               this.itemSlots[i].costText.text = "";
            }
            else
            {
               this.itemSlots[i].visible = false;
            }
         }
         this.scrollrightbutton.visible = this.maxitem > this.itemIndex + 5;
         this.scrollleftbutton.visible = this.itemIndex != 0;
      }
      
      public function hide() : *
      {
         this.removeEventListeners();
         InputManager.setBattleMode();
         OverworldHUD.instance.showInfoBustButtons(true);
         OverworldHUD.instance.showNodeUI(true);
         OverworldHUD.instance.showChatButton(true);
         visible = false;
      }
      
      public function addEventListeners() : *
      {
         this.scrollrightbutton.addEventListener(MouseEvent.CLICK,this.scrollRight);
         this.scrollleftbutton.addEventListener(MouseEvent.CLICK,this.scrollLeft);
         for(var i:int = 0; i < 5; i++)
         {
            this.itemSlots[i].addEventListener(MouseEvent.MOUSE_OVER,this.mouseOverItem);
            this.itemSlots[i].addEventListener(MouseEvent.CLICK,this.selectItem);
            this.itemSlots[i].addEventListeners();
         }
         this.bg.addEventListener(MouseEvent.MOUSE_OVER,this.mouseOverItem);
         this.bg.addEventListener(MouseEvent.CLICK,this.closePanel);
         StageManager.getGameStage().addEventListener(MouseEvent.CLICK,this.closePanel);
         OverworldHUD.instance.getAdventureModeItem().addEventListener(MouseEvent.CLICK,this.selectSame);
      }
      
      public function removeEventListeners() : *
      {
         this.scrollrightbutton.removeEventListener(MouseEvent.CLICK,this.scrollRight);
         this.scrollleftbutton.removeEventListener(MouseEvent.CLICK,this.scrollLeft);
         for(var i:int = 0; i < 5; i++)
         {
            this.itemSlots[i].removeEventListener(MouseEvent.MOUSE_OVER,this.mouseOverItem);
            this.itemSlots[i].removeEventListener(MouseEvent.CLICK,this.selectItem);
            this.itemSlots[i].removeEventListeners();
         }
         this.bg.removeEventListener(MouseEvent.MOUSE_OVER,this.mouseOverItem);
         this.bg.removeEventListener(MouseEvent.CLICK,this.closePanel);
         StageManager.getGameStage().removeEventListener(MouseEvent.CLICK,this.closePanel);
         OverworldHUD.instance.getAdventureModeItem().removeEventListener(MouseEvent.CLICK,this.selectSame);
      }
      
      public function selectItem(mouseevent:MouseEvent) : *
      {
         OverworldHUD.instance.adventureModeItem.setItemID(mouseevent.target.itemID);
         this.hide();
      }
      
      public function selectSame(mouseevent:MouseEvent) : *
      {
         this.hide();
      }
      
      public function closePanel(mouseevent:MouseEvent) : *
      {
         if(this.visible == true)
         {
            OverworldHUD.instance.adventureModeItem.setItemID(0);
            this.hide();
         }
      }
      
      public function mouseOverItem(mouseevent:MouseEvent) : *
      {
         if(mouseevent.target == this.bg)
         {
            this.mouseoveritem.text = LangManager.getString(143);
         }
         else
         {
            this.mouseoveritem.text = QuestEngine.getItemData(mouseevent.target.itemID).displayname;
         }
      }
      
      public function scrollRight(mouseevent:MouseEvent) : *
      {
         if(this.itemIndex + 5 < this.maxitem)
         {
            this.itemIndex += 1;
         }
         this.refreshItems();
      }
      
      public function scrollLeft(mouseevent:MouseEvent) : *
      {
         if(this.itemIndex != 0)
         {
            --this.itemIndex;
         }
         this.refreshItems();
      }
   }
}

