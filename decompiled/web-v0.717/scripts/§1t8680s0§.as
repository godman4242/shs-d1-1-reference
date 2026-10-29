package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2837")]
   public class §1t8680s0§ extends §1t8624s0§
   {
      
      public function §1t8680s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
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
            active = _loc3_[0] != "0";
            visible = active;
         }
         if(_loc3_.length >= 2)
         {
            gotoAndStop(int(_loc3_[1]));
         }
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(!active)
         {
            return;
         }
         var _loc2_:§1t99s0§ = §1t1523s0§.§1t9586s0§();
         _loc2_.§1t3269s0§(§1t1544s0§.§1t11144s0§);
         §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11144s0§,_loc2_.§1t1555s0§(),_loc2_.§1t1559s0§().y,_loc2_.§1t1559s0§().§1t6283s0§());
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 50 && param1.hitTestObject(this);
      }
      
      override public function triggerObject(param1:Boolean, param2:Boolean, param3:int = 0) : *
      {
         active = param1;
         visible = param1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

