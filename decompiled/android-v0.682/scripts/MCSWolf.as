package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class MCSWolf extends MCSCharacter
   {
      
      public function MCSWolf()
      {
         var mc:MovieClip = null;
         super();
         partListLength = 25;
         for(var i:int = 0; i <= partListLength; i++)
         {
            mc = new MovieClip();
            addChild(mc);
            partList.push(mc);
         }
         healthBar.y = -70;
         displayName.y = -70;
         speech.y = -70;
      }
      
      override public function initMCS(armoritem:Item, glovesitem:Item, hairitem:Item, hatitem:Item, headitem:Item, maskitem:Item, neckitem:Item, pantsitem:Item, shoesitem:Item, weaponitem:Item, propid:int = 0, prop2id:int = 0) : *
      {
         var headid:int = headitem.getItemID();
         var armorid:int = armoritem.getItemID();
         var pantsid:int = pantsitem.getItemID();
         if(headid > 0)
         {
            this.setWolfHead(headid);
         }
         else
         {
            this.setWolfHead(0);
         }
         if(armorid > 0)
         {
            this.setWolfBody(armorid);
         }
         else
         {
            this.setWolfBody(0);
         }
         if(pantsid > 0)
         {
            this.setWolfLegs(pantsid);
         }
         else
         {
            this.setWolfLegs(0);
         }
         if(pantsid > 0)
         {
            this.setWolfTail(pantsid);
         }
         else
         {
            this.setWolfTail(0);
         }
      }
      
      public function setWolfHead(id:int) : *
      {
         var componentObject:MovieClip = null;
         var head:MovieClip = partList[PART_head];
         if(head.numChildren > 0)
         {
            head.removeChildAt(0);
         }
         var jaw:MovieClip = partList[PART_weapon];
         if(jaw.numChildren > 0)
         {
            jaw.removeChildAt(0);
         }
         componentObject = getMCSComponent("head_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         head.addChild(componentObject);
         head.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
         head.cacheAsBitmap = true;
         componentObject = getMCSComponent("jaw_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         jaw.addChild(componentObject);
         jaw.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
         jaw.cacheAsBitmap = true;
      }
      
      public function setWolfBody(id:int) : *
      {
         var componentObject:MovieClip = null;
         var neck:MovieClip = partList[PART_neck];
         var torso:MovieClip = partList[PART_torso];
         var stomach:MovieClip = partList[PART_stomach];
         var pelvic:MovieClip = partList[PART_pelvic];
         if(torso.numChildren > 0)
         {
            neck.removeChildAt(0);
            torso.removeChildAt(0);
            stomach.removeChildAt(0);
            pelvic.removeChildAt(0);
         }
         componentObject = getMCSComponent("neck_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         neck.addChild(componentObject);
         neck.cacheAsBitmapMatrix = neck.transform.concatenatedMatrix;
         neck.cacheAsBitmap = true;
         componentObject = getMCSComponent("torso_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         torso.addChild(componentObject);
         torso.cacheAsBitmapMatrix = torso.transform.concatenatedMatrix;
         torso.cacheAsBitmap = true;
         componentObject = getMCSComponent("stomach_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         stomach.addChild(componentObject);
         stomach.cacheAsBitmapMatrix = stomach.transform.concatenatedMatrix;
         stomach.cacheAsBitmap = true;
         componentObject = getMCSComponent("pelvic_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         pelvic.addChild(componentObject);
         pelvic.cacheAsBitmapMatrix = pelvic.transform.concatenatedMatrix;
         pelvic.cacheAsBitmap = true;
      }
      
      public function setWolfTail(id:int) : *
      {
         var componentObject:MovieClip = null;
         var tail1:MovieClip = partList[PART_prop];
         var tail2:MovieClip = partList[PART_prop2];
         var tail3:MovieClip = partList[PART_prop3];
         if(tail1.numChildren > 0)
         {
            tail1.removeChildAt(0);
            tail2.removeChildAt(0);
            tail3.removeChildAt(0);
         }
         componentObject = getMCSComponent("tail1_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         tail1.addChild(componentObject);
         tail1.cacheAsBitmapMatrix = tail1.transform.concatenatedMatrix;
         tail1.cacheAsBitmap = true;
         componentObject = getMCSComponent("tail2_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         tail2.addChild(componentObject);
         tail2.cacheAsBitmapMatrix = tail2.transform.concatenatedMatrix;
         tail2.cacheAsBitmap = true;
         componentObject = getMCSComponent("tail3_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         tail3.addChild(componentObject);
         tail3.cacheAsBitmapMatrix = tail3.transform.concatenatedMatrix;
         tail3.cacheAsBitmap = true;
      }
      
      public function setWolfLegs(id:int) : *
      {
         var componentObject:MovieClip = null;
         var r_frontleg1:MovieClip = partList[PART_r_shoulder];
         var r_frontleg2:MovieClip = partList[PART_r_uparm];
         var r_frontleg3:MovieClip = partList[PART_r_lowarm];
         var r_frontleg4:MovieClip = partList[PART_r_hand];
         var l_frontleg1:MovieClip = partList[PART_l_shoulder];
         var l_frontleg2:MovieClip = partList[PART_l_uparm];
         var l_frontleg3:MovieClip = partList[PART_l_lowarm];
         var l_frontleg4:MovieClip = partList[PART_l_hand];
         var r_backleg1:MovieClip = partList[PART_r_thigh];
         var r_backleg2:MovieClip = partList[PART_r_knee];
         var r_backleg3:MovieClip = partList[PART_r_calf];
         var r_backleg4:MovieClip = partList[PART_r_foot];
         var l_backleg1:MovieClip = partList[PART_l_thigh];
         var l_backleg2:MovieClip = partList[PART_l_knee];
         var l_backleg3:MovieClip = partList[PART_l_calf];
         var l_backleg4:MovieClip = partList[PART_l_foot];
         if(r_frontleg1.numChildren > 0)
         {
            r_frontleg1.removeChildAt(0);
            r_frontleg2.removeChildAt(0);
            r_frontleg3.removeChildAt(0);
            r_frontleg4.removeChildAt(0);
            l_frontleg1.removeChildAt(0);
            l_frontleg2.removeChildAt(0);
            l_frontleg3.removeChildAt(0);
            l_frontleg4.removeChildAt(0);
            r_backleg1.removeChildAt(0);
            r_backleg2.removeChildAt(0);
            r_backleg3.removeChildAt(0);
            r_backleg4.removeChildAt(0);
            l_backleg1.removeChildAt(0);
            l_backleg2.removeChildAt(0);
            l_backleg3.removeChildAt(0);
            l_backleg4.removeChildAt(0);
         }
         componentObject = getMCSComponent("frontleg1_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg1.addChild(componentObject);
         r_frontleg1.cacheAsBitmapMatrix = r_frontleg1.transform.concatenatedMatrix;
         r_frontleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontleg2_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg2.addChild(componentObject);
         r_frontleg2.cacheAsBitmapMatrix = r_frontleg2.transform.concatenatedMatrix;
         r_frontleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontleg3_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg3.addChild(componentObject);
         r_frontleg3.cacheAsBitmapMatrix = r_frontleg3.transform.concatenatedMatrix;
         r_frontleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontleg4_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg4.addChild(componentObject);
         r_frontleg4.cacheAsBitmapMatrix = r_frontleg4.transform.concatenatedMatrix;
         r_frontleg4.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontleg1_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg1.addChild(componentObject);
         l_frontleg1.cacheAsBitmapMatrix = l_frontleg1.transform.concatenatedMatrix;
         l_frontleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontleg2_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg2.addChild(componentObject);
         l_frontleg2.cacheAsBitmapMatrix = l_frontleg2.transform.concatenatedMatrix;
         l_frontleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontleg3_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg3.addChild(componentObject);
         l_frontleg3.cacheAsBitmapMatrix = l_frontleg3.transform.concatenatedMatrix;
         l_frontleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontleg4_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg4.addChild(componentObject);
         l_frontleg4.cacheAsBitmapMatrix = l_frontleg4.transform.concatenatedMatrix;
         l_frontleg4.cacheAsBitmap = true;
         componentObject = getMCSComponent("backleg1_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg1.addChild(componentObject);
         r_backleg1.cacheAsBitmapMatrix = r_backleg1.transform.concatenatedMatrix;
         r_backleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("backleg2_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg2.addChild(componentObject);
         r_backleg2.cacheAsBitmapMatrix = r_backleg2.transform.concatenatedMatrix;
         r_backleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("backleg3_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg3.addChild(componentObject);
         r_backleg3.cacheAsBitmapMatrix = r_backleg3.transform.concatenatedMatrix;
         r_backleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("backleg4_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg4.addChild(componentObject);
         r_backleg4.cacheAsBitmapMatrix = r_backleg4.transform.concatenatedMatrix;
         r_backleg4.cacheAsBitmap = true;
         componentObject = getMCSComponent("backleg1_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg1.addChild(componentObject);
         l_backleg1.cacheAsBitmapMatrix = l_backleg1.transform.concatenatedMatrix;
         l_backleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("backleg2_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg2.addChild(componentObject);
         l_backleg2.cacheAsBitmapMatrix = l_backleg2.transform.concatenatedMatrix;
         l_backleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("backleg3_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg3.addChild(componentObject);
         l_backleg3.cacheAsBitmapMatrix = l_backleg3.transform.concatenatedMatrix;
         l_backleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("backleg4_wolf_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg4.addChild(componentObject);
         l_backleg4.cacheAsBitmapMatrix = l_backleg4.transform.concatenatedMatrix;
         l_backleg4.cacheAsBitmap = true;
      }
      
      override internal function createFlyingHead() : PartProjectile
      {
         var head:MovieClip = partList[PART_head];
         partList[PART_head] = null;
         var jaw:MovieClip = partList[PART_weapon];
         partList[PART_weapon] = null;
         var jawpt:Point = jaw.localToGlobal(new Point(jaw.x,jaw.y));
         var pt:Point = head.globalToLocal(jawpt);
         head.addChild(jaw);
         jaw.x = pt.x;
         jaw.y = pt.y;
         var movtx:int = Math.random() * 10 - 5;
         var rot:int = 20;
         if(movtx < 0)
         {
            rot = -20;
         }
         var movty:int = -Math.random() * 16 - 8;
         return ProjectileManager.createFlyingHead(head,movtx,movty,rot);
      }
      
      override public function disposeMCS() : *
      {
      }
   }
}

