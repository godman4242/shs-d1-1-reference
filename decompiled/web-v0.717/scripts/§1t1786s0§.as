package
{
   import flash.external.ExternalInterface;
   
   public class §1t1786s0§
   {
      
      private static var §1t11419s0§:Function;
      
      public static const §1t11413s0§:String = "SUCCEEDED";
      
      public static const §1t11415s0§:String = "FAILED";
      
      public static const §1t11417s0§:String = "CANCELLED";
      
      private static var initialized:Boolean = false;
      
      public function §1t1786s0§()
      {
         super();
      }
      
      public static function setPaymentCallback(param1:Function) : void
      {
         §1t11419s0§ = param1;
      }
      
      public static function requestPurchase(param1:String, param2:String) : void
      {
         if(!initialized)
         {
            ExternalInterface.addCallback("invokePayPalCallback",invokeCallback);
            initialized = true;
         }
         ExternalInterface.call("purchaseWithPayPal",param1,param2);
      }
      
      private static function invokeCallback(param1:String, param2:String) : void
      {
         if(§1t11419s0§ != null)
         {
            §1t11419s0§(param1,param2);
         }
      }
   }
}

