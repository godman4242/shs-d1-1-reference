package
{
   import flash.utils.getDefinitionByName;
   
   public class CompletedQuest
   {
      
      public var questID:int;
      
      public var completedTime:int;
      
      public var nodeid:int;
      
      public var roomid:int;
      
      public var index:int;
      
      public var forTrade:Boolean;
      
      public function CompletedQuest(ID:int = 0, completed:int = 0)
      {
         super();
         this.questID = ID;
         this.completedTime = completed;
      }
      
      public static function parse(str:String) : CompletedQuest
      {
         var completedQuest:CompletedQuest = null;
         var strArray:Array = str.split(",");
         if(strArray.length == 0)
         {
            return null;
         }
         if(strArray[0] == -1)
         {
            completedQuest = new CompletedQuest(-1);
            completedQuest.setProcGen(strArray[1],strArray[2],strArray[3],strArray[4],strArray[5] == "1");
            return completedQuest;
         }
         if(strArray[0] == 0)
         {
            return null;
         }
         return new CompletedQuest(strArray[0],strArray[1]);
      }
      
      public function setProcGen(nodeid:int, roomid:int, index:int, date:int, forTrade:Boolean) : *
      {
         this.nodeid = nodeid;
         this.roomid = roomid;
         this.index = index;
         this.completedTime = date;
         this.forTrade = forTrade;
      }
      
      public function isQuest(nodeid:int, roomid:int, npcindex:int, date:int) : Boolean
      {
         return this.nodeid == nodeid && this.roomid == roomid && this.index == npcindex && this.completedTime == date;
      }
      
      public function isProgGen() : Boolean
      {
         return this.questID == -1;
      }
      
      public function toString() : String
      {
         if(!this.isProgGen() && this.completedTime != 0 && this.completedTime != QueryManager.instance.getServerDate())
         {
            return "";
         }
         if(this.isProgGen() && this.completedTime != QueryManager.instance.getServerDate())
         {
            return "";
         }
         var forTradeStr:String = "0";
         if(this.forTrade)
         {
            forTradeStr = "1";
         }
         if(this.questID == -1)
         {
            return this.questID + "," + this.nodeid + "," + this.roomid + "," + this.index + "," + this.completedTime + "," + forTradeStr;
         }
         return this.questID + "," + this.completedTime;
      }
   }
}

