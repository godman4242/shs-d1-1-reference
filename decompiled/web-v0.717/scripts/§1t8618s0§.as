package
{
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2922")]
   public class §1t8618s0§ extends §1t399s0§
   {
      
      public function §1t8618s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         this.props = param1;
         var _loc3_:int = int(param1);
         if(_loc3_ <= 2)
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(2);
         }
         §1t8503s0§ = §1t407s0§.§1t12443s0§;
      }
      
      override public function interact() : *
      {
         var _loc1_:Point = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
         var _loc2_:§1t71s0§ = §1t70s0§.instance.§1t1126s0§(_loc1_.x,_loc1_.y,false);
         _loc2_.§1t1338s0§();
      }
      
      override public function §1t6733s0§() : String
      {
         return §1t1521s0§.getString(148);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

