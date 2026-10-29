package
{
   import flash.display.MovieClip;
   
   public class Obj_NPC extends InteractiveStageObject
   {
      
      internal var mcs:MCSCharacter;
      
      internal var npcname:String;
      
      internal var npcid:int;
      
      public function Obj_NPC(props:String, objname:String = "")
      {
         var arrowbouncing:ArrowBouncing = null;
         super();
         if(props == "")
         {
            props = "1";
            trace("<property> missing in Obj_NPC " + objname);
         }
         this.props = props;
         var strArray:Array = props.split(",");
         this.npcid = int(strArray[0]);
         this.mcs = QuestEngine.getNPCMCS(this.npcid);
         if(strArray.length < 2)
         {
            this.mcs.startAnim(MCSActor.IDLE2);
         }
         else
         {
            this.mcs.startAnim(strArray[1]);
         }
         if(strArray.length >= 3 && strArray[2] == "1")
         {
            this.mcs.faceRight();
         }
         else
         {
            this.mcs.faceLeft();
         }
         if(strArray.length >= 4)
         {
            this.mcs.setPose(strArray[1],strArray[3]);
         }
         if(strArray.length >= 5)
         {
            arrowbouncing = new ArrowBouncing();
            addChild(arrowbouncing);
            arrowbouncing.arrow.arrowtext.text = "";
            arrowbouncing.x = 0;
            arrowbouncing.y = -170;
         }
         addChild(this.mcs);
         this.npcname = QuestEngine.getNPCName(this.npcid);
         if(objname == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = objname;
         }
         this.mcs.buttonMode = false;
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
               QuestEngine.putInNPCHolder(this.npcid,this.mcs.getMCSString());
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
         this.mcs.buttonMode = true;
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

