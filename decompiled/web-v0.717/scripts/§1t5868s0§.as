package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1605")]
   public class §1t5868s0§ extends MovieClip
   {
      
      public var §1t472s0§:TextField;
      
      public var §1t5028s0§:§1t4912s0§;
      
      public var §1t5027s0§:§1t4912s0§;
      
      public var slot0:§1t394s0§;
      
      public var slot1:§1t394s0§;
      
      public var slot2:§1t394s0§;
      
      public var slot3:§1t394s0§;
      
      public var slot4:§1t394s0§;
      
      public var slot5:§1t394s0§;
      
      public var titleText:TextField;
      
      internal var §1t5933s0§:int;
      
      internal var §1t5934s0§:int;
      
      internal var §1t5935s0§:int;
      
      internal var §1t5936s0§:int;
      
      internal var §1t5937s0§:int = 0;
      
      internal var §1t5938s0§:int = 1;
      
      internal var §1t5939s0§:int = 2;
      
      internal var §1t5940s0§:int = 3;
      
      internal var §1t5941s0§:int;
      
      internal var §1t5942s0§:int;
      
      internal var §1t5943s0§:int;
      
      internal var §1t5944s0§:int = 900;
      
      internal var §1t5089s0§:int;
      
      internal var §1t5088s0§:int;
      
      internal var §1t5102s0§:int = 3;
      
      internal var §1t5103s0§:int = 2;
      
      internal var §1t5023s0§:int = this.§1t5102s0§ * this.§1t5103s0§;
      
      internal var slots:Vector.<§1t394s0§> = new Vector.<§1t394s0§>(8);
      
      internal var §1t5945s0§:int = 6;
      
      internal var §1t5946s0§:Vector.<int> = new Vector.<int>(this.§1t5945s0§);
      
      internal var timer:Timer = new Timer(1000);
      
      internal var §1t5947s0§:§1t401s0§;
      
      public function §1t5868s0§()
      {
         super();
         this.slots[0] = this.slot0;
         this.slots[1] = this.slot1;
         this.slots[2] = this.slot2;
         this.slots[3] = this.slot3;
         this.slots[4] = this.slot4;
         this.slots[5] = this.slot5;
         this.slots.fixed = true;
         §1t1521s0§.§1t9290s0§(this.titleText,true);
         §1t1521s0§.§1t9290s0§(this.§1t472s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5945s0§)
         {
            this.§1t5946s0§[_loc1_] = 1;
            _loc1_++;
         }
      }
      
      public function show(param1:int, param2:§1t401s0§) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         §1t3318s0§.instance.§1t3463s0§("pp",true);
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         visible = true;
         this.§1t5947s0§ = param2;
         this.§1t5942s0§ = param1;
         this.§1t5933s0§ = §1t1523s0§.§1t9714s0§(param1);
         this.§1t5934s0§ = §1t1523s0§.§1t9714s0§(param1 + 1);
         this.§1t5935s0§ = §1t1523s0§.§1t9714s0§(param1 + 2);
         if(this.§1t5935s0§ > 50)
         {
            this.§1t5935s0§ = 50;
         }
         this.§1t5936s0§ = §1t1523s0§.§1t9714s0§(param1 + 3);
         switch(this.§1t5933s0§)
         {
            case 0:
               this.§1t5941s0§ = this.§1t5937s0§;
               break;
            case 1:
               this.§1t5943s0§ = 15 * 60;
               if(§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§ < this.§1t5943s0§)
               {
                  this.§1t5941s0§ = this.§1t5938s0§;
               }
               else if(§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§ < this.§1t5943s0§ + this.§1t5944s0§)
               {
                  this.§1t5941s0§ = this.§1t5939s0§;
               }
               else
               {
                  this.§1t5941s0§ = this.§1t5940s0§;
               }
               break;
            case 2:
               this.§1t5943s0§ = 60 * 60;
               if(§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§ < this.§1t5943s0§)
               {
                  this.§1t5941s0§ = this.§1t5938s0§;
               }
               else if(§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§ < this.§1t5943s0§ + this.§1t5944s0§)
               {
                  this.§1t5941s0§ = this.§1t5939s0§;
               }
               else
               {
                  this.§1t5941s0§ = this.§1t5940s0§;
               }
               break;
            case 3:
               this.§1t5943s0§ = 6 * 60 * 60;
               if(§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§ < this.§1t5943s0§)
               {
                  this.§1t5941s0§ = this.§1t5938s0§;
               }
               else if(§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§ < this.§1t5943s0§ + this.§1t5944s0§)
               {
                  this.§1t5941s0§ = this.§1t5939s0§;
               }
               else
               {
                  this.§1t5941s0§ = this.§1t5940s0§;
               }
               break;
            case 4:
               this.§1t5943s0§ = 12 * 60 * 60;
               if(§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§ < this.§1t5943s0§)
               {
                  this.§1t5941s0§ = this.§1t5938s0§;
               }
               else
               {
                  this.§1t5941s0§ = this.§1t5939s0§;
               }
         }
         if(this.§1t5941s0§ == this.§1t5937s0§)
         {
            this.§1t5951s0§();
            param2.detailstext.text = §1t1521s0§.getString(258);
            if(this.§1t5935s0§ == 50)
            {
               param2.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " 6");
            }
            else
            {
               param2.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " " + this.§1t5948s0§(this.§1t5935s0§) + " (" + §1t1521s0§.getString(287) + " " + this.§1t5935s0§ + "/" + this.§1t5949s0§(this.§1t5935s0§) + ")");
            }
         }
         else if(this.§1t5941s0§ == this.§1t5938s0§)
         {
            _loc4_ = this.§1t5943s0§;
            _loc5_ = §1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§;
            this.§1t5951s0§();
            param2.detailstext.text = §1t1521s0§.getString(259) + " (" + §1t1521s0§.getString(260,[this.§1t937s0§(_loc4_ - _loc5_)]) + ")";
            if(this.§1t5935s0§ == 50)
            {
               param2.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " 6");
            }
            else
            {
               param2.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " " + this.§1t5948s0§(this.§1t5935s0§) + " (" + §1t1521s0§.getString(287) + " " + this.§1t5935s0§ + "/" + this.§1t5949s0§(this.§1t5935s0§) + ")");
            }
         }
         else if(this.§1t5941s0§ == this.§1t5939s0§)
         {
            this.§1t5953s0§();
            param2.detailstext.text = §1t1521s0§.getString(261);
            if(this.§1t5935s0§ == 50)
            {
               param2.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " 6");
            }
            else
            {
               param2.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " " + this.§1t5948s0§(this.§1t5935s0§) + " (" + §1t1521s0§.getString(287) + " " + this.§1t5935s0§ + "/" + this.§1t5949s0§(this.§1t5935s0§) + ")");
            }
         }
         else if(this.§1t5941s0§ == this.§1t5940s0§)
         {
            this.§1t5954s0§();
            param2.detailstext.text = §1t1521s0§.getString(262);
            if(this.§1t5935s0§ == 50)
            {
               param2.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " 6");
            }
            else
            {
               param2.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " " + this.§1t5948s0§(this.§1t5935s0§) + " (" + §1t1521s0§.getString(287) + " " + this.§1t5935s0§ + "/" + this.§1t5949s0§(this.§1t5935s0§) + ")");
            }
         }
         this.§1t472s0§.htmlText = "";
         this.§1t5089s0§ = 0;
         this.§1t5088s0§ = Math.floor(this.§1t5945s0§ / this.§1t5102s0§);
         var _loc3_:int = 0;
         if(§1t1523s0§.§1t9714s0§(30008) > 0)
         {
            this.§1t5946s0§[0] = 2115;
            _loc3_++;
         }
         if(§1t1523s0§.§1t9714s0§(30009) > 0)
         {
            this.§1t5946s0§[1] = 2116;
            _loc3_++;
         }
         if(§1t1523s0§.§1t9714s0§(30010) > 0)
         {
            this.§1t5946s0§[2] = 2117;
            _loc3_++;
         }
         if(§1t1523s0§.§1t9714s0§(30011) > 0)
         {
            this.§1t5946s0§[3] = 2118;
            _loc3_++;
         }
         if(§1t1523s0§.§1t9714s0§(30012) > 0)
         {
            this.§1t5946s0§[4] = 2140;
            _loc3_++;
         }
         if(§1t1523s0§.§1t9714s0§(30013) > 0)
         {
            this.§1t5946s0§[5] = 2141;
            _loc3_++;
         }
         this.§1t5559s0§();
         this.titleText.text = §1t1521s0§.getString(282) + " (" + int(_loc3_ / this.§1t5945s0§ * 100).toString() + "%)";
         this.§1t5004s0§();
      }
      
      public function hide() : *
      {
         this.removeEventListeners();
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t5027s0§.addEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5028s0§.addEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            this.slots[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t5843s0§);
            this.slots[_loc1_].addEventListener(MouseEvent.ROLL_OVER,this.§1t5843s0§);
            this.slots[_loc1_].addEventListener(MouseEvent.ROLL_OUT,this.§1t5844s0§);
            _loc1_++;
         }
         this.timer.addEventListener(TimerEvent.TIMER,this.§1t1427s0§);
         this.timer.start();
      }
      
      internal function removeEventListeners() : *
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.§1t1427s0§);
         this.§1t5027s0§.removeEventListener(MouseEvent.CLICK,this.§1t5120s0§);
         this.§1t5028s0§.removeEventListener(MouseEvent.CLICK,this.§1t5121s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            this.slots[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t5843s0§);
            this.slots[_loc1_].removeEventListener(MouseEvent.ROLL_OVER,this.§1t5843s0§);
            this.slots[_loc1_].removeEventListener(MouseEvent.ROLL_OUT,this.§1t5844s0§);
            _loc1_++;
         }
         this.timer.stop();
      }
      
      internal function §1t5843s0§(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t472s0§.visible = true;
         this.§1t5844s0§(param1);
         var _loc2_:int = int(param1.target.§1t483s0§());
         if(_loc2_ == 1)
         {
            this.§1t472s0§.htmlText = "<font color=\"#FFFFFF\">" + §1t1521s0§.getString(283) + "</font>";
         }
         else
         {
            this.§1t472s0§.htmlText = param1.target.§1t6871s0§();
         }
         param1.target.§1t6786s0§(true);
         if(_loc2_ == 2115)
         {
            _loc3_ = 30008;
         }
         if(_loc2_ == 2116)
         {
            _loc3_ = 30009;
         }
         if(_loc2_ == 2117)
         {
            _loc3_ = 30010;
         }
         if(_loc2_ == 2118)
         {
            _loc3_ = 30011;
         }
         if(_loc2_ == 2140)
         {
            _loc3_ = 30012;
         }
         if(_loc2_ == 2141)
         {
            _loc3_ = 30013;
         }
         if(_loc2_ != 1)
         {
            this.§1t472s0§.appendText(" (" + §1t1521s0§.getString(284) + ": " + §1t1523s0§.§1t9714s0§(_loc3_) + ")");
         }
         else
         {
            _loc5_ = int(param1.target.§1t6787s0§());
            _loc4_ = _loc5_ + 1;
            if(_loc4_ > this.§1t5948s0§(§1t1523s0§.§1t9714s0§(this.§1t5942s0§ + 2)))
            {
               this.§1t472s0§.appendText(" (" + §1t1521s0§.getString(285) + " " + _loc4_ + " " + §1t1521s0§.getString(286) + ")");
            }
         }
      }
      
      internal function §1t5844s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t5023s0§)
         {
            this.slots[_loc2_].§1t6786s0§(false);
            _loc2_++;
         }
         this.§1t472s0§.htmlText = "";
      }
      
      internal function §1t5559s0§() : *
      {
         var _loc2_:int = 0;
         var _loc3_:§1t394s0§ = null;
         var _loc4_:int = 0;
         var _loc1_:int = this.§1t5089s0§ * this.§1t5102s0§;
         this.§1t5027s0§.visible = this.§1t5089s0§ > 0;
         this.§1t5028s0§.visible = Math.ceil(this.§1t5945s0§ / this.§1t5102s0§) - this.§1t5089s0§ > this.§1t5103s0§;
         if(this.§1t5945s0§ - _loc1_ < this.§1t5023s0§)
         {
            _loc2_ = this.§1t5945s0§ - _loc1_;
         }
         else
         {
            _loc2_ = this.§1t5023s0§;
         }
         var _loc5_:int = 0;
         while(_loc5_ < this.§1t5023s0§)
         {
            _loc3_ = this.slots[_loc5_];
            if(_loc5_ >= _loc2_)
            {
               _loc3_.visible = false;
            }
            else
            {
               _loc4_ = _loc1_ + _loc5_;
               _loc3_.§1t6872s0§(this.§1t5946s0§[_loc4_],"normal");
               _loc3_.§1t6870s0§("");
               _loc3_.§1t6875s0§(_loc4_);
               _loc3_.visible = true;
            }
            _loc5_++;
         }
      }
      
      internal function §1t5120s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5089s0§ > 0)
         {
            --this.§1t5089s0§;
            this.§1t5559s0§();
         }
      }
      
      internal function §1t5121s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5089s0§ < this.§1t5088s0§)
         {
            ++this.§1t5089s0§;
            this.§1t5559s0§();
         }
      }
      
      internal function §1t1427s0§(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§1t5941s0§ == this.§1t5938s0§)
         {
            _loc2_ = this.§1t5943s0§ - (§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§);
            this.§1t5947s0§.detailstext.text = §1t1521s0§.getString(259) + " (" + §1t1521s0§.getString(260,[this.§1t937s0§(_loc2_)]) + ")";
            if(_loc2_ <= 0)
            {
               this.§1t5941s0§ = this.§1t5939s0§;
               this.§1t5947s0§.detailstext.text = §1t1521s0§.getString(261);
               this.§1t5953s0§();
               §1t3318s0§.instance.§1t3463s0§("p",false);
            }
            if(this.§1t5935s0§ == 50)
            {
               this.§1t5947s0§.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " 6");
            }
            else
            {
               this.§1t5947s0§.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " " + this.§1t5948s0§(this.§1t5935s0§) + " (" + §1t1521s0§.getString(287) + " " + this.§1t5935s0§ + "/" + this.§1t5949s0§(this.§1t5935s0§) + ")");
            }
         }
         else if(this.§1t5941s0§ == this.§1t5939s0§ && this.§1t5933s0§ != 4)
         {
            _loc3_ = this.§1t5943s0§ - (§1t3317s0§.instance.§1t1847s0§() - this.§1t5934s0§);
            if(_loc3_ < -this.§1t5944s0§)
            {
               this.§1t5941s0§ = this.§1t5940s0§;
               this.§1t5947s0§.detailstext.text = §1t1521s0§.getString(262);
               if(this.§1t5935s0§ == 50)
               {
                  this.§1t5947s0§.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " 6");
               }
               else
               {
                  this.§1t5947s0§.detailstext.appendText("\n\n\n\n" + §1t1521s0§.getString(285) + " " + this.§1t5948s0§(this.§1t5935s0§) + " (" + §1t1521s0§.getString(287) + " " + this.§1t5935s0§ + "/" + this.§1t5949s0§(this.§1t5935s0§) + ")");
               }
               this.§1t5954s0§();
            }
         }
      }
      
      internal function §1t5948s0§(param1:int) : int
      {
         if(param1 < 10)
         {
            return 1;
         }
         if(param1 < 20)
         {
            return 2;
         }
         if(param1 < 30)
         {
            return 3;
         }
         if(param1 < 40)
         {
            return 4;
         }
         if(param1 < 50)
         {
            return 5;
         }
         return 6;
      }
      
      internal function §1t5949s0§(param1:int) : int
      {
         var _loc2_:int = this.§1t5948s0§(param1);
         if(_loc2_ == 1)
         {
            return 10;
         }
         if(_loc2_ == 2)
         {
            return 20;
         }
         if(_loc2_ == 3)
         {
            return 30;
         }
         if(_loc2_ == 4)
         {
            return 40;
         }
         if(_loc2_ == 5)
         {
            return 50;
         }
         return 60;
      }
      
      internal function §1t937s0§(param1:int) : String
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:int = param1 % 60;
         var _loc3_:int = (param1 - _loc2_) / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = (_loc3_ - _loc4_) / 60;
         if(_loc2_ < 10)
         {
            _loc6_ = "0" + _loc2_.toString();
         }
         else
         {
            _loc6_ = _loc2_.toString();
         }
         if(_loc4_ < 10)
         {
            _loc7_ = "0" + _loc4_.toString();
         }
         else
         {
            _loc7_ = _loc4_.toString();
         }
         if(_loc5_ == 0)
         {
            return _loc7_ + ":" + _loc6_;
         }
         return _loc5_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      internal function plant(param1:int) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5933s0§ = param1;
         this.§1t5934s0§ = §1t3317s0§.instance.§1t1847s0§();
         this.§1t5941s0§ = this.§1t5938s0§;
         §1t1523s0§.§1t9712s0§(this.§1t5942s0§,this.§1t5933s0§);
         §1t1523s0§.§1t9712s0§(this.§1t5942s0§ + 1,this.§1t5934s0§);
         switch(this.§1t5933s0§)
         {
            case 1:
               this.§1t5943s0§ = 15 * 60;
               break;
            case 2:
               this.§1t5943s0§ = 60 * 60;
               break;
            case 3:
               this.§1t5943s0§ = 6 * 60 * 60;
               break;
            case 4:
               this.§1t5943s0§ = 12 * 60 * 60;
         }
         this.§1t5951s0§();
      }
      
      internal function §1t5951s0§() : *
      {
         this.§1t5947s0§.§1t5877s0§ = 0;
         this.§1t5947s0§.§1t5887s0§();
      }
      
      internal function §1t5952s0§() : *
      {
         this.§1t5947s0§.§1t5877s0§ = 1;
         this.§1t5947s0§.§1t5887s0§();
      }
      
      internal function §1t5953s0§() : *
      {
         this.§1t5947s0§.§1t5877s0§ = 2;
         this.§1t5947s0§.§1t5887s0§();
      }
      
      internal function §1t5954s0§() : *
      {
         this.§1t5951s0§();
      }
      
      internal function harvest() : *
      {
         if(!§1t251s0§.instance.§1t3595s0§())
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5947s0§.loading.visible = true;
         §1t251s0§.instance.§1t3545s0§();
      }
      
      public function §1t3545s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this.§1t5947s0§.loading.visible)
         {
            return;
         }
         this.§1t5947s0§.loading.visible = false;
         §1t1523s0§.§1t9712s0§(this.§1t5942s0§,0);
         §1t1523s0§.§1t9712s0§(this.§1t5942s0§ + 1,0);
         §1t1523s0§.§1t9713s0§(this.§1t5942s0§ + 2,1);
         this.§1t5947s0§.hide();
         var _loc1_:Vector.<§1t116s0§> = new Vector.<§1t116s0§>();
         var _loc2_:§1t116s0§ = new §1t116s0§(null);
         _loc2_.init(new XMLList("<enemy><id>" + 64 + "</id><qty>" + 1 + "</qty><x>400</x></enemy>"));
         _loc1_.push(_loc2_);
         §1t6427s0§.§1t12474s0§(-1);
         if(§1t1525s0§.§1t9935s0§() == 8390654)
         {
            §1t1540s0§.§1t10052s0§(-1,8,19,800,0,_loc1_,150);
         }
         else
         {
            §1t1540s0§.§1t10052s0§(-1,8,43,800,0,_loc1_,150);
         }
         if(§1t1523s0§.§1t9714s0§(this.§1t5942s0§ + 2) == 1 || int(Math.random() * (10 - §1t1523s0§.§1t9714s0§(1020))) == 0)
         {
            _loc3_ = this.§1t5948s0§(§1t1523s0§.§1t9714s0§(this.§1t5942s0§ + 2));
            _loc4_ = Math.random() * _loc3_;
            if(_loc4_ == 0)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2115,1);
               §1t1523s0§.§1t9713s0§(30008,1);
               §1t1523s0§.§1t1684s0§(60002,1);
            }
            else if(_loc4_ == 1)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2116,1);
               §1t1523s0§.§1t9713s0§(30009,1);
               §1t1523s0§.§1t1684s0§(60002,1);
            }
            else if(_loc4_ == 2)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2117,1);
               §1t1523s0§.§1t9713s0§(30010,1);
               §1t1523s0§.§1t1684s0§(60002,1);
            }
            else if(_loc4_ == 3)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2118,1);
               §1t1523s0§.§1t9713s0§(30011,1);
               §1t1523s0§.§1t1684s0§(60002,1);
            }
            else if(_loc4_ == 4)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2140,1);
               §1t1523s0§.§1t9713s0§(30012,1);
               §1t1523s0§.§1t1684s0§(60002,1);
            }
            else if(_loc4_ == 5)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2141,1);
               §1t1523s0§.§1t9713s0§(30013,1);
               §1t1523s0§.§1t1684s0§(60002,1);
            }
         }
      }
   }
}

