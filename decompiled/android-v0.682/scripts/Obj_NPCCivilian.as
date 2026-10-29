package
{
   import flash.display.MovieClip;
   
   public class Obj_NPCCivilian extends InteractiveStageObject
   {
      
      internal var npc:NPC;
      
      internal var npcname:String;
      
      internal var npcid:int;
      
      public function Obj_NPCCivilian(posX:int, posY:int, props:String, objname:String = "")
      {
         super();
         if(props == "")
         {
            props = "1";
            trace("<property> missing in Obj_NPC " + objname);
         }
         this.props = props;
         this.npcid = int(props);
         this.npc = NPCManager.createRoomNPC(this.npcid,posX,posY);
         this.npcname = QuestEngine.getNPCName(this.npcid);
         if(objname == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = objname;
         }
         this.npc.mcs.hideHealthBar();
         this.npc.mcs.setDisplayName("");
         visible = false;
      }
      
      override public function setQuestAction(action:QuestAction) : *
      {
         questAction = action;
         this.npc.getMCS().buttonMode = true;
         if(action.stepNo == 0 && action.type != 4)
         {
            this.npc.getMCS().showIcon(1);
         }
         else
         {
            this.npc.getMCS().showIcon(2);
         }
         this.npc.mcs.setDisplayName(this.npcname);
      }
      
      override public function interactClick() : *
      {
         var activeQuest:ActiveQuest = null;
         var qdata:XMLQuest = null;
         if(questAction == null)
         {
            return;
         }
         if(questAction.id == QuestGenerator.PROCGENQUEST)
         {
            activeQuest = questAction.procGenQuest;
            qdata = QuestGenerator.instance.generateQuest(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,activeQuest.questType,activeQuest.questReason,activeQuest.questGiver,activeQuest.questTargetLocation);
            QuestEngine.putInNPCHolder(this.npcid,this.npc.getMCS().getMCSString());
            QuestEngine.putInDuelistHolder(18,this.npc.getMCS().getMCSString(),NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()),QuestGenerator.instance.getNPCName(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,true));
            QuestEngine.insertQuestData(qdata);
         }
         var data:XMLQuestStep = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
         if(StatsManager.checkConditions(data.condition))
         {
            if(StatsManager.checkAP(data.ap))
            {
               QuestEngine.putInNPCHolder(this.npcid,this.npc.getMCS().getMCSString());
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
      
      override public function interact() : *
      {
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            if(questAction != null)
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectQuestButton(this,questAction.title,questAction.stepShortTitle,questAction.type,questAction.id,questAction.stepNo,questAction.ap);
            }
            else
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,NodeUI.ACTION_TALK);
            }
            shown = true;
            this.npc.startAction(MCSActor.IDLE_STATE);
            if(StatsManager.getPlayer().mcs.x < this.npc.mcs.x)
            {
               this.npc.mcs.faceLeft();
            }
            else
            {
               this.npc.mcs.faceRight();
            }
         }
         else if(!flag && shown)
         {
            shown = false;
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
         return abs(this.npc.mcs.x - mc.x) < 100;
      }
      
      override public function removeFromCanvas(canvas:MovieClip) : *
      {
         NPCManager.removeRoomNPC(this.npc);
      }
      
      override public function getMovieClip() : MovieClip
      {
         return this.npc.getMCS();
      }
      
      override public function onMouseOver() : *
      {
         if(questAction != null)
         {
            this.npc.startAction(MCSActor.IDLE_STATE);
         }
      }
      
      override public function showQuestIndicator(questAction:QuestAction) : *
      {
         this.npc.getMCS().showIcon(2);
      }
      
      override public function doScroll(dist:int) : *
      {
      }
   }
}

