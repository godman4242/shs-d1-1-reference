package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2382")]
   public class Obj_OreDeposit extends InteractiveStageObject
   {
      
      public function Obj_OreDeposit(props:String, objname:String = "")
      {
         super();
         if(objname == "")
         {
            objectName = "Ore Deposit";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         if(strArray.length > 1 && strArray[1] == "1")
         {
            gotoAndStop(1);
            canInteract = false;
            buttonMode = false;
         }
         else if(strArray[0] == "1")
         {
            gotoAndStop(NodeGenerator.instance.getOreType(StageManager.getCurrentNode(),true));
         }
         else if(strArray[0] == "0" || strArray[0] == "")
         {
            gotoAndStop(NodeGenerator.instance.getOreType(StageManager.getCurrentNode(),false));
         }
         else if(strArray[0] != "")
         {
            gotoAndStop(int(strArray[0]));
         }
         iconID = NodeUI.ACTION_MINE;
      }
      
      override public function interact() : *
      {
         if(!canInteract)
         {
            return;
         }
         if(StatsManager.getStat(59) != 13022)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(651),LangManager.getString(5));
            return;
         }
         if(StatsManager.equipment[StatsManager.EQ_WEAPON].isBroken())
         {
            OverworldHUD.instance.showDialog(LangManager.getString(663),LangManager.getString(5));
            return;
         }
         var oreType:int = currentFrame;
         var miningskill:int = StatsManager.getStat(1022);
         if(oreType == 8 && miningskill < 5 || oreType == 7 && miningskill < 4 || oreType == 6 && miningskill < 3 || oreType == 5 && miningskill < 2 || oreType == 3 && miningskill < 1)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(650),LangManager.getString(5));
            return;
         }
         if(!StatsManager.checkAP(this.getAPUse()))
         {
            OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
            return;
         }
         StatsManager.getPlayer().stopMoving();
         StatsManager.getPlayer().startAnim(MCSActor.MINING);
         if(oreType != 2 && int(Math.random() * 2) != 0)
         {
            OverworldHUD.getInstance().getNodeUI().runMine(1,this);
         }
         else
         {
            OverworldHUD.getInstance().getNodeUI().runMine(currentFrame,this);
         }
      }
      
      public function clearOre() : *
      {
         gotoAndStop(1);
         StageManager.addToDeadList(objectName);
         OverworldHUD.instance.minimap.clearCurrentRoomIcon();
         canInteract = false;
         buttonMode = false;
      }
      
      override public function getDisplayText() : String
      {
         if(currentFrame == 1)
         {
            return LangManager.getString(652);
         }
         if(currentFrame == 2)
         {
            return LangManager.getString(653);
         }
         if(currentFrame == 3)
         {
            return LangManager.getString(654);
         }
         if(currentFrame == 4)
         {
            return LangManager.getString(655);
         }
         if(currentFrame == 5)
         {
            return LangManager.getString(656);
         }
         if(currentFrame == 6)
         {
            return LangManager.getString(657);
         }
         if(currentFrame == 7)
         {
            return LangManager.getString(658);
         }
         if(currentFrame == 8)
         {
            return LangManager.getString(659);
         }
         return "";
      }
      
      override public function getAPUse() : int
      {
         return 2;
      }
   }
}

