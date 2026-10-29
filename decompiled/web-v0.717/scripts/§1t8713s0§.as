package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2833")]
   public class §1t8713s0§ extends §1t8688s0§
   {
      
      internal var xvel:int = 0;
      
      internal var yvel:int = 0;
      
      internal var §1t5098s0§:int;
      
      internal var §1t5099s0§:int;
      
      internal var damage:int = 20;
      
      public function §1t8713s0§(param1:int, param2:int, param3:String, param4:String = "")
      {
         var _loc6_:int = 0;
         super();
         addFrameScript(0,this.frame1,7,this.frame8,14,this.frame15);
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
         if(_loc5_.legnth >= 1)
         {
            _loc6_ = int(_loc5_[0]);
            if(_loc6_ == 0)
            {
               rotation = 0;
            }
            else if(_loc6_ == 1)
            {
               rotation = 180;
            }
            else if(_loc6_ == 2)
            {
               rotation = 90;
            }
            else if(_loc6_ == 3)
            {
               rotation = 270;
            }
         }
         if(_loc5_.length >= 2)
         {
            onDuration = int(_loc5_[1]);
         }
         if(_loc5_.length >= 3)
         {
            offDuration = int(_loc5_[2]);
         }
         if(_loc5_.length >= 4)
         {
            startInterval = int(_loc5_[3]);
         }
         if(_loc5_.length >= 5)
         {
            active = _loc5_[4] == "1";
         }
         if(_loc5_.length >= 6)
         {
            this.xvel = int(_loc5_[5]);
         }
         if(_loc5_.length >= 7)
         {
            this.yvel = int(_loc5_[6]);
         }
         if(_loc5_.length >= 8 && _loc5_[7] == "1")
         {
            this.damage = 10000;
         }
         this.§1t5098s0§ = param1;
         this.§1t5099s0§ = param2;
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
            this.x = this.§1t5098s0§ - §1t1525s0§.§1t8131s0§();
            this.y = this.§1t5099s0§;
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
            this.x = this.§1t5098s0§ - §1t1525s0§.§1t8131s0§();
            this.y = this.§1t5099s0§;
            gotoAndPlay("moveout");
         }
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(currentLabel == "out" && abs(x - param1.x) < 50 && !§1t1523s0§.§1t9586s0§().§1t3292s0§())
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

