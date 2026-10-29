package
{
   import flash.display.MovieClip;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2123")]
   public class §1t29s0§ extends MovieClip
   {
      
      public static const §1t12491s0§:int = 0;
      
      public static const §1t12492s0§:int = 1;
      
      public static const §1t12493s0§:int = 2;
      
      public static const §1t12494s0§:int = 3;
      
      public static const §1t12495s0§:int = 10;
      
      public static const §1t465s0§:int = 0;
      
      public static const §1t12496s0§:int = 1;
      
      public static const §1t12497s0§:int = 2;
      
      public static const §1t5923s0§:Array = [0,550,1450,2950,5150,8350,12150,16350,20900,25900,31400,37400,43500,49850,56550,63900,71900,80300,89100,98300,108000,118300,129300,141100,154100,168100,183100,199100,216100,234100,253100,273100,294100,316100,339300,363300,389300,416800,445800,475800,507300,540300,574300,610300,647800,685800,725800,767800,812300,859300,908300,959300,1012300,1067300,1124300,1183300,1244800,1307800,1372800,1439800,1508800,1578800,1651800,1728800,1808800,1892800,1980800,2071800,2166800,2276800,2404800,2544800,2699800,2862800,3032800,3212800,3400800,3595800,3795800,4025800,4285800,4585800,4935800,5335800,5815800,6365800,6965800,7645800,8395800,9295800,10295800,11495800,12995800,14795800,16895800,19295800,22095800,25395800,29395800];
      
      public static const §1t12498s0§:Array = [0,300,900,2100,4800,10200,21000,42600,85800,172200,345000];
      
      internal static const §1t12499s0§:int = 0;
      
      internal static const §1t12500s0§:int = 1;
      
      internal static const §1t12501s0§:int = 2;
      
      internal static const §1t12502s0§:int = 3;
      
      internal static const §1t12503s0§:int = 4;
      
      internal static const §1t12504s0§:int = 5;
      
      internal static const §1t12505s0§:int = 6;
      
      internal static const §1t12506s0§:int = 7;
      
      internal static const §1t12507s0§:int = 8;
      
      internal static const §1t12508s0§:int = 9;
      
      internal static const §1t12509s0§:int = 10;
      
      internal static const §1t12510s0§:int = 11;
      
      internal static const §1t12511s0§:int = 12;
      
      internal static const §1t12512s0§:int = 13;
      
      internal static const §1t12513s0§:int = 14;
      
      internal static const §1t12514s0§:int = 15;
      
      internal static const §1t12515s0§:int = 16;
      
      internal static const §1t12516s0§:int = 17;
      
      internal static const §1t12517s0§:int = 18;
      
      public var §1t7301s0§:TextField;
      
      internal var npcid:int;
      
      internal var §1t7302s0§:Vector.<§1t98s0§>;
      
      internal var charname:String;
      
      internal var §1t7241s0§:§1t28s0§;
      
      internal var §1t7303s0§:int = 0;
      
      internal var §1t7304s0§:int = 0;
      
      internal var §1t4408s0§:int = 0;
      
      internal var §1t3243s0§:int = 1;
      
      internal var velX:Number = 1;
      
      internal var §1t7305s0§:Boolean = false;
      
      internal var §1t7306s0§:Boolean = false;
      
      internal var §1t567s0§:§1t98s0§ = new §1t98s0§();
      
      internal var §1t7307s0§:int = -1;
      
      internal var §1t924s0§:int = -1;
      
      internal var §1t7308s0§:int = 0;
      
      internal var §1t7309s0§:int = 0;
      
      internal var mcs:§1t75s0§;
      
      internal var actionState:int;
      
      internal var §1t4514s0§:int;
      
      internal var §1t7310s0§:int;
      
      internal var §1t1227s0§:Boolean;
      
      internal var §1t7311s0§:Boolean = false;
      
      public var §1t927s0§:Boolean = false;
      
      internal var §1t7312s0§:GlowFilter;
      
      internal var §1t7315s0§:Vector.<§1t98s0§> = new Vector.<§1t98s0§>(§1t1523s0§.§1t9366s0§);
      
      internal var §1t7316s0§:Vector.<§1t17s0§> = new Vector.<§1t17s0§>(13);
      
      internal const §1t7348s0§:int = 5;
      
      internal var §1t7349s0§:int = 5;
      
      public function §1t29s0§(param1:int, param2:String, param3:String, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean, param13:int)
      {
         super();
         this.npcid = param1;
         this.charname = param2;
         this.§1t7365s0§(param3);
         this.§1t7367s0§(param4);
         this.§1t7302s0§ = new Vector.<§1t98s0§>(§1t24s0§.§1t8761s0§);
         var _loc14_:int = 0;
         while(_loc14_ < §1t24s0§.§1t8761s0§)
         {
            this.§1t7302s0§[_loc14_] = new §1t98s0§();
            _loc14_++;
         }
         this.§1t7302s0§[§1t24s0§.§1t8755s0§].§1t695s0§(param5);
         this.§1t7302s0§[§1t24s0§.§1t8756s0§].§1t695s0§(param6);
         this.§1t7302s0§[§1t24s0§.§1t8757s0§].§1t695s0§(param7);
         this.§1t7302s0§[§1t24s0§.§1t8758s0§].§1t695s0§(param8);
         this.§1t7302s0§[§1t24s0§.§1t8759s0§].§1t695s0§(param9);
         this.§1t7302s0§[§1t24s0§.§1t8760s0§].§1t695s0§(param10);
         this.§1t567s0§.§1t695s0§(param11);
         this.§1t1227s0§ = param12;
         this.§1t7301s0§.visible = false;
         this.§1t7301s0§.mouseEnabled = false;
         this.mcs = new §1t75s0§();
         this.mcs.mouseEnabled = false;
         addChild(this.mcs);
         this.mcs.§1t1549s0§(this.§1t7316s0§[§1t1523s0§.§1t9439s0§],this.§1t7316s0§[§1t1523s0§.§1t9440s0§],this.§1t7316s0§[§1t1523s0§.§1t9441s0§],this.§1t7316s0§[§1t1523s0§.§1t9442s0§],this.§1t7316s0§[§1t1523s0§.§1t9443s0§],this.§1t7316s0§[§1t1523s0§.§1t9444s0§],this.§1t7316s0§[§1t1523s0§.§1t9445s0§],this.§1t7316s0§[§1t1523s0§.§1t9446s0§],this.§1t7316s0§[§1t1523s0§.§1t9447s0§],this.§1t7316s0§[§1t1523s0§.§1t9448s0§],this.§1t7316s0§[§1t1523s0§.§1t9449s0§].§1t483s0§());
         scaleX = 0.15;
         scaleY = 0.15;
         this.§1t3269s0§(§1t1544s0§.§1t11154s0§);
         this.§1t7312s0§ = new GlowFilter();
         this.§1t7312s0§.color = 16763904;
         this.§1t7312s0§.alpha = 5;
         this.§1t7312s0§.blurX = 5;
         this.§1t7312s0§.blurY = 5;
         this.§1t7312s0§.quality = BitmapFilterQuality.LOW;
         this.§1t7351s0§(false);
         this.§1t7310s0§ = param13;
         if(param13 == §1t12496s0§)
         {
            this.§1t7301s0§.text = this.charname;
            this.§1t7301s0§.textColor = 16763904;
            this.§1t7301s0§.visible = true;
         }
      }
      
      public static function §1t12518s0§(param1:String, param2:String, param3:String, param4:int, param5:int, param6:§1t24s0§, param7:Boolean, param8:Boolean) : §1t29s0§
      {
         var _loc29_:§1t29s0§ = null;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc9_:Array = param1.split(",");
         var _loc10_:int = int(_loc9_[§1t12499s0§]);
         if(_loc10_ == 0)
         {
            return null;
         }
         var _loc11_:String = _loc9_[§1t12500s0§];
         var _loc12_:int = int(_loc9_[§1t12507s0§]);
         var _loc13_:int = int(_loc9_[§1t12508s0§]);
         var _loc14_:int = int(_loc9_[§1t12509s0§]);
         var _loc15_:int = int(_loc9_[§1t12510s0§]);
         var _loc16_:int = int(_loc9_[§1t12511s0§]);
         var _loc17_:int = int(_loc9_[§1t12512s0§]);
         var _loc18_:int = int(_loc9_[§1t12501s0§]);
         var _loc19_:Boolean = _loc9_[§1t12515s0§] == "1";
         var _loc20_:int = int(_loc9_[§1t12506s0§]);
         var _loc21_:Boolean = _loc9_[§1t12513s0§] == "1";
         var _loc22_:Boolean = _loc9_[§1t12514s0§] == "1";
         var _loc23_:int = int(_loc9_[§1t12502s0§]);
         var _loc24_:int = int(_loc9_[§1t12503s0§]);
         var _loc25_:int = int(_loc9_[§1t12504s0§]);
         var _loc26_:int = int(_loc9_[§1t12505s0§]);
         var _loc27_:int = int(_loc9_[§1t12516s0§]);
         var _loc28_:int = int(_loc9_[§1t12517s0§]);
         if(!param7)
         {
            _loc30_ = param5 - param4;
            _loc29_ = param6.§1t600s0§(_loc10_,_loc11_,param2,param3,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc27_,_loc28_,_loc22_,_loc21_,false);
            _loc26_ -= _loc30_;
            if(_loc26_ <= 0)
            {
               _loc26_ = 0;
               _loc25_ = 0;
            }
            _loc29_.§1t7317s0§(_loc22_,_loc21_,_loc23_,_loc24_,_loc25_,_loc26_);
            _loc29_.§1t7353s0§();
            _loc31_ = Math.floor(_loc30_ / 60);
            if(_loc31_ > 0)
            {
               _loc29_.§1t7350s0§(param5,param8,_loc31_);
            }
         }
         else
         {
            _loc29_ = param6.§1t601s0§(_loc10_,_loc11_,param2,param3,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_);
         }
         return _loc29_;
      }
      
      public function §1t7317s0§(param1:Boolean, param2:Boolean, param3:int, param4:int, param5:int, param6:int) : *
      {
         this.§1t7306s0§ = param1;
         this.§1t7305s0§ = param2;
         this.§1t7307s0§ = param3;
         this.§1t924s0§ = param4;
         this.§1t7308s0§ = param5;
         this.§1t7309s0§ = param6;
      }
      
      public function §1t3309s0§() : int
      {
         return this.§1t7315s0§[§1t1523s0§.§1t9402s0§].§1t697s0§();
      }
      
      public function §1t7318s0§() : int
      {
         return this.§1t7315s0§[§1t1523s0§.§1t9403s0§].§1t697s0§() + this.§1t7358s0§(§1t1523s0§.§1t9403s0§);
      }
      
      public function §1t7319s0§() : int
      {
         return this.§1t7315s0§[§1t1523s0§.§1t9406s0§].§1t697s0§() + this.§1t7358s0§(§1t1523s0§.§1t9406s0§);
      }
      
      public function §1t7320s0§() : Boolean
      {
         return this.§1t7310s0§ == §1t465s0§;
      }
      
      public function §1t3312s0§() : Boolean
      {
         return this.§1t7310s0§ == §1t12496s0§;
      }
      
      public function §1t7321s0§() : Boolean
      {
         return this.§1t7310s0§ == §1t12497s0§;
      }
      
      public function §1t625s0§() : *
      {
      }
      
      public function §1t7322s0§() : Boolean
      {
         return false;
      }
      
      public function §1t7323s0§(param1:int, param2:Boolean = true) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:int = this.§1t7302s0§[param1].§1t697s0§();
         if(param1 == §1t24s0§.§1t8755s0§)
         {
            _loc4_ = 0;
            while(_loc4_ < 99)
            {
               if(§1t5923s0§[_loc4_] > _loc3_)
               {
                  return _loc4_;
               }
               _loc4_++;
            }
            return 1;
         }
         _loc4_ = 0;
         while(_loc4_ <= §1t12495s0§)
         {
            if(§1t12498s0§[_loc4_] >= _loc3_)
            {
               if(param2)
               {
                  _loc5_ = this.§1t567s0§.§1t697s0§();
                  if(_loc5_ <= 25)
                  {
                     if(_loc4_ - 1 < 0)
                     {
                        return 0;
                     }
                     return _loc4_ - 1;
                  }
                  return _loc4_;
               }
               return _loc4_;
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function §1t5927s0§(param1:int) : int
      {
         var _loc2_:int = this.§1t7302s0§[param1].§1t697s0§();
         if(param1 == §1t24s0§.§1t8755s0§)
         {
            return §1t5923s0§[this.§1t7323s0§(param1,false) + 1] - _loc2_;
         }
         return §1t12498s0§[this.§1t7323s0§(param1,false) + 1] - _loc2_;
      }
      
      public function §1t7324s0§(param1:int) : Number
      {
         var _loc2_:int = this.§1t7323s0§(param1,false);
         var _loc3_:int = this.§1t7302s0§[param1].§1t697s0§();
         if(param1 == §1t24s0§.§1t8755s0§)
         {
            if(_loc2_ == §1t1523s0§.§1t9470s0§)
            {
               return 1;
            }
            return (_loc3_ - §1t5923s0§[_loc2_ - 1]) / §1t5923s0§[_loc2_];
         }
         if(_loc2_ == 5)
         {
            return 1;
         }
         return (_loc3_ - §1t12498s0§[_loc2_]) / §1t12498s0§[_loc2_ + 1];
      }
      
      public function §1t550s0§(param1:int) : *
      {
         var _loc2_:int = param1 + this.§1t7302s0§[§1t24s0§.§1t8755s0§].§1t697s0§();
         var _loc3_:int = int(§1t5923s0§[§1t1523s0§.§1t9470s0§]);
         if(_loc2_ > _loc3_)
         {
            _loc2_ = _loc3_;
         }
         this.§1t7302s0§[§1t24s0§.§1t8755s0§].§1t695s0§(_loc2_);
      }
      
      public function §1t7325s0§(param1:int, param2:int) : *
      {
         var _loc3_:int = param1 + this.§1t7302s0§[§1t24s0§.§1t8755s0§].§1t697s0§();
         if(param2 > §1t1523s0§.§1t9470s0§)
         {
            param2 = §1t1523s0§.§1t9470s0§;
         }
         var _loc4_:int = int(§1t5923s0§[param2]);
         if(_loc3_ > _loc4_)
         {
            _loc3_ = _loc4_;
         }
         this.§1t7302s0§[§1t24s0§.§1t8755s0§].§1t695s0§(_loc3_);
      }
      
      public function §1t7326s0§(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = this.§1t7323s0§(§1t24s0§.§1t8755s0§);
         if(_loc2_ < §1t1523s0§.§1t9470s0§)
         {
            this.§1t7325s0§(param1,_loc2_);
            _loc3_ = this.§1t7323s0§(§1t24s0§.§1t8755s0§) - _loc2_;
            if(_loc3_ > 0)
            {
               this.§1t7344s0§(_loc3_);
               return true;
            }
            return false;
         }
         return false;
      }
      
      internal function §1t7327s0§(param1:int, param2:int) : *
      {
         var _loc3_:int = this.§1t7323s0§(param2,false) + 1;
         var _loc4_:int = param1 + this.§1t7302s0§[param2].§1t697s0§();
         if(_loc3_ > §1t12495s0§)
         {
            _loc3_ = §1t12495s0§;
         }
         var _loc5_:int = int(§1t12498s0§[_loc3_]);
         if(_loc4_ > _loc5_)
         {
            _loc4_ = _loc5_;
         }
         this.§1t7302s0§[param2].§1t695s0§(_loc4_);
      }
      
      public function §1t7328s0§(param1:int) : String
      {
         var _loc2_:int = this.§1t924s0§ - param1;
         if(_loc2_ <= 0)
         {
            if(this.§1t7323s0§(this.§1t7241s0§.§1t952s0§(),false) == §1t12495s0§)
            {
               return §1t1521s0§.getString(22101);
            }
            return §1t1521s0§.getString(22080);
         }
         return this.§1t937s0§(_loc2_);
      }
      
      public function §1t7329s0§() : int
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 1;
         while(_loc2_ < §1t24s0§.§1t8761s0§)
         {
            _loc3_ = this.§1t7323s0§(_loc2_);
            if(_loc3_ > _loc1_)
            {
               _loc1_ = _loc3_;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function §1t7210s0§() : String
      {
         var _loc1_:int = this.§1t7329s0§();
         if(_loc1_ == 0)
         {
            return "E";
         }
         if(_loc1_ == 1)
         {
            return "E+";
         }
         if(_loc1_ == 2)
         {
            return "D";
         }
         if(_loc1_ == 3)
         {
            return "D+";
         }
         if(_loc1_ == 4)
         {
            return "C";
         }
         if(_loc1_ == 5)
         {
            return "C+";
         }
         if(_loc1_ == 6)
         {
            return "B";
         }
         if(_loc1_ == 7)
         {
            return "B+";
         }
         if(_loc1_ == 8)
         {
            return "A";
         }
         if(_loc1_ == 9)
         {
            return "A+";
         }
         if(_loc1_ == 10)
         {
            return "S";
         }
         return "E";
      }
      
      public function §1t7330s0§() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         if(this.§1t3309s0§() == 0)
         {
            _loc2_ = §1t1521s0§.getString(22102);
            _loc1_ = "#FF0000";
         }
         else if(this.§1t7308s0§ == §1t12491s0§)
         {
            _loc2_ = §1t1521s0§.getString(22082);
            _loc1_ = "#FFFFFF";
         }
         else if(this.§1t7308s0§ == §1t12492s0§)
         {
            _loc2_ = §1t1521s0§.getString(22083);
            _loc1_ = "#FF0000";
         }
         else if(this.§1t7308s0§ == §1t12493s0§)
         {
            _loc2_ = §1t1521s0§.getString(22084);
            _loc1_ = "#FF0000";
         }
         else if(this.§1t7308s0§ == §1t12494s0§)
         {
            _loc2_ = §1t1521s0§.getString(22085);
            _loc1_ = "#FF0000";
         }
         return "<font color=\'" + _loc1_ + "\'>" + _loc2_ + "</font>";
      }
      
      public function §1t7331s0§(param1:int, param2:int) : *
      {
         this.§1t7308s0§ = param1;
         this.§1t7309s0§ = param2;
         if(this.§1t7333s0§() && this.§1t3309s0§() > this.§1t7318s0§() / 2)
         {
            this.§1t7357s0§(§1t1523s0§.§1t9402s0§,this.§1t7318s0§() / 2);
         }
      }
      
      internal function §1t7332s0§() : *
      {
         this.§1t7309s0§ = this.§1t7318s0§() / 2;
         this.§1t7308s0§ = §1t12492s0§;
      }
      
      internal function §1t7333s0§() : Boolean
      {
         return this.§1t7308s0§ == §1t12492s0§ && this.§1t7309s0§ > 0;
      }
      
      public function §1t7334s0§() : int
      {
         return this.§1t7308s0§;
      }
      
      internal function §1t937s0§(param1:int) : String
      {
         var _loc2_:int = param1 % 60;
         var _loc3_:int = (param1 - _loc2_) / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = (_loc3_ - _loc4_) / 60;
         if(_loc5_ > 0)
         {
            if(_loc4_ == 0)
            {
               return _loc5_ + "h";
            }
            return _loc5_ + "h " + _loc4_ + "m";
         }
         if(_loc4_ > 0)
         {
            return _loc4_ + "m";
         }
         return ">1m";
      }
      
      public function §1t7335s0§(param1:§1t28s0§, param2:Boolean, param3:Boolean) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(this.§1t7241s0§ != param1)
         {
            if(!this.§1t3312s0§())
            {
               this.§1t7301s0§.visible = false;
            }
            if(param2 && !this.§1t3312s0§())
            {
               _loc4_ = §1t24s0§.§1t1847s0§();
               if(this.§1t7241s0§ != null && this.§1t7241s0§.§1t952s0§() != -1)
               {
                  _loc5_ = _loc4_ - this.§1t7307s0§;
                  _loc6_ = this.§1t7241s0§.§1t932s0§() * _loc5_;
                  _loc7_ = this.§1t7241s0§.§1t952s0§();
                  this.§1t7327s0§(_loc6_,_loc7_);
                  this.§1t7307s0§ = -1;
                  this.§1t924s0§ = -1;
                  this.§1t7301s0§.visible = false;
               }
               if(param1.§1t952s0§() != -1)
               {
                  if(this.§1t7323s0§(param1.§1t952s0§(),false) < §1t12495s0§)
                  {
                     _loc8_ = this.§1t5927s0§(param1.§1t952s0§()) / param1.§1t932s0§();
                     this.§1t7307s0§ = _loc4_;
                     this.§1t924s0§ = _loc4_ + _loc8_;
                     this.§1t7301s0§.visible = true;
                     this.§1t7301s0§.text = this.§1t7328s0§(_loc4_);
                  }
                  else
                  {
                     this.§1t7301s0§.visible = true;
                     this.§1t7301s0§.text = §1t1521s0§.getString(22101);
                  }
               }
               if(this.§1t7309s0§ > 0 && param1.§1t928s0§() == §1t24s0§.§1t8770s0§)
               {
                  this.§1t7301s0§.visible = true;
                  this.§1t7301s0§.text = this.§1t937s0§(this.§1t7309s0§);
               }
            }
            if(this.§1t7241s0§ != null)
            {
               this.§1t7241s0§.§1t948s0§(this);
            }
            if(param1 != null)
            {
               this.§1t7305s0§ = false;
               this.§1t7306s0§ = false;
               if(§1t412s0§.instance.scale == 1)
               {
                  this.§1t3269s0§(§1t1544s0§.§1t11154s0§);
               }
               else
               {
                  this.§1t3269s0§(§1t1544s0§.§1t11141s0§);
               }
               if(param2)
               {
                  if(param3)
                  {
                     this.mcs.§1t5493s0§();
                  }
                  else
                  {
                     this.mcs.§1t5492s0§();
                  }
               }
            }
            else
            {
               this.§1t3269s0§(§1t1544s0§.§1t11154s0§);
            }
            this.§1t7241s0§ = param1;
         }
      }
      
      public function §1t7336s0§(param1:int) : *
      {
         this.§1t7301s0§.visible = true;
         this.§1t7301s0§.text = this.§1t7328s0§(param1);
      }
      
      public function §1t7337s0§(param1:int) : *
      {
         if(this.§1t7309s0§ <= 0)
         {
            this.§1t7301s0§.visible = false;
         }
         else
         {
            this.§1t7301s0§.visible = true;
            this.§1t7301s0§.text = this.§1t937s0§(this.§1t7309s0§);
         }
      }
      
      public function §1t7338s0§() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.§1t7311s0§)
         {
            this.§1t7311s0§ = false;
            this.§1t7301s0§.visible = false;
            §1t412s0§.instance.§1t916s0§.§1t588s0§(this.§1t7323s0§(§1t24s0§.§1t8755s0§,false));
            this.§1t7344s0§(1);
            §1t88s0§.instance.§1t1516s0§("Snd_upgradeSkill");
            return false;
         }
         if(this.§1t924s0§ == -1)
         {
            return false;
         }
         var _loc1_:int = §1t24s0§.§1t1847s0§();
         if(this.§1t924s0§ - _loc1_ < 0)
         {
            if(§1t3318s0§.instance.§1t3463s0§("ts",true))
            {
               return false;
            }
            _loc2_ = this.§1t7241s0§.§1t952s0§();
            this.§1t7302s0§[_loc2_].§1t698s0§(this.§1t5927s0§(_loc2_));
            _loc3_ = this.§1t7323s0§(_loc2_,false);
            §1t412s0§.instance.§1t916s0§.§1t588s0§(_loc3_);
            §1t88s0§.instance.§1t1516s0§("Snd_upgradeSkill");
            if(_loc3_ == §1t12495s0§)
            {
               this.§1t924s0§ = -1;
               this.§1t7301s0§.visible = false;
            }
            else
            {
               _loc4_ = this.§1t5927s0§(_loc2_) / this.§1t7241s0§.§1t932s0§();
               this.§1t7307s0§ = _loc1_;
               this.§1t924s0§ = _loc1_ + _loc4_;
               this.§1t7301s0§.text = this.§1t7328s0§(_loc1_);
            }
            this.§1t927s0§ = true;
            §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
            §1t114s0§.instance.§1t1539s0§();
            return true;
         }
         this.§1t927s0§ = true;
         §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
         §1t114s0§.instance.§1t1539s0§();
         return false;
      }
      
      public function §1t7339s0§() : *
      {
         var _loc1_:int = §1t24s0§.§1t1847s0§();
         var _loc2_:int = _loc1_ - this.§1t7307s0§;
         var _loc3_:int = this.§1t7241s0§.§1t932s0§() * _loc2_;
         var _loc4_:int = this.§1t7241s0§.§1t952s0§();
         this.§1t7302s0§[_loc4_].§1t698s0§(_loc3_);
         var _loc5_:int = this.§1t5927s0§(this.§1t7241s0§.§1t952s0§()) / this.§1t7241s0§.§1t932s0§();
         this.§1t7307s0§ = _loc1_;
         this.§1t924s0§ = _loc1_ + _loc5_;
         this.§1t927s0§ = true;
         §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
      }
      
      public function §1t7340s0§(param1:int, param2:int) : *
      {
         this.§1t7303s0§ = param1;
         this.§1t7304s0§ = param2;
      }
      
      public function §1t7341s0§() : §1t28s0§
      {
         return this.§1t7241s0§;
      }
      
      public function §1t7342s0§() : *
      {
         var _loc1_:int = this.§1t3309s0§();
         var _loc2_:int = this.§1t7318s0§();
         if(this.§1t7333s0§())
         {
            _loc2_ /= 2;
         }
         if(_loc1_ < _loc2_ && §1t412s0§.instance.§1t7628s0§().§1t579s0§(§1t24s0§.§1t8749s0§) > 0)
         {
            _loc1_ += 10;
            if(_loc1_ > _loc2_)
            {
               _loc1_ = _loc2_;
            }
            this.§1t7357s0§(§1t1523s0§.§1t9402s0§,_loc1_);
            §1t412s0§.instance.§1t7628s0§().§1t580s0§(§1t24s0§.§1t8749s0§,-1);
            §1t114s0§.instance.§1t1539s0§();
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      public function §1t7343s0§() : *
      {
         var _loc1_:int = this.§1t3309s0§();
         var _loc2_:int = this.§1t7318s0§();
         if(this.§1t7333s0§())
         {
            _loc2_ /= 2;
         }
         var _loc3_:int = Math.ceil((_loc2_ - _loc1_) / 10);
         var _loc4_:int = §1t412s0§.instance.§1t7628s0§().§1t579s0§(§1t24s0§.§1t8749s0§);
         if(_loc3_ == 0 || _loc4_ == 0)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(_loc4_ < _loc3_)
         {
            _loc1_ += 10 * _loc4_;
            this.§1t7357s0§(§1t1523s0§.§1t9402s0§,_loc1_);
            §1t412s0§.instance.§1t7628s0§().§1t580s0§(§1t24s0§.§1t8749s0§,-_loc4_);
            §1t114s0§.instance.§1t1539s0§();
         }
         else
         {
            this.§1t7357s0§(§1t1523s0§.§1t9402s0§,_loc2_);
            §1t412s0§.instance.§1t7628s0§().§1t580s0§(§1t24s0§.§1t8749s0§,-_loc3_);
            §1t114s0§.instance.§1t1539s0§();
         }
      }
      
      internal function §1t7344s0§(param1:int) : *
      {
         if(this.§1t7310s0§ == §1t12497s0§)
         {
            this.§1t7345s0§(§1t1523s0§.§1t9403s0§,(10 + int(Math.random() * 9) * 2) * param1);
            this.§1t7357s0§(§1t1523s0§.§1t9402s0§,this.§1t7318s0§());
            this.§1t7345s0§(§1t1523s0§.§1t9406s0§,(10 + int(Math.random() * 9) * 5 / 3) * param1);
            this.§1t7357s0§(§1t1523s0§.§1t9405s0§,this.§1t7319s0§());
            this.§1t7345s0§(§1t1523s0§.§1t9408s0§,(3 + int(Math.random() * 7) * 3 / 3) * param1);
            this.§1t7345s0§(§1t1523s0§.§1t9409s0§,(3 + int(Math.random() * 7) * 3 / 3) * param1);
            this.§1t7345s0§(§1t1523s0§.§1t9410s0§,(3 + int(Math.random() * 7) * 2 / 3) * param1);
         }
         else
         {
            this.§1t7345s0§(§1t1523s0§.§1t9403s0§,10 * param1);
            this.§1t7357s0§(§1t1523s0§.§1t9402s0§,this.§1t7318s0§());
            this.§1t7345s0§(§1t1523s0§.§1t9406s0§,10 * param1);
            this.§1t7357s0§(§1t1523s0§.§1t9405s0§,this.§1t7319s0§());
            this.§1t7345s0§(§1t1523s0§.§1t9408s0§,3 * param1);
            this.§1t7345s0§(§1t1523s0§.§1t9409s0§,3 * param1);
            this.§1t7345s0§(§1t1523s0§.§1t9410s0§,3 * param1);
         }
         this.§1t7308s0§ = 0;
         this.§1t7309s0§ = 0;
         §1t114s0§.instance.§1t1539s0§();
      }
      
      internal function §1t7345s0§(param1:int, param2:int) : *
      {
         this.§1t7357s0§(param1,this.§1t7356s0§(param1) + param2);
      }
      
      public function §1t7346s0§() : *
      {
         this.§1t7357s0§(§1t1523s0§.§1t9402s0§,this.§1t7318s0§());
         this.§1t567s0§.§1t695s0§(50);
         this.§1t7305s0§ = true;
         this.§1t7306s0§ = false;
         this.§1t7307s0§ = -1;
         this.§1t924s0§ = -1;
         this.§1t7308s0§ = 0;
         this.§1t7309s0§ = 0;
         this.§1t7354s0§();
      }
      
      public function §1t7347s0§(param1:int) : *
      {
         var _loc2_:int = this.§1t567s0§.§1t697s0§();
         _loc2_ += param1;
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
         }
         else if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         this.§1t567s0§.§1t695s0§(_loc2_);
      }
      
      public function §1t3269s0§(param1:int) : *
      {
         if(this.§1t7241s0§ == null)
         {
            param1 = §1t1544s0§.§1t11154s0§;
         }
         this.actionState = param1;
         switch(param1)
         {
            case §1t1544s0§.§1t11141s0§:
               this.§1t4514s0§ = 48;
               this.mcs.§1t1557s0§(§1t1544s0§.§1t10259s0§);
               break;
            case §1t1544s0§.§1t11143s0§:
               this.§1t4514s0§ = 48;
               this.mcs.§1t1557s0§(§1t1544s0§.§1t10269s0§);
               if(this.velX > 0)
               {
                  this.mcs.§1t5493s0§();
               }
               else
               {
                  this.mcs.§1t5492s0§();
               }
               break;
            case §1t1544s0§.§1t11154s0§:
               this.mcs.§1t1557s0§(§1t1544s0§.§1t10259s0§);
         }
      }
      
      internal function §1t3270s0§() : *
      {
         switch(this.actionState)
         {
            case §1t1544s0§.§1t11141s0§:
               --this.§1t4514s0§;
               if(this.§1t4514s0§ <= 0)
               {
                  this.§1t4514s0§ = 24;
                  if(int(Math.random() * 3) == 0)
                  {
                     this.§1t3269s0§(§1t1544s0§.§1t11143s0§);
                  }
               }
               break;
            case §1t1544s0§.§1t11143s0§:
               if(this.§1t7241s0§ != null)
               {
                  x += this.velX;
                  if(this.velX > 0 && x >= this.§1t7304s0§)
                  {
                     this.velX = -this.§1t3243s0§;
                     this.mcs.§1t5492s0§();
                  }
                  else if(this.velX < 0 && x <= this.§1t7303s0§)
                  {
                     this.velX = this.§1t3243s0§;
                     this.mcs.§1t5493s0§();
                  }
                  this.mcs.§1t3268s0§();
                  --this.§1t4514s0§;
                  if(this.§1t4514s0§ <= 0)
                  {
                     this.§1t4514s0§ = 24;
                     if(int(Math.random() * 3) == 0)
                     {
                        this.§1t3269s0§(§1t1544s0§.§1t11141s0§);
                     }
                  }
               }
               break;
            case §1t1544s0§.§1t11154s0§:
         }
      }
      
      public function update(param1:int) : *
      {
         this.§1t3270s0§();
      }
      
      public function §1t7350s0§(param1:int, param2:Boolean, param3:int = 1) : *
      {
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(!this.§1t7306s0§ && !this.§1t7305s0§)
         {
            _loc4_ = this.§1t927s0§;
            if(this.§1t924s0§ != -1)
            {
               this.§1t7301s0§.text = this.§1t7328s0§(param1);
            }
            _loc5_ = this.§1t3309s0§();
            _loc6_ = this.§1t7318s0§();
            _loc7_ = this.§1t7333s0§();
            if(!_loc7_ && _loc5_ < _loc6_ || _loc7_ && _loc5_ < _loc6_ / 2)
            {
               if(this.§1t7241s0§ != null)
               {
                  if(this.§1t7241s0§.§1t928s0§() == §1t24s0§.§1t8770s0§)
                  {
                     if(this.§1t7241s0§.§1t931s0§() == 0)
                     {
                        _loc5_ += 10 * param3;
                     }
                     else if(this.§1t7241s0§.§1t931s0§() == 1)
                     {
                        _loc5_ += 20 * param3;
                     }
                     else if(this.§1t7241s0§.§1t931s0§() == 2)
                     {
                        _loc5_ += 30 * param3;
                     }
                  }
                  else
                  {
                     _loc5_ += 1 * param3;
                  }
                  if(_loc7_ && _loc5_ > _loc6_ / 2)
                  {
                     _loc5_ = _loc6_ / 2;
                  }
                  else if(!_loc7_ && _loc5_ > _loc6_)
                  {
                     _loc5_ = _loc6_;
                  }
                  this.§1t7357s0§(§1t1523s0§.§1t9402s0§,_loc5_);
               }
            }
            if(this.§1t7309s0§ > 0)
            {
               if(this.§1t7241s0§ != null && this.§1t7241s0§.§1t928s0§() == §1t24s0§.§1t8770s0§)
               {
                  if(this.§1t7241s0§.§1t931s0§() == 0)
                  {
                     this.§1t7309s0§ -= 10 * param3;
                  }
                  else if(this.§1t7241s0§.§1t931s0§() == 1)
                  {
                     this.§1t7309s0§ -= 20 * param3;
                  }
                  else if(this.§1t7241s0§.§1t931s0§() == 2)
                  {
                     this.§1t7309s0§ -= 30 * param3;
                  }
                  if(this.§1t7309s0§ <= 0)
                  {
                     this.§1t7308s0§ = 0;
                     this.§1t7309s0§ = 0;
                     this.§1t7301s0§.visible = false;
                  }
                  else
                  {
                     this.§1t7301s0§.visible = true;
                     this.§1t7301s0§.text = this.§1t937s0§(this.§1t7309s0§);
                  }
               }
            }
            if(param3 == 1)
            {
               --this.§1t7349s0§;
               if(this.§1t7349s0§ <= 0)
               {
                  this.§1t7349s0§ = this.§1t7348s0§;
                  _loc8_ = this.§1t567s0§.§1t697s0§();
                  if(_loc8_ > 50)
                  {
                     this.§1t567s0§.§1t698s0§(-1);
                  }
                  else if(_loc8_ < 50)
                  {
                     this.§1t567s0§.§1t698s0§(1);
                  }
               }
            }
            else
            {
               this.§1t7349s0§ = param3 % this.§1t7348s0§;
               _loc9_ = (param3 - this.§1t7349s0§) / this.§1t7348s0§;
               _loc8_ = this.§1t567s0§.§1t697s0§();
               if(param2)
               {
                  if(_loc8_ > 10)
                  {
                     this.§1t567s0§.§1t695s0§(10);
                  }
               }
               else if(_loc8_ > 50)
               {
                  _loc8_ -= _loc9_;
                  if(_loc8_ < 50)
                  {
                     _loc8_ = 50;
                  }
                  this.§1t567s0§.§1t695s0§(_loc8_);
               }
               else if(_loc8_ < 50)
               {
                  _loc8_ += _loc9_;
                  if(_loc8_ > 50)
                  {
                     _loc8_ = 50;
                  }
                  this.§1t567s0§.§1t695s0§(_loc8_);
               }
            }
            if(!this.§1t7311s0§ && !this.§1t3312s0§() && this.§1t7241s0§ != null && this.§1t7241s0§.§1t954s0§())
            {
               _loc10_ = this.§1t7323s0§(§1t24s0§.§1t8755s0§,false);
               if(_loc10_ < §1t1523s0§.§1t9470s0§)
               {
                  this.§1t7325s0§(60 * param3,_loc10_);
                  if(this.§1t7323s0§(§1t24s0§.§1t8755s0§,false) > _loc10_)
                  {
                     if(§1t3318s0§.instance.§1t3463s0§("tl",true))
                     {
                        return;
                     }
                     this.§1t7311s0§ = true;
                     this.§1t7301s0§.visible = true;
                     this.§1t7301s0§.text = §1t1521s0§.getString(22081);
                  }
               }
            }
            if(§1t412s0§.instance.§1t7576s0§ == this && §1t412s0§.instance.§1t7551s0§.visible)
            {
               §1t412s0§.instance.§1t7551s0§.§1t6816s0§();
            }
            this.§1t927s0§ = _loc4_;
         }
      }
      
      public function §1t7351s0§(param1:Boolean) : *
      {
         if(param1)
         {
            this.mcs.filters = [this.§1t7312s0§];
         }
         else
         {
            this.mcs.filters = null;
         }
      }
      
      public function §1t7352s0§() : Boolean
      {
         return this.§1t7302s0§[§1t24s0§.§1t8755s0§].§1t697s0§() == 0 && this.§1t7305s0§ && this.§1t567s0§.§1t697s0§() == 50 && !this.§1t3312s0§();
      }
      
      public function §1t7353s0§() : *
      {
         if(this.§1t7352s0§())
         {
            this.§1t7301s0§.visible = true;
            this.§1t7301s0§.text = §1t1521s0§.getString(22087);
         }
         else if(this.§1t7306s0§)
         {
            this.§1t7354s0§();
         }
      }
      
      public function §1t7354s0§() : *
      {
         this.§1t7301s0§.visible = true;
         this.§1t7301s0§.text = §1t1521s0§.getString(22096);
      }
      
      public function §1t7355s0§(param1:Boolean) : *
      {
         this.§1t7305s0§ = param1;
         this.§1t927s0§ = true;
      }
      
      public function §1t7356s0§(param1:int) : int
      {
         return this.§1t7315s0§[param1].§1t697s0§();
      }
      
      public function §1t7357s0§(param1:int, param2:int) : *
      {
         this.§1t7315s0§[param1].§1t695s0§(param2);
         this.§1t927s0§ = true;
         §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
      }
      
      public function §1t7358s0§(param1:int, param2:Boolean = false) : int
      {
         var _loc5_:§1t104s0§ = null;
         var _loc6_:§1t17s0§ = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         if(this.§1t7316s0§ == null || this.§1t7316s0§.length == 0)
         {
            return 0;
         }
         var _loc8_:* = 0;
         while(_loc8_ < 13)
         {
            if(_loc8_ != §1t1523s0§.§1t9443s0§ && _loc8_ != §1t1523s0§.§1t9445s0§ && _loc8_ != §1t1523s0§.§1t9449s0§ && _loc8_ != §1t1523s0§.§1t9441s0§ && !(param2 && _loc8_ == §1t1523s0§.§1t9448s0§))
            {
               _loc6_ = this.§1t7316s0§[_loc8_];
               if(_loc6_ != null)
               {
                  _loc4_ = _loc6_.§1t483s0§();
                  _loc5_ = §1t1524s0§.§1t9862s0§(_loc4_);
                  if(_loc5_ != null)
                  {
                     if(param1 == §1t1523s0§.§1t9409s0§)
                     {
                        _loc3_ += int(_loc5_.defense);
                     }
                     _loc9_ = _loc6_.§1t522s0§();
                     _loc10_ = int(_loc9_.length);
                     _loc7_ = 0;
                     while(_loc7_ < _loc10_)
                     {
                        if(_loc9_[_loc7_].§1t1212s0§() == param1)
                        {
                           _loc3_ += _loc9_[_loc7_].§1t1213s0§();
                        }
                        _loc7_++;
                     }
                  }
               }
            }
            _loc8_++;
         }
         if(param1 == §1t1523s0§.§1t9403s0§ && _loc3_ + this.§1t7356s0§(§1t1523s0§.§1t9403s0§) <= 0)
         {
            return -this.§1t7356s0§(§1t1523s0§.§1t9403s0§) + 1;
         }
         return _loc3_;
      }
      
      public function §1t912s0§() : int
      {
         return this.§1t7302s0§[§1t24s0§.§1t8755s0§].§1t697s0§();
      }
      
      public function §1t5439s0§() : Boolean
      {
         return !this.§1t1227s0§;
      }
      
      public function §1t7359s0§(param1:int) : *
      {
         if(param1 == §1t1523s0§.§1t9439s0§ && this.§1t5439s0§())
         {
            this.§1t7362s0§(§1t1523s0§.§1t9439s0§,4001);
            this.§1t7316s0§[§1t1523s0§.§1t9439s0§] = new §1t17s0§(4001);
            this.§1t7362s0§(§1t1523s0§.§1t9445s0§,10001);
            this.§1t7316s0§[§1t1523s0§.§1t9445s0§] = new §1t17s0§(10001);
         }
         else if(param1 == §1t1523s0§.§1t9446s0§ && this.§1t5439s0§())
         {
            this.§1t7362s0§(§1t1523s0§.§1t9446s0§,11001);
            this.§1t7316s0§[§1t1523s0§.§1t9446s0§] = new §1t17s0§(11001);
         }
         else
         {
            this.§1t7362s0§(param1,0);
            this.§1t7316s0§[param1] = new §1t17s0§(0);
            if(param1 == 9)
            {
               this.§1t7316s0§[10] = new §1t17s0§(0);
            }
         }
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9675s0§);
      }
      
      internal function §1t7360s0§() : §1t75s0§
      {
         return this.mcs;
      }
      
      public function §1t7361s0§(param1:int, param2:§1t17s0§) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param2.§1t483s0§() < 20000 && param2.§1t483s0§() > 2999)
         {
            this.§1t7316s0§[param1] = param2;
            if(param1 == 9)
            {
               this.§1t7316s0§[10] = new §1t17s0§(param2.§1t483s0§(),1);
               this.§1t7362s0§(10,param2.§1t483s0§(),_loc3_,_loc4_);
            }
            _loc3_ = int(param2.§1t527s0§());
            _loc4_ = param2.§1t528s0§();
            this.§1t7362s0§(param1,param2.§1t483s0§(),_loc3_,_loc4_);
         }
      }
      
      public function §1t7362s0§(param1:int, param2:int, param3:int = 1, param4:int = 1) : *
      {
         var _loc5_:§1t75s0§ = §1t406s0§.instance.§1t6466s0§.§1t6020s0§();
         switch(param1)
         {
            case §1t1523s0§.§1t9439s0§:
               this.§1t7360s0§().§1t6245s0§(param2,param3,param4);
               _loc5_.§1t6245s0§(param2,param3,param4);
               break;
            case §1t1523s0§.§1t9440s0§:
               this.§1t7360s0§().§1t6262s0§(param2,param3,param4);
               _loc5_.§1t6262s0§(param2,param3,param4);
               break;
            case §1t1523s0§.§1t9441s0§:
               this.§1t7360s0§().§1t6242s0§(param2);
               _loc5_.§1t6242s0§(param2);
               break;
            case §1t1523s0§.§1t9442s0§:
               if(param2 == 7049)
               {
                  this.§1t7360s0§().§1t6240s0§(0);
                  _loc5_.§1t6240s0§(0);
               }
               else
               {
                  this.§1t7360s0§().§1t6240s0§(param2,param3,param4);
                  _loc5_.§1t6240s0§(param2,param3,param4);
               }
               if(param2 == 0 || param2 == 7049)
               {
                  this.§1t7360s0§().§1t6247s0§();
                  _loc5_.§1t6247s0§();
               }
               else
               {
                  this.§1t7360s0§().§1t6248s0§();
                  _loc5_.§1t6248s0§();
               }
               break;
            case §1t1523s0§.§1t9443s0§:
               this.§1t7360s0§().§1t6239s0§(param2);
               _loc5_.§1t6239s0§(param2);
               break;
            case §1t1523s0§.§1t9444s0§:
               this.§1t7360s0§().§1t6243s0§(param2,param3,param4);
               _loc5_.§1t6243s0§(param2,param3,param4);
               break;
            case §1t1523s0§.§1t9445s0§:
               this.§1t7360s0§().§1t6244s0§(param2);
               _loc5_.§1t6244s0§(param2);
               break;
            case §1t1523s0§.§1t9446s0§:
               this.§1t7360s0§().§1t6264s0§(param2,param3,param4);
               _loc5_.§1t6264s0§(param2,param3,param4);
               break;
            case §1t1523s0§.§1t9447s0§:
               this.§1t7360s0§().§1t6263s0§(param2,param3,param4);
               _loc5_.§1t6263s0§(param2,param3,param4);
               break;
            case §1t1523s0§.§1t9448s0§:
               this.§1t7360s0§().§1t6265s0§(param2);
               _loc5_.§1t6265s0§(param2);
               this.§1t7360s0§().§1t6266s0§(param2);
               _loc5_.§1t6266s0§(param2);
               break;
            case §1t1523s0§.§1t9450s0§:
               this.§1t7360s0§().§1t6267s0§(param2);
               _loc5_.§1t6267s0§(param2);
         }
      }
      
      public function §1t7363s0§() : *
      {
         if(this.§1t7356s0§(§1t1523s0§.§1t9402s0§) > this.§1t7318s0§())
         {
            this.§1t7357s0§(§1t1523s0§.§1t9402s0§,this.§1t7318s0§());
         }
         if(this.§1t7356s0§(§1t1523s0§.§1t9405s0§) > this.§1t7319s0§())
         {
            this.§1t7357s0§(§1t1523s0§.§1t9405s0§,this.§1t7319s0§());
         }
         if(this.§1t7356s0§(§1t1523s0§.§1t9402s0§) <= 0)
         {
            this.§1t7357s0§(§1t1523s0§.§1t9402s0§,1);
         }
         if(this.§1t7356s0§(§1t1523s0§.§1t9405s0§) < 0)
         {
            this.§1t7357s0§(§1t1523s0§.§1t9405s0§,0);
         }
      }
      
      public function §1t7364s0§() : String
      {
         var _loc1_:String = null;
         _loc1_ = this.npcid + "," + this.charname + "," + this.§1t567s0§.§1t697s0§() + "," + this.§1t7307s0§ + "," + this.§1t924s0§ + "," + this.§1t7308s0§ + "," + this.§1t7309s0§ + "," + this.§1t7310s0§ + "," + this.§1t7302s0§[§1t24s0§.§1t8755s0§].§1t697s0§() + "," + this.§1t7302s0§[§1t24s0§.§1t8756s0§].§1t697s0§() + "," + this.§1t7302s0§[§1t24s0§.§1t8757s0§].§1t697s0§() + "," + this.§1t7302s0§[§1t24s0§.§1t8758s0§].§1t697s0§() + "," + this.§1t7302s0§[§1t24s0§.§1t8759s0§].§1t697s0§() + "," + this.§1t7302s0§[§1t24s0§.§1t8760s0§].§1t697s0§() + ",";
         if(this.§1t7305s0§)
         {
            _loc1_ += "1,";
         }
         else
         {
            _loc1_ += "0,";
         }
         if(this.§1t7306s0§)
         {
            _loc1_ += "1,";
         }
         else
         {
            _loc1_ += "0,";
         }
         if(this.§1t1227s0§)
         {
            _loc1_ += "1,";
         }
         else
         {
            _loc1_ += "0,";
         }
         if(this.§1t7305s0§ || this.§1t7241s0§ == null)
         {
            _loc1_ += "-1,0";
         }
         else
         {
            _loc1_ += this.§1t7241s0§.§1t921s0§ + "," + this.§1t7241s0§.§1t922s0§;
         }
         return _loc1_;
      }
      
      internal function §1t7365s0§(param1:String) : *
      {
         var _loc4_:§1t98s0§ = null;
         var _loc2_:Vector.<int> = §1t76s0§.§1t9220s0§(param1);
         var _loc3_:int = int(_loc2_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = new §1t98s0§();
            _loc4_.§1t695s0§(_loc2_[_loc5_]);
            this.§1t7315s0§[_loc5_] = _loc4_;
            _loc5_++;
         }
      }
      
      public function §1t7366s0§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = int(this.§1t7315s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc3_ == §1t1523s0§.§1t9402s0§ || _loc3_ == §1t1523s0§.§1t9403s0§ || _loc3_ == §1t1523s0§.§1t9405s0§ || _loc3_ == §1t1523s0§.§1t9406s0§ || _loc3_ == §1t1523s0§.§1t9408s0§ || _loc3_ == §1t1523s0§.§1t9409s0§ || _loc3_ == §1t1523s0§.§1t9410s0§ || _loc3_ == §1t1523s0§.§1t1235s0§ || _loc3_ == §1t1523s0§.§1t1236s0§ || _loc3_ == §1t1523s0§.§1t1237s0§ || _loc3_ == §1t1523s0§.§1t1238s0§ || _loc3_ == §1t1523s0§.§1t9431s0§ || _loc3_ == §1t1523s0§.§1t9432s0§ || _loc3_ == §1t1523s0§.§1t9433s0§)
            {
               _loc1_ += this.§1t7356s0§(_loc3_).toString() + "|";
            }
            _loc3_++;
         }
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 48;
         var _loc7_:§1t104s0§ = §1t1524s0§.§1t9862s0§(this.§1t7316s0§[§1t1523s0§.§1t9448s0§].§1t483s0§());
         if(_loc7_ != null && this.§1t7316s0§[§1t1523s0§.§1t9448s0§].§1t483s0§() != 0)
         {
            _loc4_ = _loc7_.mindamage;
            _loc5_ = _loc7_.maxdamage - _loc7_.mindamage;
            _loc6_ = _loc7_.slashusage;
            if(_loc6_ < 48)
            {
               _loc6_ = 48;
            }
         }
         var _loc8_:int = this.§1t7356s0§(§1t1523s0§.§1t9409s0§) + this.§1t7358s0§(§1t1523s0§.§1t9409s0§);
         return _loc1_ + (_loc4_ + "|" + _loc5_ + "|" + _loc6_ + "|" + _loc8_);
      }
      
      internal function §1t7367s0§(param1:String) : *
      {
         var _loc2_:Array = null;
         this.§1t7316s0§.fixed = false;
         this.§1t7316s0§.length = 0;
         _loc2_ = param1.split("|");
         var _loc3_:* = 0;
         while(_loc3_ < _loc2_.length)
         {
            this.§1t7316s0§.push(§1t17s0§.§1t8745s0§(_loc2_[_loc3_]));
            _loc3_++;
         }
         this.§1t7316s0§.fixed = true;
      }
      
      public function §1t1258s0§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = int(this.§1t7316s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc3_ == _loc2_ - 1)
            {
               _loc1_ += this.§1t7316s0§[_loc3_].§1t490s0§();
            }
            else
            {
               _loc1_ += this.§1t7316s0§[_loc3_].§1t490s0§() + "|";
            }
            _loc3_++;
         }
         return _loc1_;
      }
   }
}

