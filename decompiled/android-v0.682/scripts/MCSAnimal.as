package
{
   import flash.display.MovieClip;
   
   public class MCSAnimal extends MCSCharacter
   {
      
      internal var animalName:String = "";
      
      public function MCSAnimal()
      {
         var mc:MovieClip = null;
         super();
         for(var i:int = 0; i <= partListLength; i++)
         {
            mc = new MovieClip();
            addChild(mc);
            partList.push(mc);
         }
         healthBar.y = -120;
         displayName.y = -120;
      }
      
      override public function initMCS(armoritem:Item, glovesitem:Item, hairitem:Item, hatitem:Item, headitem:Item, maskitem:Item, neckitem:Item, pantsitem:Item, shoesitem:Item, weaponitem:Item, propid:int = 0, prop2id:int = 0) : *
      {
         var headid:int = headitem.getItemID();
         var armorid:int = armoritem.getItemID();
         var pantsid:int = pantsitem.getItemID();
         if(headid > 0)
         {
            this.setHead(headid);
         }
         else
         {
            this.setHead(0);
         }
         if(armorid > 0)
         {
            this.setBody(armorid);
         }
         else
         {
            this.setBody(0);
         }
         if(pantsid > 0)
         {
            this.setLegs(pantsid);
         }
         else
         {
            this.setLegs(0);
         }
         if(pantsid > 0)
         {
            this.setTail(pantsid);
         }
         else
         {
            this.setTail(0);
         }
      }
      
      override public function setHead(id:int) : *
      {
         var componentObject:MovieClip = null;
         var head:MovieClip = partList[PART_head];
         if(head.numChildren > 0)
         {
            head.removeChildAt(0);
         }
         componentObject = getMCSComponent("head_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         head.addChild(componentObject);
         head.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
         head.cacheAsBitmap = true;
      }
      
      public function setBody(id:int) : *
      {
         var componentObject:MovieClip = null;
         var neck:MovieClip = partList[PART_neck];
         var torso:MovieClip = partList[PART_torso];
         if(torso.numChildren > 0)
         {
            neck.removeChildAt(0);
            torso.removeChildAt(0);
         }
         componentObject = getMCSComponent("neck_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         neck.addChild(componentObject);
         neck.cacheAsBitmapMatrix = neck.transform.concatenatedMatrix;
         neck.cacheAsBitmap = true;
         componentObject = getMCSComponent("torso_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         torso.addChild(componentObject);
         torso.cacheAsBitmapMatrix = torso.transform.concatenatedMatrix;
         torso.cacheAsBitmap = true;
      }
      
      public function setTail(id:int) : *
      {
         var componentObject:MovieClip = null;
         var tail:MovieClip = partList[PART_pelvic];
         if(tail.numChildren > 0)
         {
            tail.removeChildAt(0);
         }
         componentObject = getMCSComponent("tail_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         tail.addChild(componentObject);
         tail.cacheAsBitmapMatrix = tail.transform.concatenatedMatrix;
         tail.cacheAsBitmap = true;
      }
      
      public function setLegs(id:int) : *
      {
         var componentObject:MovieClip = null;
         var r_frontleg1:MovieClip = partList[PART_r_uparm];
         var r_frontleg2:MovieClip = partList[PART_r_lowarm];
         var r_frontleg3:MovieClip = partList[PART_r_hand];
         var l_frontleg1:MovieClip = partList[PART_l_uparm];
         var l_frontleg2:MovieClip = partList[PART_l_lowarm];
         var l_frontleg3:MovieClip = partList[PART_l_hand];
         var r_backleg1:MovieClip = partList[PART_r_thigh];
         var r_backleg2:MovieClip = partList[PART_r_calf];
         var r_backleg3:MovieClip = partList[PART_r_foot];
         var l_backleg1:MovieClip = partList[PART_l_thigh];
         var l_backleg2:MovieClip = partList[PART_l_calf];
         var l_backleg3:MovieClip = partList[PART_l_foot];
         if(r_frontleg1.numChildren > 0)
         {
            r_frontleg1.removeChildAt(0);
            r_frontleg2.removeChildAt(0);
            r_frontleg3.removeChildAt(0);
            l_frontleg1.removeChildAt(0);
            l_frontleg2.removeChildAt(0);
            l_frontleg3.removeChildAt(0);
            r_backleg1.removeChildAt(0);
            r_backleg2.removeChildAt(0);
            r_backleg3.removeChildAt(0);
            l_backleg1.removeChildAt(0);
            l_backleg2.removeChildAt(0);
            l_backleg3.removeChildAt(0);
         }
         componentObject = getMCSComponent("frontlegup_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg1.addChild(componentObject);
         r_frontleg1.cacheAsBitmapMatrix = r_frontleg1.transform.concatenatedMatrix;
         r_frontleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontlegdown_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg2.addChild(componentObject);
         r_frontleg2.cacheAsBitmapMatrix = r_frontleg2.transform.concatenatedMatrix;
         r_frontleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontfoot_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg3.addChild(componentObject);
         r_frontleg3.cacheAsBitmapMatrix = r_frontleg3.transform.concatenatedMatrix;
         r_frontleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontlegup_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg1.addChild(componentObject);
         l_frontleg1.cacheAsBitmapMatrix = l_frontleg1.transform.concatenatedMatrix;
         l_frontleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontlegdown_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg2.addChild(componentObject);
         l_frontleg2.cacheAsBitmapMatrix = l_frontleg2.transform.concatenatedMatrix;
         l_frontleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontfoot_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg3.addChild(componentObject);
         l_frontleg3.cacheAsBitmapMatrix = l_frontleg3.transform.concatenatedMatrix;
         l_frontleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("backlegup_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg1.addChild(componentObject);
         r_backleg1.cacheAsBitmapMatrix = r_backleg1.transform.concatenatedMatrix;
         r_backleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("backlegdown_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg2.addChild(componentObject);
         r_backleg2.cacheAsBitmapMatrix = r_backleg2.transform.concatenatedMatrix;
         r_backleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("backfoot_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg3.addChild(componentObject);
         r_backleg3.cacheAsBitmapMatrix = r_backleg3.transform.concatenatedMatrix;
         r_backleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("backlegup_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg1.addChild(componentObject);
         l_backleg1.cacheAsBitmapMatrix = l_backleg1.transform.concatenatedMatrix;
         l_backleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("backlegdown_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg2.addChild(componentObject);
         l_backleg2.cacheAsBitmapMatrix = l_backleg2.transform.concatenatedMatrix;
         l_backleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("backfoot_" + this.animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg3.addChild(componentObject);
         l_backleg3.cacheAsBitmapMatrix = l_backleg3.transform.concatenatedMatrix;
         l_backleg3.cacheAsBitmap = true;
      }
      
      override public function disposeMCS() : *
      {
      }
   }
}

