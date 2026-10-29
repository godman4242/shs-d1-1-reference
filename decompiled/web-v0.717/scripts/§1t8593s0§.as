package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3158")]
   public class §1t8593s0§ extends §1t399s0§
   {
      
      public var base:MovieClip;
      
      internal var objectEnabled:Boolean = false;
      
      internal var dest:int;
      
      internal var destName:String;
      
      internal var compassDir:int = -1;
      
      internal var color:int = 0;
      
      public function §1t8593s0§(param1:String, param2:String = "")
      {
         var _loc4_:int = 0;
         super();
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
         this.dest = _loc3_[0];
         if(_loc3_.length >= 3)
         {
            this.destName = §1t1525s0§.§1t1382s0§(this.dest,int(_loc3_[2]));
         }
         else
         {
            this.destName = §1t1525s0§.§1t1382s0§(this.dest,-1);
         }
         if(_loc3_.length >= 4 && _loc3_[3] == "0")
         {
            visible = false;
         }
         if(_loc3_.length >= 6)
         {
            this.compassDir = _loc3_[4];
         }
         if(_loc3_.length >= 7)
         {
            _loc4_ = int(_loc3_[6]) * 10 + 1;
            gotoAndStop(_loc4_);
         }
         if(_loc3_.length >= 8)
         {
            this.color = int(_loc3_[7]);
            if(this.color != 0 && (_loc4_ == 1 || _loc4_ == 2 || _loc4_ == 21 || _loc4_ == 22))
            {
               §1t1643s0§.§1t11227s0§(this.base,0.1,this.color);
            }
         }
         if(_loc3_.length >= 9 && _loc3_[8] == "1")
         {
            this.§1t8519s0§(true);
         }
         if(!this.objectEnabled && §1t1523s0§.§1t9668s0§() && (_loc4_ == 21 || _loc4_ == 31 || _loc4_ == 51))
         {
            §1t1523s0§.§1t9670s0§();
            this.§1t8519s0§(true);
         }
         if(this.dest == -1)
         {
            §1t8503s0§ = §1t407s0§.§1t12446s0§;
         }
         else
         {
            §1t8503s0§ = §1t407s0§.§1t12439s0§;
         }
         buttonMode = true;
         stop();
         §1t1643s0§.blur(this,2);
      }
      
      override public function needTransition() : Boolean
      {
         if(§1t1523s0§.§1t9480s0§)
         {
            return false;
         }
         return this.objectEnabled;
      }
      
      override public function §1t8523s0§() : *
      {
         var _loc1_:int = 0;
         if(this.needTransition())
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
         var _loc1_:Array = null;
         if(this.objectEnabled)
         {
            _loc1_ = props.split(",");
            if(props == "-1")
            {
               §1t1540s0§.§1t9895s0§();
               §1t251s0§.§1t9190s0§().§1t3521s0§();
            }
            else if(_loc1_.length > 3)
            {
               §1t1525s0§.§1t9922s0§(this.dest,int(_loc1_[1]),int(_loc1_[2]),this.compassDir);
            }
            else if(_loc1_.length == 3)
            {
               §1t1525s0§.§1t9922s0§(this.dest,int(_loc1_[1]),int(_loc1_[2]));
            }
            else if(_loc1_.length == 2)
            {
               §1t1525s0§.§1t9922s0§(this.dest,int(_loc1_[1]));
            }
            else
            {
               §1t1525s0§.§1t9922s0§(this.dest);
            }
         }
         else if(§1t1523s0§.§1t9664s0§())
         {
            §1t1523s0§.§1t9666s0§();
            §1t406s0§.instance.§1t6440s0§.§1t6345s0§();
            §1t406s0§.instance.§1t6578s0§();
            this.§1t8519s0§(true);
         }
         else if(currentFrame == 21 || currentFrame == 31 || currentFrame == 51)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(677),§1t1521s0§.getString(5));
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(429),§1t1521s0§.getString(5));
         }
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
         if(§1t1523s0§.§1t9664s0§())
         {
            return §1t1521s0§.getString(430);
         }
         if(§1t1523s0§.§1t9668s0§())
         {
            return §1t1521s0§.getString(430);
         }
         return §1t1521s0§.getString(187);
      }
      
      override public function §1t8519s0§(param1:Boolean) : *
      {
         if(param1 != this.objectEnabled)
         {
            this.objectEnabled = param1;
            if(this.objectEnabled)
            {
               if(currentFrame == 1)
               {
                  gotoAndStop(2);
               }
               else if(currentFrame == 11)
               {
                  gotoAndStop(12);
               }
               else if(currentFrame == 21)
               {
                  gotoAndStop(22);
               }
               else if(currentFrame == 31)
               {
                  gotoAndStop(32);
               }
               else if(currentFrame == 41)
               {
                  gotoAndStop(42);
               }
               else if(currentFrame == 51)
               {
                  gotoAndStop(52);
               }
               §1t1525s0§.§1t9927s0§(objectName);
            }
            else if(currentFrame == 2)
            {
               gotoAndStop(1);
            }
            else if(currentFrame == 12)
            {
               gotoAndStop(11);
            }
            else if(currentFrame == 22)
            {
               gotoAndStop(21);
            }
            else if(currentFrame == 32)
            {
               gotoAndStop(31);
            }
            else if(currentFrame == 42)
            {
               gotoAndStop(41);
            }
            else if(currentFrame == 52)
            {
               gotoAndStop(51);
            }
            if(this.color != 0 && (currentFrame == 1 || currentFrame == 2 || currentFrame == 21 || currentFrame == 22))
            {
               §1t1643s0§.§1t11227s0§(this.base,0.1,this.color);
            }
         }
      }
      
      override public function §1t8512s0§() : *
      {
         return currentFrame == 2 || currentFrame == 12 || currentFrame == 22 || currentFrame == 32 || currentFrame == 42 || currentFrame == 52;
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
         if(this.§1t8164s0§())
         {
            x += param1 / 2;
         }
         else
         {
            x += param1;
         }
      }
      
      override public function §1t8164s0§() : Boolean
      {
         return currentFrame > 40;
      }
   }
}

