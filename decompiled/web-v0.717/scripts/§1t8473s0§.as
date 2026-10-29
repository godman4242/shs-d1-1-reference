package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3172")]
   public class §1t8473s0§ extends StageObject
   {
      
      public var base:MovieClip;
      
      public var design1:MovieClip;
      
      public var design2:MovieClip;
      
      public function §1t8473s0§(param1:String)
      {
         var _loc3_:int = 0;
         super();
         var _loc2_:Array = param1.split(",");
         if(param1 == "")
         {
            gotoAndStop(1);
         }
         else if(int(_loc2_[0]) == §1t112s0§.§1t12569s0§)
         {
            gotoAndStop(11);
         }
         else if(int(_loc2_[0]) == §1t112s0§.§1t12563s0§)
         {
            gotoAndStop(4);
         }
         else if(int(_loc2_[0]) == §1t112s0§.§1t12588s0§)
         {
            gotoAndStop(41);
            _loc3_ = §1t58s0§.random(5,§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21)) + 1;
            this.design1.gotoAndStop(_loc3_);
            this.design2.gotoAndStop(_loc3_);
         }
         else if(int(_loc2_[0]) == 42)
         {
            gotoAndStop(42);
            _loc3_ = §1t58s0§.random(5,§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21)) + 1;
            this.design1.gotoAndStop(_loc3_);
            this.design2.gotoAndStop(_loc3_);
         }
         else
         {
            gotoAndStop(1);
         }
         if(_loc2_.length == 2 && currentFrame == 1)
         {
            §1t1643s0§.§1t11227s0§(this.base,0.1,int(_loc2_[1]));
         }
         §1t1643s0§.blur(this,2);
      }
   }
}

