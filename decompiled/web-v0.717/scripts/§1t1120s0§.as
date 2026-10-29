package
{
   public class §1t1120s0§
   {
      
      internal var §1t1713s0§:§1t855s0§;
      
      public function §1t1120s0§()
      {
         super();
         this.§1t1713s0§ = new §1t855s0§(§1t147s0§,0,0,50,"reset",false,false);
      }
      
      internal function §1t2102s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1, param7:Boolean = false) : *
      {
         var _loc9_:§1t147s0§ = null;
         var _loc10_:int = 0;
         var _loc18_:int = 0;
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         if(param3 <= 10)
         {
            _loc10_ = 1;
         }
         else if(param3 < 20)
         {
            _loc10_ = 2;
         }
         else if(param3 < 40)
         {
            _loc10_ = 3;
         }
         else
         {
            _loc10_ = 4;
         }
         var _loc11_:Array = new Array();
         var _loc12_:Array = new Array();
         var _loc13_:int = 0;
         while(_loc13_ < _loc10_)
         {
            _loc12_.push(_loc8_.rand(16777215));
            _loc13_++;
         }
         var _loc14_:Array = new Array();
         _loc13_ = 0;
         while(_loc13_ < _loc10_)
         {
            if(param6 == §1t70s0§.§1t9167s0§ || param6 == §1t70s0§.§1t9184s0§)
            {
               _loc14_.push(§1t112s0§.§1t12598s0§);
            }
            else
            {
               _loc14_.push(§1t112s0§.§1t12562s0§);
            }
            _loc13_++;
         }
         var _loc15_:int = int(_loc14_[0]);
         var _loc16_:int = 1;
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,1,_loc15_,param2);
         _loc11_[_loc16_] = _loc9_;
         _loc11_[_loc16_].§1t1755s0§(§1t147s0§.§1t11360s0§,_loc12_[0]);
         var _loc17_:String = "-1";
         if(param7)
         {
            _loc17_ = "-2";
            param4 = §1t70s0§.§1t9130s0§;
         }
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc11_[_loc16_].§1t1765s0§(0,50,_loc17_ + "," + param1,"signpost");
         }
         else
         {
            _loc11_[_loc16_].§1t1765s0§(0,750,_loc17_ + "," + param1,"signpost");
         }
         _loc16_ = this.createRoute(_loc16_,param2,_loc15_,1,_loc8_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,param4,true,_loc12_[0]);
         var _loc19_:int = -1;
         var _loc20_:Boolean = false;
         _loc13_ = 0;
         while(_loc13_ < _loc10_)
         {
            if(_loc13_ == 0 || param3 > §1t1523s0§.§1t9470s0§ - 5)
            {
               _loc18_ = _loc8_.rand(3);
            }
            else
            {
               _loc18_ = _loc8_.rand(4);
            }
            if(_loc19_ == _loc18_)
            {
               _loc18_ = _loc8_.rand(4);
            }
            _loc19_ = _loc18_;
            if(_loc20_)
            {
               _loc18_ = _loc8_.rand(3);
               if(_loc18_ == 2)
               {
                  _loc18_ = 3;
               }
            }
            if(_loc18_ == 2)
            {
               _loc20_ = true;
            }
            _loc15_ = int(_loc14_[_loc13_]);
            if(_loc18_ == 0)
            {
               _loc16_ = this.§1t2118s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            else if(_loc18_ == 1)
            {
               _loc16_ = this.§1t2120s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            else if(_loc18_ == 2)
            {
               _loc16_ = this.§1t2122s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            else if(_loc18_ == 3)
            {
               _loc16_ = this.§1t2121s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            _loc13_++;
         }
         _loc11_[_loc16_].§1t1755s0§(§1t147s0§.§1t11365s0§,_loc12_[_loc10_ - 1]);
         if(param7)
         {
            this.createRoute(_loc16_,param2,_loc15_,1,_loc8_,§1t147s0§.§1t11397s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,-1,false,_loc12_[_loc10_ - 1]);
         }
         else
         {
            this.createRoute(_loc16_,param2,_loc15_,1,_loc8_,§1t147s0§.§1t11370s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,-1,false,_loc12_[_loc10_ - 1]);
         }
         if(param6 == -1)
         {
            param6 = §1t70s0§.§1t9165s0§;
         }
         var _loc21_:int = int(_loc11_.length);
         _loc13_ = 1;
         while(_loc13_ < _loc21_)
         {
            _loc9_ = _loc11_[_loc13_];
            _loc9_.§1t1784s0§(param6,param3,param1,_loc8_,param2);
            param5[_loc13_] = _loc9_.output();
            this.§1t1713s0§.§1t867s0§(_loc9_);
            _loc13_++;
         }
         _loc8_.destroy();
      }
      
      internal function §1t2103s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1, param7:Boolean = false) : *
      {
         var _loc9_:§1t147s0§ = null;
         var _loc10_:int = 0;
         var _loc18_:int = 0;
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         if(param3 <= 10)
         {
            _loc10_ = 1;
         }
         else if(param3 <= 20)
         {
            _loc10_ = 2;
         }
         else if(param3 <= 40)
         {
            _loc10_ = 3;
         }
         else
         {
            _loc10_ = 4;
         }
         var _loc11_:Array = new Array();
         var _loc12_:Array = new Array();
         var _loc13_:int = 0;
         while(_loc13_ < _loc10_)
         {
            _loc12_.push(_loc8_.rand(16777215));
            _loc13_++;
         }
         var _loc14_:Array = new Array();
         _loc14_.push(§1t112s0§.§1t12597s0§);
         _loc13_ = 1;
         while(_loc13_ < _loc10_)
         {
            _loc14_.push(§1t112s0§.§1t12562s0§);
            _loc13_++;
         }
         var _loc15_:int = int(_loc14_[0]);
         var _loc16_:int = 1;
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,1,_loc15_,param2);
         _loc11_[_loc16_] = _loc9_;
         _loc11_[_loc16_].§1t1755s0§(§1t147s0§.§1t11360s0§,_loc12_[0]);
         var _loc17_:String = "-1";
         if(param7)
         {
            _loc17_ = "-2";
            param4 = §1t70s0§.§1t9130s0§;
         }
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc11_[_loc16_].§1t1765s0§(0,50,_loc17_ + "," + param1,"signpost");
         }
         else
         {
            _loc11_[_loc16_].§1t1765s0§(0,750,_loc17_ + "," + param1,"signpost");
         }
         _loc16_ = this.createRoute(_loc16_,param2,_loc15_,1,_loc8_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,param4,true,_loc12_[0]);
         _loc13_ = 0;
         while(_loc13_ < _loc10_)
         {
            _loc18_ = _loc8_.rand(4);
            _loc15_ = int(_loc14_[_loc13_]);
            if(_loc13_ == 0)
            {
               _loc16_ = this.§1t2119s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3);
            }
            else if(_loc18_ == 0)
            {
               _loc16_ = this.§1t2118s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            else if(_loc18_ == 1)
            {
               _loc16_ = this.§1t2120s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            else if(_loc18_ == 2)
            {
               _loc16_ = this.§1t2122s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            else if(_loc18_ == 3)
            {
               _loc16_ = this.§1t2121s0§(_loc16_,param2,_loc15_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            _loc13_++;
         }
         _loc11_[_loc16_].§1t1755s0§(§1t147s0§.§1t11365s0§,_loc12_[_loc10_ - 1]);
         if(param7)
         {
            this.createRoute(_loc16_,param2,_loc15_,1,_loc8_,§1t147s0§.§1t11397s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,-1,false,_loc12_[_loc10_ - 1]);
         }
         else
         {
            this.createRoute(_loc16_,param2,_loc15_,1,_loc8_,§1t147s0§.§1t11370s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,-1,false,_loc12_[_loc10_ - 1]);
         }
         if(param6 == -1)
         {
            param6 = §1t70s0§.§1t9165s0§;
         }
         var _loc19_:int = int(_loc11_.length);
         _loc13_ = 1;
         while(_loc13_ < _loc19_)
         {
            _loc9_ = _loc11_[_loc13_];
            _loc9_.§1t1784s0§(param6,param3,param1,_loc8_,param2);
            param5[_loc13_] = _loc9_.output();
            this.§1t1713s0§.§1t867s0§(_loc9_);
            _loc13_++;
         }
         _loc8_.destroy();
      }
      
      internal function §1t2104s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         var _loc8_:§1t147s0§ = null;
         var _loc9_:int = 0;
         var _loc14_:int = 0;
         var _loc7_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         if(param3 <= 10)
         {
            _loc9_ = 1 + _loc7_.rand(2);
         }
         else if(param3 <= 20)
         {
            _loc9_ = 2;
         }
         else if(param3 <= 40)
         {
            _loc9_ = 3;
         }
         else
         {
            _loc9_ = 4;
         }
         var _loc10_:Array = new Array();
         var _loc11_:Array = new Array();
         var _loc12_:int = 0;
         while(_loc12_ < _loc9_)
         {
            _loc11_.push(0);
            _loc12_++;
         }
         var _loc13_:Array = new Array();
         _loc12_ = 0;
         while(_loc12_ < _loc9_)
         {
            if(_loc12_ == 0 || _loc12_ == _loc9_ - 1)
            {
               _loc13_.push(§1t112s0§.§1t12569s0§);
            }
            else
            {
               _loc14_ = _loc7_.rand(7);
               if(_loc14_ == 0)
               {
                  _loc13_.push(§1t112s0§.§1t12569s0§);
               }
               else if(_loc14_ == 1)
               {
                  _loc13_.push(§1t112s0§.§1t12563s0§);
               }
               else if(_loc14_ == 2)
               {
                  _loc13_.push(§1t112s0§.§1t12564s0§);
               }
               else if(_loc14_ == 3)
               {
                  _loc13_.push(§1t112s0§.§1t12565s0§);
               }
               else
               {
                  _loc13_.push(§1t112s0§.§1t12569s0§);
               }
            }
            _loc12_++;
         }
         var _loc15_:int = int(_loc13_[0]);
         var _loc16_:int = 1;
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,1,_loc15_,param2);
         _loc10_[_loc16_] = _loc8_;
         _loc10_[_loc16_].§1t1755s0§(§1t147s0§.§1t11360s0§,_loc11_[0]);
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc10_[_loc16_].§1t1765s0§(0,50,"-1," + param1,"signpost");
         }
         else
         {
            _loc10_[_loc16_].§1t1765s0§(0,750,"-1," + param1,"signpost");
         }
         _loc16_ = this.createRoute(_loc16_,param2,_loc15_,1,_loc7_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc10_,null,null,param4,true,_loc11_[0]);
         _loc12_ = 0;
         while(_loc12_ < _loc9_)
         {
            _loc15_ = int(_loc13_[_loc12_]);
            if(_loc15_ == §1t112s0§.§1t12569s0§)
            {
               if(_loc12_ == 0 || param3 > §1t1523s0§.§1t9470s0§ - 5)
               {
                  _loc14_ = _loc7_.rand(3);
               }
               else
               {
                  _loc14_ = _loc7_.rand(4);
               }
               if(_loc14_ == 0)
               {
                  _loc16_ = this.§1t2118s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
               }
               else if(_loc14_ == 1)
               {
                  _loc16_ = this.§1t2120s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
               }
               else if(_loc14_ == 2)
               {
                  _loc16_ = this.§1t2122s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
               }
               else if(_loc14_ == 3)
               {
                  _loc16_ = this.§1t2121s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
               }
            }
            else if(_loc15_ == §1t112s0§.§1t12563s0§ || _loc15_ == §1t112s0§.§1t12564s0§ || _loc15_ == §1t112s0§.§1t12565s0§)
            {
               _loc16_ = this.§1t2119s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
            }
            _loc12_++;
         }
         _loc10_[_loc16_].§1t1755s0§(§1t147s0§.§1t11365s0§,_loc11_[_loc9_ - 1]);
         this.createRoute(_loc16_,param2,_loc15_,1,_loc7_,§1t147s0§.§1t11370s0§,§1t147s0§.§1t11361s0§,_loc10_,null,null,-1,false,_loc11_[_loc9_ - 1]);
         if(param6 == -1)
         {
            param6 = §1t70s0§.§1t9165s0§;
         }
         var _loc17_:int = int(_loc10_.length);
         _loc12_ = 1;
         while(_loc12_ < _loc17_)
         {
            _loc8_ = _loc10_[_loc12_];
            _loc8_.§1t1784s0§(param6,param3,param1,_loc7_,param2);
            param5[_loc12_] = _loc8_.output();
            this.§1t1713s0§.§1t867s0§(_loc8_);
            _loc12_++;
         }
         _loc7_.destroy();
      }
      
      internal function §1t2105s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         var _loc8_:§1t147s0§ = null;
         var _loc9_:int = 0;
         var _loc14_:int = 0;
         var _loc7_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         if(param3 <= 10)
         {
            _loc9_ = 1 + _loc7_.rand(2);
         }
         else if(param3 <= 20)
         {
            _loc9_ = 2;
         }
         else if(param3 <= 40)
         {
            _loc9_ = 3;
         }
         else
         {
            _loc9_ = 4;
         }
         var _loc10_:Array = new Array();
         var _loc11_:Array = new Array();
         var _loc12_:int = 0;
         while(_loc12_ < _loc9_)
         {
            _loc11_.push(0);
            _loc12_++;
         }
         var _loc13_:Array = new Array();
         _loc12_ = 0;
         while(_loc12_ < _loc9_)
         {
            if(_loc12_ == 0 || _loc12_ == _loc9_ - 1)
            {
               _loc13_.push(§1t112s0§.§1t12584s0§);
            }
            else
            {
               _loc14_ = _loc7_.rand(7);
               if(_loc14_ == 0)
               {
                  _loc13_.push(§1t112s0§.§1t12584s0§);
               }
               else if(_loc14_ == 1)
               {
                  _loc13_.push(§1t112s0§.§1t12563s0§);
               }
               else if(_loc14_ == 2)
               {
                  _loc13_.push(§1t112s0§.§1t12564s0§);
               }
               else if(_loc14_ == 3)
               {
                  _loc13_.push(§1t112s0§.§1t12565s0§);
               }
               else
               {
                  _loc13_.push(§1t112s0§.§1t12584s0§);
               }
            }
            _loc12_++;
         }
         var _loc15_:int = int(_loc13_[0]);
         var _loc16_:int = 1;
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,1,_loc15_,param2);
         _loc10_[_loc16_] = _loc8_;
         _loc10_[_loc16_].§1t1755s0§(§1t147s0§.§1t11360s0§,_loc11_[0]);
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc10_[_loc16_].§1t1765s0§(0,50,"-1," + param1,"signpost");
         }
         else
         {
            _loc10_[_loc16_].§1t1765s0§(0,750,"-1," + param1,"signpost");
         }
         _loc16_ = this.createRoute(_loc16_,param2,_loc15_,1,_loc7_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc10_,null,null,param4,true,_loc11_[0]);
         _loc12_ = 0;
         while(_loc12_ < _loc9_)
         {
            _loc15_ = int(_loc13_[_loc12_]);
            if(_loc15_ == §1t112s0§.§1t12584s0§)
            {
               if(_loc12_ == 0 || param3 > §1t1523s0§.§1t9470s0§ - 5)
               {
                  _loc14_ = _loc7_.rand(3);
               }
               else
               {
                  _loc14_ = _loc7_.rand(4);
               }
               if(_loc14_ == 0)
               {
                  _loc16_ = this.§1t2118s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
               }
               else if(_loc14_ == 1)
               {
                  _loc16_ = this.§1t2120s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
               }
               else if(_loc14_ == 2)
               {
                  _loc16_ = this.§1t2122s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
               }
               else if(_loc14_ == 3)
               {
                  _loc16_ = this.§1t2121s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
               }
            }
            else if(_loc15_ == §1t112s0§.§1t12563s0§ || _loc15_ == §1t112s0§.§1t12564s0§ || _loc15_ == §1t112s0§.§1t12565s0§)
            {
               _loc16_ = this.§1t2119s0§(_loc16_,param2,_loc15_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
            }
            _loc12_++;
         }
         _loc10_[_loc16_].§1t1755s0§(§1t147s0§.§1t11365s0§,_loc11_[_loc9_ - 1]);
         this.createRoute(_loc16_,param2,_loc15_,1,_loc7_,§1t147s0§.§1t11370s0§,§1t147s0§.§1t11361s0§,_loc10_,null,null,-1,false,_loc11_[_loc9_ - 1]);
         if(param6 == -1)
         {
            param6 = §1t70s0§.§1t9165s0§;
         }
         var _loc17_:int = int(_loc10_.length);
         _loc12_ = 1;
         while(_loc12_ < _loc17_)
         {
            _loc8_ = _loc10_[_loc12_];
            _loc8_.§1t1784s0§(param6,param3,param1,_loc7_,param2);
            param5[_loc12_] = _loc8_.output();
            this.§1t1713s0§.§1t867s0§(_loc8_);
            _loc12_++;
         }
         _loc7_.destroy();
      }
      
      internal function §1t2106s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         var _loc8_:§1t147s0§ = null;
         var _loc9_:int = 0;
         var _loc16_:int = 0;
         var _loc7_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         if(param3 <= 10)
         {
            _loc9_ = 1 + _loc7_.rand(2);
         }
         else if(param3 <= 20)
         {
            _loc9_ = 2;
         }
         else if(param3 <= 40)
         {
            _loc9_ = 3;
         }
         else
         {
            _loc9_ = 4;
         }
         var _loc10_:Array = new Array();
         var _loc11_:Array = new Array();
         var _loc12_:int = 0;
         while(_loc12_ < _loc9_)
         {
            _loc11_.push(0);
            _loc12_++;
         }
         var _loc13_:Array = [§1t112s0§.§1t12563s0§,§1t112s0§.§1t12563s0§,§1t112s0§.§1t12564s0§,§1t112s0§.§1t12564s0§,§1t112s0§.§1t12565s0§,§1t112s0§.§1t12565s0§];
         var _loc14_:int = int(_loc13_[0]);
         var _loc15_:int = 1;
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,1,_loc14_,param2);
         _loc10_[_loc15_] = _loc8_;
         _loc10_[_loc15_].§1t1755s0§(§1t147s0§.§1t11360s0§,_loc11_[0]);
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc10_[_loc15_].§1t1765s0§(0,50,"-1," + param1,"signpost");
         }
         else
         {
            _loc10_[_loc15_].§1t1765s0§(0,750,"-1," + param1,"signpost");
         }
         _loc15_ = this.createRoute(_loc15_,param2,_loc14_,1,_loc7_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc10_,null,null,param4,true,_loc11_[0]);
         _loc12_ = 0;
         while(_loc12_ < _loc9_)
         {
            _loc15_ = this.§1t2119s0§(_loc15_,param2,_loc14_,_loc7_,param4,_loc10_,param3,_loc11_[_loc12_],_loc11_[_loc12_ + 1]);
            _loc12_++;
         }
         _loc10_[_loc15_].§1t1755s0§(§1t147s0§.§1t11365s0§,_loc11_[_loc9_ - 1]);
         this.createRoute(_loc15_,param2,_loc14_,1,_loc7_,§1t147s0§.§1t11370s0§,§1t147s0§.§1t11361s0§,_loc10_,null,null,-1,false,_loc11_[_loc9_ - 1]);
         if(param6 == -1)
         {
            param6 = §1t70s0§.§1t9165s0§;
         }
         var _loc17_:int = int(_loc10_.length);
         _loc12_ = 1;
         while(_loc12_ < _loc17_)
         {
            _loc8_ = _loc10_[_loc12_];
            _loc8_.§1t1784s0§(param6,param3,param1,_loc7_,param2);
            param5[_loc12_] = _loc8_.output();
            this.§1t1713s0§.§1t867s0§(_loc8_);
            _loc12_++;
         }
         _loc7_.destroy();
      }
      
      internal function §1t2107s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         this.§1t2106s0§(param1,param2,param3,param4,param5,§1t70s0§.§1t9166s0§);
      }
      
      internal function §1t2108s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1, param7:Boolean = false) : *
      {
         var _loc9_:§1t147s0§ = null;
         var _loc10_:int = 0;
         var _loc16_:int = 0;
         param4 = §1t70s0§.§1t9130s0§;
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         if(param3 <= 10)
         {
            _loc10_ = 2 + _loc8_.rand(2);
         }
         else if(param3 < 20)
         {
            _loc10_ = 3;
         }
         else if(param3 < 40)
         {
            _loc10_ = 4;
         }
         else
         {
            _loc10_ = 5;
         }
         var _loc11_:Array = new Array();
         var _loc12_:Array = [§1t112s0§.§1t12547s0§,§1t112s0§.§1t12561s0§,§1t112s0§.§1t12568s0§,§1t112s0§.§1t12591s0§];
         if(param6 == §1t70s0§.§1t9167s0§)
         {
            _loc12_ = [§1t112s0§.§1t12553s0§];
         }
         var _loc13_:int = int(_loc12_[0]);
         var _loc14_:int = 1;
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,1,_loc13_,param2);
         _loc11_[_loc14_] = _loc9_;
         _loc11_[_loc14_].§1t1755s0§(§1t147s0§.§1t11360s0§);
         var _loc15_:String = "-1";
         if(param7)
         {
            _loc15_ = "-2";
         }
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc11_[_loc14_].§1t1765s0§(0,50,_loc15_ + "," + param1,"signpost");
         }
         else
         {
            _loc11_[_loc14_].§1t1765s0§(0,750,_loc15_ + "," + param1,"signpost");
         }
         _loc13_ = int(_loc12_[_loc8_.rand(_loc12_.length)]);
         _loc14_ = this.createRoute(_loc14_,param2,_loc13_,1,_loc8_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,param4,true);
         var _loc17_:int = 0;
         while(_loc17_ < _loc10_)
         {
            _loc14_ = this.§1t2119s0§(_loc14_,param2,_loc13_,_loc8_,param4,_loc11_,param3);
            _loc17_++;
         }
         if(param7)
         {
            this.createRoute(_loc14_,param2,_loc13_,1,_loc8_,§1t147s0§.§1t11397s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,param4,true);
         }
         else
         {
            this.createRoute(_loc14_,param2,_loc13_,1,_loc8_,§1t147s0§.§1t11370s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,param4,true);
         }
         if(param6 == -1)
         {
            param6 = §1t70s0§.§1t9165s0§;
         }
         var _loc18_:int = int(_loc11_.length);
         _loc17_ = 1;
         while(_loc17_ < _loc18_)
         {
            _loc9_ = _loc11_[_loc17_];
            _loc9_.§1t1784s0§(param6,param3,param1,_loc8_,param2);
            param5[_loc17_] = _loc9_.output();
            this.§1t1713s0§.§1t867s0§(_loc9_);
            _loc17_++;
         }
         _loc8_.destroy();
      }
      
      internal function §1t2109s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         var _loc10_:§1t147s0§ = null;
         var _loc7_:Array = new Array();
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         var _loc9_:int = §1t112s0§.§1t12563s0§;
         var _loc11_:int = 1;
         _loc10_ = this.§1t1713s0§.§1t866s0§();
         _loc10_.init(0,1,_loc9_,param2);
         _loc7_[_loc11_] = _loc10_;
         _loc7_[_loc11_].§1t1755s0§(§1t147s0§.§1t11360s0§,0);
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc7_[_loc11_].§1t1765s0§(0,50,"-1," + param1,"signpost");
         }
         else
         {
            _loc7_[_loc11_].§1t1765s0§(0,750,"-1," + param1,"signpost");
         }
         _loc11_ = this.createRoute(_loc11_,param2,_loc9_,1,_loc8_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc7_,null,null,param4,true,0);
         this.createRoute(_loc11_,param2,_loc9_,2,_loc8_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc7_,null,null,param4,false,0);
         if(param6 == -1)
         {
            param6 = _loc8_.rand(3);
            if(param6 == 0)
            {
               param6 = §1t70s0§.§1t9165s0§;
            }
            else if(param6 == 1)
            {
               param6 = §1t70s0§.§1t9168s0§;
            }
            else if(param6 == 2)
            {
               param6 = §1t70s0§.§1t9169s0§;
            }
         }
         var _loc12_:int = int(_loc7_.length);
         var _loc13_:int = 1;
         while(_loc13_ < _loc12_)
         {
            _loc10_ = _loc7_[_loc13_];
            _loc10_.§1t1784s0§(param6,param3,param1,_loc8_,param2);
            param5[_loc13_] = _loc10_.output();
            this.§1t1713s0§.§1t867s0§(_loc10_);
            _loc13_++;
         }
         _loc8_.destroy();
      }
      
      internal function §1t2110s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1, param7:Boolean = false) : *
      {
         var _loc9_:§1t147s0§ = null;
         var _loc17_:int = 0;
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         var _loc10_:int = 4;
         var _loc11_:Array = new Array();
         var _loc12_:Array = new Array();
         var _loc13_:int = 0;
         while(_loc13_ < _loc10_)
         {
            _loc12_.push(0);
            _loc13_++;
         }
         var _loc14_:int = §1t112s0§.§1t12581s0§;
         var _loc15_:int = 1;
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,1,_loc14_,param2);
         _loc11_[_loc15_] = _loc9_;
         _loc11_[_loc15_].§1t1755s0§(§1t147s0§.§1t11360s0§,_loc12_[0]);
         var _loc16_:String = "-1";
         if(param7)
         {
            _loc16_ = "-2";
            param4 = §1t70s0§.§1t9130s0§;
         }
         if(param7 || param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc11_[_loc15_].§1t1765s0§(0,50,_loc16_ + "," + param1,"signpost");
         }
         else
         {
            _loc11_[_loc15_].§1t1765s0§(0,750,_loc16_ + "," + param1,"signpost");
         }
         _loc15_ = this.createRoute(_loc15_,param2,_loc14_,1,_loc8_,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,param4,true,_loc12_[0]);
         _loc13_ = 0;
         while(_loc13_ < _loc10_)
         {
            if(_loc13_ == 0 || param3 > §1t1523s0§.§1t9470s0§ - 5)
            {
               _loc17_ = _loc8_.rand(2);
            }
            else
            {
               _loc17_ = _loc8_.rand(3);
            }
            if(_loc17_ == 0)
            {
               _loc15_ = this.§1t2119s0§(_loc15_,param2,_loc14_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            else if(_loc17_ == 1)
            {
               _loc15_ = this.§1t2120s0§(_loc15_,param2,_loc14_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            else if(_loc17_ == 2)
            {
               _loc15_ = this.§1t2121s0§(_loc15_,param2,_loc14_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
            }
            _loc13_++;
         }
         _loc11_[_loc15_].§1t1755s0§(§1t147s0§.§1t11365s0§,_loc12_[_loc10_ - 1]);
         if(param6 == §1t70s0§.§1t9183s0§ && param2 == 8685589)
         {
            _loc14_ = §1t112s0§.§1t12573s0§;
         }
         _loc15_ = this.§1t2119s0§(_loc15_,param2,_loc14_,_loc8_,param4,_loc11_,param3,_loc12_[_loc13_],_loc12_[_loc13_ + 1]);
         if(param7)
         {
            this.createRoute(_loc15_,param2,_loc14_,1,_loc8_,§1t147s0§.§1t11397s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,-1,false,_loc12_[_loc10_ - 1]);
         }
         else
         {
            this.createRoute(_loc15_,param2,_loc14_,1,_loc8_,§1t147s0§.§1t11370s0§,§1t147s0§.§1t11361s0§,_loc11_,null,null,-1,false,_loc12_[_loc10_ - 1]);
         }
         if(param6 == -1)
         {
            param6 = §1t70s0§.§1t9183s0§;
         }
         var _loc18_:int = int(_loc11_.length);
         _loc13_ = 1;
         while(_loc13_ < _loc18_)
         {
            _loc9_ = _loc11_[_loc13_];
            if(param6 == §1t70s0§.§1t9183s0§)
            {
               _loc9_.bgParam = 6;
            }
            else
            {
               _loc9_.isPrivate = §1t134s0§.§1t9234s0§;
            }
            _loc9_.§1t1784s0§(param6,param3,param1,_loc8_,param2);
            param5[_loc13_] = _loc9_.output();
            this.§1t1713s0§.§1t867s0§(_loc9_);
            _loc13_++;
         }
         _loc8_.destroy();
      }
      
      internal function §1t2111s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         var _loc7_:§1t147s0§ = null;
         var _loc16_:int = 0;
         var _loc19_:int = 0;
         param4 = §1t70s0§.§1t9128s0§;
         var _loc8_:Array = new Array();
         var _loc9_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         var _loc10_:int = §1t112s0§.§1t12582s0§;
         var _loc11_:int = 5 + _loc9_.rand(4);
         var _loc12_:int = 4 + _loc9_.rand(3);
         var _loc13_:int = 2;
         var _loc14_:int = 1;
         _loc7_ = this.§1t1713s0§.§1t866s0§();
         _loc7_.init(0,1,_loc10_,param2);
         _loc8_[_loc14_] = _loc7_;
         _loc8_[_loc14_].§1t1755s0§(§1t147s0§.§1t11360s0§,0);
         _loc8_[_loc14_].roomName = "Ninja Trail";
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc8_[_loc14_].§1t1765s0§(0,50,"0," + param1,"signpost");
         }
         else
         {
            _loc8_[_loc14_].§1t1765s0§(0,750,"0," + param1,"signpost");
         }
         _loc14_ = this.createRoute(_loc14_,param2,_loc10_,1,_loc9_,§1t147s0§.§1t11382s0§,§1t147s0§.§1t11382s0§,_loc8_,null,null,param4,true);
         var _loc15_:int = this.createRoute(_loc14_,param2,_loc10_,_loc11_,_loc9_,§1t147s0§.§1t11381s0§,§1t147s0§.§1t11382s0§,_loc8_,null,null,param4);
         var _loc17_:int = int(_loc8_[_loc15_].getEnterFrom());
         if(_loc17_ == §1t70s0§.§1t9129s0§)
         {
            _loc16_ = §1t70s0§.§1t9128s0§;
         }
         else if(_loc17_ == §1t70s0§.§1t9128s0§)
         {
            _loc16_ = §1t70s0§.§1t9129s0§;
         }
         else if(_loc17_ == §1t70s0§.§1t9130s0§)
         {
            _loc16_ = §1t70s0§.§1t9131s0§;
         }
         else if(_loc17_ == §1t70s0§.§1t9131s0§)
         {
            _loc16_ = §1t70s0§.§1t9130s0§;
         }
         var _loc18_:int = this.createRoute(_loc15_,param2,_loc10_,1,_loc9_,§1t147s0§.§1t11382s0§,§1t147s0§.§1t11382s0§,_loc8_,null,null,_loc16_,true);
         _loc18_ = this.createRoute(_loc18_,param2,_loc10_,_loc12_ - 1,_loc9_,§1t147s0§.§1t11396s0§,§1t147s0§.§1t11382s0§,_loc8_,null,null,_loc16_);
         _loc8_[_loc18_].roomName = "Ninja Trail";
         if(_loc8_[_loc15_].§1t1769s0§())
         {
            this.createRoute(_loc15_,param2,_loc10_,_loc13_,_loc9_,§1t147s0§.§1t11383s0§,§1t147s0§.§1t11383s0§,_loc8_,null,null,§1t70s0§.§1t9131s0§,true);
         }
         else
         {
            this.createRoute(_loc15_,param2,_loc10_,_loc13_,_loc9_,§1t147s0§.§1t11383s0§,§1t147s0§.§1t11383s0§,_loc8_,null,null,§1t70s0§.§1t9128s0§,true);
         }
         var _loc20_:int = int(_loc8_.length);
         var _loc21_:int = 1;
         while(_loc21_ < _loc20_)
         {
            _loc7_ = _loc8_[_loc21_];
            param6 = _loc9_.rand(2);
            if(param6 == 0)
            {
               param6 = §1t70s0§.§1t9166s0§;
            }
            else if(param6 == 1)
            {
               param6 = §1t70s0§.§1t9168s0§;
            }
            _loc7_.§1t1784s0§(param6,param3,param1,_loc9_,param2);
            param5[_loc21_] = _loc7_.output();
            this.§1t1713s0§.§1t867s0§(_loc7_);
            _loc21_++;
         }
         _loc9_.destroy();
      }
      
      internal function §1t2112s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         var _loc9_:§1t147s0§ = null;
         param4 = §1t70s0§.§1t9128s0§;
         var _loc7_:Array = new Array();
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         var _loc10_:int = §1t112s0§.§1t12582s0§;
         var _loc11_:int = 5 + _loc8_.rand(4);
         var _loc12_:int = 4 + _loc8_.rand(3);
         var _loc13_:int = 2;
         var _loc14_:int = 1;
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,1,_loc10_,param2);
         _loc7_[_loc14_] = _loc9_;
         _loc7_[_loc14_].§1t1755s0§(§1t147s0§.§1t11360s0§,0);
         _loc7_[_loc14_].roomName = "Ninja Trail";
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc7_[_loc14_].§1t1765s0§(0,50,"0," + param1,"signpost");
         }
         else
         {
            _loc7_[_loc14_].§1t1765s0§(0,750,"0," + param1,"signpost");
         }
         _loc14_ = this.createRoute(_loc14_,param2,_loc10_,1,_loc8_,§1t147s0§.§1t11382s0§,§1t147s0§.§1t11382s0§,_loc7_,null,null,param4,true);
         this.createRoute(_loc14_,param2,_loc10_,_loc11_,_loc8_,§1t147s0§.§1t11396s0§,§1t147s0§.§1t11382s0§,_loc7_,null,null,param4);
         var _loc15_:int = int(_loc7_.length);
         var _loc16_:int = 1;
         while(_loc16_ < _loc15_)
         {
            _loc9_ = _loc7_[_loc16_];
            param6 = _loc8_.rand(2);
            if(param6 == 0)
            {
               param6 = §1t70s0§.§1t9166s0§;
            }
            else if(param6 == 1)
            {
               param6 = §1t70s0§.§1t9168s0§;
            }
            _loc9_.§1t1784s0§(param6,param3,param1,_loc8_,param2);
            param5[_loc16_] = _loc9_.output();
            this.§1t1713s0§.§1t867s0§(_loc9_);
            _loc16_++;
         }
         _loc8_.destroy();
      }
      
      internal function §1t2113s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         var _loc9_:§1t147s0§ = null;
         param4 = §1t70s0§.§1t9130s0§;
         var _loc7_:Array = new Array();
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         var _loc10_:int = §1t112s0§.§1t12577s0§;
         var _loc11_:int = 1;
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,1,_loc10_,param2);
         _loc7_[_loc11_] = _loc9_;
         _loc7_[_loc11_].§1t1755s0§(§1t147s0§.§1t11360s0§,0);
         _loc7_[_loc11_].roomName = §1t1521s0§.getString(1045);
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc7_[_loc11_].§1t1765s0§(0,50,"-1," + param1,"signpost");
         }
         else
         {
            _loc7_[_loc11_].§1t1765s0§(0,750,"-1," + param1,"signpost");
         }
         _loc11_ = this.createRoute(_loc11_,param2,_loc10_,1,_loc8_,§1t147s0§.§1t11369s0§,§1t147s0§.§1t11369s0§,_loc7_,null,null,param4,true,0);
         this.createRoute(_loc11_,param2,_loc10_,2,_loc8_,§1t147s0§.§1t11369s0§,§1t147s0§.§1t11369s0§,_loc7_,null,null,param4,true);
         param6 = §1t70s0§.§1t9179s0§;
         var _loc12_:int = int(_loc7_.length);
         var _loc13_:int = 1;
         while(_loc13_ < _loc12_)
         {
            _loc9_ = _loc7_[_loc13_];
            _loc9_.§1t1784s0§(param6,param3,param1,_loc8_,param2);
            param5[_loc13_] = _loc9_.output();
            this.§1t1713s0§.§1t867s0§(_loc9_);
            _loc13_++;
         }
         _loc8_.destroy();
      }
      
      internal function §1t2114s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int = -1) : *
      {
         var _loc9_:§1t147s0§ = null;
         param4 = §1t70s0§.§1t9131s0§;
         var _loc7_:Array = new Array();
         var _loc8_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t3317s0§.instance.§1t1848s0§() * 31 + Math.floor(§1t3317s0§.instance.§1t1847s0§() / (60 * 60)));
         var _loc10_:int = §1t112s0§.§1t12559s0§;
         var _loc11_:int = 1;
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,1,_loc10_,param2);
         _loc9_.§1t1755s0§(§1t147s0§.§1t11360s0§,0);
         _loc9_.roomName = §1t1521s0§.getString(3003);
         _loc9_.roomWidth = 800;
         _loc9_.isPrivate = §1t134s0§.§1t9230s0§;
         _loc9_.§1t1765s0§(1,600,"1024","textsign");
         _loc7_[_loc11_] = _loc9_;
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc7_[_loc11_].§1t1765s0§(0,50,"-1," + param1,"signpost");
         }
         else
         {
            _loc7_[_loc11_].§1t1765s0§(0,750,"-1," + param1,"signpost");
         }
         this.createRoute(_loc11_,param2,_loc10_,3,_loc8_,§1t147s0§.§1t11369s0§,§1t147s0§.§1t11369s0§,_loc7_,null,null,param4,true);
         _loc9_ = _loc7_[2];
         _loc9_.roomName = §1t1521s0§.getString(3005);
         _loc9_.isPrivate = §1t134s0§.§1t9230s0§;
         _loc9_.roomWidth = 1670;
         _loc9_.§1t1765s0§(7,660,"door1","switch1");
         _loc9_.§1t1765s0§(7,1295,"door2","switch2");
         _loc9_.§1t1765s0§(1,660,"3015","sign1");
         _loc9_.§1t1765s0§(8,377,"0,5,150","door1");
         _loc9_.§1t1765s0§(8,857,"0,10,150","door2");
         _loc9_ = _loc7_[3];
         _loc9_.bg = §1t112s0§.§1t12559s0§;
         _loc9_.roomName = §1t1521s0§.getString(3005);
         _loc9_.isPrivate = §1t134s0§.§1t9230s0§;
         _loc9_.roomWidth = 1670;
         _loc9_.§1t1765s0§(7,377,"door1","switch1");
         _loc9_.§1t1765s0§(7,850,"door2","switch2");
         _loc9_.§1t1765s0§(7,1295,"door3","switch3");
         _loc9_.§1t1765s0§(8,377,"0,7,150","door1");
         _loc9_.§1t1765s0§(8,617,"0,8,150","door2");
         _loc9_.§1t1765s0§(8,857,"0,9,150,-1,0,1","door3");
         _loc9_.§1t1765s0§(0,50,"6,50,-1,1,3,3","wexit");
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,4,_loc10_,param2);
         _loc7_[4] = _loc9_;
         _loc9_.roomWidth = 1670;
         _loc9_.bg = §1t112s0§.§1t12560s0§;
         _loc9_.§1t1755s0§(§1t147s0§.§1t11369s0§);
         _loc9_.roomName = §1t1521s0§.getString(3004);
         _loc9_.isPrivate = §1t134s0§.§1t9228s0§;
         _loc9_.§1t1765s0§(0,1620,"1,50,-1,1,2,2","sexit");
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,5,_loc10_,param2);
         _loc7_[5] = _loc9_;
         _loc9_.roomWidth = 800;
         _loc9_.bg = §1t112s0§.§1t12559s0§;
         _loc9_.§1t1755s0§(§1t147s0§.§1t11369s0§);
         _loc9_.roomName = §1t1521s0§.getString(1048);
         _loc9_.§1t1765s0§(0,50,"2,377","sexit");
         _loc9_.§1t1765s0§(19,650,§1t1523s0§.getLevel() + ",0,30022","goodlootchest2");
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,6,_loc10_,param2);
         _loc7_[6] = _loc9_;
         _loc9_.bg = §1t112s0§.§1t12560s0§;
         _loc9_.§1t1755s0§(§1t147s0§.§1t11369s0§);
         _loc9_.roomName = §1t1521s0§.getString(3019);
         _loc9_.isPrivate = §1t134s0§.§1t9230s0§;
         _loc9_.roomWidth = 1670;
         _loc9_.§1t1765s0§(0,1620,"3,50,-1,1,2,2","wexit");
         _loc9_.§1t1765s0§(73,1052,"","tournamentboard");
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,7,_loc10_,param2);
         _loc7_[7] = _loc9_;
         _loc9_.bg = §1t112s0§.§1t12560s0§;
         _loc9_.§1t1755s0§(§1t147s0§.§1t11369s0§);
         _loc9_.roomName = §1t1521s0§.getString(3004);
         _loc9_.isPrivate = §1t134s0§.§1t9237s0§;
         _loc9_.roomWidth = 2000;
         _loc9_.§1t1765s0§(0,50,"3,377","sexit");
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,8,_loc10_,param2);
         _loc7_[8] = _loc9_;
         _loc9_.bg = this.§1t2115s0§(_loc8_);
         _loc9_.§1t1755s0§(§1t147s0§.§1t11369s0§);
         _loc9_.roomName = §1t1521s0§.getString(1050,[""]);
         _loc9_.isPrivate = §1t134s0§.§1t9233s0§;
         _loc9_.roomWidth = 3000;
         _loc9_.§1t1765s0§(0,50,"3,850","sexit");
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,9,_loc10_,param2);
         _loc7_[9] = _loc9_;
         _loc9_.bg = this.§1t2115s0§(_loc8_);
         _loc9_.§1t1755s0§(§1t147s0§.§1t11369s0§);
         _loc9_.roomName = §1t1521s0§.getString(1051);
         _loc9_.isPrivate = §1t134s0§.§1t9233s0§;
         _loc9_.roomWidth = 2000;
         _loc9_.§1t1765s0§(0,50,"3,1295","sexit");
         _loc9_ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,10,_loc10_,param2);
         _loc7_[10] = _loc9_;
         _loc9_.roomWidth = 800;
         _loc9_.bg = §1t112s0§.§1t12559s0§;
         _loc9_.§1t1755s0§(§1t147s0§.§1t11391s0§);
         _loc9_.§1t1765s0§(0,50,"2,1295","sexit");
         _loc9_.§1t1765s0§(1,150,"1036","textsign");
         var _loc12_:int = this.createRoute(10,param2,_loc10_,3,_loc8_,§1t147s0§.§1t11362s0§,§1t147s0§.§1t11391s0§,_loc7_,null,null,§1t70s0§.§1t9128s0§,true);
         _loc12_ = this.createRoute(_loc12_,param2,_loc10_,2,_loc8_,§1t147s0§.§1t11392s0§,§1t147s0§.§1t11392s0§,_loc7_,null,null,§1t70s0§.§1t9128s0§,true);
         _loc12_ = this.createRoute(_loc12_,param2,_loc10_,3,_loc8_,§1t147s0§.§1t11393s0§,§1t147s0§.§1t11393s0§,_loc7_,null,null,§1t70s0§.§1t9128s0§,true);
         _loc12_ = this.createRoute(_loc12_,param2,_loc10_,6,_loc8_,§1t147s0§.§1t11394s0§,§1t147s0§.§1t11394s0§,_loc7_,null,null,§1t70s0§.§1t9128s0§,true);
         _loc12_ = this.createRoute(_loc12_,param2,_loc10_,2,_loc8_,§1t147s0§.§1t11369s0§,§1t147s0§.§1t11369s0§,_loc7_,null,null,§1t70s0§.§1t9128s0§,true);
         _loc9_ = _loc7_[_loc12_];
         _loc9_.roomWidth = 800;
         _loc9_.§1t1765s0§(19,650,§1t1523s0§.getLevel() + ",0,30020","goodlootchest1");
         _loc9_.§1t1765s0§(0,750,"2,1295","sexit");
         _loc9_.isPrivate = §1t134s0§.§1t9230s0§;
         if(param6 == -1)
         {
            param6 = §1t70s0§.§1t9181s0§;
         }
         var _loc13_:int = int(_loc7_.length);
         var _loc14_:int = 1;
         while(_loc14_ < _loc13_)
         {
            _loc9_ = _loc7_[_loc14_];
            _loc9_.§1t1784s0§(param6,param3,param1,_loc8_,param2);
            if(_loc14_ >= 10 && _loc14_ < 21)
            {
               _loc9_.roomName = §1t1521s0§.getString(1049);
            }
            param5[_loc14_] = _loc9_.output();
            this.§1t1713s0§.§1t867s0§(_loc9_);
            _loc14_++;
         }
         _loc8_.destroy();
      }
      
      internal function §1t2115s0§(param1:§1t58s0§) : int
      {
         var _loc2_:int = param1.rand(14);
         if(_loc2_ == 12)
         {
            _loc2_ = §1t112s0§.§1t12574s0§;
         }
         else if(_loc2_ == 13)
         {
            _loc2_ = §1t112s0§.§1t12575s0§;
         }
         return _loc2_;
      }
      
      internal function §1t2116s0§(param1:int, param2:int, param3:int, param4:Array, param5:int = -1) : *
      {
         var _loc7_:§1t58s0§ = null;
         var _loc6_:§1t147s0§ = this.§1t1713s0§.§1t866s0§();
         _loc6_.init(0,1,§1t112s0§.§1t12567s0§,param2);
         _loc7_ = §1t58s0§.§1t8804s0§(param2);
         _loc6_.§1t1755s0§(§1t147s0§.§1t11380s0§);
         _loc6_.roomWidth = 800;
         _loc6_.roomName = "Hut";
         _loc6_.§1t1765s0§(0,400,"-1," + param1 + ",-1,0","signpost");
         if(_loc7_.rand(3) == 0)
         {
            _loc6_.§1t1765s0§(23,_loc7_.rand(_loc6_.roomWidth),"0","procgennpc");
         }
         if(param5 == -1)
         {
            param5 = §1t70s0§.§1t9165s0§;
         }
         _loc6_.§1t1784s0§(param5,param3,param1,_loc7_,param2);
         param4[_loc6_.roomid] = _loc6_.output();
         this.§1t1713s0§.§1t867s0§(_loc6_);
         _loc7_.destroy();
      }
      
      internal function createRoute(param1:int, param2:int, param3:int, param4:int, param5:§1t58s0§, param6:int, param7:int, param8:Array, param9:Array, param10:Array, param11:int, param12:Boolean = false, param13:int = 0) : int
      {
         var _loc14_:int = 0;
         if(param3 != §1t112s0§.§1t12562s0§ && param3 != §1t112s0§.§1t12598s0§)
         {
            param13 = 0;
         }
         if(param12 && param11 != -1)
         {
            _loc14_ = param11;
         }
         else
         {
            if(param11 != -1)
            {
               _loc14_ = param5.rand(5);
            }
            else
            {
               _loc14_ = param5.rand(4);
            }
            if(_loc14_ == 4)
            {
               _loc14_ = param11;
            }
         }
         var _loc15_:§1t147s0§ = param8[param1];
         if(Boolean(_loc15_.§1t1760s0§(_loc14_)) && _loc15_.§1t1761s0§() == 4)
         {
            return -1;
         }
         while(_loc15_.§1t1760s0§(_loc14_))
         {
            if(++_loc14_ == 4)
            {
               _loc14_ = 0;
            }
         }
         var _loc16_:int = int(param8.length);
         _loc15_.§1t1756s0§(_loc14_,_loc16_);
         var _loc17_:§1t147s0§ = this.§1t1713s0§.§1t866s0§();
         _loc17_.init(0,_loc16_,param3,param2);
         param8[_loc16_] = _loc17_;
         _loc17_.§1t1763s0§(_loc14_,param1);
         if(--param4 <= 1)
         {
            _loc17_.§1t1755s0§(param6,param13);
            if(param9 != null)
            {
               param9[param6].push(_loc16_);
            }
            if(param10 != null && param6 == §1t147s0§.§1t11361s0§)
            {
               param10.push(_loc16_);
            }
            return _loc16_;
         }
         _loc17_.§1t1755s0§(param7,param13);
         if(param9 != null)
         {
            param9[param7].push(_loc16_);
         }
         if(param10 != null && param7 == §1t147s0§.§1t11361s0§)
         {
            param10.push(_loc16_);
         }
         return this.createRoute(_loc16_,param2,param3,param4,param5,param6,param7,param8,param9,param10,_loc14_,param12,param13);
      }
      
      internal function §1t2117s0§() : Array
      {
         var _loc1_:* = new Array(§1t147s0§.§1t11407s0§);
         var _loc2_:int = 0;
         while(_loc2_ < §1t147s0§.§1t11407s0§)
         {
            _loc1_[_loc2_] = new Array();
            _loc2_++;
         }
         return _loc1_;
      }
      
      internal function §1t2118s0§(param1:int, param2:int, param3:int, param4:§1t58s0§, param5:int, param6:Array, param7:int, param8:int, param9:int) : int
      {
         var _loc12_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc10_:int = int(param6[param1].getEnterFrom());
         if(_loc10_ == §1t70s0§.§1t9128s0§)
         {
            param5 = §1t70s0§.§1t9129s0§;
         }
         else if(_loc10_ == §1t70s0§.§1t9129s0§)
         {
            param5 = §1t70s0§.§1t9128s0§;
         }
         else if(_loc10_ == §1t70s0§.§1t9130s0§)
         {
            param5 = §1t70s0§.§1t9131s0§;
         }
         else if(_loc10_ == §1t70s0§.§1t9131s0§)
         {
            param5 = §1t70s0§.§1t9130s0§;
         }
         var _loc11_:int = Math.ceil(param7 / 20);
         var _loc13_:int = 3 + param4.rand(_loc11_);
         var _loc14_:int = 2;
         var _loc15_:int = 2;
         var _loc16_:int = 1 + param4.rand(_loc11_);
         var _loc17_:Array = this.§1t2117s0§();
         var _loc18_:Array = new Array();
         var _loc19_:int = _loc12_ = this.createRoute(param1,param2,param3,_loc13_,param4,§1t147s0§.§1t11368s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,param5,false,param8);
         if(param6[_loc12_].§1t1769s0§())
         {
            _loc20_ = this.createRoute(_loc12_,param2,param3,1,param4,§1t147s0§.§1t11384s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,null,§1t70s0§.§1t9131s0§,true,param9);
         }
         else
         {
            _loc20_ = this.createRoute(_loc12_,param2,param3,1,param4,§1t147s0§.§1t11384s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,null,§1t70s0§.§1t9128s0§,true,param9);
         }
         if(_loc17_[§1t147s0§.§1t11361s0§].length > 0)
         {
            _loc12_ = int(_loc18_[param4.rand(_loc18_.length)]);
            this.createRoute(_loc12_,param2,param3,1 + param4.rand(_loc14_),param4,§1t147s0§.§1t11363s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,null,-1,false,param8);
         }
         else
         {
            param6[_loc19_].§1t1755s0§(§1t147s0§.§1t11361s0§);
         }
         if(_loc18_.length > 0)
         {
            _loc21_ = 0;
            while(_loc21_ < _loc16_)
            {
               _loc12_ = int(_loc18_[param4.rand(_loc18_.length)]);
               this.createRoute(_loc12_,param2,param3,1 + param4.rand(_loc15_),param4,§1t147s0§.§1t11364s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,null,-1,false,param8);
               _loc21_++;
            }
         }
         return _loc20_;
      }
      
      internal function §1t2119s0§(param1:int, param2:int, param3:int, param4:§1t58s0§, param5:int, param6:Array, param7:int, param8:int = 0, param9:int = 0, param10:Boolean = false) : int
      {
         var _loc13_:int = 0;
         var _loc20_:int = 0;
         var _loc11_:int = int(param6[param1].getEnterFrom());
         if(_loc11_ == §1t70s0§.§1t9128s0§)
         {
            param5 = §1t70s0§.§1t9129s0§;
         }
         else if(_loc11_ == §1t70s0§.§1t9129s0§)
         {
            param5 = §1t70s0§.§1t9128s0§;
         }
         else if(_loc11_ == §1t70s0§.§1t9130s0§)
         {
            param5 = §1t70s0§.§1t9131s0§;
         }
         else if(_loc11_ == §1t70s0§.§1t9131s0§)
         {
            param5 = §1t70s0§.§1t9130s0§;
         }
         var _loc12_:int = Math.ceil(param7 / 20);
         var _loc14_:int = 3 + param4.rand(_loc12_);
         var _loc15_:int = 2;
         var _loc16_:int = 1 + param4.rand(_loc12_);
         var _loc17_:Array = this.§1t2117s0§();
         var _loc18_:Array = new Array();
         var _loc19_:int = this.createRoute(param1,param2,param3,_loc14_,param4,§1t147s0§.§1t11384s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,param5,false,param8);
         if(_loc18_.length > 0 && !param10)
         {
            _loc20_ = 0;
            while(_loc20_ < _loc16_)
            {
               _loc13_ = int(_loc18_[param4.rand(_loc18_.length)]);
               this.createRoute(_loc13_,param2,param3,1 + param4.rand(_loc15_),param4,§1t147s0§.§1t11364s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,null,-1,false,param8);
               _loc20_++;
            }
         }
         return _loc19_;
      }
      
      internal function §1t2120s0§(param1:int, param2:int, param3:int, param4:§1t58s0§, param5:int, param6:Array, param7:int, param8:int, param9:int) : int
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc14_:int = 0;
         var _loc19_:int = 0;
         var _loc10_:int = Math.ceil(param7 / 20);
         var _loc13_:int = 3;
         if(param7 >= 40)
         {
            _loc13_ = 3 + param4.rand(2);
         }
         var _loc15_:int = 2;
         var _loc16_:int = 1;
         var _loc17_:Array = this.§1t2117s0§();
         var _loc18_:Array = new Array();
         if(param5 == §1t70s0§.§1t9130s0§ || param5 == §1t70s0§.§1t9131s0§)
         {
            _loc12_ = this.createRoute(param1,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,param5,true,param8);
            _loc11_ = this.createRoute(_loc12_,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,§1t70s0§.§1t9128s0§,true,param8);
            _loc11_ = this.createRoute(_loc11_,param2,param3,_loc13_,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,param5,true,param8);
            _loc14_ = this.createRoute(_loc11_,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,§1t70s0§.§1t9129s0§,true,param8);
            _loc11_ = this.createRoute(_loc12_,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,§1t70s0§.§1t9129s0§,true,param8);
            _loc11_ = this.createRoute(_loc11_,param2,param3,_loc13_,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,param5,true,param8);
            param6[_loc11_].§1t1756s0§(§1t70s0§.§1t9128s0§,_loc14_);
            param6[_loc14_].§1t1763s0§(§1t70s0§.§1t9128s0§,_loc11_);
         }
         else
         {
            _loc12_ = this.createRoute(param1,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,param5,true,param8);
            _loc11_ = this.createRoute(_loc12_,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,§1t70s0§.§1t9130s0§,true,param8);
            _loc11_ = this.createRoute(_loc11_,param2,param3,_loc13_,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,param5,true,param8);
            _loc14_ = this.createRoute(_loc11_,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,§1t70s0§.§1t9131s0§,true,param8);
            _loc11_ = this.createRoute(_loc12_,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,§1t70s0§.§1t9131s0§,true,param8);
            _loc11_ = this.createRoute(_loc11_,param2,param3,_loc13_,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,_loc18_,param5,true,param8);
            param6[_loc11_].§1t1756s0§(§1t70s0§.§1t9130s0§,_loc14_);
            param6[_loc14_].§1t1763s0§(§1t70s0§.§1t9130s0§,_loc11_);
         }
         _loc14_ = this.createRoute(_loc14_,param2,param3,1,param4,§1t147s0§.§1t11384s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,null,param5,true,param8);
         if(_loc18_.length > 0)
         {
            _loc19_ = 0;
            while(_loc19_ < _loc16_)
            {
               _loc11_ = int(_loc18_[param4.rand(_loc18_.length)]);
               this.createRoute(_loc11_,param2,param3,1 + param4.rand(_loc15_),param4,§1t147s0§.§1t11364s0§,§1t147s0§.§1t11361s0§,param6,_loc17_,null,-1,false,param8);
               _loc19_++;
            }
         }
         return _loc14_;
      }
      
      internal function §1t2121s0§(param1:int, param2:int, param3:int, param4:§1t58s0§, param5:int, param6:Array, param7:int, param8:int, param9:int) : int
      {
         var _loc11_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc20_:int = 0;
         var _loc10_:int = Math.ceil(param7 / 20);
         var _loc12_:int = 3;
         if(param7 >= 40)
         {
            _loc12_ = 3 + param4.rand(2);
         }
         var _loc16_:int = 2;
         var _loc17_:int = 1;
         var _loc18_:Array = this.§1t2117s0§();
         var _loc19_:Array = new Array();
         _loc11_ = this.createRoute(param1,param2,param3,1,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,_loc19_,param5,true,param8);
         _loc13_ = this.createRoute(_loc11_,param2,param3,_loc12_,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,_loc19_,-1,true,param8);
         _loc14_ = this.createRoute(_loc11_,param2,param3,_loc12_,param4,§1t147s0§.§1t11361s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,_loc19_,-1,true,param8);
         if(param4.rand(2) == 0)
         {
            _loc15_ = this.createRoute(_loc13_,param2,param3,1,param4,§1t147s0§.§1t11384s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,null,param5,true,param8);
            this.createRoute(_loc14_,param2,param3,1,param4,§1t147s0§.§1t11366s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,null,param5,true,param8);
         }
         else
         {
            _loc15_ = this.createRoute(_loc14_,param2,param3,1,param4,§1t147s0§.§1t11384s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,null,param5,true,param8);
            this.createRoute(_loc13_,param2,param3,1,param4,§1t147s0§.§1t11366s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,null,param5,true,param8);
         }
         if(_loc19_.length > 0)
         {
            _loc20_ = 0;
            while(_loc20_ < _loc17_)
            {
               _loc11_ = int(_loc19_[param4.rand(_loc19_.length)]);
               this.createRoute(_loc11_,param2,param3,1 + param4.rand(_loc16_),param4,§1t147s0§.§1t11364s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,null,-1,false,param8);
               _loc20_++;
            }
         }
         return _loc15_;
      }
      
      internal function §1t2122s0§(param1:int, param2:int, param3:int, param4:§1t58s0§, param5:int, param6:Array, param7:int, param8:int, param9:int) : int
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc21_:int = 0;
         var _loc10_:int = Math.ceil(param7 / 20);
         var _loc13_:int = 5 + param4.rand(_loc10_);
         var _loc14_:int = 3;
         var _loc15_:int = 2;
         var _loc16_:int = 2;
         var _loc17_:int = 1 + param4.rand(_loc10_);
         var _loc18_:Array = this.§1t2117s0§();
         var _loc19_:Array = new Array();
         this.createRoute(param1,param2,param3,_loc13_,param4,§1t147s0§.§1t11386s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,_loc19_,param5,false,param8);
         _loc11_ = int(_loc19_[param4.rand(_loc19_.length)]);
         var _loc20_:int = this.createRoute(_loc11_,param2,param3,_loc14_,param4,§1t147s0§.§1t11385s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,_loc19_,-1,false,param8);
         if(param6[_loc20_].§1t1769s0§())
         {
            _loc12_ = this.createRoute(_loc20_,param2,param3,1,param4,§1t147s0§.§1t11384s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,null,§1t70s0§.§1t9131s0§,true,param9);
         }
         else
         {
            _loc12_ = this.createRoute(_loc20_,param2,param3,1,param4,§1t147s0§.§1t11384s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,null,§1t70s0§.§1t9128s0§,true,param9);
         }
         var _loc22_:int = 0;
         var _loc23_:int = 1;
         var _loc24_:* = 0;
         while(_loc24_ < _loc15_ - 1)
         {
            _loc11_ = int(_loc19_[param4.rand(_loc19_.length)]);
            _loc21_ = this.createRoute(_loc11_,param2,param3,_loc14_ + param4.rand(2),param4,§1t147s0§.§1t11386s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,_loc19_,-1,false,param8);
            if(_loc21_ == -1)
            {
               _loc24_--;
               if(++_loc22_ > _loc19_.length)
               {
                  param6[_loc11_].§1t1755s0§(§1t147s0§.§1t11386s0§);
                  _loc23_++;
                  break;
               }
            }
            else
            {
               _loc23_++;
            }
            _loc24_++;
         }
         if(_loc23_ < 2)
         {
            param6[_loc20_].§1t1755s0§(§1t147s0§.§1t11361s0§);
         }
         if(_loc19_.length > 0)
         {
            _loc24_ = 0;
            while(_loc24_ < _loc17_)
            {
               _loc11_ = int(_loc19_[param4.rand(_loc19_.length)]);
               this.createRoute(_loc11_,param2,param3,1 + param4.rand(_loc16_),param4,§1t147s0§.§1t11364s0§,§1t147s0§.§1t11361s0§,param6,_loc18_,null,-1,false,param8);
               _loc24_++;
            }
         }
         return _loc12_;
      }
      
      internal function §1t2123s0§(param1:Array, param2:§1t58s0§) : Array
      {
         var _loc3_:Array = [];
         while(param1.length > 0)
         {
            _loc3_.push(param1.splice(param2.rand(param1.length),1));
         }
         return _loc3_;
      }
      
      internal function §1t1964s0§(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:§1t71s0§, param7:uint, param8:int = -1) : *
      {
         var _loc11_:§1t147s0§ = null;
         var _loc14_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:String = null;
         var _loc27_:int = 0;
         var _loc30_:int = 0;
         if(param4 == §1t70s0§.§1t9129s0§ || param4 == §1t70s0§.§1t9131s0§)
         {
            param4 = §1t70s0§.§1t9130s0§;
         }
         var _loc9_:Array = new Array();
         var _loc10_:§1t58s0§ = §1t58s0§.§1t8804s0§(param2);
         var _loc12_:int = param6.§1t1339s0§();
         var _loc13_:int = param6.§1t1342s0§();
         if(param2 == 8906733)
         {
            _loc12_ = 5;
            if(§1t1523s0§.§1t641s0§(44))
            {
               _loc13_ = 7;
            }
            else
            {
               _loc13_ = 6;
            }
         }
         switch(_loc12_)
         {
            case 0:
               break;
            case 1:
               _loc14_ = §1t112s0§.§1t12574s0§;
               break;
            case 2:
               _loc14_ = §1t112s0§.§1t12570s0§;
               break;
            case 3:
               _loc14_ = §1t112s0§.§1t12571s0§;
               break;
            case 4:
               _loc14_ = §1t112s0§.§1t12572s0§;
               break;
            case 5:
               _loc14_ = §1t112s0§.§1t12572s0§;
         }
         var _loc15_:int = 1;
         _loc11_ = this.§1t1713s0§.§1t866s0§();
         _loc11_.init(0,1,_loc14_,param2);
         _loc9_[_loc15_] = _loc11_;
         _loc9_[_loc15_].§1t1755s0§(§1t147s0§.§1t11372s0§);
         if(param4 == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§)
         {
            _loc9_[_loc15_].§1t1765s0§(0,50,"-1," + param1,"signpost");
         }
         else
         {
            _loc9_[_loc15_].§1t1765s0§(0,750,"-1," + param1,"signpost");
         }
         _loc15_ = this.createRoute(_loc15_,param2,_loc14_,1,_loc10_,§1t147s0§.§1t11371s0§,§1t147s0§.§1t11371s0§,_loc9_,null,null,param4,true);
         var _loc16_:int = this.createRoute(_loc15_,param2,_loc14_,6,_loc10_,§1t147s0§.§1t11377s0§,§1t147s0§.§1t11371s0§,_loc9_,null,null,param4);
         var _loc17_:int = 2;
         this.createRoute(_loc17_,param2,_loc14_,3,_loc10_,§1t147s0§.§1t11374s0§,§1t147s0§.§1t11374s0§,_loc9_,null,null,-1);
         var _loc18_:int = _loc10_.rand(2) + 3;
         this.createRoute(_loc18_,param2,_loc14_,3,_loc10_,§1t147s0§.§1t11375s0§,§1t147s0§.§1t11375s0§,_loc9_,null,null,-1);
         var _loc19_:int = 5;
         this.createRoute(_loc19_,param2,_loc14_,3,_loc10_,§1t147s0§.§1t11376s0§,§1t147s0§.§1t11376s0§,_loc9_,null,null,-1);
         var _loc20_:Array = [§1t8615s0§.§1t12639s0§,§1t8615s0§.§1t12636s0§,§1t8615s0§.§1t12640s0§];
         var _loc21_:Array = [§1t8615s0§.§1t12641s0§,§1t8615s0§.§1t12635s0§,§1t8615s0§.§1t12632s0§];
         var _loc22_:Array = [§1t8615s0§.§1t12638s0§,§1t8615s0§.§1t12634s0§];
         var _loc23_:Array = [§1t8615s0§.§1t12633s0§,§1t8615s0§.§1t12637s0§];
         var _loc24_:Array = this.§1t2123s0§(_loc20_,_loc10_);
         _loc24_ = _loc24_.concat(this.§1t2123s0§(_loc21_,_loc10_));
         _loc24_ = _loc24_.concat(15);
         _loc24_ = _loc24_.concat(_loc22_);
         _loc24_ = _loc24_.concat(this.§1t2123s0§(_loc23_,_loc10_));
         _loc24_ = _loc24_.concat([15,15]);
         if(param8 == -1)
         {
            param8 = §1t70s0§.§1t9178s0§;
         }
         if(_loc12_ == 1)
         {
            if(param8 != §1t70s0§.§1t9183s0§)
            {
               param8 = §1t70s0§.§1t9177s0§;
            }
            _loc25_ = 1;
            while(_loc25_ < 3)
            {
               _loc9_[_loc25_].§1t1755s0§(§1t147s0§.§1t11361s0§);
               _loc25_++;
            }
         }
         if(_loc12_ <= 2)
         {
            _loc9_[3].§1t1758s0§();
            _loc9_[_loc17_].§1t1762s0§(_loc9_[8].getEnterFrom());
            _loc9_[_loc18_].§1t1762s0§(_loc9_[10].getEnterFrom());
            _loc25_ = 4;
            while(_loc25_ < _loc9_.length)
            {
               _loc9_[_loc25_].§1t1755s0§(§1t147s0§.§1t11359s0§);
               _loc25_++;
            }
         }
         else if(_loc12_ == 3)
         {
            _loc9_[4].§1t1758s0§();
            _loc9_[_loc18_].§1t1762s0§(_loc9_[10].getEnterFrom());
            _loc9_[8].§1t1758s0§();
            _loc25_ = 5;
            while(_loc25_ < _loc9_.length)
            {
               if(_loc25_ != 8)
               {
                  _loc9_[_loc25_].§1t1755s0§(§1t147s0§.§1t11359s0§);
               }
               _loc25_++;
            }
         }
         else if(_loc12_ == 4)
         {
            _loc9_[5].§1t1758s0§();
            _loc9_[_loc19_].§1t1762s0§(_loc9_[12].getEnterFrom());
            _loc9_[10].§1t1758s0§();
            _loc25_ = 6;
            while(_loc25_ < _loc9_.length)
            {
               if(_loc25_ != 8 && _loc25_ != 9 && _loc25_ != 10)
               {
                  _loc9_[_loc25_].§1t1755s0§(§1t147s0§.§1t11359s0§);
               }
               _loc25_++;
            }
         }
         else if(_loc12_ == 5)
         {
            this.§1t2125s0§(_loc9_,_loc16_,param2,param3,_loc10_,param6,_loc13_);
            _loc9_[7].roomWidth = 3 * 355;
            _loc9_[7].§1t1782s0§(param8,param3,_loc13_,_loc10_,param6.§1t1328s0§());
         }
         var _loc28_:int = 1;
         while(_loc28_ < 14)
         {
            _loc11_ = _loc9_[_loc28_];
            if(_loc11_.§1t928s0§() != §1t147s0§.§1t11359s0§)
            {
               _loc11_.§1t1772s0§(param7);
               if(_loc28_ == 1)
               {
                  if(_loc12_ <= 2)
                  {
                     _loc26_ = §1t1521s0§.getString(853);
                  }
                  else if(_loc12_ == 3)
                  {
                     _loc26_ = §1t1521s0§.getString(854);
                  }
                  else if(_loc12_ == 4)
                  {
                     _loc26_ = §1t1521s0§.getString(855);
                  }
                  else if(_loc12_ == 5)
                  {
                     _loc26_ = §1t1521s0§.getString(856);
                  }
               }
               else if(_loc28_ <= 7)
               {
                  _loc26_ = §1t1521s0§.getString(1043);
               }
               else if(_loc28_ <= 9)
               {
                  _loc26_ = §1t1521s0§.getString(857);
               }
               else if(_loc28_ <= 11)
               {
                  _loc26_ = §1t1521s0§.getString(858);
               }
               else if(_loc28_ <= 13)
               {
                  _loc26_ = §1t1521s0§.getString(859);
               }
               if(_loc28_ == 7)
               {
                  _loc27_ = 3;
               }
               else if(_loc10_.rand(2) == 0)
               {
                  _loc27_ = 3;
               }
               else
               {
                  _loc27_ = 5;
               }
               if(_loc12_ > 1)
               {
                  _loc30_ = _loc11_.§1t1777s0§(_loc27_,_loc24_[_loc28_ - 1],_loc26_,_loc10_);
                  if(_loc24_[_loc28_ - 1] == §1t8615s0§.§1t12636s0§)
                  {
                     this.§1t2124s0§(_loc9_,_loc30_,_loc11_,_loc10_);
                  }
                  else if(_loc24_[_loc28_ - 1] == §1t8615s0§.§1t12633s0§)
                  {
                     this.§1t2126s0§(_loc9_,_loc30_,_loc11_,_loc10_);
                  }
               }
               else
               {
                  _loc11_.roomName = _loc26_;
               }
               _loc11_.§1t1784s0§(param8,param3,param1,_loc10_,param2);
               param5[_loc28_] = _loc11_.output(_loc10_);
               this.§1t1713s0§.§1t867s0§(_loc11_);
            }
            _loc28_++;
         }
         if(_loc12_ == 5)
         {
            _loc28_ = 14;
            while(_loc28_ <= 40)
            {
               _loc11_ = _loc9_[_loc28_];
               if(_loc11_ == null)
               {
                  break;
               }
               _loc11_.§1t1782s0§(param8,param3,_loc13_,_loc10_,param6.§1t1328s0§());
               param5[_loc28_] = _loc11_.output(_loc10_);
               this.§1t1713s0§.§1t867s0§(_loc11_);
               _loc28_++;
            }
         }
         var _loc29_:int = int(_loc9_.length);
         _loc28_ = 100;
         while(_loc28_ < _loc29_)
         {
            _loc11_ = _loc9_[_loc28_];
            if(_loc11_ != null)
            {
               _loc11_.§1t1784s0§(param8,param3,param1,_loc10_,param2);
               param5[_loc28_] = _loc11_.output(_loc10_);
               this.§1t1713s0§.§1t867s0§(_loc11_);
            }
            _loc28_++;
         }
         _loc10_.destroy();
      }
      
      internal function §1t2124s0§(param1:Array, param2:int, param3:§1t147s0§, param4:§1t58s0§) : *
      {
         var _loc5_:int = 0;
         if(param3.§1t1769s0§())
         {
            _loc5_ = §1t70s0§.§1t9130s0§;
         }
         else
         {
            _loc5_ = §1t70s0§.§1t9128s0§;
         }
         var _loc6_:int = 100;
         var _loc7_:int = §1t112s0§.§1t12585s0§;
         var _loc8_:§1t147s0§ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,_loc6_,_loc7_,param3.nodeid);
         param1[_loc6_] = _loc8_;
         param1[_loc6_].§1t1755s0§(§1t147s0§.§1t11387s0§);
         param1[_loc6_].roomWidth = 1100;
         param1[_loc6_].roomName = "Inn";
         var _loc9_:int = param2 * 355 + 355 / 2;
         param1[_loc6_].§1t1765s0§(0,50,param3.roomid + "," + _loc9_,"signpost");
         if(param4.rand(3) == 0 || param3.nodeid == 8480780)
         {
            param1[_loc6_].§1t1753s0§(1);
            _loc6_ = this.createRoute(_loc6_,param3.nodeid,§1t112s0§.§1t12587s0§,1,param4,§1t147s0§.§1t11369s0§,§1t147s0§.§1t11369s0§,param1,null,null,_loc5_,true);
            param1[_loc6_].roomWidth = 1000;
            param1[_loc6_].roomName = "Inn";
         }
      }
      
      internal function §1t2125s0§(param1:Array, param2:int, param3:int, param4:int, param5:§1t58s0§, param6:§1t71s0§, param7:int) : *
      {
         var _loc8_:§1t147s0§ = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:Array = null;
         var _loc23_:Array = null;
         var _loc24_:Array = null;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:Array = null;
         var _loc30_:Array = null;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         _loc8_ = param1[param2];
         if(_loc8_.enterFrom == 0)
         {
            _loc9_ = 1;
         }
         else if(_loc8_.enterFrom == 1)
         {
            _loc9_ = 0;
         }
         else if(_loc8_.enterFrom == 2)
         {
            _loc9_ = 3;
         }
         else if(_loc8_.enterFrom == 3)
         {
            _loc9_ = 2;
         }
         if(param6.§1t1328s0§())
         {
            _loc8_.§1t1757s0§(_loc8_.enterFrom);
            if(_loc8_.enterFrom == 0 || _loc8_.enterFrom == 2)
            {
               param1[7].§1t1765s0§(0,1015,"-2","leavesign");
            }
            else
            {
               param1[7].§1t1765s0§(0,50,"-2","leavesign");
            }
         }
         var _loc11_:int = 18;
         var _loc12_:int = 21;
         var _loc13_:int = 21;
         var _loc14_:int = 27;
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,14,§1t112s0§.§1t12550s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11398s0§);
         param1[14] = _loc8_;
         if(_loc9_ == §1t70s0§.§1t9128s0§ || _loc9_ == §1t70s0§.§1t9129s0§)
         {
            _loc10_ = this.createRoute(14,param3,§1t112s0§.§1t12550s0§,3,param5,§1t147s0§.§1t11398s0§,§1t147s0§.§1t11398s0§,param1,null,null,§1t70s0§.§1t9128s0§,true);
            _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12550s0§,1,param5,§1t147s0§.§1t11398s0§,§1t147s0§.§1t11398s0§,param1,null,null,§1t70s0§.§1t9130s0§,true);
            _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12550s0§,3,param5,§1t147s0§.§1t11398s0§,§1t147s0§.§1t11398s0§,param1,null,null,§1t70s0§.§1t9129s0§,true);
            param1[_loc10_].§1t1756s0§(§1t70s0§.§1t9131s0§,14);
            param1[14].§1t1756s0§(§1t70s0§.§1t9130s0§,_loc10_);
            param1[14].enterFrom = -2;
            param1[15].enterFrom = -2;
            param1[16].enterFrom = -3;
            param1[17].enterFrom = -2;
            param1[18].enterFrom = -2;
            param1[19].enterFrom = -3;
            param1[14].roomWidth = 1500;
            param1[14].§1t1753s0§(1);
            param1[15].roomWidth = 2500;
            param1[15].§1t1753s0§(1);
            param1[16].roomWidth = 3000;
            param1[16].§1t1753s0§(1);
            param1[17].roomWidth = 1500;
            param1[18].roomWidth = 2500;
            param1[19].roomWidth = 3000;
            if(_loc9_ == §1t70s0§.§1t9128s0§)
            {
               param1[param2].§1t1756s0§(§1t70s0§.§1t9128s0§,14);
               param1[14].§1t1756s0§(§1t70s0§.§1t9129s0§,param2);
               param1[14].§1t1755s0§(§1t147s0§.§1t11404s0§);
            }
            else if(_loc9_ == §1t70s0§.§1t9129s0§)
            {
               param1[param2].§1t1756s0§(§1t70s0§.§1t9129s0§,17);
               param1[17].§1t1756s0§(§1t70s0§.§1t9128s0§,param2);
               param1[17].§1t1755s0§(§1t147s0§.§1t11404s0§);
            }
            _loc29_ = [18,19];
            _loc30_ = [21,22];
            _loc18_ = param5.rand(_loc29_.length);
            _loc11_ = int(_loc29_[_loc18_]);
            _loc12_ = int(_loc30_[_loc18_]);
         }
         else
         {
            _loc10_ = this.createRoute(14,param3,§1t112s0§.§1t12550s0§,3,param5,§1t147s0§.§1t11398s0§,§1t147s0§.§1t11398s0§,param1,null,null,§1t70s0§.§1t9130s0§,true);
            _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12550s0§,1,param5,§1t147s0§.§1t11398s0§,§1t147s0§.§1t11398s0§,param1,null,null,§1t70s0§.§1t9129s0§,true);
            _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12550s0§,3,param5,§1t147s0§.§1t11398s0§,§1t147s0§.§1t11398s0§,param1,null,null,§1t70s0§.§1t9131s0§,true);
            param1[_loc10_].§1t1756s0§(§1t70s0§.§1t9128s0§,14);
            param1[14].§1t1756s0§(§1t70s0§.§1t9129s0§,_loc10_);
            param1[14].enterFrom = -3;
            param1[15].enterFrom = -3;
            param1[16].enterFrom = -2;
            param1[17].enterFrom = -3;
            param1[18].enterFrom = -3;
            param1[19].enterFrom = -2;
            param1[14].roomWidth = 1500;
            param1[14].§1t1753s0§(1);
            param1[15].roomWidth = 3000;
            param1[15].§1t1753s0§(1);
            param1[16].roomWidth = 3000;
            param1[17].roomWidth = 1500;
            param1[18].roomWidth = 3000;
            param1[19].roomWidth = 3000;
            param1[19].§1t1753s0§(1);
            if(_loc9_ == §1t70s0§.§1t9130s0§)
            {
               param1[param2].§1t1756s0§(§1t70s0§.§1t9130s0§,14);
               param1[14].§1t1756s0§(§1t70s0§.§1t9131s0§,param2);
               param1[14].§1t1755s0§(§1t147s0§.§1t11404s0§);
            }
            else if(_loc9_ == §1t70s0§.§1t9131s0§)
            {
               param1[param2].§1t1756s0§(§1t70s0§.§1t9131s0§,17);
               param1[17].§1t1756s0§(§1t70s0§.§1t9130s0§,param2);
               param1[17].§1t1755s0§(§1t147s0§.§1t11404s0§);
            }
            _loc29_ = [16,18];
            _loc30_ = [21,22];
            _loc18_ = param5.rand(_loc29_.length);
            _loc11_ = int(_loc29_[_loc18_]);
            _loc12_ = int(_loc30_[_loc18_]);
         }
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,20,§1t112s0§.§1t12600s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11400s0§);
         param1[20] = _loc8_;
         _loc10_ = this.createRoute(20,param3,§1t112s0§.§1t12600s0§,1,param5,§1t147s0§.§1t11400s0§,§1t147s0§.§1t11400s0§,param1,null,null,§1t70s0§.§1t9130s0§,true);
         _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12600s0§,1,param5,§1t147s0§.§1t11400s0§,§1t147s0§.§1t11400s0§,param1,null,null,§1t70s0§.§1t9129s0§,true);
         _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12600s0§,1,param5,§1t147s0§.§1t11400s0§,§1t147s0§.§1t11400s0§,param1,null,null,§1t70s0§.§1t9131s0§,true);
         param1[_loc10_].§1t1756s0§(§1t70s0§.§1t9128s0§,20);
         param1[20].§1t1756s0§(§1t70s0§.§1t9129s0§,_loc10_);
         param1[20].enterFrom = -3;
         param1[21].enterFrom = -2;
         param1[22].enterFrom = -3;
         param1[23].enterFrom = -2;
         param1[20].roomWidth = 3000;
         param1[20].§1t1753s0§(1);
         param1[21].roomWidth = 3000;
         param1[22].roomWidth = 3000;
         param1[23].roomWidth = 3000;
         param1[23].§1t1753s0§(1);
         var _loc15_:Array = [21,22];
         var _loc16_:Array = [27,29];
         _loc17_ = _loc15_.indexOf(_loc12_);
         if(_loc17_ != -1)
         {
            _loc15_.splice(_loc17_,1);
            _loc16_.splice(_loc17_,1);
         }
         _loc18_ = param5.rand(_loc15_.length);
         _loc13_ = int(_loc15_[_loc18_]);
         _loc14_ = int(_loc16_[_loc18_]);
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,24,§1t112s0§.§1t12592s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11401s0§);
         param1[24] = _loc8_;
         _loc10_ = this.createRoute(24,param3,§1t112s0§.§1t12592s0§,3,param5,§1t147s0§.§1t11401s0§,§1t147s0§.§1t11401s0§,param1,null,null,§1t70s0§.§1t9130s0§,true);
         _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12592s0§,3,param5,§1t147s0§.§1t11401s0§,§1t147s0§.§1t11401s0§,param1,null,null,§1t70s0§.§1t9129s0§,true);
         _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12592s0§,3,param5,§1t147s0§.§1t11401s0§,§1t147s0§.§1t11401s0§,param1,null,null,§1t70s0§.§1t9131s0§,true);
         _loc10_ = this.createRoute(_loc10_,param3,§1t112s0§.§1t12592s0§,1,param5,§1t147s0§.§1t11401s0§,§1t147s0§.§1t11401s0§,param1,null,null,§1t70s0§.§1t9128s0§,true);
         param1[_loc10_].§1t1756s0§(§1t70s0§.§1t9128s0§,24);
         param1[24].§1t1756s0§(§1t70s0§.§1t9129s0§,_loc10_);
         param1[24].enterFrom = -3;
         param1[25].enterFrom = -3;
         param1[26].enterFrom = -2;
         param1[27].enterFrom = -2;
         param1[28].enterFrom = -3;
         param1[29].enterFrom = -3;
         param1[30].enterFrom = -2;
         param1[31].enterFrom = -2;
         param1[24].roomWidth = 2000;
         param1[25].roomWidth = 2000;
         param1[26].roomWidth = 2000;
         param1[27].roomWidth = 2000;
         param1[28].roomWidth = 2000;
         param1[29].roomWidth = 2000;
         param1[30].roomWidth = 2000;
         param1[31].roomWidth = 2000;
         if(_loc14_ != 27)
         {
            param1[27].§1t1753s0§(3);
         }
         if(_loc14_ != 29)
         {
            param1[29].§1t1753s0§(3);
         }
         _loc10_ = this.createRoute(31,param3,§1t112s0§.§1t12588s0§,4,param5,§1t147s0§.§1t11402s0§,§1t147s0§.§1t11402s0§,param1,null,null,§1t70s0§.§1t9130s0§,true);
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,24,§1t112s0§.§1t12589s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11379s0§);
         _loc8_.roomWidth = 800;
         _loc8_.§1t1753s0§(5);
         param1[35] = _loc8_;
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,24,§1t112s0§.§1t12589s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11379s0§);
         _loc8_.roomWidth = 800;
         _loc8_.§1t1753s0§(6);
         param1[36] = _loc8_;
         param1[32].§1t1756s0§(§1t70s0§.§1t9129s0§,35);
         param1[34].§1t1756s0§(§1t70s0§.§1t9128s0§,36);
         param1[36].§1t1765s0§(0,100,"34," + param1[34].roomWidth / 2 + ",-1,0,1,3","sexit");
         param1[35].§1t1765s0§(0,700,"32," + param1[32].roomWidth / 2 + ",-1,0,0,2","nexit");
         if(_loc14_ != 27)
         {
            param1[27].§1t1756s0§(§1t70s0§.§1t9131s0§,34);
            param1[34].§1t1756s0§(§1t70s0§.§1t9130s0§,27);
         }
         if(_loc14_ != 29)
         {
            param1[35].§1t1765s0§(0,100,"29," + param1[29].roomWidth / 2 + ",-1,0,1,3","sexit");
            param1[29].§1t1756s0§(§1t70s0§.§1t9128s0§,35);
            param1[35].§1t1753s0§(6);
         }
         param1[36].§1t1765s0§(0,700,"25," + param1[25].roomWidth / 2 + ",-1,0,0,2","nexit");
         param1[25].§1t1756s0§(§1t70s0§.§1t9129s0§,36);
         if(_loc14_ != 27)
         {
            param1[34].roomWidth = 1420;
            param1[34].§1t1753s0§(3);
         }
         else
         {
            param1[34].roomWidth = 1330;
            param1[34].§1t1753s0§(5);
         }
         param1[_loc11_].§1t1765s0§(63,param1[_loc11_].roomWidth / 4,_loc12_ + "," + param1[_loc12_].roomWidth / 2 + "," + param7,"outergate");
         param1[_loc12_].§1t1765s0§(0,param1[_loc12_].roomWidth / 2,_loc11_ + "," + param1[_loc11_].roomWidth / 2,"outergate");
         param1[_loc11_].§1t1755s0§(§1t147s0§.§1t11399s0§);
         param1[_loc13_].§1t1765s0§(63,param1[_loc13_].roomWidth / 4,_loc14_ + "," + param1[_loc14_].roomWidth / 2 + "," + param7,"innergate");
         param1[_loc14_].§1t1765s0§(0,param1[_loc14_].roomWidth / 2,_loc13_ + "," + param1[_loc13_].roomWidth / 2,"outergate");
         param1[_loc13_].§1t1755s0§(§1t147s0§.§1t11399s0§);
         param1[33].§1t1754s0§(§1t112s0§.§1t12601s0§);
         param1[33].§1t1755s0§(§1t147s0§.§1t11403s0§);
         param1[33].roomWidth = 1610;
         param1[33].§1t1753s0§(3);
         param1[33].§1t1765s0§(0,800,"37,150","stairsupsign");
         param1[33].§1t1765s0§(64,800,"1,1","stairs");
         param1[33].roomName = §1t1521s0§.getString(780) + " 1";
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,37,§1t112s0§.§1t12601s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11403s0§);
         _loc8_.roomWidth = 1610;
         _loc8_.§1t1765s0§(0,50,"33,800","stairsdownsign");
         _loc8_.§1t1765s0§(0,1550,"38,150","stairsupsign");
         _loc8_.§1t1765s0§(64,1550,"2,1","stairs");
         _loc8_.roomName = §1t1521s0§.getString(780) + " 2";
         param1[37] = _loc8_;
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,38,§1t112s0§.§1t12601s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11403s0§);
         _loc8_.roomWidth = 1610;
         _loc8_.§1t1765s0§(0,50,"37,1550","stairsdownsign");
         _loc8_.§1t1765s0§(0,1550,"39,150","stairsupsign");
         _loc8_.§1t1765s0§(64,1550,"2,1","stairs");
         _loc8_.roomName = §1t1521s0§.getString(780) + " 3";
         param1[38] = _loc8_;
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,39,§1t112s0§.§1t12589s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11405s0§);
         _loc8_.roomWidth = 800;
         if(param7 == §1t1523s0§.§1t7746s0§())
         {
            _loc8_.§1t1753s0§(3);
         }
         else
         {
            _loc8_.§1t1753s0§(1);
         }
         _loc8_.§1t1765s0§(0,100,"38,1550,-1,0","stairsdownsign");
         if(param6.§1t1328s0§())
         {
            _loc8_.§1t1765s0§(66,550,param7.toString(),"castleflag");
         }
         else
         {
            _loc8_.§1t1765s0§(1,500,"823","textsign");
            _loc8_.§1t1765s0§(66,550,param7 + ",1","castleflag");
            if(param7 != §1t1523s0§.§1t7746s0§())
            {
               _loc8_.§1t1765s0§(19,400,param4.toString(),"goodlootchest39");
               if(_loc9_ == §1t70s0§.§1t9129s0§ || _loc9_ == §1t70s0§.§1t9131s0§)
               {
                  _loc8_.§1t1765s0§(0,700,param2.toString() + ",0,-1","leavesign");
               }
               else
               {
                  _loc8_.§1t1765s0§(0,700,param2.toString() + ",1065,-1","leavesign");
               }
            }
         }
         if(param7 == §1t1523s0§.§1t7746s0§())
         {
            _loc8_.§1t1765s0§(0,700,"40,100,-1,0","leavesign");
         }
         else if(param6.§1t1328s0§())
         {
            _loc8_.§1t1765s0§(0,700,"-2","leavesign");
         }
         _loc8_.roomName = §1t1521s0§.getString(781);
         param1[39] = _loc8_;
         _loc8_ = this.§1t1713s0§.§1t866s0§();
         _loc8_.init(0,40,§1t112s0§.§1t12589s0§,param3);
         _loc8_.§1t1755s0§(§1t147s0§.§1t11406s0§);
         _loc8_.roomWidth = 800;
         _loc8_.§1t1753s0§(1);
         _loc8_.§1t1765s0§(0,100,"39,700,-1,0","sign");
         _loc8_.roomName = §1t1521s0§.getString(782);
         if(param6.§1t1328s0§())
         {
            _loc8_.§1t1765s0§(0,700,"-2","leavesign");
         }
         else if(_loc9_ == §1t70s0§.§1t9129s0§ || _loc9_ == §1t70s0§.§1t9131s0§)
         {
            _loc8_.§1t1765s0§(0,700,param2.toString() + ",0,-1","leavesign");
         }
         else
         {
            _loc8_.§1t1765s0§(0,700,param2.toString() + ",1065,-1","leavesign");
         }
         param1[40] = _loc8_;
         if(_loc9_ == §1t70s0§.§1t9128s0§ || _loc9_ == §1t70s0§.§1t9129s0§)
         {
            _loc19_ = [15,16,18,19];
            _loc20_ = [23,20,21,22];
            _loc21_ = [18,19];
            _loc22_ = [21,22];
         }
         else
         {
            _loc19_ = [15,16,18,19];
            _loc20_ = [20,21,22,23];
            _loc21_ = [16,18];
            _loc22_ = [21,22];
         }
         _loc23_ = [20,21,22,23];
         _loc24_ = [24,25,27,26,29,28,30,31];
         _loc17_ = _loc19_.indexOf(_loc11_);
         if(_loc17_ != -1)
         {
            _loc19_.splice(_loc17_,1);
            _loc20_.splice(_loc17_,1);
         }
         var _loc25_:int = int(_loc19_.length);
         _loc18_ = 0;
         while(_loc18_ < _loc25_)
         {
            _loc8_ = param1[_loc19_[_loc18_]];
            _loc31_ = _loc8_.roomWidth / 250;
            _loc32_ = param5.rand(_loc31_ - 2) + 1;
            _loc33_ = 1;
            while(_loc33_ < _loc31_)
            {
               if(_loc33_ != _loc32_)
               {
                  _loc8_.§1t1765s0§(2,_loc33_ * 250,"1," + param4.toString(),"bush" + _loc33_.toString());
               }
               else
               {
                  _loc8_.§1t1765s0§(53,_loc33_ * 250,_loc20_[_loc18_] + "," + _loc33_ * 250,"pathbush");
               }
               _loc33_++;
            }
            _loc18_++;
         }
         var _loc26_:Array = [0,0];
         _loc25_ = int(_loc21_.length);
         _loc18_ = 0;
         while(_loc18_ < _loc25_)
         {
            _loc8_ = param1[_loc21_[_loc18_]];
            _loc27_ = param5.rand(2);
            _loc26_[_loc18_] = _loc27_;
            if(_loc21_[_loc18_] == _loc11_)
            {
               _loc28_ = _loc8_.roomWidth / 4;
               if(_loc27_ == 0)
               {
                  _loc8_.§1t1765s0§(65,_loc28_ * 1 / 2,_loc22_[_loc18_] + "," + param1[_loc22_[_loc18_]].roomWidth / 4 + "," + param7,"ladderpoint");
               }
               else
               {
                  _loc8_.§1t1765s0§(65,_loc28_ * 3 / 2,_loc22_[_loc18_] + "," + param1[_loc22_[_loc18_]].roomWidth * 3 / 4 + "," + param7,"ladderpoint");
               }
            }
            else
            {
               _loc28_ = _loc8_.roomWidth / 3;
               if(_loc27_ == 0)
               {
                  _loc8_.§1t1765s0§(65,_loc28_ * 1 / 2,_loc22_[_loc18_] + "," + param1[_loc22_[_loc18_]].roomWidth / 3 + "," + param7,"ladderpoint");
               }
               else
               {
                  _loc8_.§1t1765s0§(65,_loc28_ * 2 / 2,_loc22_[_loc18_] + "," + param1[_loc22_[_loc18_]].roomWidth * 2 / 3 + "," + param7,"ladderpoint");
               }
            }
            _loc18_++;
         }
         _loc25_ = int(_loc23_.length);
         _loc18_ = 0;
         while(_loc18_ < _loc25_)
         {
            _loc8_ = param1[_loc23_[_loc18_]];
            if(_loc23_[_loc18_] == _loc22_[0])
            {
               _loc27_ = int(_loc26_[0]);
            }
            else if(_loc23_[_loc18_] == _loc22_[1])
            {
               _loc27_ = int(_loc26_[1]);
            }
            else
            {
               _loc27_ = param5.rand(2);
            }
            if(_loc23_[_loc18_] == _loc13_)
            {
               _loc28_ = _loc8_.roomWidth / 4;
               if(_loc27_ == 1)
               {
                  _loc8_.§1t1765s0§(65,_loc28_ * 1 / 2,_loc24_[_loc18_ * 2] + "," + param1[_loc24_[_loc18_ * 2]].roomWidth / 4 + "," + param7,"ladderpoint1");
               }
               else
               {
                  _loc8_.§1t1765s0§(65,_loc28_ * 3 / 2,_loc24_[_loc18_ * 2 + 1] + "," + param1[_loc24_[_loc18_ * 2 + 1]].roomWidth * 3 / 4 + "," + param7,"ladderpoint2");
               }
            }
            else
            {
               _loc28_ = _loc8_.roomWidth / 3;
               if(_loc27_ == 1)
               {
                  _loc8_.§1t1765s0§(65,_loc28_ * 1 / 2 + param5.rand(200) - 100,_loc24_[_loc18_ * 2] + "," + param1[_loc24_[_loc18_ * 2]].roomWidth / 3 + "," + param7,"ladderpoint1");
               }
               else
               {
                  _loc8_.§1t1765s0§(65,_loc28_ * 2 / 2,_loc24_[_loc18_ * 2 + 1] + "," + param1[_loc24_[_loc18_ * 2 + 1]].roomWidth * 2 / 3 + "," + param7,"ladderpoint2");
               }
            }
            _loc18_++;
         }
      }
      
      internal function §1t2126s0§(param1:Array, param2:int, param3:§1t147s0§, param4:§1t58s0§) : *
      {
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc5_:int = §1t70s0§.§1t9130s0§;
         var _loc6_:int = §1t70s0§.§1t9128s0§;
         var _loc7_:int = 110;
         var _loc8_:int = §1t112s0§.§1t12588s0§;
         var _loc9_:§1t147s0§ = this.§1t1713s0§.§1t866s0§();
         _loc9_.init(0,_loc7_,_loc8_,param3.nodeid);
         _loc9_.§1t1755s0§(§1t147s0§.§1t11388s0§);
         _loc9_.roomWidth = 1200;
         _loc9_.roomName = "Gambling Den";
         var _loc10_:int = param2 * 355 + 355 / 2;
         _loc9_.§1t1765s0§(0,50,param3.roomid + "," + _loc10_,"signpost");
         param1[_loc7_] = _loc9_;
         var _loc11_:int = param4.rand(2) + 3;
         var _loc12_:int = this.createRoute(_loc7_,param3.nodeid,§1t112s0§.§1t12588s0§,_loc11_,param4,§1t147s0§.§1t11388s0§,§1t147s0§.§1t11388s0§,param1,null,null,_loc5_,true);
         param1[_loc7_].roomWidth = 800;
         param1[_loc7_].§1t1765s0§(20,298 + 0 * 600,"42","closeddoor");
         param1[_loc12_].roomWidth = 800;
         if(param4.rand(2) == 0)
         {
            param1[_loc12_].roomName = §1t1521s0§.getString(1046);
            param1[_loc12_].bg = §1t112s0§.§1t12589s0§;
            param1[_loc12_].§1t1753s0§(1);
            param1[_loc12_].§1t1759s0§();
            param1[_loc12_].§1t1765s0§(0,100,_loc12_ - 1 + ",50,-1,0,3,3","signpost");
         }
         var _loc15_:int = 1;
         while(_loc15_ <= 2)
         {
            if(_loc15_ == 1)
            {
               _loc14_ = §1t147s0§.§1t11389s0§;
            }
            else
            {
               _loc14_ = §1t147s0§.§1t11369s0§;
            }
            if(_loc15_ == 1 || _loc15_ == 2 && _loc11_ == 4)
            {
               _loc13_ = this.createRoute(_loc7_ + _loc15_,param3.nodeid,§1t112s0§.§1t12589s0§,1,param4,_loc14_,_loc14_,param1,null,null,_loc6_,true);
               param1[_loc13_].roomName = §1t1521s0§.getString(1046);
               param1[_loc13_].§1t1753s0§(1);
               param1[_loc13_].roomWidth = 800;
               param1[_loc13_].§1t1759s0§();
               _loc16_ = param4.rand(2);
               if(_loc16_ == 1)
               {
                  _loc17_ = 0;
               }
               else
               {
                  _loc17_ = 1;
               }
               param1[_loc13_].§1t1765s0§(0,100,_loc7_ + _loc15_ + "," + 298 + _loc16_ * 600 + ",-1,0,1,3","signpost");
               param1[_loc7_ + _loc15_].§1t1765s0§(20,298 + _loc17_ * 600,"42","closeddoor");
               param1[_loc7_ + _loc15_].§1t1765s0§(20,298 + _loc16_ * 600,"41","door" + _loc15_.toString());
               param1[_loc7_ + _loc15_].§1t1757s0§(_loc6_);
               param1[_loc7_ + _loc15_].§1t1765s0§(0,298 + _loc16_ * 600,_loc13_ + ",50,-1,1,0,0","nexit");
               param1[_loc7_ + _loc15_].roomName = §1t1521s0§.getString(1047);
               param1[_loc7_ + _loc15_].roomWidth = 1200;
            }
            _loc15_++;
         }
      }
   }
}

