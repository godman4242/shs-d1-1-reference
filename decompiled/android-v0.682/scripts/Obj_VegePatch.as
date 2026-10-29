package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2153")]
   public class Obj_VegePatch extends InteractiveStageObject
   {
      
      public var vege0:VegetableProjectile;
      
      public var vege1:VegetableProjectile;
      
      public var vege2:VegetableProjectile;
      
      public var harvestArrow:ArrowBouncing;
      
      public var vege3:VegetableProjectile;
      
      public var vege4:VegetableProjectile;
      
      public var vege5:VegetableProjectile;
      
      public var vege6:VegetableProjectile;
      
      public var vege7:VegetableProjectile;
      
      public var vege8:VegetableProjectile;
      
      public var vege9:VegetableProjectile;
      
      internal var vegArray:Array = new Array();
      
      internal var counter:int = 1;
      
      public function Obj_VegePatch(props:String, objname:String = "")
      {
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "Vegetable Patch";
         }
         else
         {
            objectName = objname;
         }
         iconID = NodeUI.ACTION_USE;
         this.vegArray.push(this.vege0);
         this.vegArray.push(this.vege1);
         this.vegArray.push(this.vege2);
         this.vegArray.push(this.vege3);
         this.vegArray.push(this.vege4);
         this.vegArray.push(this.vege5);
         this.vegArray.push(this.vege6);
         this.vegArray.push(this.vege7);
         this.vegArray.push(this.vege8);
         this.vegArray.push(this.vege9);
         for(var i:int = 0; i < 10; i++)
         {
            this.vegArray[i].gotoAndStop(int(Math.random() * 7 + 1));
            this.vegArray[i].rotation = Math.random() * 20 - 10;
         }
         this.harvestArrow.visible = false;
         LangManager.initTextField(this.harvestArrow.arrow.arrowtext,true);
         this.harvestArrow.arrow.arrowtext.text = LangManager.getString(254);
         this.showVegState();
      }
      
      internal function showVegState() : *
      {
         var vegState:int = 0;
         var timePeriod:int = 0;
         var i:int = 0;
         var scale:Number = NaN;
         var startingIndex:int = int(props);
         var plantType:int = StatsManager.getStat(startingIndex);
         var plantTime:int = StatsManager.getStat(startingIndex + 1);
         var soilLevel:int = StatsManager.getStat(startingIndex + 2);
         var modLevel:int = StatsManager.getStat(startingIndex + 3);
         var gracePeriod:int = 15 * 60;
         var NOTPLANTED:int = 0;
         var PLANTED:int = 1;
         var READYFORHARVEST:int = 2;
         var ROTTED:int = 3;
         switch(plantType)
         {
            case 0:
               vegState = NOTPLANTED;
               break;
            case 1:
               timePeriod = 15 * 60;
               if(QueryManager.instance.getServerTime() - plantTime < timePeriod)
               {
                  vegState = PLANTED;
               }
               else if(QueryManager.instance.getServerTime() - plantTime < timePeriod + gracePeriod)
               {
                  vegState = READYFORHARVEST;
               }
               else
               {
                  vegState = ROTTED;
               }
               break;
            case 2:
               timePeriod = 60 * 60;
               if(QueryManager.instance.getServerTime() - plantTime < timePeriod)
               {
                  vegState = PLANTED;
               }
               else if(QueryManager.instance.getServerTime() - plantTime < timePeriod + gracePeriod)
               {
                  vegState = READYFORHARVEST;
               }
               else
               {
                  vegState = ROTTED;
               }
               break;
            case 3:
               timePeriod = 6 * 60 * 60;
               if(QueryManager.instance.getServerTime() - plantTime < timePeriod)
               {
                  vegState = PLANTED;
               }
               else if(QueryManager.instance.getServerTime() - plantTime < timePeriod + gracePeriod)
               {
                  vegState = READYFORHARVEST;
               }
               else
               {
                  vegState = ROTTED;
               }
               break;
            case 4:
               timePeriod = 12 * 60 * 60;
               if(QueryManager.instance.getServerTime() - plantTime < timePeriod)
               {
                  vegState = PLANTED;
               }
               else
               {
                  vegState = READYFORHARVEST;
               }
         }
         if(vegState == NOTPLANTED)
         {
            for(i = 0; i < 10; i++)
            {
               this.vegArray[i].visible = false;
            }
         }
         if(vegState == PLANTED)
         {
            scale = (QueryManager.instance.getServerTime() - plantTime) / timePeriod;
            if(scale > 1 || scale < 0)
            {
               scale = 1;
            }
            for(i = 0; i < 10; i++)
            {
               this.vegArray[i].scaleX = scale;
               this.vegArray[i].scaleY = scale;
            }
         }
         if(vegState == ROTTED)
         {
            for(i = 0; i < 10; i++)
            {
               ColorCode.changeColor(this.vegArray[i],3088128);
            }
         }
         if(vegState == READYFORHARVEST)
         {
            this.harvestArrow.visible = true;
         }
         else
         {
            this.harvestArrow.visible = false;
         }
      }
      
      override public function interact() : *
      {
         OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_VEGPATCH,int(props));
      }
      
      override public function getDisplayText() : String
      {
         return LangManager.getString(255);
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         --this.counter;
         if(this.counter <= 0)
         {
            this.counter = 24;
            this.showVegState();
         }
         return abs(x - mc.x) < 50;
      }
   }
}

