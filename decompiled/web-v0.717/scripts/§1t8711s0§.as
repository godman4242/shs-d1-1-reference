package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2840")]
   public class §1t8711s0§ extends §1t8688s0§
   {
      
      internal var xvel:int = 1;
      
      internal var elementType:int = 0;
      
      public function §1t8711s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
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
            this.xvel = int(_loc3_[0]);
         }
         if(_loc3_.length >= 2)
         {
            this.elementType = int(_loc3_[1]);
         }
         if(_loc3_.length >= 3)
         {
            onDuration = int(_loc3_[2]);
         }
         if(_loc3_.length >= 4)
         {
            offDuration = int(_loc3_[3]);
         }
         if(_loc3_.length >= 5)
         {
            startInterval = int(_loc3_[4]);
         }
         if(_loc3_.length >= 6)
         {
            active = _loc3_[5] == "1";
         }
         timeCounter = offDuration - startInterval;
         if(this.elementType == 2 || this.elementType == 3)
         {
            gotoAndStop(2);
         }
         if(this.xvel == 1)
         {
            scaleX = 1;
         }
         else
         {
            scaleX = -1;
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = -55;
         var _loc3_:int = 20;
         if(this.elementType == 0)
         {
            _loc1_ = §1t1712s0§.§1t11278s0§;
         }
         else if(this.elementType == 1)
         {
            _loc1_ = §1t1712s0§.§1t11290s0§;
         }
         else if(this.elementType == 2)
         {
            _loc1_ = §1t1712s0§.§1t11291s0§;
            _loc2_ = 0;
         }
         else if(this.elementType == 3)
         {
            _loc1_ = §1t1712s0§.§1t11289s0§;
            _loc2_ = 0;
         }
         var _loc4_:int = §1t1525s0§.§1t9940s0§().§1t8131s0§();
         if(this.xvel == 1)
         {
            §1t1712s0§.§1t4568s0§(_loc1_,x + _loc3_ + _loc4_,y + _loc2_,1,0,20,1,null);
         }
         else
         {
            §1t1712s0§.§1t4568s0§(_loc1_,x - _loc3_ + _loc4_,y + _loc2_,-1,0,20,1,null);
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

