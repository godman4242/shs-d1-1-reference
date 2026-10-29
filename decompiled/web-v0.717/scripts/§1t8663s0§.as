package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3185")]
   public class §1t8663s0§ extends §1t8624s0§
   {
      
      public var design1:MovieClip;
      
      public var design2:MovieClip;
      
      internal var objectEnabled:Boolean = false;
      
      internal var §1t8664s0§:int;
      
      internal var destName:String;
      
      internal var doorType:int;
      
      internal var doorDesign:int;
      
      internal var §1t8667s0§:Boolean = false;
      
      internal var §1t8668s0§:int = 150;
      
      internal var §1t8669s0§:int = -1;
      
      internal var §1t8670s0§:String = "";
      
      public function §1t8663s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Door";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         this.doorType = _loc3_[0];
         this.§1t8664s0§ = _loc3_[1];
         if(_loc3_.length > 2)
         {
            this.§1t8668s0§ = int(_loc3_[2]);
         }
         if(_loc3_.length > 3)
         {
            this.§1t8669s0§ = int(_loc3_[3]);
         }
         if(_loc3_.length > 4 && _loc3_[4] == "1")
         {
            this.triggerObject(true,false);
         }
         if(_loc3_.length > 5 && _loc3_[5] == "1")
         {
            this.§1t8667s0§ = true;
         }
         this.destName = §1t1525s0§.§1t1382s0§(this.§1t8664s0§,this.§1t8669s0§);
         if(this.doorType == 0)
         {
            gotoAndStop(1);
         }
         else if(this.doorType == 1)
         {
            gotoAndStop(3);
         }
         else if(this.doorType == 2)
         {
            gotoAndStop(5);
            this.doorDesign = §1t58s0§.random(5,§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21)) + 1;
            this.design1.gotoAndStop(this.doorDesign);
            this.design2.gotoAndStop(this.doorDesign);
         }
         §1t8503s0§ = §1t407s0§.§1t12439s0§;
         buttonMode = true;
      }
      
      override public function needTransition() : Boolean
      {
         if(props != "-1" && §1t1523s0§.§1t9480s0§)
         {
            return false;
         }
         return this.objectEnabled;
      }
      
      override public function §1t8523s0§() : *
      {
         var _loc1_:int = 0;
         if(this.§1t8667s0§)
         {
            if(this.objectEnabled)
            {
               §1t406s0§.instance.§1t6504s0§.show(§1t5313s0§.§1t12348s0§,this.§1t8671s0§);
            }
         }
         else if(this.needTransition())
         {
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         }
         else
         {
            this.interact();
            _loc1_ = §1t1525s0§.§1t9923s0§();
            if(!§1t3317s0§.instance.§1t1833s0§ && (_loc1_ == §1t134s0§.§1t9232s0§ || _loc1_ == §1t134s0§.§1t9233s0§ || _loc1_ == §1t134s0§.§1t9234s0§ || _loc1_ == §1t134s0§.§1t9236s0§ || _loc1_ == §1t134s0§.§1t9237s0§))
            {
               §1t406s0§.instance.§1t6496s0§.§1t5149s0§ = true;
               §1t1540s0§.§1t10035s0§(§1t1040s0§.§1t12376s0§);
            }
         }
      }
      
      override public function interact() : *
      {
         if(this.objectEnabled)
         {
            if(props == "-1")
            {
               §1t1540s0§.§1t9895s0§();
               §1t251s0§.§1t9190s0§().§1t3521s0§();
            }
            else if(this.§1t8667s0§)
            {
               §1t1525s0§.§1t9922s0§(this.§1t8664s0§,this.§1t8668s0§,this.§1t8669s0§,-1,false,this.§1t8670s0§);
            }
            else
            {
               §1t1525s0§.§1t9922s0§(this.§1t8664s0§,this.§1t8668s0§,this.§1t8669s0§);
            }
         }
      }
      
      public function §1t8671s0§(param1:String) : *
      {
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         this.§1t8670s0§ = "instance_" + param1;
      }
      
      override public function §1t6733s0§() : String
      {
         if(this.objectEnabled)
         {
            if(props == "-1")
            {
               return §1t1521s0§.getString(146);
            }
            return §1t1521s0§.getString(192,[this.destName]);
         }
         return "";
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
      {
         if(param1 != this.objectEnabled)
         {
            this.objectEnabled = param1;
            if(this.objectEnabled)
            {
               if(this.doorType == 0)
               {
                  gotoAndStop(2);
               }
               else if(this.doorType == 1)
               {
                  gotoAndStop(4);
               }
               else if(this.doorType == 2)
               {
                  gotoAndStop(6);
                  this.design1.gotoAndStop(this.doorDesign);
                  this.design2.gotoAndStop(this.doorDesign);
               }
            }
            else if(this.doorType == 0)
            {
               gotoAndStop(1);
            }
            else if(this.doorType == 1)
            {
               gotoAndStop(3);
            }
            else if(this.doorType == 2)
            {
               gotoAndStop(5);
               this.design1.gotoAndStop(this.doorDesign);
               this.design2.gotoAndStop(this.doorDesign);
            }
         }
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
         if(this.doorType == 0)
         {
            x += param1 / 2;
         }
         else
         {
            x += param1;
         }
      }
      
      override public function §1t8512s0§() : *
      {
         return true;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 50;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

