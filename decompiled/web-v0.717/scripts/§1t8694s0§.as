package
{
   public class §1t8694s0§ extends §1t8624s0§
   {
      
      internal var xvel:Number = 10;
      
      internal var yvel:Number = 0;
      
      internal var damage:int = 50;
      
      public function §1t8694s0§(param1:String, param2:String = "")
      {
         super();
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Trap";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         if(_loc3_.length >= 1)
         {
            this.xvel = int(_loc3_[0]);
         }
         if(_loc3_.length >= 2)
         {
            this.yvel = int(_loc3_[1]);
         }
         if(_loc3_.length >= 3 && _loc3_[2] == "1")
         {
            this.damage = 1000;
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11308s0§,x + §1t1525s0§.§1t8131s0§(),y,this.xvel,this.yvel,this.damage,1,null);
      }
   }
}

