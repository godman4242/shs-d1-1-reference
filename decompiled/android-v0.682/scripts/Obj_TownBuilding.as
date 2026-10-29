package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2285")]
   public class Obj_TownBuilding extends InteractiveStageObject
   {
      
      public static var TYPE_EMPTY:int = 0;
      
      public static var TYPE_HUT:int = 1;
      
      public static var TYPE_HOUSE1:int = 2;
      
      public static var TYPE_HOUSE2:int = 3;
      
      public static var TYPE_MARKET:int = 4;
      
      public static var TYPE_GAMBLINGDEN:int = 5;
      
      public static var TYPE_BANK:int = 6;
      
      public static var TYPE_STABLE:int = 7;
      
      public static var TYPE_INN:int = 8;
      
      public static var TYPE_BARBER:int = 9;
      
      public static var TYPE_MERCHANT:int = 10;
      
      public static var TYPE_PEDDLER:int = 11;
      
      public static var TYPE_BOUNTYBOARD:int = 12;
      
      public static var TYPE_BLACKSMITH:int = 13;
      
      public static var TYPE_JUNCTION:int = 14;
      
      public static var TYPE_HOUSE1BIG:int = 15;
      
      public static var TYPE_HOUSE2BIG:int = 16;
      
      public static var ICON_MARKET:int = TYPE_MARKET + 1000;
      
      public static var ICON_GAMBLINGDEN:int = TYPE_GAMBLINGDEN + 1000;
      
      public static var ICON_BANK:int = TYPE_BANK + 1000;
      
      public static var ICON_STABLE:int = TYPE_STABLE + 1000;
      
      public static var ICON_INN:int = TYPE_INN + 1000;
      
      public static var ICON_BARBER:int = TYPE_BARBER + 1000;
      
      public static var ICON_MERCHANT:int = TYPE_MERCHANT + 1000;
      
      public static var ICON_PEDDLER:int = TYPE_PEDDLER + 1000;
      
      public static var ICON_BOUNTYBOARD:int = TYPE_BOUNTYBOARD + 1000;
      
      public static var ICON_BLACKSMITH:int = TYPE_BLACKSMITH + 1000;
      
      public static var TYPE_HOUSE1_1:int = 17;
      
      public static var TYPE_HOUSE2_1:int = 18;
      
      public static var TYPE_HOUSE1_2:int = 19;
      
      public static var TYPE_HOUSE2_2:int = 20;
      
      public static var TYPE_HOUSE1_3:int = 21;
      
      public static var TYPE_HOUSE2_3:int = 22;
      
      public static var TYPE_HOUSE1_4:int = 23;
      
      public static var TYPE_HOUSE2_4:int = 24;
      
      public static var TYPE_HUT_1:int = 25;
      
      public static var TYPE_HUT_2:int = 26;
      
      public static var TYPE_HUT_3:int = 27;
      
      public static var TYPE_HOUSE1BIG_1:int = 28;
      
      public static var TYPE_HOUSE1BIG_2:int = 29;
      
      public static var TYPE_HOUSE1BIG_3:int = 30;
      
      public static var TYPE_HOUSE1BIG_4:int = 31;
      
      public static var TYPE_JUNCTION_1:int = 32;
      
      public static var TYPE_JUNCTION_2:int = 33;
      
      public static var TYPE_JUNCTION_3:int = 34;
      
      public static var TYPE_JUNCTION_4:int = 35;
      
      public static var TYPE_PEDDLER_KOJURO:int = 36;
      
      public static var TYPE_RECENTEVENTSBOARD:int = 37;
      
      public var building3:MovieClip;
      
      public var hotspot:RedBG;
      
      public var building2:MovieClip;
      
      public var building4:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var building:MovieClip;
      
      internal var buildingType:int = 0;
      
      public function Obj_TownBuilding(props:String, objname:String = "")
      {
         var newColorTransform:ColorTransform = null;
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "building";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.buildingType = int(strArray[0]);
         var color:uint = uint(strArray[1]);
         if(color == 1)
         {
            if(this.buildingType == TYPE_HUT)
            {
               this.buildingType = TYPE_HUT_1;
            }
            else if(this.buildingType == TYPE_HOUSE1)
            {
               this.buildingType = TYPE_HOUSE1_1;
            }
            else if(this.buildingType == TYPE_HOUSE2)
            {
               this.buildingType = TYPE_HOUSE2_1;
            }
            else if(this.buildingType == TYPE_HOUSE1BIG || this.buildingType == TYPE_HOUSE2BIG)
            {
               this.buildingType = TYPE_HOUSE1BIG_1;
            }
            else if(this.buildingType == TYPE_JUNCTION)
            {
               this.buildingType = TYPE_JUNCTION_1;
            }
         }
         else if(color == 2)
         {
            if(this.buildingType == TYPE_HUT)
            {
               this.buildingType = TYPE_HUT_2;
            }
            else if(this.buildingType == TYPE_HOUSE1)
            {
               this.buildingType = TYPE_HOUSE1_2;
            }
            else if(this.buildingType == TYPE_HOUSE2)
            {
               this.buildingType = TYPE_HOUSE2_2;
            }
            else if(this.buildingType == TYPE_HOUSE1BIG || this.buildingType == TYPE_HOUSE2BIG)
            {
               this.buildingType = TYPE_HOUSE1BIG_2;
            }
            else if(this.buildingType == TYPE_JUNCTION)
            {
               this.buildingType = TYPE_JUNCTION_2;
            }
         }
         else if(color == 3)
         {
            if(this.buildingType == TYPE_HUT)
            {
               this.buildingType = TYPE_HUT_3;
            }
            else if(this.buildingType == TYPE_HOUSE1)
            {
               this.buildingType = TYPE_HOUSE1_3;
            }
            else if(this.buildingType == TYPE_HOUSE2)
            {
               this.buildingType = TYPE_HOUSE2_3;
            }
            else if(this.buildingType == TYPE_HOUSE1BIG || this.buildingType == TYPE_HOUSE2BIG)
            {
               this.buildingType = TYPE_HOUSE1BIG_3;
            }
            else if(this.buildingType == TYPE_JUNCTION)
            {
               this.buildingType = TYPE_JUNCTION_3;
            }
         }
         else if(color == 4)
         {
            if(this.buildingType == TYPE_HOUSE1)
            {
               this.buildingType = TYPE_HOUSE1_4;
            }
            else if(this.buildingType == TYPE_HOUSE2)
            {
               this.buildingType = TYPE_HOUSE2_4;
            }
            else if(this.buildingType == TYPE_HOUSE1BIG || this.buildingType == TYPE_HOUSE2BIG)
            {
               this.buildingType = TYPE_HOUSE1BIG_4;
            }
            else if(this.buildingType == TYPE_JUNCTION)
            {
               this.buildingType = TYPE_JUNCTION_4;
            }
         }
         if(this.buildingType == TYPE_PEDDLER && StatsManager.showKojuroAsPeddler())
         {
            this.buildingType = TYPE_PEDDLER_KOJURO;
         }
         gotoAndStop(this.buildingType);
         this.hotspot.visible = false;
         this.hotspot.buttonMode = true;
         switch(this.buildingType)
         {
            case TYPE_HUT:
            case TYPE_HOUSE1_1:
            case TYPE_HOUSE2_1:
            case TYPE_HOUSE1_2:
            case TYPE_HOUSE2_2:
            case TYPE_HOUSE1_3:
            case TYPE_HOUSE2_3:
            case TYPE_HOUSE1_4:
            case TYPE_HOUSE2_4:
            case TYPE_HUT_1:
            case TYPE_HUT_2:
            case TYPE_HUT_3:
            case TYPE_HOUSE1BIG_1:
            case TYPE_HOUSE1BIG_2:
            case TYPE_HOUSE1BIG_3:
            case TYPE_HOUSE1BIG_4:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = false;
               break;
            case TYPE_HOUSE1:
            case TYPE_HOUSE2:
            case TYPE_HOUSE1BIG:
            case TYPE_HOUSE2BIG:
               newColorTransform = new ColorTransform();
               newColorTransform.color = color;
               this.building.color.transform.colorTransform = newColorTransform;
               iconID = NodeUI.ACTION_LOOK;
               canInteract = false;
               break;
            case TYPE_JUNCTION:
               newColorTransform = new ColorTransform();
               newColorTransform.color = color;
               this.building.color.transform.colorTransform = newColorTransform;
               this.building2.color.transform.colorTransform = newColorTransform;
               this.building3.color.transform.colorTransform = newColorTransform;
               this.building4.color.transform.colorTransform = newColorTransform;
               iconID = NodeUI.ACTION_LOOK;
               canInteract = false;
               break;
            case TYPE_JUNCTION_1:
            case TYPE_JUNCTION_2:
            case TYPE_JUNCTION_3:
            case TYPE_JUNCTION_4:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = false;
               break;
            case TYPE_PEDDLER:
            case TYPE_PEDDLER_KOJURO:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = true;
               break;
            case TYPE_MARKET:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = true;
               break;
            case TYPE_STABLE:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = true;
               break;
            case TYPE_INN:
               iconID = NodeUI.ACTION_TRAVEL;
               canInteract = true;
               break;
            case TYPE_BANK:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = true;
               break;
            case TYPE_GAMBLINGDEN:
               iconID = NodeUI.ACTION_TRAVEL;
               canInteract = true;
               break;
            case TYPE_BARBER:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = true;
               break;
            case TYPE_MERCHANT:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = true;
               break;
            case TYPE_BOUNTYBOARD:
            case TYPE_RECENTEVENTSBOARD:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = true;
               break;
            case TYPE_BLACKSMITH:
               iconID = NodeUI.ACTION_LOOK;
               canInteract = true;
         }
         buttonMode = canInteract;
         cacheAsBitmap = true;
      }
      
      public static function getSlotUsage(num:int) : int
      {
         switch(num)
         {
            case TYPE_HUT:
            case TYPE_HOUSE1:
            case TYPE_HOUSE2:
            case TYPE_INN:
            case TYPE_BARBER:
            case TYPE_MERCHANT:
            case TYPE_PEDDLER:
            case TYPE_BOUNTYBOARD:
            case TYPE_JUNCTION:
            case TYPE_RECENTEVENTSBOARD:
               return 1;
            case TYPE_MARKET:
            case TYPE_GAMBLINGDEN:
            case TYPE_BANK:
            case TYPE_STABLE:
            case TYPE_BLACKSMITH:
            case TYPE_HOUSE1BIG:
            case TYPE_HOUSE2BIG:
               return 2;
            case TYPE_HOUSE1_1:
            case TYPE_HOUSE2_1:
            case TYPE_HOUSE1_2:
            case TYPE_HOUSE2_2:
            case TYPE_HOUSE1_3:
            case TYPE_HOUSE2_3:
            case TYPE_HOUSE1_4:
            case TYPE_HOUSE2_4:
            case TYPE_HUT_1:
            case TYPE_HUT_2:
            case TYPE_HUT_3:
            case TYPE_JUNCTION_1:
            case TYPE_JUNCTION_2:
            case TYPE_JUNCTION_3:
            case TYPE_JUNCTION_4:
               return 1;
            case TYPE_HOUSE1BIG_1:
            case TYPE_HOUSE1BIG_2:
            case TYPE_HOUSE1BIG_3:
            case TYPE_HOUSE1BIG_4:
               return 2;
            default:
               return 0;
         }
      }
      
      public static function getMainStreetBuildings() : Array
      {
         return [TYPE_PEDDLER,TYPE_MARKET,TYPE_BOUNTYBOARD];
      }
      
      public static function getTownBuildings() : Array
      {
         return [TYPE_INN,TYPE_MERCHANT,TYPE_STABLE,TYPE_BLACKSMITH];
      }
      
      public static function getCityBuildings() : Array
      {
         return [TYPE_GAMBLINGDEN,TYPE_BARBER,TYPE_BANK];
      }
      
      override public function interactClick() : *
      {
         var data:XMLQuestStep = null;
         if(questAction != null)
         {
            data = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
            if(StatsManager.checkConditions(data.condition))
            {
               if(StatsManager.checkAP(data.ap))
               {
                  Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
               }
               else
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(100),LangManager.getString(5));
               }
            }
            else
            {
               OverworldHUD.instance.showDialog(data.failtext,LangManager.getString(5));
            }
            return;
         }
         if(iconID == NodeUI.ACTION_TRAVEL)
         {
            OverworldHUD.getInstance().screenTransition.setParam(this);
            OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_INTERACT);
         }
         else
         {
            this.interact();
         }
      }
      
      override public function interact() : *
      {
         var data:XMLQuest = null;
         switch(this.buildingType)
         {
            case TYPE_PEDDLER:
            case TYPE_PEDDLER_KOJURO:
               OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_PEDDLER);
               break;
            case TYPE_MARKET:
               OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_MARKET);
               break;
            case TYPE_STABLE:
               OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_STABLES);
               break;
            case TYPE_INN:
               StageManager.gotoRoom(100,50);
               break;
            case TYPE_BANK:
               OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_BANK);
               break;
            case TYPE_GAMBLINGDEN:
               StageManager.gotoRoom(110,50);
               break;
            case TYPE_BARBER:
               OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_BARBER);
               break;
            case TYPE_MERCHANT:
               OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_MERCHANT);
               break;
            case TYPE_BOUNTYBOARD:
               data = QuestGenerator.instance.generateQuest(StageManager.getCurrentNode(),StageManager.getCurrentRoom(),QuestGenerator.BOUNTYQUEST,QueryManager.instance.getServerDate(),QuestItem.QUEST_BOUNTYBOARD);
               QuestEngine.insertQuestData(data);
               if(StatsManager.checkAP(data.stepList[0].ap))
               {
                  Overworld.startQuestStepIntro(QuestGenerator.PROCGENQUEST,0);
               }
               else
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(100),LangManager.getString(5));
               }
               break;
            case TYPE_BLACKSMITH:
               OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_BLACKSMITH);
               break;
            case TYPE_RECENTEVENTSBOARD:
               OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_RECENTEVENTSBOARD);
         }
      }
      
      override public function getDisplayText() : String
      {
         switch(this.buildingType)
         {
            case TYPE_HUT:
            case TYPE_HUT_1:
            case TYPE_HUT_2:
            case TYPE_HUT_3:
               return LangManager.getString(731);
            case TYPE_HOUSE1:
            case TYPE_HOUSE2:
            case TYPE_HOUSE1BIG:
            case TYPE_HOUSE2BIG:
            case TYPE_HOUSE1_1:
            case TYPE_HOUSE2_1:
            case TYPE_HOUSE1_2:
            case TYPE_HOUSE2_2:
            case TYPE_HOUSE1_3:
            case TYPE_HOUSE2_3:
            case TYPE_HOUSE1_4:
            case TYPE_HOUSE2_4:
            case TYPE_HOUSE1BIG_1:
            case TYPE_HOUSE1BIG_2:
            case TYPE_HOUSE1BIG_3:
            case TYPE_HOUSE1BIG_4:
               return LangManager.getString(731);
            case TYPE_JUNCTION:
            case TYPE_JUNCTION_1:
            case TYPE_JUNCTION_2:
            case TYPE_JUNCTION_3:
            case TYPE_JUNCTION_4:
               return LangManager.getString(732);
            case TYPE_PEDDLER:
            case TYPE_PEDDLER_KOJURO:
               return LangManager.getString(733);
            case TYPE_MARKET:
               return LangManager.getString(734);
            case TYPE_STABLE:
               return LangManager.getString(735);
            case TYPE_INN:
               return LangManager.getString(736);
            case TYPE_BANK:
               return LangManager.getString(737);
            case TYPE_GAMBLINGDEN:
               return LangManager.getString(738);
            case TYPE_BARBER:
               return LangManager.getString(739);
            case TYPE_MERCHANT:
               return LangManager.getString(740);
            case TYPE_BOUNTYBOARD:
               return LangManager.getString(741);
            case TYPE_BLACKSMITH:
               return LangManager.getString(742);
            case TYPE_RECENTEVENTSBOARD:
               return LangManager.getString(743);
            default:
               return "";
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x + (this.hotspot.x + this.hotspot.width / 2)) < 100;
      }
      
      override public function isMouseOver(mouseX:int, mouseY:int) : Boolean
      {
         return this.hotspot.hitTestPoint(mouseX,mouseY);
      }
      
      override public function hasHotSpot() : Boolean
      {
         return true;
      }
   }
}

