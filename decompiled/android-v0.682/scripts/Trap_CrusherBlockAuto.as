package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2151")]
   public class Trap_CrusherBlockAuto extends TriggeredAutoStageObject
   {
      
      internal static var GRAVITY:int = 3;
      
      internal static var STATE_UP:int = 0;
      
      internal static var STATE_FALLING:int = 1;
      
      internal static var STATE_DOWN:int = 2;
      
      internal static var STATE_RISING:int = 3;
      
      internal var startX:int;
      
      internal var startY:int;
      
      internal var floorY:int = 400;
      
      internal var actionState:int = 0;
      
      internal var velY:Number = 0;
      
      internal var damage:int = 20;
      
      public function Trap_CrusherBlockAuto(objX:int, objY:int, props:String, objname:String = "")
      {
         super();
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
            onDuration = int(strArray[0]);
         }
         if(strArray.length >= 2)
         {
            offDuration = int(strArray[1]);
         }
         if(strArray.length >= 3)
         {
            startInterval = int(strArray[2]);
         }
         if(strArray.length >= 4)
         {
            active = strArray[3] == "1";
         }
         if(strArray.length >= 5)
         {
            this.floorY = int(strArray[4]);
         }
         if(strArray.length >= 6 && strArray[5] == "1")
         {
            this.damage = 10000;
         }
         this.startX = objX;
         this.startY = objY;
         timeCounter = offDuration - startInterval;
      }
      
      override public function update() : *
      {
         if(!active)
         {
            return;
         }
         if(this.actionState == STATE_FALLING)
         {
            this.velY += GRAVITY;
            this.y += this.velY;
            if(this.y >= this.floorY)
            {
               this.actionState = STATE_DOWN;
               timeCounter = 0;
               this.y = this.floorY;
               StageManager.startShake(6);
            }
         }
         else if(this.actionState == STATE_RISING)
         {
            this.y -= 10;
            if(this.y <= this.startY)
            {
               this.actionState = STATE_UP;
               timeCounter = 0;
            }
         }
         else if(offDuration != 1000 && this.actionState == STATE_UP)
         {
            ++timeCounter;
            if(timeCounter >= offDuration)
            {
               timeCounter = 0;
               this.velY = 0;
               this.actionState = STATE_FALLING;
            }
         }
         else if(this.actionState == STATE_DOWN)
         {
            ++timeCounter;
            if(timeCounter >= onDuration)
            {
               timeCounter = 0;
               this.actionState = STATE_RISING;
            }
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         if(abs(x - mc.x) < 50 && !StatsManager.getPlayer().isDowned())
         {
            StatsManager.getPlayer().checkHitObject(this,new Damage(this.damage,0,Damage.LAUNCH_KNOCKDOWN));
         }
         return false;
      }
      
      override internal function doAction() : *
      {
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         if(isFloorSwitch && flag || offDuration == 1000)
         {
            if(this.actionState == STATE_UP)
            {
               timeCounter = 0;
               this.velY = 0;
               this.actionState = STATE_FALLING;
               active = true;
            }
         }
         else if(!isFloorSwitch)
         {
            active = !active;
         }
      }
   }
}

