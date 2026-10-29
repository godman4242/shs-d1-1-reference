package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2844")]
   public class §1t8708s0§ extends §1t8688s0§
   {
      
      internal static var §1t12543s0§:int = 3;
      
      internal static var §1t12680s0§:int = 0;
      
      internal static var §1t12681s0§:int = 1;
      
      internal static var §1t12682s0§:int = 2;
      
      internal static var §1t12683s0§:int = 3;
      
      internal var §1t5098s0§:int;
      
      internal var §1t5099s0§:int;
      
      internal var floorY:int = 400;
      
      internal var actionState:int = 0;
      
      internal var velY:Number = 0;
      
      internal var damage:int = 20;
      
      public function §1t8708s0§(param1:int, param2:int, param3:String, param4:String = "")
      {
         super();
         this.props = param3;
         if(param4 == "")
         {
            objectName = "Trap";
         }
         else
         {
            objectName = param4;
         }
         var _loc5_:Array = param3.split(",");
         if(_loc5_.length >= 1)
         {
            onDuration = int(_loc5_[0]);
         }
         if(_loc5_.length >= 2)
         {
            offDuration = int(_loc5_[1]);
         }
         if(_loc5_.length >= 3)
         {
            startInterval = int(_loc5_[2]);
         }
         if(_loc5_.length >= 4)
         {
            active = _loc5_[3] == "1";
         }
         if(_loc5_.length >= 5)
         {
            this.floorY = int(_loc5_[4]);
         }
         if(_loc5_.length >= 6 && _loc5_[5] == "1")
         {
            this.damage = 10000;
         }
         this.§1t5098s0§ = param1;
         this.§1t5099s0§ = param2;
         timeCounter = offDuration - startInterval;
      }
      
      override public function update() : *
      {
         if(!active)
         {
            return;
         }
         if(this.actionState == §1t12681s0§)
         {
            this.velY += §1t12543s0§;
            this.y += this.velY;
            if(this.y >= this.floorY)
            {
               this.actionState = §1t12682s0§;
               timeCounter = 0;
               this.y = this.floorY;
               §1t1525s0§.§1t9960s0§(6);
            }
         }
         else if(this.actionState == §1t12683s0§)
         {
            this.y -= 10;
            if(this.y <= this.§1t5099s0§)
            {
               this.actionState = §1t12680s0§;
               timeCounter = 0;
            }
         }
         else if(offDuration != 1000 && this.actionState == §1t12680s0§)
         {
            ++timeCounter;
            if(timeCounter >= offDuration)
            {
               timeCounter = 0;
               this.velY = 0;
               this.actionState = §1t12681s0§;
            }
         }
         else if(this.actionState == §1t12682s0§)
         {
            ++timeCounter;
            if(timeCounter >= onDuration)
            {
               timeCounter = 0;
               this.actionState = §1t12683s0§;
            }
         }
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(abs(x - param1.x) < 50 && !§1t1523s0§.§1t9586s0§().§1t3292s0§())
         {
            §1t1523s0§.§1t9586s0§().§1t3274s0§(this,new §1t67s0§(this.damage,0,§1t67s0§.§1t9118s0§));
         }
         return false;
      }
      
      override internal function §1t3270s0§() : *
      {
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
      {
         if(param2 && param1 || offDuration == 1000)
         {
            if(this.actionState == §1t12680s0§)
            {
               timeCounter = 0;
               this.velY = 0;
               this.actionState = §1t12681s0§;
               active = true;
            }
         }
         else if(!param2)
         {
            active = !active;
         }
      }
   }
}

