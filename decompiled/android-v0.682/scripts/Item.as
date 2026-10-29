package
{
   public class Item
   {
      
      public static var NOCOLOR:uint = 1;
      
      public static var PCOLORMODID:int = 80;
      
      public static var SCOLORMODID:int = 81;
      
      public static var USESMODID:int = 82;
      
      public static var NAMEMODID:int = 89;
      
      public static var CREATORMODID:int = 125;
      
      public static var USEPROCGENNAME:String = "0";
      
      public var itemID:int;
      
      private var qty:ObfuscatedObject = new ObfuscatedObject();
      
      public var modifiers:Vector.<Modifier> = new Vector.<Modifier>();
      
      internal var itemName:String = "";
      
      internal var primaryColor:uint = NOCOLOR;
      
      internal var secondaryColor:uint = NOCOLOR;
      
      internal var named:Boolean = false;
      
      public var uses:int = 0;
      
      internal var weight:int = -1;
      
      internal var creator:String = "";
      
      public function Item(id:int = 0, quantity:int = 1)
      {
         super();
         this.itemID = id;
         this.qty.setIntValue(quantity);
      }
      
      public static function parse(str:String) : Item
      {
         var modArray:Array = null;
         var modid:int = 0;
         var q:* = undefined;
         var modvalArray:Array = null;
         var modmax:int = 0;
         var modvalue:int = 0;
         var strArray:Array = str.split(",");
         var item:Item = new Item(int(strArray[0]),int(strArray[1]));
         if(strArray.length == 3)
         {
            modArray = strArray[2].split("#");
            for(q = 0; q < modArray.length; q++)
            {
               if(modArray[q] != "")
               {
                  modvalArray = modArray[q].split("@");
                  modid = int(modvalArray[0]);
                  if(modid == PCOLORMODID)
                  {
                     item.primaryColor = uint(modvalArray[1]);
                  }
                  else if(modid == SCOLORMODID)
                  {
                     item.secondaryColor = uint(modvalArray[1]);
                  }
                  else if(modid == USESMODID)
                  {
                     item.uses = int(modvalArray[1]);
                  }
                  else if(modid == NAMEMODID)
                  {
                     item.itemName = modvalArray[1];
                     if(!isClanInvitation(item.itemID))
                     {
                        item.named = true;
                     }
                  }
                  else if(modid == CREATORMODID)
                  {
                     item.setCreator(modvalArray[1]);
                  }
                  else
                  {
                     modmax = ItemGenerator.instance.getModMax(modid);
                     modvalue = int(modvalArray[1]);
                     if(modmax != 0 && modvalue > modmax)
                     {
                        modvalue = modmax;
                     }
                     item.addModifier(modid,modvalue);
                  }
               }
            }
         }
         return item;
      }
      
      public static function parseNoQty(str:String) : Item
      {
         var modArray:Array = null;
         var modid:int = 0;
         var q:* = undefined;
         var modvalArray:Array = null;
         var modmax:int = 0;
         var modvalue:int = 0;
         var strArray:Array = str.split(",");
         var item:Item = new Item(int(strArray[0]),1);
         if(strArray.length == 2)
         {
            modArray = strArray[1].split("#");
            for(q = 0; q < modArray.length; q++)
            {
               if(modArray[q] != "")
               {
                  modvalArray = modArray[q].split("@");
                  modid = int(modvalArray[0]);
                  if(modid == PCOLORMODID)
                  {
                     item.primaryColor = uint(modvalArray[1]);
                  }
                  else if(modid == SCOLORMODID)
                  {
                     item.secondaryColor = uint(modvalArray[1]);
                  }
                  else if(modid == USESMODID)
                  {
                     item.uses = int(modvalArray[1]);
                  }
                  else if(modid == NAMEMODID)
                  {
                     item.itemName = modvalArray[1];
                     if(!isClanInvitation(item.itemID))
                     {
                        item.named = true;
                     }
                  }
                  else if(modid == CREATORMODID)
                  {
                     item.setCreator(modvalArray[1]);
                  }
                  else
                  {
                     modmax = ItemGenerator.instance.getModMax(modid);
                     modvalue = int(modvalArray[1]);
                     if(modmax != 0 && modvalue > modmax)
                     {
                        modvalue = modmax;
                     }
                     item.addModifier(modid,modvalue);
                  }
               }
            }
         }
         return item;
      }
      
      public static function isClanInvitation(id:int) : Boolean
      {
         return id == 2213 || id == 2214;
      }
      
      public function getItemID() : int
      {
         return this.itemID;
      }
      
      public function getQuantity() : int
      {
         return this.qty.getIntValue();
      }
      
      public function setQuantity(quantity:int) : *
      {
         this.qty.setIntValue(quantity);
      }
      
      public function changeQuantity(quantity:int) : *
      {
         this.qty.changeIntValue(quantity);
      }
      
      public function toString() : String
      {
         var tempString:String = this.itemID + "," + this.getQuantity();
         if(this.modifiers.length > 0 || this.primaryColor != NOCOLOR || this.secondaryColor != NOCOLOR || this.uses > 0 || this.named)
         {
            tempString += ",";
         }
         for(var q:* = 0; q < this.modifiers.length; q++)
         {
            tempString += this.modifiers[q].modifierID + "@" + this.modifiers[q].value + "#";
         }
         if(this.primaryColor != NOCOLOR)
         {
            tempString += PCOLORMODID + "@" + this.primaryColor + "#";
         }
         if(this.secondaryColor != NOCOLOR)
         {
            tempString += SCOLORMODID + "@" + this.secondaryColor + "#";
         }
         if(this.uses != 0)
         {
            tempString += USESMODID + "@" + this.uses + "#";
         }
         if(this.named || isClanInvitation(this.itemID))
         {
            tempString += NAMEMODID + "@" + this.itemName + "#";
         }
         if(this.creator != "")
         {
            tempString += CREATORMODID + "@" + this.creator + "#";
         }
         return tempString;
      }
      
      public function equals(item:Item) : Boolean
      {
         return this.toStringNoQty() == item.toStringNoQty();
      }
      
      public function toStringNoQty() : String
      {
         var tempString:String = String(this.itemID);
         if(this.modifiers.length > 0 || this.primaryColor != NOCOLOR || this.secondaryColor != NOCOLOR || this.uses > 0 || this.named)
         {
            tempString += ",";
         }
         for(var q:* = 0; q < this.modifiers.length; q++)
         {
            tempString += this.modifiers[q].modifierID + "@" + this.modifiers[q].value + "#";
         }
         if(this.primaryColor != NOCOLOR)
         {
            tempString += PCOLORMODID + "@" + this.primaryColor + "#";
         }
         if(this.secondaryColor != NOCOLOR)
         {
            tempString += SCOLORMODID + "@" + this.secondaryColor + "#";
         }
         if(this.uses != 0)
         {
            tempString += USESMODID + "@" + this.uses + "#";
         }
         if(this.named || isClanInvitation(this.itemID))
         {
            tempString += NAMEMODID + "@" + this.itemName + "#";
         }
         if(this.creator != "")
         {
            tempString += CREATORMODID + "@" + this.creator + "#";
         }
         return tempString;
      }
      
      internal function GeneratedItem(itemID:int) : *
      {
         this.itemID = itemID;
      }
      
      internal function addModifier(attrib:int, modvalue:int) : *
      {
         var newMod:* = new Modifier(attrib,modvalue);
         this.modifiers.push(newMod);
      }
      
      public function getLevel() : int
      {
         var modifier:Modifier = null;
         var baselevel:int = QuestEngine.getItemData(this.itemID).levelrestriction;
         var max:int = int(this.modifiers.length);
         var maxlevel:int = 0;
         var modlevel:int = 0;
         for(var q:int = 0; q < max; q++)
         {
            modifier = this.modifiers[q];
            modlevel = ItemGenerator.instance.getModTier(modifier.getModifierID(),modifier.getModValue()) + 1;
            if(modlevel > maxlevel)
            {
               maxlevel = modlevel;
            }
         }
         var lvl:int = maxlevel;
         if(lvl < baselevel)
         {
            lvl = baselevel;
         }
         if(lvl > StatsManager.levelCap)
         {
            lvl = StatsManager.levelCap;
         }
         return lvl;
      }
      
      public function getModifierByIndex(index:int) : Modifier
      {
         return this.modifiers[index];
      }
      
      public function getModifierCount() : int
      {
         return this.modifiers.length;
      }
      
      public function hasModifiers() : Boolean
      {
         return this.modifiers.length > 0;
      }
      
      public function copyModifiers(mods:Vector.<Modifier>) : *
      {
         var modid:int = 0;
         this.modifiers.length = 0;
         var max:int = int(mods.length);
         for(var i:int = 0; i < max; i++)
         {
            modid = mods[i].getModifierID();
            if(modid != 85 && modid != 86 && modid != 87 && modid != 88)
            {
               this.addModifier(modid,mods[i].getModValue());
            }
         }
      }
      
      public function isPickableQuestItem() : Boolean
      {
         return this.itemID == 2122 || this.itemID == 2123 || this.itemID == 2124 || this.itemID == 2148;
      }
      
      public function isTradeQuestItem() : Boolean
      {
         return this.itemID == 20103 || this.itemID == 20104 || this.itemID == 20105 || this.itemID == 20106 || this.itemID == 20107;
      }
      
      public function isQuestItem() : Boolean
      {
         return this.itemID >= 20000;
      }
      
      public function isOre() : Boolean
      {
         return this.itemID >= 20060 && this.itemID <= 20066;
      }
      
      public function isPremiumItem() : Boolean
      {
         var itemxml:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemxml == null)
         {
            return false;
         }
         return itemxml.hvalue > 0;
      }
      
      public function isNoGive() : Boolean
      {
         var itemxml:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemxml == null)
         {
            return false;
         }
         return itemxml.nogive;
      }
      
      public function canDrop() : Boolean
      {
         var itemxml:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemxml == null)
         {
            return true;
         }
         return !itemxml.nodrop;
      }
      
      public function getShopItemType() : String
      {
         var output:String = "";
         var modifierCount:int = int(this.modifiers.length);
         var isTradeQuestItem:Boolean = this.itemID == 20103 || this.itemID == 20104 || this.itemID == 20105 || this.itemID == 20106 || this.itemID == 20107;
         if(this.isPickableQuestItem() || isTradeQuestItem)
         {
            modifierCount = 0;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemxml != null && itemxml.unique == 1 || this.isPickableQuestItem() || isTradeQuestItem || this.isPlayerNamed())
         {
            return "unique";
         }
         if(modifierCount >= 3)
         {
            return "rare";
         }
         if(modifierCount > 0)
         {
            return "special";
         }
         return "normal";
      }
      
      public function getName() : String
      {
         var output:String = "";
         var modifierCount:int = int(this.modifiers.length);
         var isTradeQuestItem:Boolean = this.itemID == 20103 || this.itemID == 20104 || this.itemID == 20105 || this.itemID == 20106 || this.itemID == 20107;
         if(this.isPickableQuestItem() || isTradeQuestItem)
         {
            modifierCount = 0;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(this.itemID);
         if(!OverworldHUD.getInstance().inventoryUI.visible && (OverworldHUD.getInstance().lootDialog.visible || OverworldHUD.getInstance().gotGiftDialog.visible))
         {
            if(itemxml != null && itemxml.unique == 1 || this.isPickableQuestItem() || isTradeQuestItem || this.isPlayerNamed())
            {
               output += "<font color=\"#b048f8\">";
            }
            else if(modifierCount >= 3)
            {
               output += "<font color=\"#0080ff\">";
            }
            else if(modifierCount > 0)
            {
               output += "<font color=\"#1eff00\">";
            }
            else
            {
               output += "<font color=\"#FFFFFF\">";
            }
         }
         else if(itemxml != null && itemxml.unique == 1 || this.isPickableQuestItem() || isTradeQuestItem || this.isPlayerNamed())
         {
            output += "<font color=\"#6600cc\">";
         }
         else if(modifierCount >= 3)
         {
            output += "<font color=\"#003399\">";
         }
         else if(modifierCount > 0)
         {
            output += "<font color=\"#336600\">";
         }
         else
         {
            output += "<font color=\"#000000\">";
         }
         if(this.creator != "")
         {
            if(this.named && this.itemName != USEPROCGENNAME)
            {
               output += this.creator + "\'s " + this.itemName;
            }
            else
            {
               output += this.creator + "\'s " + ItemGenerator.instance.getItemBaseName(this);
            }
         }
         else if(this.named)
         {
            if(this.itemName != USEPROCGENNAME)
            {
               output += this.itemName;
            }
            else
            {
               output += ItemGenerator.instance.getGeneratedItemName(this);
            }
         }
         else if(this.isPickableQuestItem())
         {
            output += ItemGenerator.instance.getProcGenQuestItemName(this.itemID,this.getModifierById(85),this.getPrimaryColor());
         }
         else if(isTradeQuestItem)
         {
            output += QuestGenerator.instance.getNPCTradeGiveItemName(this);
         }
         else
         {
            output += ItemGenerator.instance.getItemBaseName(this);
         }
         return output + "</font>";
      }
      
      public function getNameBlackBG() : String
      {
         var output:String = "";
         var modifierCount:int = int(this.modifiers.length);
         var isTradeQuestItem:Boolean = this.itemID == 20103 || this.itemID == 20104 || this.itemID == 20105 || this.itemID == 20106 || this.itemID == 20107;
         if(this.isPickableQuestItem() || isTradeQuestItem)
         {
            modifierCount = 0;
         }
         if(QuestEngine.getItemData(this.itemID).unique == 1 || this.isPickableQuestItem() || isTradeQuestItem || this.isPlayerNamed())
         {
            output += "<font color=\"#b048f8\">";
         }
         else if(modifierCount >= 3)
         {
            output += "<font color=\"#0080ff\">";
         }
         else if(modifierCount > 0)
         {
            output += "<font color=\"#1eff00\">";
         }
         else
         {
            output += "<font color=\"#FFFFFF\">";
         }
         if(this.creator != "")
         {
            if(this.named && this.itemName != USEPROCGENNAME)
            {
               output += this.creator + "\'s " + this.itemName;
            }
            else
            {
               output += this.creator + "\'s " + ItemGenerator.instance.getItemBaseName(this);
            }
         }
         else if(this.named)
         {
            if(this.itemName != USEPROCGENNAME)
            {
               output += this.itemName;
            }
            else
            {
               output += ItemGenerator.instance.getGeneratedItemName(this);
            }
         }
         else if(this.isPickableQuestItem())
         {
            output += ItemGenerator.instance.getProcGenQuestItemName(this.itemID,this.getModifierById(85),this.getPrimaryColor());
         }
         else if(isTradeQuestItem)
         {
            output += QuestGenerator.instance.getNPCTradeGiveItemName(this);
         }
         else
         {
            output += ItemGenerator.instance.getItemBaseName(this);
         }
         return output + "</font>";
      }
      
      public function getNameBlackBGBrackets() : String
      {
         var output:String = "";
         var modifierCount:int = int(this.modifiers.length);
         var isTradeQuestItem:Boolean = this.itemID == 20103 || this.itemID == 20104 || this.itemID == 20105 || this.itemID == 20106 || this.itemID == 20107;
         if(this.isPickableQuestItem() || isTradeQuestItem)
         {
            modifierCount = 0;
         }
         if(QuestEngine.getItemData(this.itemID).unique == 1 || this.isPickableQuestItem() || isTradeQuestItem || this.isPlayerNamed())
         {
            output += "<font color=\"#b048f8\">[";
         }
         else if(modifierCount >= 3)
         {
            output += "<font color=\"#0080ff\">[";
         }
         else if(modifierCount > 0)
         {
            output += "<font color=\"#1eff00\">[";
         }
         else
         {
            output += "<font color=\"#FFFFFF\">[";
         }
         if(this.creator != "")
         {
            if(this.named && this.itemName != USEPROCGENNAME)
            {
               output += this.creator + "\'s " + this.itemName;
            }
            else
            {
               output += this.creator + "\'s " + ItemGenerator.instance.getItemBaseName(this);
            }
         }
         else if(this.named)
         {
            if(this.itemName != USEPROCGENNAME)
            {
               output += this.itemName;
            }
            else
            {
               output += ItemGenerator.instance.getGeneratedItemName(this);
            }
         }
         else if(this.isPickableQuestItem())
         {
            output += ItemGenerator.instance.getProcGenQuestItemName(this.itemID,this.getModifierById(85),this.getPrimaryColor());
         }
         else if(isTradeQuestItem)
         {
            output += QuestGenerator.instance.getNPCTradeGiveItemName(this);
         }
         else
         {
            output += ItemGenerator.instance.getItemBaseName(this);
         }
         return output + "]</font>";
      }
      
      public function getNameMyBlackBG() : String
      {
         var output:String = "";
         var modifierCount:int = int(this.modifiers.length);
         var isTradeQuestItem:Boolean = this.itemID == 20103 || this.itemID == 20104 || this.itemID == 20105 || this.itemID == 20106 || this.itemID == 20107;
         if(this.isPickableQuestItem() || isTradeQuestItem)
         {
            modifierCount = 0;
         }
         if(QuestEngine.getItemData(this.itemID).unique == 1 || this.isPickableQuestItem() || isTradeQuestItem || this.isPlayerNamed())
         {
            output += "<font color=\"#b048f8\">";
         }
         else if(modifierCount >= 3)
         {
            output += "<font color=\"#0080ff\">";
         }
         else if(modifierCount > 0)
         {
            output += "<font color=\"#1eff00\">";
         }
         else
         {
            output += "<font color=\"#FFFFFF\">";
         }
         if(this.creator != "")
         {
            if(this.named && this.itemName != USEPROCGENNAME)
            {
               output += this.creator + "\'s " + this.itemName;
            }
            else
            {
               output += this.creator + "\'s " + ItemGenerator.instance.getItemBaseName(this);
            }
         }
         else if(this.named)
         {
            if(this.itemName != USEPROCGENNAME)
            {
               output += this.itemName;
            }
            else
            {
               output += ItemGenerator.instance.getGeneratedItemName(this);
            }
         }
         else if(this.isPickableQuestItem())
         {
            output += ItemGenerator.instance.getProcGenQuestItemName(this.itemID,this.getModifierById(85),this.getPrimaryColor());
         }
         else
         {
            output += ItemGenerator.instance.getItemBaseName(this);
         }
         return output + "</font>";
      }
      
      public function getPlainName() : String
      {
         var output:String = "";
         var isTradeQuestItem:Boolean = this.itemID == 20103 || this.itemID == 20104 || this.itemID == 20105 || this.itemID == 20106 || this.itemID == 20107;
         if(this.creator != "")
         {
            if(this.named && this.itemName != USEPROCGENNAME)
            {
               output += this.creator + "\'s " + this.itemName;
            }
            else
            {
               output += this.creator + "\'s " + ItemGenerator.instance.getItemBaseName(this);
            }
         }
         else if(this.named)
         {
            if(this.itemName != USEPROCGENNAME)
            {
               output = this.itemName;
            }
            else
            {
               output = ItemGenerator.instance.getGeneratedItemName(this);
            }
         }
         else if(this.isPickableQuestItem())
         {
            output = ItemGenerator.instance.getProcGenQuestItemName(this.itemID,this.getModifierById(85),this.getPrimaryColor());
         }
         else if(isTradeQuestItem)
         {
            output = QuestGenerator.instance.getNPCTradeGiveItemName(this);
         }
         else
         {
            output = ItemGenerator.instance.getItemBaseName(this);
         }
         return output;
      }
      
      public function getDesc() : String
      {
         var condition:int = this.getCondition();
         var conditionStr:String = "";
         if(condition >= 0)
         {
            if(this.uses == 0)
            {
               conditionStr = LangManager.getString(639);
            }
            else if(this.uses == 1)
            {
               conditionStr = LangManager.getString(392);
            }
            else if(condition == 0)
            {
               conditionStr = "<font color=\"#FF0000\">" + LangManager.getString(387) + "</font>";
            }
            else if(condition < 25)
            {
               conditionStr = LangManager.getString(388);
            }
            else if(condition < 50)
            {
               conditionStr = LangManager.getString(389);
            }
            else if(condition < 75)
            {
               conditionStr = LangManager.getString(390);
            }
            else
            {
               conditionStr = LangManager.getString(391);
            }
         }
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML == null)
         {
            return "?";
         }
         if(conditionStr != "" && itemXML.desc != "")
         {
            conditionStr += "\n\n";
         }
         return conditionStr + itemXML.desc;
      }
      
      internal function compareValue(a:int, b:int) : String
      {
         var output:String = "";
         if(a > b)
         {
            output = "<font color=\"#00A606\">" + String(a) + "</font>";
         }
         else if(a < b)
         {
            output = "<font color=\"#FF0000\">" + String(a) + "</font>";
         }
         else if(a == b)
         {
            output = String(a);
         }
         return output;
      }
      
      internal function compareValueReverse(a:int, b:int) : String
      {
         var output:String = "";
         if(a > b)
         {
            output = "<font color=\"#00A606\">" + String(b) + "</font>";
         }
         else if(a < b)
         {
            output = "<font color=\"#FF0000\">" + String(b) + "</font>";
         }
         else if(a == b)
         {
            output = String(b);
         }
         return output;
      }
      
      internal function compareDamage(newWeapMin:int, newWeapMax:int, oldWeapMin:int, oldWeapMax:int) : String
      {
         var output:String = "";
         if(newWeapMin > oldWeapMin)
         {
            output += "<font color=\"#00A606\">" + newWeapMin + "</font>";
         }
         else if(newWeapMin < oldWeapMin)
         {
            output += "<font color=\"#FF0000\">" + newWeapMin + "</font>";
         }
         else if(newWeapMin == oldWeapMin)
         {
            output += "" + newWeapMin;
         }
         output += " - ";
         if(newWeapMax > oldWeapMax)
         {
            output += "<font color=\"#00A606\">" + newWeapMax + "</font>";
         }
         else if(newWeapMax < oldWeapMax)
         {
            output += "<font color=\"#FF0000\">" + newWeapMax + "</font>";
         }
         else if(newWeapMax == oldWeapMax)
         {
            output += newWeapMax + "";
         }
         return output;
      }
      
      public function getCompareAttributes() : String
      {
         var modArrayCheck:Array = null;
         var q:* = undefined;
         var i:int = 0;
         var j:int = 0;
         var showMod:Boolean = false;
         var itemxml:XMLItem = null;
         var val:int = 0;
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML == null)
         {
            return "";
         }
         var attribs:String = "";
         var itemType:int = itemXML.type;
         var itemModifierArray:Array = this.getModifierArray();
         var equippedItem:Item = StatsManager.equipment[itemType];
         var equippedItemXML:XMLItem = QuestEngine.getItemData(equippedItem.itemID);
         if(itemType != 10 && itemType != 12)
         {
            if(itemXML.mindamage > 0 || itemXML.maxdamage > 0)
            {
               if(equippedItemXML)
               {
                  if(equippedItem.isBroken() && this.isBroken())
                  {
                     attribs += LangManager.getString(108) + ": 1 - 1 (" + LangManager.getString(199) + ": 1 - 1)\n";
                  }
                  else if(this.isBroken())
                  {
                     attribs += LangManager.getString(108) + ": <font color=\'#FF0000\'>1 - 1</font> (" + LangManager.getString(199) + ": " + (equippedItemXML.mindamage + equippedItem.getModifierBonus(6)) + " - " + (equippedItemXML.maxdamage + equippedItem.getModifierBonus(6)) + ")\n";
                  }
                  else if(equippedItem.isBroken())
                  {
                     attribs += LangManager.getString(108) + ": " + this.compareDamage(itemXML.mindamage + this.getModifierBonus(6),itemXML.maxdamage + this.getModifierBonus(6),1,1) + " (" + LangManager.getString(199) + ": <font color=\'#FF0000\'>1 - 1</font>)\n";
                  }
                  else
                  {
                     attribs += LangManager.getString(108) + ": " + this.compareDamage(itemXML.mindamage + this.getModifierBonus(6),itemXML.maxdamage + this.getModifierBonus(6),equippedItemXML.mindamage + equippedItem.getModifierBonus(6),equippedItemXML.maxdamage + equippedItem.getModifierBonus(6)) + " (" + LangManager.getString(199) + ": " + (equippedItemXML.mindamage + equippedItem.getModifierBonus(6)) + " - " + (equippedItemXML.maxdamage + equippedItem.getModifierBonus(6)) + ") \n";
                  }
               }
               else if(this.isBroken())
               {
                  attribs += "<font color=\'#FF0000\'>" + LangManager.getString(108) + ": 1 - 1</font>\n";
               }
               else
               {
                  attribs += LangManager.getString(108) + ": " + (itemXML.mindamage + this.getModifierBonus(6)) + " - " + (itemXML.maxdamage + this.getModifierBonus(6)) + "\n";
               }
            }
            if(itemXML.defense != 0)
            {
               if(equippedItemXML)
               {
                  attribs += LangManager.getString(109) + ": " + this.compareValue(itemXML.defense + this.getModifierBonus(7),equippedItemXML.defense + equippedItem.getModifierBonus(7)) + " (" + LangManager.getString(199) + ": " + (equippedItemXML.defense + equippedItem.getModifierBonus(7)) + ")\n";
               }
               else
               {
                  attribs += LangManager.getString(109) + ": " + (itemXML.defense + this.getModifierBonus(7)) + "\n";
               }
            }
            else if(Boolean(equippedItemXML) && equippedItemXML.defense != 0)
            {
               attribs += LangManager.getString(109) + ": " + this.compareValue(0,equippedItemXML.defense + equippedItem.getModifierBonus(7)) + " (" + LangManager.getString(199) + ": " + (equippedItemXML.defense + equippedItem.getModifierBonus(7)) + ")\n";
            }
         }
         if(equippedItem.itemID == 0 || itemType == 10 || itemType == 12)
         {
            modArrayCheck = this.getModifierArray();
         }
         else
         {
            modArrayCheck = equippedItem.getModifierArray().concat(this.getModifierArray());
            modArrayCheck.sortOn("modifierID");
            for(i = 0; i < modArrayCheck.length - 1; i++)
            {
               for(j = i + 1; j < modArrayCheck.length; j++)
               {
                  if(modArrayCheck[i].getModifierID() === modArrayCheck[j].getModifierID())
                  {
                     modArrayCheck.splice(j,1);
                  }
               }
            }
         }
         for(q = 0; q < modArrayCheck.length; q++)
         {
            showMod = false;
            switch(int(modArrayCheck[q].modifierID))
            {
               case 0:
                  attribs += LangManager.getString(110);
                  showMod = true;
                  break;
               case 1:
                  attribs += LangManager.getString(111);
                  showMod = true;
                  break;
               case 2:
                  attribs += LangManager.getString(112);
                  showMod = true;
                  break;
               case 3:
                  attribs += LangManager.getString(113);
                  showMod = true;
                  break;
               case 4:
                  attribs += LangManager.getString(114);
                  showMod = true;
                  break;
               case 5:
                  attribs += LangManager.getString(115);
                  showMod = true;
                  break;
               case 6:
                  if(itemXML.mindamage == 0 && itemXML.maxdamage == 0)
                  {
                     attribs += LangManager.getString(116);
                     showMod = true;
                  }
                  break;
               case 7:
                  if((itemXML.mindamage > 0 || itemXML.maxdamage > 0) && itemXML.defense == 0)
                  {
                     attribs += LangManager.getString(117);
                     showMod = true;
                  }
                  break;
               case 8:
                  attribs += LangManager.getString(118);
                  showMod = true;
                  break;
               case 9:
                  if(modArrayCheck[q].value > 0)
                  {
                     attribs += LangManager.getString(119);
                     showMod = true;
                  }
                  break;
               case 10:
                  attribs += LangManager.getString(120);
                  showMod = true;
                  break;
               case 11:
                  attribs += LangManager.getString(63);
                  showMod = true;
                  break;
               case 12:
                  attribs += LangManager.getString(64);
                  showMod = true;
                  break;
               case 13:
                  attribs += LangManager.getString(102);
                  showMod = true;
                  break;
               case 14:
                  attribs += LangManager.getString(121);
                  showMod = true;
                  break;
               case 15:
                  attribs += LangManager.getString(59);
                  showMod = true;
                  break;
               case 16:
                  attribs += LangManager.getString(122);
                  showMod = true;
                  break;
               case 21:
                  if(this.itemID == 2213)
                  {
                     attribs += LangManager.getString(825,[this.itemName]) + "\n";
                  }
                  else if(this.itemID == 2214)
                  {
                     attribs += LangManager.getString(826,[this.itemName]) + "\n";
                  }
                  break;
               case 28:
                  attribs += LangManager.getString(507);
                  showMod = true;
                  break;
               case 29:
                  attribs += LangManager.getString(508);
                  showMod = true;
                  break;
               case 30:
                  attribs += LangManager.getString(509);
                  showMod = true;
                  break;
               case 31:
                  attribs += LangManager.getString(510);
                  showMod = true;
                  break;
               case StatsManager.STAT_FIREDEF:
                  attribs += LangManager.getString(871);
                  showMod = true;
                  break;
               case StatsManager.STAT_WINDDEF:
                  attribs += LangManager.getString(872);
                  showMod = true;
                  break;
               case StatsManager.STAT_WATERDEF:
                  attribs += LangManager.getString(873);
                  showMod = true;
                  break;
               case StatsManager.STAT_EARTHDEF:
                  attribs += LangManager.getString(874);
                  showMod = true;
                  break;
               case StatsManager.STAT_CRITICALDMG:
                  attribs += LangManager.getString(875);
                  showMod = true;
                  break;
               case StatsManager.STAT_PIERCINGDMG:
                  attribs += LangManager.getString(876);
                  showMod = true;
                  break;
               case 102:
                  attribs += LangManager.getString(640) + NodeGenerator.instance.getNodeNameCode(modArrayCheck[q].value) + "\n";
                  break;
               case 103:
               case 106:
                  itemxml = QuestEngine.getItemData(modArrayCheck[q].value);
                  if(itemxml != null)
                  {
                     attribs += "- " + itemxml.displayname + "\n";
                  }
                  break;
               case 25:
            }
            if(showMod)
            {
               if(equippedItem.itemID == 0)
               {
                  val = this.getModifierById(modArrayCheck[q].getModifierID());
                  if(val > 0)
                  {
                     attribs += ": +" + val + "\n";
                  }
                  else if(val < 0)
                  {
                     attribs += ": " + val + "\n";
                  }
               }
               else if(itemType != 10 && itemType != 12)
               {
                  val = this.getModifierById(modArrayCheck[q].getModifierID());
                  if(val > 0)
                  {
                     attribs += ": +" + this.compareValue(val,equippedItem.getModifierBonus(modArrayCheck[q].modifierID)) + " (" + LangManager.getString(199) + ": " + equippedItem.getModifierBonus(modArrayCheck[q].modifierID) + ")\n";
                  }
                  else
                  {
                     attribs += ": " + this.compareValue(val,equippedItem.getModifierBonus(modArrayCheck[q].modifierID)) + " (" + LangManager.getString(199) + ": " + equippedItem.getModifierBonus(modArrayCheck[q].modifierID) + ")\n";
                  }
               }
               else
               {
                  val = int(modArrayCheck[q].value);
                  if(val > 0)
                  {
                     attribs += ": +" + val + "\n";
                  }
                  else if(val < 0)
                  {
                     attribs += ": " + val + "\n";
                  }
               }
            }
         }
         if(itemXML.weight > 0)
         {
            attribs += LangManager.getString(139) + ": " + itemXML.weight + "\n";
         }
         var itemlevel:int = this.getLevel();
         if(itemlevel > 0 && StatsManager.getLevel() < itemlevel)
         {
            attribs += "<font color=\"#FF0000\">" + LangManager.getString(124) + ": " + itemlevel + "</font>\n";
         }
         if(this.itemID >= 20000)
         {
            attribs += LangManager.getString(207) + "\n";
         }
         return attribs;
      }
      
      public function getEquipAttributes() : String
      {
         var showMod:Boolean = false;
         var val:int = 0;
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML == null)
         {
            return "";
         }
         var attribs:String = "";
         var tempValue:int = itemXML.type;
         if(tempValue != 10 && tempValue != 12)
         {
            if(itemXML.mindamage > 0 || itemXML.maxdamage > 0)
            {
               if(this.isBroken())
               {
                  attribs += "<font color=\"#FF0000\">" + LangManager.getString(108) + ": 1 - 1</font>\n";
               }
               else
               {
                  attribs += LangManager.getString(108) + ": " + (itemXML.mindamage + this.getModifierBonus(6)) + " - " + (itemXML.maxdamage + this.getModifierBonus(6)) + "\n";
               }
            }
            if(itemXML.defense != 0)
            {
               attribs += LangManager.getString(109) + ": " + (itemXML.defense + this.getModifierBonus(7)) + "\n";
            }
         }
         var modArrayCheck:Array = this.getModifierArray();
         for(var q:* = 0; q < modArrayCheck.length; q++)
         {
            if(this.modifiers[q].getModValue() != 0)
            {
               showMod = false;
               switch(int(modArrayCheck[q].modifierID))
               {
                  case 0:
                     attribs += LangManager.getString(110);
                     showMod = true;
                     break;
                  case 1:
                     attribs += LangManager.getString(111);
                     showMod = true;
                     break;
                  case 2:
                     attribs += LangManager.getString(112);
                     showMod = true;
                     break;
                  case 3:
                     attribs += LangManager.getString(113);
                     showMod = true;
                     break;
                  case 4:
                     attribs += LangManager.getString(114);
                     showMod = true;
                     break;
                  case 5:
                     attribs += LangManager.getString(115);
                     showMod = true;
                     break;
                  case 6:
                     if(itemXML.mindamage == 0 && itemXML.maxdamage == 0)
                     {
                        attribs += LangManager.getString(116);
                        showMod = true;
                     }
                     break;
                  case 7:
                     if((itemXML.mindamage > 0 || itemXML.maxdamage > 0) && itemXML.defense == 0)
                     {
                        attribs += LangManager.getString(117);
                        showMod = true;
                     }
                     break;
                  case 8:
                     attribs += LangManager.getString(118);
                     showMod = true;
                     break;
                  case 9:
                     if(modArrayCheck[q].value > 0)
                     {
                        attribs += LangManager.getString(119);
                        showMod = true;
                     }
                     break;
                  case 10:
                     attribs += LangManager.getString(120);
                     showMod = true;
                     break;
                  case 11:
                     attribs += LangManager.getString(63);
                     showMod = true;
                     break;
                  case 12:
                     attribs += LangManager.getString(64);
                     showMod = true;
                     break;
                  case 13:
                     attribs += LangManager.getString(102);
                     showMod = true;
                     break;
                  case 14:
                     attribs += LangManager.getString(121);
                     showMod = true;
                     break;
                  case 15:
                     attribs += LangManager.getString(59);
                     showMod = true;
                     break;
                  case 16:
                     attribs += LangManager.getString(122);
                     showMod = true;
                     break;
                  case 28:
                     attribs += LangManager.getString(507);
                     showMod = true;
                     break;
                  case 29:
                     attribs += LangManager.getString(508);
                     showMod = true;
                     break;
                  case 30:
                     attribs += LangManager.getString(509);
                     showMod = true;
                     break;
                  case 31:
                     attribs += LangManager.getString(510);
                     showMod = true;
                     break;
                  case StatsManager.STAT_FIREDEF:
                     attribs += LangManager.getString(871);
                     showMod = true;
                     break;
                  case StatsManager.STAT_WINDDEF:
                     attribs += LangManager.getString(872);
                     showMod = true;
                     break;
                  case StatsManager.STAT_WATERDEF:
                     attribs += LangManager.getString(873);
                     showMod = true;
                     break;
                  case StatsManager.STAT_EARTHDEF:
                     attribs += LangManager.getString(874);
                     showMod = true;
                     break;
                  case StatsManager.STAT_CRITICALDMG:
                     attribs += LangManager.getString(875);
                     showMod = true;
                     break;
                  case StatsManager.STAT_PIERCINGDMG:
                     attribs += LangManager.getString(876);
                     showMod = true;
                     break;
                  case 82:
                  case 78:
                  case 79:
                     break;
                  default:
                     if(int(modArrayCheck[q].modifierID) < 2000 && int(modArrayCheck[q].modifierID) > 100)
                     {
                        attribs += LangManager.getString(123) + ": " + modArrayCheck.modifierID;
                     }
                     else
                     {
                        trace("getEquipAttributes ErrorValue: " + modArrayCheck.modifierID);
                     }
               }
               if(showMod)
               {
                  val = int(modArrayCheck[q].value);
                  if(val > 0)
                  {
                     attribs += ": +" + val + "\n";
                  }
                  else if(val < 0)
                  {
                     attribs += ": " + val + "\n";
                  }
               }
            }
         }
         if(itemXML.weight > 0)
         {
            attribs += LangManager.getString(139) + ": " + itemXML.weight + "\n";
         }
         var itemlevel:int = this.getLevel();
         if(itemlevel > 0)
         {
            if(StatsManager.getLevel() < itemlevel)
            {
               attribs += "<font color=\"#FF0000\">" + LangManager.getString(124) + ": " + itemlevel + "</font>\n";
            }
         }
         if(this.itemID >= 20000)
         {
            attribs += LangManager.getString(207) + "\n";
         }
         return attribs;
      }
      
      public function getAttributes() : String
      {
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML == null)
         {
            return "";
         }
         var attribs:String = itemXML.getAttributeDesc();
         if(itemXML.weight > 0)
         {
            attribs += LangManager.getString(139) + ": " + itemXML.weight + "\n";
         }
         return attribs;
      }
      
      public function getModifierArray() : Array
      {
         var i:int = 0;
         var j:int = 0;
         var flag:Boolean = false;
         var Mod:* = undefined;
         var newArray:Array = new Array();
         for(i = 0; i < this.modifiers.length; i++)
         {
            newArray.push(this.modifiers[i]);
         }
         var tempItemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         for(i = 0; i < tempItemXML.modifierXML.length(); i++)
         {
            flag = false;
            Mod = new Modifier(tempItemXML.modifierXML[i].id,tempItemXML.modifierXML[i].value);
            for(j = 0; j < newArray.length; j++)
            {
               if(newArray[j].modifierID == Mod.modifierID && Mod.modifierID != 103 && Mod.modifierID != 106)
               {
                  newArray[j].value += Mod.value;
                  flag = true;
                  break;
               }
            }
            if(!flag)
            {
               newArray.push(Mod);
            }
         }
         return newArray;
      }
      
      public function getModifierBonus(id:int) : int
      {
         var modArrayCheck:Array = this.getModifierArray();
         for(var i:* = 0; i < modArrayCheck.length; i++)
         {
            if(modArrayCheck[i].modifierID == id)
            {
               return modArrayCheck[i].value;
            }
         }
         return 0;
      }
      
      internal function getModifierObject(modID:int) : Modifier
      {
         var max:int = int(this.modifiers.length);
         for(var q:* = 0; q < max; q++)
         {
            if(this.modifiers[q].getModifierID() == modID)
            {
               return this.modifiers[q];
            }
         }
         return null;
      }
      
      internal function getModifierById(modID:int) : int
      {
         var max:int = int(this.modifiers.length);
         for(var q:* = 0; q < max; q++)
         {
            if(this.modifiers[q].getModifierID() == modID)
            {
               return this.modifiers[q].getModValue();
            }
         }
         return 0;
      }
      
      public function getPrimaryColor() : uint
      {
         return this.primaryColor;
      }
      
      public function getSecondaryColor() : int
      {
         return this.secondaryColor;
      }
      
      public function setPrimaryColor(color:uint) : *
      {
         this.primaryColor = color;
      }
      
      public function setSecondaryColor(color:int) : *
      {
         this.secondaryColor = color;
      }
      
      public function gotUsed(num:int = 1) : *
      {
         if(this.uses == 0)
         {
            return;
         }
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML == null || itemXML.durability == 0 || this.uses >= itemXML.durability)
         {
            return;
         }
         this.uses += num;
      }
      
      public function setUses(num:int) : *
      {
         this.uses = num;
      }
      
      public function repair(num:int) : *
      {
         if(this.uses == 0)
         {
            return;
         }
         this.uses -= num;
         if(this.uses <= 0)
         {
            this.uses = 1;
         }
      }
      
      public function breakWeapon() : *
      {
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML == null)
         {
            return false;
         }
         if(itemXML.durability == 0)
         {
            return false;
         }
         this.uses = itemXML.durability + this.getModifierBonus(83);
      }
      
      public function isBroken() : Boolean
      {
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML == null)
         {
            return false;
         }
         if(itemXML.durability == 0)
         {
            return false;
         }
         return this.uses >= itemXML.durability + this.getModifierBonus(83);
      }
      
      public function getCondition() : int
      {
         var maxDurability:int = 0;
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML == null || itemXML.durability == 0)
         {
            return -1;
         }
         maxDurability = itemXML.durability + this.getModifierBonus(83);
         var val:int = (maxDurability - this.uses) / maxDurability * 100;
         if(val < 0)
         {
            val = 0;
         }
         return val;
      }
      
      public function setProcGenName() : *
      {
         this.named = true;
         this.itemName = USEPROCGENNAME;
      }
      
      public function isDungeonQuestItem() : Boolean
      {
         return this.itemName == USEPROCGENNAME;
      }
      
      public function isPlayerNamed() : Boolean
      {
         return this.named && this.itemName != USEPROCGENNAME;
      }
      
      public function setItemName(str:String) : *
      {
         var i:* = 0;
         if(this.isDungeonQuestItem())
         {
            for(i = int(this.modifiers.length - 1); i >= 0; i--)
            {
               if(this.modifiers[i].modifierID == 85 || this.modifiers[i].modifierID == 86 || this.modifiers[i].modifierID == 87 || this.modifiers[i].modifierID == 88)
               {
                  this.modifiers.splice(i,1);
               }
            }
         }
         this.named = true;
         this.itemName = str;
      }
      
      public function setCreator(str:String) : *
      {
         this.creator = str;
         if(this.named && this.itemName == USEPROCGENNAME)
         {
            this.named = false;
         }
      }
      
      public function setClanInvitationName(str:String) : *
      {
         this.named = false;
         this.itemName = str;
      }
      
      public function canStack() : Boolean
      {
         if(this.getQuantity() > 1)
         {
            return true;
         }
         if(this.primaryColor != NOCOLOR || this.secondaryColor != NOCOLOR)
         {
            return false;
         }
         return this.itemID < 3000 && !this.itemIsSpecial(this.itemID) && !this.isPickableQuestItem() || QuestEngine.getItemData(this.itemID).unique == 0 && !this.hasModifiers() && this.uses == 0 && !this.named;
      }
      
      internal function itemIsSpecial(id:int) : Boolean
      {
         return id == 2129 || isClanInvitation(id);
      }
      
      public function getWeight() : int
      {
         if(this.weight != -1)
         {
            return this.weight * this.getQuantity();
         }
         var itemXML:XMLItem = QuestEngine.getItemData(this.itemID);
         if(itemXML != null)
         {
            this.weight = itemXML.weight;
         }
         else
         {
            this.weight = 0;
         }
         return this.weight;
      }
      
      public function getSellAmt() : int
      {
         if(this.itemID < 3000)
         {
            return 1;
         }
         if(this.getWeight() >= 10)
         {
            return (1 + this.getModifierCount()) * 10;
         }
         return (1 + this.getModifierCount()) * 5;
      }
   }
}

