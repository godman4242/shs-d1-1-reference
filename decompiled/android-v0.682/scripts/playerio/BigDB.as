package playerio
{
   import playerio.generated.BigDB;
   import playerio.generated.messages.BigDBChangeset;
   import playerio.generated.messages.BigDBObject;
   import playerio.generated.messages.BigDBObjectId;
   import playerio.generated.messages.NewBigDBObject;
   import playerio.utils.Converter;
   import playerio.utils.HTTPChannel;
   
   public class BigDB extends playerio.generated.BigDB
   {
      
      public function BigDB(channel:HTTPChannel, client:Client)
      {
         super(channel,client);
      }
      
      public function load(table:String, key:String, callback:Function = null, errorHandler:Function = null) : void
      {
         var db:BigDBObjectId = new BigDBObjectId();
         db.table = table;
         db.keys = [key];
         _loadObjects([db],function(objects:Array):void
         {
            if(callback != null)
            {
               callback(Converter.toDatabaseObject(table,objects[0],false,save));
            }
         },errorHandler);
      }
      
      public function loadOrCreate(table:String, key:String, callback:Function = null, errorHandler:Function = null) : void
      {
         var obj:NewBigDBObject = Converter.toNewBigDBObject(table,key,{});
         _createObjects([obj],true,function(objects:Array):void
         {
            if(callback != null)
            {
               callback(Converter.toDatabaseObject(table,objects[0],false,save));
            }
         },errorHandler);
      }
      
      public function loadKeys(table:String, keys:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var db:BigDBObjectId = new BigDBObjectId();
         db.table = table;
         db.keys = keys;
         _loadObjects([db],function(objects:Array):void
         {
            if(callback != null)
            {
               callback(toDatabaseObjectArray(table,objects));
            }
         },errorHandler);
      }
      
      public function loadKeysOrCreate(table:String, keys:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var a:int;
         var objs:Array = [];
         for(a = 0; a < keys.length; )
         {
            objs.push(Converter.toNewBigDBObject(table,keys[a],{}));
            a = a + 1;
         }
         _createObjects(objs,true,function(objects:Array):void
         {
            if(callback != null)
            {
               callback(toDatabaseObjectArray(table,objects));
            }
         },errorHandler);
      }
      
      public function createObject(table:String, key:String, data:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         var obj:NewBigDBObject = Converter.toNewBigDBObject(table,key,data);
         _createObjects([obj],false,function(objects:Array):void
         {
            objects[0].properties = obj.properties;
            if(callback != null)
            {
               callback(Converter.toDatabaseObject(table,objects[0],false,save));
            }
         },errorHandler);
      }
      
      public function loadMyPlayerObject(callback:Function = null, errorHandler:Function = null) : void
      {
         _loadMyPlayerObject(function(o:BigDBObject):void
         {
            if(callback != null)
            {
               callback(Converter.toDatabaseObject("PlayerObjects",o,true,save));
            }
         },errorHandler);
      }
      
      public function loadSingle(table:String, index:String, indexValue:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         _loadMatchingObjects(table,index,Converter.toValueObjectArray(indexValue),1,function(objects:Array):void
         {
            if(callback != null)
            {
               callback(Converter.toDatabaseObject(table,objects[0],false,save));
            }
         },errorHandler);
      }
      
      public function loadRange(table:String, index:String, path:Array, start:Object, stop:Object, limit:int, callback:Function = null, errorHandler:Function = null) : void
      {
         var startIndexValue:Array = start != null ? [start] : [];
         var stopIndexValue:Array = stop != null ? [stop] : [];
         if(path != null)
         {
            startIndexValue = path.concat(startIndexValue);
            stopIndexValue = path.concat(stopIndexValue);
         }
         _loadIndexRange(table,index,Converter.toValueObjectArray(startIndexValue),Converter.toValueObjectArray(stopIndexValue),limit,function(objects:Array):void
         {
            if(callback != null)
            {
               callback(toDatabaseObjectArray(table,objects));
            }
         },errorHandler);
      }
      
      public function deleteRange(table:String, index:String, path:Array, start:Object, stop:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         var startIndexValue:Array = start != null ? [start] : [];
         var stopIndexValue:Array = stop != null ? [stop] : [];
         if(path != null)
         {
            startIndexValue = path.concat(startIndexValue);
            stopIndexValue = path.concat(stopIndexValue);
         }
         _deleteIndexRange(table,index,Converter.toValueObjectArray(startIndexValue),Converter.toValueObjectArray(stopIndexValue),callback,errorHandler);
      }
      
      public function deleteKeys(table:String, keys:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var db:BigDBObjectId = new BigDBObjectId();
         db.table = table;
         db.keys = keys;
         _deleteObjects([db],callback,errorHandler);
      }
      
      private function save(table:String, key:String, version:String, changeset:Object, useOptimisticLocks:Boolean, createIfMissing:Boolean = false, callback:Function = null, errorHandler:Function = null) : void
      {
         var obj:NewBigDBObject;
         var cs:BigDBChangeset = new BigDBChangeset();
         cs.table = table;
         cs.key = key;
         if(useOptimisticLocks)
         {
            cs.onlyIfVersion = version;
         }
         obj = Converter.toNewBigDBObject(table,key,changeset);
         cs.changes = obj.properties;
         _saveObjectChanges(2,[cs],createIfMissing,function(versions:Array):void
         {
            callback(versions[0]);
         },errorHandler);
      }
      
      private function toDatabaseObjectArray(table:String, arr:Array) : Array
      {
         var a:int = 0;
         var ret:Array = [];
         for(a = 0; a < arr.length; )
         {
            ret.push(Converter.toDatabaseObject(table,arr[a],false,save));
            a++;
         }
         return ret;
      }
   }
}

