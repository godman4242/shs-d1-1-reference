package
{
   public class §1t104s0§
   {
      
      public var id:int;
      
      public var §1t891s0§:int;
      
      public var type:int;
      
      public var unique:int;
      
      public var §1t1188s0§:§1t98s0§ = new §1t98s0§();
      
      public var §1t847s0§:§1t98s0§ = new §1t98s0§();
      
      public var art:int;
      
      public var animated:Boolean;
      
      public var levelrestriction:int;
      
      public var mindamage:int;
      
      public var maxdamage:int;
      
      public var slashusage:int;
      
      public var stancerestriction:int;
      
      public var defense:int;
      
      public var weight:int;
      
      public var §1t892s0§:int;
      
      public var durability:int;
      
      public var nogive:Boolean;
      
      public var nodrop:Boolean;
      
      public var pcolor:String;
      
      public var scolor:String;
      
      public var attributes:String;
      
      public var imageurl:String;
      
      public var modifierXML:XMLList;
      
      private var modifier:Vector.<int> = new Vector.<int>();
      
      public function §1t104s0§(param1:XML)
      {
         super();
         this.id = param1.id;
         if(param1.name.toString() != "")
         {
            this.§1t891s0§ = param1.name;
         }
         else
         {
            this.§1t891s0§ = -1;
         }
         if(param1.type.toString() != "")
         {
            this.type = param1.type;
         }
         else
         {
            this.type = 0;
         }
         if(param1.unique.toString() != "")
         {
            this.unique = param1.unique;
         }
         else
         {
            this.unique = 0;
         }
         if(param1.baseprice.toString() != "")
         {
            this.§1t1188s0§.§1t695s0§(param1.baseprice);
         }
         else
         {
            this.§1t1188s0§.§1t695s0§(1);
         }
         if(param1.heavenlyprice.toString() != "")
         {
            this.§1t847s0§.§1t695s0§(param1.heavenlyprice);
         }
         else
         {
            this.§1t847s0§.§1t695s0§(0);
         }
         if(param1.imageurl.toString() != "")
         {
            this.imageurl = this.§1t796s0§(param1.imageurl);
         }
         else
         {
            this.imageurl = "";
         }
         if(param1.art.toString() != "")
         {
            this.art = param1.art;
         }
         else
         {
            this.art = this.id;
         }
         if(param1.animated.toString() == "")
         {
            this.animated = false;
         }
         else
         {
            this.animated = true;
         }
         if(param1.pcolor.toString() != "")
         {
            this.pcolor = this.§1t796s0§(param1.pcolor);
         }
         else
         {
            this.pcolor = "";
         }
         if(param1.scolor.toString() != "")
         {
            this.scolor = this.§1t796s0§(param1.scolor);
         }
         else
         {
            this.scolor = "";
         }
         if(param1.minlvl.toString() != "")
         {
            this.levelrestriction = param1.minlvl;
         }
         else
         {
            this.levelrestriction = 0;
         }
         if(param1.mindamage.toString() != "")
         {
            this.mindamage = param1.mindamage;
         }
         else
         {
            this.mindamage = 0;
         }
         if(param1.maxdamage.toString() != "")
         {
            this.maxdamage = param1.maxdamage;
         }
         else
         {
            this.maxdamage = 0;
         }
         if(param1.slashusage.toString() != "")
         {
            this.slashusage = param1.slashusage;
         }
         else
         {
            this.slashusage = 48;
         }
         if(param1.stancerestriction.toString() != "")
         {
            this.stancerestriction = param1.stancerestriction;
         }
         else
         {
            this.stancerestriction = 0;
         }
         if(param1.defense.toString() != "")
         {
            this.defense = param1.defense;
         }
         else
         {
            this.defense = 0;
         }
         if(param1.weight.toString() != "")
         {
            this.weight = param1.weight;
         }
         else
         {
            this.weight = 0;
         }
         if(param1.uses.toString() != "")
         {
            this.durability = param1.uses;
         }
         else
         {
            this.durability = 0;
         }
         if(param1.nogive.toString() != "")
         {
            this.nogive = true;
         }
         else
         {
            this.nogive = false;
         }
         if(param1.nodrop.toString() != "")
         {
            this.nodrop = true;
         }
         else
         {
            this.nodrop = false;
         }
         if(param1.desc.toString() != "")
         {
            this.§1t892s0§ = param1.desc;
         }
         else
         {
            this.§1t892s0§ = -1;
         }
         this.modifierXML = XMLList(param1.modifier).copy();
      }
      
      internal function §1t796s0§(param1:String) : String
      {
         return param1.substr(0,1) + param1.substr(1);
      }
      
      public function getModifier(param1:int) : int
      {
         this.fullParseModifier();
         return this.modifier[param1];
      }
      
      public function getModifierList() : Vector.<int>
      {
         this.fullParseModifier();
         return this.modifier;
      }
      
      private function fullParseModifier() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.modifierXML != null)
         {
            _loc1_ = int(this.modifierXML.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.modifier.push(this.modifierXML[_loc2_]);
               _loc2_++;
            }
            this.modifierXML = null;
         }
      }
      
      public function findModifierBonus(param1:int) : int
      {
         var _loc2_:* = 0;
         while(_loc2_ < this.modifierXML.length())
         {
            if(this.modifierXML[_loc2_].id == param1)
            {
               return this.modifierXML[_loc2_].value;
            }
            _loc2_++;
         }
         return 0;
      }
      
      public function §1t1210s0§() : int
      {
         return this.§1t1188s0§.§1t697s0§();
      }
      
      public function §1t854s0§() : int
      {
         return this.§1t847s0§.§1t697s0§();
      }
   }
}

