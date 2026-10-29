package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1573")]
   public class §1t5374s0§ extends MovieClip
   {
      
      public static var instance:§1t5374s0§;
      
      public var §1t5046s0§:TextField;
      
      public var §1t5047s0§:§1t5016s0§;
      
      public var closeWindow:SimpleButton;
      
      public var combineButton:§1t5059s0§;
      
      public var §1t5376s0§:§1t5050s0§;
      
      public var §1t5051s0§:§1t4912s0§;
      
      public var §1t5377s0§:§1t5050s0§;
      
      public var §1t5378s0§:TextField;
      
      public var §1t5379s0§:§1t394s0§;
      
      public var §1t5052s0§:§1t394s0§;
      
      public var errortext:TextField;
      
      public var §1t5380s0§:§1t394s0§;
      
      public var §1t5054s0§:TextField;
      
      public var §1t5055s0§:MovieClip;
      
      public var §1t5056s0§:TextField;
      
      public var §1t5057s0§:TextField;
      
      public var §1t5060s0§:TextField;
      
      public var §1t5061s0§:§1t4912s0§;
      
      public var §1t5062s0§:§1t4912s0§;
      
      public var loading:MovieClip;
      
      public var §1t5381s0§:TextField;
      
      public var nametext:TextField;
      
      public var §1t5066s0§:MovieClip;
      
      public var §1t5382s0§:§1t5050s0§;
      
      public var §1t5383s0§:TextField;
      
      public var §1t5384s0§:§1t394s0§;
      
      public var §1t5021s0§:TextField;
      
      internal var inventory:Vector.<§1t17s0§>;
      
      internal var §1t5088s0§:int;
      
      internal var §1t5089s0§:int;
      
      internal var §1t5090s0§:§1t394s0§;
      
      internal var §1t5091s0§:§1t17s0§;
      
      internal var §1t5092s0§:int = -1;
      
      internal var §1t5385s0§:Boolean = true;
      
      internal var §1t5098s0§:int = 380;
      
      internal var §1t5099s0§:int = 268;
      
      internal var §1t5100s0§:int = 80;
      
      internal var §1t5101s0§:int = 80;
      
      internal var §1t5102s0§:int = 4;
      
      internal var §1t5103s0§:int = 2;
      
      internal var §1t5023s0§:int;
      
      internal var slots:Vector.<§1t394s0§>;
      
      internal var §1t5134s0§:Boolean;
      
      internal var §1t5135s0§:Boolean;
      
      public function §1t5374s0§()
      {
         var _loc1_:§1t394s0§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.§1t5023s0§ = this.§1t5102s0§ * this.§1t5103s0§;
         this.slots = new Vector.<§1t394s0§>(this.§1t5023s0§);
         super();
         instance = this;
         §1t1521s0§.§1t9290s0§(this.§1t5060s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5046s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t15863s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t15864s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5066s0§.§1t6879s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5383s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5378s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(64);
         this.§1t5060s0§.text = §1t1521s0§.getString(682);
         this.combineButton.§1t5769s0§(§1t1521s0§.getString(695));
         this.§1t5376s0§.§1t5769s0§(§1t1521s0§.getString(695));
         this.§1t5378s0§.text = §1t1521s0§.getString(696);
         this.§1t5377s0§.§1t5769s0§(§1t1521s0§.getString(693));
         this.§1t5382s0§.§1t5769s0§(§1t1521s0§.getString(694));
         this.loading.prompt.text = §1t1521s0§.getString(25);
         this.§1t5377s0§.visible = false;
         this.§1t5382s0§.visible = false;
         this.combineButton.visible = false;
         this.§1t5376s0§.visible = false;
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
         this.§1t5052s0§.visible = false;
         this.§1t5379s0§.doubleClickEnabled = true;
         this.§1t5384s0§.doubleClickEnabled = true;
         this.§1t5380s0§.doubleClickEnabled = true;
         this.§1t5066s0§.chatbutton.visible = false;
      }
      
      public function show() : *
      {
         this.§1t5021s0§.text = §1t1521s0§.getString(692);
         this.§1t5385s0§ = true;
         this.§1t5378s0§.visible = true;
         this.§1t5383s0§.visible = true;
         this.§1t5377s0§.§1t5769s0§(§1t1521s0§.getString(693));
         this.§1t5383s0§.text = §1t1521s0§.getString(697);
         this.inventory = §1t1523s0§.§1t9368s0§;
         this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         this.§1t5089s0§ = 0;
         this.§1t5092s0§ = -1;
         this.§1t5117s0§();
         this.§1t5090s0§ = null;
         this.§1t5091s0§ = null;
         this.visible = true;
         §1t1525s0§.§1t9940s0§().visible = false;
         this.§1t5052s0§.§1t6859s0§.text = "";
         setChildIndex(this.§1t5052s0§,numChildren - 1);
         setChildIndex(this.loading,numChildren - 1);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.§1t5004s0§();
         this.§1t5379s0§.visible = false;
         this.§1t5384s0§.visible = false;
         this.§1t5380s0§.visible = false;
         this.errortext.visible = false;
         this.§1t5055s0§.visible = false;
         this.§1t5054s0§.visible = false;
         this.combineButton.visible = false;
         this.§1t5376s0§.visible = false;
         this.loading.visible = false;
         if(this.inventory.length > 0)
         {
            this.§1t5140s0§(this.slots[0]);
         }
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
      }
      
      public function §1t5386s0§() : *
      {
         this.show();
         this.§1t5021s0§.text = §1t1521s0§.getString(699);
         this.§1t5383s0§.text = §1t1521s0§.getString(11109);
         this.§1t5385s0§ = false;
         this.§1t5382s0§.§1t5769s0§(§1t1521s0§.getString(11089));
         this.§1t5378s0§.visible = false;
      }
      
      public function §1t5117s0§() : *
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
      
      public function §1t5004s0§() : void
      {
         this.§1t5377s0§.addEventListener(MouseEvent.CLICK,this.§1t5387s0§);
         this.§1t5382s0§.addEventListener(MouseEvent.CLICK,this.§1t5388s0§);
         this.combineButton.addEventListener(MouseEvent.CLICK,this.§1t5389s0§);
         this.§1t5376s0§.addEventListener(MouseEvent.CLICK,this.§1t5389s0§);
         this.closeWindow.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5062s0§.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5061s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
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
         this.§1t5379s0§.addEventListener(MouseEvent.CLICK,this.§1t5402s0§);
         this.§1t5379s0§.addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t5404s0§);
         this.§1t5379s0§.addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
         this.§1t5379s0§.addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
         this.§1t5384s0§.addEventListener(MouseEvent.CLICK,this.§1t5402s0§);
         this.§1t5384s0§.addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t5404s0§);
         this.§1t5384s0§.addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
         this.§1t5384s0§.addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
         this.§1t5380s0§.addEventListener(MouseEvent.CLICK,this.§1t5402s0§);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5052s0§.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5047s0§.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      public function removeEventListeners() : void
      {
         this.§1t5377s0§.removeEventListener(MouseEvent.CLICK,this.§1t5387s0§);
         this.§1t5382s0§.removeEventListener(MouseEvent.CLICK,this.§1t5388s0§);
         this.combineButton.removeEventListener(MouseEvent.CLICK,this.§1t5389s0§);
         this.§1t5376s0§.removeEventListener(MouseEvent.CLICK,this.§1t5389s0§);
         this.closeWindow.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5062s0§.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5061s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
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
         this.§1t5379s0§.removeEventListener(MouseEvent.CLICK,this.§1t5402s0§);
         this.§1t5379s0§.removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t5404s0§);
         this.§1t5379s0§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
         this.§1t5379s0§.removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
         this.§1t5384s0§.removeEventListener(MouseEvent.CLICK,this.§1t5402s0§);
         this.§1t5384s0§.removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t5404s0§);
         this.§1t5384s0§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
         this.§1t5384s0§.removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
         this.§1t5380s0§.removeEventListener(MouseEvent.CLICK,this.§1t5402s0§);
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
      
      public function §1t5387s0§(param1:MouseEvent) : void
      {
         this.§1t5394s0§();
         this.§1t5377s0§.visible = false;
         this.§1t5382s0§.visible = false;
      }
      
      public function §1t5388s0§(param1:MouseEvent) : void
      {
         if(!this.§1t5385s0§)
         {
            if(!this.§1t5384s0§.visible || this.§1t5091s0§.§1t483s0§() == 2218)
            {
               this.§1t5395s0§();
            }
            else
            {
               this.§1t5394s0§();
            }
            return;
         }
         this.§1t5395s0§();
         this.§1t5377s0§.visible = false;
         this.§1t5382s0§.visible = false;
      }
      
      public function §1t5389s0§(param1:MouseEvent) : void
      {
         if(this.§1t5384s0§.§1t483s0§() == 2218 || !this.§1t5385s0§)
         {
            this.§1t5391s0§();
         }
         else
         {
            this.loading.visible = true;
            §1t1523s0§.§1t9615s0§(10,this.§1t5125s0§,this.§1t5126s0§);
         }
      }
      
      internal function §1t5125s0§() : *
      {
         this.loading.visible = false;
         var _loc1_:String = this.§1t5380s0§.§1t2217s0§().§1t490s0§() + " " + this.§1t5379s0§.§1t2217s0§().§1t490s0§() + " " + this.§1t5384s0§.§1t2217s0§().§1t490s0§();
         §1t3317s0§.instance.§1t1986s0§(6,"combineitems " + _loc1_,10);
         §1t1523s0§.§1t7692s0§(this.§1t5384s0§.§1t2217s0§());
         §1t1523s0§.§1t7692s0§(this.§1t5379s0§.§1t2217s0§());
         §1t1523s0§.§1t7693s0§(this.§1t5380s0§.§1t2217s0§());
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
         §1t88s0§.instance.§1t1513s0§();
         this.inventory = §1t1523s0§.§1t9368s0§;
         this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         this.§1t5089s0§ = this.§1t5088s0§ - 1;
         if(this.§1t5089s0§ < 0)
         {
            this.§1t5089s0§ = 0;
         }
         this.§1t5117s0§();
         this.§1t5399s0§("");
         this.§1t5384s0§.visible = false;
         this.§1t5379s0§.visible = false;
         §1t3317s0§.instance.§1t1946s0§();
         §1t251s0§.instance.§1t3554s0§(this.§1t5380s0§.§1t2217s0§());
      }
      
      internal function §1t5126s0§() : *
      {
         this.loading.visible = false;
         §1t406s0§.instance.§1t6552s0§(10);
      }
      
      internal function §1t5390s0§() : Boolean
      {
         return this.§1t5384s0§.§1t483s0§() != 2218 && this.§1t5380s0§.§1t2217s0§().§1t483s0§() >= 3010 && this.§1t5380s0§.§1t2217s0§().§1t483s0§() <= 3016;
      }
      
      public function §1t5391s0§() : *
      {
         if(this.§1t5390s0§())
         {
            if(!§1t251s0§.instance.§1t3595s0§())
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return;
            }
            this.loading.visible = true;
            §1t251s0§.instance.§1t3547s0§(this.§1t5392s0§);
         }
         else
         {
            this.§1t5393s0§();
         }
      }
      
      internal function §1t5392s0§() : *
      {
         if(!this.loading.visible)
         {
            return;
         }
         this.loading.visible = false;
         this.§1t5393s0§();
      }
      
      internal function §1t5393s0§() : *
      {
         §1t1523s0§.§1t7692s0§(this.§1t5384s0§.§1t2217s0§());
         §1t1523s0§.§1t7692s0§(this.§1t5379s0§.§1t2217s0§());
         if(this.§1t5384s0§.§1t483s0§() != 2218 && this.§1t5380s0§.§1t2217s0§().§1t483s0§() >= 3010 && this.§1t5380s0§.§1t2217s0§().§1t483s0§() <= 3016)
         {
            this.§1t5380s0§.item = §1t1644s0§.instance.§1t1665s0§(this.§1t5380s0§.§1t2217s0§().§1t483s0§(),§1t1523s0§.getLevel(),true,true,true);
            this.§1t5091s0§ = this.§1t5380s0§.item;
            if(this.§1t5091s0§.§1t514s0§() == "")
            {
               this.§1t5066s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t518s0§();
            }
            else
            {
               this.§1t5066s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t514s0§() + "\n\n" + this.§1t5091s0§.§1t518s0§();
            }
            this.§1t5051s0§.visible = this.§1t5066s0§.§1t15864s0§.numLines > 7;
         }
         §1t1523s0§.§1t7693s0§(this.§1t5380s0§.§1t2217s0§());
         §1t88s0§.instance.§1t1513s0§();
         this.inventory = §1t1523s0§.§1t9368s0§;
         this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         this.§1t5089s0§ = this.§1t5088s0§ - 1;
         if(this.§1t5089s0§ < 0)
         {
            this.§1t5089s0§ = 0;
         }
         this.§1t5117s0§();
         this.§1t5399s0§("");
         this.§1t5384s0§.visible = false;
         this.§1t5379s0§.visible = false;
         §1t3317s0§.instance.§1t1946s0§();
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
         §1t406s0§.instance.§1t6578s0§();
         this.§1t5129s0§(null);
         this.removeEventListeners();
         this.visible = false;
         §1t1525s0§.§1t9940s0§().visible = true;
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
         this.§1t5377s0§.visible = false;
         this.§1t5382s0§.visible = false;
         this.§1t5066s0§.visible = false;
         this.§1t5051s0§.visible = false;
      }
      
      public function §1t5394s0§() : void
      {
         if(this.§1t5384s0§.visible && this.§1t5384s0§.§1t2217s0§().equals(this.§1t5091s0§))
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_put");
         if(this.§1t5396s0§(this.§1t5091s0§.§1t483s0§()))
         {
            this.§1t5379s0§.visible = true;
            this.§1t5379s0§.§1t6872s0§(this.§1t5091s0§.§1t483s0§(),this.§1t5091s0§.§1t508s0§(),this.§1t5091s0§.§1t527s0§(),this.§1t5091s0§.§1t528s0§());
            this.§1t5379s0§.setItem(this.§1t5091s0§);
            this.§1t5379s0§.§1t6870s0§("");
            this.§1t5379s0§.§1t6786s0§(false);
            this.§1t5398s0§();
         }
      }
      
      public function §1t5395s0§() : void
      {
         if(this.§1t5379s0§.visible && this.§1t5379s0§.§1t2217s0§().equals(this.§1t5091s0§))
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_put");
         if(this.§1t5396s0§(this.§1t5091s0§.§1t483s0§()))
         {
            this.§1t5384s0§.visible = true;
            this.§1t5384s0§.§1t6872s0§(this.§1t5091s0§.§1t483s0§(),this.§1t5091s0§.§1t508s0§(),this.§1t5091s0§.§1t527s0§(),this.§1t5091s0§.§1t528s0§());
            this.§1t5384s0§.setItem(this.§1t5091s0§);
            this.§1t5384s0§.§1t6870s0§("");
            this.§1t5384s0§.§1t6786s0§(false);
            this.§1t5398s0§();
         }
      }
      
      public function §1t5133s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_put");
         if(this.§1t5379s0§.visible && this.§1t5379s0§.§1t2217s0§().equals(this.§1t5091s0§))
         {
            this.§1t5379s0§.visible = false;
         }
         else if(this.§1t5384s0§.visible && this.§1t5384s0§.§1t2217s0§().equals(this.§1t5091s0§))
         {
            this.§1t5384s0§.visible = false;
         }
         this.§1t5399s0§("");
      }
      
      internal function §1t5396s0§(param1:int) : Boolean
      {
         return !this.§1t5385s0§ || param1 >= 3000 && param1 < 6000 || param1 >= 7000 && param1 < 8000 || param1 >= 9000 && param1 < 10000 || param1 >= 11000 && param1 < 14000 || param1 == 2218;
      }
      
      internal function §1t5397s0§() : *
      {
         return this.§1t5384s0§.§1t2217s0§().§1t549s0§() && this.§1t5379s0§.§1t2217s0§().§1t494s0§() > 1;
      }
      
      internal function §1t5398s0§() : *
      {
         var _loc3_:§1t17s0§ = null;
         var _loc4_:§1t18s0§ = null;
         var _loc5_:§1t104s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(!this.§1t5379s0§.visible || !this.§1t5384s0§.visible)
         {
            this.§1t5399s0§("");
            return;
         }
         var _loc1_:int = Math.floor(this.§1t5379s0§.§1t483s0§() / 1000);
         var _loc2_:int = Math.floor(this.§1t5384s0§.§1t483s0§() / 1000);
         if(!this.§1t5385s0§)
         {
            _loc3_ = this.§1t5400s0§();
            if(_loc3_ == null)
            {
               this.§1t5399s0§(§1t1521s0§.getString(11110));
               return;
            }
         }
         else if(this.§1t5384s0§.§1t483s0§() == 2218)
         {
            if(!this.§1t5379s0§.§1t2217s0§().§1t549s0§())
            {
               this.§1t5399s0§(§1t1521s0§.getString(11107));
               return;
            }
            if(this.§1t5379s0§.§1t2217s0§().§1t494s0§() > 1)
            {
               this.§1t5399s0§(§1t1521s0§.getString(11138));
               return;
            }
         }
         else if(this.§1t5385s0§ && _loc1_ != _loc2_)
         {
            this.§1t5399s0§(§1t1521s0§.getString(698));
            return;
         }
         this.§1t5380s0§.visible = true;
         this.errortext.visible = false;
         if(this.§1t5384s0§.§1t483s0§() != 2218 && this.§1t5385s0§)
         {
            this.§1t5055s0§.visible = true;
            this.§1t5054s0§.visible = true;
            this.combineButton.visible = true;
         }
         else
         {
            this.§1t5376s0§.visible = true;
         }
         if(this.§1t5385s0§)
         {
            if(this.§1t5397s0§())
            {
               this.errortext.htmlText = "<font color=\'#FFFFFF\'>" + §1t1521s0§.getString(11108) + "</font>";
               this.errortext.visible = true;
            }
            if(this.§1t5384s0§.§1t483s0§() == 2218)
            {
               _loc3_ = §1t17s0§.clone(this.§1t5379s0§.§1t2217s0§());
               _loc3_.§1t552s0§();
            }
            else
            {
               _loc3_ = new §1t17s0§(this.§1t5379s0§.§1t483s0§());
               _loc3_.§1t499s0§(this.§1t5384s0§.§1t2217s0§().modifiers);
               _loc5_ = §1t1524s0§.§1t9862s0§(this.§1t5379s0§.§1t483s0§());
               _loc6_ = _loc5_.defense;
               _loc7_ = §1t1524s0§.§1t9862s0§(this.§1t5384s0§.§1t483s0§()).defense;
               if(_loc3_.§1t523s0§(7) == 0)
               {
                  _loc3_.§1t493s0§(7,_loc7_ - _loc6_);
               }
               else
               {
                  _loc4_ = _loc3_.§1t524s0§(7);
                  _loc4_.value += _loc7_ - _loc6_;
               }
               if(_loc1_ == 4 || _loc1_ == 11)
               {
                  _loc5_ = §1t1524s0§.§1t9862s0§(this.§1t5379s0§.§1t483s0§());
                  _loc8_ = this.§1t5384s0§.§1t2217s0§().§1t545s0§();
                  _loc9_ = _loc5_.weight;
                  _loc3_.§1t478s0§ = _loc8_ - _loc9_;
               }
               if(_loc1_ == 13)
               {
                  _loc5_ = §1t1524s0§.§1t9862s0§(this.§1t5379s0§.§1t483s0§());
                  _loc10_ = _loc5_.mindamage;
                  _loc11_ = §1t1524s0§.§1t9862s0§(this.§1t5384s0§.§1t483s0§()).mindamage;
                  if(_loc3_.§1t523s0§(6) == 0)
                  {
                     _loc3_.§1t493s0§(6,_loc11_ - _loc10_);
                  }
                  else
                  {
                     _loc4_ = _loc3_.§1t524s0§(6);
                     _loc4_.value += _loc11_ - _loc10_;
                  }
                  if(_loc5_.durability != 0)
                  {
                     _loc3_.uses = this.§1t5384s0§.§1t2217s0§().uses;
                  }
                  if(this.§1t5379s0§.§1t2217s0§().§1t539s0§())
                  {
                     _loc3_.§1t540s0§(this.§1t5379s0§.§1t2217s0§().§1t472s0§);
                  }
               }
               _loc3_.§1t529s0§(this.§1t5379s0§.§1t527s0§());
               _loc3_.§1t530s0§(this.§1t5379s0§.§1t528s0§());
               if(this.§1t5384s0§.§1t2217s0§().xp != null && !this.§1t5397s0§())
               {
                  _loc3_.xp = this.§1t5384s0§.§1t2217s0§().xp;
                  _loc3_.§1t470s0§ = this.§1t5384s0§.§1t2217s0§().§1t470s0§;
               }
               else if(this.§1t5379s0§.§1t2217s0§().xp != null && this.§1t5384s0§.§1t2217s0§().xp == null)
               {
                  _loc3_.§1t548s0§(0);
                  _loc3_.§1t470s0§ = this.§1t5384s0§.§1t2217s0§().getLevel();
               }
            }
         }
         if(_loc3_.getLevel() > this.§1t5384s0§.§1t2217s0§().getLevel() && this.§1t5384s0§.§1t483s0§() != 2218)
         {
            this.errortext.htmlText = "<font color=\'#FFFFFF\'>" + §1t1521s0§.getString(11495) + "</font>";
            this.errortext.visible = true;
         }
         _loc3_.§1t520s0§();
         this.§1t5380s0§.§1t6872s0§(_loc3_.§1t483s0§(),_loc3_.§1t508s0§(),_loc3_.§1t527s0§(),_loc3_.§1t528s0§());
         this.§1t5380s0§.setItem(_loc3_);
         this.§1t5380s0§.§1t6870s0§("");
         this.§1t5380s0§.§1t6786s0§(false);
      }
      
      internal function §1t5399s0§(param1:String) : *
      {
         this.§1t5380s0§.visible = false;
         this.errortext.visible = true;
         this.§1t5055s0§.visible = false;
         this.§1t5054s0§.visible = false;
         this.combineButton.visible = false;
         this.§1t5376s0§.visible = false;
         this.errortext.text = param1;
      }
      
      internal function §1t5400s0§() : §1t17s0§
      {
         var _loc3_:String = null;
         var _loc4_:§1t17s0§ = null;
         var _loc5_:§1t17s0§ = null;
         var _loc6_:§1t17s0§ = null;
         var _loc7_:§1t17s0§ = null;
         var _loc8_:§1t17s0§ = null;
         var _loc9_:§1t17s0§ = null;
         var _loc10_:§1t17s0§ = null;
         var _loc1_:int = this.§1t5384s0§.§1t483s0§();
         var _loc2_:int = this.§1t5379s0§.§1t483s0§();
         if(_loc1_ < _loc2_)
         {
            _loc3_ = _loc1_.toString() + "_" + _loc2_.toString();
         }
         else
         {
            _loc3_ = _loc2_.toString() + "_" + _loc1_.toString();
         }
         if(_loc3_ == "20037_20051")
         {
            return new §1t17s0§(20038);
         }
         if(_loc3_ == "20114_20115")
         {
            _loc4_ = new §1t17s0§(3010);
            _loc4_.§1t548s0§();
            _loc4_.§1t470s0§ = §1t1523s0§.getLevel();
            return _loc4_;
         }
         if(_loc3_ == "20116_20117")
         {
            _loc5_ = new §1t17s0§(3011);
            _loc5_.§1t548s0§();
            _loc5_.§1t470s0§ = §1t1523s0§.getLevel();
            return _loc5_;
         }
         if(_loc3_ == "20118_20119")
         {
            _loc6_ = new §1t17s0§(3012);
            _loc6_.§1t548s0§();
            _loc6_.§1t470s0§ = §1t1523s0§.getLevel();
            return _loc6_;
         }
         if(_loc3_ == "20120_20121")
         {
            _loc7_ = new §1t17s0§(3013);
            _loc7_.§1t548s0§();
            _loc7_.§1t470s0§ = §1t1523s0§.getLevel();
            return _loc7_;
         }
         if(_loc3_ == "20122_20123")
         {
            _loc8_ = new §1t17s0§(3014);
            _loc8_.§1t548s0§();
            _loc8_.§1t470s0§ = §1t1523s0§.getLevel();
            return _loc8_;
         }
         if(_loc3_ == "20124_20125")
         {
            _loc9_ = new §1t17s0§(3015);
            _loc9_.§1t548s0§();
            _loc9_.§1t470s0§ = §1t1523s0§.getLevel();
            return _loc9_;
         }
         if(_loc3_ == "20126_20127")
         {
            _loc10_ = new §1t17s0§(3016);
            _loc10_.§1t548s0§();
            _loc10_.§1t470s0§ = §1t1523s0§.getLevel();
            return _loc10_;
         }
         return null;
      }
      
      public function §1t5136s0§(param1:MouseEvent) : *
      {
         this.§1t5134s0§ = true;
         var _loc2_:§1t394s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5052s0§.§1t6872s0§(_loc2_.§1t483s0§(),_loc2_.§1t6873s0§(),_loc2_.§1t527s0§(),_loc2_.§1t528s0§());
         this.§1t5052s0§.x = mouseX - 35;
         this.§1t5052s0§.y = mouseY - 35;
         if((param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§ < 200)
         {
            this.§1t5403s0§(_loc2_);
            this.§1t5135s0§ = true;
         }
         else if((param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§ < 355)
         {
            this.§1t5403s0§(_loc2_);
            this.§1t5135s0§ = true;
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.§1t5140s0§(_loc2_);
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
            if(this.§1t5135s0§)
            {
               this.§1t5133s0§();
            }
            else if(this.§1t5052s0§.x < 200 || this.§1t5052s0§.§1t483s0§() == 2218)
            {
               this.§1t5395s0§();
            }
            else if(this.§1t5052s0§.x < 355)
            {
               this.§1t5394s0§();
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
         if(!this.§1t5385s0§)
         {
            this.§1t5382s0§.visible = true;
         }
         else if(!this.§1t5091s0§.§1t502s0§() && this.§1t5396s0§(this.§1t5091s0§.§1t483s0§()))
         {
            if(this.§1t5091s0§.§1t483s0§() == 2218)
            {
               this.§1t5377s0§.visible = false;
               this.§1t5382s0§.visible = true;
            }
            else if(this.§1t5091s0§ != null && (this.§1t5379s0§.visible && this.§1t5379s0§.§1t2217s0§().equals(this.§1t5091s0§) || this.§1t5384s0§.visible && this.§1t5384s0§.§1t2217s0§().equals(this.§1t5091s0§)))
            {
               this.§1t5377s0§.visible = false;
               this.§1t5382s0§.visible = false;
            }
            else
            {
               this.§1t5377s0§.visible = true;
               this.§1t5382s0§.visible = true;
            }
         }
         else
         {
            this.§1t5377s0§.visible = false;
            this.§1t5382s0§.visible = false;
         }
      }
      
      public function §1t5401s0§(param1:§1t17s0§) : *
      {
         this.§1t5091s0§ = param1;
         this.§1t5395s0§();
         this.§1t5128s0§();
         this.§1t5066s0§.§1t15865s0§.§1t6872s0§(this.§1t5091s0§.§1t483s0§(),this.§1t5091s0§.§1t508s0§(),this.§1t5091s0§.§1t527s0§(),this.§1t5091s0§.§1t528s0§());
         this.§1t5066s0§.§1t15865s0§.§1t6870s0§("");
         this.§1t5066s0§.§1t15863s0§.htmlText = this.§1t5091s0§.§1t510s0§();
         var _loc2_:int = this.§1t5091s0§.getLevel();
         if(_loc2_ > 0)
         {
            this.§1t5066s0§.§1t6879s0§.text = §1t1521s0§.getString(47,[_loc2_]);
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
         this.§1t5377s0§.visible = false;
         this.§1t5382s0§.visible = false;
      }
      
      public function §1t5141s0§(param1:MouseEvent) : void
      {
         this.§1t5090s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5091s0§ = this.§1t5090s0§.item;
         if(!this.§1t5384s0§.visible || this.§1t5091s0§.§1t483s0§() == 2218)
         {
            this.§1t5395s0§();
         }
         else
         {
            this.§1t5394s0§();
         }
      }
      
      public function §1t5402s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         var _loc2_:§1t394s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5403s0§(_loc2_);
      }
      
      public function §1t5403s0§(param1:§1t394s0§) : void
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
         this.§1t5377s0§.visible = false;
         this.§1t5382s0§.visible = false;
      }
      
      public function §1t5404s0§(param1:MouseEvent) : void
      {
         this.§1t5090s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5091s0§ = this.§1t5090s0§.item;
         this.§1t5133s0§();
      }
   }
}

