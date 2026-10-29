package
{
   public class ItemGenerator
   {
      
      public static var instance:ItemGenerator = new ItemGenerator();
      
      internal static var WEAPON:int = 0;
      
      internal static var ARMOR:int = 1;
      
      internal static var GLOVES:int = 2;
      
      internal static var PANTS:int = 3;
      
      internal static var SHOES:int = 4;
      
      internal static var HAT:int = 5;
      
      internal static var MASK:int = 6;
      
      internal static var ACCESSORY:int = 7;
      
      internal static var MAXHP:int = 0;
      
      internal static var HPREGEN:int = 1;
      
      internal static var MAXCHI:int = 2;
      
      internal static var CHIREGEN:int = 3;
      
      internal static var ATTACK:int = 4;
      
      internal static var DEFENSE:int = 5;
      
      internal static var SPEED:int = 6;
      
      internal static var FIREATK:int = 7;
      
      internal static var WINDATK:int = 8;
      
      internal static var WATERATK:int = 9;
      
      internal static var EARTHATK:int = 10;
      
      internal static var FIREDEF:int = 11;
      
      internal static var WINDDEF:int = 12;
      
      internal static var WATERDEF:int = 13;
      
      internal static var EARTHDEF:int = 14;
      
      internal static var CRITICALDMG:int = 15;
      
      internal static var PIERCINGDMG:int = 16;
      
      internal static var MAXINDEX:int = 79;
      
      internal var preSufArray:Vector.<Vector.<PreSuf>>;
      
      internal var prog1:Array;
      
      internal var prog2:Array;
      
      internal var prog3:Array;
      
      internal var prog4:Array;
      
      internal var prog5:Array;
      
      internal var pickableQuestItemDescList:Array;
      
      public var pickableQuestItemDescListLength:int;
      
      internal var colorNameList:Array;
      
      internal var rng:RNG;
      
      public function ItemGenerator()
      {
         var num:int = 0;
         this.preSufArray = new Vector.<Vector.<PreSuf>>();
         this.prog1 = new Array();
         this.prog2 = new Array();
         this.prog3 = new Array();
         this.prog4 = new Array();
         this.prog5 = new Array();
         this.pickableQuestItemDescList = ["Wild","Moldy","Bald","Luminous","Bulbous","Silky","Rough","Stony","Rocky","Large","Tiny","Heavy","Light","Wet","Dried","Faded","Grainy","Pale","Rich","Muddy","Fat","Thin","Pocked","Slimy","Furry","Thorny","Spikey","Feathery","Hairy"];
         this.pickableQuestItemDescListLength = this.pickableQuestItemDescList.length;
         this.colorNameList = [LangManager.getString(432),LangManager.getString(433),LangManager.getString(434),LangManager.getString(435),LangManager.getString(436),LangManager.getString(437),LangManager.getString(438),LangManager.getString(439),LangManager.getString(440),LangManager.getString(441),LangManager.getString(442)];
         super();
         if(instance != null)
         {
            return;
         }
         instance = this;
         for(var i:int = 0; i < MAXINDEX + 1; i++)
         {
            this.preSufArray[i] = new Vector.<PreSuf>();
         }
         var maxhp_pre:Array = ["Vital","Rugged","Tough","Earthy","Dynamic","Wayfarer\'s","Survivor\'s","Guardian\'s"];
         var maxhp_suf:Array = ["of Health","of Fortitude","of Vitality","of Constitution","of Resilience","of Longevity","of Life","of the Ox"];
         var hpregen_pre:Array = ["Warm","Calm","Tireless","Pure","Organic","Regenerating","Healing","Natural"];
         var hpregen_suf:Array = ["of Healing","of Remedy","of Recovery","of Regrowth","of Regeneration","of Blessing","of Restoration","of Regrowth"];
         var maxchi_pre:Array = ["Reserved","Patient","Peaceful","Blessed","Mystic","Spiritual","Priestly","Saintly"];
         var maxchi_suf:Array = ["of Energy","of Wisdom","of Reserve","of Grace","of Logic","of Balance","of Understanding","of Consciousness"];
         var chiregen_pre:Array = ["Blessed","Miko\'s","Priest\'s","Spiritual","Sparkling","Savant","Celestial","Master\'s"];
         var chiregen_suf:Array = ["of Focus","of Meditation","of Chanting","of Concentration","of the Priest","of the Moon","of the Star","of the Sun"];
         var attack_pre:Array = ["Sharp","Fierce","Vicious","Savage","Brutal","Deadly","Fine","Warrior\'s"];
         var attack_suf:Array = ["of Attack","of Biting","of Striking","of Killing","of Slaughter","of Slaying","of Carnage","of the Butcher"];
         var defense_pre:Array = ["Sturdy","Dense","Fortified","Stout","Resistant","Protective","Lord\'s","Shogun\'s"];
         var defense_suf:Array = ["of Defense","of Blocking","of Guarding","of Protection","of Absorption","of Warding","of the Shield","of the Titan"];
         var speed_pre:Array = ["Fast","Quick","Nimble","Hasty","Swift","Whistling","Lizard\'s","Snake\'s"];
         var speed_suf:Array = ["of Speed","of Alacrity","of Haste","of Velocity","of Acceleration","of Sleight","of Swiftness","of Quickness"];
         var fireatk_pre:Array = ["Fiery","Hot","Burning","Scorching","Flaming","Blazing","Sizzling","Molten"];
         var fireatk_suf:Array = ["of Tinder","of Heat","of Ember","of Fire","of Flames","of Inferno","of Lava","of Incineration"];
         var windatk_pre:Array = ["Drafty","Gusty","Gale","Stormy","Howling","Roaring","Shocking","Glowing"];
         var windatk_suf:Array = ["of Air","of Wind","of the Tempest","of the Typhoon","of the Cyclone","of the Tornado","of Shock","of Storms"];
         var wateratk_pre:Array = ["Wet","Chill","Icy","Frosted","Frozen","Arctic","Snowy","Shivering"];
         var wateratk_suf:Array = ["of Water","of Ice","of Snow","of the Squall","of the Blizzard","of the Glacier","of Frost","of Winter"];
         var earthatk_pre:Array = ["Rugged","Hard","Dense","Solid","Rocky","Diamond","Hill\'s","Mountain\'s"];
         var earthatk_suf:Array = ["of Dust","of Earth","of Stone","of Rock","of the Boulder","of the Valley","of the Hill","of the Mountain"];
         var criticaldmg_pre:Array = ["Crit","Crit","Crit","Crit","Crit","Crit","Crit","Crit"];
         var criticaldmg_suf:Array = ["of Crit","of Crit","of Crit","of Crit","of Crit","of Crit","of Crit","of Crit"];
         var piercingdmg_pre:Array = ["Piercing","Piercing","Piercing","Piercing","Piercing","Piercing","Piercing","Piercing"];
         var piercingdmg_suf:Array = ["of Piercing","of Piercing","of Piercing","of Piercing","of Piercing","of Piercing","of Piercing","of Piercing"];
         for(i = 0; i < MAXINDEX + 1; i++)
         {
            num = Math.floor(i / 10);
            this.preSufArray[MAXHP][i] = new PreSuf(maxhp_pre[num],maxhp_suf[num]);
            this.preSufArray[HPREGEN][i] = new PreSuf(hpregen_pre[num],hpregen_suf[num]);
            this.preSufArray[MAXCHI][i] = new PreSuf(maxchi_pre[num],maxchi_suf[num]);
            this.preSufArray[CHIREGEN][i] = new PreSuf(chiregen_pre[num],chiregen_suf[num]);
            this.preSufArray[ATTACK][i] = new PreSuf(attack_pre[num],attack_suf[num]);
            this.preSufArray[DEFENSE][i] = new PreSuf(defense_pre[num],defense_suf[num]);
            this.preSufArray[SPEED][i] = new PreSuf(speed_pre[num],speed_suf[num]);
            this.preSufArray[FIREATK][i] = new PreSuf(fireatk_pre[num],fireatk_suf[num]);
            this.preSufArray[WINDATK][i] = new PreSuf(windatk_pre[num],windatk_suf[num]);
            this.preSufArray[WATERATK][i] = new PreSuf(wateratk_pre[num],wateratk_suf[num]);
            this.preSufArray[EARTHATK][i] = new PreSuf(earthatk_pre[num],earthatk_suf[num]);
            this.preSufArray[FIREDEF][i] = new PreSuf(wateratk_pre[num],wateratk_suf[num]);
            this.preSufArray[WINDDEF][i] = new PreSuf(earthatk_pre[num],earthatk_suf[num]);
            this.preSufArray[WATERDEF][i] = new PreSuf(windatk_pre[num],windatk_suf[num]);
            this.preSufArray[EARTHDEF][i] = new PreSuf(fireatk_pre[num],fireatk_suf[num]);
            this.preSufArray[CRITICALDMG][i] = new PreSuf(criticaldmg_pre[num],criticaldmg_suf[num]);
            this.preSufArray[PIERCINGDMG][i] = new PreSuf(piercingdmg_pre[num],piercingdmg_suf[num]);
         }
         this.rng = new RNG(Math.random() * 10000);
         var maxtier:int = MAXINDEX + 1;
         var base:int = 1;
         var inc:Number = 3 / 3;
         for(i = 0; i < maxtier; i++)
         {
            this.prog1[i] = Math.floor(base + inc * i);
         }
         this.prog1[MAXINDEX] += 10;
         base = 5;
         inc = 5 / 3;
         for(i = 0; i < maxtier; i++)
         {
            this.prog2[i] = Math.floor(base + inc * i);
         }
         this.prog2[MAXINDEX] += 10;
         base = 1;
         inc = 1 / 3;
         for(i = 0; i < maxtier; i++)
         {
            this.prog3[i] = Math.floor(base + inc * i);
         }
         this.prog3[MAXINDEX] += 10;
         base = 1;
         inc = 2 / 3;
         for(i = 0; i < maxtier; i++)
         {
            this.prog4[i] = Math.floor(base + inc * i);
         }
         base = 1;
         inc = 1 / 5;
         for(i = 0; i < maxtier; i++)
         {
            this.prog5[i] = Math.floor(base + inc * i);
         }
      }
      
      public static function destroy() : *
      {
         ItemGenerator.instance = null;
      }
      
      public function setRNGSeed(num:int) : *
      {
         this.rng.setSeed(num);
      }
      
      public function getRNGSeed() : int
      {
         return this.rng.getSeed();
      }
      
      public function randomizeRNGSeed() : *
      {
         this.rng.setSeed(Math.random() * 10000);
      }
      
      internal function getEnchantmentCount(isRareItem:Boolean) : int
      {
         var dice:int = 0;
         if(isRareItem)
         {
            dice = this.rng.rand(11);
            if(dice <= 3)
            {
               return 2;
            }
            if(dice <= 6)
            {
               return 3;
            }
            if(dice <= 9)
            {
               return 4;
            }
            if(dice == 10)
            {
               return 5;
            }
            return 0;
         }
         dice = this.rng.rand(100);
         if(dice <= 84)
         {
            return 0;
         }
         if(dice <= 89)
         {
            return 1;
         }
         if(dice <= 93)
         {
            return 2;
         }
         if(dice <= 96)
         {
            return 3;
         }
         if(dice <= 98)
         {
            return 4;
         }
         return 5;
      }
      
      internal function getItemType(itemID:int) : int
      {
         if(itemID <= 2999)
         {
            return -1;
         }
         if(itemID <= 3999)
         {
            return 7;
         }
         if(itemID <= 4999)
         {
            return 1;
         }
         if(itemID <= 5999)
         {
            return 2;
         }
         if(itemID <= 7999)
         {
            return 5;
         }
         if(itemID <= 9999)
         {
            return 6;
         }
         if(itemID <= 11999)
         {
            return 3;
         }
         if(itemID <= 12999)
         {
            return 4;
         }
         if(itemID <= 13999)
         {
            return 0;
         }
         return -1;
      }
      
      internal function selectedAttribute(pot:Array) : int
      {
         var dice:int = 0;
         var potflag:Boolean = false;
         var i:int = 0;
         while(i < pot.length && !potflag)
         {
            if(pot[i] == 1)
            {
               potflag = true;
            }
            i++;
         }
         if(potflag)
         {
            do
            {
               dice = this.rng.rand(pot.length);
            }
            while(pot[dice] != 1);
            pot[dice] = 0;
            return dice;
         }
         return -1;
      }
      
      internal function getMaxTier(nodelvl:int, getHighestTier:Boolean) : int
      {
         var tier:int = nodelvl + 1;
         if(tier < 0)
         {
            tier = 0;
         }
         else if(tier > MAXINDEX)
         {
            tier = MAXINDEX;
         }
         if(getHighestTier)
         {
            tier = this.rng.rand(4) + tier - 3;
            if(tier < 0)
            {
               tier = 0;
            }
            return tier;
         }
         tier = this.rng.rand(10) + tier - 9;
         if(tier < 0)
         {
            tier = 0;
         }
         return tier;
      }
      
      public function generateItem(itemID:int, nodelvl:int, isRareItem:Boolean = false, isLegendaryItem:Boolean = false) : Item
      {
         var maxTier:int = 0;
         var attrib:int = 0;
         var modvalue:int = 0;
         var modMax:int = 0;
         var modMin:int = 0;
         var maxIndex:int = 0;
         var levelrestriction:int = 0;
         var itemlvl:int = 0;
         var pot:Array = null;
         if(!(itemID >= 3000 && itemID < 20000 && (itemID < 6000 || itemID >= 7000) && (itemID < 8000 || itemID >= 9000)))
         {
            return new Item(itemID,1);
         }
         if(nodelvl > 80)
         {
            nodelvl = 80;
         }
         var newItem:Item = new Item(itemID,1);
         var itemType:int = this.getItemType(itemID);
         var numEnchant:* = this.getEnchantmentCount(isRareItem);
         if(isLegendaryItem && numEnchant > 2)
         {
            numEnchant--;
         }
         var firstSet:Boolean = false;
         var itemdata:XMLItem = QuestEngine.getItemData(itemID);
         if(itemdata != null)
         {
            levelrestriction = itemdata.levelrestriction;
         }
         if(nodelvl > StatsManager.levelCap)
         {
            nodelvl = StatsManager.levelCap;
         }
         else if(!isLegendaryItem)
         {
            nodelvl += this.rng.rand(5) - 2;
         }
         else
         {
            nodelvl--;
         }
         if(nodelvl < 0)
         {
            nodelvl = 0;
         }
         if(itemType == WEAPON)
         {
            pot = [1,1,1,1,1,1,0,1,1,1,1,0,0,0,0,1,1];
         }
         else if(itemType == ARMOR)
         {
            pot = [1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1];
         }
         else if(itemType == GLOVES)
         {
            pot = [1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,0];
         }
         else if(itemType == PANTS)
         {
            pot = [1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,0];
         }
         else if(itemType == SHOES)
         {
            pot = [1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,0];
         }
         else if(itemType == HAT)
         {
            pot = [1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,0];
         }
         else if(itemType == MASK)
         {
            pot = [1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,0];
         }
         else if(itemType == ACCESSORY)
         {
            pot = [1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1];
         }
         var i:int = 0;
         while(i < numEnchant && nodelvl > 0)
         {
            if(i == 0)
            {
               if(itemType == ARMOR)
               {
                  attrib = DEFENSE;
                  pot[DEFENSE] = 0;
               }
               else if(itemType == WEAPON)
               {
                  attrib = ATTACK;
                  pot[ATTACK] = 0;
               }
               else if(itemType == SHOES)
               {
                  attrib = SPEED;
                  pot[SPEED] = 0;
               }
               else
               {
                  attrib = this.selectedAttribute(pot);
               }
            }
            else
            {
               attrib = this.selectedAttribute(pot);
            }
            if(attrib != -1)
            {
               switch(attrib)
               {
                  case ATTACK:
                  case DEFENSE:
                     itemlvl = nodelvl;
                     if(attrib == ATTACK && itemType == WEAPON)
                     {
                        itemlvl -= levelrestriction;
                     }
                     else if(attrib == DEFENSE && itemType == ARMOR)
                     {
                        itemlvl -= levelrestriction;
                     }
                     maxTier = this.getMaxTier(itemlvl,!firstSet);
                     modMax = int(this.prog1[maxTier]);
                     if(maxTier > 0)
                     {
                        modMin = int(this.prog1[maxTier - 1]);
                     }
                     else
                     {
                        modMin = int(this.prog1[0]);
                     }
                     if(modMax != 0)
                     {
                        modvalue = modMin + this.rng.rand(modMax - modMin);
                     }
                     else
                     {
                        modvalue = 0;
                     }
                     break;
                  case SPEED:
                     maxTier = this.getMaxTier(nodelvl,!firstSet);
                     modMax = int(this.prog4[maxTier]);
                     if(maxTier > 0)
                     {
                        modMin = int(this.prog4[maxTier - 1]);
                     }
                     else
                     {
                        modMin = int(this.prog4[0]);
                     }
                     if(modMax != 0)
                     {
                        modvalue = modMin + this.rng.rand(modMax - modMin);
                     }
                     else
                     {
                        modvalue = 0;
                     }
                     break;
                  case MAXHP:
                  case MAXCHI:
                     maxTier = this.getMaxTier(nodelvl,!firstSet);
                     modMax = int(this.prog2[maxTier]);
                     if(maxTier > 0)
                     {
                        modMin = int(this.prog2[maxTier - 1]);
                     }
                     else
                     {
                        modMin = int(this.prog2[0]);
                     }
                     if(modMax != 0)
                     {
                        modvalue = modMin + this.rng.rand(modMax - modMin);
                     }
                     else
                     {
                        modvalue = 0;
                     }
                     break;
                  case FIREATK:
                  case WINDATK:
                  case WATERATK:
                  case EARTHATK:
                  case FIREDEF:
                  case WINDDEF:
                  case WATERDEF:
                  case EARTHDEF:
                  case HPREGEN:
                  case CHIREGEN:
                  case CRITICALDMG:
                     maxTier = this.getMaxTier(nodelvl,!firstSet);
                     modMax = int(this.prog3[maxTier]);
                     if(maxTier > 0)
                     {
                        modMin = int(this.prog3[maxTier - 1]);
                     }
                     else
                     {
                        modMin = int(this.prog3[0]);
                     }
                     if(modMax != 0)
                     {
                        modvalue = modMin + this.rng.rand(modMax - modMin);
                     }
                     else
                     {
                        modvalue = 0;
                     }
                     break;
                  case PIERCINGDMG:
                     maxTier = this.getMaxTier(nodelvl,!firstSet);
                     modMax = int(this.prog5[maxTier]);
                     if(maxTier > 0)
                     {
                        modMin = int(this.prog5[maxTier - 1]);
                     }
                     else
                     {
                        modMin = int(this.prog5[0]);
                     }
                     if(modMax != 0)
                     {
                        modvalue = modMin + this.rng.rand(modMax - modMin);
                     }
                     else
                     {
                        modvalue = 0;
                     }
               }
               switch(attrib)
               {
                  case MAXHP:
                     attrib = StatsManager.STAT_MAXHP;
                     break;
                  case HPREGEN:
                     attrib = StatsManager.STAT_HPREGEN;
                     break;
                  case MAXCHI:
                     attrib = StatsManager.STAT_MAXCHI;
                     break;
                  case CHIREGEN:
                     attrib = StatsManager.STAT_CHIREGEN;
                     break;
                  case ATTACK:
                     attrib = StatsManager.STAT_ATTACK;
                     break;
                  case DEFENSE:
                     attrib = StatsManager.STAT_DEFENSE;
                     break;
                  case SPEED:
                     attrib = StatsManager.STAT_SPEED;
                     break;
                  case FIREATK:
                     attrib = StatsManager.STAT_FIREATK;
                     break;
                  case WINDATK:
                     attrib = StatsManager.STAT_WINDATK;
                     break;
                  case WATERATK:
                     attrib = StatsManager.STAT_WATERATK;
                     break;
                  case EARTHATK:
                     attrib = StatsManager.STAT_EARTHATK;
                     break;
                  case FIREDEF:
                     attrib = StatsManager.STAT_FIREDEF;
                     break;
                  case WINDDEF:
                     attrib = StatsManager.STAT_WINDDEF;
                     break;
                  case WATERDEF:
                     attrib = StatsManager.STAT_WATERDEF;
                     break;
                  case EARTHDEF:
                     attrib = StatsManager.STAT_EARTHDEF;
                     break;
                  case CRITICALDMG:
                     attrib = StatsManager.STAT_CRITICALDMG;
                     break;
                  case PIERCINGDMG:
                     attrib = StatsManager.STAT_PIERCINGDMG;
               }
               if(modvalue != 0)
               {
                  newItem.addModifier(attrib,modvalue);
               }
               if(!isLegendaryItem)
               {
                  firstSet = true;
               }
            }
            i++;
         }
         var xmlItem:XMLItem = QuestEngine.getItemData(itemID);
         if(xmlItem != null && xmlItem.durability != 0)
         {
            if(isLegendaryItem)
            {
               newItem.uses = 0;
            }
            else if(nodelvl < 20)
            {
               newItem.uses = this.rng.rand(xmlItem.durability - 50);
            }
            else
            {
               newItem.uses = this.rng.rand(xmlItem.durability);
            }
         }
         if(itemID == 4062 || itemID == 4077 || itemID == 11040)
         {
            newItem.setPrimaryColor(ColorCode.generateDarkColor(this.rng.getSeed()));
         }
         return newItem;
      }
      
      public function getItemBaseName(item:Item) : String
      {
         var itemXML:XMLItem = QuestEngine.getItemData(item.itemID);
         if(itemXML == null)
         {
            return "?";
         }
         return itemXML.displayname;
      }
      
      public function getProcGenQuestItemName(itemID:int, procGenValue1:int, procGenValue2:int = -1) : String
      {
         var colorhexlist:Array = null;
         var index:int = 0;
         var i:int = 0;
         var basename:String = "";
         var itemXML:XMLItem = QuestEngine.getItemData(itemID);
         if(itemXML == null)
         {
            basename = "?";
         }
         else
         {
            basename = itemXML.displayname;
         }
         if(itemID == 2122 || itemID == 2123 || itemID == 2124 || itemID == 2148)
         {
            if(procGenValue2 == -1)
            {
               return this.pickableQuestItemDescList[procGenValue1] + " " + basename;
            }
            colorhexlist = [16711680,16737792,16763904,39168,13311,6684927,16751103,6697728,16777215,10066329,0];
            index = -1;
            for(i = 0; i < 11; i++)
            {
               if(procGenValue2 == colorhexlist[i])
               {
                  index = i;
                  break;
               }
            }
            if(index != -1)
            {
               return this.colorNameList[index] + " " + this.pickableQuestItemDescList[procGenValue1] + " " + basename;
            }
            return this.pickableQuestItemDescList[procGenValue1] + " " + basename;
         }
         return basename;
      }
      
      public function getGeneratedItemName(item:Item) : String
      {
         var itemName:String = null;
         var basename:String = null;
         var itemXML:XMLItem = QuestEngine.getItemData(item.itemID);
         if(itemXML == null)
         {
            basename = "?";
         }
         else
         {
            basename = itemXML.displayname;
         }
         switch(item.getModifierCount())
         {
            case 0:
               itemName = basename;
               break;
            case 1:
               itemName = this.drawPreSufValue(item.getModifierByIndex(0),true) + " " + basename;
               break;
            case 2:
               itemName = this.drawPreSufValue(item.getModifierByIndex(0),true) + " " + basename + " " + this.drawPreSufValue(item.getModifierByIndex(1),false);
               break;
            case 3:
               itemName = this.drawPreSufValue(item.getModifierByIndex(2),true) + " " + this.drawPreSufValue(item.getModifierByIndex(0),true) + " " + basename + " " + this.drawPreSufValue(item.getModifierByIndex(1),false);
               break;
            default:
               itemName = this.drawPreSufValue(item.getModifierByIndex(3),true) + " " + this.drawPreSufValue(item.getModifierByIndex(2),true) + " " + this.drawPreSufValue(item.getModifierByIndex(0),true) + " " + basename + " " + this.drawPreSufValue(item.getModifierByIndex(1),false);
         }
         return itemName;
      }
      
      public function getModMax(statid:int) : int
      {
         var modid:int = this.statToMod(statid);
         switch(modid)
         {
            case ATTACK:
            case DEFENSE:
               return this.prog1[MAXINDEX];
            case SPEED:
               return this.prog4[MAXINDEX];
            case MAXHP:
            case MAXCHI:
               return this.prog2[MAXINDEX];
            case FIREATK:
            case WINDATK:
            case WATERATK:
            case EARTHATK:
            case FIREDEF:
            case WINDDEF:
            case WATERDEF:
            case EARTHDEF:
            case HPREGEN:
            case CHIREGEN:
            case CRITICALDMG:
               return this.prog3[MAXINDEX];
            case PIERCINGDMG:
               return this.prog5[MAXINDEX];
            default:
               return 0;
         }
      }
      
      internal function statToMod(num:int) : int
      {
         switch(num)
         {
            case StatsManager.STAT_MAXHP:
               return MAXHP;
            case StatsManager.STAT_HPREGEN:
               return HPREGEN;
            case StatsManager.STAT_MAXCHI:
               return MAXCHI;
            case StatsManager.STAT_CHIREGEN:
               return CHIREGEN;
            case StatsManager.STAT_ATTACK:
               return ATTACK;
            case StatsManager.STAT_DEFENSE:
               return DEFENSE;
            case StatsManager.STAT_SPEED:
               return SPEED;
            case StatsManager.STAT_FIREATK:
               return FIREATK;
            case StatsManager.STAT_WINDATK:
               return WINDATK;
            case StatsManager.STAT_WATERATK:
               return WATERATK;
            case StatsManager.STAT_EARTHATK:
               return EARTHATK;
            case StatsManager.STAT_FIREDEF:
               return FIREDEF;
            case StatsManager.STAT_WINDDEF:
               return WINDDEF;
            case StatsManager.STAT_WATERDEF:
               return WATERDEF;
            case StatsManager.STAT_EARTHDEF:
               return EARTHDEF;
            case StatsManager.STAT_CRITICALDMG:
               return CRITICALDMG;
            case StatsManager.STAT_PIERCINGDMG:
               return PIERCINGDMG;
            case 85:
            case 86:
            case 87:
            case 88:
               return -1;
            default:
               return -1;
         }
      }
      
      public function getModTier(statid:int, modvalue:int) : int
      {
         var tier:int = 0;
         var modid:int = this.statToMod(statid);
         if(modid == -1)
         {
            return 0;
         }
         switch(modid)
         {
            case ATTACK:
            case DEFENSE:
               tier = this.reverseFindTier(this.prog1,modvalue);
               break;
            case SPEED:
               tier = this.reverseFindTier(this.prog4,modvalue);
               break;
            case MAXHP:
            case MAXCHI:
               tier = this.reverseFindTier(this.prog2,modvalue);
               break;
            case FIREATK:
            case WINDATK:
            case WATERATK:
            case EARTHATK:
            case FIREDEF:
            case WINDDEF:
            case WATERDEF:
            case EARTHDEF:
            case HPREGEN:
            case CHIREGEN:
            case CRITICALDMG:
               tier = this.reverseFindTier(this.prog3,modvalue);
               break;
            case PIERCINGDMG:
               tier = this.reverseFindTier(this.prog5,modvalue);
         }
         return tier;
      }
      
      internal function drawPreSufValue(mod:Modifier, getPrefix:Boolean) : String
      {
         var attrib:int = this.statToMod(mod.getModifierID());
         var tier:int = this.getModTier(mod.getModifierID(),mod.getModValue());
         if(getPrefix)
         {
            return this.preSufArray[attrib][tier].getPrefix();
         }
         return this.preSufArray[attrib][tier].getSuffix();
      }
      
      internal function reverseFindTier(prog:Array, modvalue:int) : int
      {
         var max:int = int(prog.length);
         for(var i:int = 0; i < max; i++)
         {
            if(modvalue <= prog[i])
            {
               return i;
            }
         }
         return i;
      }
   }
}

