package
{
   import flash.display.MovieClip;
   
   public class MCSHorse extends MCSAnimal
   {
      
      public function MCSHorse()
      {
         var mc:MovieClip = null;
         super();
         animalName = "horse";
         for(var i:int = 0; i <= partListLength; i++)
         {
            mc = new MovieClip();
            addChild(mc);
            partList.push(mc);
         }
         healthBar.y = -120;
         displayName.y = -120;
      }
      
      override public function setLegs(id:int) : *
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
         componentObject = getMCSComponent("frontlegup_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg1.addChild(componentObject);
         r_frontleg1.cacheAsBitmapMatrix = r_frontleg1.transform.concatenatedMatrix;
         r_frontleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("legdown_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg2.addChild(componentObject);
         r_frontleg2.cacheAsBitmapMatrix = r_frontleg2.transform.concatenatedMatrix;
         r_frontleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontfoot_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         r_frontleg3.addChild(componentObject);
         r_frontleg3.cacheAsBitmapMatrix = r_frontleg3.transform.concatenatedMatrix;
         r_frontleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontlegup_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg1.addChild(componentObject);
         l_frontleg1.cacheAsBitmapMatrix = l_frontleg1.transform.concatenatedMatrix;
         l_frontleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("legdown_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg2.addChild(componentObject);
         l_frontleg2.cacheAsBitmapMatrix = l_frontleg2.transform.concatenatedMatrix;
         l_frontleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("frontfoot_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         l_frontleg3.addChild(componentObject);
         l_frontleg3.cacheAsBitmapMatrix = l_frontleg3.transform.concatenatedMatrix;
         l_frontleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("backlegup_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg1.addChild(componentObject);
         r_backleg1.cacheAsBitmapMatrix = r_backleg1.transform.concatenatedMatrix;
         r_backleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("legdown_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg2.addChild(componentObject);
         r_backleg2.cacheAsBitmapMatrix = r_backleg2.transform.concatenatedMatrix;
         r_backleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("backfoot_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         r_backleg3.addChild(componentObject);
         r_backleg3.cacheAsBitmapMatrix = r_backleg3.transform.concatenatedMatrix;
         r_backleg3.cacheAsBitmap = true;
         componentObject = getMCSComponent("backlegup_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg1.addChild(componentObject);
         l_backleg1.cacheAsBitmapMatrix = l_backleg1.transform.concatenatedMatrix;
         l_backleg1.cacheAsBitmap = true;
         componentObject = getMCSComponent("legdown_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg2.addChild(componentObject);
         l_backleg2.cacheAsBitmapMatrix = l_backleg2.transform.concatenatedMatrix;
         l_backleg2.cacheAsBitmap = true;
         componentObject = getMCSComponent("backfoot_horse_",id);
         if(componentObject == null)
         {
            return;
         }
         l_backleg3.addChild(componentObject);
         l_backleg3.cacheAsBitmapMatrix = l_backleg3.transform.concatenatedMatrix;
         l_backleg3.cacheAsBitmap = true;
      }
   }
}

