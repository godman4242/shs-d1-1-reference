package playerio
{
   import §1t51s0§.§1t51s1§.§1t52s0§;
   import §1t51s0§.§1t51s1§.Converter;
   import playerio.generated.§1t44s0§;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.PayVaultContents;
   
   public class §1t44s0§ extends playerio.generated.§1t44s0§
   {
      
      private var _version:String = null;
      
      private var _coins:Number = 0;
      
      private var _items:Array = [];
      
      public function §1t44s0§(param1:§1t52s0§, param2:§1t150s0§)
      {
         super(param1,param2);
      }
      
      public function get coins() : Number
      {
         if(_version !== null)
         {
            return _coins;
         }
         throw new playerio.generated.PlayerIOError("Cannot access coins before vault has been loaded. Please refresh the vault first",50);
      }
      
      public function get items() : Array
      {
         if(_version !== null)
         {
            return _items;
         }
         throw new playerio.generated.PlayerIOError("Cannot access items before vault has been loaded. Please refresh the vault first",50);
      }
      
      public function readHistory(param1:uint, param2:uint, param3:Function = null, param4:Function = null) : void
      {
         var page:uint = param1;
         var pageSize:uint = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         _payVaultReadHistory(page,pageSize,function(param1:Array):void
         {
            if(callback != null)
            {
               callback(Converter.§1t11522s0§(param1));
            }
         },errorHandler);
      }
      
      public function §1t4235s0§(param1:Function = null, param2:Function = null) : void
      {
         var callback:Function = param1;
         var errorHandler:Function = param2;
         _payVaultRefresh(_version,function(param1:PayVaultContents):void
         {
            parseVault(param1);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function §1t4686s0§(param1:uint, param2:String, param3:Function = null, param4:Function = null) : void
      {
         var amount:uint = param1;
         var reason:String = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         _payVaultCredit(amount,reason,function(param1:PayVaultContents):void
         {
            parseVault(param1);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function §1t4687s0§(param1:uint, param2:String, param3:Function = null, param4:Function = null) : void
      {
         var amount:uint = param1;
         var reason:String = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         _payVaultDebit(amount,reason,function(param1:PayVaultContents):void
         {
            parseVault(param1);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function consume(param1:Array, param2:Function = null, param3:Function = null) : void
      {
         var item:§1t382s0§;
         var items:Array = param1;
         var callback:Function = param2;
         var errorHandler:Function = param3;
         var ids:Array = [];
         var a:int = 0;
         while(a < items.length)
         {
            item = items[a] as §1t382s0§;
            if(item == null)
            {
               throw new playerio.generated.PlayerIOError("Element is not a VaultItem: " + items[a],2);
            }
            ids.push(item.id);
            a = a + 1;
         }
         _payVaultConsume(ids,function(param1:PayVaultContents):void
         {
            parseVault(param1);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function getBuyDirectInfo(param1:String, param2:Object, param3:Array, param4:Function = null, param5:Function = null) : void
      {
         _payVaultPaymentInfo(param1,param2,Converter.§1t11523s0§(param3),param4,param5);
      }
      
      public function §1t4690s0§(param1:String, param2:Object, param3:Function = null, param4:Function = null) : void
      {
         _payVaultPaymentInfo(param1,param2,null,param3,param4);
      }
      
      public function buy(param1:Array, param2:Boolean, param3:Function = null, param4:Function = null) : void
      {
         var items:Array = param1;
         var storeItems:Boolean = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         _payVaultBuy(Converter.§1t11523s0§(items),storeItems,function(param1:PayVaultContents):void
         {
            parseVault(param1);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function give(param1:Array, param2:Function = null, param3:Function = null) : void
      {
         var items:Array = param1;
         var callback:Function = param2;
         var errorHandler:Function = param3;
         _payVaultGive(Converter.§1t11523s0§(items),function(param1:PayVaultContents):void
         {
            parseVault(param1);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function usePaymentInfo(param1:String, param2:Object, param3:Function = null, param4:Function = null) : void
      {
         var provider:String = param1;
         var providerArguments:Object = param2;
         var callback:Function = param3;
         var errorHandler:Function = param4;
         _payVaultUsePaymentInfo(provider,providerArguments,function(param1:Object, param2:PayVaultContents):void
         {
            parseVault(param2);
            if(callback != null)
            {
               callback(param1);
            }
         },errorHandler);
      }
      
      public function has(param1:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:§1t382s0§ = null;
         _loc3_ = 0;
         while(_loc3_ < items.length)
         {
            _loc2_ = items[_loc3_] as §1t382s0§;
            if(_loc2_.itemKey == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function first(param1:String) : §1t382s0§
      {
         var _loc3_:int = 0;
         var _loc2_:§1t382s0§ = null;
         _loc3_ = 0;
         while(_loc3_ < items.length)
         {
            _loc2_ = items[_loc3_] as §1t382s0§;
            if(_loc2_.itemKey == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function count(param1:String) : uint
      {
         var _loc4_:int = 0;
         var _loc2_:§1t382s0§ = null;
         var _loc3_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < items.length)
         {
            _loc2_ = items[_loc4_] as §1t382s0§;
            if(_loc2_.itemKey == param1)
            {
               _loc3_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function parseVault(param1:PayVaultContents) : void
      {
         if(param1 != null)
         {
            _version = param1.version;
            _coins = param1.coins;
            _items = Converter.§1t11521s0§(param1.items);
         }
      }
   }
}

