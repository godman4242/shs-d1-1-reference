package
{
   import flash.display.MovieClip;
   
   public class MCSBear extends MCSAnimal
   {
      
      public function MCSBear()
      {
         var mc:MovieClip = null;
         super();
         animalName = "bear";
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
            setBody(armorid);
         }
         else
         {
            setBody(0);
         }
         if(pantsid > 0)
         {
            setLegs(pantsid);
         }
         else
         {
            setLegs(0);
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
         var jaw:MovieClip = partList[PART_weapon];
         if(jaw.numChildren > 0)
         {
            jaw.removeChildAt(0);
         }
         componentObject = getMCSComponent("head_" + animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         head.addChild(componentObject);
         head.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
         head.cacheAsBitmap = true;
         componentObject = getMCSComponent("jaw_" + animalName + "_",id);
         if(componentObject == null)
         {
            return;
         }
         jaw.addChild(componentObject);
         jaw.cacheAsBitmapMatrix = head.transform.concatenatedMatrix;
         jaw.cacheAsBitmap = true;
      }
   }
}

