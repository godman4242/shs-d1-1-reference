package
{
   public class XMLAchievement
   {
      
      public var id:int;
      
      public var image:int;
      
      public var displayname:String;
      
      public var desc:String;
      
      public var condition:XMLList = null;
      
      public var reqid:int;
      
      public var reqvalue:int;
      
      internal var score:int = 1;
      
      public function XMLAchievement(xml:XML)
      {
         super();
         this.id = xml.id;
         if(xml.name.toString() != "")
         {
            this.displayname = LangManager.getString(xml.name);
         }
         else
         {
            this.displayname = "?";
         }
         if(xml.img.toString() != "")
         {
            this.image = xml.img;
         }
         else
         {
            this.image = 0;
         }
         if(xml.desc.toString() != "")
         {
            this.desc = LangManager.getString(xml.desc);
         }
         else
         {
            this.desc = "";
         }
         if(xml.stat.toString() == "")
         {
            this.reqid = -1;
         }
         else
         {
            this.reqid = xml.stat;
         }
         if(xml.val.toString() == "")
         {
            this.reqvalue = 1;
         }
         else
         {
            this.reqvalue = xml.val;
         }
         if(xml.condition.toString() != "")
         {
            this.condition = xml.condition;
         }
         if(xml.score.toString() != "")
         {
            this.score = xml.score;
         }
      }
      
      public function getScore() : int
      {
         if(this.reqid != -1 && StatsManager.getStat(this.reqid) >= this.reqvalue)
         {
            return this.score;
         }
         if(this.condition != null && StatsManager.checkConditions(this.condition))
         {
            return this.score;
         }
         return 0;
      }
   }
}

