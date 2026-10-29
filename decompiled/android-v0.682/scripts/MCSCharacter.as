package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1970")]
   public class MCSCharacter extends MovieClip
   {
      
      public static var PART_l_hand:int = 0;
      
      public static var PART_l_uparm:int = 1;
      
      public static var PART_l_lowarm:int = 2;
      
      public static var PART_weapon:int = 3;
      
      public static var PART_prop:int = 4;
      
      public static var PART_l_foot:int = 5;
      
      public static var PART_l_thigh:int = 6;
      
      public static var PART_l_calf:int = 7;
      
      public static var PART_crotch:int = 8;
      
      public static var PART_r_foot:int = 9;
      
      public static var PART_r_thigh:int = 10;
      
      public static var PART_r_calf:int = 11;
      
      public static var PART_neck:int = 12;
      
      public static var PART_stomach:int = 13;
      
      public static var PART_pelvic:int = 14;
      
      public static var PART_torso:int = 15;
      
      public static var PART_head:int = 16;
      
      public static var PART_hat:int = 17;
      
      public static var PART_r_hand:int = 18;
      
      public static var PART_r_uparm:int = 19;
      
      public static var PART_r_lowarm:int = 20;
      
      public static var PART_prop2:int = 21;
      
      public static var PART_prop3:* = 22;
      
      public static var PART_l_shoulder:* = 23;
      
      public static var PART_r_shoulder:* = 24;
      
      public static var PART_l_knee:* = 25;
      
      public static var PART_r_knee:* = 26;
      
      internal static const BearAnimationData:Class = MCSCharacter_BearAnimationData;
      
      internal static const BoarAnimationData:Class = MCSCharacter_BoarAnimationData;
      
      internal static const DeerAnimationData:Class = MCSCharacter_DeerAnimationData;
      
      internal static const HorseAnimationData:Class = MCSCharacter_HorseAnimationData;
      
      internal static const WolfAnimationData:Class = MCSCharacter_WolfAnimationData;
      
      internal static const GoblinAnimationData:Class = MCSCharacter_GoblinAnimationData;
      
      internal static const OgreAnimationData:Class = MCSCharacter_OgreAnimationData;
      
      internal static const UndeadAnimationData:Class = MCSCharacter_UndeadAnimationData;
      
      internal static const HumanAnimationData:Class = MCSCharacter_HumanAnimationData;
      
      internal static const Human2AnimationData:Class = MCSCharacter_Human2AnimationData;
      
      internal static const HumanSpearAnimationData:Class = MCSCharacter_HumanSpearAnimationData;
      
      internal static const SkillsAnimationData:Class = MCSCharacter_SkillsAnimationData;
      
      internal static const GuardianAnimationData:Class = MCSCharacter_GuardianAnimationData;
      
      internal static const LightStanceAnimationData:Class = MCSCharacter_LightStanceAnimationData;
      
      internal static const BalancedStanceAnimationData:Class = MCSCharacter_BalancedStanceAnimationData;
      
      internal static const HeavyStanceAnimationData:Class = MCSCharacter_HeavyStanceAnimationData;
      
      internal static const DualStanceAnimationData:Class = MCSCharacter_DualStanceAnimationData;
      
      internal static const ReversedStanceAnimationData:Class = MCSCharacter_ReversedStanceAnimationData;
      
      internal static var animList:Array = null;
      
      internal var partList:Vector.<MovieClip>;
      
      internal var hair:MovieClip;
      
      internal var hatHair:MovieClip;
      
      internal var headMask:MovieClip;
      
      internal var healthBar:MCSHealthBar;
      
      internal var progressBar:MCSProgressBar;
      
      internal var displayName:MCSDisplayName;
      
      internal var speech:MCSSpeech;
      
      internal var mcsIcon:MCSIcon;
      
      internal var partListLength:int = 22;
      
      internal var isPlayer:Boolean = false;
      
      internal var mcsString:String = "";
      
      internal var animation:String = "";
      
      internal var frameCounter:int;
      
      internal var currentAnimation:AnimData;
      
      internal var currentAnimationLooping:Boolean;
      
      internal var currentAnimationDuration:int;
      
      public function MCSCharacter()
      {
         var mc:MovieClip = null;
         this.partList = new Vector.<MovieClip>();
         super();
         for(var i:int = 0; i <= this.partListLength; i++)
         {
            mc = new MovieClip();
            addChild(mc);
            this.partList.push(mc);
         }
         this.healthBar = new MCSHealthBar();
         this.healthBar.y = -120;
         this.healthBar.mouseEnabled = false;
         this.healthBar.mouseChildren = false;
         this.progressBar = new MCSProgressBar();
         this.progressBar.y = -120;
         this.progressBar.mouseEnabled = false;
         this.progressBar.mouseChildren = false;
         this.progressBar.visible = false;
         LangManager.initTextField(this.progressBar.nametext);
         this.displayName = new MCSDisplayName();
         this.displayName.y = -120;
         this.displayName.visible = false;
         this.displayName.mouseEnabled = false;
         this.displayName.mouseChildren = false;
         LangManager.initTextField(this.displayName.nametext,true);
         this.speech = new MCSSpeech();
         this.speech.y = -120;
         this.speech.visible = false;
         this.speech.mouseEnabled = false;
         this.speech.mouseChildren = false;
         LangManager.initTextField(this.speech.words,false);
         this.mcsIcon = new MCSIcon();
         this.mcsIcon.y = -120;
         this.mcsIcon.visible = false;
         this.mcsIcon.mouseEnabled = false;
         this.mcsIcon.mouseChildren = false;
         this.mcsIcon.gotoAndStop(1);
         mouseChildren = false;
      }
      
      public static function initAnimationData() : *
      {
         var xml:XML = null;
         var xmldata:XML = null;
         var max:int = 0;
         var j:* = undefined;
         if(animList != null)
         {
            return;
         }
         animList = new Array();
         var xmlArray:Array = new Array();
         xmlArray.push(XML(new BearAnimationData()));
         xmlArray.push(XML(new BoarAnimationData()));
         xmlArray.push(XML(new DeerAnimationData()));
         xmlArray.push(XML(new HorseAnimationData()));
         xmlArray.push(XML(new WolfAnimationData()));
         xmlArray.push(XML(new GoblinAnimationData()));
         xmlArray.push(XML(new OgreAnimationData()));
         xmlArray.push(XML(new UndeadAnimationData()));
         xmlArray.push(XML(new HumanAnimationData()));
         xmlArray.push(XML(new Human2AnimationData()));
         xmlArray.push(XML(new SkillsAnimationData()));
         xmlArray.push(XML(new HumanSpearAnimationData()));
         xmlArray.push(XML(new GuardianAnimationData()));
         xmlArray.push(XML(new LightStanceAnimationData()));
         xmlArray.push(XML(new BalancedStanceAnimationData()));
         xmlArray.push(XML(new HeavyStanceAnimationData()));
         xmlArray.push(XML(new DualStanceAnimationData()));
         xmlArray.push(XML(new ReversedStanceAnimationData()));
         var fileCount:int = int(xmlArray.length);
         for(var i:int = 0; i < fileCount; i++)
         {
            xml = xmlArray[i];
            max = xml.anim.length();
            for(j = 0; j < max; j++)
            {
               xmldata = xml.anim[j];
               animList[xmldata.@i.toString()] = new AnimData(xmldata);
            }
         }
      }
      
      public static function clearAnimationData() : *
      {
         animList = null;
      }
      
      public function getPart(num:int) : MovieClip
      {
         return this.partList[num];
      }
      
      public function getPartList() : Vector.<MovieClip>
      {
         return this.partList;
      }
      
      public function getPartListLength() : int
      {
         return this.partListLength;
      }
      
      public function removeParts() : *
      {
         var childmax:int = 0;
         var j:int = 0;
         var mc:MovieClip = null;
         for(var i:* = int(this.partListLength - 1); i >= 0; i--)
         {
            mc = this.partList[i];
            childmax = mc.numChildren;
            for(j = 0; j < childmax; j++)
            {
               this.partList[i].removeChildAt(0);
            }
            this.partList[i].cacheAsBitmap = false;
         }
         this.hair = null;
         this.hatHair = null;
         this.setDisplayName("");
         this.displayName.y = -120;
         this.setSpeechText("");
         this.speech.y = -120;
         this.healthBar.visible = false;
         this.healthBar.y = -120;
         this.progressBar.visible = false;
         this.progressBar.y = -120;
         this.mcsIcon.visible = false;
         this.mcsIcon.y = -120;
         if(this.contains(this.displayName))
         {
            removeChild(this.displayName);
         }
         if(this.contains(this.speech))
         {
            removeChild(this.speech);
         }
         if(this.contains(this.healthBar))
         {
            removeChild(this.healthBar);
         }
         if(this.contains(this.progressBar))
         {
            removeChild(this.progressBar);
         }
         if(this.contains(this.mcsIcon))
         {
            removeChild(this.mcsIcon);
         }
      }
      
      public function disposeMCS() : *
      {
         ColorCode.clearFilter(this);
         this.resetScale();
         this.removeParts();
         this.animation = "";
         MCSPool.returnMCS(this);
         this.mcsString = "";
      }
      
      public function initMCS(armoritem:Item, glovesitem:Item, hairitem:Item, hatitem:Item, headitem:Item, maskitem:Item, neckitem:Item, pantsitem:Item, shoesitem:Item, weaponitem:Item, propid:int = 0, prop2id:int = 0) : *
      {
         var armorid:int = armoritem.getItemID();
         var glovesid:int = glovesitem.getItemID();
         var hairid:int = hairitem.getItemID();
         var hatid:int = hatitem.getItemID();
         var headid:int = headitem.getItemID();
         var maskid:int = maskitem.getItemID();
         var neckid:int = neckitem.getItemID();
         var pantsid:int = pantsitem.getItemID();
         var shoesid:int = shoesitem.getItemID();
         var weaponid:int = weaponitem.getItemID();
         var armorColor:String = "";
         if(armoritem.getPrimaryColor() != Item.NOCOLOR)
         {
            armorColor = "," + Item.PCOLORMODID + "@" + armoritem.getPrimaryColor() + "#";
         }
         if(armoritem.getSecondaryColor() != Item.NOCOLOR)
         {
            armorColor += Item.SCOLORMODID + "@" + armoritem.getSecondaryColor() + "#";
         }
         var pantsColor:String = "";
         if(pantsitem.getPrimaryColor() != Item.NOCOLOR)
         {
            pantsColor = "," + Item.PCOLORMODID + "@" + pantsitem.getPrimaryColor() + "#";
         }
         if(pantsitem.getSecondaryColor() != Item.NOCOLOR)
         {
            pantsColor += Item.SCOLORMODID + "@" + pantsitem.getSecondaryColor() + "#";
         }
         var hatColor:String = "";
         if(hatitem.getPrimaryColor() != Item.NOCOLOR)
         {
            hatColor = "," + Item.PCOLORMODID + "@" + hatitem.getPrimaryColor() + "#";
         }
         if(hatitem.getSecondaryColor() != Item.NOCOLOR)
         {
            hatColor += Item.SCOLORMODID + "@" + hatitem.getSecondaryColor() + "#";
         }
         var maskColor:String = "";
         if(maskitem.getPrimaryColor() != Item.NOCOLOR)
         {
            maskColor = "," + Item.PCOLORMODID + "@" + maskitem.getPrimaryColor() + "#";
         }
         if(maskitem.getSecondaryColor() != Item.NOCOLOR)
         {
            maskColor += Item.SCOLORMODID + "@" + maskitem.getSecondaryColor() + "#";
         }
         this.mcsString = armorid + armorColor + "|" + glovesid + "|" + hairid + "|" + hatid + hatColor + "|" + headid + "|" + maskid + maskColor + "|" + neckid + "|" + pantsid + pantsColor + "|" + shoesid + "|" + weaponid + "|" + propid + "|" + prop2id;
         this.setHead(headid);
         if(maskid > 0)
         {
            this.setMask(maskid,maskitem.getPrimaryColor(),maskitem.getSecondaryColor());
         }
         else
         {
            this.setMask(9000);
         }
         if(hairid == 6001 || hairid <= 0)
         {
            this.setHatHair(6001);
         }
         else
         {
            this.setHatHair(6000);
         }
         if(hairid > 0)
         {
            this.setHair(hairid);
         }
         else
         {
            this.setHair(6001);
         }
         if(hatid > 0 && hatid != 7000 && hatid != 7049)
         {
            this.hatHair.visible = true;
            this.hair.visible = false;
            this.setHat(hatid,hatitem.getPrimaryColor(),hatitem.getSecondaryColor());
         }
         else
         {
            this.hatHair.visible = false;
            this.hair.visible = true;
            this.setHat(7000);
         }
         if(neckid > 0)
         {
            this.setNeck(neckid);
         }
         else
         {
            this.setNeck(10000);
         }
         if(armorid > 0)
         {
            this.setArmor(armorid,armoritem.getPrimaryColor(),armoritem.getSecondaryColor());
         }
         else
         {
            this.setArmor(4000);
         }
         if(shoesid > 0)
         {
            this.setShoes(shoesid);
         }
         else
         {
            this.setShoes(12000);
         }
         if(pantsid > 0)
         {
            this.setPants(pantsid,pantsitem.getPrimaryColor(),pantsitem.getSecondaryColor());
         }
         else
         {
            this.setPants(11000);
         }
         if(glovesid > 0)
         {
            this.setGloves(glovesid);
         }
         else
         {
            this.setGloves(5000);
         }
         if(weaponid > 0)
         {
            this.setWeapon(weaponid);
         }
         else
         {
            this.setWeapon(13000);
         }
         if(propid > 0)
         {
            this.setProp(propid);
         }
         else
         {
            this.setProp(13000);
         }
         if(prop2id > 0)
         {
            this.setProp2(prop2id);
         }
         else
         {
            this.setProp2(13000);
         }
         this.healthBar.visible = false;
         this.healthBar.x = 0;
         this.progressBar.visible = false;
         this.progressBar.x = 0;
         this.displayName.x = 0;
      }
      
      public function initMCSFromXML(xml:XMLList) : *
      {
         var armorid:int = 0;
         var glovesid:int = 0;
         var hairid:int = 0;
         var hatid:int = 0;
         var headid:int = 0;
         var maskid:int = 0;
         var neckid:int = 0;
         var pantsid:int = 0;
         var shoesid:int = 0;
         var weaponid:int = 0;
         var propid:int = 0;
         var prop2id:int = 0;
         if(xml.armor.toString() != "")
         {
            armorid = this.processString(xml.armor);
         }
         if(xml.gloves.toString() != "")
         {
            glovesid = this.processString(xml.gloves);
         }
         if(xml.hair.toString() != "")
         {
            hairid = this.processString(xml.hair);
         }
         if(xml.hat.toString() != "")
         {
            hatid = this.processString(xml.hat);
         }
         if(xml.head.toString() != "")
         {
            headid = this.processString(xml.head);
         }
         if(xml.mask.toString() != "")
         {
            maskid = this.processString(xml.mask);
         }
         if(xml.neck.toString() != "")
         {
            neckid = this.processString(xml.neck);
         }
         if(xml.pants.toString() != "")
         {
            pantsid = this.processString(xml.pants);
         }
         if(xml.shoes.toString() != "")
         {
            shoesid = this.processString(xml.shoes);
         }
         if(xml.weapon.toString() != "")
         {
            weaponid = this.processString(xml.weapon);
         }
         if(xml.prop1.toString() != "")
         {
            propid = this.processString(xml.prop1);
         }
         else
         {
            propid = weaponid;
         }
         if(xml.prop2.toString() != "")
         {
            prop2id = this.processString(xml.prop2);
         }
         var armorItem:Item = new Item(armorid);
         if(xml.armorpcolor.toString() != "")
         {
            armorItem.setPrimaryColor(xml.armorpcolor);
         }
         if(xml.armorscolor.toString() != "")
         {
            armorItem.setSecondaryColor(xml.armorscolor);
         }
         var pantsItem:Item = new Item(pantsid);
         if(xml.pantspcolor.toString() != "")
         {
            pantsItem.setPrimaryColor(xml.pantspcolor);
         }
         if(xml.pantsscolor.toString() != "")
         {
            pantsItem.setSecondaryColor(xml.pantsscolor);
         }
         var hatItem:Item = new Item(hatid);
         if(xml.hatpcolor.toString() != "")
         {
            hatItem.setPrimaryColor(xml.hatpcolor);
         }
         if(xml.hatscolor.toString() != "")
         {
            hatItem.setSecondaryColor(xml.hatscolor);
         }
         var maskItem:Item = new Item(maskid);
         if(xml.maskpcolor.toString() != "")
         {
            maskItem.setPrimaryColor(xml.maskpcolor);
         }
         if(xml.maskscolor.toString() != "")
         {
            maskItem.setSecondaryColor(xml.maskscolor);
         }
         this.initMCS(armorItem,new Item(glovesid),new Item(hairid),new Item(hatid),new Item(headid),new Item(maskid),new Item(neckid),pantsItem,new Item(shoesid),new Item(weaponid),propid,prop2id);
      }
      
      public function initMCSFromEqString(equipment:String) : *
      {
         var itemArray:Array = new Array();
         var eqArray:Array = equipment.split("|");
         var max:int = int(eqArray.length);
         for(var i:int = 0; i < max; i++)
         {
            itemArray[i] = Item.parseNoQty(eqArray[i]);
         }
         this.initMCS(itemArray[StatsManager.EQ_ARMOR],itemArray[StatsManager.EQ_GLOVES],itemArray[StatsManager.EQ_HAIR],itemArray[StatsManager.EQ_HAT],itemArray[StatsManager.EQ_HEAD],itemArray[StatsManager.EQ_MASK],itemArray[StatsManager.EQ_NECK],itemArray[StatsManager.EQ_PANTS],itemArray[StatsManager.EQ_SHOES],itemArray[StatsManager.EQ_WEAPON],itemArray[StatsManager.EQ_WEAPON].getItemID());
      }
      
      internal function processString(xmlstring:String) : int
      {
         var selectArray:Array = new Array();
         selectArray = xmlstring.split(",");
         return selectArray[int(Math.random() * selectArray.length)];
      }
      
      internal function getMCSComponent(partType:String, id:int) : MovieClip
      {
         var art:int = 0;
         var ClassDefinition:Class = null;
         var xmlItem:XMLItem = QuestEngine.getItemData(id);
         if(xmlItem == null)
         {
            art = id;
         }
         else
         {
            art = xmlItem.art;
         }
         if(StatsManager.useExternalResource)
         {
            return ResourceManager.getMCSComponent(partType,art);
         }
         try
         {
            if(getDefinitionByName(partType + art.toString()))
            {
               ClassDefinition = Class(getDefinitionByName(partType + art.toString()));
            }
            else
            {
               ClassDefinition = Class(getDefinitionByName(partType + "0"));
            }
         }
         catch(error:ReferenceError)
         {
            return null;
         }
         return new ClassDefinition() as MovieClip;
      }
      
      public function getMCSString() : String
      {
         return this.mcsString;
      }
      
      public function setHead(id:int) : *
      {
         var dice:int = 0;
         if(id == 0)
         {
            dice = Math.random() * 11;
            if(dice == 0)
            {
               id = 8004;
            }
            else if(dice == 1)
            {
               id = 8005;
            }
            else if(dice == 2)
            {
               id = 8006;
            }
            else if(dice == 3)
            {
               id = 8007;
            }
            else if(dice == 4)
            {
               id = 8012;
            }
            else if(dice == 5)
            {
               id = 8017;
            }
            else if(dice == 6)
            {
               id = 8018;
            }
            else if(dice == 7)
            {
               id = 8019;
            }
            else if(dice == 8)
            {
               id = 8020;
            }
            else if(dice == 9)
            {
               id = 8021;
            }
            else if(dice == 10)
            {
               id = 8023;
            }
         }
         var head:MovieClip = this.partList[PART_head];
         if(head.numChildren > 0)
         {
            head.removeChildAt(0);
         }
         var componentObject:MovieClip = this.getMCSComponent("head",id);
         if(componentObject == null)
         {
            componentObject = new head8000();
         }
         head.addChild(componentObject);
         head.setChildIndex(componentObject,0);
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            head.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
            head.cacheAsBitmap = true;
         }
      }
      
      public function setHatHair(id:int) : *
      {
         var head:MovieClip = this.partList[PART_head];
         if(head.numChildren > 2)
         {
            head.removeChildAt(2);
         }
         this.hatHair = this.getMCSComponent("hair",id);
         if(this.hatHair == null)
         {
            this.hair = new hair6000();
         }
         head.addChild(this.hatHair);
         head.setChildIndex(this.hatHair,2);
         head.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
         head.cacheAsBitmap = true;
      }
      
      public function setHair(id:int) : *
      {
         var head:MovieClip = this.partList[PART_head];
         if(head.numChildren > 3)
         {
            head.removeChildAt(3);
         }
         this.hair = this.getMCSComponent("hair",id);
         if(this.hair == null)
         {
            this.hair = new hair6000();
         }
         head.addChild(this.hair);
         head.setChildIndex(this.hair,3);
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            head.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
            head.cacheAsBitmap = true;
         }
      }
      
      public function setMask(id:int, pcolor:int = 1, scolor:int = 1) : *
      {
         var head:MovieClip = this.partList[PART_head];
         if(head.numChildren > 1)
         {
            head.removeChildAt(1);
         }
         this.headMask = this.getMCSComponent("mask",id);
         if(this.headMask == null)
         {
            this.headMask = new mask9000();
         }
         if(pcolor != 1 && this.headMask.primaryColor != null)
         {
            ColorCode.changeColor(this.headMask.primaryColor,pcolor);
         }
         if(scolor != 1 && this.headMask.secondaryColor != null)
         {
            ColorCode.changeColor(this.headMask.secondaryColor,scolor);
         }
         head.addChild(this.headMask);
         head.setChildIndex(this.headMask,1);
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            head.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
            head.cacheAsBitmap = true;
         }
      }
      
      public function setHat(id:int, pcolor:int = 1, scolor:int = 1) : *
      {
         var hat:MovieClip = this.partList[PART_hat];
         if(hat.numChildren > 0)
         {
            hat.removeChildAt(0);
         }
         var componentObject:MovieClip = this.getMCSComponent("hat",id);
         if(componentObject == null)
         {
            componentObject = new hat7000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         hat.addChild(componentObject);
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            hat.cacheAsBitmapMatrix = hat.transform.concatenatedMatrix;
            hat.cacheAsBitmap = true;
         }
      }
      
      public function setNeck(id:int) : *
      {
         var neck:MovieClip = this.partList[PART_neck];
         if(neck.numChildren > 1)
         {
            neck.removeChildAt(1);
         }
         if(neck.numChildren > 0)
         {
            neck.removeChildAt(0);
         }
         var componentObject:MovieClip = this.getMCSComponent("neck",id);
         if(componentObject == null)
         {
            componentObject = new neck10000();
         }
         neck.addChild(componentObject);
         neck.cacheAsBitmapMatrix = neck.transform.concatenatedMatrix;
         neck.cacheAsBitmap = true;
      }
      
      public function setGloves(id:int) : *
      {
         var l_hand:MovieClip = this.partList[PART_l_hand];
         var r_hand:MovieClip = this.partList[PART_r_hand];
         if(l_hand.numChildren > 0)
         {
            l_hand.removeChildAt(0);
            r_hand.removeChildAt(0);
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         var componentObject:MovieClip = this.getMCSComponent("hand",id);
         if(componentObject == null)
         {
            componentObject = new hand5000();
         }
         l_hand.addChild(componentObject);
         if(!animated)
         {
            l_hand.cacheAsBitmapMatrix = l_hand.transform.concatenatedMatrix;
            l_hand.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("hand",id);
         if(componentObject == null)
         {
            componentObject = new hand5000();
         }
         r_hand.addChild(componentObject);
         if(!animated)
         {
            r_hand.cacheAsBitmapMatrix = r_hand.transform.concatenatedMatrix;
            r_hand.cacheAsBitmap = true;
         }
      }
      
      public function setShoes(id:int) : *
      {
         var componentObject:MovieClip = null;
         var l_calf:MovieClip = this.partList[PART_l_calf];
         var r_calf:MovieClip = this.partList[PART_r_calf];
         var l_foot:MovieClip = this.partList[PART_l_foot];
         var r_foot:MovieClip = this.partList[PART_r_foot];
         if(l_calf.numChildren > 0)
         {
            l_calf.removeChildAt(0);
            r_calf.removeChildAt(0);
            l_foot.removeChildAt(0);
            r_foot.removeChildAt(0);
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         componentObject = this.getMCSComponent("foottop",id);
         if(componentObject == null)
         {
            componentObject = new foottop12000();
         }
         l_calf.addChild(componentObject);
         l_calf.setChildIndex(componentObject,0);
         if(!animated)
         {
            l_calf.cacheAsBitmapMatrix = l_calf.transform.concatenatedMatrix;
            l_calf.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("foottop",id);
         if(componentObject == null)
         {
            componentObject = new foottop12000();
         }
         r_calf.addChild(componentObject);
         r_calf.setChildIndex(componentObject,0);
         if(!animated)
         {
            r_calf.cacheAsBitmapMatrix = r_calf.transform.concatenatedMatrix;
            r_calf.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("foot",id);
         if(componentObject == null)
         {
            componentObject = new foot12000();
         }
         l_foot.addChild(componentObject);
         if(!animated)
         {
            l_foot.cacheAsBitmapMatrix = l_foot.transform.concatenatedMatrix;
            l_foot.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("foot",id);
         if(componentObject == null)
         {
            componentObject = new foot12000();
         }
         r_foot.addChild(componentObject);
         if(!animated)
         {
            r_foot.cacheAsBitmapMatrix = r_foot.transform.concatenatedMatrix;
            r_foot.cacheAsBitmap = true;
         }
      }
      
      public function setArmor(id:int, pcolor:int = 1, scolor:int = 1) : *
      {
         var componentObject:MovieClip = null;
         var torso:MovieClip = this.partList[PART_torso];
         var stomach:MovieClip = this.partList[PART_stomach];
         var l_uparm:MovieClip = this.partList[PART_l_uparm];
         var r_uparm:MovieClip = this.partList[PART_r_uparm];
         var l_lowarm:MovieClip = this.partList[PART_l_lowarm];
         var r_lowarm:MovieClip = this.partList[PART_r_lowarm];
         var pelvic:MovieClip = this.partList[PART_pelvic];
         var neck:MovieClip = this.partList[PART_neck];
         if(torso.numChildren > 0)
         {
            torso.removeChildAt(0);
            stomach.removeChildAt(0);
            l_uparm.removeChildAt(0);
            r_uparm.removeChildAt(0);
            l_lowarm.removeChildAt(0);
            r_lowarm.removeChildAt(0);
            pelvic.removeChildAt(0);
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         componentObject = this.getMCSComponent("torso",id);
         if(componentObject == null)
         {
            componentObject = new torso4000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         torso.addChild(componentObject);
         if(!animated)
         {
            torso.cacheAsBitmapMatrix = torso.transform.concatenatedMatrix;
            torso.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("stomach",id);
         if(componentObject == null)
         {
            componentObject = new stomach4000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         stomach.addChild(componentObject);
         if(!animated)
         {
            stomach.cacheAsBitmapMatrix = stomach.transform.concatenatedMatrix;
            stomach.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("uparm",id);
         if(componentObject == null)
         {
            componentObject = new uparm4000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         l_uparm.addChild(componentObject);
         if(!animated)
         {
            l_uparm.cacheAsBitmapMatrix = l_uparm.transform.concatenatedMatrix;
            l_uparm.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("uparm",id);
         if(componentObject == null)
         {
            componentObject = new uparm4000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         r_uparm.addChild(componentObject);
         if(!animated)
         {
            r_uparm.cacheAsBitmapMatrix = r_uparm.transform.concatenatedMatrix;
            r_uparm.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("lowarm",id);
         if(componentObject == null)
         {
            componentObject = new lowarm4000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         l_lowarm.addChild(componentObject);
         if(!animated)
         {
            l_lowarm.cacheAsBitmapMatrix = l_lowarm.transform.concatenatedMatrix;
            l_lowarm.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("lowarm",id);
         if(componentObject == null)
         {
            componentObject = new lowarm4000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         r_lowarm.addChild(componentObject);
         if(!animated)
         {
            r_lowarm.cacheAsBitmapMatrix = r_lowarm.transform.concatenatedMatrix;
            r_lowarm.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("pelvic",id);
         if(componentObject == null)
         {
            componentObject = new pelvic4000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         pelvic.addChild(componentObject);
         if(!animated)
         {
            pelvic.cacheAsBitmapMatrix = pelvic.transform.concatenatedMatrix;
            pelvic.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("neck",id);
         if(componentObject != null)
         {
            if(pcolor != 1 && componentObject.primaryColor != null)
            {
               ColorCode.changeColor(componentObject.primaryColor,pcolor);
            }
            if(scolor != 1 && componentObject.secondaryColor != null)
            {
               ColorCode.changeColor(componentObject.secondaryColor,scolor);
            }
            neck.addChild(componentObject);
            if(!animated)
            {
               neck.cacheAsBitmapMatrix = neck.transform.concatenatedMatrix;
               neck.cacheAsBitmap = true;
            }
         }
      }
      
      public function setPants(id:int, pcolor:int = 1, scolor:int = 1) : *
      {
         var componentObject:MovieClip = null;
         var crotch:MovieClip = this.partList[PART_crotch];
         var l_thigh:MovieClip = this.partList[PART_l_thigh];
         var r_thigh:MovieClip = this.partList[PART_r_thigh];
         var l_calf:MovieClip = this.partList[PART_l_calf];
         var r_calf:MovieClip = this.partList[PART_r_calf];
         if(crotch.numChildren > 0)
         {
            crotch.removeChildAt(0);
            l_thigh.removeChildAt(0);
            r_thigh.removeChildAt(0);
            l_calf.removeChildAt(1);
            r_calf.removeChildAt(1);
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         componentObject = this.getMCSComponent("crotch",id);
         if(componentObject == null)
         {
            componentObject = new crotch11000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         crotch.addChild(componentObject);
         if(!animated)
         {
            crotch.cacheAsBitmapMatrix = crotch.transform.concatenatedMatrix;
            crotch.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("thigh",id);
         if(componentObject == null)
         {
            componentObject = new thigh11000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         l_thigh.addChild(componentObject);
         if(!animated)
         {
            l_thigh.cacheAsBitmapMatrix = l_thigh.transform.concatenatedMatrix;
            l_thigh.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("thigh",id);
         if(componentObject == null)
         {
            componentObject = new thigh11000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         r_thigh.addChild(componentObject);
         if(!animated)
         {
            r_thigh.cacheAsBitmapMatrix = r_thigh.transform.concatenatedMatrix;
            r_thigh.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("calf",id);
         if(componentObject == null)
         {
            componentObject = new calf11000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         l_calf.addChild(componentObject);
         if(!animated)
         {
            l_calf.cacheAsBitmapMatrix = l_calf.transform.concatenatedMatrix;
            l_calf.cacheAsBitmap = true;
         }
         componentObject = this.getMCSComponent("calf",id);
         if(componentObject == null)
         {
            componentObject = new calf11000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         r_calf.addChild(componentObject);
         if(!animated)
         {
            r_calf.cacheAsBitmapMatrix = r_calf.transform.concatenatedMatrix;
            r_calf.cacheAsBitmap = true;
         }
      }
      
      public function setWeapon(id:int) : *
      {
         var componentObject:MovieClip = null;
         var weapon:MovieClip = this.partList[PART_weapon];
         if(weapon.numChildren > 0)
         {
            weapon.removeChildAt(0);
         }
         componentObject = this.getMCSComponent("weapon",id);
         if(componentObject == null)
         {
            componentObject = new weapon13000();
         }
         weapon.addChild(componentObject);
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            weapon.cacheAsBitmapMatrix = weapon.transform.concatenatedMatrix;
            weapon.cacheAsBitmap = true;
         }
      }
      
      public function setProp(id:int) : *
      {
         var componentObject:MovieClip = null;
         var prop:MovieClip = this.partList[PART_prop];
         if(prop.numChildren > 0)
         {
            prop.removeChildAt(0);
         }
         componentObject = this.getMCSComponent("prop",id);
         if(componentObject == null)
         {
            componentObject = new prop13000();
         }
         prop.addChild(componentObject);
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            prop.cacheAsBitmapMatrix = prop.transform.concatenatedMatrix;
            prop.cacheAsBitmap = true;
         }
      }
      
      public function setProp2(id:int) : *
      {
         var componentObject:MovieClip = null;
         var prop2:MovieClip = this.partList[PART_prop2];
         if(prop2.numChildren > 0)
         {
            prop2.removeChildAt(0);
         }
         componentObject = this.getMCSComponent("prop",id);
         if(componentObject == null)
         {
            componentObject = new prop13000();
         }
         prop2.addChild(componentObject);
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            prop2.cacheAsBitmapMatrix = prop2.transform.concatenatedMatrix;
            prop2.cacheAsBitmap = true;
         }
      }
      
      public function getAnim() : String
      {
         return this.animation;
      }
      
      public function startAnim(animName:String) : *
      {
         if(this.animation == animName)
         {
            return;
         }
         if(animList[animName] == null)
         {
            trace("missing animation: " + animName);
            return;
         }
         this.animation = animName;
         this.currentAnimation = animList[animName];
         this.currentAnimationLooping = this.currentAnimation.looping;
         this.currentAnimationDuration = this.currentAnimation.duration;
         this.frameCounter = 0;
         this.currentAnimation.frameList[0].setVisible(this);
         this.updateFrame();
         this.currentAnimation.frameList[this.frameCounter].reorderLayers(this);
      }
      
      public function restartAnim() : *
      {
         this.frameCounter = 0;
         this.currentAnimation.frameList[0].setVisible(this);
         this.updateFrame();
         this.currentAnimation.frameList[this.frameCounter].reorderLayers(this);
      }
      
      public function updateAnimation() : String
      {
         if(this.currentAnimation == null || !this.currentAnimationLooping && this.frameCounter >= this.currentAnimationDuration)
         {
            return "";
         }
         ++this.frameCounter;
         if(this.frameCounter < this.currentAnimationDuration)
         {
            this.updateFrame();
         }
         else
         {
            if(!(this.currentAnimationLooping && this.frameCounter >= this.currentAnimationDuration))
            {
               return this.animation;
            }
            this.frameCounter = 0;
            this.updateFrame();
         }
         return "";
      }
      
      internal function updateFrame() : *
      {
         if(this.frameCounter < this.currentAnimation.frameList.length)
         {
            this.currentAnimation.frameList[this.frameCounter].setPosition(this);
         }
      }
      
      public function setPose(animName:String, frameNum:int) : *
      {
         MCSCharacter.animList[animName].frameList[frameNum].setPosition(this);
         this.currentAnimation = null;
      }
      
      public function removeHat() : *
      {
         this.hair.visible = true;
         this.hatHair.visible = false;
      }
      
      public function wearHat() : *
      {
         this.hair.visible = false;
         this.hatHair.visible = true;
      }
      
      internal function createFlyingHat() : *
      {
         if(this.isPlayer)
         {
            return null;
         }
         var hat:MovieClip = this.partList[PART_hat];
         if(hat.numChildren == 0)
         {
            return;
         }
         this.hair.visible = true;
         this.hatHair.visible = false;
         var movtx:int = Math.random() * 10 - 5;
         var rot:int = 20;
         if(movtx < 0)
         {
            rot = -20;
         }
         var movty:int = -Math.random() * 16 - 8;
         ProjectileManager.createFlyingPart(hat,movtx,movty,rot);
      }
      
      internal function createFlyingHead() : PartProjectile
      {
         if(this.isPlayer)
         {
            return null;
         }
         var head:MovieClip = this.partList[PART_head];
         var movtx:int = Math.random() * 10 - 5;
         var rot:int = 20;
         if(movtx < 0)
         {
            rot = -20;
         }
         var movty:int = -Math.random() * 16 - 8;
         return ProjectileManager.createFlyingHead(head,movtx,movty,rot);
      }
      
      internal function createFlyingWeapon() : *
      {
         if(this.isPlayer)
         {
            return null;
         }
         var weapon:MovieClip = this.partList[PART_weapon];
         if(weapon.numChildren == 0)
         {
            return;
         }
         var movtx:int = Math.random() * 16 - 8;
         var rot:int = 20;
         if(movtx < 0)
         {
            rot = -20;
         }
         var movty:int = -Math.random() * 16 - 8;
         ProjectileManager.createFlyingPart(weapon,movtx,movty,rot);
      }
      
      public function showHealthBar() : *
      {
         addChild(this.healthBar);
         this.healthBar.visible = true;
         if(this.displayName.text != "")
         {
            this.displayName.visible = true;
         }
         if(this.displayName.y > this.healthBar.y)
         {
            this.displayName.y = this.healthBar.y;
         }
      }
      
      public function hideHealthBar() : *
      {
         this.healthBar.visible = false;
         this.displayName.visible = false;
      }
      
      public function updateHealthBar(fraction:Number) : *
      {
         if(fraction > 1)
         {
            fraction = 1;
         }
         this.healthBar.bar.width = fraction * 60;
      }
      
      public function moveHealthBarX(posx:int) : *
      {
         this.healthBar.x = posx;
         this.displayName.x = posx;
      }
      
      public function moveHealthBarY(posy:int) : *
      {
         this.healthBar.y = posy;
         this.displayName.y = posy;
      }
      
      public function isFacingRight() : Boolean
      {
         return scaleX > 0;
      }
      
      public function faceLeft() : *
      {
         if(scaleX < 0)
         {
            return;
         }
         scaleX = -Math.abs(scaleX);
         var scale:Number = -Math.abs(this.healthBar.scaleX);
         this.healthBar.scaleX = scale;
         this.progressBar.scaleX = scale;
         this.displayName.scaleX = scale;
         this.speech.scaleX = scale;
      }
      
      public function faceRight() : *
      {
         if(scaleX > 0)
         {
            return;
         }
         scaleX = Math.abs(scaleX);
         var scale:Number = Math.abs(this.healthBar.scaleX);
         this.healthBar.scaleX = scale;
         this.progressBar.scaleX = scale;
         this.displayName.scaleX = scale;
         this.speech.scaleX = scale;
      }
      
      public function changeScale(sx:Number, sy:Number) : *
      {
         if(scaleX < 0)
         {
            scaleX = -sx;
         }
         else
         {
            scaleX = sx;
         }
         scaleY = sy;
         this.healthBar.scaleX /= sx;
         this.displayName.scaleX /= sx;
         this.progressBar.scaleX /= sx;
         this.speech.scaleX /= sx;
         this.healthBar.scaleY /= sy;
         this.displayName.scaleY /= sy;
         this.progressBar.scaleY /= sy;
         this.speech.scaleY /= sy;
      }
      
      public function resetScale() : *
      {
         scaleX = 1;
         scaleY = 1;
         this.healthBar.scaleX = 1;
         this.displayName.scaleX = 1;
         this.progressBar.scaleX = 1;
         this.speech.scaleX = 1;
         this.healthBar.scaleY = 1;
         this.displayName.scaleY = 1;
         this.progressBar.scaleY = 1;
         this.speech.scaleY = 1;
      }
      
      public function showDisplayName(flag:Boolean) : *
      {
         this.displayName.visible = flag;
      }
      
      public function setDisplayName(str:String, color:uint = 0) : *
      {
         addChild(this.displayName);
         if(str != "")
         {
            this.displayName.nametext.text = str;
            this.displayName.nametext.textColor = color;
            this.displayName.visible = true;
            this.displayName.cacheAsBitmap = true;
            if(this.healthBar.visible)
            {
               this.displayName.y = this.healthBar.y;
            }
            else
            {
               this.displayName.y = this.healthBar.y + 10;
            }
         }
         else
         {
            this.displayName.nametext.text = "";
            this.displayName.visible = false;
            this.displayName.cacheAsBitmap = false;
         }
      }
      
      public function setSpeechText(str:String) : *
      {
         var numlines:* = undefined;
         if(str != "")
         {
            addChild(this.speech);
            this.speech.words.text = str;
            this.speech.visible = true;
            numlines = this.speech.words.numLines;
            if(numlines > 6)
            {
               numlines = 6;
            }
            this.speech.bubble.gotoAndStop(numlines);
            this.speech.words.y = -44 - (numlines - 1) * 13;
         }
         else
         {
            this.speech.words.text = "";
            this.speech.visible = false;
         }
      }
      
      public function getProgressBar() : MCSProgressBar
      {
         addChild(this.progressBar);
         return this.progressBar;
      }
      
      public function showIcon(num:int) : *
      {
         addChild(this.mcsIcon);
         this.mcsIcon.gotoAndStop(num);
         this.mcsIcon.visible = true;
      }
   }
}

