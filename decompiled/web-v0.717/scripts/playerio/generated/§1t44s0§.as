package playerio.generated
{
   import §1t51s0§.§1t51s1§.§1t52s0§;
   import §1t51s0§.§1t51s1§.Converter;
   import flash.events.EventDispatcher;
   import playerio.§1t150s0§;
   import playerio.generated.messages.PayVaultBuyArgs;
   import playerio.generated.messages.PayVaultBuyError;
   import playerio.generated.messages.PayVaultBuyOutput;
   import playerio.generated.messages.PayVaultConsumeArgs;
   import playerio.generated.messages.PayVaultConsumeError;
   import playerio.generated.messages.PayVaultConsumeOutput;
   import playerio.generated.messages.PayVaultCreditArgs;
   import playerio.generated.messages.PayVaultCreditError;
   import playerio.generated.messages.PayVaultCreditOutput;
   import playerio.generated.messages.PayVaultDebitArgs;
   import playerio.generated.messages.PayVaultDebitError;
   import playerio.generated.messages.PayVaultDebitOutput;
   import playerio.generated.messages.PayVaultGiveArgs;
   import playerio.generated.messages.PayVaultGiveError;
   import playerio.generated.messages.PayVaultGiveOutput;
   import playerio.generated.messages.PayVaultPaymentInfoArgs;
   import playerio.generated.messages.PayVaultPaymentInfoError;
   import playerio.generated.messages.PayVaultPaymentInfoOutput;
   import playerio.generated.messages.PayVaultReadHistoryArgs;
   import playerio.generated.messages.PayVaultReadHistoryError;
   import playerio.generated.messages.PayVaultReadHistoryOutput;
   import playerio.generated.messages.PayVaultRefreshArgs;
   import playerio.generated.messages.PayVaultRefreshError;
   import playerio.generated.messages.PayVaultRefreshOutput;
   import playerio.generated.messages.PayVaultUsePaymentInfoArgs;
   import playerio.generated.messages.PayVaultUsePaymentInfoError;
   import playerio.generated.messages.PayVaultUsePaymentInfoOutput;
   
   public class §1t44s0§ extends EventDispatcher
   {
      
      protected var channel:§1t52s0§;
      
      protected var client:§1t150s0§;
      
      public function §1t44s0§(param1:§1t52s0§, param2:§1t150s0§)
      {
         super();
         this.channel = param1;
         this.client = param2;
      }
      
      protected function _payVaultReadHistory(param1:uint, param2:uint, param3:Function = null, param4:Function = null) : void
      {
         var page:uint = param1;
         var pageSize:uint = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         var input:PayVaultReadHistoryArgs = new PayVaultReadHistoryArgs(page,pageSize);
         var output:PayVaultReadHistoryOutput = new PayVaultReadHistoryOutput();
         channel.Request(160,input,output,new PayVaultReadHistoryError(),function(param1:PayVaultReadHistoryOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(param1.entries);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultReadHistory",e);
                  throw e;
               }
            }
         },function(param1:PayVaultReadHistoryError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function _payVaultRefresh(param1:String, param2:Function = null, param3:Function = null) : void
      {
         var lastVersion:String = param1;
         var callback:Function = param2;
         var errorHandler:Function = param3;
         var input:PayVaultRefreshArgs = new PayVaultRefreshArgs(lastVersion);
         var output:PayVaultRefreshOutput = new PayVaultRefreshOutput();
         channel.Request(163,input,output,new PayVaultRefreshError(),function(param1:PayVaultRefreshOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(param1.vaultContents);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultRefresh",e);
                  throw e;
               }
            }
         },function(param1:PayVaultRefreshError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function _payVaultConsume(param1:Array, param2:Function = null, param3:Function = null) : void
      {
         var ids:Array = param1;
         var callback:Function = param2;
         var errorHandler:Function = param3;
         var input:PayVaultConsumeArgs = new PayVaultConsumeArgs(ids);
         var output:PayVaultConsumeOutput = new PayVaultConsumeOutput();
         channel.Request(166,input,output,new PayVaultConsumeError(),function(param1:PayVaultConsumeOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(param1.vaultContents);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultConsume",e);
                  throw e;
               }
            }
         },function(param1:PayVaultConsumeError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function _payVaultCredit(param1:uint, param2:String, param3:Function = null, param4:Function = null) : void
      {
         var amount:uint = param1;
         var reason:String = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         var input:PayVaultCreditArgs = new PayVaultCreditArgs(amount,reason);
         var output:PayVaultCreditOutput = new PayVaultCreditOutput();
         channel.Request(169,input,output,new PayVaultCreditError(),function(param1:PayVaultCreditOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(param1.vaultContents);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultCredit",e);
                  throw e;
               }
            }
         },function(param1:PayVaultCreditError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function _payVaultDebit(param1:uint, param2:String, param3:Function = null, param4:Function = null) : void
      {
         var amount:uint = param1;
         var reason:String = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         var input:PayVaultDebitArgs = new PayVaultDebitArgs(amount,reason);
         var output:PayVaultDebitOutput = new PayVaultDebitOutput();
         channel.Request(172,input,output,new PayVaultDebitError(),function(param1:PayVaultDebitOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(param1.vaultContents);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultDebit",e);
                  throw e;
               }
            }
         },function(param1:PayVaultDebitError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function _payVaultBuy(param1:Array, param2:Boolean, param3:Function = null, param4:Function = null) : void
      {
         var items:Array = param1;
         var storeItems:Boolean = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         var input:PayVaultBuyArgs = new PayVaultBuyArgs(items,storeItems);
         var output:PayVaultBuyOutput = new PayVaultBuyOutput();
         channel.Request(175,input,output,new PayVaultBuyError(),function(param1:PayVaultBuyOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(param1.vaultContents);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultBuy",e);
                  throw e;
               }
            }
         },function(param1:PayVaultBuyError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function _payVaultGive(param1:Array, param2:Function = null, param3:Function = null) : void
      {
         var items:Array = param1;
         var callback:Function = param2;
         var errorHandler:Function = param3;
         var input:PayVaultGiveArgs = new PayVaultGiveArgs(items);
         var output:PayVaultGiveOutput = new PayVaultGiveOutput();
         channel.Request(178,input,output,new PayVaultGiveError(),function(param1:PayVaultGiveOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(param1.vaultContents);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultGive",e);
                  throw e;
               }
            }
         },function(param1:PayVaultGiveError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function _payVaultPaymentInfo(param1:String, param2:Object, param3:Array, param4:Function = null, param5:Function = null) : void
      {
         var provider:String = param1;
         var purchaseArguments:Object = param2;
         var items:Array = param3;
         var callback:Function = param4;
         var errorHandler:Function = param5;
         var input:PayVaultPaymentInfoArgs = new PayVaultPaymentInfoArgs(provider,Converter.§1t11524s0§(purchaseArguments),items);
         var output:PayVaultPaymentInfoOutput = new PayVaultPaymentInfoOutput();
         channel.Request(181,input,output,new PayVaultPaymentInfoError(),function(param1:PayVaultPaymentInfoOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(Converter.§1t11525s0§(param1.providerArguments));
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultPaymentInfo",e);
                  throw e;
               }
            }
         },function(param1:PayVaultPaymentInfoError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function _payVaultUsePaymentInfo(param1:String, param2:Object, param3:Function = null, param4:Function = null) : void
      {
         var provider:String = param1;
         var providerArguments:Object = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         var input:PayVaultUsePaymentInfoArgs = new PayVaultUsePaymentInfoArgs(provider,Converter.§1t11524s0§(providerArguments));
         var output:PayVaultUsePaymentInfoOutput = new PayVaultUsePaymentInfoOutput();
         channel.Request(184,input,output,new PayVaultUsePaymentInfoError(),function(param1:PayVaultUsePaymentInfoOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(Converter.§1t11525s0§(param1.providerResults),param1.vaultContents);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PayVault.payVaultUsePaymentInfo",e);
                  throw e;
               }
            }
         },function(param1:PayVaultUsePaymentInfoError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
   }
}

