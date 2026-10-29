package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2434")]
   public class Obj_DragonDancePath extends DragonDanceInteractiveStageObject
   {
      
      public var canvas:Canvas;
      
      internal var mcs:MCSCharacter;
      
      internal var revealed:Boolean = false;
      
      internal var roomid:int = 1;
      
      internal var xpos:int = 150;
      
      internal var nodeid:int = -1;
      
      internal var destName:String = "";
      
      public function Obj_DragonDancePath(props:String, objname:String = "")
      {
         var pose:String = null;
         super();
         addFrameScript(0,this.frame1,47,this.frame48);
         this.props = props;
         if(objname == "")
         {
            objectName = "dragondancepath";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         sequence = strArray[0];
         if(strArray.length >= 2)
         {
            this.roomid = strArray[1];
         }
         if(strArray.length >= 3)
         {
            this.xpos = strArray[2];
         }
         if(strArray.length >= 4)
         {
            this.nodeid = strArray[3];
         }
         if(strArray.length >= 5)
         {
            this.revealed = true;
         }
         this.destName = StageManager.getRoomName(this.roomid,this.nodeid);
         this.mcs = QuestEngine.getNPCMCS(801);
         if(sequence == "")
         {
            sequence = this.generateSequence();
         }
         var earlierHeaven:Boolean = true;
         var num:int = int(sequence.charAt(0));
         if(num >= 8)
         {
            num -= 8;
            earlierHeaven = false;
         }
         if(earlierHeaven)
         {
            if(num == 0)
            {
               pose = MCSActor.POSE4;
            }
            else if(num == 1)
            {
               pose = MCSActor.POSE8;
            }
            else if(num == 2)
            {
               pose = MCSActor.POSE5;
            }
            else if(num == 3)
            {
               pose = MCSActor.POSE6;
            }
            else if(num == 4)
            {
               pose = MCSActor.POSE2;
            }
            else if(num == 5)
            {
               pose = MCSActor.POSE7;
            }
            else if(num == 6)
            {
               pose = MCSActor.POSE1;
            }
            else if(num == 7)
            {
               pose = MCSActor.POSE3;
            }
         }
         else if(num == 0)
         {
            pose = MCSActor.POSE1;
         }
         else if(num == 1)
         {
            pose = MCSActor.POSE2;
         }
         else if(num == 2)
         {
            pose = MCSActor.POSE3;
         }
         else if(num == 3)
         {
            pose = MCSActor.POSE4;
         }
         else if(num == 4)
         {
            pose = MCSActor.POSE5;
         }
         else if(num == 5)
         {
            pose = MCSActor.POSE6;
         }
         else if(num == 6)
         {
            pose = MCSActor.POSE7;
         }
         else if(num == 7)
         {
            pose = MCSActor.POSE8;
         }
         this.mcs.startAnim(pose);
         this.mcs.faceRight();
         this.canvas.addChild(this.mcs);
         this.mcs.buttonMode = true;
         if(!this.revealed)
         {
            iconID = NodeUI.ACTION_LOOK;
         }
         else
         {
            gotoAndStop("revealed");
            iconID = NodeUI.ACTION_TRAVEL;
         }
      }
      
      internal function generateSequence() : String
      {
         var dice:int = 0;
         var i:int = 0;
         var chosen:int = 0;
         var rng:RNG = new RNG(StageManager.getCurrentNode() * StageManager.getCurrentRoom() + 21);
         var nodelevel:int = NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode());
         var output:String = "";
         var numArray:Array = [0,1,2,3,4,5,6,7];
         if(nodelevel < 20)
         {
            for(i = 0; i < 3; i++)
            {
               chosen = rng.rand(numArray.length);
               output += numArray[chosen].toString();
               numArray.splice(chosen,1);
            }
         }
         else if(nodelevel < 60)
         {
            dice = rng.rand(5);
            if(dice == 0)
            {
               output = "1246";
            }
            else if(dice == 1)
            {
               output = "4216";
            }
            else if(dice == 2)
            {
               output = "1642";
            }
            else if(dice == 3)
            {
               output = "1426";
            }
            else if(dice == 4)
            {
               output = "6241";
            }
            output += rng.rand(8);
         }
         else
         {
            dice = rng.rand(5);
            if(dice == 0)
            {
               output = "1246";
            }
            else if(dice == 1)
            {
               output = "4216";
            }
            else if(dice == 2)
            {
               output = "1642";
            }
            else if(dice == 3)
            {
               output = "1426";
            }
            else if(dice == 4)
            {
               output = "6241";
            }
            for(i = 0; i < 2; i++)
            {
               chosen = rng.rand(numArray.length);
               output += numArray[chosen].toString();
               numArray.splice(chosen,1);
            }
         }
         return output;
      }
      
      override public function validSequence() : *
      {
         var data:XMLQuestStep = null;
         SoundManager.instance.playGoodKoto();
         gotoAndPlay(2);
         this.revealed = true;
         iconID = NodeUI.ACTION_TRAVEL;
         StageManager.addToDeadList(objectName);
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
      
      override public function invalidSequence() : *
      {
         OverworldHUD.instance.showDialog(LangManager.getString(724),LangManager.getString(5));
      }
      
      override public function setPose(pose:String) : *
      {
         this.mcs.startAnim(pose);
      }
      
      override public function interact() : *
      {
         if(!this.revealed)
         {
            if(!StatsManager.checkAP(this.getAPUse()))
            {
               OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
               return;
            }
            if(StatsManager.getStat(2211) != 0)
            {
               DragonDanceUI.instance.show(this);
            }
            else
            {
               OverworldHUD.instance.showDialog(LangManager.getString(101),LangManager.getString(5));
            }
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
      
      override public function getAPUse() : int
      {
         if(!this.revealed)
         {
            return 2;
         }
         return 1;
      }
      
      override public function getDisplayText() : String
      {
         if(!this.revealed)
         {
            if(questAction == null)
            {
               return LangManager.getString(751);
            }
            return questAction.stepShortTitle;
         }
         return this.destName;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 100;
      }
      
      override public function setQuestAction(action:QuestAction) : *
      {
         questAction = action;
         if(action.stepNo == 0)
         {
            this.mcs.showIcon(1);
         }
         else
         {
            this.mcs.showIcon(2);
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame48() : *
      {
         stop();
      }
   }
}

