package
{
   public class §1t1744s0§
   {
      
      internal static var §1t11357s0§:Vector.<§1t75s0§>;
      
      internal static var §1t11355s0§:int = 10;
      
      internal static var §1t11356s0§:int = §1t11355s0§;
      
      public function §1t1744s0§()
      {
         super();
      }
      
      public static function init() : *
      {
         §1t11357s0§ = new Vector.<§1t75s0§>();
         var _loc1_:int = 0;
         while(_loc1_ < §1t11355s0§)
         {
            §1t11357s0§.push(new §1t75s0§());
            _loc1_++;
         }
         §1t11356s0§ = §1t11355s0§;
      }
      
      public static function §1t1559s0§() : §1t75s0§
      {
         if(§1t11356s0§ > 0)
         {
            --§1t11356s0§;
            return §1t11357s0§.pop();
         }
         return new §1t75s0§();
      }
      
      public static function §1t11358s0§(param1:§1t75s0§) : *
      {
         if(§1t11356s0§ < §1t11355s0§)
         {
            §1t11357s0§.push(param1);
            ++§1t11356s0§;
         }
      }
   }
}

