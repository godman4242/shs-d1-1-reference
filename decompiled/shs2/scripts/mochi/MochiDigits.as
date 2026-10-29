package mochi
{
   public final class MochiDigits
   {
      
      private var Sibling:MochiDigits;
      
      private var Fragment:Number;
      
      private var Encoder:Number;
      
      public function MochiDigits(param1:Number = 0, param2:uint = 0)
      {
         super();
         Encoder = 0;
         setValue(param1,param2);
      }
      
      public function set value(param1:Number) : void
      {
         setValue(param1);
      }
      
      public function reencode() : void
      {
         var _loc1_:uint = 0;
         _loc1_ = uint(int(2147483647 * Math.random()));
         Fragment ^= _loc1_ ^ Encoder;
         Encoder = _loc1_;
      }
      
      public function toString() : String
      {
         var _loc1_:String = null;
         _loc1_ = String.fromCharCode(Fragment ^ Encoder);
         if(Sibling != null)
         {
            _loc1_ += Sibling.toString();
         }
         return _loc1_;
      }
      
      public function get value() : Number
      {
         return Number(this.toString());
      }
      
      public function setValue(param1:Number = 0, param2:uint = 0) : void
      {
         var _loc3_:String = null;
         _loc3_ = param1.toString();
         Fragment = _loc3_.charCodeAt(param2++) ^ Encoder;
         if(param2 < _loc3_.length)
         {
            Sibling = new MochiDigits(param1,param2);
         }
         else
         {
            Sibling = null;
         }
         reencode();
      }
      
      public function addValue(param1:Number) : void
      {
         value += param1;
      }
   }
}

