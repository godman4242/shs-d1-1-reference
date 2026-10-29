package
{
   public class §1t124s0§
   {
      
      internal var item:§1t17s0§;
      
      internal var nodeid:int;
      
      internal var roomid:int = -1;
      
      internal var §1t802s0§:int = -1;
      
      public function §1t124s0§(param1:§1t17s0§, param2:int, param3:int = -1, param4:int = -1)
      {
         super();
         this.item = param1;
         this.nodeid = param2;
         this.roomid = param3;
         this.§1t802s0§ = param4;
      }
      
      public function §1t2217s0§() : §1t17s0§
      {
         return this.item;
      }
      
      public function §1t2218s0§() : int
      {
         return this.nodeid;
      }
      
      public function §1t1402s0§() : int
      {
         return this.roomid;
      }
      
      public function §1t2219s0§() : int
      {
         return this.§1t802s0§;
      }
      
      public function §1t2220s0§(param1:Boolean) : String
      {
         if(§1t123s0§.instance.§1t1592s0§(param1))
         {
            return §1t1521s0§.getString(11165);
         }
         if(this.nodeid == §1t1525s0§.§1t9935s0§())
         {
            return §1t1521s0§.getString(11166,[§1t70s0§.instance.§1t1155s0§(this.nodeid,this.roomid)]);
         }
         return §1t1521s0§.getString(11167,[§1t70s0§.instance.§1t1155s0§(this.nodeid,this.roomid)]);
      }
      
      public function §1t2221s0§(param1:String) : String
      {
         return §1t1521s0§.getString(11168,[param1,§1t70s0§.instance.§1t1155s0§(this.nodeid,this.roomid)]);
      }
      
      public function §1t2222s0§() : String
      {
         return §1t1521s0§.getString(11169,[§1t70s0§.instance.§1t1155s0§(this.nodeid,this.roomid)]);
      }
   }
}

