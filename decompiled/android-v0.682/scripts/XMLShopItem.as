package
{
   public class XMLShopItem
   {
      
      public var id:int;
      
      public var item:Item;
      
      public var value:int;
      
      public var gvalue:int;
      
      public var hvalue:int;
      
      public var desc:String;
      
      public var text:String;
      
      public function XMLShopItem(xml:XML)
      {
         super();
         if(!xml.hasOwnProperty("id"))
         {
            return;
         }
         this.id = xml.id;
         var itemData:XMLItem = QuestEngine.getItemData(this.id);
         if(xml.value.toString() == "")
         {
            this.value = itemData.gvalue;
         }
         else
         {
            this.value = xml.value;
         }
         this.hvalue = itemData.hvalue;
         this.text = xml.text;
         this.desc = itemData.desc;
      }
      
      public static function create(itemID:int = 0, itemValue:int = 1, itemDesc:String = "", itemText:String = "") : XMLShopItem
      {
         var xmlStr:String = "<buy><id>" + itemID + "</id><value>" + itemValue + "</value><desc>" + itemDesc + "</desc><text>" + itemText + "</text></buy>";
         return new XMLShopItem(new XML(xmlStr));
      }
      
      public function initItem() : *
      {
         if(this.item == null)
         {
            this.item = new Item(this.id,1);
         }
      }
      
      public function initRandomRareItem(rng:RNG) : *
      {
         var itemId:int = 0;
         var itemData:XMLItem = null;
         if(this.item == null)
         {
            this.item = OverworldHUD.instance.lootDialog.getRandomRareItem(NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()),rng);
            this.item.uses = 1;
            itemId = this.item.getItemID();
            itemData = QuestEngine.getItemData(itemId);
            this.id = itemId;
            this.hvalue = 0;
            this.value = itemData.gvalue + this.item.getLevel() * 100;
            this.text = "";
            this.desc = itemData.desc;
         }
      }
      
      public function initRandomRareMerchantItem(rng:RNG) : *
      {
         var itemId:int = 0;
         var itemData:XMLItem = null;
         if(this.item == null)
         {
            this.item = OverworldHUD.instance.lootDialog.getRandomRareMerchantItem(NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()),rng);
            this.item.uses = 1;
            itemId = this.item.getItemID();
            itemData = QuestEngine.getItemData(itemId);
            this.id = itemId;
            this.hvalue = 0;
            this.value = itemData.gvalue + this.item.getLevel() * 100;
            this.text = "";
            this.desc = itemData.desc;
         }
      }
      
      public function initRandomLegendaryMerchantPremiumItem(rng:RNG) : *
      {
         var itemId:int = 0;
         var itemData:XMLItem = null;
         if(this.item == null)
         {
            this.item = OverworldHUD.instance.lootDialog.getRandomLegendaryMerchantPremiumItem(StatsManager.getLevel(),rng);
            itemId = this.item.getItemID();
            itemData = QuestEngine.getItemData(itemId);
            this.id = itemId;
            this.hvalue = 2;
            this.value = 0;
            this.text = "";
            this.desc = itemData.desc;
         }
      }
      
      public function assignFromId(itemId:int, isLegendary:Boolean = false) : *
      {
         var itemData:XMLItem = QuestEngine.getItemData(itemId);
         if(itemData == null)
         {
            trace("XMLShopItem:assignFromId " + itemId + " not found");
            this.id = 0;
            this.hvalue = 0;
            this.value = 0;
            this.text = "";
            this.desc = "Error";
            return;
         }
         this.id = itemId;
         this.hvalue = itemData.hvalue;
         this.value = itemData.gvalue;
         this.text = "";
         this.desc = itemData.desc;
         if(isLegendary)
         {
            this.item = ItemGenerator.instance.generateItem(itemId,StatsManager.getLevel(),true,true);
         }
         else if(itemId == 2129)
         {
            this.item = new Item(itemId,1);
            this.item.addModifier(102,StageManager.getCurrentNode());
         }
         else if(itemId == 2213 || itemId == 2214)
         {
            this.item = new Item(itemId,1);
            this.item.addModifier(StatsManager.STAT_SIDE,StatsManager.getSide());
            this.item.setClanInvitationName(StatsManager.getCustomClanName());
         }
      }
      
      public function setUses(num:int) : *
      {
         var itemData:XMLItem = QuestEngine.getItemData(this.id);
         if(itemData != null)
         {
            if(itemData.durability > 0)
            {
               if(this.item == null)
               {
                  this.initItem();
               }
               this.item.uses = num;
            }
         }
      }
   }
}

