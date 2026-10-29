package
{
   public class §1t8688s0§ extends §1t8624s0§
   {
      
      internal var startInterval:int = 0;
      
      internal var onDuration:int = 48;
      
      internal var offDuration:int = 48;
      
      internal var timeCounter:int = 0;
      
      internal var onState:Boolean = false;
      
      public function §1t8688s0§()
      {
         super();
         this.timeCounter = this.offDuration - this.startInterval;
         §1t8160s0§ = true;
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
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
            §1t3270s0§();
         }
      }
   }
}

