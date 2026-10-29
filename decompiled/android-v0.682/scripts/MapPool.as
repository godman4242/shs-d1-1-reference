package
{
   public class MapPool
   {
      
      private static var mapVector:Vector.<MapBG> = new Vector.<MapBG>();
      
      private static var cloudsPool:Vector.<MapBG> = new Vector.<MapBG>();
      
      public function MapPool()
      {
         super();
      }
      
      public static function getMap(mapID:int) : MapBG
      {
         var tempMap:MapBG = null;
         var map:MapBG = null;
         var mapData:Vector.<XMLWorldNode> = null;
         var currentNode:XMLWorldNode = null;
         var connectList:Vector.<int> = null;
         var mapLength:int = 0;
         var lvl:int = 0;
         var firstID:int = 0;
         var lastID:int = 0;
         var connectLength:int = 0;
         var otherNode:XMLWorldNode = null;
         var currentMap:XMLWorldMap = null;
         var otherMap:XMLWorldMap = null;
         var endX:Number = NaN;
         var endY:Number = NaN;
         var j:int = 0;
         var yDiff:int = 0;
         var xDiff:int = 0;
         var length:int = int(mapVector.length);
         for(var i:int = 0; i < length; i++)
         {
            if(mapVector[i].mapID == mapID)
            {
               tempMap = mapVector[i];
               mapVector.splice(i,1);
               return tempMap;
            }
         }
         if(mapID >= 0)
         {
            map = new MapBG(ResourceManager.getMap(mapID),mapID);
            map.nodePath.graphics.lineStyle(2,0,100);
            mapData = QuestEngine.getMapNodeData(mapID);
            mapLength = int(mapData.length);
            lvl = StatsManager.getLevel();
            if(mapLength > 0)
            {
               firstID = mapData[0].id;
               lastID = mapData[mapLength - 1].id;
               for(i = 0; i < mapLength; i++)
               {
                  currentNode = mapData[i];
                  connectList = currentNode.connectsList;
                  connectLength = int(connectList.length);
                  currentMap = QuestEngine.getMapSquareData(mapID);
                  for(j = 0; j < connectLength; j++)
                  {
                     otherNode = QuestEngine.getNodeData(connectList[j]);
                     if(otherNode.level > lvl)
                     {
                        break;
                     }
                     otherMap = QuestEngine.getMapSquareData(otherNode.map);
                     endX = (otherMap.x - currentMap.x) * 400 + otherNode.x;
                     endY = (otherMap.y - currentMap.y) * 400 + otherNode.y;
                     if(endX > 400 || endX < 0)
                     {
                        if(endY > 400)
                        {
                           yDiff = endY - 400;
                           if(endX > 400)
                           {
                              xDiff = endX - 400;
                              if(xDiff < yDiff)
                              {
                                 endY = (endY - currentNode.y) * (400 - currentNode.x) / (endX - currentNode.x) + currentNode.y;
                                 endX = 400;
                              }
                              else
                              {
                                 endX = (endX - currentNode.x) * (400 - currentNode.y) / (endY - currentNode.y) + currentNode.x;
                                 endY = 400;
                              }
                           }
                           else
                           {
                              xDiff = -endX;
                              if(xDiff < yDiff)
                              {
                                 endY = (endY - currentNode.y) * -currentNode.x / (endX - currentNode.x) + currentNode.y;
                                 endX = 0;
                              }
                              else
                              {
                                 endX = (endX - currentNode.x) * -currentNode.y / (endY - currentNode.y) + currentNode.x;
                                 endY = 0;
                              }
                           }
                        }
                        else if(endY < 0)
                        {
                           yDiff = -endY;
                           if(endX > 400)
                           {
                              xDiff = endX - 400;
                              if(xDiff < yDiff)
                              {
                                 endY = (endY - currentNode.y) * (400 - currentNode.x) / (endX - currentNode.x) + currentNode.y;
                                 endX = 400;
                              }
                              else
                              {
                                 endX = (endX - currentNode.x) * (400 - currentNode.y) / (endY - currentNode.y) + currentNode.x;
                                 endY = 400;
                              }
                           }
                           else
                           {
                              xDiff = -endX;
                              if(xDiff < yDiff)
                              {
                                 endY = (endY - currentNode.y) * -currentNode.x / (endX - currentNode.x) + currentNode.y;
                                 endX = 0;
                              }
                              else
                              {
                                 endX = (endX - currentNode.x) * -currentNode.y / (endY - currentNode.y) + currentNode.x;
                                 endY = 0;
                              }
                           }
                        }
                        else if(endX > 400)
                        {
                           endY = (endY - currentNode.y) * (400 - currentNode.x) / (endX - currentNode.x) + currentNode.y;
                           endX = 400;
                        }
                        else
                        {
                           endY = (endY - currentNode.y) * -currentNode.x / (endX - currentNode.x) + currentNode.y;
                           endX = 0;
                        }
                     }
                     else if(endY > 400)
                     {
                        endX = (endX - currentNode.x) * (400 - currentNode.y) / (endY - currentNode.y) + currentNode.x;
                        endY = 400;
                     }
                     else if(endY < 0)
                     {
                        endX = (endX - currentNode.x) * -currentNode.y / (endY - currentNode.y) + currentNode.x;
                        endY = 0;
                     }
                     map.nodePath.graphics.moveTo(currentNode.x,currentNode.y);
                     map.nodePath.graphics.lineTo(endX,endY);
                  }
               }
            }
            return map;
         }
         length = int(cloudsPool.length);
         if(length > 0)
         {
            return cloudsPool.pop();
         }
         return new MapBG(ResourceManager.getMap(-1),-1);
      }
      
      public static function returnMap(map:MapBG) : void
      {
         if(map.mapID < 0)
         {
            cloudsPool.push(map);
         }
         else
         {
            mapVector.push(map);
         }
      }
   }
}

