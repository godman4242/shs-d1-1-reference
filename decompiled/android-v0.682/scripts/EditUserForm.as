package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2808")]
   public class EditUserForm extends MovieClip
   {
      
      public var confirmlabel:TextField;
      
      public var errormessage:TextField;
      
      public var usernamefield:TextField;
      
      public var usernamelabel:TextField;
      
      public var goBackButton:YellowButtonSmall;
      
      public var emailfield:TextField;
      
      public var submitButton:YellowButtonSmall;
      
      public var emaillabel:TextField;
      
      public var passwordlabel:TextField;
      
      public var fbnotelabel:TextField;
      
      public var password1field:TextField;
      
      public var titletext:TextField;
      
      public var password2field:TextField;
      
      internal var oldemail:String;
      
      public function EditUserForm()
      {
         super();
         this.password1field.displayAsPassword = true;
         this.password2field.displayAsPassword = true;
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(383);
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
         this.submitButton.setText(LangManager.getString(5));
         this.goBackButton.setText(LangManager.getString(9));
         LangManager.initTextField(this.errormessage);
         this.errormessage.text = "";
      }
      
      public function show() : *
      {
         visible = true;
         this.usernamefield.text = QueryManager.instance.username;
         QueryManager.instance.getEmail(QueryManager.instance.userid);
         TitleUI.instance.loadingScreenOn();
      }
      
      public function gotEmail(email:String) : *
      {
         this.emailfield.text = email;
         this.oldemail = email;
         TitleUI.instance.loadingScreenOff();
         if(StatsManager.facebookid != "")
         {
            this.emaillabel.visible = false;
            this.emailfield.visible = false;
            this.fbnotelabel.visible = false;
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
         var newemail:String = null;
         if(this.usernamefield.text == "" || this.password1field.text == "" || this.password2field.text == "" || this.emailfield.text == "")
         {
            this.errormessage.text = LangManager.getString(18);
         }
         else
         {
            trace(this.usernamefield.text.length);
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
               newemail = this.emailfield.text;
               if(this.oldemail == newemail)
               {
                  newemail = "";
               }
               QueryManager.instance.editUser(this.usernamefield.text,this.password1field.text,newemail);
            }
         }
      }
      
      public function serverResponse(input:int) : int
      {
         switch(input)
         {
            case 0:
               if(this.oldemail == this.emailfield.text)
               {
                  TitleUI.instance.switchToReady();
               }
               else
               {
                  this.removeListeners();
                  TitleUI.instance.loadingScreenOn();
                  this.visible = false;
                  QueryManager.instance.logout();
                  TitleUI.instance.switchToLogin();
                  TitleUI.instance.login.usernamefield.text = this.usernamefield.text;
                  TitleUI.instance.login.registrationtext.visible = true;
               }
               return 0;
            case 2:
               TitleUI.instance.loadingScreenOff();
               this.reAddListeners();
               this.errormessage.text = LangManager.getString(22);
               return 2;
            case 3:
            case 4:
            case 5:
         }
         TitleUI.instance.loadingScreenOff();
         this.reAddListeners();
         this.errormessage.text = LangManager.getString(24);
         return 4;
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
         TitleUI.instance.switchToReady();
      }
   }
}

