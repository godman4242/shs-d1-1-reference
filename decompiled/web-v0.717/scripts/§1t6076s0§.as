package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1195")]
   public class §1t6076s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var line1:TextField;
      
      public var line2:TextField;
      
      public var §1t6079s0§:TextField;
      
      public var §1t6080s0§:TextField;
      
      public var statText:TextField;
      
      public var statlabel:TextField;
      
      public var xpText:TextField;
      
      public var §1t6084s0§:TextField;
      
      internal var §1t6085s0§:MovieClip;
      
      public function §1t6076s0§()
      {
         super();
         this.button.§1t5769s0§(§1t1521s0§.getString(5));
         §1t1521s0§.§1t9290s0§(this.line1,true);
         §1t1521s0§.§1t9290s0§(this.line2,true);
         §1t1521s0§.§1t9290s0§(this.statlabel,true);
         §1t1521s0§.§1t9290s0§(this.§1t6080s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t6084s0§,true);
      }
      
      public function §1t6086s0§(param1:MovieClip) : *
      {
         this.§1t6085s0§ = param1;
      }
      
      public function show(param1:int, param2:int, param3:int) : *
      {
         this.line1.text = §1t1521s0§.getString(133);
         this.line2.text = §1t1521s0§.getString(120) + " " + param1;
         this.statlabel.text = §1t1521s0§.getString(134);
         this.§1t6080s0§.text = §1t1521s0§.getString(135);
         this.§1t6084s0§.text = §1t1521s0§.getString(136);
         this.statText.text = "+" + param3 * 3;
         this.§1t6079s0§.text = "+" + param3 * 1;
         this.xpText.text = param2 + " " + §1t1521s0§.getString(119);
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.§1t5004s0§();
         this.visible = true;
         §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11353s0§);
      }
      
      public function §1t5484s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.removeEventListeners();
         this.visible = false;
         if(this.§1t6085s0§ != null)
         {
            this.§1t6085s0§.visible = true;
         }
      }
   }
}

