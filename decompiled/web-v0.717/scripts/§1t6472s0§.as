package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1065")]
   public class §1t6472s0§ extends MovieClip
   {
      
      public var §1t6788s0§:§1t4998s0§;
      
      public var abandonbutton:§1t5000s0§;
      
      public var bg:§1t5016s0§;
      
      public var completebutton:§1t5000s0§;
      
      public var §1t5054s0§:TextField;
      
      public var §1t5055s0§:MovieClip;
      
      public var §1t5056s0§:TextField;
      
      public var §1t5057s0§:TextField;
      
      public var §1t6791s0§:TextField;
      
      public var locationlabel:TextField;
      
      public var §1t6793s0§:TextField;
      
      public var noquesttext:TextField;
      
      public var objectivelabel:TextField;
      
      public var objectivetext:TextField;
      
      public var §1t6797s0§:SimpleButton;
      
      public var §1t6798s0§:§1t4912s0§;
      
      public var questScrollUpButton:§1t4912s0§;
      
      public var §1t6800s0§:TextField;
      
      public var rewardtext:TextField;
      
      public var teleportbutton:§1t5059s0§;
      
      public var §1t5021s0§:TextField;
      
      public var §1t6803s0§:Vector.<§1t6782s0§>;
      
      private var §1t6804s0§:Vector.<§1t60s0§>;
      
      private var §1t6805s0§:int;
      
      private var §1t6806s0§:int;
      
      private var §1t6807s0§:int;
      
      internal var §1t6808s0§:Boolean = false;
      
      private var §1t6809s0§:int = -1;
      
      internal var §1t6810s0§:int;
      
      public function §1t6472s0§()
      {
         var _loc1_:§1t6782s0§ = null;
         var _loc2_:int = 0;
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(77);
         §1t1521s0§.§1t9290s0§(this.noquesttext);
         this.noquesttext.text = "";
         §1t1521s0§.§1t9290s0§(this.objectivelabel);
         §1t1521s0§.§1t9290s0§(this.objectivetext);
         this.objectivelabel.text = §1t1521s0§.getString(530);
         this.objectivetext.text = "";
         §1t1521s0§.§1t9290s0§(this.locationlabel);
         §1t1521s0§.§1t9290s0§(this.§1t6793s0§);
         this.locationlabel.text = §1t1521s0§.getString(531);
         this.§1t6793s0§.text = "";
         §1t1521s0§.§1t9290s0§(this.§1t6800s0§);
         §1t1521s0§.§1t9290s0§(this.rewardtext);
         this.§1t6800s0§.text = §1t1521s0§.getString(535);
         this.rewardtext.text = "";
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(64);
         §1t1521s0§.§1t9290s0§(this.§1t6791s0§,true);
         this.§1t6791s0§.text = §1t1521s0§.getString(11136);
         this.§1t6803s0§ = new Vector.<§1t6782s0§>();
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_ = new §1t6782s0§(_loc2_);
            _loc1_.x = 60;
            _loc1_.y = 73 + _loc2_ * 55;
            addChild(_loc1_);
            this.§1t6803s0§.push(_loc1_);
            _loc2_++;
         }
         this.§1t6803s0§.fixed = true;
         addChild(this.§1t6788s0§);
         this.§1t6788s0§.visible = false;
         this.abandonbutton.§1t5769s0§(§1t1521s0§.getString(40));
         this.teleportbutton.§1t5769s0§(§1t1521s0§.getString(534));
         this.completebutton.§1t5769s0§(§1t1521s0§.getString(710));
         this.§1t5055s0§.visible = false;
         this.§1t5054s0§.visible = false;
         this.teleportbutton.visible = false;
      }
      
      public function §1t5004s0§() : void
      {
         this.§1t6797s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.questScrollUpButton.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t6798s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.teleportbutton.addEventListener(MouseEvent.CLICK,this.§1t6811s0§);
         this.teleportbutton.§1t5004s0§();
         this.abandonbutton.addEventListener(MouseEvent.CLICK,this.§1t6814s0§);
         this.abandonbutton.§1t5004s0§();
         this.completebutton.addEventListener(MouseEvent.CLICK,this.onComplete);
         this.completebutton.§1t5004s0§();
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t6803s0§.length)
         {
            this.§1t6803s0§[_loc1_].§1t5004s0§();
            this.§1t6803s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t6815s0§);
            _loc1_++;
         }
         this.bg.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      public function removeEventListeners() : void
      {
         this.§1t6797s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.questScrollUpButton.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t6798s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.teleportbutton.removeEventListener(MouseEvent.CLICK,this.§1t6811s0§);
         this.teleportbutton.removeEventListeners();
         this.abandonbutton.removeEventListener(MouseEvent.CLICK,this.§1t6814s0§);
         this.abandonbutton.removeEventListeners();
         this.completebutton.removeEventListener(MouseEvent.CLICK,this.onComplete);
         this.completebutton.removeEventListeners();
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t6803s0§.length)
         {
            this.§1t6803s0§[_loc1_].removeEventListeners();
            this.§1t6803s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t6815s0§);
            _loc1_++;
         }
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         if(§1t1540s0§.§1t10014s0§())
         {
            §1t6427s0§.§1t12473s0§(true);
         }
         else
         {
            §1t1541s0§.§1t10045s0§();
            §1t251s0§.instance.§1t3532s0§(false);
            if(this.§1t6808s0§)
            {
               §1t1524s0§.§1t9866s0§(§1t1523s0§.§1t2218s0§(),true);
               §1t1525s0§.§1t9933s0§();
            }
         }
         if(this.§1t6808s0§)
         {
            §1t3317s0§.instance.§1t1946s0§();
         }
         §1t406s0§.instance.§1t6456s0§.§1t4235s0§();
         this.visible = false;
         §1t406s0§.instance.§1t6614s0§();
      }
      
      public function §1t5120s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t6807s0§ > 0)
         {
            --this.§1t6807s0§;
            this.§1t6820s0§();
         }
      }
      
      public function §1t5121s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t6807s0§ < this.§1t6805s0§)
         {
            ++this.§1t6807s0§;
            this.§1t6820s0§();
         }
      }
      
      public function §1t6811s0§(param1:MouseEvent) : *
      {
         var activeQuest:§1t60s0§;
         var mouseEvent:MouseEvent = param1;
         if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9231s0§)
         {
            this.§1t5026s0§(null);
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(860),§1t1521s0§.getString(5));
            return;
         }
         activeQuest = this.§1t6804s0§[this.§1t6809s0§ + this.§1t6807s0§];
         if(activeQuest.§1t814s0§())
         {
            this.§1t6813s0§();
            return;
         }
         if(this.§1t6817s0§(activeQuest))
         {
            this.§1t6812s0§();
            return;
         }
         this.§1t6810s0§ = §1t1523s0§.§1t9613s0§();
         §1t1523s0§.§1t9615s0§(5,function():*
         {
            §1t3317s0§.instance.§1t1986s0§(2,"gotoquest",5);
            §1t6812s0§();
            if(§1t6810s0§ <= §1t1523s0§.§1t9613s0§())
            {
               §1t3318s0§.instance.§1t3409s0§(§1t6810s0§ + " " + §1t1523s0§.§1t9613s0§() + " " + §1t1521s0§.getString(534));
            }
         },function():*
         {
            §1t406s0§.instance.§1t6552s0§(5);
         });
      }
      
      internal function §1t6812s0§() : *
      {
         §1t88s0§.instance.§1t1513s0§();
         this.§1t5026s0§(null);
         var _loc1_:§1t60s0§ = this.§1t6804s0§[this.§1t6809s0§ + this.§1t6807s0§];
         var _loc2_:int = _loc1_.§1t820s0§();
         if(§1t70s0§.instance.§1t1149s0§(_loc1_.getMarkedNode()) != §1t70s0§.§1t9140s0§)
         {
            _loc2_ = 0;
         }
         var _loc3_:§1t57s0§ = _loc1_.§1t829s0§();
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(_loc3_.§1t760s0§(),_loc2_,_loc3_.§1t761s0§());
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12486s0§);
      }
      
      internal function §1t6813s0§() : *
      {
         §1t88s0§.instance.§1t1513s0§();
         this.§1t5026s0§(null);
         var _loc1_:§1t60s0§ = this.§1t6804s0§[this.§1t6809s0§ + this.§1t6807s0§];
         var _loc2_:int = 1;
         var _loc3_:§1t57s0§ = _loc1_.§1t829s0§();
         §1t1523s0§.§1t9712s0§(30021,§1t1525s0§.§1t9935s0§());
         §1t1523s0§.§1t9763s0§(_loc3_.§1t760s0§(),_loc2_);
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(_loc3_.§1t760s0§(),_loc2_,400);
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12488s0§);
      }
      
      public function §1t6814s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t6788s0§.show(this.§1t6803s0§[this.§1t6809s0§].§1t6785s0§());
      }
      
      internal function onComplete(param1:MouseEvent) : *
      {
         var _loc4_:§1t76s0§ = null;
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         var _loc2_:§1t60s0§ = this.§1t6804s0§[this.§1t6809s0§ + this.§1t6807s0§];
         this.§1t5026s0§(null);
         if(_loc2_.§1t807s0§ != §1t1799s0§.§1t11448s0§)
         {
            _loc4_ = new §1t76s0§(null);
            _loc4_.§1t1249s0§(_loc2_.nodeid,_loc2_.roomid,_loc2_.§1t802s0§,_loc2_.date);
            §1t1524s0§.§1t9880s0§(_loc4_.§1t1251s0§(),_loc4_.§1t509s0§());
         }
         var _loc3_:§1t69s0§ = §1t123s0§.instance.§1t1604s0§(_loc2_.nodeid,_loc2_.roomid,_loc2_.§1t802s0§,_loc2_.date,_loc2_.§1t807s0§,_loc2_.§1t808s0§,_loc2_.§1t810s0§,_loc2_.§1t809s0§);
         §1t1524s0§.§1t9873s0§(_loc3_);
         §1t6427s0§.§1t12475s0§(§1t123s0§.§1t11212s0§,2);
      }
      
      public function §1t6815s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         var _loc2_:§1t6782s0§ = param1.target.parent as §1t6782s0§;
         var _loc3_:int = 0;
         while(_loc3_ < this.§1t6803s0§.length)
         {
            this.§1t6803s0§[_loc3_].§1t6786s0§(this.§1t6803s0§[_loc3_] == _loc2_);
            _loc3_++;
         }
         this.§1t6809s0§ = _loc2_.§1t6787s0§();
         this.§1t6816s0§();
      }
      
      public function §1t6816s0§() : *
      {
         var _loc1_:§1t60s0§ = null;
         var _loc2_:String = null;
         var _loc3_:§1t85s0§ = null;
         var _loc4_:§1t69s0§ = null;
         var _loc5_:int = 0;
         this.teleportbutton.visible = true;
         this.§1t5055s0§.visible = true;
         this.§1t5054s0§.visible = true;
         this.abandonbutton.visible = true;
         this.§1t6800s0§.visible = true;
         this.rewardtext.visible = true;
         this.completebutton.visible = false;
         §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9427s0§,this.§1t6809s0§ + this.§1t6807s0§);
         if(this.§1t6809s0§ != -1 && this.§1t6809s0§ + this.§1t6807s0§ >= this.§1t6804s0§.length && this.§1t6804s0§.length > 0)
         {
            this.§1t6809s0§ = 0;
            this.§1t6807s0§ = 0;
         }
         if(this.§1t6809s0§ != -1)
         {
            _loc1_ = this.§1t6804s0§[this.§1t6809s0§ + this.§1t6807s0§];
         }
         else
         {
            _loc1_ = null;
         }
         if(_loc1_ == null)
         {
            this.objectivetext.text = "";
            this.§1t6793s0§.text = "";
            this.rewardtext.text = "";
            this.completebutton.visible = false;
            this.teleportbutton.visible = false;
            this.§1t5055s0§.visible = false;
            this.§1t5054s0§.visible = false;
            this.abandonbutton.visible = false;
            §1t406s0§.instance.§1t6643s0§("");
         }
         else if(_loc1_.§1t799s0§)
         {
            _loc4_ = §1t123s0§.instance.§1t1604s0§(_loc1_.nodeid,_loc1_.roomid,_loc1_.§1t802s0§,_loc1_.date,_loc1_.§1t807s0§,_loc1_.§1t808s0§,_loc1_.§1t810s0§,_loc1_.§1t809s0§);
            _loc3_ = _loc4_.§1t1453s0§(_loc1_.step);
            if(_loc3_ != null)
            {
               this.objectivetext.text = _loc3_.title + "\n" + §1t1521s0§.getString(536);
               this.§1t6793s0§.text = §1t70s0§.instance.§1t1155s0§(_loc1_.§1t804s0§,_loc1_.§1t805s0§) + "\n" + §1t70s0§.instance.§1t1154s0§(_loc1_.§1t804s0§);
               _loc2_ = this.§1t6818s0§(_loc3_.§1t992s0§());
               this.§1t6800s0§.visible = _loc2_ != "";
               this.rewardtext.visible = _loc2_ != "";
               this.rewardtext.text = _loc2_;
               §1t406s0§.instance.§1t6643s0§(_loc3_.title,_loc4_.type);
            }
            this.completebutton.visible = !_loc1_.§1t818s0§() && _loc1_.§1t826s0§();
         }
         else
         {
            _loc1_.§1t812s0§();
            if(_loc1_.§1t807s0§ != -1)
            {
               if(_loc1_.§1t807s0§ == §1t1711s0§.§1t11264s0§)
               {
                  this.abandonbutton.visible = false;
                  if(this.§1t6817s0§(_loc1_))
                  {
                     this.§1t5055s0§.visible = false;
                     this.§1t5054s0§.visible = false;
                  }
               }
               else if(_loc1_.§1t807s0§ == §1t1711s0§.§1t11267s0§)
               {
                  this.abandonbutton.visible = false;
                  this.§1t5055s0§.visible = false;
                  this.§1t5054s0§.visible = false;
                  if(_loc1_.§1t804s0§ == §1t1525s0§.§1t9935s0§() && §1t1525s0§.§1t7341s0§() != 0)
                  {
                     this.teleportbutton.visible = false;
                  }
               }
               _loc3_ = §1t1524s0§.§1t9872s0§(_loc1_.§1t797s0§,_loc1_.step);
               if(_loc3_ == null)
               {
                  return;
               }
               this.objectivetext.text = _loc3_.title;
               _loc5_ = §1t70s0§.instance.§1t1139s0§(_loc1_.§1t804s0§);
               if(_loc5_ > §1t1523s0§.getLevel())
               {
                  this.objectivetext.appendText("\n(" + §1t1521s0§.getString(990) + ": " + _loc5_ + ")");
               }
               if(_loc1_.§1t807s0§ == §1t1711s0§.§1t11267s0§)
               {
                  this.§1t6793s0§.text = §1t1521s0§.getString(718);
               }
               else
               {
                  this.§1t6793s0§.text = §1t70s0§.instance.§1t1155s0§(_loc1_.§1t804s0§,_loc1_.§1t805s0§) + "\n" + §1t70s0§.instance.§1t1154s0§(_loc1_.§1t804s0§);
               }
               _loc2_ = this.§1t6818s0§(_loc3_.§1t992s0§());
               this.§1t6800s0§.visible = _loc2_ != "";
               this.rewardtext.visible = _loc2_ != "";
               this.rewardtext.text = _loc2_;
               §1t406s0§.instance.§1t6643s0§(_loc3_.title,_loc1_.§1t807s0§);
            }
         }
      }
      
      internal function §1t6817s0§(param1:§1t60s0§) : Boolean
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         if(param1.§1t797s0§ == 0 && param1.step == 17)
         {
            return true;
         }
         if(param1.step == 0 && !param1.§1t799s0§ && param1.§1t807s0§ == §1t1711s0§.§1t11264s0§)
         {
            _loc2_ = §1t70s0§.instance.§1t1133s0§(param1.§1t804s0§);
            _loc3_ = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
            _loc4_ = Math.abs(_loc2_.x - _loc3_.x) + Math.abs(_loc2_.y - _loc3_.y);
            if(_loc4_ > 3)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function §1t6818s0§(param1:§1t77s0§) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:§1t63s0§ = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:§1t17s0§ = null;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         if(param1 != null)
         {
            _loc2_ = param1.§1t833s0§();
            _loc3_ = 0;
            _loc4_ = 0;
            _loc5_ = "";
            _loc6_ = int(param1.loot.length);
            _loc11_ = 0;
            while(_loc11_ < _loc6_)
            {
               _loc7_ = param1.loot[_loc11_];
               _loc9_ = _loc7_.getQty();
               if(_loc7_.§1t1411s0§() == "")
               {
                  _loc10_ = null;
                  _loc8_ = _loc7_.§1t760s0§();
               }
               else
               {
                  _loc10_ = §1t17s0§.§1t8745s0§(_loc7_.§1t1411s0§());
               }
               if(_loc10_ != null)
               {
                  if(_loc5_ == "")
                  {
                     if(_loc9_ > 1)
                     {
                        _loc5_ = _loc9_ + "x " + _loc10_.§1t513s0§();
                     }
                     else if(_loc9_ == 1)
                     {
                        _loc5_ = _loc10_.§1t513s0§();
                     }
                  }
                  else if(_loc9_ > 1)
                  {
                     _loc5_ += "\n" + _loc9_ + "x " + _loc10_.§1t513s0§();
                  }
                  else if(_loc9_ == 1)
                  {
                     _loc5_ += "\n" + _loc10_.§1t513s0§();
                  }
               }
               else if(_loc8_ == 0 || _loc8_ == 11)
               {
                  _loc3_ += _loc9_;
               }
               else if(_loc8_ == 1)
               {
                  _loc3_ += 5 * _loc9_;
               }
               else if(_loc8_ == 50007)
               {
                  _loc4_ += _loc9_;
               }
               else if(_loc5_ == "")
               {
                  if(_loc9_ > 1)
                  {
                     _loc5_ = _loc9_ + "x " + new §1t17s0§(_loc8_).§1t513s0§();
                  }
                  else if(_loc9_ == 1)
                  {
                     _loc5_ = new §1t17s0§(_loc8_).§1t513s0§();
                  }
               }
               else if(_loc9_ > 1)
               {
                  _loc5_ += "\n" + _loc9_ + "x " + new §1t17s0§(_loc8_).§1t513s0§();
               }
               else if(_loc9_ == 1)
               {
                  _loc5_ += "\n" + new §1t17s0§(_loc8_).§1t513s0§();
               }
               _loc11_++;
            }
            _loc12_ = "";
            if(_loc2_ > 0)
            {
               _loc12_ += _loc2_ + " XP\n";
            }
            if(_loc3_ > 0)
            {
               _loc12_ += _loc3_ + " coins\n";
            }
            if(_loc4_ > 0)
            {
               _loc12_ += "Town Prosperity: +" + _loc4_ + "\n";
            }
            return _loc12_ + _loc5_;
         }
         return "";
      }
      
      public function show() : void
      {
         this.§1t5004s0§();
         this.§1t6807s0§ = 0;
         this.§1t6819s0§();
         this.§1t6820s0§();
         this.visible = true;
         §1t1623s0§.instance.§1t1631s0§();
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.§1t6808s0§ = false;
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
      }
      
      public function §1t6819s0§() : void
      {
         this.§1t6804s0§ = §1t1523s0§.§1t9373s0§;
         this.§1t6806s0§ = this.§1t6804s0§.length;
         this.§1t6805s0§ = this.§1t6806s0§ - this.§1t6803s0§.length;
         if(this.§1t6805s0§ < 0)
         {
            this.§1t6805s0§ = 0;
         }
         if(this.§1t6807s0§ > this.§1t6805s0§)
         {
            this.§1t6807s0§ = this.§1t6805s0§;
         }
      }
      
      public function §1t6820s0§() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:§1t69s0§ = null;
         var _loc7_:§1t60s0§ = null;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:§1t69s0§ = null;
         var _loc1_:int = int(this.§1t6803s0§.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.§1t6803s0§[_loc2_].visible = false;
            _loc2_++;
         }
         this.questScrollUpButton.visible = this.§1t6807s0§ > 0;
         this.§1t6798s0§.visible = this.§1t6804s0§.length - this.§1t6807s0§ > _loc1_;
         var _loc3_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9427s0§);
         this.§1t6809s0§ = -1;
         if(this.§1t6806s0§ > 0)
         {
            this.noquesttext.text = "";
            _loc4_ = int(this.§1t6803s0§.length);
            if(_loc4_ > this.§1t6806s0§ - this.§1t6807s0§)
            {
               _loc4_ = this.§1t6806s0§ - this.§1t6807s0§;
            }
            _loc8_ = 0;
            while(_loc8_ < _loc4_)
            {
               _loc5_ = _loc8_ + this.§1t6807s0§;
               if(_loc5_ == _loc3_)
               {
                  this.§1t6803s0§[_loc8_].§1t6786s0§(true);
                  this.§1t6809s0§ = _loc8_;
                  this.§1t6816s0§();
               }
               else
               {
                  this.§1t6803s0§[_loc8_].§1t6786s0§(false);
               }
               _loc7_ = this.§1t6804s0§[_loc5_];
               if(_loc7_.§1t807s0§ == §1t1799s0§.§1t11446s0§ || _loc7_.§1t807s0§ == §1t1799s0§.§1t11447s0§)
               {
                  _loc9_ = §1t123s0§.instance.§1t1582s0§(_loc7_.nodeid,_loc7_.roomid,_loc7_.§1t802s0§,_loc7_.date);
                  if(_loc7_.§1t818s0§())
                  {
                     _loc10_ = _loc9_ + "\'s Trade";
                  }
                  else
                  {
                     _loc10_ = _loc9_ + "\'s Quest";
                  }
                  this.§1t6803s0§[_loc8_].§1t6784s0§(_loc10_);
                  this.§1t6803s0§[_loc8_].visible = true;
               }
               else if(_loc7_.§1t799s0§)
               {
                  _loc11_ = §1t123s0§.instance.§1t1604s0§(_loc7_.nodeid,_loc7_.roomid,_loc7_.§1t802s0§,_loc7_.date,_loc7_.§1t807s0§,_loc7_.§1t808s0§,_loc7_.§1t810s0§,_loc7_.§1t809s0§);
                  this.§1t6803s0§[_loc8_].§1t6784s0§(_loc11_.name);
                  this.§1t6803s0§[_loc8_].visible = true;
               }
               else
               {
                  _loc6_ = §1t1524s0§.§1t9871s0§(_loc7_.§1t797s0§);
                  if(_loc6_ != null)
                  {
                     this.§1t6803s0§[_loc8_].§1t6784s0§(_loc6_.name);
                     this.§1t6803s0§[_loc8_].visible = true;
                  }
               }
               _loc8_++;
            }
         }
         else
         {
            this.noquesttext.text = §1t1521s0§.getString(79);
            this.teleportbutton.visible = false;
            this.§1t5055s0§.visible = false;
            this.§1t5054s0§.visible = false;
            this.abandonbutton.visible = false;
            this.objectivetext.text = "";
            this.§1t6793s0§.text = "";
            this.rewardtext.text = "";
            this.teleportbutton.visible = false;
            this.completebutton.visible = false;
            this.objectivelabel.visible = false;
            this.locationlabel.visible = false;
            this.§1t6800s0§.visible = false;
         }
         this.§1t6791s0§.visible = this.§1t6806s0§ >= 7;
         if(this.§1t6809s0§ == -1 && this.§1t6806s0§ > 0)
         {
            this.objectivetext.text = "";
            this.§1t6793s0§.text = "";
            this.rewardtext.text = "";
            this.completebutton.visible = false;
            this.teleportbutton.visible = false;
            this.§1t5055s0§.visible = false;
            this.§1t5054s0§.visible = false;
            this.abandonbutton.visible = false;
            this.objectivelabel.visible = false;
            this.locationlabel.visible = false;
            this.§1t6800s0§.visible = false;
         }
      }
      
      public function §1t6821s0§() : *
      {
         if(§1t1523s0§.§1t6821s0§(this.§1t6804s0§[this.§1t6807s0§ + this.§1t6809s0§]))
         {
            this.§1t6819s0§();
            this.§1t6820s0§();
            this.§1t6808s0§ = true;
            this.teleportbutton.visible = false;
            this.§1t5055s0§.visible = false;
            this.§1t5054s0§.visible = false;
            this.abandonbutton.visible = false;
            §1t1623s0§.instance.§1t1632s0§(this.§1t6807s0§ + this.§1t6809s0§);
         }
      }
   }
}

