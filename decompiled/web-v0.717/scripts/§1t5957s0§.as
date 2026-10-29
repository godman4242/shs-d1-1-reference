package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1549")]
   public class §1t5957s0§ extends MovieClip
   {
      
      public static var instance:§1t5957s0§;
      
      internal static var §1t12340s0§:int = 0;
      
      internal static var §1t12341s0§:int = 1;
      
      internal static var §1t12342s0§:int = 2;
      
      internal static var §1t12370s0§:int = 3;
      
      public var §1t5958s0§:TextField;
      
      public var §1t5959s0§:TextField;
      
      public var §1t5046s0§:TextField;
      
      public var §1t5960s0§:MovieClip;
      
      public var §1t5961s0§:TextField;
      
      public var §1t5962s0§:TextField;
      
      public var acc1Icon:MovieClip;
      
      public var acc2Icon:MovieClip;
      
      public var allstatsbutton:§1t5070s0§;
      
      public var allstatsbutton_hitarea:§1t5267s0§;
      
      public var allstatstext:TextField;
      
      public var §1t5968s0§:MovieClip;
      
      public var §1t5969s0§:§1t5040s0§;
      
      public var autoassignlabel:TextField;
      
      public var §1t5047s0§:§1t5016s0§;
      
      public var closeWindow:SimpleButton;
      
      public var §1t5971s0§:TextField;
      
      public var §1t5049s0§:§1t5050s0§;
      
      public var danfield:TextField;
      
      public var §1t5051s0§:§1t4912s0§;
      
      public var §1t5052s0§:§1t394s0§;
      
      public var §1t5973s0§:§1t5050s0§;
      
      public var equipAccessory1:§1t394s0§;
      
      public var equipAccessory2:§1t394s0§;
      
      public var §1t5976s0§:§1t394s0§;
      
      public var equipGloves:§1t394s0§;
      
      public var equipHat:§1t394s0§;
      
      public var equipMask:§1t394s0§;
      
      public var §1t5980s0§:§1t394s0§;
      
      public var equipShoes:§1t394s0§;
      
      public var §1t5982s0§:§1t394s0§;
      
      public var §1t5983s0§:TextField;
      
      public var glovesIcon:MovieClip;
      
      public var §1t5054s0§:TextField;
      
      public var §1t5055s0§:MovieClip;
      
      public var §1t5056s0§:TextField;
      
      public var §1t5057s0§:TextField;
      
      public var hatIcon:MovieClip;
      
      public var §1t5058s0§:§1t5059s0§;
      
      public var §1t5061s0§:§1t4912s0§;
      
      public var §1t5062s0§:§1t4912s0§;
      
      public var §1t5986s0§:MovieClip;
      
      public var loading:MovieClip;
      
      public var maskIcon:MovieClip;
      
      public var pantsIcon:MovieClip;
      
      public var shoesIcon:MovieClip;
      
      public var statPoints:TextField;
      
      public var statsPanel:MovieClip;
      
      public var §1t5079s0§:TextField;
      
      public var §1t5021s0§:TextField;
      
      public var §1t5992s0§:MovieClip;
      
      public var weaponIcon:MovieClip;
      
      public var §1t5994s0§:TextField;
      
      public var §1t5995s0§:§1t75s0§;
      
      internal var inventory:Vector.<§1t17s0§>;
      
      internal var §1t5996s0§:Vector.<§1t17s0§>;
      
      internal var §1t5088s0§:int;
      
      internal var §1t5089s0§:int;
      
      internal var §1t5090s0§:§1t394s0§;
      
      internal var §1t5091s0§:§1t17s0§;
      
      internal var §1t5092s0§:int = -1;
      
      internal var §1t5094s0§:int = 0;
      
      internal var §1t5997s0§:int = 0;
      
      internal const §1t5998s0§:int = 0;
      
      internal const §1t5999s0§:int = 1;
      
      internal const §1t6000s0§:int = 2;
      
      internal const §1t6001s0§:int = 3;
      
      internal var §1t5098s0§:int = 380;
      
      internal var §1t5099s0§:int = 268;
      
      internal var §1t5100s0§:int = 80;
      
      internal var §1t5101s0§:int = 80;
      
      internal var §1t5102s0§:int = 4;
      
      internal var §1t5103s0§:int = 2;
      
      internal var §1t5023s0§:int;
      
      internal var slots:Vector.<§1t394s0§>;
      
      internal var §1t6002s0§:int = 0;
      
      internal var §1t6003s0§:int = 1;
      
      internal var §1t6004s0§:int = 2;
      
      internal var §1t6005s0§:int = 3;
      
      internal var §1t6006s0§:int = 4;
      
      internal var §1t6007s0§:int = 5;
      
      internal var §1t6008s0§:int = 6;
      
      internal var §1t6009s0§:int = 7;
      
      internal var §1t6010s0§:int = 8;
      
      internal var §1t6011s0§:int = 9;
      
      internal var §1t6012s0§:Vector.<§1t394s0§>;
      
      internal var §1t6013s0§:String;
      
      internal var §1t6014s0§:§1t5364s0§;
      
      internal var §1t5809s0§:Boolean = false;
      
      internal var §1t6015s0§:§1t29s0§;
      
      internal var §1t5134s0§:Boolean;
      
      internal var §1t5135s0§:Boolean;
      
      public function §1t5957s0§()
      {
         var _loc2_:§1t394s0§ = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.§1t5023s0§ = this.§1t5102s0§ * this.§1t5103s0§;
         this.slots = new Vector.<§1t394s0§>(this.§1t5023s0§);
         this.§1t6012s0§ = new Vector.<§1t394s0§>(this.§1t6011s0§);
         super();
         instance = this;
         §1t1521s0§.§1t9290s0§(this.autoassignlabel,true);
         this.autoassignlabel.text = §1t1521s0§.getString(62);
         §1t1521s0§.§1t9290s0§(this.§1t5971s0§,true);
         this.§1t5971s0§.text = §1t1521s0§.getString(63);
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(64);
         §1t1521s0§.§1t9290s0§(this.§1t5994s0§,true);
         this.§1t5994s0§.text = §1t1521s0§.getString(66);
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.loading.prompt.text = §1t1521s0§.getString(25);
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = true;
         this.danfield.defaultTextFormat = _loc1_;
         §1t1521s0§.§1t9290s0§(this.statsPanel.§1t16045s0§,true);
         this.statsPanel.§1t16045s0§.text = §1t1521s0§.getString(211);
         §1t1521s0§.§1t9290s0§(this.statsPanel.§1t16046s0§,true);
         this.statsPanel.§1t16046s0§.text = §1t1521s0§.getString(222);
         §1t1521s0§.§1t9290s0§(this.statsPanel.§1t16047s0§,true);
         this.statsPanel.§1t16047s0§.text = §1t1521s0§.getString(223);
         §1t1521s0§.§1t9290s0§(this.statsPanel.§1t16048s0§,true);
         this.statsPanel.§1t16048s0§.text = §1t1521s0§.getString(224);
         §1t1521s0§.§1t9290s0§(this.statsPanel.§1t16049s0§,true);
         this.statsPanel.§1t16049s0§.text = §1t1521s0§.getString(225);
         §1t1521s0§.§1t9290s0§(this.statsPanel.§1t16050s0§,true);
         this.statsPanel.§1t16050s0§.text = §1t1521s0§.getString(226);
         §1t1521s0§.§1t9290s0§(this.§1t5046s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5986s0§.§1t15863s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5986s0§.§1t15864s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5986s0§.§1t6879s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5959s0§);
         §1t1521s0§.§1t9290s0§(this.statPoints,true);
         §1t1521s0§.§1t9290s0§(this.statsPanel.§1t16051s0§,true);
         this.§1t5049s0§.visible = false;
         this.§1t5973s0§.visible = false;
         this.§1t5969s0§.buttonMode = true;
         this.§1t5986s0§.§1t15865s0§.§1t6874s0§();
         this.§1t6022s0§(null);
         this.weaponIcon.visible = false;
         this.hatIcon.visible = false;
         this.maskIcon.visible = false;
         this.§1t5968s0§.visible = false;
         this.glovesIcon.visible = false;
         this.pantsIcon.visible = false;
         this.shoesIcon.visible = false;
         this.acc1Icon.visible = false;
         this.acc2Icon.visible = false;
         var _loc5_:int = 0;
         while(_loc5_ < this.§1t5023s0§)
         {
            _loc2_ = new §1t394s0§();
            addChild(_loc2_);
            _loc4_ = Math.floor(_loc5_ / this.§1t5102s0§);
            _loc3_ = _loc5_ - _loc4_ * this.§1t5102s0§;
            _loc2_.x = this.§1t5098s0§ + _loc3_ * this.§1t5100s0§;
            _loc2_.y = this.§1t5099s0§ + _loc4_ * this.§1t5101s0§;
            _loc2_.id = _loc5_;
            this.slots[_loc5_] = _loc2_;
            this.slots[_loc5_].doubleClickEnabled = true;
            this.slots[_loc5_].mouseChildren = false;
            _loc5_++;
         }
         this.slots.fixed = true;
         this.§1t6012s0§[this.§1t6002s0§] = this.equipHat;
         this.§1t6012s0§[this.§1t6004s0§] = this.§1t5976s0§;
         this.§1t6012s0§[this.§1t6003s0§] = this.equipMask;
         this.§1t6012s0§[this.§1t6005s0§] = this.equipGloves;
         this.§1t6012s0§[this.§1t6007s0§] = this.§1t5982s0§;
         this.§1t6012s0§[this.§1t6006s0§] = this.§1t5980s0§;
         this.§1t6012s0§[this.§1t6009s0§] = this.equipShoes;
         this.§1t6012s0§[this.§1t6008s0§] = this.equipAccessory1;
         this.§1t6012s0§[this.§1t6010s0§] = this.equipAccessory2;
         this.§1t6012s0§.fixed = true;
         _loc5_ = 0;
         while(_loc5_ < this.§1t6011s0§)
         {
            _loc2_ = this.§1t6012s0§[_loc5_];
            _loc2_.doubleClickEnabled = true;
            _loc2_.mouseChildren = false;
            _loc5_++;
         }
         this.§1t5052s0§.visible = false;
         this.§1t6014s0§ = new §1t5364s0§();
         addChild(this.§1t6014s0§);
         this.§1t6014s0§.§1t5366s0§.§1t5769s0§(§1t1521s0§.getString(1));
         this.§1t6014s0§.§1t5365s0§.§1t5769s0§(§1t1521s0§.getString(0));
         this.§1t5995s0§ = new §1t75s0§();
         this.§1t5995s0§.§1t5493s0§();
         this.§1t5995s0§.§1t6286s0§(false);
         this.§1t5995s0§.§1t6288s0§("");
         this.§1t5995s0§.scaleX = 1.2;
         this.§1t5995s0§.scaleY = 1.2;
         this.§1t5995s0§.x = 208;
         this.§1t5995s0§.y = 365;
         this.§1t5995s0§.§1t1557s0§(§1t1544s0§.§1t10259s0§);
         addChild(this.§1t5995s0§);
         this.allstatsbutton_hitarea.visible = false;
         this.allstatsbutton.hitArea = this.allstatsbutton_hitarea;
         this.§1t5079s0§.text = §1t1521s0§.getString(681);
         this.§1t5058s0§.§1t5769s0§(§1t1521s0§.getString(691));
      }
      
      public function show(param1:int = 0) : *
      {
         this.§1t5021s0§.text = §1t1521s0§.getString(67);
         this.§1t5997s0§ = param1;
         this.§1t5973s0§.§1t5769s0§(§1t1521s0§.getString(68));
         this.§1t6041s0§();
         if(param1 == this.§1t6000s0§)
         {
            this.inventory = §1t1523s0§.§1t9375s0§;
            this.§1t5058s0§.visible = true;
            this.§1t5055s0§.visible = true;
            this.§1t5983s0§.visible = true;
            this.§1t5079s0§.visible = true;
         }
         else
         {
            this.inventory = §1t1523s0§.§1t9368s0§;
            this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
            this.§1t5058s0§.visible = false;
            this.§1t5055s0§.visible = false;
            this.§1t5983s0§.visible = false;
            this.§1t5079s0§.visible = false;
         }
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         this.§1t5089s0§ = 0;
         this.§1t5090s0§ = null;
         this.§1t5091s0§ = null;
         this.§1t5092s0§ = -1;
         this.§1t5117s0§();
         this.§1t6019s0§();
         this.§1t5004s0§();
         this.visible = true;
         this.§1t5969s0§.§1t5041s0§(§1t1523s0§.§1t9474s0§);
         this.§1t5052s0§.§1t6859s0§.text = "";
         setChildIndex(this.§1t5052s0§,numChildren - 1);
         §1t1623s0§.instance.§1t1630s0§();
         if(this.§1t6013s0§ == null)
         {
            this.§1t5995s0§.§1t5491s0§(§1t1523s0§.§1t9732s0§());
         }
         this.§1t6013s0§ = §1t1523s0§.§1t9732s0§();
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.§1t6014s0§.visible = false;
         this.§1t6014s0§.prompt.text = §1t1521s0§.getString(249);
         this.loading.visible = false;
         setChildIndex(this.§1t6014s0§,numChildren - 1);
         setChildIndex(this.loading,numChildren - 1);
         this.§1t6014s0§.§1t5366s0§.addEventListener(MouseEvent.CLICK,this.§1t6033s0§);
         this.§1t6014s0§.§1t5365s0§.addEventListener(MouseEvent.CLICK,this.§1t6032s0§);
         this.§1t6014s0§.§1t5366s0§.§1t5004s0§();
         this.§1t6014s0§.§1t5365s0§.§1t5004s0§();
         this.allstatsbutton.visible = true;
         this.§1t6039s0§(false);
         this.§1t5986s0§.chatbutton.visible = true;
         this.statPoints.visible = true;
         this.statsPanel.visible = true;
         this.§1t5992s0§.visible = false;
      }
      
      public function §1t6016s0§(param1:Boolean) : *
      {
         this.§1t5809s0§ = param1;
         this.show(this.§1t5999s0§);
         this.§1t5021s0§.text = §1t1521s0§.getString(247);
         this.§1t5973s0§.§1t5769s0§(§1t1521s0§.getString(228));
         this.§1t5996s0§ = new Vector.<§1t17s0§>();
         this.§1t6014s0§.prompt.text = §1t1521s0§.getString(250) + §1t406s0§.instance.§1t6499s0§.§1t6742s0§ + "?";
         this.allstatsbutton.visible = false;
         §1t1525s0§.§1t9940s0§().visible = false;
         this.§1t5986s0§.chatbutton.visible = false;
         this.statPoints.visible = false;
      }
      
      public function §1t6017s0§(param1:§1t29s0§) : *
      {
         this.§1t6015s0§ = param1;
         this.show(this.§1t6001s0§);
      }
      
      public function §1t6018s0§(param1:§1t29s0§) : *
      {
         this.§1t6015s0§ = param1;
         this.show(this.§1t6000s0§);
         this.§1t5021s0§.text = §1t1521s0§.getString(22092);
         this.allstatsbutton.visible = false;
         this.§1t5986s0§.chatbutton.visible = false;
         this.statPoints.visible = false;
         this.statsPanel.visible = false;
         this.§1t5992s0§.visible = true;
         this.§1t6042s0§();
         this.§1t5995s0§.§1t5491s0§(this.§1t6015s0§.§1t1258s0§());
         this.§1t6013s0§ = null;
         §1t412s0§.instance.visible = false;
      }
      
      public function §1t5117s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t394s0§ = null;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
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
               if(this.inventory[_loc5_].§1t484s0§() > 1 && !this.inventory[_loc5_].§1t498s0§() && this.inventory[_loc5_].uses == 0 && !this.inventory[_loc5_].§1t475s0§)
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
               }
               else
               {
                  _loc4_.§1t6786s0§(false);
               }
            }
            _loc6_++;
         }
         this.§1t6041s0§();
         if(this.§1t5997s0§ == this.§1t6000s0§)
         {
            _loc7_ = 0;
            _loc8_ = int(this.inventory.length);
            _loc6_ = 0;
            while(_loc6_ < _loc8_)
            {
               _loc7_ += this.inventory[_loc6_].§1t545s0§();
               _loc6_++;
            }
            _loc9_ = §1t1523s0§.§1t9630s0§();
            this.§1t5046s0§.text = §1t1521s0§.getString(139) + ": " + _loc7_ + " / " + _loc9_;
            if(_loc7_ > _loc9_)
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
      }
      
      internal function §1t5119s0§() : String
      {
         var _loc1_:int = §1t1523s0§.§1t1088s0§();
         return "(total dmg: " + _loc1_ + " - " + (_loc1_ + §1t1523s0§.§1t9591s0§()) + ")";
      }
      
      public function §1t6019s0§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:§1t17s0§ = null;
         var _loc3_:§1t394s0§ = null;
         var _loc4_:int = 0;
         while(_loc4_ < 9)
         {
            switch(_loc4_)
            {
               case 0:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9442s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9442s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0)
                  {
                     this.hatIcon.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6002s0§];
                  break;
               case 1:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9439s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9439s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0 || _loc2_.§1t483s0§() == 4001 || _loc2_.§1t483s0§() == 4000)
                  {
                     this.§1t5968s0§.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6004s0§];
                  break;
               case 2:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9440s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9440s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0)
                  {
                     this.glovesIcon.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6005s0§];
                  break;
               case 3:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9446s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9446s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0 || _loc2_.§1t483s0§() == 11001)
                  {
                     this.pantsIcon.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6006s0§];
                  break;
               case 4:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9444s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9444s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0)
                  {
                     this.maskIcon.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6003s0§];
                  break;
               case 5:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0)
                  {
                     this.weaponIcon.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6007s0§];
                  break;
               case 6:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9447s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9447s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0)
                  {
                     this.shoesIcon.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6009s0§];
                  break;
               case 7:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9450s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9450s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0)
                  {
                     this.acc1Icon.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6008s0§];
                  break;
               case 8:
                  if(this.§1t5997s0§ == this.§1t6000s0§)
                  {
                     _loc2_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9451s0§];
                  }
                  else
                  {
                     _loc2_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9451s0§];
                  }
                  if(_loc2_.§1t483s0§() == 0)
                  {
                     this.acc2Icon.visible = true;
                  }
                  _loc3_ = this.§1t6012s0§[this.§1t6010s0§];
            }
            if(_loc2_.§1t483s0§() != 0 && _loc2_.§1t483s0§() != 4001 && _loc2_.§1t483s0§() != 4000 && _loc2_.§1t483s0§() != 11001)
            {
               _loc3_.§1t6872s0§(_loc2_.§1t483s0§(),_loc2_.§1t508s0§(),_loc2_.§1t527s0§(),_loc2_.§1t528s0§());
               _loc3_.setItem(_loc2_);
               _loc3_.§1t6786s0§(false);
               _loc3_.§1t6870s0§("");
            }
            else
            {
               _loc3_.visible = false;
            }
            _loc4_++;
         }
      }
      
      public function §1t6020s0§() : §1t75s0§
      {
         return this.§1t5995s0§;
      }
      
      public function §1t5004s0§() : void
      {
         this.§1t5049s0§.addEventListener(MouseEvent.CLICK,this.§1t5131s0§);
         this.§1t5049s0§.§1t5004s0§();
         this.§1t5973s0§.addEventListener(MouseEvent.CLICK,this.§1t6031s0§);
         this.§1t5973s0§.§1t5004s0§();
         this.closeWindow.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5969s0§.addEventListener(MouseEvent.CLICK,this.§1t6045s0§);
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
         _loc1_ = 0;
         while(_loc1_ < this.§1t6011s0§)
         {
            this.§1t6012s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t6035s0§);
            this.§1t6012s0§[_loc1_].addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6036s0§);
            this.§1t6012s0§[_loc1_].§1t5004s0§();
            this.§1t6012s0§[_loc1_].addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t6012s0§[_loc1_].addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         stage.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5052s0§.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5986s0§.chatbutton.addEventListener(MouseEvent.CLICK,this.§1t6037s0§);
         this.allstatsbutton.addEventListener(MouseEvent.CLICK,this.§1t6038s0§);
         this.allstatsbutton.§1t5004s0§();
         this.§1t5047s0§.addChild(§1t406s0§.instance.§1t6523s0§);
         this.§1t5058s0§.addEventListener(MouseEvent.CLICK,this.§1t5124s0§);
      }
      
      public function removeEventListeners() : void
      {
         this.§1t5049s0§.removeEventListener(MouseEvent.CLICK,this.§1t5131s0§);
         this.§1t5049s0§.removeEventListeners();
         this.§1t5973s0§.removeEventListener(MouseEvent.CLICK,this.§1t6031s0§);
         this.§1t5973s0§.removeEventListeners();
         this.closeWindow.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5969s0§.removeEventListener(MouseEvent.CLICK,this.§1t6045s0§);
         this.§1t5062s0§.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5061s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         this.§1t5986s0§.removeEventListener(MouseEvent.CLICK,this.§1t6022s0§);
         this.§1t5047s0§.removeEventListener(MouseEvent.CLICK,this.§1t6022s0§);
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
         while(_loc1_ < this.§1t6011s0§)
         {
            this.§1t6012s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t6035s0§);
            this.§1t6012s0§[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6036s0§);
            this.§1t6012s0§[_loc1_].removeEventListeners();
            this.§1t6012s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t6012s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            _loc1_++;
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5052s0§.removeEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5986s0§.chatbutton.removeEventListener(MouseEvent.CLICK,this.§1t6037s0§);
         this.§1t6014s0§.§1t5366s0§.removeEventListener(MouseEvent.CLICK,this.§1t6033s0§);
         this.§1t6014s0§.§1t5365s0§.removeEventListener(MouseEvent.CLICK,this.§1t6032s0§);
         this.§1t6014s0§.§1t5366s0§.removeEventListeners();
         this.§1t6014s0§.§1t5365s0§.removeEventListeners();
         this.allstatsbutton.removeEventListener(MouseEvent.CLICK,this.§1t6038s0§);
         this.allstatsbutton.removeEventListeners();
         this.§1t5058s0§.addEventListener(MouseEvent.CLICK,this.§1t5124s0§);
      }
      
      public function §1t5120s0§(param1:MouseEvent) : void
      {
         if(this.§1t5089s0§ > 0)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            --this.§1t5089s0§;
            this.§1t5117s0§();
         }
      }
      
      public function §1t5121s0§(param1:MouseEvent) : void
      {
         if(this.§1t5089s0§ < this.§1t5088s0§)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            ++this.§1t5089s0§;
            this.§1t5117s0§();
         }
      }
      
      internal function §1t5127s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5986s0§.§1t15864s0§.scrollV == this.§1t5986s0§.§1t15864s0§.numLines - 7)
         {
            this.§1t5986s0§.§1t15864s0§.scrollV = 0;
         }
         else
         {
            ++this.§1t5986s0§.§1t15864s0§.scrollV;
         }
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
         }
         if(§1t1540s0§.§1t10014s0§())
         {
            §1t6427s0§.refreshMap();
            §1t6427s0§.§1t12471s0§();
            §1t6427s0§.§1t12473s0§(true);
         }
         else if(this.§1t5997s0§ == this.§1t6000s0§)
         {
            this.§1t6015s0§.§1t927s0§ = true;
            §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
            §1t114s0§.instance.§1t1539s0§();
            §1t412s0§.instance.§1t7551s0§.show(this.§1t6015s0§);
            this.§1t6015s0§ = null;
            §1t412s0§.instance.visible = true;
         }
         else if(this.§1t5997s0§ == this.§1t6001s0§)
         {
            §1t412s0§.instance.§1t7551s0§.show(this.§1t6015s0§);
            this.§1t6015s0§ = null;
            §1t412s0§.instance.visible = true;
         }
         else
         {
            _loc2_ = §1t1523s0§.§1t9732s0§();
            if(this.§1t6013s0§ != _loc2_)
            {
               §1t251s0§.instance.§1t3530s0§(_loc2_);
            }
            §1t251s0§.instance.§1t3532s0§(false);
            if(this.§1t5997s0§ == this.§1t5999s0§)
            {
               _loc3_ = int(this.§1t5996s0§.length);
               if(_loc3_ > 0)
               {
                  _loc4_ = "";
                  _loc5_ = 0;
                  while(_loc5_ < _loc3_)
                  {
                     if(_loc5_ == _loc3_ - 1)
                     {
                        _loc4_ += this.§1t5996s0§[_loc5_].§1t490s0§();
                     }
                     else
                     {
                        _loc4_ += this.§1t5996s0§[_loc5_].§1t490s0§() + "|";
                     }
                     _loc5_++;
                  }
                  §1t3317s0§.instance.§1t1887s0§(§1t406s0§.instance.§1t6499s0§.§1t6742s0§,§1t1523s0§.charname,_loc4_,0,this.§1t5809s0§);
               }
               §1t406s0§.instance.§1t6499s0§.visible = true;
               §1t1525s0§.§1t9940s0§().visible = true;
            }
            else if(this.§1t5997s0§ == this.§1t5998s0§)
            {
               §1t1541s0§.§1t10045s0§();
               this.visible = false;
               §1t406s0§.instance.§1t6614s0§();
            }
            §1t406s0§.instance.§1t6578s0§();
         }
         §1t3317s0§.instance.§1t1946s0§();
         this.§1t6022s0§(null);
         this.removeEventListeners();
         this.visible = false;
         §1t6495s0§.instance.§1t1023s0§(0);
         this.§1t6055s0§();
      }
      
      internal function §1t6021s0§() : *
      {
         this.§1t5986s0§.visible = true;
         this.statsPanel.visible = false;
         this.§1t5992s0§.visible = false;
         this.§1t5986s0§.addEventListener(MouseEvent.CLICK,this.§1t6022s0§);
         this.§1t5047s0§.addEventListener(MouseEvent.CLICK,this.§1t6022s0§);
         this.§1t5051s0§.addEventListener(MouseEvent.CLICK,this.§1t5127s0§);
         if(this.allstatstext.visible)
         {
            this.§1t6040s0§();
         }
      }
      
      internal function §1t6022s0§(param1:MouseEvent) : *
      {
         this.§1t5986s0§.§1t15863s0§.text = "";
         this.§1t5986s0§.§1t15864s0§.htmlText = "";
         this.§1t5986s0§.§1t6879s0§.text = "";
         this.§1t5986s0§.removeEventListener(MouseEvent.CLICK,this.§1t6022s0§);
         this.§1t5051s0§.removeEventListener(MouseEvent.CLICK,this.§1t5127s0§);
         if(this.§1t5090s0§ != null)
         {
            this.§1t5090s0§.§1t6786s0§(false);
            this.§1t5090s0§ = null;
            this.§1t5091s0§ = null;
         }
         this.§1t5092s0§ = -1;
         this.§1t5049s0§.visible = false;
         this.§1t5973s0§.visible = false;
         this.§1t5986s0§.visible = false;
         if(this.§1t5997s0§ == this.§1t6000s0§)
         {
            this.§1t5992s0§.visible = true;
         }
         else
         {
            this.statsPanel.visible = true;
         }
         this.§1t5051s0§.visible = false;
         if(this.allstatstext.visible)
         {
            this.§1t6040s0§();
         }
      }
      
      internal function §1t5130s0§(param1:int) : *
      {
         switch(param1)
         {
            case §1t12340s0§:
               this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(69));
               break;
            case §1t12342s0§:
               this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(70));
               break;
            case §1t12341s0§:
               this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(71));
               break;
            case §1t12370s0§:
               this.§1t5049s0§.§1t5769s0§(§1t1521s0§.getString(11109));
         }
         this.§1t5094s0§ = param1;
      }
      
      public function §1t5131s0§(param1:MouseEvent) : *
      {
         switch(this.§1t5094s0§)
         {
            case §1t12340s0§:
               this.§1t6024s0§();
               break;
            case §1t12342s0§:
               this.§1t6029s0§();
               break;
            case §1t12341s0§:
               this.§1t6023s0§();
               break;
            case §1t12370s0§:
               this.§1t6034s0§();
         }
      }
      
      public function §1t6023s0§() : void
      {
         if(this.§1t5997s0§ == this.§1t6000s0§ && §1t1523s0§.§1t9629s0§())
         {
            §1t406s0§.instance.§1t6530s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_equip");
         switch(this.§1t5090s0§)
         {
            case this.§1t6012s0§[this.§1t6002s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9442s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9442s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9442s0§);
                  §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
               }
               this.hatIcon.visible = true;
               break;
            case this.§1t6012s0§[this.§1t6004s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9439s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9439s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9439s0§);
                  §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
               }
               this.§1t5968s0§.visible = true;
               break;
            case this.§1t6012s0§[this.§1t6003s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9444s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9444s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9444s0§);
                  §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
               }
               this.maskIcon.visible = true;
               break;
            case this.§1t6012s0§[this.§1t6005s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9440s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9440s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9440s0§);
               }
               this.glovesIcon.visible = true;
               break;
            case this.§1t6012s0§[this.§1t6007s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9448s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9448s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9448s0§);
               }
               this.weaponIcon.visible = true;
               break;
            case this.§1t6012s0§[this.§1t6006s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9446s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9446s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9446s0§);
               }
               this.pantsIcon.visible = true;
               break;
            case this.§1t6012s0§[this.§1t6009s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9447s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9447s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9447s0§);
               }
               this.shoesIcon.visible = true;
               break;
            case this.§1t6012s0§[this.§1t6008s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9450s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9450s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9450s0§);
               }
               this.acc1Icon.visible = true;
               break;
            case this.§1t6012s0§[this.§1t6010s0§]:
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9451s0§);
               }
               if(this.§1t5997s0§ == this.§1t6000s0§)
               {
                  this.§1t6015s0§.§1t7359s0§(§1t1523s0§.§1t9451s0§);
               }
               else
               {
                  §1t1523s0§.§1t7359s0§(§1t1523s0§.§1t9451s0§);
               }
               this.acc2Icon.visible = true;
         }
         if(this.§1t5091s0§.§1t484s0§() == 0)
         {
            this.§1t5091s0§.§1t485s0§(1);
         }
         if(this.§1t5997s0§ == this.§1t6000s0§)
         {
            §1t1523s0§.§1t9628s0§(this.§1t5091s0§);
            this.inventory = §1t1523s0§.§1t9375s0§;
         }
         else
         {
            §1t1523s0§.§1t7693s0§(this.§1t5091s0§);
            this.inventory = §1t1523s0§.§1t9368s0§;
            this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
         }
         this.§1t5090s0§.§1t6786s0§(false);
         this.§1t5090s0§.itemMCS.clearItem();
         this.§1t5090s0§.visible = false;
         this.§1t5986s0§.visible = false;
         this.§1t5986s0§.removeEventListener(MouseEvent.CLICK,this.§1t6022s0§);
         this.§1t5986s0§.§1t15863s0§.htmlText = "";
         this.§1t5986s0§.§1t15864s0§.htmlText = "";
         this.§1t5986s0§.§1t6879s0§.text = "";
         this.§1t5049s0§.visible = false;
         this.§1t5090s0§ = null;
         this.§1t5091s0§ = null;
         this.§1t5092s0§ = -1;
         if(this.§1t5997s0§ == this.§1t6000s0§)
         {
            this.§1t6015s0§.§1t7363s0§();
            this.§1t5992s0§.visible = true;
         }
         else
         {
            this.statsPanel.visible = true;
            §1t1523s0§.§1t7363s0§();
            §1t406s0§.instance.§1t6578s0§();
         }
         this.§1t5117s0§();
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
      }
      
      internal function §1t5390s0§() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t5091s0§.§1t483s0§());
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.modifierXML.length())
         {
            _loc2_ = int(_loc1_.modifierXML[_loc3_].id);
            if(_loc2_ == 25 || _loc2_ == 84 || _loc2_ == 132 || _loc2_ == 103 || _loc2_ == 106 || _loc2_ == 104 || _loc2_ == 34 || _loc2_ == 134)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function §1t6024s0§() : *
      {
         if(this.§1t5997s0§ != this.§1t5998s0§)
         {
            return;
         }
         if(this.§1t5390s0§())
         {
            if(!§1t251s0§.instance.§1t3595s0§())
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return;
            }
            this.loading.visible = true;
            §1t251s0§.instance.§1t3547s0§(this.§1t6025s0§);
         }
         else
         {
            this.§1t6026s0§();
         }
      }
      
      internal function §1t6025s0§() : *
      {
         if(!this.loading.visible)
         {
            return;
         }
         this.loading.visible = false;
         this.§1t6026s0§();
      }
      
      public function §1t6026s0§() : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:§1t17s0§ = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = undefined;
         var _loc10_:Point = null;
         var _loc11_:§1t71s0§ = null;
         var _loc12_:§1t17s0§ = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc1_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t5091s0§.§1t483s0§());
         if(this.§1t5091s0§.§1t483s0§() == 2129)
         {
            if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9231s0§)
            {
               return;
            }
            _loc5_ = this.§1t5091s0§.§1t523s0§(102);
            if(_loc5_ == 0)
            {
               _loc5_ = 8382465;
            }
            this.§1t6027s0§();
            this.§1t5026s0§(null);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(_loc5_);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12486s0§);
            return;
         }
         if(this.§1t5091s0§.§1t483s0§() == 2213)
         {
            _loc6_ = this.§1t5091s0§;
            this.§1t5026s0§(null);
            §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12365s0§,0,_loc6_);
            return;
         }
         if(this.§1t5091s0§.§1t483s0§() == 2214)
         {
            if(§1t1523s0§.§1t9553s0§() < 9)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(827),§1t1521s0§.getString(5));
               return;
            }
            _loc6_ = this.§1t5091s0§;
            this.§1t5026s0§(null);
            §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12366s0§,0,_loc6_);
            return;
         }
         var _loc2_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.modifierXML.length())
         {
            _loc3_ = int(_loc1_.modifierXML[_loc4_].id);
            if(_loc3_ == 9)
            {
               §1t1523s0§.§1t9576s0§(_loc1_.modifierXML[_loc4_].value);
            }
            else
            {
               if(_loc3_ == 25)
               {
                  if(§1t1523s0§.getLevel() > §1t1523s0§.§1t9470s0§ || §1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§ && §1t1523s0§.§1t9518s0§)
                  {
                     §1t3317s0§.instance.§1t1982s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8901s0§));
                     return;
                  }
                  if(§1t1523s0§.getLevel() == §1t1523s0§.§1t9470s0§)
                  {
                     this.§1t5026s0§(null);
                     §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12355s0§);
                     return;
                  }
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(185),§1t1521s0§.getString(5));
                  return;
               }
               if(_loc3_ == 90)
               {
                  this.§1t5026s0§(null);
                  §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12361s0§);
                  return;
               }
               if(_loc3_ == 97)
               {
                  §1t1523s0§.§1t9601s0§();
                  §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
               }
               else
               {
                  if(_loc3_ == 98)
                  {
                     §1t1523s0§.§1t9599s0§();
                     §1t1523s0§.§1t9368s0§ = new Vector.<§1t17s0§>();
                     §1t1523s0§.§1t9712s0§(1009,10);
                     §1t1523s0§.§1t9712s0§(11,1000);
                     §1t406s0§.instance.§1t6488s0§.§1t5845s0§(2201,§1t1523s0§.getLevel(),1);
                     §1t406s0§.instance.§1t6488s0§.§1t5845s0§(2206,§1t1523s0§.getLevel(),10);
                     _loc7_ = 0;
                     while(_loc7_ < 20)
                     {
                        §1t406s0§.instance.§1t6488s0§.§1t6194s0§(§1t1523s0§.getLevel(),true,true);
                        _loc7_++;
                     }
                     §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
                     §1t406s0§.instance.§1t6488s0§.§1t5486s0§();
                     §1t406s0§.instance.§1t6488s0§.show();
                     §1t406s0§.instance.§1t6488s0§.§1t5484s0§(null);
                     this.inventory = §1t1523s0§.§1t9368s0§.concat(§1t1523s0§.§1t9369s0§);
                     this.show();
                     §1t1523s0§.§1t9374s0§.fixed = false;
                     §1t1523s0§.§1t9374s0§.length = 0;
                     §1t1523s0§.§1t9374s0§.fixed = true;
                     §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(8382465,150,0);
                     §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12486s0§);
                     return;
                  }
                  if(_loc3_ == 99)
                  {
                     §1t1523s0§.§1t9578s0§();
                  }
                  else
                  {
                     if(_loc3_ == 101)
                     {
                        this.§1t5026s0§(null);
                        §1t406s0§.instance.§1t6504s0§.show(§1t5313s0§.§1t12345s0§);
                        return;
                     }
                     if(_loc3_ == 102)
                     {
                        this.§1t6027s0§();
                        this.§1t5026s0§(null);
                        §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(_loc1_.modifierXML[_loc4_].value,0,0);
                        §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12486s0§);
                        return;
                     }
                     if(_loc3_ == 78)
                     {
                        §1t1523s0§.§1t9598s0§();
                     }
                     else if(_loc3_ == 79)
                     {
                        §1t1523s0§.§1t6950s0§();
                     }
                     else if(_loc3_ == 82)
                     {
                        §1t1523s0§.§1t9635s0§(_loc1_.modifierXML[_loc4_].value);
                        §1t1523s0§.§1t1684s0§(60005,1);
                     }
                     else if(_loc3_ == 84)
                     {
                        §1t406s0§.instance.§1t6488s0§.§1t6194s0§(§1t1523s0§.getLevel(),true,true);
                        §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
                        §1t406s0§.instance.§1t6488s0§.§1t5486s0§();
                        §1t406s0§.instance.§1t6488s0§.show();
                        this.inventory = §1t1523s0§.§1t9368s0§.concat(§1t1523s0§.§1t9369s0§);
                     }
                     else if(_loc3_ == 132)
                     {
                        §1t406s0§.instance.§1t5947s0§.§1t5891s0§();
                        §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
                        §1t406s0§.instance.§1t6488s0§.§1t5486s0§();
                        §1t406s0§.instance.§1t6488s0§.show();
                        this.inventory = §1t1523s0§.§1t9368s0§.concat(§1t1523s0§.§1t9369s0§);
                     }
                     else if(_loc3_ == 103)
                     {
                        §1t406s0§.instance.§1t6488s0§.§1t6182s0§(_loc1_.modifierXML[_loc4_].value,§1t1523s0§.getLevel(),1,true,true);
                     }
                     else if(_loc3_ == 106)
                     {
                        §1t406s0§.instance.§1t6488s0§.§1t6186s0§(_loc1_.modifierXML[_loc4_].value,1);
                     }
                     else if(_loc3_ == 104)
                     {
                        §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
                        §1t406s0§.instance.§1t6488s0§.§1t5486s0§();
                        §1t406s0§.instance.§1t6488s0§.show();
                        this.inventory = §1t1523s0§.§1t9368s0§.concat(§1t1523s0§.§1t9369s0§);
                     }
                     else if(_loc3_ == 105)
                     {
                        _loc8_ = §1t3317s0§.instance.§1t1848s0§();
                        §1t1644s0§.instance.§1t1658s0§(_loc8_);
                     }
                     else if(_loc3_ == 34)
                     {
                        _loc9_ = _loc1_.modifierXML[_loc4_].value.split(",");
                        §1t1523s0§.§1t9633s0§(_loc9_[0],_loc9_[1]);
                     }
                     else
                     {
                        if(_loc3_ == 96)
                        {
                           if(§1t1525s0§.§1t9923s0§() == 8 || §1t1525s0§.§1t9935s0§() == §1t132s0§.§1t11336s0§)
                           {
                              §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(714),§1t1521s0§.getString(5));
                              return;
                           }
                           _loc10_ = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
                           _loc11_ = §1t70s0§.instance.§1t1126s0§(_loc10_.x,_loc10_.y,false);
                           if(Boolean(_loc11_.§1t1318s0§(§1t1525s0§.§1t9935s0§())) && Boolean(_loc11_.§1t1328s0§()) && §1t1525s0§.§1t7341s0§() > 0)
                           {
                              §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(714),§1t1521s0§.getString(5));
                              return;
                           }
                           this.§1t5026s0§(null);
                           _loc5_ = _loc11_.§1t1304s0§();
                           §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(_loc5_,0,400);
                           §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12486s0§);
                           return;
                        }
                        if(_loc3_ == 117)
                        {
                           §1t1523s0§.§1t9374s0§.fixed = false;
                           §1t1523s0§.§1t9374s0§.length = 0;
                           §1t1523s0§.§1t9374s0§.fixed = true;
                           §1t1523s0§.§1t9373s0§.fixed = false;
                           §1t1523s0§.§1t9373s0§.length = 0;
                           §1t1523s0§.§1t9373s0§.fixed = true;
                           §1t1523s0§.§1t9712s0§(30000,0);
                           §1t1523s0§.§1t9712s0§(40000,0);
                           §1t1523s0§.§1t9712s0§(40002,0);
                           §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9682s0§);
                           §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9681s0§);
                           this.§1t6027s0§();
                           this.§1t5026s0§(null);
                           §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(8382465,0,150);
                           §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12487s0§);
                           return;
                        }
                        if(_loc3_ == 122)
                        {
                           this.§1t5026s0§(null);
                           §1t406s0§.instance.§1t6568s0§();
                           return;
                        }
                        if(_loc3_ == 123)
                        {
                           if(§1t1523s0§.§1t9553s0§() < 9)
                           {
                              §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(827),§1t1521s0§.getString(5));
                              return;
                           }
                           this.§1t5026s0§(null);
                           §1t406s0§.instance.§1t6572s0§(false);
                           return;
                        }
                        if(_loc3_ == 124)
                        {
                           this.§1t5026s0§(null);
                           §1t406s0§.instance.§1t6572s0§(true);
                           return;
                        }
                        if(_loc3_ == 133)
                        {
                           _loc12_ = this.§1t5091s0§;
                           this.§1t5026s0§(null);
                           §1t1541s0§.§1t10099s0§();
                           §1t406s0§.instance.§1t6470s0§.show();
                           §1t406s0§.instance.§1t6470s0§.§1t5401s0§(_loc12_);
                           return;
                        }
                        if(_loc3_ == 134)
                        {
                           _loc13_ = Math.random() * 5;
                           if(_loc13_ <= 2)
                           {
                              _loc13_ = Math.random() * 7;
                              if(_loc13_ == 0)
                              {
                                 _loc14_ = 20114;
                              }
                              else if(_loc13_ == 1)
                              {
                                 _loc14_ = 20116;
                              }
                              else if(_loc13_ == 2)
                              {
                                 _loc14_ = 20118;
                              }
                              else if(_loc13_ == 3)
                              {
                                 _loc14_ = 20120;
                              }
                              else if(_loc13_ == 4)
                              {
                                 _loc14_ = 20122;
                              }
                              else if(_loc13_ == 5)
                              {
                                 _loc14_ = 20124;
                              }
                              else if(_loc13_ == 6)
                              {
                                 _loc14_ = 20126;
                              }
                           }
                           else
                           {
                              _loc13_ = Math.random() * 7;
                              if(_loc13_ == 0)
                              {
                                 _loc14_ = 20115;
                              }
                              else if(_loc13_ == 1)
                              {
                                 _loc14_ = 20117;
                              }
                              else if(_loc13_ == 2)
                              {
                                 _loc14_ = 20119;
                              }
                              else if(_loc13_ == 3)
                              {
                                 _loc14_ = 20121;
                              }
                              else if(_loc13_ == 4)
                              {
                                 _loc14_ = 20123;
                              }
                              else if(_loc13_ == 5)
                              {
                                 _loc14_ = 20125;
                              }
                              else if(_loc13_ == 6)
                              {
                                 _loc14_ = 20127;
                              }
                           }
                           §1t406s0§.instance.§1t6488s0§.§1t6186s0§(_loc14_,1);
                           _loc2_ = true;
                        }
                        else if(_loc3_ == 38)
                        {
                           if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9231s0§ || §1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9460s0§) || §1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9461s0§))
                           {
                              §1t88s0§.instance.§1t1516s0§("Snd_error");
                              return;
                           }
                           §1t1523s0§.§1t9726s0§(_loc1_.modifierXML[_loc4_].value,30 * 60);
                        }
                        else if(_loc3_ < 2000)
                        {
                           §1t1523s0§.§1t9713s0§(_loc3_,_loc1_.modifierXML[_loc4_].value);
                        }
                        else if(_loc3_ >= 30000)
                        {
                           §1t1523s0§.§1t9712s0§(_loc3_,_loc1_.modifierXML[_loc4_].value);
                        }
                        else
                        {
                           §1t1523s0§.§1t9642s0§(_loc3_,_loc1_.modifierXML[_loc4_].value);
                        }
                     }
                  }
               }
            }
            _loc4_++;
         }
         this.§1t6027s0§();
         §1t1523s0§.§1t7363s0§();
         this.§1t6041s0§();
         §1t406s0§.instance.§1t6578s0§();
         this.§1t5117s0§();
         this.§1t6022s0§(null);
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(_loc2_)
         {
            §1t3317s0§.instance.§1t1946s0§();
         }
      }
      
      public function §1t6027s0§() : void
      {
         var _loc1_:int = 0;
         if(this.§1t5091s0§.§1t543s0§())
         {
            _loc1_ = §1t1523s0§.§1t9642s0§(this.§1t5091s0§.§1t483s0§(),-1);
         }
         else
         {
            _loc1_ = 0;
            §1t1523s0§.§1t7692s0§(this.§1t5091s0§);
         }
         if(_loc1_ <= 0)
         {
            this.inventory = §1t1523s0§.§1t9368s0§;
            this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
            this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
            if(this.§1t5088s0§ < 0)
            {
               this.§1t5089s0§ = 0;
               this.§1t5088s0§ = 0;
            }
            this.§1t6022s0§(null);
            this.§1t5117s0§();
         }
         else
         {
            this.§1t5090s0§.§1t6870s0§("x" + _loc1_.toString());
            this.§1t5090s0§.visible = true;
            this.§1t5117s0§();
         }
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
      }
      
      public function §1t6028s0§() : void
      {
         var _loc1_:int = 0;
         if(this.§1t5091s0§.§1t543s0§())
         {
            _loc1_ = §1t1523s0§.§1t9641s0§(this.§1t5091s0§.§1t483s0§(),-1);
         }
         else
         {
            _loc1_ = 0;
            §1t1523s0§.§1t9632s0§(this.§1t5091s0§);
         }
         if(_loc1_ <= 0)
         {
            this.inventory = §1t1523s0§.§1t9375s0§;
            this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
            if(this.§1t5088s0§ < 0)
            {
               this.§1t5089s0§ = 0;
               this.§1t5088s0§ = 0;
            }
            this.§1t6022s0§(null);
            this.§1t5117s0§();
         }
         else
         {
            this.§1t5090s0§.§1t6870s0§("x" + _loc1_.toString());
            this.§1t5090s0§.visible = true;
            this.§1t5117s0§();
         }
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9690s0§);
      }
      
      public function §1t6029s0§() : void
      {
         var _loc3_:§1t17s0§ = null;
         var _loc4_:§1t394s0§ = null;
         if(this.§1t5997s0§ == this.§1t6000s0§)
         {
            this.§1t6030s0§();
            return;
         }
         if(this.§1t5091s0§.getLevel() > §1t1523s0§.getLevel())
         {
            §1t406s0§.§1t9190s0§().§1t6527s0§(§1t1521s0§.getString(185),§1t1521s0§.getString(5));
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_equip");
         var _loc1_:int = this.§1t5091s0§.§1t483s0§();
         var _loc2_:§1t17s0§ = this.§1t5091s0§;
         var _loc5_:int = Math.floor(_loc1_ / 1000);
         if(§1t1524s0§.§1t9862s0§(_loc2_.§1t483s0§()).unique == 1)
         {
            switch(§1t1524s0§.§1t9862s0§(_loc2_.§1t483s0§()).type)
            {
               case 11:
                  _loc5_ = 3;
                  break;
               case 0:
                  _loc5_ = 4;
                  break;
               case 1:
                  _loc5_ = 5;
                  break;
               case 3:
                  _loc5_ = 7;
                  break;
               case 5:
                  _loc5_ = 9;
                  break;
               case 7:
                  _loc5_ = 11;
                  break;
               case 8:
                  _loc5_ = 12;
                  break;
               case 9:
                  _loc5_ = 13;
            }
         }
         switch(_loc5_)
         {
            case 3:
               if(§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9450s0§].§1t483s0§() == 0)
               {
                  _loc3_ = new §1t17s0§(0);
                  _loc4_ = this.§1t6012s0§[this.§1t6008s0§];
                  this.acc1Icon.visible = false;
                  §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9450s0§,_loc2_);
               }
               else if(§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9451s0§].§1t483s0§() == 0)
               {
                  _loc3_ = new §1t17s0§(0);
                  _loc4_ = this.§1t6012s0§[this.§1t6010s0§];
                  this.acc2Icon.visible = false;
                  §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9451s0§,_loc2_);
               }
               else
               {
                  _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9450s0§];
                  _loc4_ = this.§1t6012s0§[this.§1t6008s0§];
                  this.acc1Icon.visible = false;
                  §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9450s0§,_loc2_);
               }
               break;
            case 4:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9439s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6004s0§];
               if(_loc3_.§1t483s0§() == 4001 || _loc3_.§1t483s0§() == 4000)
               {
                  _loc3_ = new §1t17s0§(0);
               }
               this.§1t5968s0§.visible = false;
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9439s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9439s0§,_loc2_);
               }
               §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
               break;
            case 5:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9440s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6005s0§];
               this.glovesIcon.visible = false;
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9440s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9440s0§,_loc2_);
               }
               break;
            case 7:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9442s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6002s0§];
               this.hatIcon.visible = false;
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9442s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9442s0§,_loc2_);
               }
               §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
               break;
            case 9:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9444s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6003s0§];
               this.maskIcon.visible = false;
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9444s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9444s0§,_loc2_);
               }
               §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
               break;
            case 11:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9446s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6006s0§];
               if(_loc3_.§1t483s0§() == 11001)
               {
                  _loc3_ = new §1t17s0§(0);
               }
               this.pantsIcon.visible = false;
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9446s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9446s0§,_loc2_);
               }
               break;
            case 12:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9447s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6009s0§];
               this.shoesIcon.visible = false;
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9447s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9447s0§,_loc2_);
               }
               break;
            case 13:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6007s0§];
               this.weaponIcon.visible = false;
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9448s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9448s0§,_loc2_);
               }
               break;
            case 6:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9441s0§];
               if(_loc3_.§1t484s0§() == 0)
               {
                  _loc3_.§1t485s0§(1);
               }
               §1t1523s0§.§1t7693s0§(_loc3_);
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9441s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9441s0§,_loc2_);
               }
               §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
               break;
            case 8:
               _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9443s0§];
               if(_loc3_.§1t484s0§() == 0)
               {
                  _loc3_.§1t485s0§(1);
               }
               §1t1523s0§.§1t7693s0§(_loc3_);
               §1t1523s0§.§1t7361s0§(§1t1523s0§.§1t9443s0§,_loc2_);
               if(this.§1t5997s0§ == this.§1t6001s0§)
               {
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9443s0§,_loc2_);
               }
               §1t406s0§.instance.§1t6500s0§.§1t5743s0§();
         }
         if(_loc4_ != null)
         {
            _loc4_.visible = true;
            _loc4_.§1t6872s0§(_loc1_,this.§1t5091s0§.§1t508s0§(),this.§1t5091s0§.§1t527s0§(),this.§1t5091s0§.§1t528s0§());
            if(this.§1t5091s0§.§1t543s0§())
            {
               _loc4_.setItem(new §1t17s0§(_loc1_));
            }
            else
            {
               _loc4_.setItem(this.§1t5091s0§);
            }
            _loc4_.§1t6870s0§("");
            _loc4_.§1t6786s0§(false);
            if(_loc3_.§1t483s0§() != 0 && _loc3_.§1t483s0§() != 4001 && _loc3_.§1t483s0§() != 4000 && _loc3_.§1t483s0§() != 11001)
            {
               if(_loc3_.§1t484s0§() == 0)
               {
                  _loc3_.§1t485s0§(1);
               }
               else if(_loc3_.§1t484s0§() > 1)
               {
                  _loc3_ = new §1t17s0§(_loc3_.§1t483s0§());
               }
               §1t1523s0§.§1t7693s0§(_loc3_);
            }
         }
         if(§1t1524s0§.§1t9862s0§(this.§1t5091s0§.§1t483s0§()).unique == 0 && this.§1t5091s0§.§1t497s0§() == 0 && this.§1t5091s0§.uses == 0 && !this.§1t5091s0§.§1t475s0§ || this.§1t5091s0§.§1t483s0§() < 3000)
         {
            §1t1523s0§.§1t9642s0§(this.§1t5091s0§.§1t483s0§(),-1);
         }
         else
         {
            §1t1523s0§.§1t7692s0§(this.§1t5091s0§);
         }
         this.inventory = §1t1523s0§.§1t9368s0§;
         this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         if(this.§1t5088s0§ < 0)
         {
            this.§1t5089s0§ = 0;
            this.§1t5088s0§ = 0;
         }
         this.§1t6022s0§(null);
         this.§1t6041s0§();
         §1t1523s0§.§1t7363s0§();
         §1t406s0§.instance.§1t6578s0§();
         this.§1t5117s0§();
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
      }
      
      public function §1t6030s0§() : void
      {
         var _loc3_:§1t17s0§ = null;
         var _loc4_:§1t394s0§ = null;
         if(this.§1t5091s0§.getLevel() > this.§1t6015s0§.§1t7323s0§(§1t24s0§.§1t8755s0§))
         {
            §1t406s0§.§1t9190s0§().§1t6527s0§(§1t1521s0§.getString(185),§1t1521s0§.getString(5));
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_equip");
         var _loc1_:int = this.§1t5091s0§.§1t483s0§();
         var _loc2_:§1t17s0§ = this.§1t5091s0§;
         var _loc5_:int = Math.floor(_loc1_ / 1000);
         if(§1t1524s0§.§1t9862s0§(_loc2_.§1t483s0§()).unique == 1)
         {
            switch(§1t1524s0§.§1t9862s0§(_loc2_.§1t483s0§()).type)
            {
               case 11:
                  _loc5_ = 3;
                  break;
               case 0:
                  _loc5_ = 4;
                  break;
               case 1:
                  _loc5_ = 5;
                  break;
               case 3:
                  _loc5_ = 7;
                  break;
               case 5:
                  _loc5_ = 9;
                  break;
               case 7:
                  _loc5_ = 11;
                  break;
               case 8:
                  _loc5_ = 12;
                  break;
               case 9:
                  _loc5_ = 13;
            }
         }
         switch(_loc5_)
         {
            case 3:
               if(this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9450s0§].§1t483s0§() == 0)
               {
                  _loc3_ = new §1t17s0§(0);
                  _loc4_ = this.§1t6012s0§[this.§1t6008s0§];
                  this.acc1Icon.visible = false;
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9450s0§,_loc2_);
               }
               else if(this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9451s0§].§1t483s0§() == 0)
               {
                  _loc3_ = new §1t17s0§(0);
                  _loc4_ = this.§1t6012s0§[this.§1t6010s0§];
                  this.acc2Icon.visible = false;
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9451s0§,_loc2_);
               }
               else
               {
                  _loc3_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9450s0§];
                  _loc4_ = this.§1t6012s0§[this.§1t6008s0§];
                  this.acc1Icon.visible = false;
                  this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9450s0§,_loc2_);
               }
               break;
            case 4:
               _loc3_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9439s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6004s0§];
               if(_loc3_.§1t483s0§() == 4001 || _loc3_.§1t483s0§() == 4000)
               {
                  _loc3_ = new §1t17s0§(0);
               }
               this.§1t5968s0§.visible = false;
               this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9439s0§,_loc2_);
               break;
            case 5:
               _loc3_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9440s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6005s0§];
               this.glovesIcon.visible = false;
               this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9440s0§,_loc2_);
               break;
            case 7:
               _loc3_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9442s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6002s0§];
               this.hatIcon.visible = false;
               this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9442s0§,_loc2_);
               break;
            case 9:
               _loc3_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9444s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6003s0§];
               this.maskIcon.visible = false;
               this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9444s0§,_loc2_);
               break;
            case 11:
               _loc3_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9446s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6006s0§];
               if(_loc3_.§1t483s0§() == 11001)
               {
                  _loc3_ = new §1t17s0§(0);
               }
               this.pantsIcon.visible = false;
               this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9446s0§,_loc2_);
               break;
            case 12:
               _loc3_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9447s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6009s0§];
               this.shoesIcon.visible = false;
               this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9447s0§,_loc2_);
               break;
            case 13:
               _loc3_ = this.§1t6015s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
               _loc4_ = this.§1t6012s0§[this.§1t6007s0§];
               this.weaponIcon.visible = false;
               this.§1t6015s0§.§1t7361s0§(§1t1523s0§.§1t9448s0§,_loc2_);
               break;
            case 6:
               §1t406s0§.§1t9190s0§().§1t6527s0§(§1t1521s0§.getString(22104),§1t1521s0§.getString(5));
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return;
            case 8:
               §1t406s0§.§1t9190s0§().§1t6527s0§(§1t1521s0§.getString(22103),§1t1521s0§.getString(5));
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return;
         }
         if(_loc4_ != null)
         {
            _loc4_.visible = true;
            _loc4_.§1t6872s0§(_loc1_,this.§1t5091s0§.§1t508s0§(),this.§1t5091s0§.§1t527s0§(),this.§1t5091s0§.§1t528s0§());
            if(this.§1t5091s0§.§1t543s0§())
            {
               _loc4_.setItem(new §1t17s0§(_loc1_));
            }
            else
            {
               _loc4_.setItem(this.§1t5091s0§);
            }
            _loc4_.§1t6870s0§("");
            _loc4_.§1t6786s0§(false);
            if(_loc3_.§1t483s0§() != 0 && _loc3_.§1t483s0§() != 4001 && _loc3_.§1t483s0§() != 4000 && _loc3_.§1t483s0§() != 11001)
            {
               if(_loc3_.§1t484s0§() == 0)
               {
                  _loc3_.§1t485s0§(1);
               }
               else if(_loc3_.§1t484s0§() > 1)
               {
                  _loc3_ = new §1t17s0§(_loc3_.§1t483s0§());
               }
               §1t1523s0§.§1t9628s0§(_loc3_);
            }
         }
         if(§1t1524s0§.§1t9862s0§(this.§1t5091s0§.§1t483s0§()).unique == 0 && this.§1t5091s0§.§1t497s0§() == 0 && this.§1t5091s0§.uses == 0 && !this.§1t5091s0§.§1t475s0§ || this.§1t5091s0§.§1t483s0§() < 3000)
         {
            §1t1523s0§.§1t9641s0§(this.§1t5091s0§.§1t483s0§(),-1);
         }
         else
         {
            §1t1523s0§.§1t9632s0§(this.§1t5091s0§);
         }
         this.inventory = §1t1523s0§.§1t9375s0§;
         this.§1t5088s0§ = Math.floor((this.inventory.length - 1) / this.§1t5102s0§);
         if(this.§1t5088s0§ < 0)
         {
            this.§1t5089s0§ = 0;
            this.§1t5088s0§ = 0;
         }
         this.§1t6022s0§(null);
         this.§1t6015s0§.§1t7363s0§();
         this.§1t5117s0§();
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9690s0§);
      }
      
      public function §1t6031s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t6014s0§.visible = true;
      }
      
      internal function §1t6032s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t6014s0§.visible = false;
      }
      
      internal function §1t6033s0§(param1:MouseEvent) : *
      {
         if(this.§1t5997s0§ == this.§1t5999s0§)
         {
            if(!§1t1523s0§.§1t1981s0§ || §1t1523s0§.§1t9519s0§)
            {
               this.§1t5996s0§.push(this.§1t5091s0§);
               this.§1t6027s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_click");
            }
            else
            {
               this.§1t5026s0§(null);
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(679),§1t1521s0§.getString(5));
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            }
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_drop");
            if(this.§1t5997s0§ == this.§1t6000s0§)
            {
               this.§1t6028s0§();
            }
            else
            {
               this.§1t6027s0§();
            }
         }
         this.§1t6014s0§.visible = false;
      }
      
      internal function §1t6034s0§() : *
      {
         var _loc1_:§1t17s0§ = this.§1t5091s0§;
         this.§1t5026s0§(null);
         §1t1541s0§.§1t10099s0§();
         §1t406s0§.instance.§1t6470s0§.§1t5386s0§();
         §1t406s0§.instance.§1t6470s0§.§1t5401s0§(_loc1_);
      }
      
      public function §1t5136s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t5134s0§ = true;
         this.§1t5052s0§.§1t6872s0§(param1.target.§1t483s0§(),param1.target.§1t6873s0§(),param1.target.§1t527s0§(),param1.target.§1t528s0§());
         this.§1t5052s0§.§1t6874s0§();
         this.§1t5052s0§.x = mouseX - 35;
         this.§1t5052s0§.y = mouseY - 35;
         if((param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§ < 355)
         {
            this.§1t6035s0§(param1);
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
            this.§1t5052s0§.alpha = 0.8;
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
                  if(this.§1t5091s0§.§1t483s0§() < 3000)
                  {
                     this.§1t6024s0§();
                  }
                  else if(this.§1t5091s0§.§1t483s0§() < 20000)
                  {
                     this.§1t6029s0§();
                  }
               }
            }
            else if(this.§1t5135s0§)
            {
               this.§1t6023s0§();
            }
            this.§1t5052s0§.visible = false;
            this.§1t5052s0§.cacheAsBitmap = false;
         }
         this.§1t5134s0§ = false;
      }
      
      public function §1t5139s0§(param1:MouseEvent) : void
      {
         var _loc2_:§1t394s0§ = §1t394s0§(param1.currentTarget);
         var _loc3_:int = 0;
         while(_loc3_ < this.§1t5023s0§)
         {
            this.slots[_loc3_].§1t6786s0§(false);
            _loc3_++;
         }
         if(this.§1t5090s0§ != null)
         {
            this.§1t5090s0§.§1t6786s0§(false);
         }
         this.§1t5090s0§ = _loc2_;
         this.§1t5091s0§ = _loc2_.item;
         this.§1t5090s0§.§1t6786s0§(true);
         this.§1t5092s0§ = this.§1t5089s0§ * this.§1t5102s0§ + this.§1t5090s0§.id;
         this.§1t6021s0§();
         this.§1t5986s0§.§1t15865s0§.§1t6872s0§(_loc2_.§1t483s0§(),_loc2_.§1t6873s0§(),_loc2_.§1t527s0§(),_loc2_.§1t528s0§());
         this.§1t5986s0§.§1t15865s0§.§1t6870s0§("");
         this.§1t5986s0§.§1t15863s0§.htmlText = this.§1t5091s0§.§1t510s0§();
         var _loc4_:int = _loc2_.getLevel();
         if(_loc4_ > 0)
         {
            this.§1t5986s0§.§1t6879s0§.text = §1t1521s0§.getString(47,[_loc4_]);
         }
         else
         {
            this.§1t5986s0§.§1t6879s0§.text = "";
         }
         if(this.§1t5091s0§.§1t514s0§() == "")
         {
            this.§1t5986s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t518s0§();
         }
         else
         {
            this.§1t5986s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t514s0§() + "\n\n" + this.§1t5091s0§.§1t518s0§();
         }
         this.§1t5051s0§.visible = this.§1t5986s0§.§1t15864s0§.numLines > 7;
         this.§1t5049s0§.visible = false;
         var _loc5_:int = this.§1t5091s0§.§1t483s0§();
         var _loc6_:§1t104s0§ = §1t1524s0§.§1t9862s0§(_loc5_);
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = true;
         if(_loc6_ != null)
         {
            _loc7_ = _loc6_.nogive;
            _loc8_ = !_loc6_.nodrop;
         }
         if(_loc6_.type == 13)
         {
            if(this.§1t5997s0§ == this.§1t5998s0§)
            {
               this.§1t5130s0§(§1t12370s0§);
               this.§1t5049s0§.visible = true;
            }
            if(this.§1t5997s0§ == this.§1t5999s0§ && _loc7_)
            {
               this.§1t5973s0§.visible = false;
            }
            else
            {
               this.§1t5973s0§.visible = true;
            }
         }
         else if(_loc5_ >= 20000 || _loc5_ < 3000 && _loc5_ >= 2500)
         {
            this.§1t5049s0§.visible = false;
            if(this.§1t5997s0§ == this.§1t5999s0§ && _loc7_)
            {
               this.§1t5973s0§.visible = false;
            }
            else
            {
               this.§1t5973s0§.visible = _loc8_;
            }
         }
         else if(_loc5_ < 2500 && _loc5_ > 1999)
         {
            if(this.§1t5997s0§ == this.§1t5998s0§)
            {
               this.§1t5130s0§(§1t12340s0§);
               this.§1t5049s0§.visible = true;
            }
            if(this.§1t5997s0§ == this.§1t5999s0§ && _loc7_ || this.§1t5997s0§ != this.§1t5999s0§ && !_loc8_)
            {
               this.§1t5973s0§.visible = false;
            }
            else
            {
               this.§1t5973s0§.visible = true;
            }
         }
         else
         {
            if(this.§1t5997s0§ != this.§1t5999s0§)
            {
               this.§1t5130s0§(§1t12342s0§);
               this.§1t5049s0§.visible = true;
            }
            if(this.§1t5997s0§ == this.§1t5999s0§ && _loc7_)
            {
               this.§1t5973s0§.visible = false;
            }
            else
            {
               this.§1t5973s0§.visible = true;
            }
         }
      }
      
      public function §1t5141s0§(param1:MouseEvent) : void
      {
         if(this.§1t5997s0§ == this.§1t5999s0§)
         {
            if(!this.§1t5091s0§.§1t505s0§())
            {
               this.§1t6033s0§(null);
            }
            return;
         }
         this.§1t5090s0§ = §1t394s0§(param1.currentTarget);
         var _loc2_:int = this.§1t5091s0§.§1t483s0§();
         if(_loc2_ < 3000 && _loc2_ > 1999)
         {
            this.§1t6024s0§();
         }
         else if(_loc2_ < 20000)
         {
            this.§1t6029s0§();
         }
      }
      
      public function §1t6035s0§(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:§1t394s0§ = §1t394s0§(param1.currentTarget);
         if(_loc2_ != this.§1t5090s0§)
         {
            if(this.§1t5090s0§ != null)
            {
               this.§1t5090s0§.§1t6786s0§(false);
            }
            this.§1t5090s0§ = _loc2_;
            this.§1t5091s0§ = _loc2_.§1t2217s0§();
            this.§1t5090s0§.§1t6786s0§(true);
            this.§1t6021s0§();
            this.§1t5986s0§.§1t15865s0§.§1t6872s0§(_loc2_.§1t483s0§(),_loc2_.§1t6873s0§(),_loc2_.§1t527s0§(),_loc2_.§1t528s0§());
            this.§1t5986s0§.§1t15865s0§.§1t6870s0§("");
            this.§1t5986s0§.§1t15863s0§.htmlText = this.§1t5091s0§.§1t510s0§();
            _loc3_ = _loc2_.getLevel();
            if(_loc3_ > 0)
            {
               this.§1t5986s0§.§1t6879s0§.text = §1t1521s0§.getString(47,[_loc3_]);
            }
            else
            {
               this.§1t5986s0§.§1t6879s0§.text = "";
            }
            if(this.§1t5091s0§.§1t514s0§() == "")
            {
               this.§1t5986s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t519s0§();
            }
            else
            {
               this.§1t5986s0§.§1t15864s0§.htmlText = this.§1t5091s0§.§1t514s0§() + "\n\n" + this.§1t5091s0§.§1t519s0§();
            }
            this.§1t5051s0§.visible = this.§1t5986s0§.§1t15864s0§.numLines > 7;
            this.§1t5130s0§(§1t12341s0§);
            this.§1t5049s0§.visible = true;
            this.§1t5973s0§.visible = false;
         }
      }
      
      public function §1t6036s0§(param1:MouseEvent) : void
      {
         this.§1t5090s0§ = §1t394s0§(param1.currentTarget);
         this.§1t5091s0§ = this.§1t5090s0§.item;
         this.§1t6023s0§();
      }
      
      internal function §1t6037s0§(param1:MouseEvent) : *
      {
         var _loc2_:§1t17s0§ = null;
         if(this.§1t5986s0§.visible)
         {
            _loc2_ = this.§1t5091s0§;
            this.§1t5026s0§(null);
            §1t406s0§.instance.§1t6604s0§(_loc2_);
         }
      }
      
      internal function §1t6038s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t6039s0§(!this.allstatstext.visible);
      }
      
      internal function §1t6039s0§(param1:Boolean) : *
      {
         var _loc2_:int = 0;
         if(param1)
         {
            this.§1t6040s0§();
            this.allstatstext.visible = true;
            this.allstatsbutton.§1t5769s0§("eq");
            _loc2_ = 0;
            while(_loc2_ < this.§1t6011s0§)
            {
               this.§1t6012s0§[_loc2_].visible = false;
               _loc2_++;
            }
            this.§1t5995s0§.visible = false;
            this.hatIcon.visible = false;
            this.maskIcon.visible = false;
            this.§1t5968s0§.visible = false;
            this.glovesIcon.visible = false;
            this.pantsIcon.visible = false;
            this.weaponIcon.visible = false;
            this.acc1Icon.visible = false;
            this.shoesIcon.visible = false;
            this.acc2Icon.visible = false;
            this.§1t5959s0§.visible = false;
            this.danfield.visible = false;
         }
         else
         {
            this.allstatstext.visible = false;
            this.allstatsbutton.§1t5769s0§("stats");
            _loc2_ = 0;
            while(_loc2_ < this.§1t6011s0§)
            {
               this.§1t6012s0§[_loc2_].visible = true;
               _loc2_++;
            }
            this.§1t5995s0§.visible = true;
            this.hatIcon.visible = true;
            this.maskIcon.visible = true;
            this.§1t5968s0§.visible = true;
            this.glovesIcon.visible = true;
            this.pantsIcon.visible = true;
            this.weaponIcon.visible = true;
            this.acc1Icon.visible = true;
            this.shoesIcon.visible = true;
            this.acc2Icon.visible = true;
            this.§1t5959s0§.visible = true;
            this.danfield.visible = true;
            this.§1t6019s0§();
         }
      }
      
      internal function §1t6040s0§() : *
      {
         var _loc13_:int = 0;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:int = 0;
         var _loc44_:int = 0;
         var _loc45_:String = null;
         var _loc46_:int = 0;
         var _loc47_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc56_:§1t104s0§ = null;
         var _loc57_:int = 0;
         var _loc58_:§1t17s0§ = null;
         var _loc59_:§1t104s0§ = null;
         var _loc60_:int = 0;
         var _loc61_:int = 0;
         var _loc62_:int = 0;
         var _loc63_:int = 0;
         var _loc64_:* = undefined;
         var _loc65_:int = 0;
         var _loc66_:int = 0;
         var _loc67_:int = 0;
         var _loc68_:int = 0;
         var _loc1_:int = §1t1523s0§.§1t1088s0§();
         var _loc2_:int = _loc1_ + §1t1523s0§.§1t9591s0§();
         var _loc3_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9409s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9409s0§);
         var _loc4_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1235s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1235s0§);
         var _loc5_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1237s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1237s0§);
         var _loc6_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1236s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1236s0§);
         var _loc7_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1238s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1238s0§);
         var _loc8_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1237s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1239s0§);
         var _loc9_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1236s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1241s0§);
         var _loc10_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1238s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1240s0§);
         var _loc11_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1235s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1242s0§);
         var _loc12_:int = §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1243s0§);
         _loc13_ = §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1244s0§);
         var _loc14_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9402s0§);
         var _loc15_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
         var _loc16_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9404s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9404s0§) + _loc15_ / 20;
         var _loc17_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9405s0§);
         var _loc18_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9406s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9406s0§);
         var _loc19_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9407s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9407s0§) + _loc18_ / 20;
         _loc13_ = new §1t67s0§(1,§1t1523s0§.getLevel()).§1t1088s0§() + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1244s0§);
         var _loc20_:Number = §1t1523s0§.§1t9589s0§();
         var _loc21_:int = §1t1523s0§.§1t9592s0§();
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         if(this.§1t5091s0§ != null)
         {
            _loc56_ = §1t1524s0§.§1t9862s0§(this.§1t5091s0§.§1t483s0§());
            _loc57_ = _loc56_.type;
            _loc58_ = null;
            if(_loc57_ != 10 && _loc57_ != 12 && _loc57_ != 13)
            {
               _loc58_ = §1t1523s0§.§1t7316s0§[_loc57_];
            }
            if(_loc58_ != null && _loc58_.§1t483s0§() == 0)
            {
               _loc58_ = null;
            }
            if(_loc58_ != null)
            {
               _loc59_ = §1t1524s0§.§1t9862s0§(_loc58_.§1t483s0§());
            }
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9403s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t9403s0§);
            }
            _loc22_ = _loc60_ - _loc61_;
            _loc15_ += _loc22_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9404s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t9404s0§);
            }
            _loc23_ = _loc60_ - _loc61_;
            _loc16_ += _loc23_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9406s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t9406s0§);
            }
            _loc24_ = _loc60_ - _loc61_;
            _loc18_ += _loc24_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9407s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t9407s0§);
            }
            _loc25_ = _loc60_ - _loc61_;
            _loc19_ += _loc25_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9408s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t9408s0§);
            }
            _loc62_ = _loc60_ - _loc61_;
            if(_loc56_.mindamage > 0 || _loc56_.maxdamage > 0)
            {
               if(_loc58_ == null)
               {
                  _loc65_ = 0;
                  _loc66_ = 0;
               }
               else if(_loc58_.§1t535s0§())
               {
                  _loc65_ = 1;
                  _loc66_ = 1;
               }
               else
               {
                  _loc65_ = _loc59_.mindamage + _loc61_;
                  _loc66_ = _loc59_.maxdamage + _loc61_;
               }
               if(this.§1t5091s0§.§1t535s0§())
               {
                  _loc67_ = 1;
                  _loc68_ = 1;
               }
               else
               {
                  _loc67_ = _loc56_.mindamage + _loc60_;
                  _loc68_ = _loc56_.maxdamage + _loc60_;
               }
               _loc35_ = _loc67_ - _loc65_;
               _loc36_ = _loc68_ - _loc66_;
            }
            else
            {
               _loc35_ = _loc62_;
               _loc36_ = _loc62_;
            }
            _loc1_ += _loc35_;
            _loc2_ += _loc36_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1235s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1235s0§);
            }
            _loc26_ = _loc60_ - _loc61_;
            _loc4_ += _loc26_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1237s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1237s0§);
            }
            _loc27_ = _loc60_ - _loc61_;
            _loc5_ += _loc27_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1236s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1236s0§);
            }
            _loc28_ = _loc60_ - _loc61_;
            _loc6_ += _loc28_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1238s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1238s0§);
            }
            _loc29_ = _loc60_ - _loc61_;
            _loc7_ += _loc29_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1239s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1239s0§);
            }
            _loc30_ = _loc60_ - _loc61_;
            _loc8_ += _loc30_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1241s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1241s0§);
            }
            _loc31_ = _loc60_ - _loc61_;
            _loc9_ += _loc31_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1240s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1240s0§);
            }
            _loc32_ = _loc60_ - _loc61_;
            _loc10_ += _loc32_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1242s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1242s0§);
            }
            _loc33_ = _loc60_ - _loc61_;
            _loc11_ += _loc33_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1243s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1243s0§);
            }
            _loc38_ = _loc60_ - _loc61_;
            _loc12_ += _loc38_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t1244s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t1244s0§);
            }
            _loc39_ = _loc60_ - _loc61_;
            _loc13_ += _loc39_;
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9409s0§) + _loc56_.defense;
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t9409s0§) + _loc59_.defense;
            }
            _loc34_ = _loc60_ - _loc61_;
            _loc3_ += _loc34_;
            _loc63_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9410s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9410s0§);
            _loc60_ = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9410s0§);
            if(_loc58_ == null)
            {
               _loc61_ = 0;
            }
            else
            {
               _loc61_ = _loc58_.§1t523s0§(§1t1523s0§.§1t9410s0§);
            }
            _loc37_ = _loc60_ - _loc61_;
            _loc64_ = _loc63_ + _loc37_;
            _loc20_ = §1t1523s0§.§1t9590s0§(_loc64_);
            _loc21_ = §1t1523s0§.§1t9593s0§(_loc64_);
         }
         var _loc40_:int = §1t1523s0§.stance;
         if(_loc40_ == §1t99s0§.§1t12220s0§)
         {
            _loc45_ = §1t1521s0§.getString(979);
            _loc46_ = §1t1523s0§.§1t9714s0§(1000);
            _loc41_ = 0.5 + 0.4 * _loc46_ * 0.1;
            _loc42_ = 1.3;
            _loc47_ = 1;
            _loc48_ = 1.4;
         }
         else if(_loc40_ == §1t99s0§.§1t12221s0§)
         {
            _loc45_ = §1t1521s0§.getString(980);
            _loc46_ = §1t1523s0§.§1t9714s0§(1001);
            _loc41_ = 1 + 0.2 * _loc46_ * 0.1;
            _loc42_ = 1.3;
            _loc47_ = 1;
            _loc48_ = 1 + 0.2 * _loc46_ * 0.1;
         }
         else if(_loc40_ == §1t99s0§.§1t12222s0§)
         {
            _loc45_ = §1t1521s0§.getString(981);
            _loc46_ = §1t1523s0§.§1t9714s0§(1002);
            _loc41_ = 1.4;
            _loc42_ = 1.3;
            _loc47_ = 0.8;
            _loc48_ = 0.5 + 0.4 * _loc46_ * 0.1;
         }
         _loc1_ *= _loc41_;
         _loc2_ *= _loc41_;
         _loc43_ = _loc1_ * _loc42_ + _loc12_;
         _loc44_ = _loc2_ * _loc42_ + _loc12_;
         if(_loc14_ > _loc15_)
         {
            _loc14_ = _loc15_;
         }
         if(_loc17_ > _loc18_)
         {
            _loc17_ = _loc18_;
         }
         var _loc49_:String = "<font color=\'#FF0000\'>";
         var _loc50_:String = "<font color=\'#00A606\'>";
         var _loc51_:String = "<font color=\'#CCCCCC\'>";
         var _loc52_:String = "</font>";
         var _loc53_:String = "";
         var _loc54_:String = "";
         var _loc55_:String = "";
         if(_loc22_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc22_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         if(_loc23_ == 0)
         {
            _loc54_ = _loc51_;
         }
         else if(_loc23_ > 0)
         {
            _loc54_ = _loc50_;
         }
         else
         {
            _loc54_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(110) + ": " + _loc14_ + " / " + _loc53_ + _loc15_ + _loc52_ + "  (" + §1t1521s0§.getString(112) + " " + _loc54_ + _loc16_ + _loc52_ + ")<br>";
         if(_loc24_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc24_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         if(_loc25_ == 0)
         {
            _loc54_ = _loc51_;
         }
         else if(_loc25_ > 0)
         {
            _loc54_ = _loc50_;
         }
         else
         {
            _loc54_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(113) + ": " + _loc17_ + " / " + _loc53_ + _loc18_ + _loc52_ + "  (" + §1t1521s0§.getString(115) + " " + _loc54_ + _loc19_ + _loc52_ + ")<br>";
         _loc55_ = _loc55_ + "<br>";
         if(_loc35_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc35_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         if(_loc36_ == 0)
         {
            _loc54_ = _loc51_;
         }
         else if(_loc36_ > 0)
         {
            _loc54_ = _loc50_;
         }
         else
         {
            _loc54_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(984) + ": " + _loc53_ + _loc1_ + _loc52_ + " - " + _loc54_ + _loc2_ + _loc52_ + " (" + _loc45_ + ")<br>";
         if(_loc35_ + _loc38_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc35_ + _loc38_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         if(_loc36_ + _loc38_ == 0)
         {
            _loc54_ = _loc51_;
         }
         else if(_loc36_ + _loc38_ > 0)
         {
            _loc54_ = _loc50_;
         }
         else
         {
            _loc54_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(985) + ": " + _loc53_ + _loc43_ + _loc52_ + " - " + _loc54_ + _loc44_ + _loc52_ + " (" + _loc45_ + ")<br>";
         if(_loc39_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc39_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(986) + ": " + _loc53_ + _loc13_ + _loc52_ + "<br>";
         if(_loc26_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc26_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(507) + ": " + _loc53_ + _loc4_ + _loc52_ + "<br>";
         if(_loc27_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc27_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(509) + ": " + _loc53_ + _loc5_ + _loc52_ + "<br>";
         if(_loc28_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc28_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(508) + ": " + _loc53_ + _loc6_ + _loc52_ + "<br>";
         if(_loc29_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc29_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(510) + ": " + _loc53_ + _loc7_ + _loc52_ + "<br>";
         _loc55_ = _loc55_ + "<br>";
         if(_loc34_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc34_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(987) + ": " + _loc53_ + int(_loc3_ * _loc47_).toString() + _loc52_ + " (" + _loc45_ + ")<br>";
         if(_loc30_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc30_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(871) + ": " + _loc53_ + _loc8_ + _loc52_ + "<br>";
         if(_loc31_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc31_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(873) + ": " + _loc53_ + _loc9_ + _loc52_ + "<br>";
         if(_loc32_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc32_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(872) + ": " + _loc53_ + _loc10_ + _loc52_ + "<br>";
         if(_loc33_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc33_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(874) + ": " + _loc53_ + _loc11_ + _loc52_ + "<br>";
         _loc55_ = _loc55_ + "<br>";
         if(_loc37_ == 0)
         {
            _loc53_ = _loc51_;
         }
         else if(_loc37_ > 0)
         {
            _loc53_ = _loc50_;
         }
         else
         {
            _loc53_ = _loc49_;
         }
         _loc55_ += §1t1521s0§.getString(982) + _loc53_ + int(_loc21_ * _loc48_).toString() + _loc52_ + " (" + _loc45_ + ")<br>";
         _loc55_ = _loc55_ + (§1t1521s0§.getString(983) + _loc53_ + "0." + int(_loc20_ * 1000) + _loc52_);
         this.allstatstext.htmlText = _loc55_;
      }
      
      public function §1t6041s0§() : *
      {
         var _loc20_:int = 0;
         if(this.§1t5997s0§ == this.§1t6000s0§)
         {
            this.§1t6042s0§();
            return;
         }
         var _loc1_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9411s0§);
         var _loc2_:int = §1t1523s0§.§1t912s0§();
         var _loc3_:int = §1t1523s0§.§1t5928s0§(_loc1_);
         var _loc4_:int = _loc2_ - §1t1523s0§.§1t5928s0§(_loc1_ - 1);
         var _loc5_:int = §1t1523s0§.§1t5928s0§(_loc1_) - §1t1523s0§.§1t5928s0§(_loc1_ - 1);
         var _loc6_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9414s0§);
         var _loc7_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9415s0§);
         var _loc8_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9412s0§);
         var _loc9_:int = §1t1523s0§.§1t9613s0§();
         var _loc10_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§);
         var _loc11_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9402s0§);
         var _loc12_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
         if(_loc11_ > _loc12_)
         {
            _loc11_ = _loc12_;
         }
         var _loc13_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9405s0§);
         var _loc14_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9406s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9406s0§);
         if(_loc13_ > _loc14_)
         {
            _loc13_ = _loc14_;
         }
         var _loc15_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9408s0§);
         var _loc16_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9409s0§);
         var _loc17_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9410s0§);
         var _loc18_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9419s0§);
         if(_loc18_ > 0)
         {
            this.§1t6047s0§(_loc18_);
         }
         else
         {
            this.§1t6046s0§();
         }
         var _loc19_:String = §1t1523s0§.charname;
         switch(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§))
         {
            case 0:
               this.danfield.text = "";
               break;
            case 1:
               this.danfield.text = §1t1521s0§.getString(456);
               break;
            case 2:
               this.danfield.text = §1t1521s0§.getString(457);
               break;
            case 3:
               _loc19_ += " <font color=\'#7D5500\'>" + §1t1521s0§.getString(465) + "</font>";
               this.danfield.text = §1t1521s0§.getString(458);
               break;
            case 4:
               _loc19_ += " <font color=\'#7D5500\'>" + §1t1521s0§.getString(465) + "</font>";
               this.danfield.text = §1t1521s0§.getString(459);
               break;
            case 5:
               _loc19_ += " <font color=\'#7D5500\'>" + §1t1521s0§.getString(465) + "</font>";
               this.danfield.text = §1t1521s0§.getString(460);
               break;
            case 6:
               _loc19_ += " <font color=\'#7D5500\'>" + §1t1521s0§.getString(466) + "</font>";
               this.danfield.text = §1t1521s0§.getString(461);
               break;
            case 7:
               _loc19_ += " <font color=\'#7D5500\'>" + §1t1521s0§.getString(466) + "</font>";
               this.danfield.text = §1t1521s0§.getString(462);
               break;
            case 8:
               _loc19_ += " <font color=\'#7D5500\'>" + §1t1521s0§.getString(467) + "</font>";
               this.danfield.text = §1t1521s0§.getString(463);
               break;
            case 9:
               _loc19_ += " <font color=\'#7D5500\'>" + §1t1521s0§.getString(467) + "</font>";
               this.danfield.text = §1t1521s0§.getString(464);
               break;
            default:
               _loc19_ += " <font color=\'#7D5500\'>" + §1t1521s0§.getString(467) + "</font>";
               this.danfield.text = §1t1521s0§.getString(464);
         }
         this.§1t5959s0§.htmlText = _loc19_;
         this.§1t5958s0§.text = _loc1_.toString();
         if(_loc1_ < §1t1523s0§.§1t9470s0§)
         {
            this.§1t5961s0§.text = _loc2_ + " / " + _loc3_;
            this.§1t5962s0§.text = this.§1t5961s0§.text;
         }
         else
         {
            this.§1t5961s0§.text = _loc2_ + " / " + _loc2_;
            this.§1t5962s0§.text = this.§1t5961s0§.text;
         }
         this.statsPanel.§1t16057s0§.text = _loc6_ + " / " + _loc7_;
         this.statsPanel.§1t16058s0§.text = this.statsPanel.§1t16057s0§.text;
         this.§1t5054s0§.text = _loc8_.toString();
         this.§1t5057s0§.text = _loc9_.toString();
         this.statsPanel.§1t16059s0§.text = _loc11_ + " / " + _loc12_;
         this.statsPanel.§1t16060s0§.text = this.statsPanel.§1t16059s0§.text;
         this.statsPanel.ChibarText.text = _loc13_ + " / " + _loc14_;
         this.statsPanel.ChibarTextshadow.text = this.statsPanel.ChibarText.text;
         this.statsPanel.§1t16063s0§.text = _loc15_.toString();
         this.statsPanel.DefAmount.text = _loc16_.toString();
         this.statsPanel.SpdAmount.text = _loc17_.toString();
         this.statPoints.text = §1t1521s0§.getString(72) + _loc18_;
         if(_loc1_ >= §1t1523s0§.§1t9470s0§)
         {
            this.§1t5960s0§.bar.scaleX = 1;
         }
         else
         {
            this.§1t5960s0§.bar.scaleX = _loc4_ / _loc5_;
         }
         this.statsPanel.§1t16066s0§.bar.scaleX = _loc6_ / _loc7_;
         this.statsPanel.§1t16067s0§.bar.scaleX = _loc11_ / _loc12_;
         this.statsPanel.§1t16068s0§.bar.scaleX = _loc13_ / _loc14_;
         this.statsPanel.§1t16051s0§.visible = false;
         if(this.allstatstext.visible)
         {
            this.§1t6039s0§(true);
         }
         _loc20_ = §1t1523s0§.§1t7358s0§(6,true);
         if(_loc20_ == 0)
         {
            this.statsPanel.AtkBonusAmount.text = "";
         }
         else if(_loc20_ > 0)
         {
            this.statsPanel.AtkBonusAmount.text = " + " + _loc20_;
         }
         else
         {
            this.statsPanel.AtkBonusAmount.text = " - " + -_loc20_;
         }
         _loc20_ = §1t1523s0§.§1t7358s0§(7);
         if(_loc20_ == 0)
         {
            this.statsPanel.§1t16071s0§.text = "";
         }
         else if(_loc20_ >= 0)
         {
            this.statsPanel.§1t16071s0§.text = " + " + _loc20_;
         }
         else
         {
            this.statsPanel.§1t16071s0§.text = " - " + -_loc20_;
         }
         _loc20_ = §1t1523s0§.§1t7358s0§(8);
         if(_loc20_ == 0)
         {
            this.statsPanel.§1t16072s0§.text = "";
         }
         else if(_loc20_ >= 0)
         {
            this.statsPanel.§1t16072s0§.text = " + " + _loc20_;
         }
         else
         {
            this.statsPanel.§1t16072s0§.text = " - " + -_loc20_;
         }
      }
      
      public function §1t6042s0§() : *
      {
         var _loc18_:int = 0;
         var _loc1_:int = this.§1t6015s0§.§1t7323s0§(§1t24s0§.§1t8755s0§);
         var _loc2_:int = this.§1t6015s0§.§1t912s0§();
         var _loc3_:int = §1t1523s0§.§1t5928s0§(_loc1_);
         var _loc4_:int = _loc2_ - §1t1523s0§.§1t5928s0§(_loc1_ - 1);
         var _loc5_:int = §1t1523s0§.§1t5928s0§(_loc1_) - §1t1523s0§.§1t5928s0§(_loc1_ - 1);
         var _loc6_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9414s0§);
         var _loc7_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9415s0§);
         var _loc8_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9412s0§);
         var _loc9_:int = §1t1523s0§.§1t9613s0§();
         var _loc10_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9402s0§);
         var _loc11_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + this.§1t6015s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
         if(_loc10_ > _loc11_)
         {
            _loc10_ = _loc11_;
         }
         var _loc12_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9405s0§);
         var _loc13_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9406s0§) + this.§1t6015s0§.§1t7358s0§(§1t1523s0§.§1t9406s0§);
         if(_loc12_ > _loc13_)
         {
            _loc12_ = _loc13_;
         }
         var _loc14_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9408s0§);
         var _loc15_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9409s0§);
         var _loc16_:int = this.§1t6015s0§.§1t7356s0§(§1t1523s0§.§1t9410s0§);
         this.danfield.text = "";
         var _loc17_:String = "#FFFFFF";
         if(this.§1t6015s0§.§1t3312s0§())
         {
            _loc17_ = "#FFCC00";
         }
         else if(this.§1t6015s0§.§1t7321s0§())
         {
            _loc17_ = "#b048f8";
         }
         this.§1t5959s0§.htmlText = "<font color=\'" + _loc17_ + "\'>" + this.§1t6015s0§.charname + "</font>";
         this.§1t5958s0§.text = _loc1_.toString();
         if(_loc1_ < §1t1523s0§.§1t9470s0§)
         {
            this.§1t5961s0§.text = _loc2_ + " / " + _loc3_;
            this.§1t5962s0§.text = this.§1t5961s0§.text;
         }
         else
         {
            this.§1t5961s0§.text = _loc2_ + " / " + _loc2_;
            this.§1t5962s0§.text = this.§1t5961s0§.text;
         }
         this.§1t5054s0§.text = _loc8_.toString();
         this.§1t5057s0§.text = _loc9_.toString();
         this.§1t5992s0§.§1t16059s0§.text = _loc10_ + " / " + _loc11_;
         this.§1t5992s0§.§1t16060s0§.text = this.§1t5992s0§.§1t16059s0§.text;
         this.§1t5992s0§.§1t16063s0§.text = _loc14_.toString();
         this.§1t5992s0§.DefAmount.text = _loc15_.toString();
         this.§1t5992s0§.SpdAmount.text = _loc16_.toString();
         if(_loc1_ >= §1t1523s0§.§1t9470s0§)
         {
            this.§1t5960s0§.bar.scaleX = 1;
         }
         else
         {
            this.§1t5960s0§.bar.scaleX = _loc4_ / _loc5_;
         }
         this.§1t5992s0§.§1t16067s0§.bar.scaleX = _loc10_ / _loc11_;
         this.§1t5992s0§.§1t16051s0§.visible = false;
         _loc18_ = this.§1t6015s0§.§1t7358s0§(6,true);
         if(_loc18_ == 0)
         {
            this.§1t5992s0§.AtkBonusAmount.text = "";
         }
         else if(_loc18_ > 0)
         {
            this.§1t5992s0§.AtkBonusAmount.text = " + " + _loc18_;
         }
         else
         {
            this.§1t5992s0§.AtkBonusAmount.text = " - " + -_loc18_;
         }
         _loc18_ = this.§1t6015s0§.§1t7358s0§(7);
         if(_loc18_ == 0)
         {
            this.§1t5992s0§.§1t16071s0§.text = "";
         }
         else if(_loc18_ >= 0)
         {
            this.§1t5992s0§.§1t16071s0§.text = " + " + _loc18_;
         }
         else
         {
            this.§1t5992s0§.§1t16071s0§.text = " - " + -_loc18_;
         }
         _loc18_ = this.§1t6015s0§.§1t7358s0§(8);
         if(_loc18_ == 0)
         {
            this.§1t5992s0§.§1t16072s0§.text = "";
         }
         else if(_loc18_ >= 0)
         {
            this.§1t5992s0§.§1t16072s0§.text = " + " + _loc18_;
         }
         else
         {
            this.§1t5992s0§.§1t16072s0§.text = " - " + -_loc18_;
         }
      }
      
      public function §1t6043s0§() : *
      {
         var _loc1_:int = §1t1523s0§.§1t9714s0§(13);
         var _loc2_:int = §1t1523s0§.§1t9714s0§(14);
         this.statsPanel.§1t16057s0§.text = _loc1_ + " / " + _loc2_;
         this.statsPanel.§1t16058s0§.text = this.statsPanel.§1t16057s0§.text;
         this.statsPanel.§1t16066s0§.bar.scaleX = _loc1_ / _loc2_;
      }
      
      public function §1t6044s0§(param1:String) : *
      {
         if(visible && this.statsPanel.§1t16074s0§.text != param1)
         {
            this.statsPanel.§1t16074s0§.text = param1;
         }
      }
      
      public function §1t6045s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t5969s0§.§1t5042s0§();
         §1t1523s0§.§1t9538s0§();
      }
      
      public function §1t6046s0§() : *
      {
         this.statsPanel.HPadd.removeEventListener(MouseEvent.CLICK,this.§1t6049s0§);
         this.statsPanel.§1t16076s0§.removeEventListener(MouseEvent.CLICK,this.§1t6050s0§);
         this.statsPanel.§1t16077s0§.removeEventListener(MouseEvent.CLICK,this.§1t6051s0§);
         this.statsPanel.§1t16078s0§.removeEventListener(MouseEvent.CLICK,this.§1t6052s0§);
         this.statsPanel.§1t16079s0§.removeEventListener(MouseEvent.CLICK,this.§1t6053s0§);
         this.statsPanel.§1t16080s0§.removeEventListener(MouseEvent.CLICK,this.§1t6054s0§);
         this.statsPanel.HPadd.visible = false;
         this.statsPanel.§1t16076s0§.visible = false;
         this.statsPanel.§1t16077s0§.visible = false;
         this.statsPanel.§1t16078s0§.visible = false;
         this.statsPanel.§1t16079s0§.visible = false;
         this.statsPanel.§1t16080s0§.visible = false;
      }
      
      public function §1t6047s0§(param1:int) : *
      {
         this.statsPanel.HPadd.addEventListener(MouseEvent.CLICK,this.§1t6049s0§);
         this.statsPanel.§1t16076s0§.addEventListener(MouseEvent.CLICK,this.§1t6050s0§);
         this.statsPanel.§1t16077s0§.addEventListener(MouseEvent.CLICK,this.§1t6051s0§);
         this.statsPanel.§1t16078s0§.addEventListener(MouseEvent.CLICK,this.§1t6052s0§);
         this.statsPanel.§1t16079s0§.addEventListener(MouseEvent.CLICK,this.§1t6053s0§);
         this.statsPanel.§1t16080s0§.addEventListener(MouseEvent.CLICK,this.§1t6054s0§);
         var _loc2_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9411s0§);
         var _loc3_:Boolean = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9403s0§) < 10 + (_loc2_ + 10) * 10;
         var _loc4_:Boolean = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9406s0§) < 10 + (_loc2_ + 10) * 5;
         var _loc5_:Boolean = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9415s0§) < 30 + (_loc2_ + 10) * 5;
         var _loc6_:Boolean = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9408s0§) < 1 + (_loc2_ + 10) * 3;
         var _loc7_:Boolean = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9409s0§) < 1 + (_loc2_ + 10) * 3;
         var _loc8_:Boolean = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9410s0§) < 1 + (_loc2_ + 10) * 3;
         this.statsPanel.HPadd.visible = _loc3_;
         this.statsPanel.§1t16076s0§.visible = _loc4_;
         this.statsPanel.§1t16077s0§.visible = _loc5_;
         this.statsPanel.§1t16078s0§.visible = _loc6_;
         this.statsPanel.§1t16079s0§.visible = _loc7_;
         this.statsPanel.§1t16080s0§.visible = _loc8_;
         var _loc9_:int = 0;
         if(!_loc3_)
         {
            _loc9_++;
         }
         if(!_loc4_)
         {
            _loc9_++;
         }
         if(!_loc5_)
         {
            _loc9_++;
         }
         if(!_loc6_)
         {
            _loc9_++;
         }
         if(!_loc7_)
         {
            _loc9_++;
         }
         if(!_loc8_)
         {
            _loc9_++;
         }
         if(_loc9_ > 2)
         {
            §1t3318s0§.instance.§1t1982s0§(§1t1521s0§.getString(134));
         }
      }
      
      internal function §1t6048s0§() : int
      {
         var _loc2_:int = 0;
         return 1;
      }
      
      public function §1t6049s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_addStat");
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9419s0§,-1);
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9403s0§,10);
         this.§1t6041s0§();
         if(§1t6495s0§.instance.§1t1028s0§() == 15)
         {
            §1t6495s0§.instance.§1t1023s0§(16);
         }
      }
      
      public function §1t6050s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_addStat");
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9419s0§,-1);
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9406s0§,5);
         this.§1t6041s0§();
      }
      
      public function §1t6051s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_addStat");
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9419s0§,-1);
         §1t1523s0§.§1t9609s0§(5);
         this.§1t6041s0§();
      }
      
      public function §1t6052s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_addStat");
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9419s0§,-1);
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9408s0§,3);
         this.§1t6041s0§();
         if(§1t6495s0§.instance.§1t1028s0§() == 16)
         {
            §1t6495s0§.instance.§1t1023s0§(17);
         }
      }
      
      public function §1t6053s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_addStat");
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9419s0§,-1);
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9409s0§,3);
         this.§1t6041s0§();
         §1t6495s0§.instance.§1t1023s0§(0);
      }
      
      public function §1t6054s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_addStat");
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9419s0§,-1);
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9410s0§,3);
         this.§1t6041s0§();
      }
      
      internal function §1t6055s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if((§1t1523s0§.§1t9529s0§ != §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8880s0§) || !§1t1523s0§.§1t9483s0§) && §1t1523s0§.charname != §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8886s0§))
         {
            _loc1_ = 0;
            _loc1_ += (§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9403s0§) - 10) / 10;
            _loc1_ += (§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9406s0§) - 10) / 5;
            _loc1_ += (§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9415s0§) - 30) / 5;
            _loc1_ += (§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9408s0§) - 1) / 3;
            _loc1_ += (§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9409s0§) - 1) / 3;
            _loc1_ += (§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9410s0§) - 1) / 3;
            _loc1_ += §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9419s0§);
            _loc2_ = (§1t1523s0§.getLevel() - 1) * 3;
            if(_loc1_ > _loc2_)
            {
               §1t3318s0§.instance.§1t1982s0§(_loc1_ + " " + _loc2_ + " " + §1t1521s0§.getString(134) + "2");
            }
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
         this.§1t5117s0§();
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
   }
}

