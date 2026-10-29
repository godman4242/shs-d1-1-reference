package
{
   import flash.display.MovieClip;
   
   public class Obj_NPCAnimated extends InteractiveStageObject
   {
      
      internal var npc:CutsceneActor;
      
      internal var npcname:String;
      
      internal var npcid:int;
      
      public function Obj_NPCAnimated(posX:int, posY:int, props:String, objname:String = "")
      {
         super();
         if(props == "")
         {
            props = "1";
            trace("<property> missing in Obj_NPC " + objname);
         }
         this.props = props;
         var strArray:Array = props.split(",");
         this.npcid = int(strArray[0]);
         this.npc = NPCManager.createCutsceneActor(this.npcid,posX,posY);
         this.npc.setNPCAnimated(this);
         this.npc.startAction(MCSActor.POSE_STATE);
         if(strArray.length < 2)
         {
            this.npc.mcs.startAnim(MCSActor.IDLE2);
         }
         else
         {
            this.npc.mcs.startAnim(strArray[1]);
         }
         if(strArray.length >= 3 && strArray[2] == "1")
         {
            this.npc.mcs.faceRight();
         }
         else
         {
            this.npc.mcs.faceLeft();
         }
         if(strArray.length >= 4 && strArray[3] != "-1")
         {
            this.npc.mcs.setPose(strArray[1],strArray[3]);
         }
         if(strArray.length >= 6)
         {
            this.performCutsceneAction(strArray[4],strArray[5]);
         }
         this.npcname = QuestEngine.getNPCName(this.npcid);
         if(objname == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = objname;
         }
         this.npc.mcs.buttonMode = false;
         this.npc.mcs.hideHealthBar();
      }
      
      override public function interact() : *
      {
      }
      
      override public function interactClick() : *
      {
         if(questAction == null)
         {
            return;
         }
         var data:XMLQuestStep = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
         if(StatsManager.checkConditions(data.condition))
         {
            if(StatsManager.checkAP(data.ap))
            {
               QuestEngine.putInNPCHolder(this.npcid,this.npc.mcs.getMCSString());
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
      }
      
      override public function getDisplayText() : String
      {
         if(questAction == null)
         {
            return "";
         }
         return questAction.stepShortTitle;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(questAction == null)
         {
            return false;
         }
         return abs(x - mc.x) < 100;
      }
      
      override public function setQuestAction(action:QuestAction) : *
      {
         questAction = action;
         this.npc.mcs.buttonMode = true;
         if(action.stepNo == 0)
         {
            this.npc.mcs.showIcon(1);
         }
         else
         {
            this.npc.mcs.showIcon(2);
         }
         this.npc.mcs.setDisplayName(this.npcname);
      }
      
      public function performCutsceneAction(action:String, param:String) : *
      {
         if(this.npc != null)
         {
            this.npc.performCutsceneAction(action,param);
         }
      }
      
      public function destroy() : *
      {
         this.npc = null;
         StageManager.getGameStage().removeInteractiveRoomObject(objectName);
      }
      
      override public function getMovieClip() : MovieClip
      {
         return this.npc.getMCS();
      }
   }
}

