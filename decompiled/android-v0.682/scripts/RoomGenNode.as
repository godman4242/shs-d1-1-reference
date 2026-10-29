package
{
   import flash.geom.Point;
   
   public class RoomGenNode
   {
      
      public static var ROOM_NOTHING:int = 0;
      
      public static var ROOM_ENTRANCE:int = 1;
      
      public static var ROOM_MINION:int = 2;
      
      public static var ROOM_TRAP:int = 3;
      
      public static var ROOM_KEY:int = 4;
      
      public static var ROOM_LOOT:int = 5;
      
      public static var ROOM_BOSS:int = 6;
      
      public static var ROOM_TREASURE:int = 7;
      
      public static var ROOM_PUZZLE:int = 8;
      
      public static var ROOM_LOCK:int = 9;
      
      public static var ROOM_CORRIDOR:int = 10;
      
      public static var ROOM_EXIT:int = 11;
      
      public static var ROOM_TOWN:int = 12;
      
      public static var ROOM_TOWNENTRANCE:int = 13;
      
      public static var ROOM_TOWNEXIT:int = 14;
      
      public static var ROOM_TOWNMERCHANT:int = 15;
      
      public static var ROOM_TOWNENTERTAINMENT:int = 16;
      
      public static var ROOM_TOWNHOUSING:int = 17;
      
      public static var ROOM_TOWNCASTLE:int = 18;
      
      public static var ROOM_CASTLEWALL:int = 19;
      
      public static var ROOM_CASTLEROOM:int = 20;
      
      public static var ROOM_EMPTY:int = 21;
      
      public static var ROOM_NINJAVILLAGEENTRANCE:int = 22;
      
      public static var ROOM_NINJATRAIL:int = 23;
      
      public static var ROOM_NINJAVILLAGE:int = 24;
      
      public static var ROOM_SUBBOSS:int = 25;
      
      public static var ROOM_LOCKEDGATE:int = 26;
      
      public static var ROOM_LEVER:int = 27;
      
      public static var ROOM_INN:int = 28;
      
      public static var ROOM_TOWNCORRIDOR:int = 29;
      
      public static var ROOM_GAMBLINGDEN:int = 30;
      
      public static var ROOM_GAMBLINGROOM:int = 31;
      
      public static var ROOM_TRAPEASY:int = 32;
      
      public static var ROOM_TRAPMEDIUM:int = 33;
      
      public static var ROOM_TRAPHARD:int = 34;
      
      public static var ROOM_TRAPVERYHARD:int = 35;
      
      public static var ROOM_TRAPKEY:int = 36;
      
      public static var ROOM_NINJATRAILEXIT:int = 37;
      
      public static var ROOM_RETURNEXIT:int = 38;
      
      public static var ROOM_CASTLEOUTERWALL:int = 39;
      
      public static var ROOM_CASTLEWALLGATE:int = 40;
      
      public static var ROOM_CASTLEINNERWALL:int = 41;
      
      public static var ROOM_CASTLECOURTYARD:int = 42;
      
      public static var ROOM_CASTLECORRIDOR:int = 43;
      
      public static var ROOM_CASTLESTAIRS:int = 44;
      
      public static var ROOM_CASTLEOUTERWALLSTART:int = 45;
      
      public static var ROOM_CASTLEFLAGROOM:int = 46;
      
      public static var ROOM_CASTLEDEFENDERSPAWN:int = 47;
      
      public static var TOTALROOMTYPES:int = 38;
      
      public static var EXIT_N:int = 0;
      
      public static var EXIT_S:int = 1;
      
      public static var EXIT_E:int = 2;
      
      public static var EXIT_W:int = 3;
      
      public static var DIR_NW:int = 0;
      
      public static var DIR_SE:int = 1;
      
      public static var DIR_E:int = 2;
      
      public static var DIR_W:int = 3;
      
      public static var DIR_NE:int = 4;
      
      public static var DIR_SW:int = 5;
      
      public static var DIR_S_LOW:int = 6;
      
      internal var x:int;
      
      internal var y:int;
      
      internal var roomid:int;
      
      internal var bg:int;
      
      internal var roomWidth:int;
      
      internal var isPrivate:int = 0;
      
      internal var exits:Array = [0,0,0,0];
      
      internal var dest:Array = [0,0,0,0];
      
      internal var objList:Array;
      
      internal var roomType:int;
      
      internal var roomName:String = "";
      
      internal var enterFrom:int = -1;
      
      internal var exitTo:int = -1;
      
      internal var enemyType:int = -1;
      
      internal var nodeid:int;
      
      internal var bgParam:int = 0;
      
      internal var bgParam2:* = 0;
      
      internal var townIcon:* = 0;
      
      internal var townColor:uint;
      
      internal var slotCount:int = 0;
      
      internal var slots:Array = new Array();
      
      internal var townBuilding:int = 0;
      
      public function RoomGenNode(x:int, y:int, bg:int, nodeid:int)
      {
         super();
         this.x = x;
         this.y = y;
         this.roomid = x << 8 | y;
         this.bg = bg;
         this.nodeid = nodeid;
         this.roomWidth = 800 + RNG.getRandAfterXTimes(this.roomid,0,600);
         this.objList = new Array();
      }
      
      internal static function isAnimal(theme:int) : Boolean
      {
         return theme == NodeGenerator.THEME_WOLF || theme == NodeGenerator.THEME_BEAR || theme == NodeGenerator.THEME_BOAR || theme == NodeGenerator.THEME_DEER || theme == NodeGenerator.THEME_FOX;
      }
      
      public static function createRoomEnemy(rng:RNG, theme:int, roomWidth:int, xpos:int, lvl:int, objname:String, isBoss:Boolean = false, facingRight:int = 0) : String
      {
         var aggroid:String = null;
         var id:String = null;
         var qty:int = 0;
         var wavexpos:int = 0;
         var waves:int = 0;
         var wavexml:String = null;
         var i:int = 0;
         if(theme == NodeGenerator.THEME_ABANDONED)
         {
            if(rng.rand(2) == 0)
            {
               theme = NodeGenerator.THEME_BANDIT;
            }
            else
            {
               theme = NodeGenerator.THEME_WOLF;
            }
         }
         if(theme == NodeGenerator.THEME_BANDIT)
         {
            if(!isBoss)
            {
               aggroid = "11";
               if(lvl < 3)
               {
                  id = "11";
               }
               else if(lvl < 5)
               {
                  id = "11|12";
               }
               else if(lvl < 7)
               {
                  id = "11|12|13";
               }
               else if(lvl < 9)
               {
                  id = "11|12|13|14";
               }
               else if(int(Math.random() * 3) > 0)
               {
                  id = "11|12|13|14|15";
               }
               else
               {
                  id = "11|12|13|14|15|16";
               }
            }
            else
            {
               aggroid = "17";
               id = "17";
            }
         }
         else if(theme == NodeGenerator.THEME_CULTIST || theme == NodeGenerator.THEME_CULTIST_UNDEAD)
         {
            if(!isBoss)
            {
               aggroid = "40";
               if(int(Math.random() * 3) > 0)
               {
                  id = "40|41|42|43|44";
               }
               else
               {
                  id = "40|41|42|43|44|45";
               }
            }
            else
            {
               aggroid = "46";
               id = "46";
            }
         }
         else if(theme == NodeGenerator.THEME_CLANPURPLE || theme == NodeGenerator.THEME_CLANPURPLE_UNDEAD)
         {
            if(!isBoss)
            {
               aggroid = "19";
               if(int(Math.random() * 3) > 0)
               {
                  id = "19|20|21|22|23";
               }
               else
               {
                  id = "19|20|21|22|23|24|48";
               }
            }
            else
            {
               aggroid = "25";
               id = "25";
            }
         }
         else if(theme == NodeGenerator.THEME_ONI)
         {
            if(!isBoss)
            {
               id = "76|79";
               aggroid = "76";
               if(lvl > 50 && rng.rand(5) == 0)
               {
                  isBoss = true;
                  id = "77";
                  aggroid = "77";
                  lvl = 80;
               }
            }
            else
            {
               id = "77";
               aggroid = "77";
               lvl = 80;
            }
         }
         else if(theme == NodeGenerator.THEME_UNDEAD)
         {
            id = "80|81";
            aggroid = "80";
         }
         else if(theme == NodeGenerator.THEME_WOLF)
         {
            if(!isBoss)
            {
               id = "65|66";
               aggroid = "65";
            }
            else
            {
               id = "67";
               aggroid = "67";
            }
         }
         else if(theme == NodeGenerator.THEME_BEAR)
         {
            id = "72";
            aggroid = "72";
         }
         else if(theme == NodeGenerator.THEME_BOAR)
         {
            id = "73";
            aggroid = "73";
         }
         else if(theme == NodeGenerator.THEME_DEER)
         {
            id = "74|75";
            aggroid = "74";
         }
         else if(theme == NodeGenerator.THEME_FOX)
         {
            id = "78";
            aggroid = "78";
         }
         else
         {
            if(theme != NodeGenerator.THEME_NINJA)
            {
               trace("RoomGenNode.createRoomEnemy: invalid type " + theme);
               return "";
            }
            if(!isBoss)
            {
               id = "31";
               aggroid = "31";
            }
            else
            {
               id = "32";
               aggroid = "32";
            }
         }
         var appearFromSide:Boolean = theme == NodeGenerator.THEME_BEAR || theme == NodeGenerator.THEME_BOAR || theme == NodeGenerator.THEME_DEER;
         if(!isBoss)
         {
            if(isAnimal(theme))
            {
               waves = 1;
            }
            else if(theme == NodeGenerator.THEME_CULTIST_UNDEAD || theme == NodeGenerator.THEME_CLANPURPLE_UNDEAD)
            {
               waves = rng.rand(2) + 2;
            }
            else if(lvl < 20)
            {
               waves = rng.rand(2) + 1;
            }
            else
            {
               waves = rng.rand(3) + 1;
            }
            wavexml = "<xml>";
            for(i = 0; i < waves; i++)
            {
               if(theme == NodeGenerator.THEME_NINJA || theme == NodeGenerator.THEME_ONI)
               {
                  qty = rng.rand(2) + 3;
               }
               else
               {
                  qty = rng.rand(3) + 3;
               }
               if(i == 0)
               {
                  wavexml = wavexml + "<wave><enemy><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty + "</qty></enemy></wave>";
               }
               else if(theme == NodeGenerator.THEME_CULTIST_UNDEAD && i == waves - 1)
               {
                  id = "87";
                  wavexml = wavexml + "<wave><enemy><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty * 2 + "</qty></enemy></wave>";
               }
               else if(theme == NodeGenerator.THEME_CLANPURPLE_UNDEAD && i == waves - 1)
               {
                  id = "86";
                  wavexml = wavexml + "<wave><enemy><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty * 2 + "</qty></enemy></wave>";
               }
               else if(appearFromSide || int(Math.random() * 2) == 0)
               {
                  wavexml = wavexml + "<wave><enemy><x>" + -100 + "</x><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty + "</qty></enemy></wave>";
               }
               else
               {
                  wavexml = wavexml + "<wave><enemy><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty * 2 + "</qty></enemy></wave>";
               }
            }
            wavexml += "</xml>";
         }
         else
         {
            if(id == "17")
            {
               id = XMLNpc.INDEX_NPCHOLDER.toString();
            }
            wavexml = "<xml><wave><enemy><x>650</x><id>" + id + "</id><lvl>" + (lvl + 2) + "</lvl><qty>1</qty></enemy></wave></xml>";
         }
         var staticNum:int = 2;
         var lvlNum:int = lvl;
         if(isBoss)
         {
            if(theme != NodeGenerator.THEME_ONI)
            {
               staticNum = 1;
            }
            lvlNum = lvl + 2;
         }
         var anim:String = "0";
         if(aggroid == "67")
         {
            anim = "wolf_snarl";
         }
         var doDuel:int = 0;
         if(isBoss && (theme == NodeGenerator.THEME_BANDIT || theme == NodeGenerator.THEME_NINJA))
         {
            doDuel = 1;
         }
         return "<obj><id>9</id><x>" + xpos + "</x><property>" + aggroid + "," + lvlNum + "," + wavexml + "," + staticNum + "," + anim + "," + facingRight + "," + doDuel + "</property><name>" + objname + "</name></obj>";
      }
      
      public static function createSubBoss(rng:RNG, roomWidth:int, xpos:int, lvl:int, objname:String) : String
      {
         var id:String = null;
         var qty:int = 0;
         var wavexpos:int = 0;
         var waves:int = 0;
         var aggroid:String = XMLNpc.INDEX_SUBBOSS.toString();
         var order:int = rng.rand(3);
         var theme:* = rng.rand(3);
         if(theme == 0)
         {
            theme = NodeGenerator.THEME_BANDIT;
         }
         else if(theme == 1)
         {
            theme = NodeGenerator.THEME_NINJA;
         }
         else if(theme == 2)
         {
            theme = NodeGenerator.THEME_WOLF;
         }
         if(theme == NodeGenerator.THEME_BANDIT)
         {
            if(lvl < 3)
            {
               id = "11";
            }
            else if(lvl < 5)
            {
               id = "11|12";
            }
            else if(lvl < 7)
            {
               id = "11|12|13";
            }
            else if(lvl < 9)
            {
               id = "11|12|13|14";
            }
            else if(int(Math.random() * 3) > 0)
            {
               id = "11|12|13|14|15";
            }
            else
            {
               id = "11|12|13|14|15|16";
            }
         }
         else if(theme == NodeGenerator.THEME_WOLF)
         {
            id = "65|66";
         }
         else if(theme == NodeGenerator.THEME_NINJA)
         {
            id = "31";
         }
         if(lvl < 20)
         {
            waves = rng.rand(2) + 1;
         }
         else
         {
            waves = rng.rand(3) + 1;
         }
         if(order == 0)
         {
            waves = 0;
         }
         var wavexml:String = "<xml>";
         for(var i:int = 0; i < waves; i++)
         {
            if(theme == NodeGenerator.THEME_WOLF || theme == NodeGenerator.THEME_NINJA)
            {
               qty = rng.rand(2) + 2;
            }
            else
            {
               qty = rng.rand(3) + 3;
            }
            if(order == 2 && i == waves - 1)
            {
               wavexml = wavexml + "<wave><enemy><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty * 2 + "</qty></enemy><enemy><x>650</x><id>" + XMLNpc.INDEX_SUBBOSS.toString() + "</id><lvl>" + (lvl + 1) + "</lvl><qty>1</qty></enemy></wave>";
               wavexml += "</xml>";
            }
            else if(i == 0)
            {
               wavexml = wavexml + "<wave><enemy><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty + "</qty></enemy></wave>";
            }
            else if(int(Math.random() * 2) == 0)
            {
               wavexml = wavexml + "<wave><enemy><x>" + -100 + "</x><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty + "</qty></enemy><enemy><x>" + (roomWidth + 100) + "</x><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty + "</qty></enemy></wave>";
            }
            else
            {
               wavexml = wavexml + "<wave><enemy><id>" + id + "</id><lvl>" + lvl + "</lvl><qty>" + qty * 2 + "</qty></enemy></wave>";
            }
         }
         if(order == 1)
         {
            wavexml = wavexml + "<wave><enemy><x>650</x><id>" + XMLNpc.INDEX_SUBBOSS.toString() + "</id><lvl>" + (lvl + 1) + "</lvl><qty>1</qty></enemy></wave>";
            wavexml += "</xml>";
         }
         else if(order == 0)
         {
            wavexml = "<xml><wave><enemy><x>650</x><id>" + XMLNpc.INDEX_SUBBOSS.toString() + "</id><lvl>" + (lvl + 1) + "</lvl><qty>1</qty></enemy></wave></xml>";
            return "<obj><id>9</id><x>" + xpos + "</x><property>" + aggroid + "," + (lvl + 1) + "," + wavexml + "," + 0 + "," + 0 + "," + 0 + "," + 1 + "</property><name>" + objname + "</name></obj>";
         }
         return "<obj><id>9</id><x>" + xpos + "</x><property>" + aggroid + "," + (lvl + 1) + "," + wavexml + "</property><name>" + objname + "</name></obj>";
      }
      
      public static function createRoomDead(rng:RNG, theme:int, roomWidth:int, killer:int) : String
      {
         var id:int = 0;
         var i:int = 0;
         var maxobj:int = roomWidth / 300;
         var str:String = "";
         if(theme == NodeGenerator.THEME_UNDEAD)
         {
            id = 80;
            for(i = 1; i < maxobj - 1; i++)
            {
               if(rng.rand(2) == 0)
               {
                  str += "<obj><id>36</id><x>" + i * 300 + "</x><property>" + id.toString() + "," + killer + "</property></obj>";
               }
            }
         }
         else if(theme == NodeGenerator.THEME_ONI)
         {
            if(rng.rand(5) == 0)
            {
               str += "<obj><id>36</id><x>" + (rng.rand(roomWidth - 600) + 300) + "</x><property>77," + killer + "</property></obj>";
            }
            else
            {
               id = 76;
               for(i = 1; i < maxobj - 1; i++)
               {
                  if(rng.rand(2) == 0)
                  {
                     str += "<obj><id>36</id><x>" + i * 300 + "</x><property>" + id.toString() + "," + killer + "</property></obj>";
                  }
               }
            }
         }
         else if(theme == NodeGenerator.THEME_BANDIT)
         {
            id = 13;
            for(i = 1; i < maxobj - 1; i++)
            {
               if(rng.rand(2) == 0)
               {
                  str += "<obj><id>36</id><x>" + i * 300 + "</x><property>" + id.toString() + "," + killer + "</property></obj>";
               }
            }
         }
         else if(theme == NodeGenerator.THEME_MERC)
         {
            id = 82;
            for(i = 1; i < maxobj - 1; i++)
            {
               if(rng.rand(2) == 0)
               {
                  str += "<obj><id>36</id><x>" + i * 300 + "</x><property>" + id.toString() + "," + killer + "</property></obj>";
               }
            }
         }
         else if(theme == NodeGenerator.THEME_NINJA)
         {
            id = 28;
            for(i = 1; i < maxobj - 1; i++)
            {
               if(rng.rand(2) == 0)
               {
                  str += "<obj><id>36</id><x>" + i * 300 + "</x><property>" + id.toString() + "," + killer + "</property></obj>";
               }
            }
         }
         else if(theme == NodeGenerator.THEME_CIVILIAN)
         {
            for(i = 1; i < maxobj - 1; i++)
            {
               if(rng.rand(2) == 0)
               {
                  str += "<obj><id>36</id><x>" + i * 300 + "</x><property>" + (50 + rng.rand(4)) + "," + killer + "</property></obj>";
               }
            }
         }
         else if(theme == NodeGenerator.THEME_WOLF)
         {
            str += "<obj><id>36</id><x>" + (rng.rand(roomWidth - 600) + 300) + "</x><property>65," + killer + "</property></obj>";
         }
         else if(theme == NodeGenerator.THEME_BEAR)
         {
            str += "<obj><id>36</id><x>" + (rng.rand(roomWidth - 600) + 300) + "</x><property>72," + killer + "</property></obj>";
         }
         else if(theme == NodeGenerator.THEME_BOAR)
         {
            str += "<obj><id>36</id><x>" + (rng.rand(roomWidth - 600) + 300) + "</x><property>73," + killer + "</property></obj>";
         }
         else if(theme == NodeGenerator.THEME_DEER)
         {
            str += "<obj><id>36</id><x>" + (rng.rand(roomWidth - 600) + 300) + "</x><property>74," + killer + "</property></obj>";
         }
         else if(theme == NodeGenerator.THEME_FOX)
         {
            str += "<obj><id>36</id><x>" + (rng.rand(roomWidth - 600) + 300) + "</x><property>78," + killer + "</property></obj>";
         }
         return str;
      }
      
      public static function createRoomFriendly(rng:RNG, theme:int, roomWidth:int) : String
      {
         var id:int = 0;
         var str:String = "";
         if(theme == NodeGenerator.THEME_CIVILIAN)
         {
            id = 50 + rng.rand(5);
         }
         else if(theme == NodeGenerator.THEME_NINJA)
         {
            id = 28;
         }
         else if(theme == NodeGenerator.THEME_MERC)
         {
            id = 35;
         }
         var maxobj:int = roomWidth / 300;
         for(var i:int = 1; i < maxobj - 1; i++)
         {
            if(rng.rand(2) == 0)
            {
               str += "<obj><id>4</id><x>" + i * 300 + "</x><property>" + id.toString() + "</property></obj>";
            }
         }
         return str;
      }
      
      public function setBGParam(num:int) : *
      {
         this.bgParam = num;
      }
      
      public function setBG(num:int, side:int = 0) : *
      {
         this.bg = num;
      }
      
      public function getRoomType() : int
      {
         return this.roomType;
      }
      
      public function setRoomType(num:int, bgParam:int = 0, bgParam2:int = 0) : *
      {
         var territoryid:int = 0;
         var territoryName:String = null;
         var dir1:String = null;
         var dir2:String = null;
         var terrSector:Point = null;
         var dir:String = null;
         this.roomType = num;
         this.bgParam = bgParam;
         this.bgParam2 = bgParam2;
         if(this.roomType == ROOM_TOWNCASTLE)
         {
            this.roomName = LangManager.getString(783);
         }
         else if(this.roomType == ROOM_NINJAVILLAGE)
         {
            this.roomName = LangManager.getString(784);
         }
         else if(this.roomType == ROOM_NINJAVILLAGEENTRANCE)
         {
            this.roomName = LangManager.getString(785);
         }
         else if(this.roomType == ROOM_NINJATRAIL)
         {
            this.roomName = LangManager.getString(786);
         }
         else if(this.roomType == ROOM_CASTLEOUTERWALL || this.roomType == ROOM_CASTLEOUTERWALLSTART)
         {
            this.roomName = LangManager.getString(787);
         }
         else if(this.roomType == ROOM_CASTLEINNERWALL)
         {
            this.roomName = LangManager.getString(788);
         }
         else if(this.roomType == ROOM_CASTLECOURTYARD)
         {
            this.roomName = LangManager.getString(789);
         }
         else if(this.roomType == ROOM_CASTLECORRIDOR)
         {
            this.roomName = LangManager.getString(790);
         }
         else if(this.roomType == ROOM_CASTLEROOM)
         {
            this.roomName = LangManager.getString(791);
         }
         else
         {
            territoryid = NodeGenerator.instance.getTerritoryId(this.nodeid);
            territoryName = NameGenerator.instance.getPlaceName(territoryid);
            dir1 = "";
            dir2 = "";
            terrSector = NodeGenerator.instance.getTerritorySector(this.nodeid);
            if(terrSector.y <= 1)
            {
               dir1 = LangManager.getString(398);
            }
            else if(terrSector.y >= 4)
            {
               dir1 = LangManager.getString(399);
            }
            if(terrSector.x <= 1)
            {
               dir2 = LangManager.getString(401);
            }
            else if(terrSector.x >= 4)
            {
               dir2 = LangManager.getString(400);
            }
            dir = dir1 + dir2;
            if(dir != "")
            {
               dir += " ";
            }
            switch(this.bg)
            {
               case GameStage.BG_DUNGEON || GameStage.BG_DUNGEON_FOG:
                  this.roomName = dir + territoryName + " " + LangManager.getString(427);
                  break;
               case GameStage.BG_CAVE:
                  this.roomName = dir + territoryName + " " + LangManager.getString(428);
                  break;
               case GameStage.BG_MINE:
                  this.roomName = dir + territoryName + " " + LangManager.getString(494);
                  break;
               case GameStage.BG_ANCIENTRUINS:
                  this.roomName = dir + territoryName + " " + LangManager.getString(1028);
                  break;
               case GameStage.BG_TOWNPROCGEN_VILLAGE:
               case GameStage.BG_TOWNPROCGEN_TOWN:
               case GameStage.BG_TOWNPROCGEN_CITY:
                  this.isPrivate = 2;
            }
         }
      }
      
      public function addExit(dir:int, index:int = 0) : *
      {
         this.exits[dir] = 1;
         this.dest[dir] = index;
         if(this.exitTo == -1)
         {
            this.exitTo = dir;
         }
      }
      
      public function removeExit(dir:int) : *
      {
         this.exits[dir] = 0;
      }
      
      public function removeExitTo() : *
      {
         this.exits[this.exitTo] = 0;
      }
      
      public function removeExitFrom() : *
      {
         this.exits[this.enterFrom] = 0;
      }
      
      public function hasExit(dir:int) : *
      {
         return this.exits[dir] == 1;
      }
      
      public function getTotalExits() : int
      {
         return this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3];
      }
      
      public function removeMainRouteJunction(junctionEnterFrom:int) : *
      {
         var junctionEnterTo:int = 0;
         if(junctionEnterFrom == EXIT_N)
         {
            junctionEnterTo = EXIT_S;
         }
         else if(junctionEnterFrom == EXIT_S)
         {
            junctionEnterTo = EXIT_N;
         }
         else if(junctionEnterFrom == EXIT_E)
         {
            junctionEnterTo = EXIT_W;
         }
         else if(junctionEnterFrom == EXIT_W)
         {
            junctionEnterTo = EXIT_E;
         }
         this.exits[junctionEnterTo] = 0;
         this.dest[junctionEnterTo] = 0;
      }
      
      public function addExitFrom(dir:int, index:int = 0) : *
      {
         if(dir == EXIT_N)
         {
            this.exits[EXIT_S] = 1;
            this.dest[EXIT_S] = index;
            if(this.enterFrom == -1)
            {
               this.enterFrom = EXIT_S;
            }
         }
         else if(dir == EXIT_S)
         {
            this.exits[EXIT_N] = 1;
            this.dest[EXIT_N] = index;
            if(this.enterFrom == -1)
            {
               this.enterFrom = EXIT_N;
            }
         }
         else if(dir == EXIT_E)
         {
            this.exits[EXIT_W] = 1;
            this.dest[EXIT_W] = index;
            if(this.enterFrom == -1)
            {
               this.enterFrom = EXIT_W;
            }
         }
         else if(dir == EXIT_W)
         {
            this.exits[EXIT_E] = 1;
            this.dest[EXIT_E] = index;
            if(this.enterFrom == -1)
            {
               this.enterFrom = EXIT_E;
            }
         }
      }
      
      public function getEnterFrom() : int
      {
         return this.enterFrom;
      }
      
      internal function isEnterFromLeft() : Boolean
      {
         if(this.enterFrom == EXIT_W && this.exitTo == -1)
         {
            return true;
         }
         if(this.enterFrom == EXIT_S && this.exitTo == -1)
         {
            return true;
         }
         if(this.enterFrom == EXIT_W && this.exitTo == EXIT_E)
         {
            return true;
         }
         if(this.enterFrom == EXIT_S && this.exitTo == EXIT_N)
         {
            return true;
         }
         if(this.enterFrom == EXIT_E && this.exitTo == EXIT_N)
         {
            return true;
         }
         if(this.enterFrom == EXIT_S && this.exitTo == EXIT_E)
         {
            return true;
         }
         if(this.enterFrom == EXIT_S && this.exitTo == EXIT_W)
         {
            return true;
         }
         if(this.enterFrom == EXIT_W && this.exitTo == EXIT_N)
         {
            return true;
         }
         return false;
      }
      
      public function addObject(id:int, xpos:int, property:String, objname:String) : *
      {
         this.objList.push("<obj><id>" + id + "</id><x>" + xpos + "</x><property>" + property + "</property><name>" + objname + "</name></obj>");
      }
      
      public function addObjectToFront(id:int, xpos:int, property:String, objname:String) : *
      {
         this.objList.unshift("<obj><id>" + id + "</id><x>" + xpos + "</x><property>" + property + "</property><name>" + objname + "</name></obj>");
      }
      
      public function output(rng:RNG = null) : XMLRoomData
      {
         var xpos:int = 0;
         var signdir:int = 0;
         var objName:String = null;
         var prop:String = null;
         var doortype:int = 0;
         if(this.roomType == ROOM_NOTHING)
         {
            return null;
         }
         var roomData:XMLRoomData = new XMLRoomData(new XML());
         roomData.bg = this.bg;
         roomData.width = this.roomWidth;
         roomData.roomName = this.roomName;
         roomData.roomid = this.roomid;
         roomData.enterFrom = this.enterFrom;
         roomData.isPrivate = this.isPrivate;
         roomData.bgParam = this.bgParam;
         roomData.bgParam2 = this.bgParam2;
         var destN:int = int(this.dest[EXIT_N]);
         var destS:int = int(this.dest[EXIT_S]);
         var destE:int = int(this.dest[EXIT_E]);
         var destW:int = int(this.dest[EXIT_W]);
         var isNSOrientation:Boolean = this.isRoomNSOrientation(this.exits);
         var totalExits:int = this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3];
         if(this.roomType == ROOM_LOCK)
         {
            if(this.bg == GameStage.BG_DUNGEON || this.bg == GameStage.BG_DUNGEON_FOG)
            {
               doortype = 0;
            }
            else if(this.bg == GameStage.BG_MINE)
            {
               doortype = 1;
            }
            else if(this.bg == GameStage.BG_ANCIENTRUINS)
            {
               doortype = 4;
            }
         }
         else if(this.roomType == ROOM_LOCKEDGATE)
         {
            if(this.bg == GameStage.BG_DUNGEON || this.bg == GameStage.BG_DUNGEON_FOG)
            {
               doortype = 2;
            }
            else if(this.bg == GameStage.BG_MINE)
            {
               doortype = 3;
            }
            else if(this.bg == GameStage.BG_ANCIENTRUINS)
            {
               doortype = 5;
            }
         }
         if(this.bg == GameStage.BG_JINMAKU || this.bg == GameStage.BG_JINMAKU_NIGHT)
         {
            if(isNSOrientation && this.exits[3] == 1 || !isNSOrientation && this.exits[0] == 1)
            {
               this.roomWidth = 2150;
               roomData.width = this.roomWidth;
            }
         }
         else if(this.bg == GameStage.BG_TEMPLEINTERIOR || this.bg == GameStage.BG_TEMPLEINTERIOR2)
         {
            if(isNSOrientation && this.exits[3] == 1 || !isNSOrientation && this.exits[0] == 1)
            {
               this.roomWidth = 1350;
               roomData.width = this.roomWidth;
            }
         }
         else if(this.bg == GameStage.BG_ANCIENTRUINS)
         {
            if(isNSOrientation && this.exits[3] == 1 || !isNSOrientation && this.exits[0] == 1)
            {
               this.roomWidth = 1400;
               roomData.width = this.roomWidth;
            }
         }
         if(this.exits[EXIT_N] == 1)
         {
            if(isNSOrientation)
            {
               xpos = this.roomWidth - 50;
               signdir = EXIT_E;
            }
            else if(totalExits == 2)
            {
               if(this.exits[EXIT_E] == 0)
               {
                  xpos = this.roomWidth - 250;
                  signdir = DIR_NE;
               }
               else
               {
                  xpos = 250;
                  signdir = DIR_NW;
               }
            }
            else
            {
               xpos = this.roomWidth / 2;
               signdir = EXIT_N;
            }
            if(this.roomType != ROOM_LOCK && this.roomType != ROOM_LOCKEDGATE || this.enterFrom == EXIT_N)
            {
               this.addObjectToFront(0,xpos,destN + ",50,-1,1," + EXIT_N + "," + signdir,"nexit");
               this.removeDecorAt(xpos,100);
               if(signdir != EXIT_E)
               {
                  if(this.showDoorway())
                  {
                     this.objList.push("<obj><id>20</id><x>" + xpos + "</x><property>" + this.bg + "," + this.bgParam + "</property></obj>");
                  }
                  else if(this.bg == GameStage.BG_JINMAKU || this.bg == GameStage.BG_JINMAKU_NIGHT)
                  {
                     if(xpos == 250)
                     {
                        roomData.bgParam2 = 1;
                     }
                     else if(xpos == this.roomWidth / 2)
                     {
                        roomData.bgParam2 = 2;
                     }
                     else
                     {
                        roomData.bgParam2 = 3;
                     }
                  }
                  else if(this.bg == GameStage.BG_TEMPLEINTERIOR || this.bg == GameStage.BG_TEMPLEINTERIOR2)
                  {
                     if(xpos == 250)
                     {
                        roomData.bgParam2 = 1;
                     }
                     else if(xpos == this.roomWidth / 2)
                     {
                        roomData.bgParam2 = 3;
                     }
                     else
                     {
                        roomData.bgParam2 = 5;
                     }
                  }
                  else if(this.bg == GameStage.BG_ANCIENTRUINS)
                  {
                     if(xpos == 250)
                     {
                        roomData.bgParam2 = 1;
                     }
                     else if(xpos == this.roomWidth / 2)
                     {
                        roomData.bgParam2 = 3;
                     }
                     else
                     {
                        roomData.bgParam2 = 2;
                     }
                  }
                  else if(this.isTown())
                  {
                     this.addJunction(xpos);
                     roomData.bgParam = 1;
                  }
               }
            }
            else
            {
               if(xpos == this.roomWidth - 50)
               {
                  xpos = this.roomWidth - 250;
               }
               this.removeDecorAt(xpos,100);
               objName = "door_" + this.roomid.toString() + "_" + xpos.toString();
               if(this.bg == GameStage.BG_ANCIENTRUINS)
               {
                  if(xpos == 250)
                  {
                     roomData.bgParam2 = 1;
                     xpos = 250;
                  }
                  else if(xpos == this.roomWidth / 2)
                  {
                     roomData.bgParam2 = 3;
                     xpos = 570;
                  }
                  else
                  {
                     roomData.bgParam2 = 2;
                     xpos = 850;
                  }
               }
               this.objList.push("<obj><id>22</id><x>" + xpos + "</x><property>" + destN + ",50,-1,1," + EXIT_N + "," + signdir + "," + doortype + "," + this.bgParam + "</property><name>" + objName + "</name></obj>");
            }
         }
         if(this.exits[EXIT_S] == 1)
         {
            if(isNSOrientation)
            {
               xpos = 50;
               signdir = EXIT_W;
            }
            else if(totalExits == 2)
            {
               if(this.exits[EXIT_W] == 0)
               {
                  xpos = 250;
                  signdir = DIR_SW;
               }
               else
               {
                  xpos = this.roomWidth - 250;
                  signdir = DIR_SE;
               }
            }
            else
            {
               xpos = this.roomWidth / 2;
               signdir = EXIT_S;
               if(this.exits[EXIT_N] == 1)
               {
                  signdir = DIR_S_LOW;
               }
            }
            if(this.roomType != ROOM_LOCK && this.roomType != ROOM_LOCKEDGATE || this.enterFrom == EXIT_S)
            {
               this.addObjectToFront(0,xpos,destS + ",50,-1,1," + EXIT_S + "," + signdir,"sexit");
               this.removeDecorAt(xpos,100);
            }
            else
            {
               if(xpos == 50)
               {
                  xpos = 250;
               }
               this.removeDecorAt(xpos,100);
               objName = "door_" + this.roomid.toString() + "_" + xpos.toString();
               if(this.bg == GameStage.BG_ANCIENTRUINS)
               {
                  if(xpos == 250)
                  {
                     roomData.bgParam2 = 1;
                     xpos = 250;
                  }
                  else if(xpos == this.roomWidth / 2)
                  {
                     roomData.bgParam2 = 3;
                     xpos = 570;
                  }
                  else
                  {
                     roomData.bgParam2 = 2;
                     xpos = 850;
                  }
               }
               this.objList.push("<obj><id>22</id><x>" + xpos + "</x><property>" + destS + ",50,-1,1," + EXIT_S + "," + signdir + "," + doortype + "," + this.bgParam + "</property><name>" + objName + "</name></obj>");
            }
         }
         if(this.exits[EXIT_W] == 1)
         {
            if(!isNSOrientation)
            {
               xpos = 50;
               signdir = EXIT_W;
            }
            else if(totalExits == 2)
            {
               if(this.exits[EXIT_N] == 0)
               {
                  xpos = this.roomWidth - 250;
                  signdir = DIR_NE;
               }
               else
               {
                  xpos = 250;
                  signdir = DIR_NW;
               }
            }
            else
            {
               xpos = this.roomWidth / 2;
               signdir = EXIT_N;
            }
            if(this.roomType != ROOM_LOCK && this.roomType != ROOM_LOCKEDGATE || this.enterFrom == EXIT_W)
            {
               this.addObjectToFront(0,xpos,destW + ",50,-1,1," + EXIT_W + "," + signdir,"wexit");
               this.removeDecorAt(xpos,100);
               if(signdir != EXIT_W)
               {
                  if(this.showDoorway())
                  {
                     this.objList.push("<obj><id>20</id><x>" + xpos + "</x><property>" + this.bg + "," + this.bgParam + "</property></obj>");
                  }
                  else if(this.bg == GameStage.BG_JINMAKU || this.bg == GameStage.BG_JINMAKU_NIGHT)
                  {
                     if(xpos == 250)
                     {
                        roomData.bgParam2 = 1;
                     }
                     else if(xpos == this.roomWidth / 2)
                     {
                        roomData.bgParam2 = 2;
                     }
                     else
                     {
                        roomData.bgParam2 = 3;
                     }
                  }
                  else if(this.bg == GameStage.BG_TEMPLEINTERIOR || this.bg == GameStage.BG_TEMPLEINTERIOR2)
                  {
                     if(xpos == 250)
                     {
                        roomData.bgParam2 = 1;
                     }
                     else if(xpos == this.roomWidth / 2)
                     {
                        roomData.bgParam2 = 3;
                     }
                     else
                     {
                        roomData.bgParam2 = 5;
                     }
                  }
                  else if(this.bg == GameStage.BG_ANCIENTRUINS)
                  {
                     if(xpos == 250)
                     {
                        roomData.bgParam2 = 1;
                     }
                     else if(xpos == this.roomWidth / 2)
                     {
                        roomData.bgParam2 = 3;
                     }
                     else
                     {
                        roomData.bgParam2 = 2;
                     }
                  }
                  else if(this.isTown())
                  {
                     this.addJunction(xpos);
                     roomData.bgParam = 1;
                  }
               }
            }
            else
            {
               if(xpos == 50)
               {
                  xpos = 250;
               }
               this.removeDecorAt(xpos,100);
               objName = "door_" + this.roomid.toString() + "_" + xpos.toString();
               if(this.bg == GameStage.BG_ANCIENTRUINS)
               {
                  if(xpos == 250)
                  {
                     roomData.bgParam2 = 1;
                     xpos = 250;
                  }
                  else if(xpos == this.roomWidth / 2)
                  {
                     roomData.bgParam2 = 3;
                     xpos = 570;
                  }
                  else
                  {
                     roomData.bgParam2 = 2;
                     xpos = 850;
                  }
               }
               this.objList.push("<obj><id>22</id><x>" + xpos + "</x><property>" + destW + ",50,-1,1," + EXIT_W + "," + signdir + "," + doortype + "," + this.bgParam + "</property><name>" + objName + "</name></obj>");
            }
         }
         if(this.exits[EXIT_E] == 1)
         {
            if(!isNSOrientation)
            {
               xpos = this.roomWidth - 50;
               signdir = EXIT_E;
            }
            else if(totalExits == 2)
            {
               if(this.exits[EXIT_S] == 0)
               {
                  xpos = 250;
                  signdir = DIR_SW;
               }
               else
               {
                  xpos = this.roomWidth - 250;
                  signdir = DIR_SE;
               }
            }
            else
            {
               xpos = this.roomWidth / 2;
               signdir = EXIT_S;
            }
            if(this.roomType != ROOM_LOCK && this.roomType != ROOM_LOCKEDGATE || this.enterFrom == EXIT_E)
            {
               this.addObjectToFront(0,xpos,destE + ",50,-1,1," + EXIT_E + "," + signdir,"eexit");
               this.removeDecorAt(xpos,100);
            }
            else
            {
               if(xpos == this.roomWidth - 50)
               {
                  xpos = this.roomWidth - 250;
               }
               this.removeDecorAt(xpos,100);
               objName = "door_" + this.roomid.toString() + "_" + xpos.toString();
               if(this.bg == GameStage.BG_ANCIENTRUINS)
               {
                  if(xpos == 250)
                  {
                     roomData.bgParam2 = 1;
                     xpos = 250;
                  }
                  else if(xpos == this.roomWidth / 2)
                  {
                     roomData.bgParam2 = 3;
                     xpos = 570;
                  }
                  else
                  {
                     roomData.bgParam2 = 2;
                     xpos = 850;
                  }
               }
               this.objList.push("<obj><id>22</id><x>" + xpos + "</x><property>" + destE + ",50,-1,1," + EXIT_E + "," + signdir + "," + doortype + "," + this.bgParam + "</property><name>" + objName + "</name></obj>");
            }
         }
         if(this.isProcGenTown())
         {
            this.addBuildingsToList(rng);
         }
         if(this.roomType == ROOM_TOWN || this.roomType == ROOM_TOWNMERCHANT || this.roomType == ROOM_TOWNENTERTAINMENT || this.roomType == ROOM_TOWNENTRANCE)
         {
            roomData.roomIcon = this.townIcon;
         }
         else
         {
            roomData.roomIcon = this.roomType;
         }
         roomData.objectList = new XMLList(this.objList.join(""));
         return roomData;
      }
      
      internal function isRoomNSOrientation(exitArray:Array) : Boolean
      {
         return Minimap.isRoomNSOrientation(exitArray,this.enterFrom);
      }
      
      public function getIsNSOrientation() : Boolean
      {
         return this.isRoomNSOrientation(this.exits);
      }
      
      internal function getDecorWidth(num:int) : *
      {
         switch(num)
         {
            case 1:
               return 95;
            case 2:
               return 44;
            case 3:
               return 94;
            case 4:
               return 54;
            case 5:
               return 90;
            case 6:
               return 47;
            case 7:
               return 49;
            case 8:
               return 140;
            case 9:
               return 51;
            default:
               return 0;
         }
      }
      
      internal function removeDecorAt(xpos:int, range:int) : *
      {
         var xml:XML = null;
         for(var i:* = int(this.objList.length - 1); i >= 0; i--)
         {
            xml = XML(this.objList[i]);
            if(xml.id == 21)
            {
               if(Math.abs(xpos - (int(xml.x) + this.getDecorWidth(int(xml.property)) / 2)) < range)
               {
                  this.objList.splice(i,1);
               }
            }
         }
      }
      
      public function setTownColor(color:uint) : *
      {
         this.townColor = color;
      }
      
      public function initTownBuildings(slotCount:int, building:int, roomName:String, rng:RNG) : int
      {
         var i:int = 0;
         var slotusage:int = 0;
         var buildingPlacement:int = 0;
         this.townBuilding = building;
         this.townIcon = 1000 + building;
         if(this.slotCount == 0)
         {
            this.slotCount = slotCount;
            this.slots = new Array(slotCount);
            if(building != 15)
            {
               if(this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE)
               {
                  for(i = 0; i < slotCount; i++)
                  {
                     this.slots[i] = 1;
                  }
               }
               else
               {
                  this.slots[0] = rng.rand(2) + 2;
                  for(i = 1; i < slotCount; i += 2)
                  {
                     this.slots[i] = rng.rand(2) + 15;
                     this.slots[i + 1] = this.slots[i];
                  }
               }
            }
            else
            {
               for(i = 0; i < slotCount; i++)
               {
                  if(this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE)
                  {
                     this.slots[i] = 1;
                  }
                  else
                  {
                     this.slots[i] = rng.rand(2) + 2;
                  }
               }
            }
            this.roomWidth = slotCount * 355;
            this.roomName = roomName;
         }
         else
         {
            trace("RoomGenNode:initTownBuildings - adding to a room that is already initialized roomid: " + this.roomid);
         }
         if(building != 0 && building != 15)
         {
            slotusage = Obj_TownBuilding.getSlotUsage(building);
            if(this.roomType == ROOM_TOWNENTRANCE)
            {
               buildingPlacement = rng.rand(slotCount - slotusage - 1) + 1;
               this.slots[0] = Obj_TownBuilding.TYPE_RECENTEVENTSBOARD;
            }
            else
            {
               buildingPlacement = rng.rand(slotCount - slotusage);
            }
            if(buildingPlacement != 0 && Obj_TownBuilding.getSlotUsage(this.slots[buildingPlacement]) == 2)
            {
               if(this.slots[buildingPlacement - 1] == this.slots[buildingPlacement])
               {
                  this.slots[buildingPlacement - 1] = Obj_TownBuilding.TYPE_HOUSE1;
               }
            }
            for(i = 0; i < slotusage; i++)
            {
               this.slots[buildingPlacement + i] = building;
            }
         }
         return buildingPlacement;
      }
      
      internal function addJunction(xpos:int) : *
      {
         var startslot:int = 0;
         if(this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE)
         {
            return;
         }
         if(xpos == 250)
         {
            if(Obj_TownBuilding.getSlotUsage(this.slots[0]) == 2)
            {
               if(this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE)
               {
                  this.slots[1] = 1;
               }
               else
               {
                  this.slots[1] = 2;
               }
            }
            if(this.slots[0] != 0 && this.slots[0] != 1 && this.slots[0] != 2 && this.slots[0] != 3 && this.slots[0] != 15 && this.slots[0] != 16)
            {
               this.slots[1] = this.slots[0];
            }
            this.slots[0] = Obj_TownBuilding.TYPE_JUNCTION;
         }
         else if(xpos == this.roomWidth - 250)
         {
            if(Obj_TownBuilding.getSlotUsage(this.slots[this.slotCount - 2]) == 2)
            {
               if(this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE)
               {
                  this.slots[this.slotCount - 2] = 1;
               }
               else
               {
                  this.slots[this.slotCount - 2] = 3;
               }
            }
            if(this.slots[this.slotCount - 1] != 0 && this.slots[this.slotCount - 1] != 1 && this.slots[this.slotCount - 1] != 2 && this.slots[this.slotCount - 1] != 3 && this.slots[this.slotCount - 1] != 15 && this.slots[this.slotCount - 1] != 16)
            {
               this.slots[this.slotCount - 2] = this.slots[this.slotCount - 1];
            }
            this.slots[this.slotCount - 1] = Obj_TownBuilding.TYPE_JUNCTION;
         }
         else
         {
            startslot = Math.floor((this.slotCount - 1) / 2);
            if(Obj_TownBuilding.getSlotUsage(this.slots[startslot]) == 2)
            {
               if(this.slots[startslot - 1] == this.slots[startslot])
               {
                  if(this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE)
                  {
                     this.slots[startslot - 1] = 1;
                  }
                  else
                  {
                     this.slots[startslot - 1] = 2;
                  }
               }
               else if(this.slots[startslot + 1] == this.slots[startslot])
               {
                  if(this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE)
                  {
                     this.slots[startslot + 1] = 1;
                  }
                  else
                  {
                     this.slots[startslot + 1] = 3;
                  }
               }
            }
            if(this.slots[startslot] != 0 && this.slots[startslot] != 1 && this.slots[startslot] != 2 && this.slots[startslot] != 3 && this.slots[startslot] != 15 && this.slots[startslot] != 16)
            {
               this.slots[startslot + 1] = this.slots[startslot];
            }
            this.slots[startslot] = Obj_TownBuilding.TYPE_JUNCTION;
         }
      }
      
      internal function addBuildingsToList(rng:RNG) : *
      {
         if(Obj_TownBuilding.getSlotUsage(this.slots[this.slotCount - 1]) == 2 && this.slots[this.slotCount - 1] != this.slots[this.slotCount - 2])
         {
            if(this.slots[this.slotCount - 1] != 15 && this.slots[this.slotCount - 1] != 16)
            {
               trace("removing special building",this.roomid,this.slots[this.slotCount - 1]);
               this.townIcon = 0;
            }
            this.slots[this.slotCount - 1] = Obj_TownBuilding.TYPE_HOUSE1;
         }
         var junctionSlot:int = -1;
         for(var i:int = 0; i < this.slotCount; i++)
         {
            if(this.slots[i] == Obj_TownBuilding.TYPE_JUNCTION)
            {
               junctionSlot = i;
            }
            else
            {
               this.addObject(27,i * 355,this.slots[i] + "," + this.townColor,"building" + i);
               i += Obj_TownBuilding.getSlotUsage(this.slots[i]) - 1;
            }
         }
         if(junctionSlot != -1)
         {
            this.addObject(27,junctionSlot * 355,Obj_TownBuilding.TYPE_JUNCTION.toString() + "," + this.townColor,"junction");
         }
      }
      
      internal function isTown() : Boolean
      {
         return this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE || this.bg == GameStage.BG_TOWNPROCGEN_TOWN || this.bg == GameStage.BG_TOWNPROCGEN_CITY;
      }
      
      internal function showDoorway() : Boolean
      {
         return this.bg == GameStage.BG_DUNGEON || this.bg == GameStage.BG_DUNGEON_FOG || this.bg == GameStage.BG_MINE;
      }
      
      internal function isProcGenTown() : Boolean
      {
         return this.bg == GameStage.BG_TOWNPROCGEN_VILLAGE || this.bg == GameStage.BG_TOWNPROCGEN_TOWN || this.bg == GameStage.BG_TOWNPROCGEN_CITY;
      }
      
      public function initCastleRoomObjects(theme:int, lvl:int, castleSide:int, rng:RNG, atWar:Boolean) : *
      {
         var objname:String = null;
         var xpos:int = 0;
         var guardCount:int = 0;
         var i:int = 0;
         var props:String = null;
         var isNSOrientation:Boolean = this.getIsNSOrientation();
         if(castleSide != 6)
         {
            lvl += 5;
         }
         if(this.roomType == ROOM_TOWNCASTLE)
         {
            if(this.exitTo == EXIT_W || this.exitTo == EXIT_S)
            {
               if(StatsManager.getSide() == castleSide && StatsManager.getSide() != 0)
               {
                  if(castleSide == 1)
                  {
                     this.addObjectToFront(3,150,"252,idle2,1","guard" + this.roomid);
                  }
                  else if(castleSide == 2)
                  {
                     this.addObjectToFront(3,150,"452,idle2,1","guard" + this.roomid);
                  }
                  else if(castleSide == 3)
                  {
                     this.addObjectToFront(3,150,"352,idle2,1","guard" + this.roomid);
                  }
                  else if(castleSide == 4)
                  {
                     this.addObjectToFront(3,150,"552,idle2,1","guard" + this.roomid);
                  }
                  else
                  {
                     this.addObjectToFront(3,150,"652,idle2,1","guard0");
                  }
               }
               else if(castleSide == 1)
               {
                  this.addObjectToFront(9,150,"252," + lvl + ",<xml><wave><enemy><id>252</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else if(castleSide == 2)
               {
                  this.addObjectToFront(9,150,"452," + lvl + ",<xml><wave><enemy><id>452</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else if(castleSide == 3)
               {
                  this.addObjectToFront(9,150,"352," + lvl + ",<xml><wave><enemy><id>352</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else if(castleSide == 4)
               {
                  this.addObjectToFront(9,150,"552," + lvl + ",<xml><wave><enemy><id>552</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else if(castleSide == 6)
               {
                  this.addObjectToFront(9,150,"25," + lvl + ",<xml><wave><enemy><id>25</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
               else
               {
                  this.addObjectToFront(9,150,"652," + lvl + ",<xml><wave><enemy><id>652</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1,0,1","guard" + this.roomid);
               }
            }
            else if(StatsManager.getSide() == castleSide && StatsManager.getSide() != 0)
            {
               if(castleSide == 1)
               {
                  this.addObjectToFront(3,this.roomWidth - 150,"252","guard" + this.roomid);
               }
               else if(castleSide == 2)
               {
                  this.addObjectToFront(3,this.roomWidth - 150,"452","guard" + this.roomid);
               }
               else if(castleSide == 3)
               {
                  this.addObjectToFront(3,this.roomWidth - 150,"352","guard" + this.roomid);
               }
               else if(castleSide == 4)
               {
                  this.addObjectToFront(3,this.roomWidth - 150,"552","guard" + this.roomid);
               }
               else
               {
                  this.addObjectToFront(3,this.roomWidth - 150,"652","guard0");
               }
            }
            else if(castleSide == 1)
            {
               this.addObjectToFront(9,this.roomWidth - 150,"252," + lvl + ",<xml><wave><enemy><id>252</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else if(castleSide == 2)
            {
               this.addObjectToFront(9,this.roomWidth - 150,"452," + lvl + ",<xml><wave><enemy><id>452</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else if(castleSide == 3)
            {
               this.addObjectToFront(9,this.roomWidth - 150,"352," + lvl + ",<xml><wave><enemy><id>352</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else if(castleSide == 4)
            {
               this.addObjectToFront(9,this.roomWidth - 150,"552," + lvl + ",<xml><wave><enemy><id>552</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else if(castleSide == 6)
            {
               this.addObjectToFront(9,this.roomWidth - 150,"25," + lvl + ",<xml><wave><enemy><id>25</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
            else
            {
               this.addObjectToFront(9,this.roomWidth - 150,"652," + lvl + ",<xml><wave><enemy><id>652</id><qty>1</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,1","guard" + this.roomid);
            }
         }
         else
         {
            if(this.roomType != ROOM_CASTLEOUTERWALLSTART && this.roomType != ROOM_CASTLEDEFENDERSPAWN && atWar)
            {
               this.isPrivate = XMLRoomData.ROOMTYPE_PVPCLAN;
               return;
            }
            guardCount = 3;
            if(this.roomType == ROOM_CASTLEROOM || this.roomType == ROOM_CASTLEFLAGROOM || this.roomType == ROOM_CASTLECORRIDOR)
            {
               guardCount = 1;
            }
            else if(this.roomType == ROOM_CASTLEDEFENDERSPAWN)
            {
               guardCount = 0;
            }
            if(StatsManager.getSide() == castleSide && StatsManager.getSide() != 0)
            {
               for(i = 0; i < guardCount; i++)
               {
                  if(castleSide == 1)
                  {
                     this.addObject(4,rng.rand(this.roomWidth),"252","guard" + this.roomid);
                  }
                  else if(castleSide == 2)
                  {
                     this.addObject(4,rng.rand(this.roomWidth),"452","guard" + this.roomid);
                  }
                  else if(castleSide == 3)
                  {
                     this.addObject(4,rng.rand(this.roomWidth),"352","guard" + this.roomid);
                  }
                  else if(castleSide == 4)
                  {
                     this.addObject(4,rng.rand(this.roomWidth),"552","guard" + this.roomid);
                  }
                  else
                  {
                     this.addObject(4,rng.rand(this.roomWidth),"652","guard" + this.roomid);
                  }
               }
            }
            else
            {
               for(i = 0; i < guardCount; i++)
               {
                  if(castleSide == 1)
                  {
                     if(rng.rand(3) == 0)
                     {
                        props = "252," + lvl + ",<xml><wave><enemy><id>252</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>252</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>252</id><qty>8</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        props = "252," + lvl + ",<xml><wave><enemy><id>252</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>252</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     this.addObject(9,rng.rand(this.roomWidth),props,"guard" + this.roomid);
                  }
                  else if(castleSide == 2)
                  {
                     if(rng.rand(3) == 0)
                     {
                        props = "452," + lvl + ",<xml><wave><enemy><id>452</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>452</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>452</id><qty>8</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        props = "452," + lvl + ",<xml><wave><enemy><id>452</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>452</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     this.addObject(9,rng.rand(this.roomWidth),props,"guard" + this.roomid);
                  }
                  else if(castleSide == 3)
                  {
                     if(rng.rand(3) == 0)
                     {
                        props = "352," + lvl + ",<xml><wave><enemy><id>352</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>352</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>352</id><qty>8</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        props = "352," + lvl + ",<xml><wave><enemy><id>352</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>352</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     this.addObject(9,rng.rand(this.roomWidth),props,"guard" + this.roomid);
                  }
                  else if(castleSide == 4)
                  {
                     if(rng.rand(3) == 0)
                     {
                        props = "552," + lvl + ",<xml><wave><enemy><id>552</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>552</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>552</id><qty>8</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        props = "552," + lvl + ",<xml><wave><enemy><id>552</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>552</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     this.addObject(9,rng.rand(this.roomWidth),props,"guard" + this.roomid);
                  }
                  else if(castleSide == 6)
                  {
                     this.objList.push(createRoomEnemy(rng,NodeGenerator.THEME_CLANPURPLE,this.roomWidth,rng.rand(this.roomWidth),lvl,"guard" + this.roomid));
                  }
                  else
                  {
                     if(rng.rand(3) == 0)
                     {
                        props = "652," + lvl + ",<xml><wave><enemy><id>652</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>652</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>652</id><qty>8</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     else
                     {
                        props = "652," + lvl + ",<xml><wave><enemy><id>652</id><qty>4</qty><lvl>" + lvl + "</lvl></enemy></wave><wave><enemy><id>652</id><qty>6</qty><lvl>" + lvl + "</lvl></enemy></wave></xml>,2";
                     }
                     this.addObject(9,rng.rand(this.roomWidth),props,"guard" + this.roomid);
                  }
               }
            }
         }
      }
      
      internal function isTrapRoom() : Boolean
      {
         return this.roomType == ROOM_TRAP || this.roomType == ROOM_TRAPEASY || this.roomType == ROOM_TRAPMEDIUM || this.roomType == ROOM_TRAPHARD || this.roomType == ROOM_TRAPVERYHARD || this.roomType == ROOM_TRAPKEY;
      }
      
      public function initRoomObjects(theme:int, lvl:int, signXPos:int, rng:RNG, nodeid:int) : *
      {
         var objname:String = null;
         var xpos:int = 0;
         var totalExits:int = 0;
         var pos:int = 0;
         var decorType:int = 0;
         var j:int = 0;
         var max:int = 0;
         var enemyCount:int = 0;
         var i:* = 0;
         var objnamechest:String = null;
         var loottype:int = 0;
         var terr:Point = null;
         var terrID:int = 0;
         var terrArray:Array = null;
         var found:Boolean = false;
         var terrPt:Point = null;
         var trapRoom:XMLList = null;
         var roomList:XMLList = null;
         var trapdice:int = 0;
         var traplvl:int = 0;
         var traprng:RNG = null;
         var npcCount:int = 0;
         var rng2:RNG = new RNG(nodeid * this.roomid);
         var isNSOrientation:Boolean = this.getIsNSOrientation();
         if(this.roomType == ROOM_MINION && (this.bg == GameStage.BG_DUNGEON || this.bg == GameStage.BG_DUNGEON_FOG))
         {
            totalExits = this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3];
            if(totalExits == 2 && this.isEnterFromLeft() && rng.rand(4) == 0)
            {
               if(lvl < 10)
               {
                  this.roomType = ROOM_TRAPEASY;
               }
               else if(lvl < 50)
               {
                  this.roomType = ROOM_TRAPMEDIUM;
               }
               else
               {
                  this.roomType = ROOM_TRAPHARD;
               }
            }
         }
         else if(this.roomType == ROOM_MINION && this.bg == GameStage.BG_ANCIENTRUINS)
         {
            totalExits = this.exits[0] + this.exits[1] + this.exits[2] + this.exits[3];
            if(totalExits == 2)
            {
               if(lvl < 10)
               {
                  this.roomType = ROOM_TRAPEASY;
               }
               else if(lvl < 50)
               {
                  this.roomType = ROOM_TRAPMEDIUM;
               }
               else
               {
                  this.roomType = ROOM_TRAPHARD;
               }
            }
         }
         else if(this.roomType == ROOM_NINJATRAIL)
         {
            if(this.isEnterFromLeft() && rng.rand(2) == 0)
            {
               if(lvl < 10)
               {
                  this.roomType = ROOM_TRAPEASY;
               }
               else if(lvl < 50)
               {
                  this.roomType = ROOM_TRAPMEDIUM;
               }
               else
               {
                  this.roomType = ROOM_TRAPHARD;
               }
            }
            else
            {
               this.roomType = ROOM_MINION;
            }
         }
         else if(this.roomType == ROOM_KEY && this.isEnterFromLeft() && rng.rand(2) == 0)
         {
            this.roomType = ROOM_TRAPKEY;
         }
         if(this.roomType != ROOM_EXIT && this.roomType != ROOM_RETURNEXIT && this.roomType != ROOM_EMPTY && !this.isTrapRoom() && (theme == NodeGenerator.THEME_BANDIT || theme == NodeGenerator.THEME_CULTIST || theme == NodeGenerator.THEME_CULTIST_UNDEAD) && (this.bg == GameStage.BG_DUNGEON || this.bg == GameStage.BG_DUNGEON_FOG || this.bg == GameStage.BG_MINE))
         {
            pos = 50;
            for(j = 0; pos < this.roomWidth - 150; j++)
            {
               if(rng.rand(4) < 3)
               {
                  decorType = rng.rand(8) + 1;
                  this.objList.push("<obj><id>21</id><x>" + pos + "</x><property>" + decorType + "</property></obj>");
                  pos += this.getDecorWidth(decorType) + 10;
               }
               else
               {
                  pos += 100;
               }
            }
         }
         if(this.roomType == ROOM_ENTRANCE)
         {
            this.roomWidth = 800;
            if(this.enterFrom == EXIT_S || this.enterFrom == EXIT_W)
            {
               this.removeDecorAt(50,100);
            }
            else
            {
               this.removeDecorAt(750,100);
            }
         }
         if(this.isPrivate != XMLRoomData.ROOMTYPE_PVP && theme != NodeGenerator.THEME_TOWN && (this.roomType == ROOM_MINION || this.roomType == ROOM_KEY || this.roomType == ROOM_LOOT || this.roomType == ROOM_LOCK || this.roomType == ROOM_LOCKEDGATE || this.roomType == ROOM_LEVER || this.roomType == ROOM_TOWNENTRANCE || this.roomType == ROOM_TOWNEXIT || this.roomType == ROOM_TOWN || this.roomType == ROOM_SUBBOSS))
         {
            max = this.roomWidth / 200;
            enemyCount = 0;
            for(i = 1; i < max - 1; i += 2)
            {
               if(rng.rand(3) > 0 || theme == NodeGenerator.THEME_ABANDONED)
               {
                  objname = "aggro" + this.roomid;
                  this.objList.push(createRoomEnemy(rng,theme,this.roomWidth,200 * i,lvl,objname));
                  enemyCount++;
               }
            }
            if(enemyCount == 0)
            {
               for(i = 1; i < max - 1; i += 2)
               {
                  if(rng.rand(3) < 2)
                  {
                     objname = "aggro" + this.roomid;
                     this.objList.push(createRoomEnemy(rng,theme,this.roomWidth,200 * i,lvl,objname));
                  }
               }
            }
         }
         if(this.roomType == ROOM_KEY)
         {
            this.roomWidth = 800;
            if(theme == NodeGenerator.THEME_BANDIT && rng.rand(2) == 0)
            {
               this.objList.push(createSubBoss(rng,this.roomWidth,rng.rand(this.roomWidth - 400) + 200,lvl,"subboss"));
            }
            objname = "key" + this.roomid;
            if(this.exits[0] == 1 || this.exits[2] == 1)
            {
               this.objList.push("<obj><id>16</id><x>100</x><property>20</property><name>" + objname + "</name></obj>");
               this.removeDecorAt(100,100);
            }
            else
            {
               this.objList.push("<obj><id>16</id><x>" + (this.roomWidth - 100) + "</x><property>20</property><name>" + objname + "</name></obj>");
               this.removeDecorAt(this.roomWidth - 100,100);
            }
         }
         else if(this.roomType == ROOM_BOSS)
         {
            objname = "boss" + this.roomid;
            objnamechest = "goodlootchest" + this.roomid;
            if(this.bg == GameStage.BG_ANCIENTRUINS)
            {
               this.roomWidth = 1400;
               if(isNSOrientation && this.enterFrom != EXIT_N || !isNSOrientation && this.enterFrom != EXIT_E)
               {
                  this.objList.push("<obj><id>19</id><x>" + (this.roomWidth - 150) + "</x><property>" + lvl + "</property><name>" + objnamechest + "</name></obj>");
                  this.removeDecorAt(this.roomWidth - 150,100);
               }
               else
               {
                  this.objList.push("<obj><id>19</id><x>150</x><property>" + lvl + "</property><name>" + objnamechest + "</name></obj>");
                  this.removeDecorAt(150,100);
               }
            }
            else
            {
               this.roomWidth = 1000;
               if(isNSOrientation && this.enterFrom != EXIT_N || !isNSOrientation && this.enterFrom != EXIT_E)
               {
                  this.objList.push(createRoomEnemy(rng,theme,this.roomWidth,this.roomWidth - 300,lvl,objname,true,0));
                  if(theme == NodeGenerator.THEME_ONI)
                  {
                     this.roomWidth = 1200;
                     this.objList.push("<obj><id>24</id><x>" + (this.roomWidth - 100) + "</x><property>" + nodeid + ",3</property><name>darumadoll" + this.roomid + "</name></obj>");
                     this.objList.push("<obj><id>12</id><x>300</x><property>1</property></obj>");
                     if(lvl > 50)
                     {
                        this.objList.push(createRoomEnemy(rng,theme,this.roomWidth,this.roomWidth - 500,lvl,"ogre2",true,0));
                     }
                  }
                  if(this.bg == GameStage.BG_MINE)
                  {
                     this.objList.push("<obj><id>30</id><x>" + (this.roomWidth - 50) + "</x><property>100</property><name>" + objnamechest + "</name></obj>");
                  }
                  else
                  {
                     this.objList.push("<obj><id>19</id><x>" + (this.roomWidth - 150) + "</x><property>" + lvl + "</property><name>" + objnamechest + "</name></obj>");
                  }
                  this.removeDecorAt(this.roomWidth - 150,100);
               }
               else
               {
                  this.objList.push(createRoomEnemy(rng,theme,this.roomWidth,300,lvl,objname,true,1));
                  if(theme == NodeGenerator.THEME_ONI)
                  {
                     this.roomWidth = 1200;
                     this.objList.push("<obj><id>24</id><x>100</x><property>" + nodeid + ",3</property><name>darumadoll" + this.roomid + "</name></obj>");
                     this.objList.push("<obj><id>12</id><x>" + (this.roomWidth - 300) + "</x><property>1</property></obj>");
                     if(lvl > 50)
                     {
                        this.objList.push(createRoomEnemy(rng,theme,this.roomWidth,500,lvl,"ogre2",true,0));
                     }
                  }
                  if(this.bg == GameStage.BG_MINE)
                  {
                     this.objList.push("<obj><id>30</id><x>50</x><property>100</property><name>" + objnamechest + "</name></obj>");
                  }
                  else
                  {
                     this.objList.push("<obj><id>19</id><x>150</x><property>" + lvl + "</property><name>" + objnamechest + "</name></obj>");
                  }
                  this.removeDecorAt(150,100);
               }
            }
         }
         else if(this.roomType == ROOM_LOOT)
         {
            this.roomWidth = 800;
            if(theme == NodeGenerator.THEME_BANDIT && rng.rand(3) == 0)
            {
               this.objList.push(createSubBoss(rng,this.roomWidth,rng.rand(this.roomWidth - 400) + 200,lvl,"subboss"));
            }
            objname = "lootchest" + this.roomid;
            if(rng.rand(2) == 0)
            {
               if(this.exits[0] == 1 || this.exits[2] == 1)
               {
                  if(this.bg == GameStage.BG_CAVE && theme != NodeGenerator.THEME_ONI)
                  {
                     this.objList.push("<obj><id>2</id><x>100</x><property>8," + lvl + "</property><name>" + objname + "</name></obj>");
                  }
                  else if(this.bg == GameStage.BG_MINE)
                  {
                     this.objList.push("<obj><id>30</id><x>50</x><property>0</property><name>" + objname + "</name></obj>");
                  }
                  else
                  {
                     this.objList.push("<obj><id>18</id><x>100</x><property>" + lvl + "</property><name>" + objname + "</name></obj>");
                  }
                  this.removeDecorAt(100,100);
               }
               else
               {
                  if(this.bg == GameStage.BG_CAVE && theme != NodeGenerator.THEME_ONI)
                  {
                     this.objList.push("<obj><id>2</id><x>" + (this.roomWidth - 100) + "</x><property>8," + lvl + "</property><name>" + objname + "</name></obj>");
                  }
                  else if(this.bg == GameStage.BG_MINE)
                  {
                     this.objList.push("<obj><id>30</id><x>" + (this.roomWidth - 50) + "</x><property>0</property><name>" + objname + "</name></obj>");
                  }
                  else
                  {
                     this.objList.push("<obj><id>18</id><x>" + (this.roomWidth - 100) + "</x><property>" + lvl + "</property><name>" + objname + "</name></obj>");
                  }
                  this.removeDecorAt(this.roomWidth - 100,100);
               }
            }
            else if(this.roomid > 6 && rng.rand(4) == 3)
            {
               loottype = rng.rand(3);
               if(this.exits[0] == 1 || this.exits[2] == 1)
               {
                  this.objList.push("<obj><id>60</id><x>100</x><property>," + lvl + "," + loottype + "</property><name>" + objname + "</name></obj>");
                  this.removeDecorAt(100,100);
               }
               else
               {
                  this.objList.push("<obj><id>60</id><x>" + (this.roomWidth - 100) + "</x><property>," + lvl + "," + loottype + "</property><name>" + objname + "</name></obj>");
                  this.removeDecorAt(this.roomWidth - 100,100);
               }
            }
            else
            {
               this.roomType = ROOM_MINION;
            }
         }
         else if(this.roomType == ROOM_TREASURE)
         {
            this.roomWidth = 800;
            if(theme == NodeGenerator.THEME_BANDIT && rng.rand(2) == 0)
            {
               this.objList.push(createSubBoss(rng,this.roomWidth,rng.rand(this.roomWidth - 400) + 200,lvl,"subboss"));
            }
            objname = "goodlootchest" + this.roomid;
            if(this.exits[0] == 1 || this.exits[2] == 1)
            {
               this.objList.push("<obj><id>19</id><x>150</x><property>" + lvl + "</property><name>" + objname + "</name></obj>");
               this.removeDecorAt(150,100);
            }
            else
            {
               this.objList.push("<obj><id>19</id><x>" + (this.roomWidth - 150) + "</x><property>" + lvl + "</property><name>" + objname + "</name></obj>");
               this.removeDecorAt(this.roomWidth - 150,100);
            }
         }
         else if(this.roomType == ROOM_EXIT)
         {
            this.roomWidth = 800;
            if(this.exits[0] == 1 || this.exits[2] == 1)
            {
               this.objList.push("<obj><id>0</id><x>50</x><property>-1," + signXPos + ",-1</property></obj>");
               this.removeDecorAt(50,100);
            }
            else
            {
               this.objList.push("<obj><id>0</id><x>" + (this.roomWidth - 50) + "</x><property>-1," + signXPos + ",-1</property></obj>");
               this.removeDecorAt(this.roomWidth - 50,100);
            }
         }
         else if(this.roomType == ROOM_RETURNEXIT)
         {
            this.roomWidth = 800;
            if(this.exits[0] == 1 || this.exits[2] == 1)
            {
               this.objList.push("<obj><id>0</id><x>50</x><property>-2," + signXPos + ",-1</property></obj>");
               this.removeDecorAt(50,100);
            }
            else
            {
               this.objList.push("<obj><id>0</id><x>" + (this.roomWidth - 50) + "</x><property>-2," + signXPos + ",-1</property></obj>");
               this.removeDecorAt(this.roomWidth - 50,100);
            }
         }
         else if(this.roomType == ROOM_NINJATRAILEXIT)
         {
            terr = NodeGenerator.instance.getTerritory(nodeid);
            terrArray = [-1];
            for(i = 0; i < 4; i++)
            {
               found = false;
               if(i == EXIT_N)
               {
                  terrPt = new Point(terr.x,terr.y - 1);
               }
               else if(i == EXIT_S)
               {
                  terrPt = new Point(terr.x,terr.y + 1);
               }
               else if(i == EXIT_E)
               {
                  terrPt = new Point(terr.x + 1,terr.y);
               }
               else if(i == EXIT_W)
               {
                  terrPt = new Point(terr.x - 1,terr.y);
               }
               while(!found)
               {
                  terrID = terrPt.x << 12 | terrPt.y;
                  if(!QuestEngine.hasTerritory(terrPt.x,terrPt.y))
                  {
                     found = true;
                     terrID = -1;
                  }
                  if(QuestEngine.getTownState(terrID) == 0)
                  {
                     if(i == EXIT_N)
                     {
                        --terrPt.y;
                     }
                     else if(i == EXIT_S)
                     {
                        ++terrPt.y;
                     }
                     else if(i == EXIT_E)
                     {
                        ++terrPt.x;
                     }
                     else if(i == EXIT_W)
                     {
                        --terrPt.x;
                     }
                  }
                  else
                  {
                     found = true;
                     terrArray.push(NodeGenerator.instance.generateTerritoryData(terrPt.x,terrPt.y).getTownNode());
                  }
               }
            }
            this.roomWidth = 800;
            max = int(terrArray.length);
            if(this.exits[0] == 1 || this.exits[2] == 1)
            {
               for(i = 0; i < max; i++)
               {
                  this.objList.push("<obj><id>0</id><x>" + (50 + i * 100) + "</x><property>0," + signXPos + "," + terrArray[i] + "</property></obj>");
               }
               this.removeDecorAt(50,100);
            }
            else
            {
               for(i = int(max - 1); i >= 0; i--)
               {
                  this.objList.push("<obj><id>0</id><x>" + (this.roomWidth - 50 - i * 100) + "</x><property>0," + signXPos + "," + terrArray[i] + "</property></obj>");
               }
               this.removeDecorAt(this.roomWidth - 50,100);
            }
         }
         else if(this.roomType != ROOM_TOWNCASTLE)
         {
            if(this.roomType == ROOM_NINJAVILLAGEENTRANCE)
            {
               this.roomWidth = 1000;
               this.objList.push("<obj><id>25</id><x>" + this.roomWidth / 2 + "</x><property>6,0,0</property></obj>");
            }
            else if(this.roomType == ROOM_NINJAVILLAGE)
            {
               this.roomWidth = 2000;
               this.bg = GameStage.BG_NINJAVILLAGE;
               for(i = 0; i < 3 + rng.rand(3); i++)
               {
                  this.addObject(4,rng.rand(this.roomWidth),"31","npc" + i);
               }
            }
            else if(this.roomType == ROOM_LEVER)
            {
               this.roomWidth = 800;
               if(theme == NodeGenerator.THEME_BANDIT && rng.rand(2) == 0)
               {
                  this.objList.push(createSubBoss(rng,this.roomWidth,rng.rand(this.roomWidth - 400) + 200,lvl,"subboss"));
               }
               objname = "lever" + this.roomid;
               if(this.exits[0] == 1 || this.exits[2] == 1)
               {
                  this.objList.push("<obj><id>33</id><x>100</x><property>,5</property><name>" + objname + "</name></obj>");
                  this.removeDecorAt(100,100);
               }
               else
               {
                  this.objList.push("<obj><id>33</id><x>" + (this.roomWidth - 100) + "</x><property>,5</property><name>" + objname + "</name></obj>");
                  this.removeDecorAt(this.roomWidth - 100,100);
               }
            }
            else if(this.roomType == ROOM_SUBBOSS)
            {
               if(theme == NodeGenerator.THEME_BANDIT)
               {
                  this.objList.push(createSubBoss(rng,this.roomWidth,rng.rand(this.roomWidth - 400) + 200,lvl,"subboss"));
               }
            }
            else if(this.roomType == ROOM_INN)
            {
               this.addObject(12,900,"1","");
               this.addObject(38,950,"","innbar");
               this.addObject(3,975,"148","innkeeper");
            }
            else if(this.roomType == ROOM_GAMBLINGDEN)
            {
               this.addObject(3,500,(50 + rng.rand(4)).toString() + ",sit,1","patron1");
               this.addObject(3,640,"147,sit","croupier1");
               this.addObject(37,570,"","gamblingtable1");
               npcCount = QuestGenerator.instance.getQuestNPCCount(nodeid,this.roomid,QueryManager.instance.getServerDate());
               for(i = 0; i < npcCount; i++)
               {
                  this.addObject(23,rng2.rand(this.roomWidth),i.toString(),"procgennpc" + i);
               }
               npcCount = rng.rand(3);
               for(i = 0; i < npcCount; i++)
               {
                  this.addObject(4,500,(50 + rng2.rand(4)).toString(),"npc" + i);
               }
               this.addObject(12,550,"1","");
            }
            else if(this.isTrapRoom())
            {
               trapRoom = null;
               traplvl = -1;
               if(this.roomType == ROOM_TRAP || this.roomType == ROOM_TRAPKEY)
               {
                  if(lvl < 10)
                  {
                     traplvl = ROOM_TRAPEASY;
                  }
                  else if(lvl < 50)
                  {
                     traplvl = ROOM_TRAPMEDIUM;
                  }
                  else
                  {
                     traplvl = ROOM_TRAPHARD;
                  }
               }
               if(this.roomType == ROOM_TRAPEASY || traplvl == ROOM_TRAPEASY)
               {
                  trapdice = rng.rand(4);
                  if(trapdice == 3)
                  {
                     roomList = QuestEngine.trapRoomData.medium;
                  }
                  else
                  {
                     roomList = QuestEngine.trapRoomData.easy;
                  }
               }
               else if(this.roomType == ROOM_TRAPMEDIUM || traplvl == ROOM_TRAPMEDIUM)
               {
                  trapdice = rng.rand(5);
                  if(trapdice == 3)
                  {
                     roomList = QuestEngine.trapRoomData.easy;
                  }
                  else if(trapdice == 4)
                  {
                     roomList = QuestEngine.trapRoomData.hard;
                  }
                  else
                  {
                     roomList = QuestEngine.trapRoomData.medium;
                  }
               }
               else if(this.roomType == ROOM_TRAPHARD || traplvl == ROOM_TRAPHARD)
               {
                  trapdice = rng.rand(4);
                  if(trapdice == 3)
                  {
                     roomList = QuestEngine.trapRoomData.medium;
                  }
                  else
                  {
                     roomList = QuestEngine.trapRoomData.hard;
                  }
               }
               else if(this.roomType == ROOM_TRAPVERYHARD)
               {
                  roomList = QuestEngine.trapRoomData.veryhard;
               }
               if(QuestEngine.trapRoomData.§default§.toString() != "")
               {
                  trapRoom = QuestEngine.trapRoomData.§default§.room;
               }
               else if(roomList.room.length() > 0)
               {
                  if(this.roomType == ROOM_TRAPVERYHARD)
                  {
                     traprng = new RNG(this.roomid * QueryManager.instance.getServerDate());
                     trapRoom = XMLList(roomList.room[traprng.rand(roomList.room.length())]);
                  }
                  else
                  {
                     trapRoom = XMLList(roomList.room[rng.rand(roomList.room.length())]);
                  }
               }
               if(trapRoom != null)
               {
                  if(trapRoom.width.toString() != "")
                  {
                     this.roomWidth = trapRoom.width;
                  }
                  else
                  {
                     this.roomWidth = 800;
                  }
                  max = int(trapRoom.obj.length());
                  for(i = 0; i < max; i++)
                  {
                     this.objList.push(trapRoom.obj[i].toString());
                  }
               }
               else if(this.roomType == ROOM_TRAPKEY)
               {
                  this.roomType = ROOM_KEY;
               }
               else
               {
                  this.roomType = ROOM_CORRIDOR;
               }
               if(this.roomType == ROOM_TRAPKEY)
               {
                  this.roomWidth += 150;
                  objname = "key" + this.roomid;
                  this.objList.push("<obj><id>16</id><x>" + (this.roomWidth - 100) + "</x><property>20</property><name>" + objname + "</name></obj>");
               }
            }
         }
         if(theme != NodeGenerator.THEME_CLANPURPLE)
         {
            if(this.roomType == ROOM_TOWN || this.roomType == ROOM_TOWNEXIT || this.roomType == ROOM_TOWNENTRANCE && theme != NodeGenerator.THEME_ABANDONED || this.roomType == ROOM_TOWNMERCHANT || this.roomType == ROOM_TOWNENTERTAINMENT || this.roomType == ROOM_TOWNHOUSING)
            {
               npcCount = QuestGenerator.instance.getQuestNPCCount(nodeid,this.roomid,QueryManager.instance.getServerDate());
               for(i = 0; i < npcCount; i++)
               {
                  this.addObject(23,rng2.rand(this.roomWidth),i.toString(),"procgennpc" + i);
               }
               npcCount = rng.rand(3);
               for(i = 0; i < npcCount; i++)
               {
                  this.addObject(4,rng.rand(this.roomWidth),(50 + rng.rand(4)).toString(),"npc" + i);
               }
            }
            else if(this.roomType == ROOM_INN || this.roomType == ROOM_TOWNCORRIDOR)
            {
               npcCount = QuestGenerator.instance.getQuestNPCCount(nodeid,this.roomid,QueryManager.instance.getServerDate());
               for(i = 0; i < npcCount; i++)
               {
                  this.addObject(23,rng2.rand(this.roomWidth - 200),i.toString(),"procgennpc" + i);
               }
               npcCount = rng.rand(2);
               for(i = 0; i < npcCount; i++)
               {
                  this.addObject(4,rng.rand(this.roomWidth - 200),(50 + rng.rand(4)).toString(),"npc" + i);
               }
            }
            else if(this.roomType == ROOM_GAMBLINGROOM)
            {
               npcCount = QuestGenerator.instance.getQuestNPCCount(nodeid,this.roomid,QueryManager.instance.getServerDate());
               for(i = 0; i < npcCount; i++)
               {
                  this.addObject(23,rng2.rand(this.roomWidth),i.toString(),"procgennpc" + i);
               }
            }
         }
      }
   }
}

