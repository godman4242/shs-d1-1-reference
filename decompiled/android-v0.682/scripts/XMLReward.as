package
{
   public class XMLReward
   {
      
      public var exp:int;
      
      public var loot:Vector.<XMLLoot> = new Vector.<XMLLoot>();
      
      public var forShow:Boolean = false;
      
      public function XMLReward(xml:XMLList)
      {
         super();
         if(xml == null)
         {
            this.exp = 0;
            return;
         }
         if(xml.exp.toString() == "")
         {
            this.exp = 0;
         }
         else
         {
            this.exp = xml.exp;
         }
         if(xml.forshow.toString() == "1")
         {
            this.forShow = true;
         }
         var length:int = int(xml.loot.length());
         for(var i:int = 0; i < length; i++)
         {
            this.loot.push(new XMLLoot(xml.loot[i]));
         }
      }
   }
}

