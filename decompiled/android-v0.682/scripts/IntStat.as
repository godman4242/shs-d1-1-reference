package
{
   import flash.utils.getDefinitionByName;
   
   public class IntStat
   {
      
      private var id:int;
      
      private var value:int;
      
      public function IntStat(id:int, value:int)
      {
         super();
         this.id = id;
         this.value = value;
      }
      
      public static function parse(str:String) : IntStat
      {
         var strArray:Array = str.split(",");
         return new IntStat(strArray[0],strArray[1]);
      }
      
      public function getId() : int
      {
         return this.id;
      }
      
      public function getValue() : int
      {
         return this.value;
      }
      
      public function setValue(value:int) : *
      {
         this.value = value;
      }
      
      public function changeValue(valueChange:int) : *
      {
         this.value += valueChange;
      }
      
      public function toString() : String
      {
         return this.id + "," + this.value;
      }
   }
}

