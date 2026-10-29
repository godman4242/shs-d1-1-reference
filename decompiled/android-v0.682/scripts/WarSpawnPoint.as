package
{
   public class WarSpawnPoint
   {
      
      public var xpos:int;
      
      public var ypos:int;
      
      public var state:int;
      
      public function WarSpawnPoint(state:int, xpos:int, ypos:int)
      {
         super();
         this.state = state;
         this.xpos = xpos;
         this.ypos = ypos;
      }
   }
}

