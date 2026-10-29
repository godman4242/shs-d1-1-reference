package
{
   import flash.utils.getDefinitionByName;
   
   public class ObfusIntStat
   {
      
      private var id:int;
      
      private var obfValue:ObfuscatedObject;
      
      public function ObfusIntStat(id:int, value:int)
      {
         super();
         this.id = id;
         this.obfValue = new ObfuscatedObject();
         this.obfValue.setIntValue(value);
      }
      
      public static function parse(str:String) : ObfusIntStat
      {
         var strArray:Array = str.split(",");
         return new ObfusIntStat(strArray[0],strArray[1]);
      }
      
      public function getId() : int
      {
         return this.id;
      }
      
      public function getValue() : int
      {
         return this.obfValue.getIntValue();
      }
      
      public function setValue(value:int) : *
      {
         this.obfValue.setIntValue(value);
      }
      
      public function changeValue(valueChange:int) : *
      {
         this.obfValue.changeIntValue(valueChange);
      }
      
      public function toString() : String
      {
         return this.id + "," + this.getValue();
      }
   }
}

