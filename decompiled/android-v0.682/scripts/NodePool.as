package
{
   public class NodePool
   {
      
      private static var unusedMapNode:Vector.<MapNode> = new Vector.<MapNode>();
      
      private static var unusedTownNode:Vector.<TownNode> = new Vector.<TownNode>();
      
      public function NodePool()
      {
         super();
      }
      
      public static function createMapNode() : MapNode
      {
         var mapNode:MapNode = null;
         if(unusedMapNode.length > 0)
         {
            return unusedMapNode.pop();
         }
         return new MapNode();
      }
      
      public static function createTownNode() : TownNode
      {
         var townNode:TownNode = null;
         if(unusedTownNode.length > 0)
         {
            return unusedTownNode.pop();
         }
         return new TownNode();
      }
      
      public static function deleteMapNode(mapNode:GenericNode) : void
      {
         mapNode.showSelectedArrow(false);
         unusedMapNode.push(mapNode);
      }
      
      public static function deleteTownNode(townNode:GenericNode) : void
      {
         townNode.showSelectedArrow(false);
         unusedTownNode.push(townNode);
      }
   }
}

