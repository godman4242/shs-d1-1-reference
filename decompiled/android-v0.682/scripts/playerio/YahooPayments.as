package playerio
{
   import playerio.generated.PlayerIOError;
   import playerio.utils.Converter;
   
   internal class YahooPayments
   {
      
      private var _client:Client;
      
      public function YahooPayments(client:Client)
      {
         super();
         this._client = client;
      }
      
      public function showBuyCoinsDialog(cointamount:int, purchaseArguments:Object, callback:Function, errorCallback:Function) : void
      {
         if(purchaseArguments == null)
         {
            purchaseArguments = {};
         }
         purchaseArguments["coinamount"] = cointamount.toString();
         _client.payVault.getBuyCoinsInfo("yahoo",purchaseArguments,function(info:Object):void
         {
            Yahoo._internal_showDialog("buy",info,_client.channel,function(result:Object):void
            {
               if(result["error"] != undefined && errorCallback != null)
               {
                  errorCallback(new playerio.generated.PlayerIOError(result["error"],playerio.PlayerIOError.GeneralError.errorID));
               }
               else if(callback != null)
               {
                  callback(result);
               }
            });
         },errorCallback);
      }
      
      public function showBuyItemsDialog(items:Array, purchaseArguments:Object, callback:Function, errorCallback:Function) : void
      {
         _client.payVault.getBuyDirectInfo("yahoo",purchaseArguments,Converter.toBuyItemInfoArray(items),function(info:Object):void
         {
            Yahoo._internal_showDialog("buy",info,_client.channel,function(result:Object):void
            {
               if(result["error"] != undefined && errorCallback != null)
               {
                  errorCallback(new playerio.generated.PlayerIOError(result["error"],playerio.PlayerIOError.GeneralError.errorID));
               }
               else if(callback != null)
               {
                  callback(result);
               }
            });
         },errorCallback);
      }
   }
}

