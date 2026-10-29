package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1204")]
   public class §1t5830s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var coinimg:MovieClip;
      
      public var coinsText:TextField;
      
      public var §1t5831s0§:§1t5000s0§;
      
      public var §1t5054s0§:TextField;
      
      public var goldimg:MovieClip;
      
      public var §1t472s0§:TextField;
      
      public var §1t5028s0§:§1t4912s0§;
      
      public var §1t5027s0§:§1t4912s0§;
      
      public var slot0:§1t394s0§;
      
      public var slot1:§1t394s0§;
      
      public var slot2:§1t394s0§;
      
      public var slot3:§1t394s0§;
      
      public var titleText:TextField;
      
      internal var §1t5834s0§:Vector.<§1t17s0§> = new Vector.<§1t17s0§>();
      
      internal var §1t5835s0§:§1t98s0§ = new §1t98s0§();
      
      internal var §1t5836s0§:§1t98s0§ = new §1t98s0§();
      
      internal var §1t5837s0§:Array = new Array();
      
      internal var §1t5838s0§:Vector.<§1t17s0§> = new Vector.<§1t17s0§>();
      
      internal var §1t5089s0§:int;
      
      internal var §1t5088s0§:int;
      
      internal var §1t5102s0§:int = 4;
      
      internal var §1t5103s0§:int = 1;
      
      internal var §1t5023s0§:int = this.§1t5102s0§ * this.§1t5103s0§;
      
      internal var slots:Vector.<§1t394s0§> = new Vector.<§1t394s0§>(4);
      
      public function §1t5830s0§()
      {
         super();
         this.slots[0] = this.slot0;
         this.slots[1] = this.slot1;
         this.slots[2] = this.slot2;
         this.slots[3] = this.slot3;
         this.slots.fixed = true;
         this.button.§1t5769s0§(§1t1521s0§.getString(5));
         §1t1521s0§.§1t9290s0§(this.titleText,true);
         §1t1521s0§.§1t9290s0§(this.§1t472s0§,true);
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
         this.coinsText.visible = this.§1t5835s0§.§1t697s0§() > 0;
         this.coinimg.visible = this.§1t5835s0§.§1t697s0§() > 0;
         this.§1t5054s0§.visible = this.§1t5836s0§.§1t697s0§() > 0;
         this.goldimg.visible = this.§1t5836s0§.§1t697s0§() > 0;
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
      
      public function show() : *
      {
         if(!this.§1t5848s0§())
         {
            this.§1t5484s0§(null);
            return;
         }
         if(!§1t406s0§.instance.§1t6498s0§.visible)
         {
            §1t406s0§.instance.§1t6613s0§();
         }
         this.§1t472s0§.visible = false;
         this.§1t472s0§.htmlText = "";
         if(this.§1t5834s0§.length == 0)
         {
            this.button.x = 340;
            this.§1t5831s0§.visible = false;
         }
         else
         {
            this.button.x = 270;
            this.§1t5831s0§.visible = true;
         }
         this.§1t5840s0§();
         this.button.§1t5769s0§(§1t1521s0§.getString(178));
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.§1t5004s0§();
         this.§1t5831s0§.§1t5769s0§(§1t1521s0§.getString(471));
         this.§1t5831s0§.addEventListener(MouseEvent.CLICK,this.§1t5842s0§);
         this.§1t5831s0§.§1t5004s0§();
         this.§1t5027s0§.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5028s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.visible = true;
         this.§1t5089s0§ = 0;
         this.§1t5088s0§ = Math.floor((this.§1t5834s0§.length - 1) / this.§1t5102s0§);
         this.§1t5559s0§();
         var _loc1_:int = 0;
         while(_loc1_ < 4)
         {
            this.slots[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t5843s0§);
            this.slots[_loc1_].addEventListener(MouseEvent.ROLL_OVER,this.§1t5843s0§);
            this.slots[_loc1_].addEventListener(MouseEvent.ROLL_OUT,this.§1t5844s0§);
            _loc1_++;
         }
         this.titleText.text = §1t1521s0§.getString(252) + "\n";
         var _loc2_:int = int(this.§1t5837s0§.length);
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            if(_loc1_ == _loc2_ - 1)
            {
               this.titleText.appendText(this.§1t5837s0§[_loc1_] + "!");
            }
            else if(_loc1_ == _loc2_ - 2 && _loc2_ > 1)
            {
               this.titleText.appendText(this.§1t5837s0§[_loc1_] + " " + §1t1521s0§.getString(253) + " ");
            }
            else
            {
               this.titleText.appendText(this.§1t5837s0§[_loc1_] + ", ");
            }
            _loc1_++;
         }
         this.coinsText.text = this.§1t5835s0§.toString();
         this.§1t5054s0§.text = this.§1t5836s0§.toString();
      }
      
      public function §1t5841s0§(param1:Vector.<§1t17s0§>) : *
      {
         if(this.visible)
         {
            this.§1t5838s0§ = this.§1t5838s0§.concat(param1);
         }
         else
         {
            this.§1t5838s0§ = param1;
         }
      }
      
      internal function §1t5484s0§(param1:MouseEvent) : void
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
         }
         §1t1523s0§.§1t9621s0§(this.§1t5838s0§);
         §1t3317s0§.instance.§1t1946s0§();
         this.§1t5842s0§(null);
      }
      
      internal function §1t5842s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_drop");
         }
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.removeEventListeners();
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
         if(§1t406s0§.instance.§1t6498s0§.visible)
         {
            §1t406s0§.instance.§1t6498s0§.§1t6710s0§();
            if(§1t406s0§.instance.§1t6518s0§.visible)
            {
               §1t406s0§.instance.§1t6518s0§.§1t6899s0§();
            }
            if(§1t406s0§.instance.§1t5947s0§.visible)
            {
               §1t406s0§.instance.§1t5947s0§.§1t5892s0§();
            }
            if(§1t406s0§.instance.§1t6509s0§.visible)
            {
               §1t406s0§.instance.§1t6509s0§.§1t6899s0§();
            }
         }
         else if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10045s0§();
            §1t406s0§.instance.§1t6610s0§();
         }
         this.§1t5850s0§();
      }
      
      internal function §1t5843s0§(param1:MouseEvent) : void
      {
         this.§1t472s0§.visible = true;
         this.§1t5844s0§(param1);
         this.§1t472s0§.htmlText = param1.target.item.§1t509s0§();
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
         var _loc2_:int = int(this.§1t5838s0§.length);
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
               _loc4_.§1t6872s0§(this.§1t5838s0§[_loc5_].§1t483s0§(),this.§1t5838s0§[_loc5_].§1t508s0§(),this.§1t5838s0§[_loc5_].§1t527s0§(),this.§1t5838s0§[_loc5_].§1t528s0§());
               _loc4_.setItem(this.§1t5838s0§[_loc5_]);
               if(this.§1t5838s0§[_loc5_].§1t484s0§() > 1)
               {
                  _loc4_.§1t6870s0§("x" + this.§1t5838s0§[_loc5_].§1t484s0§().toString());
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
      
      public function §1t5845s0§(param1:§1t17s0§) : *
      {
         this.§1t5834s0§.push(param1);
      }
      
      public function §1t5846s0§(param1:int) : *
      {
         this.§1t5835s0§.§1t698s0§(param1);
      }
      
      public function §1t5847s0§(param1:int) : *
      {
         this.§1t5836s0§.§1t698s0§(param1);
      }
      
      public function §1t5848s0§() : Boolean
      {
         return this.§1t5835s0§.§1t697s0§() > 0 || this.§1t5836s0§.§1t697s0§() > 0 || this.§1t5834s0§.length > 0;
      }
      
      public function §1t5849s0§(param1:String) : *
      {
         if(this.§1t5837s0§.indexOf(param1) == -1)
         {
            this.§1t5837s0§.push(param1);
         }
      }
      
      public function §1t5850s0§() : *
      {
         this.§1t5835s0§.§1t695s0§(0);
         this.§1t5836s0§.§1t695s0§(0);
         this.§1t5834s0§.length = 0;
         this.§1t5837s0§.length = 0;
         this.§1t5838s0§.length = 0;
      }
   }
}

