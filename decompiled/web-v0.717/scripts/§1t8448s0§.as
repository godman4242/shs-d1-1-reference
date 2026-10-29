package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2814")]
   public class §1t8448s0§ extends §1t399s0§
   {
      
      public var door:MovieClip;
      
      internal var destroom:int = 1;
      
      internal var destxpos:int = 400;
      
      public var flipped:Boolean = false;
      
      public function §1t8448s0§(param1:String = "")
      {
         super();
         var _loc2_:Array = param1.split(",");
         if(_loc2_.length > 0 && _loc2_[0] == "1")
         {
            this.door.visible = false;
            §1t8501s0§ = true;
         }
         else
         {
            §1t8501s0§ = false;
         }
         if(_loc2_.length > 1)
         {
            this.destroom = _loc2_[1];
         }
         if(_loc2_.length > 2)
         {
            this.destxpos = _loc2_[2];
         }
         §1t8503s0§ = §1t407s0§.§1t12439s0§;
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
         x += param1 / 2;
      }
      
      override public function needTransition() : Boolean
      {
         if(§1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§() || §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9414s0§) <= 0)
         {
            return false;
         }
         return true;
      }
      
      override public function §1t8523s0§() : *
      {
         if(this.needTransition())
         {
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         }
         else
         {
            this.interact();
         }
      }
      
      override public function interact() : *
      {
         if(§1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§())
         {
            §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(138),§1t1521s0§.getString(5));
            return;
         }
         if(!§1t1523s0§.§1t9606s0§(1))
         {
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            return;
         }
         §1t1525s0§.§1t9922s0§(this.destroom,this.destxpos);
      }
      
      override public function §1t8517s0§() : int
      {
         return 0;
      }
      
      override public function §1t8524s0§(param1:int, param2:int) : Boolean
      {
         return this.door.hitTestPoint(param1,param2);
      }
      
      override public function §1t8525s0§() : Boolean
      {
         return true;
      }
      
      override public function §1t6733s0§() : String
      {
         return §1t1521s0§.getString(976);
      }
   }
}

