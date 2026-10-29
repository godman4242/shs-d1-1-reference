package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.setTimeout;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol911")]
   public class §1t7144s0§ extends MovieClip
   {
      
      public var bg:§1t5016s0§;
      
      public var buybutton:SimpleButton;
      
      public var errortext:TextField;
      
      public var goldenTokenIcon:MovieClip;
      
      public var goldenTokenText:TextField;
      
      public var §1t5056s0§:TextField;
      
      public var goldtext:TextField;
      
      public var historybutton:§1t5000s0§;
      
      public var joinbutton:§1t5059s0§;
      
      public var joinedtext:TextField;
      
      public var notournamenttext:TextField;
      
      public var refreshbutton:SimpleButton;
      
      public var §1t5019s0§:§1t4912s0§;
      
      public var §1t5020s0§:§1t4912s0§;
      
      public var §1t5021s0§:TextField;
      
      public var tournamentCreate:§1t7091s0§;
      
      public var tournamentdetailstext:TextField;
      
      public var tournamenttitletext:TextField;
      
      public var viewbutton:§1t5003s0§;
      
      internal var §1t7155s0§:Array;
      
      internal var §1t7156s0§:Array;
      
      internal var §1t7157s0§:Array;
      
      internal var §1t6823s0§:Vector.<§1t6782s0§>;
      
      internal var §1t7158s0§:Boolean;
      
      internal var §1t1838s0§:int = 0;
      
      internal var §1t7159s0§:§1t23s0§;
      
      internal var §1t6805s0§:int;
      
      internal var §1t7160s0§:int;
      
      internal var §1t6807s0§:int;
      
      internal var §1t6809s0§:int = -1;
      
      public function §1t7144s0§()
      {
         var _loc1_:§1t6782s0§ = null;
         var _loc2_:int = 0;
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(11005);
         §1t1521s0§.§1t9290s0§(this.notournamenttext);
         this.notournamenttext.text = §1t1521s0§.getString(11018);
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(11006);
         this.§1t6823s0§ = new Vector.<§1t6782s0§>();
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_ = new §1t6782s0§(_loc2_);
            _loc1_.x = 60;
            _loc1_.y = 73 + _loc2_ * 55;
            this.§1t6823s0§.push(_loc1_);
            _loc1_.visible = false;
            addChild(_loc1_);
            _loc2_++;
         }
         this.§1t6823s0§.fixed = true;
         this.goldenTokenIcon.visible = false;
         this.goldenTokenText.visible = false;
         this.§1t5020s0§.visible = false;
         this.§1t5019s0§.visible = false;
         this.refreshbutton.visible = false;
         this.joinbutton.visible = false;
         this.viewbutton.visible = false;
         this.tournamenttitletext.text = "";
         this.tournamentdetailstext.text = "";
         this.errortext.visible = false;
         this.joinedtext.visible = false;
      }
      
      public function §1t5004s0§() : *
      {
         this.§1t5020s0§.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5019s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.historybutton.addEventListener(MouseEvent.CLICK,this.§1t7168s0§);
         this.buybutton.addEventListener(MouseEvent.CLICK,this.§1t7064s0§);
         this.refreshbutton.addEventListener(MouseEvent.CLICK,this.§1t7065s0§);
         this.joinbutton.addEventListener(MouseEvent.CLICK,this.§1t7169s0§);
         this.viewbutton.addEventListener(MouseEvent.CLICK,this.§1t7175s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t6823s0§.length)
         {
            this.§1t6823s0§[_loc1_].§1t5004s0§();
            this.§1t6823s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t7167s0§);
            _loc1_++;
         }
      }
      
      public function removeEventListeners() : *
      {
         this.§1t5020s0§.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5019s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.historybutton.removeEventListener(MouseEvent.CLICK,this.§1t7168s0§);
         this.buybutton.removeEventListener(MouseEvent.CLICK,this.§1t7064s0§);
         this.refreshbutton.removeEventListener(MouseEvent.CLICK,this.§1t7065s0§);
         this.joinbutton.removeEventListener(MouseEvent.CLICK,this.§1t7169s0§);
         this.viewbutton.removeEventListener(MouseEvent.CLICK,this.§1t7175s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t6823s0§.length)
         {
            this.§1t6823s0§[_loc1_].removeEventListeners();
            this.§1t6823s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t7167s0§);
            _loc1_++;
         }
      }
      
      public function show() : *
      {
         this.§1t5004s0§();
         this.visible = true;
         this.goldtext.text = §1t1523s0§.§1t9714s0§(20112).toString();
         §1t406s0§.instance.§1t6484s0§.loading.visible = true;
         if(this.§1t7155s0§ == null)
         {
            §1t3318s0§.instance.§1t3448s0§();
         }
         else
         {
            this.§1t7163s0§(this.§1t7155s0§);
         }
         this.historybutton.§1t5769s0§(§1t1521s0§.getString(11019));
         this.§1t7158s0§ = false;
         this.§1t7162s0§();
      }
      
      public function §1t7161s0§() : *
      {
         if(this.§1t7155s0§ == null)
         {
            §1t406s0§.instance.§1t6484s0§.hide();
         }
         else
         {
            this.§1t5004s0§();
            this.visible = true;
            this.goldtext.text = §1t1523s0§.§1t9714s0§(20112).toString();
         }
      }
      
      internal function §1t7162s0§() : *
      {
         this.goldenTokenIcon.visible = false;
         this.goldenTokenText.visible = false;
         this.refreshbutton.visible = false;
         this.joinbutton.visible = false;
         this.viewbutton.visible = false;
         this.tournamenttitletext.text = "";
         this.tournamentdetailstext.text = "";
         this.errortext.visible = false;
         this.joinedtext.visible = false;
         this.tournamentCreate.hide();
      }
      
      public function §1t7163s0§(param1:Array) : *
      {
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         this.§1t7155s0§ = param1;
         this.§1t7157s0§ = param1;
         this.§1t6807s0§ = 0;
         this.§1t7160s0§ = param1.length;
         this.§1t6805s0§ = this.§1t7160s0§ - this.§1t6823s0§.length;
         if(this.§1t6805s0§ < 0)
         {
            this.§1t6805s0§ = 0;
         }
         if(this.§1t6807s0§ > this.§1t6805s0§)
         {
            this.§1t6807s0§ = this.§1t6805s0§;
         }
         this.§1t6809s0§ = -1;
         this.§1t7166s0§();
         this.§1t7162s0§();
      }
      
      public function §1t7164s0§(param1:Array) : *
      {
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         this.§1t7156s0§ = param1;
         this.§1t7157s0§ = param1;
         this.§1t6807s0§ = 0;
         this.§1t7160s0§ = param1.length;
         this.§1t6805s0§ = this.§1t7160s0§ - this.§1t6823s0§.length;
         if(this.§1t6805s0§ < 0)
         {
            this.§1t6805s0§ = 0;
         }
         if(this.§1t6807s0§ > this.§1t6805s0§)
         {
            this.§1t6807s0§ = this.§1t6805s0§;
         }
         this.§1t6809s0§ = -1;
         this.§1t7166s0§();
         this.§1t7162s0§();
      }
      
      public function §1t7165s0§(param1:§1t23s0§) : *
      {
         var _loc3_:§1t23s0§ = null;
         if(param1 == null)
         {
            §1t3318s0§.instance.§1t3448s0§();
            return;
         }
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         var _loc2_:int = int(this.§1t7157s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.§1t7157s0§[_loc4_];
            if(_loc3_.key == param1.key)
            {
               this.§1t7157s0§[_loc4_] = param1;
               this.§1t6816s0§();
               break;
            }
            _loc4_++;
         }
      }
      
      internal function §1t7166s0§() : *
      {
         var _loc2_:int = 0;
         var _loc1_:int = int(this.§1t6823s0§.length);
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.§1t6823s0§[_loc2_].visible = false;
            this.§1t6823s0§[_loc2_].§1t6786s0§(false);
            _loc2_++;
         }
         this.§1t5020s0§.visible = this.§1t6807s0§ > 0;
         this.§1t5019s0§.visible = this.§1t7160s0§ - this.§1t6807s0§ > _loc1_;
         if(this.§1t7157s0§.length > 0)
         {
            this.notournamenttext.visible = false;
            if(_loc1_ > this.§1t7160s0§ - this.§1t6807s0§)
            {
               _loc1_ = this.§1t7160s0§ - this.§1t6807s0§;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.§1t6823s0§[_loc2_].§1t6784s0§(this.§1t7157s0§[_loc2_ + this.§1t6807s0§].title);
               this.§1t6823s0§[_loc2_].visible = true;
               _loc2_++;
            }
         }
         else
         {
            this.notournamenttext.visible = !this.§1t7158s0§;
            this.§1t5020s0§.visible = false;
            this.§1t5019s0§.visible = false;
            this.§1t7162s0§();
         }
      }
      
      internal function §1t7167s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         var _loc2_:§1t6782s0§ = param1.target.parent as §1t6782s0§;
         var _loc3_:int = 0;
         while(_loc3_ < this.§1t6823s0§.length)
         {
            this.§1t6823s0§[_loc3_].§1t6786s0§(this.§1t6823s0§[_loc3_] == _loc2_);
            _loc3_++;
         }
         this.§1t6809s0§ = _loc2_.§1t6787s0§();
         this.§1t6816s0§();
      }
      
      internal function §1t6816s0§() : *
      {
         var _loc1_:§1t23s0§ = null;
         var _loc2_:String = null;
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         if(this.§1t6809s0§ != -1)
         {
            _loc1_ = this.§1t7157s0§[this.§1t6809s0§ + this.§1t6807s0§];
            this.§1t7159s0§ = _loc1_;
            this.tournamenttitletext.text = _loc1_.title;
            if(_loc1_.key == "new")
            {
               this.joinbutton.visible = true;
               this.viewbutton.visible = false;
               if(!§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
               {
                  this.goldenTokenIcon.visible = true;
                  this.goldenTokenText.visible = true;
               }
               else
               {
                  this.goldenTokenIcon.visible = false;
                  this.goldenTokenText.visible = false;
               }
               this.refreshbutton.visible = false;
               this.errortext.visible = false;
               this.tournamentdetailstext.text = "";
               this.joinbutton.§1t5769s0§(§1t1521s0§.getString(11021));
               this.goldenTokenText.text = "5";
               this.tournamentCreate.show();
            }
            else
            {
               _loc2_ = "";
               if(_loc1_.status == 0)
               {
                  if(_loc1_.players.length == _loc1_.maxplayers)
                  {
                     _loc2_ += §1t1521s0§.getString(11032);
                  }
                  else
                  {
                     _loc2_ += §1t1521s0§.getString(11033) + " ( " + _loc1_.players.length + " / " + _loc1_.maxplayers + " )";
                  }
               }
               else if(_loc1_.status == 1)
               {
                  _loc2_ += §1t1521s0§.getString(11034);
               }
               else if(_loc1_.status == 2)
               {
                  _loc2_ += "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11035) + _loc1_.winner + "</font>";
               }
               _loc2_ += "\n";
               _loc2_ += "\n" + §1t1521s0§.getString(11036) + _loc1_.maxplayers;
               if(_loc1_.entryfee == 0)
               {
                  _loc2_ += "\n" + §1t1521s0§.getString(11037);
               }
               else
               {
                  _loc2_ += "\n" + §1t1521s0§.getString(11038,[_loc1_.entryfee.toString()]);
               }
               if(_loc1_.firstprize == 0)
               {
                  _loc2_ += "\n" + §1t1521s0§.getString(11039);
               }
               else if(_loc1_.maxplayers == 2)
               {
                  if(_loc1_.randommatchup)
                  {
                     _loc2_ += "\n" + §1t1521s0§.getString(11040) + "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11041,[_loc1_.firstprize]) + "</font>";
                  }
                  else
                  {
                     _loc2_ += "\n" + §1t1521s0§.getString(11040) + "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11042,[_loc1_.firstprize]) + "</font>";
                  }
               }
               else
               {
                  _loc2_ += "\n" + §1t1521s0§.getString(11043) + "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11042,[_loc1_.firstprize]) + "</font>";
                  _loc2_ += "\n" + §1t1521s0§.getString(11044) + "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11042,[_loc1_.secondprize]) + "</font>";
                  _loc2_ += "\n" + §1t1521s0§.getString(11045) + "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11042,[_loc1_.thirdprize]) + "</font>";
               }
               _loc2_ += "\n";
               _loc2_ += "\n" + §1t1521s0§.getString(11046) + _loc1_.minlvl + " - " + _loc1_.maxlvl;
               if(_loc1_.autostart)
               {
                  _loc2_ += "\n" + §1t1521s0§.getString(11047);
               }
               if(_loc1_.roundduration != 0)
               {
                  _loc3_ = _loc1_.roundduration - 300;
                  if(_loc3_ / 60 / 60 >= 1)
                  {
                     _loc2_ += "\n" + §1t1521s0§.getString(11048) + §1t1521s0§.getString(11051,[(_loc3_ / 60 / 60).toString()]);
                  }
                  else if(_loc3_ > 0)
                  {
                     _loc2_ += "\n" + §1t1521s0§.getString(11048) + §1t1521s0§.getString(11052,[(_loc3_ / 60).toString()]);
                  }
                  if(_loc3_ > 0)
                  {
                     _loc2_ += "\n" + §1t1521s0§.getString(11049);
                  }
               }
               if(_loc1_.organizer != "")
               {
                  _loc2_ += "\n" + §1t1521s0§.getString(11050) + _loc1_.organizer;
               }
               this.tournamentdetailstext.htmlText = _loc2_;
               this.joinbutton.visible = false;
               this.joinedtext.visible = false;
               this.viewbutton.visible = false;
               this.goldenTokenIcon.visible = false;
               this.goldenTokenText.visible = false;
               if(!this.§1t7158s0§)
               {
                  this.refreshbutton.visible = true;
               }
               this.errortext.visible = false;
               this.tournamentCreate.hide();
               if(_loc1_.status == 0)
               {
                  _loc4_ = §1t1523s0§.getLevel();
                  if(_loc4_ < _loc1_.minlvl || _loc4_ > _loc1_.maxlvl)
                  {
                     this.joinedtext.text = §1t1521s0§.getString(11094);
                     this.joinedtext.visible = true;
                  }
                  else if(_loc1_.players.indexOf(§1t1523s0§.charname) == -1)
                  {
                     this.joinbutton.visible = true;
                     this.joinbutton.§1t5769s0§(§1t1521s0§.getString(11022));
                     if(_loc1_.organizer == §1t1523s0§.charname)
                     {
                        _loc1_.entryfee = 0;
                     }
                     if(_loc1_.entryfee > 0)
                     {
                        this.goldenTokenIcon.visible = true;
                        this.goldenTokenText.visible = true;
                        this.goldenTokenText.text = _loc1_.entryfee;
                     }
                  }
                  else
                  {
                     this.joinedtext.text = §1t1521s0§.getString(11023);
                     this.joinedtext.visible = true;
                  }
                  if(_loc1_.players.length == _loc1_.maxplayers || (_loc1_.players.length == 8 || _loc1_.players.length == 16))
                  {
                     if(_loc1_.organizer == §1t1523s0§.charname)
                     {
                        this.viewbutton.visible = true;
                        this.viewbutton.§1t5769s0§(§1t1521s0§.getString(11024));
                     }
                     else if(_loc1_.players.length == _loc1_.maxplayers)
                     {
                        this.joinedtext.text = §1t1521s0§.getString(11025);
                        this.joinedtext.visible = true;
                     }
                  }
               }
               else if(_loc1_.status == 1 || _loc1_.status == 2)
               {
                  this.viewbutton.visible = true;
                  this.viewbutton.§1t5769s0§(§1t1521s0§.getString(11026));
               }
            }
         }
      }
      
      internal function §1t5120s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t6807s0§ > 0)
         {
            --this.§1t6807s0§;
            this.§1t7166s0§();
         }
      }
      
      internal function §1t5121s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t6807s0§ < this.§1t6805s0§)
         {
            ++this.§1t6807s0§;
            this.§1t7166s0§();
         }
      }
      
      internal function §1t7168s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t406s0§.instance.§1t6484s0§.loading.visible = true;
         if(this.§1t7158s0§)
         {
            if(this.§1t7155s0§ == null)
            {
               §1t3318s0§.instance.§1t3448s0§();
            }
            else
            {
               this.§1t7163s0§(this.§1t7155s0§);
            }
            this.historybutton.§1t5769s0§(§1t1521s0§.getString(11019));
            this.§1t7158s0§ = false;
         }
         else
         {
            if(this.§1t7156s0§ == null)
            {
               §1t3318s0§.instance.§1t3450s0§();
            }
            else
            {
               this.§1t7164s0§(this.§1t7156s0§);
            }
            this.historybutton.§1t5769s0§(§1t1521s0§.getString(11020));
            this.§1t7158s0§ = true;
         }
      }
      
      internal function §1t7064s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_ninja");
         §1t406s0§.instance.§1t6558s0§();
      }
      
      internal function §1t7065s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(§1t3317s0§.instance.§1t1847s0§() - this.§1t1838s0§ < 5)
         {
            return;
         }
         this.§1t1838s0§ = §1t3317s0§.instance.§1t1847s0§();
         §1t406s0§.instance.§1t6484s0§.loading.visible = true;
         §1t3318s0§.instance.§1t3449s0§(this.§1t7159s0§.key);
      }
      
      internal function §1t7169s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         if(this.§1t7159s0§.key == "new")
         {
            if(!this.tournamentCreate.§1t7142s0§())
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               this.errortext.visible = true;
               this.errortext.text = §1t1521s0§.getString(18);
            }
            else if(!this.tournamentCreate.§1t7143s0§())
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               this.errortext.visible = true;
               this.errortext.text = §1t1521s0§.getString(11029);
            }
            else if(§1t1523s0§.§1t9714s0§(20112) < 5 && !§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               this.errortext.visible = true;
               this.errortext.text = §1t1521s0§.getString(11030);
            }
            else
            {
               §1t88s0§.instance.§1t1516s0§("Snd_click");
               this.tournamentCreate.titlefield.text = §1t251s0§.instance.§1t3624s0§(this.tournamentCreate.titlefield.text);
               §1t406s0§.instance.§1t6484s0§.loading.visible = true;
               if(!§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
               {
                  this.goldtext.text = §1t1523s0§.§1t9713s0§(20112,-5).toString();
                  §1t3318s0§.instance.§1t1946s0§();
               }
               §1t251s0§.instance.§1t3573s0§(this.tournamentCreate.titlefield.text,this.tournamentCreate.§1t7120s0§,this.tournamentCreate.§1t7121s0§,this.tournamentCreate.§1t7122s0§,this.tournamentCreate.§1t7123s0§,this.tournamentCreate.§1t7138s0§(),this.tournamentCreate.§1t7125s0§);
            }
         }
         else
         {
            _loc2_ = §1t1523s0§.getLevel();
            if(_loc2_ < this.§1t7159s0§.minlvl || _loc2_ > this.§1t7159s0§.maxlvl)
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               this.errortext.visible = true;
               this.errortext.text = §1t1521s0§.getString(11031);
            }
            else if(§1t1523s0§.§1t9714s0§(20112) < this.§1t7159s0§.entryfee)
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               this.errortext.visible = true;
               this.errortext.text = §1t1521s0§.getString(11030);
            }
            else
            {
               §1t88s0§.instance.§1t1516s0§("Snd_click");
               §1t406s0§.instance.§1t6484s0§.loading.visible = true;
               this.goldtext.text = §1t1523s0§.§1t9713s0§(20112,-this.§1t7159s0§.entryfee).toString();
               §1t3318s0§.instance.§1t1946s0§();
               §1t251s0§.instance.§1t3574s0§(this.§1t7159s0§.key);
            }
         }
      }
      
      public function §1t7170s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         if(Boolean(this.§1t7159s0§.autostart) && this.§1t7159s0§.maxplayers == this.§1t7159s0§.players.length + 1)
         {
            setTimeout(§1t3318s0§.instance.§1t3449s0§,4000,this.§1t7159s0§.key);
         }
         else
         {
            §1t3318s0§.instance.§1t3449s0§(this.§1t7159s0§.key);
         }
      }
      
      public function §1t7171s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_error");
         this.goldtext.text = §1t1523s0§.§1t9713s0§(20112,Number(this.§1t7159s0§.entryfee)).toString();
         §1t3318s0§.instance.§1t1946s0§();
         this.errortext.visible = true;
         this.errortext.text = §1t1521s0§.getString(11028);
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         this.goldenTokenIcon.visible = false;
         this.goldenTokenText.visible = false;
         this.joinbutton.visible = false;
      }
      
      public function §1t7172s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         this.errortext.visible = false;
         §1t3318s0§.instance.§1t3448s0§();
      }
      
      public function §1t7173s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         §1t3318s0§.instance.§1t3449s0§(this.§1t7159s0§.key);
      }
      
      public function §1t7174s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_error");
         if(this.§1t7159s0§.players.length == this.§1t7159s0§.maxplayers)
         {
            §1t3318s0§.instance.§1t3449s0§(this.§1t7159s0§.key);
         }
         else
         {
            this.errortext.visible = true;
            this.errortext.text = §1t1521s0§.getString(11027);
            §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         }
      }
      
      internal function §1t7175s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.§1t7159s0§.status == 0 && (this.§1t7159s0§.players.length == this.§1t7159s0§.maxplayers || (this.§1t7159s0§.players.length == 8 || this.§1t7159s0§.players.length == 16)) && this.§1t7159s0§.organizer == §1t1523s0§.charname)
         {
            §1t406s0§.instance.§1t6484s0§.loading.visible = true;
            §1t251s0§.instance.§1t3575s0§(this.§1t7159s0§.key);
         }
         else
         {
            this.hide();
            §1t406s0§.instance.§1t6484s0§.§1t7178s0§(this.§1t7159s0§.key);
         }
      }
      
      public function §1t7176s0§() : *
      {
         this.§1t7155s0§ = null;
         this.§1t7156s0§ = null;
         this.§1t7157s0§ = null;
      }
      
      public function hide() : *
      {
         this.removeEventListeners();
         visible = false;
      }
   }
}

