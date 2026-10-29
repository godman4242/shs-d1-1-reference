package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol70")]
   public class §1t1040s0§ extends MovieClip
   {
      
      public static var §1t12374s0§:int = 0;
      
      public static var §1t12375s0§:int = 1;
      
      public static var §1t12376s0§:int = 2;
      
      public var comicbutton:§1t6088s0§;
      
      public var comictext:TextField;
      
      public var f_1:MovieClip;
      
      public var f_10:MovieClip;
      
      public var f_2:MovieClip;
      
      public var f_29:MovieClip;
      
      public var f_3:MovieClip;
      
      public var f_30:MovieClip;
      
      public var f_31:MovieClip;
      
      public var f_32:MovieClip;
      
      public var f_4:MovieClip;
      
      public var f_5:MovieClip;
      
      public var f_6:MovieClip;
      
      public var f_7:MovieClip;
      
      public var f_8:MovieClip;
      
      public var f_9:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var ff_2:MovieClip;
      
      public var ff_3:MovieClip;
      
      public var ff_4:MovieClip;
      
      public var fg_1:MovieClip;
      
      public var fg_2:MovieClip;
      
      public var fg_3:MovieClip;
      
      public var fg_4:MovieClip;
      
      public var ground_1:MovieClip;
      
      public var §1t6113s0§:TextField;
      
      public var loadingtext:TextField;
      
      public var lutbutton:SimpleButton;
      
      public var playercanvas:§1t5016s0§;
      
      public var pp_1:MovieClip;
      
      public var pp_2:MovieClip;
      
      public var pp_3:MovieClip;
      
      public var pp_4:MovieClip;
      
      public var pp_5:MovieClip;
      
      public var pp_6:MovieClip;
      
      public var pp_7:MovieClip;
      
      public var pp_8:MovieClip;
      
      public var pp_9:MovieClip;
      
      public var shade:RedBG;
      
      public var taglinetext:TextField;
      
      public var tipstext:TextField;
      
      public var title_chinese:MovieClip;
      
      public var title_english:§1t5175s0§;
      
      public var versiontext:TextField;
      
      public function §1t1040s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.loadingtext,true);
         §1t1521s0§.§1t9290s0§(this.taglinetext,true);
         §1t1521s0§.§1t9290s0§(this.comictext);
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
         this.versiontext.text = "v" + §1t1523s0§.§1t9323s0§.toString();
         stop();
         this.§1t6133s0§(true);
      }
      
      public function init(param1:int) : *
      {
         var _loc2_:String = null;
         if(param1 == §1t12374s0§ || param1 == §1t12376s0§)
         {
            this.loadingtext.visible = true;
            this.§1t6113s0§.visible = false;
            this.lutbutton.visible = false;
            this.versiontext.visible = false;
            this.tipstext.visible = true;
            _loc2_ = §1t1521s0§.getString(90);
            if(this.loadingtext.text != _loc2_)
            {
               this.loadingtext.text = _loc2_;
            }
            this.§1t6133s0§(param1 == §1t12374s0§);
            this.taglinetext.visible = false;
            this.comicbutton.visible = false;
            this.comictext.visible = false;
         }
         else if(param1 == §1t12375s0§)
         {
            this.loadingtext.visible = false;
            this.§1t6113s0§.visible = true;
            this.lutbutton.visible = true;
            this.versiontext.visible = true;
            this.tipstext.visible = false;
            if(§1t1523s0§.§1t9529s0§ == "payload")
            {
               if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9277s0§)
               {
                  this.taglinetext.text = "Combattez en live lors de Duels PVP! Amassez du loot! Battez-vous !";
                  this.comictext.text = "\nLe jeu peut prendre du temps à se charger. En attendant allez";
                  this.comicbutton.§1t5769s0§("Lire le manga de SHS");
               }
               else if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9279s0§)
               {
                  this.taglinetext.text = "Lucha viva PvP Samurai Duels! Amasa Loot Glorious! Guerra Salario!";
                  this.comictext.text = "El juego normalmente tarda más en cargar la primera vez que lo juegas.\nA la espera de que el juego se carga, ¿Por qué no";
                  this.comicbutton.§1t5769s0§("Lea la Manga SHS");
               }
               else
               {
                  this.taglinetext.text = "Fight PvP Duels! Amass Loot! Wage War!";
                  this.comictext.text = "The game normally takes longer to load the first time you play it.\nWhile waiting for the game to load, why don\'t you";
                  this.comicbutton.§1t5769s0§("Read the SHS Comic");
               }
               this.taglinetext.visible = true;
               this.§1t6113s0§.y = 278;
               this.comictext.visible = true;
               this.comicbutton.visible = true;
               this.comicbutton.addEventListener(MouseEvent.CLICK,this.§1t6132s0§);
            }
            else
            {
               this.taglinetext.visible = false;
            }
         }
      }
      
      internal function §1t6132s0§(param1:MouseEvent) : *
      {
         this.§1t2012s0§("http://www.strawhatsamuraiduels.com/comic.php");
      }
      
      internal function §1t2012s0§(param1:String) : *
      {
         var url:String = param1;
         var request:URLRequest = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
         }
      }
      
      internal function §1t6133s0§(param1:Boolean) : *
      {
         this.f_1.visible = param1;
         this.f_2.visible = param1;
         this.f_3.visible = param1;
         this.f_4.visible = param1;
         this.f_5.visible = param1;
         this.f_6.visible = param1;
         this.f_7.visible = param1;
         this.f_8.visible = param1;
         this.f_9.visible = param1;
         this.f_10.visible = param1;
         this.f_29.visible = param1;
         this.f_30.visible = param1;
         this.f_31.visible = param1;
         this.f_32.visible = param1;
         this.ground_1.visible = param1;
         this.pp_1.visible = param1;
         this.pp_2.visible = param1;
         this.pp_3.visible = param1;
         this.pp_4.visible = param1;
         this.pp_5.visible = param1;
         this.pp_6.visible = param1;
         this.pp_7.visible = param1;
         this.pp_8.visible = param1;
         this.pp_9.visible = param1;
         this.fg_1.visible = param1;
         this.fg_2.visible = param1;
         this.fg_3.visible = param1;
         this.fg_4.visible = param1;
         this.ff_1.visible = param1;
         this.ff_2.visible = param1;
         this.ff_3.visible = param1;
         this.ff_4.visible = param1;
         if(param1)
         {
            this.shade.alpha = 0.7;
         }
         else
         {
            this.shade.alpha = 1;
         }
      }
   }
}

