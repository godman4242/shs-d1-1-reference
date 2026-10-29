package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2372")]
   public class Obj_PathBush extends InteractiveStageObject
   {
      
      internal var roomid:int = 1;
      
      internal var xpos:int = 150;
      
      internal var nodeid:int = -1;
      
      internal var destName:String;
      
      internal var revealed:Boolean = false;
      
      public function Obj_PathBush(props:String, objName:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         if(objName == "")
         {
            objectName = "PathBush";
         }
         else
         {
            objectName = objName;
         }
         scaleX = Math.random() * 0.3 + 0.8;
         scaleY = Math.random() * 0.3 + 0.8;
         if(int(Math.random() * 2) == 0)
         {
            scaleX = -scaleX;
         }
         var strArray:Array = props.split(",");
         if(strArray.length >= 1)
         {
            this.roomid = strArray[0];
         }
         if(strArray.length >= 2)
         {
            this.xpos = strArray[1];
         }
         if(strArray.length >= 3)
         {
            this.nodeid = strArray[2];
         }
         this.destName = StageManager.getRoomName(this.roomid,this.nodeid);
         iconID = NodeUI.ACTION_USE;
         if(StatsManager.getStat(1021) == 5)
         {
            gotoAndStop(2);
         }
      }
      
      override public function needTransition() : Boolean
      {
         if(!this.revealed)
         {
            return false;
         }
         if(!GameEngine.isPvPRoomMode() && StatsManager.findWeight() > StatsManager.getCarryingWeight() || StatsManager.getStat(StatsManager.STAT_AP) <= 0)
         {
            return false;
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
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            if(questAction != null)
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectQuestButton(this,questAction.title,questAction.stepShortTitle,questAction.type,questAction.id,questAction.stepNo,questAction.ap,true);
            }
            else
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,iconID);
            }
            shown = true;
         }
         else if(!flag && shown)
         {
            shown = false;
         }
      }
      
      override public function interact() : *
      {
         if(!this.revealed)
         {
            OverworldHUD.getInstance().getNodeUI().runSearch(this);
         }
         else
         {
            if(!GameEngine.isPvPRoomMode() && StatsManager.findWeight() > StatsManager.getCarryingWeight())
            {
               OverworldHUD.instance.showDialogBig(LangManager.getString(138),LangManager.getString(5));
               return;
            }
            if(!StatsManager.checkAP(1))
            {
               OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
               return;
            }
            StageManager.gotoRoom(this.roomid,this.xpos,this.nodeid);
         }
      }
      
      override public function interact2() : *
      {
         var data:XMLQuestStep = null;
         gotoAndStop(3);
         iconID = NodeUI.ACTION_TRAVEL;
         this.revealed = true;
         InputManager.setAdventureMode();
         scaleX = 1;
         scaleY = 1;
         SoundManager.instance.playGoodKoto();
         if(questAction != null)
         {
            data = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
            Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(755),LangManager.getString(5));
         }
      }
      
      override public function getDisplayText() : String
      {
         if(!this.revealed)
         {
            return LangManager.getString(186);
         }
         return this.destName;
      }
      
      override public function getAPUse() : int
      {
         if(!this.revealed)
         {
            return 2;
         }
         return 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

