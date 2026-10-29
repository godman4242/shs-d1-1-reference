package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1303")]
   public class §1t6360s0§ extends MovieClip
   {
      
      public var dailyNewBox:TextField;
      
      public var highLvlNewBox:TextField;
      
      public var §1t6363s0§:TextField;
      
      public var normalNewBox:TextField;
      
      public var type:int;
      
      public function §1t6360s0§(param1:int)
      {
         super();
         this.type = param1;
         this.normalNewBox.text = "";
         this.normalNewBox.mouseEnabled = false;
         this.dailyNewBox.text = "";
         this.dailyNewBox.mouseEnabled = false;
         this.highLvlNewBox.text = "";
         this.highLvlNewBox.mouseEnabled = false;
         this.§1t6363s0§.text = "";
         this.§1t6363s0§.mouseEnabled = false;
         switch(this.type)
         {
            case §1t1711s0§.§1t11263s0§:
            case §1t1711s0§.§1t11262s0§:
               this.normalNewBox.text = "!";
               break;
            case §1t1711s0§.§1t11269s0§:
               this.highLvlNewBox.text = "!";
               break;
            case §1t1711s0§.§1t11270s0§:
               this.§1t6363s0§.text = "!";
               break;
            case §1t1711s0§.§1t11265s0§:
               this.dailyNewBox.text = "!";
         }
      }
   }
}

