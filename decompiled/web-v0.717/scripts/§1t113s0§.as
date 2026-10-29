package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3640")]
   public class §1t113s0§ extends MovieClip
   {
      
      public static var instance:§1t113s0§;
      
      public var §1t5155s0§:MovieClip;
      
      public var §1t5156s0§:TextField;
      
      public var §1t5157s0§:TextField;
      
      public var §1t5158s0§:MovieClip;
      
      public var §1t5159s0§:TextField;
      
      public var §1t5160s0§:MovieClip;
      
      public var §1t5161s0§:TextField;
      
      public var §1t5162s0§:SimpleButton;
      
      public var §1t5163s0§:MovieClip;
      
      public var §1t5164s0§:MovieClip;
      
      public var §1t5165s0§:TextField;
      
      public var §1t5166s0§:TextField;
      
      public var §1t5167s0§:SimpleButton;
      
      public var §1t5168s0§:MovieClip;
      
      public var §1t5169s0§:TextField;
      
      public var §1t5170s0§:MovieClip;
      
      public var §1t5171s0§:TextField;
      
      public var §1t5172s0§:TextField;
      
      public var §1t5173s0§:MovieClip;
      
      public var logo:§1t5175s0§;
      
      public var §1t5176s0§:§1t5177s0§;
      
      public var §1t5178s0§:MovieClip;
      
      public var §1t5179s0§:SimpleButton;
      
      public var §1t5180s0§:§1t5181s0§;
      
      public var §1t5182s0§:MovieClip;
      
      public var §1t5183s0§:§1t5184s0§;
      
      public var timer:MovieClip;
      
      public var §1t5185s0§:§1t5186s0§;
      
      internal var §1t5187s0§:§1t74s0§;
      
      internal var §1t5188s0§:Boolean = false;
      
      internal var §1t5189s0§:Array;
      
      internal var §1t5190s0§:int;
      
      internal var §1t5191s0§:int;
      
      internal var §1t5192s0§:Boolean = false;
      
      internal var §1t5193s0§:§1t5184s0§;
      
      internal var §1t5194s0§:Boolean = false;
      
      internal var latency:int = -1;
      
      internal var §1t1417s0§:Boolean;
      
      internal var §1t5195s0§:int;
      
      internal var §1t5203s0§:String;
      
      internal var §1t5204s0§:String;
      
      internal var §1t1774s0§:int;
      
      internal var §1t5234s0§:String = "";
      
      internal var §1t5235s0§:int = 0;
      
      internal var §1t5237s0§:String = "";
      
      public function §1t113s0§()
      {
         var _loc1_:§1t5184s0§ = null;
         this.§1t5189s0§ = new Array();
         this.§1t5203s0§ = "<font color=\'#000000\'>" + §1t1521s0§.getString(175) + "</font>";
         this.§1t5204s0§ = "<font color=\'#BBBBBB\'>" + §1t1521s0§.getString(960) + "</font>";
         super();
         instance = this;
         tabEnabled = false;
         tabChildren = false;
         §1t1521s0§.§1t9290s0§(this.§1t5168s0§.§1t15885s0§,true);
         this.§1t5168s0§.§1t15885s0§.text = §1t1521s0§.getString(45);
         this.§1t5168s0§.mouseEnabled = false;
         this.§1t5168s0§.mouseChildren = false;
         §1t1521s0§.§1t9290s0§(this.§1t5169s0§);
         this.§1t5169s0§.text = §1t1521s0§.getString(175);
         §1t1521s0§.§1t9290s0§(this.§1t5159s0§);
         §1t1521s0§.§1t9290s0§(this.timer.§1t5284s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5157s0§);
         this.§1t5157s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t5156s0§);
         this.§1t5156s0§.mouseEnabled = false;
         this.§1t5155s0§.buttonMode = true;
         this.§1t5159s0§.mouseEnabled = false;
         this.§1t5171s0§.mouseEnabled = false;
         this.§1t5172s0§.mouseEnabled = false;
         this.§1t5165s0§.mouseEnabled = false;
         this.§1t5166s0§.mouseEnabled = false;
         this.§1t5160s0§.mouseEnabled = false;
         this.logo.mouseEnabled = false;
         this.timer.mouseEnabled = false;
         this.timer.mouseChildren = false;
         this.§1t5173s0§.mouseEnabled = false;
         this.§1t5170s0§.mouseEnabled = false;
         this.§1t5170s0§.mouseChildren = false;
         this.§1t5164s0§.mouseEnabled = false;
         this.§1t5164s0§.mouseChildren = false;
         this.§1t5182s0§.mouseEnabled = false;
         this.§1t5182s0§.mouseChildren = false;
         §1t1521s0§.§1t9290s0§(this.§1t5161s0§,true);
         this.§1t5161s0§.text = §1t1521s0§.getString(208);
         this.§1t5161s0§.mouseEnabled = false;
         this.§1t5158s0§.highlight.visible = false;
         this.§1t5158s0§.buttonMode = true;
         if(§1t1523s0§.language == §1t1521s0§.CHINESE)
         {
            this.§1t5163s0§.§1t13123s0§.maxChars = 32;
         }
         else
         {
            this.§1t5163s0§.§1t13123s0§.maxChars = 55;
         }
         §1t1521s0§.§1t9290s0§(this.§1t5163s0§.§1t13123s0§,false);
         §1t1521s0§.§1t9290s0§(this.§1t5163s0§.§1t13358s0§,true);
         this.§1t5156s0§.text = §1t1521s0§.getString(619);
         this.§1t5157s0§.text = §1t1521s0§.getString(620);
         this.§1t5163s0§.§1t13358s0§.text = "";
         this.§1t5156s0§.cacheAsBitmap = true;
         this.§1t5157s0§.cacheAsBitmap = true;
         this.§1t5161s0§.cacheAsBitmap = true;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = new §1t5184s0§();
            _loc1_.x = 760 - _loc2_ * 60;
            _loc1_.y = 450;
            this.§1t5189s0§.push(_loc1_);
            addChild(_loc1_);
            _loc1_.visible = false;
            _loc2_++;
         }
      }
      
      public function init() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < numChildren)
         {
            getChildAt(_loc1_).visible = true;
            _loc1_++;
         }
         this.§1t5187s0§ = §1t1523s0§.§1t9584s0§();
         this.§1t5158s0§.§1t15890s0§.addChild(this.§1t5187s0§);
         this.§1t5187s0§.scaleX = 2;
         this.§1t5187s0§.scaleY = 2;
         this.§1t5211s0§();
         this.timer.visible = false;
         this.§1t5163s0§.visible = false;
         if(!((§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§()) && §1t1523s0§.§1t9672s0§()))
         {
            this.§1t5163s0§.§1t13358s0§.text = "";
         }
         this.§1t5163s0§.§1t13123s0§.text = "";
         this.§1t5173s0§.visible = false;
         this.§1t5161s0§.visible = false;
         this.§1t5158s0§.highlight.visible = false;
         this.§1t5185s0§.visible = false;
         this.§1t5176s0§.visible = false;
         this.§1t5180s0§.visible = false;
         this.§1t5183s0§.visible = false;
         this.§1t5183s0§.cacheAsBitmap = false;
         this.§1t5183s0§.§1t6979s0§();
         if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
         {
            this.§1t5163s0§.gotoAndStop(2);
         }
         else
         {
            this.§1t5163s0§.gotoAndStop(1);
         }
         this.enable();
         this.§1t5194s0§ = false;
         this.§1t5162s0§.visible = §1t1540s0§.§1t10046s0§() || §1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§();
         this.§1t5179s0§.visible = !§1t1540s0§.§1t10046s0§() && !§1t1540s0§.§1t10047s0§();
         this.§1t5178s0§.visible = false;
         this.logo.visible = false;
         this.§1t5167s0§.visible = false;
         this.§1t5246s0§();
         this.latency = -1;
         this.§1t5250s0§();
         this.§1t5253s0§();
         if(§1t1523s0§.language == §1t1521s0§.CHINESE)
         {
            this.§1t5163s0§.§1t13123s0§.maxChars = 32;
         }
         else
         {
            this.§1t5163s0§.§1t13123s0§.maxChars = 55;
         }
      }
      
      public function enable() : *
      {
         visible = true;
         this.§1t5155s0§.addEventListener(MouseEvent.CLICK,this.§1t5245s0§);
         this.§1t5158s0§.addEventListener(MouseEvent.MOUSE_OVER,this.§1t5215s0§);
         this.§1t5158s0§.addEventListener(MouseEvent.MOUSE_OUT,this.§1t5216s0§);
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.§1t5189s0§[_loc1_].addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5229s0§);
            _loc1_++;
         }
         if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
         {
            this.§1t5163s0§.§1t15893s0§.addEventListener(MouseEvent.CLICK,this.§1t5243s0§);
            this.§1t5163s0§.§1t15893s0§.§1t5004s0§();
         }
         this.§1t5163s0§.§1t13123s0§.addEventListener(MouseEvent.CLICK,this.§1t5244s0§);
         this.§1t5163s0§.§1t13123s0§.addEventListener(KeyboardEvent.KEY_UP,this.§1t5233s0§);
         this.§1t5163s0§.§1t5020s0§.addEventListener(MouseEvent.CLICK,this.§1t5251s0§);
         this.§1t5163s0§.§1t5019s0§.addEventListener(MouseEvent.CLICK,this.§1t5252s0§);
         if(!§1t1523s0§.§1t9528s0§)
         {
            this.§1t5163s0§.§1t13358s0§.addEventListener(Event.SCROLL,this.§1t5241s0§);
         }
         this.§1t5225s0§();
      }
      
      public function disable() : *
      {
         visible = false;
         this.§1t5183s0§.cacheAsBitmap = false;
         this.§1t5155s0§.removeEventListener(MouseEvent.CLICK,this.§1t5245s0§);
         this.§1t5158s0§.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t5215s0§);
         this.§1t5158s0§.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t5216s0§);
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.§1t5189s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5229s0§);
            _loc1_++;
         }
         if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
         {
            this.§1t5163s0§.§1t15893s0§.removeEventListener(MouseEvent.CLICK,this.§1t5243s0§);
            this.§1t5163s0§.§1t15893s0§.removeEventListeners();
         }
         this.§1t5163s0§.§1t13123s0§.removeEventListener(MouseEvent.CLICK,this.§1t5244s0§);
         this.§1t5163s0§.§1t13123s0§.removeEventListener(KeyboardEvent.KEY_UP,this.§1t5233s0§);
         this.§1t5163s0§.§1t5020s0§.removeEventListener(MouseEvent.CLICK,this.§1t5251s0§);
         this.§1t5163s0§.§1t5019s0§.removeEventListener(MouseEvent.CLICK,this.§1t5252s0§);
         if(!§1t1523s0§.§1t9528s0§)
         {
            this.§1t5163s0§.§1t13358s0§.addEventListener(Event.SCROLL,this.§1t5241s0§);
         }
      }
      
      public function §1t5198s0§() : *
      {
         var _loc1_:int = §1t1523s0§.§1t9586s0§().§1t4441s0§();
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            this.§1t5189s0§[_loc2_].§1t5198s0§(_loc1_);
            _loc2_++;
         }
      }
      
      public function §1t5199s0§(param1:int, param2:int) : *
      {
      }
      
      public function §1t5200s0§(param1:int) : *
      {
      }
      
      public function §1t5201s0§(param1:int, param2:int) : *
      {
         this.§1t5171s0§.text = param1 + "/" + param2;
         this.§1t5172s0§.text = param1 + "/" + param2;
         this.§1t5170s0§.bar.scaleX = param1 / param2;
      }
      
      public function §1t5202s0§(param1:int, param2:int) : *
      {
         this.§1t5165s0§.text = param1 + "/" + param2;
         this.§1t5166s0§.text = param1 + "/" + param2;
         this.§1t5164s0§.bar.scaleX = param1 / param2;
      }
      
      public function §1t5205s0§(param1:int, param2:int) : *
      {
         var _loc3_:Number = (param1 - 48) / (param2 - 48);
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         this.§1t5182s0§.bar.scaleX = _loc3_;
         if(!§1t1540s0§.§1t9550s0§() && this.§1t5182s0§.visible)
         {
            if(_loc3_ == 0)
            {
               if(this.§1t5169s0§.htmlText != this.§1t5204s0§)
               {
                  this.§1t5169s0§.htmlText = this.§1t5204s0§;
               }
               this.§1t5169s0§.visible = true;
            }
            else if(_loc3_ > 0 && _loc3_ < 1 && this.§1t5169s0§.visible)
            {
               this.§1t5169s0§.visible = false;
            }
            else if(_loc3_ >= 1)
            {
               if(!this.§1t5169s0§.visible || this.§1t5169s0§.htmlText != this.§1t5203s0§)
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_criticalDamage");
               }
               if(this.§1t5169s0§.htmlText != this.§1t5203s0§)
               {
                  this.§1t5169s0§.htmlText = this.§1t5203s0§;
               }
               this.§1t5169s0§.visible = true;
            }
         }
      }
      
      public function §1t5206s0§(param1:int, param2:int) : Boolean
      {
         var _loc4_:int = 0;
         if(§1t1540s0§.§1t9979s0§)
         {
            §1t1540s0§.§1t10043s0§(false);
            this.§1t5178s0§.visible = false;
            return true;
         }
         if(this.§1t5183s0§.visible)
         {
            this.§1t5230s0§();
            this.§1t5193s0§.§1t5484s0§((param1 - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§,(param2 - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§);
            return true;
         }
         var _loc3_:§1t99s0§ = §1t1523s0§.§1t9586s0§();
         if(§1t1523s0§.§1t9528s0§ && this.§1t5158s0§.hitTestPoint(param1,param2) || Boolean(this.§1t5158s0§.highlight.visible) && Boolean(this.§1t5158s0§.hitTestPoint(param1,param2)))
         {
            this.§1t5207s0§();
            §1t1541s0§.§1t10111s0§();
            if(§1t6495s0§.instance.§1t1028s0§() == 5)
            {
               §1t6495s0§.instance.§1t1023s0§(0);
            }
            return true;
         }
         if(this.§1t5162s0§.visible && this.§1t5162s0§.hitTestPoint(param1,param2))
         {
            if(§1t3317s0§.instance.§1t1833s0§)
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return true;
            }
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
            {
               if(!this.§1t5163s0§.visible)
               {
                  §1t406s0§.instance.§1t6593s0§();
                  this.§1t5163s0§.§1t13123s0§.text = §1t1521s0§.getString(184);
                  §1t1540s0§.§1t10025s0§().focus = this.§1t5163s0§.§1t13123s0§;
                  this.§1t5163s0§.§1t13123s0§.setSelection(0,this.§1t5163s0§.§1t13123s0§.text.length);
                  this.§1t5195s0§ = §1t1523s0§.§1t5195s0§ - 1;
                  this.§1t5243s0§(null);
               }
               else
               {
                  §1t406s0§.instance.§1t6592s0§();
               }
               §1t1523s0§.§1t9671s0§(!this.§1t5163s0§.visible);
            }
            this.§1t5163s0§.visible = !this.§1t5163s0§.visible;
            if(this.§1t5163s0§.visible)
            {
               §1t1540s0§.§1t10025s0§().focus = this.§1t5163s0§.§1t13123s0§;
               this.§1t5163s0§.§1t13358s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
               this.§1t5240s0§();
            }
            else
            {
               §1t1540s0§.§1t10025s0§().focus = §1t1540s0§.§1t10025s0§();
            }
            return true;
         }
         if(this.§1t5163s0§.visible && Boolean(this.§1t5163s0§.§1t7636s0§.hitTestPoint(param1,param2)))
         {
            this.§1t5236s0§();
            return true;
         }
         if(this.§1t5163s0§.visible && this.§1t5163s0§.hitTestPoint(param1,param2))
         {
            return true;
         }
         if(this.§1t5179s0§.visible && this.§1t5179s0§.hitTestPoint(param1,param2))
         {
            §1t1540s0§.§1t10042s0§();
            this.§1t5178s0§.visible = true;
            setChildIndex(this.§1t5178s0§,numChildren - 1);
            return true;
         }
         if(this.§1t5155s0§.hitTestPoint(param1,param2))
         {
            if(§1t6495s0§.instance.§1t1028s0§() == 6)
            {
               §1t6495s0§.instance.§1t1023s0§(0);
            }
            return true;
         }
         if(param2 > 420 * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§)
         {
            _loc4_ = 0;
            while(_loc4_ < 8)
            {
               if(Boolean(this.§1t5189s0§[_loc4_].visible) && Boolean(this.§1t5189s0§[_loc4_].hitTestPoint(param1,param2)))
               {
                  this.§1t5230s0§();
                  this.§1t5189s0§[_loc4_].§1t5484s0§();
                  return true;
               }
               _loc4_++;
            }
         }
         return false;
      }
      
      internal function §1t5207s0§() : *
      {
         if(§1t1523s0§.§1t9586s0§().§1t4470s0§())
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            §1t1523s0§.§1t9586s0§().§1t4472s0§();
            §1t1523s0§.stance = §1t1523s0§.§1t9586s0§().§1t4473s0§();
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      public function §1t5208s0§(param1:int) : *
      {
         this.§1t5158s0§.§1t15895s0§.gotoAndStop(param1);
      }
      
      public function §1t5209s0§() : *
      {
         this.§1t5188s0§ = true;
      }
      
      public function §1t5210s0§(param1:int) : *
      {
         if(§1t1525s0§.§1t9952s0§())
         {
            return;
         }
         this.§1t5168s0§.visible = true;
         this.§1t5168s0§.§1t5168s0§.text = param1.toString();
         this.§1t5168s0§.comboshadow.text = param1.toString();
      }
      
      public function §1t5211s0§() : *
      {
         this.§1t5168s0§.visible = false;
      }
      
      public function §1t5212s0§(param1:Boolean) : *
      {
         this.timer.visible = param1;
      }
      
      public function §1t5213s0§(param1:int) : *
      {
         if(param1 < 0)
         {
            param1 = 0;
            if(§1t1525s0§.§1t775s0§() == §1t1540s0§.§1t10009s0§)
            {
               this.timer.§1t5284s0§.text = §1t1521s0§.getString(868);
               return;
            }
         }
         if(§1t1525s0§.§1t775s0§() == §1t1540s0§.§1t9999s0§ || §1t1525s0§.§1t775s0§() == §1t1540s0§.§1t10009s0§)
         {
            this.timer.§1t5284s0§.text = §1t1521s0§.getString(713) + param1.toString();
         }
         else
         {
            this.timer.§1t5284s0§.text = §1t1521s0§.getString(126) + param1.toString();
         }
      }
      
      public function §1t5214s0§() : *
      {
         this.§1t5173s0§.visible = true;
         this.§1t5173s0§.gotoAndPlay(1);
      }
      
      internal function §1t5215s0§(param1:MouseEvent) : *
      {
         this.§1t5161s0§.visible = true;
         this.§1t5158s0§.highlight.visible = true;
      }
      
      internal function §1t5216s0§(param1:MouseEvent) : *
      {
         this.§1t5161s0§.visible = false;
         this.§1t5158s0§.highlight.visible = false;
      }
      
      public function §1t5217s0§() : *
      {
         this.§1t5185s0§.show();
      }
      
      public function §1t5218s0§() : *
      {
         this.§1t5185s0§.§1t6384s0§();
      }
      
      public function §1t5219s0§() : *
      {
         if(this.§1t5194s0§)
         {
            this.§1t5185s0§.show();
            this.§1t5185s0§.winwords.gotoAndStop(2);
            this.§1t5185s0§.§1t6384s0§();
         }
         else
         {
            this.§1t5176s0§.show();
         }
      }
      
      public function §1t5220s0§() : *
      {
         this.§1t5180s0§.show();
         this.§1t5167s0§.visible = false;
         this.§1t5167s0§.removeEventListener(MouseEvent.CLICK,this.§1t5255s0§);
      }
      
      public function §1t5221s0§() : *
      {
         if(!§1t251s0§.instance.§1t3477s0§())
         {
            return;
         }
         this.§1t5194s0§ = true;
         this.§1t5185s0§.winwords.gotoAndStop(2);
      }
      
      public function §1t5222s0§() : Boolean
      {
         return this.§1t5194s0§;
      }
      
      public function §1t5223s0§() : *
      {
         this.§1t5185s0§.visible = false;
      }
      
      public function §1t5224s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < numChildren)
         {
            getChildAt(_loc1_).visible = false;
            _loc1_++;
         }
         if(this.§1t5192s0§)
         {
            this.§1t5183s0§.visible = false;
            this.§1t5183s0§.cacheAsBitmap = false;
            this.§1t5192s0§ = false;
         }
      }
      
      public function §1t5225s0§() : *
      {
         var _loc3_:§1t5184s0§ = null;
         var _loc1_:* = §1t1523s0§.§1t6928s0§.length;
         this.§1t1774s0§ = §1t1523s0§.§1t9602s0§();
         var _loc2_:int = §1t1523s0§.§1t9586s0§().§1t4441s0§();
         var _loc4_:int = 0;
         while(_loc4_ < 8)
         {
            _loc3_ = this.§1t5189s0§[_loc4_];
            _loc3_.visible = _loc4_ < this.§1t1774s0§;
            if(_loc4_ < _loc1_ && §1t1523s0§.§1t6928s0§[_loc4_] != null)
            {
               _loc3_.§1t6975s0§(this.§1t1774s0§ - _loc4_);
               _loc3_.§1t6966s0§(§1t1523s0§.§1t6928s0§[_loc4_]);
               _loc3_.§1t5198s0§(_loc2_);
            }
            else
            {
               _loc3_.§1t6967s0§();
            }
            _loc4_++;
         }
      }
      
      public function update() : *
      {
         var _loc2_:§1t99s0§ = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.§1t5189s0§[_loc1_].update();
            _loc1_++;
         }
         if(this.§1t5192s0§)
         {
            _loc2_ = §1t1523s0§.§1t9586s0§();
            if(!(_loc2_.§1t4469s0§() || _loc2_.§1t4456s0§()))
            {
               this.§1t5192s0§ = false;
               this.§1t5183s0§.visible = false;
               this.§1t5183s0§.cacheAsBitmap = false;
            }
            else
            {
               _loc3_ = (§1t1540s0§.§1t10025s0§().mouseX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
               _loc4_ = (§1t1540s0§.§1t10025s0§().mouseY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
               this.§1t5183s0§.x = _loc3_;
               this.§1t5183s0§.y = _loc4_;
               if(!this.§1t5183s0§.visible && ((this.§1t5190s0§ - _loc3_) * (this.§1t5190s0§ - _loc3_) > 100 || (this.§1t5191s0§ - _loc4_) * (this.§1t5191s0§ - _loc4_) > 100))
               {
                  this.§1t5183s0§.visible = true;
                  this.§1t5183s0§.cacheAsBitmap = true;
               }
               this.§1t5183s0§.shade.gotoAndStop(1);
            }
         }
      }
      
      public function §1t5226s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.§1t5189s0§[_loc1_].cooldown = 1;
            _loc1_++;
         }
      }
      
      public function §1t5227s0§(param1:int) : *
      {
         if(param1 > this.§1t1774s0§ || this.§1t5192s0§)
         {
            return;
         }
         var _loc2_:§1t5184s0§ = this.§1t5189s0§[this.§1t1774s0§ - param1];
         if(_loc2_.§1t6978s0§() && !§1t1523s0§.§1t9586s0§().§1t4456s0§())
         {
            this.§1t5183s0§.§1t6966s0§(new §1t57s0§(_loc2_.§1t6963s0§(),_loc2_.§1t4491s0§()));
            this.§1t5192s0§ = true;
            this.§1t5190s0§ = (§1t1540s0§.§1t10025s0§().mouseX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
            this.§1t5191s0§ = (§1t1540s0§.§1t10025s0§().mouseY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
            this.§1t5193s0§ = _loc2_;
            if(_loc2_.§1t6963s0§() == §1t120s0§.§1t10153s0§ || _loc2_.§1t6963s0§() == §1t120s0§.§1t10146s0§ || _loc2_.§1t6963s0§() == §1t120s0§.§1t10147s0§ || _loc2_.§1t6963s0§() == §1t120s0§.§1t10148s0§)
            {
               §1t120s0§.§1t9190s0§().§1t1542s0§(_loc2_.§1t6963s0§(),_loc2_.§1t4491s0§(),§1t1523s0§.§1t9586s0§(),null,null,0,0);
            }
         }
      }
      
      public function §1t5228s0§(param1:int) : *
      {
         if(param1 > this.§1t1774s0§)
         {
            return;
         }
         this.§1t5230s0§();
         if(this.§1t5193s0§ != null)
         {
            this.§1t5193s0§.§1t5484s0§();
         }
         this.§1t5193s0§ = null;
         this.§1t5192s0§ = false;
      }
      
      internal function §1t5229s0§(param1:MouseEvent) : *
      {
         var _loc2_:§1t5184s0§ = null;
         var _loc3_:int = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc4_:int = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         _loc2_ = param1.target.parent;
         if(_loc4_ < 435)
         {
            return;
         }
         if(_loc2_.§1t6978s0§() && !§1t1523s0§.§1t9586s0§().§1t4456s0§())
         {
            this.§1t5183s0§.§1t6966s0§(new §1t57s0§(_loc2_.§1t6963s0§(),_loc2_.§1t4491s0§()));
            this.§1t5192s0§ = true;
            this.§1t5190s0§ = _loc3_;
            this.§1t5191s0§ = _loc4_;
            this.§1t5193s0§ = _loc2_;
            if(_loc2_.§1t6963s0§() == §1t120s0§.§1t10153s0§ || _loc2_.§1t6963s0§() == §1t120s0§.§1t10146s0§ || _loc2_.§1t6963s0§() == §1t120s0§.§1t10147s0§ || _loc2_.§1t6963s0§() == §1t120s0§.§1t10148s0§)
            {
               §1t120s0§.§1t9190s0§().§1t1542s0§(_loc2_.§1t6963s0§(),_loc2_.§1t4491s0§(),§1t1523s0§.§1t9586s0§(),null,null,0,0);
            }
         }
      }
      
      internal function §1t5230s0§() : *
      {
         var _loc1_:§1t99s0§ = null;
         if(this.§1t5183s0§.visible && this.§1t5183s0§.§1t6963s0§() != §1t120s0§.§1t10156s0§ && this.§1t5183s0§.§1t6963s0§() != §1t120s0§.§1t10157s0§)
         {
            _loc1_ = §1t1523s0§.§1t9586s0§();
            if(this.§1t5183s0§.x < _loc1_.mcs.x)
            {
               _loc1_.mcs.§1t5492s0§();
            }
            else
            {
               _loc1_.mcs.§1t5493s0§();
            }
         }
         this.§1t5183s0§.visible = false;
         this.§1t5183s0§.cacheAsBitmap = false;
         this.§1t5192s0§ = false;
      }
      
      public function §1t5231s0§() : Boolean
      {
         return this.§1t5192s0§;
      }
      
      public function §1t5232s0§() : *
      {
         if(this.§1t5231s0§() && (this.§1t5183s0§.§1t6963s0§() == §1t120s0§.§1t10153s0§ || this.§1t5183s0§.§1t6963s0§() == §1t120s0§.§1t10146s0§ || this.§1t5183s0§.§1t6963s0§() == §1t120s0§.§1t10147s0§ || this.§1t5183s0§.§1t6963s0§() == §1t120s0§.§1t10148s0§))
         {
            this.§1t5183s0§.visible = false;
            this.§1t5183s0§.cacheAsBitmap = false;
            this.§1t5192s0§ = false;
            this.§1t5193s0§.§1t6977s0§();
         }
      }
      
      internal function §1t5233s0§(param1:KeyboardEvent) : *
      {
         if(this.§1t5163s0§.§1t13123s0§.text == "" || this.§1t5163s0§.§1t13123s0§.text == "\r")
         {
            return;
         }
         if(param1.keyCode == 13)
         {
            this.§1t5236s0§();
         }
      }
      
      internal function §1t5236s0§() : *
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc1_:Array = this.§1t5163s0§.§1t13123s0§.text.split(" ");
         switch(_loc1_[0])
         {
            case "/disablepvp":
               if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
               {
                  §1t251s0§.instance.§1t3558s0§();
               }
               break;
            case "/fart":
               §1t88s0§.instance.§1t1512s0§();
               if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
               {
                  §1t251s0§.instance.§1t3533s0§("fart");
               }
               else
               {
                  §1t251s0§.instance.§1t1557s0§("fart");
               }
               break;
            case "/sadtrombone":
               §1t88s0§.instance.§1t1516s0§("Snd_sadTrombone");
               if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
               {
                  §1t251s0§.instance.§1t3533s0§("sadtrombone");
               }
               else
               {
                  §1t251s0§.instance.§1t1557s0§("sadtrombone");
               }
               break;
            case "/rimshot":
               §1t88s0§.instance.§1t1516s0§("Snd_rimshot");
               if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
               {
                  §1t251s0§.instance.§1t3533s0§("rimshot");
               }
               else
               {
                  §1t251s0§.instance.§1t1557s0§("rimshot");
               }
               break;
            case "/ping":
               if(!§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
               {
                  §1t251s0§.instance.§1t3497s0§(false);
               }
               break;
            case "/seppuku":
               if(§1t1523s0§.§1t9586s0§().§1t4469s0§())
               {
                  §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10357s0§);
                  if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                  {
                     §1t251s0§.instance.§1t3533s0§(§1t1544s0§.§1t10357s0§);
                  }
                  else
                  {
                     §1t251s0§.instance.§1t1557s0§(§1t1544s0§.§1t10357s0§);
                  }
               }
               break;
            case "/hidehud":
               this.§1t5224s0§();
               if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
               {
                  §1t406s0§.instance.§1t6575s0§(false);
                  §1t406s0§.instance.§1t6440s0§.visible = false;
               }
               §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t6287s0§("");
               if(§1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12138s0§)
               {
                  §1t1523s0§.§1t9586s0§().§1t1559s0§().visible = false;
               }
               break;
            case "/ally":
               if(_loc1_.length == 2)
               {
                  §1t1543s0§.§1t10243s0§(_loc1_[1]);
                  if(§1t1540s0§.§1t10047s0§())
                  {
                     this.§1t5239s0§(§1t1543s0§.§1t10247s0§());
                  }
               }
               break;
            case "/allyroom":
               §1t1543s0§.§1t10244s0§();
               if(§1t1540s0§.§1t10047s0§())
               {
                  this.§1t5239s0§(§1t1543s0§.§1t10247s0§());
               }
               break;
            case "/stopally":
               if(_loc1_.length == 2)
               {
                  §1t1543s0§.§1t10245s0§(_loc1_[1]);
                  if(§1t1540s0§.§1t10047s0§())
                  {
                     this.§1t5239s0§(§1t1543s0§.§1t10247s0§());
                  }
               }
               break;
            case "/stopallyall":
               §1t1543s0§.§1t10246s0§();
               if(§1t1540s0§.§1t10047s0§())
               {
                  this.§1t5239s0§(§1t1543s0§.§1t10247s0§());
               }
               break;
            case "/showally":
               if(§1t1540s0§.§1t10047s0§())
               {
                  this.§1t5239s0§(§1t1543s0§.§1t10247s0§());
               }
               break;
            case "/help":
               if(§1t1540s0§.§1t10047s0§())
               {
                  this.§1t5239s0§("\nAvailable PvP commands:","#FFCC00");
               }
               else
               {
                  this.§1t5239s0§("\nAvailable Duel commands:","#FFCC00");
               }
               this.§1t5239s0§("/emotes <font color=\'#CCCCCC\'>- lists the available emotes</font>");
               this.§1t5239s0§("/ping <font color=\'#CCCCCC\'>- displays latency</font>");
               if(§1t1540s0§.§1t10047s0§())
               {
                  this.§1t5239s0§("/showally <font color=\'#CCCCCC\'>- lists your allies</font>");
                  this.§1t5239s0§("/ally [player name] <font color=\'#CCCCCC\'>- marks player as an ally</font>");
                  this.§1t5239s0§("/allyroom <font color=\'#CCCCCC\'>- marks all players in the room as an ally</font>");
                  this.§1t5239s0§("/stopally [player name] <font color=\'#CCCCCC\'>- stop allying with player</font>");
                  this.§1t5239s0§("/stopallyall <font color=\'#CCCCCC\'>- stop allying with all players</font>");
               }
               break;
            case "/emotes":
               this.§1t5239s0§("\nAvailable emotes:","#FFCC00");
               this.§1t5239s0§("/fart, /sadtrombone, /rimshot, /seppuku","#CCCCCC");
               break;
            default:
               _loc2_ = §1t406s0§.instance.§1t5322s0§(this.§1t5163s0§.§1t13123s0§.text);
               if(_loc2_ != "")
               {
                  if(_loc2_ == this.§1t5234s0§)
                  {
                     ++this.§1t5235s0§;
                  }
                  else
                  {
                     this.§1t5235s0§ = 0;
                  }
                  this.§1t5234s0§ = _loc2_;
                  if(!§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9460s0§) && !§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9461s0§) && !§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9462s0§))
                  {
                     if(this.§1t5235s0§ >= 5)
                     {
                        §1t1523s0§.§1t9726s0§(§1t1523s0§.§1t9461s0§,5 * 60);
                     }
                  }
                  if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                  {
                     if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9460s0§))
                     {
                        this.§1t5195s0§ = 1;
                     }
                     _loc3_ = "#FFFFFF";
                     if(this.§1t5195s0§ == 2)
                     {
                        _loc4_ = §1t1523s0§.§1t7746s0§();
                        if(_loc4_ == 1)
                        {
                           _loc3_ = "#FF0000";
                        }
                        else if(_loc4_ == 2)
                        {
                           _loc3_ = "#00FF00";
                        }
                        else if(_loc4_ == 3)
                        {
                           _loc3_ = "#00FFFF";
                        }
                        else if(_loc4_ == 4)
                        {
                           _loc3_ = "#FFCC00";
                        }
                        else if(§1t1523s0§.§1t9663s0§(_loc4_))
                        {
                           _loc3_ = "#FF9900";
                        }
                     }
                     else if(this.§1t5195s0§ == 1)
                     {
                        _loc3_ = "#CCCCCC";
                     }
                     if(!§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9461s0§))
                     {
                        if(this.§1t5195s0§ == 1)
                        {
                           §1t251s0§.§1t9190s0§().§1t3492s0§(_loc2_);
                        }
                        else
                        {
                           §1t251s0§.§1t9190s0§().§1t3523s0§(_loc2_,this.§1t5195s0§);
                        }
                        §1t406s0§.instance.§1t5238s0§(§1t1523s0§.charname,_loc2_,_loc3_);
                        this.§1t5238s0§(§1t1523s0§.charname,_loc2_,_loc3_);
                     }
                  }
                  else
                  {
                     §1t251s0§.§1t9190s0§().§1t3492s0§(_loc2_);
                     this.§1t5238s0§(§1t1523s0§.charname,_loc2_,"#FFCC00");
                  }
                  §1t3317s0§.instance.§1t1933s0§(_loc2_);
               }
         }
         this.§1t5163s0§.§1t13123s0§.text = "";
      }
      
      public function §1t5238s0§(param1:String, param2:String, param3:String = "") : *
      {
         var _loc6_:Array = null;
         if(param1 + param2 == this.§1t5237s0§ || param2 == "")
         {
            return;
         }
         this.§1t5237s0§ = param1 + param2;
         if(param1 == "")
         {
            this.§1t5239s0§(param2,param3);
            return;
         }
         var _loc4_:String = param1.substr(0,1);
         var _loc5_:String = param1.substr(1,param1.length);
         param1 = _loc4_.toUpperCase() + _loc5_;
         if(param3 != "")
         {
            this.§1t5163s0§.§1t13358s0§.htmlText += "<b><font color=\'" + param3 + "\'>" + param1 + ":   " + param2 + "</font></b>";
         }
         else
         {
            this.§1t5163s0§.§1t13358s0§.htmlText += "<b>" + param1 + ":   " + param2 + "</b>";
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 50)
         {
            _loc6_ = this.§1t5163s0§.§1t13358s0§.htmlText.split("</P>");
            _loc6_.splice(0,1);
            this.§1t5163s0§.§1t13358s0§.htmlText = _loc6_.join("</P>") + "</P>";
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 10)
         {
            if(this.§1t5163s0§.§1t13358s0§.scrollV >= this.§1t5163s0§.§1t13358s0§.maxScrollV - 3)
            {
               this.§1t5163s0§.§1t13358s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
            }
            else if(§1t1523s0§.§1t9472s0§ && §1t1540s0§.§1t9550s0§() && !§1t1541s0§.§1t10100s0§())
            {
               §1t88s0§.instance.§1t1506s0§();
            }
         }
         this.§1t5240s0§();
      }
      
      public function §1t5239s0§(param1:String, param2:String = "") : *
      {
         var _loc3_:Array = null;
         if(param2 != "")
         {
            this.§1t5163s0§.§1t13358s0§.htmlText += "<b><font color=\'" + param2 + "\'>" + param1 + "</font></b>";
         }
         else
         {
            this.§1t5163s0§.§1t13358s0§.htmlText += "<b>" + param1 + "</b>";
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 50)
         {
            _loc3_ = this.§1t5163s0§.§1t13358s0§.htmlText.split("</P>");
            _loc3_.splice(0,1);
            this.§1t5163s0§.§1t13358s0§.htmlText = _loc3_.join("</P>") + "</P>";
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 10)
         {
            if(this.§1t5163s0§.§1t13358s0§.scrollV >= this.§1t5163s0§.§1t13358s0§.maxScrollV - 3)
            {
               this.§1t5163s0§.§1t13358s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
            }
            else if(§1t1523s0§.§1t9472s0§ && §1t1540s0§.§1t9550s0§() && !§1t1541s0§.§1t10100s0§())
            {
               §1t88s0§.instance.§1t1506s0§();
            }
         }
         this.§1t5240s0§();
      }
      
      internal function §1t5240s0§() : *
      {
         this.§1t5163s0§.§1t5019s0§.visible = false;
         this.§1t5163s0§.§1t5020s0§.visible = false;
         if(this.§1t5163s0§.§1t13358s0§.numLines <= 10)
         {
            return;
         }
         if(this.§1t5163s0§.§1t13358s0§.scrollV < this.§1t5163s0§.§1t13358s0§.maxScrollV)
         {
            this.§1t5163s0§.§1t5019s0§.visible = true;
         }
         if(this.§1t5163s0§.§1t13358s0§.scrollV > 1)
         {
            this.§1t5163s0§.§1t5020s0§.visible = true;
         }
      }
      
      internal function §1t5241s0§(param1:Event) : *
      {
         this.§1t5240s0§();
      }
      
      public function §1t5242s0§() : *
      {
         if(!this.§1t5163s0§.visible)
         {
            §1t406s0§.instance.§1t6593s0§();
            this.§1t5163s0§.§1t13123s0§.text = §1t1521s0§.getString(184);
            §1t1540s0§.§1t10025s0§().focus = this.§1t5163s0§.§1t13123s0§;
            this.§1t5163s0§.§1t13123s0§.setSelection(0,this.§1t5163s0§.§1t13123s0§.text.length);
            this.§1t5195s0§ = §1t1523s0§.§1t5195s0§ - 1;
            this.§1t5243s0§(null);
         }
         this.§1t5163s0§.visible = true;
         if(this.§1t5163s0§.visible)
         {
            §1t1540s0§.§1t10025s0§().focus = this.§1t5163s0§.§1t13123s0§;
         }
      }
      
      internal function §1t5243s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         ++this.§1t5195s0§;
         if(this.§1t5195s0§ == 3 || this.§1t5195s0§ == 2 && §1t1523s0§.§1t7746s0§() == 0)
         {
            this.§1t5195s0§ = 0;
         }
         if(this.§1t5195s0§ == 0)
         {
            this.§1t5163s0§.§1t15893s0§.§1t5769s0§(§1t1521s0§.getString(419));
         }
         else if(this.§1t5195s0§ == 1)
         {
            this.§1t5163s0§.§1t15893s0§.§1t5769s0§(§1t1521s0§.getString(420));
         }
         else if(this.§1t5195s0§ == 2)
         {
            this.§1t5163s0§.§1t15893s0§.§1t5769s0§(§1t1521s0§.getString(421));
         }
         §1t1523s0§.§1t5195s0§ = this.§1t5195s0§;
      }
      
      internal function §1t5244s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         if(this.§1t5163s0§.§1t13123s0§.text == §1t1521s0§.getString(184))
         {
            this.§1t5163s0§.§1t13123s0§.text = "";
         }
      }
      
      internal function §1t5245s0§(param1:Event) : *
      {
         if(§1t1525s0§.§1t9952s0§() || §1t1540s0§.§1t10047s0§())
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         §1t1523s0§.§1t9537s0§();
         this.§1t5246s0§();
         §1t6495s0§.instance.§1t1023s0§(0);
      }
      
      internal function §1t5246s0§() : *
      {
         var _loc1_:§1t99s0§ = §1t1523s0§.§1t9586s0§();
         if(!§1t1523s0§.§1t4431s0§)
         {
            this.§1t5155s0§.gotoAndStop(1);
            this.§1t5156s0§.visible = true;
            this.§1t5157s0§.visible = false;
            _loc1_.§1t4497s0§(false);
            §1t1541s0§.§1t10097s0§();
         }
         else
         {
            this.§1t5155s0§.gotoAndStop(2);
            this.§1t5156s0§.visible = false;
            this.§1t5157s0§.visible = true;
            _loc1_.§1t4497s0§(true);
            §1t1541s0§.§1t10098s0§();
         }
      }
      
      public function §1t5247s0§(param1:int) : *
      {
         if(param1 != 0)
         {
            this.§1t5238s0§("latency",param1.toString() + " ms");
         }
         this.latency = param1;
         if(§1t1525s0§.timeCounter >= 3 && §1t1525s0§.§1t9947s0§())
         {
            §1t1525s0§.§1t9946s0§(§1t1525s0§.§1t9903s0§);
         }
      }
      
      public function §1t5248s0§() : Boolean
      {
         return this.latency != -1;
      }
      
      public function §1t5249s0§() : int
      {
         return this.latency;
      }
      
      public function §1t5250s0§() : *
      {
         scaleX = §1t1523s0§.§1t9358s0§;
         scaleY = §1t1523s0§.§1t9358s0§;
         x = §1t1523s0§.§1t9359s0§;
         y = §1t1523s0§.§1t9360s0§;
         §1t1540s0§.§1t10022s0§();
      }
      
      internal function §1t5251s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         --this.§1t5163s0§.§1t13358s0§.scrollV;
      }
      
      internal function §1t5252s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         ++this.§1t5163s0§.§1t13358s0§.scrollV;
      }
      
      public function §1t5253s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc1_:int = -1;
         var _loc2_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9433s0§);
         if(_loc2_ != 0)
         {
            _loc1_ = §1t1523s0§.§1t9463s0§;
         }
         else
         {
            _loc3_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9432s0§);
            if(_loc3_ != 0)
            {
               _loc1_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9431s0§);
            }
         }
         if(_loc1_ != -1)
         {
            _loc4_ = "";
            if(_loc1_ == §1t1523s0§.§1t9452s0§)
            {
               _loc4_ = §1t1521s0§.getString(11119);
            }
            else if(_loc1_ == §1t1523s0§.§1t9453s0§)
            {
               _loc4_ = §1t1521s0§.getString(11120);
            }
            else if(_loc1_ == §1t1523s0§.§1t9454s0§)
            {
               _loc4_ = §1t1521s0§.getString(11121);
            }
            else if(_loc1_ == §1t1523s0§.§1t9455s0§)
            {
               _loc4_ = §1t1521s0§.getString(11122);
            }
            else if(_loc1_ == §1t1523s0§.§1t9456s0§)
            {
               _loc4_ = §1t1521s0§.getString(11123);
            }
            else if(_loc1_ == §1t1523s0§.§1t9457s0§)
            {
               _loc4_ = §1t1521s0§.getString(11124);
            }
            else if(_loc1_ == §1t1523s0§.§1t9458s0§)
            {
               _loc4_ = §1t1521s0§.getString(11125);
            }
            else if(_loc1_ == §1t1523s0§.§1t9459s0§)
            {
               _loc4_ = §1t1521s0§.getString(11126);
            }
            else if(_loc1_ == §1t1523s0§.§1t9463s0§)
            {
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9414s0§) <= 1)
               {
                  _loc4_ = "<font color=\'#FF0000\'>" + §1t1521s0§.getString(11130) + "</font>";
               }
               else
               {
                  _loc4_ = "<font color=\'#FF0000\'>" + §1t1521s0§.getString(11131) + "</font>";
               }
            }
            this.§1t5159s0§.visible = true;
            this.§1t5159s0§.htmlText = _loc4_;
         }
         else
         {
            this.§1t5159s0§.visible = false;
         }
      }
      
      public function §1t5254s0§() : *
      {
         this.§1t5224s0§();
         this.logo.visible = true;
         this.logo.cacheAsBitmap = true;
         if(!§1t1540s0§.§1t10062s0§())
         {
            this.§1t5167s0§.visible = true;
            this.§1t5167s0§.addEventListener(MouseEvent.CLICK,this.§1t5255s0§);
         }
      }
      
      internal function §1t5255s0§(param1:Event) : *
      {
         §1t251s0§.instance.§1t3515s0§ = false;
         §1t1540s0§.§1t9895s0§();
         this.§1t5167s0§.removeEventListener(MouseEvent.CLICK,this.§1t5255s0§);
      }
   }
}

