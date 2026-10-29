package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2013")]
   public class §1t7274s0§ extends MovieClip
   {
      
      public var §1t5438s0§:§1t74s0§;
      
      public var §1t7275s0§:SimpleButton;
      
      public var §1t7276s0§:MovieClip;
      
      public var §1t7277s0§:MovieClip;
      
      public var §1t7278s0§:TextField;
      
      public var §1t6959s0§:TextField;
      
      public var §1t7279s0§:TextField;
      
      public var §1t7280s0§:TextField;
      
      public var skull:MovieClip;
      
      public var §1t7282s0§:MovieClip;
      
      internal var index:int;
      
      internal var §1t7244s0§:Array;
      
      internal var §1t7283s0§:Boolean = false;
      
      public function §1t7274s0§()
      {
         super();
         stop();
         this.§1t7275s0§.visible = false;
         this.§1t7276s0§.visible = false;
      }
      
      public function init(param1:int) : *
      {
         this.index = param1;
      }
      
      public function §1t7284s0§(param1:Boolean) : *
      {
         this.§1t7283s0§ = true;
         this.§1t7275s0§.visible = true;
         this.§1t7276s0§.visible = param1;
      }
      
      public function §1t7285s0§() : *
      {
         this.§1t7283s0§ = false;
         this.§1t7275s0§.visible = false;
         this.§1t7276s0§.visible = false;
      }
      
      public function §1t7286s0§() : Boolean
      {
         this.§1t7276s0§.visible = !this.§1t7276s0§.visible;
         return this.§1t7276s0§.visible;
      }
      
      public function §1t7287s0§(param1:§1t29s0§) : *
      {
         this.§1t7280s0§.text = param1.charname;
         this.§1t6959s0§.text = §1t1521s0§.getString(22036,[param1.§1t7323s0§(§1t24s0§.§1t8755s0§).toString()]);
         this.§1t5438s0§.§1t5491s0§(param1.mcs.§1t1251s0§());
         this.§1t5438s0§.scaleX = 1.2;
         this.§1t5438s0§.scaleY = 1.2;
         this.§1t3308s0§(param1.§1t3309s0§(),param1.§1t7318s0§());
      }
      
      public function §1t3308s0§(param1:int, param2:int) : *
      {
         this.§1t7278s0§.text = param1 + "/" + param2;
         this.§1t7277s0§.bar.scaleX = param1 / param2;
         this.§1t5438s0§.visible = param1 > 0;
         this.skull.visible = param1 <= 0;
      }
      
      public function §1t7288s0§(param1:§1t29s0§, param2:Boolean, param3:Boolean) : *
      {
         if(param3)
         {
            this.§1t6959s0§.htmlText = "<font color=\'#FF0000\'>" + §1t1521s0§.getString(22102) + "</font>";
         }
         else if(param2)
         {
            this.§1t6959s0§.htmlText = "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(22081) + "</font>";
         }
         else
         {
            this.§1t6959s0§.htmlText = param1.§1t7330s0§();
         }
         this.§1t7279s0§.text = §1t1521s0§.getString(22036,[param1.§1t7323s0§(§1t24s0§.§1t8755s0§).toString()]);
         this.§1t7282s0§.bar.scaleX = param1.§1t7324s0§(§1t24s0§.§1t8755s0§);
      }
   }
}

