package
{
   import flash.display.MovieClip;
   
   public class §1t2284s0§
   {
      
      public static var instance:§1t2284s0§;
      
      public function §1t2284s0§()
      {
         super();
         instance = this;
      }
      
      public function init() : *
      {
         var _loc1_:MovieClip = new MovieClip();
         §1t406s0§.instance.addChild(_loc1_);
         _loc1_.tabChildren = false;
         _loc1_.tabEnabled = false;
         §1t2730s0§.service.connect("DAUD4TRJGIFVTWP3",_loc1_);
      }
      
      public function §1t1684s0§(param1:int, param2:int, param3:Boolean = false) : *
      {
         if(param1 == 60001)
         {
            §1t2730s0§.service.§1t14403s0§(§1t1523s0§.§1t9714s0§(20),null,null);
         }
      }
   }
}

