package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1676")]
   public class §1t5874s0§ extends MovieClip
   {
      
      public var coins:MovieClip;
      
      public var §1t6658s0§:SimpleButton;
      
      public var gold:MovieClip;
      
      public var §1t5776s0§:§1t5774s0§;
      
      public var §1t5728s0§:§1t5059s0§;
      
      public var §1t5729s0§:TextField;
      
      public var §1t6659s0§:MovieClip;
      
      public function §1t5874s0§()
      {
         super();
         mouseEnabled = false;
         this.coins.mouseEnabled = false;
         this.coins.mouseChildren = false;
         this.gold.mouseEnabled = false;
         this.gold.mouseChildren = false;
         §1t1521s0§.§1t9290s0§(this.coins.§1t5971s0§,true);
         this.coins.§1t5971s0§.text = §1t1521s0§.getString(63);
         §1t1521s0§.§1t9290s0§(this.gold.§1t5056s0§,true);
         this.gold.§1t5056s0§.text = §1t1521s0§.getString(64);
         §1t1521s0§.§1t9290s0§(this.§1t5776s0§.§1t5775s0§,true);
         this.§1t5776s0§.§1t5775s0§.text = §1t1521s0§.getString(486);
         this.§1t5776s0§.§1t5775s0§.mouseEnabled = false;
         this.§1t5728s0§.§1t5769s0§(§1t1521s0§.getString(16));
         §1t1521s0§.§1t9290s0§(this.§1t5729s0§,true);
         this.§1t5729s0§.text = §1t1521s0§.getString(907);
         §1t1521s0§.§1t9290s0§(this.§1t6659s0§.words,true);
         this.§1t6659s0§.words.text = §1t1521s0§.getString(11164);
         this.§1t6659s0§.mouseEnabled = false;
         this.§1t5736s0§(false);
      }
      
      public function §1t6660s0§() : *
      {
         this.coins.coinstext.text = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9412s0§).toString();
         this.gold.goldtext.text = §1t1523s0§.§1t9613s0§().toString();
         this.§1t6659s0§.visible = this.gold.visible && this.§1t6661s0§();
      }
      
      internal function §1t6661s0§() : Boolean
      {
         return (§1t1523s0§.§1t9514s0§ == §1t1523s0§.§1t9468s0§ || §1t1523s0§.§1t9514s0§ == §1t1523s0§.§1t9469s0§) && §1t3317s0§.instance.§1t1847s0§() < §1t1523s0§.§1t9515s0§;
      }
      
      public function §1t6662s0§(param1:Boolean) : *
      {
         this.§1t6658s0§.visible = param1;
      }
      
      public function §1t6663s0§(param1:Boolean) : *
      {
         this.§1t5776s0§.visible = false;
      }
      
      public function §1t5736s0§(param1:Boolean) : *
      {
         this.§1t5728s0§.visible = param1;
         this.§1t5729s0§.visible = param1;
         this.gold.visible = !param1;
         this.§1t5776s0§.visible = !param1;
         this.§1t6659s0§.visible = false;
      }
   }
}

