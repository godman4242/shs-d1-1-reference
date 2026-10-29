package
{
   import flash.geom.Point;
   
   public class AStarRoom
   {
      
      internal var from:Point;
      
      internal var dist:int = 1000;
      
      public function AStarRoom()
      {
         super();
      }
      
      public function AStarRoomRoom() : *
      {
      }
      
      public function setFrom(x:int, y:int) : *
      {
         this.from = new Point(x,y);
      }
   }
}

