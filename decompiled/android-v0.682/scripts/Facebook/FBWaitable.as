package Facebook
{
   import flash.events.*;
   import flash.external.*;
   import flash.system.*;
   import flash.utils.*;
   
   public class FBWaitable
   {
      
      private var subscribers:Object = {};
      
      private var _value:Object = null;
      
      public function FBWaitable()
      {
         super();
      }
      
      public function set value(value:Object) : void
      {
         if(FBJSON.serialize(value) != FBJSON.serialize(this._value))
         {
            this._value = value;
            this.fire("value",value);
         }
      }
      
      public function get value() : Object
      {
         return this._value;
      }
      
      public function error(ex:Error) : void
      {
         this.fire("error",ex);
      }
      
      public function wait(callback:Function, ... args) : void
      {
         var t:* = undefined;
         var errorHandler:Function = args.length == 1 && args[0] is Function ? args[0] : null;
         if(errorHandler != null)
         {
            this.subscribe("error",errorHandler);
         }
         t = this;
         this.monitor("value",function():Boolean
         {
            if(t.value != null)
            {
               callback(t.value);
               return true;
            }
            return false;
         });
      }
      
      public function subscribe(name:String, cb:Function) : void
      {
         if(!this.subscribers[name])
         {
            this.subscribers[name] = [cb];
         }
         else
         {
            this.subscribers[name].push(cb);
         }
      }
      
      public function unsubscribe(name:String, cb:Function) : void
      {
         var i:int = 0;
         var subs:Array = this.subscribers[name];
         if(subs)
         {
            for(i = 0; i != subs.length; i++)
            {
               if(subs[i] == cb)
               {
                  subs[i] = null;
               }
            }
         }
      }
      
      public function monitor(name:String, callback:Function) : void
      {
         var ctx:FBWaitable = null;
         var fn:Function = null;
         if(!callback())
         {
            ctx = this;
            fn = function(... args):void
            {
               if(callback.apply(callback,args))
               {
                  ctx.unsubscribe(name,fn);
               }
            };
            this.subscribe(name,fn);
         }
      }
      
      public function clear(name:String) : void
      {
         delete this.subscribers[name];
      }
      
      public function fire(name:String, ... args) : void
      {
         var i:int = 0;
         var subs:Array = this.subscribers[name];
         if(subs)
         {
            for(i = 0; i != subs.length; i++)
            {
               if(subs[i] != null)
               {
                  subs[i].apply(this,args);
               }
            }
         }
      }
   }
}

