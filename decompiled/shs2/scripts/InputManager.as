package
{
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.display.LineScaleMode;
   import flash.display.MovieClip;
   
   public class InputManager
   {
      
      public static var instance:InputManager;
      
      public var disableControls:Boolean = false;
      
      internal var oldMouseX:int = 0;
      
      internal var oldMouseY:int = 0;
      
      internal var distanceLeft:int = 0;
      
      internal var clickThreshhold:int = 5;
      
      public var maxDistance:int = 200;
      
      internal var mousePressed:Boolean = false;
      
      internal var arrayX_drawing:Array = new Array();
      
      internal var arrayY_drawing:Array = new Array();
      
      public function InputManager()
      {
         super();
         instance = this;
      }
      
      public function enable() : *
      {
         disableControls = false;
      }
      
      public function pauseGame() : *
      {
         Player.instance.pauseGame();
      }
      
      internal function getDistanceSQ(param1:int, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         _loc5_ = Math.abs(param1 - param3);
         _loc6_ = Math.abs(param2 - param4);
         return _loc5_ * _loc5_ + _loc6_ * _loc6_;
      }
      
      public function activatePower() : *
      {
         Player.instance.activatePower();
      }
      
      public function drawLine(param1:int, param2:int, param3:MovieClip) : *
      {
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:int = 0;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:Number = NaN;
         var _loc10_:* = undefined;
         if(disableControls)
         {
            return;
         }
         if(mousePressed && distanceLeft > 0)
         {
            if(param1 <= 0 || param1 >= 720 || param2 <= 0 || param2 >= 400)
            {
               mouseUp(param1,param2,param3);
               return;
            }
            _loc4_ = 8;
            param3.graphics.lineStyle(_loc4_ - _loc4_ * ((maxDistance - distanceLeft) / maxDistance),10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            _loc5_ = getDistance(oldMouseX,oldMouseY,param1,param2);
            distanceLeft -= _loc5_;
            if(param1 != oldMouseX || param2 != oldMouseY)
            {
               _loc6_ = 20;
               if(_loc5_ > _loc6_)
               {
                  _loc7_ = (param1 - oldMouseX) * _loc6_ / _loc5_;
                  _loc8_ = (param2 - oldMouseY) * _loc6_ / _loc5_;
                  _loc9_ = _loc5_ / _loc6_;
                  _loc10_ = 0;
                  while(_loc10_ < _loc9_)
                  {
                     arrayX_drawing.push(oldMouseX + _loc10_ * _loc7_);
                     arrayY_drawing.push(oldMouseY + _loc10_ * _loc8_);
                     param3.graphics.lineTo(oldMouseX + _loc10_ * _loc7_,oldMouseY + _loc10_ * _loc8_);
                     _loc10_++;
                  }
                  arrayX_drawing.push(param1);
                  arrayY_drawing.push(param2);
                  param3.graphics.lineTo(param1,param2);
               }
               else
               {
                  arrayX_drawing.push(param1);
                  arrayY_drawing.push(param2);
                  param3.graphics.lineTo(param1,param2);
               }
            }
            oldMouseX = param1;
            oldMouseY = param2;
         }
      }
      
      public function mouseUp(param1:int, param2:int, param3:MovieClip) : *
      {
         var _loc4_:Boolean = false;
         if(!mousePressed || disableControls)
         {
            return;
         }
         mousePressed = false;
         _loc4_ = arrayX_drawing.length > clickThreshhold || getDistanceSQ(arrayX_drawing[0],arrayY_drawing[0],arrayX_drawing[arrayX_drawing.length - 1],arrayY_drawing[arrayY_drawing.length - 1]) > 100;
         if(Player.instance.isShunpo)
         {
            Player.instance.storeNextSlash(arrayX_drawing,arrayY_drawing);
         }
         else if(!_loc4_)
         {
            param3.graphics.clear();
            Player.instance.initMoveTo(param1,param2);
         }
         else
         {
            Player.instance.initSlash(arrayX_drawing,arrayY_drawing);
         }
         arrayX_drawing = new Array();
         arrayY_drawing = new Array();
      }
      
      public function drawNextSlash() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(!mousePressed)
         {
            MovieClip(Player.instance.root).canvas.graphics.clear();
         }
         else
         {
            _loc1_ = maxDistance;
            MovieClip(Player.instance.root).canvas.graphics.clear();
            MovieClip(Player.instance.root).canvas.graphics.moveTo(arrayX_drawing[0],arrayY_drawing[0]);
            _loc2_ = 1;
            while(_loc2_ <= arrayX_drawing.length - 1)
            {
               _loc3_ = getDistance(arrayX_drawing[_loc2_ - 1],arrayY_drawing[_loc2_ - 1],arrayX_drawing[_loc2_],arrayY_drawing[_loc2_]);
               MovieClip(Player.instance.root).canvas.graphics.lineStyle(9 - 9 * ((maxDistance - _loc1_) / maxDistance),10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
               MovieClip(Player.instance.root).canvas.graphics.lineTo(arrayX_drawing[_loc2_],arrayY_drawing[_loc2_]);
               _loc1_ -= _loc3_;
               _loc2_++;
            }
         }
      }
      
      public function mouseDown(param1:int, param2:int, param3:MovieClip) : *
      {
         if(disableControls)
         {
            return;
         }
         mousePressed = true;
         param3.graphics.clear();
         param3.x = 0;
         arrayX_drawing = new Array();
         arrayY_drawing = new Array();
         arrayX_drawing.push(param1);
         arrayY_drawing.push(param2);
         param3.graphics.moveTo(param1,param2);
         oldMouseX = param1;
         oldMouseY = param2;
         distanceLeft = maxDistance;
      }
      
      public function disable() : *
      {
         disableControls = true;
         mousePressed = false;
         arrayX_drawing = new Array();
         arrayY_drawing = new Array();
         MovieClip(Player.instance.root).canvas.graphics.clear();
         MovieClip(Player.instance.root).slashcanvas.graphics.clear();
      }
      
      internal function getDistance(param1:int, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         _loc5_ = Math.abs(param1 - param3);
         _loc6_ = Math.abs(param2 - param4);
         return Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
      }
   }
}

