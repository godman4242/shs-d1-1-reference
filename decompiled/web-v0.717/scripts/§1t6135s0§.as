package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3529")]
   public class §1t6135s0§ extends MovieClip
   {
      
      public var errormessage:TextField;
      
      public var §1t6136s0§:SimpleButton;
      
      public var §1t6137s0§:§1t5851s0§;
      
      public var §1t6138s0§:§1t6059s0§;
      
      public var §1t6139s0§:§1t5334s0§;
      
      public var §1t6140s0§:TextField;
      
      public var §1t5649s0§:TextField;
      
      public var §1t6141s0§:§1t5003s0§;
      
      public var §1t5728s0§:§1t5003s0§;
      
      public var §1t6142s0§:TextField;
      
      public var §1t6143s0§:TextField;
      
      public var §1t6144s0§:§1t5003s0§;
      
      public var usernamefield:TextField;
      
      public var usernamelabel:TextField;
      
      public function §1t6135s0§()
      {
         super();
         this.§1t6140s0§.displayAsPassword = true;
         this.§1t6142s0§.visible = false;
         this.§1t6144s0§.visible = false;
         §1t1521s0§.§1t9290s0§(this.usernamelabel);
         this.usernamelabel.text = §1t1521s0§.getString(12) + "/" + §1t1521s0§.getString(15);
         §1t1521s0§.§1t9290s0§(this.§1t5649s0§);
         this.§1t5649s0§.text = §1t1521s0§.getString(13);
         this.§1t5728s0§.§1t5769s0§(§1t1521s0§.getString(16));
         this.§1t6139s0§.§1t5769s0§(§1t1521s0§.getString(53));
         §1t1521s0§.§1t9290s0§(this.errormessage);
         this.errormessage.text = "";
         §1t1521s0§.§1t9290s0§(this.§1t6142s0§);
         this.§1t6142s0§.text = §1t1521s0§.getString(54);
         this.§1t6144s0§.§1t5769s0§(§1t1521s0§.getString(51));
         this.§1t6137s0§.§1t5769s0§(§1t1521s0§.getString(296));
         this.§1t6141s0§.§1t5769s0§(§1t1521s0§.getString(304));
         this.§1t6141s0§.visible = false;
         this.§1t6136s0§.visible = §1t1523s0§.§1t9503s0§;
         this.§1t6143s0§.visible = false;
         if(§1t1523s0§.§1t9502s0§)
         {
            this.usernamefield.visible = false;
            this.§1t6140s0§.visible = false;
            this.usernamelabel.visible = false;
            this.§1t5649s0§.visible = false;
            this.§1t6139s0§.visible = false;
            this.§1t5728s0§.visible = false;
            this.errormessage.visible = false;
            this.§1t6136s0§.visible = false;
            this.§1t6141s0§.visible = true;
            this.§1t6137s0§.x = 50;
            this.§1t6137s0§.y = 0;
            this.§1t6141s0§.x = 50;
            this.§1t6141s0§.y = 35;
         }
         else if(§1t1523s0§.§1t9521s0§ || §1t1523s0§.§1t9522s0§ || §1t1523s0§.§1t9523s0§)
         {
            this.usernamefield.visible = false;
            this.§1t6140s0§.visible = false;
            this.usernamelabel.visible = false;
            this.§1t5649s0§.visible = false;
            this.§1t6139s0§.visible = false;
            this.§1t5728s0§.visible = false;
            this.errormessage.visible = false;
            this.§1t6136s0§.visible = false;
            this.§1t6141s0§.visible = true;
            this.§1t6137s0§.visible = false;
            this.§1t6141s0§.§1t5769s0§("Log In");
            this.§1t6141s0§.x = 50;
            this.§1t6141s0§.y = 0;
         }
         else if(§1t1523s0§.§1t9503s0§)
         {
            if(§1t1523s0§.§1t9528s0§)
            {
               this.§1t6137s0§.visible = false;
               this.§1t6136s0§.y = 342;
            }
         }
      }
      
      public function §1t5339s0§() : *
      {
         this.§1t6139s0§.addEventListener(MouseEvent.CLICK,this.login);
         this.§1t5728s0§.addEventListener(MouseEvent.CLICK,this.register);
         this.§1t6144s0§.addEventListener(MouseEvent.CLICK,this.§1t6151s0§);
         this.§1t6137s0§.addEventListener(MouseEvent.CLICK,this.§1t6146s0§);
         this.§1t6141s0§.addEventListener(MouseEvent.CLICK,this.§1t6147s0§);
         this.§1t6136s0§.addEventListener(MouseEvent.CLICK,this.§1t6148s0§);
         this.§1t5728s0§.§1t5004s0§();
         this.§1t6139s0§.§1t5004s0§();
         this.§1t6144s0§.§1t5004s0§();
         this.§1t6137s0§.§1t5004s0§();
         this.§1t6141s0§.§1t5004s0§();
         this.§1t6138s0§.§1t5004s0§();
         this.§1t6138s0§.visible = §1t1523s0§.§1t9512s0§;
      }
      
      internal function §1t5340s0§() : *
      {
         this.§1t6139s0§.removeEventListener(MouseEvent.CLICK,this.login);
         this.§1t5728s0§.removeEventListener(MouseEvent.CLICK,this.register);
         this.§1t6144s0§.removeEventListener(MouseEvent.CLICK,this.§1t6151s0§);
         this.§1t6137s0§.removeEventListener(MouseEvent.CLICK,this.§1t6146s0§);
         this.§1t6141s0§.removeEventListener(MouseEvent.CLICK,this.§1t6147s0§);
         this.§1t6136s0§.removeEventListener(MouseEvent.CLICK,this.§1t6148s0§);
         this.§1t5728s0§.removeEventListeners();
         this.§1t6139s0§.removeEventListeners();
         this.§1t6144s0§.removeEventListeners();
         this.§1t6137s0§.removeEventListeners();
         this.§1t6141s0§.removeEventListeners();
         this.§1t6138s0§.removeEventListeners();
      }
      
      internal function login(param1:MouseEvent) : void
      {
         if(this.usernamefield.text == "" || this.§1t6140s0§.text == "")
         {
            this.errormessage.text = §1t1521s0§.getString(18);
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
            this.§1t5340s0§();
            §1t7017s0§.instance.§1t7039s0§();
            §1t3317s0§.instance.§1t1833s0§ = false;
            if(§1t251s0§.instance != null && !§1t251s0§.instance.connected)
            {
               §1t251s0§.instance.init();
            }
            §1t1523s0§.§1t5740s0§ = true;
            §1t3317s0§.instance.login(this.usernamefield.text,this.§1t6140s0§.text);
         }
      }
      
      internal function §1t6145s0§() : *
      {
         this.errormessage.text = §1t1521s0§.getString(31);
         this.§1t6137s0§.visible = false;
         this.§1t6136s0§.x = this.§1t6137s0§.x;
      }
      
      public function §1t6146s0§(param1:MouseEvent) : *
      {
         if(§1t1523s0§.§1t9529s0§ == §1t1523s0§.§1t9530s0§(§1t1056s0§.§1t8881s0§))
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(§1t406s0§.instance)
         {
            §1t406s0§.instance.§1t6500s0§.§1t5224s0§();
         }
         §1t1523s0§.§1t5740s0§ = false;
         §1t3317s0§.instance.§1t1833s0§ = true;
         §1t3317s0§.instance.§1t1846s0§(100000);
         §1t3317s0§.instance.login("guest","password");
         §1t1540s0§.§1t10035s0§();
      }
      
      internal function §1t6147s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(§1t1523s0§.§1t9521s0§)
         {
            §1t1676s0§.instance.login();
         }
         else if(§1t1523s0§.§1t9522s0§)
         {
            §1t1743s0§.instance.login();
         }
         else if(§1t1523s0§.§1t9523s0§)
         {
            §1t49s0§.instance.login();
         }
         else
         {
            §1t3317s0§.instance.§1t2016s0§();
         }
      }
      
      internal function §1t6148s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t3318s0§.instance.§1t1787s0§();
      }
      
      internal function §1t5343s0§(param1:*) : int
      {
         if(!visible)
         {
            visible = true;
         }
         switch(param1)
         {
            case 0:
               if(!§1t3317s0§.instance.§1t1833s0§)
               {
                  §1t3317s0§.instance.§1t2003s0§(this.usernamefield.text,this.§1t6140s0§.text);
                  §1t7017s0§.instance.§1t7034s0§();
               }
               else
               {
                  visible = false;
                  if(!§1t1540s0§.§1t10062s0§())
                  {
                     §1t7017s0§.instance.§1t7038s0§();
                  }
               }
               return 0;
            case 1:
               this.§1t5339s0§();
               §1t7017s0§.instance.§1t7040s0§();
               this.errormessage.text = §1t1521s0§.getString(55);
               return 1;
            case 2:
               this.§1t5339s0§();
               §1t7017s0§.instance.§1t7040s0§();
               this.errormessage.text = §1t1521s0§.getString(56);
               this.§1t6144s0§.visible = true;
               return 2;
            case 4:
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(646));
               return 4;
            case 5:
               §1t7017s0§.instance.§1t7042s0§("Facebook login error. Please PM us for help.");
               return 5;
            case 6:
               §1t7017s0§.instance.§1t7042s0§("Facebook login error 2. Please PM us for help.");
               return 5;
            case 7:
               §1t7017s0§.instance.§1t7042s0§("SpilGames login error. Please PM us for help.");
               return 5;
            case 3:
         }
         this.§1t5339s0§();
         §1t7017s0§.instance.§1t7040s0§();
         this.errormessage.text = §1t1521s0§.getString(24);
         return 3;
      }
      
      public function §1t6149s0§(param1:String) : *
      {
         if(!visible)
         {
            visible = true;
         }
         this.§1t5339s0§();
         §1t7017s0§.instance.§1t7040s0§();
         this.errormessage.text = param1;
      }
      
      internal function register(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t7017s0§.instance.§1t7031s0§();
      }
      
      internal function §1t6151s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t7017s0§.instance.§1t7033s0§();
      }
   }
}

