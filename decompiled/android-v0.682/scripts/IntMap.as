package
{
   public class IntMap
   {
      
      private var keys:Array;
      
      private var values:Array;
      
      public function IntMap()
      {
         super();
         this.keys = new Array();
         this.values = new Array();
      }
      
      public function put(key:int, value:*, canOverwrite:Boolean = false) : int
      {
         var keyIndex:int = this.getKeyIndex(key);
         if(keyIndex == -1)
         {
            this.keys.push(key);
            this.values.push(value);
            return this.keys.length - 1;
         }
         if(canOverwrite)
         {
            this.values[keyIndex] = value;
            return keyIndex;
         }
         trace("IntMap error: trying to overwrite key without overwrite flag");
         return -1;
      }
      
      public function getKeyIndex(key:int) : int
      {
         var max:int = int(this.keys.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.keys[i] == key)
            {
               return i;
            }
         }
         return -1;
      }
      
      public function contains(key:int) : Boolean
      {
         return this.getKeyIndex(key) != -1;
      }
      
      public function get(key:int) : *
      {
         var max:int = int(this.keys.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.keys[i] == key)
            {
               return this.values[i];
            }
         }
         return null;
      }
      
      public function getInt(key:int) : int
      {
         var max:int = int(this.keys.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.keys[i] == key)
            {
               return this.values[i];
            }
         }
         return 0;
      }
      
      public function getKeys() : Array
      {
         return this.keys;
      }
      
      public function getValues() : Array
      {
         return this.values;
      }
   }
}

