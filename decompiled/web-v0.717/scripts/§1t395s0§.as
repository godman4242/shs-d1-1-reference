package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.setTimeout;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol874")]
   public class §1t395s0§ extends MovieClip
   {
      
      public var §1t7047s0§:§1t5050s0§;
      
      public var bg:§1t5016s0§;
      
      public var brackets:§1t7049s0§;
      
      public var button_hitarea:§1t5267s0§;
      
      public var buybutton:SimpleButton;
      
      public var draglabel:TextField;
      
      public var §1t5056s0§:TextField;
      
      public var goldtext:TextField;
      
      public var infotext:TextField;
      
      public var placebet:§1t396s0§;
      
      public var refreshbutton:SimpleButton;
      
      public var §1t5021s0§:TextField;
      
      public var §1t7055s0§:§1t5050s0§;
      
      internal var §1t7056s0§:§1t23s0§;
      
      internal var §1t7057s0§:§1t23s0§;
      
      internal var §1t7058s0§:int;
      
      internal var §1t7059s0§:int;
      
      internal var §1t7060s0§:Boolean;
      
      internal var maxplayers:int;
      
      internal var §1t7062s0§:Array;
      
      internal var §1t1838s0§:int = 0;
      
      internal var §1t7074s0§:§1t396s0§;
      
      internal var §1t7075s0§:§1t98s0§;
      
      public function §1t395s0§()
      {
         var _loc3_:§1t396s0§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(11005);
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(11006);
         §1t1521s0§.§1t9290s0§(this.draglabel,false);
         this.draglabel.text = §1t1521s0§.getString(11007);
         this.§1t7055s0§.§1t5769s0§(§1t1521s0§.getString(760));
         this.button_hitarea.visible = false;
         this.§1t7047s0§.§1t5769s0§(§1t1521s0§.getString(11008));
         this.§1t7047s0§.visible = false;
         var _loc1_:int = 16;
         var _loc2_:int = 4;
         this.§1t7062s0§ = new Array(_loc2_);
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.§1t7062s0§[_loc4_] = new Array();
            _loc5_ = 0;
            while(_loc5_ < _loc1_ / Math.pow(2,_loc4_ + 1))
            {
               _loc3_ = new §1t396s0§();
               _loc3_.§1t5296s0§(this);
               _loc3_.x = 14 + _loc4_ * 300;
               if(_loc4_ == 0)
               {
                  _loc3_.y = 34 + 130 * _loc5_;
               }
               else if(_loc4_ == 1)
               {
                  _loc3_.y = 100 + 260 * _loc5_;
               }
               else if(_loc4_ == 2)
               {
                  _loc3_.y = 220 + 520 * _loc5_;
               }
               else if(_loc4_ == 3)
               {
                  _loc3_.y = 480 + 1040 * _loc5_;
               }
               this.§1t7062s0§[_loc4_][_loc5_] = _loc3_;
               this.brackets.addChild(_loc3_);
               _loc5_++;
            }
            _loc4_++;
         }
         _loc3_ = new §1t396s0§();
         _loc3_.§1t5296s0§(this);
         this.§1t7062s0§[_loc2_ - 1][1] = _loc3_;
         this.brackets.addChild(_loc3_);
         this.placebet.visible = false;
         this.placebet.§1t5296s0§(this);
         this.§1t7075s0§ = new §1t98s0§(§1t1523s0§.§1t9392s0§);
         this.infotext.visible = false;
         this.infotext.text = §1t1521s0§.getString(11004);
      }
      
      public function §1t5004s0§() : *
      {
         this.buybutton.addEventListener(MouseEvent.CLICK,this.§1t7064s0§);
         this.refreshbutton.addEventListener(MouseEvent.CLICK,this.§1t7065s0§);
         this.§1t7055s0§.addEventListener(MouseEvent.CLICK,this.§1t7066s0§);
         this.§1t7047s0§.addEventListener(MouseEvent.CLICK,this.§1t7067s0§);
         §1t406s0§.instance.§1t6484s0§.addEventListener(MouseEvent.MOUSE_DOWN,this.§1t7071s0§);
         §1t406s0§.instance.§1t6484s0§.addEventListener(MouseEvent.MOUSE_UP,this.§1t7072s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.buybutton.removeEventListener(MouseEvent.CLICK,this.§1t7064s0§);
         this.refreshbutton.removeEventListener(MouseEvent.CLICK,this.§1t7065s0§);
         this.§1t7055s0§.removeEventListener(MouseEvent.CLICK,this.§1t7066s0§);
         this.§1t7047s0§.removeEventListener(MouseEvent.CLICK,this.§1t7067s0§);
         §1t406s0§.instance.§1t6484s0§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t7071s0§);
         §1t406s0§.instance.§1t6484s0§.removeEventListener(MouseEvent.MOUSE_UP,this.§1t7072s0§);
      }
      
      public function show(param1:String, param2:§1t23s0§) : *
      {
         this.§1t5004s0§();
         visible = true;
         this.§1t7056s0§ = param2;
         §1t406s0§.instance.§1t6484s0§.loading.visible = true;
         §1t3318s0§.instance.§1t3451s0§(param1,true,param2 == null);
         this.§1t5021s0§.text = §1t1521s0§.getString(11005);
         this.brackets.visible = false;
         this.goldtext.text = §1t1523s0§.§1t9714s0§(20112).toString();
         this.§1t7075s0§.§1t695s0§(§1t1523s0§.§1t9714s0§(20112));
         this.draglabel.visible = false;
         this.placebet.visible = false;
         this.§1t7047s0§.visible = false;
         this.infotext.visible = false;
      }
      
      public function §1t7063s0§(param1:Array, param2:§1t23s0§, param3:§1t23s0§) : *
      {
         var _loc4_:int = 0;
         var _loc5_:§1t23s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1.length == 0)
         {
            §1t406s0§.instance.§1t6484s0§.§1t5026s0§(null);
            return;
         }
         if(param3 != null)
         {
            this.§1t7056s0§ = param3;
         }
         if(param2 != null)
         {
            this.§1t7057s0§ = param2;
         }
         this.maxplayers = this.§1t7056s0§.maxplayers;
         this.brackets.connector_0_0.visible = true;
         this.brackets.connector_0_1.visible = true;
         this.brackets.connector_0_2.visible = true;
         this.brackets.connector_0_3.visible = true;
         this.brackets.connector_1_0.visible = true;
         this.brackets.connector_1_1.visible = true;
         this.brackets.connector_2_0.visible = true;
         if(this.maxplayers == 2)
         {
            _loc6_ = 0;
            while(_loc6_ < 4)
            {
               _loc4_ = int(this.§1t7062s0§[_loc6_].length);
               _loc7_ = 0;
               while(_loc7_ < _loc4_)
               {
                  if(_loc6_ == 0 && _loc7_ >= 1)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 1 && _loc7_ >= 0)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 2 && _loc7_ >= 0)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 3 && _loc7_ >= 0)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = true;
                  }
                  _loc7_++;
               }
               _loc6_++;
            }
            this.brackets.connector_0_0.visible = false;
            this.brackets.connector_0_1.visible = false;
            this.brackets.connector_0_2.visible = false;
            this.brackets.connector_0_3.visible = false;
            this.brackets.connector_1_0.visible = false;
            this.brackets.connector_1_1.visible = false;
            this.brackets.connector_2_0.visible = false;
            this.§1t7062s0§[3][1].visible = false;
         }
         else if(this.maxplayers == 4)
         {
            _loc6_ = 0;
            while(_loc6_ < 4)
            {
               _loc4_ = int(this.§1t7062s0§[_loc6_].length);
               _loc7_ = 0;
               while(_loc7_ < _loc4_)
               {
                  if(_loc6_ == 0 && _loc7_ >= 2)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 1 && _loc7_ >= 1)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 2 && _loc7_ >= 0)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 3 && _loc7_ >= 0)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = true;
                  }
                  _loc7_++;
               }
               _loc6_++;
            }
            this.brackets.connector_0_1.visible = false;
            this.brackets.connector_0_2.visible = false;
            this.brackets.connector_0_3.visible = false;
            this.brackets.connector_1_0.visible = false;
            this.brackets.connector_1_1.visible = false;
            this.brackets.connector_2_0.visible = false;
            this.§1t7062s0§[3][1].visible = true;
            this.§1t7062s0§[3][1].x = this.§1t7062s0§[1][0].x;
            this.§1t7062s0§[3][1].y = this.§1t7062s0§[1][0].y + 140;
         }
         else if(this.maxplayers == 8)
         {
            _loc6_ = 0;
            while(_loc6_ < 4)
            {
               _loc4_ = int(this.§1t7062s0§[_loc6_].length);
               _loc7_ = 0;
               while(_loc7_ < _loc4_)
               {
                  if(_loc6_ == 0 && _loc7_ >= 4)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 1 && _loc7_ >= 2)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 2 && _loc7_ >= 1)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else if(_loc6_ == 3 && _loc7_ >= 0)
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = false;
                  }
                  else
                  {
                     this.§1t7062s0§[_loc6_][_loc7_].visible = true;
                  }
                  _loc7_++;
               }
               _loc6_++;
            }
            this.brackets.connector_0_2.visible = false;
            this.brackets.connector_0_3.visible = false;
            this.brackets.connector_1_1.visible = false;
            this.brackets.connector_2_0.visible = false;
            this.§1t7062s0§[3][1].visible = true;
            this.§1t7062s0§[3][1].x = this.§1t7062s0§[2][0].x;
            this.§1t7062s0§[3][1].y = this.§1t7062s0§[2][0].y + 140;
         }
         else if(this.maxplayers == 16)
         {
            _loc6_ = 0;
            while(_loc6_ < 4)
            {
               _loc4_ = int(this.§1t7062s0§[_loc6_].length);
               _loc7_ = 0;
               while(_loc7_ < _loc4_)
               {
                  this.§1t7062s0§[_loc6_][_loc7_].visible = true;
                  _loc7_++;
               }
               _loc6_++;
            }
            this.§1t7062s0§[3][1].visible = true;
            this.§1t7062s0§[3][1].x = this.§1t7062s0§[3][0].x;
            this.§1t7062s0§[3][1].y = this.§1t7062s0§[3][0].y + 140;
         }
         _loc4_ = int(param1.length);
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = param1[_loc6_];
            if(_loc5_.thirdfourth)
            {
               this.§1t7062s0§[3][1].init(_loc5_,this.§1t7057s0§,this.§1t7056s0§);
            }
            else
            {
               this.§1t7062s0§[_loc5_.tier][_loc5_.group].init(_loc5_,this.§1t7057s0§,this.§1t7056s0§);
            }
            _loc6_++;
         }
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         this.§1t7070s0§();
         this.brackets.visible = true;
         this.§1t5021s0§.text = this.§1t7056s0§.title;
         if(this.§1t7056s0§.status != 2 && this.§1t7056s0§.organizer == §1t1523s0§.charname && this.§1t7056s0§.timeout < §1t3317s0§.instance.§1t1847s0§())
         {
            this.§1t7047s0§.visible = true;
         }
         else
         {
            this.§1t7047s0§.visible = false;
         }
         this.refreshbutton.visible = this.§1t7056s0§.status != 2;
         if(this.maxplayers > 4)
         {
            this.§1t7055s0§.visible = true;
         }
      }
      
      internal function §1t7064s0§(param1:MouseEvent) : *
      {
         if(this.placebet.visible)
         {
            this.§1t7078s0§();
         }
         §1t88s0§.instance.§1t1516s0§("Snd_ninja");
         §1t406s0§.instance.§1t6558s0§();
      }
      
      internal function §1t7065s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(§1t3317s0§.instance.§1t1847s0§() - this.§1t1838s0§ < 5)
         {
            return;
         }
         this.§1t1838s0§ = §1t3317s0§.instance.§1t1847s0§();
         §1t406s0§.instance.§1t6484s0§.loading.visible = true;
         §1t3318s0§.instance.§1t3451s0§(this.§1t7056s0§.key,false,false);
      }
      
      internal function §1t7066s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.brackets.scaleX != 1)
         {
            this.brackets.scaleX = 1;
            this.brackets.scaleY = 1;
            this.§1t7055s0§.§1t5769s0§(§1t1521s0§.getString(761));
            this.draglabel.visible = true;
         }
         else
         {
            this.§1t7070s0§();
         }
      }
      
      internal function §1t7067s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t7047s0§.visible = false;
         if(this.placebet.visible)
         {
            this.§1t7078s0§();
         }
         §1t251s0§.instance.§1t3579s0§(this.§1t7056s0§.key);
         §1t406s0§.instance.§1t6484s0§.loading.visible = true;
      }
      
      public function §1t7068s0§() : *
      {
         setTimeout(§1t3318s0§.instance.§1t3451s0§,4000,this.§1t7056s0§.key,false,false);
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         this.§1t7056s0§.timeout = this.§1t7056s0§.roundduration + §1t3317s0§.instance.§1t1847s0§();
      }
      
      public function §1t7069s0§() : *
      {
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         §1t88s0§.instance.§1t1516s0§("Snd_error");
      }
      
      internal function §1t7070s0§() : *
      {
         var _loc1_:Number = 1;
         this.brackets.x = 51;
         this.brackets.y = 56;
         if(this.maxplayers == 2)
         {
            this.§1t7055s0§.visible = false;
            this.brackets.x = 238;
            this.brackets.y = 168;
         }
         else if(this.maxplayers == 4)
         {
            this.§1t7055s0§.visible = false;
            this.brackets.x = 120;
            this.brackets.y = 110;
         }
         else if(this.maxplayers == 8)
         {
            _loc1_ = 0.75;
         }
         else if(this.maxplayers == 16)
         {
            _loc1_ = 0.38;
         }
         this.brackets.scaleX = _loc1_;
         this.brackets.scaleY = _loc1_;
         this.§1t7055s0§.§1t5769s0§(§1t1521s0§.getString(760));
         this.draglabel.visible = false;
      }
      
      internal function §1t7071s0§(param1:MouseEvent) : *
      {
         param1.stopImmediatePropagation();
         if(§1t406s0§.instance.§1t6484s0§.loading.visible || this.brackets.scaleX != 1 || this.maxplayers <= 4)
         {
            return;
         }
         this.§1t7058s0§ = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         this.§1t7059s0§ = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         if(this.§1t7058s0§ < 51 || this.§1t7059s0§ < 56 || this.§1t7058s0§ > 752 || this.§1t7059s0§ > 460)
         {
            return;
         }
         this.§1t7060s0§ = true;
      }
      
      internal function §1t7072s0§(param1:MouseEvent) : *
      {
         param1.stopImmediatePropagation();
         this.§1t7060s0§ = false;
      }
      
      internal function update() : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:int = (stage.mouseX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc2_:int = (stage.mouseY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         if(_loc1_ < 0 || _loc1_ > 800 || _loc2_ < 0 || _loc2_ > 480)
         {
            this.§1t7060s0§ = false;
         }
         if(this.§1t7060s0§ && _loc1_ != this.§1t7058s0§ && _loc2_ != this.§1t7059s0§)
         {
            _loc3_ = _loc1_ - this.§1t7058s0§;
            _loc4_ = _loc2_ - this.§1t7059s0§;
            this.§1t7058s0§ = _loc1_;
            this.§1t7059s0§ = _loc2_;
            this.§1t7073s0§(_loc3_,_loc4_);
         }
         if(visible && this.§1t7056s0§ != null && this.§1t7056s0§.status == 1 && !§1t406s0§.instance.§1t6484s0§.loading.visible)
         {
            _loc5_ = this.§1t7056s0§.timeout - §1t3317s0§.instance.§1t1847s0§();
            _loc6_ = "";
            if(this.placebet.visible)
            {
               if(_loc5_ < 0 && this.§1t7056s0§.roundduration != 0)
               {
                  _loc6_ = §1t1521s0§.getString(11012);
               }
               else if(_loc5_ > this.§1t7056s0§.roundduration)
               {
                  _loc6_ = §1t1521s0§.getString(11011,[this.§1t937s0§(_loc5_ - this.§1t7056s0§.roundduration)]);
               }
               else if(this.§1t7056s0§.roundduration != 0)
               {
                  _loc6_ = §1t1521s0§.getString(11013,[this.§1t937s0§(_loc5_)]);
               }
               this.placebet.§1t5300s0§(_loc6_,-1,_loc5_,this.§1t7056s0§.roundduration);
            }
            else
            {
               if(_loc5_ < 0 && this.§1t7056s0§.roundduration != 0)
               {
                  _loc6_ = §1t1521s0§.getString(11009);
                  _loc7_ = 2;
               }
               else if(_loc5_ > this.§1t7056s0§.roundduration - 300)
               {
                  _loc6_ = §1t1521s0§.getString(997,[this.§1t937s0§(_loc5_ - (this.§1t7056s0§.roundduration - 300))]);
                  _loc7_ = 0;
               }
               else if(this.§1t7056s0§.roundduration != 0)
               {
                  _loc6_ = §1t1521s0§.getString(11010,[this.§1t937s0§(_loc5_)]);
                  _loc7_ = 1;
               }
               _loc8_ = int(this.§1t7056s0§.tier);
               _loc9_ = int(this.§1t7062s0§[_loc8_].length);
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  this.§1t7062s0§[_loc8_][_loc10_].§1t5300s0§(_loc6_,_loc7_,_loc5_,this.§1t7056s0§.roundduration);
                  _loc10_++;
               }
               this.§1t7062s0§[3][1].§1t5300s0§(_loc6_,_loc7_,_loc5_,this.§1t7056s0§.roundduration);
            }
         }
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
         if(_loc4_ < 10)
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
      
      internal function §1t7073s0§(param1:int, param2:int) : *
      {
         this.brackets.x += param1;
         this.brackets.y += param2;
         if(this.brackets.x > 51)
         {
            this.brackets.x = 51;
         }
         if(this.brackets.y > 56)
         {
            this.brackets.y = 56;
         }
         if(this.maxplayers == 8)
         {
            if(this.brackets.x < -125)
            {
               this.brackets.x = -125;
            }
            if(this.brackets.y < -67)
            {
               this.brackets.y = -67;
            }
         }
         else if(this.maxplayers == 16)
         {
            if(this.brackets.x < -420)
            {
               this.brackets.x = -420;
            }
            if(this.brackets.y < -590)
            {
               this.brackets.y = -590;
            }
         }
      }
      
      public function §1t7076s0§(param1:§1t396s0§) : *
      {
         this.§1t7074s0§ = param1;
      }
      
      public function §1t7077s0§(param1:§1t396s0§) : *
      {
         this.§1t7074s0§ = param1;
         this.placebet.§1t5309s0§(this.§1t7074s0§,false);
         this.placebet.visible = true;
         this.placebet.§1t5297s0§(true);
         this.brackets.visible = false;
         this.draglabel.visible = false;
         this.infotext.visible = true;
         this.§1t7047s0§.visible = false;
         this.refreshbutton.visible = false;
      }
      
      public function §1t7078s0§() : *
      {
         this.placebet.visible = false;
         this.placebet.§1t5297s0§(false);
         this.placebet.§1t5310s0§();
         this.brackets.visible = true;
         this.goldtext.text = §1t1523s0§.§1t9714s0§(20112).toString();
         this.§1t7075s0§.§1t695s0§(§1t1523s0§.§1t9714s0§(20112));
         if(this.brackets.scaleX == 1 && this.maxplayers > 4)
         {
            this.draglabel.visible = true;
         }
         this.infotext.visible = false;
         if(this.§1t7056s0§.status != 2 && this.§1t7056s0§.organizer == §1t1523s0§.charname && this.§1t7056s0§.timeout < §1t3317s0§.instance.§1t1847s0§())
         {
            this.§1t7047s0§.visible = true;
         }
         else
         {
            this.§1t7047s0§.visible = false;
         }
         this.refreshbutton.visible = true;
      }
      
      public function §1t7079s0§(param1:int) : *
      {
         this.§1t7075s0§.§1t698s0§(param1);
         this.goldtext.text = this.§1t7075s0§.§1t697s0§().toString();
      }
      
      public function §1t7080s0§() : *
      {
         §1t1523s0§.§1t9712s0§(20112,this.§1t7075s0§.§1t697s0§());
         §1t3317s0§.instance.§1t1946s0§();
      }
      
      public function §1t7081s0§() : *
      {
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         this.§1t7074s0§.§1t5309s0§(this.placebet,true);
         this.§1t7078s0§();
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
      }
      
      public function §1t7082s0§(param1:int) : *
      {
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         this.§1t7078s0§();
         §1t88s0§.instance.§1t1516s0§("Snd_error");
         this.§1t7074s0§.§1t5303s0§();
         this.§1t7074s0§.§1t5311s0§(§1t1521s0§.getString(11014),55);
         this.§1t7079s0§(param1);
         this.§1t7080s0§();
      }
      
      public function §1t7083s0§() : *
      {
         §1t406s0§.instance.§1t6484s0§.loading.visible = false;
         this.§1t7074s0§.§1t5311s0§(§1t1521s0§.getString(11015),85);
         §1t88s0§.instance.§1t1516s0§("Snd_error");
         this.§1t7074s0§ = null;
      }
      
      public function hide() : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!visible)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < 4)
         {
            _loc2_ = int(this.§1t7062s0§[_loc1_].length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.§1t7062s0§[_loc1_][_loc3_].§1t5301s0§();
               _loc3_++;
            }
            _loc1_++;
         }
         this.§1t7074s0§ = null;
         this.removeEventListeners();
         visible = false;
      }
   }
}

