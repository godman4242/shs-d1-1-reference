package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2538")]
   public class Obj_CastleFlag extends TriggeredStageObject
   {
      
      public var progressbar:MovieClip;
      
      public var countdown:TextField;
      
      public var flag:Obj_WarBanner;
      
      internal var castleside:int;
      
      internal var gatesOpened:Boolean;
      
      internal var counter:int = 0;
      
      internal var counterMax:int = 240;
      
      internal var time:int;
      
      public function Obj_CastleFlag(props:String, objname:String)
      {
         var strArray:Array = null;
         super();
         if(objname == "")
         {
            objectName = "castleflag";
         }
         else
         {
            objectName = objname;
         }
         strArray = props.split(",");
         this.castleside = strArray[0];
         if(this.castleside == 0)
         {
            this.castleside = 5;
         }
         this.progressbar.visible = false;
         this.progressbar.nametext.text = LangManager.getString(802);
         this.countdown.visible = false;
         iconID = NodeUI.ACTION_USE;
         this.closeGates();
         var territoryId:int = NodeGenerator.instance.getTerritoryId(StageManager.getCurrentNode());
         QueryManagerPIO.instance.getCastleGateOpened(territoryId,this.callback);
         if(strArray.length > 1 && strArray[1] == "1")
         {
            canInteract = false;
         }
      }
      
      public function callback(time:int) : *
      {
         this.time = time;
         if(QueryManager.instance.getServerTime() - time > 3 * 60 * 60)
         {
            this.closeGates();
         }
         else
         {
            this.openGates();
         }
      }
      
      override public function getDisplayText() : String
      {
         if(StatsManager.getSide() != this.castleside && !this.gatesOpened)
         {
            return LangManager.getString(771);
         }
         return "";
      }
      
      internal function openGates() : *
      {
         if(StatsManager.getSide() == this.castleside)
         {
            this.flag.gotoAndStop(1);
            buttonMode = true;
         }
         else
         {
            if(StatsManager.isCustomClan(StatsManager.getSide()))
            {
               this.flag.gotoAndStop(10);
            }
            else
            {
               this.flag.gotoAndStop(StatsManager.getSide() + 1);
            }
            buttonMode = false;
         }
         this.gatesOpened = true;
         this.progressbar.visible = false;
         this.countdown.visible = true;
         var duration:int = this.time + 3 * 60 * 60 - QueryManager.instance.getServerTime();
         this.countdown.text = this.getTimeString(duration);
      }
      
      internal function closeGates() : *
      {
         if(StatsManager.isCustomClan(this.castleside))
         {
            if(this.castleside == StatsManager.getSide())
            {
               this.flag.gotoAndStop(10);
            }
            else
            {
               this.flag.gotoAndStop(5);
            }
         }
         else
         {
            this.flag.gotoAndStop(this.castleside + 1);
         }
         if(StatsManager.getSide() == this.castleside)
         {
            buttonMode = false;
         }
         else
         {
            buttonMode = true;
         }
         this.gatesOpened = false;
         this.countdown.visible = false;
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         var data:XMLQuestStep = null;
         var mapid:int = 0;
         if(StatsManager.getSide() != this.castleside && !this.gatesOpened)
         {
            if(flag)
            {
               ++this.counter;
               this.progressbar.visible = true;
               this.progressbar.bar.scaleX = this.counter / this.counterMax;
               if(this.counter >= this.counterMax)
               {
                  this.openGates();
                  SoundManager.instance.playGoodKoto();
                  this.time = QueryManager.instance.getServerTime();
                  if(questAction != null)
                  {
                     canInteract = false;
                     data = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
                     Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
                     this.flag.gotoAndStop(8);
                  }
                  else
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(774),LangManager.getString(5));
                     mapid = NodeGenerator.instance.getTerritoryId(StageManager.getCurrentNode());
                     QueryManagerPIO.instance.setCastleGateOpened(mapid);
                     QueryManagerPIO.instance.addWarMessage(mapid,0,0,LangManager.getString(803),LangManager.getString(804,[StatsManager.charname]));
                     if(this.castleside != StatsManager.getSide())
                     {
                        NetworkManager.instance.setObjectState(objectName,true,false);
                     }
                  }
               }
            }
            else if(this.counter > 0)
            {
               --this.counter;
               this.progressbar.bar.scaleX = this.counter / this.counterMax;
               if(this.counter <= 0)
               {
                  this.progressbar.visible = false;
               }
            }
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         var duration:int = 0;
         if(StatsManager.getSide() != this.castleside && !this.gatesOpened)
         {
            if(abs(x - mc.x) < 50 && mc.y > StageManager.getGroundY() - 10)
            {
               this.showInteractButton(true);
               return true;
            }
            this.showInteractButton(false);
            return false;
         }
         if(this.gatesOpened)
         {
            duration = this.time + 3 * 60 * 60 - QueryManager.instance.getServerTime();
            this.countdown.text = this.getTimeString(duration);
            if(duration <= 0)
            {
               this.closeGates();
               OverworldHUD.instance.showDialog(LangManager.getString(773),LangManager.getString(5));
            }
         }
         return false;
      }
      
      internal function getTimeString(secs:int) : String
      {
         var hours:int = Math.floor(secs / (60 * 60));
         var divisor_for_minutes:int = secs % (60 * 60);
         var min:int = Math.floor(divisor_for_minutes / 60);
         var divisor_for_seconds:int = divisor_for_minutes % 60;
         var sec:int = Math.ceil(divisor_for_seconds);
         var secstr:String = sec.toString();
         if(sec < 10)
         {
            secstr = "0" + secstr;
         }
         var minstr:String = min.toString();
         if(min < 10)
         {
            minstr = "0" + minstr;
         }
         return hours + ":" + minstr + ":" + secstr;
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         if(flag)
         {
            this.openGates();
            this.time = QueryManager.instance.getServerTime();
         }
      }
   }
}

