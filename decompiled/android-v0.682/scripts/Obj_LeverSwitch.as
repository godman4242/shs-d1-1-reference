package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2388")]
   public class Obj_LeverSwitch extends TriggeredStageObject
   {
      
      internal var targetList:Array;
      
      internal var isOn:Boolean = false;
      
      internal var enabledState:String = "";
      
      internal var objList:String;
      
      public function Obj_LeverSwitch(props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.props = props;
         if(objname == "")
         {
            objectName = "Lever Switch";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.objList = strArray[0];
         if(strArray.length > 1)
         {
            this.enabledState = strArray[1];
         }
         if(this.enabledState == "1")
         {
            this.isOn = true;
            gotoAndStop(2);
         }
         else if(this.enabledState == "2")
         {
            this.isOn = true;
            canInteract = false;
            gotoAndStop(2);
            buttonMode = false;
         }
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interact() : *
      {
         this.doStuff();
         NetworkManager.instance.setObjectState(objectName,this.isOn,false);
         if(this.enabledState == "0" || this.enabledState == "")
         {
            StageManager.addToDeadList(objectName);
            canInteract = false;
         }
         else if(this.enabledState == "1")
         {
            canInteract = false;
         }
         else if(this.enabledState == "2")
         {
            canInteract = false;
         }
         else if(this.enabledState != "3")
         {
            if(this.enabledState == "4")
            {
               canInteract = false;
            }
            else if(this.enabledState == "5")
            {
               StageManager.addToDeadList(objectName);
               StatsManager.addLever();
               OverworldHUD.instance.minimap.clearCurrentRoomIcon();
               canInteract = false;
               if(StatsManager.hasLever())
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(678),LangManager.getString(5));
                  SoundManager.instance.playGoodKoto();
               }
            }
         }
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         this.isOn = !flag;
         this.doStuff();
      }
      
      internal function doStuff() : *
      {
         var strArray:Array = null;
         var obj:InteractiveStageObject = null;
         var i:int = 0;
         if(this.targetList == null)
         {
            this.targetList = new Array();
            strArray = this.objList.split("|");
            for(i = 0; i < strArray.length; i++)
            {
               obj = StageManager.getGameStage().getRoomInteractiveObject(strArray[i]);
               if(obj != null)
               {
                  this.targetList.push(TriggeredStageObject(obj));
               }
            }
         }
         for(i = 0; i < this.targetList.length; i++)
         {
            this.targetList[i].triggerObject(!this.isOn,false);
         }
         if(!this.isOn)
         {
            gotoAndStop(2);
            this.isOn = true;
         }
         else
         {
            gotoAndStop(1);
            this.isOn = false;
         }
      }
      
      override public function getDisplayText() : String
      {
         return "Pull Lever";
      }
      
      override public function canClickInteract() : *
      {
         return true;
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
               OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,iconID);
            }
            shown = true;
         }
         else if(!flag && shown)
         {
            shown = false;
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 50;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

