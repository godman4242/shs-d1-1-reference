package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3245")]
   public class §1t8577s0§ extends §1t399s0§
   {
      
      public var hotspot:RedBG;
      
      internal var dest:int;
      
      internal var destpos:int;
      
      internal var side:int;
      
      internal var opened:Boolean = false;
      
      internal var destName:String;
      
      public function §1t8577s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         if(param2 == "")
         {
            objectName = "castlegate";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         this.dest = int(_loc3_[0]);
         this.destpos = int(_loc3_[1]);
         this.side = int(_loc3_[2]);
         this.hotspot.alpha = 0;
         this.hotspot.buttonMode = true;
         this.destName = §1t1525s0§.§1t1382s0§(this.dest,-1);
         this.closeGates();
         var _loc4_:int = §1t70s0§.instance.§1t1134s0§(§1t1525s0§.§1t9935s0§());
         §1t3318s0§.instance.§1t3426s0§(_loc4_,this.callback);
      }
      
      public function callback(param1:int) : *
      {
         if(§1t3317s0§.instance.§1t1847s0§() - param1 > 3 * 60 * 60)
         {
            this.closeGates();
         }
         else
         {
            this.openGates();
         }
      }
      
      internal function openGates() : *
      {
         this.opened = true;
         §1t8503s0§ = §1t407s0§.§1t12439s0§;
         gotoAndStop(2);
      }
      
      internal function closeGates() : *
      {
         this.opened = false;
         if(this.side == §1t1523s0§.§1t7746s0§())
         {
            §1t8503s0§ = §1t407s0§.§1t12439s0§;
         }
         else
         {
            §1t8503s0§ = §1t407s0§.§1t12443s0§;
         }
         gotoAndStop(1);
      }
      
      override public function needTransition() : Boolean
      {
         return this.opened || this.side == §1t1523s0§.§1t7746s0§();
      }
      
      override public function §1t8523s0§() : *
      {
         if(this.needTransition())
         {
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(677),§1t1521s0§.getString(5));
         }
      }
      
      override public function interact() : *
      {
         if(this.needTransition())
         {
            §1t1525s0§.§1t9922s0§(this.dest,this.destpos);
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(677),§1t1521s0§.getString(5));
         }
      }
      
      override public function §1t6733s0§() : String
      {
         if(this.needTransition())
         {
            return §1t1521s0§.getString(141) + " " + this.destName;
         }
         return §1t1521s0§.getString(770);
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
         x += param1 / 3;
      }
      
      override public function §1t8524s0§(param1:int, param2:int) : Boolean
      {
         return this.hotspot.hitTestPoint(param1,param2);
      }
      
      override public function §1t8525s0§() : Boolean
      {
         return true;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

