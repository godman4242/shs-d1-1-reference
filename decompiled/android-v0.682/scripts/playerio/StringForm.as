package playerio
{
   internal class StringForm
   {
      
      public function StringForm()
      {
         super();
      }
      
      internal static function decodeStringDictionary(input:String) : Object
      {
         var result:Object = null;
         var key:String = null;
         var i:int = 0;
         var colonIndex:int = 0;
         var length:int = 0;
         var str:String = null;
         try
         {
            result = {};
            key = null;
            for(i = 2; i < input.length; )
            {
               colonIndex = input.indexOf(":",i);
               length = int(input.substr(i,colonIndex - i));
               str = input.substr(colonIndex + 1,length);
               i = colonIndex + 1 + length + 1;
               if(key == null)
               {
                  key = str;
               }
               else
               {
                  result[key] = str;
                  key = null;
               }
            }
            return result;
         }
         catch(e:Error)
         {
            var _loc10_:Object = {"error":e.message};
         }
         return _loc10_;
      }
      
      internal static function encodeStringDictionary(input:Object) : String
      {
         var str:String = "A";
         if(input != null)
         {
            for(var key in input)
            {
               if(input[key] != undefined)
               {
                  str += ":";
                  str += key.length;
                  str += ":";
                  str += key;
                  str += ":";
                  str += (input[key] as String).length;
                  str += ":";
                  str += input[key] as String;
               }
            }
         }
         return str;
      }
      
      internal static function decodeStringArray(input:String) : Array
      {
         var i:int = 0;
         var colonIndex:int = 0;
         var length:int = 0;
         var str:String = null;
         var result:Array = [];
         for(i = 2; i < input.length; )
         {
            colonIndex = input.indexOf(":",i);
            length = int(input.substr(i,colonIndex - i));
            str = input.substr(colonIndex + 1,length);
            i = colonIndex + 1 + length + 1;
            result.push(str);
         }
         return result;
      }
   }
}

