package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2129")]
   public class Trap_SpikesAuto extends TriggeredAutoStageObject
   {
      
      public var spikes:MovieClip;
      
      internal var xvel:int = 0;
      
      internal var yvel:int = 0;
      
      internal var damage:int = 20;
      
      public function Trap_SpikesAuto(props:String, objname:String = "")
      {
         var dir:int = 0;
         super();
         addFrameScript(0,this.frame1,11,this.frame12,23,this.frame24);
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
         if(strArray.length >= 1)
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
            this.spikes.gotoAndStop(int(strArray[5]));
         }
         if(strArray.length >= 7 && strArray[6] == "1")
         {
            this.damage = 10000;
         }
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
            onState = true;
            gotoAndPlay("moveout");
         }
         else
         {
            onState = false;
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
            gotoAndPlay("moveout");
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(currentFrame != 1 && currentFrame <= 12 && abs(x - mc.x) < 50 && !StatsManager.getPlayer().isDowned())
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
      
      internal function frame12() : *
      {
         stop();
      }
      
      internal function frame24() : *
      {
         stop();
      }
   }
}

