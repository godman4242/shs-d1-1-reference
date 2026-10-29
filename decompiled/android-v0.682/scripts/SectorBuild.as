package
{
   public class SectorBuild
   {
      
      public static var TYPE_EMPTY:int = 0;
      
      public static var TYPE_EXIT:int = 1;
      
      public static var TYPE_ROAD:int = 2;
      
      public static var TYPE_CONTROLPOINT:int = 3;
      
      public static var TYPE_DUNGEON:int = 4;
      
      public static var TYPE_FIELD:int = 5;
      
      public static var TYPE_PICKABLE:int = 6;
      
      public static var TYPE_SPECIAL:int = 7;
      
      public static var DIR_N:int = 0;
      
      public static var DIR_S:int = 1;
      
      public static var DIR_E:int = 2;
      
      public static var DIR_W:int = 3;
      
      internal var x:int;
      
      internal var y:int;
      
      internal var nodeid:int;
      
      internal var type:int;
      
      internal var exits:Array = [0,0,0,0];
      
      internal var exitTo:int = -1;
      
      public function SectorBuild(x:int, y:int, nodeid:int)
      {
         super();
         this.x = x;
         this.y = y;
         this.nodeid = nodeid;
      }
      
      public function toString() : String
      {
         return this.x + "," + this.y;
      }
      
      public function setType(num:int) : *
      {
         this.type = num;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function getNodeId() : int
      {
         return this.nodeid;
      }
      
      public function getX() : int
      {
         return this.x;
      }
      
      public function getY() : int
      {
         return this.y;
      }
      
      public function addExit(num:int) : *
      {
         this.exits[num] = 1;
         this.exitTo = num;
      }
      
      public function removeExitsExceptExitTo() : *
      {
         if(this.exitTo != -1)
         {
            this.exits = [0,0,0,0];
            this.exits[this.exitTo] = 1;
         }
      }
      
      public function hasExitFrom(lastDir:int) : int
      {
         if(lastDir == 0)
         {
            return this.exits[1];
         }
         if(lastDir == 1)
         {
            return this.exits[0];
         }
         if(lastDir == 2)
         {
            return this.exits[3];
         }
         if(lastDir == 3)
         {
            return this.exits[2];
         }
         return 0;
      }
      
      public function countExits() : int
      {
         return this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3];
      }
      
      public function isEnclosed() : Boolean
      {
         return this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3] == 0;
      }
      
      public function isDeadEnd() : Boolean
      {
         return this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3] == 1;
      }
      
      public function isForkedRoad() : Boolean
      {
         return this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3] == 3;
      }
      
      public function isCrossRoad() : Boolean
      {
         return this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3] == 4;
      }
      
      public function isStraightRoom() : Boolean
      {
         var ns:int = 0;
         var ew:int = 0;
         var total:int = this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3];
         if(total == 2)
         {
            ns = this.exits[0] + this.exits[1];
            ew = this.exits[2] + this.exits[3];
            if(ns == 2 || ew == 2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getNodeExits() : int
      {
         return this.exits[3] << 3 | this.exits[2] << 2 | this.exits[1] << 1 | this.exits[0];
      }
      
      public function checkAddExitToCP(exit:int) : Boolean
      {
         if(exit == DIR_N && (this.exits[DIR_E] == 1 || this.exits[DIR_W] == 1))
         {
            return false;
         }
         if(exit == DIR_S && (this.exits[DIR_E] == 1 || this.exits[DIR_W] == 1))
         {
            return false;
         }
         if(exit == DIR_E && (this.exits[DIR_N] == 1 || this.exits[DIR_S] == 1))
         {
            return false;
         }
         if(exit == DIR_W && (this.exits[DIR_N] == 1 || this.exits[DIR_S] == 1))
         {
            return false;
         }
         return true;
      }
   }
}

