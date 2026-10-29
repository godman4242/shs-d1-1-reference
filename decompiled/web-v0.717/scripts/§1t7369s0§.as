package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1928")]
   public class §1t7369s0§ extends MovieClip
   {
      
      public var §1t7370s0§:MovieClip;
      
      public var §1t7371s0§:MovieClip;
      
      public var §1t7372s0§:TextField;
      
      public var §1t5438s0§:§1t74s0§;
      
      public var §1t7373s0§:§1t5050s0§;
      
      public var §1t7374s0§:MovieClip;
      
      public var §1t7375s0§:MovieClip;
      
      public var §1t7376s0§:TextField;
      
      public var §1t7377s0§:§1t5050s0§;
      
      public var §1t7378s0§:MovieClip;
      
      public var §1t7278s0§:TextField;
      
      public var §1t5170s0§:MovieClip;
      
      public var §1t6959s0§:TextField;
      
      public var §1t7379s0§:MovieClip;
      
      public var §1t7380s0§:MovieClip;
      
      public var §1t7381s0§:TextField;
      
      public var §1t7382s0§:TextField;
      
      public var §1t7383s0§:MovieClip;
      
      public var §1t7280s0§:TextField;
      
      public var §1t7384s0§:MovieClip;
      
      public var §1t7385s0§:MovieClip;
      
      public var §1t7386s0§:TextField;
      
      public var §1t7387s0§:TextField;
      
      public var rankText:TextField;
      
      public var §1t7389s0§:MovieClip;
      
      public var §1t7390s0§:MovieClip;
      
      public var §1t7391s0§:TextField;
      
      public var §1t7392s0§:TextField;
      
      public var xpbar:MovieClip;
      
      internal var §1t6015s0§:§1t29s0§;
      
      internal var §1t5735s0§:Boolean = false;
      
      public function §1t7369s0§()
      {
         super();
         visible = false;
      }
      
      public function show(param1:§1t29s0§) : *
      {
         if(!this.§1t5735s0§)
         {
            this.§1t7377s0§.§1t5769s0§(§1t1521s0§.getString(22032));
            this.§1t7387s0§.text = §1t1521s0§.getString(22034);
            this.§1t5735s0§ = true;
         }
         if(param1.§1t3312s0§())
         {
            this.§1t7373s0§.§1t5769s0§(§1t1521s0§.getString(680));
         }
         else
         {
            this.§1t7373s0§.§1t5769s0§(§1t1521s0§.getString(22033));
         }
         visible = true;
         this.§1t5004s0§();
         this.§1t6015s0§ = param1;
         this.§1t6816s0§();
      }
      
      internal function §1t6816s0§() : *
      {
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc1_:String = "#FFFFFF";
         if(this.§1t6015s0§.§1t3312s0§())
         {
            _loc1_ = "#FFCC00";
         }
         else if(this.§1t6015s0§.§1t7321s0§())
         {
            _loc1_ = "#b048f8";
         }
         this.§1t7280s0§.htmlText = "<font color=\'" + _loc1_ + "\'>" + this.§1t6015s0§.charname + "</font>";
         this.§1t5438s0§.§1t5491s0§(this.§1t6015s0§.§1t1258s0§());
         this.§1t5438s0§.scaleX = 2;
         this.§1t5438s0§.scaleY = 2;
         this.§1t5170s0§.bar.scaleX = this.§1t6015s0§.§1t3309s0§() / this.§1t6015s0§.§1t7318s0§();
         this.§1t7278s0§.text = this.§1t6015s0§.§1t3309s0§() + "/" + this.§1t6015s0§.§1t7318s0§();
         if(this.§1t6015s0§.§1t7333s0§())
         {
            this.§1t7278s0§.textColor = 16711680;
         }
         else
         {
            this.§1t7278s0§.textColor = 16777215;
         }
         var _loc2_:int = this.§1t6015s0§.§1t567s0§.§1t697s0§();
         var _loc3_:uint = 16777215;
         var _loc4_:uint = 12627019;
         _loc5_ = 0;
         if(_loc2_ <= 25)
         {
            _loc3_ = 16711680;
            _loc4_ = 16711680;
            _loc5_ = -1;
         }
         this.§1t7382s0§.text = §1t1521s0§.getString(22035,[_loc2_.toString()]);
         this.§1t7382s0§.textColor = _loc3_;
         this.§1t7383s0§.bar.scaleX = this.§1t6015s0§.§1t567s0§.§1t697s0§() / 100;
         var _loc6_:int = this.§1t6015s0§.§1t7323s0§(§1t24s0§.§1t8755s0§);
         this.§1t6959s0§.text = §1t1521s0§.getString(22036,[_loc6_]);
         this.xpbar.bar.scaleX = this.§1t6015s0§.§1t7324s0§(§1t24s0§.§1t8755s0§);
         this.rankText.text = this.§1t6015s0§.§1t7210s0§();
         this.§1t7392s0§.htmlText = this.§1t6015s0§.§1t7330s0§();
         var _loc7_:int = this.§1t6015s0§.§1t7323s0§(§1t24s0§.§1t8756s0§);
         _loc8_ = this.§1t6015s0§.§1t7323s0§(§1t24s0§.§1t8757s0§);
         var _loc9_:int = this.§1t6015s0§.§1t7323s0§(§1t24s0§.§1t8758s0§);
         _loc10_ = this.§1t6015s0§.§1t7323s0§(§1t24s0§.§1t8759s0§);
         _loc11_ = this.§1t6015s0§.§1t7323s0§(§1t24s0§.§1t8760s0§);
         var _loc12_:int = §1t29s0§.§1t12495s0§;
         this.§1t7374s0§.scaleY = _loc7_ / _loc12_;
         this.§1t7370s0§.scaleY = _loc8_ / _loc12_;
         this.§1t7379s0§.scaleY = _loc9_ / _loc12_;
         this.§1t7389s0§.scaleY = _loc10_ / _loc12_;
         this.§1t7384s0§.scaleY = _loc11_ / _loc12_;
         this.§1t7375s0§.visible = false;
         this.§1t7371s0§.visible = false;
         this.§1t7380s0§.visible = false;
         this.§1t7390s0§.visible = false;
         this.§1t7385s0§.visible = false;
         if(_loc7_ == _loc12_)
         {
            §1t1643s0§.§1t11214s0§(this.§1t7374s0§,16763904);
         }
         else
         {
            §1t1643s0§.§1t11214s0§(this.§1t7374s0§,12627019);
         }
         if(_loc8_ == _loc12_)
         {
            §1t1643s0§.§1t11214s0§(this.§1t7370s0§,16763904);
         }
         else
         {
            §1t1643s0§.§1t11214s0§(this.§1t7370s0§,12627019);
         }
         if(_loc9_ == _loc12_)
         {
            §1t1643s0§.§1t11214s0§(this.§1t7379s0§,16763904);
         }
         else
         {
            §1t1643s0§.§1t11214s0§(this.§1t7379s0§,12627019);
         }
         if(_loc10_ == _loc12_)
         {
            §1t1643s0§.§1t11214s0§(this.§1t7389s0§,16763904);
         }
         else
         {
            §1t1643s0§.§1t11214s0§(this.§1t7389s0§,12627019);
         }
         if(_loc11_ == _loc12_)
         {
            §1t1643s0§.§1t11214s0§(this.§1t7384s0§,16763904);
         }
         else
         {
            §1t1643s0§.§1t11214s0§(this.§1t7384s0§,12627019);
         }
         this.§1t7375s0§.visible = false;
         this.§1t7371s0§.visible = false;
         this.§1t7380s0§.visible = false;
         this.§1t7390s0§.visible = false;
         this.§1t7385s0§.visible = false;
         if(_loc5_ == 1)
         {
            §1t1643s0§.§1t11214s0§(this.§1t7375s0§,65280);
            this.§1t7375s0§.y = 270 - (_loc7_ - 1) * 4;
            this.§1t7375s0§.visible = true;
            §1t1643s0§.§1t11214s0§(this.§1t7371s0§,65280);
            this.§1t7371s0§.y = 270 - (_loc8_ - 1) * 4;
            this.§1t7371s0§.visible = true;
            §1t1643s0§.§1t11214s0§(this.§1t7380s0§,65280);
            this.§1t7380s0§.y = 270 - (_loc9_ - 1) * 4;
            this.§1t7380s0§.visible = true;
            §1t1643s0§.§1t11214s0§(this.§1t7390s0§,65280);
            this.§1t7390s0§.y = 270 - (_loc10_ - 1) * 4;
            this.§1t7390s0§.visible = true;
            §1t1643s0§.§1t11214s0§(this.§1t7385s0§,65280);
            this.§1t7385s0§.y = 270 - (_loc11_ - 1) * 4;
            this.§1t7385s0§.visible = true;
         }
         else if(_loc5_ == -1)
         {
            §1t1643s0§.§1t11214s0§(this.§1t7375s0§,16711680);
            this.§1t7375s0§.y = 270 - (_loc7_ - 1) * 4;
            if(_loc7_ > 0)
            {
               this.§1t7375s0§.visible = true;
            }
            §1t1643s0§.§1t11214s0§(this.§1t7371s0§,16711680);
            this.§1t7371s0§.y = 270 - (_loc8_ - 1) * 4;
            if(_loc8_ > 0)
            {
               this.§1t7371s0§.visible = true;
            }
            §1t1643s0§.§1t11214s0§(this.§1t7380s0§,16711680);
            this.§1t7380s0§.y = 270 - (_loc9_ - 1) * 4;
            if(_loc9_ > 0)
            {
               this.§1t7380s0§.visible = true;
            }
            §1t1643s0§.§1t11214s0§(this.§1t7390s0§,16711680);
            this.§1t7390s0§.y = 270 - (_loc10_ - 1) * 4;
            if(_loc10_ > 0)
            {
               this.§1t7390s0§.visible = true;
            }
            §1t1643s0§.§1t11214s0§(this.§1t7385s0§,16711680);
            this.§1t7385s0§.y = 270 - (_loc11_ - 1) * 4;
            if(_loc11_ > 0)
            {
               this.§1t7385s0§.visible = true;
            }
         }
         this.§1t7376s0§.text = this.§1t7210s0§(_loc7_);
         this.§1t7372s0§.text = this.§1t7210s0§(_loc8_);
         this.§1t7381s0§.text = this.§1t7210s0§(_loc9_);
         this.§1t7391s0§.text = this.§1t7210s0§(_loc10_);
         this.§1t7386s0§.text = this.§1t7210s0§(_loc11_);
         this.§1t7376s0§.textColor = _loc4_;
         this.§1t7372s0§.textColor = _loc4_;
         this.§1t7381s0§.textColor = _loc4_;
         this.§1t7391s0§.textColor = _loc4_;
         this.§1t7386s0§.textColor = _loc4_;
         if(this.§1t6015s0§.§1t7305s0§ && !this.§1t6015s0§.§1t3312s0§())
         {
            this.§1t7373s0§.visible = false;
         }
         else if(this.§1t6015s0§.§1t7321s0§())
         {
            this.§1t7373s0§.visible = false;
         }
         else
         {
            this.§1t7373s0§.visible = true;
         }
         if(this.§1t5170s0§.bar.scaleX < 1 && !this.§1t6015s0§.§1t7305s0§)
         {
            if(this.§1t6015s0§.§1t7333s0§() && this.§1t5170s0§.bar.scaleX >= 0.5)
            {
               this.§1t7377s0§.visible = false;
               this.§1t7378s0§.visible = false;
            }
            else
            {
               this.§1t7377s0§.visible = true;
               this.§1t7378s0§.visible = true;
               if(this.§1t6015s0§.§1t7241s0§.§1t928s0§() == §1t24s0§.§1t8770s0§)
               {
                  this.§1t7377s0§.§1t5769s0§(§1t1521s0§.getString(22086));
               }
               else
               {
                  this.§1t7377s0§.§1t5769s0§(§1t1521s0§.getString(22032));
               }
            }
         }
         else
         {
            this.§1t7377s0§.visible = false;
            this.§1t7378s0§.visible = false;
         }
      }
      
      internal function §1t7210s0§(param1:int) : String
      {
         if(param1 == 0)
         {
            return "E";
         }
         if(param1 == 1)
         {
            return "E+";
         }
         if(param1 == 2)
         {
            return "D";
         }
         if(param1 == 3)
         {
            return "D+";
         }
         if(param1 == 4)
         {
            return "C";
         }
         if(param1 == 5)
         {
            return "C+";
         }
         if(param1 == 6)
         {
            return "B";
         }
         if(param1 == 7)
         {
            return "B+";
         }
         if(param1 == 8)
         {
            return "A";
         }
         if(param1 == 9)
         {
            return "A+";
         }
         if(param1 == 10)
         {
            return "S";
         }
         return "E";
      }
      
      public function hide() : *
      {
         if(!visible)
         {
            return;
         }
         visible = false;
         this.removeEventListeners();
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t7377s0§.addEventListener(MouseEvent.CLICK,this.§1t7393s0§);
         this.§1t7373s0§.addEventListener(MouseEvent.CLICK,this.§1t6035s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t7377s0§.removeEventListener(MouseEvent.CLICK,this.§1t7393s0§);
         this.§1t7373s0§.removeEventListener(MouseEvent.CLICK,this.§1t6035s0§);
      }
      
      internal function §1t7393s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.§1t6015s0§.§1t7241s0§.§1t928s0§() == §1t24s0§.§1t8770s0§)
         {
            this.§1t6015s0§.§1t7343s0§();
         }
         else
         {
            this.§1t6015s0§.§1t7342s0§();
         }
         this.§1t6816s0§();
         §1t412s0§.instance.§1t7624s0§();
      }
      
      internal function §1t6035s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.§1t6015s0§.§1t7321s0§())
         {
            return;
         }
         if(this.§1t6015s0§.§1t3312s0§())
         {
            §1t406s0§.instance.§1t6548s0§();
         }
         else
         {
            §1t406s0§.instance.§1t6547s0§(this.§1t6015s0§);
         }
      }
      
      public function update(param1:int) : *
      {
      }
      
      public function destroy() : *
      {
         this.§1t6015s0§ = null;
      }
   }
}

