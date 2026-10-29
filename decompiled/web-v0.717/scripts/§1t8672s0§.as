package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3113")]
   public class §1t8672s0§ extends §1t8624s0§
   {
      
      internal var targetList:Array;
      
      public function §1t8672s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Floor Switch";
         }
         else
         {
            objectName = param2;
         }
         if(param1 == "0")
         {
            active = false;
            gotoAndStop(2);
         }
      }
      
      override public function §1t6733s0§() : String
      {
         return "";
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         var _loc2_:Array = null;
         var _loc3_:§1t399s0§ = null;
         var _loc4_:int = 0;
         if(param1 == shown)
         {
            return;
         }
         if(this.targetList == null)
         {
            this.targetList = new Array();
            _loc2_ = props.split(",");
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc3_ = §1t1525s0§.§1t9940s0§().§1t8146s0§(_loc2_[_loc4_]);
               if(_loc3_ != null)
               {
                  this.targetList.push(§1t8624s0§(_loc3_));
               }
               _loc4_++;
            }
         }
         _loc4_ = 0;
         while(_loc4_ < this.targetList.length)
         {
            this.targetList[_loc4_].triggerObject(param1,true);
            _loc4_++;
         }
         if(param1)
         {
            gotoAndStop(2);
            shown = true;
         }
         else
         {
            gotoAndStop(1);
            shown = false;
         }
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         var _loc4_:§1t75s0§ = null;
         if(!active || param1 == null)
         {
            return false;
         }
         if(abs(x - param1.x) < 50 && param1.y > §1t1525s0§.§1t4467s0§() - 10)
         {
            return true;
         }
         var _loc2_:Vector.<§1t68s0§> = §1t1543s0§.§1t10227s0§();
         var _loc3_:int = int(_loc2_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _loc2_[_loc5_].§1t1559s0§();
            if(_loc4_ != null && abs(x - _loc4_.x) < 50)
            {
               return true;
            }
            _loc5_++;
         }
         this.showInteractButton(false);
         return false;
      }
      
      override public function §1t8512s0§() : *
      {
         return false;
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
      {
         active = !active;
         if(active)
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(2);
         }
         shown = false;
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

