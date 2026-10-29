package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2140")]
   public class Trap_SawBladesAuto extends TriggeredAutoStageObject
   {
      
      internal var xvel:int = 0;
      
      internal var yvel:int = 0;
      
      internal var startX:int;
      
      internal var startY:int;
      
      internal var damage:int = 20;
      
      public function Trap_SawBladesAuto(objX:int, objY:int, props:String, objname:String = "")
      {
         var dir:int = 0;
         super();
         addFrameScript(0,this.frame1,7,this.frame8,14,this.frame15);
         this.props = props;
         if(objname == "")
         {
            objectName = "Trap";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         if(strArray.legnth >= 1)
         {
            dir = int(strArray[0]);
            if(dir == 0)
            {
               rotation = 0;
            }
            else if(dir == 1)
            {
               rotation = 180;
            }
            else if(dir == 2)
            {
               rotation = 90;
            }
            else if(dir == 3)
            {
               rotation = 270;
            }
         }
         if(strArray.length >= 2)
         {
            onDuration = int(strArray[1]);
         }
         if(strArray.length >= 3)
         {
            offDuration = int(strArray[2]);
         }
         if(strArray.length >= 4)
         {
            startInterval = int(strArray[3]);
         }
         if(strArray.length >= 5)
         {
            active = strArray[4] == "1";
         }
         if(strArray.length >= 6)
         {
            this.xvel = int(strArray[5]);
         }
         if(strArray.length >= 7)
         {
            this.yvel = int(strArray[6]);
         }
         if(strArray.length >= 8 && strArray[7] == "1")
         {
            this.damage = 10000;
         }
         this.startX = objX;
         this.startY = objY;
         gotoAndStop("in");
         timeCounter = offDuration - startInterval;
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         if(isFloorSwitch && active)
         {
            return;
         }
         active = !active;
         if(active)
         {
            this.x = this.startX - StageManager.getStagePosition();
            this.y = this.startY;
            gotoAndPlay("moveout");
         }
         else
         {
            gotoAndPlay("movein");
         }
         timeCounter = 0;
      }
      
      override public function update() : *
      {
         if(!active)
         {
            return false;
         }
         ++timeCounter;
         if(onState)
         {
            if(currentLabel == "out")
            {
               if(this.xvel != 0)
               {
                  this.x += this.xvel;
               }
               if(this.yvel != 0)
               {
                  this.y += this.yvel;
               }
            }
            if(timeCounter >= onDuration)
            {
               timeCounter = 0;
               onState = false;
               gotoAndPlay("movein");
            }
         }
         else if(timeCounter >= offDuration)
         {
            timeCounter = 0;
            onState = true;
            this.x = this.startX - StageManager.getStagePosition();
            this.y = this.startY;
            gotoAndPlay("moveout");
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(currentLabel == "out" && abs(x - mc.x) < 50 && !StatsManager.getPlayer().isDowned())
         {
            StatsManager.getPlayer().checkHitObject(this,new Damage(this.damage,0,Damage.LAUNCH_KNOCKDOWN));
         }
         return false;
      }
      
      override internal function doAction() : *
      {
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame8() : *
      {
         stop();
      }
      
      internal function frame15() : *
      {
         stop();
      }
   }
}

