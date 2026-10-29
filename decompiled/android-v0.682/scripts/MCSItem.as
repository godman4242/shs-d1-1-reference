package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol764")]
   public class MCSItem extends MovieClip
   {
      
      internal var displayItem:MovieClip;
      
      internal var displayItem1:MovieClip;
      
      internal var displayItem2:MovieClip;
      
      internal var displayItem3:MovieClip;
      
      internal var displayItem4:MovieClip;
      
      public function MCSItem()
      {
         super();
         mouseChildren = false;
      }
      
      public function clearItem() : *
      {
         this.cacheAsBitmap = false;
         var max:int = numChildren;
         for(var q:int = 0; q < max; q++)
         {
            removeChildAt(0);
         }
      }
      
      public function setPrimaryColor(color:uint) : *
      {
         var mc:MovieClip = null;
         var max:int = numChildren;
         for(var q:int = 0; q < max; q++)
         {
            mc = MovieClip(getChildAt(q)).primaryColor;
            if(mc != null)
            {
               ColorCode.changeColor(mc,color);
            }
         }
      }
      
      public function setSecondaryColor(color:uint) : *
      {
         var mc:MovieClip = null;
         var max:int = numChildren;
         for(var q:int = 0; q < max; q++)
         {
            mc = MovieClip(getChildAt(q)).secondaryColor;
            if(mc != null)
            {
               ColorCode.changeColor(mc,color);
            }
         }
      }
      
      public function setHat(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("hat",id);
         if(this.displayItem == null)
         {
            this.displayItem = new HatDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.scaleX = 1.3;
            this.displayItem.scaleY = 1.3;
            this.displayItem.x = -1;
            this.displayItem.y = 10;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setHair(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("hair",id);
         if(this.displayItem == null)
         {
            this.displayItem = new HatDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            this.displayItem1 = this.getMCSComponent("head",8000);
            addChild(this.displayItem1);
            this.displayItem1.scaleX = 1.3;
            this.displayItem1.scaleY = 1.3;
            this.displayItem1.x = -1;
            this.displayItem1.y = 10;
            addChild(this.displayItem);
            this.displayItem.scaleX = 1.3;
            this.displayItem.scaleY = 1.3;
            this.displayItem.x = -1;
            this.displayItem.y = 10;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setHead(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("head",id);
         if(this.displayItem == null)
         {
            this.displayItem = new HatDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            if(this.displayItem.height * 2.5 > 60)
            {
               this.displayItem.height = 60;
            }
            else
            {
               this.displayItem.scaleX = 2.5;
            }
            this.displayItem.scaleY = this.displayItem.scaleX;
            this.displayItem.x = -10;
            this.displayItem.y = 6;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setMask(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("mask",id);
         if(this.displayItem == null)
         {
            this.displayItem = new MaskDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.scaleX = 2;
            this.displayItem.scaleY = 2;
            this.displayItem.x = -10;
            this.displayItem.y = 4;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setWeapon(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("weapon",id);
         if(this.displayItem == null)
         {
            this.displayItem = new WeaponDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.x = -15;
            this.displayItem.y = 15;
            this.displayItem.rotation = -45;
            this.displayItem.width = 60;
            this.displayItem.scaleY = this.displayItem.scaleX;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setConsumable(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("item",id);
         if(this.displayItem == null)
         {
            this.displayItem = new item0();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.scaleX = 1;
            this.displayItem.scaleY = 1;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setAccessory(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("acc",id);
         if(this.displayItem == null)
         {
            this.displayItem = new AccessoryDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.scaleX = 1.2;
            this.displayItem.scaleY = 1.2;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setGloves(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("hand",id);
         if(this.displayItem == null)
         {
            this.displayItem = new GlovesDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.scaleX = 2;
            this.displayItem.scaleY = 2;
            this.displayItem.x = -15;
            this.displayItem1 = this.getMCSComponent("hand",id);
            addChild(this.displayItem1);
            this.displayItem1.scaleX = 2;
            this.displayItem1.scaleY = 2;
            this.displayItem1.x = 15;
            this.displayItem1.scaleX *= -1;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setShoes(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("foot",id);
         if(this.displayItem == null)
         {
            this.displayItem = new ShoesDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.scaleX = 1.5;
            this.displayItem.scaleY = 1.5;
            this.displayItem.x = 6;
            this.displayItem.y = 10;
            this.displayItem2 = this.getMCSComponent("foottop",id);
            addChild(this.displayItem2);
            this.displayItem2.scaleX = 1.5;
            this.displayItem2.scaleY = 1.5;
            this.displayItem2.x = 7;
            this.displayItem2.y = -28;
            this.displayItem2.rotation = 2;
            this.displayItem1 = this.getMCSComponent("foot",id);
            addChild(this.displayItem1);
            this.displayItem1.scaleX = 1.5;
            this.displayItem1.scaleY = 1.5;
            this.displayItem1.x = -15;
            this.displayItem1.y = 10;
            this.displayItem3 = this.getMCSComponent("foottop",id);
            addChild(this.displayItem3);
            this.displayItem3.scaleX = 1.5;
            this.displayItem3.scaleY = 1.5;
            this.displayItem3.x = -13;
            this.displayItem3.y = -28;
            this.displayItem3.rotation = 2;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setArmor(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("stomach",id);
         if(this.displayItem == null)
         {
            this.displayItem = new ArmorDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.x = -0.65;
            this.displayItem.y = 5.9;
            this.displayItem1 = this.getMCSComponent("pelvic",id);
            addChild(this.displayItem1);
            this.displayItem1.x = -0.35;
            this.displayItem1.y = 10;
            this.displayItem2 = this.getMCSComponent("torso",id);
            addChild(this.displayItem2);
            this.displayItem2.y = -2;
            this.displayItem3 = this.getMCSComponent("uparm",id);
            addChild(this.displayItem3);
            this.displayItem3.x = -5.2;
            this.displayItem3.y = -13.5;
            this.displayItem4 = this.getMCSComponent("lowarm",id);
            addChild(this.displayItem4);
            this.displayItem4.x = -6.5;
            this.displayItem4.y = 4.8;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function setPants(id:int) : *
      {
         this.clearItem();
         this.displayItem = this.getMCSComponent("thigh",id);
         if(this.displayItem == null)
         {
            this.displayItem = new PantsDummyIcon();
            addChild(this.displayItem);
         }
         else
         {
            addChild(this.displayItem);
            this.displayItem.x = 3.5;
            this.displayItem.y = -17.4;
            this.displayItem.rotation = 20.7;
            this.displayItem2 = this.getMCSComponent("calf",id);
            addChild(this.displayItem2);
            this.displayItem2.x = -5.8;
            this.displayItem2.y = 7.7;
            this.displayItem2.rotation = 19;
            this.displayItem1 = this.getMCSComponent("crotch",id);
            addChild(this.displayItem1);
            this.displayItem1.x = 6;
            this.displayItem1.y = -23;
            this.displayItem1.rotation = 8.3;
            this.displayItem3 = this.getMCSComponent("thigh",id);
            addChild(this.displayItem3);
            this.displayItem3.x = 6.05;
            this.displayItem3.y = -19.45;
            this.displayItem3.rotation = 1.9;
            this.displayItem4 = this.getMCSComponent("calf",id);
            addChild(this.displayItem4);
            this.displayItem4.x = 5.45;
            this.displayItem4.y = 7.35;
            this.displayItem4.rotation = 1;
         }
         var itemxml:XMLItem = QuestEngine.getItemData(id);
         var animated:Boolean = itemxml != null && itemxml.animated;
         if(!animated)
         {
            this.cacheAsBitmap = true;
         }
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
   }
}

