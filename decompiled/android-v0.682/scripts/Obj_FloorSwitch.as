package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2411")]
   public class Obj_FloorSwitch extends TriggeredStageObject
   {
      
      internal var targetList:Array;
      
      public function Obj_FloorSwitch(props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.props = props;
         if(objname == "")
         {
            objectName = "Floor Switch";
         }
         else
         {
            objectName = objname;
         }
         if(props == "0")
         {
            active = false;
            gotoAndStop(2);
         }
      }
      
      override public function getDisplayText() : String
      {
         return "";
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         var strArray:Array = null;
         var obj:InteractiveStageObject = null;
         var i:int = 0;
         if(flag == shown)
         {
            return;
         }
         if(this.targetList == null)
         {
            this.targetList = new Array();
            strArray = props.split(",");
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
            this.targetList[i].triggerObject(flag,true);
         }
         if(flag)
         {
            gotoAndStop(2);
            shown = true;
         }
         else
         {
            gotoAndStop(1);
            shown = false;
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         var networkPlayerX:int = 0;
         if(!active)
         {
            return false;
         }
         if(abs(x - mc.x) < 50 && mc.y > StageManager.getGroundY() - 10)
         {
            return true;
         }
         var networkPlayerList:Vector.<NPC> = NPCManager.getNetworkPlayerList();
         var max:int = int(networkPlayerList.length);
         for(var i:int = 0; i < max; i++)
         {
            networkPlayerX = networkPlayerList[i].getMCS().x;
            if(abs(x - networkPlayerX) < 50)
            {
               return true;
            }
         }
         this.showInteractButton(false);
         return false;
      }
      
      override public function canClickInteract() : *
      {
         return false;
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         active = !active;
         if(active)
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(2);
         }
         shown = false;
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

