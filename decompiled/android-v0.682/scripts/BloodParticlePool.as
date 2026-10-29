package
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class BloodParticlePool
   {
      
      internal static var bloodBitmapData:BitmapData;
      
      internal static var BLOODPOOLMIN:int = 100;
      
      internal static var BLOODPOOLMAX:int = 500;
      
      internal static var bloodPoolCount:int = 0;
      
      internal static var bloodPoolTotal:int = 0;
      
      internal static var bloodPool:Vector.<BloodParticle> = new Vector.<BloodParticle>();
      
      public function BloodParticlePool()
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
         bloodBitmapData.draw(new BloodParticleArt());
      }
      
      public static function init() : *
      {
         bloodBitmapData = new BitmapData(8,8,true,0);
         bloodBitmapData.draw(new BloodParticleArt());
         for(var i:int = 0; i < BLOODPOOLMIN; i++)
         {
            bloodPool.push(new BloodParticle(bloodBitmapData));
         }
         bloodPoolCount = BLOODPOOLMIN;
         bloodPoolTotal = BLOODPOOLMIN;
      }
      
      public static function redFreeze() : *
      {
         bloodBitmapData.fillRect(new Rectangle(0,0,8,8),0);
         bloodBitmapData.draw(new BloodParticleBlackArt());
      }
      
      public static function getBloodParticle() : BloodParticle
      {
         if(bloodPoolCount > 0)
         {
            --bloodPoolCount;
            return bloodPool.pop();
         }
         if(bloodPoolTotal < BLOODPOOLMAX)
         {
            ++bloodPoolTotal;
            return new BloodParticle(bloodBitmapData);
         }
         return null;
      }
      
      public static function returnBloodParticle(blood:BloodParticle) : *
      {
         if(bloodPoolCount < BLOODPOOLMIN)
         {
            bloodPool.push(blood);
            ++bloodPoolCount;
         }
         else
         {
            --bloodPoolTotal;
         }
      }
   }
}

