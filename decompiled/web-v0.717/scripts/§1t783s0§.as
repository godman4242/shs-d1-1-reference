package
{
   public class §1t783s0§
   {
      
      private var §1t784s0§:Vector.<§1t59s0§> = new Vector.<§1t59s0§>();
      
      public var duration:int = 0;
      
      public var looping:Boolean = false;
      
      internal var §1t787s0§:int;
      
      public function §1t783s0§(param1:XML)
      {
         super();
         this.duration = param1.@d;
         this.looping = param1.@l == 1;
         this.§1t787s0§ = param1.f.length();
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t787s0§)
         {
            this.§1t784s0§.push(new §1t59s0§(param1.f[_loc2_]));
            _loc2_++;
         }
         this.§1t784s0§.fixed = true;
         switch(param1.@i.toString())
         {
            case §1t1544s0§.§1t10957s0§:
            case §1t1544s0§.§1t10965s0§:
            case §1t1544s0§.§1t10973s0§:
            case §1t1544s0§.§1t10999s0§:
            case §1t1544s0§.§1t11007s0§:
            case §1t1544s0§.§1t11015s0§:
            case §1t1544s0§.§1t11041s0§:
            case §1t1544s0§.§1t11049s0§:
            case §1t1544s0§.§1t11057s0§:
            case §1t1544s0§.§1t11083s0§:
            case §1t1544s0§.§1t11091s0§:
            case §1t1544s0§.§1t11099s0§:
            case §1t1544s0§.§1t11125s0§:
               this.duration += 10;
               break;
            case §1t1544s0§.§1t10979s0§:
            case §1t1544s0§.§1t11021s0§:
            case §1t1544s0§.§1t11063s0§:
            case §1t1544s0§.§1t11105s0§:
            case §1t1544s0§.§1t11131s0§:
            case §1t1544s0§.§1t10987s0§:
            case §1t1544s0§.§1t11029s0§:
            case §1t1544s0§.§1t11071s0§:
            case §1t1544s0§.§1t11113s0§:
            case §1t1544s0§.§1t11139s0§:
               this.duration += 15;
               break;
            case §1t1544s0§.§1t10261s0§:
            case §1t1544s0§.§1t10263s0§:
               this.duration += 24;
               break;
            case §1t1544s0§.§1t10409s0§:
            case §1t1544s0§.§1t10411s0§:
            case §1t1544s0§.§1t10413s0§:
            case §1t1544s0§.§1t10289s0§:
            case §1t1544s0§.§1t10291s0§:
            case §1t1544s0§.§1t10759s0§:
            case §1t1544s0§.§1t10896s0§:
               this.duration += 6;
               break;
            case §1t1544s0§.§1t10297s0§:
               this.duration += 24;
               break;
            case §1t1544s0§.§1t10315s0§:
               this.duration += 10;
               break;
            case §1t1544s0§.§1t10451s0§:
               this.duration += 4;
               break;
            case §1t1544s0§.§1t10447s0§:
               this.duration += 8;
               break;
            case §1t1544s0§.§1t10525s0§:
               this.duration += 10;
               break;
            case §1t1544s0§.§1t10333s0§:
               this.duration += 12;
               break;
            case §1t1544s0§.§1t10343s0§:
               this.duration += 6;
               break;
            case §1t1544s0§.§1t10787s0§:
               this.duration += 6;
               break;
            case §1t1544s0§.§1t10831s0§:
               this.duration += 2;
               break;
            case §1t1544s0§.§1t10837s0§:
               this.duration += 20;
               break;
            case §1t1544s0§.§1t10473s0§:
               this.duration += 2;
               break;
            case §1t1544s0§.§1t10465s0§:
               this.duration += 6;
               break;
            case §1t1544s0§.§1t10689s0§:
               this.duration += 48;
               break;
            case §1t1544s0§.§1t10773s0§:
               this.duration += 6;
               break;
            case §1t1544s0§.§1t10891s0§:
               this.duration += 6;
               break;
            case §1t1544s0§.§1t10883s0§:
               this.duration += 50;
               break;
            case §1t1544s0§.§1t10869s0§:
               this.duration += 24;
               break;
            case §1t1544s0§.§1t10905s0§:
               this.duration += 24;
               break;
            case §1t1544s0§.§1t10825s0§:
               this.duration += 24;
               break;
            case §1t1544s0§.§1t10723s0§:
               this.duration += 24;
               break;
            case §1t1544s0§.§1t10933s0§:
               this.duration += 24;
               break;
            case §1t1544s0§.§1t10935s0§:
               this.duration += 6;
               break;
            case §1t1544s0§.§1t10937s0§:
               this.duration += 12;
               break;
            case §1t1544s0§.§1t10873s0§:
               this.duration += 6;
               break;
            case §1t1544s0§.§1t10875s0§:
               this.duration += 12;
               break;
            case §1t1544s0§.§1t10299s0§:
               this.duration += 12;
         }
      }
      
      public function §1t788s0§(param1:int) : §1t59s0§
      {
         if(param1 >= this.§1t787s0§)
         {
            param1 = this.§1t787s0§ - 1;
         }
         return this.§1t784s0§[param1];
      }
      
      public function §1t789s0§() : int
      {
         return this.§1t787s0§;
      }
   }
}

