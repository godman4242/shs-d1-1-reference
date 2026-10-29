package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1085")]
   public class §1t6695s0§ extends MovieClip
   {
      
      public var §1t6757s0§:§1t5000s0§;
      
      public var errortext:TextField;
      
      public var §1t6758s0§:§1t5003s0§;
      
      public var §1t6759s0§:SimpleButton;
      
      public var prompt:TextField;
      
      public var superrewardsbutton:SimpleButton;
      
      public var trialpaybutton:SimpleButton;
      
      internal var state:int;
      
      internal var amt:int;
      
      internal var §1t6221s0§:§1t410s0§;
      
      internal var §1t6761s0§:String = "";
      
      internal var §1t6723s0§:int;
      
      public function §1t6695s0§()
      {
         super();
         stop();
         §1t1521s0§.§1t9290s0§(this.prompt,true);
         §1t1521s0§.§1t9290s0§(this.errortext);
         this.errortext.text = §1t1521s0§.getString(688);
      }
      
      public function show(param1:int, param2:§1t410s0§) : *
      {
         this.§1t5004s0§();
         visible = true;
         this.§1t6767s0§();
         this.amt = param1;
         this.§1t6221s0§ = param2;
         this.§1t6771s0§(null);
      }
      
      public function §1t6762s0§(param1:§1t410s0§) : *
      {
         this.§1t5004s0§();
         visible = true;
         this.§1t6767s0§();
         this.§1t6221s0§ = param1;
         this.§1t6768s0§();
         this.§1t6761s0§ = "FB";
      }
      
      public function §1t6763s0§(param1:§1t410s0§) : *
      {
         this.§1t5004s0§();
         visible = true;
         this.§1t6767s0§();
         this.§1t6221s0§ = param1;
         this.§1t6768s0§();
         this.§1t6761s0§ = "Y";
      }
      
      public function §1t6764s0§(param1:§1t410s0§) : *
      {
         this.§1t5004s0§();
         this.§1t6767s0§();
         this.§1t6221s0§ = param1;
         this.§1t6768s0§();
         this.§1t6761s0§ = "WF";
      }
      
      public function §1t6765s0§(param1:§1t410s0§) : *
      {
         this.§1t5004s0§();
         this.§1t6767s0§();
         this.§1t6221s0§ = param1;
         this.§1t6768s0§();
         this.§1t6761s0§ = "KONG";
      }
      
      public function §1t6766s0§(param1:§1t410s0§) : *
      {
         this.§1t5004s0§();
         this.§1t6767s0§();
         this.§1t6221s0§ = param1;
         this.§1t6768s0§();
         if(§1t1523s0§.§1t9526s0§)
         {
            this.§1t6761s0§ = "AND";
         }
         else if(§1t1523s0§.§1t9527s0§)
         {
            this.§1t6761s0§ = "IOS";
         }
      }
      
      internal function hide() : *
      {
         this.removeEventListeners();
         visible = false;
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t6757s0§.addEventListener(MouseEvent.CLICK,this.§1t6769s0§);
         this.§1t6757s0§.§1t5004s0§();
         this.§1t6758s0§.addEventListener(MouseEvent.CLICK,this.§1t5900s0§);
         this.§1t6758s0§.§1t5004s0§();
         this.§1t6759s0§.addEventListener(MouseEvent.CLICK,this.§1t6771s0§);
         this.superrewardsbutton.addEventListener(MouseEvent.CLICK,this.§1t6717s0§);
         this.trialpaybutton.addEventListener(MouseEvent.CLICK,this.§1t6718s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t6757s0§.removeEventListener(MouseEvent.CLICK,this.§1t6769s0§);
         this.§1t6757s0§.removeEventListeners();
         this.§1t6758s0§.removeEventListener(MouseEvent.CLICK,this.§1t5900s0§);
         this.§1t6758s0§.removeEventListeners();
         this.§1t6759s0§.removeEventListener(MouseEvent.CLICK,this.§1t6771s0§);
         this.superrewardsbutton.removeEventListener(MouseEvent.CLICK,this.§1t6717s0§);
         this.trialpaybutton.removeEventListener(MouseEvent.CLICK,this.§1t6718s0§);
      }
      
      internal function §1t6767s0§() : *
      {
         gotoAndStop(1);
         this.state = 1;
         this.prompt.text = §1t1521s0§.getString(689);
         this.§1t6757s0§.§1t5769s0§(§1t1521s0§.getString(9));
         this.errortext.visible = false;
         this.§1t6758s0§.visible = false;
         this.§1t6759s0§.visible = true;
         this.superrewardsbutton.visible = true;
         this.trialpaybutton.visible = true;
      }
      
      internal function §1t6768s0§() : *
      {
         gotoAndStop(2);
         this.state = 2;
         this.prompt.text = §1t1521s0§.getString(690);
         this.§1t6758s0§.§1t5769s0§(§1t1521s0§.getString(486));
         this.§1t6757s0§.§1t5769s0§(§1t1521s0§.getString(17));
         this.errortext.visible = false;
         this.§1t6758s0§.visible = true;
         this.§1t6759s0§.visible = false;
         this.superrewardsbutton.visible = false;
         this.trialpaybutton.visible = false;
         this.§1t6723s0§ = §1t3318s0§.instance.client.§1t737s0§.coins;
      }
      
      internal function §1t6769s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.hide();
      }
      
      internal function §1t5900s0§(param1:MouseEvent) : *
      {
         if(this.state == 1)
         {
            return;
         }
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
         }
         §1t3318s0§.instance.client.§1t737s0§.§1t4235s0§(this.§1t6770s0§);
      }
      
      internal function §1t6770s0§() : *
      {
         var _loc1_:int = §1t3318s0§.instance.client.§1t737s0§.coins;
         if(_loc1_ > this.§1t6723s0§)
         {
            this.hide();
            this.§1t6221s0§.§1t6710s0§();
            this.§1t6221s0§.§1t1023s0§();
            §1t406s0§.instance.§1t6502s0§.§1t5847s0§(_loc1_ - this.§1t6723s0§);
            §1t406s0§.instance.§1t6502s0§.§1t5849s0§(§1t1521s0§.getString(86));
            §1t406s0§.instance.§1t6502s0§.show();
            §1t1523s0§.§1t9393s0§.§1t698s0§(1);
            §1t1523s0§.§1t9394s0§.§1t698s0§(_loc1_ - this.§1t6723s0§);
            §1t251s0§.instance.§1t3560s0§(_loc1_ - this.§1t6723s0§);
            §1t3317s0§.instance.§1t1985s0§(_loc1_ - this.§1t6723s0§,this.§1t6761s0§);
         }
         else if(this.state == 2)
         {
            this.errortext.visible = true;
         }
      }
      
      internal function §1t6771s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = "http://api.playerio.com/payvault/paypal/coinsredirect?gameid=" + §1t3318s0§.instance.§1t3323s0§ + "&connectuserid=" + §1t3317s0§.instance.§1t1836s0§ + "&connection=public&coinamount=" + this.amt.toString() + "&currency=USD&item_name=" + this.amt.toString() + " Gold for Straw Hat Samurai Duels";
         §1t3317s0§.instance.§1t2012s0§(_loc2_);
         this.§1t6768s0§();
         this.§1t6761s0§ = "PIOPP";
      }
      
      internal function §1t6717s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = "http://api.playerio.com/payvault/superrewards/coinsredirect?gameid=" + §1t3318s0§.instance.§1t3323s0§ + "&connectuserid=" + §1t3317s0§.instance.§1t1836s0§ + "&connection=public";
         §1t3317s0§.instance.§1t2012s0§(_loc2_);
         this.§1t6768s0§();
         this.§1t6761s0§ = "PIOSR";
      }
      
      internal function §1t6718s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = "http://api.playerio.com/payvault/trialpay/coinsredirect?gameid=" + §1t3318s0§.instance.§1t3323s0§ + "&connectuserid=" + §1t3317s0§.instance.§1t1836s0§ + "&connection=public";
         §1t3317s0§.instance.§1t2012s0§(_loc2_);
         this.§1t6768s0§();
         this.§1t6761s0§ = "PIOTP";
      }
   }
}

