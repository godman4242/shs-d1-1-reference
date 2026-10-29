package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2820")]
   public class RegistrationForm extends MovieClip
   {
      
      public var confirmlabel:TextField;
      
      public var errormessage:TextField;
      
      public var usernamefield:TextField;
      
      public var usernamelabel:TextField;
      
      public var goBackButton:YellowButtonSmall;
      
      public var emailfield:TextField;
      
      public var emaillabel:TextField;
      
      public var submitButton:YellowButtonSmall;
      
      public var passwordlabel:TextField;
      
      public var fbnotelabel:TextField;
      
      public var password1field:TextField;
      
      public var titletext:TextField;
      
      public var password2field:TextField;
      
      public function RegistrationForm()
      {
         super();
         this.password1field.displayAsPassword = true;
         this.password2field.displayAsPassword = true;
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(11);
         LangManager.initTextField(this.usernamelabel);
         this.usernamelabel.text = LangManager.getString(12);
         LangManager.initTextField(this.passwordlabel);
         this.passwordlabel.text = LangManager.getString(13);
         LangManager.initTextField(this.confirmlabel);
         this.confirmlabel.text = LangManager.getString(14);
         LangManager.initTextField(this.emaillabel);
         this.emaillabel.text = LangManager.getString(15);
         LangManager.initTextField(this.fbnotelabel);
         this.fbnotelabel.text = LangManager.getString(382);
         this.submitButton.setText(LangManager.getString(16));
         this.goBackButton.setText(LangManager.getString(9));
         LangManager.initTextField(this.errormessage);
         this.errormessage.text = "";
         if(StatsManager.usePlayerIO)
         {
            this.fbnotelabel.text = "";
         }
      }
      
      public function reAddListeners() : *
      {
         this.goBackButton.addEventListener(MouseEvent.CLICK,this.back);
         this.submitButton.addEventListener(MouseEvent.CLICK,this.submitAndVerify);
         this.goBackButton.addEventListeners();
         this.submitButton.addEventListeners();
      }
      
      internal function removeListeners() : *
      {
         this.goBackButton.removeEventListener(MouseEvent.CLICK,this.back);
         this.submitButton.removeEventListener(MouseEvent.CLICK,this.submitAndVerify);
         this.goBackButton.removeEventListeners();
         this.submitButton.removeEventListeners();
      }
      
      internal function submitAndVerify(event:MouseEvent) : void
      {
         var nameEx:RegExp = null;
         if(this.usernamefield.text == "" || this.password1field.text == "" || this.password2field.text == "" || this.emailfield.text == "")
         {
            this.errormessage.text = LangManager.getString(18);
         }
         else
         {
            nameEx = /[^a-zA-Z0-9]/;
            if(nameEx.test(this.usernamefield.text))
            {
               this.errormessage.text = LangManager.getString(137);
               return;
            }
            if(this.password1field.text != this.password2field.text)
            {
               this.errormessage.text = LangManager.getString(19);
            }
            else if(!this.isValidEmail())
            {
               this.errormessage.text = LangManager.getString(20);
            }
            else
            {
               this.removeListeners();
               TitleUI.instance.loadingScreenOn();
               this.usernamefield.text = this.usernamefield.text.toLowerCase();
               QueryManager.instance.registerUser(this.usernamefield.text,this.password1field.text,this.emailfield.text);
            }
         }
      }
      
      public function serverResponse(input:int) : int
      {
         switch(input)
         {
            case 0:
               TitleUI.instance.login.usernamefield.text = this.usernamefield.text;
               TitleUI.instance.login.registrationtext.visible = true;
               TitleUI.instance.login.resendbutton.visible = true;
               TitleUI.instance.switchToLogin();
               return 0;
            case 1:
               TitleUI.instance.loadingScreenOff();
               this.reAddListeners();
               this.errormessage.text = LangManager.getString(21);
               return 1;
            case 2:
               TitleUI.instance.loadingScreenOff();
               this.reAddListeners();
               this.errormessage.text = LangManager.getString(22);
               return 2;
            case 3:
               TitleUI.instance.loadingScreenOff();
               this.reAddListeners();
               this.errormessage.text = LangManager.getString(23);
               return 3;
            case 4:
            case 5:
         }
         TitleUI.instance.loadingScreenOff();
         this.reAddListeners();
         this.errormessage.text = LangManager.getString(24);
         return 4;
      }
      
      public function serverErrorMessage(str:String) : *
      {
         TitleUI.instance.loadingScreenOff();
         this.reAddListeners();
         this.errormessage.text = str;
      }
      
      internal function isValidEmail() : Boolean
      {
         var email:String = this.emailfield.text;
         var emailcheckarray:Array = email.split("@",3);
         if(emailcheckarray.length != 2)
         {
            return false;
         }
         if(emailcheckarray[0] == "" || emailcheckarray[1] == "")
         {
            return false;
         }
         if(emailcheckarray[1].split(".",2).length < 2)
         {
            return false;
         }
         if(emailcheckarray[1].split(".",2)[0] == "" || emailcheckarray[1].split(".",2)[1] == "")
         {
            return false;
         }
         return true;
      }
      
      internal function back(event:MouseEvent) : void
      {
         TitleUI.instance.switchToLogin();
      }
   }
}

