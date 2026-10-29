package
{
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2497")]
   public class Obj_DirectionSign extends InteractiveStageObject
   {
      
      public var word:TextField;
      
      internal var dest:int;
      
      internal var destName:String;
      
      internal var destNode:int = -1;
      
      internal var compassDir:int = -1;
      
      internal var apuse:int = 1;
      
      internal var territoryStr:String = "";
      
      public function Obj_DirectionSign(props:String, objname:String = "")
      {
         var arrowbouncing:ArrowBouncing = null;
         var destTerritory:Point = null;
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "Signpost";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.dest = int(strArray[0]);
         if(strArray.length >= 3)
         {
            this.destNode = int(strArray[2]);
            this.destName = StageManager.getRoomName(this.dest,this.destNode);
         }
         else
         {
            this.destName = StageManager.getRoomName(this.dest,-1);
         }
         if(strArray.length >= 4 && strArray[3] == "0")
         {
            visible = false;
         }
         if(strArray.length >= 6)
         {
            this.compassDir = strArray[4];
            gotoAndStop(int(strArray[5]) + 2);
            if(this.compassDir == NodeGenerator.EXIT_N)
            {
               this.word.text = LangManager.getString(398);
            }
            else if(this.compassDir == NodeGenerator.EXIT_S)
            {
               this.word.text = LangManager.getString(399);
            }
            else if(this.compassDir == NodeGenerator.EXIT_E)
            {
               this.word.text = LangManager.getString(400);
            }
            else if(this.compassDir == NodeGenerator.EXIT_W)
            {
               this.word.text = LangManager.getString(401);
            }
            this.word.mouseEnabled = false;
         }
         else
         {
            gotoAndStop(1);
         }
         if(strArray.length >= 7)
         {
            arrowbouncing = new ArrowBouncing();
            addChild(arrowbouncing);
            if(strArray[6] == "1")
            {
               arrowbouncing.arrow.arrowtext.text = "";
            }
            else
            {
               arrowbouncing.arrow.arrowtext.text = LangManager.getString(strArray[6]);
            }
            arrowbouncing.x = 2;
            arrowbouncing.y = -130;
         }
         if(this.dest == -1 || this.dest == -2)
         {
            iconID = NodeUI.ACTION_LEAVE;
         }
         else
         {
            iconID = NodeUI.ACTION_TRAVEL;
         }
         var territory:Point = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
         var territoryData:TerritoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false);
         var currentNode:int = StageManager.getCurrentNode();
         var roomid:int = StageManager.getCurrentRoom();
         if(StageManager.getCurrentRoom() != 0 && (Boolean(territoryData.isTown(currentNode) && !territoryData.isAbandonedTown()) && (Boolean(roomid < 14 || roomid >= 100)) || Boolean(territoryData.isDojo(currentNode))))
         {
            this.apuse = 0;
         }
         if(iconID == NodeUI.ACTION_TRAVEL && this.destNode != -1)
         {
            destTerritory = NodeGenerator.instance.getTerritory(this.destNode);
            if(this.compassDir == -1 && !territory.equals(destTerritory))
            {
               this.destName = NameGenerator.getInstance().getPlaceName(destTerritory.x << 12 | destTerritory.y);
               this.territoryStr = " (" + (destTerritory.x - 341 + WarSelectUI.DTERRSHIFTX) + "," + (destTerritory.y - 341 + WarSelectUI.DTERRSHIFTY) + ")";
            }
         }
      }
      
      override public function needTransition() : Boolean
      {
         var nodeData:XMLWorldNode = null;
         if(!GameEngine.isPvPRoomMode() && StatsManager.findWeight() > StatsManager.getCarryingWeight() || this.apuse > 0 && StatsManager.getStat(StatsManager.STAT_AP) <= 0)
         {
            return false;
         }
         var strArray:Array = props.split(",");
         if(strArray.length >= 3)
         {
            if(this.destNode != StatsManager.getStat(StatsManager.STAT_LOCATION))
            {
               nodeData = QuestEngine.getNodeData(this.destNode);
               if(!StatsManager.checkConditions(nodeData.condition))
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      override public function interactClick() : *
      {
         if(this.needTransition())
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
         var nodeData:XMLWorldNode = null;
         if(!GameEngine.isPvPRoomMode() && StatsManager.findWeight() > StatsManager.getCarryingWeight())
         {
            OverworldHUD.instance.showDialogBig(LangManager.getString(138),LangManager.getString(5));
            return;
         }
         if(!StatsManager.checkAP(this.apuse))
         {
            OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
            return;
         }
         var strArray:Array = props.split(",");
         if(strArray.length >= 3)
         {
            if(this.destNode != StatsManager.getLocation())
            {
               nodeData = QuestEngine.getNodeData(this.destNode);
               if(!StatsManager.checkConditions(nodeData.condition))
               {
                  OverworldHUD.instance.showDialog(nodeData.failtext,LangManager.getString(5));
                  return;
               }
            }
            StageManager.gotoRoom(this.dest,int(strArray[1]),this.destNode,this.compassDir);
         }
         else if(strArray.length == 2)
         {
            StageManager.gotoRoom(this.dest,int(strArray[1]));
         }
         else
         {
            StageManager.gotoRoom(this.dest);
         }
      }
      
      override public function getDisplayText() : String
      {
         var str:String = "";
         if(this.dest == -1)
         {
            str = LangManager.getString(193) + this.destName;
         }
         else if(this.dest == -2)
         {
            str = LangManager.getString(716);
         }
         else
         {
            str = this.destName;
         }
         switch(this.compassDir)
         {
            case NodeGenerator.EXIT_N:
               str += " (" + LangManager.getString(398) + ")";
               break;
            case NodeGenerator.EXIT_S:
               str += " (" + LangManager.getString(399) + ")";
               break;
            case NodeGenerator.EXIT_E:
               str += " (" + LangManager.getString(400) + ")";
               break;
            case NodeGenerator.EXIT_W:
               str += " (" + LangManager.getString(401) + ")";
               break;
            default:
               str += this.territoryStr;
         }
         return str;
      }
      
      override public function getAPUse() : int
      {
         return this.apuse;
      }
   }
}

