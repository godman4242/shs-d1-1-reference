package
{
   public class XMLItem
   {
      
      public var id:int;
      
      public var displayname:String;
      
      public var type:int;
      
      public var unique:int;
      
      public var gvalue:int;
      
      public var hvalue:int;
      
      public var art:int;
      
      public var animated:Boolean;
      
      public var pcolor:String;
      
      public var scolor:String;
      
      public var image:String;
      
      public var imageurl:String;
      
      public var levelrestriction:int;
      
      public var mindamage:int;
      
      public var maxdamage:int;
      
      public var slashusage:int;
      
      public var stancerestriction:int;
      
      public var defense:int;
      
      public var weight:int;
      
      public var desc:String;
      
      public var durability:int;
      
      public var attributes:String;
      
      public var nogive:Boolean;
      
      public var nodrop:Boolean;
      
      public var modifierXML:XMLList;
      
      private var modifier:Vector.<int> = new Vector.<int>();
      
      public function XMLItem(xml:XML)
      {
         super();
         this.id = xml.id;
         if(xml.name.toString() != "")
         {
            this.displayname = LangManager.getString(xml.name);
         }
         else
         {
            this.displayname = "";
         }
         if(xml.type.toString() != "")
         {
            this.type = xml.type;
         }
         else
         {
            this.type = 0;
         }
         if(xml.unique.toString() != "")
         {
            this.unique = xml.unique;
         }
         else
         {
            this.unique = 0;
         }
         if(xml.baseprice.toString() != "")
         {
            this.gvalue = xml.baseprice;
         }
         else
         {
            this.gvalue = 1;
         }
         if(xml.heavenlyprice.toString() != "")
         {
            this.hvalue = xml.heavenlyprice;
         }
         else
         {
            this.hvalue = 0;
         }
         if(xml.imageurl.toString() != "")
         {
            this.imageurl = xml.imageurl;
         }
         else
         {
            this.imageurl = "";
         }
         if(xml.art.toString() != "")
         {
            this.art = xml.art;
         }
         else
         {
            this.art = this.id;
         }
         if(xml.animated.toString() == "")
         {
            this.animated = false;
         }
         else
         {
            this.animated = true;
         }
         this.pcolor = xml.pcolor.toString();
         this.scolor = xml.scolor.toString();
         if(xml.minlvl.toString() != "")
         {
            this.levelrestriction = xml.minlvl;
         }
         else
         {
            this.levelrestriction = 0;
         }
         if(xml.mindamage.toString() != "")
         {
            this.mindamage = xml.mindamage;
         }
         else
         {
            this.mindamage = 0;
         }
         if(xml.maxdamage.toString() != "")
         {
            this.maxdamage = xml.maxdamage;
         }
         else
         {
            this.maxdamage = 0;
         }
         if(xml.slashusage.toString() != "")
         {
            this.slashusage = xml.slashusage;
         }
         else
         {
            this.slashusage = 48;
         }
         if(xml.stancerestriction.toString() != "")
         {
            this.stancerestriction = xml.stancerestriction;
         }
         else
         {
            this.stancerestriction = 0;
         }
         if(xml.defense.toString() != "")
         {
            this.defense = xml.defense;
         }
         else
         {
            this.defense = 0;
         }
         if(xml.weight.toString() != "")
         {
            this.weight = xml.weight;
         }
         else
         {
            this.weight = 0;
         }
         if(xml.uses.toString() != "")
         {
            this.durability = xml.uses;
         }
         else
         {
            this.durability = 0;
         }
         if(xml.nogive.toString() != "")
         {
            this.nogive = true;
         }
         else
         {
            this.nogive = false;
         }
         if(xml.nodrop.toString() != "")
         {
            this.nodrop = true;
         }
         else
         {
            this.nodrop = false;
         }
         if(xml.desc.toString() != "")
         {
            this.desc = LangManager.getString(int(xml.desc));
         }
         else
         {
            this.desc = "";
         }
         this.modifierXML = xml.modifier;
      }
      
      internal function determineAttributes() : *
      {
         var val:int = 0;
         var tempString:String = "";
         if(this.mindamage > 0 || this.maxdamage > 0)
         {
            tempString += LangManager.getString(108) + ": " + this.mindamage + " - " + this.maxdamage + "\n";
         }
         if(this.defense > 0)
         {
            tempString += LangManager.getString(109) + ": " + this.defense + "\n";
         }
         for(var q:* = 0; q < this.modifierXML.length(); q++)
         {
            switch(int(this.modifierXML[q].id))
            {
               case 0:
                  tempString += LangManager.getString(110);
                  break;
               case 1:
                  tempString += LangManager.getString(111);
                  break;
               case 2:
                  tempString += LangManager.getString(112);
                  break;
               case 3:
                  tempString += LangManager.getString(113);
                  break;
               case 4:
                  tempString += LangManager.getString(114);
                  break;
               case 5:
                  tempString += LangManager.getString(115);
                  break;
               case 6:
                  tempString += LangManager.getString(116);
                  break;
               case 7:
                  if(this.defense == 0)
                  {
                     tempString += LangManager.getString(117);
                  }
                  break;
               case 8:
                  tempString += LangManager.getString(118);
                  break;
               case 9:
                  tempString += LangManager.getString(119);
                  break;
               case 10:
                  tempString += LangManager.getString(120);
                  break;
               case 11:
                  tempString += LangManager.getString(63);
                  break;
               case 12:
                  tempString += LangManager.getString(64);
                  break;
               case 13:
                  tempString += LangManager.getString(102);
                  break;
               case 14:
                  tempString += LangManager.getString(121);
                  break;
               case 15:
                  tempString += LangManager.getString(59);
                  break;
               case 16:
                  tempString += LangManager.getString(122);
                  break;
               default:
                  if(int(this.modifierXML[q].id) < 2000 && int(this.modifierXML[q].id) > 100)
                  {
                     tempString += LangManager.getString(123) + ": " + this.modifierXML[q].id;
                  }
                  else
                  {
                     trace("ErrorValue: " + this.modifierXML[q].id);
                  }
            }
            if(!(this.defense != 0 && this.modifierXML[q].id == 7))
            {
               val = int(this.modifierXML[q].value);
               if(val > 0)
               {
                  tempString += ": +" + val + "\n";
               }
               else if(val < 0)
               {
                  tempString += ": " + val + "\n";
               }
            }
         }
         this.attributes = tempString;
         if(this.levelrestriction > 1)
         {
            if(this.desc != "")
            {
               this.desc += "\n";
            }
            this.desc += LangManager.getString(124) + ": " + this.levelrestriction;
         }
         if(this.stancerestriction > 0)
         {
            if(this.desc != "")
            {
               this.desc += "\n";
            }
            this.desc += LangManager.getString(125) + ": " + this.stancerestriction;
         }
      }
      
      public function getAttributeDesc() : String
      {
         if(this.attributes == null)
         {
            this.determineAttributes();
         }
         return this.attributes;
      }
      
      public function getModifier(index:int) : int
      {
         this.fullParseModifier();
         return this.modifier[index];
      }
      
      public function getModifierList() : Vector.<int>
      {
         this.fullParseModifier();
         return this.modifier;
      }
      
      private function fullParseModifier() : void
      {
         var length:int = 0;
         var i:int = 0;
         if(this.modifierXML != null)
         {
            length = int(this.modifierXML.length);
            for(i = 0; i < length; i++)
            {
               this.modifier.push(this.modifierXML[i]);
            }
            this.modifierXML = null;
         }
      }
      
      public function findModifierBonus(modID:int) : int
      {
         for(var q:* = 0; q < this.modifierXML.length(); q++)
         {
            if(this.modifierXML[q].id == modID)
            {
               return this.modifierXML[q].value;
            }
         }
         return 0;
      }
   }
}

