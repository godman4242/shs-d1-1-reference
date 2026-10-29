package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1256")]
   public class §1t5313s0§ extends MovieClip
   {
      
      public static var §1t12345s0§:int = 0;
      
      public static var §1t12346s0§:int = 1;
      
      public static var §1t12347s0§:int = 2;
      
      public static var §1t12348s0§:int = 3;
      
      public var cancelbutton:§1t5000s0§;
      
      public var errortext:TextField;
      
      public var loadingtext:TextField;
      
      public var nametext:TextField;
      
      public var nametext2:TextField;
      
      public var okbutton:§1t5003s0§;
      
      public var §1t5021s0§:TextField;
      
      internal var mode:int = 0;
      
      internal var §1t5319s0§:int = 0;
      
      internal var §1t5320s0§:int = 1;
      
      internal var §1t5321s0§:int = 0;
      
      internal var callback:Function;
      
      internal var §1t5324s0§:String;
      
      internal var §1t5328s0§:int = 0;
      
      public function §1t5313s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§);
         §1t1521s0§.§1t9290s0§(this.nametext);
         §1t1521s0§.§1t9290s0§(this.errortext);
         §1t1521s0§.§1t9290s0§(this.loadingtext);
         this.loadingtext.text = §1t1521s0§.getString(90);
         this.okbutton.§1t5769s0§(§1t1521s0§.getString(5));
         this.cancelbutton.§1t5769s0§(§1t1521s0§.getString(470));
      }
      
      public function show(param1:int, param2:Function = null) : *
      {
         if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.visible = true;
         this.okbutton.visible = true;
         this.cancelbutton.visible = true;
         this.errortext.visible = false;
         this.§1t5004s0§();
         this.loadingtext.visible = false;
         this.nametext.visible = false;
         this.nametext2.visible = false;
         this.nametext.text = "";
         this.nametext2.text = "";
         this.mode = param1;
         if(param1 == §1t12346s0§)
         {
            this.nametext.maxChars = 30;
            this.§1t5021s0§.text = §1t1521s0§.getString(664);
            this.nametext.visible = true;
         }
         else if(param1 == §1t12345s0§)
         {
            this.nametext.maxChars = 15;
            this.§1t5021s0§.text = §1t1521s0§.getString(634);
            this.nametext.visible = true;
         }
         else if(param1 == §1t12347s0§)
         {
            this.nametext.maxChars = 30;
            this.§1t5021s0§.text = §1t1521s0§.getString(865);
            this.nametext2.visible = true;
         }
         else if(param1 == §1t12348s0§)
         {
            this.nametext.maxChars = 15;
            this.§1t5021s0§.text = §1t1521s0§.getString(11453);
            this.nametext.visible = true;
            this.callback = param2;
         }
      }
      
      internal function §1t5004s0§() : *
      {
         this.okbutton.addEventListener(MouseEvent.CLICK,this.§1t5323s0§);
         this.cancelbutton.addEventListener(MouseEvent.CLICK,this.§1t5330s0§);
         this.okbutton.§1t5004s0§();
         this.cancelbutton.§1t5004s0§();
      }
      
      internal function removeEventListeners() : *
      {
         this.okbutton.removeEventListener(MouseEvent.CLICK,this.§1t5323s0§);
         this.cancelbutton.removeEventListener(MouseEvent.CLICK,this.§1t5330s0§);
         this.okbutton.removeEventListeners();
         this.cancelbutton.removeEventListeners();
      }
      
      public function §1t5322s0§(param1:String) : String
      {
         var _loc4_:RegExp = null;
         var _loc2_:String = param1.split("<").join("");
         var _loc3_:Array = ["fuck","shit","bitch","asshole","nigger","faggot","whore","penis","vagina","cock","pussy","kanji","boob","tits","breast"];
         _loc2_ = _loc2_.split(">").join("");
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ = new RegExp(_loc3_[_loc5_],"gi");
            _loc2_ = _loc2_.replace(_loc4_,"potato");
            _loc5_++;
         }
         return _loc2_;
      }
      
      internal function §1t5323s0§(param1:Event) : *
      {
         var _loc3_:RegExp = null;
         var _loc4_:§1t17s0§ = null;
         if(this.nametext.text == "" && this.nametext2.text == "")
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         var _loc2_:RegExp = /[\s\r]*/gim;
         this.nametext.text = this.nametext.text.replace(_loc2_,"");
         this.nametext2.text = this.nametext2.text.replace(_loc2_,"");
         if(this.mode == §1t12345s0§ || this.mode == §1t12348s0§)
         {
            _loc3_ = /[^a-zA-Z0-9]/;
         }
         else if(this.mode == §1t12346s0§)
         {
            _loc3_ = /[^a-zA-Z0-9\s-]/;
         }
         if((this.mode == §1t12345s0§ || this.mode == §1t12346s0§ || this.mode == §1t12348s0§) && _loc3_.test(this.nametext.text))
         {
            this.errortext.text = §1t1521s0§.getString(137);
            this.errortext.visible = true;
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(this.mode == §1t12348s0§)
         {
            this.callback(this.nametext.text);
            this.§1t5330s0§(null);
         }
         if(this.nametext.text == "guest" || this.§1t5322s0§(this.nametext.text) != this.nametext.text)
         {
            this.errortext.text = §1t1521s0§.getString(906);
            this.errortext.visible = true;
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(this.mode == §1t12346s0§)
         {
            _loc4_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
            if(_loc4_ == null || _loc4_.§1t483s0§() == 0 || _loc4_.§1t483s0§() == 13000)
            {
               this.errortext.text = §1t1521s0§.getString(637);
               this.errortext.visible = true;
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return;
            }
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5324s0§ = this.nametext.text;
         if(this.mode == §1t12346s0§)
         {
            §1t1523s0§.§1t9615s0§(10,this.§1t5125s0§,this.§1t5126s0§);
         }
         else if(this.mode == §1t12347s0§)
         {
            this.okbutton.visible = false;
            this.cancelbutton.visible = false;
            this.errortext.visible = false;
            this.loadingtext.visible = true;
            §1t251s0§.instance.§1t3559s0§(this.nametext2.text);
         }
         else
         {
            this.§1t5125s0§();
         }
      }
      
      internal function §1t5125s0§() : *
      {
         var _loc1_:§1t17s0§ = null;
         if(this.mode == §1t12345s0§)
         {
            this.§1t5324s0§ = this.§1t5324s0§.toLowerCase();
            §1t3317s0§.instance.§1t1995s0§(this.§1t5324s0§);
            this.okbutton.visible = false;
            this.cancelbutton.visible = false;
            this.errortext.visible = false;
            this.loadingtext.visible = true;
         }
         else if(this.mode == §1t12346s0§)
         {
            _loc1_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
            §1t88s0§.instance.§1t1513s0§();
            §1t3317s0§.instance.§1t1986s0§(1,"nameweapon",10);
            _loc1_.§1t540s0§(this.§1t3624s0§(this.§1t5324s0§));
            _loc1_.uses = 0;
            §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9675s0§);
            this.removeEventListeners();
            this.visible = false;
            §1t1541s0§.§1t10045s0§();
            §1t406s0§.instance.§1t6544s0§(null);
            _loc1_.§1t541s0§("");
            §1t251s0§.instance.§1t3554s0§(_loc1_);
         }
      }
      
      public function §1t5325s0§(param1:int, param2:int, param3:int = 0) : *
      {
         this.§1t5319s0§ = param1;
         this.§1t5320s0§ = param2;
         this.§1t5321s0§ = param3;
      }
      
      public function §1t5326s0§() : *
      {
         var _loc1_:§1t17s0§ = null;
         var _loc2_:Vector.<§1t17s0§> = null;
         if(this.§1t5319s0§ != 0)
         {
            if(this.§1t5319s0§ == 11)
            {
               §1t406s0§.instance.§1t6488s0§.§1t5846s0§(this.§1t5320s0§);
               §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
               §1t406s0§.instance.§1t6488s0§.show();
            }
            else if(this.§1t5319s0§ == 12)
            {
               §1t3318s0§.instance.§1t3404s0§();
               §1t1541s0§.§1t10045s0§();
               §1t406s0§.instance.§1t6502s0§.§1t5847s0§(this.§1t5320s0§);
               §1t406s0§.instance.§1t6502s0§.§1t5849s0§(§1t1521s0§.getString(964));
               if(this.§1t5321s0§ != 0)
               {
                  _loc1_ = new §1t17s0§(20112,this.§1t5321s0§);
                  _loc2_ = new Vector.<§1t17s0§>();
                  _loc2_.push(_loc1_);
                  §1t406s0§.instance.§1t6502s0§.§1t5841s0§(_loc2_);
                  §1t406s0§.instance.§1t6502s0§.§1t5845s0§(_loc1_);
               }
               §1t406s0§.instance.§1t6502s0§.show();
            }
            else if(this.§1t5319s0§ == 20112)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20112,this.§1t5320s0§);
               §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
               §1t406s0§.instance.§1t6488s0§.show();
            }
            else
            {
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(this.§1t5319s0§,1);
               §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
               §1t406s0§.instance.§1t6488s0§.show();
            }
            §1t88s0§.instance.§1t1513s0§();
            this.§1t5319s0§ = 0;
         }
         else
         {
            §1t1541s0§.§1t10045s0§();
         }
         this.removeEventListeners();
         this.visible = false;
      }
      
      public function §1t3624s0§(param1:String) : String
      {
         var _loc2_:String = param1.substr(0,1);
         var _loc3_:String = param1.substr(1,param1.length);
         return _loc2_.toUpperCase() + _loc3_;
      }
      
      internal function §1t5126s0§() : *
      {
      }
      
      public function §1t5327s0§() : *
      {
         §1t251s0§.instance.§1t3524s0§("",867,[§1t1523s0§.§1t9765s0§(),§1t251s0§.instance.§1t3624s0§(this.§1t5324s0§)]);
         §1t1523s0§.charname = this.§1t5324s0§;
         §1t1523s0§.id = this.§1t5324s0§;
         §1t3318s0§.instance.§1t1837s0§ = this.§1t5324s0§ + "," + §1t1523s0§.getLevel();
         §1t1523s0§.§1t9713s0§(2207,-1);
         §1t3317s0§.instance.§1t1946s0§();
         §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t6287s0§(§1t1523s0§.charname,16763904);
         this.removeEventListeners();
         this.visible = false;
         §1t1541s0§.§1t10045s0§();
         §1t88s0§.instance.§1t1513s0§();
      }
      
      public function §1t5329s0§(param1:int) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_error");
         if(this.mode == §1t12345s0§)
         {
            this.okbutton.visible = true;
            this.cancelbutton.visible = true;
            this.errortext.visible = true;
            this.loadingtext.visible = false;
            this.errortext.text = §1t1521s0§.getString(44);
         }
         else if(this.mode == §1t12347s0§)
         {
            this.okbutton.visible = true;
            this.cancelbutton.visible = true;
            this.errortext.visible = true;
            this.loadingtext.visible = false;
            if(param1 == 1)
            {
               this.errortext.text = §1t1521s0§.getString(497);
            }
            else if(param1 == 2)
            {
               this.errortext.text = §1t1521s0§.getString(498);
            }
            else
            {
               this.errortext.text = §1t1521s0§.getString(499);
            }
            ++this.§1t5328s0§;
            if(this.§1t5328s0§ > 5)
            {
               this.okbutton.visible = false;
            }
         }
      }
      
      internal function §1t5330s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         this.visible = false;
         §1t1541s0§.§1t10045s0§();
      }
   }
}

