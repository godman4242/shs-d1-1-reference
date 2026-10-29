package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol938")]
   public class MCSBust extends MovieClip
   {
      
      internal var partList:Array = new Array();
      
      internal var hairpart:MovieClip;
      
      internal var hatpart:MovieClip;
      
      internal var maskpart:MovieClip;
      
      public function MCSBust()
      {
         super();
         mouseChildren = false;
      }
      
      public function disposeMCSBust() : *
      {
         var childmax:int = numChildren;
         for(var i:int = 0; i < childmax; i++)
         {
            removeChildAt(0);
         }
         this.partList.length = 0;
         this.hairpart = null;
         this.hatpart = null;
         this.maskpart = null;
      }
      
      public function initMCS(armoritem:Item, hairitem:Item, hatitem:Item, headitem:Item, maskitem:Item, neckitem:Item) : *
      {
         var armorid:int = armoritem.getItemID();
         var hairid:int = hairitem.getItemID();
         var hatid:int = hatitem.getItemID();
         var headid:int = headitem.getItemID();
         var maskid:int = maskitem.getItemID();
         var neckid:int = neckitem.getItemID();
         if(neckid > 0)
         {
            this.setNeck(neckid);
         }
         else
         {
            this.setNeck(10000);
         }
         if(headid > 0)
         {
            this.setHead(headid);
         }
         else
         {
            this.setHead(8005);
         }
         if(maskid > 0)
         {
            this.setMask(maskid,maskitem.getPrimaryColor(),maskitem.getSecondaryColor());
         }
         else
         {
            this.setMask(9000);
         }
         if(hatid > 0 && hatid != 7000 && hatid != 7049)
         {
            if(hairid == 6001 || hairid <= 0)
            {
               this.setHair(6001);
            }
            else
            {
               this.setHair(6000);
            }
         }
         else if(hairid > 0)
         {
            this.setHair(hairid);
         }
         else
         {
            this.setHair(6001);
         }
         if(armorid > 0)
         {
            this.setArmor(armorid,armoritem.getPrimaryColor(),armoritem.getSecondaryColor());
         }
         else
         {
            this.setArmor(4000);
         }
         if(hatid > 0 && hatid != 7000 && hatid != 7049)
         {
            this.setHat(hatid,hatitem.getPrimaryColor(),hatitem.getSecondaryColor());
         }
         else
         {
            this.setHat(7000);
         }
         addChild(this.partList[MCSCharacter.PART_r_uparm]);
         this.setPose(MCSActor.BUSTPOSE1,0);
      }
      
      public function initMCSFromNPCID(npcID:int) : *
      {
         var npcData:XMLNpc = QuestEngine.getNPCData(npcID);
         if(npcData != null)
         {
            this.initMCSFromXML(npcData.mcs);
         }
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
         this.initMCS(itemArray[StatsManager.EQ_ARMOR],itemArray[StatsManager.EQ_HAIR],itemArray[StatsManager.EQ_HAT],itemArray[StatsManager.EQ_HEAD],itemArray[StatsManager.EQ_MASK],itemArray[StatsManager.EQ_NECK]);
      }
      
      public function initMCSFromPlayer() : *
      {
         this.initMCS(StatsManager.equipment[StatsManager.EQ_ARMOR],StatsManager.equipment[StatsManager.EQ_HAIR],StatsManager.equipment[StatsManager.EQ_HAT],StatsManager.equipment[StatsManager.EQ_HEAD],StatsManager.equipment[StatsManager.EQ_MASK],StatsManager.equipment[StatsManager.EQ_NECK]);
      }
      
      public function initMCSFromXML(xml:XMLList) : *
      {
         var armorid:int = 0;
         var hairid:int = 0;
         var hatid:int = 0;
         var headid:int = 0;
         var maskid:int = 0;
         var neckid:int = 0;
         if(xml.armor.toString() != "")
         {
            armorid = this.processString(xml.armor);
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
         var armorItem:Item = new Item(armorid);
         if(xml.armorpcolor.toString() != "")
         {
            armorItem.setPrimaryColor(xml.armorpcolor);
         }
         if(xml.armorscolor.toString() != "")
         {
            armorItem.setSecondaryColor(xml.armorscolor);
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
         this.initMCS(armorItem,new Item(hairid),new Item(hatid),new Item(headid),new Item(maskid),new Item(neckid));
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
      
      public function setHead(id:int) : *
      {
         var head:MovieClip = this.partList[MCSCharacter.PART_head];
         var componentObject:MovieClip = this.getMCSComponent("head",id);
         if(componentObject == null)
         {
            componentObject = new head8004();
         }
         this.addChild(componentObject);
         if(head != null)
         {
            componentObject.x = head.x;
            componentObject.y = head.y;
            componentObject.rotation = head.rotation;
            setChildIndex(componentObject,getChildIndex(head));
            removeChild(head);
         }
         this.partList[MCSCharacter.PART_head] = componentObject;
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            componentObject.cacheAsBitmapMatrix = componentObject.transform.concatenatedMatrix;
            componentObject.cacheAsBitmap = true;
         }
      }
      
      public function setHat(id:int, pcolor:int = 1, scolor:int = 1) : *
      {
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
         this.addChild(componentObject);
         if(this.hatpart != null)
         {
            componentObject.x = this.hatpart.x;
            componentObject.y = this.hatpart.y;
            componentObject.rotation = this.hatpart.rotation;
            setChildIndex(componentObject,getChildIndex(this.hatpart));
            removeChild(this.hatpart);
         }
         this.hatpart = componentObject;
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            componentObject.cacheAsBitmapMatrix = componentObject.transform.concatenatedMatrix;
            componentObject.cacheAsBitmap = true;
         }
      }
      
      public function setHair(id:int) : *
      {
         var componentObject:MovieClip = this.getMCSComponent("hair",id);
         if(componentObject == null)
         {
            componentObject = new hair6000();
         }
         this.addChild(componentObject);
         if(this.hairpart != null)
         {
            componentObject.x = this.hairpart.x;
            componentObject.y = this.hairpart.y;
            componentObject.rotation = this.hairpart.rotation;
            setChildIndex(componentObject,getChildIndex(this.hairpart));
            removeChild(this.hairpart);
         }
         this.hairpart = componentObject;
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            componentObject.cacheAsBitmapMatrix = componentObject.transform.concatenatedMatrix;
            componentObject.cacheAsBitmap = true;
         }
      }
      
      public function setMask(id:int, pcolor:int = 1, scolor:int = 1) : *
      {
         var componentObject:MovieClip = this.getMCSComponent("mask",id);
         if(componentObject == null)
         {
            componentObject = new mask9000();
         }
         if(pcolor != 1 && componentObject.primaryColor != null)
         {
            ColorCode.changeColor(componentObject.primaryColor,pcolor);
         }
         if(scolor != 1 && componentObject.secondaryColor != null)
         {
            ColorCode.changeColor(componentObject.secondaryColor,scolor);
         }
         this.addChild(componentObject);
         if(this.maskpart != null)
         {
            componentObject.x = this.maskpart.x;
            componentObject.y = this.maskpart.y;
            componentObject.rotation = this.maskpart.rotation;
            setChildIndex(componentObject,getChildIndex(this.maskpart));
            removeChild(this.maskpart);
         }
         this.maskpart = componentObject;
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            componentObject.cacheAsBitmapMatrix = componentObject.transform.concatenatedMatrix;
            componentObject.cacheAsBitmap = true;
         }
      }
      
      public function setNeck(id:int) : *
      {
         var neck:MovieClip = this.partList[MCSCharacter.PART_neck];
         var componentObject:MovieClip = this.getMCSComponent("neck",id);
         if(componentObject == null)
         {
            componentObject = new neck10000();
         }
         this.addChild(componentObject);
         if(neck != null)
         {
            componentObject.x = neck.x;
            componentObject.y = neck.y;
            componentObject.rotation = neck.rotation;
            setChildIndex(componentObject,getChildIndex(neck));
            removeChild(neck);
         }
         this.partList[MCSCharacter.PART_neck] = componentObject;
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            componentObject.cacheAsBitmapMatrix = componentObject.transform.concatenatedMatrix;
            componentObject.cacheAsBitmap = true;
         }
      }
      
      public function setArmor(id:int, pcolor:int = 1, scolor:int = 1) : *
      {
         var ClassDefinition:Class = null;
         var componentObject:MovieClip = null;
         var torso:MovieClip = this.partList[MCSCharacter.PART_torso];
         var r_uparm:MovieClip = this.partList[MCSCharacter.PART_r_uparm];
         var neck:MovieClip = this.partList[MCSCharacter.PART_neck];
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
         this.addChild(componentObject);
         if(torso != null)
         {
            componentObject.x = torso.x;
            componentObject.y = torso.y;
            componentObject.rotation = torso.rotation;
            setChildIndex(componentObject,getChildIndex(torso));
            removeChild(torso);
         }
         this.partList[MCSCharacter.PART_torso] = componentObject;
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            componentObject.cacheAsBitmapMatrix = componentObject.transform.concatenatedMatrix;
            componentObject.cacheAsBitmap = true;
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
         this.addChild(componentObject);
         if(r_uparm != null)
         {
            componentObject.x = r_uparm.x;
            componentObject.y = r_uparm.y;
            componentObject.rotation = r_uparm.rotation;
            setChildIndex(componentObject,getChildIndex(r_uparm));
            removeChild(r_uparm);
         }
         this.partList[MCSCharacter.PART_r_uparm] = componentObject;
         if(!animated)
         {
            componentObject.cacheAsBitmapMatrix = componentObject.transform.concatenatedMatrix;
            componentObject.cacheAsBitmap = true;
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
            this.addChild(componentObject);
            if(neck != null)
            {
               componentObject.x = neck.x;
               componentObject.y = neck.y;
               componentObject.rotation = neck.rotation;
               setChildIndex(componentObject,getChildIndex(neck));
               removeChild(neck);
            }
            this.partList[MCSCharacter.PART_neck] = componentObject;
            if(!animated)
            {
               componentObject.cacheAsBitmapMatrix = componentObject.transform.concatenatedMatrix;
               componentObject.cacheAsBitmap = true;
            }
         }
      }
      
      public function setPose(animName:String, frameNum:int) : *
      {
         var node:FrameNodeData = null;
         var id:int = 0;
         MCSCharacter.initAnimationData();
         var frame:FrameData = MCSCharacter.animList[animName].frameList[frameNum];
         var max:int = int(frame.nodeList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            node = frame.nodeList[i];
            id = node.id;
            switch(id)
            {
               case MCSCharacter.PART_head:
                  node.setPosition(this.partList[MCSCharacter.PART_head]);
                  node.setPosition(this.hatpart);
                  node.setPosition(this.hairpart);
                  node.setPosition(this.maskpart);
                  break;
               case MCSCharacter.PART_neck:
               case MCSCharacter.PART_torso:
               case MCSCharacter.PART_r_uparm:
                  node.setPosition(this.partList[id]);
            }
         }
      }
   }
}

