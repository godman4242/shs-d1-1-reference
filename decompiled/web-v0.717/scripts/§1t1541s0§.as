package
{
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.display.LineScaleMode;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class §1t1541s0§
   {
      
      internal static var §1t9973s0§:Stage;
      
      internal static var canvas:MovieClip;
      
      internal static var §1t10113s0§:MovieClip;
      
      internal static var §1t10074s0§:Boolean = false;
      
      internal static var §1t10075s0§:Vector.<Point> = new Vector.<Point>();
      
      internal static var §1t10076s0§:int = 0;
      
      internal static var §1t10077s0§:int = 0;
      
      internal static var §1t10078s0§:int = 0;
      
      internal static var §1t10079s0§:int = 0;
      
      internal static var §1t10080s0§:int = 0;
      
      internal static var §1t10081s0§:int = 0;
      
      internal static var §1t10082s0§:int = 1;
      
      internal static var §1t10083s0§:int = 3;
      
      internal static var §1t10084s0§:int = 4;
      
      internal static var §1t10085s0§:int = 5;
      
      internal static var inputMode:int = §1t10081s0§;
      
      internal static var debug:Boolean = false;
      
      internal static var maxDistance:int = 200;
      
      internal static var §1t10088s0§:int = 4;
      
      internal static var §1t10089s0§:int = 400;
      
      internal static var thickness:int = 8;
      
      internal static var §1t10091s0§:int = 20;
      
      internal static var §1t10109s0§:int = 0;
      
      public function §1t1541s0§()
      {
         super();
      }
      
      public static function §1t9917s0§(param1:Stage) : *
      {
         §1t9973s0§ = param1;
         if(canvas == null)
         {
            canvas = new §1t5016s0§();
         }
         §1t9973s0§.addChild(canvas);
         if(debug)
         {
            §1t10113s0§ = new §1t5016s0§();
            §1t9973s0§.addChild(§1t10113s0§);
         }
         if(!§1t1523s0§.§1t9528s0§)
         {
            §1t9973s0§.addEventListener(Event.DEACTIVATE,§1t10093s0§);
            §1t9973s0§.addEventListener(Event.ACTIVATE,§1t10092s0§);
         }
         §1t9973s0§.addEventListener(KeyboardEvent.KEY_UP,§1t10122s0§);
         §1t9973s0§.addEventListener(KeyboardEvent.KEY_DOWN,§1t10121s0§);
      }
      
      internal static function §1t10092s0§(param1:Event) : *
      {
         if(inputMode == §1t10084s0§)
         {
            §1t251s0§.instance.§1t3532s0§(false);
         }
      }
      
      internal static function §1t10093s0§(param1:Event) : *
      {
         if(inputMode == §1t10084s0§)
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
      }
      
      public static function §1t10094s0§(param1:int) : *
      {
         maxDistance = param1;
      }
      
      public static function §1t10052s0§() : *
      {
         §1t9973s0§.addEventListener(MouseEvent.MOUSE_DOWN,§1t10103s0§);
         §1t9973s0§.addEventListener(MouseEvent.MOUSE_UP,§1t10104s0§);
         §1t9973s0§.addEventListener(Event.MOUSE_LEAVE,§1t10106s0§);
         inputMode = §1t10082s0§;
         §1t10074s0§ = false;
      }
      
      public static function §1t10095s0§() : *
      {
         §1t9973s0§.removeEventListener(MouseEvent.MOUSE_DOWN,§1t10103s0§);
         §1t9973s0§.removeEventListener(MouseEvent.MOUSE_UP,§1t10104s0§);
         §1t9973s0§.removeEventListener(Event.MOUSE_LEAVE,§1t10106s0§);
         inputMode = §1t10081s0§;
      }
      
      public static function §1t10096s0§() : *
      {
         inputMode = §1t10081s0§;
      }
      
      public static function §1t10097s0§() : *
      {
         if(§1t1523s0§.§1t4431s0§)
         {
            §1t10098s0§();
         }
         else
         {
            inputMode = §1t10082s0§;
            §1t10111s0§();
            §1t10074s0§ = false;
         }
      }
      
      public static function §1t10098s0§() : *
      {
         inputMode = §1t10085s0§;
         §1t10111s0§();
         §1t10074s0§ = false;
      }
      
      public static function §1t10045s0§() : *
      {
         inputMode = §1t10084s0§;
         §1t10111s0§();
         §1t10074s0§ = false;
      }
      
      public static function §1t10099s0§() : *
      {
         inputMode = §1t10083s0§;
         §1t10074s0§ = false;
      }
      
      public static function §1t10100s0§() : Boolean
      {
         return inputMode == §1t10083s0§;
      }
      
      public static function §1t10101s0§() : *
      {
         canvas.graphics.lineStyle(thickness,39168,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
      }
      
      public static function §1t10102s0§() : *
      {
         canvas.graphics.lineStyle(thickness,10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
      }
      
      internal static function §1t10103s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         _loc2_ = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc3_:int = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         if(_loc3_ > §1t1523s0§.stageHeight)
         {
            return;
         }
         §1t10074s0§ = true;
         if(inputMode == §1t10082s0§)
         {
            canvas.graphics.clear();
         }
         canvas.x = 0;
         §1t10075s0§.length = 0;
         §1t10075s0§.push(new Point(_loc2_,_loc3_));
         canvas.graphics.moveTo(param1.stageX,param1.stageY);
         §1t10076s0§ = _loc2_;
         §1t10077s0§ = _loc3_;
         §1t10078s0§ = maxDistance;
         §1t10079s0§ = _loc2_;
         §1t10080s0§ = _loc3_;
      }
      
      internal static function §1t10104s0§(param1:MouseEvent) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         if(!§1t10074s0§ || inputMode == §1t10083s0§ || §1t406s0§.instance.§1t6496s0§.§1t6853s0§())
         {
            return;
         }
         §1t10074s0§ = false;
         if(§1t1540s0§.§1t10010s0§() == §1t1540s0§.§1t9988s0§)
         {
            §1t1540s0§.§1t9894s0§();
            return;
         }
         if(param1 != null)
         {
            _loc2_ = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
            _loc3_ = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         }
         else
         {
            _loc2_ = (§1t9973s0§.mouseX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
            _loc3_ = (§1t9973s0§.mouseY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         }
         var _loc4_:int = int(§1t10075s0§.length);
         if(param1 != null)
         {
            if(inputMode == §1t10084s0§)
            {
               if(§1t10108s0§(param1.stageX,param1.stageY))
               {
                  return;
               }
               §1t1525s0§.§1t8140s0§(param1.stageX,param1.stageY);
               §1t10075s0§[0].x = int(_loc2_);
               §1t10075s0§[0].y = int(_loc3_);
            }
            if(§1t406s0§.instance.§1t6488s0§.visible)
            {
               return;
            }
            if(_loc4_ <= §1t10088s0§ && (inputMode == §1t10082s0§ || inputMode == §1t10085s0§) && §1t113s0§.instance.visible)
            {
               if(§1t113s0§.instance.§1t5206s0§(param1.stageX,param1.stageY))
               {
                  return;
               }
            }
         }
         var _loc5_:Boolean = false;
         if(_loc4_ > 0)
         {
            _loc6_ = §1t10075s0§[0];
            _loc7_ = §1t10075s0§[_loc4_ - 1];
            _loc5_ = _loc4_ > §1t10088s0§ && §1t10119s0§(_loc6_,_loc7_) > §1t10089s0§;
            if(!_loc5_)
            {
               §1t10111s0§();
            }
         }
         else
         {
            §1t10111s0§();
         }
         if(§1t1540s0§.§1t10047s0§() && !_loc5_ && param1 != null)
         {
            §1t1525s0§.§1t8140s0§(param1.stageX,param1.stageY);
         }
         if(inputMode != §1t10085s0§)
         {
            §1t1523s0§.§1t9586s0§().§1t4450s0§(§1t10075s0§,_loc5_);
         }
      }
      
      public static function §1t10105s0§(param1:String, param2:String, param3:int) : *
      {
         var _loc8_:Array = null;
         var _loc4_:§1t122s0§ = §1t1543s0§.§1t10225s0§(param2);
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:Vector.<Point> = new Vector.<Point>();
         var _loc6_:Array = param1.split("|");
         var _loc7_:int = int(_loc6_.length);
         var _loc9_:* = 0;
         while(_loc9_ < _loc7_)
         {
            _loc8_ = _loc6_[_loc9_].split(",");
            _loc5_.push(new Point(_loc8_[0],_loc8_[1]));
            _loc9_++;
         }
         var _loc10_:int = int(_loc5_.length);
         var _loc11_:Point = _loc5_[0];
         var _loc12_:Point = _loc5_[_loc10_ - 1];
         var _loc13_:Boolean = _loc10_ > §1t10088s0§ && §1t10119s0§(_loc11_,_loc12_) > §1t10089s0§;
         _loc4_.§1t4450s0§(_loc5_,_loc13_,param3);
      }
      
      public static function update() : *
      {
         if(§1t406s0§.instance.§1t6496s0§.§1t6853s0§())
         {
            return;
         }
         if(inputMode == §1t10084s0§)
         {
            §1t10110s0§();
         }
         else if(inputMode == §1t10082s0§)
         {
            §1t10107s0§();
         }
      }
      
      internal static function §1t10106s0§(param1:Event) : *
      {
         if(§1t10074s0§)
         {
            §1t10104s0§(null);
         }
      }
      
      internal static function §1t10107s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:* = undefined;
         _loc1_ = (§1t9973s0§.mouseX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         _loc2_ = (§1t9973s0§.mouseY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         if(§1t1540s0§.§1t10047s0§())
         {
            §1t1525s0§.§1t8141s0§(§1t9973s0§.mouseX,§1t9973s0§.mouseY);
         }
         if(_loc1_ <= 0 || _loc1_ >= §1t1523s0§.stageWidth || _loc2_ <= 0 || _loc2_ >= §1t1523s0§.stageHeight)
         {
            §1t10104s0§(null);
            return;
         }
         if(§1t10074s0§ && §1t10078s0§ > 0 && !§1t113s0§.instance.§1t5231s0§())
         {
            _loc3_ = §1t10120s0§(§1t10076s0§,§1t10077s0§,_loc1_,_loc2_);
            if(_loc3_ < 4)
            {
               return;
            }
            canvas.graphics.lineStyle(thickness - thickness * ((maxDistance - §1t10078s0§) / maxDistance),10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            _loc5_ = _loc4_ = Math.sqrt(_loc3_);
            if(_loc4_ > §1t10078s0§)
            {
               _loc4_ = §1t10078s0§;
            }
            §1t10078s0§ -= _loc4_;
            if(_loc1_ != §1t10076s0§ || _loc2_ != §1t10077s0§)
            {
               if(_loc4_ > §1t10091s0§)
               {
                  _loc6_ = (_loc1_ - §1t10076s0§) * §1t10091s0§ / _loc5_;
                  _loc7_ = (_loc2_ - §1t10077s0§) * §1t10091s0§ / _loc5_;
                  _loc8_ = _loc4_ / §1t10091s0§;
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_)
                  {
                     §1t10075s0§.push(new Point(int(§1t10076s0§ + _loc9_ * _loc6_),int(§1t10077s0§ + _loc9_ * _loc7_)));
                     canvas.graphics.lineTo(int(§1t10076s0§ + _loc9_ * _loc6_) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§,int(§1t10077s0§ + _loc9_ * _loc7_) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§);
                     _loc9_++;
                  }
               }
               else
               {
                  §1t10075s0§.push(new Point(_loc1_,_loc2_));
                  canvas.graphics.lineTo(_loc1_ * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§,_loc2_ * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§);
               }
            }
            §1t10076s0§ = _loc1_;
            §1t10077s0§ = _loc2_;
         }
      }
      
      internal static function §1t10108s0§(param1:int, param2:int) : Boolean
      {
         var _loc3_:§1t406s0§ = §1t406s0§.instance;
         var _loc4_:int = (param1 - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc5_:int = (param2 - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         if(Boolean(_loc3_.§1t5163s0§.visible && (_loc5_ > 400 && _loc4_ > 245 || _loc5_ > 50 && _loc5_ < 220 && _loc4_ > 240 && _loc4_ < 620) || _loc5_ > 430 && _loc4_ > 200 || _loc5_ < 35 || _loc5_ > 480 || _loc5_ < 220 && _loc4_ > 630 || _loc3_.§1t6429s0§.§1t5158s0§.hitTestPoint(param1,param2,true) || _loc3_.§1t6600s0§().visible && _loc3_.§1t6600s0§().hitTestPoint(param1,param2) || _loc3_.§1t5947s0§.visible && _loc3_.§1t5947s0§.hitTestPoint(param1,param2)) || Boolean(_loc3_.§1t6574s0§().visible && _loc3_.§1t6574s0§().§1t6402s0§(param1,param2)) || _loc3_.§1t6467s0§.visible && _loc4_ < 240 && _loc5_ < 360 && _loc5_ > 70)
         {
            return true;
         }
         return false;
      }
      
      internal static function §1t10110s0§() : *
      {
         var _loc3_:int = 0;
         var _loc1_:int = §1t9973s0§.mouseX - §1t1523s0§.§1t9359s0§;
         var _loc2_:int = §1t9973s0§.mouseY - §1t1523s0§.§1t9360s0§;
         §1t1525s0§.§1t8141s0§(§1t9973s0§.mouseX,§1t9973s0§.mouseY);
         if(§1t10108s0§(§1t9973s0§.mouseX,§1t9973s0§.mouseY))
         {
            return;
         }
         if(§1t10074s0§)
         {
            _loc3_ = §1t1525s0§.§1t8131s0§();
            §1t1523s0§.§1t9586s0§().§1t4451s0§(new Point(_loc1_ / §1t1523s0§.§1t9358s0§ + _loc3_,_loc2_ / §1t1523s0§.§1t9358s0§));
         }
         ++§1t10109s0§;
         if(§1t10109s0§ >= 12)
         {
            §1t10109s0§ = 0;
            if(§1t10074s0§ && §1t251s0§.instance.§1t3476s0§())
            {
               §1t10075s0§[0].x = int(_loc1_ / §1t1523s0§.§1t9358s0§);
               §1t10075s0§[0].y = int(_loc2_ / §1t1523s0§.§1t9358s0§);
               §1t251s0§.instance.§1t3479s0§(§1t10075s0§,_loc3_,-1);
            }
         }
      }
      
      internal static function §1t10111s0§() : *
      {
         if(!§1t10074s0§ && canvas != null)
         {
            canvas.graphics.clear();
            canvas.x = 0;
         }
      }
      
      internal static function §1t10112s0§() : MovieClip
      {
         return canvas;
      }
      
      internal static function §1t10114s0§() : MovieClip
      {
         return §1t10113s0§;
      }
      
      internal static function §1t10115s0§(param1:Vector.<Point>, param2:int) : *
      {
         if(!debug)
         {
            return;
         }
         §1t10113s0§.graphics.clear();
         §1t10113s0§.graphics.lineStyle(3,10066329,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
         var _loc3_:* = 0;
         while(_loc3_ < param1.length)
         {
            §1t10113s0§.graphics.drawCircle((param1[_loc3_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§,param1[_loc3_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§,1);
            _loc3_++;
         }
      }
      
      internal static function §1t10116s0§(param1:Vector.<Point>, param2:int) : *
      {
         var _loc3_:int = maxDistance;
         canvas.graphics.clear();
         var _loc4_:int = thickness * §1t1523s0§.§1t9358s0§;
         var _loc5_:* = 0;
         while(_loc5_ < param1.length)
         {
            canvas.graphics.lineStyle(_loc4_ - _loc4_ * ((maxDistance - _loc3_) / maxDistance),10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            if(_loc5_ == 0)
            {
               canvas.graphics.moveTo((param1[_loc5_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§,param1[_loc5_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§);
            }
            else
            {
               canvas.graphics.lineTo((param1[_loc5_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§,param1[_loc5_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§);
               _loc3_ -= §1t10118s0§(param1[_loc5_].x,param1[_loc5_].y,param1[_loc5_ - 1].x,param1[_loc5_ - 1].y);
            }
            _loc5_++;
         }
      }
      
      public static function §1t10117s0§(param1:Vector.<Point>, param2:int, param3:int) : *
      {
         var _loc4_:int = param3;
         var _loc5_:int = thickness * §1t1523s0§.§1t9358s0§;
         canvas.graphics.clear();
         var _loc6_:* = 0;
         while(_loc6_ < param1.length)
         {
            canvas.graphics.lineStyle(_loc5_ - _loc5_ * ((param3 - _loc4_) / param3),0,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            if(_loc6_ == 0)
            {
               canvas.graphics.moveTo((param1[_loc6_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§,param1[_loc6_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§);
            }
            else
            {
               canvas.graphics.lineTo((param1[_loc6_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§,param1[_loc6_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§);
               _loc4_ -= §1t10118s0§(param1[_loc6_].x,param1[_loc6_].y,param1[_loc6_ - 1].x,param1[_loc6_ - 1].y);
            }
            _loc6_++;
         }
      }
      
      internal static function §1t10118s0§(param1:int, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:* = Math.abs(param1 - param3);
         var _loc6_:* = Math.abs(param2 - param4);
         return Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
      }
      
      internal static function §1t10119s0§(param1:Point, param2:Point) : int
      {
         var _loc3_:* = param2.x - param1.x;
         var _loc4_:* = param2.y - param1.y;
         return _loc3_ * _loc3_ + _loc4_ * _loc4_;
      }
      
      internal static function §1t10120s0§(param1:int, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:* = Math.abs(param1 - param3);
         var _loc6_:* = Math.abs(param2 - param4);
         return _loc5_ * _loc5_ + _loc6_ * _loc6_;
      }
      
      internal static function §1t10121s0§(param1:KeyboardEvent) : *
      {
         if(§1t1523s0§.§1t9526s0§ && (param1.keyCode == Keyboard.BACK || param1.keyCode == Keyboard.MENU || param1.keyCode == Keyboard.SEARCH))
         {
            §1t135s0§.§1t9190s0§().§1t1788s0§(null);
         }
         if(inputMode != §1t10082s0§ && inputMode != §1t10085s0§ && inputMode != §1t10084s0§)
         {
            return;
         }
         if(§1t10100s0§())
         {
            return;
         }
         if(§1t1540s0§.§1t10025s0§().focus == §1t113s0§.instance.§1t5163s0§.§1t13123s0§)
         {
            return;
         }
         if(§1t1540s0§.§1t10025s0§().focus == §1t406s0§.instance.§1t5163s0§.§1t13123s0§)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case 49:
               §1t113s0§.instance.§1t5227s0§(1);
               break;
            case 50:
               §1t113s0§.instance.§1t5227s0§(2);
               break;
            case 51:
               §1t113s0§.instance.§1t5227s0§(3);
               break;
            case 52:
               §1t113s0§.instance.§1t5227s0§(4);
               break;
            case 53:
               §1t113s0§.instance.§1t5227s0§(5);
               break;
            case 54:
               §1t113s0§.instance.§1t5227s0§(6);
               break;
            case 55:
               §1t113s0§.instance.§1t5227s0§(7);
               break;
            case 56:
               §1t113s0§.instance.§1t5227s0§(8);
         }
      }
      
      internal static function §1t10122s0§(param1:KeyboardEvent) : *
      {
         var _loc2_:§1t99s0§ = null;
         if(inputMode != §1t10082s0§ && inputMode != §1t10085s0§ && inputMode != §1t10084s0§)
         {
            return;
         }
         if(§1t10100s0§())
         {
            return;
         }
         if(§1t1540s0§.§1t10025s0§().focus == §1t113s0§.instance.§1t5163s0§.§1t13123s0§)
         {
            return;
         }
         if(§1t1540s0§.§1t10025s0§().focus == §1t406s0§.instance.§1t5163s0§.§1t13123s0§)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.SPACE:
               _loc2_ = §1t1523s0§.§1t9586s0§();
               if(!§1t10074s0§ && _loc2_.§1t4470s0§())
               {
                  _loc2_.§1t4472s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
               }
               else
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
               }
               break;
            case Keyboard.ENTER:
               if(inputMode == §1t10084s0§ && !§1t10100s0§())
               {
                  if(!§1t406s0§.instance.§1t5163s0§.visible)
                  {
                     §1t406s0§.instance.§1t6601s0§(null);
                  }
                  else
                  {
                     §1t1540s0§.§1t10025s0§().focus = §1t406s0§.instance.§1t5163s0§.§1t13123s0§;
                  }
               }
               break;
            case Keyboard.HOME:
               §1t1540s0§.§1t10024s0§();
               break;
            case 49:
               if(inputMode != §1t10084s0§)
               {
                  §1t113s0§.instance.§1t5228s0§(1);
               }
               break;
            case 50:
               if(inputMode != §1t10084s0§)
               {
                  §1t113s0§.instance.§1t5228s0§(2);
               }
               break;
            case 51:
               if(inputMode != §1t10084s0§)
               {
                  §1t113s0§.instance.§1t5228s0§(3);
               }
               break;
            case 52:
               if(inputMode != §1t10084s0§)
               {
                  §1t113s0§.instance.§1t5228s0§(4);
               }
               break;
            case 53:
               if(inputMode != §1t10084s0§)
               {
                  §1t113s0§.instance.§1t5228s0§(5);
               }
               break;
            case 54:
               if(inputMode != §1t10084s0§)
               {
                  §1t113s0§.instance.§1t5228s0§(6);
               }
               break;
            case 55:
               if(inputMode != §1t10084s0§)
               {
                  §1t113s0§.instance.§1t5228s0§(7);
               }
               break;
            case 56:
               if(inputMode != §1t10084s0§)
               {
                  §1t113s0§.instance.§1t5228s0§(8);
               }
         }
      }
   }
}

