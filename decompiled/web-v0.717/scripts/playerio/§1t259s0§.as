package playerio
{
   import §1t51s0§.§1t51s1§.Converter;
   import playerio.generated.PlayerIOError;
   
   internal class §1t259s0§
   {
      
      private var _client:§1t150s0§;
      
      public function §1t259s0§(param1:§1t150s0§)
      {
         super();
         this._client = param1;
      }
      
      public function §1t2563s0§(param1:int, param2:Object, param3:Function, param4:Function) : void
      {
         var cointamount:int = param1;
         var purchaseArguments:Object = param2;
         var callback:Function = param3;
         var errorCallback:Function = param4;
         if(purchaseArguments == null)
         {
            purchaseArguments = {};
         }
         purchaseArguments["coinamount"] = cointamount.toString();
         _client.§1t737s0§.§1t4690s0§("yahoo",purchaseArguments,function(param1:Object):void
         {
            var info:Object = param1;
            playerio.§1t49s0§._internal_showDialog("buy",info,_client.channel,function(param1:Object):void
            {
               if(param1["error"] != undefined && errorCallback != null)
               {
                  errorCallback(new playerio.generated.PlayerIOError(param1["error"],playerio.PlayerIOError.GeneralError.errorID));
               }
               else if(callback != null)
               {
                  callback(param1);
               }
            });
         },errorCallback);
      }
      
      public function §1t2564s0§(param1:Array, param2:Object, param3:Function, param4:Function) : void
      {
         var items:Array = param1;
         var purchaseArguments:Object = param2;
         var callback:Function = param3;
         var errorCallback:Function = param4;
         _client.§1t737s0§.getBuyDirectInfo("yahoo",purchaseArguments,Converter.§1t11523s0§(items),function(param1:Object):void
         {
            var info:Object = param1;
            playerio.§1t49s0§._internal_showDialog("buy",info,_client.channel,function(param1:Object):void
            {
               if(param1["error"] != undefined && errorCallback != null)
               {
                  errorCallback(new playerio.generated.PlayerIOError(param1["error"],playerio.PlayerIOError.GeneralError.errorID));
               }
               else if(callback != null)
               {
                  callback(param1);
               }
            });
         },errorCallback);
      }
   }
}

