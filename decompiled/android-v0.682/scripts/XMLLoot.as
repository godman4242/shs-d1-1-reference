package
{
   public class XMLLoot
   {
      
      public var id:String;
      
      public var qty:int;
      
      public var chance:Number;
      
      public function XMLLoot(xml:XML)
      {
         super();
         this.id = xml.id;
         if(xml.qty.toString() == "")
         {
            this.qty = 1;
         }
         else
         {
            this.qty = xml.qty;
         }
         if(xml.chance.toString() == "")
         {
            this.chance = 1;
         }
         else
         {
            this.chance = xml.chance;
         }
      }
   }
}

