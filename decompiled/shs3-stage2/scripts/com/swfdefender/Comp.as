package com.swfdefender
{
   import flash.display.*;
   import flash.utils.*;
   
   public class Comp extends Sprite
   {
      
      public function Comp()
      {
         super();
      }
      
      public static function C1(param1:ByteArray, param2:ByteArray, param3:int) : void
      {
         if(false)
         {
         }
         var _loc4_:int = 0;
         var _loc5_:int = param1.length < param3 ? int(param1.length) : param3;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            param1[_loc6_] ^= param2[_loc4_];
            if(++_loc4_ >= param2.length)
            {
               _loc4_ = 0;
            }
            _loc6_++;
         }
      }
      
      public static function C2(param1:ByteArray, param2:ByteArray, param3:int) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc4_:int = param1.length < param3 ? int(param1.length) : param3;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:ByteArray = new ByteArray();
         _loc8_ = 0;
         while(_loc8_ < 256)
         {
            _loc7_[_loc8_] = _loc8_;
            _loc8_++;
         }
         _loc9_ = 0;
         _loc8_ = 0;
         while(_loc8_ < 256)
         {
            _loc9_ = _loc9_ + _loc7_[_loc8_] + param2[_loc8_ % param2.length] & 0xFF;
            _loc10_ = int(_loc7_[_loc8_]);
            _loc7_[_loc8_] = _loc7_[_loc9_];
            _loc7_[_loc9_] = _loc10_;
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < _loc4_)
         {
            _loc5_ = _loc5_ + 1 & 0xFF;
            _loc6_ = _loc6_ + _loc7_[_loc5_] & 0xFF;
            _loc9_ = int(_loc7_[_loc5_]);
            _loc7_[_loc5_] = _loc7_[_loc6_];
            _loc7_[_loc6_] = _loc9_;
            param1[_loc8_] ^= _loc7_[_loc9_ + _loc7_[_loc5_] & 0xFF];
            _loc8_++;
         }
      }
   }
}

