package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2793")]
   public class ResendValidationForm extends MovieClip
   {
      
      public var errormessage:TextField;
      
      public var sendemail:YellowButtonSmall;
      
      public var emailfield:TextField;
      
      public var emaillabel:TextField;
      
      public var titletext:TextField;
      
      public var gobackbutton:YellowButtonSmall;
      
      public function ResendValidationForm()
      {
         super();
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(50);
         LangManager.initTextField(this.emaillabel);
         this.emaillabel.text = LangManager.getString(15);
         this.sendemail.setText(LangManager.getString(51));
         this.gobackbutton.setText(LangManager.getString(9));
      }
      
      public function reAddListeners() : *
      {
         this.sendemail.addEventListener(MouseEvent.CLICK,this.resendemail);
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.goBack);
         this.sendemail.addEventListeners();
         this.gobackbutton.addEventListeners();
      }
      
      internal function removeListeners() : *
      {
         this.sendemail.removeEventListener(MouseEvent.CLICK,this.resendemail);
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.goBack);
         this.sendemail.removeEventListeners();
         this.gobackbutton.removeEventListeners();
      }
      
      internal function resendemail(event:MouseEvent) : *
      {
         if(!this.isValidEmail())
         {
            this.errormessage.text = LangManager.getString(20);
         }
         else
         {
            this.errormessage.text = "";
            this.removeListeners();
            TitleUI.instance.loadingScreenOn();
            QueryManager.instance.sendVerify(this.emailfield.text);
         }
      }
      
      public function serverResponse(input:*) : int
      {
         switch(input)
         {
            case 0:
            case 1:
               TitleUI.instance.login.registrationtext.visible = true;
               TitleUI.instance.login.resendbutton.visible = true;
               TitleUI.instance.switchToLogin();
               return 0;
            case 2:
            case 3:
               TitleUI.instance.loadingScreenOff();
               this.reAddListeners();
               this.errormessage.text = LangManager.getString(24);
               return 0;
         }
         TitleUI.instance.loadingScreenOff();
         this.reAddListeners();
         this.errormessage.text = LangManager.getString(52);
         return 0;
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
      
      internal function goBack(event:MouseEvent) : *
      {
         this.removeListeners();
         TitleUI.instance.switchToLogin();
      }
   }
}

