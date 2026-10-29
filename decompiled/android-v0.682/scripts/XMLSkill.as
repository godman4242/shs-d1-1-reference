package
{
   public class XMLSkill
   {
      
      public var id:int;
      
      public var order:int;
      
      public var displayname:String;
      
      public var lvlreq:int;
      
      public var desc:String;
      
      public var req:XMLList;
      
      public var input:String;
      
      public var passive:Boolean;
      
      public var category:int;
      
      public var imageurl:String;
      
      public var levelXML:XMLList;
      
      private var levelList:Vector.<XMLList> = new Vector.<XMLList>();
      
      public function XMLSkill(xml:XML)
      {
         super();
         this.id = xml.id;
         this.order = xml.order;
         if(xml.displayname.toString() != "")
         {
            this.displayname = LangManager.getString(xml.displayname);
         }
         else
         {
            this.displayname = "?";
         }
         if(xml.lvlreq.toString() != "")
         {
            this.lvlreq = xml.lvlreq;
         }
         else
         {
            this.lvlreq = 0;
         }
         this.req = xml.req;
         if(xml.passive != "1")
         {
            this.passive = false;
         }
         else
         {
            this.passive = true;
         }
         if(xml.input != "")
         {
            this.input = xml.input;
         }
         else
         {
            this.input = "";
         }
         if(xml.imageurl != "")
         {
            this.imageurl = xml.imageurl;
         }
         else
         {
            this.imageurl = "";
         }
         if(xml.desc.toString() != "")
         {
            this.desc = LangManager.getString(xml.desc);
         }
         else
         {
            this.desc = "";
         }
         this.levelXML = xml.level;
         this.category = xml.category;
      }
      
      public function getSkillDescription(lvl:int) : String
      {
         var cost:int = 0;
         var cooldown:Number = NaN;
         var has:XMLList = null;
         var hasid:int = 0;
         var hasqty:int = 0;
         var i:* = 0;
         this.fullParseLevel();
         var outputString:String = "";
         outputString += "<font size=\'16\' color=\'#FFFFFF\'>" + this.displayname + "</font><br>";
         if(this.passive)
         {
            outputString += "(" + LangManager.getString(160) + ")<br>";
         }
         outputString += "<br>";
         if(this.desc != "")
         {
            outputString += this.desc + "<br><br>";
         }
         if(lvl == 0)
         {
            outputString += "<font size=\'16\' color=\'#FFFFFF\'>" + LangManager.getString(157) + " (" + LangManager.getString(155) + " 1)</font><br>";
            if(this.levelList[0].desc != "")
            {
               outputString += LangManager.getString(this.levelList[0].desc) + "<br>";
            }
            cost = this.getChiCost(1);
            cooldown = this.getCooldown(1) / 24;
            if(cost > 0)
            {
               outputString += LangManager.getString(167) + ": " + cost + "<br>";
            }
            if(cooldown > 0)
            {
               outputString += LangManager.getString(647) + ": " + cooldown.toFixed(2) + " " + LangManager.getString(648) + "<br>";
            }
            outputString += "<br>";
            if(!this.canLearn())
            {
               outputString += "<font color=\'#FF0000\'>";
               if(StatsManager.getLevel() < this.lvlreq)
               {
                  outputString += LangManager.getString(124) + ": " + this.lvlreq.toString() + "<br>";
               }
               if(!StatsManager.checkConditions(this.req))
               {
                  has = this.req.has;
                  for(i = int(has.length() - 1); i >= 0; i--)
                  {
                     hasid = int(has[i].id);
                     hasqty = int(has[i].qty);
                     if(!StatsManager.checkCondition(hasid,hasqty))
                     {
                        if(hasid < 2000 && hasid >= 1000)
                        {
                           if(hasqty <= 1)
                           {
                              outputString += LangManager.getString(302) + " " + QuestEngine.getSkillData(hasid).displayname + "<br>";
                           }
                           else
                           {
                              outputString += LangManager.getString(302) + " " + QuestEngine.getSkillData(hasid).displayname + " " + LangManager.getString(120) + hasqty + "<br>";
                           }
                        }
                        else if(hasid == 28)
                        {
                           outputString += LangManager.getString(302) + " " + hasqty + " " + LangManager.getString(726) + "<br>";
                        }
                        else if(hasid == 29)
                        {
                           outputString += LangManager.getString(302) + " " + hasqty + " " + LangManager.getString(727) + "<br>";
                        }
                        else if(hasid == 30)
                        {
                           outputString += LangManager.getString(302) + " " + hasqty + " " + LangManager.getString(728) + "<br>";
                        }
                        else if(hasid == 31)
                        {
                           outputString += LangManager.getString(302) + " " + hasqty + " " + LangManager.getString(729) + "<br>";
                        }
                        else
                        {
                           outputString += LangManager.getString(302) + " " + hasid + ": " + hasqty + "<br>";
                        }
                     }
                  }
               }
               outputString += "</font>";
            }
         }
         else
         {
            if(this.levelList.length > lvl)
            {
               outputString += "<font size=\'16\' color=\'#FFFFFF\'>" + LangManager.getString(156) + " (" + LangManager.getString(155) + " " + lvl + ")</font><br>";
               if(this.levelList[lvl - 1].desc != "")
               {
                  outputString += LangManager.getString(this.levelList[lvl - 1].desc) + "<br>";
               }
               cost = this.getChiCost(lvl);
               cooldown = this.getCooldown(lvl) / 24;
               if(cost > 0)
               {
                  outputString += LangManager.getString(167) + ": " + cost + "<br>";
               }
               if(cooldown > 0)
               {
                  outputString += LangManager.getString(647) + ": " + cooldown.toFixed(2) + " " + LangManager.getString(648) + "<br>";
               }
               outputString += "<br>";
               outputString += "<font size=\'16\' color=\'#FFFFFF\'>" + LangManager.getString(157) + " (" + LangManager.getString(155) + " " + String(lvl + 1) + ")</font><br>";
               if(this.levelList[lvl].desc != "")
               {
                  outputString += LangManager.getString(this.levelList[lvl].desc) + "<br>";
               }
               cost = this.getChiCost(lvl + 1);
               cooldown = this.getCooldown(lvl + 1) / 24;
               if(cost > 0)
               {
                  outputString += LangManager.getString(167) + ": " + cost + "<br>";
               }
               if(cooldown > 0)
               {
                  outputString += LangManager.getString(647) + ": " + cooldown.toFixed(2) + " " + LangManager.getString(648) + "<br>";
               }
            }
            else
            {
               outputString += "<font size=\'16\' color=\'#FFFFFF\'>" + LangManager.getString(159) + "</font><br>";
               if(this.levelList[lvl - 1].desc != "")
               {
                  outputString += LangManager.getString(this.levelList[lvl - 1].desc) + "<br>";
               }
               cost = this.getChiCost(lvl);
               cooldown = this.getCooldown(lvl) / 24;
               if(cost > 0)
               {
                  outputString += LangManager.getString(167) + ": " + cost + "<br>";
               }
               if(cooldown > 0)
               {
                  outputString += LangManager.getString(647) + ": " + cooldown.toFixed(2) + " " + LangManager.getString(648) + "<br>";
               }
            }
            if(StatsManager.getLevel() < this.lvlreq)
            {
               outputString += "<font color=\'#FF0000\'>";
               if(StatsManager.getLevel() < this.lvlreq)
               {
                  outputString += "<br>" + LangManager.getString(124) + ": " + this.lvlreq.toString() + "<br>";
               }
               outputString += "</font>";
            }
         }
         return outputString;
      }
      
      public function getPointsRequiredText(lvl:int) : String
      {
         var required:int = 0;
         var outputString:String = null;
         this.fullParseLevel();
         if(this.getSkillPointsRequired(lvl) > 0)
         {
            required = int(this.levelList[lvl].required);
            outputString = "";
            if(StatsManager.getStat(StatsManager.STAT_SKILLPOINTS) < required)
            {
               outputString += "<font color=\'#FF0000\'>";
            }
            else
            {
               outputString += "<font color=\'#FFFFFF\'>";
            }
            return outputString + (LangManager.getString(158) + ": " + required + "</font>");
         }
         return "";
      }
      
      public function getChiCost(lvl:int) : int
      {
         this.fullParseLevel();
         lvl--;
         if(lvl >= this.levelList.length || this.levelList[lvl].chi.toString == "")
         {
            return 0;
         }
         return this.levelList[lvl].chi;
      }
      
      public function getSkillPointsRequired(lvl:int) : int
      {
         this.fullParseLevel();
         if(lvl >= this.levelList.length || lvl < 0 || this.levelList[lvl].required.toString == "")
         {
            return 0;
         }
         return this.levelList[lvl].required;
      }
      
      public function getCooldown(lvl:int) : int
      {
         var val:int = 0;
         if(this.passive)
         {
            return 0;
         }
         this.fullParseLevel();
         lvl--;
         if(lvl >= this.levelList.length)
         {
            val = this.levelList[this.levelList.length - 1].cooldown * 24;
         }
         else if(lvl < 0 || this.levelList[lvl].cooldown.toString == "")
         {
            val = 0;
         }
         else
         {
            val = this.levelList[lvl].cooldown * 24;
         }
         return val * StatsManager.getSkillCooldownModifier();
      }
      
      public function getLevelList() : Vector.<XMLList>
      {
         this.fullParseLevel();
         return this.levelList;
      }
      
      public function canLearn() : Boolean
      {
         return StatsManager.getStat(this.id) == 0 && StatsManager.getLevel() >= this.lvlreq && StatsManager.checkConditions(this.req) && StatsManager.getStat(StatsManager.STAT_SKILLPOINTS) >= this.getSkillPointsRequired(0);
      }
      
      public function canUpgrade() : Boolean
      {
         this.fullParseLevel();
         var lvl:int = StatsManager.getStat(this.id);
         return lvl > 0 && this.levelList.length > lvl && StatsManager.getStat(StatsManager.STAT_SKILLPOINTS) >= this.getSkillPointsRequired(lvl);
      }
      
      public function isNotEnoughSkillPoints() : Boolean
      {
         var lvl:int = StatsManager.getStat(this.id);
         if(lvl == 0 && StatsManager.getLevel() >= this.lvlreq && StatsManager.checkConditions(this.req) && StatsManager.getStat(StatsManager.STAT_SKILLPOINTS) < this.getSkillPointsRequired(0))
         {
            return true;
         }
         if(lvl > 0 && this.levelList.length > lvl && StatsManager.getStat(StatsManager.STAT_SKILLPOINTS) < this.getSkillPointsRequired(lvl))
         {
            return true;
         }
         return false;
      }
      
      public function canEquip() : Boolean
      {
         return !this.passive && StatsManager.getStat(this.id) > 0 && (StatsManager.getLevel() >= this.lvlreq || StatsManager.canEquipAllSkills);
      }
      
      private function fullParseLevel() : void
      {
         var length:int = 0;
         var i:int = 0;
         if(this.levelXML != null)
         {
            length = this.levelXML.length();
            for(i = 0; i < length; i++)
            {
               this.levelList.push(XMLList(this.levelXML[i]));
            }
            this.levelXML = null;
         }
      }
   }
}

