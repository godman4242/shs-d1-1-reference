package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3248")]
   public class §1t8654s0§ extends §1t8624s0§
   {
      
      public var countdown:TextField;
      
      public var flag:§1t8497s0§;
      
      public var progressbar:MovieClip;
      
      internal var castleside:int;
      
      internal var gatesOpened:Boolean;
      
      internal var counter:int = 0;
      
      internal var counterMax:int = 240;
      
      internal var time:int;
      
      public function §1t8654s0§(param1:String, param2:String)
      {
         var _loc3_:Array = null;
         super();
         if(param2 == "")
         {
            objectName = "castleflag";
         }
         else
         {
            objectName = param2;
         }
         _loc3_ = param1.split(",");
         this.castleside = _loc3_[0];
         if(this.castleside == 0)
         {
            this.castleside = 5;
         }
         this.progressbar.visible = false;
         this.progressbar.nametext.text = §1t1521s0§.getString(802);
         this.countdown.visible = false;
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
         this.closeGates();
         var _loc4_:int = §1t70s0§.instance.§1t1134s0§(§1t1525s0§.§1t9935s0§());
         §1t3318s0§.instance.§1t3426s0§(_loc4_,this.callback);
         if(_loc3_.length > 1 && _loc3_[1] == "1")
         {
            §1t8501s0§ = false;
         }
      }
      
      public function callback(param1:int) : *
      {
         this.time = param1;
         if(§1t3317s0§.instance.§1t1847s0§() - param1 > 3 * 60 * 60)
         {
            this.closeGates();
         }
         else
         {
            this.openGates();
         }
      }
      
      override public function §1t6733s0§() : String
      {
         if(§1t1523s0§.§1t7746s0§() != this.castleside && !this.gatesOpened)
         {
            return §1t1521s0§.getString(771);
         }
         return "";
      }
      
      internal function openGates() : *
      {
         if(§1t1523s0§.§1t7746s0§() == this.castleside)
         {
            this.flag.gotoAndStop(1);
            buttonMode = true;
         }
         else
         {
            if(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()))
            {
               this.flag.gotoAndStop(10);
               this.flag.logo.stop();
               §1t3318s0§.instance.§1t3432s0§(§1t1523s0§.§1t7746s0§(),this.§1t1351s0§);
            }
            else
            {
               this.flag.gotoAndStop(§1t1523s0§.§1t7746s0§() + 1);
            }
            buttonMode = false;
         }
         this.gatesOpened = true;
         this.progressbar.visible = false;
         this.countdown.visible = true;
         var _loc1_:int = this.time + 3 * 60 * 60 - §1t3317s0§.instance.§1t1847s0§();
         this.countdown.text = this.§1t937s0§(_loc1_);
      }
      
      internal function closeGates() : *
      {
         if(§1t1523s0§.§1t9663s0§(this.castleside))
         {
            this.flag.gotoAndStop(10);
            this.flag.logo.stop();
            §1t3318s0§.instance.§1t3432s0§(this.castleside,this.§1t1351s0§);
         }
         else
         {
            this.flag.gotoAndStop(this.castleside + 1);
         }
         if(§1t1523s0§.§1t7746s0§() == this.castleside)
         {
            buttonMode = false;
         }
         else
         {
            buttonMode = true;
         }
         this.gatesOpened = false;
         this.countdown.visible = false;
      }
      
      internal function §1t1351s0§(param1:§1t23s0§) : *
      {
         §1t1643s0§.§1t11214s0§(this.flag.color,param1.color);
         this.flag.logo.gotoAndStop(param1.logo);
         §1t1643s0§.§1t11214s0§(this.flag.logo,param1.logocolor);
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         var _loc2_:§1t85s0§ = null;
         var _loc3_:int = 0;
         if(§1t1523s0§.§1t7746s0§() != this.castleside && !this.gatesOpened)
         {
            if(param1)
            {
               ++this.counter;
               this.progressbar.visible = true;
               this.progressbar.bar.scaleX = this.counter / this.counterMax;
               if(this.counter >= this.counterMax)
               {
                  this.openGates();
                  §1t88s0§.instance.§1t1513s0§();
                  this.time = §1t3317s0§.instance.§1t1847s0§();
                  if(§1t8502s0§ != null)
                  {
                     §1t8501s0§ = false;
                     _loc2_ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
                     §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
                     this.flag.gotoAndStop(8);
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(774),§1t1521s0§.getString(5));
                     _loc3_ = §1t70s0§.instance.§1t1134s0§(§1t1525s0§.§1t9935s0§());
                     §1t3318s0§.instance.§1t3427s0§(_loc3_);
                     §1t3318s0§.instance.§1t1909s0§(_loc3_,0,0,§1t1521s0§.getString(803),§1t1521s0§.getString(804,[§1t1523s0§.charname]));
                     if(this.castleside != §1t1523s0§.§1t7746s0§())
                     {
                        §1t251s0§.instance.§1t3540s0§(objectName,true,false);
                     }
                  }
               }
            }
            else if(this.counter > 0)
            {
               --this.counter;
               this.progressbar.bar.scaleX = this.counter / this.counterMax;
               if(this.counter <= 0)
               {
                  this.progressbar.visible = false;
               }
            }
         }
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         var _loc2_:int = 0;
         if(§1t1523s0§.§1t7746s0§() != this.castleside && !this.gatesOpened)
         {
            if(abs(x - param1.x) < 50 && param1.y > §1t1525s0§.§1t4467s0§() - 10)
            {
               this.showInteractButton(true);
               return true;
            }
            this.showInteractButton(false);
            return false;
         }
         if(this.gatesOpened)
         {
            _loc2_ = this.time + 3 * 60 * 60 - §1t3317s0§.instance.§1t1847s0§();
            this.countdown.text = this.§1t937s0§(_loc2_);
            if(_loc2_ <= 0)
            {
               this.closeGates();
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(773),§1t1521s0§.getString(5));
            }
         }
         return false;
      }
      
      internal function §1t937s0§(param1:int) : String
      {
         var _loc2_:int = Math.floor(param1 / (60 * 60));
         var _loc3_:int = param1 % (60 * 60);
         var _loc4_:int = Math.floor(_loc3_ / 60);
         var _loc5_:int = _loc3_ % 60;
         var _loc6_:int = Math.ceil(_loc5_);
         var _loc7_:String = _loc6_.toString();
         if(_loc6_ < 10)
         {
            _loc7_ = "0" + _loc7_;
         }
         var _loc8_:String = _loc4_.toString();
         if(_loc4_ < 10)
         {
            _loc8_ = "0" + _loc8_;
         }
         return _loc2_ + ":" + _loc8_ + ":" + _loc7_;
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
      {
         if(param1)
         {
            this.openGates();
            this.time = §1t3317s0§.instance.§1t1847s0§();
         }
      }
   }
}

