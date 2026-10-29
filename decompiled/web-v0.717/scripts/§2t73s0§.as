package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1269")]
   public class §2t73s0§ extends MovieClip
   {
      
      public var §1t5829s0§:TextField;
      
      public function §2t73s0§(param1:String = "", param2:int = 0, param3:int = 0)
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5829s0§);
         this.§1t5829s0§.text = param1;
         this.§1t5829s0§.mouseEnabled = false;
         if(param2 != 0)
         {
            this.x = param2;
         }
         if(param3 != 0)
         {
            this.y = param3;
         }
      }
      
      public function §1t5769s0§(param1:String) : void
      {
         this.§1t5829s0§.text = param1;
      }
   }
}

