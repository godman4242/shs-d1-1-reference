package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3088")]
   public class §1t8676s0§ extends §1t8624s0§
   {
      
      internal var targetList:Array;
      
      internal var isOn:Boolean = false;
      
      internal var enabledState:String = "";
      
      internal var §1t1748s0§:String;
      
      public function §1t8676s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Lever Switch";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         this.§1t1748s0§ = _loc3_[0];
         if(_loc3_.length > 1)
         {
            this.enabledState = _loc3_[1];
         }
         if(this.enabledState == "1")
         {
            this.isOn = true;
            gotoAndStop(2);
         }
         else if(this.enabledState == "2")
         {
            this.isOn = true;
            §1t8501s0§ = false;
            gotoAndStop(2);
            buttonMode = false;
         }
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
      }
      
      override public function interact() : *
      {
         this.doStuff();
         §1t251s0§.instance.§1t3540s0§(objectName,this.isOn,false);
         if(this.enabledState == "0" || this.enabledState == "")
         {
            §1t1525s0§.§1t9927s0§(objectName);
            §1t8501s0§ = false;
         }
         else if(this.enabledState == "1")
         {
            §1t8501s0§ = false;
         }
         else if(this.enabledState == "2")
         {
            §1t8501s0§ = false;
         }
         else if(this.enabledState != "3")
         {
            if(this.enabledState == "4")
            {
               §1t8501s0§ = false;
            }
            else if(this.enabledState == "5")
            {
               §1t1525s0§.§1t9927s0§(objectName);
               §1t1523s0§.§1t9669s0§();
               §1t406s0§.instance.§1t6440s0§.§1t6344s0§();
               §1t8501s0§ = false;
               if(§1t1523s0§.§1t9668s0§())
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(678),§1t1521s0§.getString(5));
                  §1t88s0§.instance.§1t1513s0§();
               }
            }
         }
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
      {
         this.isOn = !param1;
         this.doStuff();
      }
      
      internal function doStuff() : *
      {
         var _loc1_:Array = null;
         var _loc2_:§1t399s0§ = null;
         var _loc3_:int = 0;
         if(this.targetList == null)
         {
            this.targetList = new Array();
            _loc1_ = this.§1t1748s0§.split("|");
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               _loc2_ = §1t1525s0§.§1t9940s0§().§1t8146s0§(_loc1_[_loc3_]);
               if(_loc2_ != null)
               {
                  this.targetList.push(§1t8624s0§(_loc2_));
               }
               _loc3_++;
            }
         }
         _loc3_ = 0;
         while(_loc3_ < this.targetList.length)
         {
            this.targetList[_loc3_].triggerObject(!this.isOn,false);
            _loc3_++;
         }
         if(!this.isOn)
         {
            gotoAndStop(2);
            this.isOn = true;
         }
         else
         {
            gotoAndStop(1);
            this.isOn = false;
         }
      }
      
      override public function §1t6733s0§() : String
      {
         return "Pull Lever";
      }
      
      override public function §1t8512s0§() : *
      {
         return true;
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            if(§1t8502s0§ != null)
            {
               §1t406s0§.instance.§1t6574s0§().§1t6390s0§(this,§1t8502s0§.title,§1t8502s0§.§1t1105s0§,§1t8502s0§.type,§1t8502s0§.id,§1t8502s0§.§1t1103s0§,§1t8502s0§.ap);
            }
            else
            {
               §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,§1t8503s0§);
            }
            shown = true;
         }
         else if(!param1 && shown)
         {
            shown = false;
         }
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 50;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

