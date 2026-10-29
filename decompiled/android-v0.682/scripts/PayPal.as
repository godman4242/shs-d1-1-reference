package
{
   import flash.external.ExternalInterface;
   
   public class PayPal
   {
      
      private static var paymentCallback:Function;
      
      public static const PAYMENT_SUCCEEDED:String = "SUCCEEDED";
      
      public static const PAYMENT_FAILED:String = "FAILED";
      
      public static const PAYMENT_CANCELLED:String = "CANCELLED";
      
      private static var initialized:Boolean = false;
      
      public function PayPal()
      {
         super();
      }
      
      public static function setPaymentCallback(callback:Function) : void
      {
         paymentCallback = callback;
      }
      
      public static function requestPurchase(itemId:String, userId:String) : void
      {
         if(!initialized)
         {
            ExternalInterface.addCallback("invokePayPalCallback",invokeCallback);
            initialized = true;
         }
         ExternalInterface.call("purchaseWithPayPal",itemId,userId);
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

