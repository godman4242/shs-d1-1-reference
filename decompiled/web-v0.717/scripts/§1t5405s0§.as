package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3448")]
   public class §1t5405s0§ extends MovieClip
   {
      
      public var §1t5406s0§:MovieClip;
      
      public var §1t5407s0§:TextField;
      
      public var createchar:§1t5334s0§;
      
      public var errormessage:TextField;
      
      public var §1t5409s0§:TextField;
      
      public var §1t5410s0§:SimpleButton;
      
      public var faceprev:SimpleButton;
      
      public var genderlabel:TextField;
      
      public var §1t5413s0§:SimpleButton;
      
      public var §1t5414s0§:SimpleButton;
      
      public var gobackbutton:§1t5334s0§;
      
      public var hairlabel:TextField;
      
      public var hairnext:SimpleButton;
      
      public var §1t5417s0§:SimpleButton;
      
      public var §1t5418s0§:TextField;
      
      public var §1t5419s0§:SimpleButton;
      
      public var §1t5420s0§:SimpleButton;
      
      public var §1t5381s0§:TextField;
      
      public var §1t5421s0§:TextField;
      
      public var §1t5021s0§:TextField;
      
      internal var §1t5422s0§:int = 0;
      
      internal var §1t5423s0§:Array = [6019,6020,6007,6009,6006,6010,6011,6013,6008,6014,6015,6017,6018,6002,6003,6004,6001];
      
      internal var §1t5424s0§:Array = [6504,6501,6502,6503,6505,6506,6507,6508,6509,6019,6007,6009,6006,6010,6011,6017,6018,6004,6001];
      
      internal var §1t5425s0§:Array = this.§1t5423s0§;
      
      internal var §1t5426s0§:int = 0;
      
      internal var §1t5427s0§:Array = [8005,8006,8004];
      
      internal var §1t5428s0§:Array = [8500,8502,8503];
      
      internal var §1t5429s0§:Array = this.§1t5427s0§;
      
      internal var §1t5430s0§:int = 0;
      
      internal var §1t5431s0§:Array = [4017,4018,4019,4027,0];
      
      internal var §1t5432s0§:int = 0;
      
      internal var §1t5433s0§:Array = [11017,11018,11019,11027,0];
      
      internal var §1t5434s0§:int = 0;
      
      internal var §1t5435s0§:Array = [12017,12011,12011,12011,12011,12011,12011,12012,12011,12014];
      
      internal var §1t5436s0§:int = 0;
      
      internal var §1t5437s0§:Array = [0,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
      
      internal var §1t5438s0§:§1t74s0§;
      
      internal var §1t5439s0§:Boolean = false;
      
      internal var §1t5449s0§:String;
      
      public function §1t5405s0§()
      {
         super();
         this.§1t5438s0§ = §1t1523s0§.§1t9584s0§();
         this.§1t5438s0§.scaleX = 2;
         this.§1t5438s0§.scaleY = 2;
         this.§1t5406s0§.§1t15890s0§.addChild(this.§1t5438s0§);
         this.§1t5406s0§.§1t15895s0§.gotoAndStop(2);
         this.§1t5406s0§.highlight.visible = false;
         §1t1521s0§.§1t9290s0§(this.errormessage);
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(32);
         §1t1521s0§.§1t9290s0§(this.§1t5381s0§);
         this.§1t5381s0§.text = §1t1521s0§.getString(33);
         §1t1521s0§.§1t9290s0§(this.genderlabel);
         this.genderlabel.text = §1t1521s0§.getString(618);
         §1t1521s0§.§1t9290s0§(this.hairlabel);
         this.hairlabel.text = §1t1521s0§.getString(34);
         §1t1521s0§.§1t9290s0§(this.§1t5409s0§);
         this.§1t5409s0§.text = §1t1521s0§.getString(35);
         §1t1521s0§.§1t9290s0§(this.§1t5418s0§);
         this.§1t5418s0§.text = §1t1521s0§.getString(38);
         this.createchar.§1t5769s0§(§1t1521s0§.getString(39));
         this.gobackbutton.§1t5769s0§(§1t1521s0§.getString(9));
         §1t1521s0§.§1t9290s0§(this.§1t5421s0§,true);
         this.§1t5421s0§.htmlText = §1t1521s0§.getString(904);
         if(!§1t1523s0§.isFacebook() && !§1t1523s0§.§1t9521s0§ && !§1t1523s0§.§1t9522s0§)
         {
            this.§1t5421s0§.visible = false;
         }
         this.genderlabel.mouseEnabled = false;
         this.§1t5381s0§.mouseEnabled = false;
         this.hairlabel.mouseEnabled = false;
         this.§1t5409s0§.mouseEnabled = false;
         this.§1t5418s0§.mouseEnabled = false;
      }
      
      public function §1t5440s0§() : *
      {
         this.§1t5407s0§.text = "";
         this.errormessage.text = "";
         this.§1t5422s0§ = 0;
         this.§1t5426s0§ = 0;
         this.§1t5430s0§ = 0;
         this.§1t5432s0§ = 0;
         this.§1t5436s0§ = 0;
         this.§1t5439s0§ = false;
      }
      
      public function §1t5339s0§() : *
      {
         this.§1t5440s0§();
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.createchar.addEventListener(MouseEvent.CLICK,this.§1t1869s0§);
         this.gobackbutton.§1t5004s0§();
         this.createchar.§1t5004s0§();
         this.§1t5413s0§.addEventListener(MouseEvent.CLICK,this.§1t5442s0§);
         this.§1t5414s0§.addEventListener(MouseEvent.CLICK,this.§1t5442s0§);
         this.hairnext.addEventListener(MouseEvent.CLICK,this.§1t5443s0§);
         this.§1t5417s0§.addEventListener(MouseEvent.CLICK,this.§1t5444s0§);
         this.§1t5410s0§.addEventListener(MouseEvent.CLICK,this.§1t5445s0§);
         this.faceprev.addEventListener(MouseEvent.CLICK,this.§1t5446s0§);
         this.§1t5419s0§.addEventListener(MouseEvent.CLICK,this.§1t5447s0§);
         this.§1t5420s0§.addEventListener(MouseEvent.CLICK,this.§1t5448s0§);
         stage.focus = this.§1t5407s0§;
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            this.§1t5407s0§.text = "Guest";
            this.§1t5407s0§.type = TextFieldType.DYNAMIC;
            this.§1t5407s0§.background = false;
            this.§1t5407s0§.border = false;
            this.§1t5407s0§.textColor = 13421772;
            this.§1t1869s0§(null);
            visible = false;
         }
         else
         {
            this.§1t5407s0§.text = "";
            this.§1t5407s0§.type = TextFieldType.INPUT;
            this.§1t5407s0§.background = true;
            this.§1t5407s0§.border = true;
            this.§1t5407s0§.textColor = 0;
         }
      }
      
      internal function §1t5340s0§() : *
      {
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.createchar.removeEventListener(MouseEvent.CLICK,this.§1t1869s0§);
         this.gobackbutton.removeEventListeners();
         this.createchar.removeEventListeners();
         this.§1t5413s0§.removeEventListener(MouseEvent.CLICK,this.§1t5442s0§);
         this.§1t5414s0§.removeEventListener(MouseEvent.CLICK,this.§1t5442s0§);
         this.hairnext.removeEventListener(MouseEvent.CLICK,this.§1t5443s0§);
         this.§1t5417s0§.removeEventListener(MouseEvent.CLICK,this.§1t5444s0§);
         this.§1t5410s0§.removeEventListener(MouseEvent.CLICK,this.§1t5445s0§);
         this.faceprev.removeEventListener(MouseEvent.CLICK,this.§1t5446s0§);
         this.§1t5419s0§.removeEventListener(MouseEvent.CLICK,this.§1t5447s0§);
         this.§1t5420s0§.removeEventListener(MouseEvent.CLICK,this.§1t5448s0§);
      }
      
      internal function §1t5441s0§() : §1t75s0§
      {
         return §1t1540s0§.§1t9976s0§;
      }
      
      internal function §1t5442s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         this.§1t5439s0§ = !this.§1t5439s0§;
         this.§1t5422s0§ = 0;
         this.§1t5426s0§ = 0;
         this.§1t5436s0§ = 0;
         if(!this.§1t5439s0§)
         {
            this.§1t5429s0§ = this.§1t5427s0§;
            this.§1t5425s0§ = this.§1t5423s0§;
            this.§1t5441s0§().§1t6244s0§(10000);
            this.§1t5438s0§.§1t6244s0§(10000);
         }
         else
         {
            this.§1t5429s0§ = this.§1t5428s0§;
            this.§1t5425s0§ = this.§1t5424s0§;
            this.§1t5441s0§().§1t6244s0§(10001);
            this.§1t5438s0§.§1t6244s0§(10001);
         }
         this.§1t5441s0§().§1t6242s0§(this.§1t5425s0§[0]);
         this.§1t5438s0§.§1t6242s0§(this.§1t5425s0§[0]);
         this.§1t5441s0§().§1t6239s0§(this.§1t5429s0§[0]);
         this.§1t5438s0§.§1t6239s0§(this.§1t5429s0§[0]);
         this.§1t5441s0§().§1t6240s0§(0);
         this.§1t5438s0§.§1t6240s0§(0);
      }
      
      internal function §1t5443s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         ++this.§1t5422s0§;
         if(this.§1t5422s0§ > this.§1t5425s0§.length - 1)
         {
            this.§1t5422s0§ = 0;
         }
         if(this.§1t5436s0§ == 0)
         {
            this.§1t5441s0§().§1t6242s0§(this.§1t5425s0§[this.§1t5422s0§]);
            this.§1t5438s0§.§1t6242s0§(this.§1t5425s0§[this.§1t5422s0§]);
         }
      }
      
      internal function §1t5444s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         --this.§1t5422s0§;
         if(this.§1t5422s0§ < 0)
         {
            this.§1t5422s0§ = this.§1t5425s0§.length - 1;
         }
         if(this.§1t5436s0§ == 0)
         {
            this.§1t5441s0§().§1t6242s0§(this.§1t5425s0§[this.§1t5422s0§]);
            this.§1t5438s0§.§1t6242s0§(this.§1t5425s0§[this.§1t5422s0§]);
         }
      }
      
      internal function §1t5445s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         ++this.§1t5426s0§;
         if(this.§1t5426s0§ > this.§1t5429s0§.length - 1)
         {
            this.§1t5426s0§ = 0;
         }
         this.§1t5441s0§().§1t6239s0§(this.§1t5429s0§[this.§1t5426s0§]);
         this.§1t5438s0§.§1t6239s0§(this.§1t5429s0§[this.§1t5426s0§]);
      }
      
      internal function §1t5446s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         --this.§1t5426s0§;
         if(this.§1t5426s0§ < 0)
         {
            this.§1t5426s0§ = this.§1t5429s0§.length - 1;
         }
         this.§1t5441s0§().§1t6239s0§(this.§1t5429s0§[this.§1t5426s0§]);
         this.§1t5438s0§.§1t6239s0§(this.§1t5429s0§[this.§1t5426s0§]);
      }
      
      internal function §1t5447s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         ++this.§1t5436s0§;
         if(this.§1t5436s0§ > this.§1t5437s0§.length - 1)
         {
            this.§1t5436s0§ = 0;
         }
         this.§1t5441s0§().§1t6240s0§(this.§1t5437s0§[this.§1t5436s0§]);
         this.§1t5438s0§.§1t6240s0§(this.§1t5437s0§[this.§1t5436s0§]);
         if(this.§1t5436s0§ == 0)
         {
            this.§1t5441s0§().§1t6247s0§();
            this.§1t5438s0§.§1t6242s0§(this.§1t5425s0§[this.§1t5422s0§]);
         }
         else
         {
            this.§1t5441s0§().§1t6248s0§();
            if(this.§1t5425s0§[this.§1t5422s0§] != 6001)
            {
               this.§1t5438s0§.§1t6242s0§(6000);
            }
         }
      }
      
      internal function §1t5448s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         --this.§1t5436s0§;
         if(this.§1t5436s0§ < 0)
         {
            this.§1t5436s0§ = this.§1t5437s0§.length - 1;
         }
         this.§1t5441s0§().§1t6240s0§(this.§1t5437s0§[this.§1t5436s0§]);
         this.§1t5438s0§.§1t6240s0§(this.§1t5437s0§[this.§1t5436s0§]);
         if(this.§1t5436s0§ == 0)
         {
            this.§1t5441s0§().§1t6247s0§();
            this.§1t5438s0§.§1t6242s0§(this.§1t5425s0§[this.§1t5422s0§]);
         }
         else
         {
            this.§1t5441s0§().§1t6248s0§();
            if(this.§1t5425s0§[this.§1t5422s0§] != 6001)
            {
               this.§1t5438s0§.§1t6242s0§(6000);
            }
         }
      }
      
      internal function §1t5341s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t5340s0§();
         §1t1540s0§.§1t10018s0§();
         if(!§1t1523s0§.§1t9487s0§)
         {
            §1t7017s0§.instance.§1t7037s0§();
         }
         else
         {
            visible = false;
            this.§1t5340s0§();
            §1t7017s0§.instance.§1t7034s0§();
         }
      }
      
      internal function §1t5322s0§(param1:String) : String
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
      
      internal function §1t1869s0§(param1:MouseEvent) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.§1t5407s0§.text == "")
         {
            this.errormessage.text = §1t1521s0§.getString(41);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         this.§1t5407s0§.text = this.§1t5407s0§.text.toLowerCase();
         if(!§1t3317s0§.instance.§1t1833s0§ && this.§1t5407s0§.text == "guest" || this.§1t5322s0§(this.§1t5407s0§.text) != this.§1t5407s0§.text)
         {
            this.errormessage.text = §1t1521s0§.getString(906);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         var _loc2_:RegExp = /[^a-zA-Z0-9]/;
         if(_loc2_.test(this.§1t5407s0§.text))
         {
            this.errormessage.text = §1t1521s0§.getString(137);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(this.§1t5407s0§.text.length > 15)
         {
            this.errormessage.text = §1t1521s0§.getString(4);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            if(int(Math.random() * 3) == 0)
            {
               this.§1t5442s0§(null);
            }
            _loc4_ = Math.random() * this.§1t5429s0§.length;
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               this.§1t5445s0§(null);
               _loc3_++;
            }
            _loc4_ = Math.random() * this.§1t5425s0§.length - 1;
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               this.§1t5443s0§(null);
               _loc3_++;
            }
            _loc4_ = Math.random() * this.§1t5437s0§.length - 1;
            _loc3_ = 1;
            while(_loc3_ < _loc4_)
            {
               this.§1t5447s0§(null);
               _loc3_++;
            }
         }
         §1t1523s0§.§1t9544s0§(this.§1t5407s0§.text,this.§1t5425s0§[this.§1t5422s0§],this.§1t5429s0§[this.§1t5426s0§],this.§1t5431s0§[this.§1t5430s0§],this.§1t5433s0§[this.§1t5432s0§],this.§1t5437s0§[this.§1t5436s0§],this.§1t5435s0§[this.§1t5434s0§],this.§1t5439s0§);
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7039s0§();
         this.§1t5449s0§ = this.§1t5407s0§.text;
         §1t3317s0§.instance.§1t1869s0§(this.§1t5407s0§.text);
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
      }
      
      public function §1t5343s0§(param1:int) : *
      {
         switch(param1)
         {
            case 0:
               if(!§1t3317s0§.instance.§1t1833s0§)
               {
                  §1t1523s0§.reset();
               }
               §1t1623s0§.instance.§1t1637s0§();
               §1t1523s0§.charname = this.§1t5449s0§;
               §1t1540s0§.§1t10040s0§(0);
               §1t1540s0§.§1t10011s0§(§1t1540s0§.§1t9989s0§);
               §1t7017s0§.instance.§1t7040s0§();
               §1t7017s0§.instance.§1t7044s0§();
               this.visible = false;
               break;
            case 1:
               this.errormessage.text = §1t1521s0§.getString(42);
               this.§1t5340s0§();
               §1t1523s0§.reset();
               §1t7017s0§.instance.§1t7030s0§();
               break;
            case 2:
               this.errormessage.text = §1t1521s0§.getString(43);
               this.§1t5340s0§();
               §1t1523s0§.reset();
               §1t7017s0§.instance.§1t7030s0§();
               break;
            case 3:
               §1t7017s0§.instance.§1t7040s0§();
               this.§1t5339s0§();
               this.errormessage.text = §1t1521s0§.getString(44);
               break;
            case 4:
               §1t7017s0§.instance.§1t7040s0§();
               this.§1t5339s0§();
               this.errormessage.text = §1t1521s0§.getString(24);
               break;
            case 5:
               §1t7017s0§.instance.§1t7040s0§();
               this.§1t5339s0§();
               this.errormessage.htmlText = §1t1521s0§.getString(11102);
               if(§1t1523s0§.§1t9521s0§)
               {
                  §1t1676s0§.instance.§1t1680s0§();
               }
               break;
            case 6:
               §1t7017s0§.instance.§1t7040s0§();
               this.§1t5339s0§();
               this.errormessage.text = §1t1521s0§.getString(24);
               if(§1t1523s0§.§1t9521s0§)
               {
                  §1t1676s0§.instance.§1t1680s0§();
               }
         }
      }
   }
}

