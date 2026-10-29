package
{
   public class XMLShopData
   {
      
      public var name:int = 2002;
      
      public var npcID:int = 104;
      
      public var welcome:String = LangManager.getString(2003);
      
      public var sellList:Vector.<XMLShopItem> = new Vector.<XMLShopItem>();
      
      public var buyList:Vector.<XMLShopItem> = new Vector.<XMLShopItem>();
      
      public function XMLShopData(xml:XMLList)
      {
         super();
         if(!xml.hasOwnProperty("id"))
         {
            return;
         }
         this.name = int(xml.name);
         this.npcID = xml.npc;
         if(xml.welcome.toString() != "")
         {
            this.welcome = LangManager.getString(xml.welcome);
         }
         var length:int = int(xml.sell.length());
         for(var i:int = 0; i < length; i++)
         {
            this.sellList.push(new XMLShopItem(xml.sell[i]));
         }
         length = int(xml.buy.length());
         for(i = 0; i < length; i++)
         {
            this.buyList.push(new XMLShopItem(xml.buy[i]));
         }
      }
      
      public function initPeddlerItems(rng:RNG) : *
      {
         var xsi:XMLShopItem = null;
         this.npcID = 104;
         this.name = 2002;
         var defaultItems:Array = [13100,2119,2120,2501,2204,2202,2210];
         var extraItems:Array = [2115,2116,2117,2118,2140,2141,3000,3001,4037,4018,4019,11004,11012,11013,11016,11033,11018,11019,12001,12003,12004,12005,12010,13022];
         var removeCount:int = extraItems.length - (10 + defaultItems.length);
         for(var j:int = 0; j < removeCount; j++)
         {
            extraItems.splice(rng.rand(extraItems.length),1);
         }
         defaultItems = defaultItems.concat(extraItems);
         for(var i:int = 0; i < defaultItems.length; i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.assignFromId(defaultItems[i]);
            xsi.setUses(1);
            this.sellList.push(xsi);
         }
      }
      
      public function initInnItems(rng:RNG) : *
      {
         var xsi:XMLShopItem = null;
         this.npcID = 148;
         this.name = 148;
         var defaultItems:Array = [2103,2104,2105,2216,2106,2107,2108];
         var extraItems:Array = [2109,2110,2111,2112,2113,2114];
         var removeCount:int = 3;
         for(var j:int = 0; j < removeCount; j++)
         {
            extraItems.splice(rng.rand(extraItems.length),1);
         }
         defaultItems = defaultItems.concat(extraItems);
         for(var i:int = 0; i < defaultItems.length; i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.assignFromId(defaultItems[i]);
            this.sellList.push(xsi);
         }
      }
      
      public function initMerchantItems() : *
      {
         var xsi:XMLShopItem = null;
         this.npcID = 52;
         this.name = 2012;
         var defaultItems:Array = [];
         for(var i:int = 0; i < defaultItems.length; i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.assignFromId(defaultItems[i]);
            this.sellList.push(xsi);
         }
      }
      
      public function initPremiumItems() : *
      {
         var xsi:XMLShopItem = null;
         var seed:int = QueryManager.instance.getServerDate();
         ItemGenerator.instance.setRNGSeed(seed * Math.floor(QueryManager.instance.getServerTime() / (60 * 60)));
         var defaultItems:Array = QuestEngine.premiumDefaultList;
         var specialItems:Array = QuestEngine.premiumSpecialList;
         var rotationItems:Array = QuestEngine.premiumRotationList;
         for(var i:int = 0; i < defaultItems.length; i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.assignFromId(defaultItems[i]);
            if(!(defaultItems[i] == 2212 && (StatsManager.getWarRank() < 10 || StatsManager.getStat(2212) > 0 || StatsManager.isCustomClan(StatsManager.getSide()) && StatsManager.isCustomClanFounder())))
            {
               if(!(defaultItems[i] == 2215 && !(StatsManager.isCustomClan(StatsManager.getSide()) && StatsManager.isCustomClanFounder())))
               {
                  if(!(defaultItems[i] == 2213 && !StatsManager.isCustomClan(StatsManager.getSide())))
                  {
                     this.sellList.push(xsi);
                  }
               }
            }
         }
         for(i = 0; i < specialItems.length; i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.assignFromId(specialItems[i],true);
            this.sellList.push(xsi);
         }
         var rng:RNG = new RNG(seed * Math.floor(QueryManager.instance.getServerTime() / (60 * 60)));
         var selectedSet:XMLList = XMLList(rotationItems[rng.rand(rotationItems.length)]);
         for(i = 0; i < selectedSet.item.length(); i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.assignFromId(selectedSet.item[i],true);
            this.sellList.push(xsi);
         }
      }
      
      public function initBarberItems(rng:RNG) : *
      {
         var xsi:XMLShopItem = null;
         this.npcID = 52;
         this.name = 5062;
         var defaultItems:Array = [2205,6019,6020,6007,6009,6006,6010,6011,6013,6008,6014,6015,6017,6018,6002,6003,6004,6001,6012,6005,6021,6023,6024,6026,6034,6044,6043,6039,6040,6041,6042,6043,6035,6036,6037,8005,8006,8004,8500,8502,8503,8007,8003,7037,7038,7049,8012,8014,8501];
         var removeCount:int = defaultItems.length - 16;
         for(var j:int = 0; j < removeCount; j++)
         {
            defaultItems.splice(rng.rand(defaultItems.length),1);
         }
         for(var i:int = 0; i < defaultItems.length; i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.assignFromId(defaultItems[i]);
            this.sellList.push(xsi);
         }
      }
   }
}

