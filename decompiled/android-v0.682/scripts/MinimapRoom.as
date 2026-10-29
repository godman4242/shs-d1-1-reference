package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1160")]
   public class MinimapRoom extends MovieClip
   {
      
      public static var EXIT_N:int = 0;
      
      public static var EXIT_S:int = 1;
      
      public static var EXIT_E:int = 2;
      
      public static var EXIT_W:int = 3;
      
      public var exit_s:MinimapExit;
      
      public var exit_e:MinimapExit;
      
      public var questmark:TextField;
      
      public var exit_w:MinimapExit;
      
      public var rect:MovieClip;
      
      public var exit_n:MinimapExit;
      
      public var roomIcon:MovieClip;
      
      internal var exitList:Array = new Array();
      
      internal var roomWidth:int;
      
      internal var isNSOrientation:Boolean;
      
      internal var mcWidth:int = 80;
      
      internal var mcHeight:int = 30;
      
      internal var isNullRoom:Boolean = false;
      
      public function MinimapRoom()
      {
         super();
         this.exitList[0] = this.exit_n;
         this.exitList[1] = this.exit_s;
         this.exitList[2] = this.exit_e;
         this.exitList[3] = this.exit_w;
      }
      
      public function setIsNullRoom(flag:Boolean) : *
      {
         this.isNullRoom = flag;
      }
      
      public function initNode(roomWidth:int, isNSOrientation:Boolean, icon:int, roomid:int) : *
      {
         this.isNullRoom = false;
         this.roomWidth = roomWidth;
         this.mcWidth = roomWidth / 800 * 40;
         this.rect.rotation = 0;
         this.rect.scaleX = roomWidth / 800;
         this.isNSOrientation = isNSOrientation;
         if(isNSOrientation)
         {
            this.rect.rotation = 90;
         }
         else
         {
            this.rect.rotation = 0;
         }
         this.questmark.visible = false;
         if(icon != 0)
         {
            this.roomIcon.visible = true;
            if(icon == RoomGenNode.ROOM_KEY || icon == RoomGenNode.ROOM_TRAPKEY)
            {
               if(StageManager.isInDeadList("key" + roomid))
               {
                  this.roomIcon.visible = false;
               }
               else
               {
                  this.roomIcon.gotoAndStop("key");
               }
            }
            else if(icon == RoomGenNode.ROOM_BOSS)
            {
               if(StageManager.isInDeadList("boss" + roomid))
               {
                  if(StageManager.isInDeadList("goodlootchest" + roomid))
                  {
                     this.roomIcon.visible = false;
                  }
                  else
                  {
                     this.roomIcon.gotoAndStop("loot");
                  }
               }
               else
               {
                  this.roomIcon.gotoAndStop("boss");
               }
            }
            else if(icon == RoomGenNode.ROOM_LOCK)
            {
               if(StageManager.isInDeadList_door(roomid))
               {
                  this.roomIcon.gotoAndStop("unlocked");
               }
               else
               {
                  this.roomIcon.gotoAndStop("locked");
               }
            }
            else if(icon == RoomGenNode.ROOM_LOCKEDGATE)
            {
               if(StatsManager.hasLever() || StageManager.isInDeadList_door(roomid))
               {
                  this.roomIcon.gotoAndStop("unlocked");
               }
               else
               {
                  this.roomIcon.gotoAndStop("locked");
               }
            }
            else if(icon == RoomGenNode.ROOM_LEVER)
            {
               if(StageManager.isInDeadList("lever" + roomid))
               {
                  this.roomIcon.visible = false;
               }
               else
               {
                  this.roomIcon.gotoAndStop("lever");
               }
            }
            else if(icon == Obj_TownBuilding.ICON_MARKET)
            {
               this.roomIcon.gotoAndStop("market");
            }
            else if(icon == Obj_TownBuilding.ICON_GAMBLINGDEN)
            {
               this.roomIcon.gotoAndStop("gamblingden");
               if(StatsManager.roomHasActiveQuestGamblingDen(StageManager.getCurrentNode(),roomid))
               {
                  this.questmark.visible = true;
               }
            }
            else if(icon == Obj_TownBuilding.ICON_BANK)
            {
               this.roomIcon.gotoAndStop("bank");
            }
            else if(icon == Obj_TownBuilding.ICON_STABLE)
            {
               this.roomIcon.gotoAndStop("stables");
            }
            else if(icon == Obj_TownBuilding.ICON_INN)
            {
               this.roomIcon.gotoAndStop("inn");
               if(StatsManager.roomHasActiveQuestInn(StageManager.getCurrentNode(),roomid))
               {
                  this.questmark.visible = true;
               }
            }
            else if(icon == Obj_TownBuilding.ICON_BARBER)
            {
               this.roomIcon.gotoAndStop("barber");
            }
            else if(icon == Obj_TownBuilding.ICON_MERCHANT)
            {
               this.roomIcon.gotoAndStop("merchant");
            }
            else if(icon == Obj_TownBuilding.ICON_PEDDLER)
            {
               this.roomIcon.gotoAndStop("peddler");
            }
            else if(icon == Obj_TownBuilding.ICON_BOUNTYBOARD)
            {
               this.roomIcon.gotoAndStop("bountyboard");
            }
            else if(icon == Obj_TownBuilding.ICON_BLACKSMITH)
            {
               this.roomIcon.gotoAndStop("blacksmith");
            }
            else
            {
               this.roomIcon.visible = false;
            }
         }
         else
         {
            this.roomIcon.visible = false;
         }
         if(!this.roomIcon.visible)
         {
            if(StatsManager.roomHasActiveQuest(StageManager.getCurrentNode(),roomid))
            {
               this.roomIcon.visible = true;
               this.roomIcon.gotoAndStop(17);
            }
         }
         else if(this.roomIcon.visible && StatsManager.roomHasActiveQuest(StageManager.getCurrentNode(),roomid))
         {
            this.questmark.visible = true;
         }
      }
      
      public function clearIcon() : *
      {
         this.roomIcon.visible = false;
      }
      
      public function showUnlockIcon() : *
      {
         this.roomIcon.gotoAndStop(4);
         this.roomIcon.visible = true;
      }
      
      public function initNodeExits(exits:Array) : *
      {
         var xpos:int = 0;
         this.initExits();
         var totalExits:int = exits[0] + exits[1] + exits[2] + exits[3];
         var spacing:int = this.mcHeight / 2 * (this.roomWidth / this.mcWidth);
         if(exits[EXIT_N] == 1)
         {
            this.exitList[0].visible = true;
            if(this.isNSOrientation)
            {
               this.exitList[0].x = 0;
               this.exitList[0].y = -this.mcWidth / 2;
            }
            else
            {
               if(totalExits == 2)
               {
                  if(exits[EXIT_E] == 0)
                  {
                     xpos = this.roomWidth - spacing;
                  }
                  else
                  {
                     xpos = spacing;
                  }
               }
               else
               {
                  xpos = this.roomWidth / 2;
               }
               this.exitList[0].y = -this.mcHeight / 2;
               this.exitList[0].x = xpos / this.roomWidth * this.mcWidth - this.mcWidth / 2;
            }
         }
         if(exits[EXIT_S] == 1)
         {
            this.exitList[1].visible = true;
            if(this.isNSOrientation)
            {
               this.exitList[1].x = 0;
               this.exitList[1].y = this.mcWidth / 2;
            }
            else
            {
               if(totalExits == 2)
               {
                  if(exits[EXIT_W] == 0)
                  {
                     xpos = spacing;
                  }
                  else
                  {
                     xpos = this.roomWidth - spacing;
                  }
               }
               else
               {
                  xpos = this.roomWidth / 2;
               }
               this.exitList[1].y = this.mcHeight / 2;
               this.exitList[1].x = xpos / this.roomWidth * this.mcWidth - this.mcWidth / 2;
            }
         }
         if(exits[EXIT_E] == 1)
         {
            this.exitList[2].visible = true;
            if(!this.isNSOrientation)
            {
               this.exitList[2].x = this.mcWidth / 2;
               this.exitList[2].y = 0;
            }
            else
            {
               if(totalExits == 2)
               {
                  if(exits[EXIT_S] == 0)
                  {
                     xpos = spacing;
                  }
                  else
                  {
                     xpos = this.roomWidth - spacing;
                  }
               }
               else
               {
                  xpos = this.roomWidth / 2;
               }
               this.exitList[2].x = this.mcHeight / 2;
               this.exitList[2].y = this.mcWidth / 2 - xpos / this.roomWidth * this.mcWidth;
            }
         }
         if(exits[EXIT_W] == 1)
         {
            this.exitList[3].visible = true;
            if(!this.isNSOrientation)
            {
               this.exitList[3].x = -this.mcWidth / 2;
               this.exitList[3].y = 0;
            }
            else
            {
               if(totalExits == 2)
               {
                  if(exits[EXIT_N] == 0)
                  {
                     xpos = this.roomWidth - spacing;
                  }
                  else
                  {
                     xpos = spacing;
                  }
               }
               else
               {
                  xpos = this.roomWidth / 2;
               }
               this.exitList[3].x = -this.mcHeight / 2;
               this.exitList[3].y = this.mcWidth / 2 - xpos / this.roomWidth * this.mcWidth;
            }
         }
      }
      
      public function initNodeExitsFromXML(list:XMLList) : *
      {
         var strArray:Array = null;
         var xpos:int = 0;
         var minimapExit:MinimapExit = null;
         if(list == null)
         {
            return;
         }
         var max:int = list.length();
         for(var i:int = 0; i < max; i++)
         {
            if(list[i].id == 0 || list[i].id == 22 || list[i].id == 8 || list[i].id == 63)
            {
               strArray = String(list[i].property).split(",");
               if(list[i].id == 8 || strArray.length < 5 || strArray[4] < 0 || strArray[4] > 3)
               {
                  minimapExit = new MinimapExit();
                  addChild(minimapExit);
                  minimapExit.gotoAndStop(2);
                  this.exitList.push(minimapExit);
                  if(list[i].id == 63)
                  {
                     xpos = list[i].x * 3 / 2;
                  }
                  else
                  {
                     xpos = int(list[i].x);
                  }
                  if(this.isNSOrientation)
                  {
                     minimapExit.x = 0;
                     minimapExit.y = this.mcWidth / 2 - xpos / this.roomWidth * this.mcWidth;
                  }
                  else
                  {
                     minimapExit.x = xpos / this.roomWidth * this.mcWidth - this.mcWidth / 2;
                     minimapExit.y = 0;
                  }
               }
               else if(list[i].id != 0 && list[i].id != 22 && list[i].id != 63)
               {
                  minimapExit = this.exitList[strArray[4]];
                  minimapExit.visible = true;
                  xpos = int(list[i].x);
                  if(this.isNSOrientation)
                  {
                     minimapExit.x = -this.mcHeight / 2;
                     minimapExit.y = this.mcWidth / 2 - xpos / this.roomWidth * this.mcWidth;
                  }
                  else
                  {
                     minimapExit.x = xpos / this.roomWidth * this.mcWidth - this.mcWidth / 2;
                     minimapExit.y = -this.mcHeight / 2;
                  }
               }
            }
         }
      }
      
      internal function initExits() : *
      {
         for(var i:int = 0; i < this.exitList.length; i++)
         {
            if(i >= 4)
            {
               removeChild(this.exitList[i]);
            }
            else
            {
               this.exitList[i].visible = false;
            }
         }
         this.exitList.splice(4,this.exitList.length - 4);
      }
      
      public function getExitPos(dir:int) : Point
      {
         return new Point(this.exitList[dir].x,this.exitList[dir].y);
      }
      
      public function setAdjRoomXY(room:MinimapRoom, dir:int) : *
      {
         var thisExitPos:Point = null;
         var otherExitPos:Point = null;
         if(room.isNullRoom || !this.exitList[dir].visible)
         {
            room.visible = false;
            return;
         }
         if(dir == EXIT_N)
         {
            thisExitPos = this.getExitPos(EXIT_N);
            otherExitPos = room.getExitPos(EXIT_S);
         }
         else if(dir == EXIT_S)
         {
            thisExitPos = this.getExitPos(EXIT_S);
            otherExitPos = room.getExitPos(EXIT_N);
         }
         else if(dir == EXIT_E)
         {
            thisExitPos = this.getExitPos(EXIT_E);
            otherExitPos = room.getExitPos(EXIT_W);
         }
         else
         {
            if(dir != EXIT_W)
            {
               room.visible = false;
               return;
            }
            thisExitPos = this.getExitPos(EXIT_W);
            otherExitPos = room.getExitPos(EXIT_E);
         }
         room.x = thisExitPos.x - otherExitPos.x;
         room.y = thisExitPos.y - otherExitPos.y;
         room.visible = true;
      }
   }
}

