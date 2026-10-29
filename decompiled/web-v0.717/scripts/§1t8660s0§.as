package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3229")]
   public class §1t8660s0§ extends §1t8624s0§
   {
      
      public var flag:§1t8497s0§;
      
      public var progressbar:MovieClip;
      
      internal var flagside:int;
      
      internal var counter:int = 0;
      
      internal var counterMax:int = 240;
      
      internal var §1t8661s0§:int;
      
      public function §1t8660s0§(param1:String, param2:String)
      {
         super();
         if(param2 == "")
         {
            objectName = "controlpointflag";
         }
         else
         {
            objectName = param2;
         }
         this.§1t8662s0§(0);
         this.progressbar.visible = false;
         this.progressbar.nametext.text = §1t1521s0§.getString(802);
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
         var _loc3_:int = §1t1525s0§.§1t9935s0§();
         var _loc4_:int = §1t70s0§.instance.§1t1134s0§(_loc3_);
         var _loc5_:Point = §1t70s0§.instance.§1t1135s0§(_loc3_);
         §1t3318s0§.instance.§1t3425s0§(_loc4_,_loc5_.x,_loc5_.y,this.§1t8662s0§);
         buttonMode = false;
         this.§1t8661s0§ = §1t1523s0§.§1t7746s0§();
      }
      
      public function §1t8662s0§(param1:int) : *
      {
         this.flagside = param1;
         this.progressbar.visible = false;
         this.counter = 0;
         if(§1t1523s0§.§1t9663s0§(this.flagside))
         {
            this.flag.gotoAndStop(10);
            this.flag.logo.stop();
            §1t3318s0§.instance.§1t3432s0§(this.flagside,this.§1t1351s0§);
         }
         else
         {
            this.flag.gotoAndStop(this.flagside + 1);
         }
         if(§1t1523s0§.§1t7746s0§() == this.flagside)
         {
            buttonMode = false;
         }
         else
         {
            buttonMode = true;
         }
         if(this.§1t8661s0§ == 0)
         {
            buttonMode = false;
         }
      }
      
      internal function §1t1351s0§(param1:§1t23s0§) : *
      {
         §1t1643s0§.§1t11214s0§(this.flag.color,param1.color);
         this.flag.logo.gotoAndStop(param1.logo);
         §1t1643s0§.§1t11214s0§(this.flag.logo,param1.logocolor);
      }
      
      override public function §1t6733s0§() : String
      {
         if(this.§1t8661s0§ != 0 && this.§1t8661s0§ != this.flagside)
         {
            return §1t1521s0§.getString(771);
         }
         return "";
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Point = null;
         if(this.§1t8661s0§ != this.flagside)
         {
            if(param1)
            {
               ++this.counter;
               this.progressbar.visible = true;
               this.progressbar.bar.scaleX = this.counter / this.counterMax;
               if(this.counter >= this.counterMax)
               {
                  §1t88s0§.instance.§1t1513s0§();
                  if(§1t8502s0§ == null)
                  {
                     _loc2_ = §1t1525s0§.§1t9935s0§();
                     _loc3_ = §1t70s0§.instance.§1t1134s0§(_loc2_);
                     _loc4_ = §1t70s0§.instance.§1t1135s0§(_loc2_);
                     §1t251s0§.instance.§1t3550s0§(_loc3_,_loc4_.x,_loc4_.y,this.§1t8661s0§);
                     if(this.flagside != this.§1t8661s0§)
                     {
                        §1t251s0§.instance.§1t3540s0§(objectName,false,false,this.§1t8661s0§);
                     }
                     this.§1t8662s0§(this.§1t8661s0§);
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
         if(this.§1t8661s0§ != 0 && this.§1t8661s0§ != this.flagside)
         {
            if(abs(x - param1.x) < 50 && param1.y > §1t1525s0§.§1t4467s0§() - 10)
            {
               this.showInteractButton(true);
               return true;
            }
            this.showInteractButton(false);
            return false;
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
         this.§1t8662s0§(param3);
      }
   }
}

