package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3094")]
   public class §1t8674s0§ extends §1t8624s0§
   {
      
      public var bar:MovieClip;
      
      public var nametext:TextField;
      
      internal var dest:int;
      
      internal var destpos:int;
      
      internal var destName:String;
      
      internal var side:int;
      
      internal var counter:int = 0;
      
      internal var counterMax:int = 240;
      
      internal var actionState:int = 0;
      
      internal var objectEnabled:Boolean = false;
      
      internal var forceObjectEnabled:Boolean = false;
      
      public function §1t8674s0§(param1:int, param2:int, param3:String, param4:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         this.props = param3;
         if(param4 == "")
         {
            objectName = "ladderpoint";
         }
         else
         {
            objectName = param4;
         }
         var _loc5_:Array = param3.split(",");
         this.dest = _loc5_[0];
         this.destpos = _loc5_[1];
         this.side = _loc5_[2];
         if(_loc5_.length == 4)
         {
            this.forceObjectEnabled = _loc5_[3] == "1";
         }
         if(this.forceObjectEnabled)
         {
            gotoAndStop(3);
            this.objectEnabled = true;
         }
         this.destName = §1t1525s0§.§1t1382s0§(this.dest,-1);
         §1t8503s0§ = §1t407s0§.§1t12439s0§;
         if(this.side == §1t1523s0§.§1t7746s0§())
         {
            visible = false;
         }
      }
      
      override public function needTransition() : Boolean
      {
         return this.objectEnabled;
      }
      
      override public function §1t8523s0§() : *
      {
         if(this.needTransition())
         {
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         }
      }
      
      override public function interact() : *
      {
         if(this.objectEnabled)
         {
            §1t1525s0§.§1t9922s0§(this.dest,this.destpos);
         }
      }
      
      override public function §1t6733s0§() : String
      {
         if(this.objectEnabled)
         {
            return §1t1521s0§.getString(141) + " " + this.destName;
         }
         if(this.side == §1t1523s0§.§1t7746s0§())
         {
            return "";
         }
         return §1t1521s0§.getString(772);
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
         x += param1 / 3;
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(§1t1541s0§.§1t10100s0§() && !§1t126s0§.instance.§1t1700s0§())
         {
            return;
         }
         if(this.forceObjectEnabled)
         {
            super.showInteractButton(param1);
            return;
         }
         if(param1)
         {
            if(this.actionState == 0)
            {
               this.actionState = 1;
               gotoAndStop(2);
               this.nametext.text = §1t1521s0§.getString(675);
            }
            if(this.actionState == 1)
            {
               ++this.counter;
               this.bar.scaleX = this.counter / this.counterMax;
               if(this.counter >= this.counterMax)
               {
                  this.actionState = 2;
                  this.objectEnabled = true;
                  gotoAndStop(3);
                  buttonMode = true;
                  if(this.side != §1t1523s0§.§1t7746s0§())
                  {
                     §1t251s0§.instance.§1t3540s0§(objectName,true,false);
                  }
               }
            }
         }
         else
         {
            this.objectEnabled = false;
            if(this.actionState == 2)
            {
               this.actionState = 1;
               gotoAndStop(2);
               buttonMode = false;
               this.nametext.text = §1t1521s0§.getString(675);
            }
            if(this.actionState == 1)
            {
               --this.counter;
               this.bar.scaleX = this.counter / this.counterMax;
               if(this.counter <= 0)
               {
                  this.actionState = 0;
                  gotoAndStop(1);
                  if(this.side == §1t1523s0§.§1t7746s0§())
                  {
                     visible = false;
                  }
               }
            }
         }
         if(this.objectEnabled)
         {
            super.showInteractButton(param1);
         }
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(abs(x - param1.x) < 50 && param1.y > §1t1525s0§.§1t4467s0§() - 10)
         {
            this.showInteractButton(true);
            return true;
         }
         this.showInteractButton(false);
         return false;
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
      {
         if(param1)
         {
            this.counter = this.counterMax;
            this.actionState = 2;
            this.objectEnabled = true;
            gotoAndStop(3);
            buttonMode = true;
            visible = true;
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

