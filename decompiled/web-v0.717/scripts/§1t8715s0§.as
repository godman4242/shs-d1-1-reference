package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2827")]
   public class §1t8715s0§ extends §1t8688s0§
   {
      
      public var spikeball:MovieClip;
      
      internal var rotspeed:int = 10;
      
      internal var §1t8103s0§:§1t67s0§;
      
      public function §1t8715s0§(param1:String, param2:String = "")
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
         var _loc3_:int = 20;
         var _loc4_:Array = param1.split(",");
         if(_loc4_.length >= 1)
         {
            this.rotspeed = int(_loc4_[0]);
         }
         if(_loc4_.length >= 2)
         {
            this.spikeball.gotoAndStop(int(_loc4_[1]));
         }
         if(_loc4_.length >= 3)
         {
            this.spikeball.rotation = int(_loc4_[2]);
         }
         if(_loc4_.length >= 4 && _loc4_[3] == "1")
         {
            _loc3_ = 10000;
         }
         this.§1t8103s0§ = new §1t67s0§(_loc3_,0,§1t67s0§.§1t9118s0§);
         this.spikeball.hitarea.visible = false;
      }
      
      override public function update() : *
      {
         this.spikeball.rotation += this.rotspeed;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(abs(x - param1.x) < 150 && !§1t1523s0§.§1t9586s0§().§1t3292s0§())
         {
            §1t1543s0§.§1t10232s0§(this.spikeball.hitarea,this.§1t8103s0§,150,false,this);
         }
         return false;
      }
      
      override internal function §1t3270s0§() : *
      {
      }
   }
}

