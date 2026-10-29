package
{
   public class LangManager
   {
      
      public static var ENGLISH:* = 0;
      
      public static var CHINESE:* = 1;
      
      public static var language:* = 0;
      
      internal static var english:* = new Array();
      
      internal static var chinese:* = new Array();
      
      english[0] = "Tutorial - Click on the banner to walk towards it.";
      english[1] = "Draw a line along the dotted line to slash with your sword.\rMove mouse to the edge of the screen to scroll.\rYou may also use A-D or arrow keys to scroll.\rPress spacebar to pause.";
      english[2] = "Click on arrows to pick them up.\rHold shift to equip your bow.\rPress and hold left mouse button to pull back on the bow.";
      english[3] = "To defeat the catapult hit it back in the balls.\rDefeat all the soldiers to clear the area.";
      english[4] = "Analyse his movements and hit when he is unable to dodge.";
      english[5] = "Defeat the remaining guards";
      english[6] = "Warning - This is the final battle in the game.";
      english[7] = "The enemy commander decimated your troops.  Send in the samurai!";
      english[8] = "I am too late. Gate construction is complete. I need to find another way in.";
      english[9] = "I am too late. Gate construction is complete.";
      english[10] = "I need to take out the guard tower before i can go into the open.";
      english[11] = "Hey you there! Get over here!";
      english[12] = "STOP!";
      english[13] = "Die!";
      english[14] = "Intruder!";
      english[15] = "Enemy contact!";
      english[16] = "Meet your maker!";
      english[17] = "Bring out the catapult!";
      english[18] = "Ambush!";
      english[19] = "Let\'s do this!";
      english[20] = "This place is crawling with enemy troops. I need to be careful.";
      english[21] = "I can see everything from up here... those builders need to be eliminated.";
      english[22] = "Held enemy at bay for ";
      english[23] = " turns";
      english[24] = "The enemy is on the move.";
      english[25] = "Password - strategy mode";
      english[26] = "Stall the construction of the enemy gates until friendly forces arrive.";
      english[27] = "move towards the gates.";
      english[28] = "take down the guard tower.";
      english[29] = "eliminate the gate builders.";
      english[30] = "friendly forces arriving in ";
      english[31] = " turns.";
      english[32] = "Congratulations! You have won the game";
      english[33] = "Mission Accomplished!";
      english[34] = "defeat the enemy commander.";
      english[35] = "use troops to clear a path to the enemy commander tent.";
      english[36] = "Survive as long as you can before the enemy can land 10 hits.";
      chinese[0] = "chello";
      chinese[1] = "cbob";
      
      public function LangManager()
      {
         super();
      }
      
      public static function setLanguage(param1:int) : *
      {
         language = param1;
      }
      
      public static function getWords(param1:int) : String
      {
         if(language == ENGLISH)
         {
            return english[param1];
         }
         if(language == CHINESE)
         {
            return chinese[param1];
         }
         return "";
      }
   }
}

