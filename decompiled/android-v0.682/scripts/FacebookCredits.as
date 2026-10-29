package
{
   import flash.external.ExternalInterface;
   
   public class FacebookCredits
   {
      
      private static var paymentCallback:Function;
      
      public static const PAYMENT_SUCCEEDED:String = "SUCCEEDED";
      
      public static const PAYMENT_FAILED:String = "FAILED";
      
      public static const PAYMENT_CANCELLED:String = "CANCELLED";
      
      private static var initialized:Boolean = false;
      
      public function FacebookCredits()
      {
         super();
      }
      
      public static function setPaymentCallback(callback:Function) : void
      {
         paymentCallback = callback;
      }
      
      public static function requestPurchase(itemId:String) : void
      {
         if(!initialized)
         {
            ExternalInterface.addCallback("invokeFBCallback",invokeCallback);
            initialized = true;
         }
         ExternalInterface.call("purchaseWithFBCredits",itemId);
      }
      
      public static function getFBCredits() : *
      {
         ExternalInterface.call("buyCredits");
      }
      
      private static function invokeCallback(status:String, error:String) : void
      {
         if(paymentCallback != null)
         {
            paymentCallback(status,error);
         }
      }
   }
}

