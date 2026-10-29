package
{
   public class HistoryItem
   {
      
      internal static var DIR_N:int = 0;
      
      internal static var DIR_S:int = 1;
      
      internal static var DIR_E:int = 2;
      
      internal static var DIR_W:int = 3;
      
      internal static var TYPE_IMMIGRANTS:int = 0;
      
      internal static var TYPE_MIGRANTS:int = 1;
      
      internal static var TYPE_MIGRANTSLEFTMAP:int = 2;
      
      internal static var TYPE_KILLED:int = 3;
      
      internal static var TYPE_JOINBANDITS:int = 4;
      
      internal static var TYPE_CROPSLOST:int = 5;
      
      internal static var TYPE_TAKENOVER:int = 6;
      
      internal static var TYPE_INJURED:int = 7;
      
      internal static var TYPE_ATTACKED:int = 8;
      
      internal static var TYPE_RAISEDEAD:int = 9;
      
      internal static var TYPE_PAYMERC:int = 10;
      
      internal static var TYPE_SUMMONNINJA:int = 11;
      
      internal static var TYPE_QUEST:int = 12;
      
      internal static var TYPE_STATUS:int = 13;
      
      internal static var TYPE_PROSPERITY:int = 14;
      
      internal static var TYPE_STARVED:int = 15;
      
      internal static var TYPE_ATTACKVILLAGE:int = 16;
      
      internal static var TYPE_TRADE:int = 17;
      
      internal static var TYPE_ROB:int = 18;
      
      internal static var TYPE_UNDEADALERT:int = 19;
      
      internal static var TYPE_WIPEDOUT:int = 20;
      
      internal static var TYPE_POPULATION:int = 21;
      
      public function HistoryItem()
      {
         super();
      }
      
      public static function parseData(array:Array, townProsperity:int) : String
      {
         var historyData:Array = null;
         var max:int = 0;
         var counter:int = 0;
         var i:int = 0;
         var recentEvents:String = "";
         array.sortOn("date",Array.DESCENDING);
         for(var j:int = 0; j < array.length; j++)
         {
            historyData = array[j].data;
            max = int(historyData.length);
            counter = 0;
            for(i = 0; i < 8; i++)
            {
               if(i == 0)
               {
                  if(counter == 0)
                  {
                     if(j == 0)
                     {
                        recentEvents += "-- " + LangManager.getString(745) + " --";
                     }
                     else if(j == 1)
                     {
                        recentEvents += "\n-- " + LangManager.getString(746) + " --";
                     }
                     else
                     {
                        recentEvents += "\n-- " + LangManager.getString(747) + " --";
                     }
                  }
                  else if(j == 0)
                  {
                     recentEvents += "\n-- " + LangManager.getString(745) + " -- " + LangManager.getString(748);
                  }
                  else if(j == 1)
                  {
                     recentEvents += "\n-- " + LangManager.getString(746) + " -- " + LangManager.getString(748);
                  }
                  else
                  {
                     recentEvents += "\n-- " + LangManager.getString(747) + " -- " + LangManager.getString(748);
                  }
               }
               if(counter + i < max)
               {
                  recentEvents += "\n" + HistoryItem.dataToString(historyData[counter + i],townProsperity);
               }
               else
               {
                  recentEvents += "\n";
               }
               if(i == 7)
               {
                  if(j < array.length - 1 || max > counter + 8)
                  {
                     recentEvents += "\n" + LangManager.getString(749);
                  }
                  else
                  {
                     recentEvents += "\n";
                  }
                  if(max > counter + 8)
                  {
                     i = -1;
                     counter += 8;
                  }
               }
            }
         }
         return recentEvents;
      }
      
      public static function dataToString(str:String, townProsperity:int) : *
      {
         var poparray:Array = null;
         var strArray:Array = str.split(",");
         var simtype:int = parseInt(strArray[0]);
         var type:int = parseInt(strArray[1]);
         var val1:int = parseInt(strArray[2]);
         var val2:int = parseInt(strArray[3]);
         var val3:String = strArray[4];
         var val4:String = strArray[5];
         if(simtype == QuestItem.RONINSIM)
         {
            if(type == TYPE_ATTACKED)
            {
               return "ronin attacked " + getAttackerName(val2) + ": " + val1 + " " + getAttackerName(val2) + " killed";
            }
         }
         else if(simtype == QuestItem.WILDLIFESIM)
         {
            if(type == TYPE_IMMIGRANTS)
            {
               return val1 + " wildlife immigrated here from the " + getDirStr(val2);
            }
            if(type == TYPE_MIGRANTS)
            {
               return val1 + " wildlife migrated " + getDirStr(val2);
            }
            if(type == TYPE_ATTACKED)
            {
               return val1 + " wildlife killed by " + getAttackerName(val2);
            }
            if(type == TYPE_STARVED)
            {
               return val1 + " wildlife starved to death";
            }
            if(type == TYPE_STATUS)
            {
               if(val1 == 0)
               {
                  return "wildlife: underpopulation (too many oni killing wildlife)";
               }
               if(val1 == 1)
               {
                  return "wildlife: underpopulation (too many poachers killing wildlife)";
               }
               if(val1 == 2)
               {
                  return "wildlife: close to overpopulation";
               }
               if(val1 == 3)
               {
                  return "wildlife: overpopulation";
               }
            }
            else if(type == TYPE_WIPEDOUT)
            {
               return "All wildlife has been eliminated from the territory by " + getAttackerName(val1);
            }
         }
         else if(simtype == QuestItem.MERCSIM)
         {
            if(type == TYPE_IMMIGRANTS)
            {
               return val1 + " mercenaries arrived from the " + getDirStr(val2);
            }
            if(type == TYPE_MIGRANTS)
            {
               return val1 + " mercenaries left " + getDirStr(val2);
            }
            if(type == TYPE_KILLED)
            {
               return "mercenaries attacked " + getAttackerName(val2) + ": " + val1 + " merceneries killed, " + val3 + " " + getAttackerName(val2) + " killed";
            }
            if(type == TYPE_WIPEDOUT)
            {
               return "All mercenaries have been eliminated from the territory";
            }
         }
         else if(simtype == QuestItem.BANDITSIM)
         {
            if(type == TYPE_IMMIGRANTS)
            {
               return "bandit group \"" + getBanditGroupName(val3) + "\" arrived from the " + getDirStr(val2);
            }
            if(type == TYPE_TAKENOVER)
            {
               return "bandit group \"" + getBanditGroupName(val3) + "\" took over bandit group \"" + val4 + "\"";
            }
            if(type == TYPE_KILLED)
            {
               return "\"" + getBanditGroupName(val3) + "\" bandits attacked " + getAttackerName(val2) + ": " + val1 + " bandits killed, " + val3 + " " + getAttackerName(val2) + " killed";
            }
            if(type == TYPE_MIGRANTS)
            {
               return "bandit group \"" + getBanditGroupName(val3) + "\" travelled " + getDirStr(val2);
            }
            if(type == TYPE_ATTACKVILLAGE)
            {
               return "town defended against attack: " + val1 + " bandits killed";
            }
            if(type == TYPE_ROB)
            {
               return "merchants robbed by bandits: prosperity -" + val1;
            }
            if(type == TYPE_STATUS)
            {
               if(val1 == 0)
               {
                  return "significant bandits presence in territory";
               }
               if(val1 == 1)
               {
                  return "bandits are preparing to attack the town";
               }
            }
            else if(type == TYPE_WIPEDOUT)
            {
               return "bandit group \"" + getBanditGroupName(val3) + "\" has been eliminated from the territory by " + getAttackerName(val1);
            }
         }
         else if(simtype == QuestItem.ONISIM)
         {
            if(type == TYPE_ATTACKVILLAGE)
            {
               return "town defended against attack: " + val1 + " oni killed";
            }
            if(type == TYPE_STATUS)
            {
               if(val1 == 2)
               {
                  return "Oni population: high";
               }
               if(val1 == 3)
               {
                  return "Oni population: Too high";
               }
            }
            else if(type == TYPE_WIPEDOUT)
            {
               return "All Oni have been eliminated from the territory by " + getAttackerName(val1);
            }
         }
         else if(simtype == QuestItem.VILLAGESIM)
         {
            if(type == TYPE_ATTACKED)
            {
               return getAttackerName(val2) + " attacked town: prosperity -" + val1;
            }
            if(type == TYPE_KILLED)
            {
               return val1 + " villager(s) killed";
            }
            if(type == TYPE_INJURED)
            {
               return val1 + " villager(s) injured";
            }
            if(type == TYPE_CROPSLOST)
            {
               return val1 + " crops eaten by " + getAttackerName(val2);
            }
            if(type == TYPE_PAYMERC)
            {
               return "mercenaries upkeep cost: prosperity -" + val1;
            }
            if(type == TYPE_SUMMONNINJA)
            {
               return "town hired ninja: prosperity -1000";
            }
            if(type == TYPE_TRADE)
            {
               return "trade with other towns: prosperity +" + val1;
            }
            if(type == TYPE_STATUS)
            {
               return "town status (prosperity: " + val4 + ", crops: " + val1 + ", goods: " + val2 + ", defense: " + val3 + ")";
            }
            if(type == TYPE_POPULATION)
            {
               poparray = val3.split("!");
               return "town population(peasants: " + poparray[0] + ", farmers: " + poparray[1] + ", merchants: " + poparray[2] + ", artisans: " + poparray[3] + ", samurai:" + poparray[4] + ")";
            }
            if(type == TYPE_WIPEDOUT)
            {
               return "village overrun: villagers have fled and abandoned the village";
            }
         }
         else if(simtype == QuestItem.UNDEADSIM)
         {
            if(type == TYPE_IMMIGRANTS)
            {
               return val1 + " undead arrived from the " + getDirStr(val2);
            }
            if(type == TYPE_MIGRANTS)
            {
               return val1 + " undead left " + getDirStr(val2);
            }
            if(type == TYPE_KILLED)
            {
               return "Undead attacked " + getAttackerName(val2) + ": " + val1 + " undead killed, " + val3 + " " + getAttackerName(val2) + " killed";
            }
            if(type == TYPE_RAISEDEAD)
            {
               return val1 + " undead rose up from the graveyard";
            }
            if(type == TYPE_ATTACKVILLAGE)
            {
               return "town defended against attack: " + val1 + " undead killed";
            }
            if(type == TYPE_UNDEADALERT)
            {
               if(val1 == 4)
               {
                  return "undead horde spotted heading towards town: ETA 1 day";
               }
               return "undead horde spotted in the territory to the " + getDirStr(val1);
            }
            if(type == TYPE_WIPEDOUT)
            {
               return "All Undead have been eliminated from the territory by " + getAttackerName(val1);
            }
         }
         else if(simtype == QuestItem.NINJASIM)
         {
            if(type == TYPE_KILLED)
            {
               return "Ninjas attacked " + getAttackerName(val2) + ": " + val1 + " ninja killed, " + val3 + " " + getAttackerName(val2) + " killed";
            }
            if(type == TYPE_WIPEDOUT)
            {
               return "All Ninjas have been eliminated from the territory";
            }
         }
         else if(simtype == QuestItem.PLAYERSIM)
         {
            if(type == TYPE_PROSPERITY)
            {
               return "Players changed prosperity through quests by " + val1;
            }
         }
         return simtype + " " + type + " " + val1 + " " + val2 + " " + val3 + " " + val4;
      }
      
      internal static function getAttackerName(num:int) : String
      {
         if(num == QuestItem.RONINSIM)
         {
            return "Ronin";
         }
         if(num == QuestItem.WILDLIFESIM)
         {
            return "Wildlife";
         }
         if(num == QuestItem.MERCSIM)
         {
            return "mercenaries";
         }
         if(num == QuestItem.BANDITSIM)
         {
            return "Bandits";
         }
         if(num == QuestItem.ONISIM)
         {
            return "Oni";
         }
         if(num == QuestItem.VILLAGESIM)
         {
            return "Villagers";
         }
         if(num == QuestItem.UNDEADSIM)
         {
            return "Undead";
         }
         if(num == QuestItem.NINJASIM)
         {
            return "Ninjas";
         }
         if(num == QuestItem.CLANSIM)
         {
            return "Clans";
         }
         if(num == QuestItem.PLAYERSIM)
         {
            return "Player";
         }
         return num.toString();
      }
      
      internal static function getDirStr(num:int) : String
      {
         if(num == DIR_N)
         {
            return "North";
         }
         if(num == DIR_S)
         {
            return "South";
         }
         if(num == DIR_E)
         {
            return "East";
         }
         if(num == DIR_W)
         {
            return "West";
         }
         return num.toString();
      }
      
      internal static function getBanditGroupName(str:String) : String
      {
         var strArray:Array = str.split("_");
         var terrid:int = parseInt(strArray[0]);
         var groupid:int = parseInt(strArray[1]);
         var seed:int = terrid + groupid * 21;
         return NameGenerator.getInstance().getBanditGroupName(new RNG(seed));
      }
   }
}

