package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2115")]
   public class §1t7406s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var §1t7407s0§:§1t7396s0§;
      
      public var §1t7408s0§:§1t7396s0§;
      
      public var §1t7409s0§:§1t7396s0§;
      
      public var §1t7410s0§:§1t7396s0§;
      
      public var §1t7411s0§:§1t7396s0§;
      
      public var §1t7412s0§:§1t7396s0§;
      
      public var §1t7413s0§:§1t7396s0§;
      
      public var §1t7414s0§:§1t7396s0§;
      
      public var §1t7415s0§:§1t7396s0§;
      
      public var §1t7416s0§:§1t7396s0§;
      
      public var §1t7417s0§:MovieClip;
      
      public var §1t7418s0§:MovieClip;
      
      public var §1t7419s0§:MovieClip;
      
      public var §1t7420s0§:MovieClip;
      
      public var §1t7421s0§:MovieClip;
      
      public var §1t7422s0§:MovieClip;
      
      public var §1t7423s0§:MovieClip;
      
      public var §1t7424s0§:MovieClip;
      
      public var §1t7425s0§:MovieClip;
      
      public var §1t7426s0§:MovieClip;
      
      public var titlelabel:TextField;
      
      internal var §1t916s0§:§1t24s0§;
      
      internal var §1t7427s0§:Array = new Array();
      
      internal var §1t7428s0§:Array = new Array();
      
      internal var §1t7429s0§:§1t98s0§ = new §1t98s0§();
      
      internal var §1t7430s0§:String = "";
      
      internal var §1t7431s0§:String = "";
      
      internal var §1t7432s0§:String = "";
      
      internal var §1t7433s0§:String = "";
      
      internal var §1t7434s0§:int = 1;
      
      internal var §1t7435s0§:int = 0;
      
      internal var §1t7436s0§:Boolean = false;
      
      internal var §1t7437s0§:int = 0;
      
      public function §1t7406s0§()
      {
         super();
         this.§1t7427s0§.push(this.§1t7407s0§);
         this.§1t7427s0§.push(this.§1t7408s0§);
         this.§1t7427s0§.push(this.§1t7409s0§);
         this.§1t7427s0§.push(this.§1t7410s0§);
         this.§1t7427s0§.push(this.§1t7411s0§);
         this.§1t7427s0§.push(this.§1t7412s0§);
         this.§1t7427s0§.push(this.§1t7413s0§);
         this.§1t7427s0§.push(this.§1t7414s0§);
         this.§1t7427s0§.push(this.§1t7415s0§);
         this.§1t7427s0§.push(this.§1t7416s0§);
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            this.§1t7427s0§[_loc1_].§1t6875s0§(_loc1_);
            _loc1_++;
         }
         this.§1t7428s0§.push(this.§1t7417s0§);
         this.§1t7428s0§.push(this.§1t7418s0§);
         this.§1t7428s0§.push(this.§1t7419s0§);
         this.§1t7428s0§.push(this.§1t7420s0§);
         this.§1t7428s0§.push(this.§1t7421s0§);
         this.§1t7428s0§.push(this.§1t7422s0§);
         this.§1t7428s0§.push(this.§1t7423s0§);
         this.§1t7428s0§.push(this.§1t7424s0§);
         this.§1t7428s0§.push(this.§1t7425s0§);
         this.§1t7428s0§.push(this.§1t7426s0§);
      }
      
      public function init(param1:§1t24s0§) : *
      {
         this.§1t916s0§ = param1;
         this.button.§1t5769s0§(§1t1521s0§.getString(22089));
      }
      
      public function show() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_ninja");
         this.§1t5004s0§();
         visible = true;
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            this.§1t7427s0§[_loc1_].visible = false;
            this.§1t7428s0§[_loc1_].visible = false;
            _loc1_++;
         }
         this.§1t7429s0§.§1t695s0§(5);
         this.button.visible = false;
         this.titlelabel.text = §1t1521s0§.getString(22091);
         §1t3318s0§.instance.§1t3392s0§();
         this.§1t7436s0§ = false;
         this.§1t7437s0§ = 0;
      }
      
      public function §1t7438s0§(param1:Boolean, param2:String, param3:String, param4:String, param5:String, param6:int, param7:int) : *
      {
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         this.§1t7430s0§ = param2;
         this.§1t7431s0§ = param3;
         this.§1t7432s0§ = param4;
         this.§1t7433s0§ = param5;
         this.§1t7434s0§ = param6;
         this.§1t7435s0§ = param7;
         this.titlelabel.text = §1t1521s0§.getString(22090,[this.§1t7429s0§.§1t697s0§().toString()]);
         var _loc8_:Array = new Array();
         var _loc9_:Array = [14,15,16,17,18];
         var _loc10_:Array = [3,4,5,6,7];
         var _loc11_:Array = [8,9,10,11,12,13];
         var _loc12_:Array = [8,9,10,11,12];
         _loc15_ = 0;
         while(_loc15_ < 10)
         {
            if(_loc15_ < 4)
            {
               _loc13_ = int(_loc9_[int(Math.random() * _loc9_.length)]);
            }
            else if(_loc15_ < 8)
            {
               _loc13_ = int(_loc10_[int(Math.random() * _loc10_.length)]);
            }
            else if(param1)
            {
               _loc14_ = int(Math.random() * _loc11_.length);
               _loc13_ = int(_loc11_[_loc14_]);
               _loc11_.splice(_loc14_,1);
            }
            else
            {
               _loc14_ = int(Math.random() * _loc12_.length);
               _loc13_ = int(_loc12_[_loc14_]);
               _loc12_.splice(_loc14_,1);
            }
            if(int(Math.random() * 2) == 0)
            {
               _loc8_.push(_loc13_);
            }
            else
            {
               _loc8_.unshift(_loc13_);
            }
            _loc15_++;
         }
         _loc15_ = 0;
         while(_loc15_ < 10)
         {
            this.§1t7427s0§[_loc15_].visible = true;
            this.§1t7427s0§[_loc15_].init(_loc8_[_loc15_]);
            _loc15_++;
         }
      }
      
      internal function §1t5004s0§() : *
      {
         this.button.addEventListener(MouseEvent.CLICK,this.§1t7300s0§);
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            this.§1t7427s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t7439s0§);
            this.§1t7427s0§[_loc1_].addEventListener(MouseEvent.MOUSE_OVER,this.§1t7440s0§);
            this.§1t7427s0§[_loc1_].addEventListener(MouseEvent.MOUSE_OUT,this.§1t7441s0§);
            _loc1_++;
         }
      }
      
      internal function removeEventListeners() : *
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t7300s0§);
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            this.§1t7427s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t7439s0§);
            this.§1t7427s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_OVER,this.§1t7440s0§);
            this.§1t7427s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_OUT,this.§1t7441s0§);
            _loc1_++;
         }
      }
      
      public function hide() : *
      {
         this.removeEventListeners();
         visible = false;
         this.§1t7430s0§ = "";
         this.§1t7431s0§ = "";
         this.§1t7432s0§ = "";
         this.§1t7433s0§ = "";
         this.§1t7434s0§ = 1;
         this.§1t7435s0§ = 0;
         §1t88s0§.instance.§1t1516s0§("Snd_click");
      }
      
      internal function §1t7439s0§(param1:MouseEvent) : *
      {
         var _loc3_:int = 0;
         if(this.§1t7429s0§.§1t697s0§() <= 0)
         {
            return;
         }
         var _loc2_:§1t7396s0§ = §1t7396s0§(param1.currentTarget);
         _loc2_.§1t7401s0§(this.§1t916s0§,this.§1t7430s0§,this.§1t7431s0§,this.§1t7432s0§,this.§1t7433s0§,this.§1t7434s0§,this.§1t7435s0§);
         if(_loc2_.§1t3312s0§())
         {
            this.§1t7436s0§ = true;
         }
         if(_loc2_.§1t7402s0§())
         {
            ++this.§1t7437s0§;
         }
         this.§1t7429s0§.§1t698s0§(-1);
         this.titlelabel.text = §1t1521s0§.getString(22090,[this.§1t7429s0§.§1t697s0§().toString()]);
         _loc2_.removeEventListener(MouseEvent.CLICK,this.§1t7439s0§);
         _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t7440s0§);
         _loc2_.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t7441s0§);
         if(this.§1t7429s0§.§1t697s0§() == 0)
         {
            this.button.visible = true;
            _loc3_ = 0;
            while(_loc3_ < 10)
            {
               _loc2_ = this.§1t7427s0§[_loc3_];
               if(!_loc2_.opened)
               {
                  if(_loc2_.§1t7402s0§() && !this.§1t7436s0§ && this.§1t7437s0§ == 1 && this.§1t7430s0§ != "" && int(Math.random() * 2) == 0)
                  {
                     _loc2_.§1t7399s0§ = 13;
                     _loc2_.§1t7403s0§(this.§1t7430s0§,this.§1t7431s0§);
                     this.§1t7436s0§ = true;
                     ++this.§1t7437s0§;
                  }
                  else
                  {
                     _loc2_.§1t7403s0§(this.§1t7430s0§,this.§1t7431s0§);
                     if(_loc2_.§1t3312s0§())
                     {
                        this.§1t7436s0§ = true;
                     }
                     if(_loc2_.§1t7402s0§())
                     {
                        ++this.§1t7437s0§;
                     }
                  }
                  this.§1t7428s0§[_loc3_].visible = true;
               }
               _loc2_.removeEventListener(MouseEvent.CLICK,this.§1t7439s0§);
               _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t7440s0§);
               _loc2_.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t7441s0§);
               _loc3_++;
            }
            §1t114s0§.instance.§1t1539s0§();
         }
         §1t412s0§.instance.§1t7624s0§();
      }
      
      internal function §1t7440s0§(param1:MouseEvent) : *
      {
         var _loc2_:§1t7396s0§ = §1t7396s0§(param1.currentTarget);
         _loc2_.§1t7404s0§();
      }
      
      internal function §1t7441s0§(param1:MouseEvent) : *
      {
         var _loc2_:§1t7396s0§ = §1t7396s0§(param1.currentTarget);
         _loc2_.§1t7405s0§();
      }
      
      internal function §1t7300s0§(param1:MouseEvent) : *
      {
         this.hide();
      }
      
      public function destroy() : *
      {
         this.§1t916s0§ = null;
      }
   }
}

