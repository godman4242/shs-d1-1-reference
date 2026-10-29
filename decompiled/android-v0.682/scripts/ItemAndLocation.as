package
{
   public class ItemAndLocation
   {
      
      internal var item:Item;
      
      internal var nodeid:int;
      
      internal var roomid:int = -1;
      
      internal var npcindex:int = -1;
      
      public function ItemAndLocation(item:Item, nodeid:int, roomid:int = -1, npcindex:int = -1)
      {
         super();
         this.item = item;
         this.nodeid = nodeid;
         this.roomid = roomid;
         this.npcindex = npcindex;
      }
      
      public function getItem() : Item
      {
         return this.item;
      }
      
      public function getLocation() : int
      {
         return this.nodeid;
      }
      
      public function getRoomId() : int
      {
         return this.roomid;
      }
      
      public function getNpcIndex() : int
      {
         return this.npcindex;
      }
      
      public function getLocationString(forTrade:Boolean) : String
      {
         if(QuestGenerator.instance.playerHasCurrentNPCQuestItem(forTrade))
         {
            return "Did you manage to find it?";
         }
         if(this.nodeid == StageManager.getCurrentNode())
         {
            return "Someone here in " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(this.nodeid,this.roomid) + " has it. You can try trading something for it.";
         }
         return "You can find it at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(this.nodeid,this.roomid) + ".";
      }
      
      public function getBountyLocationString(targetname:String) : String
      {
         return targetname + " was last spotted at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(this.nodeid,this.roomid) + ".";
      }
      
      public function getDarumaLocationString() : String
      {
         return "You can find it deep in the Oni Den at " + NodeGenerator.instance.getQuestLogDescriptiveNodeName(this.nodeid,this.roomid) + ". Be careful! It is said to be guarded by Red Oni.";
      }
   }
}

