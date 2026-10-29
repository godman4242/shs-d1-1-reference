package playerio
{
   import playerio.generated.PayVault;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.*;
   import playerio.utils.*;
   
   public class PayVault extends playerio.generated.PayVault
   {
      
      private var _version:String = null;
      
      private var _coins:int = 0;
      
      private var _items:Array = [];
      
      public function PayVault(channel:HTTPChannel, client:Client)
      {
         super(channel,client);
      }
      
      public function get coins() : int
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
      
      public function readHistory(page:uint, pageSize:uint, callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultReadHistory(page,pageSize,function(history:Array):void
         {
            if(callback != null)
            {
               callback(Converter.toPayVaultHistoryEntryArray(history));
            }
         },errorHandler);
      }
      
      public function refresh(callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultRefresh(_version,function(vault:PayVaultContents):void
         {
            parseVault(vault);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function credit(amount:uint, reason:String, callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultCredit(amount,reason,function(vault:PayVaultContents):void
         {
            parseVault(vault);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function debit(amount:uint, reason:String, callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultDebit(amount,reason,function(vault:PayVaultContents):void
         {
            parseVault(vault);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function consume(items:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var a:int;
         var item:VaultItem;
         var ids:Array = [];
         for(a = 0; a < items.length; )
         {
            item = items[a] as VaultItem;
            if(item == null)
            {
               throw new playerio.generated.PlayerIOError("Element is not a VaultItem: " + items[a],2);
            }
            ids.push(item.id);
            a = a + 1;
         }
         _payVaultConsume(ids,function(vault:PayVaultContents):void
         {
            parseVault(vault);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function getBuyDirectInfo(provider:String, purchaseArguments:Object, items:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultPaymentInfo(provider,purchaseArguments,Converter.toBuyItemInfoArray(items),callback,errorHandler);
      }
      
      public function getBuyCoinsInfo(provider:String, purchaseArguments:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultPaymentInfo(provider,purchaseArguments,null,callback,errorHandler);
      }
      
      public function buy(items:Array, storeItems:Boolean, callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultBuy(Converter.toBuyItemInfoArray(items),storeItems,function(vault:PayVaultContents):void
         {
            parseVault(vault);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function give(items:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultGive(Converter.toBuyItemInfoArray(items),function(vault:PayVaultContents):void
         {
            parseVault(vault);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function usePaymentInfo(provider:String, providerArguments:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         _payVaultUsePaymentInfo(provider,providerArguments,function(info:Object, vault:PayVaultContents):void
         {
            parseVault(vault);
            if(callback != null)
            {
               callback(info);
            }
         },errorHandler);
      }
      
      public function has(itemKey:String) : Boolean
      {
         var a:int = 0;
         var vi:VaultItem = null;
         for(a = 0; a < items.length; )
         {
            vi = items[a] as VaultItem;
            if(vi.itemKey == itemKey)
            {
               return true;
            }
            a++;
         }
         return false;
      }
      
      public function first(itemKey:String) : VaultItem
      {
         var a:int = 0;
         var vi:VaultItem = null;
         for(a = 0; a < items.length; )
         {
            vi = items[a] as VaultItem;
            if(vi.itemKey == itemKey)
            {
               return vi;
            }
            a++;
         }
         return null;
      }
      
      public function count(itemKey:String) : uint
      {
         var a:int = 0;
         var vi:VaultItem = null;
         var c:int = 0;
         for(a = 0; a < items.length; )
         {
            vi = items[a] as VaultItem;
            if(vi.itemKey == itemKey)
            {
               c++;
            }
            a++;
         }
         return c;
      }
      
      private function parseVault(vault:PayVaultContents) : void
      {
         if(vault != null)
         {
            _version = vault.version;
            _coins = vault.coins;
            _items = Converter.toVaultItemArray(vault.items);
         }
      }
   }
}

