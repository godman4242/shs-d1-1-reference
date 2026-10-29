package
{
   public class BooleanStat
   {
      
      internal var id:int;
      
      internal var value:Boolean;
      
      public function BooleanStat(id:int, value:Boolean)
      {
         super();
         this.id = id;
         this.value = value;
      }
      
      public static function parse(str:String) : BooleanStat
      {
         var strArray:Array = str.split(",");
         return new BooleanStat(strArray[0],strArray[1] == 1);
      }
      
      public function getId() : int
      {
         return this.id;
      }
      
      public function getValue() : Boolean
      {
         return this.value;
      }
      
      public function setValue(value:Boolean) : *
      {
         this.value = value;
      }
      
      public function toString() : String
      {
         if(this.value)
         {
            return this.id + ",1";
         }
         return this.id + ",0";
      }
   }
}

