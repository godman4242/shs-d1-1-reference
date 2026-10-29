package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2455")]
   public class Obj_DoorDungeonLocked extends InteractiveStageObject
   {
      
      public var base:MovieClip;
      
      internal var objectEnabled:Boolean = false;
      
      internal var dest:int;
      
      internal var destName:String;
      
      internal var compassDir:int = -1;
      
      internal var color:int = 0;
      
      public function Obj_DoorDungeonLocked(props:String, objname:String = "")
      {
         var gotoframe:int = 0;
         super();
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
         this.dest = strArray[0];
         if(strArray.length >= 3)
         {
            this.destName = StageManager.getRoomName(this.dest,int(strArray[2]));
         }
         else
         {
            this.destName = StageManager.getRoomName(this.dest,-1);
         }
         if(strArray.length >= 4 && strArray[3] == "0")
         {
            visible = false;
         }
         if(strArray.length >= 6)
         {
            this.compassDir = strArray[4];
         }
         if(strArray.length >= 7)
         {
            gotoframe = int(strArray[6]) * 10 + 1;
            gotoAndStop(gotoframe);
         }
         if(strArray.length >= 8)
         {
            this.color = int(strArray[7]);
            if(this.color != 0 && (gotoframe == 1 || gotoframe == 2 || gotoframe == 21 || gotoframe == 22))
            {
               ColorCode.setMCTint(this.base,0.1,this.color);
            }
         }
         if(strArray.length >= 9 && strArray[8] == "1")
         {
            this.setObjectEnabled(true);
         }
         if(!this.objectEnabled && StatsManager.hasLever() && (gotoframe == 21 || gotoframe == 31 || gotoframe == 51))
         {
            StatsManager.removeAllLever();
            this.setObjectEnabled(true);
         }
         if(this.dest == -1)
         {
            iconID = NodeUI.ACTION_LEAVE;
         }
         else
         {
            iconID = NodeUI.ACTION_TRAVEL;
         }
         buttonMode = true;
         stop();
         ColorCode.blur(this,2);
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
               StageManager.gotoRoom(this.dest,int(strArray[1]),int(strArray[2]),this.compassDir);
            }
            else if(strArray.length == 3)
            {
               StageManager.gotoRoom(this.dest,int(strArray[1]),int(strArray[2]));
            }
            else if(strArray.length == 2)
            {
               StageManager.gotoRoom(this.dest,int(strArray[1]));
            }
            else
            {
               StageManager.gotoRoom(this.dest);
            }
         }
         else if(StatsManager.hasKey())
         {
            StatsManager.removeKey();
            OverworldHUD.instance.minimap.showCurrentRoomUnlockIcon();
            OverworldHUD.instance.updateHUD();
            this.setObjectEnabled(true);
         }
         else if(currentFrame == 21 || currentFrame == 31 || currentFrame == 51)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(677),LangManager.getString(5));
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(429),LangManager.getString(5));
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
         if(StatsManager.hasKey())
         {
            return LangManager.getString(430);
         }
         if(StatsManager.hasLever())
         {
            return LangManager.getString(430);
         }
         return LangManager.getString(187);
      }
      
      override public function setObjectEnabled(flag:Boolean) : *
      {
         if(flag != this.objectEnabled)
         {
            this.objectEnabled = flag;
            if(this.objectEnabled)
            {
               if(currentFrame == 1)
               {
                  gotoAndStop(2);
               }
               else if(currentFrame == 11)
               {
                  gotoAndStop(12);
               }
               else if(currentFrame == 21)
               {
                  gotoAndStop(22);
               }
               else if(currentFrame == 31)
               {
                  gotoAndStop(32);
               }
               else if(currentFrame == 41)
               {
                  gotoAndStop(42);
               }
               else if(currentFrame == 51)
               {
                  gotoAndStop(52);
               }
               StageManager.addToDeadList(objectName);
            }
            else if(currentFrame == 2)
            {
               gotoAndStop(1);
            }
            else if(currentFrame == 12)
            {
               gotoAndStop(11);
            }
            else if(currentFrame == 22)
            {
               gotoAndStop(21);
            }
            else if(currentFrame == 32)
            {
               gotoAndStop(31);
            }
            else if(currentFrame == 42)
            {
               gotoAndStop(41);
            }
            else if(currentFrame == 52)
            {
               gotoAndStop(51);
            }
            if(this.color != 0 && (currentFrame == 1 || currentFrame == 2 || currentFrame == 21 || currentFrame == 22))
            {
               ColorCode.setMCTint(this.base,0.1,this.color);
            }
         }
      }
      
      override public function canClickInteract() : *
      {
         return currentFrame == 2 || currentFrame == 12 || currentFrame == 22 || currentFrame == 32 || currentFrame == 42 || currentFrame == 52;
      }
      
      override public function doScroll(dist:int) : *
      {
         if(this.forFarCanvas())
         {
            x += dist / 2;
         }
         else
         {
            x += dist;
         }
      }
      
      override public function forFarCanvas() : Boolean
      {
         return currentFrame > 40;
      }
   }
}

