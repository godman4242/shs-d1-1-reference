package
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol290")]
   public class §1t6481s0§ extends MovieClip
   {
      
      public static var §1t12535s0§:int = 8;
      
      public static var §1t12536s0§:int = 21;
      
      public static var §1t12537s0§:int = 51;
      
      public static var §1t12538s0§:int = §1t12536s0§;
      
      public static var §1t12539s0§:int = §1t12537s0§;
      
      public var button_hitarea:§1t5267s0§;
      
      public var castlelabel:TextField;
      
      public var citylabel:TextField;
      
      public var §1t5017s0§:SimpleButton;
      
      public var colorlabel:TextField;
      
      public var destinationmarker:MovieClip;
      
      public var destroyedlabel:TextField;
      
      public var flagcanvas:§1t5016s0§;
      
      public var grid:MovieClip;
      
      public var legendlabel:TextField;
      
      public var loading:MovieClip;
      
      public var map:MovieClip;
      
      public var questlabel:TextField;
      
      public var selectbattlelabel:TextField;
      
      public var selectionmarker:MovieClip;
      
      public var §1t5021s0§:TextField;
      
      public var townlabel:TextField;
      
      public var villagelabel:TextField;
      
      public var warmarkercanvas:§1t5016s0§;
      
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
      
      internal var §1t8043s0§:int = -1;
      
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
      
      internal var §1t8044s0§:int;
      
      internal var §1t8045s0§:int;
      
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
      
      internal var §1t8046s0§:String = "";
      
      public function §1t6481s0§()
      {
         var _loc3_:int = 0;
         var _loc4_:§1t419s0§ = null;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         var _loc1_:String = §1t1521s0§.getString(759);
         var _loc2_:String = "";
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_ += _loc1_.charAt(_loc3_) + "\n";
            _loc3_++;
         }
         this.§1t5021s0§.text = _loc2_;
         this.§1t7948s0§ = new Array();
         this.§1t7949s0§ = new Array();
         this.§1t7950s0§ = new Array();
         §1t1521s0§.§1t9290s0§(this.selectbattlelabel,true);
         this.selectbattlelabel.text = §1t1521s0§.getString(758);
         this.zoominbutton.§1t5769s0§(§1t1521s0§.getString(760));
         this.zoomoutbutton.§1t5769s0§(§1t1521s0§.getString(761));
         §1t1521s0§.§1t9290s0§(this.legendlabel,true);
         §1t1521s0§.§1t9290s0§(this.villagelabel,false);
         §1t1521s0§.§1t9290s0§(this.townlabel,false);
         §1t1521s0§.§1t9290s0§(this.citylabel,false);
         §1t1521s0§.§1t9290s0§(this.castlelabel,false);
         §1t1521s0§.§1t9290s0§(this.questlabel,false);
         §1t1521s0§.§1t9290s0§(this.colorlabel,false);
         this.destroyedlabel.text = §1t1521s0§.getString(811);
         this.legendlabel.text = §1t1521s0§.getString(767);
         this.villagelabel.text = §1t1521s0§.getString(450);
         this.townlabel.text = §1t1521s0§.getString(451);
         this.citylabel.text = §1t1521s0§.getString(452);
         this.castlelabel.text = §1t1521s0§.getString(453);
         this.questlabel.text = §1t1521s0§.getString(769);
         this.colorlabel.text = §1t1521s0§.getString(768);
         this.loading.prompt.text = §1t1521s0§.getString(25);
         this.§1t7815s0§ = new §1t75s0§();
         this.§1t7815s0§.§1t6246s0§("lightstanceidle",0);
         this.§1t7815s0§.scaleX = 0.5;
         this.§1t7815s0§.scaleY = 0.5;
         this.§1t7815s0§.x = 25;
         this.§1t7815s0§.y = 42;
         this.flagcanvas.addChild(this.§1t7815s0§);
         this.flagcanvas.addChild(this.destinationmarker);
         this.flagcanvas.addChild(this.selectionmarker);
         this.flagcanvas.mouseEnabled = false;
         this.flagcanvas.mouseChildren = false;
         this.button_hitarea.visible = false;
         if(§1t1523s0§.§1t9528s0§)
         {
            this.zoominbutton.hitArea = this.button_hitarea;
            this.zoomoutbutton.hitArea = this.button_hitarea;
         }
         this.§1t7958s0§ = §1t1524s0§.§1t9892s0§();
         this.§1t7949s0§ = §1t1524s0§.§1t9851s0§();
         _loc3_ = 0;
         while(_loc3_ < this.§1t7968s0§)
         {
            this.§1t7948s0§[_loc3_] = new Array();
            _loc5_ = 0;
            while(_loc5_ < this.§1t7969s0§)
            {
               _loc4_ = new §1t419s0§();
               _loc4_.scaleX = 1 / 5 * 5.5;
               _loc4_.scaleY = 1 / 5 * 5.5;
               _loc4_.x = _loc3_ * 10 * 5.5;
               _loc4_.y = _loc5_ * 10 * 5.5;
               this.warmarkercanvas.addChild(_loc4_);
               this.§1t7948s0§[_loc3_][_loc5_] = _loc4_;
               _loc5_++;
            }
            _loc3_++;
         }
         this.§1t8046s0§ = §1t1524s0§.§1t9854s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            this.map.removeChild(this.map.shadowmap);
            this.§1t7972s0§ = new Array();
            _loc3_ = 0;
            while(_loc3_ < 10)
            {
               this.§1t7972s0§[_loc3_] = new Array();
               _loc5_ = 0;
               while(_loc5_ < 10)
               {
                  _loc6_ = this.map.getChildByName("map_" + _loc3_ + "_" + _loc5_);
                  if(_loc6_ != null)
                  {
                     this.§1t7972s0§[_loc3_][_loc5_] = _loc6_;
                  }
                  _loc5_++;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < 10)
            {
               _loc5_ = 0;
               while(_loc5_ < 10)
               {
                  _loc6_ = this.map.getChildByName("map_" + _loc3_ + "_" + _loc5_);
                  if(_loc6_ != null)
                  {
                     this.map.removeChild(_loc6_);
                  }
                  _loc5_++;
               }
               _loc3_++;
            }
            this.map.cacheAsBitmap = true;
         }
      }
      
      internal function §1t7976s0§(param1:int, param2:int) : *
      {
         return this.§1t7958s0§.getPixel(param1 + §1t12536s0§ - §1t12535s0§,param2 + §1t12537s0§) != 0;
      }
      
      public function §1t8047s0§(param1:String) : *
      {
         if(param1 != "")
         {
            this.§1t7951s0§ = param1;
         }
         this.loading.visible = false;
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
      }
      
      internal function §1t8048s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§1t8043s0§ != -1)
         {
            _loc1_ = this.§1t8043s0§;
            _loc2_ = (_loc1_ >> 12 & 0x0FFF) - 341;
            _loc3_ = (_loc1_ & 0x0FFF) - 341;
            this.destinationmarker.x = (_loc2_ + §1t12536s0§) * 10 + 5;
            this.destinationmarker.y = (_loc3_ + §1t12537s0§) * 10 + 5;
            this.destinationmarker.visible = true;
            this.flagcanvas.setChildIndex(this.destinationmarker,this.flagcanvas.numChildren - 1);
         }
         else
         {
            this.destinationmarker.visible = false;
         }
         this.flagcanvas.setChildIndex(this.selectionmarker,this.flagcanvas.numChildren - 1);
      }
      
      public function §1t7837s0§(param1:int) : *
      {
         this.§1t7827s0§ = param1;
      }
      
      public function §1t8049s0§(param1:int) : *
      {
         this.§1t8043s0§ = param1;
      }
      
      public function show() : *
      {
         visible = true;
         this.§1t5004s0§();
         §1t1523s0§.§1t9586s0§().§1t4453s0§(false);
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.§1t7815s0§.§1t5491s0§(§1t1523s0§.§1t9732s0§());
         this.§1t7837s0§(§1t70s0§.instance.§1t1134s0§(§1t1525s0§.§1t9935s0§()));
         this.§1t8049s0§(§1t70s0§.instance.§1t1134s0§(§1t123s0§.instance.getMarkedNode()));
         this.§1t7973s0§ = -1;
         this.§1t7974s0§ = -1;
         this.§1t7983s0§();
         this.§1t7989s0§();
         this.§1t7978s0§();
         this.§1t8048s0§();
         var _loc1_:int = this.§1t7966s0§ / 2 - this.§1t7815s0§.x;
         var _loc2_:int = this.§1t7967s0§ / 2 - this.§1t7815s0§.y;
         this.§1t7607s0§(_loc1_,_loc2_);
         this.§1t7984s0§(true);
         §1t6495s0§.instance.§1t1023s0§(0);
         if(this.§1t7951s0§ == null)
         {
            this.loading.visible = true;
            §1t3318s0§.instance.§1t3423s0§();
         }
         else
         {
            this.§1t8047s0§("");
         }
      }
      
      internal function §1t5026s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_menuClose");
         this.hide();
      }
      
      public function hide() : *
      {
         visible = false;
         this.removeEventListeners();
         §1t1541s0§.§1t10045s0§();
         §1t406s0§.instance.§1t6610s0§();
         §1t251s0§.instance.§1t3532s0§(false);
         this.§1t7989s0§();
         §1t406s0§.instance.§1t6614s0§();
      }
      
      public function §1t5004s0§() : *
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.§1t7071s0§);
         addEventListener(MouseEvent.MOUSE_UP,this.§1t7072s0§);
         this.zoominbutton.addEventListener(MouseEvent.CLICK,this.§1t7985s0§);
         this.zoomoutbutton.addEventListener(MouseEvent.CLICK,this.§1t7988s0§);
         this.§1t5017s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
      }
      
      public function removeEventListeners() : *
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t7071s0§);
         removeEventListener(MouseEvent.MOUSE_UP,this.§1t7072s0§);
         this.zoominbutton.removeEventListener(MouseEvent.CLICK,this.§1t7985s0§);
         this.zoomoutbutton.removeEventListener(MouseEvent.CLICK,this.§1t7988s0§);
         this.§1t5017s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
      }
      
      internal function §1t8050s0§(param1:KeyboardEvent) : *
      {
         switch(param1.keyCode)
         {
            case 36:
               this.§1t7607s0§(40,40);
               break;
            case 38:
               this.§1t7607s0§(0,40);
               break;
            case 33:
               this.§1t7607s0§(-40,40);
               break;
            case 37:
               this.§1t7607s0§(40,0);
               break;
            case 39:
               this.§1t7607s0§(-40,0);
               break;
            case 35:
               this.§1t7607s0§(40,-40);
               break;
            case 40:
               this.§1t7607s0§(0,-40);
               break;
            case 34:
               this.§1t7607s0§(-40,-40);
         }
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
         var _loc2_:int = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc3_:int = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         this.§1t7060s0§ = false;
         if(this.loading.visible || this.§1t7953s0§ || _loc2_ < this.§1t7962s0§ || _loc2_ > this.§1t7962s0§ + this.§1t7966s0§ || _loc3_ < this.§1t7963s0§ || _loc3_ > this.§1t7963s0§ + this.§1t7967s0§)
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
         else if(!this.§1t7976s0§(_loc4_,_loc5_))
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
      
      internal function update() : *
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(!visible)
         {
            return;
         }
         var _loc1_:int = (stage.mouseX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc2_:int = (stage.mouseY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         var _loc3_:String = this.selectbattlelabel.text;
         var _loc4_:String = "";
         if(_loc1_ < this.§1t7962s0§ || _loc1_ > this.§1t7962s0§ + this.§1t7966s0§ || _loc2_ < this.§1t7963s0§ || _loc2_ > this.§1t7963s0§ + this.§1t7967s0§)
         {
            this.§1t7060s0§ = false;
            if(this.§1t7957s0§ == 5.5)
            {
               if(_loc3_ != "")
               {
                  this.selectbattlelabel.text = "";
               }
               this.selectionmarker.visible = false;
            }
            else
            {
               _loc4_ = §1t1521s0§.getString(758);
               if(_loc3_ != _loc4_)
               {
                  this.selectbattlelabel.text = _loc4_;
               }
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
               if(this.§1t7976s0§(_loc5_,_loc6_))
               {
                  _loc4_ = §1t136s0§.instance.§1t1826s0§(_loc7_) + " (" + (_loc5_ + §1t12538s0§) + "," + (_loc6_ + §1t12539s0§) + ") " + §1t1521s0§.getString(120) + ": " + §1t70s0§.instance.§1t1143s0§(_loc7_);
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
                  if(_loc3_ != "")
                  {
                     this.selectbattlelabel.text = "";
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
         var _loc3_:§1t419s0§ = null;
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
                        ++this.§1t8044s0§;
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
                        --this.§1t8044s0§;
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
                        ++this.§1t8045s0§;
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
                        --this.§1t8045s0§;
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
                     this.§1t8051s0§(_loc3_,_loc10_,_loc11_);
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
                        _loc7_ = this.§1t7972s0§[_loc8_][_loc6_ + 1];
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
         var _loc8_:§1t419s0§ = null;
         var _loc9_:int = 0;
         if(this.§1t7957s0§ < 5.5)
         {
            if(this.§1t7957s0§ == 1)
            {
               this.§1t7957s0§ = 5.5;
               this.zoomoutbutton.visible = true;
               this.zoominbutton.visible = false;
               this.warmarkercanvas.visible = true;
               this.selectionmarker.visible = true;
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
            this.destinationmarker.scaleX = 1 / this.§1t7957s0§;
            this.destinationmarker.scaleY = 1 / this.§1t7957s0§;
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
               this.§1t8044s0§ = Math.ceil((_loc6_ - (this.map.x + this.§1t7962s0§)) / 55) - 8;
               this.§1t8045s0§ = Math.ceil((_loc7_ - (this.map.y + this.§1t7963s0§)) / 55) + 2;
               _loc5_ = 0;
               while(_loc5_ < this.§1t7968s0§)
               {
                  _loc9_ = 0;
                  while(_loc9_ < this.§1t7969s0§)
                  {
                     _loc8_ = this.§1t7948s0§[_loc5_][_loc9_];
                     _loc8_.x = _loc5_ * 10 * 5.5 + _loc6_;
                     _loc8_.y = _loc9_ * 10 * 5.5 + _loc7_;
                     this.§1t8051s0§(_loc8_,_loc5_,_loc9_);
                     _loc9_++;
                  }
                  _loc5_++;
               }
            }
         }
         this.§1t7984s0§(true);
      }
      
      internal function §1t8051s0§(param1:§1t419s0§, param2:int, param3:int) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(this.§1t7958s0§.getPixel(param2 + this.§1t8044s0§,param3 + this.§1t8045s0§) != 0)
         {
            param1.visible = true;
            _loc4_ = param2 + this.§1t8044s0§ - §1t12536s0§ + 8;
            _loc5_ = param3 + this.§1t8045s0§ - §1t12537s0§;
            _loc6_ = _loc4_ + 341 << 12 | _loc5_ + 341;
            _loc7_ = §1t70s0§.instance.§1t1143s0§(_loc6_);
            _loc8_ = §1t1523s0§.getLevel();
            _loc9_ = 0;
            if(_loc7_ - _loc8_ > 3)
            {
               _loc9_ = 1;
            }
            else if(_loc7_ - _loc8_ < -3)
            {
               _loc9_ = 2;
            }
            param1.§1t8033s0§(§1t1524s0§.§1t9855s0§(_loc6_),_loc9_,this.§1t7981s0§(_loc4_,_loc5_));
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
            this.destinationmarker.scaleX = 1 / this.§1t7957s0§;
            this.destinationmarker.scaleY = 1 / this.§1t7957s0§;
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
         var _loc1_:§1t419s0§ = null;
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
         this.hide();
         §1t406s0§.instance.§1t6482s0§.§1t8011s0§();
      }
      
      public function §1t8052s0§(param1:String) : *
      {
         this.§1t7951s0§ = param1;
      }
   }
}

