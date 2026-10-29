package playerio
{
   public dynamic class VaultItem
   {
      
      private var _id:String;
      
      private var _itemKey:String;
      
      private var _purchaseDate:Date;
      
      private var prefix:String = "    ";
      
      public function VaultItem(id:String, itemKey:String, purchaseDate:Date)
      {
         super();
         this._id = id;
         this._itemKey = itemKey;
         this._purchaseDate = purchaseDate;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get itemKey() : String
      {
         return _itemKey;
      }
      
      public function get purchaseDate() : Date
      {
         return _purchaseDate;
      }
      
      public function toString() : String
      {
         var ret:String = "[playerio.VaultItem]";
         return ret + ("[itemKey=\"" + _itemKey + "\", id=\"" + _id + "\", purchaseDate=" + _purchaseDate + "] = " + serialize(prefix,this));
      }
      
      private function serialize(pf:String, value:*) : String
      {
         var a:int = 0;
         var ret:String = "";
         var x:String = "";
         var toshow:Array = [];
         if(value is String)
         {
            return "\"" + value + "\"";
         }
         if(value is Array)
         {
            ret = "[\n";
            for(x in value)
            {
               if(value[x] !== undefined)
               {
                  toshow.push({
                     "id":x,
                     "value":serialize(pf + prefix,value[x])
                  });
               }
            }
            toshow.sortOn("id",16);
            for(a = 0; a < toshow.length; )
            {
               ret += pf + toshow[a].id + ":" + toshow[a].value + "\n";
               a++;
            }
            return ret + (pf.substring(4) + "]");
         }
         if(value is Object)
         {
            if(value.constructor == Object || value.constructor == VaultItem)
            {
               ret = "{\n";
               for(x in value)
               {
                  if(value[x] !== undefined)
                  {
                     toshow.push({
                        "id":x,
                        "value":serialize(pf + prefix,value[x])
                     });
                  }
               }
               toshow.sortOn("id");
               for(a = 0; a < toshow.length; )
               {
                  ret += pf + toshow[a].id + ":" + toshow[a].value + "\n";
                  a++;
               }
               return ret + (pf.substring(4) + "}");
            }
         }
         if(value == null)
         {
            return value;
         }
         return value.toString();
      }
   }
}

