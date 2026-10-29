package
{
   public class §1t109s0§
   {
      
      public var id:int;
      
      public var image:int;
      
      public var §1t891s0§:int;
      
      public var §1t892s0§:int;
      
      public var reqid:int;
      
      public var reqvalue:int;
      
      internal var score:int = 1;
      
      public var condition:XMLList = null;
      
      public function §1t109s0§(param1:XML)
      {
         super();
         this.id = param1.id;
         if(param1.name.toString() != "")
         {
            this.§1t891s0§ = param1.name;
         }
         else
         {
            this.§1t891s0§ = 5002;
         }
         if(param1.img.toString() != "")
         {
            this.image = param1.img;
         }
         else
         {
            this.image = 0;
         }
         if(param1.desc.toString() != "")
         {
            this.§1t892s0§ = param1.desc;
         }
         else
         {
            this.§1t892s0§ = -1;
         }
         if(param1.stat.toString() == "")
         {
            this.reqid = -1;
         }
         else
         {
            this.reqid = param1.stat;
         }
         if(param1.val.toString() == "")
         {
            this.reqvalue = 1;
         }
         else
         {
            this.reqvalue = param1.val;
         }
         if(param1.condition.toString() != "")
         {
            this.condition = XMLList(param1.condition).copy();
         }
         if(param1.score.toString() != "")
         {
            this.score = param1.score;
         }
      }
      
      public function §1t1118s0§() : int
      {
         if(this.reqid != -1 && §1t1523s0§.§1t9714s0§(this.reqid) >= this.reqvalue)
         {
            return this.score;
         }
         if(this.condition != null && §1t1523s0§.§1t640s0§(this.condition))
         {
            return this.score;
         }
         return 0;
      }
   }
}

