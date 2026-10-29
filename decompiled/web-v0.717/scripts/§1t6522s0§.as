package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1149")]
   public class §1t6522s0§ extends MovieClip
   {
      
      public var §1t5407s0§:TextField;
      
      public var charnamelabel:TextField;
      
      public var confirmlabel:TextField;
      
      public var emailfield:TextField;
      
      public var emaillabel:TextField;
      
      public var errormessage:TextField;
      
      public var fbnotelabel:TextField;
      
      public var goBackButton:§1t5000s0§;
      
      public var §1t5647s0§:TextField;
      
      public var password2field:TextField;
      
      public var §1t5649s0§:TextField;
      
      public var submitButton:§1t5059s0§;
      
      public var §1t5421s0§:TextField;
      
      public var §1t5021s0§:TextField;
      
      public var usernamefield:TextField;
      
      public var usernamelabel:TextField;
      
      internal var §1t6085s0§:MovieClip;
      
      internal var §1t5449s0§:String;
      
      internal var §1t6829s0§:String;
      
      internal var §1t6830s0§:String;
      
      internal var §1t6831s0§:String;
      
      public function §1t6522s0§()
      {
         super();
         this.§1t5647s0§.displayAsPassword = true;
         this.password2field.displayAsPassword = true;
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(908);
         §1t1521s0§.§1t9290s0§(this.charnamelabel);
         this.charnamelabel.text = §1t1521s0§.getString(910);
         §1t1521s0§.§1t9290s0§(this.usernamelabel);
         this.usernamelabel.text = §1t1521s0§.getString(909);
         §1t1521s0§.§1t9290s0§(this.§1t5649s0§);
         this.§1t5649s0§.text = §1t1521s0§.getString(13);
         §1t1521s0§.§1t9290s0§(this.confirmlabel);
         this.confirmlabel.text = §1t1521s0§.getString(14);
         §1t1521s0§.§1t9290s0§(this.emaillabel);
         this.emaillabel.text = §1t1521s0§.getString(15);
         §1t1521s0§.§1t9290s0§(this.fbnotelabel);
         this.fbnotelabel.text = §1t1521s0§.getString(382);
         this.submitButton.§1t5769s0§(§1t1521s0§.getString(16));
         this.goBackButton.§1t5769s0§(§1t1521s0§.getString(9));
         §1t1521s0§.§1t9290s0§(this.errormessage);
         this.errormessage.text = "";
         §1t1521s0§.§1t9290s0§(this.§1t5421s0§,true);
         this.§1t5421s0§.htmlText = §1t1521s0§.getString(898);
         if(§1t1523s0§.§1t9503s0§)
         {
            this.fbnotelabel.text = "";
         }
      }
      
      public function §1t5004s0§() : *
      {
         this.goBackButton.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.submitButton.addEventListener(MouseEvent.CLICK,this.submitAndVerify);
      }
      
      internal function removeEventListeners() : *
      {
         this.goBackButton.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.submitButton.removeEventListener(MouseEvent.CLICK,this.submitAndVerify);
      }
      
      public function show() : *
      {
         this.§1t5004s0§();
         this.visible = true;
         §1t406s0§.instance.tabChildren = true;
         this.fbnotelabel.visible = false;
      }
      
      internal function submitAndVerify(param1:MouseEvent) : void
      {
         var _loc2_:RegExp = null;
         if(this.usernamefield.text == "" || this.§1t5647s0§.text == "" || this.password2field.text == "" || this.emailfield.text == "" || this.§1t5407s0§.text == "")
         {
            this.errormessage.text = §1t1521s0§.getString(18);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else
         {
            if(!this.§1t6833s0§())
            {
               return;
            }
            _loc2_ = /[^a-zA-Z0-9]/;
            if(_loc2_.test(this.usernamefield.text))
            {
               this.errormessage.text = §1t1521s0§.getString(137);
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return;
            }
            if(this.§1t5647s0§.text != this.password2field.text)
            {
               this.errormessage.text = §1t1521s0§.getString(19);
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            }
            else if(!this.isValidEmail())
            {
               this.errormessage.text = §1t1521s0§.getString(20);
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            }
            else
            {
               §1t88s0§.instance.§1t1516s0§("Snd_click");
               this.removeEventListeners();
               §1t1540s0§.§1t10035s0§();
               this.usernamefield.text = this.usernamefield.text.toLowerCase();
               this.§1t5407s0§.text = this.§1t5407s0§.text.toLowerCase();
               this.§1t5449s0§ = this.§1t5407s0§.text;
               this.§1t6829s0§ = this.usernamefield.text;
               this.§1t6830s0§ = this.§1t5647s0§.text;
               this.§1t6831s0§ = this.emailfield.text;
               §1t251s0§.instance.§1t3627s0§("charnamecheck",{"charname":this.§1t5407s0§.text});
            }
         }
      }
      
      public function §1t6832s0§(param1:int) : *
      {
         switch(param1)
         {
            case 0:
               §1t3318s0§.instance.§1t3338s0§(this.§1t5449s0§,this.§1t6829s0§,this.§1t6830s0§,this.§1t6831s0§);
               break;
            case 3:
               §1t1540s0§.§1t10036s0§();
               this.§1t5004s0§();
               this.errormessage.text = §1t1521s0§.getString(44);
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               break;
            case 4:
               §1t1540s0§.§1t10036s0§();
               this.§1t5004s0§();
               this.errormessage.text = §1t1521s0§.getString(24);
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               break;
            case 5:
               §1t1540s0§.§1t10036s0§();
               this.§1t5004s0§();
               this.errormessage.text = §1t1521s0§.getString(43);
               this.fbnotelabel.visible = true;
               this.fbnotelabel.htmlText = §1t1521s0§.getString(11102);
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               break;
            case 6:
               §1t1540s0§.§1t10036s0§();
               this.§1t5004s0§();
               this.errormessage.text = §1t1521s0§.getString(24);
               §1t88s0§.instance.§1t1516s0§("Snd_error");
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
      
      internal function §1t6833s0§() : Boolean
      {
         this.§1t5407s0§.text = this.§1t5407s0§.text.toLowerCase();
         if(this.§1t5407s0§.text == "guest" || this.§1t5322s0§(this.§1t5407s0§.text) != this.§1t5407s0§.text)
         {
            this.errormessage.text = §1t1521s0§.getString(906);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return false;
         }
         var _loc1_:RegExp = /[^a-zA-Z0-9]/;
         if(_loc1_.test(this.§1t5407s0§.text))
         {
            this.errormessage.text = §1t1521s0§.getString(137);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return false;
         }
         if(this.§1t5407s0§.text.length > 15)
         {
            this.errormessage.text = §1t1521s0§.getString(4);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return false;
         }
         return true;
      }
      
      public function §1t5343s0§(param1:int) : *
      {
         switch(param1)
         {
            case 0:
               §1t1540s0§.§1t10036s0§();
               §1t406s0§.instance.§1t6653s0§(false);
               §1t1523s0§.§1t5740s0§ = true;
               §1t406s0§.instance.§1t6500s0§.init();
               §1t251s0§.instance.init();
               §1t251s0§.instance.§1t3586s0§();
               §1t251s0§.instance.§1t3616s0§();
               §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t6287s0§(§1t1523s0§.charname,16763904);
               §1t88s0§.instance.§1t1516s0§("Snd_ninja");
               this.§1t5026s0§(null);
         }
      }
      
      public function §1t6149s0§(param1:String) : *
      {
         §1t1540s0§.§1t10036s0§();
         this.§1t5004s0§();
         this.errormessage.text = param1;
      }
      
      internal function isValidEmail() : Boolean
      {
         var _loc1_:String = this.emailfield.text;
         var _loc2_:Array = _loc1_.split("@",3);
         if(_loc2_.length != 2)
         {
            return false;
         }
         if(_loc2_[0] == "" || _loc2_[1] == "")
         {
            return false;
         }
         if(_loc2_[1].split(".",2).length < 2)
         {
            return false;
         }
         if(_loc2_[1].split(".",2)[0] == "" || _loc2_[1].split(".",2)[1] == "")
         {
            return false;
         }
         return true;
      }
      
      internal function §1t5026s0§(param1:MouseEvent) : void
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
         }
         visible = false;
         §1t1541s0§.§1t10045s0§();
         §1t406s0§.instance.tabChildren = false;
      }
   }
}

