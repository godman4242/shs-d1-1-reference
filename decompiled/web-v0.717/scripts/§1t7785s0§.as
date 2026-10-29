package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol742")]
   public class §1t7785s0§ extends MovieClip
   {
      
      internal static const §1t12534s0§:Class = §1t4646s0§;
      
      public var actionslabel:TextField;
      
      public var attackbutton:§1t5050s0§;
      
      public var buildbutton:§1t5050s0§;
      
      public var buildmenu:§1t7790s0§;
      
      public var dayendslabel:TextField;
      
      public var §1t7792s0§:§1t5050s0§;
      
      public var §1t7793s0§:§1t5050s0§;
      
      public var hexarrow:MovieClip;
      
      public var leftRoad:MovieClip;
      
      public var §1t7796s0§:§1t5050s0§;
      
      public var msgBoard:§1t6310s0§;
      
      public var numbertext:TextField;
      
      public var rightRoad:MovieClip;
      
      public var sectorDesc:§1t7800s0§;
      
      public var selectsectorlabel:TextField;
      
      public var §1t7802s0§:§1t5050s0§;
      
      public var troopsloading:MovieClip;
      
      public var warhexbg:MovieClip;
      
      internal var §1t7805s0§:Array;
      
      internal var §1t7806s0§:Array;
      
      internal var §1t7807s0§:§1t416s0§;
      
      internal var mapid:int;
      
      internal var §1t7808s0§:int;
      
      internal var ht:int;
      
      internal var wt:int;
      
      internal var §1t7811s0§:int;
      
      internal var §1t7812s0§:int;
      
      internal var §1t7813s0§:int;
      
      internal var messages:String = "";
      
      internal var §1t7815s0§:§1t75s0§;
      
      internal var §1t7816s0§:§1t7817s0§;
      
      internal var §1t7818s0§:int;
      
      internal var §1t7819s0§:Array = new Array();
      
      internal var §1t7820s0§:int;
      
      internal var §1t6823s0§:Array;
      
      internal var §1t7821s0§:§1t418s0§;
      
      internal var §1t7822s0§:int;
      
      internal var §1t1027s0§:Boolean;
      
      internal var §1t7823s0§:Boolean = false;
      
      internal var §1t7824s0§:String;
      
      internal var §1t7825s0§:§1t415s0§;
      
      internal var §1t7826s0§:§1t415s0§;
      
      internal var §1t7827s0§:int = -1;
      
      internal var §1t7828s0§:int = -1;
      
      internal var §1t7829s0§:int = -1;
      
      internal var §1t7830s0§:Boolean = false;
      
      public var §1t7831s0§:Boolean = true;
      
      internal var §1t7832s0§:§1t855s0§;
      
      internal var §1t7833s0§:§1t855s0§;
      
      internal var §1t7856s0§:int = -1;
      
      public function §1t7785s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.selectsectorlabel,true);
         §1t1521s0§.§1t9290s0§(this.actionslabel,true);
         §1t1521s0§.§1t9290s0§(this.dayendslabel,true);
         §1t1521s0§.§1t9290s0§(this.sectorDesc.§1t7463s0§);
         §1t1521s0§.§1t9290s0§(this.numbertext);
         §1t1521s0§.§1t9290s0§(this.troopsloading.prompttext);
         this.selectsectorlabel.text = §1t1521s0§.getString(310);
         this.actionslabel.text = §1t1521s0§.getString(315);
         this.§1t7793s0§.§1t5769s0§(§1t1521s0§.getString(311));
         this.attackbutton.§1t5769s0§(§1t1521s0§.getString(312));
         this.§1t7796s0§.§1t5769s0§(§1t1521s0§.getString(313));
         this.§1t7802s0§.§1t5769s0§(§1t1521s0§.getString(367));
         this.buildbutton.§1t5769s0§(§1t1521s0§.getString(422));
         this.§1t7792s0§.§1t5769s0§(§1t1521s0§.getString(11147));
         this.hexarrow.mouseEnabled = false;
         this.§1t7815s0§ = new §1t75s0§();
         this.§1t7815s0§.§1t6246s0§("lightstanceidle",0);
         addChild(this.§1t7815s0§);
         this.§1t7815s0§.scaleX = 0.5;
         this.§1t7815s0§.scaleY = 0.5;
         this.§1t7815s0§.mouseEnabled = false;
         this.§1t7816s0§ = new §1t7817s0§();
         addChild(this.§1t7816s0§);
         this.§1t7816s0§.visible = false;
         this.numbertext.visible = false;
         this.buildmenu.visible = false;
         this.§1t7806s0§ = new Array();
         this.§1t7805s0§ = new Array();
         this.§1t7832s0§ = new §1t855s0§(§1t416s0§,0,0,36,"reset",true,false);
         this.§1t7833s0§ = new §1t855s0§(§1t415s0§,0,0,36,"reset",true,false);
         this.§1t6823s0§ = new Array();
         this.§1t6823s0§.push(this.§1t7793s0§);
         this.§1t6823s0§.push(this.attackbutton);
         this.§1t6823s0§.push(this.§1t7802s0§);
         this.§1t6823s0§.push(this.§1t7796s0§);
         this.§1t6823s0§.push(this.buildbutton);
         this.§1t6823s0§.push(this.§1t7792s0§);
      }
      
      public function §1t7834s0§(param1:String) : *
      {
         this.§1t7811s0§ = int(param1) + 60;
      }
      
      public function §1t7835s0§(param1:String, param2:Array, param3:int, param4:int = 6, param5:int = 6) : *
      {
         var _loc6_:§1t71s0§ = null;
         var _loc11_:int = 0;
         var _loc12_:§1t415s0§ = null;
         var _loc16_:Array = null;
         var _loc17_:§1t416s0§ = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:Boolean = false;
         var _loc23_:int = 0;
         var _loc24_:§1t57s0§ = null;
         this.ht = param4;
         this.wt = param5;
         this.§1t7820s0§ = param3;
         if(this.§1t7821s0§ == null)
         {
            this.§1t7822s0§ = §1t418s0§.§1t8816s0§;
            this.§1t1027s0§ = false;
         }
         else
         {
            this.§1t7822s0§ = this.§1t7821s0§.§1t1030s0§(this.§1t7812s0§);
            this.§1t1027s0§ = this.§1t7821s0§.§1t1027s0§();
         }
         this.§1t7823s0§ = §1t70s0§.instance.§1t1140s0§(this.mapid);
         _loc6_ = §1t70s0§.instance.§1t1126s0§(this.mapid >> 12 & 0x0FFF,this.mapid & 0x0FFF,false);
         this.§1t7824s0§ = _loc6_.§1t1276s0§;
         this.msgBoard.init(this.§1t7824s0§ + " " + §1t1521s0§.getString(317),this.mapid,this.§1t7812s0§,"",§1t6310s0§.§1t12430s0§);
         this.leftRoad.visible = false;
         this.rightRoad.visible = false;
         var _loc7_:Array = _loc6_.§1t1331s0§();
         var _loc8_:int = (this.mapid >> 12 & 0x0FFF) * 6;
         var _loc9_:int = (this.mapid & 0x0FFF) * 6;
         var _loc10_:int = _loc8_ << 12 | _loc9_;
         var _loc13_:int = 0;
         while(_loc13_ < param5)
         {
            this.§1t7806s0§.push(new Array(param4));
            _loc23_ = 0;
            while(_loc23_ < param4)
            {
               _loc12_ = this.§1t7833s0§.§1t866s0§();
               this.§1t7806s0§[_loc13_][_loc23_] = _loc12_;
               _loc12_.x = 90 + _loc13_ * 55;
               _loc12_.y = 92 + _loc23_ * 55;
               _loc11_ = §1t70s0§.instance.§1t1161s0§(_loc10_,_loc13_,_loc23_);
               _loc12_.§1t7995s0§(§1t70s0§.instance.§1t1151s0§(_loc11_),_loc6_.§1t1149s0§(_loc11_),_loc6_.§1t1343s0§(_loc13_,_loc23_));
               addChild(_loc12_);
               if(_loc12_.§1t1298s0§())
               {
                  if(_loc13_ == 0 && this.§1t7836s0§(_loc13_,_loc23_) != -1)
                  {
                     this.leftRoad.y = _loc12_.y - 7.5;
                     this.leftRoad.visible = true;
                  }
                  else if(_loc13_ == 5 && this.§1t7836s0§(_loc13_,_loc23_) != -1)
                  {
                     this.rightRoad.y = _loc12_.y - 7.5;
                     this.rightRoad.visible = true;
                  }
               }
               _loc23_++;
            }
            _loc13_++;
         }
         _loc13_ = 0;
         while(_loc13_ < param5)
         {
            this.§1t7805s0§.push(new Array(param4));
            _loc13_++;
         }
         var _loc14_:Boolean = false;
         var _loc15_:Array = param1.split("|");
         if(this.§1t1027s0§ && param1 != "")
         {
            _loc13_ = 0;
            while(_loc13_ < _loc15_.length)
            {
               if(_loc15_[_loc13_] != "")
               {
                  _loc16_ = _loc15_[_loc13_].split(",");
                  if(_loc16_.length == 7)
                  {
                     _loc18_ = int(_loc16_[0]);
                     _loc19_ = int(_loc16_[1]);
                     _loc17_ = this.§1t7832s0§.§1t866s0§();
                     _loc17_.init(_loc18_,_loc19_,_loc16_[2],_loc16_[3],_loc16_[4],_loc16_[5]);
                     if(param2 != null)
                     {
                        _loc17_.§1t7778s0§(param2[_loc18_][_loc19_]);
                     }
                     else
                     {
                        _loc17_.§1t7774s0§(this.§1t7812s0§,_loc16_[6]);
                     }
                     this.§1t7805s0§[_loc18_][_loc19_] = _loc17_;
                     _loc17_.x = 90 + _loc18_ * 55;
                     _loc17_.y = 92 + _loc19_ * 55;
                     _loc12_ = this.§1t7806s0§[_loc18_][_loc19_];
                     if(_loc12_.§1t1298s0§())
                     {
                        _loc20_ = int(_loc16_[2]);
                        _loc21_ = this.§1t7836s0§(_loc18_,_loc19_);
                        if(this.§1t7821s0§.§1t1028s0§(_loc21_,_loc18_,_loc19_) == 0)
                        {
                           _loc24_ = this.§1t7821s0§.§1t1029s0§(_loc18_,_loc19_);
                           if(_loc24_.§1t761s0§() == 0)
                           {
                              _loc17_.§1t7765s0§(_loc21_);
                              _loc17_.§1t7770s0§(§1t416s0§.§1t12524s0§);
                           }
                           else if(_loc24_.§1t760s0§() != _loc21_)
                           {
                              _loc17_.§1t7765s0§(_loc24_.§1t760s0§());
                              if(_loc16_[2] != _loc21_)
                              {
                                 _loc17_.§1t7766s0§(_loc16_[2]);
                              }
                              if(this.§1t7821s0§.§1t1028s0§(_loc17_.§1t7764s0§(),_loc18_,_loc19_) == 3)
                              {
                                 _loc17_.§1t7770s0§(§1t416s0§.§1t12533s0§);
                              }
                              else
                              {
                                 _loc17_.§1t7770s0§(§1t416s0§.§1t12532s0§);
                              }
                           }
                        }
                        else if(this.§1t7821s0§.§1t1028s0§(_loc21_,_loc18_,_loc19_) == 2)
                        {
                           _loc17_.§1t7765s0§(_loc21_);
                           _loc17_.§1t7770s0§(§1t416s0§.§1t12525s0§);
                        }
                        else if(this.§1t7821s0§.§1t1028s0§(_loc21_,_loc18_,_loc19_) == 3)
                        {
                           _loc17_.§1t7765s0§(_loc21_);
                           if(_loc16_[2] != _loc21_)
                           {
                              _loc17_.§1t7766s0§(_loc16_[2]);
                           }
                           _loc17_.§1t7770s0§(§1t416s0§.§1t12533s0§);
                        }
                        else if(this.§1t7821s0§.§1t1028s0§(_loc21_,_loc18_,_loc19_) == 1 && _loc21_ == _loc20_)
                        {
                           _loc17_.§1t7765s0§(_loc21_);
                           _loc17_.§1t7770s0§(§1t416s0§.§1t12520s0§);
                           _loc14_ = true;
                        }
                        else
                        {
                           _loc17_.§1t7765s0§(_loc21_);
                           if(_loc16_[2] != _loc21_)
                           {
                              _loc17_.§1t7766s0§(_loc16_[2]);
                           }
                           _loc17_.§1t7770s0§(§1t416s0§.§1t12532s0§);
                        }
                     }
                     else if(_loc12_.§1t1300s0§())
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12522s0§);
                     }
                     else if(_loc12_.§1t1318s0§() && _loc17_.cost <= 0)
                     {
                        if(_loc6_.§1t1339s0§() <= 2)
                        {
                           _loc17_.§1t7770s0§(§1t416s0§.§1t12528s0§);
                        }
                        else if(_loc6_.§1t1339s0§() == 3)
                        {
                           _loc17_.§1t7770s0§(§1t416s0§.§1t12523s0§);
                        }
                        else if(_loc6_.§1t1339s0§() == 4)
                        {
                           _loc17_.§1t7770s0§(§1t416s0§.§1t12530s0§);
                        }
                        else if(_loc6_.§1t1339s0§() == 5)
                        {
                           _loc17_.§1t7770s0§(§1t416s0§.§1t12531s0§);
                        }
                        if(_loc6_.§1t1342s0§() == §1t1523s0§.§1t7746s0§())
                        {
                           _loc14_ = true;
                        }
                     }
                     else if(_loc16_[4] == §1t416s0§.§1t12520s0§)
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12532s0§);
                     }
                     _loc17_.§1t7768s0§(_loc12_);
                     addChild(_loc17_);
                     _loc17_.addEventListener(MouseEvent.CLICK,this.§1t7846s0§,false,0,true);
                  }
               }
               _loc13_++;
            }
         }
         else
         {
            _loc13_ = 0;
            while(_loc13_ < 6)
            {
               _loc23_ = 0;
               while(_loc23_ < 6)
               {
                  _loc18_ = _loc23_;
                  _loc19_ = _loc13_;
                  _loc17_ = this.§1t7832s0§.§1t866s0§();
                  _loc17_.init(_loc18_,_loc19_,0,0,0,0);
                  _loc17_.§1t7774s0§(this.§1t7812s0§,0);
                  this.§1t7805s0§[_loc18_][_loc19_] = _loc17_;
                  _loc17_.x = 90 + _loc18_ * 55;
                  _loc17_.y = 92 + _loc19_ * 55;
                  _loc12_ = this.§1t7806s0§[_loc18_][_loc19_];
                  if(!this.§1t7823s0§ && _loc12_.§1t1298s0§())
                  {
                     _loc17_.§1t7765s0§(this.§1t7836s0§(_loc18_,_loc19_));
                     if(this.§1t7822s0§ == §1t418s0§.§1t8816s0§ || this.§1t7821s0§.§1t1028s0§(this.§1t7812s0§,_loc18_,_loc19_) == 0)
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12524s0§);
                     }
                     else if(this.§1t7821s0§.§1t1028s0§(this.§1t7812s0§,_loc18_,_loc19_) == 2)
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12525s0§);
                     }
                     else if(this.§1t7821s0§.§1t1028s0§(this.§1t7812s0§,_loc18_,_loc19_) == 3)
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12533s0§);
                     }
                  }
                  else if(_loc12_.§1t1300s0§())
                  {
                     _loc17_.§1t7765s0§(this.§1t7808s0§);
                     _loc17_.§1t7770s0§(§1t416s0§.§1t12522s0§);
                  }
                  else if(_loc12_.§1t1318s0§())
                  {
                     _loc17_.§1t7765s0§(this.§1t7808s0§);
                     if(_loc6_.§1t1339s0§() <= 2)
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12528s0§);
                     }
                     else if(_loc6_.§1t1339s0§() == 3)
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12523s0§);
                     }
                     else if(_loc6_.§1t1339s0§() == 4)
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12530s0§);
                     }
                     else if(_loc6_.§1t1339s0§() == 5)
                     {
                        _loc17_.§1t7770s0§(§1t416s0§.§1t12531s0§);
                     }
                  }
                  _loc17_.§1t7768s0§(_loc12_);
                  addChild(_loc17_);
                  _loc17_.addEventListener(MouseEvent.CLICK,this.§1t7846s0§,false,0,true);
                  _loc23_++;
               }
               _loc13_++;
            }
         }
         setChildIndex(this.hexarrow,numChildren - 1);
         setChildIndex(this.§1t7816s0§,numChildren - 1);
         setChildIndex(this.§1t7815s0§,numChildren - 1);
         setChildIndex(this.numbertext,numChildren - 1);
         setChildIndex(this.troopsloading,numChildren - 1);
         _loc13_ = 0;
         while(_loc13_ < param5)
         {
            _loc23_ = 0;
            while(_loc23_ < param4)
            {
               if(this.§1t7805s0§[_loc13_] != null && this.§1t7805s0§[_loc13_][_loc23_] != null)
               {
                  _loc17_ = this.§1t7805s0§[_loc13_][_loc23_];
                  _loc17_.§1t7760s0§ = this.§1t7760s0§(_loc13_,_loc23_,this.§1t7812s0§);
               }
               _loc23_++;
            }
            _loc13_++;
         }
         if(this.§1t7827s0§ == this.mapid)
         {
            this.§1t7815s0§.x = this.§1t7805s0§[this.§1t7828s0§][this.§1t7829s0§].x;
            this.§1t7815s0§.y = this.§1t7805s0§[this.§1t7828s0§][this.§1t7829s0§].y + 17;
            if(this.§1t7828s0§ + 1 > param5 / 2)
            {
               this.§1t7815s0§.scaleX = -0.5;
            }
            else
            {
               this.§1t7815s0§.scaleX = 0.5;
            }
            this.§1t7815s0§.visible = true;
         }
         this.§1t7845s0§();
         this.§1t7831s0§ = true;
         if(this.§1t7815s0§.visible)
         {
            this.selectsectorlabel.text = §1t1521s0§.getString(310);
         }
         else if(this.§1t1027s0§ && !this.§1t7815s0§.visible && _loc14_)
         {
            this.selectsectorlabel.text = §1t1521s0§.getString(11103);
         }
         else
         {
            this.selectsectorlabel.text = §1t1521s0§.getString(11104);
         }
      }
      
      internal function §1t7836s0§(param1:int, param2:int) : int
      {
         var _loc3_:int = (this.mapid >> 12 & 0x0FFF) - 341;
         var _loc4_:int = (this.mapid & 0x0FFF) - 341;
         if(param1 == 0)
         {
            return §1t406s0§.instance.§1t6482s0§.§1t7764s0§(_loc3_ - 1,_loc4_);
         }
         if(param1 == 5)
         {
            return §1t406s0§.instance.§1t6482s0§.§1t7764s0§(_loc3_ + 1,_loc4_);
         }
         if(param2 == 0)
         {
            return §1t406s0§.instance.§1t6482s0§.§1t7764s0§(_loc3_,_loc4_ - 1);
         }
         if(param2 == 5)
         {
            return §1t406s0§.instance.§1t6482s0§.§1t7764s0§(_loc3_,_loc4_ + 1);
         }
         return 0;
      }
      
      public function §1t7837s0§(param1:int, param2:int, param3:int) : *
      {
         this.§1t7827s0§ = param1;
         this.§1t7828s0§ = param2;
         this.§1t7829s0§ = param3;
      }
      
      internal function §1t7760s0§(param1:int, param2:int, param3:int) : Boolean
      {
         var _loc4_:§1t416s0§ = null;
         var _loc6_:int = 0;
         if(this.§1t7805s0§[param1] == null || this.§1t7805s0§[param1][param2] == null)
         {
            return false;
         }
         var _loc5_:int = int(this.§1t7805s0§[param1][param2].owner);
         _loc6_ = this.§1t7764s0§(param1,param2 - 1);
         if(_loc6_ != _loc5_ && _loc6_ != 0)
         {
            return true;
         }
         _loc6_ = this.§1t7764s0§(param1 - 1,param2);
         if(_loc6_ != _loc5_ && _loc6_ != 0)
         {
            return true;
         }
         _loc6_ = this.§1t7764s0§(param1 + 1,param2);
         if(_loc6_ != _loc5_ && _loc6_ != 0)
         {
            return true;
         }
         _loc6_ = this.§1t7764s0§(param1,param2 + 1);
         if(_loc6_ != _loc5_ && _loc6_ != 0)
         {
            return true;
         }
         return false;
      }
      
      internal function §1t7764s0§(param1:int, param2:int) : int
      {
         if(param1 < 0 || param1 >= this.wt || param2 < 0 || param2 >= this.ht)
         {
            return 0;
         }
         var _loc3_:§1t416s0§ = this.§1t7805s0§[param1][param2];
         if(_loc3_ != null)
         {
            return _loc3_.owner;
         }
         return 0;
      }
      
      internal function §1t7838s0§() : Boolean
      {
         return this.§1t7764s0§(this.§1t7828s0§,this.§1t7829s0§) == this.§1t7812s0§;
      }
      
      public function show() : *
      {
         visible = true;
         this.§1t7812s0§ = §1t1523s0§.§1t7746s0§();
         this.§1t7848s0§(null);
         this.§1t5004s0§();
         this.sectorDesc.§1t7895s0§(§1t1521s0§.getString(90));
         this.§1t7815s0§.visible = false;
         this.§1t7815s0§.§1t5491s0§(§1t1523s0§.§1t9732s0§());
         this.§1t7816s0§.initSide(this.§1t7812s0§);
         this.§1t7816s0§.visible = false;
         this.numbertext.visible = false;
         this.troopsloading.visible = false;
         this.dayendslabel.text = "";
      }
      
      public function hide() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         visible = false;
         this.removeEventListeners();
         if(this.§1t7805s0§ != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.wt)
            {
               _loc2_ = 0;
               while(_loc2_ < this.ht)
               {
                  if(this.§1t7805s0§[_loc1_][_loc2_] != null)
                  {
                     removeChild(this.§1t7805s0§[_loc1_][_loc2_]);
                     removeChild(this.§1t7806s0§[_loc1_][_loc2_]);
                  }
                  _loc2_++;
               }
               _loc1_++;
            }
         }
         this.§1t7833s0§.§1t868s0§();
         this.§1t7832s0§.§1t868s0§();
         this.§1t7805s0§.length = 0;
         this.§1t7806s0§.length = 0;
      }
      
      public function §1t7839s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§1t7805s0§ != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.wt)
            {
               _loc2_ = 0;
               while(_loc2_ < this.ht)
               {
                  if(this.§1t7805s0§[_loc1_][_loc2_] != null && this.§1t7805s0§[_loc1_][_loc2_].flag != null)
                  {
                     this.§1t7805s0§[_loc1_][_loc2_].flag.stop();
                     if(this.§1t7805s0§[_loc1_][_loc2_].flag.flag != null)
                     {
                        this.§1t7805s0§[_loc1_][_loc2_].flag.flag.stop();
                     }
                  }
                  _loc2_++;
               }
               _loc1_++;
            }
         }
      }
      
      public function §1t7840s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§1t7805s0§ != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.wt)
            {
               _loc2_ = 0;
               while(_loc2_ < this.ht)
               {
                  if(this.§1t7805s0§[_loc1_][_loc2_] != null && this.§1t7805s0§[_loc1_][_loc2_].flag != null)
                  {
                     this.§1t7805s0§[_loc1_][_loc2_].flag.play();
                     if(this.§1t7805s0§[_loc1_][_loc2_].flag.flag != null)
                     {
                        this.§1t7805s0§[_loc1_][_loc2_].flag.flag.play();
                     }
                  }
                  _loc2_++;
               }
               _loc1_++;
            }
         }
      }
      
      public function §1t5004s0§() : *
      {
         this.§1t7793s0§.addEventListener(MouseEvent.CLICK,this.§1t7850s0§);
         this.attackbutton.addEventListener(MouseEvent.CLICK,this.§1t7851s0§);
         this.§1t7796s0§.addEventListener(MouseEvent.CLICK,this.§1t7864s0§);
         this.§1t7802s0§.addEventListener(MouseEvent.CLICK,this.§1t7852s0§);
         this.buildbutton.addEventListener(MouseEvent.CLICK,this.§1t7853s0§);
         this.§1t7792s0§.addEventListener(MouseEvent.CLICK,this.§1t7854s0§);
         this.warhexbg.addEventListener(MouseEvent.CLICK,this.§1t7848s0§);
         this.msgBoard.§1t5004s0§();
         this.sectorDesc.§1t5004s0§();
      }
      
      public function removeEventListeners() : *
      {
         this.§1t7793s0§.removeEventListeners();
         this.attackbutton.removeEventListeners();
         this.§1t7796s0§.removeEventListeners();
         this.§1t7802s0§.removeEventListeners();
         this.buildbutton.removeEventListeners();
         this.§1t7793s0§.removeEventListener(MouseEvent.CLICK,this.§1t7850s0§);
         this.attackbutton.removeEventListener(MouseEvent.CLICK,this.§1t7851s0§);
         this.§1t7796s0§.removeEventListener(MouseEvent.CLICK,this.§1t7864s0§);
         this.§1t7802s0§.removeEventListener(MouseEvent.CLICK,this.§1t7852s0§);
         this.buildbutton.removeEventListener(MouseEvent.CLICK,this.§1t7853s0§);
         this.§1t7792s0§.removeEventListener(MouseEvent.CLICK,this.§1t7854s0§);
         this.warhexbg.removeEventListener(MouseEvent.CLICK,this.§1t7848s0§);
         this.msgBoard.removeEventListeners();
         this.sectorDesc.removeEventListeners();
      }
      
      internal function §1t7841s0§(param1:§1t416s0§) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if((param1.hextype == §1t416s0§.§1t12524s0§ || param1.hextype == §1t416s0§.§1t12525s0§) && param1.owner == this.§1t7812s0§ && §1t1523s0§.§1t9553s0§() >= 9)
         {
            return true;
         }
         if((param1.hextype == §1t416s0§.§1t12520s0§ || param1.hextype == §1t416s0§.§1t12532s0§ || param1.hextype == §1t416s0§.§1t12533s0§) && param1.owner == this.§1t7812s0§)
         {
            return true;
         }
         if(this.§1t7827s0§ == this.mapid && param1.hextype == 2 && param1.cost == 0 && param1.owner == this.§1t7812s0§)
         {
            return true;
         }
         if(Boolean(this.§1t1027s0§ && this.§1t7806s0§[param1.xpos][param1.§1t2259s0§].§1t1318s0§() && param1.hextype != §1t416s0§.§1t12528s0§) && Boolean(param1.owner == this.§1t7812s0§) && param1.cost <= 0)
         {
            return true;
         }
         return this.§1t7842s0§(param1);
      }
      
      internal function §1t7842s0§(param1:§1t416s0§) : Boolean
      {
         if(this.§1t7827s0§ == this.mapid)
         {
            if(param1.§1t2259s0§ == this.§1t7829s0§ && Math.abs(param1.xpos - this.§1t7828s0§) <= 1)
            {
               return true;
            }
            if(param1.xpos == this.§1t7828s0§ && Math.abs(param1.§1t2259s0§ - this.§1t7829s0§) <= 1)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function §1t7843s0§(param1:§1t416s0§) : Boolean
      {
         if(this.§1t7828s0§ == -1 || this.§1t7829s0§ == -1 || this.§1t7827s0§ != this.mapid)
         {
            return false;
         }
         if(param1.xpos == this.§1t7828s0§ && param1.§1t2259s0§ == this.§1t7829s0§)
         {
            return true;
         }
         if(this.§1t7805s0§[this.§1t7828s0§][this.§1t7829s0§].hextype == §1t416s0§.§1t12526s0§ && this.§1t7805s0§[this.§1t7828s0§][this.§1t7829s0§].cost == 0)
         {
            if(this.§1t7829s0§ == param1.§1t2259s0§)
            {
               if(this.§1t7828s0§ == param1.xpos - 1)
               {
                  return true;
               }
               if(this.§1t7828s0§ == param1.xpos + 1)
               {
                  return true;
               }
            }
            else if(this.§1t7828s0§ == param1.xpos)
            {
               if(this.§1t7829s0§ == param1.§1t2259s0§ - 1)
               {
                  return true;
               }
               if(this.§1t7829s0§ == param1.§1t2259s0§ + 1)
               {
                  return true;
               }
            }
         }
         var _loc2_:§1t415s0§ = this.§1t7806s0§[this.§1t7828s0§][this.§1t7829s0§];
         if(this.§1t7829s0§ == param1.§1t2259s0§)
         {
            if(this.§1t7828s0§ == param1.xpos - 1 && _loc2_.§1t7997s0§()[2] == 1)
            {
               return true;
            }
            if(this.§1t7828s0§ == param1.xpos + 1 && _loc2_.§1t7997s0§()[3] == 1)
            {
               return true;
            }
         }
         else if(this.§1t7828s0§ == param1.xpos)
         {
            if(this.§1t7829s0§ == param1.§1t2259s0§ - 1 && _loc2_.§1t7997s0§()[1] == 1)
            {
               return true;
            }
            if(this.§1t7829s0§ == param1.§1t2259s0§ + 1 && _loc2_.§1t7997s0§()[0] == 1)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function §1t7844s0§(param1:§1t416s0§) : Boolean
      {
         var _loc2_:§1t415s0§ = this.§1t7806s0§[param1.xpos][param1.§1t2259s0§];
         if(_loc2_.§1t1300s0§())
         {
            return true;
         }
         if(_loc2_.§1t1298s0§())
         {
            return true;
         }
         return false;
      }
      
      internal function §1t7845s0§() : *
      {
         var _loc1_:§1t416s0§ = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.wt)
         {
            _loc3_ = 0;
            while(_loc3_ < this.ht)
            {
               _loc1_ = this.§1t7805s0§[_loc2_][_loc3_];
               if(_loc1_ != null)
               {
                  _loc1_.§1t7771s0§(this.§1t7841s0§(_loc1_));
               }
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      internal function §1t7846s0§(param1:MouseEvent) : *
      {
         var _loc2_:§1t416s0§ = param1.target.parent as §1t416s0§;
         if(!this.§1t7841s0§(_loc2_))
         {
            this.§1t7848s0§(param1);
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t7807s0§ != null)
         {
            this.§1t7807s0§.§1t7772s0§(false);
         }
         this.§1t7807s0§ = param1.target.parent as §1t416s0§;
         this.§1t7807s0§.§1t7772s0§(true);
         this.selectsectorlabel.text = §1t1521s0§.getString(314) + "(" + this.§1t7807s0§.xpos.toString() + "," + this.§1t7807s0§.§1t2259s0§.toString() + ")\n";
         this.sectorDesc.§1t6784s0§(§1t1521s0§.getString(319) + " (" + this.§1t7807s0§.xpos.toString() + "," + this.§1t7807s0§.§1t2259s0§.toString() + ")\n");
         this.actionslabel.visible = true;
         this.§1t6816s0§();
         this.hexarrow.visible = true;
         this.hexarrow.gotoAndStop(1);
         this.hexarrow.x = 90 + this.§1t7828s0§ * 55;
         this.hexarrow.y = 92 + this.§1t7829s0§ * 55;
         if(this.§1t7827s0§ != this.mapid)
         {
            this.hexarrow.x = 90 + this.§1t7807s0§.xpos * 55;
            this.hexarrow.y = 92 + this.§1t7807s0§.§1t2259s0§ * 55;
            this.hexarrow.rotation = 180;
            this.hexarrow.y -= 55;
         }
         else if(this.§1t7807s0§.xpos == this.§1t7828s0§ && this.§1t7807s0§.§1t2259s0§ == this.§1t7829s0§)
         {
            this.hexarrow.gotoAndStop(2);
            this.hexarrow.rotation = 0;
         }
         else if(this.§1t7807s0§.xpos == this.§1t7828s0§ + 1 && this.§1t7807s0§.§1t2259s0§ == this.§1t7829s0§ && this.§1t7843s0§(this.§1t7807s0§))
         {
            this.hexarrow.rotation = 90;
         }
         else if(this.§1t7807s0§.xpos == this.§1t7828s0§ - 1 && this.§1t7807s0§.§1t2259s0§ == this.§1t7829s0§ && this.§1t7843s0§(this.§1t7807s0§))
         {
            this.hexarrow.rotation = -90;
         }
         else if(this.§1t7807s0§.xpos == this.§1t7828s0§ && this.§1t7807s0§.§1t2259s0§ == this.§1t7829s0§ - 1 && this.§1t7843s0§(this.§1t7807s0§))
         {
            this.hexarrow.rotation = 0;
         }
         else if(this.§1t7807s0§.xpos == this.§1t7828s0§ && this.§1t7807s0§.§1t2259s0§ == this.§1t7829s0§ + 1 && this.§1t7843s0§(this.§1t7807s0§))
         {
            this.hexarrow.rotation = 180;
         }
         else
         {
            this.hexarrow.x = 90 + this.§1t7807s0§.xpos * 55;
            this.hexarrow.y = 92 + this.§1t7807s0§.§1t2259s0§ * 55;
            this.hexarrow.gotoAndStop(2);
            this.hexarrow.rotation = 0;
         }
      }
      
      internal function §1t7847s0§(param1:§1t416s0§) : Boolean
      {
         return param1.hextype == §1t416s0§.§1t12531s0§ && param1.owner == this.§1t7808s0§ && §1t3317s0§.instance.§1t1847s0§() - this.§1t7820s0§ > 3 * 60 * 60;
      }
      
      internal function §1t6816s0§() : *
      {
         var _loc3_:§1t5050s0§ = null;
         this.sectorDesc.visible = true;
         this.msgBoard.visible = false;
         if(!this.§1t7807s0§.hasData)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8024s0§();
            §1t3317s0§.instance.§1t1912s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7812s0§);
            this.sectorDesc.§1t7895s0§("");
         }
         else
         {
            this.sectorDesc.§1t7895s0§(this.§1t7807s0§.§1t514s0§(this.§1t7812s0§,this.§1t7820s0§));
         }
         this.§1t7793s0§.visible = false;
         this.attackbutton.visible = false;
         this.§1t7796s0§.visible = false;
         this.§1t7802s0§.visible = false;
         this.buildbutton.visible = false;
         this.§1t7792s0§.visible = false;
         this.buildmenu.hide();
         var _loc1_:Boolean = false;
         if((this.§1t7807s0§.hextype == §1t416s0§.§1t12524s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12533s0§) && this.§1t7807s0§.§1t3255s0§(this.§1t7812s0§))
         {
            if(§1t1523s0§.§1t9553s0§() >= 9 || _loc1_)
            {
               this.buildbutton.visible = true;
               if(this.§1t7807s0§.hextype == §1t416s0§.§1t12533s0§)
               {
                  if(this.§1t7807s0§.§1t7767s0§() != 0 && this.§1t7807s0§.§1t7767s0§() != this.§1t7836s0§(this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§))
                  {
                     this.buildbutton.visible = false;
                  }
                  else if(this.§1t7836s0§(this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§) != this.§1t7812s0§)
                  {
                     this.buildbutton.visible = false;
                  }
                  else
                  {
                     this.buildbutton.§1t5769s0§(§1t1521s0§.getString(765));
                  }
               }
               else
               {
                  this.buildbutton.§1t5769s0§(§1t1521s0§.getString(575));
               }
            }
         }
         else if((this.§1t7807s0§.hextype == §1t416s0§.§1t12532s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12520s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12525s0§) && this.§1t7807s0§.§1t3255s0§(this.§1t7812s0§))
         {
            if(§1t1523s0§.§1t9553s0§() >= 9 || _loc1_)
            {
               this.buildbutton.visible = true;
               this.buildbutton.§1t5769s0§(§1t1521s0§.getString(576));
            }
         }
         this.§1t7793s0§.visible = this.§1t7807s0§.§1t7780s0§(this.§1t7812s0§) && this.§1t7842s0§(this.§1t7807s0§) && this.§1t7838s0§() && this.§1t7807s0§.hextype != §1t416s0§.§1t12532s0§ && this.§1t7807s0§.hextype != §1t416s0§.§1t12533s0§ && this.§1t7807s0§.hextype != §1t416s0§.§1t12525s0§;
         if(this.§1t7843s0§(this.§1t7807s0§))
         {
            this.§1t7793s0§.§1t5769s0§(§1t1521s0§.getString(311));
         }
         else if(this.§1t7807s0§.§1t7779s0§(this.§1t7812s0§) || this.§1t7807s0§.cost > 0 && this.§1t7807s0§.owner != this.§1t7812s0§)
         {
            this.§1t7793s0§.§1t5769s0§(§1t1521s0§.getString(577));
         }
         else
         {
            this.§1t7793s0§.visible = false;
         }
         if(this.§1t1027s0§)
         {
            this.attackbutton.visible = this.§1t7843s0§(this.§1t7807s0§) && this.§1t7807s0§.§1t7781s0§() && this.§1t7842s0§(this.§1t7807s0§) && this.§1t7807s0§.§1t7779s0§(this.§1t7812s0§) && this.§1t7838s0§() && this.§1t7807s0§.hextype != §1t416s0§.§1t12532s0§ && this.§1t7807s0§.hextype != §1t416s0§.§1t12533s0§ && this.§1t7807s0§.hextype != §1t416s0§.§1t12525s0§;
            if(this.§1t7807s0§.owner == this.§1t7812s0§)
            {
               this.attackbutton.§1t5769s0§(§1t1521s0§.getString(366));
            }
            else
            {
               this.attackbutton.§1t5769s0§(§1t1521s0§.getString(312));
            }
            this.§1t7796s0§.visible = (this.§1t7843s0§(this.§1t7807s0§) || this.§1t7807s0§.hextype == §1t416s0§.§1t12520s0§ || (this.§1t7807s0§.hextype == §1t416s0§.§1t12521s0§ || this.§1t7806s0§[this.§1t7807s0§.xpos][this.§1t7807s0§.§1t2259s0§].§1t1318s0§()) && this.§1t7807s0§.cost <= 0) && this.§1t7807s0§.§1t3255s0§(this.§1t7812s0§) && !(this.§1t7807s0§.xpos == this.§1t7828s0§ && this.§1t7807s0§.§1t2259s0§ == this.§1t7829s0§ && this.§1t7827s0§ == this.mapid) && this.§1t7807s0§.hextype != §1t416s0§.§1t12532s0§ && this.§1t7807s0§.hextype != §1t416s0§.§1t12533s0§ && this.§1t7807s0§.hextype != §1t416s0§.§1t12525s0§;
            this.§1t7802s0§.visible = !this.§1t7807s0§.§1t7762s0§ && this.§1t7807s0§.owner != this.§1t7812s0§ && this.§1t7838s0§();
            if(!this.buildbutton.visible)
            {
               this.buildbutton.visible = this.§1t7827s0§ == this.mapid && this.§1t7807s0§.xpos == this.§1t7828s0§ && this.§1t7807s0§.§1t2259s0§ == this.§1t7829s0§ && this.§1t7838s0§() && (this.§1t7807s0§.hextype == §1t416s0§.§1t12519s0§ && §1t1523s0§.§1t9553s0§() >= 6 || (this.§1t7807s0§.hextype == §1t416s0§.§1t12528s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12524s0§) && §1t1523s0§.§1t9553s0§() >= 9 || this.§1t7807s0§.cost > 0);
               if(this.§1t7807s0§.cost > 0)
               {
                  this.buildbutton.§1t5769s0§(§1t1521s0§.getString(422));
               }
               else
               {
                  this.buildbutton.§1t5769s0§(§1t1521s0§.getString(792));
               }
            }
            if(this.§1t7807s0§.hextype == §1t416s0§.§1t12531s0§ && this.§1t7807s0§.owner == this.§1t7808s0§ && this.§1t7842s0§(this.§1t7807s0§) && this.§1t7843s0§(this.§1t7807s0§) && this.§1t7807s0§.§1t7760s0§)
            {
               this.buildbutton.visible = §1t3317s0§.instance.§1t1847s0§() - this.§1t7820s0§ > 2.5 * 60 * 60;
               if(this.§1t7812s0§ == this.§1t7808s0§)
               {
                  this.buildbutton.§1t5769s0§(§1t1521s0§.getString(793));
               }
               else
               {
                  this.buildbutton.§1t5769s0§(§1t1521s0§.getString(794));
               }
               if(this.§1t7812s0§ != this.§1t7807s0§.owner && §1t3317s0§.instance.§1t1847s0§() - this.§1t7820s0§ > 3 * 60 * 60)
               {
                  this.§1t7793s0§.visible = false;
                  this.attackbutton.visible = false;
               }
            }
            if(this.§1t7807s0§.§1t7764s0§() == this.§1t7812s0§ && §1t1523s0§.§1t9553s0§() >= 9 && (this.§1t7807s0§.hextype == §1t416s0§.§1t12521s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12527s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12526s0§))
            {
               this.§1t7792s0§.visible = true;
            }
            if(this.§1t7828s0§ != -1 && this.§1t7829s0§ != -1 && this.§1t7805s0§[this.§1t7828s0§][this.§1t7829s0§].hextype == §1t416s0§.§1t12525s0§)
            {
               this.attackbutton.visible = false;
               this.§1t7793s0§.visible = false;
            }
         }
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < 6)
         {
            _loc3_ = this.§1t6823s0§[_loc4_];
            if(_loc3_.visible)
            {
               _loc3_.x = 26 + _loc2_ * 140;
               _loc2_++;
            }
            _loc4_++;
         }
      }
      
      internal function §1t7848s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t7807s0§ != null)
         {
            this.§1t7807s0§.§1t7772s0§(false);
            this.§1t7807s0§ = null;
         }
         this.§1t7793s0§.visible = false;
         this.attackbutton.visible = false;
         this.§1t7796s0§.visible = false;
         this.§1t7802s0§.visible = false;
         this.buildbutton.visible = false;
         this.§1t7792s0§.visible = false;
         this.hexarrow.visible = false;
         this.buildmenu.hide();
         this.selectsectorlabel.text = §1t1521s0§.getString(310);
         this.§1t7865s0§();
      }
      
      internal function §1t7849s0§() : String
      {
         var _loc3_:§1t415s0§ = null;
         var _loc5_:* = undefined;
         var _loc1_:String = "";
         var _loc2_:String = "";
         var _loc4_:* = 0;
         while(_loc4_ < 6)
         {
            _loc5_ = 0;
            while(_loc5_ < 6)
            {
               _loc3_ = this.§1t7806s0§[_loc4_][_loc5_];
               if(_loc3_.§1t1300s0§())
               {
                  _loc2_ += _loc4_ + "-" + _loc5_ + "|";
               }
               else if(_loc3_.§1t1318s0§())
               {
                  _loc1_ = _loc4_ + "-" + _loc5_ + "|";
               }
               _loc5_++;
            }
            _loc4_++;
         }
         _loc2_ = _loc2_.substr(0,_loc2_.length - 1);
         return _loc1_ + _loc2_;
      }
      
      internal function §1t1295s0§() : Boolean
      {
         var _loc1_:§1t415s0§ = null;
         var _loc3_:* = undefined;
         var _loc2_:* = 0;
         while(_loc2_ < 6)
         {
            _loc3_ = 0;
            while(_loc3_ < 6)
            {
               _loc1_ = this.§1t7806s0§[_loc2_][_loc3_];
               if(_loc1_.§1t1318s0§())
               {
                  return true;
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return false;
      }
      
      internal function §1t7850s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1);
            if(this.§1t7843s0§(this.§1t7807s0§))
            {
               _loc2_ = 100 * this.§1t7871s0§();
               §1t3317s0§.instance.§1t1924s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7812s0§,_loc2_);
               this.§1t7831s0§ = false;
               if(§1t1523s0§.§1t9503s0§)
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8024s0§(§1t1521s0§.getString(672));
               }
               else
               {
                  this.§1t7874s0§(0,_loc2_);
               }
            }
            else
            {
               this.§1t7813s0§ = this.§1t7807s0§.§1t7784s0§(this.§1t7812s0§);
               _loc3_ = 80 + Math.random() * 40 * this.§1t7871s0§();
               this.numbertext.text = "-" + _loc3_.toString();
               if(this.§1t7813s0§ == 1)
               {
                  this.numbertext.textColor = 16711680;
               }
               else if(this.§1t7813s0§ == 2)
               {
                  this.numbertext.textColor = 39168;
               }
               else if(this.§1t7813s0§ == 3)
               {
                  this.numbertext.textColor = 26367;
               }
               else if(this.§1t7813s0§ == 4)
               {
                  this.numbertext.textColor = 16776960;
               }
               else if(§1t1523s0§.§1t9663s0§(this.§1t7813s0§))
               {
                  this.numbertext.textColor = §1t1523s0§.§1t9661s0§();
               }
               else
               {
                  this.numbertext.textColor = 16777215;
               }
               this.numbertext.x = this.§1t7807s0§.x - this.numbertext.width / 2;
               this.numbertext.y = this.§1t7807s0§.y - this.numbertext.height / 2;
               this.§1t7869s0§();
               §1t3317s0§.instance.§1t1924s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7813s0§,-_loc3_);
               this.§1t7831s0§ = false;
               if(§1t1523s0§.§1t9503s0§)
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8024s0§(§1t1521s0§.getString(673));
               }
               this.§1t7807s0§.§1t7775s0§(this.§1t7813s0§,-_loc3_);
               if(this.§1t7807s0§.cost > 0)
               {
                  §1t3317s0§.instance.§1t1930s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,-_loc3_);
                  this.§1t7807s0§.cost += _loc3_;
               }
               this.§1t6816s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_bowFireMany");
            }
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(715),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      internal function §1t7851s0§(param1:MouseEvent) : *
      {
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0)
         {
            this.§1t7813s0§ = this.§1t7807s0§.§1t7784s0§(this.§1t7812s0§);
            §1t3317s0§.instance.§1t1921s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7813s0§);
            this.§1t7839s0§();
            §1t406s0§.instance.§1t6482s0§.§1t8024s0§();
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(715),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      internal function §1t7852s0§(param1:MouseEvent) : *
      {
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1);
            this.§1t7807s0§.§1t7762s0§ = true;
            this.§1t6816s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_wrScout");
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(715),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      internal function §1t7853s0§(param1:MouseEvent) : *
      {
         var _loc2_:Point = null;
         var _loc3_:§1t71s0§ = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         if(this.§1t7807s0§.hextype == §1t416s0§.§1t12531s0§)
         {
            _loc2_ = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
            _loc3_ = §1t70s0§.instance.§1t1126s0§(_loc2_.x,_loc2_.y,false);
            if(Boolean(§1t1525s0§.§1t7341s0§() > 0) && Boolean(_loc3_.§1t1318s0§(§1t1525s0§.§1t9935s0§())) && _loc3_.§1t1328s0§())
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(795),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return;
            }
            if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0)
            {
               §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1);
               _loc3_ = §1t70s0§.instance.§1t1126s0§(this.mapid >> 12 & 0x0FFF,this.mapid & 0x0FFF,false);
               _loc4_ = §1t1525s0§.§1t9935s0§();
               §1t1523s0§.§1t9712s0§(30021,_loc4_);
               _loc5_ = "";
               switch(_loc3_.§1t1342s0§())
               {
                  case 1:
                     _loc5_ = §1t1521s0§.getString(796) + " ";
                     break;
                  case 2:
                     _loc5_ = §1t1521s0§.getString(797) + " ";
                     break;
                  case 3:
                     _loc5_ = §1t1521s0§.getString(798) + " ";
                     break;
                  case 4:
                     _loc5_ = §1t1521s0§.getString(799) + " ";
               }
               _loc6_ = (this.mapid >> 12 & 0x0FFF) - 341 + §1t7934s0§.§1t12538s0§;
               _loc7_ = (this.mapid & 0x0FFF) - 341 + §1t7934s0§.§1t12539s0§;
               _loc8_ = §1t1523s0§.§1t9765s0§();
               §1t1525s0§.§1t9940s0§().visible = true;
               §1t88s0§.instance.§1t1516s0§("Snd_challenge");
               if(this.§1t7812s0§ == this.§1t7808s0§)
               {
                  §1t1525s0§.§1t9922s0§(40,400,_loc3_.§1t1319s0§());
                  §1t1523s0§.§1t9763s0§(_loc4_);
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(777),§1t1521s0§.getString(5));
                  §1t251s0§.instance.§1t3524s0§("[PvP] ",800,[_loc8_,_loc5_,_loc3_.§1t1276s0§,_loc6_,_loc7_]);
                  this.hide();
               }
               else
               {
                  §1t1525s0§.§1t9922s0§(7,530,_loc3_.§1t1319s0§());
                  §1t1523s0§.§1t9763s0§(_loc4_);
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(778),§1t1521s0§.getString(5));
                  if(this.§1t7808s0§ != 0)
                  {
                     §1t251s0§.instance.§1t3524s0§("[PvP] ",801,[_loc8_,_loc5_,_loc3_.§1t1276s0§,_loc6_,_loc7_]);
                  }
                  this.hide();
               }
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(715),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            }
            return;
         }
         if(this.§1t7807s0§.hextype == §1t416s0§.§1t12524s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12533s0§)
         {
            if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0)
            {
               this.§1t7831s0§ = false;
               §1t3317s0§.instance.§1t1970s0§(this.mapid,this.§1t7812s0§,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7849s0§(),this.§1t1295s0§());
               this.buildbutton.visible = false;
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(715),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            }
         }
         else if((this.§1t7807s0§.hextype == §1t416s0§.§1t12520s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12525s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12532s0§) && this.§1t7807s0§.§1t3255s0§(this.§1t7812s0§))
         {
            if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0)
            {
               §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1);
               this.§1t7831s0§ = false;
               if(§1t1523s0§.§1t9503s0§)
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8024s0§(§1t1521s0§.getString(592));
               }
               §1t3317s0§.instance.§1t1973s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§);
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(715),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            }
         }
         else if(this.§1t7807s0§.cost != 0)
         {
            _loc9_ = 500;
            if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0 && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9412s0§) >= _loc9_)
            {
               §1t88s0§.instance.§1t1516s0§("Snd_click");
               this.§1t7807s0§.cost -= _loc9_;
               this.§1t7831s0§ = false;
               if(§1t1523s0§.§1t9503s0§)
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8024s0§(§1t1521s0§.getString(675));
               }
               §1t3317s0§.instance.§1t1930s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,_loc9_);
               §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9412s0§,-_loc9_);
               this.§1t6816s0§();
               §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1,_loc9_);
               if(this.§1t7807s0§.cost <= 0)
               {
                  this.§1t7807s0§.cost = 0;
                  this.§1t7807s0§.§1t7770s0§(this.§1t7807s0§.hextype);
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(582),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  if(!§1t1523s0§.§1t9503s0§ && this.§1t7807s0§.hextype == §1t416s0§.§1t12523s0§)
                  {
                     §1t3317s0§.instance.§1t1964s0§(this.mapid >> 12 & 0x0FFF,this.mapid & 0x0FFF);
                  }
                  §1t88s0§.instance.§1t1516s0§("Snd_wrAttack");
               }
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(583),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            }
         }
         else
         {
            this.buildmenu.show(this.§1t7807s0§);
         }
      }
      
      public function §1t7854s0§(param1:MouseEvent) : *
      {
         §1t406s0§.instance.§1t6482s0§.§1t6014s0§.show(§1t1521s0§.getString(11162),this.§1t7855s0§);
      }
      
      public function §1t7855s0§() : *
      {
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1);
            this.§1t7831s0§ = false;
            if(§1t1523s0§.§1t9503s0§)
            {
               §1t406s0§.instance.§1t6482s0§.§1t8024s0§(§1t1521s0§.getString(708) + "...");
            }
            §1t251s0§.instance.§1t3549s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§);
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(715),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      public function §1t1927s0§(param1:int) : *
      {
         var _loc2_:int = 500;
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0 && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9412s0§) >= _loc2_)
         {
            this.§1t7856s0§ = param1;
            §1t3317s0§.instance.§1t1927s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7807s0§.hextype);
            §1t406s0§.instance.§1t6482s0§.§1t8024s0§();
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(583),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      public function §1t7857s0§(param1:int) : *
      {
         var _loc4_:Boolean = false;
         var _loc5_:String = null;
         var _loc2_:int = 500;
         var _loc3_:String = "";
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0 && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9412s0§) >= _loc2_)
         {
            if(param1 == §1t416s0§.§1t12521s0§)
            {
               this.§1t7807s0§.cost = 10000;
               this.§1t7807s0§.§1t7770s0§(param1);
               §1t3317s0§.instance.§1t1927s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7807s0§.hextype);
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(578),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_mining");
               _loc3_ = §1t1521s0§.getString(11142,["(" + this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + ")"]);
            }
            else if(param1 == §1t416s0§.§1t12526s0§)
            {
               this.§1t7807s0§.cost = 5000;
               this.§1t7807s0§.§1t7770s0§(param1);
               §1t3317s0§.instance.§1t1927s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7807s0§.hextype);
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(579),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_mining");
               _loc3_ = §1t1521s0§.getString(11143,["(" + this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + ")"]);
            }
            else if(param1 == §1t416s0§.§1t12527s0§)
            {
               this.§1t7807s0§.cost = 10000;
               this.§1t7807s0§.§1t7770s0§(param1);
               §1t3317s0§.instance.§1t1927s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7807s0§.hextype);
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(580),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_mining");
               _loc3_ = §1t1521s0§.getString(11144,["(" + this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + ")"]);
            }
            else if(param1 == §1t416s0§.§1t12523s0§)
            {
               this.§1t7807s0§.cost = 10000;
               this.§1t7807s0§.§1t7770s0§(param1);
               §1t3317s0§.instance.§1t1927s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7807s0§.hextype);
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(581),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_mining");
               _loc3_ = §1t1521s0§.getString(581);
            }
            else
            {
               this.§1t7807s0§.cost -= _loc2_;
               §1t3317s0§.instance.§1t1930s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,_loc2_);
            }
            _loc4_ = true;
            if(_loc3_ != "" && _loc4_)
            {
               _loc5_ = "<font color=\'#333333\'>";
               if(this.§1t7812s0§ == 1)
               {
                  _loc5_ = "<font color=\'#990000\'>";
               }
               else if(this.§1t7812s0§ == 2)
               {
                  _loc5_ = "<font color=\'#006600\'>";
               }
               else if(this.§1t7812s0§ == 3)
               {
                  _loc5_ = "<font color=\'#000099\'>";
               }
               else if(this.§1t7812s0§ == 4)
               {
                  _loc5_ = "<font color=\'#85762E\'>";
               }
               else if(§1t1523s0§.§1t9663s0§(this.§1t7812s0§))
               {
                  _loc5_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
               }
               this.msgBoard.msgtext.htmlText += _loc5_ + §1t1523s0§.charname + ": </font><font color=\'#333333\'>" + _loc3_ + "</font><br>";
               §1t3317s0§.instance.§1t1909s0§(this.mapid,this.§1t7812s0§,this.§1t7812s0§,§1t1523s0§.charname,_loc3_);
            }
            if(this.§1t7807s0§.cost <= 0)
            {
               this.§1t7807s0§.cost = 0;
               this.§1t7807s0§.§1t7770s0§(this.§1t7807s0§.hextype);
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(582),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_wrAttack");
            }
            §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9412s0§,-_loc2_);
            this.§1t6816s0§();
            §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1,_loc2_);
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(583),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      public function §1t7858s0§(param1:String) : *
      {
         var _loc2_:Array = null;
         var _loc3_:§1t76s0§ = null;
         var _loc12_:int = 0;
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9423s0§,-1);
         §1t1523s0§.§1t9552s0§();
         §1t3317s0§.instance.§1t1946s0§();
         §1t1524s0§.§1t9881s0§();
         var _loc4_:Array = param1.split(String.fromCharCode(30));
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(_loc4_[_loc5_] != "")
            {
               _loc2_ = _loc4_[_loc5_].split(String.fromCharCode(31));
               _loc3_ = new §1t76s0§(null);
               if(_loc2_[4] == null)
               {
                  §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§("WarHexUI.startBattle: eqString null " + §1t1523s0§.charname + " " + _loc2_[1],"","",null);
               }
               _loc3_.§1t1248s0§(_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],1,_loc2_[0],false,-1);
               _loc3_.id = 700 + _loc5_;
               §1t1524s0§.§1t9876s0§(_loc3_);
            }
            _loc5_++;
         }
         §1t1525s0§.§1t9940s0§().visible = true;
         §1t406s0§.instance.§1t6482s0§.loading.visible = false;
         §1t251s0§.§1t9190s0§().§1t3521s0§();
         var _loc6_:Vector.<§1t116s0§> = this.§1t7863s0§(this.§1t7813s0§);
         §1t6427s0§.§1t12474s0§(-1);
         var _loc7_:int = (this.mapid >> 12 & 0x0FFF) * 6;
         var _loc8_:int = (this.mapid & 0x0FFF) * 6;
         var _loc9_:int = _loc7_ + this.§1t7807s0§.xpos << 12 | _loc8_ + this.§1t7807s0§.§1t2259s0§;
         var _loc10_:§1t58s0§ = §1t58s0§.§1t8804s0§(_loc9_);
         var _loc11_:int = 0;
         var _loc13_:Array = [new §1t134s0§(null)];
         if(this.§1t7807s0§.hextype == §1t416s0§.§1t12528s0§)
         {
            _loc11_ = §1t112s0§.§1t12570s0§;
         }
         else if(this.§1t7807s0§.hextype == §1t416s0§.§1t12523s0§)
         {
            _loc11_ = §1t112s0§.§1t12571s0§;
         }
         else if(this.§1t7807s0§.hextype == §1t416s0§.§1t12530s0§)
         {
            _loc11_ = §1t112s0§.§1t12572s0§;
         }
         else if(this.§1t7807s0§.hextype == §1t416s0§.§1t12531s0§)
         {
            _loc12_ = _loc10_.rand(5);
            if(_loc12_ == 0)
            {
               _loc11_ = §1t112s0§.§1t12550s0§;
            }
            else if(_loc12_ == 1)
            {
               _loc11_ = §1t112s0§.§1t12592s0§;
            }
            else if(_loc12_ == 2)
            {
               _loc11_ = §1t112s0§.§1t12588s0§;
            }
            else if(_loc12_ == 3)
            {
               _loc11_ = §1t112s0§.§1t12601s0§;
            }
            else if(_loc12_ == 4)
            {
               _loc11_ = §1t112s0§.§1t12600s0§;
            }
         }
         else if(this.§1t7807s0§.hextype == §1t416s0§.§1t12521s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12520s0§)
         {
            _loc12_ = _loc10_.rand(4);
            if(_loc12_ == 0)
            {
               _loc11_ = §1t112s0§.§1t12593s0§;
            }
            else if(_loc12_ == 1)
            {
               _loc11_ = §1t112s0§.§1t12594s0§;
            }
            else if(_loc12_ == 2)
            {
               _loc11_ = §1t112s0§.§1t12581s0§;
            }
            else if(_loc12_ == 3)
            {
               _loc11_ = §1t112s0§.§1t12573s0§;
            }
            if(§1t1523s0§.§1t9663s0§(this.§1t7807s0§.§1t7764s0§()))
            {
               if(this.§1t7807s0§.§1t7764s0§() == this.§1t7812s0§)
               {
                  _loc13_[0].bgParam = 9;
               }
               else
               {
                  _loc13_[0].bgParam = 5;
               }
            }
            else
            {
               _loc13_[0].bgParam = this.§1t7807s0§.§1t7764s0§();
            }
         }
         else
         {
            _loc11_ = §1t70s0§.instance.§1t1151s0§(_loc9_);
         }
         §1t1540s0§.§1t10052s0§(-1,10,_loc11_,1000,0,_loc6_,400,_loc13_);
         this.numbertext.x = this.§1t7807s0§.x - this.numbertext.width / 2;
         this.numbertext.y = this.§1t7807s0§.y - this.numbertext.height / 2;
         _loc10_.destroy();
      }
      
      public function §1t7859s0§(param1:Array) : *
      {
         var _loc2_:§1t76s0§ = null;
         var _loc3_:§1t23s0§ = null;
         var _loc11_:int = 0;
         var _loc13_:int = 0;
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9423s0§,-1);
         §1t1523s0§.§1t9552s0§();
         §1t3317s0§.instance.§1t1946s0§();
         §1t1524s0§.§1t9881s0§();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = param1[_loc4_];
            _loc2_ = new §1t76s0§(null);
            if(_loc3_.equipment == null)
            {
               §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§("WarHexUI.startBattlePIO: eqString null " + §1t1523s0§.charname + " " + _loc3_.key,"","",null);
            }
            _loc2_.§1t1248s0§(_loc3_.key,_loc3_.playerlevel,_loc3_.battlestats,_loc3_.equipment,_loc3_.skillstats,1,_loc3_.key,false,-1);
            _loc2_.id = 700 + _loc4_;
            §1t1524s0§.§1t9876s0§(_loc2_);
            _loc4_++;
         }
         §1t1525s0§.§1t9940s0§().visible = true;
         §1t406s0§.instance.§1t6482s0§.loading.visible = false;
         §1t251s0§.§1t9190s0§().§1t3521s0§();
         var _loc5_:Vector.<§1t116s0§> = this.§1t7863s0§(this.§1t7813s0§);
         §1t6427s0§.§1t12474s0§(-1);
         var _loc6_:int = (this.mapid >> 12 & 0x0FFF) * 6;
         var _loc7_:int = (this.mapid & 0x0FFF) * 6;
         var _loc8_:int = _loc6_ + this.§1t7807s0§.xpos << 12 | _loc7_ + this.§1t7807s0§.§1t2259s0§;
         var _loc9_:§1t58s0§ = §1t58s0§.§1t8804s0§(_loc8_);
         var _loc10_:int = 0;
         var _loc12_:Array = [new §1t134s0§(null)];
         if(this.§1t7807s0§.hextype == §1t416s0§.§1t12528s0§)
         {
            _loc10_ = §1t112s0§.§1t12570s0§;
         }
         else if(this.§1t7807s0§.hextype == §1t416s0§.§1t12523s0§)
         {
            _loc10_ = §1t112s0§.§1t12571s0§;
         }
         else if(this.§1t7807s0§.hextype == §1t416s0§.§1t12530s0§)
         {
            _loc10_ = §1t112s0§.§1t12572s0§;
         }
         else if(this.§1t7807s0§.hextype == §1t416s0§.§1t12531s0§)
         {
            _loc11_ = _loc9_.rand(5);
            if(_loc11_ == 0)
            {
               _loc10_ = §1t112s0§.§1t12550s0§;
            }
            else if(_loc11_ == 1)
            {
               _loc10_ = §1t112s0§.§1t12592s0§;
            }
            else if(_loc11_ == 2)
            {
               _loc10_ = §1t112s0§.§1t12588s0§;
            }
            else if(_loc11_ == 3)
            {
               _loc10_ = §1t112s0§.§1t12601s0§;
            }
            else if(_loc11_ == 4)
            {
               _loc10_ = §1t112s0§.§1t12600s0§;
            }
         }
         else if(this.§1t7807s0§.hextype == §1t416s0§.§1t12521s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12520s0§)
         {
            _loc11_ = _loc9_.rand(4);
            if(_loc11_ == 0)
            {
               _loc10_ = §1t112s0§.§1t12593s0§;
            }
            else if(_loc11_ == 1)
            {
               _loc10_ = §1t112s0§.§1t12594s0§;
            }
            else if(_loc11_ == 2)
            {
               _loc10_ = §1t112s0§.§1t12581s0§;
            }
            else if(_loc11_ == 3)
            {
               _loc10_ = §1t112s0§.§1t12573s0§;
            }
            _loc12_[0].bgParam = this.§1t7807s0§.§1t7764s0§();
         }
         else
         {
            _loc10_ = §1t70s0§.instance.§1t1151s0§(_loc8_);
         }
         var _loc14_:int = 2000;
         if(this.§1t7828s0§ < this.§1t7807s0§.xpos || this.§1t7829s0§ > this.§1t7807s0§.§1t2259s0§)
         {
            _loc13_ = 150;
         }
         else if(this.§1t7828s0§ > this.§1t7807s0§.xpos || this.§1t7829s0§ < this.§1t7807s0§.§1t2259s0§)
         {
            _loc13_ = _loc14_ - 150;
         }
         else
         {
            _loc13_ = Math.random() * (_loc14_ - 300) + 150;
         }
         §1t1540s0§.§1t10052s0§(-1,§1t1540s0§.§1t10005s0§,_loc10_,_loc14_,500,_loc5_,_loc13_,_loc12_);
         this.numbertext.x = this.§1t7807s0§.x - this.numbertext.width / 2;
         this.numbertext.y = this.§1t7807s0§.y - this.numbertext.height / 2;
         _loc9_.destroy();
         §1t113s0§.instance.§1t5179s0§.visible = false;
         §1t251s0§.§1t9190s0§().§1t3520s0§(0,0,§1t134s0§.§1t9234s0§,_loc13_,"wr_" + _loc8_);
         §1t1525s0§.§1t9951s0§();
         §1t1523s0§.§1t9586s0§().§1t4444s0§();
      }
      
      public function §1t7860s0§(param1:String, param2:int) : String
      {
         var _loc3_:String = "<font color=\'#333333\'>";
         if(this.§1t7812s0§ == 1)
         {
            _loc3_ = "<font color=\'#990000\'>";
         }
         else if(this.§1t7812s0§ == 2)
         {
            _loc3_ = "<font color=\'#006600\'>";
         }
         else if(this.§1t7812s0§ == 3)
         {
            _loc3_ = "<font color=\'#000099\'>";
         }
         else if(this.§1t7812s0§ == 4)
         {
            _loc3_ = "<font color=\'#85762E\'>";
         }
         else if(§1t1523s0§.§1t9663s0§(this.§1t7812s0§))
         {
            _loc3_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
         }
         var _loc4_:String = "<font color=\'#333333\'>";
         if(this.§1t7813s0§ == 1)
         {
            _loc4_ = "<font color=\'#990000\'>";
         }
         else if(this.§1t7813s0§ == 2)
         {
            _loc4_ = "<font color=\'#006600\'>";
         }
         else if(this.§1t7813s0§ == 3)
         {
            _loc4_ = "<font color=\'#000099\'>";
         }
         else if(this.§1t7813s0§ == 4)
         {
            _loc4_ = "<font color=\'#85762E\'>";
         }
         else if(§1t1523s0§.§1t9663s0§(this.§1t7813s0§))
         {
            _loc4_ = "<font color=\'" + §1t1523s0§.§1t9662s0§() + "\'>";
         }
         this.messages += "(" + this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + "): " + _loc3_ + §1t1523s0§.charname + "(" + §1t1523s0§.getLevel().toString() + ")</font>" + "<font color=\'#333333\'>" + §1t1521s0§.getString(354) + "</font>" + _loc4_ + param1 + "(" + param2.toString() + ")</font><br>";
         return this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + "," + §1t1523s0§.charname + "(" + §1t1523s0§.getLevel().toString() + ")" + "," + param1 + "(" + param2.toString() + ")" + "," + this.§1t7812s0§ + "," + this.§1t7813s0§;
      }
      
      public function §1t7861s0§(param1:int) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_wrAttack");
         this.§1t7840s0§();
         this.numbertext.text = "-" + param1.toString();
         if(this.§1t7813s0§ == 1)
         {
            this.numbertext.textColor = 16711680;
         }
         else if(this.§1t7813s0§ == 2)
         {
            this.numbertext.textColor = 39168;
         }
         else if(this.§1t7813s0§ == 3)
         {
            this.numbertext.textColor = 26367;
         }
         else if(this.§1t7813s0§ == 4)
         {
            this.numbertext.textColor = 16776960;
         }
         else
         {
            this.numbertext.textColor = 16777215;
         }
         this.§1t7869s0§();
         §1t3317s0§.instance.§1t1924s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,this.§1t7813s0§,-param1);
         this.§1t7807s0§.§1t7775s0§(this.§1t7813s0§,-param1);
         this.§1t6816s0§();
         var _loc2_:int = int(this.§1t7819s0§.length);
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(§1t1523s0§.§1t9503s0§)
            {
               if(_loc4_ == 0)
               {
                  _loc3_ = this.§1t7819s0§[_loc4_];
               }
               else
               {
                  _loc3_ += "," + this.§1t7819s0§[_loc4_];
               }
            }
            else
            {
               §1t3317s0§.instance.§1t1918s0§(this.mapid,this.§1t7819s0§[_loc4_]);
            }
            _loc4_++;
         }
         if(§1t1523s0§.§1t9503s0§ && _loc3_ != "")
         {
            §1t251s0§.instance.§1t1918s0§(this.mapid,_loc3_);
         }
         this.§1t7819s0§.length = 0;
      }
      
      public function §1t7862s0§(param1:String) : *
      {
         this.§1t7819s0§.push(param1);
      }
      
      internal function §1t7863s0§(param1:int) : Vector.<§1t116s0§>
      {
         var _loc3_:§1t116s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:XML = XML(new §1t12534s0§());
         var _loc4_:int = _loc2_.wave.length();
         var _loc5_:Vector.<§1t116s0§> = new Vector.<§1t116s0§>();
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc3_ = new §1t116s0§(_loc2_.wave[_loc8_]);
            _loc9_ = 0;
            while(_loc9_ < _loc3_.enemy.length())
            {
               _loc7_ = _loc3_.enemy[_loc9_].id.split("|");
               _loc10_ = 0;
               while(_loc10_ < _loc7_.length)
               {
                  if(_loc7_[_loc10_] != "")
                  {
                     _loc6_ = int(_loc7_[_loc10_]);
                     if(_loc6_ >= 200 && _loc6_ < 600)
                     {
                        _loc11_ = _loc6_ % 100;
                        if(param1 == 1)
                        {
                           _loc7_[_loc10_] = _loc11_ + 200;
                        }
                        else if(param1 == 2)
                        {
                           _loc7_[_loc10_] = _loc11_ + 400;
                        }
                        else if(param1 == 3)
                        {
                           _loc7_[_loc10_] = _loc11_ + 300;
                        }
                        else if(param1 == 4)
                        {
                           _loc7_[_loc10_] = _loc11_ + 500;
                        }
                        else if(param1 == 0 || param1 == 5 || §1t1523s0§.§1t9663s0§(param1))
                        {
                           _loc7_[_loc10_] = _loc11_ + 600;
                        }
                     }
                  }
                  _loc10_++;
               }
               _loc3_.enemy[_loc9_].id = _loc7_.join("|");
               _loc9_++;
            }
            _loc5_.push(_loc3_);
            _loc8_++;
         }
         return _loc5_;
      }
      
      internal function §1t7864s0§(param1:MouseEvent) : *
      {
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9423s0§) > 0)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1);
            §1t3317s0§.instance.§1t1915s0§(this.mapid,this.§1t7812s0§,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§,§1t1523s0§.charname);
            this.§1t7815s0§.x = this.§1t7807s0§.x;
            this.§1t7815s0§.y = this.§1t7807s0§.y + 17;
            §1t406s0§.instance.§1t6482s0§.§1t7837s0§(this.mapid,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§);
            if(this.§1t7807s0§.xpos + 1 > this.wt / 2)
            {
               this.§1t7815s0§.scaleX = -0.5;
            }
            else
            {
               this.§1t7815s0§.scaleX = 0.5;
            }
            this.§1t7815s0§.visible = true;
            this.§1t7845s0§();
            this.§1t7848s0§(null);
            this.§1t7831s0§ = false;
            if(§1t1523s0§.§1t9503s0§)
            {
               §1t406s0§.instance.§1t6482s0§.§1t8024s0§(§1t1521s0§.getString(704));
            }
            §1t88s0§.instance.§1t1516s0§("Snd_wrMove");
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(715),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      internal function §1t7865s0§() : *
      {
         this.msgBoard.visible = true;
         this.sectorDesc.visible = false;
         this.actionslabel.visible = false;
      }
      
      public function §1t7866s0§(param1:String, param2:String) : *
      {
         this.§1t7807s0§.§1t7783s0§(param1);
         this.§1t7807s0§.§1t7782s0§(param2);
         this.§1t7807s0§.hasData = true;
         §1t406s0§.instance.§1t6482s0§.loading.visible = false;
         this.§1t6816s0§();
      }
      
      public function §1t7867s0§(param1:String) : *
      {
         §1t406s0§.instance.§1t6482s0§.loading.visible = false;
         if(this.§1t7807s0§ != null)
         {
            this.§1t7807s0§.§1t7782s0§(param1);
            this.§1t7807s0§.hasData = true;
            this.§1t6816s0§();
         }
      }
      
      internal function §1t7868s0§() : *
      {
         this.§1t7818s0§ = 60;
         this.§1t7816s0§.visible = true;
      }
      
      internal function §1t7869s0§() : *
      {
         this.§1t7818s0§ = 48;
         this.§1t7816s0§.visible = false;
         this.numbertext.visible = true;
         this.numbertext.alpha = 0;
      }
      
      public function §1t3268s0§(param1:int) : *
      {
         if(!visible || !§1t406s0§.instance.§1t6482s0§.visible)
         {
            return;
         }
         if(this.§1t7818s0§ > 48)
         {
            this.§1t7816s0§.update();
            --this.§1t7818s0§;
            if(this.§1t7818s0§ == 48)
            {
               this.§1t7816s0§.visible = false;
               this.numbertext.visible = true;
               this.numbertext.alpha = 0;
            }
         }
         else if(this.§1t7818s0§ > 0)
         {
            this.numbertext.alpha = 1 - Math.abs(this.§1t7818s0§ - 24) / 24;
            --this.§1t7818s0§;
            if(this.§1t7818s0§ == 0)
            {
               this.numbertext.visible = false;
            }
         }
      }
      
      public function §1t7870s0§(param1:int) : *
      {
         if(this.§1t7811s0§ == 0)
         {
            return;
         }
         var _loc2_:int = this.§1t7811s0§ - param1;
         if(_loc2_ > 5 * 60)
         {
            if(!this.§1t1027s0§)
            {
               if(this.§1t7823s0§)
               {
                  this.dayendslabel.text = §1t1521s0§.getString(584);
               }
               else if(this.§1t7808s0§ == 0)
               {
                  this.dayendslabel.text = §1t1521s0§.getString(585);
               }
               else
               {
                  this.dayendslabel.text = §1t1521s0§.getString(586);
               }
            }
            else if(this.§1t7822s0§ == §1t418s0§.§1t8818s0§)
            {
               this.dayendslabel.text = §1t1521s0§.getString(587) + " " + this.§1t937s0§(_loc2_ - 5 * 60);
            }
            else if(this.§1t7822s0§ == §1t418s0§.§1t8819s0§)
            {
               this.dayendslabel.text = "Troops leaving in" + " " + this.§1t937s0§(_loc2_ - 5 * 60);
            }
            else
            {
               this.dayendslabel.text = §1t1521s0§.getString(353) + this.§1t937s0§(_loc2_ - 5 * 60);
            }
         }
         else if(_loc2_ > 0)
         {
            this.troopsloading.visible = true;
            if(this.§1t7822s0§ == §1t418s0§.§1t8818s0§)
            {
               this.troopsloading.prompttext.text = §1t1521s0§.getString(587) + ": " + this.§1t937s0§(_loc2_);
            }
            if(this.§1t7822s0§ == §1t418s0§.§1t8819s0§)
            {
               this.troopsloading.prompttext.text = "Troops leaving in" + ": " + this.§1t937s0§(_loc2_);
            }
            else
            {
               this.troopsloading.prompttext.text = §1t1521s0§.getString(355) + ": " + this.§1t937s0§(_loc2_);
            }
            this.dayendslabel.text = "";
         }
         else if(_loc2_ <= 0)
         {
            this.troopsloading.visible = false;
            if(!this.§1t7830s0§)
            {
               this.hide();
               §1t406s0§.instance.§1t6482s0§.§1t7176s0§();
               this.§1t7830s0§ = true;
               §1t406s0§.instance.§1t6482s0§.§1t8010s0§();
            }
         }
         if(this.§1t1027s0§ && this.§1t7807s0§ != null && this.§1t7807s0§.hextype == §1t416s0§.§1t12531s0§ && this.§1t7807s0§.owner == this.§1t7808s0§ && this.§1t7807s0§.§1t7760s0§ && §1t3317s0§.instance.§1t1847s0§() - this.§1t7820s0§ <= 3 * 60 * 60)
         {
            this.sectorDesc.§1t7463s0§.text = this.§1t7807s0§.§1t514s0§(this.§1t7812s0§,this.§1t7820s0§);
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
      
      internal function §1t7871s0§() : Number
      {
         var _loc1_:int = this.§1t7872s0§(this.§1t7828s0§,this.§1t7829s0§);
         var _loc2_:int = this.§1t7872s0§(this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§);
         if(this.§1t7807s0§.hextype == §1t416s0§.§1t12527s0§ && this.§1t7807s0§.cost == 0 && this.§1t7807s0§.owner != this.§1t7812s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12530s0§ || this.§1t7807s0§.hextype == §1t416s0§.§1t12531s0§)
         {
            _loc2_ += 2;
         }
         switch(_loc1_ - _loc2_)
         {
            case 2:
               return 1.5;
            case 1:
               return 1.2;
            case 0:
               return 1;
            case -1:
               return 0.75;
            case -2:
               return 0.6;
            case -3:
               return 0.5;
            case -4:
               return 0.25;
            default:
               return 1;
         }
      }
      
      internal function §1t7872s0§(param1:int, param2:int) : int
      {
         if(param1 < 0 || param2 < 0 || param1 > 5 || param2 > 5)
         {
            return 0;
         }
         return this.§1t7806s0§[param1][param2].§1t7872s0§();
      }
      
      public function §1t7873s0§(param1:int) : *
      {
         this.§1t7831s0§ = true;
         §1t406s0§.instance.§1t6482s0§.§1t8025s0§();
         if(param1 == 4)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11096),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else if(this.§1t7856s0§ != -1)
         {
            this.§1t7857s0§(this.§1t7856s0§);
            this.§1t7856s0§ = -1;
         }
      }
      
      public function §1t7874s0§(param1:int, param2:int) : *
      {
         var _loc3_:int = 0;
         this.§1t7831s0§ = true;
         §1t406s0§.instance.§1t6482s0§.§1t8025s0§();
         if(param2 > 0 && this.§1t7807s0§ != null)
         {
            _loc3_ = this.§1t7807s0§.§1t7776s0§(this.§1t7812s0§) + param2;
            if(_loc3_ > 50000)
            {
               _loc3_ = 50000;
            }
            this.§1t7807s0§.§1t7774s0§(this.§1t7812s0§,_loc3_);
            this.§1t6816s0§();
            this.§1t7816s0§.x = this.§1t7807s0§.x;
            this.§1t7816s0§.y = this.§1t7807s0§.y + 17;
            this.§1t7816s0§.setDirection(this.hexarrow.rotation);
            if(this.§1t7816s0§.x < this.§1t7815s0§.x)
            {
               this.§1t7816s0§.§1t5492s0§();
            }
            else
            {
               this.§1t7816s0§.§1t5493s0§();
            }
            this.numbertext.x = this.§1t7807s0§.x - this.numbertext.width / 2;
            this.numbertext.y = this.§1t7807s0§.y - this.numbertext.height / 2;
            this.numbertext.text = "+" + param2.toString();
            if(this.§1t7812s0§ == 1)
            {
               this.numbertext.textColor = 16711680;
            }
            else if(this.§1t7812s0§ == 2)
            {
               this.numbertext.textColor = 39168;
            }
            else if(this.§1t7812s0§ == 3)
            {
               this.numbertext.textColor = 26367;
            }
            else if(this.§1t7812s0§ == 4)
            {
               this.numbertext.textColor = 16776960;
            }
            else if(§1t1523s0§.§1t9663s0§(this.§1t7812s0§))
            {
               this.numbertext.textColor = §1t1523s0§.§1t9655s0§();
            }
            else
            {
               this.numbertext.textColor = 16777215;
            }
            this.§1t7868s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_wrDeploy");
         }
      }
      
      public function §1t7875s0§(param1:int) : *
      {
         this.§1t7831s0§ = true;
         §1t406s0§.instance.§1t6482s0§.§1t8025s0§();
         if(param1 == 1)
         {
            §1t406s0§.instance.§1t6482s0§.§1t7837s0§(-1,-1,-1);
            §1t406s0§.instance.§1t6482s0§.§1t5026s0§(null);
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(705),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t6482s0§.§1t8004s0§.§1t7978s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else if(param1 == 2)
         {
            §1t406s0§.instance.§1t6482s0§.§1t7837s0§(-1,-1,-1);
            §1t406s0§.instance.§1t6482s0§.§1t5026s0§(null);
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(706),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t6482s0§.§1t8004s0§.§1t7978s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else if(param1 == 3)
         {
            §1t406s0§.instance.§1t6482s0§.§1t7837s0§(-1,-1,-1);
            §1t406s0§.instance.§1t6482s0§.§1t5026s0§(null);
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(831),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t6482s0§.§1t8004s0§.§1t7978s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      public function §1t7876s0§(param1:int) : *
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Boolean = false;
         this.§1t7831s0§ = true;
         §1t406s0§.instance.§1t6482s0§.§1t8025s0§();
         if(param1 == 0)
         {
            if(this.§1t7807s0§.§1t7769s0§() == §1t416s0§.§1t12525s0§)
            {
               this.§1t7807s0§.§1t7770s0§(§1t416s0§.§1t12524s0§);
               this.§1t7822s0§ = §1t418s0§.§1t8816s0§;
               this.§1t7821s0§.§1t1024s0§(this.§1t7812s0§,0,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§);
            }
            else
            {
               this.§1t7807s0§.§1t7770s0§(§1t416s0§.§1t12533s0§);
               this.§1t7822s0§ = §1t418s0§.§1t8819s0§;
               this.§1t7821s0§.§1t1024s0§(this.§1t7812s0§,3,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§);
            }
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            this.§1t6816s0§();
            _loc4_ = true;
            if(_loc4_)
            {
               _loc3_ = §1t1521s0§.getString(593,["(" + this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + ")"]);
               this.§1t7848s0§(null);
               _loc2_ = "<font color=\'#333333\'>";
               if(this.§1t7812s0§ == 1)
               {
                  _loc2_ = "<font color=\'#990000\'>";
               }
               else if(this.§1t7812s0§ == 2)
               {
                  _loc2_ = "<font color=\'#006600\'>";
               }
               else if(this.§1t7812s0§ == 3)
               {
                  _loc2_ = "<font color=\'#000099\'>";
               }
               else if(this.§1t7812s0§ == 4)
               {
                  _loc2_ = "<font color=\'#85762E\'>";
               }
               else if(§1t1523s0§.§1t9663s0§(this.§1t7812s0§))
               {
                  _loc2_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
               }
               this.msgBoard.msgtext.htmlText += _loc2_ + §1t1523s0§.charname + ": </font><font color=\'#333333\'>" + _loc3_ + "</font><br>";
               §1t3317s0§.instance.§1t1909s0§(this.mapid,this.§1t7812s0§,this.§1t7812s0§,§1t1523s0§.charname,_loc3_);
            }
            §1t406s0§.instance.§1t6482s0§.§1t8020s0§();
         }
         else if(param1 == 4)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11095),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(762),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      public function §1t7877s0§(param1:int) : *
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Boolean = false;
         this.§1t7831s0§ = true;
         §1t406s0§.instance.§1t6482s0§.§1t8025s0§();
         if(param1 == 0)
         {
            this.§1t7807s0§.§1t6868s0§(0);
            this.§1t7807s0§.§1t7770s0§(§1t416s0§.§1t12519s0§);
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            this.§1t6816s0§();
            _loc4_ = true;
            if(_loc4_)
            {
               _loc3_ = §1t1521s0§.getString(11145,["(" + this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + ")"]);
               this.§1t7848s0§(null);
               _loc2_ = "<font color=\'#333333\'>";
               if(this.§1t7812s0§ == 1)
               {
                  _loc2_ = "<font color=\'#990000\'>";
               }
               else if(this.§1t7812s0§ == 2)
               {
                  _loc2_ = "<font color=\'#006600\'>";
               }
               else if(this.§1t7812s0§ == 3)
               {
                  _loc2_ = "<font color=\'#000099\'>";
               }
               else if(this.§1t7812s0§ == 4)
               {
                  _loc2_ = "<font color=\'#85762E\'>";
               }
               else if(§1t1523s0§.§1t9663s0§(this.§1t7812s0§))
               {
                  _loc2_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
               }
               this.msgBoard.msgtext.htmlText += _loc2_ + §1t1523s0§.charname + ": </font><font color=\'#333333\'>" + _loc3_ + "</font><br>";
               §1t3317s0§.instance.§1t1909s0§(this.mapid,this.§1t7812s0§,this.§1t7812s0§,§1t1523s0§.charname,_loc3_);
            }
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11146),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      public function §1t7878s0§(param1:int) : *
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Boolean = false;
         this.§1t7831s0§ = true;
         if(param1 == 0)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1);
            this.§1t7807s0§.§1t7770s0§(§1t416s0§.§1t12525s0§);
            if(this.§1t7821s0§ == null)
            {
               this.§1t7821s0§ = new §1t418s0§(this.mapid);
               §1t406s0§.instance.§1t6482s0§.§1t8004s0§.§1t7952s0§.push(this.§1t7821s0§);
            }
            this.§1t7821s0§.§1t1024s0§(this.§1t7812s0§,2,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§);
            this.§1t7822s0§ = §1t418s0§.§1t8818s0§;
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(589),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_wrAttack");
            this.§1t6816s0§();
            _loc4_ = true;
            if(_loc4_)
            {
               _loc3_ = §1t1521s0§.getString(590,["(" + this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + ")"]);
               this.§1t7848s0§(null);
               _loc2_ = "<font color=\'#333333\'>";
               if(this.§1t7812s0§ == 1)
               {
                  _loc2_ = "<font color=\'#990000\'>";
               }
               else if(this.§1t7812s0§ == 2)
               {
                  _loc2_ = "<font color=\'#006600\'>";
               }
               else if(this.§1t7812s0§ == 3)
               {
                  _loc2_ = "<font color=\'#000099\'>";
               }
               else if(this.§1t7812s0§ == 4)
               {
                  _loc2_ = "<font color=\'#85762E\'>";
               }
               else if(§1t1523s0§.§1t9663s0§(this.§1t7812s0§))
               {
                  _loc2_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
               }
               this.msgBoard.msgtext.htmlText += _loc2_ + §1t1523s0§.charname + ": </font><font color=\'#333333\'>" + _loc3_ + "</font><br>";
               §1t3317s0§.instance.§1t1909s0§(this.mapid,this.§1t7812s0§,this.§1t7812s0§,§1t1523s0§.charname,_loc3_);
            }
            if(!§1t1523s0§.§1t9503s0§)
            {
               §1t406s0§.instance.§1t6482s0§.§1t8020s0§();
            }
            else
            {
               §1t3318s0§.instance.§1t3420s0§();
            }
         }
         else if(param1 == 1)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8015s0§(1);
            this.§1t7807s0§.§1t7770s0§(§1t416s0§.§1t12520s0§);
            this.§1t7821s0§.§1t1024s0§(this.§1t7812s0§,1,this.§1t7807s0§.xpos,this.§1t7807s0§.§1t2259s0§);
            this.§1t7822s0§ = §1t418s0§.§1t8817s0§;
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(763),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_wrAttack");
            this.§1t6816s0§();
            _loc4_ = true;
            if(_loc4_)
            {
               _loc3_ = §1t1521s0§.getString(764) + "(" + this.§1t7807s0§.xpos + "," + this.§1t7807s0§.§1t2259s0§ + ")";
               this.§1t7848s0§(null);
               _loc2_ = "<font color=\'#333333\'>";
               if(this.§1t7812s0§ == 1)
               {
                  _loc2_ = "<font color=\'#990000\'>";
               }
               else if(this.§1t7812s0§ == 2)
               {
                  _loc2_ = "<font color=\'#006600\'>";
               }
               else if(this.§1t7812s0§ == 3)
               {
                  _loc2_ = "<font color=\'#000099\'>";
               }
               else if(this.§1t7812s0§ == 4)
               {
                  _loc2_ = "<font color=\'#85762E\'>";
               }
               else if(§1t1523s0§.§1t9663s0§(this.§1t7812s0§))
               {
                  _loc2_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
               }
               this.msgBoard.msgtext.htmlText += _loc2_ + §1t1523s0§.charname + ": </font><font color=\'#333333\'>" + _loc3_ + "</font><br>";
               §1t3317s0§.instance.§1t1909s0§(this.mapid,this.§1t7812s0§,this.§1t7812s0§,§1t1523s0§.charname,_loc3_);
            }
            if(!§1t1523s0§.§1t9503s0§)
            {
               §1t406s0§.instance.§1t6482s0§.§1t8020s0§();
            }
            else
            {
               §1t3318s0§.instance.§1t3420s0§();
            }
         }
         else if(param1 == 3)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(591),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else if(param1 == 4)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11096),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         §1t3318s0§.instance.§1t3421s0§(§1t1523s0§.§1t7746s0§(),§1t406s0§.instance.§1t6482s0§.§1t8004s0§.§1t7980s0§);
      }
   }
}

