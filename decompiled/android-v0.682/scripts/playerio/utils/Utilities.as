package playerio.utils
{
   import flash.system.Capabilities;
   
   public class Utilities
   {
      
      public static var clientAPI:String = "as3";
      
      public function Utilities()
      {
         super();
      }
      
      public static function getSystemInfo() : Object
      {
         var a:int = 0;
         var totest:Array = ["cpuArchitecture","isDebugger","language","manufacturer","os","pixelAspectRatio","playerType","screenDPI","screenResolutionX","screenResolutionY","touchscreenType","version"];
         var ret:Object = {};
         for(a = 0; a < totest.length; )
         {
            if(Capabilities[totest[a]])
            {
               ret[totest[a]] = Capabilities[totest[a]].toString();
            }
            a++;
         }
         return ret;
      }
      
      public static function getSystemInfoString() : String
      {
         var info:Object = getSystemInfo();
         var ret:Array = [];
         for(var x in info)
         {
            ret.push(x + ":" + info[x]);
         }
         return ret.join("@|@");
      }
      
      public static function countKeys(dictionary:Object) : int
      {
         var n:int = 0;
         for(var key in dictionary)
         {
            n++;
         }
         return n;
      }
      
      public static function find(array:Array, predicate:Function) : Object
      {
         var i:int = 0;
         for(i = 0; i < array.length; )
         {
            if(predicate(array[i]))
            {
               return array[i];
            }
            i++;
         }
         return null;
      }
      
      public static function converter(array:Array, converter:Function) : Array
      {
         var i:int = 0;
         var newArray:Array = [];
         for(i = 0; i < array.length; )
         {
            newArray.push(converter(array[i]));
            i++;
         }
         return newArray;
      }
   }
}

