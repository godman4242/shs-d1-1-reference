package
{
   public class EncounterItem
   {
      
      public static var BANDITS_ONI:int = 0;
      
      public static var BANDITS_UNDEAD:int = 1;
      
      public static var BANDITS_WILDLIFE:int = 2;
      
      public static var BANDITS_BANDITS:int = 3;
      
      public static var MERC_BANDITS:int = 4;
      
      public static var MERC_ONI:int = 5;
      
      public static var MERC_UNDEAD:int = 6;
      
      public static var NINJA_BANDITS:int = 7;
      
      public static var NINJA_ONI:int = 8;
      
      public static var NINJA_UNDEAD:int = 9;
      
      public static var VILLAGE_WILDLIFE:int = 10;
      
      public static var BANDITS:int = 11;
      
      public static var ONI:int = 12;
      
      public static var UNDEAD:int = 13;
      
      public static var WILDLIFE:int = 14;
      
      public static var BANDITS_ROAMING:int = 15;
      
      public static var ONI_ROAMING:int = 16;
      
      public static var UNDEAD_ROAMING:int = 17;
      
      public static var WILDLIFE_ROAMING:int = 18;
      
      public static var BANDITS_VILLAGE:int = 19;
      
      public static var ONI_VILLAGE:int = 20;
      
      public static var UNDEAD_VILLAGE:int = 21;
      
      public static var MERCCAMP:int = 22;
      
      public static var NINJAVILLAGE:int = 23;
      
      internal var encounterType:int;
      
      public function EncounterItem(encounterType:int)
      {
         super();
         this.encounterType = encounterType;
      }
   }
}

