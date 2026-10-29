package
{
   public class MCSPool
   {
      
      internal static var pool:Vector.<MCSCharacter>;
      
      internal static var POOLMAX:int = 10;
      
      internal static var poolCount:int = POOLMAX;
      
      public function MCSPool()
      {
         super();
      }
      
      public static function init() : *
      {
         pool = new Vector.<MCSCharacter>();
         for(var i:int = 0; i < POOLMAX; i++)
         {
            pool.push(new MCSCharacter());
         }
         poolCount = POOLMAX;
      }
      
      public static function getMCS() : MCSCharacter
      {
         if(poolCount > 0)
         {
            --poolCount;
            return pool.pop();
         }
         return new MCSCharacter();
      }
      
      public static function returnMCS(mcs:MCSCharacter) : *
      {
         if(poolCount < POOLMAX)
         {
            pool.push(mcs);
            ++poolCount;
         }
      }
   }
}

