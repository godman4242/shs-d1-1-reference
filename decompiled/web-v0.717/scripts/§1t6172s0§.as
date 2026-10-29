package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1185")]
   public class §1t6172s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var coinimg:MovieClip;
      
      public var coinsText:TextField;
      
      public var §1t5054s0§:TextField;
      
      public var goldimg:MovieClip;
      
      public var §1t472s0§:TextField;
      
      public var registertext:TextField;
      
      public var §1t5028s0§:§1t4912s0§;
      
      public var §1t5027s0§:§1t4912s0§;
      
      public var sellbutton:§1t5000s0§;
      
      public var slot0:§1t394s0§;
      
      public var slot1:§1t394s0§;
      
      public var slot2:§1t394s0§;
      
      public var slot3:§1t394s0§;
      
      public var titleText:TextField;
      
      public var xpText:TextField;
      
      public var xpimg:TextField;
      
      internal var §1t5834s0§:Vector.<§1t17s0§> = new Vector.<§1t17s0§>();
      
      internal var §1t6175s0§:§1t98s0§ = new §1t98s0§();
      
      internal var §1t6176s0§:§1t98s0§ = new §1t98s0§();
      
      internal var §1t5835s0§:§1t98s0§ = new §1t98s0§();
      
      internal var §1t5836s0§:§1t98s0§ = new §1t98s0§();
      
      internal var §1t5089s0§:int;
      
      internal var §1t5088s0§:int;
      
      internal var §1t5102s0§:int = 4;
      
      internal var §1t5103s0§:int = 1;
      
      internal var §1t5023s0§:int = this.§1t5102s0§ * this.§1t5103s0§;
      
      internal var slots:Vector.<§1t394s0§> = new Vector.<§1t394s0§>(4);
      
      internal var §1t6177s0§:Boolean = true;
      
      internal var §1t5478s0§:Boolean = false;
      
      internal var §1t6178s0§:Boolean = false;
      
      internal var §1t6179s0§:Boolean = false;
      
      internal var §1t6187s0§:Array = [13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13120,13121,13122,13123,13124,13125,13126,13127,13128,13129,13200,13201,13202,13203,13204,13205,13206,13207,13208];
      
      internal var §1t6188s0§:Array = [13130,13131,13133,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13209,13210,13211,13212,13213,13214,13215,13216];
      
      internal var §1t6189s0§:Array = [13156,13157,13159,13160,13161,13162,13163,13164,13165,13166,13167,13168,13169,13170,13171,13172,13173,13174,13175,13176,13177,13178,13179,13180,13181,13217,13218,13219,13223,13224,13225,13226,13227];
      
      internal var §1t1571s0§:Array = [2103,2104,2105,2106,2107,2108,3000,3001,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13010,13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13120,13121,13122,13123,13124,13125,13126,13127,13128,13129,13200,13201,13202,13203,13204,13205,13206,13207,13208,4059,4060,4062,4077,11040,20054,20055];
      
      internal var §1t1572s0§:Array = [2103,2104,2105,2106,2107,2108,3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13130,13131,13133,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13209,13210,13211,13212,13213,13214,13215,13216,4059,4060,4062,4077,11040,20054,20055,20056];
      
      internal var §1t1573s0§:Array = [2103,2104,2105,2106,2107,2108,3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13156,13157,13159,13160,13161,13162,13163,13164,13165,13166,13167,13168,13169,13170,13171,13172,13173,13174,13175,13176,13177,13178,13179,13180,13181,13217,13218,13219,13223,13224,13225,13226,13227,4059,4060,4062,4077,11040,20054,20055,20056,20057];
      
      internal var §1t6190s0§:Array = [3000,3001,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13010,13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13120,13121,13122,13123,13124,13125,13126,13127,13128,13129,13200,13201,13202,13203,13204,13205,13206,13207,13208,4059,4060,4062,4077,11040];
      
      internal var §1t6191s0§:Array = [3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13130,13131,13133,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13209,13210,13211,13212,13213,13214,13215,13216,4059,4060,4062,4077,11040];
      
      internal var §1t6192s0§:Array = [3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13156,13157,13159,13160,13161,13162,13163,13164,13165,13166,13167,13168,13169,13170,13171,13172,13173,13174,13175,13176,13177,13178,13179,13180,13181,13217,13218,13219,13223,13224,13225,13226,13227,4059,4060,4062,4077,11040];
      
      internal var §1t6193s0§:Array = [2103,2104,2106,2107,20054,20055];
      
      public function §1t6172s0§()
      {
         super();
         this.slots[0] = this.slot0;
         this.slots[1] = this.slot1;
         this.slots[2] = this.slot2;
         this.slots[3] = this.slot3;
         this.slots.fixed = true;
         this.button.§1t5769s0§(§1t1521s0§.getString(5));
         this.sellbutton.§1t5769s0§(§1t1521s0§.getString(881));
         §1t1521s0§.§1t9290s0§(this.titleText,true);
         §1t1521s0§.§1t9290s0§(this.§1t472s0§,true);
         §1t1521s0§.§1t9290s0§(this.registertext,true);
         this.registertext.text = §1t1521s0§.getString(912);
      }
      
      internal function §1t5839s0§() : *
      {
         var _loc1_:* = 0;
         while(_loc1_ < 4)
         {
            this.slots[_loc1_].x = 270.45 + _loc1_ * 60;
            _loc1_++;
         }
      }
      
      internal function §1t5840s0§() : *
      {
         var _loc1_:int = 0;
         this.§1t5839s0§();
         if(this.§1t5835s0§.§1t697s0§() > 0 || this.§1t5836s0§.§1t697s0§() > 0)
         {
            if(this.§1t6175s0§.§1t697s0§() > 0)
            {
               this.coinimg.y = 163.2;
               this.coinsText.y = 164.3;
               this.xpimg.y = 191.3;
               this.xpText.y = 191.3;
               this.§1t472s0§.y = 277.45;
               _loc1_ = 0;
               while(_loc1_ < 4)
               {
                  this.slots[_loc1_].y = 218;
                  _loc1_++;
               }
            }
            else
            {
               this.coinimg.y = 163.2;
               this.coinsText.y = 164.3;
               this.§1t472s0§.y = 267.45;
               _loc1_ = 0;
               while(_loc1_ < 4)
               {
                  this.slots[_loc1_].y = 208;
                  _loc1_++;
               }
            }
         }
         else if(this.§1t6175s0§.§1t697s0§() > 0)
         {
            this.xpimg.y = 163.2;
            this.xpText.y = 164.3;
            this.§1t472s0§.y = 267.45;
            _loc1_ = 0;
            while(_loc1_ < 4)
            {
               this.slots[_loc1_].y = 208;
               _loc1_++;
            }
         }
         else
         {
            this.§1t472s0§.y = 267.45;
            _loc1_ = 0;
            while(_loc1_ < 4)
            {
               this.slots[_loc1_].y = 208;
               _loc1_++;
            }
         }
         if(this.§1t5834s0§.length == 1)
         {
            this.slots[0].x = 383.45;
         }
         else if(this.§1t5834s0§.length == 2)
         {
            this.slots[0].x = 348.45;
            this.slots[1].x = 412.45;
         }
         else if(this.§1t5834s0§.length == 3)
         {
            this.slots[0].x = 323.45;
            this.slots[1].x = 383.45;
            this.slots[2].x = 443.45;
         }
         else if(this.§1t5834s0§.length >= 4)
         {
            this.§1t5839s0§();
         }
      }
      
      public function §1t6180s0§() : *
      {
         this.button.visible = true;
      }
      
      public function show() : *
      {
         var _loc2_:* = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:§1t17s0§ = null;
         var _loc1_:int = this.§1t6176s0§.§1t697s0§();
         if(_loc1_ > 0)
         {
            _loc3_ = §1t1523s0§.§1t9637s0§(_loc1_);
            if(_loc3_ != null && _loc3_.length > 0)
            {
               §1t88s0§.instance.§1t1513s0§();
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(863,[_loc3_[0].§1t513s0§(),_loc3_[0].getLevel().toString()]),§1t1521s0§.getString(5));
               this.§1t5846s0§(5);
               this.button.visible = false;
               §1t251s0§.instance.§1t3547s0§(this.§1t6180s0§);
            }
         }
         if(!this.§1t5848s0§())
         {
            this.§1t5484s0§(null);
            return;
         }
         §1t1541s0§.§1t10099s0§();
         this.§1t472s0§.visible = false;
         this.§1t472s0§.htmlText = "";
         if(this.§1t5835s0§.§1t697s0§() <= 0)
         {
            this.coinimg.visible = false;
            this.coinsText.visible = false;
         }
         else
         {
            this.coinimg.visible = true;
            this.coinsText.visible = true;
            if(§1t1523s0§.§1t9618s0§())
            {
               this.coinsText.text = §1t1521s0§.getString(356);
            }
            else
            {
               this.coinsText.text = this.§1t5835s0§.toString();
            }
         }
         if(this.§1t5836s0§.§1t697s0§() <= 0)
         {
            this.goldimg.visible = false;
            this.§1t5054s0§.visible = false;
         }
         else
         {
            this.goldimg.visible = true;
            this.§1t5054s0§.visible = true;
            this.§1t5054s0§.text = this.§1t5836s0§.toString();
         }
         if(this.§1t5836s0§.§1t697s0§() > 0 && this.§1t5835s0§.§1t697s0§() > 0)
         {
            this.coinimg.x = 395;
            this.coinsText.x = 425;
         }
         else
         {
            this.coinimg.x = this.goldimg.x;
            this.coinsText.x = this.§1t5054s0§.x;
         }
         if(this.§1t6175s0§.§1t697s0§() <= 0)
         {
            this.xpimg.visible = false;
            this.xpText.visible = false;
         }
         else
         {
            this.xpimg.visible = true;
            this.xpText.visible = true;
            this.xpText.text = this.§1t6175s0§.toString();
         }
         this.§1t5840s0§();
         this.visible = true;
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.§1t5004s0§();
         this.§1t5027s0§.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5028s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.§1t5089s0§ = 0;
         this.§1t5088s0§ = Math.floor((this.§1t5834s0§.length - 1) / this.§1t5102s0§);
         this.§1t5559s0§();
         this.button.x = 343.65;
         this.sellbutton.visible = false;
         if(§1t1523s0§.§1t9714s0§(1021) >= 2)
         {
            _loc4_ = int(this.§1t5834s0§.length);
            _loc5_ = false;
            _loc2_ = int(_loc4_ - 1);
            while(_loc2_ >= 0 && !_loc5_)
            {
               _loc6_ = this.§1t5834s0§[_loc2_];
               if(_loc6_.§1t547s0§())
               {
                  _loc5_ = true;
               }
               _loc2_--;
            }
            if(_loc5_)
            {
               this.button.x = 273.65;
               this.sellbutton.visible = true;
               this.sellbutton.addEventListener(MouseEvent.CLICK,this.§1t6181s0§);
               this.sellbutton.§1t5004s0§();
            }
         }
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            this.slots[_loc2_].addEventListener(MouseEvent.CLICK,this.§1t5843s0§);
            this.slots[_loc2_].addEventListener(MouseEvent.ROLL_OVER,this.§1t5843s0§);
            this.slots[_loc2_].addEventListener(MouseEvent.ROLL_OUT,this.§1t5844s0§);
            _loc2_++;
         }
         §1t1523s0§.§1t9576s0§(this.§1t6175s0§.§1t697s0§());
         §1t1523s0§.§1t9619s0§(this.§1t5835s0§.§1t697s0§());
         §1t1523s0§.§1t9621s0§(this.§1t5834s0§,true);
         this.titleText.text = §1t1521s0§.getString(103);
         if(§1t3317s0§.instance.§1t1833s0§ && §1t1523s0§.getLevel() >= 9)
         {
            this.registertext.visible = true;
         }
         else
         {
            this.registertext.visible = false;
         }
      }
      
      public function §1t5484s0§(param1:MouseEvent) : void
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
         }
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.sellbutton.addEventListener(MouseEvent.CLICK,this.§1t6181s0§);
         this.button.removeEventListeners();
         this.sellbutton.removeEventListeners();
         this.§1t5027s0§.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5028s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            this.slots[_loc2_].removeEventListener(MouseEvent.CLICK,this.§1t5843s0§);
            this.slots[_loc2_].removeEventListener(MouseEvent.ROLL_OVER,this.§1t5843s0§);
            this.slots[_loc2_].removeEventListener(MouseEvent.ROLL_OUT,this.§1t5844s0§);
            _loc2_++;
         }
         this.visible = false;
         this.§1t5850s0§();
         if(§1t406s0§.instance.§1t6492s0§.visible)
         {
            this.§1t5478s0§ = true;
         }
         if(this.§1t6178s0§)
         {
            §1t123s0§.instance.§1t1596s0§();
         }
         if(!§1t406s0§.instance.§1t6466s0§.visible)
         {
            §1t3317s0§.instance.§1t1946s0§();
         }
         if(§1t1540s0§.§1t10047s0§())
         {
            §1t1541s0§.§1t10097s0§();
         }
         else if(!this.§1t5478s0§)
         {
            if(§1t1540s0§.§1t9550s0§())
            {
               §1t406s0§.instance.§1t6610s0§();
               §1t1541s0§.§1t10045s0§();
               if(this.§1t6177s0§)
               {
                  if(this.§1t6179s0§)
                  {
                     §1t406s0§.instance.§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12485s0§);
                  }
                  else
                  {
                     §1t1525s0§.§1t9933s0§();
                  }
               }
            }
            else if(§1t1540s0§.§1t10014s0§())
            {
               §1t406s0§.instance.§1t6612s0§();
            }
            else
            {
               §1t1540s0§.§1t9895s0§();
            }
         }
         this.§1t6177s0§ = true;
         this.§1t5478s0§ = false;
         this.§1t6179s0§ = false;
      }
      
      internal function §1t6181s0§(param1:Event) : *
      {
         var _loc5_:§1t17s0§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = int(this.§1t5834s0§.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = this.§1t5834s0§[_loc4_];
            if(_loc5_.§1t547s0§())
            {
               _loc2_ += _loc5_.§1t546s0§();
               this.§1t5834s0§.splice(_loc4_,1);
               §1t1523s0§.§1t7692s0§(_loc5_);
            }
            _loc4_--;
         }
         §1t1523s0§.§1t9619s0§(_loc2_ / 2);
         this.§1t5835s0§.§1t698s0§(_loc2_ / 2);
         this.coinimg.visible = true;
         this.coinsText.visible = true;
         if(§1t1523s0§.§1t9618s0§())
         {
            this.coinsText.text = §1t1521s0§.getString(356);
         }
         else
         {
            this.coinsText.text = this.§1t5835s0§.toString();
         }
         if(this.§1t5836s0§.§1t697s0§() > 0 && this.§1t5835s0§.§1t697s0§() > 0)
         {
            this.coinimg.x = 395;
            this.coinsText.x = 425;
         }
         else
         {
            this.coinimg.x = this.goldimg.x;
            this.coinsText.x = this.§1t5054s0§.x;
         }
         this.§1t5840s0§();
         this.§1t5089s0§ = 0;
         this.§1t5088s0§ = Math.floor((this.§1t5834s0§.length - 1) / this.§1t5102s0§);
         this.§1t5559s0§();
         §1t88s0§.instance.§1t1515s0§();
         this.button.x = 343.65;
         this.sellbutton.visible = false;
      }
      
      internal function §1t5843s0§(param1:MouseEvent) : void
      {
         this.§1t472s0§.visible = true;
         this.§1t5844s0§(param1);
         this.§1t472s0§.htmlText = param1.target.item.§1t510s0§();
         param1.target.§1t6786s0§(true);
      }
      
      internal function §1t5844s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            this.slots[_loc2_].§1t6786s0§(false);
            _loc2_++;
         }
         this.§1t472s0§.htmlText = "";
      }
      
      public function §1t5559s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t394s0§ = null;
         var _loc5_:int = 0;
         var _loc1_:int = this.§1t5089s0§ * this.§1t5102s0§;
         var _loc2_:int = int(this.§1t5834s0§.length);
         this.§1t5027s0§.visible = this.§1t5089s0§ > 0;
         this.§1t5028s0§.visible = Math.ceil(_loc2_ / this.§1t5102s0§) - this.§1t5089s0§ > this.§1t5103s0§;
         if(_loc2_ - _loc1_ < this.§1t5023s0§)
         {
            _loc3_ = _loc2_ - _loc1_;
         }
         else
         {
            _loc3_ = this.§1t5023s0§;
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.§1t5023s0§)
         {
            _loc4_ = this.slots[_loc6_];
            if(_loc6_ >= _loc3_)
            {
               _loc4_.visible = false;
            }
            else
            {
               _loc5_ = _loc1_ + _loc6_;
               _loc4_.§1t6872s0§(this.§1t5834s0§[_loc5_].§1t483s0§(),this.§1t5834s0§[_loc5_].§1t508s0§(),this.§1t5834s0§[_loc5_].§1t527s0§(),this.§1t5834s0§[_loc5_].§1t528s0§());
               _loc4_.setItem(this.§1t5834s0§[_loc5_]);
               if(this.§1t5834s0§[_loc5_].§1t484s0§() > 1)
               {
                  _loc4_.§1t6870s0§("x" + this.§1t5834s0§[_loc5_].§1t484s0§().toString());
               }
               else
               {
                  _loc4_.§1t6870s0§("");
               }
               _loc4_.visible = true;
            }
            _loc6_++;
         }
      }
      
      public function §1t5120s0§(param1:MouseEvent) : *
      {
         if(this.§1t5089s0§ > 0)
         {
            --this.§1t5089s0§;
            this.§1t5559s0§();
         }
      }
      
      public function §1t5121s0§(param1:MouseEvent) : *
      {
         if(this.§1t5089s0§ < this.§1t5088s0§)
         {
            ++this.§1t5089s0§;
            this.§1t5559s0§();
         }
      }
      
      public function §1t5845s0§(param1:int, param2:int, param3:int) : *
      {
         var _loc4_:int = 0;
         if(§1t1644s0§.instance.§1t1662s0§(param1) != -1)
         {
            _loc4_ = 0;
            while(_loc4_ < param3)
            {
               this.§1t5834s0§.push(new §1t17s0§(param1,1));
               _loc4_++;
            }
         }
         else
         {
            this.§1t5834s0§.push(new §1t17s0§(param1,param3));
         }
      }
      
      public function §1t6182s0§(param1:int, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : §1t17s0§
      {
         var _loc6_:§1t17s0§ = null;
         var _loc7_:int = 0;
         if(§1t1644s0§.instance.§1t1662s0§(param1) != -1)
         {
            _loc7_ = 0;
            while(_loc7_ < param3)
            {
               _loc6_ = §1t1644s0§.instance.§1t1665s0§(param1,param2,true,param4,param5);
               this.§1t5834s0§.push(_loc6_);
               _loc7_++;
            }
         }
         else
         {
            _loc6_ = new §1t17s0§(param1,param3);
            this.§1t5834s0§.push(_loc6_);
         }
         return _loc6_;
      }
      
      public function §1t6183s0§() : *
      {
         this.§1t5834s0§.push(§1t123s0§.instance.§1t1574s0§(§1t1525s0§.§1t9935s0§(),§1t3317s0§.instance.§1t1848s0§()));
         this.§1t6178s0§ = true;
      }
      
      public function §1t6184s0§() : *
      {
         this.§1t5834s0§.push(§1t123s0§.instance.§1t1574s0§(§1t1525s0§.§1t9935s0§(),§1t3317s0§.instance.§1t1848s0§(),§1t1525s0§.§1t7341s0§(),true));
         this.§1t6178s0§ = true;
      }
      
      public function §1t6185s0§(param1:§1t17s0§) : *
      {
         this.§1t5834s0§.push(param1);
      }
      
      public function §1t6186s0§(param1:int, param2:int) : *
      {
         this.§1t5834s0§.push(new §1t17s0§(param1,param2));
      }
      
      public function §1t6194s0§(param1:int, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : *
      {
         var _loc6_:int = 0;
         if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9459s0§) && int(Math.random() * 4) == 0)
         {
            param2 = true;
            param3 = true;
         }
         if(!param3 && int(Math.random() * 2) == 0)
         {
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < 5)
         {
            if(_loc5_ < 4)
            {
               if(param1 < 30)
               {
                  _loc6_ = int(this.§1t1571s0§[int(Math.random() * this.§1t1571s0§.length)]);
               }
               else if(param1 < 60)
               {
                  _loc6_ = int(this.§1t1572s0§[int(Math.random() * this.§1t1572s0§.length)]);
               }
               else
               {
                  _loc6_ = int(this.§1t1573s0§[int(Math.random() * this.§1t1573s0§.length)]);
               }
               if(§1t1524s0§.§1t9862s0§(_loc6_).levelrestriction <= param1 + 3)
               {
                  if(_loc6_ >= 3000 && _loc6_ < 20000)
                  {
                     this.§1t5834s0§.push(§1t1644s0§.instance.§1t1665s0§(_loc6_,param1,param2,param4));
                  }
                  else
                  {
                     this.§1t5834s0§.push(new §1t17s0§(_loc6_,1));
                  }
                  break;
               }
               _loc5_++;
            }
            else
            {
               this.§1t5834s0§.push(new §1t17s0§(this.§1t6193s0§[Math.random() * this.§1t6193s0§.length],1));
               _loc5_++;
            }
         }
      }
      
      public function §1t6195s0§(param1:int) : §1t17s0§
      {
         var _loc2_:int = 0;
         if(param1 < 30)
         {
            _loc2_ = int(this.§1t6187s0§[int(Math.random() * this.§1t6187s0§.length)]);
         }
         else if(param1 < 60)
         {
            _loc2_ = int(this.§1t6188s0§[int(Math.random() * this.§1t6188s0§.length)]);
         }
         else
         {
            _loc2_ = int(this.§1t6189s0§[int(Math.random() * this.§1t6189s0§.length)]);
         }
         var _loc3_:§1t17s0§ = §1t1644s0§.instance.§1t1665s0§(_loc2_,param1,true,false);
         _loc3_.§1t532s0§(1);
         this.§1t5834s0§.push(_loc3_);
         return _loc3_;
      }
      
      public function §1t6196s0§(param1:int, param2:§1t58s0§ = null, param3:Boolean = false) : §1t17s0§
      {
         var _loc4_:int = 0;
         var _loc5_:§1t58s0§ = null;
         if(param2 == null)
         {
            _loc5_ = §1t58s0§.§1t8804s0§(Math.random() * 1000);
         }
         else
         {
            _loc5_ = param2;
         }
         if(param1 < 30)
         {
            _loc4_ = int(this.§1t1571s0§[_loc5_.rand(this.§1t1571s0§.length)]);
         }
         else if(param1 < 60)
         {
            _loc4_ = int(this.§1t1572s0§[_loc5_.rand(this.§1t1572s0§.length)]);
         }
         else
         {
            _loc4_ = int(this.§1t1573s0§[_loc5_.rand(this.§1t1573s0§.length)]);
         }
         if(param2 == null)
         {
            _loc5_.destroy();
         }
         return §1t1644s0§.instance.§1t1665s0§(_loc4_,param1,param3);
      }
      
      public function §1t6197s0§(param1:int, param2:§1t58s0§ = null) : §1t17s0§
      {
         var _loc3_:int = 0;
         var _loc4_:§1t58s0§ = null;
         if(param2 == null)
         {
            _loc4_ = §1t58s0§.§1t8804s0§(Math.random() * 1000);
         }
         else
         {
            _loc4_ = param2;
         }
         if(param1 < 30)
         {
            _loc3_ = int(this.§1t1571s0§[_loc4_.rand(this.§1t1571s0§.length)]);
         }
         else if(param1 < 60)
         {
            _loc3_ = int(this.§1t1572s0§[_loc4_.rand(this.§1t1572s0§.length)]);
         }
         else
         {
            _loc3_ = int(this.§1t1573s0§[_loc4_.rand(this.§1t1573s0§.length)]);
         }
         if(param2 == null)
         {
            _loc4_.destroy();
         }
         return §1t1644s0§.instance.§1t1665s0§(_loc3_,param1,true);
      }
      
      public function §1t6198s0§(param1:int, param2:§1t58s0§ = null) : §1t17s0§
      {
         var _loc3_:int = 0;
         var _loc4_:§1t58s0§ = null;
         if(param2 == null)
         {
            _loc4_ = §1t58s0§.§1t8804s0§(Math.random() * 1000);
         }
         else
         {
            _loc4_ = param2;
         }
         if(param1 < 30)
         {
            _loc3_ = int(this.§1t6190s0§[_loc4_.rand(this.§1t6190s0§.length)]);
         }
         else if(param1 < 60)
         {
            _loc3_ = int(this.§1t6191s0§[_loc4_.rand(this.§1t6191s0§.length)]);
         }
         else
         {
            _loc3_ = int(this.§1t6192s0§[_loc4_.rand(this.§1t6192s0§.length)]);
         }
         if(param2 == null)
         {
            _loc4_.destroy();
         }
         return §1t1644s0§.instance.§1t1665s0§(_loc3_,param1,true);
      }
      
      public function §1t6199s0§(param1:int, param2:§1t58s0§ = null) : §1t17s0§
      {
         var _loc3_:int = 0;
         var _loc4_:§1t58s0§ = null;
         var _loc5_:Array = null;
         var _loc6_:Array = [4005,5002,7022,11005,12002,4061,9010];
         if(param2 == null)
         {
            _loc4_ = §1t58s0§.§1t8804s0§(Math.random() * 1000);
         }
         else
         {
            _loc4_ = param2;
         }
         if(param1 < 30)
         {
            _loc5_ = this.§1t1571s0§.concat(_loc6_);
         }
         else if(param1 < 60)
         {
            _loc5_ = this.§1t1572s0§.concat(_loc6_);
         }
         else
         {
            _loc5_ = this.§1t1573s0§.concat(_loc6_);
         }
         _loc3_ = int(_loc5_[_loc4_.rand(_loc5_.length)]);
         if(param2 == null)
         {
            _loc4_.destroy();
         }
         return §1t1644s0§.instance.§1t1665s0§(_loc3_,param1,true,true);
      }
      
      public function §1t6200s0§(param1:int, param2:§1t58s0§ = null) : §1t17s0§
      {
         var _loc3_:int = 0;
         var _loc4_:§1t58s0§ = null;
         var _loc5_:Array = null;
         var _loc6_:Array = [4005,5002,7022,11005,12002,4061,9010];
         if(param2 == null)
         {
            _loc4_ = §1t58s0§.§1t8804s0§(Math.random() * 1000);
         }
         else
         {
            _loc4_ = param2;
         }
         if(param1 < 30)
         {
            _loc5_ = this.§1t6190s0§.concat(_loc6_);
         }
         else if(param1 < 60)
         {
            _loc5_ = this.§1t6191s0§.concat(_loc6_);
         }
         else
         {
            _loc5_ = this.§1t6192s0§.concat(_loc6_);
         }
         _loc3_ = int(_loc5_[_loc4_.rand(_loc5_.length)]);
         if(_loc3_ < 3000)
         {
            _loc3_ = int(_loc6_[_loc4_.rand(_loc6_.length)]);
         }
         if(param2 == null)
         {
            _loc4_.destroy();
         }
         return §1t1644s0§.instance.§1t1665s0§(_loc3_,param1,true,true);
      }
      
      public function §1t6201s0§(param1:int) : *
      {
         if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9452s0§) || §1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
         {
            param1 *= 1.5;
         }
         if(§1t1523s0§.getLevel() < §1t1523s0§.§1t9470s0§)
         {
            this.§1t6175s0§.§1t698s0§(param1);
         }
         this.§1t6176s0§.§1t698s0§(param1);
      }
      
      public function §1t5846s0§(param1:int) : *
      {
         if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9458s0§))
         {
            param1 *= 1.5;
         }
         this.§1t5835s0§.§1t698s0§(param1);
      }
      
      public function §1t5847s0§(param1:int) : *
      {
         this.§1t5836s0§.§1t698s0§(param1);
      }
      
      public function §1t5848s0§() : Boolean
      {
         return this.§1t5835s0§.§1t697s0§() > 0 || this.§1t5836s0§.§1t697s0§() > 0 || this.§1t6175s0§.§1t697s0§() > 0 || this.§1t5834s0§.length > 0;
      }
      
      public function §1t5850s0§() : *
      {
         this.§1t5835s0§.§1t695s0§(0);
         this.§1t5836s0§.§1t695s0§(0);
         this.§1t6175s0§.§1t695s0§(0);
         this.§1t6176s0§.§1t695s0§(0);
         this.§1t5834s0§.length = 0;
      }
      
      public function §1t5826s0§() : *
      {
         this.§1t6177s0§ = false;
      }
      
      public function §1t6202s0§() : *
      {
         this.§1t6177s0§ = true;
      }
      
      public function §1t5486s0§() : *
      {
         this.§1t5478s0§ = true;
      }
      
      public function §1t6203s0§() : *
      {
         this.§1t6179s0§ = true;
      }
      
      public function §1t6204s0§() : *
      {
         this.§1t6175s0§.§1t695s0§(this.§1t6175s0§.§1t697s0§() / 2);
         this.§1t6176s0§.§1t695s0§(this.§1t6175s0§.§1t697s0§() / 2);
         this.§1t6206s0§();
         this.§1t6194s0§(§1t1523s0§.getLevel());
      }
      
      public function §1t6205s0§() : *
      {
         this.§1t6175s0§.§1t695s0§(this.§1t6175s0§.§1t697s0§() / 2);
         this.§1t6176s0§.§1t695s0§(this.§1t6175s0§.§1t697s0§() / 2);
         this.§1t6206s0§();
         this.§1t5835s0§.§1t695s0§(this.§1t5835s0§.§1t697s0§() / 2);
         if(this.§1t5834s0§.length > 4)
         {
            this.§1t5834s0§.length = 4;
         }
      }
      
      public function §1t6206s0§() : *
      {
         var _loc2_:int = 0;
         var _loc1_:int = §1t1523s0§.getLevel();
         if(_loc1_ >= 9 && §1t3317s0§.instance.§1t1833s0§)
         {
            this.§1t6175s0§.§1t695s0§(0);
         }
         if(_loc1_ > 30)
         {
            _loc2_ = (§1t1523s0§.§1t5928s0§(_loc1_ + 1) - §1t1523s0§.§1t5928s0§(_loc1_)) / (_loc1_ + 1) * 2;
            if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9452s0§) || §1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
            {
               _loc2_ *= 1.5;
            }
            if(this.§1t6175s0§.§1t697s0§() > _loc2_)
            {
               this.§1t6175s0§.§1t695s0§(_loc2_);
            }
            if(this.§1t6176s0§.§1t697s0§() > _loc2_)
            {
               this.§1t6176s0§.§1t695s0§(_loc2_);
            }
         }
      }
      
      public function §1t6207s0§() : int
      {
         return this.§1t5834s0§.length;
      }
      
      public function §1t997s0§() : Vector.<§1t17s0§>
      {
         return this.§1t5834s0§;
      }
      
      public function §1t6208s0§() : int
      {
         return this.§1t5835s0§.§1t697s0§();
      }
      
      public function §1t6209s0§() : int
      {
         var _loc1_:int = this.§1t6176s0§.§1t697s0§();
         this.§1t6176s0§.§1t695s0§(0);
         return _loc1_;
      }
   }
}

