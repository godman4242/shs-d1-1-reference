package Facebook
{
   import flash.events.*;
   import flash.external.*;
   import flash.net.*;
   import flash.system.*;
   
   public class FBQuery extends FBWaitable
   {
      
      private static var counter:int = 0;
      
      public var name:String = "";
      
      public var hasDependency:Boolean = false;
      
      public var fields:Array = [];
      
      public var table:String = null;
      
      public var where:Object = null;
      
      public function FBQuery()
      {
         super();
         this.name = "v_" + counter++;
      }
      
      internal function parse(template:String, args:Array) : FBQuery
      {
         var fql:String = FB.stringFormat(template,args);
         var re:Object = /^select (.*?) from (\w+)\s+where (.*)$/i.exec(fql);
         this.fields = this._toFields(re[1]);
         this.table = re[2];
         this.where = this._parseWhere(re[3]);
         for(var i:uint = 0; i < args.length; i++)
         {
            if(args[i] is FBQuery)
            {
               args[i].hasDependency = true;
            }
         }
         return this;
      }
      
      public function toFql() : String
      {
         var s:String = "select " + this.fields.join(",") + " from " + this.table + " where ";
         switch(this.where.type)
         {
            case "unknown":
               s += this.where.value;
               break;
            case "index":
               s += this.where.key + "=" + this._encode(this.where.value);
               break;
            case "in":
               if(this.where.value.length == 1)
               {
                  s += this.where.key + "=" + this._encode(this.where.value[0]);
               }
               else
               {
                  s += this.where.key + " in (" + FB.arrayMap(this.where.value,this._encode).join(",") + ")";
               }
         }
         return s;
      }
      
      private function _encode(value:Object) : String
      {
         return typeof value == "string" ? FB.stringQuote(value + "") : value + "";
      }
      
      public function toString() : String
      {
         return "#" + this.name;
      }
      
      private function _toFields(s:String) : Array
      {
         return FB.arrayMap(s.split(","),FB.stringTrim);
      }
      
      private function _parseWhere(s:String) : Object
      {
         var re:Object = /^\s*(\w+)\s*=\s*(.*)\s*$/i.exec(s);
         var result:Object = null;
         var value:* = null;
         var type:String = "unknown";
         if(re)
         {
            value = re[2];
            if(/^(["'])(?:\\?.)*?\1$/.test(value))
            {
               value = FBJSON.deserialize(value);
               type = "index";
            }
            else if(/^\d+\.?\d*$/.test(value))
            {
               type = "index";
            }
         }
         if(type == "index")
         {
            result = {
               "type":"index",
               "key":re[1],
               "value":value
            };
         }
         else
         {
            result = {
               "type":"unknown",
               "value":s
            };
         }
         return result;
      }
   }
}

