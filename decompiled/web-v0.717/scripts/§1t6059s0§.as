package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3477")]
   public class §1t6059s0§ extends MovieClip
   {
      
      public static var §1t12371s0§:Array = ["en_us","en_uk","fr","es"];
      
      public static var §1t12372s0§:String = "en_us";
      
      public var empty:MovieClip;
      
      public var flag:MovieClip;
      
      public var languageName_text:TextField;
      
      internal var §1t6062s0§:Array;
      
      internal var §1t6063s0§:Boolean = false;
      
      internal var §1t6064s0§:Boolean;
      
      internal var §1t6068s0§:int;
      
      public function §1t6059s0§()
      {
         var _loc2_:§1t6057s0§ = null;
         var _loc3_:int = 0;
         super();
         this.§1t6062s0§ = new Array();
         var _loc1_:int = int(§1t12371s0§.length);
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = new §1t6057s0§();
            if(_loc3_ % 2 == 0)
            {
               _loc2_.x = 0;
            }
            else
            {
               _loc2_.x = 82;
            }
            _loc2_.y = Math.floor(_loc3_ / 2) * 25 - Math.ceil(_loc1_ / 2) * 25 + 1;
            _loc2_.flag.gotoAndStop(§1t12371s0§[_loc3_]);
            _loc2_.flag.mouseEnabled = false;
            _loc2_.text.mouseEnabled = false;
            _loc2_.lang = §1t12371s0§[_loc3_];
            if(§1t12371s0§[_loc3_] == "en_us" || §1t12371s0§[_loc3_] == "en_uk")
            {
               _loc2_.text.text = "EN";
            }
            else
            {
               _loc2_.text.text = §1t12371s0§[_loc3_].toUpperCase();
            }
            addChild(_loc2_);
            this.§1t6062s0§.push(_loc2_);
            _loc3_++;
         }
         if(_loc1_ % 2 == 0)
         {
            this.empty.visible = false;
         }
         this.§1t6064s0§ = false;
         this.flag.mouseEnabled = false;
         this.languageName_text.mouseEnabled = false;
      }
      
      public function §1t6065s0§() : *
      {
         var _loc2_:§1t6057s0§ = null;
         var _loc1_:int = int(this.§1t6062s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.§1t6062s0§[_loc3_];
            _loc2_.visible = false;
            _loc2_.addEventListener(MouseEvent.CLICK,this.§1t6067s0§);
            _loc3_++;
         }
         this.empty.visible = false;
         this.§1t6064s0§ = false;
      }
      
      public function §1t5004s0§() : *
      {
         this.§1t6065s0§();
         §1t12372s0§ = §1t1523s0§.language;
         this.§1t6066s0§(§1t12372s0§);
         addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.§1t6063s0§ = parent == §1t7017s0§.instance.logonready;
      }
      
      internal function removeEventListeners() : *
      {
         var _loc2_:§1t6057s0§ = null;
         var _loc1_:int = int(this.§1t6062s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.§1t6062s0§[_loc3_];
            _loc2_.visible = false;
            _loc2_.removeEventListener(MouseEvent.CLICK,this.§1t6067s0§);
            _loc3_++;
         }
         removeEventListener(MouseEvent.CLICK,this.§1t6070s0§);
      }
      
      internal function §1t6066s0§(param1:String) : *
      {
         if(param1 == "en")
         {
            param1 = "en_us";
         }
         this.flag.gotoAndStop(param1);
         if(param1 == "en_us" || param1 == "en_uk")
         {
            this.languageName_text.text = "English";
         }
         else if(param1 == "fr")
         {
            this.languageName_text.text = "Français";
         }
         else if(param1 == "es")
         {
            this.languageName_text.text = "Español";
         }
      }
      
      internal function §1t6067s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = §1t6057s0§(param1.target.parent).lang;
         this.§1t6066s0§(_loc2_);
         this.§1t6071s0§(null);
         §1t12372s0§ = _loc2_;
         if(_loc2_ == "en_us" || _loc2_ == "en_uk")
         {
            _loc2_ = "en";
         }
         if(_loc2_ != §1t1521s0§.getLanguage())
         {
            §1t7017s0§.instance.§1t7039s0§();
            this.§1t6068s0§ = 0;
            §1t1521s0§.§1t9284s0§(_loc2_,this.§1t6069s0§);
            §1t1524s0§.§1t9822s0§(this.§1t6069s0§);
            §1t1522s0§.§1t1792s0§(§1t1522s0§.§1t9301s0§);
         }
      }
      
      public function §1t6069s0§(param1:Boolean) : *
      {
         if(param1)
         {
         }
         ++this.§1t6068s0§;
         if(this.§1t6068s0§ == 2)
         {
            if(this.§1t6063s0§)
            {
               §1t7017s0§.instance.logonready.§1t5340s0§();
            }
            else
            {
               §1t7017s0§.instance.login.§1t5340s0§();
            }
            §1t1540s0§.§1t10029s0§();
            if(this.§1t6063s0§)
            {
               §1t7017s0§.instance.§1t7034s0§();
            }
            §1t7017s0§.instance.§1t7040s0§();
            §1t3317s0§.instance.§1t2020s0§(§1t12372s0§);
         }
      }
      
      internal function §1t5484s0§(param1:MouseEvent) : *
      {
         if(this.§1t6064s0§)
         {
            this.§1t6071s0§(null);
         }
         else
         {
            this.§1t6070s0§();
         }
      }
      
      internal function §1t6070s0§() : *
      {
         var _loc1_:int = int(this.§1t6062s0§.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.§1t6062s0§[_loc2_].visible = true;
            _loc2_++;
         }
         if(_loc1_ % 2 == 1)
         {
            this.empty.visible = true;
         }
         this.§1t6064s0§ = true;
      }
      
      internal function §1t6071s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = int(this.§1t6062s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§1t6062s0§[_loc3_].visible = false;
            _loc3_++;
         }
         this.empty.visible = false;
         this.§1t6064s0§ = false;
      }
   }
}

