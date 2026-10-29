package
{
   public class §1t8721s0§ extends §1t8688s0§
   {
      
      internal var xvel:Number;
      
      internal var yvel:Number;
      
      internal var kunaiCount:int = 1;
      
      internal var angle:Number;
      
      internal var angleSpread:Number = 0;
      
      internal var speed:int;
      
      internal var kunailvl:int = 1;
      
      public function §1t8721s0§(param1:String, param2:String = "")
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
         this.angle = (int(_loc3_[0]) - 90) * 0.01746;
         this.speed = int(_loc3_[1]);
         if(_loc3_.length >= 3)
         {
            this.kunaiCount = int(_loc3_[2]);
         }
         if(_loc3_.length >= 4)
         {
            this.angleSpread = int(_loc3_[3]) * 0.01746;
         }
         if(_loc3_.length >= 5)
         {
            onDuration = int(_loc3_[4]);
         }
         if(_loc3_.length >= 6)
         {
            offDuration = int(_loc3_[5]);
         }
         if(_loc3_.length >= 7)
         {
            startInterval = int(_loc3_[6]);
         }
         if(_loc3_.length >= 8)
         {
            active = _loc3_[7] == "1";
         }
         if(_loc3_.length >= 9 && _loc3_[8] == "1")
         {
            this.kunailvl = 10;
         }
         this.xvel = this.speed * Math.cos(this.angle);
         this.yvel = this.speed * Math.sin(this.angle);
         timeCounter = offDuration - startInterval;
      }
      
      override internal function §1t3270s0§() : *
      {
         §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11272s0§,x + §1t1525s0§.§1t8131s0§(),y,this.xvel,this.yvel,0,this.kunailvl,null);
         var _loc1_:int = 1;
         while(_loc1_ < this.kunaiCount)
         {
            §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11272s0§,x + §1t1525s0§.§1t8131s0§(),y,this.speed * Math.cos(this.angle + this.angleSpread * _loc1_),this.speed * Math.sin(this.angle + this.angleSpread * _loc1_),0,this.kunailvl,null);
            _loc1_++;
         }
      }
   }
}

