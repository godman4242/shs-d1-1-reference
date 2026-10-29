package
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class §1t2731s0§
   {
      
      internal static var bloodBitmapData:BitmapData;
      
      internal static var BLOODPOOLMIN:int = 100;
      
      internal static var BLOODPOOLMAX:int = 500;
      
      internal static var bloodPoolCount:int = 0;
      
      internal static var bloodPoolTotal:int = 0;
      
      internal static var bloodPool:Vector.<§1t217s0§> = new Vector.<§1t217s0§>();
      
      public function §1t2731s0§()
      {
         super();
      }
      
      public static function destroy() : *
      {
         bloodPool.length = 0;
      }
      
      public static function reset() : *
      {
         bloodBitmapData.fillRect(new Rectangle(0,0,8,8),0);
         bloodBitmapData.draw(new §1t4924s0§());
      }
      
      public static function init() : *
      {
         bloodBitmapData = new BitmapData(8,8,true,0);
         bloodBitmapData.draw(new §1t4924s0§());
         var _loc1_:int = 0;
         while(_loc1_ < BLOODPOOLMIN)
         {
            bloodPool.push(new §1t217s0§(bloodBitmapData));
            _loc1_++;
         }
         bloodPoolCount = BLOODPOOLMIN;
         bloodPoolTotal = BLOODPOOLMIN;
      }
      
      public static function §1t2292s0§() : *
      {
         bloodBitmapData.fillRect(new Rectangle(0,0,8,8),0);
         bloodBitmapData.draw(new §1t4925s0§());
      }
      
      public static function getBloodParticle() : §1t217s0§
      {
         if(bloodPoolCount > 0)
         {
            --bloodPoolCount;
            return bloodPool.pop();
         }
         if(bloodPoolTotal < BLOODPOOLMAX)
         {
            ++bloodPoolTotal;
            return new §1t217s0§(bloodBitmapData);
         }
         return null;
      }
      
      public static function returnBloodParticle(param1:§1t217s0§) : *
      {
         if(bloodPoolCount < BLOODPOOLMIN)
         {
            bloodPool.push(param1);
            ++bloodPoolCount;
         }
         else
         {
            --bloodPoolTotal;
         }
      }
   }
}

