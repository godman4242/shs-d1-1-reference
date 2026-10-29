package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1663")]
   public class §1t404s0§ extends MovieClip
   {
      
      public var apText:TextField;
      
      public var buttonBG:SimpleButton;
      
      public var greyout:MovieClip;
      
      public var normalText:TextField;
      
      public var §1t5752s0§:TextField;
      
      public var §1t5753s0§:TextField;
      
      public var image:MovieClip;
      
      public var type:int;
      
      public var §1t797s0§:int;
      
      public var §1t5754s0§:int;
      
      public var §1t5755s0§:int;
      
      public var §1t5756s0§:int;
      
      public var §1t807s0§:int;
      
      public var §1t5757s0§:§1t399s0§;
      
      public var §1t5758s0§:Boolean = false;
      
      public function §1t404s0§()
      {
         super();
         this.greyout.visible = false;
         §1t1521s0§.§1t9290s0§(this.normalText,true);
         this.normalText.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t5752s0§,true);
         this.§1t5752s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t5753s0§);
         this.§1t5753s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.apText);
         this.apText.mouseEnabled = false;
      }
      
      public function §1t5301s0§() : *
      {
         if(this.image != null)
         {
            removeChild(this.image);
         }
         if(this.§1t5757s0§ != null)
         {
            this.§1t5757s0§.§1t8515s0§(false);
            this.§1t5757s0§ = null;
         }
         this.image = null;
      }
      
      public function §1t5759s0§(param1:int, param2:int) : *
      {
         this.type = param1;
         this.§1t5756s0§ = param2;
         this.§1t5766s0§();
      }
      
      public function §1t5760s0§(param1:§1t399s0§, param2:int) : *
      {
         this.§1t5757s0§ = param1;
         this.§1t5756s0§ = §1t407s0§.§1t12442s0§;
         this.§1t5769s0§(param1.§1t6733s0§(),"",param1.§1t8517s0§());
         this.normalText.x = 15;
         this.§1t5752s0§.x = 15;
         this.§1t5753s0§.x = 15;
         if(param2 != -1)
         {
            this.§1t5767s0§(param2);
         }
      }
      
      public function §1t5761s0§() : §1t399s0§
      {
         return this.§1t5757s0§;
      }
      
      public function §1t5762s0§(param1:§1t399s0§) : *
      {
         this.§1t5757s0§ = param1;
      }
      
      public function §1t5763s0§(param1:int, param2:String, param3:String = "", param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:Boolean = false) : *
      {
         this.§1t5756s0§ = §1t407s0§.§1t12432s0§;
         this.§1t807s0§ = param4;
         this.type = param1;
         this.§1t797s0§ = param5;
         this.§1t5754s0§ = param6;
         this.§1t5758s0§ = param8;
         this.§1t5755s0§ = SimpleButton(this.buttonBG).height;
         this.§1t5766s0§();
         if(param4 == §1t1711s0§.§1t11266s0§)
         {
            param2 = "";
         }
         this.§1t5769s0§(param3,param2,param7);
      }
      
      public function §1t4881s0§(param1:String, param2:String) : *
      {
         this.§1t5756s0§ = §1t407s0§.§1t12449s0§;
         this.§1t5769s0§(§1t1521s0§.getString(201) + param1);
         this.§1t5752s0§.text = param2;
         this.§1t5752s0§.visible = false;
         this.§1t5766s0§();
      }
      
      public function §1t5764s0§() : String
      {
         return this.§1t5752s0§.text;
      }
      
      public function §1t5765s0§() : int
      {
         return this.§1t5756s0§;
      }
      
      public function §1t5766s0§() : void
      {
         switch(this.§1t5756s0§)
         {
            case §1t407s0§.§1t12434s0§:
               this.image = new §1t6837s0§();
               this.§1t5769s0§(§1t1521s0§.getString(93),"",1);
               break;
            case §1t407s0§.§1t12433s0§:
               this.image = new §1t6858s0§();
               this.§1t5769s0§(§1t1521s0§.getString(94),"",0);
               break;
            case §1t407s0§.§1t12439s0§:
               this.image = new §1t7717s0§();
               this.§1t5769s0§(§1t1521s0§.getString(95),"",5);
               break;
            case §1t407s0§.§1t12437s0§:
               this.image = new §1t5696s0§();
               this.§1t5769s0§(§1t1521s0§.getString(96),"",3);
               break;
            case §1t407s0§.§1t12438s0§:
               this.image = new §1t5858s0§();
               this.§1t5769s0§(§1t1521s0§.getString(97),"",3);
               break;
            case §1t407s0§.§1t12436s0§:
               this.image = new §1t6856s0§();
               this.§1t5769s0§(§1t1521s0§.getString(98),"",3);
               break;
            case §1t407s0§.§1t12435s0§:
               this.image = new §1t5312s0§();
               this.§1t5769s0§(§1t1521s0§.getString(99),"",5);
               break;
            case §1t407s0§.§1t12440s0§:
               this.image = new §1t6858s0§();
               this.§1t5769s0§(§1t1521s0§.getString(168),"",0);
               break;
            case §1t407s0§.§1t12441s0§:
               this.image = new §1t5672s0§();
               this.§1t5769s0§(§1t1521s0§.getString(141),"",1);
               break;
            case §1t407s0§.§1t12449s0§:
               this.image = new §1t6171s0§();
               break;
            case §1t407s0§.§1t12450s0§:
               this.image = new §1t6056s0§();
               break;
            case §1t407s0§.§1t12451s0§:
               this.image = new §1t5034s0§();
               break;
            case §1t407s0§.§1t12452s0§:
               this.image = new §1t6359s0§();
               break;
            case §1t407s0§.§1t12453s0§:
               this.image = new §1t5043s0§();
               break;
            case §1t407s0§.§1t12454s0§:
               this.image = new §1t6995s0§();
               break;
            case §1t407s0§.§1t12455s0§:
               this.image = new §1t5044s0§();
               break;
            case §1t407s0§.§1t12456s0§:
               this.image = new §1t5695s0§();
               break;
            case §1t407s0§.§1t12457s0§:
               this.image = new §1t8031s0§();
               break;
            case §1t407s0§.§1t12458s0§:
               this.image = new §1t8026s0§();
               break;
            case §1t407s0§.§1t12459s0§:
               this.image = new §1t5640s0§();
               break;
            case §1t407s0§.§1t12460s0§:
               this.image = new §1t6333s0§();
               break;
            case §1t407s0§.§1t12461s0§:
               this.image = new §1t5801s0§();
               break;
            case §1t407s0§.§1t12462s0§:
               this.image = new §1t6996s0§();
               break;
            case §1t407s0§.§1t12463s0§:
               this.image = new §1t6309s0§();
               break;
            case §1t407s0§.§1t12432s0§:
               switch(this.§1t807s0§)
               {
                  case §1t1711s0§.§1t11264s0§:
                     this.image = new §1t6997s0§();
                     break;
                  case §1t1711s0§.§1t11268s0§:
                     this.image = new §1t6403s0§();
                     break;
                  case §1t1711s0§.§1t11266s0§:
                     this.image = new §1t6998s0§();
                     break;
                  default:
                     if(this.§1t807s0§ < §1t1711s0§.length)
                     {
                        this.image = new §1t6360s0§(this.§1t807s0§);
                     }
                     else
                     {
                        this.image = null;
                     }
               }
         }
         if(this.image)
         {
            this.image.x = 18;
            this.image.y = 20;
            addChild(this.image);
            this.image.mouseEnabled = false;
            this.normalText.x = 38;
            this.§1t5752s0§.x = 38;
            this.§1t5753s0§.x = 38;
         }
         else
         {
            this.normalText.x = 15;
            this.§1t5752s0§.x = 15;
            this.§1t5753s0§.x = 15;
         }
      }
      
      public function §1t5767s0§(param1:int) : *
      {
         if(this.image != null)
         {
            removeChild(this.image);
            this.image = null;
         }
         switch(param1)
         {
            case §1t407s0§.§1t12446s0§:
               this.image = new §1t6075s0§();
               break;
            case §1t407s0§.§1t12443s0§:
               this.image = new §1t6171s0§();
               break;
            case §1t407s0§.§1t12433s0§:
            case §1t407s0§.§1t12447s0§:
            case §1t407s0§.§1t12448s0§:
               this.image = new §1t6858s0§();
               break;
            case §1t407s0§.§1t12436s0§:
               this.image = new §1t6856s0§();
               break;
            case §1t407s0§.§1t12445s0§:
               this.image = new §1t6998s0§();
               break;
            case §1t407s0§.§1t12444s0§:
               this.image = new §1t7721s0§();
               break;
            case §1t407s0§.§1t12439s0§:
               this.image = new §1t7717s0§();
               break;
            case §1t407s0§.§1t12434s0§:
               this.image = new §1t6837s0§();
               break;
            case §1t407s0§.§1t12450s0§:
               this.image = new §1t6056s0§();
               break;
            case §1t407s0§.§1t12451s0§:
               this.image = new §1t5034s0§();
               break;
            case §1t407s0§.§1t12452s0§:
               this.image = new §1t6359s0§();
               break;
            case §1t407s0§.§1t12453s0§:
               this.image = new §1t5043s0§();
               break;
            case §1t407s0§.§1t12454s0§:
               this.image = new §1t6995s0§();
               break;
            case §1t407s0§.§1t12455s0§:
               this.image = new §1t5044s0§();
               break;
            case §1t407s0§.§1t12456s0§:
               this.image = new §1t5695s0§();
               break;
            case §1t407s0§.§1t12457s0§:
               this.image = new §1t8031s0§();
               break;
            case §1t407s0§.§1t12458s0§:
               this.image = new §1t8026s0§();
               break;
            case §1t407s0§.§1t12459s0§:
               this.image = new §1t5640s0§();
               break;
            case §1t407s0§.§1t12460s0§:
               this.image = new §1t6333s0§();
               break;
            case §1t407s0§.§1t12461s0§:
               this.image = new §1t5801s0§();
               break;
            case §1t407s0§.§1t12462s0§:
               this.image = new §1t6996s0§();
               break;
            case §1t407s0§.§1t12463s0§:
               this.image = new §1t6309s0§();
               break;
            case §1t407s0§.§1t12440s0§:
               this.image = new §1t6858s0§();
         }
         this.image.x = 18;
         this.image.y = 20;
         addChild(this.image);
         this.image.mouseEnabled = false;
         this.normalText.x = 38;
         this.§1t5752s0§.x = 38;
         this.§1t5753s0§.x = 38;
      }
      
      public function §1t5768s0§() : *
      {
         if(this.image != null)
         {
            removeChild(this.image);
            this.image = null;
         }
      }
      
      public function §1t5769s0§(param1:String, param2:String = "", param3:int = 0) : *
      {
         if(param2 == "")
         {
            this.normalText.text = param1;
            this.normalText.visible = true;
            this.§1t5752s0§.visible = false;
            this.§1t5753s0§.visible = false;
         }
         else
         {
            this.§1t5752s0§.text = param1;
            this.§1t5753s0§.text = param2;
            this.normalText.visible = false;
            this.§1t5752s0§.visible = true;
            this.§1t5753s0§.visible = true;
         }
         if(param3 == 0)
         {
            this.apText.text = "";
         }
         else
         {
            this.apText.text = param3.toString() + " " + §1t1521s0§.getString(102);
         }
      }
      
      public function §1t5770s0§(param1:Boolean) : *
      {
         this.greyout.visible = param1;
         this.buttonBG.visible = !param1;
         if(param1)
         {
            this.§1t5752s0§.textColor = 6710886;
            this.§1t5753s0§.textColor = 5592405;
            this.normalText.textColor = 5592405;
            this.apText.textColor = 4473924;
         }
         else
         {
            this.§1t5752s0§.textColor = 16763955;
            this.§1t5753s0§.textColor = 13421772;
            this.normalText.textColor = 16777215;
            this.apText.textColor = 13421772;
         }
      }
   }
}

