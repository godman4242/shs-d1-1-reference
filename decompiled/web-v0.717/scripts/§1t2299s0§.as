package
{
   public class §1t2299s0§
   {
      
      private static var unusedMapNode:Vector.<§1t170s0§> = new Vector.<§1t170s0§>();
      
      private static var unusedTownNode:Vector.<§1t171s0§> = new Vector.<§1t171s0§>();
      
      public function §1t2299s0§()
      {
         super();
      }
      
      public static function createMapNode() : §1t170s0§
      {
         var _loc1_:§1t170s0§ = null;
         if(unusedMapNode.length > 0)
         {
            return unusedMapNode.pop();
         }
         return new §1t170s0§();
      }
      
      public static function createTownNode() : §1t171s0§
      {
         var _loc1_:§1t171s0§ = null;
         if(unusedTownNode.length > 0)
         {
            return unusedTownNode.pop();
         }
         return new §1t171s0§();
      }
      
      public static function deleteMapNode(param1:§1t172s0§) : void
      {
         param1.§1t8154s0§(false);
         unusedMapNode.push(param1);
      }
      
      public static function deleteTownNode(param1:§1t172s0§) : void
      {
         param1.§1t8154s0§(false);
         unusedTownNode.push(param1);
      }
   }
}

