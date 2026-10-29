package
{
   public class §1t2208s0§
   {
      
      internal var npcid:int;
      
      internal var fatal:String;
      
      internal var xpos:String;
      
      internal var lvl:String;
      
      public function §1t2208s0§(param1:int, param2:String, param3:String, param4:String)
      {
         super();
         this.npcid = param1;
         this.fatal = param2;
         this.xpos = param3;
         this.lvl = param4;
      }
      
      public function §1t2212s0§() : int
      {
         return this.npcid;
      }
      
      public function §1t2213s0§() : Boolean
      {
         if(this.fatal == "0")
         {
            return false;
         }
         return true;
      }
      
      public function §1t2214s0§() : int
      {
         if(this.xpos == "")
         {
            return Math.random() * §1t1525s0§.§1t8124s0§();
         }
         return int(this.xpos);
      }
      
      public function §1t2215s0§() : Boolean
      {
         return this.lvl != "";
      }
      
      public function §1t2216s0§() : int
      {
         if(this.lvl != "")
         {
            return int(this.lvl);
         }
         return 0;
      }
   }
}

