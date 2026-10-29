package playerio
{
   import playerio.helpers.FieldToBeRemoved;
   import playerio.utils.Converter;
   
   public dynamic class DatabaseObject
   {
      
      private var _table:String = "";
      
      private var _version:String = "";
      
      private var _creator:uint = 0;
      
      private var _key:String = "";
      
      private var _saveHandler:Function;
      
      private var _cache:DatabaseObject;
      
      private var _createIfMissing:Boolean = false;
      
      private var saveQueue:Array = [];
      
      private var inSave:Boolean = false;
      
      private var prefix:String = "    ";
      
      public function DatabaseObject(table:String, key:String, version:String, creator:uint, createIfMissing:Boolean, saveHandler:Function)
      {
         super();
         this._table = table;
         this._version = version;
         this._creator = creator;
         this._key = key;
         this._saveHandler = saveHandler;
         this._createIfMissing = createIfMissing;
      }
      
      public function save(useOptimisticLock:Boolean = false, fullOverwrite:Boolean = false, callback:Function = null, errorHandler:Function = null) : void
      {
         var lastEntry:SaveQueueItem = null;
         var qi:SaveQueueItem = null;
         if(fullOverwrite)
         {
            throw new Error("FullOverwrite is not yet supported by BigDB - Stay tuned at www.player.io for updates!",0);
         }
         var cached:DatabaseObject = Converter.toDatabaseObject(table,Converter.toSparseBigDBObject(key,_version,_creator,this),_createIfMissing,null);
         if(inSave)
         {
            lastEntry = saveQueue.length > 0 ? saveQueue[saveQueue.length - 1] : null;
            if(lastEntry != null && lastEntry.useOptimisticLock == useOptimisticLock && lastEntry.fullOverwrite == fullOverwrite)
            {
               lastEntry.data = cached;
               lastEntry.callbacks.push(callback);
               lastEntry.errorHandlers.push(errorHandler);
            }
            else
            {
               qi = new SaveQueueItem();
               qi.data = cached;
               qi.callbacks.push(callback);
               qi.errorHandlers.push(errorHandler);
               qi.fullOverwrite = fullOverwrite;
               qi.useOptimisticLock = useOptimisticLock;
               saveQueue.push(qi);
            }
            return;
         }
         doSave(cached,useOptimisticLock,fullOverwrite,callback,errorHandler);
      }
      
      public function commit() : void
      {
         _cache = Converter.toDatabaseObject(table,Converter.toSparseBigDBObject(key,_version,_creator,this),_createIfMissing,null);
      }
      
      private function doSave(cached:DatabaseObject, useOptimisticLock:Boolean = false, fullOverwrite:Boolean = false, callback:Function = null, errorHandler:Function = null) : void
      {
         var changed:Boolean;
         var x:String;
         inSave = true;
         var ret:Object = {};
         compareObject(_cache,cached,ret);
         changed = false;
         var _loc8_:int = 0;
         var _loc7_:Object = ret;
         for(x in _loc7_)
         {
            changed = true;
         }
         if(!changed)
         {
            if(callback != null)
            {
               callback();
            }
            emptyQueue();
            return;
         }
         this._saveHandler(_table,_key,_version,ret,useOptimisticLock,_createIfMissing,function(version:String):void
         {
            if(version == null)
            {
               if(errorHandler == null)
               {
                  throw PlayerIOError.StaleVersion;
               }
               errorHandler(PlayerIOError.StaleVersion);
            }
            else
            {
               _version = version;
               _cache = cached;
               if(callback != null)
               {
                  callback();
               }
            }
            emptyQueue();
         },function(e:PlayerIOError):void
         {
            emptyQueue();
            if(errorHandler == null)
            {
               throw e;
            }
            errorHandler(e);
         });
      }
      
      private function emptyQueue() : void
      {
         var qi:SaveQueueItem;
         inSave = false;
         if(saveQueue.length != 0)
         {
            qi = saveQueue.shift();
            doSave(qi.data,qi.useOptimisticLock,qi.fullOverwrite,function():void
            {
               var c:int = 0;
               for(c = 0; c < qi.callbacks.length; )
               {
                  if(qi.callbacks[c] != null)
                  {
                     qi.callbacks[c]();
                  }
                  c++;
               }
            },function(e:PlayerIOError):void
            {
               var er:int = 0;
               for(er = 0; er < qi.errorHandlers.length; )
               {
                  if(qi.errorHandlers[er] == null)
                  {
                     throw e;
                  }
                  qi.errorHandlers[er](e);
                  er++;
               }
            });
         }
      }
      
      public function get table() : String
      {
         return _table;
      }
      
      public function get key() : String
      {
         return _key;
      }
      
      private function compareObject(before:Object, after:Object, target:Object = null) : Object
      {
         var x:String;
         var na:Array;
         var no:Object;
         var changed:Boolean;
         var nx:String;
         var setProp:* = function(prop:String, value:*):void
         {
            ret[prop] = value;
         };
         var ret:Object = target || {};
         var prop:Object = mergePropertyList(before,after);
         for(x in prop)
         {
            if(before[x] !== after[x])
            {
               if(after[x] === undefined)
               {
                  setProp(x,new FieldToBeRemoved());
               }
               else if(before[x] is Array && after[x] is Array)
               {
                  na = objectToArray(compareObject(before[x],after[x]));
                  if(na.length > 0)
                  {
                     setProp(x,na);
                  }
               }
               else if(before[x] is Object && before[x].constructor == Object && after[x] is Object && after[x].constructor == Object)
               {
                  no = compareObject(before[x],after[x]);
                  changed = false;
                  var _loc6_:int = 0;
                  var _loc5_:Object = no;
                  for(nx in _loc5_)
                  {
                     changed = true;
                  }
                  if(changed)
                  {
                     setProp(x,no);
                  }
               }
               else
               {
                  setProp(x,after[x]);
               }
            }
         }
         return ret;
      }
      
      private function mergePropertyList(a:Object, b:Object) : Object
      {
         var a1:int = 0;
         var a2:int = 0;
         var ret:Object = {};
         if(a is Array)
         {
            a1 = 0;
            while(a1 < a.length)
            {
               ret[a1] = true;
               a1++;
            }
         }
         else
         {
            for(var x1 in a)
            {
               ret[x1] = true;
            }
         }
         if(b is Array)
         {
            a2 = 0;
            while(a2 < b.length)
            {
               ret[a2] = true;
               a2++;
            }
         }
         else
         {
            for(var x2 in b)
            {
               ret[x2] = true;
            }
         }
         return ret;
      }
      
      private function objectToArray(o:Object) : Array
      {
         var ret:Array = [];
         for(var x in o)
         {
            ret[parseInt(x)] = o[x];
         }
         return ret;
      }
      
      public function toString() : String
      {
         var ret:String = "[playerio.DatabaseObject]\n";
         return ret + (_table + "[\"" + key + "\"] = " + serialize(prefix,this) + " (Version:" + _version + ")");
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
            for(a = 0; a < value.length; )
            {
               if(value[a] !== undefined)
               {
                  toshow.push({
                     "id":a,
                     "value":serialize(pf + prefix,value[a])
                  });
               }
               a++;
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
            if(value.constructor == Object || value.constructor == DatabaseObject)
            {
               ret = "{\n";
               for(x in value)
               {
                  toshow.push({
                     "id":x,
                     "value":serialize(pf + prefix,value[x])
                  });
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
         switch(value)
         {
            case null:
               return "null";
            case undefined:
               return "undefined";
            default:
               return value.toString();
         }
      }
   }
}

class SaveQueueItem
{
   
   public var data:DatabaseObject;
   
   public var callbacks:Array = [];
   
   public var errorHandlers:Array = [];
   
   public var useOptimisticLock:Boolean;
   
   public var fullOverwrite:Boolean;
   
   public function SaveQueueItem()
   {
      super();
   }
}
