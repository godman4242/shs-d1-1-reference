package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1418")]
   public class §1t5802s0§ extends MovieClip
   {
      
      public var §1t5803s0§:§1t5337s0§;
      
      public var §1t5804s0§:§1t5337s0§;
      
      public var §1t5805s0§:§1t5337s0§;
      
      public var cancelbutton:§1t5337s0§;
      
      public var coinimg:MovieClip;
      
      public var coinsText:TextField;
      
      public var msgText:TextField;
      
      public var §1t5808s0§:§1t5337s0§;
      
      public var submitbutton:§1t5334s0§;
      
      internal var coins:§1t98s0§ = new §1t98s0§();
      
      internal var §1t5809s0§:Boolean = false;
      
      internal var §1t2181s0§:Boolean = false;
      
      public function §1t5802s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.msgText);
         §1t1521s0§.§1t9290s0§(this.coinsText);
         this.§1t5805s0§.§1t5769s0§("+1");
         this.§1t5804s0§.§1t5769s0§("+10");
         this.§1t5803s0§.§1t5769s0§("+100");
         this.§1t5808s0§.§1t5769s0§(§1t1521s0§.getString(248));
         this.submitbutton.§1t5769s0§(§1t1521s0§.getString(228));
         this.cancelbutton.§1t5769s0§(§1t1521s0§.getString(17));
      }
      
      public function show(param1:Boolean, param2:Boolean = false) : void
      {
         this.§1t5809s0§ = param1;
         this.§1t2181s0§ = param2;
         if(this.§1t2181s0§)
         {
            this.submitbutton.§1t5769s0§(§1t1521s0§.getString(5));
            this.submitbutton.y = 240;
            this.cancelbutton.y = 275;
            this.msgText.text = §1t1521s0§.getString(63);
            this.§1t5808s0§.visible = false;
         }
         else
         {
            this.submitbutton.§1t5769s0§(§1t1521s0§.getString(228));
            this.submitbutton.y = 275;
            this.cancelbutton.y = 240;
            this.msgText.text = §1t1521s0§.getString(228) + " " + §1t406s0§.instance.§1t6499s0§.§1t6742s0§;
            this.§1t5808s0§.visible = true;
         }
         this.§1t5805s0§.addEventListener(MouseEvent.CLICK,this.§1t5810s0§);
         this.§1t5804s0§.addEventListener(MouseEvent.CLICK,this.§1t5811s0§);
         this.§1t5803s0§.addEventListener(MouseEvent.CLICK,this.§1t5812s0§);
         this.§1t5808s0§.addEventListener(MouseEvent.CLICK,this.§1t5814s0§);
         this.submitbutton.addEventListener(MouseEvent.CLICK,this.§1t5815s0§);
         this.cancelbutton.addEventListener(MouseEvent.CLICK,this.§1t5330s0§);
         this.§1t5805s0§.§1t5004s0§();
         this.§1t5804s0§.§1t5004s0§();
         this.§1t5803s0§.§1t5004s0§();
         this.§1t5808s0§.§1t5004s0§();
         this.submitbutton.§1t5004s0§();
         this.cancelbutton.§1t5004s0§();
         this.§1t5814s0§(null);
         this.visible = true;
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t5805s0§.removeEventListener(MouseEvent.CLICK,this.§1t5810s0§);
         this.§1t5804s0§.removeEventListener(MouseEvent.CLICK,this.§1t5811s0§);
         this.§1t5803s0§.removeEventListener(MouseEvent.CLICK,this.§1t5812s0§);
         this.§1t5808s0§.removeEventListener(MouseEvent.CLICK,this.§1t5814s0§);
         this.submitbutton.removeEventListener(MouseEvent.CLICK,this.§1t5815s0§);
         this.cancelbutton.removeEventListener(MouseEvent.CLICK,this.§1t5330s0§);
         this.§1t5805s0§.removeEventListeners();
         this.§1t5804s0§.removeEventListeners();
         this.§1t5803s0§.removeEventListeners();
         this.§1t5808s0§.removeEventListeners();
         this.submitbutton.removeEventListeners();
         this.cancelbutton.removeEventListeners();
      }
      
      internal function §1t5810s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(§1t1523s0§.§1t9616s0§() >= this.coins.§1t697s0§() + 1)
         {
            this.coins.§1t698s0§(1);
            this.coinsText.text = this.coins.toString();
         }
      }
      
      internal function §1t5811s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(§1t1523s0§.§1t9616s0§() >= this.coins.§1t697s0§() + 10)
         {
            this.coins.§1t698s0§(10);
            this.coinsText.text = this.coins.toString();
         }
      }
      
      internal function §1t5812s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(§1t1523s0§.§1t9616s0§() >= this.coins.§1t697s0§() + 100)
         {
            this.coins.§1t698s0§(100);
            this.coinsText.text = this.coins.toString();
         }
      }
      
      public function §1t5813s0§(param1:int) : *
      {
         this.coins.§1t695s0§(param1);
         this.coinsText.text = param1.toString();
      }
      
      internal function §1t5814s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
         }
         this.coins.§1t695s0§(0);
         this.coinsText.text = "0";
      }
      
      internal function §1t5815s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.removeEventListeners();
         this.visible = false;
         if(this.coins.§1t697s0§() == 0)
         {
            return;
         }
         if(this.§1t2181s0§)
         {
            §1t6477s0§.instance.§1t7687s0§(this.coins.§1t697s0§());
         }
         else
         {
            if(§1t1523s0§.§1t1981s0§ && !§1t1523s0§.§1t9519s0§)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(679),§1t1521s0§.getString(5));
               return;
            }
            §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9412s0§,-this.coins.§1t697s0§());
            §1t1523s0§.§1t1684s0§(60009,this.coins.§1t697s0§());
            §1t3317s0§.instance.§1t1887s0§(§1t406s0§.instance.§1t6499s0§.§1t6742s0§,§1t1523s0§.charname,"",this.coins.§1t697s0§(),this.§1t5809s0§);
            §1t406s0§.instance.§1t6499s0§.visible = true;
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(251) + §1t406s0§.instance.§1t6499s0§.§1t6742s0§ + " " + this.coins.§1t697s0§() + " " + §1t1521s0§.getString(63) + ".",§1t1521s0§.getString(5));
         }
      }
      
      internal function §1t5330s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         this.visible = false;
         §1t406s0§.instance.§1t6499s0§.visible = true;
      }
   }
}

