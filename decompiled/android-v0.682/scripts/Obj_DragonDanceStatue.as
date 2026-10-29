package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2431")]
   public class Obj_DragonDanceStatue extends DragonDanceInteractiveStageObject
   {
      
      public var canvas:Canvas;
      
      public var word:MovieClip;
      
      internal var mcs:MCSCharacter;
      
      internal var num:int;
      
      internal var earlierHeaven:Boolean = true;
      
      internal var isShowing:Boolean = false;
      
      public function Obj_DragonDanceStatue(props:String, objname:String = "")
      {
         var pose:String = null;
         var rng:RNG = null;
         var dice:int = 0;
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "statue";
         }
         else
         {
            objectName = objname;
         }
         this.mcs = QuestEngine.getNPCMCS(801);
         this.num = int(props);
         if(this.num >= 8)
         {
            this.num -= 8;
            this.earlierHeaven = false;
            rng = new RNG(StageManager.getCurrentNode());
            dice = rng.rand(5);
            if(dice == 0)
            {
               sequence = "1246" + this.num;
            }
            else if(dice == 1)
            {
               sequence = "4216" + this.num;
            }
            else if(dice == 2)
            {
               sequence = "1642" + this.num;
            }
            else if(dice == 3)
            {
               sequence = "1426" + this.num;
            }
            else if(dice == 4)
            {
               sequence = "6241" + this.num;
            }
         }
         else
         {
            sequence = props;
         }
         if(this.earlierHeaven)
         {
            if(this.num == 0)
            {
               pose = MCSActor.POSE4;
            }
            else if(this.num == 1)
            {
               pose = MCSActor.POSE8;
            }
            else if(this.num == 2)
            {
               pose = MCSActor.POSE5;
            }
            else if(this.num == 3)
            {
               pose = MCSActor.POSE6;
            }
            else if(this.num == 4)
            {
               pose = MCSActor.POSE2;
            }
            else if(this.num == 5)
            {
               pose = MCSActor.POSE7;
            }
            else if(this.num == 6)
            {
               pose = MCSActor.POSE1;
            }
            else if(this.num == 7)
            {
               pose = MCSActor.POSE3;
            }
            if(StatsManager.getStat(40002 + int(props)) == 0)
            {
               this.word.gotoAndStop(1 + this.num);
            }
            else
            {
               this.word.gotoAndStop(41 + this.num);
            }
         }
         else
         {
            if(this.num == 0)
            {
               pose = MCSActor.POSE1;
            }
            else if(this.num == 1)
            {
               pose = MCSActor.POSE2;
            }
            else if(this.num == 2)
            {
               pose = MCSActor.POSE3;
            }
            else if(this.num == 3)
            {
               pose = MCSActor.POSE4;
            }
            else if(this.num == 4)
            {
               pose = MCSActor.POSE5;
            }
            else if(this.num == 5)
            {
               pose = MCSActor.POSE6;
            }
            else if(this.num == 6)
            {
               pose = MCSActor.POSE7;
            }
            else if(this.num == 7)
            {
               pose = MCSActor.POSE8;
            }
            if(StatsManager.getStat(40002 + int(props)) == 0)
            {
               this.word.gotoAndStop(11 + this.num);
            }
            else
            {
               this.word.gotoAndStop(51 + this.num);
            }
         }
         this.mcs.startAnim(pose);
         this.mcs.faceRight();
         this.canvas.addChild(this.mcs);
         if(objname == "")
         {
            objectName = "statue";
         }
         this.mcs.buttonMode = true;
         iconID = NodeUI.ACTION_LOOK;
      }
      
      override public function nodeTaught() : int
      {
         return int(props);
      }
      
      override public function validSequence() : *
      {
         var data:XMLQuestStep = null;
         if(StatsManager.getStat(40002 + int(props)) == 0)
         {
            SoundManager.instance.playGoodKoto();
            if(this.earlierHeaven)
            {
               this.word.gotoAndStop(1 + this.num);
            }
            else
            {
               this.word.gotoAndStop(21 + this.num);
            }
            StatsManager.setStat(40002 + int(props),1);
            if(questAction == null)
            {
               OverworldHUD.instance.showDialog(LangManager.getString(750),LangManager.getString(5));
            }
         }
         else if(questAction == null)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(724),LangManager.getString(5));
         }
         if(questAction != null)
         {
            data = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
            Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
         }
      }
      
      override public function invalidSequence() : *
      {
         OverworldHUD.instance.showDialog(LangManager.getString(724),LangManager.getString(5));
      }
      
      override public function interact() : *
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
      
      override public function getAPUse() : int
      {
         return 2;
      }
      
      override public function getDisplayText() : String
      {
         if(questAction == null)
         {
            return LangManager.getString(751);
         }
         return questAction.stepShortTitle;
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
   }
}

