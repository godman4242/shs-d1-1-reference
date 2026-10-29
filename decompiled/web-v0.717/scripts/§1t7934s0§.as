package
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol584")]
   public class §1t7934s0§ extends MovieClip
   {
      
      public static var §1t12535s0§:int = 8;
      
      public static var §1t12536s0§:int = 21;
      
      public static var §1t12537s0§:int = 51;
      
      public static var §1t12538s0§:int = §1t12536s0§;
      
      public static var §1t12539s0§:int = §1t12537s0§;
      
      public var §1t7725s0§:MovieClip;
      
      public var cropstext:TextField;
      
      public var flagcanvas:§1t5016s0§;
      
      public var grid:MovieClip;
      
      public var hqtext:TextField;
      
      public var map:MovieClip;
      
      public var msgBoard:§1t6310s0§;
      
      public var msgBoardButton:§1t5050s0§;
      
      public var nextbattlelabel:TextField;
      
      public var selectbattlelabel:TextField;
      
      public var selectionmarker:MovieClip;
      
      public var §1t5021s0§:TextField;
      
      public var §1t7943s0§:§1t7897s0§;
      
      public var warmarkercanvas:§1t5016s0§;
      
      public var warstat:TextField;
      
      public var zoominbutton:§1t5050s0§;
      
      public var zoomoutbutton:§1t5050s0§;
      
      internal var §1t7948s0§:Array;
      
      internal var §1t7949s0§:Array;
      
      internal var §1t7950s0§:Array;
      
      internal var §1t7951s0§:String;
      
      internal var §1t7952s0§:Array;
      
      internal var §1t7827s0§:int = -1;
      
      internal var §1t7828s0§:int = -1;
      
      internal var §1t7829s0§:int = -1;
      
      internal var §1t7060s0§:Boolean = false;
      
      internal var §1t7058s0§:int;
      
      internal var §1t7059s0§:int;
      
      internal var §1t7953s0§:Boolean;
      
      internal var §1t7815s0§:§1t75s0§;
      
      internal var §1t7954s0§:Boolean = false;
      
      internal var §1t7955s0§:int = 63;
      
      internal var §1t7956s0§:int = 72;
      
      internal var §1t7957s0§:Number = 1;
      
      internal var §1t7958s0§:BitmapData;
      
      internal var §1t7959s0§:int;
      
      internal var §1t7960s0§:int;
      
      internal var §1t7961s0§:int = 10;
      
      internal var §1t7962s0§:int = 21;
      
      internal var §1t7963s0§:int = 63;
      
      internal var §1t7964s0§:int = 800;
      
      internal var §1t7965s0§:int = 800;
      
      internal var §1t7966s0§:int = 700;
      
      internal var §1t7967s0§:int = 330;
      
      internal var §1t7968s0§:int = 14;
      
      internal var §1t7969s0§:int = 7;
      
      internal var §1t7970s0§:int = 0;
      
      internal var §1t7971s0§:int = 0;
      
      internal var §1t7972s0§:Array;
      
      internal var §1t7973s0§:int = -1;
      
      internal var §1t7974s0§:int = -1;
      
      internal var §1t7975s0§:int;
      
      internal var §1t7979s0§:int = 200;
      
      public function §1t7934s0§()
      {
         var _loc1_:§1t417s0§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         super();
         this.§1t7948s0§ = new Array();
         this.§1t7949s0§ = new Array();
         this.§1t7950s0§ = new Array();
         §1t1521s0§.§1t9290s0§(this.selectbattlelabel,true);
         §1t1521s0§.§1t9290s0§(this.cropstext,true);
         this.cropstext.text = "";
         this.cropstext.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.hqtext,true);
         this.hqtext.text = "";
         this.hqtext.mouseEnabled = false;
         this.selectbattlelabel.text = §1t1521s0§.getString(307);
         §1t1521s0§.§1t9290s0§(this.nextbattlelabel);
         this.nextbattlelabel.text = §1t1521s0§.getString(564);
         this.zoominbutton.§1t5769s0§(§1t1521s0§.getString(760));
         this.zoomoutbutton.§1t5769s0§(§1t1521s0§.getString(761));
         this.§1t7815s0§ = new §1t75s0§();
         this.§1t7815s0§.§1t6246s0§("lightstanceidle",0);
         this.§1t7815s0§.scaleX = 0.5;
         this.§1t7815s0§.scaleY = 0.5;
         this.§1t7815s0§.x = 25;
         this.§1t7815s0§.y = 42;
         this.flagcanvas.addChild(this.§1t7815s0§);
         this.flagcanvas.addChild(this.selectionmarker);
         if(§1t1523s0§.§1t9528s0§)
         {
            this.selectionmarker.visible = false;
         }
         this.flagcanvas.mouseEnabled = false;
         this.flagcanvas.mouseChildren = false;
         this.§1t7725s0§.buttonMode = true;
         this.§1t7958s0§ = §1t1524s0§.§1t9892s0§();
         this.§1t7949s0§ = §1t1524s0§.§1t9851s0§();
         _loc2_ = 0;
         while(_loc2_ < this.§1t7968s0§)
         {
            this.§1t7948s0§[_loc2_] = new Array();
            _loc3_ = 0;
            while(_loc3_ < this.§1t7969s0§)
            {
               _loc1_ = new §1t417s0§();
               _loc1_.scaleX = 1 / 5 * 5.5;
               _loc1_.scaleY = 1 / 5 * 5.5;
               _loc1_.x = _loc2_ * 10 * 5.5;
               _loc1_.y = _loc3_ * 10 * 5.5;
               this.warmarkercanvas.addChild(_loc1_);
               this.§1t7948s0§[_loc2_][_loc3_] = _loc1_;
               _loc3_++;
            }
            _loc2_++;
         }
         if(§1t1523s0§.§1t9528s0§)
         {
            this.map.removeChild(this.map.shadowmap);
            this.§1t7972s0§ = new Array();
            _loc2_ = 0;
            while(_loc2_ < 10)
            {
               this.§1t7972s0§[_loc2_] = new Array();
               _loc3_ = 0;
               while(_loc3_ < 10)
               {
                  _loc4_ = this.map.getChildByName("map_" + _loc2_ + "_" + _loc3_);
                  if(_loc4_ != null)
                  {
                     this.§1t7972s0§[_loc2_][_loc3_] = _loc4_;
                  }
                  _loc3_++;
               }
               _loc2_++;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < 10)
            {
               _loc3_ = 0;
               while(_loc3_ < 10)
               {
                  _loc4_ = this.map.getChildByName("map_" + _loc2_ + "_" + _loc3_);
                  if(_loc4_ != null)
                  {
                     this.map.removeChild(_loc4_);
                  }
                  _loc3_++;
               }
               _loc2_++;
            }
            this.map.cacheAsBitmap = true;
         }
      }
      
      internal function §1t7976s0§(param1:int, param2:int) : *
      {
         return this.§1t7958s0§.getPixel(param1 + §1t12536s0§ - §1t12535s0§,param2 + §1t12537s0§) != 0;
      }
      
      public function §1t7977s0§(param1:String, param2:String) : *
      {
         var _loc4_:Array = null;
         var _loc5_:§1t418s0§ = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:§1t7742s0§ = null;
         var _loc12_:int = 0;
         if(param1 != "")
         {
            this.§1t7951s0§ = param1;
         }
         this.§1t7975s0§ = 0;
         var _loc3_:* = param2.split("|");
         this.§1t7952s0§ = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc6_].split(",");
            _loc5_ = null;
            _loc12_ = 0;
            while(_loc12_ < this.§1t7952s0§.length)
            {
               if(this.§1t7952s0§[_loc12_].§1t1025s0§() == _loc4_[0])
               {
                  _loc5_ = this.§1t7952s0§[_loc12_];
                  break;
               }
               _loc12_++;
            }
            if(_loc5_ == null)
            {
               _loc5_ = new §1t418s0§(_loc4_[0]);
            }
            _loc5_.§1t1023s0§(_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4]);
            this.§1t7952s0§.push(_loc5_);
            if(_loc4_[1] == §1t1523s0§.§1t7746s0§() && _loc4_[2] != §1t418s0§.§1t8816s0§)
            {
               ++this.§1t7975s0§;
            }
            _loc6_++;
         }
         this.§1t7989s0§();
         _loc7_ = int(this.§1t7950s0§.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            this.flagcanvas.removeChild(this.§1t7950s0§[_loc6_]);
            _loc6_++;
         }
         this.§1t7950s0§.length = 0;
         this.§1t7952s0§.sortOn("territoryY",Array.NUMERIC);
         _loc7_ = int(this.§1t7952s0§.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            if(this.§1t7952s0§[_loc6_].§1t1026s0§())
            {
               _loc10_ = int(this.§1t7952s0§[_loc6_].mapid);
               _loc8_ = (_loc10_ >> 12 & 0x0FFF) - 341;
               _loc9_ = (_loc10_ & 0x0FFF) - 341;
               _loc11_ = new §1t7742s0§(this.§1t7952s0§[_loc6_].§1t1031s0§(),this.§1t7981s0§(_loc8_,_loc9_));
               _loc11_.x = (_loc8_ + §1t12536s0§) * 10 + 4.5;
               _loc11_.y = (_loc9_ + §1t12537s0§) * 10 + 8.8;
               this.flagcanvas.addChild(_loc11_);
               this.§1t7950s0§.push(_loc11_);
            }
            _loc6_++;
         }
         this.§1t7978s0§();
         §1t3318s0§.instance.§1t3421s0§(§1t1523s0§.§1t7746s0§(),this.§1t7980s0§);
      }
      
      internal function §1t7978s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§1t7827s0§ != -1)
         {
            _loc1_ = this.§1t7827s0§;
            _loc2_ = (_loc1_ >> 12 & 0x0FFF) - 341;
            _loc3_ = (_loc1_ & 0x0FFF) - 341;
            this.§1t7815s0§.x = (_loc2_ + §1t12536s0§) * 10 + 5;
            this.§1t7815s0§.y = (_loc3_ + §1t12537s0§) * 10 + 8.5;
            this.§1t7815s0§.visible = true;
            this.flagcanvas.setChildIndex(this.§1t7815s0§,this.flagcanvas.numChildren - 1);
         }
         else
         {
            this.§1t7815s0§.visible = false;
         }
         this.flagcanvas.setChildIndex(this.selectionmarker,this.flagcanvas.numChildren - 1);
      }
      
      public function §1t7980s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()))
         {
            _loc3_ = §1t1523s0§.§1t9660s0§();
            _loc4_ = "";
            if(_loc3_ == 0)
            {
               _loc4_ = §1t1521s0§.getString(832);
            }
            else if(_loc3_ < 5)
            {
               _loc4_ = §1t1521s0§.getString(833,[_loc3_.toString(),"5"]);
            }
            else if(_loc3_ < 10)
            {
               _loc4_ = §1t1521s0§.getString(833,[_loc3_.toString(),"10"]);
            }
            else if(_loc3_ < §1t1523s0§.§1t9401s0§)
            {
               _loc4_ = §1t1521s0§.getString(834,[_loc3_.toString()]);
            }
            else
            {
               _loc4_ = §1t1521s0§.getString(835,[_loc3_.toString()]);
            }
            this.cropstext.text = _loc4_;
            if(_loc3_ == 0)
            {
               _loc2_ = 0;
            }
            else if(_loc3_ < 5)
            {
               _loc2_ = 1;
            }
            else if(_loc3_ < 10)
            {
               _loc2_ = 2;
            }
            else
            {
               _loc2_ = 3;
            }
            if(this.§1t7975s0§ > _loc2_)
            {
               _loc2_ = this.§1t7975s0§;
            }
            if(§1t1523s0§.§1t9553s0§() >= 9)
            {
               this.hqtext.text = §1t1521s0§.getString(808) + ":  " + this.§1t7975s0§ + " / " + _loc2_;
            }
            else
            {
               this.hqtext.text = "";
            }
            return;
         }
         this.cropstext.text = §1t1521s0§.getString(807) + ": " + param1;
         if(param1 >= this.§1t7979s0§ * 2)
         {
            this.cropstext.appendText(" (+2 HQ)");
         }
         else if(param1 >= this.§1t7979s0§)
         {
            this.cropstext.appendText(" (+1 HQ)");
         }
         _loc2_ = 3 + Math.floor(param1 / this.§1t7979s0§);
         if(_loc2_ > 5)
         {
            _loc2_ = 5;
         }
         if(this.§1t7975s0§ > _loc2_)
         {
            _loc2_ = this.§1t7975s0§;
         }
         if(§1t1523s0§.§1t9553s0§() >= 9)
         {
            this.hqtext.text = §1t1521s0§.getString(808) + ":  " + this.§1t7975s0§ + " / " + _loc2_;
         }
         else
         {
            this.hqtext.text = "";
         }
      }
      
      public function §1t7837s0§(param1:int, param2:int, param3:int) : *
      {
         var _loc4_:Boolean = this.§1t7827s0§ != param1;
         this.§1t7827s0§ = param1;
         this.§1t7828s0§ = param2;
         this.§1t7829s0§ = param3;
         if(_loc4_)
         {
            this.§1t7978s0§();
         }
      }
      
      public function show() : *
      {
         var _loc2_:String = null;
         var _loc5_:§1t7742s0§ = null;
         visible = true;
         this.§1t5004s0§();
         var _loc1_:int = §1t1523s0§.§1t7746s0§();
         if(§1t1523s0§.§1t9663s0§(_loc1_))
         {
            this.§1t7725s0§.gotoAndStop(7);
            this.§1t7725s0§.custom.init(§1t1523s0§.§1t9655s0§(),§1t1523s0§.§1t9658s0§(),§1t1523s0§.§1t9659s0§());
         }
         else
         {
            this.§1t7725s0§.gotoAndStop(_loc1_);
         }
         if(_loc1_ == 1)
         {
            _loc2_ = §1t1521s0§.getString(275);
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = §1t1521s0§.getString(276);
         }
         else if(_loc1_ == 3)
         {
            _loc2_ = §1t1521s0§.getString(277);
         }
         else if(_loc1_ == 4)
         {
            _loc2_ = §1t1521s0§.getString(278);
         }
         else
         {
            _loc2_ = §1t1521s0§.getString(563,[§1t1523s0§.§1t9654s0§()]);
         }
         this.warstat.text = §1t1521s0§.getString(245) + ": " + _loc2_ + "\n";
         if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9277s0§ || §1t1521s0§.getLanguage() == §1t1521s0§.§1t9279s0§)
         {
            this.warstat.appendText(§1t1523s0§.§1t9555s0§() + " (" + §1t1521s0§.getString(329,[§1t1523s0§.§1t9556s0§()]) + ")\n");
         }
         else
         {
            this.warstat.appendText(§1t1521s0§.getString(153) + ": " + §1t1523s0§.§1t9555s0§() + " (" + §1t1521s0§.getString(329,[§1t1523s0§.§1t9556s0§()]) + ")\n");
         }
         var _loc3_:int = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9424s0§) + int(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9425s0§) / 1000);
         if(§1t1523s0§.§1t9553s0§() < 10)
         {
            this.warstat.appendText(§1t1521s0§.getString(397) + ": " + _loc3_ + "/" + §1t1523s0§.§1t9554s0§());
         }
         this.§1t7815s0§.§1t5491s0§(§1t1523s0§.§1t9732s0§());
         this.§1t7943s0§.visible = false;
         this.msgBoard.visible = false;
         this.msgBoardButton.§1t5769s0§(§1t1521s0§.getString(882));
         this.§1t7973s0§ = -1;
         this.§1t7974s0§ = -1;
         this.§1t7983s0§();
         var _loc4_:int = int(this.§1t7950s0§.length);
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc5_ = this.§1t7950s0§[_loc8_];
            _loc5_.§1t7745s0§();
            if(this.§1t7827s0§ == -1 && _loc5_.§1t7746s0§() == §1t1523s0§.§1t7746s0§())
            {
               _loc6_ = this.§1t7966s0§ / 2 - _loc5_.x;
               _loc7_ = this.§1t7967s0§ / 2 - _loc5_.y;
            }
            _loc8_++;
         }
         if(this.§1t7827s0§ != -1)
         {
            _loc6_ = this.§1t7966s0§ / 2 - this.§1t7815s0§.x;
            _loc7_ = this.§1t7967s0§ / 2 - this.§1t7815s0§.y;
         }
         this.§1t7607s0§(_loc6_,_loc7_);
         this.§1t7984s0§(true);
      }
      
      public function hide() : *
      {
         visible = false;
         this.removeEventListeners();
         var _loc1_:int = int(this.§1t7950s0§.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.§1t7950s0§[_loc2_].§1t7744s0§();
            _loc2_++;
         }
      }
      
      public function §1t5004s0§() : *
      {
         this.§1t7725s0§.addEventListener(MouseEvent.CLICK,this.§1t7990s0§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§1t7071s0§);
         addEventListener(MouseEvent.MOUSE_UP,this.§1t7072s0§);
         this.zoominbutton.addEventListener(MouseEvent.CLICK,this.§1t7985s0§);
         this.zoomoutbutton.addEventListener(MouseEvent.CLICK,this.§1t7988s0§);
         this.msgBoardButton.addEventListener(MouseEvent.CLICK,this.§1t7991s0§);
         this.msgBoard.§1t5004s0§();
      }
      
      public function removeEventListeners() : *
      {
         this.§1t7725s0§.removeEventListener(MouseEvent.CLICK,this.§1t7990s0§);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t7071s0§);
         removeEventListener(MouseEvent.MOUSE_UP,this.§1t7072s0§);
         this.zoominbutton.removeEventListener(MouseEvent.CLICK,this.§1t7985s0§);
         this.zoomoutbutton.removeEventListener(MouseEvent.CLICK,this.§1t7988s0§);
         this.msgBoardButton.removeEventListener(MouseEvent.CLICK,this.§1t7991s0§);
         this.msgBoard.removeEventListeners();
      }
      
      internal function §1t7071s0§(param1:MouseEvent) : *
      {
         this.§1t7060s0§ = true;
         this.§1t7058s0§ = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         this.§1t7059s0§ = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         this.§1t7953s0§ = false;
      }
      
      internal function §1t7072s0§(param1:MouseEvent) : *
      {
         var _loc6_:§1t418s0§ = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:int = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc3_:int = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         this.§1t7060s0§ = false;
         if(this.§1t7953s0§ || _loc2_ < this.§1t7962s0§ || _loc2_ > this.§1t7962s0§ + this.§1t7966s0§ || _loc3_ < this.§1t7963s0§ || _loc3_ > this.§1t7963s0§ + this.§1t7967s0§)
         {
            return;
         }
         if(this.msgBoard.visible && this.msgBoard.hitTestPoint(param1.stageX,param1.stageY))
         {
            return;
         }
         if(this.§1t7943s0§.visible && this.§1t7943s0§.hitTestPoint(param1.stageX,param1.stageY))
         {
            return;
         }
         var _loc4_:int = Math.floor((-this.map.x + _loc2_) / (10 * this.§1t7957s0§)) - §1t12536s0§;
         var _loc5_:int = Math.floor((-this.map.y + _loc3_) / (10 * this.§1t7957s0§)) - §1t12537s0§;
         if(this.§1t7957s0§ < 5.5)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.§1t7986s0§(_loc2_,_loc3_);
         }
         else if(this.§1t7976s0§(_loc4_,_loc5_))
         {
            if(§1t1523s0§.§1t9528s0§)
            {
               this.selectionmarker.visible = true;
            }
            _loc7_ = int(this.§1t7952s0§.length);
            _loc8_ = _loc4_ + 341 << 12 | _loc5_ + 341;
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               if(this.§1t7952s0§[_loc9_].§1t1025s0§() == _loc8_)
               {
                  _loc6_ = this.§1t7952s0§[_loc9_];
                  break;
               }
               _loc9_++;
            }
            §1t88s0§.instance.§1t1516s0§("Snd_click");
            §1t406s0§.instance.§1t6482s0§.§1t8012s0§(_loc8_,this.§1t7981s0§(_loc4_,_loc5_),_loc6_);
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.§1t7988s0§(null);
         }
      }
      
      internal function §1t7981s0§(param1:int, param2:int) : int
      {
         if(!this.§1t7976s0§(param1,param2))
         {
            return -1;
         }
         var _loc3_:int = param1 + 341 << 12 | param2 + 341;
         var _loc4_:int = int(this.§1t7949s0§.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(this.§1t7949s0§[_loc5_] == _loc3_)
            {
               if(_loc5_ < this.§1t7951s0§.length)
               {
                  return this.§1t7951s0§.charAt(_loc5_).charCodeAt(0) - §1t3318s0§.§1t12077s0§;
               }
               return 0;
            }
            _loc5_++;
         }
         return 0;
      }
      
      internal function §1t7982s0§(param1:int, param2:int) : *
      {
         var _loc5_:String = null;
         var _loc3_:int = int(this.§1t7949s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.§1t7949s0§[_loc4_] == param1)
            {
               _loc5_ = this.§1t7951s0§.substr(0,_loc4_) + String.fromCharCode(param2) + this.§1t7951s0§.substr(_loc4_ + 1);
               §1t406s0§.instance.§1t6482s0§.§1t8006s0§ = _loc5_;
               this.§1t7951s0§ = _loc5_;
               return;
            }
            _loc4_++;
         }
      }
      
      internal function update() : *
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc1_:int = (stage.mouseX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc2_:int = (stage.mouseY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         var _loc3_:String = this.selectbattlelabel.text;
         var _loc4_:String = "";
         if(_loc1_ < this.§1t7962s0§ || _loc1_ > this.§1t7962s0§ + this.§1t7966s0§ || _loc2_ < this.§1t7963s0§ || _loc2_ > this.§1t7963s0§ + this.§1t7967s0§)
         {
            this.§1t7060s0§ = false;
            _loc4_ = §1t1521s0§.getString(307);
            if(_loc3_ != _loc4_)
            {
               this.selectbattlelabel.text = _loc4_;
            }
            if(this.§1t7957s0§ == 5.5)
            {
               this.selectionmarker.visible = false;
            }
            return;
         }
         if(!this.§1t7060s0§)
         {
            _loc5_ = Math.floor((-this.map.x + _loc1_) / (10 * this.§1t7957s0§)) - §1t12536s0§;
            _loc6_ = Math.floor((-this.map.y + _loc2_) / (10 * this.§1t7957s0§)) - §1t12537s0§;
            _loc7_ = _loc5_ + 341 << 12 | _loc6_ + 341;
            if(this.§1t7957s0§ == 5.5)
            {
               if(!§1t1523s0§.§1t9528s0§ && Boolean(this.§1t7976s0§(_loc5_,_loc6_)))
               {
                  _loc4_ = §1t1521s0§.getString(307) + " (" + (_loc5_ + §1t12538s0§) + "," + (_loc6_ + §1t12539s0§) + "): " + §1t136s0§.instance.§1t1826s0§(_loc7_);
                  if(_loc3_ != _loc4_)
                  {
                     this.selectbattlelabel.text = _loc4_;
                  }
                  _loc8_ = (_loc5_ + §1t12536s0§) * 10 + 5;
                  _loc9_ = (_loc6_ + §1t12537s0§) * 10 + 5;
                  if(this.selectionmarker.x != _loc8_)
                  {
                     this.selectionmarker.x = _loc8_;
                  }
                  if(this.selectionmarker.y != _loc9_)
                  {
                     this.selectionmarker.y = _loc9_;
                  }
                  this.selectionmarker.visible = true;
               }
               else
               {
                  _loc4_ = §1t1521s0§.getString(307);
                  if(_loc3_ != _loc4_)
                  {
                     this.selectbattlelabel.text = _loc4_;
                  }
                  this.selectionmarker.visible = false;
               }
            }
            else
            {
               _loc4_ = §1t1521s0§.getString(758);
               if(_loc3_ != _loc4_)
               {
                  this.selectbattlelabel.text = §1t1521s0§.getString(758);
               }
               this.selectionmarker.visible = false;
            }
         }
         if(this.§1t7060s0§ && _loc1_ != this.§1t7058s0§ && _loc2_ != this.§1t7059s0§)
         {
            _loc10_ = _loc1_ - this.§1t7058s0§;
            _loc11_ = _loc2_ - this.§1t7059s0§;
            if(Math.abs(_loc10_) + Math.abs(_loc11_) < 3)
            {
               if(!this.§1t7953s0§)
               {
                  this.§1t7953s0§ = false;
               }
               return;
            }
            this.§1t7953s0§ = true;
            this.§1t7058s0§ = _loc1_;
            this.§1t7059s0§ = _loc2_;
            this.§1t7607s0§(_loc10_,_loc11_);
         }
      }
      
      internal function §1t7983s0§() : *
      {
         var _loc1_:int = this.§1t7962s0§ - this.map.x;
         var _loc2_:int = this.§1t7963s0§ - this.map.y;
         this.§1t7607s0§(_loc1_,_loc2_);
      }
      
      internal function §1t7607s0§(param1:int, param2:int) : *
      {
         var _loc3_:§1t417s0§ = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(param1 > 0 && this.map.x + param1 > this.§1t7962s0§)
         {
            param1 = this.§1t7962s0§ - this.map.x;
         }
         else if(param1 < 0 && this.map.x + param1 < this.§1t7962s0§ - (this.§1t7964s0§ * this.§1t7957s0§ - this.§1t7966s0§))
         {
            param1 = this.§1t7962s0§ - (this.§1t7964s0§ * this.§1t7957s0§ - this.§1t7966s0§) - this.map.x;
         }
         if(param2 > 0 && this.map.y + param2 > this.§1t7963s0§)
         {
            param2 = this.§1t7963s0§ - this.map.y;
         }
         else if(param2 < 0 && this.map.y + param2 < this.§1t7963s0§ - (this.§1t7965s0§ * this.§1t7957s0§ - this.§1t7967s0§))
         {
            param2 = this.§1t7963s0§ - (this.§1t7965s0§ * this.§1t7957s0§ - this.§1t7967s0§) - this.map.y;
         }
         if(this.§1t7957s0§ == 5.5)
         {
            if(param1 > 55)
            {
               param1 = 55;
            }
            else if(param1 < -55)
            {
               param1 = -55;
            }
            if(param2 > 55)
            {
               param2 = 55;
            }
            else if(param2 < -55)
            {
               param2 = -55;
            }
         }
         this.map.x += param1;
         this.grid.x = this.map.x;
         this.flagcanvas.x = this.map.x;
         this.map.y += param2;
         this.grid.y = this.map.y;
         this.flagcanvas.y = this.map.y;
         if(this.§1t7957s0§ == 5.5)
         {
            _loc4_ = -1;
            _loc5_ = false;
            _loc6_ = -1;
            _loc7_ = false;
            _loc8_ = 0;
            while(_loc8_ < this.§1t7968s0§)
            {
               _loc9_ = 0;
               while(_loc9_ < this.§1t7969s0§)
               {
                  _loc3_ = this.§1t7948s0§[_loc8_][_loc9_];
                  _loc3_.x += param1;
                  _loc3_.y += param2;
                  if(_loc3_.x < -55)
                  {
                     _loc3_.x += this.§1t7968s0§ * 55;
                     if(_loc4_ == -1)
                     {
                        ++this.§1t7959s0§;
                        ++this.§1t7970s0§;
                        if(this.§1t7970s0§ == this.§1t7968s0§)
                        {
                           this.§1t7970s0§ = 0;
                        }
                        _loc4_ = _loc8_;
                        _loc5_ = false;
                     }
                  }
                  else if(_loc3_.x > (this.§1t7968s0§ - 1) * 55)
                  {
                     _loc3_.x -= this.§1t7968s0§ * 55;
                     if(_loc4_ == -1)
                     {
                        --this.§1t7959s0§;
                        --this.§1t7970s0§;
                        if(this.§1t7970s0§ == -1)
                        {
                           this.§1t7970s0§ = this.§1t7968s0§ - 1;
                        }
                        _loc4_ = _loc8_;
                        _loc5_ = true;
                     }
                  }
                  if(_loc3_.y < -55)
                  {
                     _loc3_.y += this.§1t7969s0§ * 55;
                     if(_loc6_ == -1)
                     {
                        ++this.§1t7960s0§;
                        ++this.§1t7971s0§;
                        if(this.§1t7971s0§ == this.§1t7969s0§)
                        {
                           this.§1t7971s0§ = 0;
                        }
                        _loc6_ = _loc9_;
                        _loc7_ = true;
                     }
                  }
                  else if(_loc3_.y > (this.§1t7969s0§ - 1) * 55)
                  {
                     _loc3_.y -= this.§1t7969s0§ * 55;
                     if(_loc6_ == -1)
                     {
                        --this.§1t7960s0§;
                        --this.§1t7971s0§;
                        if(this.§1t7971s0§ == -1)
                        {
                           this.§1t7971s0§ = this.§1t7969s0§ - 1;
                        }
                        _loc6_ = _loc9_;
                        _loc7_ = false;
                     }
                  }
                  _loc10_ = _loc8_ - this.§1t7970s0§;
                  _loc11_ = _loc9_ - this.§1t7971s0§;
                  if(_loc10_ < 0)
                  {
                     _loc10_ = this.§1t7968s0§ + _loc10_;
                  }
                  if(_loc11_ < 0)
                  {
                     _loc11_ = this.§1t7969s0§ + _loc11_;
                  }
                  if(_loc8_ == _loc4_ || _loc9_ == _loc6_)
                  {
                     this.§1t7987s0§(_loc3_,_loc10_,_loc11_);
                  }
                  _loc9_++;
               }
               _loc8_++;
            }
         }
         this.§1t7984s0§();
      }
      
      internal function §1t7984s0§(param1:Boolean = false) : *
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:DisplayObject = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(this.§1t7972s0§ == null)
         {
            return;
         }
         var _loc2_:Number = 80 * this.§1t7957s0§;
         var _loc3_:int = -Math.floor((this.grid.x - 21) / _loc2_) - 1;
         var _loc4_:int = -Math.floor((this.grid.y - 63) / _loc2_) - 1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         if(param1 || _loc3_ != this.§1t7973s0§ || _loc4_ != this.§1t7974s0§)
         {
            _loc5_ = _loc3_ + Math.ceil(700 / _loc2_);
            _loc6_ = _loc4_ + Math.ceil(330 / _loc2_);
            if(_loc5_ > 9)
            {
               _loc5_ = 9;
            }
            if(_loc6_ > 9)
            {
               _loc6_ = 9;
            }
            if(param1 || this.§1t7973s0§ == -1 || this.§1t7974s0§ == -1 || this.§1t7973s0§ != _loc3_ && this.§1t7974s0§ != _loc4_)
            {
               _loc8_ = 0;
               while(_loc8_ < 10)
               {
                  _loc9_ = 0;
                  while(_loc9_ < 10)
                  {
                     _loc7_ = this.§1t7972s0§[_loc8_][_loc9_];
                     if(_loc7_ != null)
                     {
                        _loc7_.visible = _loc8_ >= _loc3_ && _loc8_ <= _loc5_ && _loc9_ >= _loc4_ && _loc9_ <= _loc6_;
                     }
                     _loc9_++;
                  }
                  _loc8_++;
               }
            }
            else
            {
               if(this.§1t7973s0§ < _loc3_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < 10)
                  {
                     _loc7_ = this.§1t7972s0§[this.§1t7973s0§][_loc8_];
                     if(_loc7_ != null)
                     {
                        _loc7_.visible = false;
                     }
                     _loc7_ = this.§1t7972s0§[_loc5_][_loc8_];
                     if(_loc7_ != null)
                     {
                        _loc7_.visible = true;
                     }
                     _loc8_++;
                  }
               }
               else if(this.§1t7973s0§ > _loc3_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < 10)
                  {
                     if(_loc5_ + 1 <= 9)
                     {
                        _loc7_ = this.§1t7972s0§[_loc5_ + 1][_loc8_];
                        if(_loc7_ != null)
                        {
                           _loc7_.visible = false;
                        }
                     }
                     _loc7_ = this.§1t7972s0§[_loc3_][_loc8_];
                     if(_loc7_ != null)
                     {
                        _loc7_.visible = true;
                     }
                     _loc8_++;
                  }
               }
               if(this.§1t7974s0§ < _loc4_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < 10)
                  {
                     _loc7_ = this.§1t7972s0§[_loc8_][this.§1t7974s0§];
                     if(_loc7_ != null)
                     {
                        _loc7_.visible = false;
                     }
                     _loc7_ = this.§1t7972s0§[_loc8_][_loc6_];
                     if(_loc7_ != null)
                     {
                        _loc7_.visible = true;
                     }
                     _loc8_++;
                  }
               }
               else if(this.§1t7974s0§ > _loc4_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < 10)
                  {
                     if(_loc6_ + 1 <= 9)
                     {
                        _loc7_ = this.§1t7972s0§[_loc8_][_loc5_ + 1];
                        if(_loc7_ != null)
                        {
                           _loc7_.visible = false;
                        }
                     }
                     _loc7_ = this.§1t7972s0§[_loc8_][_loc4_];
                     if(_loc7_ != null)
                     {
                        _loc7_.visible = true;
                     }
                     _loc8_++;
                  }
               }
            }
            this.§1t7973s0§ = _loc3_;
            this.§1t7974s0§ = _loc4_;
         }
      }
      
      internal function §1t7985s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         var _loc2_:int = this.§1t7962s0§ + this.§1t7966s0§ / 2;
         var _loc3_:int = this.§1t7963s0§ + this.§1t7967s0§ / 2;
         this.§1t7986s0§(_loc2_,_loc3_);
      }
      
      internal function §1t7986s0§(param1:int, param2:int) : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t7742s0§ = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:§1t417s0§ = null;
         var _loc9_:int = 0;
         if(this.§1t7957s0§ < 5.5)
         {
            if(this.§1t7957s0§ == 1)
            {
               this.§1t7957s0§ = 5.5;
               this.zoomoutbutton.visible = true;
               this.zoominbutton.visible = false;
               this.warmarkercanvas.visible = true;
               if(!§1t1523s0§.§1t9528s0§)
               {
                  this.selectionmarker.visible = true;
               }
            }
            this.§1t7613s0§(this.map,param1,param2,this.§1t7957s0§);
            _loc3_ = int(this.§1t7950s0§.length);
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc4_ = this.§1t7950s0§[_loc5_];
               _loc4_.scaleX = 1 / this.§1t7957s0§;
               _loc4_.scaleY = 1 / this.§1t7957s0§;
               _loc5_++;
            }
            this.§1t7815s0§.scaleX = 0.5 / this.§1t7957s0§;
            this.§1t7815s0§.scaleY = 0.5 / this.§1t7957s0§;
            this.selectionmarker.scaleX = 1 / this.§1t7957s0§;
            this.selectionmarker.scaleY = 1 / this.§1t7957s0§;
            this.grid.scaleX = this.§1t7957s0§;
            this.grid.scaleY = this.§1t7957s0§;
            this.flagcanvas.scaleX = this.§1t7957s0§;
            this.flagcanvas.scaleY = this.§1t7957s0§;
            this.grid.x = this.map.x;
            this.flagcanvas.x = this.map.x;
            this.grid.y = this.map.y;
            this.flagcanvas.y = this.map.y;
            this.§1t7970s0§ = 0;
            this.§1t7971s0§ = 0;
            if(this.warmarkercanvas.visible)
            {
               _loc6_ = (this.map.x - this.§1t7962s0§) % 55;
               _loc7_ = (this.map.y - this.§1t7963s0§) % 55;
               this.§1t7959s0§ = Math.ceil((_loc6_ - (this.map.x + this.§1t7962s0§)) / 55) - 8;
               this.§1t7960s0§ = Math.ceil((_loc7_ - (this.map.y + this.§1t7963s0§)) / 55) + 2;
               _loc5_ = 0;
               while(_loc5_ < this.§1t7968s0§)
               {
                  _loc9_ = 0;
                  while(_loc9_ < this.§1t7969s0§)
                  {
                     _loc8_ = this.§1t7948s0§[_loc5_][_loc9_];
                     _loc8_.x = _loc5_ * 10 * 5.5 + _loc6_;
                     _loc8_.y = _loc9_ * 10 * 5.5 + _loc7_;
                     this.§1t7987s0§(_loc8_,_loc5_,_loc9_);
                     _loc9_++;
                  }
                  _loc5_++;
               }
            }
         }
         this.§1t7984s0§(true);
      }
      
      internal function §1t7987s0§(param1:§1t417s0§, param2:int, param3:int) : *
      {
         if(this.§1t7958s0§.getPixel(param2 + this.§1t7959s0§,param3 + this.§1t7960s0§) != 0)
         {
            param1.visible = true;
            param1.§1t7765s0§(this.§1t7981s0§(param2 + this.§1t7959s0§ - §1t12536s0§ + 8,param3 + this.§1t7960s0§ - §1t12537s0§));
         }
         else
         {
            param1.visible = false;
         }
      }
      
      internal function §1t7988s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§1t7742s0§ = null;
         var _loc6_:int = 0;
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         if(this.§1t7957s0§ > 1)
         {
            _loc2_ = this.§1t7962s0§ + this.§1t7966s0§ / 2;
            _loc3_ = this.§1t7963s0§ + this.§1t7967s0§ / 2;
            if(this.§1t7957s0§ == 5.5)
            {
               this.§1t7957s0§ = 1;
               this.zoominbutton.visible = true;
               this.zoomoutbutton.visible = false;
               this.warmarkercanvas.visible = false;
               this.selectionmarker.visible = false;
            }
            this.§1t7613s0§(this.map,_loc2_,_loc3_,this.§1t7957s0§);
            _loc4_ = int(this.§1t7950s0§.length);
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ = this.§1t7950s0§[_loc6_];
               _loc5_.scaleX = 1 / this.§1t7957s0§;
               _loc5_.scaleY = 1 / this.§1t7957s0§;
               _loc6_++;
            }
            this.§1t7815s0§.scaleX = 0.5 / this.§1t7957s0§;
            this.§1t7815s0§.scaleY = 0.5 / this.§1t7957s0§;
            this.selectionmarker.scaleX = 1 / this.§1t7957s0§;
            this.selectionmarker.scaleY = 1 / this.§1t7957s0§;
            if(this.map.x > this.§1t7962s0§)
            {
               this.map.x = this.§1t7962s0§;
            }
            else if(this.map.x < this.§1t7962s0§ - (this.§1t7964s0§ * this.§1t7957s0§ - this.§1t7966s0§))
            {
               this.map.x = this.§1t7962s0§ - (this.§1t7964s0§ * this.§1t7957s0§ - this.§1t7966s0§);
            }
            if(this.map.y > this.§1t7963s0§)
            {
               this.map.y = this.§1t7963s0§;
            }
            else if(this.map.y < this.§1t7963s0§ - (this.§1t7965s0§ * this.§1t7957s0§ - this.§1t7967s0§))
            {
               this.map.y = this.§1t7963s0§ - (this.§1t7965s0§ * this.§1t7957s0§ - this.§1t7967s0§);
            }
            this.grid.scaleX = this.§1t7957s0§;
            this.grid.scaleY = this.§1t7957s0§;
            this.flagcanvas.scaleX = this.§1t7957s0§;
            this.flagcanvas.scaleY = this.§1t7957s0§;
            this.grid.x = this.map.x;
            this.flagcanvas.x = this.map.x;
            this.grid.y = this.map.y;
            this.flagcanvas.y = this.map.y;
         }
         this.§1t7984s0§(true);
      }
      
      internal function §1t7989s0§() : *
      {
         var _loc1_:§1t417s0§ = null;
         var _loc3_:int = 0;
         this.§1t7957s0§ = 5.5;
         this.§1t7988s0§(null);
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t7968s0§)
         {
            _loc3_ = 0;
            while(_loc3_ < this.§1t7969s0§)
            {
               _loc1_ = this.§1t7948s0§[_loc2_][_loc3_];
               _loc1_.cacheAsBitmap = false;
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      internal function §1t7613s0§(param1:MovieClip, param2:int, param3:int, param4:Number) : *
      {
         var _loc5_:Point = new Point(param2,param3);
         var _loc6_:Number = param4 / param1.scaleX;
         var _loc7_:Matrix = param1.transform.matrix;
         _loc7_.translate(-_loc5_.x,-_loc5_.y);
         _loc7_.scale(_loc6_,_loc6_);
         _loc7_.translate(_loc5_.x,_loc5_.y);
         param1.transform.matrix = _loc7_;
      }
      
      internal function §1t7990s0§(param1:MouseEvent) : *
      {
         if(!this.§1t7943s0§.visible)
         {
            this.§1t7943s0§.show();
         }
         else
         {
            this.§1t7943s0§.hide();
         }
      }
      
      internal function §1t7991s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.msgBoard.visible)
         {
            this.msgBoard.visible = false;
            this.msgBoardButton.§1t5769s0§(§1t1521s0§.getString(882));
         }
         else
         {
            this.msgBoard.visible = true;
            this.msgBoardButton.§1t5769s0§(§1t1521s0§.getString(883));
            if(!this.msgBoard.§1t5735s0§())
            {
               _loc3_ = §1t1523s0§.§1t7746s0§();
               if(_loc3_ == 1)
               {
                  _loc2_ = §1t1521s0§.getString(275);
               }
               else if(_loc3_ == 2)
               {
                  _loc2_ = §1t1521s0§.getString(276);
               }
               else if(_loc3_ == 3)
               {
                  _loc2_ = §1t1521s0§.getString(277);
               }
               else if(_loc3_ == 4)
               {
                  _loc2_ = §1t1521s0§.getString(278);
               }
               else
               {
                  _loc2_ = §1t1521s0§.getString(563,[§1t1523s0§.§1t9654s0§()]);
               }
               this.msgBoard.init(_loc2_ + " " + §1t1521s0§.getString(317),-1,§1t1523s0§.§1t7746s0§(),"",§1t6310s0§.§1t12427s0§);
            }
            else
            {
               this.msgBoard.§1t6330s0§(60 * 5);
            }
         }
      }
   }
}

