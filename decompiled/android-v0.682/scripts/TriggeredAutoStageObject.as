package
{
   public class TriggeredAutoStageObject extends TriggeredStageObject
   {
      
      internal var startInterval:int = 0;
      
      internal var onDuration:int = 48;
      
      internal var offDuration:int = 48;
      
      internal var timeCounter:int = 0;
      
      internal var onState:Boolean = false;
      
      public function TriggeredAutoStageObject()
      {
         super();
         this.timeCounter = this.offDuration - this.startInterval;
         updateMe = true;
      }
      
      override public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         active = !active;
      }
      
      override public function update() : *
      {
         if(!active)
         {
            return;
         }
         ++this.timeCounter;
         if(this.onState)
         {
            if(this.timeCounter >= this.onDuration)
            {
               this.timeCounter = 0;
               this.onState = false;
            }
         }
         else if(this.timeCounter >= this.offDuration)
         {
            this.timeCounter = 0;
            this.onState = true;
            doAction();
         }
      }
   }
}

