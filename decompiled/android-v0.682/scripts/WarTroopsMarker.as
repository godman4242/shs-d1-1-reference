package
{
   import flash.display.MovieClip;
   
   public class WarTroopsMarker extends MovieClip
   {
      
      internal var troopList:Array;
      
      internal var dir:int;
      
      public function WarTroopsMarker()
      {
         var troop:MCSCharacter = null;
         this.troopList = new Array();
         super();
         this.mouseEnabled = false;
         for(var i:int = 0; i < 5; i++)
         {
            troop = new MCSCharacter();
            this.troopList.push(troop);
            addChild(troop);
            troop.x = Math.random() * 100 - 50;
         }
         scaleX = 0.4;
         scaleY = 0.4;
      }
      
      public function initSide(side:int) : *
      {
         var xml:XMLNpc = null;
         var index:int = 0;
         for(var i:int = 0; i < 5; i++)
         {
            if(side == 1)
            {
               index = 200;
            }
            else if(side == 2)
            {
               index = 400;
            }
            else if(side == 3)
            {
               index = 300;
            }
            else if(side == 4)
            {
               index = 500;
            }
            else
            {
               index = 600;
            }
            xml = QuestEngine.getNPCData(index + i);
            this.troopList[i].removeParts();
            this.troopList[i].initMCSFromXML(xml.mcs);
         }
         this.troopList[0].startAnim("walkwithknife");
         this.troopList[1].startAnim("walkwithbow");
         this.troopList[2].startAnim("walkwithkatana");
         this.troopList[3].startAnim("walkwithspear");
         this.troopList[4].startAnim("holdshieldwalk");
      }
      
      public function update() : *
      {
         for(var i:int = 0; i < 5; i++)
         {
            this.troopList[i].updateAnimation();
         }
         this.moveDir();
      }
      
      public function faceLeft() : *
      {
         scaleX = -0.4;
      }
      
      public function faceRight() : *
      {
         scaleX = 0.4;
      }
      
      public function setDirection(rot:int) : *
      {
         this.dir = rot;
         if(rot == 30)
         {
            x -= 24;
            y += 24;
         }
         else if(rot == 90)
         {
            x -= 24;
         }
         else if(rot == 150)
         {
            x -= 24;
            y -= 24;
         }
         else if(rot == -150)
         {
            x += 24;
            y -= 24;
         }
         else if(rot == -90)
         {
            x += 24;
         }
         else if(rot == -30)
         {
            x += 24;
            y += 24;
         }
         else if(rot == 180)
         {
         }
      }
      
      internal function moveDir() : *
      {
         if(this.dir == 30)
         {
            x += 2;
            y -= 2;
         }
         else if(this.dir == 90)
         {
            x += 2;
         }
         else if(this.dir == 150)
         {
            x += 2;
            y += 2;
         }
         else if(this.dir == -150)
         {
            x -= 2;
            y += 2;
         }
         else if(this.dir == -90)
         {
            x -= 2;
         }
         else if(this.dir == -30)
         {
            x -= 2;
            y -= 2;
         }
         else if(this.dir == 180)
         {
         }
      }
   }
}

