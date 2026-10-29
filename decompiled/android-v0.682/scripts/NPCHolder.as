package
{
   public class NPCHolder
   {
      
      internal var npcid:int;
      
      internal var fatal:String;
      
      internal var xpos:String;
      
      internal var lvl:String;
      
      public function NPCHolder(npcid:int, fatal:String, xpos:String, lvl:String)
      {
         super();
         this.npcid = npcid;
         this.fatal = fatal;
         this.xpos = xpos;
         this.lvl = lvl;
      }
      
      public function getNPCID() : int
      {
         return this.npcid;
      }
      
      public function getFatal() : Boolean
      {
         if(this.fatal == "0")
         {
            return false;
         }
         return true;
      }
      
      public function getXPos() : int
      {
         if(this.xpos == "")
         {
            return Math.random() * StageManager.getGameStageWidth();
         }
         return int(this.xpos);
      }
      
      public function hasLvl() : Boolean
      {
         return this.lvl != "";
      }
      
      public function getLvl() : int
      {
         if(this.lvl != "")
         {
            return int(this.lvl);
         }
         return 0;
      }
   }
}

