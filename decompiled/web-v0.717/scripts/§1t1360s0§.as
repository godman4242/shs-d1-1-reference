package
{
   import flash.display.MovieClip;
   import flash.geom.Matrix;
   
   public class §1t1360s0§
   {
      
      internal static var §1t9226s0§:Matrix = new Matrix(1,0,0,1,0,0);
      
      public var id:int;
      
      public var x:int;
      
      public var y:int;
      
      public var rotation:int = 999;
      
      public var §1t1365s0§:int;
      
      public var §1t1366s0§:int;
      
      public var §1t1367s0§:int;
      
      public var §1t1368s0§:int;
      
      public function §1t1360s0§(param1:XML)
      {
         super();
         this.x = param1.@x;
         this.y = param1.@y;
         if(param1.@r.toString() == "")
         {
            this.§1t1365s0§ = param1.@a;
            this.§1t1366s0§ = param1.@b;
            this.§1t1367s0§ = param1.@c;
            this.§1t1368s0§ = param1.@d;
         }
         else
         {
            this.rotation = param1.@r;
         }
         this.id = param1.@i;
      }
      
      public function setPosition(param1:MovieClip) : *
      {
         var _loc2_:Matrix = null;
         if(param1 == null || !param1.visible)
         {
            return;
         }
         if(this.rotation != 999)
         {
            if(param1.skewed)
            {
               param1.transform.matrix = §1t9226s0§;
               param1.skewed = false;
            }
            param1.x = this.x;
            param1.y = this.y;
            param1.rotation = this.rotation;
         }
         else
         {
            _loc2_ = param1.transform.matrix;
            _loc2_.a = this.§1t1365s0§ / 100;
            _loc2_.b = this.§1t1366s0§ / 100;
            _loc2_.c = this.§1t1367s0§ / 100;
            _loc2_.d = this.§1t1368s0§ / 100;
            _loc2_.tx = this.x;
            _loc2_.ty = this.y;
            param1.transform.matrix = _loc2_;
            param1.skewed = true;
         }
      }
   }
}

