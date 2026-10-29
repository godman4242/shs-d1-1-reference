package
{
   public class ProjectilePool
   {
      
      internal static var arrowPool:Vector.<ArrowProjectile>;
      
      internal static var partPool:Vector.<PartProjectile>;
      
      internal static var lootPool:Vector.<LootProjectile>;
      
      internal static var textPool:Vector.<TextProjectile>;
      
      internal static var ARROWPOOLMIN:int = 5;
      
      internal static var ARROWPOOLMAX:int = 10;
      
      internal static var arrowPoolCount:int = 0;
      
      internal static var arrowPoolTotal:int = 0;
      
      internal static var PARTPOOLMIN:int = 5;
      
      internal static var PARTPOOLMAX:int = 10;
      
      internal static var partPoolCount:int = 0;
      
      internal static var partPoolTotal:int = 0;
      
      internal static var LOOTPOOLMIN:int = 5;
      
      internal static var LOOTPOOLMAX:int = 20;
      
      internal static var lootPoolCount:int = 0;
      
      internal static var lootPoolTotal:int = 0;
      
      internal static var TEXTPOOLMIN:int = 5;
      
      internal static var TEXTPOOLMAX:int = 20;
      
      internal static var textPoolCount:int = 0;
      
      internal static var textPoolTotal:int = 0;
      
      public function ProjectilePool()
      {
         super();
      }
      
      public static function init() : *
      {
         initArrows();
         initParts();
         initLoot();
         initText();
      }
      
      public static function destroy() : *
      {
         arrowPool.length = 0;
         partPool.length = 0;
         lootPool.length = 0;
         textPool.length = 0;
      }
      
      public static function initArrows() : *
      {
         arrowPool = new Vector.<ArrowProjectile>();
         arrowPoolCount = 0;
         arrowPoolTotal = 0;
      }
      
      public static function getArrow() : ArrowProjectile
      {
         if(arrowPoolCount > 0)
         {
            --arrowPoolCount;
            return arrowPool.pop();
         }
         if(arrowPoolTotal < ARROWPOOLMAX)
         {
            ++arrowPoolTotal;
            return new ArrowProjectile();
         }
         return null;
      }
      
      public static function returnArrow(arrow:ArrowProjectile) : *
      {
         if(arrowPoolCount < ARROWPOOLMIN)
         {
            arrowPool.push(arrow);
            ++arrowPoolCount;
         }
         else
         {
            --arrowPoolTotal;
         }
      }
      
      public static function initParts() : *
      {
         partPool = new Vector.<PartProjectile>();
         partPoolCount = 0;
         partPoolTotal = 0;
      }
      
      public static function getPart() : PartProjectile
      {
         if(partPoolCount > 0)
         {
            --partPoolCount;
            return partPool.pop();
         }
         if(partPoolTotal < PARTPOOLMAX)
         {
            ++partPoolTotal;
            return new PartProjectile();
         }
         return null;
      }
      
      public static function returnPart(part:PartProjectile) : *
      {
         if(partPoolCount < PARTPOOLMIN)
         {
            ColorCode.clearFilter(part);
            partPool.push(part);
            ++partPoolCount;
         }
         else
         {
            --partPoolTotal;
         }
      }
      
      public static function initLoot() : *
      {
         lootPool = new Vector.<LootProjectile>();
         lootPoolCount = 0;
         lootPoolTotal = 0;
      }
      
      public static function getLoot() : LootProjectile
      {
         if(lootPoolCount > 0)
         {
            --lootPoolCount;
            return lootPool.pop();
         }
         if(lootPoolTotal < LOOTPOOLMAX)
         {
            ++lootPoolTotal;
            return new LootProjectile();
         }
         return null;
      }
      
      public static function returnLoot(loot:LootProjectile) : *
      {
         if(lootPoolCount < LOOTPOOLMIN)
         {
            ColorCode.clearFilter(loot);
            lootPool.push(loot);
            ++lootPoolCount;
         }
         else
         {
            --lootPoolTotal;
         }
      }
      
      public static function initText() : *
      {
         textPool = new Vector.<TextProjectile>();
         textPoolCount = 0;
         textPoolTotal = 0;
      }
      
      public static function getFloatingText() : TextProjectile
      {
         if(textPoolCount > 0)
         {
            --textPoolCount;
            return textPool.pop();
         }
         if(textPoolTotal < TEXTPOOLMAX)
         {
            ++textPoolTotal;
            return new TextProjectile();
         }
         return null;
      }
      
      public static function returnFloatingText(text:TextProjectile) : *
      {
         if(textPoolCount < TEXTPOOLMIN)
         {
            ColorCode.clearFilter(text);
            textPool.push(text);
            ++textPoolCount;
         }
         else
         {
            --textPoolTotal;
         }
      }
   }
}

