package
{
   import flash.utils.ByteArray;
   
   public class §1t136s0§
   {
      
      public static var instance:§1t136s0§;
      
      internal static const §1t11470s0§:Class = §1t4651s0§;
      
      internal static const §1t11471s0§:Class = §1t4650s0§;
      
      internal static const §1t11472s0§:Class = §1t4649s0§;
      
      internal static const §1t11473s0§:Class = §1t4652s0§;
      
      internal static const §1t11474s0§:Class = §1t4653s0§;
      
      internal var §1t1806s0§:Array;
      
      internal var §1t1807s0§:Array;
      
      internal var §1t1808s0§:Array;
      
      internal var §1t1809s0§:Array;
      
      internal var §1t1810s0§:Array;
      
      internal var §1t1811s0§:int;
      
      internal var §1t1812s0§:int;
      
      internal var §1t1813s0§:int;
      
      internal var §1t1814s0§:int;
      
      internal var rex:RegExp = /[\s\r]*/gim;
      
      internal var §1t1828s0§:Array = ["Cho","Dai","Ryo","Shin","Ryu","Mata","Kin","To","Hei","Kitsu","Aki","Ari","Atsu","Chika","Fusa","Haru","Hide","Hiko","Hira","Hiro","Hisa","Ie","Kage","Kane","Kata","Katsu","Kazu","Kiyo","Kore","Kuni","Masa","Michi","Mitsu","Mochi","Mori","Moro","Moto","Mune","Naga","Naka","Nao","Nari","Nobu","Nori","Sada","Sane","Shige","Sue","Suke","Tada","Taka","Take","Tame","Tane","Teru","Toki","Tomo","Toshi","Tsune","Uchi","Uji","Yasu","Yori","Yoshi","Yuki","An","Chi","Gama","Han","Heki","Ichi","Ina","Inu","Iwa","Ka","Kasu","Kiyo","Ko"];
      
      internal var §1t1829s0§:Array = ["ta","yama","kawa","i","moto","mura","saka","saki","sawa","shima","hashi","tani","o","ya","su","oka","ki","no","harah","kuchi","da","wara","washi","zaka","zaki","zawa","gawa","guchi","jo","ryu","gori","nan","miya","kura","riya","maki","bara"];
      
      public function §1t136s0§()
      {
         super();
         instance = this;
         var _loc1_:ByteArray = new §1t11470s0§();
         var _loc2_:String = _loc1_.readUTFBytes(_loc1_.length);
         this.§1t1806s0§ = _loc2_.split(/\n/);
         this.§1t1811s0§ = this.§1t1806s0§.length;
         _loc1_ = new §1t11471s0§();
         _loc2_ = _loc1_.readUTFBytes(_loc1_.length);
         this.§1t1807s0§ = _loc2_.split(/\n/);
         this.§1t1812s0§ = this.§1t1807s0§.length;
         _loc1_ = new §1t11472s0§();
         _loc2_ = _loc1_.readUTFBytes(_loc1_.length);
         this.§1t1808s0§ = _loc2_.split(/\n/);
         this.§1t1813s0§ = this.§1t1808s0§.length;
         _loc1_ = new §1t11473s0§();
         _loc2_ = _loc1_.readUTFBytes(_loc1_.length);
         this.§1t1809s0§ = _loc2_.split(/\n/);
         this.§1t1814s0§ = this.§1t1809s0§.length;
         _loc1_ = new §1t11474s0§();
         _loc2_ = _loc1_.readUTFBytes(_loc1_.length);
         this.§1t1810s0§ = _loc2_.split(/\n/);
      }
      
      public static function §1t9190s0§() : §1t136s0§
      {
         if(instance == null)
         {
            instance = new §1t136s0§();
         }
         return instance;
      }
      
      public function §1t1815s0§(param1:§1t58s0§, param2:Boolean) : String
      {
         if(param2)
         {
            return this.§1t1822s0§(param1.rand(this.§1t1811s0§));
         }
         return this.§1t1823s0§(param1.rand(this.§1t1812s0§));
      }
      
      public function §1t1816s0§(param1:§1t58s0§, param2:Boolean) : String
      {
         if(param2)
         {
            return this.§1t1824s0§(param1.rand(this.§1t1813s0§)) + " " + this.§1t1822s0§(param1.rand(this.§1t1811s0§));
         }
         return this.§1t1824s0§(param1.rand(this.§1t1813s0§)) + " " + this.§1t1823s0§(param1.rand(this.§1t1812s0§));
      }
      
      public function §1t1817s0§(param1:§1t58s0§, param2:Boolean) : String
      {
         if(param2)
         {
            return this.§1t1825s0§(param1.rand(this.§1t1814s0§)) + " " + this.§1t1822s0§(param1.rand(this.§1t1811s0§));
         }
         return this.§1t1825s0§(param1.rand(this.§1t1814s0§)) + " " + this.§1t1823s0§(param1.rand(this.§1t1812s0§));
      }
      
      public function §1t1818s0§(param1:int) : String
      {
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1);
         var _loc3_:String = this.§1t1825s0§(_loc2_.rand(this.§1t1814s0§)) + " " + this.§1t1822s0§(_loc2_.rand(this.§1t1811s0§));
         _loc2_.destroy();
         return _loc3_;
      }
      
      public function §1t1819s0§(param1:int) : String
      {
         return this.§1t1822s0§(§1t58s0§.random(this.§1t1811s0§,param1));
      }
      
      internal function §1t1822s0§(param1:int) : String
      {
         return this.§1t1806s0§[param1].replace(this.rex,"");
      }
      
      internal function §1t1823s0§(param1:int) : String
      {
         return this.§1t1807s0§[param1].replace(this.rex,"");
      }
      
      internal function §1t1824s0§(param1:int) : String
      {
         return this.§1t1808s0§[param1].replace(this.rex,"");
      }
      
      internal function §1t1825s0§(param1:int) : String
      {
         return this.§1t1809s0§[param1].replace(this.rex,"");
      }
      
      public function §1t1826s0§(param1:int) : String
      {
         if(param1 == 1405272)
         {
            return "Ibamaya";
         }
         if(param1 == 1524045)
         {
            return "Gokura";
         }
         if(param1 == 1519945)
         {
            return "Iwakuni";
         }
         var _loc2_:int = param1 >> 12 & 0x0FFF;
         var _loc3_:int = param1 & 0x0FFF;
         var _loc4_:int = _loc2_ % 137;
         var _loc5_:int = _loc3_ % 26;
         if(_loc4_ < 26)
         {
            return this.§1t1827s0§(_loc4_,_loc5_);
         }
         return this.§1t1830s0§(param1);
      }
      
      public function §1t1827s0§(param1:int, param2:*) : String
      {
         var _loc3_:int = param1 * 26 + param2;
         return this.§1t1810s0§[_loc3_].replace(this.rex,"");
      }
      
      public function §1t1830s0§(param1:int) : String
      {
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * 2);
         var _loc3_:String = this.§1t1828s0§[_loc2_.rand(this.§1t1828s0§.length)] + this.§1t1829s0§[_loc2_.rand(this.§1t1829s0§.length)];
         _loc2_.destroy();
         return _loc3_;
      }
   }
}

