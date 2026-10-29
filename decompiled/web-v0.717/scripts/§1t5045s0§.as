package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1602")]
   public class §1t5045s0§ extends MovieClip
   {
      
      public static var instance:§1t5045s0§;
      
      internal static var §1t12340s0§:int = 0;
      
      internal static var §1t12341s0§:int = 1;
      
      internal static var §1t12342s0§:int = 2;
      
      internal static var §1t12343s0§:int = 3;
      
      internal static var §1t12344s0§:int = 4;
      
      public var §1t5046s0§:TextField;
      
      public var §1t5047s0§:§1t5016s0§;
      
      public var closeWindow:SimpleButton;
      
      public var §1t5049s0§:§1t5050s0§;
      
      public var §1t5051s0§:§1t4912s0§;
      
      public var §1t5052s0§:§1t394s0§;
      
      public var §1t5053s0§:TextField;
      
      public var §1t5054s0§:TextField;
      
      public var §1t5055s0§:MovieClip;
      
      public var §1t5056s0§:TextField;
      
      public var §1t5057s0§:TextField;
      
      public var §1t5058s0§:§1t5059s0§;
      
      public var §1t5060s0§:TextField;
      
      public var §1t5061s0§:§1t4912s0§;
      
      public var §1t5062s0§:§1t4912s0§;
      
      public var loading:MovieClip;
      
      public var moneybar:MovieClip;
      
      public var §1t5065s0§:MovieClip;
      
      public var §1t5066s0§:MovieClip;
      
      public var §1t5067s0§:MovieClip;
      
      public var §1t5068s0§:TextField;
      
      public var §1t5069s0§:§1t5070s0§;
      
      public var §1t5071s0§:MovieClip;
      
      public var §1t5072s0§:TextField;
      
      public var §1t5073s0§:MovieClip;
      
      public var §1t5074s0§:TextField;
      
      public var §1t5075s0§:MovieClip;
      
      public var §1t5076s0§:TextField;
      
      public var §1t5077s0§:MovieClip;
      
      public var §1t5078s0§:TextField;
      
      public var §1t5079s0§:TextField;
      
      public var §1t5080s0§:§1t4912s0§;
      
      public var §1t5081s0§:§1t4912s0§;
      
      public var §1t5082s0§:TextField;
      
      public var §1t5083s0§:MovieClip;
      
      public var §1t5021s0§:TextField;
      
      internal var inventory:Vector.<§1t17s0§>;
      
      internal var §1t5085s0§:Vector.<§1t17s0§>;
      
      internal var §1t5086s0§:int;
      
      internal var §1t5087s0§:int;
      
      internal var §1t5088s0§:int;
      
      internal var §1t5089s0§:int;
      
      internal var §1t5090s0§:§1t394s0§;
      
      internal var §1t5091s0§:§1t17s0§;
      
      internal var §1t5092s0§:int = -1;
      
      internal var §1t5093s0§:int = -1;
      
      internal var §1t5094s0§:int = 0;
      
      internal var §1t916s0§:§1t24s0§;
      
      internal var §1t5095s0§:int = 0;
      
      internal const §1t5096s0§:int = 0;
      
      internal const §1t5097s0§:int = 1;
      
      internal var §1t5098s0§:int = 380;
      
      internal var §1t5099s0§:int = 268;
      
      internal var §1t5100s0§:int = 80;
      
      internal var §1t5101s0§:int = 80;
      
      internal var §1t5102s0§:int = 4;
      
      internal var §1t5103s0§:int = 2;
      
      internal var §1t5023s0§:int;
      
      internal var slots:Vector.<§1t394s0§>;
      
      internal var §1t5104s0§:int;
      
      internal var §1t5105s0§:int;
      
      internal var §1t5106s0§:int = 60;
      
      internal var §1t5107s0§:int = 106;
      
      internal var §1t5108s0§:int = 3;
      
      internal var §1t5109s0§:int = 4;
      
      internal var §1t5110s0§:int;
      
      internal var §1t5111s0§:Vector.<§1t394s0§>;
      
      internal var §1t5112s0§:Array;
      
      internal var §1t5113s0§:Array;
      
      internal var §1t5115s0§:int;
      
      internal var §1t5134s0§:Boolean;
      
      internal var §1t5135s0§:Boolean;
      
      public function §1t5045s0§()
      {
         var _loc1_:§1t394s0§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.§1t5023s0§ = this.§1t5102s0§ * this.§1t5103s0§;
         this.slots = new Vector.<§1t394s0§>(this.§1t5023s0§);
         this.§1t5110s0§ = this.§1t5108s0§ * this.§1t5109s0§;
         this.§1t5111s0§ = new Vector.<§1t394s0§>(this.§1t5110s0§);
         super();
         instance = this;
         §1t1521s0§.§1t9290s0§(this.§1t5079s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5060s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5082s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5046s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t15863s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t15864s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t6879s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(64);
         this.§1t5049s0§.visible = false;
         this.§1t5066s0§.§1t15865s0§.§1t6874s0§();
         this.§1t5129s0§(null);
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
         _loc4_ = 0;
         while(_loc4_ < this.§1t5110s0§)
         {
            _loc1_ = new §1t394s0§();
            addChild(_loc1_);
            _loc3_ = Math.floor(_loc4_ / this.§1t5108s0§);
            _loc2_ = _loc4_ - _loc3_ * this.§1t5108s0§;
            _loc1_.x = this.§1t5106s0§ + _loc2_ * this.§1t5100s0§;
            _loc1_.y = this.§1t5107s0§ + _loc3_ * this.§1t5101s0§;
            _loc1_.id = _loc4_;
            this.§1t5111s0§[_loc4_] = _loc1_;
            this.§1t5111s0§[_loc4_].doubleClickEnabled = true;
            this.§1t5111s0§[_loc4_].mouseChildren = false;
            _loc4_++;
         }
         this.§1t5111s0§.fixed = true;
         this.§1t5112s0§ = new Array();
         this.§1t5112s0§.push(this.§1t5071s0§);
         this.§1t5112s0§.push(this.§1t5073s0§);
         this.§1t5112s0§.push(this.§1t5075s0§);
         this.§1t5112s0§.push(this.§1t5077s0§);
         _loc4_ = 0;
         while(_loc4_ < this.§1t5112s0§.length)
         {
            this.§1t5112s0§[_loc4_].gotoAndStop(_loc4_ + 3);
            _loc4_++;
         }
         this.§1t5113s0§ = new Array();
         this.§1t5113s0§.push(this.§1t5072s0§);
         this.§1t5113s0§.push(this.§1t5074s0§);
         this.§1t5113s0§.push(this.§1t5076s0§);
         this.§1t5113s0§.push(this.§1t5078s0§);
         this.§1t5083s0§.gotoAndStop(8);
         this.§1t5052s0§.visible = false;
         this.§1t5066s0§.chatbutton.visible = false;
         this.loading.prompt.text = §1t1521s0§.getString(25);
      }
      
      public function show(param1:int = 0) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.§1t5095s0§ = param1;
         this.§1t5021s0§.text = §1t1521s0§.getString(681);
         this.§1t5079s0§.text = §1t1521s0§.getString(681);
         if(§1t412s0§.instance.visible)
         {
            this.§1t5060s0§.htmlText = "<font color=\'#FFCC00\'>" + §1t1523s0§.charname + "</font>";
         }
         else
         {
            this.§1t5060s0§.text = §1t1521s0§.getString(682);
         }
         this.§1t5058s0§.§1t5769s0§(§1t1521s0§.getString(691));
         if(param1 == this.§1t5097s0§)
         {
            if(§1t24s0§.§1t8782s0§)
            {
               this.inventory = §1t1523s0§.§1t9375s0§;
            }
            else
            {
               this.inventory = §1t1523s0§.§1t9368s0§;
               this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
            }
            this.§1t5085s0§ = this.§1t916s0§.§1t560s0§;
            _loc2_ = §1t412s0§.instance.§1t916s0§.§1t562s0§.§1t931s0§();
            if(_loc2_ == 0)
            {
               this.§1t5087s0§ = 10;
            }
            else if(_loc2_ == 0)
            {
               this.§1t5087s0§ = 20;
            }
            else if(_loc2_ == 0)
            {
               this.§1t5087s0§ = 30;
            }
         }
         else
         {
            this.inventory = §1t1523s0§.§1t9368s0§;
            this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
            this.§1t5085s0§ = §1t1523s0§.§1t9375s0§;
            this.§1t5087s0§ = §1t1523s0§.§1t9630s0§();
         }
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         this.§1t5089s0§ = 0;
         this.§1t5092s0§ = -1;
         this.§1t5117s0§();
         this.§1t5104s0§ = Math.floor((this.§1t5085s0§.length - 1) / this.§1t5108s0§);
         this.§1t5105s0§ = 0;
         this.§1t5093s0§ = -1;
         this.§1t5118s0§();
         this.§1t5090s0§ = null;
         this.§1t5091s0§ = null;
         this.visible = true;
         §1t1525s0§.§1t9940s0§().visible = false;
         this.§1t5052s0§.§1t6859s0§.text = "";
         setChildIndex(this.§1t5052s0§,numChildren - 1);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.§1t5004s0§();
         if(this.inventory.length > 0)
         {
            this.§1t5140s0§(this.slots[0]);
         }
         else if(this.§1t5085s0§.length > 0)
         {
            this.§1t5143s0§(this.§1t5111s0§[0]);
         }
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
         this.loading.visible = false;
         if(param1 == this.§1t5097s0§)
         {
            this.§1t5021s0§.text = §1t1521s0§.getString(22074);
            this.§1t5079s0§.text = §1t1521s0§.getString(20040);
            if(§1t24s0§.§1t8782s0§)
            {
               this.§1t5060s0§.text = §1t1521s0§.getString(681);
            }
            this.§1t5056s0§.visible = false;
            this.§1t5057s0§.visible = false;
            this.§1t5065s0§.visible = false;
            this.moneybar.visible = false;
            this.§1t5058s0§.visible = false;
            this.§1t5055s0§.visible = false;
            this.§1t5054s0§.visible = false;
            this.§1t5066s0§.chatbutton.visible = false;
            this.§1t5069s0§.visible = true;
            this.§1t5083s0§.visible = true;
            this.§1t5053s0§.visible = true;
            this.§1t5068s0§.visible = true;
            this.§1t5067s0§.visible = true;
            _loc3_ = 0;
            while(_loc3_ < this.§1t5112s0§.length)
            {
               this.§1t5112s0§[_loc3_].visible = true;
               this.§1t5113s0§[_loc3_].visible = true;
               _loc3_++;
            }
         }
         else
         {
            this.§1t5056s0§.visible = true;
            this.§1t5057s0§.visible = true;
            this.§1t5065s0§.visible = true;
            this.moneybar.visible = true;
            this.§1t5058s0§.visible = true;
            this.§1t5055s0§.visible = true;
            this.§1t5054s0§.visible = true;
            this.§1t5066s0§.chatbutton.visible = true;
            this.§1t5069s0§.visible = false;
            this.§1t5083s0§.visible = false;
            this.§1t5053s0§.visible = false;
            this.§1t5068s0§.visible = false;
            this.§1t5067s0§.visible = false;
            _loc3_ = 0;
            while(_loc3_ < this.§1t5112s0§.length)
            {
               this.§1t5112s0§[_loc3_].visible = false;
               this.§1t5113s0§[_loc3_].visible = false;
               _loc3_++;
            }
         }
      }
      
      public function §1t5114s0§(param1:§1t24s0§) : *
      {
         this.§1t916s0§ = param1;
         this.show(this.§1t5097s0§);
         if(param1.§1t561s0§ == -1)
         {
            this.§1t5067s0§.bar.scaleX = 0;
            this.§1t5068s0§.text = "0%";
            this.§1t5069s0§.§1t5769s0§(§1t1521s0§.getString(11024));
            this.§1t5116s0§();
         }
         else
         {
            this.§1t5069s0§.§1t5769s0§(§1t1521s0§.getString(17));
            this.§1t5116s0§();
         }
      }
      
      internal function §1t5116s0§() : *
      {
         var _loc1_:Array = this.§1t916s0§.§1t634s0§();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            this.§1t5113s0§[_loc3_].text = _loc1_[_loc3_].toString();
            _loc2_ += _loc1_[_loc3_];
            _loc3_++;
         }
         this.§1t5115s0§ = _loc2_ * 10;
         this.§1t5053s0§.text = this.§1t937s0§(this.§1t5115s0§);
      }
      
      internal function §1t937s0§(param1:int) : String
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:int = param1 % 60;
         var _loc3_:int = (param1 - _loc2_) / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = (_loc3_ - _loc4_) / 60;
         if(_loc2_ < 10)
         {
            _loc6_ = "0" + _loc2_.toString();
         }
         else
         {
            _loc6_ = _loc2_.toString();
         }
         if(_loc4_ < 10 && _loc5_ > 0)
         {
            _loc7_ = "0" + _loc4_.toString();
         }
         else
         {
            _loc7_ = _loc4_.toString();
         }
         if(_loc5_ == 0)
         {
            return _loc7_ + ":" + _loc6_;
         }
         return _loc5_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function §1t5117s0§() : *
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:§1t394s0§ = null;
         var _loc5_:int = 0;
         _loc1_ = this.§1t5089s0§ * this.§1t5102s0§;
         var _loc2_:int = int(this.inventory.length);
         this.§1t5062s0§.visible = this.§1t5089s0§ > 0;
         this.§1t5061s0§.visible = Math.ceil(_loc2_ / this.§1t5102s0§) - this.§1t5089s0§ > this.§1t5103s0§;
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
               _loc4_.§1t6872s0§(this.inventory[_loc5_].§1t483s0§(),this.inventory[_loc5_].§1t508s0§(),this.inventory[_loc5_].§1t527s0§(),this.inventory[_loc5_].§1t528s0§());
               _loc4_.setItem(this.inventory[_loc5_]);
               if(this.inventory[_loc5_].§1t543s0§())
               {
                  _loc4_.§1t6870s0§("x" + this.inventory[_loc5_].§1t484s0§().toString());
               }
               else
               {
                  _loc4_.§1t6870s0§("");
               }
               _loc4_.visible = true;
               if(_loc5_ == this.§1t5092s0§)
               {
                  _loc4_.§1t6786s0§(true);
                  this.§1t5090s0§ = _loc4_;
               }
               else
               {
                  _loc4_.§1t6786s0§(false);
               }
            }
            _loc6_++;
         }
         if(this.§1t5095s0§ == this.§1t5096s0§)
         {
            this.§1t5046s0§.text = §1t1521s0§.getString(139) + ": " + §1t1523s0§.§1t9595s0§() + " / " + §1t1523s0§.§1t9603s0§().toString();
            if(§1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§())
            {
               this.§1t5046s0§.textColor = 16711680;
            }
            else
            {
               this.§1t5046s0§.textColor = 16777215;
            }
         }
         else
         {
            this.§1t5046s0§.text = "";
         }
      }
      
      public function §1t5118s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t394s0§ = null;
         var _loc5_:int = 0;
         var _loc1_:int = this.§1t5105s0§ * this.§1t5108s0§;
         var _loc2_:int = int(this.§1t5085s0§.length);
         this.§1t5081s0§.visible = this.§1t5105s0§ > 0;
         this.§1t5080s0§.visible = Math.ceil(_loc2_ / this.§1t5108s0§) - this.§1t5105s0§ > this.§1t5109s0§;
         if(_loc2_ - _loc1_ < this.§1t5110s0§)
         {
            _loc3_ = _loc2_ - _loc1_;
         }
         else
         {
            _loc3_ = this.§1t5110s0§;
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.§1t5110s0§)
         {
            _loc4_ = this.§1t5111s0§[_loc6_];
            if(_loc6_ >= _loc3_)
            {
               _loc4_.visible = false;
            }
            else
            {
               _loc5_ = _loc1_ + _loc6_;
               _loc4_.§1t6872s0§(this.§1t5085s0§[_loc5_].§1t483s0§(),this.§1t5085s0§[_loc5_].§1t508s0§(),this.§1t5085s0§[_loc5_].§1t527s0§(),this.§1t5085s0§[_loc5_].§1t528s0§());
               _loc4_.setItem(this.§1t5085s0§[_loc5_]);
               if(this.§1t5085s0§[_loc5_].§1t543s0§())
               {
                  _loc4_.§1t6870s0§("x" + this.§1t5085s0§[_loc5_].§1t484s0§().toString());
               }
               else
               {
                  _loc4_.§1t6870s0§("");
               }
               _loc4_.visible = true;
               if(_loc5_ == this.§1t5093s0§)
               {
                  _loc4_.§1t6786s0§(true);
                  this.§1t5090s0§ = _loc4_;
               }
               else
               {
                  _loc4_.§1t6786s0§(false);
               }
            }
            _loc6_++;
         }
         if(this.§1t5095s0§ == this.§1t5097s0§)
         {
            this.§1t5086s0§ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc2_)
            {
               this.§1t5086s0§ += this.§1t5085s0§[_loc6_].§1t484s0§();
               _loc6_++;
            }
            this.§1t5082s0§.text = §1t1521s0§.getString(22079,[this.§1t5086s0§,this.§1t5087s0§]);
         }
         else
         {
            this.§1t5086s0§ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc2_)
            {
               this.§1t5086s0§ += this.§1t5085s0§[_loc6_].§1t545s0§();
               _loc6_++;
            }
            this.§1t5082s0§.text = §1t1521s0§.getString(139) + ": " + this.§1t5086s0§ + " / " + this.§1t5087s0§;
         }
         if(this.§1t5086s0§ >= this.§1t5087s0§)
         {
            this.§1t5082s0§.textColor = 16711680;
         }
         else
         {
            this.§1t5082s0§.textColor = 16777215;
         }
      }
      
      internal function §1t5119s0§() : String
      {
         var _loc1_:int = §1t1523s0§.§1t1088s0§();
         return _loc1_ + " - " + (_loc1_ + §1t1523s0§.§1t9591s0§()) + " " + §1t1521s0§.getString(142);
      }
      
      public function §1t5004s0§() : void
      {
         this.§1t5049s0§.addEventListener(MouseEvent.CLICK,this.§1t5131s0§);
         this.§1t5049s0§.§1t5004s0§();
         this.§1t5069s0§.addEventListener(MouseEvent.CLICK,this.§1t5145s0§);
         this.closeWindow.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5062s0§.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5061s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.§1t5081s0§.addEventListener(MouseEvent.CLICK,this.§1t5122s0§);
         this.§1t5080s0§.addEventListener(MouseEvent.CLICK,this.§1t5123s0§);
         this.§1t5058s0§.addEventListener(MouseEvent.CLICK,this.§1t5124s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            this.slots[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t5139s0§);
            this.slots[_loc1_].addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t5141s0§);
            this.slots[_loc1_].§1t5004s0§();
            this.slots[_loc1_].addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.slots[_loc1_].addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§1t5110s0§)
         {
            this.§1t5111s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t5142s0§);
            this.§1t5111s0§[_loc1_].addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t5144s0§);
            this.§1t5111s0§[_loc1_].§1t5004s0§();
            this.§1t5111s0§[_loc1_].addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t5111s0§[_loc1_].addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         stage.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5052s0§.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5047s0§.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      public function removeEventListeners() : void
      {
         this.§1t5049s0§.removeEventListener(MouseEvent.CLICK,this.§1t5131s0§);
         this.§1t5049s0§.removeEventListeners();
         this.§1t5069s0§.removeEventListener(MouseEvent.CLICK,this.§1t5145s0§);
         this.closeWindow.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5062s0§.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5061s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.§1t5081s0§.removeEventListener(MouseEvent.CLICK,this.§1t5122s0§);
         this.§1t5080s0§.removeEventListener(MouseEvent.CLICK,this.§1t5123s0§);
         this.§1t5058s0§.removeEventListener(MouseEvent.CLICK,this.§1t5124s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            this.slots[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t5139s0§);
            this.slots[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t5141s0§);
            this.slots[_loc1_].removeEventListeners();
            this.slots[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.slots[_loc1_].removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§1t5110s0§)
         {
            this.§1t5111s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t5142s0§);
            this.§1t5111s0§[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t5144s0§);
            this.§1t5111s0§[_loc1_].removeEventListeners();
            this.§1t5111s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t5111s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5052s0§.removeEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
      }
      
      public function §1t5120s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5089s0§ > 0)
         {
            --this.§1t5089s0§;
            this.§1t5117s0§();
         }
      }
      
      public function §1t5121s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5089s0§ < this.§1t5088s0§)
         {
            ++this.§1t5089s0§;
            this.§1t5117s0§();
         }
      }
      
      public function §1t5122s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5105s0§ > 0)
         {
            --this.§1t5105s0§;
            this.§1t5118s0§();
         }
      }
      
      public function §1t5123s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5105s0§ < this.§1t5104s0§)
         {
            ++this.§1t5105s0§;
            this.§1t5118s0§();
         }
      }
      
      public function §1t5124s0§(param1:MouseEvent) : void
      {
         setChildIndex(this.loading,numChildren - 1);
         this.loading.visible = true;
         §1t1523s0§.§1t9615s0§(5,this.§1t5125s0§,this.§1t5126s0§);
      }
      
      public function §1t5125s0§() : *
      {
         this.loading.visible = false;
         §1t3317s0§.instance.§1t1986s0§(5,"addstorage",5);
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9434s0§,1);
         §1t3317s0§.instance.§1t1946s0§();
         this.§1t5087s0§ = §1t1523s0§.§1t9630s0§();
         this.§1t5118s0§();
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
         §1t88s0§.instance.§1t1513s0§();
         if(§1t406s0§.instance.§1t6509s0§.visible)
         {
            §1t412s0§.instance.§1t6899s0§();
         }
      }
      
      internal function §1t5126s0§() : *
      {
         this.loading.visible = false;
         §1t406s0§.instance.§1t6552s0§(5);
      }
      
      internal function §1t5127s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5066s0§.§1t15864s0§.scrollV == this.§1t5066s0§.§1t15864s0§.numLines - 7)
         {
            this.§1t5066s0§.§1t15864s0§.scrollV = 0;
         }
         else
         {
            ++this.§1t5066s0§.§1t15864s0§.scrollV;
         }
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         if(this.§1t5095s0§ == this.§1t5097s0§)
         {
            if(this.§1t916s0§.§1t561s0§ == -1)
            {
               this.§1t916s0§.§1t636s0§();
            }
            this.§1t916s0§ = null;
            §1t114s0§.instance.§1t1539s0§();
         }
         else
         {
            §1t406s0§.instance.§1t6578s0§();
            §1t1525s0§.§1t9940s0§().visible = true;
            if(§1t1540s0§.§1t10014s0§())
            {
               §1t6427s0§.refreshMap();
               §1t6427s0§.§1t12471s0§();
               §1t6427s0§.§1t12473s0§(true);
            }
            else
            {
               §1t251s0§.instance.§1t3532s0§(false);
               §1t1541s0§.§1t10045s0§();
            }
         }
         §1t3317s0§.instance.§1t1946s0§();
         this.§1t5129s0§(null);
         this.removeEventListeners();
         this.visible = false;
      }
      
      internal function §1t5128s0§() : *
      {
         this.§1t5066s0§.visible = true;
         this.§1t5051s0§.addEventListener(MouseEvent.CLICK,this.§1t5127s0§);
      }
      
      internal function §1t5129s0§(param1:MouseEvent) : *
      {
         this.§1t5066s0§.§1t15863s0§.text = "";
         this.§1t5066s0§.§1t15864s0§.htmlText = "";
         this.§1t5066s0§.§1t6879s0§.text = "";
         this.§1t5051s0§.removeEventListener(MouseEvent.CLICK,this.§1t5127s0§);
         if(this.§1t5090s0§ != null)
         {
            this.§1t5090s0§.§1t6786s0§(false);
            this.§1t5090s0§ = null;
            this.§1t5091s0§ = null;
         }
         this.§1t5092s0§ = -1;
         this.§1t5093s0§ = -1;
         this.§1t5049s0§.visible = false;
         this.§1t5066s0§.visible = false;
         this.§1t5051s0§.visible = false;
      }
      
      internal function §1t5130s0§(param1:int) : *
      {
         switch(param1)
         {
            case §1t12343s0§:
               if(this.§1t5095s0§ == this.§1t5097s0§)
               {
                  this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(22075));
               }
               else
               {
                  this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(683));
               }
               this.§1t5049s0§.x = 380;
               break;
            case §1t12344s0§:
               this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(684));
               this.§1t5049s0§.x = 205;
         }
         this.§1t5094s0§ = param1;
      }
      
      public function §1t5131s0§(param1:MouseEvent) : *
      {
         switch(this.§1t5094s0§)
         {
            case §1t12343s0§:
               this.§1t5132s0§();
               break;
            case §1t12344s0§:
               this.§1t5133s0§();
         }
      }
      
      public function §1t5132s0§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§1t5095s0§ == this.§1t5097s0§ && this.§1t916s0§.§1t561s0§ != -1)
         {
            return;
         }
         if(this.§1t5091s0§.§1t502s0§() && !this.§1t5091s0§.§1t503s0§() || this.§1t5091s0§.§1t500s0§() || this.§1t5091s0§.§1t501s0§() || !this.§1t5091s0§.§1t506s0§())
         {
            if(this.§1t5095s0§ == this.§1t5097s0§)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(22076),§1t1521s0§.getString(5));
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(700),§1t1521s0§.getString(5));
            }
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(this.§1t5095s0§ == this.§1t5096s0§ && this.§1t5086s0§ + this.§1t5091s0§.§1t545s0§() / this.§1t5091s0§.§1t484s0§() > this.§1t5087s0§)
         {
            §1t406s0§.instance.§1t6530s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(this.§1t5095s0§ == this.§1t5097s0§ && this.§1t5086s0§ >= this.§1t5087s0§)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         var _loc1_:Boolean = this.§1t5091s0§.§1t484s0§() == 1;
         §1t88s0§.instance.§1t1516s0§("Snd_put");
         if(this.§1t5095s0§ == this.§1t5097s0§ && §1t24s0§.§1t8782s0§)
         {
            §1t1523s0§.§1t9632s0§(this.§1t5091s0§);
            this.inventory = §1t1523s0§.§1t9375s0§;
         }
         else
         {
            §1t1523s0§.§1t7692s0§(this.§1t5091s0§);
            this.inventory = §1t1523s0§.§1t9368s0§.concat(§1t1523s0§.§1t9369s0§);
         }
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         if(this.§1t5088s0§ < 0)
         {
            this.§1t5089s0§ = 0;
            this.§1t5088s0§ = 0;
         }
         if(this.§1t5095s0§ == this.§1t5097s0§)
         {
            this.§1t916s0§.§1t632s0§(this.§1t5091s0§);
         }
         else
         {
            §1t1523s0§.§1t9628s0§(this.§1t5091s0§);
         }
         this.§1t5104s0§ = Math.floor((this.§1t5085s0§.length - 1) / this.§1t5108s0§);
         if(this.§1t5104s0§ < 0)
         {
            this.§1t5105s0§ = 0;
            this.§1t5104s0§ = 0;
         }
         if(_loc1_)
         {
            _loc2_ = int(this.§1t5085s0§.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(this.§1t5085s0§[_loc3_].equals(this.§1t5091s0§))
               {
                  this.§1t5093s0§ = _loc3_;
                  this.§1t5092s0§ = -1;
                  _loc3_ -= this.§1t5108s0§ * this.§1t5105s0§;
                  if(_loc3_ >= 0 && _loc3_ < this.§1t5110s0§ - 1)
                  {
                     this.§1t5111s0§[_loc3_].§1t6786s0§(true);
                     this.§1t5090s0§ = this.§1t5111s0§[_loc3_];
                  }
                  this.§1t5130s0§(§1t12344s0§);
                  break;
               }
               _loc3_++;
            }
         }
         this.§1t5117s0§();
         this.§1t5118s0§();
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
         if(this.§1t5095s0§ == this.§1t5096s0§)
         {
            §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9690s0§);
         }
         else if(this.§1t5095s0§ == this.§1t5097s0§)
         {
            this.§1t5116s0§();
         }
      }
      
      public function §1t5133s0§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§1t5095s0§ == this.§1t5097s0§ && this.§1t916s0§.§1t561s0§ != -1)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_put");
         var _loc1_:Boolean = this.§1t5091s0§.§1t484s0§() == 1;
         if(this.§1t5095s0§ == this.§1t5097s0§ && §1t24s0§.§1t8782s0§)
         {
            if(this.§1t5091s0§.§1t543s0§())
            {
               §1t1523s0§.§1t9631s0§(new §1t17s0§(this.§1t5091s0§.§1t483s0§()));
            }
            else
            {
               §1t1523s0§.§1t9631s0§(this.§1t5091s0§);
            }
            this.inventory = §1t1523s0§.§1t9375s0§;
         }
         else
         {
            if(this.§1t5091s0§.§1t543s0§())
            {
               §1t1523s0§.§1t7693s0§(new §1t17s0§(this.§1t5091s0§.§1t483s0§()));
            }
            else
            {
               §1t1523s0§.§1t7693s0§(this.§1t5091s0§);
            }
            this.inventory = §1t1523s0§.§1t9368s0§.concat(§1t1523s0§.§1t9369s0§);
         }
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         if(this.§1t5088s0§ < 0)
         {
            this.§1t5089s0§ = 0;
            this.§1t5088s0§ = 0;
         }
         if(this.§1t5095s0§ == this.§1t5097s0§)
         {
            this.§1t916s0§.§1t633s0§(this.§1t5091s0§);
         }
         else
         {
            §1t1523s0§.§1t9632s0§(this.§1t5091s0§);
         }
         this.§1t5104s0§ = Math.floor((this.§1t5085s0§.length - 1) / this.§1t5108s0§);
         if(this.§1t5104s0§ < 0)
         {
            this.§1t5105s0§ = 0;
            this.§1t5104s0§ = 0;
         }
         if(_loc1_)
         {
            _loc2_ = int(this.inventory.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(this.inventory[_loc3_].equals(this.§1t5091s0§))
               {
                  this.§1t5093s0§ = -1;
                  this.§1t5092s0§ = _loc3_;
                  _loc3_ -= this.§1t5102s0§ * this.§1t5089s0§;
                  if(_loc3_ < this.§1t5023s0§ - 1 && _loc3_ >= 0)
                  {
                     this.slots[_loc3_].§1t6786s0§(true);
                     this.§1t5090s0§ = this.slots[_loc3_];
                  }
                  this.§1t5130s0§(§1t12343s0§);
                  break;
               }
               _loc3_++;
            }
         }
         this.§1t5117s0§();
         this.§1t5118s0§();
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
         if(this.§1t5095s0§ == this.§1t5096s0§)
         {
            §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9690s0§);
         }
         else if(this.§1t5095s0§ == this.§1t5097s0§)
         {
            this.§1t5116s0§();
         }
      }
      
      public function §1t5136s0§(param1:MouseEvent) : *
      {
         this.§1t5134s0§ = true;
         this.§1t5052s0§.§1t6872s0§(param1.target.§1t483s0§(),param1.target.§1t6873s0§(),param1.target.§1t527s0§(),param1.target.§1t528s0§());
         this.§1t5052s0§.x = mouseX - 35;
         this.§1t5052s0§.y = mouseY - 35;
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if((param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§ < 355)
         {
            this.§1t5142s0§(param1);
            this.§1t5135s0§ = true;
         }
         else
         {
            this.§1t5139s0§(param1);
            this.§1t5135s0§ = false;
         }
      }
      
      public function §1t5137s0§(param1:MouseEvent) : *
      {
         if(this.§1t5134s0§ && !this.§1t5052s0§.visible)
         {
            if(!§1t1523s0§.§1t9528s0§)
            {
               this.§1t5052s0§.alpha = 0.8;
            }
            this.§1t5052s0§.visible = true;
            this.§1t5052s0§.cacheAsBitmap = true;
            this.§1t5052s0§.startDrag();
         }
      }
      
      public function §1t5138s0§(param1:MouseEvent) : *
      {
         if(this.§1t5134s0§ && this.§1t5052s0§.visible)
         {
            this.§1t5052s0§.stopDrag();
            if(this.§1t5052s0§.x < 355)
            {
               if(!this.§1t5135s0§)
               {
                  this.§1t5132s0§();
               }
            }
            else if(this.§1t5135s0§)
            {
               this.§1t5133s0§();
            }
            this.§1t5052s0§.visible = false;
            this.§1t5052s0§.cacheAsBitmap = false;
         }
         this.§1t5134s0§ = false;
      }
      
      public function §1t5139s0§(param1:MouseEvent) : void
      {
         var _loc2_:§1t394s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5140s0§(_loc2_);
      }
      
      public function §1t5140s0§(param1:§1t394s0§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t5023s0§)
         {
            this.slots[_loc2_].§1t6786s0§(false);
            _loc2_++;
         }
         if(this.§1t5090s0§ != null)
         {
            this.§1t5090s0§.§1t6786s0§(false);
         }
         this.§1t5090s0§ = param1;
         this.§1t5091s0§ = param1.item;
         this.§1t5090s0§.§1t6786s0§(true);
         this.§1t5092s0§ = this.§1t5089s0§ * this.§1t5102s0§ + this.§1t5090s0§.id;
         this.§1t5093s0§ = -1;
         this.§1t5128s0§();
         this.§1t5066s0§.§1t15865s0§.§1t6872s0§(param1.§1t483s0§(),param1.§1t6873s0§(),param1.§1t527s0§(),param1.§1t528s0§());
         this.§1t5066s0§.§1t15865s0§.§1t6870s0§("");
         this.§1t5066s0§.§1t15863s0§.htmlText = this.§1t5091s0§.§1t510s0§();
         var _loc3_:int = param1.getLevel();
         if(_loc3_ > 0)
         {
            this.§1t5066s0§.§1t6879s0§.text = §1t1521s0§.getString(47,[_loc3_]);
         }
         else
         {
            this.§1t5066s0§.§1t6879s0§.text = "";
         }
         if(this.§1t5091s0§.§1t514s0§() == "")
         {
            this.§1t5066s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t518s0§();
         }
         else
         {
            this.§1t5066s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t514s0§() + "\n\n" + this.§1t5091s0§.§1t518s0§();
         }
         this.§1t5051s0§.visible = this.§1t5066s0§.§1t15864s0§.numLines > 7;
         if(this.§1t5095s0§ == this.§1t5097s0§ && this.§1t916s0§.§1t561s0§ != -1)
         {
            this.§1t5049s0§.visible = false;
         }
         else if((this.§1t5091s0§.§1t503s0§() || !this.§1t5091s0§.§1t502s0§()) && this.§1t5091s0§.§1t506s0§())
         {
            this.§1t5049s0§.visible = true;
            this.§1t5130s0§(§1t12343s0§);
         }
         else
         {
            this.§1t5049s0§.visible = false;
         }
      }
      
      public function §1t5141s0§(param1:MouseEvent) : void
      {
         this.§1t5090s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5091s0§ = this.§1t5090s0§.item;
         if((this.§1t5091s0§.§1t503s0§() || !this.§1t5091s0§.§1t502s0§()) && this.§1t5091s0§.§1t506s0§())
         {
            this.§1t5132s0§();
         }
      }
      
      public function §1t5142s0§(param1:MouseEvent) : void
      {
         var _loc2_:§1t394s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5143s0§(_loc2_);
      }
      
      public function §1t5143s0§(param1:§1t394s0§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t5023s0§)
         {
            this.slots[_loc2_].§1t6786s0§(false);
            _loc2_++;
         }
         if(this.§1t5090s0§ != null)
         {
            this.§1t5090s0§.§1t6786s0§(false);
         }
         this.§1t5090s0§ = param1;
         this.§1t5091s0§ = param1.item;
         this.§1t5090s0§.§1t6786s0§(true);
         this.§1t5093s0§ = this.§1t5105s0§ * this.§1t5108s0§ + this.§1t5090s0§.id;
         this.§1t5092s0§ = -1;
         this.§1t5128s0§();
         this.§1t5066s0§.§1t15865s0§.§1t6872s0§(param1.§1t483s0§(),param1.§1t6873s0§(),param1.§1t527s0§(),param1.§1t528s0§());
         this.§1t5066s0§.§1t15865s0§.§1t6870s0§("");
         this.§1t5066s0§.§1t15863s0§.htmlText = this.§1t5091s0§.§1t510s0§();
         var _loc3_:int = param1.getLevel();
         if(_loc3_ > 0)
         {
            this.§1t5066s0§.§1t6879s0§.text = §1t1521s0§.getString(47,[_loc3_]);
         }
         else
         {
            this.§1t5066s0§.§1t6879s0§.text = "";
         }
         if(this.§1t5091s0§.§1t514s0§() == "")
         {
            this.§1t5066s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t518s0§();
         }
         else
         {
            this.§1t5066s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t514s0§() + "\n\n" + this.§1t5091s0§.§1t518s0§();
         }
         this.§1t5051s0§.visible = this.§1t5066s0§.§1t15864s0§.numLines > 7;
         if(this.§1t5095s0§ == this.§1t5097s0§ && this.§1t916s0§.§1t561s0§ != -1)
         {
            this.§1t5049s0§.visible = false;
         }
         else
         {
            this.§1t5049s0§.visible = true;
            this.§1t5130s0§(§1t12344s0§);
         }
      }
      
      public function §1t5144s0§(param1:MouseEvent) : void
      {
         this.§1t5090s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5091s0§ = this.§1t5090s0§.item;
         this.§1t5133s0§();
      }
      
      internal function §1t5145s0§(param1:MouseEvent) : *
      {
         if(this.§1t5085s0§.length == 0)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.§1t916s0§.§1t561s0§ == -1)
         {
            this.§1t916s0§.§1t637s0§(§1t24s0§.§1t1847s0§() + this.§1t5115s0§);
            this.§1t5069s0§.§1t5769s0§(§1t1521s0§.getString(17));
            this.§1t5049s0§.visible = false;
         }
         else
         {
            this.§1t916s0§.§1t637s0§(-1);
            this.§1t5069s0§.§1t5769s0§(§1t1521s0§.getString(11024));
            this.§1t5067s0§.bar.scaleX = 0;
            this.§1t5068s0§.text = "0%";
            this.§1t5053s0§.text = this.§1t937s0§(this.§1t5115s0§);
            §1t412s0§.instance.§1t7553s0§.§1t5284s0§.text = §1t1521s0§.getString(22030,["-:--"]);
         }
         §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9966s0§);
      }
      
      public function update(param1:int, param2:int) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(!visible || param2 == -1 || this.§1t5095s0§ != this.§1t5097s0§)
         {
            return;
         }
         if(param2 <= param1)
         {
            this.§1t916s0§.§1t635s0§();
            this.§1t5026s0§(null);
            §1t88s0§.instance.§1t1516s0§("Snd_upgradeSkill");
         }
         else
         {
            _loc3_ = param2 - param1;
            _loc4_ = this.§1t5115s0§ - _loc3_;
            _loc5_ = _loc4_ / this.§1t5115s0§ * 100;
            this.§1t5067s0§.bar.scaleX = _loc5_ / 100;
            this.§1t5068s0§.text = _loc5_ + "%";
            this.§1t5053s0§.text = this.§1t937s0§(_loc3_);
         }
      }
   }
}

