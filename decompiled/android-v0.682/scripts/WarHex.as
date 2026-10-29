package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import playerio.DatabaseObject;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol622")]
   public class WarHex extends MovieClip
   {
      
      public static var HEX_NOTHING:int = 0;
      
      public static var HEX_SPAWNPOINT:int = 1;
      
      public static var HEX_FORWARDBASE:int = 2;
      
      public static var HEX_CONTROLPOINT:int = 3;
      
      public static var HEX_TOWN:int = 4;
      
      public static var HEX_POTENTIALSPAWNPOINT:int = 5;
      
      public static var HEX_UPCOMINGSPAWNPOINT:int = 6;
      
      public static var HEX_LADDER:int = 7;
      
      public static var HEX_DEFENSE:int = 8;
      
      public static var HEX_VILLAGE:int = 9;
      
      public static var HEX_CITY:int = 11;
      
      public static var HEX_CASTLE:int = 12;
      
      public static var HEX_DISABLEDSPAWNPOINT:int = 13;
      
      public static var HEX_DEMOLISHEDSPAWNPOINT:int = 15;
      
      public var logo:MovieClip;
      
      public var narrow:MovieClip;
      
      public var sarrow:MovieClip;
      
      public var boundary:MovieClip;
      
      public var earrow:MovieClip;
      
      public var button:SimpleButton;
      
      public var hqflag:MovieClip;
      
      public var bg:MovieClip;
      
      public var warrow:MovieClip;
      
      public var hqflag2:MovieClip;
      
      public var flag:MovieClip;
      
      internal var owner:int;
      
      internal var prevowner:int;
      
      internal var overrunBy:int;
      
      internal var ownerbg:int;
      
      internal var xpos:int;
      
      internal var ypos:int;
      
      internal var troops:IntMap;
      
      internal var friendlySentry:String = LangManager.getString(351);
      
      internal var hextype:int;
      
      internal var cost:int;
      
      internal var isFrontline:Boolean;
      
      internal var warTerrain:WarTerrain;
      
      internal var hasData:Boolean = false;
      
      internal var hasSpyData:Boolean = false;
      
      internal var customClanObj:DatabaseObject = null;
      
      public function WarHex(xpos:int = 0, ypos:int = 0, owner:int = 0, prevowner:int = 0, hextype:int = 0, cost:int = 0)
      {
         super();
         stop();
         this.xpos = xpos;
         this.ypos = ypos;
         this.setOwner(owner);
         this.prevowner = prevowner;
         this.cost = cost;
         this.setHexType(hextype);
         this.setCanClick(false);
         this.setIsSelected(false);
         mouseChildren = true;
         this.boundary.visible = false;
         this.troops = new IntMap();
         this.overrunBy = 0;
      }
      
      public function getOwner() : int
      {
         return this.owner;
      }
      
      public function setOwner(num:int) : *
      {
         this.owner = num;
         if(StatsManager.isCustomClan(num))
         {
            this.ownerbg = 7;
         }
         else
         {
            this.ownerbg = this.owner;
         }
      }
      
      public function setOverrunBy(num:int) : *
      {
         this.overrunBy = num;
      }
      
      public function getOverrunBy() : int
      {
         return this.overrunBy;
      }
      
      public function setWarTerrain(warTerrain:WarTerrain) : *
      {
         this.warTerrain = warTerrain;
         this.boundary.visible = true;
         this.boundary.gotoAndStop(warTerrain.getExitArrayNum());
      }
      
      public function getHexType() : int
      {
         return this.hextype;
      }
      
      public function setHexType(num:int) : *
      {
         var exitArray:Array = null;
         if(this.owner == -1)
         {
            this.hextype = 1;
            gotoAndStop(1);
            return;
         }
         this.hextype = num;
         if(this.cost <= 0)
         {
            gotoAndStop(this.ownerbg + this.hextype * 10);
         }
         else if(this.hextype == HEX_TOWN)
         {
            gotoAndStop(this.ownerbg + 140);
         }
         else
         {
            gotoAndStop(this.ownerbg + 100);
         }
         this.bg.gotoAndStop(this.ownerbg + 1);
         if(this.ownerbg == 7)
         {
            this.customClanObj = QueryManagerPIO.instance.getCustomClanData(this.owner);
            if(this.customClanObj != null)
            {
               ColorCode.changeColor(this.bg.customhexbg,this.customClanObj.color);
               if(this.flag != null)
               {
                  ColorCode.changeColor(this.flag.flag,this.customClanObj.color);
                  this.flag.logo.gotoAndStop(this.customClanObj.logo);
                  ColorCode.changeColor(this.flag.logo,this.customClanObj.logocolor);
               }
               if(this.logo != null)
               {
                  this.logo.gotoAndStop(this.customClanObj.logo);
                  ColorCode.changeColor(this.logo,this.customClanObj.logocolor);
               }
               if(this.hqflag != null)
               {
                  ColorCode.changeColor(this.hqflag,this.customClanObj.color);
               }
               if(this.hqflag2 != null)
               {
                  ColorCode.changeColor(this.hqflag2,this.customClanObj.color);
               }
            }
            else
            {
               this.ownerbg = 5;
               if(this.cost <= 0)
               {
                  gotoAndStop(this.ownerbg + this.hextype * 10);
               }
               else if(this.hextype == HEX_TOWN)
               {
                  gotoAndStop(this.ownerbg + 140);
               }
               else
               {
                  gotoAndStop(this.ownerbg + 100);
               }
               this.bg.gotoAndStop(this.ownerbg + 1);
            }
         }
         if(this.hextype == HEX_LADDER && this.cost <= 0)
         {
            exitArray = OverworldHUD.instance.warUI.warHexUI.terrainArray[this.xpos][this.ypos].getExitArray();
            this.narrow.visible = exitArray[0] == 0 && this.ypos != 0;
            this.sarrow.visible = exitArray[1] == 0 && this.ypos != 5;
            this.earrow.visible = exitArray[2] == 0 && this.xpos != 5;
            this.warrow.visible = exitArray[3] == 0 && this.xpos != 0;
         }
         else if(this.hextype == HEX_POTENTIALSPAWNPOINT || this.hextype == HEX_UPCOMINGSPAWNPOINT || this.hextype == HEX_SPAWNPOINT)
         {
            this.narrow.visible = this.ypos == 0;
            this.sarrow.visible = this.ypos == 5;
            this.earrow.visible = this.xpos == 5;
            this.warrow.visible = this.xpos == 0;
         }
      }
      
      public function setCanClick(flag:Boolean) : *
      {
         if(flag)
         {
            this.bg.alpha = 0.5;
            this.button.visible = true;
            this.bg.gotoAndStop(this.ownerbg + 1);
            if(this.ownerbg == 7 && this.customClanObj != null)
            {
               ColorCode.changeColor(this.bg.customhexbg,this.customClanObj.color);
            }
         }
         else
         {
            this.bg.alpha = 0.5;
            this.button.visible = false;
            this.bg.gotoAndStop(this.ownerbg + 1);
            if(this.ownerbg == 7 && this.customClanObj != null)
            {
               ColorCode.changeColor(this.bg.customhexbg,this.customClanObj.color);
            }
         }
      }
      
      public function setIsSelected(flag:Boolean) : *
      {
         if(flag)
         {
            this.bg.alpha = 0.7;
         }
         else
         {
            this.bg.alpha = 0.5;
         }
      }
      
      public function setFull() : *
      {
         this.bg.alpha = 0.7;
         this.button.visible = true;
         this.bg.gotoAndStop(this.ownerbg + 10);
         if(this.ownerbg == 7 && this.customClanObj != null)
         {
            ColorCode.changeColor(this.bg.customhexbg,this.customClanObj.color);
         }
      }
      
      public function setStrength(side:int, strength:int) : *
      {
         this.troops.put(side,strength,true);
      }
      
      public function changeStrength(side:int, strength:int) : *
      {
         var currentStrength:int = this.troops.getInt(side);
         currentStrength += strength;
         this.troops.put(side,currentStrength,true);
      }
      
      public function getStrength(side:int) : int
      {
         var strength:int = this.troops.getInt(side);
         if(strength < 0)
         {
            strength = 0;
         }
         return strength;
      }
      
      internal function getTotalEnemyStrength(side:int) : int
      {
         var keys:Array = this.troops.getKeys();
         var values:Array = this.troops.getValues();
         var total:int = 0;
         var max:int = int(keys.length);
         for(var i:int = 0; i < max; i++)
         {
            if(keys[i] != side)
            {
               total += values[i];
            }
         }
         if(total < 0)
         {
            total = 0;
         }
         return total;
      }
      
      public function setTroops(array:Array) : *
      {
         var i:int = 0;
         var index:String = null;
         for(index in array)
         {
            i = int(index);
            this.troops.put(int(i),array[i]);
         }
      }
      
      public function setCost(num:int) : *
      {
         this.cost = num;
      }
      
      public function hasEnemy(side:int) : Boolean
      {
         return this.getTotalEnemyStrength(side) > 0;
      }
      
      public function canReinforce(side:int) : Boolean
      {
         return this.isFrontline || this.owner == side;
      }
      
      public function canAttack() : Boolean
      {
         return this.isFrontline;
      }
      
      public function isFriendly(side:int) : Boolean
      {
         return this.owner == side;
      }
      
      public function initSentry(str:String) : *
      {
         var insideStrArray:Array = null;
         this.friendlySentry = "";
         var strArray:Array = str.split("|");
         for(var i:int = 0; i < strArray.length; i++)
         {
            if(strArray[i] != "")
            {
               insideStrArray = strArray[i].split(",");
               if(insideStrArray[0] != StatsManager.charname)
               {
                  this.friendlySentry += insideStrArray[0] + " (" + insideStrArray[1] + ")\n";
               }
            }
         }
         if(this.friendlySentry == "")
         {
            this.friendlySentry = LangManager.getString(351);
         }
      }
      
      public function initEnemyStrengthAndCost(str:String) : *
      {
         var strArray:Array = str.split(",");
         this.setCost(strArray[0]);
         this.setStrength(1,strArray[1]);
         this.setStrength(2,strArray[2]);
         this.setStrength(3,strArray[3]);
         this.setStrength(4,strArray[4]);
         this.setStrength(5,strArray[5]);
      }
      
      public function getRandomEnemy(playerside:int) : int
      {
         var keys:Array = this.troops.getKeys();
         var array:Array = new Array();
         var max:int = int(keys.length);
         for(var i:int = 0; i < max; i++)
         {
            if(keys[i] != playerside)
            {
               array.push(keys[i]);
            }
         }
         var index:int = Math.random() * array.length;
         return array[index];
      }
      
      public function getDesc(side:int, castleGateTime:int) : String
      {
         var maxcost:int = 0;
         var buildpercentage:int = 0;
         var totalenemies:int = 0;
         var statustext:String = null;
         var str:String = "";
         if(this.hextype == HEX_SPAWNPOINT)
         {
            str += LangManager.getString(349);
            str += "\n\n" + LangManager.getString(574) + "\n\n";
         }
         else if(this.hextype == HEX_FORWARDBASE)
         {
            str += LangManager.getString(350);
            if(this.cost > 0)
            {
               maxcost = 10000;
               buildpercentage = (maxcost - this.cost) / maxcost * 100;
               if(buildpercentage > 100)
               {
                  buildpercentage = 100;
               }
               else if(buildpercentage < 0)
               {
                  buildpercentage = 0;
               }
               str += " (" + LangManager.getString(423) + ": " + buildpercentage + "%)";
            }
            str += "\n\n" + LangManager.getString(567) + "\n\n";
         }
         else if(this.hextype == HEX_POTENTIALSPAWNPOINT)
         {
            if(this.owner == side)
            {
               str += LangManager.getString(594) + "\n\n" + LangManager.getString(595) + "\n\n";
            }
            else
            {
               str += LangManager.getString(596) + "\n\n" + LangManager.getString(597) + "\n\n";
            }
         }
         else
         {
            if(this.hextype == HEX_UPCOMINGSPAWNPOINT)
            {
               return str + (LangManager.getString(349) + " (" + LangManager.getString(423) + ")\n\n" + LangManager.getString(574) + "\n\n");
            }
            if(this.hextype == HEX_DISABLEDSPAWNPOINT)
            {
               return str + (LangManager.getString(349) + " (" + LangManager.getString(616) + ")\n\n" + LangManager.getString(617) + "\n\n");
            }
            if(this.hextype == HEX_DEMOLISHEDSPAWNPOINT)
            {
               return str + (LangManager.getString(349) + " (" + LangManager.getString(708) + ")\n\n" + LangManager.getString(709) + "\n\n");
            }
            if(this.hextype == HEX_CONTROLPOINT)
            {
               str += LangManager.getString(598) + "\n\n" + LangManager.getString(599) + "\n\n";
            }
            else if(this.hextype == HEX_VILLAGE)
            {
               str += LangManager.getString(450) + " (" + LangManager.getString(600) + ")";
               str += "\n\n" + LangManager.getString(601) + "\n\n";
            }
            else if(this.hextype == HEX_TOWN)
            {
               str += LangManager.getString(451) + " (" + LangManager.getString(600) + ")";
               if(this.cost > 0)
               {
                  maxcost = 10000;
                  buildpercentage = (maxcost - this.cost) / maxcost * 100;
                  if(buildpercentage > 100)
                  {
                     buildpercentage = 100;
                  }
                  else if(buildpercentage < 0)
                  {
                     buildpercentage = 0;
                  }
                  str += " (" + LangManager.getString(423) + ": " + buildpercentage + "%)";
               }
               str += "\n\n" + LangManager.getString(573) + "\n\n";
            }
            else if(this.hextype == HEX_CITY)
            {
               str += LangManager.getString(452) + " (" + LangManager.getString(600) + ")";
               str += "\n\n" + LangManager.getString(602) + "\n\n";
            }
            else if(this.hextype == HEX_CASTLE)
            {
               str += LangManager.getString(453) + " (" + LangManager.getString(600) + ")";
               if(QueryManager.instance.getServerTime() - castleGateTime > 3 * 60 * 60)
               {
                  str += "\n\n" + LangManager.getString(603) + "\n\n";
               }
               else
               {
                  str += "\n\n" + LangManager.getString(779) + "\n\n";
               }
               if(QueryManager.instance.getServerTime() - castleGateTime > 3 * 60 * 60)
               {
                  str += LangManager.getString(776) + "\n\n";
               }
               else
               {
                  str += LangManager.getString(775) + "(" + this.getTimeString(3 * 60 * 60 - (QueryManager.instance.getServerTime() - castleGateTime)) + ")\n\n";
               }
            }
            else if(this.hextype == HEX_LADDER)
            {
               str += LangManager.getString(568);
               if(this.cost > 0)
               {
                  maxcost = 5000;
                  buildpercentage = (maxcost - this.cost) / maxcost * 100;
                  if(buildpercentage > 100)
                  {
                     buildpercentage = 100;
                  }
                  else if(buildpercentage < 0)
                  {
                     buildpercentage = 0;
                  }
                  str += " (" + LangManager.getString(423) + ": " + buildpercentage + "%)";
               }
               str += "\n\n" + LangManager.getString(569) + "\n\n";
            }
            else if(this.hextype == HEX_DEFENSE)
            {
               str += LangManager.getString(570);
               if(this.cost > 0)
               {
                  maxcost = 10000;
                  buildpercentage = (maxcost - this.cost) / maxcost * 100;
                  if(buildpercentage > 100)
                  {
                     buildpercentage = 100;
                  }
                  else if(buildpercentage < 0)
                  {
                     buildpercentage = 0;
                  }
                  str += " (" + LangManager.getString(423) + ": " + buildpercentage + "%)";
               }
               str += "\n\n" + LangManager.getString(571) + "\n\n";
            }
            else
            {
               str += "\n";
            }
         }
         if(this.hasData)
         {
            totalenemies = this.getTotalEnemyStrength(side);
            statustext = "";
            if(this.owner == side && totalenemies == 0)
            {
               statustext = LangManager.getString(345);
            }
            else if(this.isFrontline && this.owner == side)
            {
               statustext = LangManager.getString(342);
            }
            else if(this.isFrontline && this.owner != side)
            {
               statustext = LangManager.getString(343);
            }
            else if(this.owner != side && !this.isFrontline)
            {
               statustext = LangManager.getString(344);
            }
            str += LangManager.getString(341) + ": " + statustext + "\n";
            switch(this.warTerrain.getTerrainType())
            {
               case WarTerrain.TERRAIN_FIELD:
                  str += LangManager.getString(604) + "\n\n";
                  break;
               case WarTerrain.TERRAIN_FOREST:
                  str += LangManager.getString(605) + "\n\n";
                  break;
               case WarTerrain.TERRAIN_MOUNTAIN:
                  str += LangManager.getString(606) + "\n\n";
            }
            str += LangManager.getString(346) + ": " + this.getStrength(side) + "\n";
            if(!this.hasSpyData && this.owner != side)
            {
               str += LangManager.getString(347) + ": ???\n\n";
            }
            else
            {
               str += LangManager.getString(347) + ": " + totalenemies + "\n\n";
            }
            if(this.isFriendly(side))
            {
               str += LangManager.getString(348) + ":\n";
               str += this.friendlySentry;
            }
         }
         return str;
      }
      
      internal function getTimeString(secs:int) : String
      {
         var hours:int = Math.floor(secs / (60 * 60));
         var divisor_for_minutes:int = secs % (60 * 60);
         var min:int = Math.floor(divisor_for_minutes / 60);
         var divisor_for_seconds:int = divisor_for_minutes % 60;
         var sec:int = Math.ceil(divisor_for_seconds);
         var secstr:String = sec.toString();
         if(sec < 10)
         {
            secstr = "0" + secstr;
         }
         var minstr:String = min.toString();
         if(min < 10)
         {
            minstr = "0" + minstr;
         }
         return hours + ":" + minstr + ":" + secstr;
      }
   }
}

