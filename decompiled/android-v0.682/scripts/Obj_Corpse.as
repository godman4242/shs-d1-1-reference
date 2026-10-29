package
{
   import flash.display.MovieClip;
   
   public class Obj_Corpse extends InteractiveStageObject
   {
      
      internal var npc:NPC;
      
      internal var npcname:String;
      
      internal var npcid:int;
      
      internal var offset:int;
      
      public function Obj_Corpse(posX:int, posY:int, props:String, objname:String = "")
      {
         var dice:int = 0;
         super();
         if(props == "")
         {
            props = "1";
            trace("<property> missing in Obj_NPC " + objname);
         }
         this.props = props;
         var strArray:Array = props.split(",");
         this.npcid = int(strArray[0]);
         this.npc = NPCManager.createRoomNPC(this.npcid,posX,posY);
         this.npc.animFrozen = true;
         this.npc.getMCS().hideHealthBar();
         if(this.npcid == 77)
         {
            this.npc.getMCS().setPose(MCSActor.OGRE_DEATH,53);
            this.offset = 150;
         }
         else if(this.npcid == 65 || this.npcid == 78)
         {
            this.npc.getMCS().setPose(MCSActor.WOLF_DOWNED,0);
            this.offset = 0;
         }
         else if(this.npcid == 72)
         {
            this.npc.getMCS().setPose(MCSActor.BEAR_DEATH,5);
            this.offset = 50;
         }
         else if(this.npcid == 73)
         {
            this.npc.getMCS().setPose(MCSActor.BOAR_DEATH,6);
            this.offset = 40;
         }
         else if(this.npcid == 74)
         {
            this.npc.getMCS().setPose(MCSActor.DEER_DEATH,6);
            this.offset = 80;
         }
         else
         {
            dice = RNG.random(5,StageManager.getCurrentNode() * QueryManager.instance.getServerDate() + posX + StageManager.getCurrentRoom());
            if(dice == 0)
            {
               this.npc.startAnim(MCSActor.CORPSE1);
            }
            else if(dice == 1)
            {
               this.npc.startAnim(MCSActor.CORPSE2);
            }
            else if(dice == 2)
            {
               this.npc.startAnim(MCSActor.CORPSE3);
            }
            else if(dice == 3)
            {
               this.npc.startAnim(MCSActor.CORPSE4);
            }
            else if(dice == 4)
            {
               this.npc.startAnim(MCSActor.CORPSE5);
            }
            if(RNG.random(2,-1) == 0)
            {
               this.npc.getMCS().faceLeft();
            }
            this.npc.dead = true;
         }
         this.npc.getMCS().setDisplayName("");
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interact() : *
      {
         canInteract = false;
         OverworldHUD.getInstance().getNodeUI().runSearch(this);
      }
      
      override public function interact2() : *
      {
         var data:XMLQuestStep = null;
         var max:int = 0;
         var movtx:int = 0;
         var movty:int = 0;
         var rot:int = 0;
         var i:int = 0;
         StatsManager.reportAchievementStat(60007,1);
         if(questAction != null)
         {
            data = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
            Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
            return;
         }
         if(int(Math.random() * 10) <= StatsManager.getStat(1021))
         {
            OverworldHUD.instance.lootDialog.addRandomLootItem(StageManager.getCurrentNodeLevel(),false,true);
            max = OverworldHUD.instance.lootDialog.getLootCount();
            for(i = 0; i < max; i++)
            {
               movtx = Math.random() * 16 - 8;
               if(x < 100 && movtx < 0)
               {
                  movtx *= -1;
               }
               else if(x > StageManager.getGameStageWidth() - 100 && movtx > 0)
               {
                  movtx *= -1;
               }
               rot = 20;
               if(movtx < 0)
               {
                  rot = -20;
               }
               movty = -Math.random() * 10 - 25;
               ProjectileManager.createLootProjectile(x,y - 50,movtx,movty,rot,2);
            }
            OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
            OverworldHUD.instance.lootDialog.show();
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(101),LangManager.getString(5));
         }
      }
      
      override public function getDisplayText() : String
      {
         return "Search corpse";
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(!canInteract)
         {
            return false;
         }
         return abs(this.npc.getMCS().x + this.offset - mc.x) < 100;
      }
      
      override public function setQuestAction(action:QuestAction) : *
      {
         questAction = action;
         this.npc.getMCS().buttonMode = true;
      }
      
      override public function getAPUse() : int
      {
         return 2;
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
   }
}

