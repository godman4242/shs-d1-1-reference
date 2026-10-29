package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3534")]
   public class §1t7017s0§ extends MovieClip
   {
      
      internal static var instance:§1t7017s0§;
      
      public var charcreate:§1t5405s0§;
      
      public var charselect:§1t5344s0§;
      
      public var edit:§1t5641s0§;
      
      public var getEmailForm:§1t5771s0§;
      
      public var loadingscreen:MovieClip;
      
      public var login:§1t6135s0§;
      
      public var logonready:§1t6152s0§;
      
      public var lutbutton:SimpleButton;
      
      public var motd:§1t6307s0§;
      
      public var options:§1t6407s0§;
      
      public var rankings:§1t6073s0§;
      
      public var register:§1t6834s0§;
      
      public var resend:§1t6835s0§;
      
      public var §1t6496s0§:§1t6497s0§;
      
      public var title_chinese:MovieClip;
      
      public var title_english:§1t5175s0§;
      
      public var titleshadebar:MovieClip;
      
      public var versiontext:TextField;
      
      public function §1t7017s0§()
      {
         super();
         instance = this;
         this.login.visible = false;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.resend.visible = false;
         this.charselect.visible = false;
         this.charcreate.visible = false;
         this.rankings.visible = false;
         this.motd.visible = false;
         this.getEmailForm.visible = false;
         this.versiontext.text = "v" + §1t1523s0§.§1t9323s0§.toString();
         this.loadingscreen.visible = false;
         §1t1521s0§.§1t9290s0§(this.loadingscreen.prompt);
         this.loadingscreen.prompt.text = §1t1521s0§.getString(25);
         if(§1t1523s0§.§1t9524s0§)
         {
            §1t1802s0§.instance.init(§1t1540s0§.§1t9973s0§.root);
         }
         if(!§1t3317s0§.instance.§1t1834s0§ && §1t1523s0§.§1t9521s0§)
         {
            §1t1676s0§.instance.login();
         }
         else if(!§1t3317s0§.instance.§1t1834s0§ && §1t1523s0§.§1t9522s0§)
         {
            §1t1743s0§.instance.login();
         }
         else if(!§1t3317s0§.instance.§1t1834s0§ && §1t1523s0§.§1t9523s0§)
         {
            §1t49s0§.instance.login();
         }
         else if(!§1t3317s0§.instance.§1t1834s0§ && §1t1523s0§.§1t9498s0§ && §1t3317s0§.instance.§1t1852s0§())
         {
            §1t3317s0§.instance.§1t1853s0§();
            §1t7017s0§.instance.§1t7039s0§();
         }
         else if(!§1t3317s0§.instance.§1t1834s0§ && §1t1523s0§.§1t9497s0§)
         {
            §1t3317s0§.instance.§1t1851s0§();
            §1t7017s0§.instance.§1t7039s0§();
         }
         else if(!§1t3317s0§.instance.§1t1834s0§ && §1t3317s0§.instance.§1t2007s0§())
         {
            if(!§1t3317s0§.instance.§1t1833s0§)
            {
               §1t7017s0§.instance.§1t7039s0§();
            }
         }
         else
         {
            this.§1t7030s0§();
         }
         §1t3317s0§.instance.§1t2005s0§();
         this.title_english.visible = false;
         this.title_chinese.visible = false;
         if(§1t1521s0§.getLanguage() == §1t1521s0§.CHINESE)
         {
            this.title_chinese.visible = true;
         }
         else
         {
            this.title_english.visible = true;
         }
         this.lutbutton.addEventListener(MouseEvent.CLICK,this.§1t7029s0§,false,0,true);
         this.§1t5250s0§();
      }
      
      public function §1t7029s0§(param1:MouseEvent) : *
      {
         §1t3317s0§.instance.§1t2014s0§();
      }
      
      public function §1t7030s0§() : *
      {
         this.login.§1t5339s0§();
         this.login.errormessage.text = "";
         this.login.visible = true;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.resend.visible = false;
         this.loadingscreen.visible = false;
      }
      
      public function §1t7031s0§() : *
      {
         this.register.§1t5339s0§();
         this.register.errormessage.text = "";
         this.login.visible = false;
         this.register.visible = true;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.loadingscreen.visible = false;
      }
      
      public function §1t7032s0§() : *
      {
         this.edit.§1t5339s0§();
         this.edit.errormessage.text = "";
         this.login.visible = false;
         this.register.visible = false;
         this.edit.show();
         this.logonready.visible = false;
         this.options.visible = false;
         this.loadingscreen.visible = false;
      }
      
      public function §1t7033s0§() : *
      {
         this.resend.§1t5339s0§();
         this.resend.errormessage.text = "";
         this.resend.visible = true;
         this.login.visible = false;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.loadingscreen.visible = false;
      }
      
      public function §1t7034s0§() : *
      {
         this.logonready.§1t5339s0§();
         this.logonready.§1t6163s0§();
         this.login.visible = false;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = true;
         this.options.visible = false;
         this.charselect.visible = false;
         this.loadingscreen.visible = false;
         this.lutbutton.visible = true;
      }
      
      public function §1t7035s0§() : *
      {
         this.options.§1t5339s0§();
         this.login.visible = false;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = true;
         this.loadingscreen.visible = false;
         this.lutbutton.visible = false;
      }
      
      public function §1t7036s0§() : *
      {
         this.rankings.show();
         this.logonready.visible = false;
         this.lutbutton.visible = false;
      }
      
      public function §1t7037s0§() : *
      {
         this.charselect.§1t5339s0§();
         this.logonready.visible = false;
         this.options.visible = false;
         this.charcreate.visible = false;
         this.loadingscreen.visible = false;
         if(!§1t1523s0§.§1t9487s0§)
         {
            this.charselect.visible = true;
         }
         this.charselect.§1t5349s0§();
         this.lutbutton.visible = false;
      }
      
      public function §1t7038s0§() : *
      {
         this.charselect.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.charcreate.visible = true;
         this.loadingscreen.visible = false;
         §1t1540s0§.§1t10031s0§();
         this.lutbutton.visible = false;
         this.charcreate.§1t5339s0§();
      }
      
      public function §1t7039s0§() : *
      {
         this.loadingscreen.visible = true;
      }
      
      public function §1t7040s0§() : *
      {
         this.loadingscreen.visible = false;
      }
      
      public function §1t7041s0§(param1:String) : *
      {
         this.loadingscreen.prompt.text = param1;
      }
      
      public function §1t7042s0§(param1:String) : *
      {
         this.loadingscreen.prompt.text = param1;
         this.loadingscreen.gotoAndStop(2);
      }
      
      public function §1t7043s0§(param1:String) : *
      {
         if(param1 == "")
         {
            return;
         }
         this.motd.show(param1,§1t1521s0§.getString(5));
      }
      
      public function §1t7044s0§() : *
      {
         this.versiontext.visible = false;
         this.title_english.visible = false;
         this.title_chinese.visible = false;
         this.titleshadebar.visible = false;
         this.lutbutton.visible = false;
      }
      
      public function §1t7045s0§() : *
      {
         this.login.§1t6146s0§(null);
      }
      
      public function §1t5250s0§() : *
      {
         scaleX = §1t1523s0§.§1t9358s0§;
         scaleY = §1t1523s0§.§1t9358s0§;
         x = §1t1523s0§.§1t9359s0§;
         y = §1t1523s0§.§1t9360s0§;
         §1t1540s0§.§1t10022s0§();
      }
      
      public function §1t7046s0§() : *
      {
      }
   }
}

