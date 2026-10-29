package playerio.utils
{
   import flash.utils.ByteArray;
   import playerio.DatabaseObject;
   import playerio.PayVaultHistoryEntry;
   import playerio.RoomInfo;
   import playerio.VaultItem;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.*;
   import playerio.helpers.FieldToBeRemoved;
   
   public class Converter
   {
      
      public function Converter()
      {
         super();
      }
      
      public static function toVaultItemArray(input:Array) : Array
      {
         var a:int = 0;
         var pi:PayVaultItem = null;
         var d:Date = null;
         var vi:VaultItem = null;
         var p:int = 0;
         var prop:ObjectProperty = null;
         var ret:Array = [];
         for(a = 0; a < input.length; )
         {
            pi = input[a] as PayVaultItem;
            d = new Date();
            d.setTime(pi.purchaseDate);
            vi = new VaultItem(pi.id,pi.itemKey,d);
            for(p = 0; p < pi.properties.length; )
            {
               prop = pi.properties[p];
               vi[prop.name] = deserializeValueObject(prop.value);
               p++;
            }
            ret.push(vi);
            a++;
         }
         return ret;
      }
      
      public static function toPayVaultHistoryEntryArray(input:Array) : Array
      {
         var a:int = 0;
         var ce:playerio.generated.messages.PayVaultHistoryEntry = null;
         var d:Date = null;
         var ret:Array = [];
         for(a = 0; a < input.length; )
         {
            ce = input[a] as playerio.generated.messages.PayVaultHistoryEntry;
            d = new Date();
            d.setTime(ce.timestamp);
            ret.push(new playerio.PayVaultHistoryEntry(ce.amount,ce.type,d,ce.itemKeys,ce.reason,ce.providerTransactionId,ce.providerPrice));
            a++;
         }
         return ret;
      }
      
      public static function toBuyItemInfoArray(input:Array) : Array
      {
         var a:int = 0;
         var o:Object = null;
         var bi:PayVaultBuyItemInfo = null;
         var output:Array = [];
         for(a = 0; a < input.length; )
         {
            o = input[a];
            if(!(o.itemKey is String))
            {
               throw new PlayerIOError("itemKey not defined on parsed item",2);
            }
            bi = new PayVaultBuyItemInfo();
            bi.itemKey = o.itemKey;
            bi.payload = getObjectProperties(o,false,"itemKey");
            output.push(bi);
            a++;
         }
         return output;
      }
      
      public static function toKeyValueArray(input:Object) : Array
      {
         var kvp:KeyValuePair = null;
         var ret:Array = [];
         for(var key in input)
         {
            kvp = new KeyValuePair();
            kvp.key = key;
            kvp.value = input[key].toString();
            ret.push(kvp);
         }
         return ret;
      }
      
      public static function toKeyValueObject(input:Array) : Object
      {
         var a:int = 0;
         var kvp:KeyValuePair = null;
         var ret:Object = {};
         for(a = 0; a < input.length; )
         {
            kvp = input[a] as KeyValuePair;
            ret[kvp.key] = kvp.value;
            a++;
         }
         return ret;
      }
      
      public static function toRoomInfoArray(input:Array) : Array
      {
         var a:int = 0;
         var ri:playerio.generated.messages.RoomInfo = null;
         var re:playerio.RoomInfo = null;
         var ret:Array = [];
         for(a = 0; a < input.length; )
         {
            ri = input[a] as playerio.generated.messages.RoomInfo;
            re = new playerio.RoomInfo(ri.id,ri.roomType,ri.onlineUsers,Converter.toKeyValueObject(ri.roomData));
            ret.push(re);
            a++;
         }
         return ret;
      }
      
      public static function toDatabaseObject(table:String, obj:BigDBObject, isPlayerObject:Boolean, save:Function) : DatabaseObject
      {
         if(obj == null)
         {
            return null;
         }
         var db:DatabaseObject = new DatabaseObject(table,obj.key,obj.version,obj.creator,isPlayerObject,save);
         for each(var op in obj.properties)
         {
            db[op.name] = deserializeValueObject(op.value);
         }
         if(save != null)
         {
            db.commit();
         }
         return db;
      }
      
      public static function toSparseBigDBObject(key:String, version:String, creator:int, data:Object) : BigDBObject
      {
         var op:ObjectProperty = null;
         var db:BigDBObject = new BigDBObject();
         db.key = key;
         db.version = version;
         db.creator = creator;
         data ||= {};
         for(var x in data)
         {
            if(data[x] !== undefined)
            {
               op = new ObjectProperty();
               op.name = x;
               op.value = getValueObject(data[x],true);
               db.properties.push(op);
            }
         }
         return db;
      }
      
      public static function toBigDBObject(key:String, version:String, creator:int, data:Object) : BigDBObject
      {
         var op:ObjectProperty = null;
         var db:BigDBObject = new BigDBObject();
         db.key = key;
         db.version = version;
         db.creator = creator;
         data ||= {};
         for(var x in data)
         {
            op = new ObjectProperty();
            op.name = x;
            op.value = getValueObject(data[x]);
            db.properties.push(op);
         }
         return db;
      }
      
      public static function toNewBigDBObject(table:String, key:String, data:Object) : NewBigDBObject
      {
         var op:ObjectProperty = null;
         var db:NewBigDBObject = new NewBigDBObject();
         db.table = table;
         db.key = key;
         data ||= {};
         for(var x in data)
         {
            op = new ObjectProperty();
            op.name = x;
            op.value = getValueObject(data[x],true);
            db.properties.push(op);
         }
         return db;
      }
      
      public static function toValueObjectArray(arr:Array) : Array
      {
         var a:int = 0;
         var ret:Array = [];
         for(a = 0; a < arr.length; )
         {
            ret.push(getValueObject(arr[a]));
            a++;
         }
         return ret;
      }
      
      private static function getValueObject(o:*, sparse:Boolean = false) : ValueObject
      {
         var l:ByteArray = null;
         var l2:ByteArray = null;
         var vo:ValueObject = new ValueObject();
         if(o is FieldToBeRemoved)
         {
            return null;
         }
         switch(o)
         {
            case undefined:
               return null;
            case null:
               vo.valueType = 0;
               vo.string = null;
               break;
            default:
               if(o is Date)
               {
                  vo.valueType = 8;
                  vo.dateTime = (o as Date).getTime();
                  break;
               }
               if(o is Array)
               {
                  vo.valueType = 9;
                  vo.arrayProperties = getArrayProperties(o,sparse);
                  break;
               }
               if(o is String)
               {
                  vo.valueType = 0;
                  vo.string = o;
                  break;
               }
               if(o is Boolean)
               {
                  vo.valueType = 4;
                  vo.bool = o;
                  break;
               }
               if(o is ByteArray)
               {
                  vo.valueType = 7;
                  vo.byteArray = o;
                  break;
               }
               if(o is Number)
               {
                  l = new ByteArray();
                  l.writeInt(o);
                  l.position = 0;
                  l2 = new ByteArray();
                  l2.writeUnsignedInt(o);
                  l2.position = 0;
                  if(l.readInt() == o)
                  {
                     vo.valueType = 1;
                     vo.int32 = o;
                  }
                  else if(l2.readUnsignedInt() == o)
                  {
                     vo.valueType = 2;
                     vo.uInt = o;
                  }
                  else if(Math.floor(o) == o && o <= 9223372036854774800 && o >= -9223372036854774800)
                  {
                     vo.valueType = 3;
                     vo.long = o;
                  }
                  else
                  {
                     l = new ByteArray();
                     l.writeFloat(o);
                     l.position = 0;
                     if(l.readFloat() == o)
                     {
                        vo.valueType = 5;
                        vo.float = o;
                     }
                     else
                     {
                        vo.valueType = 6;
                        vo.double = o;
                     }
                  }
                  break;
               }
               if(o.constructor == Object)
               {
                  vo.valueType = 10;
                  vo.objectProperties = getObjectProperties(o,sparse);
               }
         }
         return vo;
      }
      
      private static function getArrayProperties(arr:Array, sparse:Boolean = false) : Array
      {
         var x:int = 0;
         var ap:ArrayProperty = null;
         var ret:Array = [];
         for(x = 0; x < arr.length; )
         {
            if(!(arr[x] === undefined && sparse))
            {
               ap = new ArrayProperty();
               ap.index = x;
               ap.value = getValueObject(arr[x],sparse);
               ret.push(ap);
            }
            x++;
         }
         return ret;
      }
      
      private static function getObjectProperties(obj:Object, sparse:Boolean = false, ignore:String = null) : Array
      {
         var op:ObjectProperty = null;
         var ret:Array = [];
         for(var x in obj)
         {
            if(!(obj[x] === undefined && sparse || x == ignore))
            {
               op = new ObjectProperty();
               op.name = x;
               op.value = getValueObject(obj[x],sparse);
               ret.push(op);
            }
         }
         return ret;
      }
      
      private static function deserializeValueObject(v:ValueObject) : *
      {
         var d:Date = null;
         switch(v.valueType)
         {
            case 0:
               return v.string;
            case 1:
               return v.int32 || 0;
            case 2:
               return v.uInt || 0;
            case 3:
               return v.long || 0;
            case 4:
               return v.bool;
            case 5:
               return v.float || 0;
            case 6:
               return v.double || 0;
            case 7:
               return v.byteArray;
            case 8:
               d = new Date();
               d.setTime(v.dateTime);
               return d;
            case 9:
               return getArray(v.arrayProperties);
            case 10:
               return getObject(v.objectProperties);
            default:
               throw new Error("Unknown valuetype in returned BigDBObject",0);
         }
      }
      
      private static function getArray(arr:Array) : Array
      {
         var a:int = 0;
         var ap:ArrayProperty = null;
         var ret:Array = [];
         for(a = 0; a < arr.length; )
         {
            ap = arr[a] as ArrayProperty;
            if(ap.value != null)
            {
               ret[ap.index] = deserializeValueObject(ap.value);
            }
            a++;
         }
         return ret;
      }
      
      private static function getObject(arr:Array) : Object
      {
         var a:int = 0;
         var op:ObjectProperty = null;
         var ret:Object = {};
         for(a = 0; a < arr.length; )
         {
            op = arr[a] as ObjectProperty;
            ret[op.name] = deserializeValueObject(op.value);
            a++;
         }
         return ret;
      }
   }
}

