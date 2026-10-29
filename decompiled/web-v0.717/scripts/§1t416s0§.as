package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol732")]
   public class §1t416s0§ extends MovieClip
   {
      
      public static var §1t12519s0§:int = 0;
      
      public static var §1t12520s0§:int = 1;
      
      public static var §1t12521s0§:int = 2;
      
      public static var §1t12522s0§:int = 3;
      
      public static var §1t12523s0§:int = 4;
      
      public static var §1t12524s0§:int = 5;
      
      public static var §1t12525s0§:int = 6;
      
      public static var §1t12526s0§:int = 7;
      
      public static var §1t12527s0§:int = 8;
      
      public static var §1t12528s0§:int = 9;
      
      public static var §1t12529s0§:int = 10;
      
      public static var §1t12530s0§:int = 11;
      
      public static var §1t12531s0§:int = 12;
      
      public static var §1t12532s0§:int = 13;
      
      public static var §1t12533s0§:int = 15;
      
      public var bg:MovieClip;
      
      public var boundary:MovieClip;
      
      public var button:SimpleButton;
      
      public var earrow:MovieClip;
      
      public var flag:MovieClip;
      
      public var hqflag:MovieClip;
      
      public var hqflag2:MovieClip;
      
      public var logo:MovieClip;
      
      public var narrow:MovieClip;
      
      public var sarrow:MovieClip;
      
      public var warrow:MovieClip;
      
      internal var owner:int;
      
      internal var prevowner:int;
      
      internal var overrunBy:int;
      
      internal var ownerbg:int;
      
      internal var xpos:int;
      
      internal var §1t2259s0§:int;
      
      internal var troops:§1t998s0§;
      
      internal var friendlySentry:String = §1t1521s0§.getString(351);
      
      internal var hextype:int;
      
      internal var cost:int;
      
      internal var §1t7760s0§:Boolean;
      
      internal var §1t7761s0§:§1t415s0§;
      
      internal var hasData:Boolean = false;
      
      internal var §1t7762s0§:Boolean = false;
      
      internal var §1t7763s0§:§1t23s0§ = null;
      
      public function §1t416s0§()
      {
         super();
         stop();
         this.troops = new §1t998s0§();
         this.§1t7771s0§(false);
         this.§1t7772s0§(false);
         mouseChildren = true;
         this.boundary.stop();
         this.boundary.visible = false;
      }
      
      public function init(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : *
      {
         this.xpos = param1;
         this.§1t2259s0§ = param2;
         this.§1t7765s0§(param3);
         this.prevowner = param4;
         this.cost = param6;
         this.overrunBy = 0;
         this.§1t7770s0§(param5);
      }
      
      public function reset() : *
      {
         this.owner = 0;
         this.prevowner = 0;
         this.overrunBy = 0;
         this.ownerbg = 0;
         this.xpos = 0;
         this.§1t2259s0§ = 0;
         this.troops.reset();
         this.friendlySentry = §1t1521s0§.getString(351);
         this.hextype = 0;
         this.cost = 0;
         this.§1t7760s0§ = false;
         this.§1t7761s0§ = null;
         this.hasData = false;
         this.§1t7762s0§ = false;
         this.§1t7763s0§ = null;
      }
      
      public function §1t7764s0§() : int
      {
         return this.owner;
      }
      
      public function §1t7765s0§(param1:int) : *
      {
         this.owner = param1;
         if(§1t1523s0§.§1t9663s0§(param1))
         {
            this.ownerbg = 7;
         }
         else
         {
            this.ownerbg = this.owner;
         }
      }
      
      public function §1t7766s0§(param1:int) : *
      {
         this.overrunBy = param1;
      }
      
      public function §1t7767s0§() : int
      {
         return this.overrunBy;
      }
      
      public function §1t7768s0§(param1:§1t415s0§) : *
      {
         this.§1t7761s0§ = param1;
         this.boundary.visible = true;
         this.boundary.gotoAndStop(param1.§1t7998s0§());
      }
      
      public function §1t7769s0§() : int
      {
         return this.hextype;
      }
      
      public function §1t7770s0§(param1:int) : *
      {
         var _loc2_:Array = null;
         if(this.owner == -1)
         {
            this.hextype = 1;
            gotoAndStop(1);
            return;
         }
         this.hextype = param1;
         if(this.cost <= 0)
         {
            gotoAndStop(this.ownerbg + this.hextype * 10);
         }
         else if(this.hextype == §1t12523s0§)
         {
            gotoAndStop(this.ownerbg + 140);
         }
         else
         {
            gotoAndStop(this.ownerbg + 100);
         }
         this.bg.gotoAndStop(this.ownerbg + 1);
         if(this.ownerbg == 7)
         {
            this.§1t7763s0§ = §1t3318s0§.instance.§1t3435s0§(this.owner);
            if(this.§1t7763s0§ != null)
            {
               §1t1643s0§.§1t11214s0§(this.bg.customhexbg,this.§1t7763s0§.color);
               if(this.flag != null)
               {
                  §1t1643s0§.§1t11214s0§(this.flag.flag,this.§1t7763s0§.color);
                  this.flag.logo.gotoAndStop(this.§1t7763s0§.logo);
                  §1t1643s0§.§1t11214s0§(this.flag.logo,this.§1t7763s0§.logocolor);
               }
               if(this.logo != null)
               {
                  this.logo.gotoAndStop(this.§1t7763s0§.logo);
                  §1t1643s0§.§1t11214s0§(this.logo,this.§1t7763s0§.logocolor);
               }
               if(this.hqflag != null)
               {
                  §1t1643s0§.§1t11214s0§(this.hqflag,this.§1t7763s0§.color);
               }
               if(this.hqflag2 != null)
               {
                  §1t1643s0§.§1t11214s0§(this.hqflag2,this.§1t7763s0§.color);
               }
            }
            else
            {
               this.ownerbg = 5;
               if(this.cost <= 0)
               {
                  gotoAndStop(this.ownerbg + this.hextype * 10);
               }
               else if(this.hextype == §1t12523s0§)
               {
                  gotoAndStop(this.ownerbg + 140);
               }
               else
               {
                  gotoAndStop(this.ownerbg + 100);
               }
               this.bg.gotoAndStop(this.ownerbg + 1);
            }
         }
         if(this.hextype == §1t12526s0§ && this.cost <= 0)
         {
            _loc2_ = §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7806s0§[this.xpos][this.§1t2259s0§].§1t7997s0§();
            this.narrow.visible = _loc2_[0] == 0 && this.§1t2259s0§ != 0;
            this.sarrow.visible = _loc2_[1] == 0 && this.§1t2259s0§ != 5;
            this.earrow.visible = _loc2_[2] == 0 && this.xpos != 5;
            this.warrow.visible = _loc2_[3] == 0 && this.xpos != 0;
         }
         else if(this.hextype == §1t12524s0§ || this.hextype == §1t12525s0§ || this.hextype == §1t12520s0§)
         {
            this.narrow.visible = this.§1t2259s0§ == 0;
            this.sarrow.visible = this.§1t2259s0§ == 5;
            this.earrow.visible = this.xpos == 5;
            this.warrow.visible = this.xpos == 0;
         }
      }
      
      public function §1t7771s0§(param1:Boolean) : *
      {
         if(param1)
         {
            this.bg.alpha = 0.5;
            this.button.visible = true;
            this.bg.gotoAndStop(this.ownerbg + 1);
            if(this.ownerbg == 7 && this.§1t7763s0§ != null)
            {
               §1t1643s0§.§1t11214s0§(this.bg.customhexbg,this.§1t7763s0§.color);
            }
         }
         else
         {
            this.bg.alpha = 0.5;
            this.button.visible = false;
            this.bg.gotoAndStop(this.ownerbg + 1);
            if(this.ownerbg == 7 && this.§1t7763s0§ != null)
            {
               §1t1643s0§.§1t11214s0§(this.bg.customhexbg,this.§1t7763s0§.color);
            }
         }
      }
      
      public function §1t7772s0§(param1:Boolean) : *
      {
         if(param1)
         {
            this.bg.alpha = 0.7;
         }
         else
         {
            this.bg.alpha = 0.5;
         }
      }
      
      public function §1t7773s0§() : *
      {
         this.bg.alpha = 0.7;
         this.button.visible = true;
         this.bg.gotoAndStop(this.ownerbg + 10);
         if(this.ownerbg == 7 && this.§1t7763s0§ != null)
         {
            §1t1643s0§.§1t11214s0§(this.bg.customhexbg,this.§1t7763s0§.color);
         }
      }
      
      public function §1t7774s0§(param1:int, param2:int) : *
      {
         this.troops.put(param1,param2,true);
      }
      
      public function §1t7775s0§(param1:int, param2:int) : *
      {
         var _loc3_:int = this.troops.§1t1005s0§(param1);
         _loc3_ += param2;
         this.troops.put(param1,_loc3_,true);
      }
      
      public function §1t7776s0§(param1:int) : int
      {
         var _loc2_:int = this.troops.§1t1005s0§(param1);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
      
      internal function §1t7777s0§(param1:int) : int
      {
         var _loc2_:Array = this.troops.§1t1006s0§();
         var _loc3_:Array = this.troops.§1t1007s0§();
         var _loc4_:int = 0;
         var _loc5_:int = int(_loc2_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc2_[_loc6_] != param1)
            {
               _loc4_ += _loc3_[_loc6_];
            }
            _loc6_++;
         }
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         return _loc4_;
      }
      
      public function §1t7778s0§(param1:Array) : *
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         for(_loc3_ in param1)
         {
            _loc2_ = int(_loc3_);
            this.troops.put(int(_loc2_),param1[_loc2_]);
         }
      }
      
      public function §1t6868s0§(param1:int) : *
      {
         this.cost = param1;
      }
      
      public function §1t7779s0§(param1:int) : Boolean
      {
         return this.§1t7777s0§(param1) > 0;
      }
      
      public function §1t7780s0§(param1:int) : Boolean
      {
         return this.§1t7760s0§ || this.owner == param1;
      }
      
      public function §1t7781s0§() : Boolean
      {
         return this.§1t7760s0§;
      }
      
      public function §1t3255s0§(param1:int) : Boolean
      {
         return this.owner == param1;
      }
      
      public function §1t7782s0§(param1:String) : *
      {
         var _loc3_:Array = null;
         this.friendlySentry = "";
         var _loc2_:Array = param1.split("|");
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            if(_loc2_[_loc4_] != "")
            {
               _loc3_ = _loc2_[_loc4_].split(",");
               if(_loc3_[0] != §1t1523s0§.charname)
               {
                  this.friendlySentry += _loc3_[0] + " (" + _loc3_[1] + ")\n";
               }
            }
            _loc4_++;
         }
         if(_loc2_.length == 11)
         {
            this.friendlySentry += "...";
         }
         if(this.friendlySentry == "")
         {
            this.friendlySentry = §1t1521s0§.getString(351);
         }
      }
      
      public function §1t7783s0§(param1:String) : *
      {
         var _loc2_:Array = param1.split(",");
         this.§1t6868s0§(_loc2_[0]);
         this.§1t7774s0§(1,_loc2_[1]);
         this.§1t7774s0§(2,_loc2_[2]);
         this.§1t7774s0§(3,_loc2_[3]);
         this.§1t7774s0§(4,_loc2_[4]);
         this.§1t7774s0§(5,_loc2_[5]);
      }
      
      public function §1t7784s0§(param1:int) : int
      {
         var _loc2_:Array = this.troops.§1t1006s0§();
         var _loc3_:Array = new Array();
         var _loc4_:int = int(_loc2_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc2_[_loc5_] != param1)
            {
               _loc3_.push(_loc2_[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:int = Math.random() * _loc3_.length;
         return _loc3_[_loc6_];
      }
      
      public function §1t514s0§(param1:int, param2:int) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc3_:String = "";
         if(this.hextype == §1t12520s0§)
         {
            _loc3_ += §1t1521s0§.getString(349);
            _loc3_ += "\n\n" + §1t1521s0§.getString(574) + "\n\n";
         }
         else if(this.hextype == §1t12521s0§)
         {
            _loc3_ += §1t1521s0§.getString(350);
            if(this.cost > 0)
            {
               _loc4_ = 10000;
               _loc5_ = (_loc4_ - this.cost) / _loc4_ * 100;
               if(_loc5_ > 100)
               {
                  _loc5_ = 100;
               }
               else if(_loc5_ < 0)
               {
                  _loc5_ = 0;
               }
               _loc3_ += " (" + §1t1521s0§.getString(423) + ": " + _loc5_ + "%)";
            }
            _loc3_ += "\n\n" + §1t1521s0§.getString(567) + "\n\n";
         }
         else if(this.hextype == §1t12524s0§)
         {
            if(this.owner == param1)
            {
               _loc3_ += §1t1521s0§.getString(594) + "\n\n" + §1t1521s0§.getString(595) + "\n\n";
            }
            else
            {
               _loc3_ += §1t1521s0§.getString(596) + "\n\n" + §1t1521s0§.getString(597) + "\n\n";
            }
         }
         else
         {
            if(this.hextype == §1t12525s0§)
            {
               return _loc3_ + (§1t1521s0§.getString(349) + " (" + §1t1521s0§.getString(423) + ")\n\n" + §1t1521s0§.getString(574) + "\n\n");
            }
            if(this.hextype == §1t12532s0§)
            {
               return _loc3_ + (§1t1521s0§.getString(349) + " (" + §1t1521s0§.getString(616) + ")\n\n" + §1t1521s0§.getString(617) + "\n\n");
            }
            if(this.hextype == §1t12533s0§)
            {
               return _loc3_ + (§1t1521s0§.getString(349) + " (" + §1t1521s0§.getString(708) + ")\n\n" + §1t1521s0§.getString(709) + "\n\n");
            }
            if(this.hextype == §1t12522s0§)
            {
               _loc3_ += §1t1521s0§.getString(598) + "\n\n" + §1t1521s0§.getString(599) + "\n\n";
            }
            else if(this.hextype == §1t12528s0§)
            {
               _loc3_ += §1t1521s0§.getString(450) + " (" + §1t1521s0§.getString(600) + ")";
               _loc3_ += "\n\n" + §1t1521s0§.getString(601) + "\n\n";
            }
            else if(this.hextype == §1t12523s0§)
            {
               _loc3_ += §1t1521s0§.getString(451) + " (" + §1t1521s0§.getString(600) + ")";
               if(this.cost > 0)
               {
                  _loc4_ = 10000;
                  _loc5_ = (_loc4_ - this.cost) / _loc4_ * 100;
                  if(_loc5_ > 100)
                  {
                     _loc5_ = 100;
                  }
                  else if(_loc5_ < 0)
                  {
                     _loc5_ = 0;
                  }
                  if(!this.§1t7762s0§ && this.owner != param1)
                  {
                     _loc3_ += " (" + §1t1521s0§.getString(423) + ")";
                  }
                  else
                  {
                     _loc3_ += " (" + §1t1521s0§.getString(423) + ": " + _loc5_ + "%)";
                  }
               }
               _loc3_ += "\n\n" + §1t1521s0§.getString(573) + "\n\n";
            }
            else if(this.hextype == §1t12530s0§)
            {
               _loc3_ += §1t1521s0§.getString(452) + " (" + §1t1521s0§.getString(600) + ")";
               _loc3_ += "\n\n" + §1t1521s0§.getString(602) + "\n\n";
            }
            else if(this.hextype == §1t12531s0§)
            {
               _loc3_ += §1t1521s0§.getString(453) + " (" + §1t1521s0§.getString(600) + ")";
               if(§1t3317s0§.instance.§1t1847s0§() - param2 > 3 * 60 * 60)
               {
                  _loc3_ += "\n\n" + §1t1521s0§.getString(603) + "\n\n";
               }
               else
               {
                  _loc3_ += "\n\n" + §1t1521s0§.getString(779) + "\n\n";
               }
               if(§1t3317s0§.instance.§1t1847s0§() - param2 > 3 * 60 * 60)
               {
                  _loc3_ += §1t1521s0§.getString(776) + "\n\n";
               }
               else
               {
                  _loc3_ += §1t1521s0§.getString(775) + "(" + this.§1t937s0§(3 * 60 * 60 - (§1t3317s0§.instance.§1t1847s0§() - param2)) + ")\n\n";
               }
            }
            else if(this.hextype == §1t12526s0§)
            {
               _loc3_ += §1t1521s0§.getString(568);
               if(this.cost > 0)
               {
                  _loc4_ = 5000;
                  _loc5_ = (_loc4_ - this.cost) / _loc4_ * 100;
                  if(_loc5_ > 100)
                  {
                     _loc5_ = 100;
                  }
                  else if(_loc5_ < 0)
                  {
                     _loc5_ = 0;
                  }
                  if(!this.§1t7762s0§ && this.owner != param1)
                  {
                     _loc3_ += " (" + §1t1521s0§.getString(423) + ")";
                  }
                  else
                  {
                     _loc3_ += " (" + §1t1521s0§.getString(423) + ": " + _loc5_ + "%)";
                  }
               }
               _loc3_ += "\n\n" + §1t1521s0§.getString(569) + "\n\n";
            }
            else if(this.hextype == §1t12527s0§)
            {
               _loc3_ += §1t1521s0§.getString(570);
               if(this.cost > 0)
               {
                  _loc4_ = 10000;
                  _loc5_ = (_loc4_ - this.cost) / _loc4_ * 100;
                  if(_loc5_ > 100)
                  {
                     _loc5_ = 100;
                  }
                  else if(_loc5_ < 0)
                  {
                     _loc5_ = 0;
                  }
                  if(!this.§1t7762s0§ && this.owner != param1)
                  {
                     _loc3_ += " (" + §1t1521s0§.getString(423) + ")";
                  }
                  else
                  {
                     _loc3_ += " (" + §1t1521s0§.getString(423) + ": " + _loc5_ + "%)";
                  }
               }
               _loc3_ += "\n\n" + §1t1521s0§.getString(571) + "\n\n";
            }
            else
            {
               _loc3_ += "\n";
            }
         }
         if(this.hasData)
         {
            _loc6_ = this.§1t7777s0§(param1);
            _loc7_ = "";
            if(this.owner == param1 && _loc6_ == 0)
            {
               _loc7_ = §1t1521s0§.getString(345);
            }
            else if(this.§1t7760s0§ && this.owner == param1)
            {
               _loc7_ = §1t1521s0§.getString(342);
            }
            else if(this.§1t7760s0§ && this.owner != param1)
            {
               _loc7_ = §1t1521s0§.getString(343);
            }
            else if(this.owner != param1 && !this.§1t7760s0§)
            {
               _loc7_ = §1t1521s0§.getString(344);
            }
            _loc3_ += §1t1521s0§.getString(341) + ": " + _loc7_ + "\n";
            if(this.§1t7761s0§ != null)
            {
               switch(this.§1t7761s0§.§1t7996s0§())
               {
                  case §1t415s0§.§1t12540s0§:
                     _loc3_ += §1t1521s0§.getString(604) + "\n\n";
                     break;
                  case §1t415s0§.§1t12541s0§:
                     _loc3_ += §1t1521s0§.getString(605) + "\n\n";
                     break;
                  case §1t415s0§.§1t12542s0§:
                     _loc3_ += §1t1521s0§.getString(606) + "\n\n";
               }
            }
            _loc3_ += §1t1521s0§.getString(346) + ": " + this.§1t7776s0§(param1) + "\n";
            if(!this.§1t7762s0§ && this.owner != param1)
            {
               _loc3_ += §1t1521s0§.getString(347) + ": ???\n\n";
            }
            else
            {
               _loc3_ += §1t1521s0§.getString(347) + ": " + _loc6_ + "\n\n";
            }
            if(this.§1t3255s0§(param1))
            {
               _loc3_ += §1t1521s0§.getString(348) + ":\n";
               _loc3_ += this.friendlySentry;
            }
         }
         return _loc3_;
      }
      
      internal function §1t937s0§(param1:int) : String
      {
         var _loc2_:int = Math.floor(param1 / (60 * 60));
         var _loc3_:int = param1 % (60 * 60);
         var _loc4_:int = Math.floor(_loc3_ / 60);
         var _loc5_:int = _loc3_ % 60;
         var _loc6_:int = Math.ceil(_loc5_);
         var _loc7_:String = _loc6_.toString();
         if(_loc6_ < 10)
         {
            _loc7_ = "0" + _loc7_;
         }
         var _loc8_:String = _loc4_.toString();
         if(_loc4_ < 10)
         {
            _loc8_ = "0" + _loc8_;
         }
         return _loc2_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}

