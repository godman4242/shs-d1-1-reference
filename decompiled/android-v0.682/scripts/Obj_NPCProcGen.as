package
{
   import flash.display.MovieClip;
   
   public class Obj_NPCProcGen extends InteractiveStageObject
   {
      
      internal var npc:NPC;
      
      internal var npcname:String;
      
      internal var questCompleted:Boolean;
      
      internal var isRonin:Boolean = false;
      
      public function Obj_NPCProcGen(posX:int, posY:int, props:String, objname:String = "")
      {
         var index:int = 0;
         var nodeid:int = 0;
         var roomid:int = 0;
         var date:int = 0;
         super();
         if(props == "")
         {
            props = "1";
            trace("<property> missing in Obj_NPC " + objname);
         }
         this.props = props;
         var strArray:Array = props.split(",");
         index = int(strArray[0]);
         if(strArray.length == 2)
         {
            this.isRonin = strArray[1] == "1";
         }
         nodeid = StageManager.getCurrentNode();
         roomid = StageManager.getCurrentRoom();
         date = QueryManager.instance.getServerDate();
         var npcxml:XMLNpc = new XMLNpc(null);
         npcxml.initProcGenNPC(nodeid,roomid,index,date,this.isRonin);
         this.npc = NPCManager.createRoomNPCProcGen(npcxml,posX,posY);
         this.npcname = npcxml.name;
         if(objname == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = objname;
         }
         this.npc.getMCS().hideHealthBar();
         this.npc.getMCS().setDisplayName(this.npcname,39423);
         visible = false;
         this.questCompleted = false;
         if(!this.questCompleted)
         {
            this.npc.getMCS().buttonMode = true;
         }
         if(QuestGenerator.instance.isMarkedNPC(nodeid,roomid,index,date))
         {
            this.npc.getMCS().setDisplayName(this.npcname,12627019);
            this.npc.getMCS().showIcon(2);
         }
         else
         {
            this.npc.getMCS().showIcon(3);
         }
      }
      
      override public function interactClick() : *
      {
         var data:XMLQuest = null;
         if(this.questCompleted)
         {
            return;
         }
         if(!this.isRonin)
         {
            data = QuestGenerator.instance.generateRandomQuest(StageManager.getCurrentNode(),StageManager.getCurrentRoom(),int(props),QueryManager.instance.getServerDate());
         }
         else
         {
            QuestEngine.putInDuelistHolder(18,this.npc.getMCS().getMCSString(),NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()),this.npcname);
            data = QuestGenerator.instance.generateRandomRoninQuest(StageManager.getCurrentNode(),StageManager.getCurrentRoom(),int(props),QueryManager.instance.getServerDate());
         }
         if(StatsManager.checkAP(data.stepList[0].ap))
         {
            QuestEngine.putProcGenInNPCHolder(this.npc.getMCS().getMCSString(),this.npcname);
            QuestEngine.insertQuestData(data);
            Overworld.startQuestStepIntro(QuestGenerator.PROCGENQUEST,0);
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(100),LangManager.getString(5));
         }
      }
      
      override public function interact() : *
      {
         this.interactClick();
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,NodeUI.ACTION_TALK);
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
         return this.npcname;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(this.questCompleted)
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
         if(this.questCompleted)
         {
            return;
         }
         this.npc.startAction(MCSActor.IDLE_STATE);
      }
   }
}

