package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2435")]
   public class Obj_DragonDanceLoot extends DragonDanceInteractiveStageObject
   {
      
      public var canvas:Canvas;
      
      internal var mcs:MCSCharacter;
      
      internal var lvl:int;
      
      internal var loottype:int = 0;
      
      public function Obj_DragonDanceLoot(props:String, objname:String = "")
      {
         var pose:String = null;
         super();
         addFrameScript(0,this.frame1,47,this.frame48);
         this.props = props;
         if(objname == "")
         {
            objectName = "dragondanceloot";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         sequence = strArray[0];
         if(strArray.length >= 2)
         {
            this.lvl = strArray[1];
         }
         if(strArray.length >= 3)
         {
            this.loottype = strArray[2];
         }
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
         iconID = NodeUI.ACTION_LOOK;
      }
      
      internal function generateSequence() : String
      {
         var dice:int = 0;
         var i:int = 0;
         var chosen:int = 0;
         var rng:RNG = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
         var nodelevel:int = NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode());
         var output:String = "";
         var numArray:Array = [0,1,2,3,4,5,6,7];
         var seqtype:int = 0;
         if(nodelevel < 30)
         {
            seqtype = 0;
         }
         else if(nodelevel < 60)
         {
            if(rng.rand(0) == 0)
            {
               seqtype = 1;
            }
            else
            {
               seqtype = 2;
            }
         }
         else
         {
            seqtype = 3;
         }
         if(seqtype == 0)
         {
            for(i = 0; i < 3; i++)
            {
               chosen = rng.rand(numArray.length);
               output += numArray[chosen].toString();
               numArray.splice(chosen,1);
            }
         }
         else if(seqtype == 1)
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
         else if(seqtype == 2)
         {
            for(i = 0; i < 4; i++)
            {
               chosen = rng.rand(numArray.length);
               output += numArray[chosen].toString();
               numArray.splice(chosen,1);
            }
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
         gotoAndPlay(2);
         StageManager.addToDeadList(objectName);
         OverworldHUD.instance.minimap.clearCurrentRoomIcon();
         canInteract = false;
         if(questAction != null)
         {
            data = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
            Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
         }
         else if(this.loottype == 0)
         {
            this.giveGoodLoot();
         }
         else if(this.loottype == 1)
         {
            this.giveRest();
         }
         else
         {
            this.giveBuff();
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
      
      override public function interactClick() : *
      {
         this.interact();
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
      
      public function giveGoodLoot() : *
      {
         var movtx:int = 0;
         var movty:int = 0;
         var rot:int = 0;
         SoundManager.instance.playGoodKoto();
         OverworldHUD.instance.lootDialog.addRandomLootItem(this.lvl,true,true);
         OverworldHUD.instance.lootDialog.addRandomLootItem(this.lvl,true,true);
         OverworldHUD.instance.lootDialog.addRandomLootItem(this.lvl);
         OverworldHUD.instance.lootDialog.addLootCoins(Math.random() * this.lvl + this.lvl * 5);
         var max:int = OverworldHUD.instance.lootDialog.getLootCount();
         for(var i:int = 0; i < max; i++)
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
            movty = -Math.random() * 5 - 30;
            ProjectileManager.createLootProjectile(x,y - 50,movtx,movty,rot,2);
         }
         max = OverworldHUD.instance.lootDialog.getCoinsCount();
         if(max > 20)
         {
            max = 0;
         }
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
            movty = -Math.random() * 10 - 20;
            ProjectileManager.createLootProjectile(x,y - 50,movtx,movty,rot,int(Math.random() * 2));
         }
         OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
         OverworldHUD.instance.lootDialog.show();
      }
      
      internal function giveRest() : *
      {
         OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_REST);
      }
      
      internal function giveBuff() : *
      {
         SoundManager.instance.playGoodKoto();
         StatsManager.setBuff(new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21)).rand(8),30 * 60);
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

