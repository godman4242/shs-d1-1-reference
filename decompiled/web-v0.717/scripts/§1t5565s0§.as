package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1754")]
   public class §1t5565s0§ extends MovieClip
   {
      
      public static var instance:§1t5565s0§;
      
      public var §1t5566s0§:TextField;
      
      public var bg:§1t5016s0§;
      
      public var §1t5017s0§:SimpleButton;
      
      public var §1t5567s0§:SimpleButton;
      
      public var loading:MovieClip;
      
      public var §1t5568s0§:§1t5551s0§;
      
      public var registertext:TextField;
      
      public var slotsUI:MovieClip;
      
      public var §1t5021s0§:TextField;
      
      public var §1t5571s0§:TextField;
      
      public var §1t5572s0§:TextField;
      
      public var xpbar:MovieClip;
      
      internal var slots:Vector.<§1t5574s0§>;
      
      internal var §1t5098s0§:int = 168;
      
      internal var §1t5575s0§:int = 400;
      
      internal var §1t5099s0§:int = 75;
      
      internal var §1t5101s0§:int = 100;
      
      internal var §1t5576s0§:int = 0;
      
      internal var §1t5577s0§:Boolean = false;
      
      internal var §1t5578s0§:int = -1;
      
      internal var §1t5579s0§:String;
      
      internal var §1t5580s0§:int;
      
      internal var §1t5581s0§:String;
      
      internal var §1t5582s0§:String;
      
      internal var §1t5583s0§:String;
      
      internal var §1t5584s0§:String;
      
      internal var §1t5585s0§:String;
      
      internal var §1t5586s0§:int;
      
      internal var §1t5587s0§:int;
      
      internal var controlledBy:int;
      
      internal var §1t5588s0§:Boolean = false;
      
      public function §1t5565s0§()
      {
         var _loc1_:§1t5574s0§ = null;
         var _loc3_:int = 0;
         this.slots = new Vector.<§1t5574s0§>();
         super();
         instance = this;
         §1t1521s0§.§1t9290s0§(this.loading.prompt);
         this.loading.prompt.text = §1t1521s0§.getString(58);
         §1t1521s0§.§1t9290s0§(this.§1t5572s0§);
         this.§1t5572s0§.text = §1t1521s0§.getString(59);
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.slotsUI.rankingsButton.§1t5769s0§(§1t1521s0§.getString(28));
         §1t1521s0§.§1t9290s0§(this.slotsUI.§1t15986s0§);
         this.slotsUI.§1t15986s0§.text = §1t1521s0§.getString(197);
         §1t1521s0§.§1t9290s0§(this.slotsUI.taunt,false);
         §1t1521s0§.§1t9290s0§(this.xpbar.labeltext,true);
         this.xpbar.labeltext.text = §1t1521s0§.getString(66);
         §1t1521s0§.§1t9290s0§(this.registertext,true);
         this.registertext.text = §1t1521s0§.getString(916);
         this.§1t5021s0§.text = §1t1521s0§.getString(60);
         var _loc2_:Boolean = true;
         _loc3_ = 0;
         while(_loc3_ < 6)
         {
            _loc1_ = new §1t5574s0§();
            this.slots.push(_loc1_);
            this.slotsUI.addChild(_loc1_);
            if(_loc2_)
            {
               _loc1_.x = this.§1t5098s0§;
               _loc1_.y = this.§1t5099s0§ + this.§1t5101s0§ * _loc3_ / 2;
            }
            else
            {
               _loc1_.x = this.§1t5575s0§;
               _loc1_.y = this.§1t5099s0§ + this.§1t5101s0§ * (_loc3_ - 1) / 2;
            }
            _loc2_ = !_loc2_;
            _loc3_++;
         }
         setChildIndex(this.loading,numChildren - 1);
         this.registertext.visible = false;
      }
      
      public function show() : *
      {
         this.§1t5567s0§.visible = !§1t3317s0§.instance.§1t1833s0§;
         this.registertext.visible = §1t3317s0§.instance.§1t1833s0§;
         this.§1t5577s0§ = false;
         this.visible = true;
         this.loading.prompt.text = §1t1521s0§.getString(58);
         this.loading.visible = true;
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            this.slots[_loc1_].visible = false;
            _loc1_++;
         }
         §1t3317s0§.instance.§1t1878s0§();
         this.§1t5004s0§();
         this.§1t5571s0§.text = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§).toString();
         this.§1t5568s0§.visible = false;
         this.slotsUI.visible = true;
         this.slotsUI.rankingsButton.visible = true;
         this.slotsUI.refreshbutton.visible = true;
         §1t1623s0§.instance.§1t1638s0§();
         var _loc2_:String = §1t1523s0§.§1t5608s0§();
         if(_loc2_ == null || _loc2_ == "" || _loc2_ == "null")
         {
            _loc2_ = §1t1521s0§.getString(198);
         }
         this.slotsUI.taunt.text = _loc2_;
         §1t1540s0§.§1t10025s0§().focus = this.slotsUI.taunt;
         this.slotsUI.taunt.setSelection(_loc2_.length,_loc2_.length);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.bg.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      public function §1t5589s0§() : *
      {
         this.visible = true;
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            this.slots[_loc1_].visible = false;
            _loc1_++;
         }
         this.§1t5004s0§();
         this.§1t5571s0§.text = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§).toString();
         this.§1t5568s0§.visible = false;
         this.slotsUI.visible = true;
         this.slotsUI.rankingsButton.visible = true;
         this.slotsUI.refreshbutton.visible = true;
         var _loc2_:String = §1t1523s0§.§1t5608s0§();
         if(_loc2_ == null || _loc2_ == "" || _loc2_ == "null")
         {
            _loc2_ = §1t1521s0§.getString(198);
         }
         this.slotsUI.taunt.text = _loc2_;
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.bg.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      public function §1t3388s0§(param1:String) : *
      {
         var _loc2_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:Vector.<§1t68s0§> = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:§1t122s0§ = null;
         var _loc15_:Array = null;
         var _loc16_:Boolean = false;
         var _loc17_:int = 0;
         this.§1t5590s0§();
         var _loc3_:Array = param1.split(§1t1701s0§.§1t11257s0§);
         this.§1t5576s0§ = _loc3_.length;
         if(_loc3_[this.§1t5576s0§ - 1] == "")
         {
            --this.§1t5576s0§;
         }
         var _loc4_:Array = new Array();
         var _loc5_:§1t5574s0§ = new §1t5574s0§();
         var _loc6_:String = "";
         var _loc7_:§1t76s0§ = §1t1524s0§.§1t9874s0§(-1);
         if(_loc7_ != null && _loc7_.nid != "")
         {
            _loc10_ = 0;
            _loc5_.setDuelInfo(_loc7_.§1t509s0§(),_loc7_.lvl,_loc7_.§1t1258s0§(),_loc10_);
            _loc4_.push(_loc5_);
            _loc6_ = _loc7_.§1t509s0§();
         }
         var _loc8_:int = 0;
         if(§1t1540s0§.§1t9550s0§())
         {
            _loc11_ = §1t1543s0§.§1t10227s0§();
            _loc12_ = int(_loc11_.length);
            _loc13_ = §1t1523s0§.getLevel();
            _loc2_ = 0;
            while(_loc2_ < _loc12_)
            {
               _loc14_ = _loc11_[_loc2_] as §1t122s0§;
               if(Math.abs(_loc14_.level - _loc13_) < 2 && _loc14_.charname != _loc6_)
               {
                  _loc5_.setDuelInfo(_loc14_.charname,_loc14_.level,_loc14_.equipmentStr,0);
                  _loc4_.push(_loc5_);
               }
               _loc2_++;
            }
            _loc15_ = this.§1t5591s0§(_loc4_.length,6);
            _loc2_ = 0;
            while(_loc2_ < _loc15_.length && _loc8_ < 6)
            {
               this.slots[_loc8_].setDuelInfo(_loc4_[_loc15_[_loc2_]].charname,_loc4_[_loc15_[_loc2_]].level,_loc4_[_loc15_[_loc2_]].equipment,_loc4_[_loc15_[_loc2_]].timesince);
               _loc8_++;
               _loc2_++;
            }
         }
         _loc2_ = _loc8_;
         while(_loc2_ < this.§1t5576s0§ && _loc8_ < 6)
         {
            _loc9_ = _loc3_[_loc2_].split("$");
            _loc16_ = false;
            _loc17_ = 0;
            while(_loc17_ < 6)
            {
               if(_loc9_[0] == this.slots[_loc17_].charname)
               {
                  _loc16_ = true;
                  break;
               }
               _loc17_++;
            }
            if(!_loc16_)
            {
               this.slots[_loc8_].setDuelInfo(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3]);
               _loc8_++;
            }
            _loc2_++;
         }
         this.loading.visible = false;
         _loc2_ = 0;
         while(_loc2_ < _loc8_)
         {
            this.slots[_loc2_].visible = true;
            _loc2_++;
         }
      }
      
      internal function §1t5590s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            this.slots[_loc1_].clearSlot();
            _loc1_++;
         }
      }
      
      internal function §1t5591s0§(param1:int, param2:int) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc7_:* = undefined;
         var _loc3_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < param2 && _loc6_ < param1)
         {
            _loc5_ = true;
            _loc4_ = Math.random() * param1;
            _loc7_ = 0;
            while(_loc7_ < _loc3_.length)
            {
               if(_loc4_ == _loc3_[_loc7_])
               {
                  _loc5_ = false;
               }
               _loc7_++;
            }
            if(_loc5_)
            {
               _loc3_.push(_loc4_);
               _loc6_++;
            }
         }
         return _loc3_;
      }
      
      internal function §1t5592s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.loading.prompt.text = §1t1521s0§.getString(58);
         this.loading.visible = true;
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            this.slots[_loc2_].visible = false;
            _loc2_++;
         }
         §1t3317s0§.instance.§1t1878s0§();
      }
      
      public function §1t5593s0§() : *
      {
         this.§1t5571s0§.text = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§).toString();
      }
      
      public function §1t5594s0§(param1:String, param2:int, param3:String, param4:Boolean = false) : *
      {
         var _loc5_:Boolean = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9416s0§) > 0 || param4;
         if(_loc5_)
         {
            this.§1t5610s0§();
            this.loading.prompt.text = §1t1521s0§.getString(25);
            this.loading.visible = true;
            if(!param4)
            {
               §1t1523s0§.§1t9610s0§(-1);
               this.§1t5571s0§.text = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§).toString();
            }
            this.§1t5579s0§ = param1;
            this.§1t5580s0§ = param2;
            this.§1t5581s0§ = param3;
            this.§1t5588s0§ = param4;
            §1t3317s0§.instance.§1t1881s0§(param1);
         }
         else
         {
            §1t406s0§.instance.§1t6529s0§();
         }
      }
      
      public function §1t5595s0§(param1:String, param2:String, param3:String, param4:int, param5:String) : *
      {
         this.§1t5582s0§ = param1;
         this.§1t5583s0§ = param2;
         if(param5 == null || param5 == "" || param5 == "null")
         {
            param5 = §1t1521s0§.getString(198);
         }
         this.§1t5584s0§ = param5;
         this.§1t5586s0§ = -1;
         if(param4 < 300 && §1t1523s0§.getLevel() > 1 && !§1t3317s0§.instance.§1t1833s0§)
         {
            this.loading.prompt.text = §1t1521s0§.getString(180);
            §1t251s0§.§1t9190s0§().§1t3467s0§(§1t251s0§.§1t12079s0§);
            if(!§1t1523s0§.§1t9505s0§)
            {
               §1t251s0§.§1t9190s0§().connect(param3);
            }
            else
            {
               §1t251s0§.§1t9190s0§().§1t3572s0§(this.§1t5579s0§,§1t81s0§.§1t9243s0§);
            }
            this.§1t5577s0§ = true;
            this.§1t5578s0§ = 24 * 20;
         }
         else
         {
            this.§1t5599s0§();
         }
      }
      
      public function §1t5596s0§(param1:String, param2:String, param3:int) : *
      {
         this.§1t5582s0§ = param1;
         this.§1t5581s0§ = param2;
         this.§1t5586s0§ = param3;
      }
      
      public function update() : *
      {
         if(this.§1t5577s0§ && this.§1t5578s0§ != -1)
         {
            --this.§1t5578s0§;
            if(this.§1t5578s0§ == 0)
            {
               this.§1t5597s0§();
            }
         }
      }
      
      public function §1t5597s0§() : *
      {
         this.§1t5578s0§ = -1;
         §1t251s0§.instance.§1t3474s0§(this.§1t5585s0§);
         this.§1t5599s0§();
      }
      
      public function §1t5598s0§() : *
      {
         this.§1t5578s0§ = -1;
      }
      
      public function §1t5599s0§() : *
      {
         this.§1t5588s0§ = false;
         this.§1t5578s0§ = -1;
         this.§1t5577s0§ = false;
         this.controlledBy = 1;
         §1t251s0§.instance.§1t3467s0§(§1t251s0§.§1t12081s0§);
         this.§1t5602s0§("",true);
         §1t1623s0§.instance.§1t1639s0§();
      }
      
      public function §1t5600s0§(param1:String, param2:Boolean) : *
      {
         var _loc3_:String = null;
         this.§1t5578s0§ = -1;
         this.§1t5577s0§ = false;
         this.controlledBy = 2;
         this.§1t5602s0§(param1,param2);
         §1t1623s0§.instance.§1t1640s0§();
         if(this.§1t5616s0§())
         {
            if(§1t1523s0§.charname < this.§1t5579s0§)
            {
               _loc3_ = §1t1523s0§.charname + "_" + this.§1t5579s0§;
            }
            else
            {
               _loc3_ = this.§1t5579s0§ + "_" + §1t1523s0§.charname;
            }
            §1t251s0§.instance.§1t3576s0§(_loc3_);
         }
      }
      
      public function §1t5601s0§(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:int) : *
      {
         this.§1t5579s0§ = param1;
         this.§1t5580s0§ = int(param2);
         this.§1t5582s0§ = param3;
         this.§1t5581s0§ = param4;
         this.§1t5583s0§ = param5;
         this.§1t5584s0§ = param6;
         this.§1t5586s0§ = param7;
      }
      
      public function §1t5602s0§(param1:String, param2:Boolean) : *
      {
         §1t251s0§.§1t9190s0§().§1t3521s0§();
         §1t1523s0§.§1t9776s0§();
         var _loc3_:§1t76s0§ = new §1t76s0§(null);
         _loc3_.§1t1248s0§(this.§1t5579s0§,this.§1t5580s0§,this.§1t5582s0§,this.§1t5581s0§,this.§1t5583s0§,this.controlledBy,param1,param2,this.§1t5586s0§);
         §1t1524s0§.§1t9876s0§(_loc3_);
         this.loading.visible = false;
         var _loc4_:§1t116s0§ = new §1t116s0§(null);
         _loc4_.§1t1014s0§();
         var _loc5_:Vector.<§1t116s0§> = new Vector.<§1t116s0§>(1);
         _loc5_[0] = _loc4_;
         var _loc6_:int = 150;
         if(!param2)
         {
            _loc6_ = 650;
         }
         §1t6427s0§.§1t12474s0§(-1);
         §1t1540s0§.§1t10052s0§(-1,6,this.§1t5587s0§,1000,0,_loc5_,_loc6_);
         this.visible = false;
         if(!param2)
         {
            §1t251s0§.instance.§1t3497s0§(true);
         }
      }
      
      public function §1t5603s0§(param1:Object, param2:Object) : *
      {
         var _loc4_:int = 0;
         var _loc3_:§1t76s0§ = new §1t76s0§(null);
         if(param1.stance != null)
         {
            _loc4_ = int(param1.stance);
         }
         _loc3_.§1t1248s0§(" " + param1.charname,param1.charlvl,param1.stats,param1.equip,param1.skills,2,"0",false,_loc4_);
         _loc3_.id = 700;
         §1t1524s0§.§1t9876s0§(_loc3_);
         _loc3_ = new §1t76s0§(null);
         if(param2.stance != null)
         {
            _loc4_ = int(param2.stance);
         }
         _loc3_.§1t1248s0§(" " + param2.charname,param2.charlvl,param2.stats,param2.equip,param2.skills,2,"1",true,_loc4_);
         _loc3_.id = 701;
         §1t1524s0§.§1t9876s0§(_loc3_);
         var _loc5_:§1t116s0§ = new §1t116s0§(null);
         _loc5_.§1t1015s0§();
         var _loc6_:Vector.<§1t116s0§> = new Vector.<§1t116s0§>(1);
         _loc6_[0] = _loc5_;
         §1t6427s0§.§1t12474s0§(-1);
         §1t1540s0§.§1t10052s0§(-1,11,param1.bg,1000,0,_loc6_,150);
         this.visible = false;
      }
      
      public function §1t5604s0§(param1:Array) : *
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc8_:§1t76s0§ = null;
         var _loc2_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = param1[_loc5_];
            _loc8_ = new §1t76s0§(null);
            _loc8_.§1t1248s0§(" " + _loc3_.charname,_loc3_.charlvl,_loc3_.stats,_loc3_.equip,_loc3_.skills,2,"0",false,-1);
            _loc8_.id = 700 + _loc5_;
            if(_loc5_ == 0)
            {
               _loc4_ = int(_loc3_.bg);
            }
            §1t1524s0§.§1t9876s0§(_loc8_);
            _loc5_++;
         }
         var _loc6_:§1t116s0§ = new §1t116s0§(null);
         _loc6_.§1t1016s0§(_loc2_);
         var _loc7_:Vector.<§1t116s0§> = new Vector.<§1t116s0§>(1);
         _loc7_[0] = _loc6_;
         §1t6427s0§.§1t12474s0§(-1);
         §1t1540s0§.§1t10052s0§(-1,13,_loc4_,1000,0,_loc7_,150);
         this.visible = false;
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t5017s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.slotsUI.rankingsButton.addEventListener(MouseEvent.CLICK,this.§1t5605s0§);
         this.slotsUI.rankingsButton.§1t5004s0§();
         this.slotsUI.refreshbutton.addEventListener(MouseEvent.CLICK,this.§1t5592s0§);
         this.§1t5567s0§.addEventListener(MouseEvent.CLICK,this.§1t5615s0§);
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            this.slots[_loc1_].§1t5004s0§();
            _loc1_++;
         }
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t5017s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.slotsUI.rankingsButton.removeEventListener(MouseEvent.CLICK,this.§1t5605s0§);
         this.slotsUI.rankingsButton.removeEventListeners();
         this.slotsUI.refreshbutton.removeEventListener(MouseEvent.CLICK,this.§1t5592s0§);
         this.§1t5567s0§.removeEventListener(MouseEvent.CLICK,this.§1t5615s0§);
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            this.slots[_loc1_].removeEventListeners();
            _loc1_++;
         }
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         if(this.loading.visible)
         {
            return;
         }
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
         }
         this.removeEventListeners();
         if(§1t1540s0§.§1t10014s0§())
         {
            §1t6427s0§.§1t12473s0§(true);
         }
         else
         {
            §1t1541s0§.§1t10045s0§();
            §1t251s0§.instance.§1t3532s0§(false);
         }
         this.visible = false;
         §1t406s0§.instance.§1t6614s0§();
         this.§1t5610s0§();
         if(param1 != null)
         {
            §1t1524s0§.§1t9875s0§(§1t76s0§.§1t9196s0§);
         }
         §1t1523s0§.§1t9742s0§();
      }
      
      public function §1t5560s0§(param1:String) : *
      {
         this.§1t5568s0§.§1t5560s0§(param1);
      }
      
      internal function §1t5605s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t5568s0§.show(this.loading);
         this.slotsUI.visible = false;
         this.slotsUI.refreshbutton.visible = false;
         this.slotsUI.rankingsButton.visible = false;
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            this.slots[_loc2_].visible = false;
            _loc2_++;
         }
         §1t1623s0§.instance.§1t1629s0§();
      }
      
      public function §1t5606s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.slotsUI.rankingsButton.visible = true;
         this.slotsUI.refreshbutton.visible = true;
         this.slotsUI.visible = true;
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5576s0§)
         {
            this.slots[_loc1_].visible = true;
            _loc1_++;
         }
      }
      
      public function ioError() : *
      {
         this.§1t5568s0§.§1t5026s0§(null);
         this.loading.visible = false;
      }
      
      public function §1t5608s0§() : String
      {
         return this.§1t5584s0§;
      }
      
      public function §1t5609s0§(param1:String) : *
      {
         this.§1t5584s0§ = param1;
      }
      
      public function §1t5610s0§() : *
      {
         if(this.slotsUI.taunt.text != "" && this.slotsUI.taunt.text != §1t1523s0§.§1t5608s0§())
         {
            this.slotsUI.taunt.text = this.slotsUI.taunt.text.split("(").join("");
            this.slotsUI.taunt.text = this.slotsUI.taunt.text.split(")").join("");
            this.slotsUI.taunt.text = this.slotsUI.taunt.text.split("^").join("");
            §1t1523s0§.§1t9758s0§(§1t406s0§.instance.§1t5322s0§(this.slotsUI.taunt.text));
            §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9684s0§);
            §1t3317s0§.instance.§1t1946s0§();
         }
      }
      
      public function §1t5611s0§() : *
      {
         this.loading.visible = false;
         this.§1t5577s0§ = false;
         §1t251s0§.instance.§1t3474s0§(this.§1t5585s0§);
      }
      
      public function §1t5612s0§(param1:String) : *
      {
         this.§1t5585s0§ = param1;
      }
      
      public function §1t5613s0§() : int
      {
         this.§1t5587s0§ = Math.random() * 15;
         if(this.§1t5587s0§ == 12)
         {
            this.§1t5587s0§ = §1t112s0§.§1t12574s0§;
         }
         else if(this.§1t5587s0§ == 13)
         {
            this.§1t5587s0§ = §1t112s0§.§1t12575s0§;
         }
         else if(this.§1t5587s0§ == 14)
         {
            this.§1t5587s0§ = §1t112s0§.§1t12576s0§;
         }
         return this.§1t5587s0§;
      }
      
      public function §1t1754s0§(param1:int) : *
      {
         this.§1t5587s0§ = param1;
      }
      
      public function getBG() : int
      {
         return this.§1t5587s0§;
      }
      
      public function §1t5614s0§() : Boolean
      {
         return this.§1t5577s0§;
      }
      
      public function §1t5615s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5026s0§(null);
         §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12360s0§);
      }
      
      public function §1t5616s0§() : Boolean
      {
         return this.§1t5588s0§;
      }
      
      public function §1t5617s0§() : *
      {
         this.§1t5588s0§ = false;
      }
   }
}

