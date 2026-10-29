package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2085")]
   public class §1t7289s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var §1t472s0§:TextField;
      
      public var §1t7290s0§:TextField;
      
      public var §1t7291s0§:TextField;
      
      public var §1t5071s0§:MovieClip;
      
      public var §1t5072s0§:TextField;
      
      public var §1t5073s0§:MovieClip;
      
      public var §1t5074s0§:TextField;
      
      public var §1t5075s0§:MovieClip;
      
      public var §1t5076s0§:TextField;
      
      public var §1t5077s0§:MovieClip;
      
      public var §1t5078s0§:TextField;
      
      public var §1t7292s0§:TextField;
      
      public var §1t7293s0§:§1t394s0§;
      
      public var §1t7294s0§:§1t394s0§;
      
      public var §1t7295s0§:§1t394s0§;
      
      public var §1t7296s0§:§1t394s0§;
      
      public var §1t7297s0§:§1t394s0§;
      
      public var slot0:§1t7274s0§;
      
      public var slot1:§1t7274s0§;
      
      public var slot2:§1t7274s0§;
      
      public var slot3:§1t7274s0§;
      
      internal var §1t916s0§:§1t24s0§;
      
      internal var §1t7215s0§:§1t30s0§;
      
      internal var §1t5112s0§:Array;
      
      internal var §1t5113s0§:Array;
      
      internal var §1t7256s0§:Array;
      
      internal var §1t7258s0§:Array;
      
      internal var msg:String = "";
      
      public function §1t7289s0§()
      {
         super();
         this.§1t5112s0§ = new Array();
         this.§1t5112s0§.push(this.§1t5071s0§);
         this.§1t5112s0§.push(this.§1t5073s0§);
         this.§1t5112s0§.push(this.§1t5075s0§);
         this.§1t5112s0§.push(this.§1t5077s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5112s0§.length)
         {
            this.§1t5112s0§[_loc1_].stop();
            _loc1_++;
         }
         this.§1t5113s0§ = new Array();
         this.§1t5113s0§.push(this.§1t5072s0§);
         this.§1t5113s0§.push(this.§1t5074s0§);
         this.§1t5113s0§.push(this.§1t5076s0§);
         this.§1t5113s0§.push(this.§1t5078s0§);
         this.§1t7256s0§ = new Array();
         this.§1t7256s0§.push(this.slot0);
         this.§1t7256s0§.push(this.slot1);
         this.§1t7256s0§.push(this.slot2);
         this.§1t7256s0§.push(this.slot3);
         _loc1_ = 0;
         while(_loc1_ < this.§1t7256s0§.length)
         {
            this.§1t7256s0§[_loc1_].gotoAndStop(2);
            _loc1_++;
         }
         this.§1t7258s0§ = new Array();
         this.§1t7258s0§.push(this.§1t7293s0§);
         this.§1t7258s0§.push(this.§1t7294s0§);
         this.§1t7258s0§.push(this.§1t7295s0§);
         this.§1t7258s0§.push(this.§1t7296s0§);
         this.§1t7258s0§.push(this.§1t7297s0§);
         _loc1_ = 0;
         while(_loc1_ < this.§1t7258s0§.length)
         {
            this.§1t7258s0§[_loc1_].stop();
            _loc1_++;
         }
      }
      
      public function init(param1:§1t24s0§) : *
      {
         this.§1t916s0§ = param1;
         this.button.§1t5769s0§(§1t1521s0§.getString(5));
         this.§1t7290s0§.text = §1t1521s0§.getString(22070);
         this.§1t7292s0§.text = §1t1521s0§.getString(22063);
      }
      
      public function §1t7298s0§(param1:String) : *
      {
         this.msg = param1;
      }
      
      public function show(param1:§1t30s0§) : *
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:§1t29s0§ = null;
         var _loc9_:Boolean = false;
         var _loc10_:Vector.<§1t17s0§> = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:§1t394s0§ = null;
         var _loc14_:§1t17s0§ = null;
         var _loc15_:int = 0;
         this.§1t7215s0§ = param1;
         this.§1t5004s0§();
         this.§1t7263s0§(null);
         visible = true;
         var _loc2_:Boolean = false;
         var _loc3_:int = param1.§1t877s0§(§1t24s0§.§1t1847s0§());
         if(_loc3_ == §1t30s0§.§1t8812s0§)
         {
            _loc2_ = param1.§1t881s0§();
         }
         if(param1.§1t888s0§())
         {
            this.§1t7291s0§.htmlText = "<font color=\'#990000\'>" + §1t1521s0§.getString(22066) + "</font>";
         }
         else if(_loc2_)
         {
            this.§1t7291s0§.htmlText = "<font color=\'#FFCC00\'>" + §1t1521s0§.getString(22071) + "</font>";
         }
         else
         {
            this.§1t7291s0§.htmlText = "<font color=\'#990000\'>" + §1t1521s0§.getString(22072) + "</font>";
         }
         this.§1t7292s0§.visible = _loc2_;
         _loc4_ = 0;
         while(_loc4_ < 4)
         {
            this.§1t5112s0§[_loc4_].visible = false;
            this.§1t5113s0§[_loc4_].visible = false;
            this.§1t7256s0§[_loc4_].visible = false;
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < this.§1t7258s0§.length)
         {
            this.§1t7258s0§[_loc4_].visible = false;
            this.§1t7258s0§[_loc4_].clearItem();
            _loc4_++;
         }
         var _loc5_:int = §1t24s0§.§1t1847s0§();
         _loc6_ = int(param1.§1t553s0§.length);
         var _loc7_:Array = param1.§1t884s0§(_loc5_);
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc8_ = param1.§1t553s0§[_loc4_];
            this.§1t7256s0§[_loc4_].§1t7287s0§(_loc8_);
            this.§1t7256s0§[_loc4_].visible = true;
            this.§1t7256s0§[_loc4_].§1t3308s0§(_loc7_[_loc4_],_loc8_.§1t7318s0§());
            if(_loc7_[_loc4_] < _loc8_.§1t7318s0§() / 2)
            {
               _loc8_.§1t7332s0§();
            }
            if(_loc2_ && _loc7_[_loc4_] != 0)
            {
               _loc9_ = _loc8_.§1t7326s0§(param1.§1t889s0§());
               this.§1t7256s0§[_loc4_].§1t7288s0§(_loc8_,_loc9_,_loc7_[_loc4_] == 0);
            }
            else
            {
               this.§1t7256s0§[_loc4_].§1t7288s0§(_loc8_,false,_loc7_[_loc4_] == 0);
            }
            _loc4_++;
         }
         if(_loc6_ < 3)
         {
            this.§1t7256s0§[0].x = 330;
            this.§1t7256s0§[1].x = 330;
         }
         else
         {
            this.§1t7256s0§[0].x = 250;
            this.§1t7256s0§[1].x = 250;
         }
         if(_loc2_)
         {
            _loc10_ = param1.§1t869s0§.reward.§1t997s0§();
            _loc11_ = 0;
            _loc4_ = 0;
            while(_loc4_ < §1t24s0§.§1t8754s0§)
            {
               _loc12_ = param1.§1t869s0§.reward.§1t992s0§(_loc4_);
               if(_loc11_ < 4 && _loc12_ > 0)
               {
                  if(_loc4_ == §1t24s0§.§1t8753s0§)
                  {
                     _loc15_ = 0;
                     while(_loc15_ < _loc12_)
                     {
                        _loc10_.push(this.§1t916s0§.§1t624s0§(param1.§1t869s0§.§1t910s0§(param1.§1t873s0§)));
                        _loc15_++;
                     }
                  }
                  else
                  {
                     this.§1t5112s0§[_loc11_].gotoAndStop(_loc4_ + 1);
                     this.§1t5113s0§[_loc11_].text = _loc12_.toString();
                     this.§1t5112s0§[_loc11_].visible = true;
                     this.§1t5113s0§[_loc11_].visible = true;
                     _loc11_++;
                  }
               }
               _loc4_++;
            }
            _loc4_ = 0;
            while(_loc4_ < this.§1t7258s0§.length)
            {
               if(_loc11_ == 0)
               {
                  this.§1t7258s0§[_loc4_].y = 299;
                  this.§1t472s0§.y = 350;
               }
               else
               {
                  this.§1t7258s0§[_loc4_].y = 329;
                  this.§1t472s0§.y = 380;
               }
               _loc4_++;
            }
            _loc6_ = int(_loc10_.length);
            if(_loc6_ > this.§1t7258s0§.length)
            {
               _loc6_ = int(this.§1t7258s0§.length);
            }
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               _loc14_ = _loc10_[_loc4_];
               _loc13_ = this.§1t7258s0§[_loc4_];
               _loc13_.§1t6872s0§(_loc14_.§1t483s0§(),_loc14_.§1t508s0§(),_loc14_.§1t527s0§(),_loc14_.§1t528s0§());
               _loc13_.setItem(_loc14_);
               if(_loc14_.§1t484s0§() > 1)
               {
                  _loc13_.§1t6870s0§("x" + _loc14_.§1t484s0§().toString());
               }
               else
               {
                  _loc13_.§1t6870s0§("");
               }
               _loc13_.visible = true;
               _loc4_++;
            }
         }
         this.§1t7299s0§();
      }
      
      internal function §1t5004s0§() : *
      {
         this.button.addEventListener(MouseEvent.CLICK,this.§1t7300s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t7258s0§.length)
         {
            this.§1t7258s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t5843s0§);
            this.§1t7258s0§[_loc1_].addEventListener(MouseEvent.ROLL_OVER,this.§1t5843s0§);
            this.§1t7258s0§[_loc1_].addEventListener(MouseEvent.ROLL_OUT,this.§1t7263s0§);
            _loc1_++;
         }
      }
      
      internal function removeEventListeners() : *
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t7300s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t7258s0§.length)
         {
            this.§1t7258s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t5843s0§);
            this.§1t7258s0§[_loc1_].removeEventListener(MouseEvent.ROLL_OVER,this.§1t5843s0§);
            this.§1t7258s0§[_loc1_].removeEventListener(MouseEvent.ROLL_OUT,this.§1t7263s0§);
            _loc1_++;
         }
      }
      
      public function hide() : *
      {
         this.removeEventListeners();
         visible = false;
         this.§1t7215s0§ = null;
         §1t88s0§.instance.§1t1516s0§("Snd_click");
      }
      
      internal function §1t5843s0§(param1:MouseEvent) : void
      {
         this.§1t472s0§.visible = true;
         this.§1t472s0§.htmlText = param1.target.item.§1t510s0§();
         param1.target.§1t6786s0§(true);
      }
      
      internal function §1t7263s0§(param1:MouseEvent) : *
      {
         this.§1t472s0§.visible = false;
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t7258s0§.length)
         {
            this.§1t7258s0§[_loc2_].§1t6786s0§(false);
            _loc2_++;
         }
      }
      
      internal function §1t7299s0§() : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:§1t17s0§ = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc1_:int = this.§1t7215s0§.§1t877s0§(§1t24s0§.§1t1847s0§());
         if(_loc1_ == §1t30s0§.§1t8812s0§)
         {
            _loc2_ = this.§1t7215s0§.§1t881s0§();
            this.§1t7215s0§.§1t880s0§(this.§1t916s0§,§1t24s0§.§1t1847s0§(),_loc2_);
            if(_loc2_)
            {
               this.§1t7215s0§.§1t882s0§(this.§1t916s0§);
               §1t412s0§.instance.§1t7616s0§(null,400,300,this.§1t7215s0§.§1t869s0§.reward);
               §1t88s0§.instance.§1t1516s0§("Snd_upgradeSkill");
               if(this.§1t7215s0§.§1t869s0§.§1t909s0§())
               {
                  this.§1t916s0§.§1t609s0§(this.§1t7215s0§.§1t869s0§.id);
               }
            }
            this.§1t916s0§.§1t608s0§(this.§1t7215s0§);
            _loc4_ = false;
            _loc5_ = 0;
            while(_loc5_ < this.§1t7258s0§.length)
            {
               _loc3_ = this.§1t7258s0§[_loc5_].§1t2217s0§();
               if(_loc3_ != null)
               {
                  if(§1t24s0§.§1t8782s0§)
                  {
                     _loc4_ = !§1t1523s0§.§1t9631s0§(_loc3_);
                  }
                  else
                  {
                     §1t1523s0§.§1t7693s0§(_loc3_);
                  }
               }
               _loc5_++;
            }
            if(_loc4_)
            {
               §1t412s0§.instance.§1t7545s0§.§1t7298s0§(§1t1521s0§.getString(22098));
            }
         }
         else if(_loc1_ == §1t30s0§.§1t8813s0§)
         {
            this.§1t7215s0§.§1t880s0§(this.§1t916s0§,§1t24s0§.§1t1847s0§(),false);
            this.§1t916s0§.§1t608s0§(this.§1t7215s0§);
         }
         §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
         §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9964s0§);
         §1t114s0§.instance.§1t1539s0§();
         §1t3317s0§.instance.§1t1946s0§();
      }
      
      internal function §1t7300s0§(param1:MouseEvent) : *
      {
         this.hide();
         if(this.msg != "")
         {
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t6527s0§(this.msg,§1t1521s0§.getString(5));
         }
         this.msg = "";
      }
      
      public function destroy() : *
      {
         this.§1t916s0§ = null;
      }
   }
}

