package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3336")]
   public class §1t407s0§ extends MovieClip
   {
      
      public static var instance:§1t407s0§;
      
      public static var §1t12432s0§:int = 0;
      
      public static var §1t12433s0§:int = 1;
      
      public static var §1t12434s0§:int = 2;
      
      public static var §1t12435s0§:int = 3;
      
      public static var §1t12436s0§:int = 4;
      
      public static var §1t12437s0§:int = 5;
      
      public static var §1t12438s0§:int = 6;
      
      public static var §1t12439s0§:int = 7;
      
      public static var §1t12440s0§:int = 8;
      
      public static var §1t12441s0§:int = 9;
      
      public static var §1t12442s0§:int = 10;
      
      public static var §1t12443s0§:int = 11;
      
      public static var §1t12444s0§:int = 12;
      
      public static var §1t12445s0§:int = 13;
      
      public static var §1t12446s0§:int = 14;
      
      public static var §1t12447s0§:int = 15;
      
      public static var §1t12448s0§:int = 16;
      
      public static var §1t12449s0§:int = 17;
      
      public static var §1t12450s0§:int = 18;
      
      public static var §1t12451s0§:int = 19;
      
      public static var §1t12452s0§:int = 20;
      
      public static var §1t12453s0§:int = 21;
      
      public static var §1t12454s0§:int = 22;
      
      public static var §1t12455s0§:int = 23;
      
      public static var §1t12456s0§:int = 24;
      
      public static var §1t12457s0§:int = 25;
      
      public static var §1t12458s0§:int = 26;
      
      public static var §1t12459s0§:int = 27;
      
      public static var §1t12460s0§:int = 28;
      
      public static var §1t12461s0§:int = 29;
      
      public static var §1t12462s0§:int = 30;
      
      public static var §1t12463s0§:int = 31;
      
      public var activequesttext:TextField;
      
      public var nodeName:MovieClip;
      
      public var §1t6373s0§:Vector.<§1t404s0§>;
      
      public var type:int;
      
      public var actionButtonHeight:int = 40;
      
      internal var §1t6375s0§:int = 0;
      
      internal var §1t6376s0§:int = 3;
      
      internal var §1t6377s0§:Boolean = false;
      
      internal var §1t6378s0§:Array;
      
      internal var §1t6379s0§:Array;
      
      internal var §1t6380s0§:Array;
      
      internal var §1t6381s0§:Array;
      
      internal var §1t6397s0§:int;
      
      internal var §1t6398s0§:§1t399s0§;
      
      public function §1t407s0§()
      {
         var _loc1_:§1t404s0§ = null;
         var _loc2_:int = 0;
         this.§1t6378s0§ = new Array();
         this.§1t6379s0§ = new Array();
         this.§1t6380s0§ = new Array();
         this.§1t6381s0§ = new Array();
         super();
         instance = this;
         this.§1t6373s0§ = new Vector.<§1t404s0§>();
         _loc2_ = 0;
         while(_loc2_ < this.§1t6376s0§)
         {
            _loc1_ = new §1t404s0§();
            this.§1t6373s0§.push(_loc1_);
            _loc1_.visible = false;
            _loc1_.x = 10;
            _loc1_.y = 40 + this.actionButtonHeight * _loc2_;
            addChild(_loc1_);
            _loc2_++;
         }
         §1t1521s0§.§1t9290s0§(this.nodeName.label,true);
         this.activequesttext.cacheAsBitmap = true;
         this.activequesttext.mouseEnabled = false;
         this.nodeName.mouseEnabled = false;
         this.nodeName.mouseChildren = false;
      }
      
      public function §1t6382s0§(param1:§1t399s0§) : *
      {
         this.§1t6378s0§.push(param1);
      }
      
      public function §1t6383s0§(param1:§1t122s0§) : *
      {
         this.§1t6380s0§.push(param1);
      }
      
      public function §1t6384s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t399s0§ = null;
         var _loc5_:§1t122s0§ = null;
         var _loc1_:Boolean = false;
         var _loc2_:int = int(this.§1t6380s0§.length);
         if(_loc2_ != this.§1t6381s0§.length)
         {
            _loc1_ = true;
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(this.§1t6380s0§[_loc3_] != this.§1t6381s0§[_loc3_])
               {
                  _loc1_ = true;
                  break;
               }
               _loc3_++;
            }
         }
         if(!_loc1_)
         {
            _loc2_ = int(this.§1t6378s0§.length);
            if(_loc2_ != this.§1t6379s0§.length)
            {
               _loc1_ = true;
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if(this.§1t6378s0§[_loc3_] != this.§1t6379s0§[_loc3_])
                  {
                     _loc1_ = true;
                     break;
                  }
                  _loc3_++;
               }
            }
         }
         if(_loc1_)
         {
            this.§1t6385s0§();
            this.§1t6379s0§.length = 0;
            this.§1t6381s0§.length = 0;
            _loc2_ = int(this.§1t6378s0§.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.§1t6378s0§[_loc3_];
               _loc4_.showInteractButton(true);
               this.§1t6379s0§.push(_loc4_);
               _loc3_++;
            }
            _loc2_ = int(this.§1t6380s0§.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc5_ = this.§1t6380s0§[_loc3_];
               this.§1t6392s0§(_loc5_);
               this.§1t6381s0§.push(_loc5_);
               _loc3_++;
            }
         }
         this.§1t6378s0§.length = 0;
         this.§1t6380s0§.length = 0;
      }
      
      public function §1t6385s0§() : void
      {
         var _loc1_:§1t404s0§ = null;
         var _loc2_:int = int(this.§1t6373s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.§1t6373s0§[_loc3_];
            _loc1_.visible = false;
            _loc1_.§1t5301s0§();
            _loc1_.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
            _loc3_++;
         }
         this.§1t6375s0§ = 0;
      }
      
      public function §1t6386s0§() : int
      {
         return this.§1t6375s0§;
      }
      
      public function §1t6387s0§(param1:int, param2:Boolean) : *
      {
         if(this.§1t6375s0§ >= this.§1t6376s0§)
         {
            return;
         }
         var _loc3_:§1t404s0§ = this.§1t6373s0§[this.§1t6375s0§];
         _loc3_.§1t5759s0§(this.§1t6375s0§,param1);
         if(param2)
         {
            _loc3_.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
            _loc3_.§1t5770s0§(false);
         }
         else
         {
            _loc3_.§1t5770s0§(true);
         }
         ++this.§1t6375s0§;
         _loc3_.visible = true;
      }
      
      public function §1t6388s0§(param1:§1t399s0§, param2:int) : *
      {
         if(this.§1t6375s0§ >= this.§1t6376s0§)
         {
            return;
         }
         var _loc3_:§1t404s0§ = this.§1t6373s0§[this.§1t6375s0§];
         _loc3_.§1t5760s0§(param1,param2);
         _loc3_.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         _loc3_.§1t5770s0§(false);
         ++this.§1t6375s0§;
         _loc3_.visible = true;
         return _loc3_;
      }
      
      public function §1t6389s0§(param1:String, param2:String = "", param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0) : *
      {
         if(this.§1t6375s0§ >= this.§1t6376s0§)
         {
            return;
         }
         var _loc7_:§1t404s0§ = this.§1t6373s0§[this.§1t6375s0§];
         _loc7_.§1t5763s0§(this.§1t6375s0§,param1,param2,param3,param4,param5,param6);
         _loc7_.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         _loc7_.§1t5770s0§(false);
         ++this.§1t6375s0§;
         _loc7_.visible = true;
      }
      
      public function §1t6390s0§(param1:§1t399s0§, param2:String, param3:String = "", param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:Boolean = false) : *
      {
         var _loc9_:§1t404s0§ = null;
         if(this.§1t6375s0§ >= this.§1t6376s0§)
         {
            return;
         }
         _loc9_ = this.§1t6373s0§[this.§1t6375s0§];
         _loc9_.§1t5763s0§(this.§1t6375s0§,param2,param3,param4,param5,param6,param7,param8);
         _loc9_.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         _loc9_.§1t5770s0§(false);
         ++this.§1t6375s0§;
         _loc9_.visible = true;
         _loc9_.§1t5762s0§(param1);
      }
      
      public function §1t6391s0§(param1:String, param2:String = "", param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0) : *
      {
         if(this.§1t6375s0§ >= this.§1t6376s0§)
         {
            return;
         }
         var _loc7_:§1t404s0§ = this.§1t6373s0§[this.§1t6375s0§];
         _loc7_.§1t5763s0§(this.§1t6375s0§,param1,param2,param3,param4,param5,param6);
         ++this.§1t6375s0§;
         _loc7_.§1t5770s0§(true);
         _loc7_.visible = true;
      }
      
      public function §1t6392s0§(param1:§1t122s0§) : *
      {
         if(this.§1t6375s0§ >= this.§1t6376s0§)
         {
            return;
         }
         var _loc2_:§1t404s0§ = this.§1t6373s0§[this.§1t6375s0§];
         _loc2_.§1t4881s0§(param1.charname,param1.§1t3306s0§());
         ++this.§1t6375s0§;
         _loc2_.visible = true;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
      }
      
      public function §1t1182s0§(param1:String) : *
      {
         this.nodeName.label.text = param1;
      }
      
      public function §1t6393s0§(param1:int, param2:String, param3:Boolean) : void
      {
         this.nodeName.label.text = param2;
         this.type = param1;
         switch(param1)
         {
            case 0:
               this.§1t6387s0§(§1t12434s0§,param3);
               break;
            case 1:
               this.§1t6387s0§(§1t12435s0§,param3);
               break;
            case 2:
               this.§1t6387s0§(§1t12435s0§,param3);
               this.§1t6387s0§(§1t12438s0§,param3);
               break;
            case 3:
               this.§1t6387s0§(§1t12435s0§,param3);
               this.§1t6387s0§(§1t12437s0§,param3);
               break;
            case 4:
               this.§1t6387s0§(§1t12435s0§,param3);
               break;
            case 5:
               this.§1t6387s0§(§1t12435s0§,param3);
               break;
            case 6:
               this.§1t6387s0§(§1t12434s0§,param3);
         }
      }
      
      public function §1t5484s0§(param1:MouseEvent) : *
      {
         var _loc2_:§1t404s0§ = null;
         var _loc3_:int = 0;
         var _loc4_:§1t72s0§ = null;
         var _loc5_:§1t122s0§ = null;
         if(§1t1541s0§.§1t10100s0§())
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         _loc2_ = param1.target.parent as §1t404s0§;
         switch(_loc2_.§1t5765s0§())
         {
            case §1t12441s0§:
               if(§1t1523s0§.§1t9606s0§(1))
               {
                  §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12484s0§);
               }
               else
               {
                  §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               }
               break;
            case §1t12439s0§:
               _loc4_ = §1t1524s0§.§1t9886s0§(§1t6427s0§.§1t9911s0§);
               if(!§1t1523s0§.§1t640s0§(_loc4_.condition))
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(_loc4_.§1t1169s0§),§1t1521s0§.getString(5));
                  return;
               }
               this.visible = false;
               if(§1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§())
               {
                  §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(138),§1t1521s0§.getString(5));
                  return;
               }
               if(§1t1523s0§.§1t9606s0§(5))
               {
                  §1t1524s0§.§1t9866s0§(§1t6427s0§.§1t9911s0§);
                  §1t6427s0§.map.setAnimation(§1t6427s0§.§1t9911s0§);
               }
               else
               {
                  §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               }
               break;
            case §1t12434s0§:
               if(§1t1523s0§.§1t9606s0§(1))
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(149),§1t1521s0§.getString(5));
                  §1t1523s0§.§1t9638s0§(100);
                  §1t1523s0§.§1t9639s0§(100);
                  §1t3317s0§.instance.§1t1946s0§();
               }
               else
               {
                  §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               }
               break;
            case §1t12436s0§:
               this.§1t6395s0§(_loc2_.§1t5761s0§());
               break;
            case §1t12433s0§:
            case §1t12440s0§:
               break;
            case §1t12435s0§:
               if(§1t1523s0§.§1t9606s0§(5))
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(128),§1t1521s0§.getString(5));
                  §1t1523s0§.§1t9638s0§(50);
                  §1t1523s0§.§1t9639s0§(50);
                  §1t3317s0§.instance.§1t1946s0§();
               }
               else
               {
                  §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               }
               break;
            case §1t12438s0§:
               if(§1t1523s0§.§1t9606s0§(3))
               {
                  _loc3_ = Math.random() * 10;
                  if(_loc3_ == 3 || _loc3_ == 4 || _loc3_ == 5)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(171),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6488s0§.§1t5845s0§(2112,1,1);
                     §1t406s0§.instance.§1t6488s0§.show();
                  }
                  else if(_loc3_ == 1 || _loc3_ == 2)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(129),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6488s0§.§1t5845s0§(2113,1,1);
                     §1t406s0§.instance.§1t6488s0§.show();
                  }
                  else if(_loc3_ == 0)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(172),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6488s0§.§1t5845s0§(2114,1,1);
                     §1t406s0§.instance.§1t6488s0§.show();
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(130),§1t1521s0§.getString(5));
                  }
                  §1t3317s0§.instance.§1t1946s0§();
               }
               else
               {
                  §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               }
               break;
            case §1t12437s0§:
               if(§1t1523s0§.§1t9606s0§(3))
               {
                  _loc3_ = Math.random() * 10;
                  if(_loc3_ == 3 || _loc3_ == 4 || _loc3_ == 5)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(169),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6488s0§.§1t5845s0§(2109,1,1);
                     §1t406s0§.instance.§1t6488s0§.show();
                  }
                  else if(_loc3_ == 1 || _loc3_ == 2)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(131),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6488s0§.§1t5845s0§(2110,1,1);
                     §1t406s0§.instance.§1t6488s0§.show();
                  }
                  else if(_loc3_ == 0)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(170),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6488s0§.§1t5845s0§(2111,1,1);
                     §1t406s0§.instance.§1t6488s0§.show();
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(130),§1t1521s0§.getString(5));
                  }
                  §1t3317s0§.instance.§1t1946s0§();
               }
               else
               {
                  §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               }
               break;
            case §1t12449s0§:
               _loc5_ = §1t1543s0§.§1t10225s0§(_loc2_.§1t5764s0§());
               if(_loc5_ != null)
               {
                  §1t406s0§.§1t9190s0§().§1t5713s0§(_loc5_);
               }
               §1t1523s0§.§1t9586s0§().§1t4453s0§();
               break;
            case §1t12432s0§:
               if(!_loc2_.§1t5758s0§)
               {
                  §1t1523s0§.§1t9586s0§().§1t4453s0§();
                  this.§1t6401s0§(_loc2_);
               }
               else
               {
                  this.§1t6394s0§(_loc2_);
               }
               break;
            case §1t12442s0§:
               this.§1t6394s0§(_loc2_);
         }
      }
      
      internal function §1t6394s0§(param1:§1t404s0§) : *
      {
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t1523s0§.§1t9586s0§().§1t4453s0§();
         }
         if(param1.§1t5761s0§().needTransition())
         {
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(param1.§1t5761s0§());
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         }
         else
         {
            param1.§1t5761s0§().interact();
         }
      }
      
      public function §1t6395s0§(param1:§1t399s0§) : *
      {
         if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9414s0§) < 2)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11074),§1t1521s0§.getString(5));
            return;
         }
         §1t1523s0§.§1t9608s0§(-2);
         this.§1t6398s0§ = param1;
         §1t1523s0§.§1t9586s0§().§1t3302s0§().§1t6302s0§(24,§1t12436s0§);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t1541s0§.§1t10099s0§();
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            this.§1t6377s0§ = true;
         }
      }
      
      internal function §1t6396s0§() : *
      {
         this.§1t6377s0§ = false;
         this.§1t6398s0§.interact2();
      }
      
      public function §1t6399s0§(param1:int, param2:§1t399s0§) : *
      {
         this.§1t6397s0§ = param1;
         this.§1t6398s0§ = param2;
         §1t1523s0§.§1t9586s0§().§1t3302s0§().§1t6302s0§(24,§1t12460s0§);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t1541s0§.§1t10099s0§();
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            this.§1t6377s0§ = true;
         }
      }
      
      internal function §1t6400s0§() : *
      {
         this.§1t6377s0§ = false;
         if(this.§1t6397s0§ == 1)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20059,1);
         }
         else if(this.§1t6397s0§ == 2)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20060,1);
         }
         else if(this.§1t6397s0§ == 3)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20061,1);
         }
         else if(this.§1t6397s0§ == 4)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20062,1);
         }
         else if(this.§1t6397s0§ == 5)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20063,1);
         }
         else if(this.§1t6397s0§ == 6)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20064,1);
         }
         else if(this.§1t6397s0§ == 7)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20065,1);
         }
         else if(this.§1t6397s0§ == 8)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20066,1);
         }
         if(this.§1t6397s0§ != 1)
         {
            (this.§1t6398s0§ as §1t8602s0§).clearOre();
         }
         §1t406s0§.instance.§1t6488s0§.show();
         §1t3317s0§.instance.§1t1946s0§();
         §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10329s0§);
         this.§1t6398s0§ = null;
         §1t1523s0§.§1t9634s0§(1);
         §1t1523s0§.§1t1684s0§(60003,1);
      }
      
      public function §1t6401s0§(param1:§1t404s0§) : *
      {
         var _loc2_:int = param1.§1t797s0§;
         var _loc3_:int = param1.§1t5754s0§;
         var _loc4_:§1t85s0§ = §1t1524s0§.§1t9872s0§(_loc2_,_loc3_);
         if(§1t1523s0§.§1t640s0§(_loc4_.condition))
         {
            if(§1t1523s0§.§1t9606s0§(_loc4_.ap))
            {
               this.visible = false;
               §1t6427s0§.§1t12475s0§(_loc2_,_loc3_);
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            }
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(_loc4_.failtext,§1t1521s0§.getString(5));
         }
      }
      
      public function §1t6402s0§(param1:int, param2:int) : Boolean
      {
         var _loc3_:§1t404s0§ = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.§1t6376s0§)
         {
            _loc3_ = this.§1t6373s0§[_loc4_];
            if(_loc3_.visible && _loc3_.hitTestPoint(param1,param2))
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
   }
}

