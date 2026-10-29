package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2822")]
   public class §1t8718s0§ extends §1t8688s0§
   {
      
      public var spikes:MovieClip;
      
      internal var xvel:int = 0;
      
      internal var yvel:int = 0;
      
      internal var damage:int = 20;
      
      public function §1t8718s0§(param1:String, param2:String = "")
      {
         var _loc4_:int = 0;
         super();
         addFrameScript(0,this.frame1,11,this.frame12,23,this.frame24);
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Trap";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         if(_loc3_.length >= 1)
         {
            _loc4_ = int(_loc3_[0]);
            if(_loc4_ == 0)
            {
               rotation = 0;
            }
            else if(_loc4_ == 1)
            {
               rotation = 180;
            }
            else if(_loc4_ == 2)
            {
               rotation = 90;
            }
            else if(_loc4_ == 3)
            {
               rotation = 270;
            }
         }
         if(_loc3_.length >= 2)
         {
            onDuration = int(_loc3_[1]);
         }
         if(_loc3_.length >= 3)
         {
            offDuration = int(_loc3_[2]);
         }
         if(_loc3_.length >= 4)
         {
            startInterval = int(_loc3_[3]);
         }
         if(_loc3_.length >= 5)
         {
            active = _loc3_[4] == "1";
         }
         if(_loc3_.length >= 6)
         {
            this.spikes.gotoAndStop(int(_loc3_[5]));
         }
         if(_loc3_.length >= 7 && _loc3_[6] == "1")
         {
            this.damage = 10000;
         }
         gotoAndStop("in");
         timeCounter = offDuration - startInterval;
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
      {
         if(param2 && active)
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
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(currentFrame != 1 && currentFrame <= 12 && abs(x - param1.x) < 50 && !§1t1523s0§.§1t9586s0§().§1t3292s0§())
         {
            §1t1523s0§.§1t9586s0§().§1t3274s0§(this,new §1t67s0§(this.damage,0,§1t67s0§.§1t9118s0§));
         }
         return false;
      }
      
      override internal function §1t3270s0§() : *
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

