package
{
   import flash.display.MovieClip;
   import flash.filters.GlowFilter;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2640")]
   public class §1t75s0§ extends MovieClip
   {
      
      public static var outlineGlowFilter:GlowFilter;
      
      public static var §1t12377s0§:int = 0;
      
      public static var §1t12378s0§:int = 1;
      
      public static var §1t12379s0§:int = 2;
      
      public static var §1t12380s0§:int = 3;
      
      public static var §1t12381s0§:int = 4;
      
      public static var §1t12382s0§:int = 5;
      
      public static var §1t12383s0§:int = 6;
      
      public static var §1t12384s0§:int = 7;
      
      public static var §1t12385s0§:int = 8;
      
      public static var §1t12386s0§:int = 9;
      
      public static var §1t12387s0§:int = 10;
      
      public static var §1t12388s0§:int = 11;
      
      public static var §1t12389s0§:int = 12;
      
      public static var §1t12390s0§:int = 13;
      
      public static var §1t12391s0§:int = 14;
      
      public static var §1t12392s0§:int = 15;
      
      public static var §1t12393s0§:int = 16;
      
      public static var §1t12394s0§:int = 17;
      
      public static var §1t12395s0§:int = 18;
      
      public static var §1t12396s0§:int = 19;
      
      public static var §1t12397s0§:int = 20;
      
      public static var §1t12398s0§:int = 21;
      
      public static var §1t12399s0§:* = 22;
      
      public static var §1t12400s0§:* = 23;
      
      public static var §1t12401s0§:* = 24;
      
      public static var §1t12402s0§:* = 25;
      
      public static var §1t12403s0§:* = 26;
      
      internal static const §1t12405s0§:Class = §1t4628s0§;
      
      internal static const §1t12406s0§:Class = §1t4644s0§;
      
      internal static const §1t12407s0§:Class = §1t4636s0§;
      
      internal static const §1t12408s0§:Class = §1t4632s0§;
      
      internal static const §1t12409s0§:Class = §1t4639s0§;
      
      internal static const §1t12410s0§:Class = §1t4642s0§;
      
      internal static const §1t12411s0§:Class = §1t4627s0§;
      
      internal static const §1t12412s0§:Class = §1t4634s0§;
      
      internal static const §1t12413s0§:Class = §1t4635s0§;
      
      internal static const §1t12414s0§:Class = §1t4630s0§;
      
      internal static const §1t12415s0§:Class = §1t4640s0§;
      
      internal static const §1t12416s0§:Class = §1t4629s0§;
      
      internal static const §1t12417s0§:Class = §1t4638s0§;
      
      internal static const §1t12418s0§:Class = §1t4641s0§;
      
      internal static const §1t12419s0§:Class = §1t4645s0§;
      
      internal static const §1t12420s0§:Class = §1t4633s0§;
      
      internal static const §1t12421s0§:Class = §1t4643s0§;
      
      internal static const §1t12422s0§:Class = §1t4637s0§;
      
      internal static const §1t12423s0§:Class = §1t4631s0§;
      
      internal static var §1t12424s0§:Array = null;
      
      internal var §1t6231s0§:Vector.<MovieClip>;
      
      internal var hair:MovieClip;
      
      internal var §1t6235s0§:MovieClip;
      
      internal var §1t6250s0§:MovieClip;
      
      internal var §1t5659s0§:§1t5660s0§;
      
      internal var §1t5067s0§:§1t249s0§;
      
      internal var displayName:§1t6251s0§;
      
      internal var speech:§1t6253s0§;
      
      internal var §1t6254s0§:§1t6255s0§;
      
      internal var §1t6256s0§:int = 22;
      
      internal var §1t3312s0§:Boolean = false;
      
      internal var §1t6257s0§:String = "";
      
      internal var §1t6236s0§:Boolean = false;
      
      internal var animation:String = "";
      
      internal var §1t6269s0§:int;
      
      internal var §1t6270s0§:§1t783s0§;
      
      internal var §1t6271s0§:Boolean;
      
      internal var §1t6272s0§:int;
      
      internal var §1t6273s0§:int;
      
      public function §1t75s0§()
      {
         var _loc2_:MovieClip = null;
         this.§1t6231s0§ = new Vector.<MovieClip>();
         super();
         if(§1t75s0§.outlineGlowFilter == null)
         {
            §1t75s0§.outlineGlowFilter = new GlowFilter();
            §1t75s0§.outlineGlowFilter.blurX = 5;
            §1t75s0§.outlineGlowFilter.blurY = 5;
            §1t75s0§.outlineGlowFilter.strength = 5;
            §1t75s0§.outlineGlowFilter.color = 0;
         }
         var _loc1_:int = 0;
         while(_loc1_ <= this.§1t6256s0§)
         {
            _loc2_ = new MovieClip();
            addChild(_loc2_);
            this.§1t6231s0§.push(_loc2_);
            _loc1_++;
         }
         this.§1t5659s0§ = new §1t5660s0§();
         this.§1t5659s0§.y = -120;
         this.§1t5659s0§.mouseEnabled = false;
         this.§1t5659s0§.mouseChildren = false;
         this.§1t5067s0§ = new §1t249s0§();
         this.§1t5067s0§.y = -120;
         this.§1t5067s0§.mouseEnabled = false;
         this.§1t5067s0§.mouseChildren = false;
         this.§1t5067s0§.visible = false;
         §1t1521s0§.§1t9290s0§(this.§1t5067s0§.nametext);
         this.§1t5067s0§.nametext.text = "";
         this.displayName = new §1t6251s0§();
         this.displayName.y = -120;
         this.displayName.visible = false;
         this.displayName.mouseEnabled = false;
         this.displayName.mouseChildren = false;
         §1t1521s0§.§1t9290s0§(this.displayName.nametext,true);
         this.speech = new §1t6253s0§();
         this.speech.y = -120;
         this.speech.visible = false;
         this.speech.mouseEnabled = false;
         this.speech.mouseChildren = false;
         §1t1521s0§.§1t9290s0§(this.speech.words,false);
         this.§1t6254s0§ = new §1t6255s0§();
         this.§1t6254s0§.y = -120;
         this.§1t6254s0§.visible = false;
         this.§1t6254s0§.mouseEnabled = false;
         this.§1t6254s0§.mouseChildren = false;
         this.§1t6254s0§.gotoAndStop(1);
         mouseChildren = false;
      }
      
      public static function §1t12425s0§() : *
      {
         var _loc1_:XML = null;
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc7_:* = undefined;
         if(§1t12424s0§ != null)
         {
            return;
         }
         §1t12424s0§ = new Array();
         var _loc4_:Array = new Array();
         _loc4_.push(XML(new §1t12405s0§()));
         _loc4_.push(XML(new §1t12406s0§()));
         _loc4_.push(XML(new §1t12407s0§()));
         _loc4_.push(XML(new §1t12408s0§()));
         _loc4_.push(XML(new §1t12409s0§()));
         _loc4_.push(XML(new §1t12410s0§()));
         _loc4_.push(XML(new §1t12411s0§()));
         _loc4_.push(XML(new §1t12412s0§()));
         _loc4_.push(XML(new §1t12413s0§()));
         _loc4_.push(XML(new §1t12414s0§()));
         _loc4_.push(XML(new §1t12416s0§()));
         _loc4_.push(XML(new §1t12415s0§()));
         _loc4_.push(XML(new §1t12417s0§()));
         _loc4_.push(XML(new §1t12418s0§()));
         _loc4_.push(XML(new §1t12419s0§()));
         _loc4_.push(XML(new §1t12420s0§()));
         _loc4_.push(XML(new §1t12421s0§()));
         _loc4_.push(XML(new §1t12422s0§()));
         _loc4_.push(XML(new §1t12423s0§()));
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc1_ = _loc4_[_loc6_];
            _loc3_ = _loc1_.anim.length();
            _loc7_ = 0;
            while(_loc7_ < _loc3_)
            {
               _loc2_ = _loc1_.anim[_loc7_];
               §1t12424s0§[_loc2_.@i.toString()] = new §1t783s0§(_loc2_);
               _loc7_++;
            }
            _loc6_++;
         }
      }
      
      public static function §1t12426s0§() : *
      {
         §1t12424s0§ = null;
      }
      
      public function §1t6258s0§(param1:int) : MovieClip
      {
         return this.§1t6231s0§[param1];
      }
      
      public function §1t6259s0§() : Vector.<MovieClip>
      {
         return this.§1t6231s0§;
      }
      
      public function §1t6260s0§() : int
      {
         return this.§1t6256s0§;
      }
      
      public function §1t6261s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:* = int(this.§1t6256s0§ - 1);
         while(_loc4_ >= 0)
         {
            _loc3_ = this.§1t6231s0§[_loc4_];
            _loc1_ = _loc3_.numChildren;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.§1t6231s0§[_loc4_].removeChildAt(0);
               _loc2_++;
            }
            this.§1t6231s0§[_loc4_].cacheAsBitmap = false;
            _loc4_--;
         }
         this.hair = null;
         this.§1t6235s0§ = null;
         this.§1t6287s0§("");
         this.displayName.y = -120;
         this.§1t6288s0§("");
         this.speech.y = -120;
         this.§1t5659s0§.visible = false;
         this.§1t5659s0§.y = -120;
         this.§1t5067s0§.visible = false;
         this.§1t5067s0§.y = -120;
         this.§1t6254s0§.visible = false;
         this.§1t6254s0§.y = -120;
         if(this.contains(this.displayName))
         {
            removeChild(this.displayName);
         }
         if(this.contains(this.speech))
         {
            removeChild(this.speech);
         }
         if(this.contains(this.§1t5659s0§))
         {
            removeChild(this.§1t5659s0§);
         }
         if(this.contains(this.§1t5067s0§))
         {
            removeChild(this.§1t5067s0§);
         }
         if(this.contains(this.§1t6254s0§))
         {
            removeChild(this.§1t6254s0§);
         }
      }
      
      public function §1t3305s0§() : *
      {
         §1t1643s0§.§1t3311s0§(this);
         this.§1t6285s0§();
         this.§1t6261s0§();
         this.animation = "";
         §1t1744s0§.§1t11358s0§(this);
         this.§1t6257s0§ = "";
      }
      
      public function §1t1549s0§(param1:§1t17s0§, param2:§1t17s0§, param3:§1t17s0§, param4:§1t17s0§, param5:§1t17s0§, param6:§1t17s0§, param7:§1t17s0§, param8:§1t17s0§, param9:§1t17s0§, param10:§1t17s0§, param11:int = 0, param12:int = 0) : *
      {
         var _loc13_:int = param1.§1t483s0§();
         var _loc14_:int = param2.§1t483s0§();
         var _loc15_:int = param3.§1t483s0§();
         var _loc16_:int = param4.§1t483s0§();
         var _loc17_:int = param5.§1t483s0§();
         var _loc18_:int = param6.§1t483s0§();
         var _loc19_:int = param7.§1t483s0§();
         var _loc20_:int = param8.§1t483s0§();
         var _loc21_:int = param9.§1t483s0§();
         var _loc22_:int = param10.§1t483s0§();
         var _loc23_:String = "";
         if(param1.§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc23_ = "," + §1t17s0§.§1t8734s0§ + "@" + param1.§1t527s0§() + "#";
         }
         if(param1.§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc23_ += §1t17s0§.§1t8735s0§ + "@" + param1.§1t528s0§() + "#";
         }
         var _loc24_:String = "";
         if(param8.§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc24_ = "," + §1t17s0§.§1t8734s0§ + "@" + param8.§1t527s0§() + "#";
         }
         if(param8.§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc24_ += §1t17s0§.§1t8735s0§ + "@" + param8.§1t528s0§() + "#";
         }
         var _loc25_:String = "";
         if(param4.§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc25_ = "," + §1t17s0§.§1t8734s0§ + "@" + param4.§1t527s0§() + "#";
         }
         if(param4.§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc25_ += §1t17s0§.§1t8735s0§ + "@" + param4.§1t528s0§() + "#";
         }
         var _loc26_:String = "";
         if(param6.§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc26_ = "," + §1t17s0§.§1t8734s0§ + "@" + param6.§1t527s0§() + "#";
         }
         if(param6.§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc26_ += §1t17s0§.§1t8735s0§ + "@" + param6.§1t528s0§() + "#";
         }
         var _loc27_:String = "";
         if(param2.§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc27_ = "," + §1t17s0§.§1t8734s0§ + "@" + param2.§1t527s0§() + "#";
         }
         if(param2.§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc27_ += §1t17s0§.§1t8735s0§ + "@" + param2.§1t528s0§() + "#";
         }
         var _loc28_:String = "";
         if(param9.§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc28_ = "," + §1t17s0§.§1t8734s0§ + "@" + param9.§1t527s0§() + "#";
         }
         if(param9.§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc28_ += §1t17s0§.§1t8735s0§ + "@" + param9.§1t528s0§() + "#";
         }
         var _loc29_:String = "";
         if(param10.§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc29_ = "," + §1t17s0§.§1t8734s0§ + "@" + param10.§1t527s0§() + "#";
         }
         if(param10.§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc29_ += §1t17s0§.§1t8735s0§ + "@" + param10.§1t528s0§() + "#";
         }
         this.§1t6257s0§ = _loc13_ + _loc23_ + "|" + _loc14_ + _loc27_ + "|" + _loc15_ + "|" + _loc16_ + _loc25_ + "|" + _loc17_ + "|" + _loc18_ + _loc26_ + "|" + _loc19_ + "|" + _loc20_ + _loc24_ + "|" + _loc21_ + _loc28_ + "|" + _loc22_ + _loc29_ + "|" + param11 + "|" + param12;
         this.§1t6239s0§(_loc17_);
         if(_loc18_ > 0)
         {
            this.§1t6243s0§(_loc18_,param6.§1t527s0§(),param6.§1t528s0§());
         }
         else
         {
            this.§1t6243s0§(9000);
         }
         this.§1t6236s0§ = _loc16_ > 0 && _loc16_ != 7000 && _loc16_ != 7049;
         if(_loc15_ > 0)
         {
            this.§1t6242s0§(_loc15_);
         }
         else
         {
            this.§1t6242s0§(6001);
         }
         if(this.§1t6236s0§)
         {
            this.§1t6240s0§(_loc16_,param4.§1t527s0§(),param4.§1t528s0§());
         }
         else
         {
            this.§1t6240s0§(7000);
         }
         if(_loc19_ > 0)
         {
            this.§1t6244s0§(_loc19_);
         }
         else
         {
            this.§1t6244s0§(10000);
         }
         if(_loc13_ > 0)
         {
            this.§1t6245s0§(_loc13_,param1.§1t527s0§(),param1.§1t528s0§());
         }
         else
         {
            this.§1t6245s0§(4000);
         }
         if(_loc21_ > 0)
         {
            this.§1t6263s0§(_loc21_,param9.§1t527s0§(),param9.§1t528s0§());
         }
         else
         {
            this.§1t6263s0§(12000);
         }
         if(_loc20_ > 0)
         {
            this.§1t6264s0§(_loc20_,param8.§1t527s0§(),param8.§1t528s0§());
         }
         else
         {
            this.§1t6264s0§(11000);
         }
         if(_loc14_ > 0)
         {
            this.§1t6262s0§(_loc14_,param2.§1t527s0§(),param2.§1t528s0§());
         }
         else
         {
            this.§1t6262s0§(5000);
         }
         if(_loc22_ > 0)
         {
            this.§1t6265s0§(_loc22_,param10.§1t527s0§(),param10.§1t528s0§());
         }
         else
         {
            this.§1t6265s0§(13000);
         }
         if(param11 > 0)
         {
            this.§1t6266s0§(param11);
         }
         else
         {
            this.§1t6266s0§(13000);
         }
         if(param12 > 0)
         {
            this.§1t6267s0§(param12);
         }
         else
         {
            this.§1t6267s0§(13000);
         }
         this.§1t5659s0§.visible = false;
         this.§1t5659s0§.x = 0;
         this.§1t5067s0§.visible = false;
         this.§1t5067s0§.x = 0;
         this.displayName.x = 0;
      }
      
      public function §1t1550s0§(param1:XMLList) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(param1.armor.toString() != "")
         {
            _loc2_ = this.§1t6237s0§(param1.armor);
         }
         if(param1.gloves.toString() != "")
         {
            _loc3_ = this.§1t6237s0§(param1.gloves);
         }
         if(param1.hair.toString() != "")
         {
            _loc4_ = this.§1t6237s0§(param1.hair);
         }
         if(param1.hat.toString() != "")
         {
            _loc5_ = this.§1t6237s0§(param1.hat);
         }
         if(param1.head.toString() != "")
         {
            _loc6_ = this.§1t6237s0§(param1.head);
         }
         if(param1.mask.toString() != "")
         {
            _loc7_ = this.§1t6237s0§(param1.mask);
         }
         if(param1.neck.toString() != "")
         {
            _loc8_ = this.§1t6237s0§(param1.neck);
         }
         if(param1.pants.toString() != "")
         {
            _loc9_ = this.§1t6237s0§(param1.pants);
         }
         if(param1.shoes.toString() != "")
         {
            _loc10_ = this.§1t6237s0§(param1.shoes);
         }
         if(param1.weapon.toString() != "")
         {
            _loc11_ = this.§1t6237s0§(param1.weapon);
         }
         if(param1.prop1.toString() != "")
         {
            _loc12_ = this.§1t6237s0§(param1.prop1);
         }
         else
         {
            _loc12_ = _loc11_;
         }
         if(param1.prop2.toString() != "")
         {
            _loc13_ = this.§1t6237s0§(param1.prop2);
         }
         var _loc14_:§1t17s0§ = new §1t17s0§(_loc2_);
         if(param1.armorpcolor.toString() != "")
         {
            _loc14_.§1t529s0§(param1.armorpcolor);
         }
         if(param1.armorscolor.toString() != "")
         {
            _loc14_.§1t530s0§(param1.armorscolor);
         }
         var _loc15_:§1t17s0§ = new §1t17s0§(_loc9_);
         if(param1.pantspcolor.toString() != "")
         {
            _loc15_.§1t529s0§(param1.pantspcolor);
         }
         if(param1.pantsscolor.toString() != "")
         {
            _loc15_.§1t530s0§(param1.pantsscolor);
         }
         var _loc16_:§1t17s0§ = new §1t17s0§(_loc5_);
         if(param1.hatpcolor.toString() != "")
         {
            _loc16_.§1t529s0§(param1.hatpcolor);
         }
         if(param1.hatscolor.toString() != "")
         {
            _loc16_.§1t530s0§(param1.hatscolor);
         }
         var _loc17_:§1t17s0§ = new §1t17s0§(_loc7_);
         if(param1.maskpcolor.toString() != "")
         {
            _loc17_.§1t529s0§(param1.maskpcolor);
         }
         if(param1.maskscolor.toString() != "")
         {
            _loc17_.§1t530s0§(param1.maskscolor);
         }
         var _loc18_:§1t17s0§ = new §1t17s0§(_loc3_);
         if(param1.§1t16125s0§.toString() != "")
         {
            _loc18_.§1t529s0§(param1.§1t16125s0§);
         }
         if(param1.§1t16126s0§.toString() != "")
         {
            _loc18_.§1t530s0§(param1.§1t16126s0§);
         }
         var _loc19_:§1t17s0§ = new §1t17s0§(_loc10_);
         if(param1.shoespcolor.toString() != "")
         {
            _loc19_.§1t529s0§(param1.shoespcolor);
         }
         if(param1.shoesscolor.toString() != "")
         {
            _loc19_.§1t530s0§(param1.shoesscolor);
         }
         var _loc20_:§1t17s0§ = new §1t17s0§(_loc11_);
         if(param1.weaponpcolor.toString() != "")
         {
            _loc20_.§1t529s0§(param1.weaponpcolor);
         }
         if(param1.weaponscolor.toString() != "")
         {
            _loc20_.§1t530s0§(param1.weaponscolor);
         }
         this.§1t1549s0§(_loc14_,_loc18_,new §1t17s0§(_loc4_),_loc16_,new §1t17s0§(_loc6_),_loc17_,new §1t17s0§(_loc8_),_loc15_,_loc19_,_loc20_,_loc12_,_loc13_);
      }
      
      public function §1t5491s0§(param1:String) : *
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:Array = new Array();
         if(param1.indexOf(§1t1701s0§.§1t11255s0§) != -1)
         {
            param1 = param1.split(§1t1701s0§.§1t11255s0§)[0];
         }
         var _loc3_:Array = param1.split("|");
         var _loc4_:int = int(_loc3_.length);
         if(_loc4_ > §1t1523s0§.§1t7316s0§.length)
         {
            _loc4_ = int(§1t1523s0§.§1t7316s0§.length);
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_[_loc5_] = §1t17s0§.§1t8745s0§(_loc3_[_loc5_]);
            _loc5_++;
         }
         this.§1t1549s0§(_loc2_[§1t1523s0§.§1t9439s0§],_loc2_[§1t1523s0§.§1t9440s0§],_loc2_[§1t1523s0§.§1t9441s0§],_loc2_[§1t1523s0§.§1t9442s0§],_loc2_[§1t1523s0§.§1t9443s0§],_loc2_[§1t1523s0§.§1t9444s0§],_loc2_[§1t1523s0§.§1t9445s0§],_loc2_[§1t1523s0§.§1t9446s0§],_loc2_[§1t1523s0§.§1t9447s0§],_loc2_[§1t1523s0§.§1t9448s0§],_loc2_[§1t1523s0§.§1t9448s0§].§1t483s0§());
         if(_loc3_.length == §1t1523s0§.§1t7316s0§.length + 2)
         {
            _loc6_ = _loc3_[§1t1523s0§.§1t7316s0§.length] / 100;
            _loc7_ = _loc3_[§1t1523s0§.§1t7316s0§.length + 1] / 100;
            this.§1t6284s0§(_loc6_,_loc7_);
         }
      }
      
      internal function §1t6237s0§(param1:String) : int
      {
         var _loc2_:Array = new Array();
         _loc2_ = param1.split(",");
         return _loc2_[int(Math.random() * _loc2_.length)];
      }
      
      internal function §1t6238s0§(param1:String, param2:int) : MovieClip
      {
         var art:int = 0;
         var ClassDefinition:Class = null;
         var partType:String = param1;
         var id:int = param2;
         var xmlItem:§1t104s0§ = §1t1524s0§.§1t9862s0§(id);
         if(xmlItem == null)
         {
            art = id;
         }
         else
         {
            art = xmlItem.art;
         }
         if(§1t1523s0§.§1t9494s0§)
         {
            return §1t1522s0§.§1t6238s0§(partType,art);
         }
         try
         {
            if(getDefinitionByName(partType + art.toString()))
            {
               ClassDefinition = Class(getDefinitionByName(partType + art.toString()));
            }
            else
            {
               ClassDefinition = Class(getDefinitionByName(partType + "0"));
            }
         }
         catch(error:ReferenceError)
         {
            return null;
         }
         return new ClassDefinition() as MovieClip;
      }
      
      public function §1t1251s0§() : String
      {
         return this.§1t6257s0§;
      }
      
      public function §1t6239s0§(param1:int) : *
      {
         var _loc6_:int = 0;
         if(param1 == 0)
         {
            _loc6_ = Math.random() * 11;
            if(_loc6_ == 0)
            {
               param1 = 8004;
            }
            else if(_loc6_ == 1)
            {
               param1 = 8005;
            }
            else if(_loc6_ == 2)
            {
               param1 = 8006;
            }
            else if(_loc6_ == 3)
            {
               param1 = 8007;
            }
            else if(_loc6_ == 4)
            {
               param1 = 8012;
            }
            else if(_loc6_ == 5)
            {
               param1 = 8017;
            }
            else if(_loc6_ == 6)
            {
               param1 = 8018;
            }
            else if(_loc6_ == 7)
            {
               param1 = 8019;
            }
            else if(_loc6_ == 8)
            {
               param1 = 8020;
            }
            else if(_loc6_ == 9)
            {
               param1 = 8021;
            }
            else if(_loc6_ == 10)
            {
               param1 = 8023;
            }
         }
         var _loc2_:MovieClip = this.§1t6231s0§[§1t12393s0§];
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:MovieClip = this.§1t6238s0§("head",param1);
         if(_loc3_ == null)
         {
            _loc3_ = new head8000();
         }
         _loc2_.addChild(_loc3_);
         _loc2_.setChildIndex(_loc3_,0);
         var _loc4_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc5_:Boolean = _loc4_ != null && _loc4_.animated;
         if(!_loc5_)
         {
            _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
            _loc2_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6241s0§(param1:int, param2:uint) : *
      {
         var _loc3_:int = 0;
         if(param1 == 6001 || param1 <= 0)
         {
            _loc3_ = 6001;
         }
         else
         {
            _loc3_ = 6000;
         }
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12393s0§];
         if(_loc4_.numChildren > 3)
         {
            _loc4_.removeChildAt(3);
         }
         this.§1t6235s0§ = this.§1t6238s0§("hair",_loc3_);
         if(this.§1t6235s0§ == null)
         {
            this.hair = new hair6000();
         }
         if(_loc3_ == 6000)
         {
            §1t1643s0§.§1t11214s0§(this.§1t6235s0§.primaryColor,param2);
         }
         _loc4_.addChild(this.§1t6235s0§);
         _loc4_.setChildIndex(this.§1t6235s0§,3);
         _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
         _loc4_.cacheAsBitmap = true;
      }
      
      public function §1t6242s0§(param1:int) : *
      {
         var _loc2_:MovieClip = this.§1t6231s0§[§1t12393s0§];
         if(_loc2_.numChildren > 2)
         {
            _loc2_.removeChildAt(2);
         }
         this.hair = this.§1t6238s0§("hair",param1);
         if(this.hair == null)
         {
            this.hair = new hair6000();
         }
         _loc2_.addChild(this.hair);
         _loc2_.setChildIndex(this.hair,2);
         var _loc3_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc4_:Boolean = _loc3_ != null && _loc3_.animated;
         if(!_loc4_)
         {
            _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
            _loc2_.cacheAsBitmap = true;
         }
         this.§1t6241s0§(param1,uint(_loc3_.scolor));
         this.hair.visible = !this.§1t6236s0§;
         this.§1t6235s0§.visible = this.§1t6236s0§;
      }
      
      public function §1t6243s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12393s0§];
         if(_loc4_.numChildren > 1)
         {
            _loc4_.removeChildAt(1);
         }
         this.§1t6250s0§ = this.§1t6238s0§("mask",param1);
         if(this.§1t6250s0§ == null)
         {
            this.§1t6250s0§ = new mask9000();
         }
         if(param2 != 1 && this.§1t6250s0§.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(this.§1t6250s0§.primaryColor,param2);
         }
         if(param3 != 1 && this.§1t6250s0§.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(this.§1t6250s0§.secondaryColor,param3);
         }
         _loc4_.addChild(this.§1t6250s0§);
         _loc4_.setChildIndex(this.§1t6250s0§,1);
         var _loc5_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc6_:Boolean = _loc5_ != null && _loc5_.animated;
         if(!_loc6_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6240s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         this.§1t6236s0§ = param1 > 0 && param1 != 7000 && param1 != 7049;
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12394s0§];
         if(_loc4_.numChildren > 0)
         {
            _loc4_.removeChildAt(0);
         }
         var _loc5_:MovieClip = this.§1t6238s0§("hat",param1);
         if(_loc5_ == null)
         {
            _loc5_ = new hat7000();
         }
         if(param2 != 1 && _loc5_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc5_.primaryColor,param2);
         }
         if(param3 != 1 && _loc5_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc5_.secondaryColor,param3);
         }
         _loc4_.addChild(_loc5_);
         var _loc6_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc7_:Boolean = _loc6_ != null && _loc6_.animated;
         if(!_loc7_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6244s0§(param1:int) : *
      {
         var _loc2_:MovieClip = this.§1t6231s0§[§1t12389s0§];
         if(_loc2_.numChildren > 1)
         {
            _loc2_.removeChildAt(1);
         }
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:MovieClip = this.§1t6238s0§("neck",param1);
         if(_loc3_ == null)
         {
            _loc3_ = new neck10000();
         }
         _loc2_.addChild(_loc3_);
         _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
         _loc2_.cacheAsBitmap = true;
      }
      
      public function §1t6262s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12377s0§];
         var _loc5_:MovieClip = this.§1t6231s0§[§1t12395s0§];
         if(_loc4_.numChildren > 0)
         {
            _loc4_.removeChildAt(0);
            _loc5_.removeChildAt(0);
         }
         var _loc6_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc7_:Boolean = _loc6_ != null && _loc6_.animated;
         var _loc8_:MovieClip = this.§1t6238s0§("hand",param1);
         if(_loc8_ == null)
         {
            _loc8_ = new hand5000();
         }
         if(param2 != 1 && _loc8_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
         }
         if(param3 != 1 && _loc8_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
         }
         _loc4_.addChild(_loc8_);
         if(!_loc7_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
         _loc8_ = this.§1t6238s0§("hand",param1);
         if(_loc8_ == null)
         {
            _loc8_ = new hand5000();
         }
         if(param2 != 1 && _loc8_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
         }
         if(param3 != 1 && _loc8_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
         }
         _loc5_.addChild(_loc8_);
         if(!_loc7_)
         {
            _loc5_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
            _loc5_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6263s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc8_:MovieClip = null;
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12384s0§];
         var _loc5_:MovieClip = this.§1t6231s0§[§1t12388s0§];
         var _loc6_:MovieClip = this.§1t6231s0§[§1t12382s0§];
         var _loc7_:MovieClip = this.§1t6231s0§[§1t12386s0§];
         if(_loc4_.numChildren > 0)
         {
            _loc4_.removeChildAt(0);
            _loc5_.removeChildAt(0);
            _loc6_.removeChildAt(0);
            _loc7_.removeChildAt(0);
         }
         var _loc9_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc10_:Boolean = _loc9_ != null && _loc9_.animated;
         _loc8_ = this.§1t6238s0§("foottop",param1);
         if(_loc8_ == null)
         {
            _loc8_ = new foottop12000();
         }
         if(param2 != 1 && _loc8_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
         }
         if(param3 != 1 && _loc8_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
         }
         _loc4_.addChild(_loc8_);
         _loc4_.setChildIndex(_loc8_,0);
         if(!_loc10_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
         _loc8_ = this.§1t6238s0§("foottop",param1);
         if(_loc8_ == null)
         {
            _loc8_ = new foottop12000();
         }
         if(param2 != 1 && _loc8_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
         }
         if(param3 != 1 && _loc8_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
         }
         _loc5_.addChild(_loc8_);
         _loc5_.setChildIndex(_loc8_,0);
         if(!_loc10_)
         {
            _loc5_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
            _loc5_.cacheAsBitmap = true;
         }
         _loc8_ = this.§1t6238s0§("foot",param1);
         if(_loc8_ == null)
         {
            _loc8_ = new foot12000();
         }
         if(param2 != 1 && _loc8_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
         }
         if(param3 != 1 && _loc8_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
         }
         _loc6_.addChild(_loc8_);
         if(!_loc10_)
         {
            _loc6_.cacheAsBitmapMatrix = _loc6_.transform.concatenatedMatrix;
            _loc6_.cacheAsBitmap = true;
         }
         _loc8_ = this.§1t6238s0§("foot",param1);
         if(_loc8_ == null)
         {
            _loc8_ = new foot12000();
         }
         if(param2 != 1 && _loc8_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
         }
         if(param3 != 1 && _loc8_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
         }
         _loc7_.addChild(_loc8_);
         if(!_loc10_)
         {
            _loc7_.cacheAsBitmapMatrix = _loc7_.transform.concatenatedMatrix;
            _loc7_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6245s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc12_:MovieClip = null;
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12392s0§];
         var _loc5_:MovieClip = this.§1t6231s0§[§1t12390s0§];
         var _loc6_:MovieClip = this.§1t6231s0§[§1t12378s0§];
         var _loc7_:MovieClip = this.§1t6231s0§[§1t12396s0§];
         var _loc8_:MovieClip = this.§1t6231s0§[§1t12379s0§];
         var _loc9_:MovieClip = this.§1t6231s0§[§1t12397s0§];
         var _loc10_:MovieClip = this.§1t6231s0§[§1t12391s0§];
         var _loc11_:MovieClip = this.§1t6231s0§[§1t12389s0§];
         if(_loc4_.numChildren > 0)
         {
            _loc4_.removeChildAt(0);
            _loc5_.removeChildAt(0);
            _loc6_.removeChildAt(0);
            _loc7_.removeChildAt(0);
            _loc8_.removeChildAt(0);
            _loc9_.removeChildAt(0);
            _loc10_.removeChildAt(0);
         }
         var _loc13_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc14_:Boolean = _loc13_ != null && _loc13_.animated;
         _loc12_ = this.§1t6238s0§("torso",param1);
         if(_loc12_ == null)
         {
            _loc12_ = new torso4000();
         }
         if(param2 != 1 && _loc12_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.primaryColor,param2);
         }
         if(param3 != 1 && _loc12_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.secondaryColor,param3);
         }
         _loc4_.addChild(_loc12_);
         if(!_loc14_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
         _loc12_ = this.§1t6238s0§("stomach",param1);
         if(_loc12_ == null)
         {
            _loc12_ = new stomach4000();
         }
         if(param2 != 1 && _loc12_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.primaryColor,param2);
         }
         if(param3 != 1 && _loc12_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.secondaryColor,param3);
         }
         _loc5_.addChild(_loc12_);
         if(!_loc14_)
         {
            _loc5_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
            _loc5_.cacheAsBitmap = true;
         }
         _loc12_ = this.§1t6238s0§("uparm",param1);
         if(_loc12_ == null)
         {
            _loc12_ = new uparm4000();
         }
         if(param2 != 1 && _loc12_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.primaryColor,param2);
         }
         if(param3 != 1 && _loc12_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.secondaryColor,param3);
         }
         _loc6_.addChild(_loc12_);
         if(!_loc14_)
         {
            _loc6_.cacheAsBitmapMatrix = _loc6_.transform.concatenatedMatrix;
            _loc6_.cacheAsBitmap = true;
         }
         _loc12_ = this.§1t6238s0§("uparm",param1);
         if(_loc12_ == null)
         {
            _loc12_ = new uparm4000();
         }
         if(param2 != 1 && _loc12_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.primaryColor,param2);
         }
         if(param3 != 1 && _loc12_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.secondaryColor,param3);
         }
         _loc7_.addChild(_loc12_);
         if(!_loc14_)
         {
            _loc7_.cacheAsBitmapMatrix = _loc7_.transform.concatenatedMatrix;
            _loc7_.cacheAsBitmap = true;
         }
         _loc12_ = this.§1t6238s0§("lowarm",param1);
         if(_loc12_ == null)
         {
            _loc12_ = new lowarm4000();
         }
         if(param2 != 1 && _loc12_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.primaryColor,param2);
         }
         if(param3 != 1 && _loc12_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.secondaryColor,param3);
         }
         _loc8_.addChild(_loc12_);
         if(!_loc14_)
         {
            _loc8_.cacheAsBitmapMatrix = _loc8_.transform.concatenatedMatrix;
            _loc8_.cacheAsBitmap = true;
         }
         _loc12_ = this.§1t6238s0§("lowarm",param1);
         if(_loc12_ == null)
         {
            _loc12_ = new lowarm4000();
         }
         if(param2 != 1 && _loc12_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.primaryColor,param2);
         }
         if(param3 != 1 && _loc12_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.secondaryColor,param3);
         }
         _loc9_.addChild(_loc12_);
         if(!_loc14_)
         {
            _loc9_.cacheAsBitmapMatrix = _loc9_.transform.concatenatedMatrix;
            _loc9_.cacheAsBitmap = true;
         }
         _loc12_ = this.§1t6238s0§("pelvic",param1);
         if(_loc12_ == null)
         {
            _loc12_ = new pelvic4000();
         }
         if(param2 != 1 && _loc12_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.primaryColor,param2);
         }
         if(param3 != 1 && _loc12_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc12_.secondaryColor,param3);
         }
         _loc10_.addChild(_loc12_);
         if(!_loc14_)
         {
            _loc10_.cacheAsBitmapMatrix = _loc10_.transform.concatenatedMatrix;
            _loc10_.cacheAsBitmap = true;
         }
         _loc12_ = this.§1t6238s0§("neck",param1);
         if(_loc12_ != null)
         {
            if(param2 != 1 && _loc12_.primaryColor != null)
            {
               §1t1643s0§.§1t11214s0§(_loc12_.primaryColor,param2);
            }
            if(param3 != 1 && _loc12_.secondaryColor != null)
            {
               §1t1643s0§.§1t11214s0§(_loc12_.secondaryColor,param3);
            }
            _loc11_.addChild(_loc12_);
            if(!_loc14_)
            {
               _loc11_.cacheAsBitmapMatrix = _loc11_.transform.concatenatedMatrix;
               _loc11_.cacheAsBitmap = true;
            }
         }
      }
      
      public function §1t6264s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc9_:MovieClip = null;
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12385s0§];
         var _loc5_:MovieClip = this.§1t6231s0§[§1t12383s0§];
         var _loc6_:MovieClip = this.§1t6231s0§[§1t12387s0§];
         var _loc7_:MovieClip = this.§1t6231s0§[§1t12384s0§];
         var _loc8_:MovieClip = this.§1t6231s0§[§1t12388s0§];
         if(_loc4_.numChildren > 0)
         {
            _loc4_.removeChildAt(0);
            _loc5_.removeChildAt(0);
            _loc6_.removeChildAt(0);
            _loc7_.removeChildAt(1);
            _loc8_.removeChildAt(1);
         }
         var _loc10_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc11_:Boolean = _loc10_ != null && _loc10_.animated;
         _loc9_ = this.§1t6238s0§("crotch",param1);
         if(_loc9_ == null)
         {
            _loc9_ = new crotch11000();
         }
         if(param2 != 1 && _loc9_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.primaryColor,param2);
         }
         if(param3 != 1 && _loc9_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.secondaryColor,param3);
         }
         _loc4_.addChild(_loc9_);
         if(!_loc11_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
         _loc9_ = this.§1t6238s0§("thigh",param1);
         if(_loc9_ == null)
         {
            _loc9_ = new thigh11000();
         }
         if(param2 != 1 && _loc9_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.primaryColor,param2);
         }
         if(param3 != 1 && _loc9_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.secondaryColor,param3);
         }
         _loc5_.addChild(_loc9_);
         if(!_loc11_)
         {
            _loc5_.cacheAsBitmapMatrix = _loc5_.transform.concatenatedMatrix;
            _loc5_.cacheAsBitmap = true;
         }
         _loc9_ = this.§1t6238s0§("thigh",param1);
         if(_loc9_ == null)
         {
            _loc9_ = new thigh11000();
         }
         if(param2 != 1 && _loc9_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.primaryColor,param2);
         }
         if(param3 != 1 && _loc9_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.secondaryColor,param3);
         }
         _loc6_.addChild(_loc9_);
         if(!_loc11_)
         {
            _loc6_.cacheAsBitmapMatrix = _loc6_.transform.concatenatedMatrix;
            _loc6_.cacheAsBitmap = true;
         }
         _loc9_ = this.§1t6238s0§("calf",param1);
         if(_loc9_ == null)
         {
            _loc9_ = new calf11000();
         }
         if(param2 != 1 && _loc9_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.primaryColor,param2);
         }
         if(param3 != 1 && _loc9_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.secondaryColor,param3);
         }
         _loc7_.addChild(_loc9_);
         if(!_loc11_)
         {
            _loc7_.cacheAsBitmapMatrix = _loc7_.transform.concatenatedMatrix;
            _loc7_.cacheAsBitmap = true;
         }
         _loc9_ = this.§1t6238s0§("calf",param1);
         if(_loc9_ == null)
         {
            _loc9_ = new calf11000();
         }
         if(param2 != 1 && _loc9_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.primaryColor,param2);
         }
         if(param3 != 1 && _loc9_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc9_.secondaryColor,param3);
         }
         _loc8_.addChild(_loc9_);
         if(!_loc11_)
         {
            _loc8_.cacheAsBitmapMatrix = _loc8_.transform.concatenatedMatrix;
            _loc8_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6265s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc5_:MovieClip = null;
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12380s0§];
         if(_loc4_.numChildren > 0)
         {
            _loc4_.removeChildAt(0);
         }
         _loc5_ = this.§1t6238s0§("weapon",param1);
         if(_loc5_ == null)
         {
            _loc5_ = new weapon13000();
         }
         if(param2 != 1 && _loc5_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc5_.primaryColor,param2);
         }
         if(param3 != 1 && _loc5_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc5_.secondaryColor,param3);
         }
         _loc4_.addChild(_loc5_);
         var _loc6_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc7_:Boolean = _loc6_ != null && _loc6_.animated;
         if(!_loc7_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6266s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc5_:MovieClip = null;
         var _loc4_:MovieClip = this.§1t6231s0§[§1t12381s0§];
         if(_loc4_.numChildren > 0)
         {
            _loc4_.removeChildAt(0);
         }
         _loc5_ = this.§1t6238s0§("prop",param1);
         if(_loc5_ == null)
         {
            _loc5_ = new prop13000();
         }
         if(param2 != 1 && _loc5_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc5_.primaryColor,param2);
         }
         if(param3 != 1 && _loc5_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc5_.secondaryColor,param3);
         }
         _loc4_.addChild(_loc5_);
         var _loc6_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc7_:Boolean = _loc6_ != null && _loc6_.animated;
         if(!_loc7_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6267s0§(param1:int) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:MovieClip = this.§1t6231s0§[§1t12398s0§];
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         _loc3_ = this.§1t6238s0§("prop",param1);
         if(_loc3_ == null)
         {
            _loc3_ = new prop13000();
         }
         _loc2_.addChild(_loc3_);
         var _loc4_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc5_:Boolean = _loc4_ != null && _loc4_.animated;
         if(!_loc5_)
         {
            _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
            _loc2_.cacheAsBitmap = true;
         }
      }
      
      public function §1t1558s0§() : String
      {
         return this.animation;
      }
      
      public function §1t1557s0§(param1:String) : *
      {
         if(this.animation == param1)
         {
            return;
         }
         if(§1t12424s0§[param1] == null)
         {
            return;
         }
         this.animation = param1;
         this.§1t6270s0§ = §1t12424s0§[param1];
         this.§1t6271s0§ = this.§1t6270s0§.looping;
         this.§1t6272s0§ = this.§1t6270s0§.duration;
         this.§1t6273s0§ = this.§1t6270s0§.§1t789s0§();
         this.§1t6269s0§ = 0;
         this.§1t6270s0§.§1t788s0§(0).setVisible(this);
         this.§1t6275s0§();
         this.§1t6270s0§.§1t788s0§(this.§1t6269s0§).reorderLayers(this);
      }
      
      public function §1t6274s0§() : *
      {
         this.§1t6269s0§ = 0;
         this.§1t6270s0§.§1t788s0§(0).setVisible(this);
         this.§1t6275s0§();
         this.§1t6270s0§.§1t788s0§(this.§1t6269s0§).reorderLayers(this);
      }
      
      public function §1t3268s0§() : String
      {
         if(this.§1t6270s0§ == null || !this.§1t6271s0§ && this.§1t6269s0§ >= this.§1t6272s0§)
         {
            return "";
         }
         ++this.§1t6269s0§;
         if(this.§1t6269s0§ < this.§1t6272s0§)
         {
            this.§1t6275s0§();
         }
         else
         {
            if(!(this.§1t6271s0§ && this.§1t6269s0§ >= this.§1t6272s0§))
            {
               return this.animation;
            }
            this.§1t6269s0§ = 0;
            this.§1t6275s0§();
         }
         return "";
      }
      
      internal function §1t6275s0§() : *
      {
         if(this.§1t6269s0§ < this.§1t6273s0§)
         {
            this.§1t6270s0§.§1t788s0§(this.§1t6269s0§).setPosition(this);
         }
      }
      
      public function §1t6246s0§(param1:String, param2:int) : *
      {
         §1t75s0§.§1t12424s0§[param1].§1t788s0§(param2).setPosition(this);
         this.§1t6270s0§ = null;
      }
      
      public function §1t6247s0§() : *
      {
         this.hair.visible = true;
         this.§1t6235s0§.visible = false;
      }
      
      public function §1t6248s0§() : *
      {
         this.hair.visible = false;
         this.§1t6235s0§.visible = true;
      }
      
      internal function §1t6276s0§() : *
      {
         if(this.§1t3312s0§)
         {
            return null;
         }
         var _loc1_:MovieClip = this.§1t6231s0§[§1t12394s0§];
         if(_loc1_.numChildren == 0)
         {
            return;
         }
         this.hair.visible = true;
         this.§1t6235s0§.visible = false;
         var _loc2_:int = Math.random() * 10 - 5;
         var _loc3_:int = 20;
         if(_loc2_ < 0)
         {
            _loc3_ = -20;
         }
         var _loc4_:int = -Math.random() * 16 - 8;
         §1t1712s0§.§1t11325s0§(_loc1_,_loc2_,_loc4_,_loc3_);
      }
      
      internal function §1t6277s0§() : §1t130s0§
      {
         if(this.§1t3312s0§)
         {
            return null;
         }
         var _loc1_:MovieClip = this.§1t6231s0§[§1t12393s0§];
         var _loc2_:int = Math.random() * 10 - 5;
         var _loc3_:int = 20;
         if(_loc2_ < 0)
         {
            _loc3_ = -20;
         }
         var _loc4_:int = -Math.random() * 16 - 8;
         return §1t1712s0§.§1t6277s0§(_loc1_,_loc2_,_loc4_,_loc3_);
      }
      
      internal function §1t6278s0§() : *
      {
         if(this.§1t3312s0§)
         {
            return null;
         }
         var _loc1_:MovieClip = this.§1t6231s0§[§1t12380s0§];
         if(_loc1_.numChildren == 0)
         {
            return;
         }
         var _loc2_:int = Math.random() * 16 - 8;
         var _loc3_:int = 20;
         if(_loc2_ < 0)
         {
            _loc3_ = -20;
         }
         var _loc4_:int = -Math.random() * 16 - 8;
         §1t1712s0§.§1t11325s0§(_loc1_,_loc2_,_loc4_,_loc3_);
      }
      
      public function §1t6279s0§() : *
      {
         addChild(this.§1t5659s0§);
         this.§1t5659s0§.visible = true;
         if(this.displayName.text != "")
         {
            this.displayName.visible = true;
         }
         if(this.displayName.y > this.§1t5659s0§.y)
         {
            this.displayName.y = this.§1t5659s0§.y;
         }
      }
      
      public function §1t6280s0§() : *
      {
         this.§1t5659s0§.visible = false;
         this.displayName.visible = false;
      }
      
      public function §1t3301s0§(param1:Number) : *
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         this.§1t5659s0§.bar.width = param1 * 60;
      }
      
      public function §1t6281s0§(param1:int) : *
      {
         this.§1t5659s0§.x = param1;
         this.displayName.x = param1;
      }
      
      public function §1t6282s0§(param1:int) : *
      {
         this.§1t5659s0§.y = param1;
         this.displayName.y = param1;
      }
      
      public function §1t6283s0§() : Boolean
      {
         return scaleX > 0;
      }
      
      public function §1t5492s0§() : *
      {
         if(scaleX < 0)
         {
            return;
         }
         scaleX = -scaleX;
         var _loc1_:Number = -Math.abs(this.§1t5659s0§.scaleX);
         this.§1t5659s0§.scaleX = _loc1_;
         this.§1t5067s0§.scaleX = _loc1_;
         this.displayName.scaleX = _loc1_;
         this.speech.scaleX = _loc1_;
      }
      
      public function §1t5493s0§() : *
      {
         if(scaleX > 0)
         {
            return;
         }
         scaleX = -scaleX;
         var _loc1_:Number = Math.abs(this.§1t5659s0§.scaleX);
         this.§1t5659s0§.scaleX = _loc1_;
         this.§1t5067s0§.scaleX = _loc1_;
         this.displayName.scaleX = _loc1_;
         this.speech.scaleX = _loc1_;
      }
      
      public function §1t6284s0§(param1:Number, param2:Number) : *
      {
         if(scaleX < 0)
         {
            scaleX = -param1;
         }
         else
         {
            scaleX = param1;
         }
         scaleY = param2;
         this.§1t5659s0§.scaleX /= param1;
         this.displayName.scaleX /= param1;
         this.§1t5067s0§.scaleX /= param1;
         this.speech.scaleX /= param1;
         this.§1t5659s0§.scaleY /= param2;
         this.displayName.scaleY /= param2;
         this.§1t5067s0§.scaleY /= param2;
         this.speech.scaleY /= param2;
      }
      
      public function §1t6285s0§() : *
      {
         scaleX = 1;
         scaleY = 1;
         this.§1t5659s0§.scaleX = 1;
         this.displayName.scaleX = 1;
         this.§1t5067s0§.scaleX = 1;
         this.speech.scaleX = 1;
         this.§1t5659s0§.scaleY = 1;
         this.displayName.scaleY = 1;
         this.§1t5067s0§.scaleY = 1;
         this.speech.scaleY = 1;
      }
      
      public function §1t6286s0§(param1:Boolean) : *
      {
         this.displayName.visible = param1;
      }
      
      public function §1t6287s0§(param1:String, param2:uint = 0) : *
      {
         addChild(this.displayName);
         if(param1 != "")
         {
            if(param2 == 0 && !§1t1523s0§.§1t9528s0§)
            {
               param2 = 16777215;
            }
            this.displayName.nametext.text = param1;
            this.displayName.nametext.textColor = param2;
            this.displayName.visible = true;
            this.displayName.cacheAsBitmap = true;
            if(this.§1t5659s0§.visible)
            {
               this.displayName.y = this.§1t5659s0§.y;
            }
            else
            {
               this.displayName.y = this.§1t5659s0§.y + 10;
            }
            if(param2 != 0 && param2 != 10027008 && !§1t1523s0§.§1t9528s0§)
            {
               this.displayName.filters = [§1t75s0§.outlineGlowFilter];
            }
            else
            {
               this.displayName.filters = [];
            }
         }
         else
         {
            this.displayName.nametext.text = "";
            this.displayName.visible = false;
            this.displayName.cacheAsBitmap = false;
            this.displayName.filters = [];
         }
      }
      
      public function §1t6288s0§(param1:String) : *
      {
         var _loc2_:* = undefined;
         if(param1 != "")
         {
            addChild(this.speech);
            this.speech.words.text = param1;
            this.speech.visible = true;
            _loc2_ = this.speech.words.numLines;
            if(_loc2_ > 6)
            {
               _loc2_ = 6;
            }
            this.speech.bubble.gotoAndStop(_loc2_);
            this.speech.words.y = -44 - (_loc2_ - 1) * 13;
         }
         else
         {
            this.speech.words.text = "";
            this.speech.visible = false;
         }
      }
      
      public function §1t3302s0§() : §1t249s0§
      {
         if(this.§1t5067s0§.parent == null)
         {
            addChild(this.§1t5067s0§);
         }
         return this.§1t5067s0§;
      }
      
      public function §1t6289s0§(param1:int) : *
      {
         if(this.§1t6254s0§.parent == null)
         {
            addChild(this.§1t6254s0§);
         }
         this.§1t6254s0§.gotoAndStop(param1);
         this.§1t6254s0§.visible = true;
      }
   }
}

