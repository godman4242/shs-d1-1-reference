package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1133")]
   public class §1t410s0§ extends MovieClip
   {
      
      public var bestdealtext:TextField;
      
      public var bg:§1t5016s0§;
      
      public var buy0:§1t5368s0§;
      
      public var buy1:§1t5368s0§;
      
      public var buy2:§1t5368s0§;
      
      public var buy3:§1t5368s0§;
      
      public var buy4:§1t5368s0§;
      
      public var §1t6671s0§:SimpleButton;
      
      public var discounttext:TextField;
      
      public var expirestext:TextField;
      
      public var §1t6674s0§:§1t5000s0§;
      
      public var fbicon0:MovieClip;
      
      public var fbicon1:MovieClip;
      
      public var fbicon2:MovieClip;
      
      public var fbicon3:MovieClip;
      
      public var fbicon4:MovieClip;
      
      public var §1t6680s0§:TextField;
      
      public var §1t5056s0§:TextField;
      
      public var goldtext0:TextField;
      
      public var goldtext1:TextField;
      
      public var goldtext2:TextField;
      
      public var goldtext3:TextField;
      
      public var goldtext4:TextField;
      
      public var §1t5057s0§:TextField;
      
      public var infolabel:TextField;
      
      public var kredmobilebutton:§1t5000s0§;
      
      public var §1t6688s0§:§1t5000s0§;
      
      public var loading:MovieClip;
      
      public var oldpricetext0:MovieClip;
      
      public var oldpricetext1:MovieClip;
      
      public var oldpricetext2:MovieClip;
      
      public var oldpricetext3:MovieClip;
      
      public var oldpricetext4:MovieClip;
      
      public var §1t6694s0§:§1t6695s0§;
      
      public var populartext:TextField;
      
      public var pricetext0:TextField;
      
      public var pricetext1:TextField;
      
      public var pricetext2:TextField;
      
      public var pricetext3:TextField;
      
      public var pricetext4:TextField;
      
      public var §1t6702s0§:§1t6703s0§;
      
      public var §1t6659s0§:MovieClip;
      
      public var superrewardsbutton:SimpleButton;
      
      public var §1t5021s0§:TextField;
      
      public var trialpaybutton:SimpleButton;
      
      public var wishlistbutton:§1t6088s0§;
      
      internal var §1t6707s0§:Boolean = false;
      
      internal var discount:int;
      
      internal var §1t6709s0§:int;
      
      internal var §1t6723s0§:int;
      
      public function §1t410s0§()
      {
         super();
         this.§1t5021s0§.text = §1t1521s0§.getString(486);
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(64);
         §1t1521s0§.§1t9290s0§(this.§1t6659s0§.words,true);
         this.§1t6659s0§.words.text = §1t1521s0§.getString(11164);
         this.§1t6659s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t6680s0§,true);
         this.§1t6702s0§.§1t5769s0§(§1t1521s0§.getString(621));
         this.§1t6702s0§.§1t5041s0§(§1t1523s0§.§1t9478s0§);
         §1t1521s0§.§1t9290s0§(this.infolabel);
         this.infolabel.text = §1t1521s0§.getString(993);
         this.wishlistbutton.§1t5769s0§(§1t1521s0§.getString(11073));
         this.buy0.§1t5769s0§(§1t1521s0§.getString(83));
         this.buy1.§1t5769s0§(§1t1521s0§.getString(83));
         this.buy2.§1t5769s0§(§1t1521s0§.getString(83));
         this.buy3.§1t5769s0§(§1t1521s0§.getString(83));
         this.buy4.§1t5769s0§(§1t1521s0§.getString(83));
         this.bestdealtext.text = §1t1521s0§.getString(487);
         this.populartext.text = §1t1521s0§.getString(533);
         this.discounttext.text = "";
         this.goldtext0.text = 50 + " " + §1t1521s0§.getString(64);
         this.goldtext1.text = 125 + " " + §1t1521s0§.getString(64);
         this.goldtext2.text = 200 + " " + §1t1521s0§.getString(64);
         this.goldtext3.text = 275 + " " + §1t1521s0§.getString(64);
         this.goldtext4.text = 400 + " " + §1t1521s0§.getString(64);
         this.pricetext0.text = "";
         this.pricetext1.text = "";
         this.pricetext2.text = "";
         this.pricetext3.text = "";
         this.pricetext4.text = "";
         this.oldpricetext0.pricetext.text = "50";
         this.oldpricetext1.pricetext.text = "125";
         this.oldpricetext2.pricetext.text = "200";
         this.oldpricetext3.pricetext.text = "275";
         this.oldpricetext4.pricetext.text = "400";
         this.fbicon0.visible = false;
         this.fbicon1.visible = false;
         this.fbicon2.visible = false;
         this.fbicon3.visible = false;
         this.fbicon4.visible = false;
         this.§1t6674s0§.visible = false;
         this.§1t6688s0§.visible = false;
         this.kredmobilebutton.visible = false;
         this.oldpricetext0.visible = false;
         this.oldpricetext1.visible = false;
         this.oldpricetext2.visible = false;
         this.oldpricetext3.visible = false;
         this.oldpricetext4.visible = false;
         this.expirestext.visible = false;
         this.expirestext.text = "";
         this.visible = false;
         this.discounttext.visible = false;
         this.expirestext.visible = false;
         this.§1t6659s0§.visible = false;
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.§1t9190s0§().§1t1789s0§();
         }
      }
      
      public function show() : *
      {
         this.§1t5004s0§();
         this.visible = true;
         §1t1525s0§.§1t9940s0§().visible = false;
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
         this.§1t6702s0§.§1t5041s0§(§1t1523s0§.§1t9478s0§);
         this.loading.visible = false;
         this.expirestext.visible = false;
         this.§1t6680s0§.visible = false;
         this.§1t1023s0§();
         this.§1t6694s0§.visible = false;
         if(!§1t1523s0§.§1t9503s0§)
         {
            this.§1t6680s0§.visible = false;
            this.superrewardsbutton.visible = false;
            this.trialpaybutton.visible = false;
         }
         if(§1t1523s0§.§1t9521s0§)
         {
            this.§1t6674s0§.x = 564.4;
            this.§1t6674s0§.y = 128.05;
            this.§1t6674s0§.visible = true;
            this.§1t6674s0§.§1t5769s0§("Get more Kreds");
            this.superrewardsbutton.visible = false;
            this.trialpaybutton.visible = false;
            this.kredmobilebutton.visible = true;
            this.kredmobilebutton.§1t5769s0§("Use Mobile");
            this.§1t6688s0§.visible = true;
            this.§1t6688s0§.§1t5769s0§("Free Kreds");
            this.§1t6680s0§.text = "Not enough Kreds?\n\n\n\n\n\n\n\n\n\n\nYou can also get Kreds for free(!!!) by completing surveys and other offers";
         }
         else if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9277s0§ || §1t1521s0§.getLanguage() == §1t1521s0§.§1t9279s0§)
         {
            this.superrewardsbutton.y = 218 + 35;
            this.trialpaybutton.y = 288 + 35;
         }
      }
      
      internal function §1t1023s0§() : *
      {
         this.§1t6702s0§.visible = §1t1523s0§.§1t9393s0§.§1t697s0§() > 0;
         this.discounttext.visible = false;
         this.discounttext.text = "";
         this.expirestext.visible = false;
         this.§1t6680s0§.visible = true;
         if(§1t1523s0§.§1t9514s0§ == §1t1523s0§.§1t9468s0§)
         {
            this.§1t6711s0§(20,§1t1523s0§.§1t9515s0§);
         }
         else if(§1t1523s0§.§1t9514s0§ == §1t1523s0§.§1t9469s0§)
         {
            this.§1t6711s0§(50,§1t1523s0§.§1t9515s0§);
         }
         else
         {
            this.§1t6711s0§(0,0);
         }
         if(§1t1523s0§.§1t9521s0§)
         {
            this.§1t6680s0§.text = "not enough kreds?\n\n\n\n\n\n\n\n\n\n\nyou can also get kreds for free(!!!) by completing surveys and other offers";
         }
         else
         {
            this.§1t6680s0§.text = §1t1521s0§.getString(532);
         }
      }
      
      public function §1t6710s0§() : *
      {
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
      }
      
      internal function §1t6711s0§(param1:int, param2:int) : *
      {
         this.§1t6707s0§ = true;
         this.discount = param1;
         this.§1t6709s0§ = param2;
         if(param2 < §1t3317s0§.instance.§1t1847s0§())
         {
            this.discount = 0;
         }
         if(this.discount == 20)
         {
            this.discounttext.text = §1t1521s0§.getString(11163,["20"]);
            this.discounttext.visible = true;
            this.expirestext.visible = true;
            this.§1t6659s0§.visible = true;
            this.oldpricetext0.visible = true;
            this.oldpricetext1.visible = true;
            this.oldpricetext2.visible = true;
            this.oldpricetext3.visible = true;
            this.oldpricetext4.visible = true;
            this.goldtext0.x = 255;
            this.goldtext1.x = 255;
            this.goldtext2.x = 255;
            this.goldtext3.x = 255;
            this.goldtext4.x = 255;
            this.goldtext0.text = 60 + " " + §1t1521s0§.getString(64);
            this.goldtext1.text = 150 + " " + §1t1521s0§.getString(64);
            this.goldtext2.text = 240 + " " + §1t1521s0§.getString(64);
            this.goldtext3.text = 330 + " " + §1t1521s0§.getString(64);
            this.goldtext4.text = 480 + " " + §1t1521s0§.getString(64);
         }
         if(this.discount == 50)
         {
            this.discounttext.text = §1t1521s0§.getString(11163,["50"]);
            this.discounttext.visible = true;
            this.expirestext.visible = true;
            this.§1t6659s0§.visible = true;
            this.oldpricetext0.visible = true;
            this.oldpricetext1.visible = true;
            this.oldpricetext2.visible = true;
            this.oldpricetext3.visible = true;
            this.oldpricetext4.visible = true;
            this.goldtext0.x = 255;
            this.goldtext1.x = 255;
            this.goldtext2.x = 255;
            this.goldtext3.x = 255;
            this.goldtext4.x = 255;
            this.goldtext0.text = 75 + " " + §1t1521s0§.getString(64);
            this.goldtext1.text = 188 + " " + §1t1521s0§.getString(64);
            this.goldtext2.text = 300 + " " + §1t1521s0§.getString(64);
            this.goldtext3.text = 413 + " " + §1t1521s0§.getString(64);
            this.goldtext4.text = 600 + " " + §1t1521s0§.getString(64);
         }
         else if(this.discount == 0)
         {
            this.goldtext0.x = 221;
            this.goldtext1.x = 221;
            this.goldtext2.x = 221;
            this.goldtext3.x = 221;
            this.goldtext4.x = 221;
            this.oldpricetext0.visible = false;
            this.oldpricetext1.visible = false;
            this.oldpricetext2.visible = false;
            this.oldpricetext3.visible = false;
            this.oldpricetext4.visible = false;
            this.discounttext.visible = false;
            this.expirestext.visible = false;
            this.§1t6659s0§.visible = false;
            this.goldtext0.text = 50 + " " + §1t1521s0§.getString(64);
            this.goldtext1.text = 125 + " " + §1t1521s0§.getString(64);
            this.goldtext2.text = 200 + " " + §1t1521s0§.getString(64);
            this.goldtext3.text = 275 + " " + §1t1521s0§.getString(64);
            this.goldtext4.text = 400 + " " + §1t1521s0§.getString(64);
         }
         if(§1t1523s0§.§1t9521s0§)
         {
            this.pricetext0.text = "50 KREDS";
            this.pricetext1.text = "100 KREDS";
            this.pricetext2.text = "150 KREDS";
            this.pricetext3.text = "200 KREDS";
            this.pricetext4.text = "250 KREDS";
         }
         else
         {
            this.pricetext0.text = "4.99 USD";
            this.pricetext1.text = "9.99 USD";
            this.pricetext2.text = "14.99 USD";
            this.pricetext3.text = "19.99 USD";
            this.pricetext4.text = "24.99 USD";
         }
      }
      
      internal function §1t937s0§(param1:int) : String
      {
         var _loc2_:int = Math.floor(param1 / (60 * 60));
         var _loc3_:int = param1 % (60 * 60);
         var _loc4_:int = Math.floor(_loc3_ / 60);
         var _loc5_:int = _loc3_ % 60;
         var _loc6_:int = Math.ceil(_loc5_);
         var _loc7_:String = _loc6_.toString();
         if(_loc6_ < 10)
         {
            _loc7_ = "0" + _loc7_;
         }
         var _loc8_:String = _loc4_.toString();
         if(_loc4_ < 10)
         {
            _loc8_ = "0" + _loc8_;
         }
         return _loc2_ + ":" + _loc8_ + ":" + _loc7_;
      }
      
      public function update(param1:int) : *
      {
         if(visible && this.expirestext.visible)
         {
            this.expirestext.text = §1t1521s0§.getString(489,[this.§1t937s0§(this.§1t6709s0§ - param1)]);
            if(param1 > this.§1t6709s0§)
            {
               this.§1t6711s0§(0,0);
            }
         }
      }
      
      public function §1t5004s0§() : *
      {
         this.buy0.addEventListener(MouseEvent.CLICK,this.§1t6712s0§);
         this.buy1.addEventListener(MouseEvent.CLICK,this.§1t6713s0§);
         this.buy2.addEventListener(MouseEvent.CLICK,this.§1t6714s0§);
         this.buy3.addEventListener(MouseEvent.CLICK,this.§1t6715s0§);
         this.buy4.addEventListener(MouseEvent.CLICK,this.§1t6716s0§);
         this.buy0.§1t5004s0§();
         this.buy1.§1t5004s0§();
         this.buy2.§1t5004s0§();
         this.buy3.§1t5004s0§();
         this.buy4.§1t5004s0§();
         this.§1t6674s0§.addEventListener(MouseEvent.CLICK,this.§1t6725s0§);
         this.§1t6674s0§.§1t5004s0§();
         this.§1t6688s0§.addEventListener(MouseEvent.CLICK,this.§1t6726s0§);
         this.§1t6688s0§.§1t5004s0§();
         this.kredmobilebutton.addEventListener(MouseEvent.CLICK,this.§1t6727s0§);
         this.kredmobilebutton.§1t5004s0§();
         this.§1t6671s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t6702s0§.addEventListener(MouseEvent.CLICK,this.§1t6720s0§);
         this.superrewardsbutton.addEventListener(MouseEvent.CLICK,this.§1t6717s0§);
         this.trialpaybutton.addEventListener(MouseEvent.CLICK,this.§1t6718s0§);
         this.bg.addChild(§1t406s0§.instance.§1t6523s0§);
         this.wishlistbutton.addEventListener(MouseEvent.CLICK,this.§1t6721s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.buy0.removeEventListener(MouseEvent.CLICK,this.§1t6712s0§);
         this.buy1.removeEventListener(MouseEvent.CLICK,this.§1t6713s0§);
         this.buy2.removeEventListener(MouseEvent.CLICK,this.§1t6714s0§);
         this.buy3.removeEventListener(MouseEvent.CLICK,this.§1t6715s0§);
         this.buy4.removeEventListener(MouseEvent.CLICK,this.§1t6716s0§);
         this.buy0.removeEventListeners();
         this.buy1.removeEventListeners();
         this.buy2.removeEventListeners();
         this.buy3.removeEventListeners();
         this.buy4.removeEventListeners();
         this.§1t6674s0§.removeEventListener(MouseEvent.CLICK,this.§1t6725s0§);
         this.§1t6674s0§.removeEventListeners();
         this.§1t6688s0§.removeEventListener(MouseEvent.CLICK,this.§1t6726s0§);
         this.§1t6688s0§.removeEventListeners();
         this.kredmobilebutton.removeEventListener(MouseEvent.CLICK,this.§1t6727s0§);
         this.kredmobilebutton.removeEventListeners();
         this.§1t6671s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t6702s0§.removeEventListener(MouseEvent.CLICK,this.§1t6720s0§);
         this.superrewardsbutton.removeEventListener(MouseEvent.CLICK,this.§1t6717s0§);
         this.trialpaybutton.removeEventListener(MouseEvent.CLICK,this.§1t6718s0§);
         this.wishlistbutton.removeEventListener(MouseEvent.CLICK,this.§1t6721s0§);
      }
      
      internal function §1t6712s0§(param1:MouseEvent) : *
      {
         this.buy(0);
      }
      
      internal function §1t6713s0§(param1:MouseEvent) : *
      {
         this.buy(1);
      }
      
      internal function §1t6714s0§(param1:MouseEvent) : *
      {
         this.buy(2);
      }
      
      internal function §1t6715s0§(param1:MouseEvent) : *
      {
         this.buy(3);
      }
      
      internal function §1t6716s0§(param1:MouseEvent) : *
      {
         this.buy(4);
      }
      
      internal function buy(param1:int) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         var _loc2_:String = "";
         if(this.discount == 50)
         {
            _loc2_ = "50off";
         }
         else if(this.discount == 20)
         {
            _loc2_ = "20off";
         }
         §1t1540s0§.§1t10018s0§();
         var _loc3_:int = 0;
         switch(param1)
         {
            case 0:
               if(this.discount == 0)
               {
                  _loc3_ = 50;
               }
               else if(this.discount == 20)
               {
                  _loc3_ = 60;
               }
               else if(this.discount == 50)
               {
                  _loc3_ = 75;
               }
               break;
            case 1:
               if(this.discount == 0)
               {
                  _loc3_ = 125;
               }
               else if(this.discount == 20)
               {
                  _loc3_ = 150;
               }
               else if(this.discount == 50)
               {
                  _loc3_ = 188;
               }
               break;
            case 2:
               if(this.discount == 0)
               {
                  _loc3_ = 200;
               }
               else if(this.discount == 20)
               {
                  _loc3_ = 240;
               }
               else if(this.discount == 50)
               {
                  _loc3_ = 300;
               }
               break;
            case 3:
               if(this.discount == 0)
               {
                  _loc3_ = 275;
               }
               else if(this.discount == 20)
               {
                  _loc3_ = 330;
               }
               else if(this.discount == 50)
               {
                  _loc3_ = 413;
               }
               break;
            case 4:
               if(this.discount == 0)
               {
                  _loc3_ = 400;
               }
               else if(this.discount == 20)
               {
                  _loc3_ = 480;
               }
               else if(this.discount == 50)
               {
                  _loc3_ = 600;
               }
         }
         if(§1t1523s0§.isFacebook() && §1t3318s0§.instance.§1t3327s0§)
         {
            this.§1t6694s0§.§1t6762s0§(this);
            §1t3318s0§.instance.§1t3407s0§(_loc3_);
         }
         else if(§1t1523s0§.§1t9521s0§)
         {
            this.§1t6694s0§.§1t6765s0§(this);
            §1t1676s0§.instance.§1t1682s0§(_loc3_,this.§1t6719s0§);
         }
         else if(§1t1523s0§.§1t9523s0§)
         {
            this.§1t6694s0§.§1t6763s0§(this);
            §1t3318s0§.instance.§1t3406s0§(_loc3_);
         }
         else if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.§1t9190s0§().§1t1790s0§(param1);
         }
         else if(§1t1523s0§.§1t9503s0§)
         {
            this.§1t6694s0§.show(_loc3_,this);
         }
         else
         {
            §1t1786s0§.setPaymentCallback(this.§1t6722s0§);
            this.loading.visible = true;
            §1t1786s0§.requestPurchase(_loc3_ + "G" + _loc2_,§1t1523s0§.id);
         }
      }
      
      internal function §1t6717s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t6694s0§.show(10,this);
         this.§1t6694s0§.§1t6717s0§(null);
      }
      
      internal function §1t6718s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t6694s0§.show(10,this);
         this.§1t6694s0§.§1t6718s0§(null);
      }
      
      internal function §1t6719s0§(param1:Object) : *
      {
         if(param1.success)
         {
            this.§1t6694s0§.§1t5900s0§(null);
         }
      }
      
      internal function §1t6720s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t6702s0§.§1t5042s0§();
         §1t1523s0§.§1t9534s0§();
      }
      
      internal function §1t6721s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t3317s0§.instance.§1t2015s0§();
      }
      
      public function §1t5026s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
         }
         this.removeEventListeners();
         this.visible = false;
         if(!§1t406s0§.instance.§1t6509s0§.visible)
         {
            §1t1525s0§.§1t9940s0§().visible = true;
         }
         if(§1t1540s0§.§1t9982s0§ != §1t1540s0§.§1t9992s0§ && !§1t406s0§.instance.§1t5947s0§.visible && !§1t406s0§.instance.§1t6503s0§.visible && !§1t406s0§.instance.§1t6518s0§.visible && !§1t406s0§.instance.§1t6509s0§.visible && !§1t406s0§.instance.§1t6471s0§.visible && (§1t126s0§.instance == null || !§1t126s0§.instance.§1t1700s0§()))
         {
            §1t1541s0§.§1t10045s0§();
            §1t251s0§.instance.§1t3532s0§(false);
            §1t406s0§.instance.§1t6610s0§();
         }
         else if(§1t406s0§.instance.§1t6518s0§.visible)
         {
            §1t406s0§.instance.§1t6518s0§.§1t5047s0§.addChild(§1t406s0§.instance.§1t6523s0§);
         }
         else if(§1t406s0§.instance.§1t6471s0§.visible)
         {
            §1t406s0§.instance.§1t6471s0§.bg.addChild(§1t406s0§.instance.§1t6523s0§);
         }
         else if(§1t406s0§.instance.§1t6470s0§.visible)
         {
            §1t406s0§.instance.§1t6470s0§.§1t5047s0§.addChild(§1t406s0§.instance.§1t6523s0§);
         }
         else if(§1t406s0§.instance.§1t6469s0§.visible)
         {
            §1t406s0§.instance.§1t6469s0§.§1t5047s0§.addChild(§1t406s0§.instance.§1t6523s0§);
         }
      }
      
      internal function §1t6722s0§(param1:String, param2:String) : void
      {
         if(param1 == §1t1786s0§.§1t11413s0§)
         {
            §1t3317s0§.instance.§1t1891s0§();
            §1t251s0§.instance.§1t3560s0§(1);
            this.§1t1023s0§();
         }
         else if(param1 != §1t1786s0§.§1t11415s0§)
         {
            if(param1 == §1t1786s0§.§1t11417s0§)
            {
            }
         }
         this.loading.visible = false;
      }
      
      public function §1t6724s0§(param1:String, param2:String = "") : *
      {
         if(param1 != §1t1798s0§.§1t11413s0§)
         {
            if(param1 == §1t1798s0§.§1t11415s0§)
            {
               this.§1t6694s0§.hide();
            }
            else if(param1 == §1t1798s0§.§1t11417s0§)
            {
               if(param2 != "initiated")
               {
                  this.§1t6694s0§.hide();
               }
            }
         }
      }
      
      internal function §1t6725s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(§1t1523s0§.§1t9521s0§)
         {
            §1t1676s0§.instance.§1t1683s0§();
         }
         else
         {
            §1t1798s0§.§1t6725s0§();
         }
      }
      
      internal function §1t6726s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t1676s0§.instance.§1t1683s0§("offers");
      }
      
      internal function §1t6727s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t1676s0§.instance.§1t1683s0§("mobile");
      }
      
      public function §1t6728s0§(param1:String, param2:String = "") : *
      {
         if(param1 != "success")
         {
            if(param1 == "failed")
            {
               this.§1t6694s0§.hide();
            }
            else if(param1 == "cancelled")
            {
               this.§1t6694s0§.hide();
            }
         }
      }
   }
}

