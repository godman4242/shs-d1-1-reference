package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol766")]
   public class §1t6483s0§ extends MovieClip
   {
      
      public var §1t5017s0§:SimpleButton;
      
      public var §1t6014s0§:§1t5367s0§;
      
      public var §1t7999s0§:§1t5070s0§;
      
      public var loading:MovieClip;
      
      public var §1t8000s0§:TextField;
      
      public var §1t8001s0§:TextField;
      
      public var §1t5021s0§:TextField;
      
      public var §1t8002s0§:§1t7722s0§;
      
      public var §1t8003s0§:§1t7785s0§;
      
      public var §1t8004s0§:§1t7934s0§;
      
      public var §1t8005s0§:§1t7924s0§;
      
      internal var §1t8006s0§:String = "";
      
      internal var §1t8007s0§:String = "";
      
      internal var §1t7811s0§:int;
      
      internal var §1t8008s0§:int;
      
      internal var §1t6577s0§:Boolean = false;
      
      internal var §1t8013s0§:int = 0;
      
      internal var §1t8014s0§:int = 0;
      
      internal var §1t8016s0§:int;
      
      public function §1t6483s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         var _loc1_:String = §1t1521s0§.getString(305);
         var _loc2_:String = "";
         var _loc3_:* = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_ += _loc1_.charAt(_loc3_) + "\n";
            _loc3_++;
         }
         this.§1t5021s0§.text = _loc2_;
         §1t1521s0§.§1t9290s0§(this.§1t8000s0§,true);
         §1t1521s0§.§1t9290s0§(this.loading.prompt);
         §1t1521s0§.§1t9290s0§(this.§1t8001s0§,true);
         this.§1t7999s0§.§1t5769s0§(§1t1521s0§.getString(368));
      }
      
      public function §1t5004s0§() : void
      {
         this.§1t5017s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t7999s0§.§1t5004s0§();
         this.§1t7999s0§.addEventListener(MouseEvent.CLICK,this.§1t8023s0§);
      }
      
      public function removeEventListeners() : void
      {
         this.§1t5017s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t7999s0§.removeEventListeners();
         this.§1t7999s0§.removeEventListener(MouseEvent.CLICK,this.§1t8023s0§);
      }
      
      public function §1t8009s0§() : *
      {
         if(this.§1t8003s0§.visible || this.§1t8005s0§.visible)
         {
            this.§1t5026s0§(null);
         }
         this.§1t5026s0§(null);
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         if(this.§1t8005s0§.visible)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
            this.§1t8005s0§.§1t7932s0§(null);
            return;
         }
         if(this.§1t8003s0§.visible)
         {
            if(!this.§1t8003s0§.§1t7831s0§)
            {
               return;
            }
            §1t88s0§.instance.§1t1516s0§("Snd_back");
            if(param1 != null)
            {
               §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11350s0§);
            }
            this.§1t8004s0§.show();
            this.§1t8003s0§.hide();
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_menuClose");
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1499s0§(this.§1t8008s0§);
         }
         this.removeEventListeners();
         if(§1t1540s0§.§1t10014s0§())
         {
            §1t6427s0§.§1t12473s0§(true);
         }
         else
         {
            §1t406s0§.instance.§1t6610s0§();
            §1t251s0§.instance.§1t3532s0§(false);
         }
         this.visible = false;
         §1t406s0§.instance.§1t6614s0§();
         this.§1t8004s0§.§1t7989s0§();
         this.§1t8004s0§.hide();
         §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
         §1t406s0§.instance.§1t6488s0§.show();
         §1t1523s0§.§1t9742s0§();
      }
      
      public function §1t8010s0§() : *
      {
         this.§1t8008s0§ = §1t88s0§.instance.§1t1503s0§();
         §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11350s0§);
         this.§1t5004s0§();
         this.visible = true;
         §1t1623s0§.instance.§1t1634s0§();
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         §1t1521s0§.§1t9290s0§(this.loading.prompt,true);
         this.loading.prompt.text = §1t1521s0§.getString(25);
         this.§1t8003s0§.visible = false;
         this.§1t8004s0§.visible = false;
         this.§1t8002s0§.visible = false;
         this.§1t8005s0§.visible = false;
         this.loading.visible = false;
         this.§1t6014s0§.visible = false;
         this.§1t8001s0§.text = " ";
         this.§1t8000s0§.text = §1t1521s0§.getString(308,[§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§)]);
         if(§1t1523s0§.§1t7746s0§() == 0)
         {
            this.§1t8011s0§();
            return;
         }
         if(!§1t1523s0§.§1t9502s0§)
         {
            this.loading.visible = true;
            this.§1t8000s0§.visible = false;
            this.§1t8001s0§.visible = false;
            §1t3317s0§.instance.§1t1900s0§(§1t1523s0§.§1t7746s0§(),this.§1t8006s0§ == "");
         }
      }
      
      internal function §1t8011s0§() : *
      {
         this.§1t8002s0§.show();
         this.§1t8000s0§.visible = false;
         this.§1t8001s0§.visible = false;
      }
      
      public function §1t7977s0§(param1:String, param2:String, param3:String, param4:String, param5:Boolean) : *
      {
         var _loc6_:Array = null;
         if(param5)
         {
            this.§1t5026s0§(null);
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(730),§1t1521s0§.getString(5));
            return;
         }
         if(param1 == "")
         {
            param1 = this.§1t8006s0§;
         }
         else
         {
            this.§1t8006s0§ = param1;
         }
         if(param3 == "")
         {
            param3 = this.§1t8007s0§;
         }
         else
         {
            this.§1t8007s0§ = param3;
         }
         if(param4 != "")
         {
            this.§1t8003s0§.§1t7834s0§(param4);
         }
         this.loading.visible = false;
         this.§1t8000s0§.visible = true;
         this.§1t8001s0§.visible = true;
         if(param2 != "")
         {
            _loc6_ = param2.split(",");
            this.§1t7837s0§(_loc6_[0],_loc6_[1],_loc6_[2]);
         }
         else
         {
            this.§1t7837s0§(-1,-1,-1);
         }
         this.§1t8004s0§.§1t7977s0§(param1,param3);
         this.§1t8004s0§.show();
      }
      
      public function §1t7837s0§(param1:int, param2:int, param3:int) : *
      {
         this.§1t8004s0§.§1t7837s0§(param1,param2,param3);
         this.§1t8003s0§.§1t7837s0§(param1,param2,param3);
      }
      
      internal function §1t8012s0§(param1:int, param2:int, param3:§1t418s0§) : *
      {
         var §1t16463s0§:Array;
         var mapid:int = param1;
         var owner:int = param2;
         var §1t7821s0§:§1t418s0§ = param3;
         §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11345s0§);
         this.§1t8024s0§();
         this.§1t8000s0§.visible = false;
         this.§1t8001s0§.visible = false;
         this.§1t8004s0§.hide();
         this.§1t8003s0§.mapid = mapid;
         this.§1t8003s0§.§1t7808s0§ = owner;
         this.§1t8003s0§.§1t7821s0§ = §1t7821s0§;
         this.§1t8000s0§.text = §1t1521s0§.getString(308,[§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§)]);
         §1t16463s0§ = null;
         if(§1t7821s0§ != null)
         {
            §1t16463s0§ = §1t7821s0§.§1t1032s0§();
         }
         else if(§1t1523s0§.§1t9663s0§(owner))
         {
            §1t16463s0§ = [owner];
         }
         §1t3318s0§.instance.§1t3433s0§(§1t16463s0§,function():*
         {
            §1t3317s0§.instance.§1t1903s0§(mapid,§1t1523s0§.§1t7746s0§());
         });
      }
      
      internal function §1t8015s0§(param1:int, param2:int = 0) : *
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:§1t17s0§ = null;
         var _loc10_:int = 0;
         this.§1t8019s0§(§1t3317s0§.instance.§1t1847s0§() - §1t1523s0§.§1t9388s0§,§1t3317s0§.instance.§1t1847s0§());
         §1t406s0§.instance.§1t6488s0§.§1t5846s0§(5);
         var _loc3_:int = §1t1523s0§.§1t9553s0§();
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9424s0§,param1);
         if(param2 > 0)
         {
            §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9425s0§,param2);
         }
         var _loc4_:int = §1t1523s0§.§1t9553s0§();
         if(_loc4_ > _loc3_)
         {
            if(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()) && §1t1523s0§.§1t9660s0§() < §1t1523s0§.§1t9401s0§)
            {
               §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(402) + " " + §1t1523s0§.§1t9555s0§() + "!",§1t1521s0§.getString(5));
            }
            else
            {
               §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(402) + " " + §1t1523s0§.§1t9555s0§() + "!\n\n" + §1t1521s0§.getString(404),§1t1521s0§.getString(5));
            }
            §1t88s0§.instance.§1t1516s0§("Snd_wrAttack");
            _loc6_ = 0;
            _loc7_ = §1t1523s0§.getLevel();
            _loc8_ = _loc4_ * 5 + 10;
            if(_loc7_ < _loc8_)
            {
               _loc8_ = _loc7_;
            }
            if(§1t1523s0§.§1t7746s0§() == 1)
            {
               if(_loc4_ == 1)
               {
                  _loc6_ = 4038;
               }
               else if(_loc4_ == 2)
               {
                  _loc6_ = 4039;
               }
               else if(_loc4_ == 3)
               {
                  _loc6_ = 4040;
               }
               else if(_loc4_ == 4)
               {
                  _loc6_ = 7024;
               }
               else if(_loc4_ == 5)
               {
                  _loc6_ = 5002;
               }
               else if(_loc4_ == 6)
               {
                  _loc6_ = 4055;
               }
               else if(_loc4_ == 7)
               {
                  _loc6_ = 11005;
               }
               else if(_loc4_ == 8)
               {
                  _loc6_ = 7030;
               }
               else if(_loc4_ == 9)
               {
                  _loc6_ = 9008;
               }
               else if(_loc4_ == 10)
               {
                  _loc6_ = 3003;
               }
            }
            else if(§1t1523s0§.§1t7746s0§() == 3)
            {
               if(_loc4_ == 1)
               {
                  _loc6_ = 4041;
               }
               else if(_loc4_ == 2)
               {
                  _loc6_ = 4042;
               }
               else if(_loc4_ == 3)
               {
                  _loc6_ = 4043;
               }
               else if(_loc4_ == 4)
               {
                  _loc6_ = 7025;
               }
               else if(_loc4_ == 5)
               {
                  _loc6_ = 5002;
               }
               else if(_loc4_ == 6)
               {
                  _loc6_ = 4056;
               }
               else if(_loc4_ == 7)
               {
                  _loc6_ = 11005;
               }
               else if(_loc4_ == 8)
               {
                  _loc6_ = 7031;
               }
               else if(_loc4_ == 9)
               {
                  _loc6_ = 9007;
               }
               else if(_loc4_ == 10)
               {
                  _loc6_ = 3005;
               }
            }
            else if(§1t1523s0§.§1t7746s0§() == 2)
            {
               if(_loc4_ == 1)
               {
                  _loc6_ = 4044;
               }
               else if(_loc4_ == 2)
               {
                  _loc6_ = 4045;
               }
               else if(_loc4_ == 3)
               {
                  _loc6_ = 4046;
               }
               else if(_loc4_ == 4)
               {
                  _loc6_ = 7026;
               }
               else if(_loc4_ == 5)
               {
                  _loc6_ = 5002;
               }
               else if(_loc4_ == 6)
               {
                  _loc6_ = 4057;
               }
               else if(_loc4_ == 7)
               {
                  _loc6_ = 11005;
               }
               else if(_loc4_ == 8)
               {
                  _loc6_ = 7032;
               }
               else if(_loc4_ == 9)
               {
                  _loc6_ = 9027;
               }
               else if(_loc4_ == 10)
               {
                  _loc6_ = 3004;
               }
            }
            else if(§1t1523s0§.§1t7746s0§() == 4)
            {
               if(_loc4_ == 1)
               {
                  _loc6_ = 4047;
               }
               else if(_loc4_ == 2)
               {
                  _loc6_ = 4048;
               }
               else if(_loc4_ == 3)
               {
                  _loc6_ = 4049;
               }
               else if(_loc4_ == 4)
               {
                  _loc6_ = 7027;
               }
               else if(_loc4_ == 5)
               {
                  _loc6_ = 5002;
               }
               else if(_loc4_ == 6)
               {
                  _loc6_ = 4058;
               }
               else if(_loc4_ == 7)
               {
                  _loc6_ = 11005;
               }
               else if(_loc4_ == 8)
               {
                  _loc6_ = 7033;
               }
               else if(_loc4_ == 9)
               {
                  _loc6_ = 9028;
               }
               else if(_loc4_ == 10)
               {
                  _loc6_ = 3006;
               }
            }
            else if(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()) && §1t1523s0§.§1t9660s0§() >= §1t1523s0§.§1t9401s0§)
            {
               if(_loc4_ == 1)
               {
                  _loc6_ = 4145;
               }
               else if(_loc4_ == 2)
               {
                  _loc6_ = 4146;
               }
               else if(_loc4_ == 3)
               {
                  _loc6_ = 4147;
               }
               else if(_loc4_ == 4)
               {
                  _loc6_ = 7090;
               }
               else if(_loc4_ == 5)
               {
                  _loc6_ = 5002;
               }
               else if(_loc4_ == 6)
               {
                  _loc6_ = 4148;
               }
               else if(_loc4_ == 7)
               {
                  _loc6_ = 11005;
               }
               else if(_loc4_ == 8)
               {
                  _loc6_ = 7091;
               }
               else if(_loc4_ == 9)
               {
                  _loc6_ = 9058;
               }
               else if(_loc4_ == 10)
               {
                  _loc6_ = 3008;
               }
            }
            if(_loc6_ != 0)
            {
               if(_loc4_ == 10)
               {
                  _loc9_ = §1t406s0§.instance.§1t6488s0§.§1t6182s0§(_loc6_,_loc8_,1,true,true);
               }
               else
               {
                  _loc9_ = §1t406s0§.instance.§1t6488s0§.§1t6182s0§(_loc6_,_loc8_,1,true);
               }
               if(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()))
               {
                  _loc9_.§1t529s0§(§1t1523s0§.§1t9655s0§());
               }
               §1t406s0§.instance.§1t6488s0§.§1t5846s0§(_loc4_ * 100);
               if(_loc4_ <= 3)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6182s0§(11006,_loc8_,1);
                  §1t406s0§.instance.§1t6488s0§.§1t6182s0§(12002,_loc8_,1);
               }
               else if(_loc4_ == 10)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2212,1);
               }
            }
         }
         if(!this.§1t6577s0§)
         {
            _loc10_ = §1t3317s0§.instance.§1t1847s0§();
            if(_loc4_ >= 5 && §1t1523s0§.§1t7746s0§() <= 4 && _loc10_ - §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9438s0§) < 432000)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1521s0§.getString(153));
               this.§1t6577s0§ = true;
            }
            if(_loc10_ - this.§1t8013s0§ < 2700)
            {
               ++this.§1t8014s0§;
               if(this.§1t8014s0§ > §1t1523s0§.§1t9556s0§() * 2)
               {
                  §1t3318s0§.instance.§1t3409s0§(§1t1521s0§.getString(397));
                  this.§1t6577s0§ = true;
               }
            }
            else
            {
               this.§1t8014s0§ = 1;
               this.§1t8013s0§ = _loc10_;
            }
         }
         var _loc5_:int = §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9423s0§,-param1);
         this.§1t8000s0§.text = §1t1521s0§.getString(308,[_loc5_.toString()]);
         §1t1523s0§.§1t9552s0§();
         §1t3317s0§.instance.§1t1946s0§();
         if(param1 == this.§1t8016s0§)
         {
            §1t3318s0§.instance.§1t3409s0§(§1t1521s0§.getString(397) + "2");
         }
         if(_loc5_ >= §1t1523s0§.§1t9556s0§())
         {
            §1t3318s0§.instance.§1t3409s0§(_loc5_ + " " + §1t1521s0§.getString(397) + "3");
         }
      }
      
      internal function §1t8017s0§(param1:MouseEvent) : *
      {
         §1t3318s0§.instance.§1t3463s0§("ww",true);
         this.§1t8004s0§.show();
         this.§1t8003s0§.hide();
      }
      
      public function §1t8018s0§(param1:String, param2:String, param3:Array = null, param4:int = 0) : *
      {
         §1t70s0§.instance.§1t1130s0§(this.§1t8003s0§.mapid >> 12 & 0x0FFF,this.§1t8003s0§.mapid & 0x0FFF,param2);
         this.loading.visible = false;
         this.§1t8000s0§.visible = true;
         this.§1t8001s0§.visible = true;
         this.§1t8003s0§.show();
         this.§1t8003s0§.§1t7835s0§(param1,param3,param4);
      }
      
      public function §1t8019s0§(param1:int, param2:int) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 >= 0)
         {
            if(this.§1t8001s0§.text != "")
            {
               if(visible && §1t3318s0§.instance.§1t3463s0§("w",false))
               {
                  return;
               }
               _loc3_ = §1t1523s0§.§1t9556s0§();
               _loc4_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9423s0§);
               if(_loc4_ != _loc3_)
               {
                  §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9423s0§,_loc3_);
               }
               this.§1t8000s0§.text = §1t1521s0§.getString(308,[_loc4_]);
               this.§1t8001s0§.text = "";
               §1t406s0§.instance.§1t6578s0§();
            }
         }
         else
         {
            this.§1t8001s0§.text = §1t1521s0§.getString(309) + this.§1t937s0§(-param1);
         }
         if(this.§1t8003s0§.visible)
         {
            this.§1t8003s0§.§1t7870s0§(param2);
         }
      }
      
      public function §1t7176s0§() : *
      {
         this.§1t8006s0§ = "";
         this.§1t8007s0§ = "";
      }
      
      public function §1t8020s0§() : *
      {
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t8004s0§.§1t7952s0§.length)
         {
            _loc1_ += this.§1t8004s0§.§1t7952s0§[_loc2_].toString();
            _loc2_++;
         }
         this.§1t8007s0§ = _loc1_;
         this.§1t8004s0§.§1t7977s0§(this.§1t8006s0§,this.§1t8007s0§);
      }
      
      public function §1t8021s0§(param1:String) : *
      {
         this.§1t8007s0§ = param1;
         this.§1t8004s0§.§1t7977s0§(this.§1t8006s0§,this.§1t8007s0§);
      }
      
      public function update(param1:int) : *
      {
         if(!visible)
         {
            return;
         }
         if(this.§1t8004s0§.visible)
         {
            this.§1t8004s0§.update();
         }
         if(this.§1t8003s0§.visible)
         {
            this.§1t8003s0§.§1t3268s0§(param1);
         }
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
      
      public function §1t8022s0§(param1:int) : *
      {
         visible = true;
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9423s0§,1);
         this.§1t8015s0§(1);
         this.§1t8003s0§.§1t7861s0§(param1);
         this.§1t8001s0§.text = " ";
         §1t1541s0§.§1t10099s0§();
         §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11350s0§);
      }
      
      internal function §1t8023s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t8005s0§.show();
      }
      
      public function §1t7764s0§(param1:int, param2:int) : int
      {
         return this.§1t8004s0§.§1t7981s0§(param1,param2);
      }
      
      public function §1t7982s0§(param1:int, param2:int) : *
      {
         if(this.§1t8006s0§ == "")
         {
            return;
         }
         this.§1t8004s0§.§1t7982s0§(param1,param2);
      }
      
      public function §1t8024s0§(param1:String = "") : *
      {
         if(param1 == "")
         {
            param1 = §1t1521s0§.getString(25);
         }
         if(this.loading.prompt.text != param1)
         {
            this.loading.prompt.text = param1;
         }
         this.loading.visible = true;
      }
      
      public function §1t8025s0§() : *
      {
         this.loading.visible = false;
      }
   }
}

