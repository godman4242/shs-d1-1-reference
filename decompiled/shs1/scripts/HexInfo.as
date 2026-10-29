package
{
   public class HexInfo
   {
      
      public var strength:int = 0;
      
      public var column:int = -1;
      
      public var side:int = 1;
      
      public var row:int = -1;
      
      public var hasPlayer:Boolean = false;
      
      public function HexInfo(param1:int, param2:int)
      {
         super();
         this.row = param1;
         this.column = param2;
      }
      
      public function getHex() : Hex
      {
         return StatsManager.instance.map.hexgrid.getChildByName("hex_" + row + "_" + column);
      }
   }
}

