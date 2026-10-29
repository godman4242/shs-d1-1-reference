package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2394")]
   public class Obj_LadderPoint extends TriggeredStageObject
   {
      
      public var nametext:TextField;
      
      public var bar:MovieClip;
      
      internal var dest:int;
      
      internal var destpos:int;
      
      internal var destName:String;
      
      internal var side:int;
      
      internal var counter:int = 0;
      
      internal var counterMax:int = 240;
      
      internal var actionState:int = 0;
      
      internal var objectEnabled:Boolean = false;
      
      internal var forceObjectEnabled:Boolean = false;
      
      public function Obj_LadderPoint(objX:int, objY:int, props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         this.props = props;
         if(objname == "")
         {
            objectName = "ladderpoint";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.dest = strArray[0];
         this.destpos = strArray[1];
         this.side = strArray[2];
         if(strArray.length == 4)
         {
            this.forceObjectEnabled = strArray[3] == "1";
         }
         if(this.forceObjectEnabled)
         {
            gotoAndStop(3);
            this.objectEnabled = true;
         }
         this.destName = StageManager.getRoomName(this.dest,-1);
         iconID = NodeUI.ACTION_TRAVEL;
         if(this.side == StatsManager.getSide())
         {
            visible = false;
         }
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
      }
      
      override public function interact() : *
      {
         if(this.objectEnabled)
         {
            StageManager.gotoRoom(this.dest,this.destpos);
         }
      }
      
      override public function getDisplayText() : String
      {
         if(this.objectEnabled)
         {
            return LangManager.getString(141) + " " + this.destName;
         }
         if(this.side == StatsManager.getSide())
         {
            return "";
         }
         return LangManager.getString(772);
      }
      
      override public function doScroll(dist:int) : *
      {
         x += dist / 3;
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(this.forceObjectEnabled)
         {
            super.showInteractButton(flag);
            return;
         }
         if(flag)
         {
            if(this.actionState == 0)
            {
               this.actionState = 1;
               gotoAndStop(2);
               this.nametext.text = LangManager.getString(675);
            }
            if(this.actionState == 1)
            {
               ++this.counter;
               this.bar.scaleX = this.counter / this.counterMax;
               if(this.counter >= this.counterMax)
               {
                  this.actionState = 2;
                  this.objectEnabled = true;
                  gotoAndStop(3);
                  buttonMode = true;
                  if(this.side != StatsManager.getSide())
                  {
                     NetworkManager.instance.setObjectState(objectName,true,false);
                  }
               }
            }
         }
         else
         {
            this.objectEnabled = false;
            if(this.actionState == 2)
            {
               this.actionState = 1;
               gotoAndStop(2);
               buttonMode = false;
               this.nametext.text = LangManager.getString(675);
            }
            if(this.actionState == 1)
            {
               --this.counter;
               this.bar.scaleX = this.counter / this.counterMax;
               if(this.counter <= 0)
               {
                  this.actionState = 0;
                  gotoAndStop(1);
                  if(this.side == StatsManager.getSide())
                  {
                     visible = false;
                  }
               }
            }
         }
         if(this.objectEnabled)
         {
            super.showInteractButton(flag);
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(abs(x - mc.x) < 50 && mc.y > StageManager.getGroundY() - 10)
         {
            this.showInteractButton(true);
            return true;
         }
         this.showInteractButton(false);
         return false;
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         if(flag)
         {
            this.counter = this.counterMax;
            this.actionState = 2;
            this.objectEnabled = true;
            gotoAndStop(3);
            buttonMode = true;
            visible = true;
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

