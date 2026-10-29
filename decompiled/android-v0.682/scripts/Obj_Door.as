package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2480")]
   public class Obj_Door extends TriggeredStageObject
   {
      
      public var design1:MovieClip;
      
      public var design2:MovieClip;
      
      internal var objectEnabled:Boolean = false;
      
      internal var dest:int;
      
      internal var destName:String;
      
      internal var doorType:int;
      
      internal var doorDesign:int;
      
      public function Obj_Door(props:String, objname:String = "")
      {
         var rng:RNG = null;
         super();
         addFrameScript(0,this.frame1);
         this.props = props;
         if(objname == "")
         {
            objectName = "Door";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.doorType = strArray[0];
         this.dest = strArray[1];
         if(strArray.length > 3)
         {
            this.destName = StageManager.getRoomName(this.dest,int(strArray[3]));
         }
         else
         {
            this.destName = StageManager.getRoomName(this.dest,-1);
         }
         if(this.doorType == 0)
         {
            gotoAndStop(1);
         }
         else if(this.doorType == 1)
         {
            gotoAndStop(3);
         }
         else if(this.doorType == 2)
         {
            gotoAndStop(5);
            rng = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
            this.doorDesign = rng.rand(5) + 1;
            this.design1.gotoAndStop(this.doorDesign);
            this.design2.gotoAndStop(this.doorDesign);
         }
         if(strArray.length > 4)
         {
            this.triggerObject(true,false);
         }
         iconID = NodeUI.ACTION_TRAVEL;
         buttonMode = true;
      }
      
      override public function needTransition() : Boolean
      {
         return this.objectEnabled;
      }
      
      override public function interactClick() : *
      {
         if(this.needTransition())
         {
            OverworldHUD.getInstance().screenTransition.setParam(this);
            OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_INTERACT);
         }
         else
         {
            this.interact();
         }
      }
      
      override public function interact() : *
      {
         var strArray:Array = null;
         if(this.objectEnabled)
         {
            strArray = props.split(",");
            if(props == "-1")
            {
               GameEngine.stopBattleMode();
               NetworkManager.getInstance().leaveRoom();
            }
            else if(strArray.length > 3)
            {
               StageManager.gotoRoom(this.dest,int(strArray[1]),int(strArray[3]));
            }
            else if(strArray.length < 2)
            {
               StageManager.gotoRoom(this.dest,int(strArray[1]));
            }
            else
            {
               StageManager.gotoRoom(this.dest);
            }
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(188),LangManager.getString(5));
         }
      }
      
      override public function getDisplayText() : String
      {
         if(this.objectEnabled)
         {
            if(props == "-1")
            {
               return LangManager.getString(146);
            }
            return LangManager.getString(192) + this.destName;
         }
         return LangManager.getString(187);
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         if(flag != this.objectEnabled)
         {
            this.objectEnabled = flag;
            if(this.objectEnabled)
            {
               if(this.doorType == 0)
               {
                  gotoAndStop(2);
               }
               else if(this.doorType == 1)
               {
                  gotoAndStop(4);
               }
               else if(this.doorType == 2)
               {
                  gotoAndStop(6);
                  this.design1.gotoAndStop(this.doorDesign);
                  this.design2.gotoAndStop(this.doorDesign);
               }
            }
            else if(this.doorType == 0)
            {
               gotoAndStop(1);
            }
            else if(this.doorType == 1)
            {
               gotoAndStop(3);
            }
            else if(this.doorType == 2)
            {
               gotoAndStop(5);
               this.design1.gotoAndStop(this.doorDesign);
               this.design2.gotoAndStop(this.doorDesign);
            }
         }
      }
      
      override public function doScroll(dist:int) : *
      {
         if(this.doorType == 0)
         {
            x += dist / 2;
         }
         else
         {
            x += dist;
         }
      }
      
      override public function canClickInteract() : *
      {
         return true;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 50;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

