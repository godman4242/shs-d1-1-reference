package Facebook
{
   import flash.events.*;
   import flash.external.*;
   import flash.net.*;
   import flash.system.*;
   import flash.utils.*;
   
   public class FBData
   {
      
      private var timer:int = -1;
      
      private var queue:Array = [];
      
      public function FBData()
      {
         super();
      }
      
      public function query(template:String, ... args) : FBQuery
      {
         var query:FBQuery = new FBQuery().parse(template,args);
         this.queue.push(query);
         this._waitToProcess();
         return query;
      }
      
      public function waitOn(dependencies:Array, callback:Function) : FBWaitable
      {
         var result:FBWaitable = null;
         var count:int = 0;
         result = new FBWaitable();
         count = int(dependencies.length);
         FB.forEach(dependencies,function(item:*, index:*, original:*):void
         {
            item.monitor("value",function():Boolean
            {
               var value:* = undefined;
               var done:Boolean = false;
               if(FB.Data._getValue(item) != null)
               {
                  --count;
                  done = true;
               }
               if(count == 0)
               {
                  value = callback(FB.arrayMap(dependencies,FB.Data._getValue));
                  result.value = value != null ? value : true;
               }
               return done;
            });
         });
         return result;
      }
      
      private function _getValue(item:*) : *
      {
         return item is FBWaitable ? item.value : item;
      }
      
      private function _waitToProcess() : void
      {
         if(this.timer < 0)
         {
            this.timer = setTimeout(this._process,10);
         }
      }
      
      private function _process() : void
      {
         var q:Array;
         var i:int;
         var params:Object;
         var mqueries:Object = null;
         var item:FBQuery = null;
         this.timer = -1;
         mqueries = {};
         q = this.queue;
         this.queue = [];
         for(i = 0; i < q.length; i++)
         {
            item = q[i];
            if(item.where.type == "index" && !item.hasDependency)
            {
               this._mergeIndexQuery(item,mqueries);
            }
            else
            {
               mqueries[item.name] = item;
            }
         }
         params = {
            "method":"fql.multiquery",
            "queries":{}
         };
         FB.objCopy(params.queries,mqueries,true,function(query:FBQuery):String
         {
            return query.toFql();
         });
         params.queries = FBJSON.serialize(params.queries);
         FB.api(params,function(result:*):void
         {
            var key:String = null;
            var x:int = 0;
            var o:* = undefined;
            if(result.error_msg)
            {
               for(key in mqueries)
               {
                  mqueries[key].error(new Error(result.error_msg));
               }
            }
            else
            {
               for(x = 0; x < result.length; x++)
               {
                  o = result[x];
                  mqueries[o.name].value = o.fql_result_set;
               }
            }
         });
      }
      
      private function _mergeIndexQuery(item:FBQuery, mqueries:Object) : void
      {
         var key:String = null;
         var value:* = undefined;
         key = item.where.key;
         value = item.where.value;
         var name:String = "index_" + item.table + "_" + key;
         var master:FBQuery = mqueries[name];
         if(!master)
         {
            master = mqueries[name] = new FBQuery();
            master.fields = [key];
            master.table = item.table;
            master.where = {
               "type":"in",
               "key":key,
               "value":[]
            };
         }
         FB.arrayMerge(master.fields,item.fields);
         FB.arrayMerge(master.where.value,[value]);
         master.wait(function(r:Array):void
         {
            item.value = FB.arrayFilter(r,function(x:Object):Boolean
            {
               return x[key] == value;
            });
         },function(e:*):void
         {
            item.fire("error",e);
         });
      }
   }
}

