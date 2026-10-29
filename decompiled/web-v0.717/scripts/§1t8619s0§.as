package
{
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2848")]
   public class §1t8619s0§ extends §1t399s0§
   {
      
      internal var destName:String;
      
      internal var apuse:int = 0;
      
      internal var §1t1277s0§:int;
      
      internal var underAttack:int;
      
      public function §1t8619s0§(param1:String, param2:String = "")
      {
         var _loc4_:Point = null;
         super();
         this.props = param1;
         if(param2 == "")
         {
            objectName = "townsign";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         this.§1t1277s0§ = int(_loc3_[0]);
         this.underAttack = int(_loc3_[1]);
         this.destName = §1t1525s0§.§1t1382s0§(1,-1);
         §1t8503s0§ = §1t407s0§.§1t12439s0§;
         if(§1t1523s0§.§1t9663s0§(this.§1t1277s0§))
         {
            _loc4_ = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
            §1t3318s0§.instance.§1t3412s0§(_loc4_.x,_loc4_.y);
         }
      }
      
      override public function interact() : *
      {
         if(!§1t1540s0§.§1t10047s0§() && §1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§())
         {
            §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(138),§1t1521s0§.getString(5));
            return;
         }
         if(!§1t1523s0§.§1t9606s0§(this.apuse))
         {
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            return;
         }
         §1t406s0§.instance.§1t6576s0§(§1t401s0§.§1t12367s0§,this.underAttack);
      }
      
      override public function §1t6733s0§() : String
      {
         return this.destName;
      }
      
      override public function §1t8517s0§() : int
      {
         return this.apuse;
      }
   }
}

