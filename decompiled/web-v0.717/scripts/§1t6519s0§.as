package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1029")]
   public class §1t6519s0§ extends MovieClip
   {
      
      public var §1t5047s0§:§1t5016s0§;
      
      public var §1t6876s0§:§1t5050s0§;
      
      public var §1t5971s0§:TextField;
      
      public var §1t6877s0§:§1t5360s0§;
      
      public var §1t6291s0§:§1t394s0§;
      
      public var §1t5054s0§:TextField;
      
      public var §1t5056s0§:TextField;
      
      public var §1t5057s0§:TextField;
      
      public var §1t6878s0§:TextField;
      
      public var §1t6879s0§:TextField;
      
      public var §1t472s0§:TextField;
      
      public var §1t6880s0§:TextField;
      
      public var §1t6881s0§:SimpleButton;
      
      public var loading:MovieClip;
      
      public var §1t5776s0§:§1t5774s0§;
      
      public var §1t6882s0§:§1t5059s0§;
      
      public var §1t6883s0§:MovieClip;
      
      public var §1t5028s0§:§1t4912s0§;
      
      public var §1t5027s0§:§1t4912s0§;
      
      public var §1t6884s0§:MovieClip;
      
      public var §1t5021s0§:TextField;
      
      internal var §1t1173s0§:§1t73s0§;
      
      internal var §1t6885s0§:Vector.<§1t61s0§>;
      
      internal var §1t5092s0§:int;
      
      internal var §1t5089s0§:int;
      
      internal var §1t5088s0§:int;
      
      internal var buy:Boolean = true;
      
      internal var §1t6886s0§:Number = 0.5;
      
      internal var §1t6887s0§:Boolean = false;
      
      internal var §1t5098s0§:int = 65;
      
      internal var §1t5099s0§:int = 125;
      
      internal var §1t5100s0§:int = 85;
      
      internal var §1t5101s0§:int = 85;
      
      internal var §1t5102s0§:int = 4;
      
      internal var §1t5103s0§:int = 4;
      
      internal var §1t5023s0§:int;
      
      internal var slots:Vector.<§1t394s0§>;
      
      internal var §1t6888s0§:Boolean = false;
      
      internal var §1t6810s0§:int;
      
      internal var §1t6889s0§:int;
      
      public function §1t6519s0§()
      {
         var _loc1_:§1t394s0§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.§1t5023s0§ = this.§1t5102s0§ * this.§1t5103s0§;
         this.slots = new Vector.<§1t394s0§>(this.§1t5023s0§);
         super();
         this.§1t6876s0§.§1t5769s0§(§1t1521s0§.getString(83));
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t6784s0§(§1t1521s0§.getString(86));
         this.§1t6291s0§.§1t6874s0§();
         this.§1t1173s0§ = null;
         this.§1t5092s0§ = -1;
         this.§1t5089s0§ = 0;
         this.§1t5088s0§ = 0;
         this.buy = true;
         this.§1t6291s0§.visible = false;
         §1t1521s0§.§1t9290s0§(this.§1t472s0§,true);
         this.§1t472s0§.htmlText = "";
         this.§1t472s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t6879s0§,true);
         this.§1t6879s0§.text = "";
         this.§1t6879s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t6878s0§);
         this.§1t6878s0§.text = "";
         this.§1t6878s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t6880s0§);
         this.§1t6880s0§.text = "";
         this.§1t6880s0§.mouseEnabled = false;
         this.§1t6876s0§.visible = false;
         this.§1t5057s0§.mouseEnabled = false;
         this.§1t5054s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t5971s0§,true);
         this.§1t5971s0§.text = §1t1521s0§.getString(63);
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(64);
         §1t1521s0§.§1t9290s0§(this.§1t6884s0§.§1t5572s0§,true);
         this.§1t6884s0§.§1t5572s0§.text = §1t1521s0§.getString(59);
         §1t1521s0§.§1t9290s0§(this.§1t6884s0§.§1t16047s0§,true);
         this.§1t6884s0§.§1t16047s0§.text = §1t1521s0§.getString(223);
         §1t1521s0§.§1t9290s0§(this.§1t6884s0§.§1t16183s0§,true);
         this.§1t6884s0§.§1t16183s0§.text = §1t1521s0§.getString(65);
         §1t1521s0§.§1t9290s0§(this.§1t5776s0§.§1t5775s0§,true);
         this.§1t5776s0§.§1t5775s0§.mouseEnabled = false;
         this.§1t5776s0§.§1t5775s0§.text = §1t1521s0§.getString(486);
         this.loading.prompt.text = §1t1521s0§.getString(25);
         this.§1t6882s0§.§1t5769s0§(§1t1521s0§.getString(11508));
         _loc4_ = 0;
         while(_loc4_ < this.§1t5023s0§)
         {
            _loc1_ = new §1t394s0§();
            addChild(_loc1_);
            _loc3_ = Math.floor(_loc4_ / this.§1t5102s0§);
            _loc2_ = _loc4_ - _loc3_ * this.§1t5102s0§;
            _loc1_.x = this.§1t5098s0§ + _loc2_ * this.§1t5100s0§;
            _loc1_.y = this.§1t5099s0§ + _loc3_ * this.§1t5101s0§;
            _loc1_.id = _loc4_;
            this.slots[_loc4_] = _loc1_;
            this.slots[_loc4_].doubleClickEnabled = true;
            this.slots[_loc4_].mouseChildren = false;
            _loc4_++;
         }
         this.slots.fixed = true;
      }
      
      internal function §1t6784s0§(param1:String) : *
      {
         this.§1t5021s0§.text = param1;
      }
      
      public function §1t6890s0§(param1:§1t73s0§) : *
      {
         this.§1t6888s0§ = false;
         if(param1 != this.§1t1173s0§)
         {
            this.§1t1173s0§ = param1;
         }
         this.§1t6784s0§(§1t1521s0§.getString(83));
         this.§1t5054s0§.text = §1t1523s0§.§1t9616s0§().toString();
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
         this.§1t5092s0§ = -1;
         this.§1t5089s0§ = 0;
         this.§1t6885s0§ = this.§1t1173s0§.§1t837s0§;
         var _loc2_:* = 0;
         while(_loc2_ < this.§1t6885s0§.length)
         {
            this.§1t6885s0§[_loc2_].§1t849s0§();
            _loc2_++;
         }
         this.§1t5088s0§ = Math.floor((this.§1t6885s0§.length - 1) / this.§1t5102s0§);
         this.buy = true;
         this.§1t6895s0§();
         this.§1t5004s0§();
         this.visible = true;
         §1t1525s0§.§1t9940s0§().visible = false;
         this.§1t6876s0§.§1t5769s0§(§1t1521s0§.getString(83));
         this.§1t6876s0§.removeEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         this.§1t6876s0§.addEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         this.§1t6876s0§.visible = false;
         this.§1t6884s0§.visible = false;
         this.§1t6877s0§.visible = false;
         this.loading.visible = false;
         this.§1t6882s0§.visible = false;
         this.§1t6883s0§.visible = false;
         this.§1t6889s0§ = §1t1523s0§.§1t9616s0§();
         this.§1t6810s0§ = §1t1523s0§.§1t9613s0§();
      }
      
      public function §1t6891s0§(param1:§1t73s0§) : *
      {
         var _loc5_:§1t61s0§ = null;
         if(param1 != this.§1t1173s0§)
         {
            this.§1t1173s0§ = param1;
         }
         this.§1t6888s0§ = false;
         this.§1t6784s0§(§1t1521s0§.getString(83));
         this.§1t5054s0§.text = §1t1523s0§.§1t9616s0§().toString();
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
         this.§1t5092s0§ = -1;
         this.§1t5089s0§ = 0;
         this.§1t6885s0§ = this.§1t1173s0§.§1t837s0§;
         var _loc2_:* = 0;
         while(_loc2_ < this.§1t6885s0§.length)
         {
            this.§1t6885s0§[_loc2_].§1t849s0§();
            _loc2_++;
         }
         var _loc3_:int = §1t1525s0§.§1t9935s0§() * §1t3317s0§.instance.§1t1848s0§() + §1t3317s0§.instance.§1t1849s0§();
         §1t1644s0§.instance.§1t1658s0§(_loc3_);
         var _loc4_:§1t58s0§ = §1t58s0§.§1t8804s0§(_loc3_);
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            _loc5_ = new §1t61s0§(new XML());
            _loc5_.§1t851s0§(_loc4_);
            this.§1t6885s0§.push(_loc5_);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            _loc5_ = new §1t61s0§(new XML());
            _loc5_.§1t852s0§(_loc4_);
            this.§1t6885s0§.push(_loc5_);
            _loc2_++;
         }
         this.§1t5088s0§ = Math.floor((this.§1t6885s0§.length - 1) / this.§1t5102s0§);
         this.buy = true;
         this.§1t6895s0§();
         this.§1t5004s0§();
         this.visible = true;
         §1t1525s0§.§1t9940s0§().visible = false;
         this.§1t6876s0§.§1t5769s0§(§1t1521s0§.getString(83));
         this.§1t6876s0§.removeEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         this.§1t6876s0§.addEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         this.§1t6876s0§.visible = false;
         this.§1t6884s0§.visible = false;
         this.§1t6877s0§.visible = false;
         this.loading.visible = false;
         this.§1t6882s0§.visible = false;
         this.§1t6883s0§.visible = false;
         _loc4_.destroy();
         this.§1t6889s0§ = §1t1523s0§.§1t9616s0§();
         this.§1t6810s0§ = §1t1523s0§.§1t9613s0§();
      }
      
      public function §1t6892s0§(param1:§1t73s0§) : void
      {
         var _loc6_:Boolean = false;
         var _loc8_:§1t61s0§ = null;
         var _loc9_:int = 0;
         var _loc10_:§1t104s0§ = null;
         if(param1 != this.§1t1173s0§)
         {
            this.§1t1173s0§ = param1;
         }
         this.§1t6888s0§ = false;
         this.§1t6784s0§(§1t1521s0§.getString(84));
         this.§1t5054s0§.text = §1t1523s0§.§1t9616s0§().toString();
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
         this.§1t5092s0§ = -1;
         this.§1t5089s0§ = 0;
         this.§1t6885s0§ = new Vector.<§1t61s0§>();
         var _loc2_:Vector.<§1t17s0§> = §1t1523s0§.§1t9368s0§;
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:Vector.<§1t61s0§> = this.§1t1173s0§.§1t838s0§;
         var _loc5_:int = int(this.§1t1173s0§.§1t838s0§.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_)
         {
            _loc6_ = false;
            _loc8_ = null;
            _loc9_ = 0;
            while(_loc9_ < _loc5_ && _loc6_ == false)
            {
               if(_loc4_[_loc9_].id == _loc2_[_loc7_].§1t483s0§())
               {
                  _loc8_ = _loc4_[_loc9_];
                  this.§1t6885s0§.push(_loc8_);
                  _loc6_ = true;
               }
               _loc9_++;
            }
            if(_loc6_ == false)
            {
               _loc10_ = §1t1524s0§.§1t9862s0§(_loc2_[_loc7_].§1t483s0§());
               _loc8_ = §1t61s0§.create(_loc10_.id,_loc10_.§1t1210s0§(),§1t1521s0§.getString(_loc10_.§1t892s0§));
               if(!_loc10_.nodrop)
               {
                  this.§1t6885s0§.push(_loc8_);
               }
               else
               {
                  _loc8_ = null;
               }
            }
            if(_loc8_ != null)
            {
               _loc8_.item = _loc2_[_loc7_];
            }
            _loc7_++;
         }
         this.§1t5088s0§ = Math.floor((this.§1t6885s0§.length - 1) / this.§1t5102s0§);
         this.buy = false;
         this.§1t6895s0§();
         this.§1t5004s0§();
         this.§1t6876s0§.§1t5769s0§(§1t1521s0§.getString(84));
         this.§1t6876s0§.removeEventListener(MouseEvent.CLICK,this.§1t6897s0§);
         this.§1t6876s0§.addEventListener(MouseEvent.CLICK,this.§1t6897s0§);
         this.§1t6876s0§.visible = false;
         this.§1t6884s0§.visible = false;
         this.visible = true;
         §1t1525s0§.§1t9940s0§().visible = false;
         this.§1t6877s0§.visible = false;
         this.loading.visible = false;
         this.§1t6882s0§.visible = false;
         this.§1t6883s0§.visible = false;
      }
      
      public function §1t6893s0§() : *
      {
         this.§1t6884s0§.visible = true;
         this.§1t5593s0§();
         this.§1t6043s0§();
         this.§1t6888s0§ = true;
         this.§1t6882s0§.visible = true;
         this.§1t6883s0§.visible = true;
         §1t3318s0§.instance.§1t3463s0§("n",true);
      }
      
      public function §1t6894s0§(param1:MouseEvent) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5092s0§ != -1)
         {
            _loc4_ = this.§1t5092s0§ - this.§1t5089s0§ * this.§1t5102s0§;
            if(_loc4_ >= 0 && _loc4_ < this.§1t5023s0§)
            {
               this.slots[_loc4_].§1t6786s0§(false);
            }
         }
         var _loc2_:§1t394s0§ = §1t394s0§(param1.target);
         _loc2_.§1t6786s0§(true);
         this.§1t5092s0§ = this.§1t5089s0§ * this.§1t5102s0§ + _loc2_.id;
         this.§1t6291s0§.§1t6872s0§(_loc2_.§1t483s0§(),_loc2_.§1t6873s0§(),_loc2_.§1t527s0§(),_loc2_.§1t528s0§());
         this.§1t6291s0§.setItem(_loc2_.item);
         this.§1t6291s0§.§1t6868s0§(_loc2_.§1t976s0§(),_loc2_.§1t6869s0§());
         this.§1t6291s0§.visible = true;
         var _loc3_:§1t104s0§ = §1t1524s0§.§1t9862s0§(_loc2_.§1t483s0§());
         if(_loc3_ != null)
         {
            this.§1t472s0§.htmlText = _loc2_.item.§1t510s0§();
            _loc5_ = _loc2_.item.getLevel();
            if(_loc5_ > 0)
            {
               this.§1t6879s0§.text = §1t1521s0§.getString(47,[_loc5_]);
            }
            else
            {
               this.§1t6879s0§.text = "";
            }
            this.§1t6878s0§.text = "";
            if(_loc2_.item.§1t514s0§() == "")
            {
               this.§1t6878s0§.htmlText = _loc2_.item.§1t518s0§();
            }
            else
            {
               this.§1t6878s0§.htmlText = _loc2_.item.§1t514s0§() + "\n\n" + _loc2_.item.§1t518s0§();
            }
            if(this.§1t6291s0§.§1t483s0§() == 2208 || this.§1t6291s0§.§1t483s0§() == 2209)
            {
               this.§1t6880s0§.text = "";
            }
            else if(this.buy)
            {
               if(this.§1t6291s0§.§1t483s0§() == 20113)
               {
                  this.§1t6880s0§.text = §1t1521s0§.getString(87) + §1t1523s0§.§1t9699s0§(20112);
               }
               else
               {
                  this.§1t6880s0§.text = §1t1521s0§.getString(87) + §1t1523s0§.§1t9699s0§(this.§1t6291s0§.§1t483s0§());
               }
            }
            else if(§1t1524s0§.§1t9862s0§(_loc2_.§1t483s0§()).unique == 0 && _loc2_.item.§1t497s0§() == 0 && _loc2_.item.uses == 0 || this.§1t6291s0§.§1t483s0§() < 3000)
            {
               this.§1t6880s0§.text = §1t1521s0§.getString(87) + §1t1523s0§.§1t9640s0§(this.§1t6291s0§.§1t483s0§());
            }
            else
            {
               this.§1t6880s0§.text = "";
            }
         }
         this.§1t6876s0§.visible = true;
      }
      
      public function §1t5120s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5089s0§ > 0)
         {
            --this.§1t5089s0§;
            this.§1t6895s0§();
         }
      }
      
      public function §1t5121s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5089s0§ < this.§1t5088s0§)
         {
            ++this.§1t5089s0§;
            this.§1t6895s0§();
         }
      }
      
      public function §1t6895s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t394s0§ = null;
         var _loc5_:int = 0;
         var _loc1_:int = this.§1t5089s0§ * this.§1t5102s0§;
         var _loc2_:int = int(this.§1t6885s0§.length);
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
               _loc4_.§1t6872s0§(this.§1t6885s0§[_loc5_].id,"normal",this.§1t6885s0§[_loc5_].item.§1t527s0§(),this.§1t6885s0§[_loc5_].item.§1t528s0§());
               _loc4_.setItem(this.§1t6885s0§[_loc5_].item);
               if(this.buy)
               {
                  _loc4_.§1t6868s0§(this.§1t6885s0§[_loc5_].§1t761s0§(),this.§1t6885s0§[_loc5_].§1t854s0§());
               }
               else if(_loc4_.§1t483s0§() == 13002)
               {
                  _loc4_.§1t6868s0§(0,0);
               }
               else
               {
                  _loc4_.§1t6868s0§(_loc4_.§1t2217s0§().§1t546s0§(),0);
               }
               _loc4_.visible = true;
               _loc4_.§1t6786s0§(_loc5_ == this.§1t5092s0§);
            }
            _loc6_++;
         }
      }
      
      internal function §1t6896s0§(param1:MouseEvent) : *
      {
         this.§1t5363s0§(param1);
      }
      
      internal function §1t5363s0§(param1:MouseEvent) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t6291s0§.§1t483s0§());
         if(_loc2_ == null || this.§1t6291s0§.§1t6869s0§() < _loc2_.§1t854s0§())
         {
            §1t3317s0§.instance.§1t1982s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8902s0§) + " " + this.§1t6291s0§.§1t483s0§());
            return;
         }
         if(this.§1t6291s0§.§1t6865s0§ < _loc2_.§1t854s0§())
         {
            §1t3317s0§.instance.§1t1982s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8903s0§));
            return;
         }
         if(§1t1523s0§.§1t9714s0§(this.§1t6291s0§.§1t483s0§()) >= 99)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(this.§1t6291s0§.§1t6869s0§() > 0)
         {
            if(this.§1t6291s0§.§1t483s0§() == 2208)
            {
               if(§1t1523s0§.§1t9618s0§())
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(356),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  return;
               }
            }
            else if(this.§1t6291s0§.§1t483s0§() == 2209)
            {
               _loc3_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9402s0§);
               _loc4_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
               _loc5_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9405s0§);
               _loc6_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9406s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9406s0§);
               _loc7_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9414s0§);
               _loc8_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9415s0§);
               if(_loc3_ >= _loc4_ && _loc5_ >= _loc6_ && _loc7_ >= _loc8_)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(685),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  return;
               }
            }
            else if(this.§1t6291s0§.§1t483s0§() == 20112 || this.§1t6291s0§.§1t483s0§() == 20113)
            {
               if(§1t1523s0§.getLevel() < 5)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11134),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  return;
               }
            }
            §1t88s0§.instance.§1t1516s0§("Snd_click");
            if(§1t1523s0§.§1t9613s0§() < this.§1t6291s0§.§1t6869s0§())
            {
               §1t406s0§.instance.§1t6552s0§(this.§1t6291s0§.§1t6869s0§());
            }
            else
            {
               setChildIndex(this.§1t6877s0§,numChildren - 1);
               setChildIndex(this.loading,numChildren - 1);
               this.§1t6877s0§.show(this.§1t6291s0§.item.§1t510s0§());
            }
         }
         else
         {
            this.§1t5125s0§();
         }
      }
      
      internal function §1t5126s0§() : *
      {
         §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
         §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
         §1t88s0§.instance.§1t1516s0§("Snd_error");
      }
      
      public function §1t5125s0§() : *
      {
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t6291s0§.§1t483s0§());
         if(this.§1t6291s0§.§1t6869s0§() < _loc1_.§1t854s0§())
         {
            §1t3317s0§.instance.§1t1982s0§(this.§1t6291s0§.item.§1t490s0§() + " " + this.§1t6291s0§.§1t6869s0§() + " " + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8902s0§));
            return;
         }
         if(this.§1t6291s0§.§1t6865s0§ < _loc1_.§1t854s0§())
         {
            §1t3317s0§.instance.§1t1982s0§(this.§1t6291s0§.item.§1t490s0§() + " " + this.§1t6291s0§.§1t6865s0§ + " " + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8903s0§));
            return;
         }
         if(this.§1t6291s0§.§1t483s0§() != 2208 && this.§1t6291s0§.§1t483s0§() != 2209 && this.§1t6291s0§.§1t483s0§() != 20112 && _loc1_.§1t854s0§() > 0 && _loc1_.§1t854s0§() < 5)
         {
            §1t3318s0§.instance.§1t1982s0§(this.§1t6291s0§.item.§1t490s0§() + " " + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8902s0§) + "4",true);
            return;
         }
         if(_loc1_.§1t854s0§() < 0 || _loc1_.§1t1210s0§() < 0 || this.§1t6291s0§.§1t976s0§() < 0)
         {
            §1t3318s0§.instance.§1t1982s0§(this.§1t6291s0§.item.§1t490s0§() + " " + _loc1_.§1t854s0§() + " " + _loc1_.§1t1210s0§() + " " + this.§1t6291s0§.§1t976s0§() + " " + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8902s0§) + "5");
            return;
         }
         if(§1t1523s0§.§1t9616s0§() >= this.§1t6291s0§.§1t976s0§() && (this.§1t6291s0§.§1t6869s0§() == 0 || this.§1t6291s0§.§1t6869s0§() > 0 && §1t251s0§.instance.§1t3595s0§()))
         {
            if(this.§1t6291s0§.§1t483s0§() == 2208)
            {
               §1t1523s0§.§1t9619s0§(200);
               §1t88s0§.instance.§1t1513s0§();
            }
            else if(this.§1t6291s0§.§1t483s0§() == 2209)
            {
               §1t1523s0§.§1t9578s0§();
               §1t1523s0§.§1t9579s0§();
               §1t88s0§.instance.§1t1513s0§();
            }
            else if(this.§1t6291s0§.§1t483s0§() == 2212)
            {
               §1t1523s0§.§1t7693s0§(this.§1t6291s0§.§1t2217s0§());
               §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
               this.§1t5026s0§(null);
               §1t406s0§.instance.§1t5947s0§.hide();
               §1t406s0§.instance.§1t6572s0§(false);
            }
            else if(this.§1t6291s0§.§1t483s0§() == 2215)
            {
               §1t1523s0§.§1t7693s0§(this.§1t6291s0§.§1t2217s0§());
               §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
               this.§1t5026s0§(null);
               §1t406s0§.instance.§1t5947s0§.hide();
               §1t406s0§.instance.§1t6572s0§(true);
            }
            else if(this.§1t6291s0§.§1t483s0§() == 20113)
            {
               this.§1t6880s0§.text = §1t1521s0§.getString(87) + §1t1523s0§.§1t9642s0§(20112,10).toString();
            }
            else
            {
               if(this.§1t6291s0§.§1t2217s0§().§1t543s0§())
               {
                  this.§1t6880s0§.text = §1t1521s0§.getString(87) + §1t1523s0§.§1t9642s0§(this.§1t6291s0§.§1t483s0§(),1).toString();
               }
               else
               {
                  §1t1523s0§.§1t7693s0§(this.§1t6291s0§.§1t2217s0§());
                  this.§1t6880s0§.text = §1t1521s0§.getString(87) + §1t1523s0§.§1t9699s0§(this.§1t6291s0§.§1t483s0§()).toString();
               }
               §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
            }
            this.§1t5054s0§.text = §1t1523s0§.§1t9619s0§(-this.§1t6291s0§.§1t976s0§()).toString();
            §1t1523s0§.§1t1684s0§(60006,this.§1t6291s0§.§1t976s0§());
            this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
            if(this.§1t6291s0§.§1t6869s0§() > 0 || this.§1t6888s0§)
            {
               §1t3317s0§.instance.§1t1986s0§(this.§1t6291s0§.§1t483s0§(),this.§1t6291s0§.item.§1t490s0§(),this.§1t6291s0§.§1t6869s0§());
            }
            §1t88s0§.instance.§1t1515s0§();
            if(this.§1t6888s0§ && this.§1t6810s0§ <= §1t1523s0§.§1t9613s0§())
            {
               §1t3317s0§.instance.§1t1982s0§(this.§1t6291s0§.item.§1t490s0§() + " " + this.§1t6810s0§ + " " + §1t1523s0§.§1t9613s0§() + " " + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8902s0§) + "12");
            }
            if(!this.§1t6888s0§ && this.§1t6810s0§ <= §1t1523s0§.§1t9613s0§() && this.§1t6889s0§ <= §1t1523s0§.§1t9616s0§())
            {
               §1t3317s0§.instance.§1t1982s0§(this.§1t6291s0§.item.§1t490s0§() + " " + this.§1t6810s0§ + " " + §1t1523s0§.§1t9613s0§() + " " + this.§1t6889s0§ + " " + §1t1523s0§.§1t9616s0§() + " " + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8902s0§) + "13");
            }
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         this.loading.visible = false;
      }
      
      public function §1t6897s0§(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         §1t88s0§.instance.§1t1515s0§();
         §1t1523s0§.§1t9619s0§(this.§1t6291s0§.§1t976s0§());
         if(§1t1524s0§.§1t9862s0§(this.§1t6291s0§.§1t483s0§()).unique == 0 && this.§1t6291s0§.item.§1t497s0§() == 0 && this.§1t6291s0§.item.uses == 0)
         {
            _loc3_ = §1t1523s0§.§1t9642s0§(this.§1t6291s0§.§1t483s0§(),-1);
         }
         else
         {
            _loc3_ = 0;
            §1t1523s0§.§1t7692s0§(this.§1t6291s0§.item);
         }
         if(_loc3_ <= 0)
         {
            this.§1t6291s0§.visible = false;
            this.§1t6876s0§.visible = false;
            this.§1t472s0§.htmlText = "";
            this.§1t6879s0§.text = "";
            this.§1t6880s0§.text = "";
            this.§1t6878s0§.text = "";
            _loc2_ = this.§1t5092s0§;
            this.§1t6885s0§.splice(_loc2_,1);
            this.§1t5088s0§ = Math.floor((this.§1t6885s0§.length - 1) / this.§1t5102s0§);
            if(this.§1t5088s0§ < 0)
            {
               this.§1t5089s0§ = 0;
               this.§1t5088s0§ = 0;
            }
            this.§1t5092s0§ = -1;
            this.§1t6895s0§();
         }
         else
         {
            this.§1t6880s0§.text = §1t1521s0§.getString(87) + _loc3_;
         }
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
         this.§1t5054s0§.text = §1t1523s0§.§1t9616s0§().toString();
      }
      
      public function §1t5026s0§(param1:MouseEvent) : *
      {
         this.§1t6888s0§ = false;
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
         }
         this.§1t5089s0§ = 0;
         this.§1t6291s0§.visible = false;
         this.§1t472s0§.htmlText = "";
         this.§1t6879s0§.text = "";
         this.§1t6878s0§.text = "";
         this.§1t6880s0§.text = "";
         this.§1t6876s0§.visible = false;
         this.removeEventListeners();
         §1t3317s0§.instance.§1t1946s0§();
         this.visible = false;
         §1t1525s0§.§1t9940s0§().visible = true;
         §1t406s0§.instance.§1t5947s0§.§1t5892s0§();
         if(§1t406s0§.instance.§1t6484s0§.visible)
         {
            §1t406s0§.instance.§1t6484s0§.§1t7179s0§();
         }
         else if(this.§1t6887s0§)
         {
            §1t1541s0§.§1t10045s0§();
         }
         this.§1t6887s0§ = false;
      }
      
      public function §1t6898s0§() : *
      {
         this.§1t6887s0§ = true;
      }
      
      public function §1t5004s0§() : void
      {
         this.§1t5027s0§.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5028s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.§1t6881s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t6876s0§.§1t5004s0§();
         this.§1t5776s0§.addEventListener(MouseEvent.CLICK,this.§1t5900s0§);
         this.§1t6882s0§.addEventListener(MouseEvent.CLICK,this.§1t6900s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            this.slots[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t6894s0§);
            this.slots[_loc1_].§1t5004s0§();
            if(this.buy)
            {
               this.slots[_loc1_].addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6896s0§);
            }
            else
            {
               this.slots[_loc1_].addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6897s0§);
            }
            _loc1_++;
         }
         this.§1t5047s0§.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      public function removeEventListeners() : void
      {
         this.§1t6881s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5027s0§.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5028s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         if(this.buy)
         {
            this.§1t6876s0§.removeEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         }
         else
         {
            this.§1t6876s0§.removeEventListener(MouseEvent.CLICK,this.§1t6897s0§);
         }
         this.§1t6876s0§.removeEventListeners();
         this.§1t5776s0§.removeEventListener(MouseEvent.CLICK,this.§1t5900s0§);
         this.§1t6882s0§.removeEventListener(MouseEvent.CLICK,this.§1t6900s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            this.slots[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t6894s0§);
            this.slots[_loc1_].removeEventListeners();
            if(this.buy)
            {
               this.slots[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6896s0§);
            }
            else
            {
               this.slots[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6897s0§);
            }
            _loc1_++;
         }
      }
      
      internal function §1t5900s0§(param1:MouseEvent) : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
            §1t406s0§.instance.§1t6498s0§.show();
         }
      }
      
      public function §1t5593s0§() : *
      {
         if(this.§1t6884s0§.visible)
         {
            this.§1t6884s0§.§1t5571s0§.text = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§) + "/" + §1t1523s0§.§1t9400s0§;
         }
      }
      
      public function §1t6043s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§1t6884s0§.visible)
         {
            _loc1_ = §1t1523s0§.§1t9714s0§(13);
            _loc2_ = §1t1523s0§.§1t9714s0§(14);
            this.§1t6884s0§.§1t16364s0§.text = _loc1_ + " / " + _loc2_;
            this.§1t6884s0§.§1t16365s0§.text = this.§1t6884s0§.§1t16364s0§.text;
            this.§1t6884s0§.§1t16066s0§.bar.scaleX = _loc1_ / _loc2_;
         }
      }
      
      public function §1t6899s0§() : *
      {
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
         this.§1t6810s0§ = §1t1523s0§.§1t9613s0§();
      }
      
      public function §1t6900s0§(param1:MouseEvent) : void
      {
         §1t406s0§.instance.§1t6531s0§();
      }
      
      public function §1t6901s0§() : *
      {
         §1t88s0§.instance.§1t1513s0§();
         this.loading.visible = false;
         §1t3317s0§.instance.§1t1986s0§(8,"reroll",1);
         §1t3317s0§.instance.§1t1946s0§();
         this.§1t6902s0§();
         var _loc1_:§1t73s0§ = new §1t73s0§(new XMLList());
         _loc1_.§1t843s0§(Math.random() * 1000);
         this.§1t6890s0§(_loc1_);
         this.§1t6893s0§();
      }
      
      internal function §1t6902s0§() : *
      {
         this.§1t6291s0§.visible = false;
         this.§1t472s0§.htmlText = "";
         this.§1t6879s0§.text = "";
         this.§1t6878s0§.text = "";
         this.§1t6880s0§.text = "";
         this.§1t6876s0§.visible = false;
      }
      
      internal function §1t6903s0§() : *
      {
         this.loading.visible = false;
         §1t406s0§.instance.§1t6552s0§(1);
      }
   }
}

