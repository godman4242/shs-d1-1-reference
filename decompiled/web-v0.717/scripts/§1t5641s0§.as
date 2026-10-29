package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3490")]
   public class §1t5641s0§ extends MovieClip
   {
      
      public var confirmlabel:TextField;
      
      public var emailfield:TextField;
      
      public var emaillabel:TextField;
      
      public var errormessage:TextField;
      
      public var fbnotelabel:TextField;
      
      public var goBackButton:§1t5334s0§;
      
      public var §1t5647s0§:TextField;
      
      public var password2field:TextField;
      
      public var §1t5649s0§:TextField;
      
      public var submitButton:§1t5334s0§;
      
      public var §1t5021s0§:TextField;
      
      public var usernamefield:TextField;
      
      public var usernamelabel:TextField;
      
      internal var oldemail:String;
      
      public function §1t5641s0§()
      {
         super();
         this.§1t5647s0§.displayAsPassword = true;
         this.password2field.displayAsPassword = true;
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(383);
         §1t1521s0§.§1t9290s0§(this.usernamelabel);
         this.usernamelabel.text = §1t1521s0§.getString(12);
         §1t1521s0§.§1t9290s0§(this.§1t5649s0§);
         this.§1t5649s0§.text = §1t1521s0§.getString(13);
         §1t1521s0§.§1t9290s0§(this.confirmlabel);
         this.confirmlabel.text = §1t1521s0§.getString(14);
         §1t1521s0§.§1t9290s0§(this.emaillabel);
         this.emaillabel.text = §1t1521s0§.getString(15);
         §1t1521s0§.§1t9290s0§(this.fbnotelabel);
         this.fbnotelabel.text = §1t1521s0§.getString(382);
         this.submitButton.§1t5769s0§(§1t1521s0§.getString(5));
         this.goBackButton.§1t5769s0§(§1t1521s0§.getString(9));
         §1t1521s0§.§1t9290s0§(this.errormessage);
         this.errormessage.text = "";
      }
      
      public function show() : *
      {
         visible = true;
         this.usernamefield.text = §1t3317s0§.instance.username;
         §1t3317s0§.instance.§1t1860s0§(§1t3317s0§.instance.§1t1836s0§);
         §1t7017s0§.instance.§1t7039s0§();
      }
      
      public function gotEmail(param1:String) : *
      {
         this.emailfield.text = param1;
         this.oldemail = param1;
         §1t7017s0§.instance.§1t7040s0§();
         if(§1t1523s0§.facebookid != "")
         {
            this.emaillabel.visible = false;
            this.emailfield.visible = false;
            this.fbnotelabel.visible = false;
         }
      }
      
      public function §1t5339s0§() : *
      {
         this.goBackButton.addEventListener(MouseEvent.CLICK,this.back);
         this.submitButton.addEventListener(MouseEvent.CLICK,this.submitAndVerify);
         this.goBackButton.§1t5004s0§();
         this.submitButton.§1t5004s0§();
      }
      
      internal function §1t5340s0§() : *
      {
         this.goBackButton.removeEventListener(MouseEvent.CLICK,this.back);
         this.submitButton.removeEventListener(MouseEvent.CLICK,this.submitAndVerify);
         this.goBackButton.removeEventListeners();
         this.submitButton.removeEventListeners();
      }
      
      internal function submitAndVerify(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.usernamefield.text == "" || this.§1t5647s0§.text == "" || this.password2field.text == "" || this.emailfield.text == "")
         {
            this.errormessage.text = §1t1521s0§.getString(18);
         }
         else if(this.§1t5647s0§.text != this.password2field.text)
         {
            this.errormessage.text = §1t1521s0§.getString(19);
         }
         else if(!this.isValidEmail())
         {
            this.errormessage.text = §1t1521s0§.getString(20);
         }
         else
         {
            this.§1t5340s0§();
            §1t7017s0§.instance.§1t7039s0§();
            _loc2_ = this.emailfield.text;
            if(this.oldemail == _loc2_)
            {
               _loc2_ = "";
            }
            §1t3317s0§.instance.§1t1863s0§(this.usernamefield.text,this.§1t5647s0§.text,_loc2_);
         }
      }
      
      public function §1t5343s0§(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               if(this.oldemail == this.emailfield.text)
               {
                  §1t7017s0§.instance.§1t7034s0§();
               }
               else
               {
                  this.§1t5340s0§();
                  §1t7017s0§.instance.§1t7039s0§();
                  this.visible = false;
                  §1t3317s0§.instance.§1t1856s0§();
                  §1t7017s0§.instance.§1t7030s0§();
                  §1t7017s0§.instance.login.usernamefield.text = this.usernamefield.text;
                  §1t7017s0§.instance.login.§1t6142s0§.visible = true;
               }
               return 0;
            case 2:
               §1t7017s0§.instance.§1t7040s0§();
               this.§1t5339s0§();
               this.errormessage.text = §1t1521s0§.getString(22);
               return 2;
            case 3:
            case 4:
            case 5:
         }
         §1t7017s0§.instance.§1t7040s0§();
         this.§1t5339s0§();
         this.errormessage.text = §1t1521s0§.getString(24);
         return 4;
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
      
      internal function back(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         §1t7017s0§.instance.§1t7034s0§();
      }
   }
}

