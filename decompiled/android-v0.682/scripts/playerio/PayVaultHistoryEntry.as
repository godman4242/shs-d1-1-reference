package playerio
{
   public dynamic class PayVaultHistoryEntry
   {
      
      private var _amount:int;
      
      private var _type:String;
      
      private var _timestamp:Date;
      
      private var _itemKeys:Array;
      
      private var _reason:String;
      
      private var _providerTransactionId:String;
      
      private var _providerPrice:String;
      
      public function PayVaultHistoryEntry(amount:int, type:String, timestamp:Date, itemKeys:Array, reason:String, providerTransactionId:String, providerPrice:String)
      {
         super();
         this._amount = amount;
         this._type = type;
         this._timestamp = timestamp;
         this._itemKeys = itemKeys;
         this._reason = reason;
         this._providerTransactionId = providerTransactionId;
         this._providerPrice = providerPrice;
      }
      
      public function get amount() : int
      {
         return _amount;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get timestamp() : Date
      {
         return _timestamp;
      }
      
      public function get itemKeys() : Array
      {
         return _itemKeys;
      }
      
      public function get reason() : String
      {
         return _reason;
      }
      
      public function get providerTransactionId() : String
      {
         return _providerTransactionId;
      }
      
      public function get providerPrice() : String
      {
         return _providerPrice;
      }
      
      public function toString() : String
      {
         var ret:String = "[playerio.PayVaultHistoryEntry] = {\n";
         ret += "\ttype:\"" + _type + "\"\n";
         ret += "\tamount:" + _amount + "\n";
         ret += "\ttimestamp:" + _timestamp + "\n";
         ret += "\titemKeys:[" + _itemKeys + "]\n";
         ret += "\treason:\"" + _reason + "\"\n";
         ret += "\tproviderTransactionId:" + (_providerTransactionId !== null ? "\"" + _providerTransactionId + "\"" : "null") + "\n";
         ret += "\tproviderPrice:\"" + _providerPrice + "\"\n";
         return ret + "}";
      }
   }
}

