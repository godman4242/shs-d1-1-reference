package
{
   import flash.display.MovieClip;
   
   public class Obj_NPCAggro extends InteractiveStageObject
   {
      
      internal var npc:NPC;
      
      internal var npcname:String;
      
      internal var waveXML:XMLList;
      
      internal var npcid:int;
      
      internal var doDuel:Boolean = false;
      
      internal var lvl:int = 0;
      
      public function Obj_NPCAggro(posX:int, posY:int, props:String, objname:String = "")
      {
         var strArray:Array = null;
         var bossxml:XMLNpc = null;
         super();
         if(props == "")
         {
            props = "1";
            trace("<property> missing in Obj_NPC " + objname);
         }
         props = props.split("<property>").join("");
         props = props.split("</property>").join("");
         strArray = props.split(",");
         var npcidstr:String = strArray[0];
         if(strArray.length >= 2)
         {
            this.lvl = strArray[1];
         }
         if(strArray.length >= 3)
         {
            this.waveXML = new XMLList(strArray[2]);
         }
         var npcIdStrArray:Array = npcidstr.split("|");
         if(npcIdStrArray.length > 1)
         {
            this.npcid = npcIdStrArray[int(Math.random() * npcIdStrArray.length)];
         }
         else
         {
            this.npcid = int(npcIdStrArray);
         }
         if(this.npcid == XMLNpc.INDEX_SUBBOSS)
         {
            bossxml = QuestGenerator.instance.getBountyTarget(StageManager.getCurrentNode(),StageManager.getCurrentRoom(),QueryManager.instance.getServerDate());
            bossxml.lvl = this.lvl;
            bossxml.id = XMLNpc.INDEX_SUBBOSS;
            QuestEngine.insertNPCData(bossxml);
         }
         var doChase:Boolean = false;
         if(strArray.length >= 4 && strArray[3] != null && this.trim(strArray[3]) == "2")
         {
            doChase = true;
         }
         this.npc = NPCManager.createRoomNPC(this.npcid,posX,posY,doChase);
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
         if(this.lvl == 0)
         {
            this.npc.mcs.setDisplayName(this.npcname,10027008);
         }
         else
         {
            this.npc.mcs.setDisplayName(this.npcname + " (" + this.lvl + ")",10027008);
         }
         visible = false;
         if(strArray.length >= 4 && strArray[3] != null && this.trim(strArray[3]) == "1")
         {
            this.npc.startAnim(MCSActor.IDLE2);
            this.npc.startAction(MCSActor.REDFREEZE_STATE);
            if(strArray.length >= 6 && this.trim(strArray[5]) == "1")
            {
               this.npc.getMCS().faceRight();
            }
            else
            {
               this.npc.getMCS().faceLeft();
            }
            if(strArray.length >= 5 && strArray[4] != "0")
            {
               this.npc.startAnim(this.trim(strArray[4]));
            }
            else
            {
               this.npc.startAnim(MCSActor.IDLE2);
            }
         }
         if(strArray.length >= 7 && this.trim(strArray[6]) == "1")
         {
            this.doDuel = true;
         }
         this.npc.getMCS().buttonMode = true;
      }
      
      internal function trim(s:String) : String
      {
         return s.replace(/^[\s|\t|\n]+|[\s|\t|\n]+$/gs,"");
      }
      
      override public function interactClick() : *
      {
      }
      
      override public function interact() : *
      {
         var activeQuest:ActiveQuest = null;
         var data:XMLQuest = null;
         var length:int = 0;
         var wavelist:* = undefined;
         var i:int = 0;
         var dice:int = 0;
         var taunt:String = null;
         QuestEngine.putInNPCHolder(this.npcid,this.npc.getMCS().getMCSString(),this.lvl);
         if(questAction != null)
         {
            if(questAction.id == QuestGenerator.PROCGENQUEST)
            {
               activeQuest = questAction.procGenQuest;
               data = QuestGenerator.instance.generateQuest(activeQuest.nodeid,activeQuest.roomid,activeQuest.npcindex,activeQuest.date,activeQuest.questType,activeQuest.questReason,activeQuest.questGiver,activeQuest.questTargetLocation);
               QuestEngine.putInNPCHolder(this.npcid,this.npc.getMCS().getMCSString(),this.lvl);
               QuestEngine.insertQuestData(data);
            }
            if(questAction.action == 6)
            {
               QuestEngine.putInDuelistHolder(this.npcid,this.npc.getMCS().getMCSString(),this.lvl);
            }
            Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
         }
         else
         {
            Overworld.setCurrentQuest(-1);
            length = int(this.waveXML.wave.length());
            wavelist = new Vector.<XMLQuestWave>();
            for(i = 0; i < length; i++)
            {
               wavelist.push(new XMLQuestWave(this.waveXML.wave[i]));
            }
            if(this.doDuel)
            {
               QuestEngine.putInDuelistHolder(this.npcid,this.npc.getMCS().getMCSString(),this.lvl);
               dice = Math.random() * 8;
               if(dice == 0)
               {
                  taunt = LangManager.getString(472);
               }
               else if(dice == 1)
               {
                  taunt = LangManager.getString(473);
               }
               else if(dice == 2)
               {
                  taunt = LangManager.getString(474);
               }
               else if(dice == 3)
               {
                  taunt = LangManager.getString(475);
               }
               else if(dice == 4)
               {
                  taunt = LangManager.getString(476);
               }
               else if(dice == 5)
               {
                  taunt = LangManager.getString(477);
               }
               else if(dice == 6)
               {
                  taunt = LangManager.getString(478);
               }
               else if(dice == 7)
               {
                  taunt = LangManager.getString(479);
               }
               DuelModeUI.instance.setOpponentTaunt(taunt);
               GameEngine.initBattleMode(-2,6,StageManager.gameStageType,StageManager.getGameStage().getGameStageWidth(),0,wavelist,150);
            }
            else
            {
               GameEngine.initBattleMode(-1,1,StageManager.gameStageType,StageManager.getGameStage().getGameStageWidth(),0,wavelist,400);
            }
         }
         StageManager.addToDeadList(objectName);
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         var screenTransition:ScreenTransition = OverworldHUD.getInstance().screenTransition;
         if(screenTransition.isTransitioning() || OverworldHUD.instance.duelmodeUI.noAggro || CutsceneManager.instance != null && CutsceneManager.instance.showing || OverworldHUD.instance.payUI.visible)
         {
            return;
         }
         if(flag && !shown && canInteract)
         {
            shown = true;
            this.npc.startAction(MCSActor.REDFREEZE_STATE);
            StatsManager.getPlayer().stopMoving();
            OverworldHUD.instance.closeOpenDialogs();
            if(questAction != null && questAction.action == 0)
            {
               this.interact();
            }
            else
            {
               OverworldHUD.instance.showDialog(this.npcname + " " + LangManager.getString(196),LangManager.getString(5),false);
               screenTransition.setParam(this);
               screenTransition.startClose(ScreenTransition.ACTION_INTERACT);
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
         return this.npcname;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return !StatsManager.noAggro && abs(this.npc.getMCS().x - mc.x) < 50 && this.npc.getMCS().getAnim() != MCSActor.WOLF_POUNCE_MIDHIGH && this.npc.actionState != MCSActor.NAP_STATE;
      }
      
      override public function removeFromCanvas(canvas:MovieClip) : *
      {
         NPCManager.removeRoomNPC(this.npc);
      }
      
      override public function getMovieClip() : MovieClip
      {
         return this.npc.getMCS();
      }
      
      override public function doScroll(dist:int) : *
      {
      }
      
      override public function showQuestIndicator(questAction:QuestAction) : *
      {
         this.npc.getMCS().showIcon(2);
      }
   }
}

