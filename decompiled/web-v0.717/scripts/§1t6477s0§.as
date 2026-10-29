package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1448")]
   public class §1t6477s0§ extends MovieClip
   {
      
      public static var instance:§1t6477s0§;
      
      internal static var §1t12340s0§:int = 0;
      
      internal static var §1t12341s0§:int = 1;
      
      internal static var §1t12342s0§:int = 2;
      
      internal static var §1t12343s0§:int = 3;
      
      internal static var §1t12344s0§:int = 4;
      
      public var §1t5047s0§:§1t5016s0§;
      
      public var §1t5002s0§:§1t5050s0§;
      
      public var §1t7636s0§:§1t4910s0§;
      
      public var closeWindow:SimpleButton;
      
      public var coinsButton:§1t5050s0§;
      
      public var coinsText:TextField;
      
      public var §1t5971s0§:TextField;
      
      public var confirmButton:§1t5003s0§;
      
      public var §1t5049s0§:§1t5050s0§;
      
      public var §1t5051s0§:§1t4912s0§;
      
      public var §1t5052s0§:§1t394s0§;
      
      public var §1t6501s0§:§1t5802s0§;
      
      public var giveScrollDown:§1t4912s0§;
      
      public var giveScrollUp:§1t4912s0§;
      
      public var givebubble:MovieClip;
      
      public var givenametext:TextField;
      
      public var givestatustext:TextField;
      
      public var §1t5060s0§:TextField;
      
      public var §1t5061s0§:§1t4912s0§;
      
      public var §1t5062s0§:§1t4912s0§;
      
      public var loading:MovieClip;
      
      public var §1t5066s0§:MovieClip;
      
      public var receiveScrollDown:§1t4912s0§;
      
      public var receiveScrollUp:§1t4912s0§;
      
      public var receivebubble:MovieClip;
      
      public var receivenametext:TextField;
      
      public var receivestatustext:TextField;
      
      public var §1t5021s0§:TextField;
      
      public var §1t7649s0§:TextField;
      
      public var words:TextField;
      
      internal var inventory:Vector.<§1t17s0§>;
      
      internal var §1t7650s0§:Vector.<§1t17s0§>;
      
      internal var §1t7651s0§:Vector.<§1t17s0§>;
      
      internal var §1t588s0§:§1t98s0§;
      
      internal var §1t5578s0§:int = -1;
      
      internal var §1t7652s0§:int = -1;
      
      internal var §1t7653s0§:String;
      
      internal var §1t7654s0§:Boolean = false;
      
      internal var §1t7655s0§:Boolean = false;
      
      internal var §1t7656s0§:Boolean = false;
      
      internal var §1t7657s0§:Boolean = false;
      
      internal var §1t7658s0§:Boolean = false;
      
      internal var §1t7659s0§:Boolean = false;
      
      internal var §1t1417s0§:Boolean = true;
      
      internal var §1t5088s0§:int;
      
      internal var §1t5089s0§:int;
      
      internal var §1t5090s0§:§1t394s0§;
      
      internal var §1t5091s0§:§1t17s0§;
      
      internal var §1t5092s0§:int = -1;
      
      internal var §1t7660s0§:int = -1;
      
      internal var §1t7661s0§:int = -1;
      
      internal var §1t5094s0§:int = 0;
      
      internal var §1t5098s0§:int = 380;
      
      internal var §1t5099s0§:int = 250;
      
      internal var §1t5100s0§:int = 80;
      
      internal var §1t5101s0§:int = 80;
      
      internal var §1t5102s0§:int = 4;
      
      internal var §1t5103s0§:int = 2;
      
      internal var §1t5023s0§:int;
      
      internal var slots:Vector.<§1t394s0§>;
      
      internal var §1t7662s0§:int;
      
      internal var §1t7663s0§:int;
      
      internal var §1t7664s0§:int = 60;
      
      internal var §1t7665s0§:int = 64;
      
      internal var §1t7666s0§:int = 3;
      
      internal var §1t7667s0§:int = 2;
      
      internal var §1t7668s0§:int;
      
      internal var §1t7669s0§:Vector.<§1t394s0§>;
      
      internal var §1t7670s0§:int;
      
      internal var §1t7671s0§:int;
      
      internal var §1t7672s0§:int = 60;
      
      internal var §1t7673s0§:int = 250;
      
      internal var §1t7674s0§:int = 3;
      
      internal var §1t7675s0§:int = 2;
      
      internal var §1t7676s0§:int;
      
      internal var §1t7677s0§:Vector.<§1t394s0§>;
      
      internal var §1t7678s0§:int = 0;
      
      internal var §1t7679s0§:int = 0;
      
      internal var §1t5134s0§:Boolean;
      
      internal var §1t5135s0§:Boolean;
      
      internal var §1t7711s0§:String;
      
      public function §1t6477s0§()
      {
         var _loc1_:§1t394s0§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.inventory = new Vector.<§1t17s0§>();
         this.§1t7650s0§ = new Vector.<§1t17s0§>();
         this.§1t7651s0§ = new Vector.<§1t17s0§>();
         this.§1t588s0§ = new §1t98s0§();
         this.§1t5023s0§ = this.§1t5102s0§ * this.§1t5103s0§;
         this.slots = new Vector.<§1t394s0§>(this.§1t5023s0§);
         this.§1t7668s0§ = this.§1t7666s0§ * this.§1t7667s0§;
         this.§1t7669s0§ = new Vector.<§1t394s0§>(this.§1t7668s0§);
         this.§1t7676s0§ = this.§1t7674s0§ * this.§1t7675s0§;
         this.§1t7677s0§ = new Vector.<§1t394s0§>(this.§1t7676s0§);
         super();
         instance = this;
         §1t1521s0§.§1t9290s0§(this.receivenametext,true);
         §1t1521s0§.§1t9290s0§(this.givenametext,true);
         §1t1521s0§.§1t9290s0§(this.receivestatustext);
         §1t1521s0§.§1t9290s0§(this.givestatustext);
         §1t1521s0§.§1t9290s0§(this.§1t5060s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t15863s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t15864s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t6879s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5971s0§,true);
         this.§1t5971s0§.text = §1t1521s0§.getString(63);
         this.§1t5049s0§.visible = false;
         this.§1t5066s0§.§1t15865s0§.§1t6874s0§();
         this.§1t5129s0§(null);
         var _loc4_:int = 0;
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
         while(_loc4_ < this.§1t7676s0§)
         {
            _loc1_ = new §1t394s0§();
            addChild(_loc1_);
            _loc3_ = Math.floor(_loc4_ / this.§1t7674s0§);
            _loc2_ = _loc4_ - _loc3_ * this.§1t7674s0§;
            _loc1_.x = this.§1t7672s0§ + _loc2_ * this.§1t5100s0§;
            _loc1_.y = this.§1t7673s0§ + _loc3_ * this.§1t5101s0§;
            _loc1_.id = _loc4_;
            this.§1t7677s0§[_loc4_] = _loc1_;
            this.§1t7677s0§[_loc4_].doubleClickEnabled = true;
            this.§1t7677s0§[_loc4_].mouseChildren = false;
            _loc4_++;
         }
         this.§1t7677s0§.fixed = true;
         _loc4_ = 0;
         while(_loc4_ < this.§1t7668s0§)
         {
            _loc1_ = new §1t394s0§();
            addChild(_loc1_);
            _loc3_ = Math.floor(_loc4_ / this.§1t7666s0§);
            _loc2_ = _loc4_ - _loc3_ * this.§1t7666s0§;
            _loc1_.x = this.§1t7664s0§ + _loc2_ * this.§1t5100s0§;
            _loc1_.y = this.§1t7665s0§ + _loc3_ * this.§1t5101s0§;
            _loc1_.id = _loc4_;
            this.§1t7669s0§[_loc4_] = _loc1_;
            this.§1t7669s0§[_loc4_].doubleClickEnabled = true;
            this.§1t7669s0§[_loc4_].mouseChildren = false;
            _loc4_++;
         }
         this.§1t7669s0§.fixed = true;
         this.§1t5052s0§.visible = false;
         this.§1t5066s0§.chatbutton.visible = false;
         this.givestatustext.htmlText = "<font color=\'#00FF00\'>" + §1t1521s0§.getString(11082) + "</font>";
         this.coinsButton.§1t5769s0§(§1t1521s0§.getString(11083));
         this.givenametext.text = §1t1521s0§.getString(11084);
         this.§1t5060s0§.text = §1t1521s0§.getString(11085);
         this.confirmButton.§1t5769s0§(§1t1521s0§.getString(11075));
         this.§1t5002s0§.§1t5769s0§(§1t1521s0§.getString(17));
      }
      
      public function show(param1:String, param2:Boolean = true) : *
      {
         this.§1t7653s0§ = param1;
         this.§1t1417s0§ = param2;
         this.§1t5021s0§.text = §1t1521s0§.getString(11086,[param1]);
         this.receivenametext.text = param1;
         this.§1t5002s0§.visible = false;
         this.confirmButton.visible = true;
         this.inventory.length = 0;
         var _loc3_:int = int(§1t1523s0§.§1t9368s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.inventory.push(§1t17s0§.clone(§1t1523s0§.§1t9368s0§[_loc4_]));
            _loc4_++;
         }
         _loc3_ = int(§1t1523s0§.§1t9369s0§.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.inventory.push(§1t17s0§.clone(§1t1523s0§.§1t9369s0§[_loc4_]));
            _loc4_++;
         }
         this.§1t7650s0§.length = 0;
         this.§1t7651s0§.length = 0;
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         this.§1t5089s0§ = 0;
         this.§1t5092s0§ = -1;
         this.§1t5117s0§();
         this.§1t7670s0§ = 0;
         this.§1t7671s0§ = 0;
         this.§1t7660s0§ = -1;
         this.§1t7680s0§();
         this.§1t7662s0§ = 0;
         this.§1t7663s0§ = 0;
         this.§1t7661s0§ = -1;
         this.§1t7681s0§();
         this.§1t5090s0§ = null;
         this.§1t5091s0§ = null;
         this.visible = true;
         §1t1525s0§.§1t9940s0§().visible = false;
         this.§1t5052s0§.§1t6859s0§.text = "";
         setChildIndex(this.§1t5052s0§,numChildren - 1);
         setChildIndex(this.givebubble,numChildren - 1);
         setChildIndex(this.§1t6501s0§,numChildren - 1);
         setChildIndex(this.loading,numChildren - 1);
         this.§1t5004s0§();
         if(this.inventory.length > 0)
         {
            this.§1t5140s0§(this.slots[0]);
         }
         this.coinsText.text = §1t1523s0§.§1t9616s0§().toString();
         this.§1t6501s0§.visible = false;
         this.receivestatustext.visible = false;
         this.givestatustext.visible = false;
         this.§1t7654s0§ = false;
         this.§1t7656s0§ = false;
         this.§1t7655s0§ = false;
         this.§1t7657s0§ = false;
         this.§1t7659s0§ = false;
         this.§1t7658s0§ = false;
         this.§1t588s0§.§1t695s0§(0);
         this.givebubble.visible = false;
         this.receivebubble.visible = false;
         this.words.text = §1t1521s0§.getString(184);
         this.§1t7711s0§ = null;
         this.§1t7652s0§ = -1;
         this.loading.prompt.text = §1t1521s0§.getString(11087,[param1]);
         if(param2)
         {
            this.loading.visible = true;
            §1t251s0§.§1t9190s0§().§1t3467s0§(§1t251s0§.§1t12079s0§);
            §1t251s0§.instance.§1t3572s0§(param1,§1t81s0§.§1t9252s0§);
            this.§1t5578s0§ = 24 * 20;
            §1t251s0§.instance.§1t3532s0§(true);
         }
         else
         {
            this.loading.visible = false;
            this.receivestatustext.htmlText = "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11088) + "</font>";
            this.receivestatustext.visible = true;
         }
         this.§1t7649s0§.text = §1t1521s0§.getString(11498);
         this.§1t7649s0§.visible = false;
      }
      
      public function update() : *
      {
         if(!visible)
         {
            return;
         }
         if(this.§1t5578s0§ != -1)
         {
            --this.§1t5578s0§;
            if(this.§1t5578s0§ == 0)
            {
               this.§1t5597s0§();
            }
         }
         if(this.§1t7652s0§ != -1)
         {
            --this.§1t7652s0§;
            if(this.§1t7652s0§ == 24)
            {
               if(§1t3318s0§.instance.§1t3463s0§("t",false))
               {
                  this.§1t7652s0§ = 24 * 60 * 5;
               }
            }
            if(this.§1t7652s0§ == 0)
            {
               this.§1t7714s0§();
            }
         }
         if(this.§1t7678s0§ >= 0)
         {
            --this.§1t7678s0§;
            if(this.§1t7678s0§ < 20)
            {
               this.givebubble.alpha -= 0.05;
            }
            if(this.givebubble.alpha <= 0)
            {
               this.givebubble.visible = false;
            }
         }
         if(this.§1t7679s0§ >= 0)
         {
            --this.§1t7679s0§;
            if(this.§1t7679s0§ < 20)
            {
               this.receivebubble.alpha -= 0.05;
            }
            if(this.receivebubble.alpha <= 0)
            {
               this.receivebubble.visible = false;
            }
         }
      }
      
      public function §1t5598s0§() : *
      {
         this.§1t5578s0§ = -1;
      }
      
      public function §1t5597s0§() : *
      {
         this.§1t5578s0§ = -1;
         §1t251s0§.instance.§1t3475s0§(this.§1t7653s0§);
         this.§1t5026s0§(null);
         §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11081,[this.§1t7653s0§]),§1t1521s0§.getString(5));
         §1t88s0§.instance.§1t1516s0§("Snd_error");
      }
      
      internal function §1t5117s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t394s0§ = null;
         var _loc5_:int = 0;
         var _loc1_:int = this.§1t5089s0§ * this.§1t5102s0§;
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
      }
      
      internal function §1t7680s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t394s0§ = null;
         var _loc5_:int = 0;
         var _loc1_:int = this.§1t7671s0§ * this.§1t7674s0§;
         var _loc2_:int = int(this.§1t7651s0§.length);
         this.giveScrollUp.visible = this.§1t7671s0§ > 0;
         this.giveScrollDown.visible = Math.ceil(_loc2_ / this.§1t7674s0§) - this.§1t7671s0§ > this.§1t7675s0§;
         if(_loc2_ - _loc1_ < this.§1t7676s0§)
         {
            _loc3_ = _loc2_ - _loc1_;
         }
         else
         {
            _loc3_ = this.§1t7676s0§;
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.§1t7676s0§)
         {
            _loc4_ = this.§1t7677s0§[_loc6_];
            if(_loc6_ >= _loc3_)
            {
               _loc4_.visible = false;
            }
            else
            {
               _loc5_ = _loc1_ + _loc6_;
               _loc4_.§1t6872s0§(this.§1t7651s0§[_loc5_].§1t483s0§(),this.§1t7651s0§[_loc5_].§1t508s0§(),this.§1t7651s0§[_loc5_].§1t527s0§(),this.§1t7651s0§[_loc5_].§1t528s0§());
               _loc4_.setItem(this.§1t7651s0§[_loc5_]);
               if(this.§1t7651s0§[_loc5_].§1t543s0§())
               {
                  _loc4_.§1t6870s0§("x" + this.§1t7651s0§[_loc5_].§1t484s0§().toString());
               }
               else
               {
                  _loc4_.§1t6870s0§("");
               }
               _loc4_.visible = true;
               if(_loc5_ == this.§1t7660s0§)
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
      }
      
      internal function §1t7681s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t394s0§ = null;
         var _loc5_:int = 0;
         var _loc1_:int = this.§1t7663s0§ * this.§1t7666s0§;
         var _loc2_:int = int(this.§1t7650s0§.length);
         this.receiveScrollUp.visible = this.§1t7663s0§ > 0;
         this.receiveScrollDown.visible = Math.ceil(_loc2_ / this.§1t7666s0§) - this.§1t7663s0§ > this.§1t7667s0§;
         if(_loc2_ - _loc1_ < this.§1t7668s0§)
         {
            _loc3_ = _loc2_ - _loc1_;
         }
         else
         {
            _loc3_ = this.§1t7668s0§;
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.§1t7668s0§)
         {
            _loc4_ = this.§1t7669s0§[_loc6_];
            if(_loc6_ >= _loc3_)
            {
               _loc4_.visible = false;
            }
            else
            {
               _loc5_ = _loc1_ + _loc6_;
               _loc4_.§1t6872s0§(this.§1t7650s0§[_loc5_].§1t483s0§(),this.§1t7650s0§[_loc5_].§1t508s0§(),this.§1t7650s0§[_loc5_].§1t527s0§(),this.§1t7650s0§[_loc5_].§1t528s0§());
               _loc4_.setItem(this.§1t7650s0§[_loc5_]);
               if(this.§1t7650s0§[_loc5_].§1t543s0§())
               {
                  _loc4_.§1t6870s0§("x" + this.§1t7650s0§[_loc5_].§1t484s0§().toString());
               }
               else
               {
                  _loc4_.§1t6870s0§("");
               }
               _loc4_.visible = true;
               if(_loc5_ == this.§1t7661s0§)
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
      }
      
      internal function §1t5119s0§() : String
      {
         var _loc1_:int = §1t1523s0§.§1t1088s0§();
         return _loc1_ + " - " + (_loc1_ + §1t1523s0§.§1t9591s0§()) + " " + §1t1521s0§.getString(142);
      }
      
      public function §1t5004s0§() : void
      {
         this.§1t5049s0§.addEventListener(MouseEvent.CLICK,this.§1t5131s0§);
         this.closeWindow.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5062s0§.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5061s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.giveScrollUp.addEventListener(MouseEvent.CLICK,this.§1t7682s0§);
         this.giveScrollDown.addEventListener(MouseEvent.CLICK,this.§1t7683s0§);
         this.receiveScrollUp.addEventListener(MouseEvent.CLICK,this.§1t7684s0§);
         this.receiveScrollDown.addEventListener(MouseEvent.CLICK,this.§1t7685s0§);
         this.coinsButton.addEventListener(MouseEvent.CLICK,this.§1t7686s0§);
         this.confirmButton.addEventListener(MouseEvent.CLICK,this.§1t7688s0§);
         this.§1t5002s0§.addEventListener(MouseEvent.CLICK,this.§1t5304s0§);
         this.§1t7636s0§.addEventListener(MouseEvent.CLICK,this.§1t7690s0§);
         this.words.addEventListener(MouseEvent.CLICK,this.§1t5244s0§);
         this.words.addEventListener(KeyboardEvent.KEY_UP,this.§1t5233s0§);
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
         while(_loc1_ < this.§1t7668s0§)
         {
            this.§1t7669s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t7697s0§);
            this.§1t7669s0§[_loc1_].§1t5004s0§();
            this.§1t7669s0§[_loc1_].addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t7669s0§[_loc1_].addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§1t7676s0§)
         {
            this.§1t7677s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t7696s0§);
            this.§1t7677s0§[_loc1_].addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t7699s0§);
            this.§1t7677s0§[_loc1_].§1t5004s0§();
            this.§1t7677s0§[_loc1_].addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t7677s0§[_loc1_].addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         stage.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5052s0§.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5047s0§.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      public function removeEventListeners() : void
      {
         this.§1t5049s0§.removeEventListener(MouseEvent.CLICK,this.§1t5131s0§);
         this.closeWindow.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5062s0§.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5061s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.giveScrollUp.removeEventListener(MouseEvent.CLICK,this.§1t7682s0§);
         this.giveScrollDown.removeEventListener(MouseEvent.CLICK,this.§1t7683s0§);
         this.receiveScrollUp.removeEventListener(MouseEvent.CLICK,this.§1t7684s0§);
         this.receiveScrollDown.removeEventListener(MouseEvent.CLICK,this.§1t7685s0§);
         this.coinsButton.removeEventListener(MouseEvent.CLICK,this.§1t7686s0§);
         this.confirmButton.removeEventListener(MouseEvent.CLICK,this.§1t7688s0§);
         this.§1t5002s0§.removeEventListener(MouseEvent.CLICK,this.§1t5304s0§);
         this.§1t7636s0§.removeEventListener(MouseEvent.CLICK,this.§1t7690s0§);
         this.words.addEventListener(MouseEvent.CLICK,this.§1t5244s0§);
         this.words.removeEventListener(KeyboardEvent.KEY_UP,this.§1t5233s0§);
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
         while(_loc1_ < this.§1t7668s0§)
         {
            this.§1t7669s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t7697s0§);
            this.§1t7669s0§[_loc1_].removeEventListeners();
            this.§1t7669s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t7669s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§1t7676s0§)
         {
            this.§1t7677s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t7696s0§);
            this.§1t7677s0§[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t7699s0§);
            this.§1t7677s0§[_loc1_].removeEventListeners();
            this.§1t7677s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t7677s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
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
      
      public function §1t7682s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t7671s0§ > 0)
         {
            --this.§1t7671s0§;
            this.§1t7680s0§();
         }
      }
      
      public function §1t7683s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t7671s0§ < this.§1t7670s0§)
         {
            ++this.§1t7671s0§;
            this.§1t7680s0§();
         }
      }
      
      public function §1t7684s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t7663s0§ > 0)
         {
            --this.§1t7663s0§;
            this.§1t7681s0§();
         }
      }
      
      public function §1t7685s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t7663s0§ < this.§1t7662s0§)
         {
            ++this.§1t7663s0§;
            this.§1t7681s0§();
         }
      }
      
      public function §1t7686s0§(param1:MouseEvent) : void
      {
         this.§1t6501s0§.show(false,true);
         this.§1t6501s0§.§1t5813s0§(this.§1t588s0§.§1t697s0§());
      }
      
      public function §1t7687s0§(param1:int) : *
      {
         this.§1t588s0§.§1t695s0§(param1);
         this.coinsText.text = (§1t1523s0§.§1t9616s0§() - param1).toString();
         this.§1t7695s0§(new §1t17s0§(2217,param1));
         this.§1t7680s0§();
      }
      
      internal function §1t7688s0§(param1:MouseEvent) : void
      {
         this.givestatustext.visible = true;
         this.§1t5002s0§.visible = true;
         this.confirmButton.visible = false;
         if(this.§1t7654s0§)
         {
            this.loading.visible = true;
            this.§1t7649s0§.visible = true;
            this.§1t5049s0§.visible = false;
         }
         this.§1t7703s0§(true);
      }
      
      internal function §1t5304s0§(param1:MouseEvent) : void
      {
         this.§1t7689s0§();
      }
      
      internal function §1t7689s0§(param1:Boolean = true) : *
      {
         if(this.givestatustext.visible)
         {
            this.givestatustext.visible = false;
            this.§1t5002s0§.visible = false;
            this.confirmButton.visible = true;
            if(param1)
            {
               this.§1t7703s0§(false);
            }
         }
      }
      
      internal function §1t7690s0§(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.words.text != §1t1521s0§.getString(184) && this.words.text != "")
         {
            _loc2_ = §1t406s0§.instance.§1t5322s0§(this.words.text);
            §1t81s0§.§1t9255s0§.connection.send("public",§1t251s0§.§1t12094s0§,§1t1523s0§.charname,_loc2_);
            this.givebubble.words.text = _loc2_;
            §1t3317s0§.instance.§1t1933s0§(_loc2_);
            this.givebubble.alpha = 1;
            this.§1t7678s0§ = 96;
            this.givebubble.visible = true;
            this.words.text = "";
         }
      }
      
      internal function §1t5244s0§(param1:MouseEvent) : void
      {
         if(this.words.text == §1t1521s0§.getString(184))
         {
            this.words.text = "";
         }
      }
      
      internal function §1t5233s0§(param1:KeyboardEvent) : *
      {
         if(this.words.text == "" || this.words.text == "\r")
         {
            return;
         }
         if(param1.keyCode == 13)
         {
            this.§1t7690s0§(null);
         }
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
         if(!visible)
         {
            return;
         }
         this.§1t5598s0§();
         this.§1t7652s0§ = -1;
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t5129s0§(null);
         this.removeEventListeners();
         this.visible = false;
         §1t1525s0§.§1t9940s0§().visible = true;
         this.§1t7704s0§();
         if(!this.§1t1417s0§)
         {
            §1t251s0§.instance.§1t3532s0§(false);
            §1t1541s0§.§1t10045s0§();
            §1t406s0§.instance.§1t6578s0§();
         }
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
         this.§1t7660s0§ = -1;
         this.§1t7661s0§ = -1;
         this.§1t5049s0§.visible = false;
         this.§1t5066s0§.visible = false;
         this.§1t5051s0§.visible = false;
      }
      
      internal function §1t5130s0§(param1:int) : *
      {
         switch(param1)
         {
            case §1t12343s0§:
               this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(11089));
               this.§1t5049s0§.x = 380;
               break;
            case §1t12344s0§:
               this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(11090));
               this.§1t5049s0§.x = 205;
         }
         this.§1t5094s0§ = param1;
      }
      
      public function §1t5131s0§(param1:MouseEvent) : *
      {
         switch(this.§1t5094s0§)
         {
            case §1t12343s0§:
               this.§1t7691s0§();
               break;
            case §1t12344s0§:
               this.§1t5133s0§();
         }
      }
      
      public function §1t7691s0§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§1t5091s0§.§1t505s0§())
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11091),§1t1521s0§.getString(5));
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         var _loc1_:Boolean = this.§1t5091s0§.§1t484s0§() == 1;
         §1t88s0§.instance.§1t1516s0§("Snd_put");
         this.§1t7692s0§(this.§1t5091s0§);
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         if(this.§1t5088s0§ < 0)
         {
            this.§1t5089s0§ = 0;
            this.§1t5088s0§ = 0;
         }
         this.§1t7695s0§(this.§1t5091s0§);
         this.§1t7670s0§ = Math.floor((this.§1t7651s0§.length - 1) / this.§1t7674s0§);
         if(this.§1t7670s0§ < 0)
         {
            this.§1t7671s0§ = 0;
            this.§1t7670s0§ = 0;
         }
         if(_loc1_)
         {
            _loc2_ = int(this.§1t7651s0§.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(this.§1t7651s0§[_loc3_].equals(this.§1t5091s0§))
               {
                  this.§1t7660s0§ = _loc3_;
                  this.§1t5092s0§ = -1;
                  _loc3_ -= this.§1t7674s0§ * this.§1t7671s0§;
                  if(_loc3_ >= 0 && _loc3_ < this.§1t7676s0§ - 1)
                  {
                     this.§1t7677s0§[_loc3_].§1t6786s0§(true);
                     this.§1t5090s0§ = this.§1t7677s0§[_loc3_];
                  }
                  this.§1t5130s0§(§1t12344s0§);
                  break;
               }
               _loc3_++;
            }
         }
         this.§1t5117s0§();
         this.§1t7680s0§();
      }
      
      internal function §1t7692s0§(param1:§1t17s0§) : *
      {
         var _loc3_:§1t17s0§ = null;
         var _loc2_:int = int(this.inventory.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.inventory[_loc4_];
            if(param1.§1t543s0§())
            {
               if(_loc3_.equals(param1))
               {
                  if(_loc3_.§1t484s0§() == 1)
                  {
                     this.inventory.splice(_loc4_,1);
                  }
                  else
                  {
                     _loc3_.§1t485s0§(_loc3_.§1t484s0§() - 1);
                  }
                  return;
               }
            }
            else if(_loc3_.equals(param1))
            {
               this.inventory.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      internal function §1t7693s0§(param1:§1t17s0§) : *
      {
         var _loc2_:int = 0;
         var _loc3_:§1t17s0§ = null;
         var _loc4_:int = 0;
         if(param1.§1t483s0§() == 2217)
         {
            this.§1t588s0§.§1t695s0§(0);
            this.coinsText.text = §1t1523s0§.§1t9616s0§().toString();
            this.§1t5049s0§.visible = false;
         }
         else if(param1.§1t543s0§())
         {
            _loc2_ = int(this.inventory.length);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = this.inventory[_loc4_];
               if(_loc3_.equals(param1))
               {
                  _loc3_.§1t485s0§(_loc3_.§1t484s0§() + 1);
                  return;
               }
               _loc4_++;
            }
            this.inventory.push(new §1t17s0§(param1.§1t483s0§(),1));
         }
         else
         {
            this.inventory.push(param1);
         }
      }
      
      internal function §1t7694s0§(param1:§1t17s0§) : *
      {
         var _loc3_:§1t17s0§ = null;
         var _loc2_:int = int(this.§1t7651s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.§1t7651s0§[_loc4_];
            if(param1.§1t543s0§())
            {
               if(_loc3_.equals(param1))
               {
                  if(_loc3_.§1t484s0§() == 1 || _loc3_.§1t483s0§() == 2217)
                  {
                     this.§1t7651s0§.splice(_loc4_,1);
                  }
                  else
                  {
                     _loc3_.§1t485s0§(_loc3_.§1t484s0§() - 1);
                  }
                  this.§1t7702s0§();
                  return;
               }
            }
            else if(_loc3_.equals(param1))
            {
               this.§1t7651s0§.splice(_loc4_,1);
               this.§1t7702s0§();
               return;
            }
            _loc4_++;
         }
      }
      
      internal function §1t7695s0§(param1:§1t17s0§) : *
      {
         var _loc2_:int = 0;
         var _loc3_:§1t17s0§ = null;
         var _loc4_:int = 0;
         if(param1.§1t483s0§() == 2217)
         {
            _loc2_ = int(this.§1t7651s0§.length);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = this.§1t7651s0§[_loc4_];
               if(_loc3_.§1t483s0§() == 2217)
               {
                  _loc3_.§1t485s0§(param1.§1t484s0§());
                  this.§1t7702s0§();
                  return;
               }
               _loc4_++;
            }
            this.§1t7651s0§.push(param1);
         }
         else if(param1.§1t543s0§())
         {
            _loc2_ = int(this.§1t7651s0§.length);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = this.§1t7651s0§[_loc4_];
               if(_loc3_.equals(param1))
               {
                  _loc3_.§1t485s0§(_loc3_.§1t484s0§() + 1);
                  this.§1t7702s0§();
                  return;
               }
               _loc4_++;
            }
            this.§1t7651s0§.push(new §1t17s0§(param1.§1t483s0§(),1));
         }
         else
         {
            this.§1t7651s0§.push(param1);
         }
         this.§1t7702s0§();
      }
      
      public function §1t5133s0§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         §1t88s0§.instance.§1t1516s0§("Snd_put");
         var _loc1_:Boolean = this.§1t5091s0§.§1t484s0§() == 1;
         this.§1t7693s0§(this.§1t5091s0§);
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         if(this.§1t5088s0§ < 0)
         {
            this.§1t5089s0§ = 0;
            this.§1t5088s0§ = 0;
         }
         this.§1t7694s0§(this.§1t5091s0§);
         this.§1t7670s0§ = Math.floor((this.§1t7651s0§.length - 1) / this.§1t7674s0§);
         if(this.§1t7670s0§ < 0)
         {
            this.§1t7671s0§ = 0;
            this.§1t7670s0§ = 0;
         }
         if(_loc1_)
         {
            _loc2_ = int(this.inventory.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(this.inventory[_loc3_].equals(this.§1t5091s0§))
               {
                  this.§1t7660s0§ = -1;
                  this.§1t7661s0§ = -1;
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
         this.§1t7680s0§();
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
            if((param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§ > 268)
            {
               this.§1t7696s0§(param1);
               this.§1t5135s0§ = true;
            }
            else
            {
               this.§1t7697s0§(param1);
               this.§1t5135s0§ = false;
               this.§1t5134s0§ = false;
            }
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
                  this.§1t7691s0§();
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
         this.§1t7660s0§ = -1;
         this.§1t7661s0§ = -1;
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
         if(!this.§1t5091s0§.§1t505s0§())
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
         if(!this.§1t5091s0§.§1t505s0§())
         {
            this.§1t7691s0§();
         }
      }
      
      public function §1t7696s0§(param1:MouseEvent) : void
      {
         var _loc2_:§1t394s0§ = §1t394s0§(param1.currentTarget);
         this.§1t7698s0§(_loc2_);
      }
      
      public function §1t7697s0§(param1:MouseEvent) : void
      {
         var _loc2_:§1t394s0§ = §1t394s0§(param1.currentTarget);
         this.§1t7700s0§(_loc2_);
      }
      
      public function §1t7698s0§(param1:§1t394s0§) : void
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
         this.§1t7660s0§ = this.§1t7671s0§ * this.§1t7674s0§ + this.§1t5090s0§.id;
         this.§1t5092s0§ = -1;
         this.§1t7661s0§ = -1;
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
         this.§1t5049s0§.visible = true;
         this.§1t5130s0§(§1t12344s0§);
      }
      
      public function §1t7699s0§(param1:MouseEvent) : void
      {
         this.§1t5090s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5091s0§ = this.§1t5090s0§.item;
         this.§1t5133s0§();
      }
      
      public function §1t7700s0§(param1:§1t394s0§) : void
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
         this.§1t7661s0§ = this.§1t7663s0§ * this.§1t7666s0§ + this.§1t5090s0§.id;
         this.§1t5092s0§ = -1;
         this.§1t7660s0§ = -1;
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
         this.§1t5049s0§.visible = false;
      }
      
      public function §1t7701s0§() : *
      {
         this.§1t5578s0§ = -1;
         this.loading.visible = false;
         this.receivestatustext.htmlText = "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11088) + "</font>";
         this.receivestatustext.visible = true;
      }
      
      internal function §1t7702s0§() : *
      {
         var _loc1_:String = "";
         var _loc2_:int = int(this.§1t7651s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc3_ == _loc2_ - 1)
            {
               _loc1_ += this.§1t7651s0§[_loc3_].toString();
            }
            else
            {
               _loc1_ += this.§1t7651s0§[_loc3_].toString() + "|";
            }
            _loc3_++;
         }
         §1t81s0§.§1t9255s0§.connection.send("public",§1t251s0§.§1t12107s0§,_loc1_);
         this.§1t7654s0§ = false;
         this.receivestatustext.htmlText = "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11088) + "</font>";
         this.§1t7689s0§(false);
      }
      
      internal function §1t7703s0§(param1:Boolean) : *
      {
         §1t81s0§.§1t9255s0§.connection.send("public",§1t251s0§.§1t12106s0§,param1);
      }
      
      internal function §1t7704s0§() : *
      {
         §1t251s0§.instance.§1t1894s0§();
      }
      
      internal function §1t7705s0§(param1:int) : *
      {
         §1t81s0§.§1t9255s0§.connection.send("public",§1t251s0§.§1t12108s0§,param1);
      }
      
      public function §1t7706s0§(param1:String) : *
      {
         var _loc4_:§1t17s0§ = null;
         this.§1t7650s0§.length = 0;
         var _loc2_:Array = param1.split("|");
         var _loc3_:int = int(_loc2_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if(_loc2_[_loc5_] != "")
            {
               _loc4_ = §1t17s0§.parse(_loc2_[_loc5_]);
               this.§1t7650s0§.push(_loc4_);
            }
            _loc5_++;
         }
         this.§1t7681s0§();
         this.§1t7654s0§ = false;
         this.receivestatustext.htmlText = "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11088) + "</font>";
         this.§1t7689s0§(false);
         this.§1t7663s0§ = 0;
         this.§1t7662s0§ = Math.floor((this.§1t7650s0§.length - 1) / this.§1t7666s0§);
      }
      
      public function §1t7707s0§(param1:Boolean) : *
      {
         this.§1t7654s0§ = param1;
         if(param1)
         {
            this.receivestatustext.htmlText = "<font color=\'#00FF00\'>" + §1t1521s0§.getString(11082) + "</font>";
            this.§1t7708s0§();
         }
         else
         {
            this.receivestatustext.htmlText = "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(11088) + "</font>";
            if(this.loading.visible)
            {
               this.loading.visible = false;
            }
         }
      }
      
      internal function §1t7708s0§() : *
      {
         if(this.§1t7654s0§ && this.§1t5002s0§.visible)
         {
            this.loading.visible = true;
            this.§1t7649s0§.visible = true;
            this.§1t7705s0§(1);
            this.§1t7712s0§(1);
         }
      }
      
      public function §1t7709s0§() : *
      {
         this.receivestatustext.htmlText = "<font color=\'#FF0000\'>" + §1t1521s0§.getString(11092) + "</font>";
         if(this.loading.visible)
         {
            this.§1t7714s0§();
         }
      }
      
      public function §1t7710s0§(param1:String) : *
      {
         this.receivebubble.words.text = param1;
         this.receivebubble.alpha = 1;
         this.§1t7679s0§ = 96;
         this.receivebubble.visible = true;
      }
      
      public function §1t7712s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc3_:§1t17s0§ = null;
         var _loc4_:int = 0;
         if(param1 == 1)
         {
            if(this.§1t7655s0§)
            {
               return;
            }
            this.§1t7711s0§ = §1t1523s0§.charname + " gave: ";
            _loc2_ = int(this.§1t7651s0§.length);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = this.§1t7651s0§[_loc4_];
               this.§1t7711s0§ += _loc3_.toString() + "|";
               if(_loc3_.§1t483s0§() == 2217)
               {
                  §1t1523s0§.§1t9619s0§(-_loc3_.§1t484s0§());
               }
               else if(_loc3_.§1t543s0§())
               {
                  §1t1523s0§.§1t9713s0§(_loc3_.§1t483s0§(),-_loc3_.§1t484s0§());
               }
               else
               {
                  §1t1523s0§.§1t7692s0§(_loc3_);
               }
               _loc4_++;
            }
            §1t251s0§.instance.§1t3543s0§(§1t1523s0§.§1t9730s0§(),§1t1523s0§.§1t9736s0§(),§1t1523s0§.§1t9743s0§());
            this.§1t7655s0§ = true;
            this.§1t7652s0§ = 24 * 60 * 2;
         }
         else if(param1 == 2)
         {
            if(this.§1t1417s0§)
            {
               this.§1t7657s0§ = true;
               if(this.§1t7656s0§)
               {
                  this.§1t7705s0§(3);
                  this.§1t7712s0§(3);
               }
            }
         }
         else if(param1 == 3)
         {
            if(this.§1t7659s0§)
            {
               return;
            }
            this.§1t7715s0§();
         }
         else if(param1 == 999)
         {
            this.§1t7714s0§();
         }
      }
      
      public function §1t7713s0§(param1:int) : *
      {
         if(param1 == 0)
         {
            this.§1t7656s0§ = true;
            if(!this.§1t1417s0§)
            {
               this.§1t7705s0§(2);
            }
            else if(this.§1t7657s0§)
            {
               this.§1t7705s0§(3);
               this.§1t7712s0§(3);
            }
         }
         else
         {
            this.§1t7714s0§();
            this.§1t7705s0§(999);
         }
      }
      
      internal function §1t7714s0§() : *
      {
         var _loc2_:§1t17s0§ = null;
         var _loc3_:int = 0;
         this.§1t7652s0§ = -1;
         if(this.§1t7659s0§ || !this.§1t7655s0§)
         {
            return;
         }
         this.§1t7659s0§ = true;
         var _loc1_:int = int(this.§1t7651s0§.length);
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.§1t7651s0§[_loc3_];
            if(_loc2_.§1t483s0§() == 2217)
            {
               §1t1523s0§.§1t9619s0§(_loc2_.§1t484s0§());
            }
            else
            {
               §1t1523s0§.§1t7693s0§(_loc2_);
            }
            _loc3_++;
         }
         §1t3318s0§.instance.§1t1946s0§();
         this.§1t5026s0§(null);
         §1t88s0§.instance.§1t1516s0§("Snd_error");
         §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11493),§1t1521s0§.getString(5));
         if(this.§1t7711s0§ != null)
         {
            this.§1t7711s0§ += " " + this.§1t7653s0§ + " gave: ";
            _loc1_ = int(this.§1t7650s0§.length);
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               _loc2_ = this.§1t7650s0§[_loc3_];
               this.§1t7711s0§ += _loc2_.toString() + "|";
               _loc3_++;
            }
            §1t3317s0§.instance.§1t1935s0§("failed: " + this.§1t7711s0§);
         }
      }
      
      public function §1t7715s0§() : *
      {
         var _loc2_:§1t17s0§ = null;
         this.§1t7652s0§ = -1;
         if(this.§1t7658s0§)
         {
            return;
         }
         this.§1t7658s0§ = true;
         this.§1t7711s0§ += " " + this.§1t7653s0§ + " gave: ";
         var _loc1_:int = int(this.§1t7650s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.§1t7650s0§[_loc3_];
            this.§1t7711s0§ += _loc2_.toString() + "|";
            if(_loc2_.§1t483s0§() == 2217)
            {
               §1t1523s0§.§1t9619s0§(_loc2_.§1t484s0§());
            }
            else
            {
               §1t1523s0§.§1t7693s0§(_loc2_);
            }
            _loc3_++;
         }
         §1t3318s0§.instance.§1t1946s0§();
         this.§1t5026s0§(null);
         §1t88s0§.instance.§1t1516s0§("Snd_refund");
         §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11093),§1t1521s0§.getString(5));
         if(this.§1t1417s0§)
         {
            §1t251s0§.instance.§1t1935s0§(this.§1t7711s0§);
         }
      }
   }
}

