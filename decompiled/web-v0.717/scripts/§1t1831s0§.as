package
{
   public class §1t1831s0§
   {
      
      internal static var §1t11479s0§:Vector.<§1t137s0§>;
      
      internal static var §1t11484s0§:Vector.<§1t130s0§>;
      
      internal static var §1t11489s0§:Vector.<§1t129s0§>;
      
      internal static var §1t11494s0§:Vector.<§1t138s0§>;
      
      internal static var §1t11475s0§:int = 5;
      
      internal static var §1t11476s0§:int = 10;
      
      internal static var §1t11477s0§:int = 0;
      
      internal static var §1t11478s0§:int = 0;
      
      internal static var §1t11480s0§:int = 5;
      
      internal static var §1t11481s0§:int = 10;
      
      internal static var §1t11482s0§:int = 0;
      
      internal static var §1t11483s0§:int = 0;
      
      internal static var §1t11485s0§:int = 5;
      
      internal static var §1t11486s0§:int = 20;
      
      internal static var §1t11487s0§:int = 0;
      
      internal static var §1t11488s0§:int = 0;
      
      internal static var §1t11490s0§:int = 5;
      
      internal static var §1t11491s0§:int = 20;
      
      internal static var §1t11492s0§:int = 0;
      
      internal static var §1t11493s0§:int = 0;
      
      public function §1t1831s0§()
      {
         super();
      }
      
      public static function init() : *
      {
         §1t11495s0§();
         §1t11498s0§();
         §1t8375s0§();
         §1t8383s0§();
      }
      
      public static function destroy() : *
      {
         §1t11479s0§.length = 0;
         §1t11484s0§.length = 0;
         §1t11489s0§.length = 0;
         §1t11494s0§.length = 0;
      }
      
      public static function §1t11495s0§() : *
      {
         §1t11479s0§ = new Vector.<§1t137s0§>();
         §1t11477s0§ = 0;
         §1t11478s0§ = 0;
      }
      
      public static function §1t11496s0§() : §1t137s0§
      {
         if(§1t11477s0§ > 0)
         {
            --§1t11477s0§;
            return §1t11479s0§.pop();
         }
         if(§1t11478s0§ < §1t11476s0§)
         {
            ++§1t11478s0§;
            return new §1t137s0§();
         }
         return null;
      }
      
      public static function §1t11497s0§(param1:§1t137s0§) : *
      {
         if(§1t11477s0§ < §1t11475s0§)
         {
            §1t11479s0§.push(param1);
            ++§1t11477s0§;
         }
         else
         {
            --§1t11478s0§;
         }
      }
      
      public static function §1t11498s0§() : *
      {
         §1t11484s0§ = new Vector.<§1t130s0§>();
         §1t11482s0§ = 0;
         §1t11483s0§ = 0;
      }
      
      public static function §1t6258s0§() : §1t130s0§
      {
         if(§1t11482s0§ > 0)
         {
            --§1t11482s0§;
            return §1t11484s0§.pop();
         }
         if(§1t11483s0§ < §1t11481s0§)
         {
            ++§1t11483s0§;
            return new §1t130s0§();
         }
         return null;
      }
      
      public static function §1t11499s0§(param1:§1t130s0§) : *
      {
         if(§1t11482s0§ < §1t11480s0§)
         {
            §1t1643s0§.§1t3311s0§(param1);
            §1t11484s0§.push(param1);
            ++§1t11482s0§;
         }
         else
         {
            --§1t11483s0§;
         }
      }
      
      public static function §1t8375s0§() : *
      {
         §1t11489s0§ = new Vector.<§1t129s0§>();
         §1t11487s0§ = 0;
         §1t11488s0§ = 0;
      }
      
      public static function §1t996s0§() : §1t129s0§
      {
         if(§1t11487s0§ > 0)
         {
            --§1t11487s0§;
            return §1t11489s0§.pop();
         }
         if(§1t11488s0§ < §1t11486s0§)
         {
            ++§1t11488s0§;
            return new §1t129s0§();
         }
         return null;
      }
      
      public static function §1t11500s0§(param1:§1t129s0§) : *
      {
         if(§1t11487s0§ < §1t11485s0§)
         {
            §1t1643s0§.§1t3311s0§(param1);
            §1t11489s0§.push(param1);
            ++§1t11487s0§;
         }
         else
         {
            --§1t11488s0§;
         }
      }
      
      public static function §1t8383s0§() : *
      {
         §1t11494s0§ = new Vector.<§1t138s0§>();
         §1t11492s0§ = 0;
         §1t11493s0§ = 0;
      }
      
      public static function §1t11501s0§() : §1t138s0§
      {
         if(§1t11492s0§ > 0)
         {
            --§1t11492s0§;
            return §1t11494s0§.pop();
         }
         if(§1t11493s0§ < §1t11491s0§)
         {
            ++§1t11493s0§;
            return new §1t138s0§();
         }
         return null;
      }
      
      public static function §1t11502s0§(param1:§1t138s0§) : *
      {
         if(§1t11492s0§ < §1t11490s0§)
         {
            §1t1643s0§.§1t3311s0§(param1);
            §1t11494s0§.push(param1);
            ++§1t11492s0§;
         }
         else
         {
            --§1t11493s0§;
         }
      }
   }
}

