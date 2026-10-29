package
{
   import flash.utils.ByteArray;
   
   public class NameGenerator
   {
      
      public static var instance:NameGenerator;
      
      internal static const MaleNames:Class = NameGenerator_MaleNames;
      
      internal static const FemaleNames:Class = NameGenerator_FemaleNames;
      
      internal static const NobleFamilyNames:Class = NameGenerator_NobleFamilyNames;
      
      internal static const SamuraiFamilyNames:Class = NameGenerator_SamuraiFamilyNames;
      
      internal static const PlaceNames:Class = NameGenerator_PlaceNames;
      
      internal var maleNamesArray:Array;
      
      internal var femaleNamesArray:Array;
      
      internal var nobleFamilyNamesArray:Array;
      
      internal var samuraiFamilyNamesArray:Array;
      
      internal var placeNamesArray:Array;
      
      internal var maleNamesArrayLength:int;
      
      internal var femaleNamesArrayLength:int;
      
      internal var nobleFamilyNamesArrayLength:int;
      
      internal var samuraiFamilyNamesArrayLength:int;
      
      internal var rex:RegExp = /[\s\r]*/gim;
      
      internal var namestarting:Array = ["Cho","Dai","Ryo","Shin","Ryu","Mata","Kin","To","Hei","Kitsu","Aki","Ari","Atsu","Chika","Fusa","Haru","Hide","Hiko","Hira","Hiro","Hisa","Ie","Kage","Kane","Kata","Katsu","Kazu","Kiyo","Kore","Kuni","Masa","Michi","Mitsu","Mochi","Mori","Moro","Moto","Mune","Naga","Naka","Nao","Nari","Nobu","Nori","Sada","Sane","Shige","Sue","Suke","Tada","Taka","Take","Tame","Tane","Teru","Toki","Tomo","Toshi","Tsune","Uchi","Uji","Yasu","Yori","Yoshi","Yuki","An","Chi","Gama","Han","Heki","Ichi","Ina","Inu","Iwa","Ka","Kasu","Kiyo","Ko"];
      
      internal var nameending:Array = ["ta","yama","kawa","i","moto","mura","saka","saki","sawa","shima","hashi","tani","o","ya","su","oka","ki","no","harah","kuchi","da","wara","washi","zaka","zaki","zawa","gawa","guchi","jo","ryu","gori","nan","miya","kura","riya","maki","bara"];
      
      public function NameGenerator()
      {
         super();
         instance = this;
         var b:ByteArray = new MaleNames();
         var s:String = b.readUTFBytes(b.length);
         this.maleNamesArray = s.split(/\n/);
         this.maleNamesArrayLength = this.maleNamesArray.length;
         b = new FemaleNames();
         s = b.readUTFBytes(b.length);
         this.femaleNamesArray = s.split(/\n/);
         this.femaleNamesArrayLength = this.femaleNamesArray.length;
         b = new NobleFamilyNames();
         s = b.readUTFBytes(b.length);
         this.nobleFamilyNamesArray = s.split(/\n/);
         this.nobleFamilyNamesArrayLength = this.nobleFamilyNamesArray.length;
         b = new SamuraiFamilyNames();
         s = b.readUTFBytes(b.length);
         this.samuraiFamilyNamesArray = s.split(/\n/);
         this.samuraiFamilyNamesArrayLength = this.samuraiFamilyNamesArray.length;
         b = new PlaceNames();
         s = b.readUTFBytes(b.length);
         this.placeNamesArray = s.split(/\n/);
      }
      
      public static function getInstance() : NameGenerator
      {
         if(instance == null)
         {
            instance = new NameGenerator();
         }
         return instance;
      }
      
      public function getCommonerName(rng:RNG, male:Boolean) : String
      {
         if(male)
         {
            return this.getMaleName(rng.rand(this.maleNamesArrayLength));
         }
         return this.getFemaleName(rng.rand(this.femaleNamesArrayLength));
      }
      
      public function getNobleName(rng:RNG, male:Boolean) : String
      {
         if(male)
         {
            return this.getNobleFamilyName(rng.rand(this.nobleFamilyNamesArrayLength)) + " " + this.getMaleName(rng.rand(this.maleNamesArrayLength));
         }
         return this.getNobleFamilyName(rng.rand(this.nobleFamilyNamesArrayLength)) + " " + this.getFemaleName(rng.rand(this.femaleNamesArrayLength));
      }
      
      public function getSamuraiName(rng:RNG, male:Boolean) : String
      {
         if(male)
         {
            return this.getSamuraiFamilyName(rng.rand(this.samuraiFamilyNamesArrayLength)) + " " + this.getMaleName(rng.rand(this.maleNamesArrayLength));
         }
         return this.getSamuraiFamilyName(rng.rand(this.samuraiFamilyNamesArrayLength)) + " " + this.getFemaleName(rng.rand(this.femaleNamesArrayLength));
      }
      
      public function getSentryBotName(rng:RNG) : String
      {
         return this.getSamuraiFamilyName(rng.rand(this.samuraiFamilyNamesArrayLength)) + " " + this.getMaleName(rng.rand(this.maleNamesArrayLength));
      }
      
      public function getBanditGroupName(rng:RNG) : String
      {
         return this.getMaleName(rng.rand(this.maleNamesArrayLength));
      }
      
      internal function getMaleName(index:int) : String
      {
         return this.maleNamesArray[index].replace(this.rex,"");
      }
      
      internal function getFemaleName(index:int) : String
      {
         return this.femaleNamesArray[index].replace(this.rex,"");
      }
      
      internal function getNobleFamilyName(index:int) : String
      {
         return this.nobleFamilyNamesArray[index].replace(this.rex,"");
      }
      
      internal function getSamuraiFamilyName(index:int) : String
      {
         return this.samuraiFamilyNamesArray[index].replace(this.rex,"");
      }
      
      public function getPlaceName(territoryID:int) : String
      {
         if(territoryID == 1405272)
         {
            return "Ibamaya";
         }
         if(territoryID == 1524045)
         {
            return "Gokura";
         }
         var territoryx:int = territoryID >> 12 & 0x0FFF;
         var territoryy:int = territoryID & 0x0FFF;
         var namex:int = territoryx % 137;
         var namey:int = territoryy % 26;
         if(namex < 26)
         {
            return this.getTownName1(namex,namey);
         }
         return this.getTownName2(territoryID);
      }
      
      public function getTownName1(namex:int, namey:*) : String
      {
         var index:int = namex * 26 + namey;
         return this.placeNamesArray[index].replace(this.rex,"");
      }
      
      public function getTownName2(territoryID:int) : String
      {
         var rng:RNG = new RNG(territoryID * 2);
         return this.namestarting[rng.rand(this.namestarting.length)] + this.nameending[rng.rand(this.nameending.length)];
      }
   }
}

