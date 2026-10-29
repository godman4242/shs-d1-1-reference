package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol861")]
   public class §1t396s0§ extends MovieClip
   {
      
      public var §1t5268s0§:§1t5050s0§;
      
      public var §1t5269s0§:TextField;
      
      public var bet2text:TextField;
      
      public var betButton1:§1t4913s0§;
      
      public var §1t5272s0§:§1t4913s0§;
      
      public var betTenButton1:§1t4913s0§;
      
      public var betTenButton2:§1t4913s0§;
      
      public var betlabel:TextField;
      
      public var §1t5002s0§:§1t5050s0§;
      
      public var §1t5276s0§:§1t5059s0§;
      
      public var errortext:TextField;
      
      public var fightButton:§1t5059s0§;
      
      public var §1t5279s0§:TextField;
      
      public var odds2text:TextField;
      
      public var §1t5281s0§:TextField;
      
      public var §1t5282s0§:TextField;
      
      public var playername2text:TextField;
      
      public var §1t5284s0§:TextField;
      
      public var §1t5285s0§:MovieClip;
      
      public var §1t5286s0§:MovieClip;
      
      public var token3:TextField;
      
      public var trophy1:MovieClip;
      
      public var §1t5289s0§:MovieClip;
      
      internal var obj:§1t23s0§;
      
      internal var §1t5290s0§:§1t23s0§;
      
      internal var §1t5291s0§:§1t98s0§;
      
      internal var §1t5292s0§:§1t98s0§;
      
      internal var §1t5293s0§:§1t395s0§;
      
      internal var §1t5294s0§:String;
      
      internal var §1t5295s0§:int = -1;
      
      public function §1t396s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5284s0§);
         this.§1t5284s0§.text = "";
         §1t1521s0§.§1t9290s0§(this.§1t5281s0§,true);
         this.§1t5281s0§.text = §1t1521s0§.getString(11002);
         §1t1521s0§.§1t9290s0§(this.betlabel,true);
         this.betlabel.text = §1t1521s0§.getString(11003);
         §1t1521s0§.§1t9290s0§(this.§1t5282s0§,true);
         this.§1t5282s0§.text = "";
         §1t1521s0§.§1t9290s0§(this.playername2text,true);
         this.playername2text.text = "";
         §1t1521s0§.§1t9290s0§(this.§1t5279s0§);
         this.§1t5279s0§.text = "";
         §1t1521s0§.§1t9290s0§(this.odds2text);
         this.odds2text.text = "";
         §1t1521s0§.§1t9290s0§(this.§1t5269s0§);
         this.§1t5269s0§.text = "";
         §1t1521s0§.§1t9290s0§(this.bet2text);
         this.bet2text.text = "";
         this.trophy1.visible = false;
         this.§1t5289s0§.visible = false;
         this.§1t5268s0§.visible = true;
         this.fightButton.visible = true;
         this.fightButton.§1t5769s0§(§1t1521s0§.getString(11001));
         this.§1t5276s0§.§1t5769s0§(§1t1521s0§.getString(547));
         this.§1t5276s0§.visible = false;
         this.§1t5002s0§.§1t5769s0§(§1t1521s0§.getString(17));
         this.§1t5002s0§.visible = false;
         this.betButton1.visible = false;
         this.betTenButton1.visible = false;
         this.§1t5272s0§.visible = false;
         this.betTenButton2.visible = false;
         this.§1t5285s0§.visible = false;
         this.§1t5286s0§.visible = false;
         this.token3.visible = false;
         this.§1t5291s0§ = new §1t98s0§(§1t1523s0§.§1t9392s0§);
         this.§1t5292s0§ = new §1t98s0§(§1t1523s0§.§1t9392s0§);
      }
      
      public function §1t5296s0§(param1:§1t395s0§) : *
      {
         this.§1t5293s0§ = param1;
      }
      
      public function init(param1:§1t23s0§, param2:§1t23s0§, param3:§1t23s0§) : *
      {
         var _loc4_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         this.obj = param1;
         this.§1t5290s0§ = param2;
         _loc4_ = int(param3.tier);
         this.§1t5294s0§ = param1.key;
         this.errortext.visible = false;
         this.§1t5297s0§(false);
         if(param1.tier == _loc4_)
         {
            this.§1t5284s0§.visible = true;
            this.§1t5284s0§.text = "";
            this.§1t5268s0§.visible = false;
            this.fightButton.visible = false;
            if(param1.winner == 0)
            {
               if(param1.player1 == §1t1523s0§.charname || param1.player2 == §1t1523s0§.charname)
               {
                  if(param3.timeout - §1t3317s0§.instance.§1t1847s0§() < param3.roundduration - 300)
                  {
                     this.fightButton.visible = true;
                  }
               }
               else if(param1.acceptingbets)
               {
                  this.§1t5268s0§.visible = true;
                  this.§1t5268s0§.§1t5769s0§(§1t1521s0§.getString(998));
               }
            }
            else if(param1.replay != "" && param1.replay != "walkover")
            {
               this.§1t5268s0§.visible = true;
               this.§1t5268s0§.§1t5769s0§(§1t1521s0§.getString(11000));
            }
            else if(param1.replay == "walkover")
            {
               this.errortext.text = §1t1521s0§.getString(999);
               this.errortext.y = 55;
               this.errortext.visible = true;
            }
            this.§1t5295s0§ = 1;
         }
         else if(param1.tier < _loc4_)
         {
            this.§1t5284s0§.visible = false;
            this.fightButton.visible = false;
            if(param1.replay != "" && param1.replay != "walkover")
            {
               this.§1t5268s0§.visible = true;
               this.§1t5268s0§.§1t5769s0§(§1t1521s0§.getString(11000));
            }
            else if(param1.replay == "walkover")
            {
               this.§1t5268s0§.visible = false;
               this.errortext.text = §1t1521s0§.getString(999);
               this.errortext.y = 55;
               this.errortext.visible = true;
            }
            else
            {
               this.§1t5268s0§.visible = false;
            }
            this.§1t5295s0§ = 2;
         }
         else
         {
            this.§1t5284s0§.visible = false;
            this.§1t5268s0§.visible = false;
            this.fightButton.visible = false;
            if(param1.player1 != "" || param1.player2 != "")
            {
               this.§1t5268s0§.visible = true;
               this.§1t5268s0§.§1t5769s0§(§1t1521s0§.getString(998));
            }
            this.§1t5295s0§ = 0;
         }
         this.trophy1.visible = param1.winner == 1;
         this.§1t5289s0§.visible = param1.winner == 2;
         var _loc5_:String = "#FFFFFF";
         var _loc6_:String = "#FFFFFF";
         if(param1.player1 == §1t1523s0§.charname)
         {
            _loc5_ = "#FFCC00";
         }
         else if(param1.player2 == §1t1523s0§.charname)
         {
            _loc6_ = "#FFCC00";
         }
         if(param1.winner == 1)
         {
            _loc5_ = "#DEDE7B";
            _loc6_ = "#999999";
         }
         else if(param1.winner == 2)
         {
            _loc5_ = "#999999";
            _loc6_ = "#DEDE7B";
         }
         this.§1t5282s0§.htmlText = "<font color=\'" + _loc5_ + "\'>" + param1.player1 + "</font>";
         this.playername2text.htmlText = "<font color=\'" + _loc6_ + "\'>" + param1.player2 + "</font>";
         var _loc7_:int = param1.totalbetsonplayer1 + param1.totalbetsonplayer2;
         if(_loc7_ <= 10 && Boolean(param1.acceptingbets))
         {
            _loc11_ = 0.7;
            _loc12_ = 0.7;
         }
         else
         {
            if(_loc10_ > 100)
            {
               _loc10_ = _loc7_ * 0.8;
            }
            else
            {
               _loc10_ = _loc7_ * 0.85;
            }
            _loc11_ = Math.round((_loc10_ - param1.totalbetsonplayer1) / param1.totalbetsonplayer1 * 10) / 10;
            _loc12_ = Math.round((_loc10_ - param1.totalbetsonplayer2) / param1.totalbetsonplayer2 * 10) / 10;
         }
         this.§1t5279s0§.text = _loc11_.toString();
         this.odds2text.text = _loc12_.toString();
         this.§1t5004s0§();
         this.§1t5291s0§.§1t695s0§(0);
         this.§1t5292s0§.§1t695s0§(0);
         if(param2 != null && param2[this.§1t5294s0§] != null)
         {
            if(param2[this.§1t5294s0§][1] != null)
            {
               this.§1t5291s0§.§1t695s0§(param2[this.§1t5294s0§][1]);
            }
            if(param2[this.§1t5294s0§][2] != null)
            {
               this.§1t5292s0§.§1t695s0§(param2[this.§1t5294s0§][2]);
            }
         }
         var _loc8_:String = "#CCCCCC";
         var _loc9_:String = "#CCCCCC";
         if(this.§1t5291s0§.§1t697s0§() > 0)
         {
            _loc8_ = "#FFCC00";
         }
         if(this.§1t5292s0§.§1t697s0§() > 0)
         {
            _loc9_ = "#FFCC00";
         }
         this.§1t5269s0§.htmlText = "<font color=\'" + _loc8_ + "\'>" + this.§1t5291s0§.§1t697s0§().toString() + "</font>";
         this.bet2text.htmlText = "<font color=\'" + _loc9_ + "\'>" + this.§1t5292s0§.§1t697s0§().toString() + "</font>";
      }
      
      internal function §1t5297s0§(param1:Boolean) : *
      {
         if(this.§1t5282s0§.text == "")
         {
            this.betButton1.visible = false;
            this.betTenButton1.visibel = false;
         }
         else
         {
            this.betButton1.visible = param1;
            this.betTenButton1.visible = param1;
         }
         if(this.playername2text.text == "")
         {
            this.§1t5272s0§.visible = false;
            this.betTenButton2.visible = false;
         }
         else
         {
            this.§1t5272s0§.visible = param1;
            this.betTenButton2.visible = param1;
         }
         this.§1t5276s0§.visible = param1;
         this.§1t5002s0§.visible = param1;
         this.§1t5285s0§.visible = param1;
         this.§1t5286s0§.visible = param1;
         this.token3.visible = param1;
         this.§1t5268s0§.visible = !param1;
         this.errortext.visible = false;
         if(param1)
         {
            this.§1t5276s0§.addEventListener(MouseEvent.CLICK,this.§1t5302s0§);
            this.§1t5002s0§.addEventListener(MouseEvent.CLICK,this.§1t5304s0§);
            this.betButton1.addEventListener(MouseEvent.CLICK,this.§1t5305s0§);
            this.betTenButton1.addEventListener(MouseEvent.CLICK,this.§1t5306s0§);
            this.§1t5272s0§.addEventListener(MouseEvent.CLICK,this.§1t5307s0§);
            this.betTenButton2.addEventListener(MouseEvent.CLICK,this.§1t5308s0§);
            this.§1t5268s0§.visible = false;
            this.fightButton.visible = false;
            this.errortext.width = 290;
         }
         else
         {
            this.§1t5276s0§.removeEventListener(MouseEvent.CLICK,this.§1t5302s0§);
            this.§1t5002s0§.removeEventListener(MouseEvent.CLICK,this.§1t5304s0§);
            this.betButton1.removeEventListener(MouseEvent.CLICK,this.§1t5305s0§);
            this.betTenButton1.removeEventListener(MouseEvent.CLICK,this.§1t5306s0§);
            this.§1t5272s0§.removeEventListener(MouseEvent.CLICK,this.§1t5307s0§);
            this.betTenButton2.removeEventListener(MouseEvent.CLICK,this.§1t5308s0§);
         }
      }
      
      internal function §1t5004s0§() : *
      {
         this.fightButton.addEventListener(MouseEvent.CLICK,this.§1t5298s0§);
         this.§1t5268s0§.addEventListener(MouseEvent.CLICK,this.§1t5299s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.fightButton.removeEventListener(MouseEvent.CLICK,this.§1t5298s0§);
         this.§1t5268s0§.removeEventListener(MouseEvent.CLICK,this.§1t5299s0§);
      }
      
      internal function §1t5298s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = "";
         if(this.obj.player1 != §1t1523s0§.charname && this.obj.player2 == §1t1523s0§.charname)
         {
            _loc2_ = this.obj.player1;
         }
         else if(this.obj.player1 == §1t1523s0§.charname && this.obj.player2 != §1t1523s0§.charname)
         {
            _loc2_ = this.obj.player2;
         }
         if(_loc2_ != "")
         {
            §1t406s0§.instance.§1t6484s0§.loading.visible = true;
            this.§1t5293s0§.§1t7076s0§(this);
            §1t3318s0§.instance.§1t3452s0§(_loc2_);
         }
      }
      
      internal function §1t5299s0§(param1:MouseEvent) : *
      {
         if(this.obj.acceptingbets)
         {
            this.§1t5293s0§.§1t7077s0§(this);
         }
         else
         {
            §1t406s0§.instance.§1t6484s0§.hide();
            §1t1540s0§.§1t10035s0§();
            §1t3318s0§.instance.§1t1951s0§(this.obj.replay);
         }
      }
      
      public function §1t5300s0§(param1:String, param2:int, param3:int, param4:int) : *
      {
         if(!visible)
         {
            return;
         }
         if(this.obj != null && this.obj.finals != null && (param2 == 0 || param2 == 1))
         {
            if(param3 > param4 - 600 && this.§1t5293s0§.§1t7056s0§.maxplayers > 2)
            {
               param1 = §1t1521s0§.getString(997,[this.§1t5293s0§.§1t937s0§(param3 - (param4 - 600))]);
               param2 = 0;
            }
         }
         this.§1t5284s0§.text = param1;
         if(this.§1t5295s0§ == 0 && param2 == 1 && this.obj != null && (this.obj.player1 == §1t1523s0§.charname || this.obj.player2 == §1t1523s0§.charname))
         {
            this.fightButton.visible = true;
         }
         this.§1t5295s0§ = param2;
      }
      
      public function §1t5301s0§() : *
      {
         this.removeEventListeners();
      }
      
      internal function §1t5302s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         var _loc2_:int = this.§1t5291s0§.§1t697s0§() - this.§1t5293s0§.§1t7074s0§.§1t5291s0§.§1t697s0§();
         var _loc3_:int = this.§1t5292s0§.§1t697s0§() - this.§1t5293s0§.§1t7074s0§.§1t5292s0§.§1t697s0§();
         if(_loc2_ > 0 || _loc3_ > 0)
         {
            if(_loc2_ > 0)
            {
               §1t251s0§.instance.§1t3578s0§(this.§1t5294s0§,1,_loc2_);
            }
            else if(_loc3_ > 0)
            {
               §1t251s0§.instance.§1t3578s0§(this.§1t5294s0§,2,_loc3_);
            }
            §1t406s0§.instance.§1t6484s0§.loading.visible = true;
            this.§1t5293s0§.§1t7080s0§();
         }
         else
         {
            this.§1t5297s0§(false);
         }
      }
      
      public function §1t5303s0§() : *
      {
         this.obj.acceptingbets = false;
         this.§1t5268s0§.visible = false;
      }
      
      internal function §1t5304s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t5293s0§.§1t7078s0§();
      }
      
      internal function §1t5305s0§(param1:MouseEvent) : *
      {
         if(this.§1t5293s0§.§1t7075s0§.§1t697s0§() >= 1 && this.§1t5291s0§.§1t697s0§() <= 99)
         {
            this.§1t5293s0§.§1t7079s0§(-1);
            this.§1t5291s0§.§1t698s0§(1);
            this.§1t5269s0§.text = this.§1t5291s0§.§1t697s0§().toString();
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.§1t5272s0§.visible = false;
            this.betTenButton2.visible = false;
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            this.errortext.text = §1t1521s0§.getString(11030);
            this.errortext.visible = true;
         }
      }
      
      internal function §1t5306s0§(param1:MouseEvent) : *
      {
         if(this.§1t5293s0§.§1t7075s0§.§1t697s0§() >= 10 && this.§1t5291s0§.§1t697s0§() <= 90)
         {
            this.§1t5293s0§.§1t7079s0§(-10);
            this.§1t5291s0§.§1t698s0§(10);
            this.§1t5269s0§.text = this.§1t5291s0§.§1t697s0§().toString();
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.§1t5272s0§.visible = false;
            this.betTenButton2.visible = false;
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            this.errortext.text = §1t1521s0§.getString(11030);
            this.errortext.visible = true;
         }
      }
      
      internal function §1t5307s0§(param1:MouseEvent) : *
      {
         if(this.§1t5293s0§.§1t7075s0§.§1t697s0§() >= 1 && this.§1t5292s0§.§1t697s0§() <= 99)
         {
            this.§1t5293s0§.§1t7079s0§(-1);
            this.§1t5292s0§.§1t698s0§(1);
            this.bet2text.text = this.§1t5292s0§.§1t697s0§().toString();
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.betButton1.visible = false;
            this.betTenButton1.visible = false;
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            this.errortext.text = §1t1521s0§.getString(11030);
            this.errortext.visible = true;
         }
      }
      
      internal function §1t5308s0§(param1:MouseEvent) : *
      {
         if(this.§1t5293s0§.§1t7075s0§.§1t697s0§() >= 10 && this.§1t5292s0§.§1t697s0§() <= 90)
         {
            this.§1t5293s0§.§1t7079s0§(-10);
            this.§1t5292s0§.§1t698s0§(10);
            this.bet2text.text = this.§1t5292s0§.§1t697s0§().toString();
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.betButton1.visible = false;
            this.betTenButton1.visible = false;
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            this.errortext.text = §1t1521s0§.getString(11030);
            this.errortext.visible = true;
         }
      }
      
      public function §1t5309s0§(param1:§1t396s0§, param2:Boolean) : *
      {
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc3_:int = param1.§1t5291s0§.§1t697s0§() - this.§1t5291s0§.§1t697s0§();
         var _loc4_:int = param1.§1t5292s0§.§1t697s0§() - this.§1t5292s0§.§1t697s0§();
         this.§1t5291s0§.§1t695s0§(param1.§1t5291s0§.§1t697s0§());
         this.§1t5292s0§.§1t695s0§(param1.§1t5292s0§.§1t697s0§());
         var _loc5_:String = "#CCCCCC";
         var _loc6_:String = "#CCCCCC";
         if(this.§1t5291s0§.§1t697s0§() > 0)
         {
            _loc5_ = "#FFCC00";
         }
         if(this.§1t5292s0§.§1t697s0§() > 0)
         {
            _loc6_ = "#FFCC00";
         }
         this.§1t5269s0§.htmlText = "<font color=\'" + _loc5_ + "\'>" + this.§1t5291s0§.§1t697s0§().toString() + "</font>";
         this.bet2text.htmlText = "<font color=\'" + _loc6_ + "\'>" + this.§1t5292s0§.§1t697s0§().toString() + "</font>";
         this.§1t5284s0§.text = "";
         this.§1t5294s0§ = param1.§1t5294s0§;
         this.§1t5282s0§.text = param1.§1t5282s0§.text;
         this.playername2text.text = param1.playername2text.text;
         if(param2)
         {
            this.obj.totalbetsonplayer1 += _loc3_;
            this.obj.totalbetsonplayer2 += _loc4_;
            _loc7_ = this.obj.totalbetsonplayer1 + this.obj.totalbetsonplayer2;
            if(_loc7_ <= 10 && Boolean(this.obj.acceptingbets))
            {
               _loc9_ = 0.7;
               _loc10_ = 0.7;
            }
            else
            {
               if(_loc7_ > 100)
               {
                  _loc8_ = _loc7_ * 0.8;
               }
               else
               {
                  _loc8_ = _loc7_ * 0.85;
               }
               _loc9_ = Math.round((_loc8_ - this.obj.totalbetsonplayer1) / this.obj.totalbetsonplayer1 * 10) / 10;
               _loc10_ = Math.round((_loc8_ - this.obj.totalbetsonplayer2) / this.obj.totalbetsonplayer2 * 10) / 10;
            }
            this.§1t5279s0§.text = _loc9_.toString();
            this.odds2text.text = _loc10_.toString();
            if(this.§1t5290s0§ == null)
            {
               this.§1t5290s0§ = new §1t23s0§("","","",0,false,null);
            }
            if(this.§1t5290s0§[this.§1t5294s0§] == null)
            {
               this.§1t5290s0§[this.§1t5294s0§] = new Array();
            }
            if(this.§1t5291s0§.§1t697s0§() > 0)
            {
               this.§1t5290s0§[this.§1t5294s0§][1] = this.§1t5291s0§.§1t697s0§();
            }
            if(this.§1t5292s0§.§1t697s0§() > 0)
            {
               this.§1t5290s0§[this.§1t5294s0§][2] = this.§1t5292s0§.§1t697s0§();
            }
         }
         else
         {
            this.§1t5279s0§.text = param1.§1t5279s0§.text;
            this.odds2text.text = param1.odds2text.text;
         }
      }
      
      public function §1t5310s0§() : *
      {
         this.§1t5291s0§.§1t695s0§(0);
         this.§1t5292s0§.§1t695s0§(0);
         this.§1t5269s0§.text = "";
         this.bet2text.text = "";
         this.§1t5282s0§.text = "";
         this.playername2text.text = "";
         this.§1t5279s0§.text = "";
         this.odds2text.text = "";
         this.§1t5284s0§.text = "";
         this.§1t5294s0§ = "";
         this.errortext.text = "";
         this.obj = null;
         this.§1t5290s0§ = null;
      }
      
      public function §1t5311s0§(param1:String, param2:int) : *
      {
         this.errortext.visible = true;
         this.errortext.text = param1;
         this.errortext.y = param2;
      }
   }
}

