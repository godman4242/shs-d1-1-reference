package
{
   import playerio.§1t23s0§;
   
   public class §1t71s0§
   {
      
      internal var §1t1261s0§:int;
      
      internal var §1t1262s0§:Array = new Array();
      
      internal var §1t1263s0§:Array = new Array();
      
      internal var §1t1264s0§:Array = new Array();
      
      internal var §1t1265s0§:Array = new Array();
      
      internal var §1t1266s0§:Array = new Array();
      
      internal var §1t1267s0§:Array = new Array();
      
      internal var §1t1268s0§:String = "";
      
      internal var §1t1269s0§:int = -1;
      
      internal var §1t1270s0§:int = -1;
      
      internal var §1t1271s0§:int = -1;
      
      internal var §1t1272s0§:int = -1;
      
      internal var §1t1273s0§:int = -1;
      
      internal var §1t1274s0§:int = -1;
      
      internal var §1t1275s0§:int = 0;
      
      internal var §1t1276s0§:String = "";
      
      internal var §1t1277s0§:int = 0;
      
      internal var §1t1278s0§:String = §1t1521s0§.getString(813);
      
      internal var §1t1279s0§:String = "#666666";
      
      internal var §1t1281s0§:Boolean = false;
      
      internal var §1t1282s0§:Array = new Array();
      
      internal var §1t1283s0§:int = -1;
      
      internal var §1t1284s0§:int = 0;
      
      internal var §1t1285s0§:Array = new Array();
      
      internal var §1t1286s0§:Array = new Array(22);
      
      internal var §1t1287s0§:Array = new Array();
      
      internal var §1t1288s0§:String = "";
      
      internal var §1t1289s0§:String = "";
      
      internal var §1t1290s0§:String = "";
      
      internal var §1t1291s0§:§1t998s0§;
      
      internal var extraData:Boolean = false;
      
      private var §1t1347s0§:Array;
      
      public function §1t71s0§(param1:int)
      {
         super();
         this.§1t1261s0§ = param1;
         this.§1t1282s0§ = this.§1t1352s0§();
         this.§1t1276s0§ = §1t136s0§.§1t9190s0§().§1t1826s0§(this.§1t1261s0§);
         this.§1t1275s0§ = 0;
         this.§1t1277s0§ = 0;
         this.§1t1284s0§ = 0;
         this.§1t1333s0§();
      }
      
      public static function §1t9222s0§(param1:int) : Array
      {
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1);
         var _loc3_:int = _loc2_.rand(3);
         var _loc4_:int = 1;
         if(_loc3_ == 3)
         {
            _loc4_ = 2;
         }
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push(_loc2_.rand(4) + 1);
            _loc6_++;
         }
         _loc2_.destroy();
         return _loc5_;
      }
      
      public static function §1t9223s0§(param1:int) : Array
      {
         var _loc2_:int = §1t70s0§.instance.§1t1161s0§(param1,0,1);
         return §1t9222s0§(_loc2_);
      }
      
      public static function §1t9224s0§(param1:int) : Array
      {
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1 * 2);
         var _loc3_:int = _loc2_.rand(3);
         var _loc4_:int = 1;
         if(_loc3_ == 3)
         {
            _loc4_ = 2;
         }
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push(_loc2_.rand(4) + 1);
            _loc6_++;
         }
         _loc2_.destroy();
         return _loc5_;
      }
      
      public static function §1t9225s0§(param1:int) : Array
      {
         var _loc2_:int = §1t70s0§.instance.§1t1161s0§(param1,1,0);
         return §1t9224s0§(_loc2_);
      }
      
      public function §1t1293s0§() : Boolean
      {
         var _loc1_:int = this.§1t1261s0§ & 0x0FFF;
         var _loc2_:int = this.§1t1261s0§ >> 12 & 0x0FFF;
         return §1t1524s0§.§1t7976s0§(_loc2_,_loc1_);
      }
      
      public function getID() : int
      {
         return this.§1t1261s0§;
      }
      
      public function §1t1295s0§() : Boolean
      {
         return this.§1t1275s0§ > 0 && this.§1t1283s0§ != -1;
      }
      
      public function §1t1296s0§(param1:int) : *
      {
         var _loc2_:int = int(this.§1t1262s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.§1t1262s0§[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function §1t1297s0§(param1:int) : *
      {
         var _loc2_:int = int(this.§1t1264s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.§1t1264s0§[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function §1t1298s0§(param1:int) : *
      {
         var _loc2_:int = int(this.§1t1265s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.§1t1265s0§[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function §1t1299s0§(param1:int) : Boolean
      {
         if(!this.§1t1298s0§(param1))
         {
            return false;
         }
         return §1t70s0§.instance.§1t1152s0§(param1);
      }
      
      public function §1t1300s0§(param1:int) : *
      {
         var _loc2_:int = int(this.§1t1263s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.§1t1263s0§[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function §1t1301s0§(param1:int) : *
      {
         var _loc2_:int = int(this.§1t1266s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.§1t1266s0§[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function §1t1302s0§(param1:int) : *
      {
         var _loc2_:int = int(this.§1t1267s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.§1t1267s0§[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function §1t1303s0§(param1:int) : *
      {
         return this.§1t1269s0§ == param1;
      }
      
      public function §1t1304s0§() : int
      {
         return this.§1t1269s0§;
      }
      
      public function §1t1305s0§(param1:int) : *
      {
         return this.§1t1270s0§ == param1;
      }
      
      public function §1t1306s0§() : int
      {
         return this.§1t1270s0§;
      }
      
      public function §1t1307s0§(param1:int) : *
      {
         return this.§1t1272s0§ == param1;
      }
      
      public function §1t1308s0§() : int
      {
         return this.§1t1272s0§;
      }
      
      public function §1t1309s0§(param1:int) : *
      {
         return this.§1t1271s0§ == param1;
      }
      
      public function §1t1310s0§() : int
      {
         return this.§1t1271s0§;
      }
      
      public function §1t1311s0§() : Boolean
      {
         return this.§1t1271s0§ != -1 && this.§1t1345s0§(§1t2281s0§.§1t11549s0§);
      }
      
      public function §1t1312s0§(param1:int) : *
      {
         return this.§1t1273s0§ == param1;
      }
      
      public function §1t1313s0§() : int
      {
         return this.§1t1273s0§;
      }
      
      public function §1t1314s0§(param1:int) : *
      {
         return this.§1t1274s0§ == param1;
      }
      
      public function §1t1315s0§() : int
      {
         return this.§1t1274s0§;
      }
      
      public function §1t1316s0§(param1:int) : *
      {
         return this.§1t1283s0§ == param1 && this.§1t1275s0§ == 0 && !§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§) && §1t58s0§.random(2,this.§1t1261s0§) == 0;
      }
      
      public function §1t1317s0§(param1:int) : *
      {
         return this.§1t1283s0§ == param1 && this.§1t1275s0§ == 0 && !§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§) && §1t58s0§.random(2,this.§1t1261s0§) != 0;
      }
      
      public function §1t1318s0§(param1:int) : *
      {
         return this.§1t1283s0§ == param1 && this.§1t1275s0§ > 0;
      }
      
      public function §1t1319s0§() : int
      {
         if(this.§1t1275s0§ > 0)
         {
            return this.§1t1283s0§;
         }
         return -1;
      }
      
      public function §1t1320s0§() : int
      {
         return this.§1t1283s0§;
      }
      
      public function §1t1321s0§() : String
      {
         return this.§1t1288s0§;
      }
      
      public function §1t1322s0§() : String
      {
         return this.§1t1289s0§.split("|").join(", ");
      }
      
      public function §1t1323s0§() : String
      {
         return this.§1t1290s0§.split("|").join(", ");
      }
      
      public function §1t1324s0§() : String
      {
         var _loc1_:String = "<font color=\'#FF0000\'>" + this.§1t1291s0§.§1t1005s0§(1) + "</font>/<font color=\'#00FF00\'>" + this.§1t1291s0§.§1t1005s0§(2) + "</font>/<font color=\'#00FFFF\'>" + this.§1t1291s0§.§1t1005s0§(3) + "</font>/<font color=\'#FFFF00\'>" + this.§1t1291s0§.§1t1005s0§(4) + "</font>";
         var _loc2_:Array = this.§1t1291s0§.§1t1006s0§();
         var _loc3_:Array = this.§1t1291s0§.§1t1007s0§();
         var _loc4_:int = int(_loc2_.length);
         var _loc5_:int = -1;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            if(§1t1523s0§.§1t9663s0§(_loc2_[_loc6_]) && _loc2_[_loc6_] != §1t1523s0§.§1t7746s0§())
            {
               if(_loc3_[_loc6_] > _loc5_)
               {
                  _loc5_ = int(_loc3_[_loc6_]);
               }
            }
            _loc6_++;
         }
         if(_loc5_ > -1)
         {
            _loc1_ += "/<font color=\'" + §1t1523s0§.§1t9662s0§() + "\'>" + _loc5_ + "</font>";
         }
         if(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()))
         {
            _loc1_ += "/<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>" + this.§1t1291s0§.§1t1005s0§(§1t1523s0§.§1t7746s0§()) + "</font>";
         }
         return _loc1_;
      }
      
      public function §1t1325s0§(param1:int, param2:int) : *
      {
         if(this.§1t1291s0§ == null || this.§1t1275s0§ == 0)
         {
            return;
         }
         var _loc3_:int = this.§1t1291s0§.§1t1005s0§(param1);
         _loc3_ += param2;
         this.§1t1291s0§.put(param1,_loc3_,true);
      }
      
      public function §1t1326s0§(param1:int) : *
      {
         if(this.§1t1275s0§ == 0)
         {
            return;
         }
         this.§1t1275s0§ += param1;
         if(param1 < 0)
         {
            param1 = 0;
         }
      }
      
      public function §1t1327s0§() : Boolean
      {
         return this.§1t1275s0§ > 0 && this.§1t1275s0§ < 500;
      }
      
      public function §1t1328s0§() : Boolean
      {
         return this.§1t1284s0§ == 1 && !§1t70s0§.instance.§1t1142s0§(this.§1t1261s0§);
      }
      
      public function §1t1329s0§() : Array
      {
         return this.§1t1262s0§;
      }
      
      public function §1t1330s0§() : Array
      {
         return this.§1t1266s0§;
      }
      
      public function §1t1331s0§() : Array
      {
         return this.§1t1263s0§;
      }
      
      public function §1t1332s0§() : Array
      {
         return this.§1t1264s0§;
      }
      
      internal function §1t1333s0§() : *
      {
         var _loc1_:int = §1t1524s0§.§1t9855s0§(this.§1t1261s0§);
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            _loc1_ = §1t58s0§.random(7,this.§1t1261s0§);
         }
         if(_loc1_ == 0)
         {
            this.§1t1275s0§ = 0;
         }
         else if(_loc1_ == 1)
         {
            this.§1t1275s0§ = 250;
         }
         else if(_loc1_ == 2)
         {
            this.§1t1275s0§ = 750;
         }
         else if(_loc1_ == 3)
         {
            this.§1t1275s0§ = 1500;
         }
         else if(_loc1_ == 4)
         {
            this.§1t1275s0§ = 2500;
         }
         else if(_loc1_ == 5)
         {
            this.§1t1275s0§ = 5000;
         }
         else
         {
            this.§1t1275s0§ = 0;
         }
         this.§1t1277s0§ = 0;
         this.§1t1284s0§ = 0;
      }
      
      public function §1t1334s0§(param1:String) : *
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:§1t1799s0§ = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:§1t2261s0§ = null;
         this.§1t1281s0§ = true;
         var _loc2_:Array = param1.split(",");
         this.§1t1285s0§ = new Array();
         this.§1t1286s0§ = new Array();
         this.§1t1287s0§ = new Array();
         if(§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§))
         {
            if(this.§1t1261s0§ == 1397077)
            {
               this.§1t1275s0§ = 0;
               this.§1t1277s0§ = 0;
            }
            else if(this.§1t1261s0§ == 1397078)
            {
               this.§1t1275s0§ = 0;
               this.§1t1277s0§ = 0;
            }
            else if(this.§1t1261s0§ == 1397078)
            {
               this.§1t1275s0§ = 1500;
               this.§1t1277s0§ = 0;
            }
            else if(this.§1t1261s0§ == 1413461)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 2;
            }
            else if(this.§1t1261s0§ == 1405270)
            {
               this.§1t1275s0§ = 2500;
               this.§1t1277s0§ = 0;
            }
            else if(this.§1t1261s0§ == 1405271)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 0;
            }
            else if(this.§1t1261s0§ == 1409366)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 4;
            }
            else if(this.§1t1261s0§ == 1401176)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 3;
            }
            else if(this.§1t1261s0§ == 1397081)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 1;
            }
            else if(this.§1t1261s0§ == 1466699)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 4;
            }
            else if(this.§1t1261s0§ == 1503572)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 2;
            }
            else if(this.§1t1261s0§ == 1368424)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 3;
            }
            else if(this.§1t1261s0§ == 1540387)
            {
               this.§1t1275s0§ = 5000;
               this.§1t1277s0§ = 1;
            }
            else
            {
               this.§1t1333s0§();
            }
            return;
         }
         if(_loc2_.length == 7 || _loc2_.length == 4)
         {
            if(!§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§))
            {
               if(_loc2_[0] != "0")
               {
                  this.§1t1275s0§ = int(_loc2_[0]);
               }
               this.§1t1277s0§ = int(_loc2_[1]);
               if(_loc2_[2] != "")
               {
                  this.§1t1276s0§ = _loc2_[2];
               }
               this.§1t1284s0§ = int(_loc2_[3]);
            }
            if(_loc2_.length == 7)
            {
               _loc8_ = _loc2_[4];
               _loc3_ = _loc8_.split("@");
               _loc5_ = int(_loc3_.length);
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc3_[_loc7_].split("!");
                  if(_loc4_.length == 4)
                  {
                     _loc9_ = new §1t1799s0§(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3]);
                     this.§1t1285s0§.push(_loc9_);
                  }
                  _loc7_++;
               }
               this.§1t1285s0§.push(new §1t1799s0§(§1t1799s0§.§1t11429s0§,§1t1799s0§.§1t11446s0§,§1t1799s0§.§1t11454s0§));
               _loc10_ = _loc2_[5];
               _loc3_ = _loc10_.split("@");
               _loc7_ = 0;
               while(_loc7_ < 22)
               {
                  this.§1t1286s0§[_loc7_] = false;
                  _loc7_++;
               }
               _loc5_ = int(_loc3_.length);
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  this.§1t1286s0§[int(_loc3_[_loc7_])] = true;
                  _loc7_++;
               }
               _loc11_ = _loc2_[6];
               _loc3_ = _loc11_.split("@");
               _loc5_ = int(_loc3_.length);
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc4_ = _loc3_[_loc7_].split("!");
                  if(_loc4_.length == 7)
                  {
                     _loc12_ = new §1t2261s0§(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
                     this.§1t1287s0§.push(_loc12_);
                  }
                  _loc7_++;
               }
            }
         }
         else if(!§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§))
         {
            this.§1t1333s0§();
         }
         if(§1t70s0§.instance.§1t1142s0§(this.§1t1261s0§) && this.§1t1275s0§ < 500)
         {
            this.§1t1275s0§ = 500;
         }
         if(this.§1t1261s0§ == 1470806)
         {
            this.§1t1275s0§ = 1500;
         }
         else if(this.§1t1261s0§ == 1442136)
         {
            this.§1t1275s0§ = 0;
         }
         else if(this.§1t1261s0§ == 1483090)
         {
            this.§1t1275s0§ = 0;
         }
      }
      
      public function §1t1335s0§() : Boolean
      {
         return this.§1t1281s0§;
      }
      
      public function §1t1336s0§(param1:String, param2:Array) : *
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc3_:Array = param1.split(",");
         this.§1t1288s0§ = _loc3_[0];
         this.§1t1289s0§ = _loc3_[1];
         this.§1t1290s0§ = _loc3_[2];
         this.extraData = true;
         this.§1t1291s0§ = new §1t998s0§();
         this.§1t1291s0§.put(1,0);
         this.§1t1291s0§.put(2,0);
         this.§1t1291s0§.put(3,0);
         this.§1t1291s0§.put(4,0);
         if(_loc3_.length >= 7)
         {
            this.§1t1291s0§.put(1,int(_loc3_[3]),true);
            this.§1t1291s0§.put(2,int(_loc3_[4]),true);
            this.§1t1291s0§.put(3,int(_loc3_[5]),true);
            this.§1t1291s0§.put(4,int(_loc3_[6]),true);
         }
         if(param2 != null)
         {
            for(_loc5_ in param2)
            {
               _loc4_ = int(_loc5_);
               this.§1t1291s0§.put(int(_loc4_),param2[_loc4_],true);
            }
         }
      }
      
      public function §1t1337s0§() : Boolean
      {
         return this.extraData;
      }
      
      public function §1t1338s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this.extraData)
         {
            §1t3317s0§.instance.§1t1967s0§(this.§1t1261s0§ >> 12 & 0x0FFF,this.§1t1261s0§ & 0x0FFF);
         }
         var _loc1_:int = this.§1t1339s0§();
         var _loc2_:String = "<font color=\'#FFFFFF\'>" + this.§1t1341s0§() + "</font>\n";
         if(!§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§))
         {
            _loc2_ += "(" + §1t1521s0§.getString(454) + ": " + this.§1t1340s0§() + ")\n";
         }
         else
         {
            _loc2_ += §1t1521s0§.getString(584) + "\n";
         }
         if(this.extraData && this.§1t1288s0§ != null && this.§1t1288s0§ != "")
         {
            _loc2_ += §1t1521s0§.getString(496,[this.§1t1288s0§]) + "\n";
         }
         _loc2_ += §1t1521s0§.getString(554) + §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()) + "\n\n";
         if(_loc1_ == 1)
         {
            _loc2_ += §1t1521s0§.getString(493) + "\n";
         }
         else if(!§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§) && (this.§1t1277s0§ == 0 || this.§1t1277s0§ == 5))
         {
            _loc2_ += §1t1521s0§.getString(585) + "\n";
         }
         else if(this.§1t1277s0§ == 1)
         {
            _loc2_ += §1t1521s0§.getString(490,["<font color=\'#FF0000\'>" + §1t1521s0§.getString(275) + "</font>"]) + "\n";
         }
         else if(this.§1t1277s0§ == 2)
         {
            _loc2_ += §1t1521s0§.getString(490,["<font color=\'#00FF00\'>" + §1t1521s0§.getString(276) + "</font>"]) + "\n";
         }
         else if(this.§1t1277s0§ == 3)
         {
            _loc2_ += §1t1521s0§.getString(490,["<font color=\'#00FFFF\'>" + §1t1521s0§.getString(277) + "</font>"]) + "\n";
         }
         else if(this.§1t1277s0§ == 4)
         {
            _loc2_ += §1t1521s0§.getString(490,["<font color=\'#FFFF00\'>" + §1t1521s0§.getString(278) + "</font>"]) + "\n";
         }
         else if(§1t1523s0§.§1t9663s0§(this.§1t1277s0§))
         {
            if(this.§1t1277s0§ == §1t1523s0§.§1t7746s0§())
            {
               _loc2_ += §1t1521s0§.getString(490,["<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>" + §1t1523s0§.§1t9654s0§() + "</font>"]) + "\n";
            }
            else
            {
               _loc2_ += §1t1521s0§.getString(490,["<font color=\'" + this.§1t1279s0§ + "\'>" + this.§1t1278s0§ + "</font>"]) + "\n";
            }
         }
         if(this.§1t1328s0§())
         {
            _loc2_ += "\n" + §1t1521s0§.getString(560) + "\n";
         }
         else if(this.extraData)
         {
            if(this.§1t1291s0§ != null && !§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§))
            {
               _loc2_ += §1t1521s0§.getString(561) + this.§1t1324s0§() + "\n";
               _loc3_ = §1t1523s0§.§1t7746s0§();
               if(this.§1t1277s0§ != _loc3_ && _loc3_ != 0)
               {
                  if(this.§1t1277s0§ == 0 || this.§1t1277s0§ == 5)
                  {
                     _loc4_ = 100;
                  }
                  else
                  {
                     _loc4_ = this.§1t1291s0§.§1t1005s0§(this.§1t1277s0§) * 2;
                  }
                  if(_loc4_ < 100)
                  {
                     _loc4_ = 100;
                  }
                  _loc2_ += §1t1521s0§.getString(626);
                  if(_loc3_ == 1)
                  {
                     _loc2_ += "<font color=\'#FF0000\'>";
                  }
                  else if(_loc3_ == 2)
                  {
                     _loc2_ += "<font color=\'#00FF00\'>";
                  }
                  else if(_loc3_ == 3)
                  {
                     _loc2_ += "<font color=\'#00FFFF\'>";
                  }
                  else if(_loc3_ == 4)
                  {
                     _loc2_ += "<font color=\'#FFFF00\'>";
                  }
                  else if(§1t1523s0§.§1t9663s0§(_loc3_))
                  {
                     _loc2_ += "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
                  }
                  else
                  {
                     _loc2_ += "<font>";
                  }
                  _loc2_ += _loc4_ + "</font>\n";
               }
            }
            if(this.§1t1289s0§ != null && this.§1t1289s0§ != "")
            {
               _loc2_ += "\n" + §1t1521s0§.getString(562) + this.§1t1322s0§();
            }
         }
         §1t406s0§.instance.§1t6487s0§.show("",§1t1521s0§.getString(5),true,2);
         §1t406s0§.instance.§1t6487s0§.§1t5482s0§(_loc2_);
      }
      
      public function §1t1339s0§() : int
      {
         if(this.§1t1275s0§ == 0)
         {
            return 0;
         }
         if(this.§1t1275s0§ < 500)
         {
            return 1;
         }
         if(this.§1t1275s0§ < 1000)
         {
            return 2;
         }
         if(this.§1t1275s0§ < 2000)
         {
            return 3;
         }
         if(this.§1t1275s0§ < 4000)
         {
            return 4;
         }
         return 5;
      }
      
      public function §1t1340s0§() : String
      {
         if(this.§1t1275s0§ == 0)
         {
            return "0";
         }
         if(this.§1t1275s0§ < 500)
         {
            return this.§1t1275s0§ + "/" + 500;
         }
         if(this.§1t1275s0§ < 1000)
         {
            return this.§1t1275s0§ + "/" + 1000;
         }
         if(this.§1t1275s0§ < 2000)
         {
            return this.§1t1275s0§ + "/" + 2000;
         }
         if(this.§1t1275s0§ < 4000)
         {
            return this.§1t1275s0§ + "/" + 4000;
         }
         return this.§1t1275s0§.toString();
      }
      
      public function §1t1341s0§() : String
      {
         var _loc1_:int = this.§1t1339s0§();
         if(_loc1_ == 0)
         {
            return "";
         }
         if(_loc1_ == 1)
         {
            return this.§1t1276s0§ + " " + §1t1521s0§.getString(450);
         }
         if(_loc1_ == 2)
         {
            return this.§1t1276s0§ + " " + §1t1521s0§.getString(450);
         }
         if(_loc1_ == 3)
         {
            return this.§1t1276s0§ + " " + §1t1521s0§.getString(451);
         }
         if(_loc1_ == 4)
         {
            return this.§1t1276s0§ + " " + §1t1521s0§.getString(452);
         }
         return this.§1t1276s0§ + " " + §1t1521s0§.getString(453);
      }
      
      public function §1t1342s0§() : int
      {
         return this.§1t1277s0§;
      }
      
      public function §1t1156s0§(param1:int, param2:int) : Array
      {
         var _loc3_:int = int(this.§1t1282s0§[param1][param2]);
         return [_loc3_ & 1,_loc3_ >> 1 & 1,_loc3_ >> 2 & 1,_loc3_ >> 3 & 1];
      }
      
      public function §1t1343s0§(param1:int, param2:int) : int
      {
         return this.§1t1282s0§[param1][param2];
      }
      
      public function §1t1344s0§() : int
      {
         var _loc2_:§1t58s0§ = null;
         var _loc3_:int = 0;
         var _loc1_:int = int(this.§1t1262s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = int(this.§1t1262s0§[_loc4_]);
            if(§1t70s0§.instance.§1t1151s0§(_loc3_) == §1t112s0§.§1t12548s0§)
            {
               if(§1t58s0§.random(2,_loc3_) != 0)
               {
                  return _loc3_;
               }
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function §1t1149s0§(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 == 8472589)
         {
            return §1t70s0§.§1t9142s0§;
         }
         if(this.§1t1296s0§(param1))
         {
            if(§1t70s0§.instance.§1t1151s0§(param1) == §1t112s0§.§1t12548s0§)
            {
               if(§1t58s0§.random(2,param1) == 0)
               {
                  _loc2_ = §1t70s0§.§1t9142s0§;
               }
               else
               {
                  _loc2_ = §1t70s0§.§1t9143s0§;
               }
            }
            else
            {
               _loc2_ = §1t70s0§.§1t9141s0§;
            }
         }
         else if(this.§1t1318s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9140s0§;
         }
         else if(this.§1t1316s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9155s0§;
         }
         else if(this.§1t1317s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9161s0§;
         }
         else if(this.§1t1303s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9148s0§;
         }
         else if(this.§1t1305s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9149s0§;
         }
         else if(this.§1t1307s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9151s0§;
         }
         else if(this.§1t1309s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9152s0§;
         }
         else if(this.§1t1312s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9153s0§;
         }
         else if(this.§1t1302s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9154s0§;
         }
         else if(this.§1t1300s0§(param1))
         {
            if(this.§1t1284s0§)
            {
               _loc2_ = §1t70s0§.§1t9163s0§;
            }
            else
            {
               _loc2_ = §1t70s0§.§1t9145s0§;
            }
         }
         else if(this.§1t1301s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9150s0§;
         }
         else if(this.§1t1298s0§(param1))
         {
            if(§1t70s0§.instance.§1t1152s0§(param1))
            {
               _loc2_ = §1t70s0§.§1t9162s0§;
            }
            else
            {
               _loc2_ = §1t70s0§.§1t9146s0§;
            }
         }
         else if(this.§1t1297s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9147s0§;
         }
         else if(this.§1t1314s0§(param1))
         {
            _loc2_ = §1t70s0§.§1t9164s0§;
         }
         return _loc2_;
      }
      
      public function §1t1345s0§(param1:int) : Boolean
      {
         if(§1t70s0§.instance.§1t1140s0§(this.§1t1261s0§))
         {
            return false;
         }
         if(!this.§1t1293s0§() && (param1 == §1t2281s0§.§1t11552s0§ || param1 == §1t2281s0§.§1t11553s0§ || param1 == §1t2281s0§.§1t11554s0§))
         {
            return true;
         }
         return this.§1t1286s0§[param1];
      }
      
      public function §1t1346s0§() : Array
      {
         return this.§1t1285s0§;
      }
      
      public function §1t1348s0§() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this.§1t1347s0§ == null)
         {
            _loc1_ = this.§1t1261s0§ >> 12 & 0x0FFF;
            _loc2_ = this.§1t1261s0§ & 0x0FFF;
            this.§1t1347s0§ = new Array();
            _loc4_ = 0;
            while(_loc4_ < 6)
            {
               _loc5_ = 0;
               while(_loc5_ < 6)
               {
                  _loc3_ = _loc1_ * 6 + _loc4_ << 12 | _loc2_ * 6 + _loc5_;
                  if(_loc3_ != this.§1t1269s0§ && _loc3_ != this.§1t1272s0§ && _loc3_ != this.§1t1273s0§)
                  {
                     this.§1t1347s0§.push(_loc3_);
                  }
                  _loc5_++;
               }
               _loc4_++;
            }
         }
         return this.§1t1347s0§;
      }
      
      public function §1t1349s0§() : *
      {
         if(this.§1t1268s0§ == "")
         {
            §1t406s0§.instance.§1t5947s0§.detailstext.text = §1t1521s0§.getString(90);
            §1t3318s0§.instance.§1t1349s0§(this.§1t1261s0§);
         }
         else
         {
            §1t406s0§.instance.§1t5947s0§.detailstext.text = this.§1t1268s0§;
         }
      }
      
      public function §1t1350s0§(param1:Array) : *
      {
         if(param1 == null || param1.length == 0)
         {
            this.§1t1268s0§ = §1t1521s0§.getString(820);
         }
         else
         {
            this.§1t1268s0§ = §1t2283s0§.§1t11583s0§(param1,this.§1t1275s0§);
         }
         if(§1t406s0§.instance.§1t5947s0§.visible && §1t406s0§.instance.§1t5947s0§.uimode == §1t401s0§.§1t12363s0§)
         {
            §1t406s0§.instance.§1t5947s0§.detailstext.text = this.§1t1268s0§;
         }
      }
      
      public function §1t1351s0§(param1:§1t23s0§) : *
      {
         var _loc2_:String = null;
         if(param1.clanname != "?")
         {
            this.§1t1278s0§ = §1t1521s0§.getString(563,[param1.clanname]);
         }
         if(§1t1643s0§.§1t11228s0§(param1.color))
         {
            this.§1t1279s0§ = "#666666";
         }
         else
         {
            _loc2_ = param1.color.toString(16);
            while(_loc2_.length < 6)
            {
               _loc2_ = "0" + _loc2_;
            }
            this.§1t1279s0§ = "#" + _loc2_;
         }
      }
      
      internal function §1t1352s0§() : Array
      {
         var _loc6_:§1t78s0§ = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:Boolean = false;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:Array = null;
         var _loc1_:§1t58s0§ = new §1t58s0§(this.§1t1261s0§);
         var _loc2_:Array = new Array();
         var _loc3_:Array = new Array();
         var _loc4_:int = this.§1t1261s0§ >> 12 & 0x0FFF;
         var _loc5_:int = this.§1t1261s0§ & 0x0FFF;
         var _loc7_:int = 0;
         while(_loc7_ < 6)
         {
            _loc2_[_loc7_] = new Array();
            _loc29_ = 0;
            while(_loc29_ < 6)
            {
               _loc6_ = new §1t78s0§(_loc7_,_loc29_,_loc4_ * 6 + _loc7_ << 12 | _loc5_ * 6 + _loc29_);
               _loc2_[_loc7_][_loc29_] = _loc6_;
               _loc3_.push(_loc6_);
               _loc29_++;
            }
            _loc7_++;
         }
         var _loc11_:Array = new Array();
         var _loc12_:Array = new Array();
         var _loc13_:int = this.§1t1261s0§ & 0x0FFF;
         var _loc14_:int = this.§1t1261s0§ >> 12 & 0x0FFF;
         _loc8_ = §1t9222s0§(this.§1t1261s0§);
         _loc9_ = int(_loc8_.length);
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc6_ = _loc2_[_loc8_[_loc7_]][0];
            _loc6_.§1t2127s0§(§1t78s0§.§1t11507s0§);
            if(§1t1524s0§.§1t7976s0§(_loc4_,_loc5_ - 1))
            {
               _loc6_.§1t1756s0§(§1t78s0§.§1t11513s0§);
            }
            _loc10_ = _loc3_.indexOf(_loc6_);
            _loc3_.splice(_loc10_,1);
            if(_loc7_ == 0)
            {
               _loc11_.push(_loc6_);
            }
            else
            {
               _loc12_.push(_loc6_);
            }
            _loc7_++;
         }
         _loc8_ = §1t9223s0§(this.§1t1261s0§);
         _loc9_ = int(_loc8_.length);
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc6_ = _loc2_[_loc8_[_loc7_]][5];
            _loc6_.§1t2127s0§(§1t78s0§.§1t11507s0§);
            if(§1t1524s0§.§1t7976s0§(_loc4_,_loc5_ + 1))
            {
               _loc6_.§1t1756s0§(§1t78s0§.§1t11514s0§);
            }
            _loc10_ = _loc3_.indexOf(_loc6_);
            _loc3_.splice(_loc10_,1);
            if(_loc7_ == 0)
            {
               _loc11_.push(_loc6_);
            }
            else
            {
               _loc12_.push(_loc6_);
            }
            _loc7_++;
         }
         _loc8_ = §1t9225s0§(this.§1t1261s0§);
         _loc9_ = int(_loc8_.length);
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc6_ = _loc2_[5][_loc8_[_loc7_]];
            _loc6_.§1t2127s0§(§1t78s0§.§1t11507s0§);
            if(§1t1524s0§.§1t7976s0§(_loc4_ + 1,_loc5_))
            {
               _loc6_.§1t1756s0§(§1t78s0§.§1t9134s0§);
            }
            _loc10_ = _loc3_.indexOf(_loc6_);
            _loc3_.splice(_loc10_,1);
            if(_loc7_ == 0)
            {
               _loc11_.push(_loc6_);
            }
            else
            {
               _loc12_.push(_loc6_);
            }
            _loc7_++;
         }
         _loc8_ = §1t9224s0§(this.§1t1261s0§);
         _loc9_ = int(_loc8_.length);
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc6_ = _loc2_[0][_loc8_[_loc7_]];
            _loc6_.§1t2127s0§(§1t78s0§.§1t11507s0§);
            if(§1t1524s0§.§1t7976s0§(_loc4_ - 1,_loc5_))
            {
               _loc6_.§1t1756s0§(§1t78s0§.§1t9135s0§);
            }
            _loc10_ = _loc3_.indexOf(_loc6_);
            _loc3_.splice(_loc10_,1);
            if(_loc7_ == 0)
            {
               _loc11_.push(_loc6_);
            }
            else
            {
               _loc12_.push(_loc6_);
            }
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < 4)
         {
            this.createRoute(_loc11_[_loc7_],_loc11_[_loc7_ + 1],_loc2_,_loc3_,_loc1_,false);
            this.§1t1265s0§.push(_loc11_[_loc7_].§1t2129s0§());
            this.§1t1265s0§.push(_loc11_[_loc7_ + 1].§1t2129s0§());
            _loc7_ += 2;
         }
         _loc9_ = int(_loc12_.length);
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            this.createRoute(_loc12_[_loc7_],_loc11_[_loc1_.rand(_loc11_.length)],_loc2_,_loc3_,_loc1_,false);
            this.§1t1265s0§.push(_loc12_[_loc7_].§1t2129s0§());
            _loc7_++;
         }
         _loc11_ = _loc11_.concat(_loc12_);
         var _loc15_:int = _loc1_.rand(2) + 5;
         _loc7_ = 0;
         while(_loc7_ < _loc15_ && _loc3_.length > 0)
         {
            _loc10_ = _loc1_.rand(_loc3_.length);
            _loc6_ = _loc3_[_loc10_];
            if(_loc7_ == 0)
            {
               _loc6_.§1t2127s0§(§1t78s0§.§1t11510s0§);
               this.§1t1262s0§.push(_loc6_.§1t2129s0§());
            }
            else if(_loc7_ == 1)
            {
               _loc6_.§1t2127s0§(§1t78s0§.§1t463s0§);
               this.§1t1269s0§ = _loc6_.§1t2129s0§();
            }
            else if(_loc7_ == 2)
            {
               this.§1t1272s0§ = _loc6_.§1t2129s0§();
               _loc6_.§1t2127s0§(§1t78s0§.§1t463s0§);
               this.§1t1264s0§.push(_loc6_.§1t2129s0§());
            }
            else if(_loc7_ == 3)
            {
               this.§1t1271s0§ = _loc6_.§1t2129s0§();
               _loc6_.§1t2127s0§(§1t78s0§.§1t463s0§);
               this.§1t1264s0§.push(_loc6_.§1t2129s0§());
            }
            else if(_loc7_ == 4)
            {
               this.§1t1273s0§ = _loc6_.§1t2129s0§();
               _loc6_.§1t2127s0§(§1t78s0§.§1t463s0§);
               this.§1t1264s0§.push(_loc6_.§1t2129s0§());
            }
            else if(_loc7_ == 5)
            {
               _loc6_.§1t2127s0§(§1t78s0§.§1t463s0§);
               if(_loc1_.rand(4) == 0)
               {
                  this.§1t1270s0§ = _loc6_.§1t2129s0§();
               }
               else
               {
                  this.§1t1274s0§ = _loc6_.§1t2129s0§();
               }
            }
            else
            {
               _loc6_.§1t2127s0§(§1t78s0§.§1t11512s0§);
               this.§1t1264s0§.push(_loc6_.§1t2129s0§());
            }
            _loc3_.splice(_loc10_,1);
            _loc30_ = _loc1_.rand(_loc11_.length);
            _loc31_ = this.createRoute(_loc6_,_loc11_[_loc30_],_loc2_,_loc3_,_loc1_);
            if(!_loc31_)
            {
               _loc32_ = 1;
               _loc33_ = int(_loc11_.length);
               while(!_loc31_ && _loc32_ < _loc33_)
               {
                  _loc30_++;
                  _loc32_++;
                  if(_loc30_ == _loc33_)
                  {
                     _loc30_ = 0;
                  }
                  _loc31_ = this.createRoute(_loc6_,_loc11_[_loc30_],_loc2_,_loc3_,_loc1_);
               }
               if(_loc31_)
               {
                  _loc6_.§1t2132s0§();
               }
            }
            _loc7_++;
         }
         var _loc16_:int = int(_loc3_.length);
         var _loc17_:Array = new Array();
         _loc7_ = 0;
         while(_loc7_ < _loc16_)
         {
            _loc6_ = _loc3_[_loc7_];
            if(_loc6_.§1t2128s0§() == §1t78s0§.§1t11506s0§)
            {
               _loc34_ = new Array();
               _loc17_.push(_loc34_);
               this.§1t1354s0§(_loc6_.§1t2130s0§(),_loc6_.§1t2131s0§(),_loc2_,_loc34_,-1);
            }
            _loc7_++;
         }
         _loc9_ = int(_loc17_.length);
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            this.§1t1353s0§(_loc17_[_loc7_],_loc2_,_loc1_);
            _loc7_++;
         }
         if(this.§1t1261s0§ == 1397077)
         {
            _loc2_[0][2].§1t1746s0§ = [1,0,0,0];
            _loc2_[0][3].§1t1746s0§ = [0,0,1,0];
            _loc2_[0][4].§1t1746s0§ = [0,1,1,0];
            _loc2_[2][0].§1t1746s0§ = [0,0,1,0];
            _loc2_[2][1].§1t1746s0§ = [0,1,1,1];
            _loc2_[3][0].§1t1746s0§ = [0,1,1,1];
            _loc2_[3][1].§1t1746s0§ = [1,1,0,1];
            _loc2_[3][3].§1t1746s0§ = [1,1,1,1];
            _loc2_[3][4].§1t1746s0§ = [1,1,1,1];
            _loc2_[4][0].§1t1746s0§ = [0,1,1,1];
            _loc2_[4][1].§1t1746s0§ = [1,1,1,0];
            _loc2_[4][2].§1t1746s0§ = [1,1,1,0];
            _loc2_[4][3].§1t1746s0§ = [0,0,1,1];
            _loc2_[4][3].§1t1746s0§ = [1,0,1,1];
            _loc2_[4][4].§1t1746s0§ = [0,1,1,1];
            _loc2_[5][3].§1t1746s0§ = [0,0,0,1];
            _loc2_[5][4].§1t1746s0§ = [0,0,1,1];
         }
         else if(this.§1t1261s0§ == 1442135)
         {
            _loc2_[2][1].§1t1746s0§ = [1,0,1,1];
            _loc2_[3][1].§1t1746s0§ = [1,1,0,1];
            _loc2_[0][3].§1t1746s0§ = [1,0,1,0];
            _loc2_[0][4].§1t1746s0§ = [0,1,1,1];
         }
         else if(this.§1t1261s0§ == 1425752)
         {
            _loc2_[1][0].§1t1746s0§ = [0,1,0,1];
            _loc2_[2][0].§1t1746s0§ = [0,1,1,0];
            _loc2_[1][2].§1t1746s0§ = [1,1,0,0];
            _loc2_[1][3].§1t1746s0§ = [1,0,1,1];
         }
         else if(this.§1t1261s0§ == 1483092)
         {
            _loc2_[0][1].§1t1746s0§ = [1,1,1,0];
            _loc2_[1][1].§1t1746s0§ = [1,1,0,1];
            _loc2_[2][1].§1t1746s0§ = [1,0,1,0];
            _loc2_[3][1].§1t1746s0§ = [0,1,1,1];
            _loc2_[3][2].§1t1746s0§ = [1,1,1,1];
         }
         else if(this.§1t1261s0§ == 1483090)
         {
            _loc2_[2][3].§1t1746s0§ = [1,1,0,1];
            _loc2_[3][3].§1t1746s0§ = [0,1,1,0];
            _loc2_[4][2].§1t1746s0§ = [1,0,1,1];
            _loc2_[5][2].§1t1746s0§ = [1,1,0,1];
         }
         else if(this.§1t1261s0§ == 1483087)
         {
            _loc2_[2][0].§1t1746s0§ = [0,0,1,1];
            _loc2_[3][1].§1t1746s0§ = [0,0,0,1];
            _loc2_[3][2].§1t1746s0§ = [0,1,1,0];
            _loc2_[3][0].§1t1746s0§ = [0,0,1,1];
            _loc2_[4][1].§1t1746s0§ = [1,1,1,0];
         }
         else if(this.§1t1261s0§ == 1401184)
         {
            _loc2_[1][4].§1t1746s0§ = [0,1,1,1];
            _loc2_[2][4].§1t1746s0§ = [1,0,1,1];
         }
         else if(this.§1t1261s0§ == 1581358)
         {
            _loc2_[3][1].§1t1746s0§ = [1,1,1,1];
            _loc2_[4][1].§1t1746s0§ = [1,0,1,1];
         }
         else if(this.§1t1261s0§ == 1495372)
         {
            _loc2_[2][5].§1t1746s0§ = [1,0,1,0];
         }
         else if(this.§1t1261s0§ == 1413467)
         {
            _loc2_[2][0].§1t1746s0§ = [0,1,0,1];
            _loc2_[1][0].§1t1746s0§ = [0,0,1,1];
         }
         else if(this.§1t1261s0§ == 1462613)
         {
            _loc2_[5][4].§1t1746s0§ = [1,1,0,0];
         }
         else if(this.§1t1261s0§ == 1515856)
         {
            _loc2_[0][0].§1t1746s0§ = [0,1,1,0];
            _loc2_[0][1].§1t1746s0§ = [1,1,0,0];
         }
         else if(this.§1t1261s0§ == 1491281)
         {
            _loc2_[5][4].§1t1746s0§ = [1,1,0,0];
            _loc2_[5][5].§1t1746s0§ = [1,0,0,0];
         }
         else if(this.§1t1261s0§ == 1524017)
         {
            _loc2_[4][0].§1t1746s0§ = [0,0,0,1];
            _loc2_[5][0].§1t1746s0§ = [0,1,0,0];
            _loc2_[5][1].§1t1746s0§ = [1,0,0,1];
         }
         else if(this.§1t1261s0§ == 1515852)
         {
            _loc2_[5][1].§1t1746s0§ = [1,1,0,0];
         }
         else if(this.§1t1261s0§ == 1384796)
         {
            _loc2_[0][4].§1t1746s0§ = [0,0,1,0];
            _loc2_[1][4].§1t1746s0§ = [0,1,1,1];
            _loc2_[1][5].§1t1746s0§ = [1,0,0,1];
         }
         else if(this.§1t1261s0§ == 1499467)
         {
            _loc2_[1][4].§1t1746s0§ = [1,1,1,0];
            _loc2_[1][5].§1t1746s0§ = [1,0,1,1];
         }
         else if(this.§1t1261s0§ == 1433947)
         {
            _loc2_[0][0].§1t1746s0§ = [0,1,1,0];
            _loc2_[0][1].§1t1746s0§ = [1,1,0,0];
         }
         else if(this.§1t1261s0§ == 1511746)
         {
            _loc2_[4][3].§1t1746s0§ = [1,1,1,0];
            _loc2_[4][4].§1t1746s0§ = [1,0,1,0];
         }
         else if(this.§1t1261s0§ == 1442134)
         {
            _loc2_[2][0].§1t1746s0§ = [0,1,1,0];
         }
         var _loc18_:Array = new Array();
         var _loc19_:Array = new Array();
         var _loc20_:Array = new Array();
         var _loc21_:Array = new Array();
         var _loc22_:Array = new Array();
         var _loc23_:Array = new Array();
         _loc7_ = 0;
         while(_loc7_ < 6)
         {
            _loc29_ = 0;
            while(_loc29_ < 6)
            {
               _loc6_ = _loc2_[_loc7_][_loc29_];
               if(_loc6_.§1t2135s0§())
               {
                  _loc18_.push(_loc6_);
               }
               else if(_loc6_.§1t1159s0§() && _loc6_.§1t2128s0§() == §1t78s0§.§1t11511s0§)
               {
                  _loc19_.push(_loc6_);
               }
               else if(_loc6_.§1t1158s0§() && _loc6_.§1t2128s0§() == §1t78s0§.§1t11508s0§)
               {
                  _loc20_.push(_loc6_);
               }
               else if(_loc6_.§1t1158s0§() && _loc6_.§1t2128s0§() == §1t78s0§.§1t11511s0§)
               {
                  _loc21_.push(_loc6_);
               }
               else if(_loc6_.§1t2136s0§() && _loc6_.§1t2128s0§() == §1t78s0§.§1t11508s0§)
               {
                  _loc22_.push(_loc6_);
               }
               else if(_loc6_.§1t2137s0§() && _loc6_.§1t2128s0§() == §1t78s0§.§1t11508s0§)
               {
                  _loc23_.push(_loc6_);
               }
               _loc29_++;
            }
            _loc7_++;
         }
         var _loc24_:int = _loc1_.rand(2);
         _loc7_ = 0;
         while(_loc7_ < _loc24_ && _loc19_.length > 0)
         {
            _loc10_ = _loc1_.rand(_loc19_.length);
            _loc6_ = _loc19_[_loc10_];
            _loc6_.§1t2127s0§(§1t78s0§.§1t11510s0§);
            _loc19_.splice(_loc10_,1);
            this.§1t1262s0§.push(_loc6_.§1t2129s0§());
            _loc7_++;
         }
         _loc9_ = int(_loc19_.length);
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc6_ = _loc19_[_loc7_];
            if(_loc7_ == 0 && this.§1t1274s0§ == -1)
            {
               this.§1t1274s0§ = _loc6_.§1t2129s0§();
            }
            else
            {
               this.§1t1264s0§.push(_loc6_.§1t2129s0§());
            }
            _loc7_++;
         }
         var _loc25_:* = int(_loc1_.rand(2) + 2);
         if(_loc20_.length > 0)
         {
            _loc10_ = _loc1_.rand(_loc20_.length);
            _loc6_ = _loc20_[_loc10_];
            _loc6_.§1t2127s0§(§1t78s0§.§1t11509s0§);
            _loc20_.splice(_loc10_,1);
            if(this.§1t1261s0§ == 1397077)
            {
               this.§1t1283s0§ = _loc2_[4][3].§1t2129s0§();
            }
            else if(this.§1t1261s0§ == 1405270)
            {
               this.§1t1283s0§ = _loc2_[1][3].§1t2129s0§();
            }
            else
            {
               this.§1t1283s0§ = _loc6_.§1t2129s0§();
            }
         }
         _loc7_ = 0;
         while(_loc7_ < _loc25_ && _loc23_.length > 0)
         {
            _loc10_ = _loc1_.rand(_loc23_.length);
            _loc6_ = _loc23_[_loc10_];
            _loc6_.§1t2127s0§(§1t78s0§.§1t11509s0§);
            _loc23_.splice(_loc10_,1);
            this.§1t1263s0§.push(_loc6_.§1t2129s0§());
            _loc7_++;
            _loc25_--;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc25_ && _loc22_.length > 0)
         {
            _loc10_ = _loc1_.rand(_loc22_.length);
            _loc6_ = _loc22_[_loc10_];
            _loc6_.§1t2127s0§(§1t78s0§.§1t11509s0§);
            _loc22_.splice(_loc10_,1);
            this.§1t1263s0§.push(_loc6_.§1t2129s0§());
            _loc7_++;
            _loc7_++;
         }
         var _loc26_:int = _loc1_.rand(3);
         _loc7_ = 0;
         while(_loc7_ < _loc26_ && _loc20_.length > 0)
         {
            _loc10_ = _loc1_.rand(_loc20_.length);
            _loc6_ = _loc20_[_loc10_];
            _loc6_.§1t2127s0§(§1t78s0§.§1t463s0§);
            _loc20_.splice(_loc10_,1);
            this.§1t1266s0§.push(_loc6_.§1t2129s0§());
            _loc7_++;
         }
         var _loc27_:int = _loc1_.rand(3) + 2;
         if(_loc21_.length > 0)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc27_ && _loc21_.length > 0)
            {
               _loc10_ = _loc1_.rand(_loc21_.length);
               _loc6_ = _loc21_[_loc10_];
               _loc6_.§1t2127s0§(§1t78s0§.§1t463s0§);
               _loc21_.splice(_loc10_,1);
               this.§1t1267s0§.push(_loc6_.§1t2129s0§());
               _loc7_++;
            }
         }
         else
         {
            _loc7_ = 0;
            while(_loc7_ < _loc27_ && _loc19_.length > 0)
            {
               _loc10_ = _loc1_.rand(_loc19_.length);
               _loc6_ = _loc19_[_loc10_];
               _loc6_.§1t2127s0§(§1t78s0§.§1t463s0§);
               _loc19_.splice(_loc10_,1);
               this.§1t1267s0§.push(_loc6_.§1t2129s0§());
               _loc7_++;
            }
         }
         var _loc28_:Array = new Array(6);
         _loc7_ = 0;
         while(_loc7_ < 6)
         {
            _loc28_[_loc7_] = new Array(6);
            _loc29_ = 0;
            while(_loc29_ < 6)
            {
               _loc28_[_loc7_][_loc29_] = _loc2_[_loc7_][_loc29_].§1t1156s0§();
               _loc29_++;
            }
            _loc7_++;
         }
         return _loc28_;
      }
      
      internal function §1t1353s0§(param1:Array, param2:Array, param3:§1t58s0§) : *
      {
         var _loc4_:§1t78s0§ = null;
         var _loc8_:§1t78s0§ = null;
         var _loc9_:§1t78s0§ = null;
         var _loc10_:§1t78s0§ = null;
         var _loc11_:§1t78s0§ = null;
         var _loc12_:§1t78s0§ = null;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc5_:int = int(param1.length);
         var _loc6_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = param1[_loc7_];
            _loc8_ = this.getValidMove(_loc4_,§1t78s0§.§1t11513s0§,-1,param2,_loc6_);
            _loc9_ = this.getValidMove(_loc4_,§1t78s0§.§1t11514s0§,-1,param2,_loc6_);
            _loc10_ = this.getValidMove(_loc4_,§1t78s0§.§1t9134s0§,-1,param2,_loc6_);
            _loc11_ = this.getValidMove(_loc4_,§1t78s0§.§1t9135s0§,-1,param2,_loc6_);
            _loc13_ = new Array();
            if(_loc8_ != null)
            {
               _loc13_.push(§1t78s0§.§1t11513s0§);
            }
            if(_loc9_ != null)
            {
               _loc13_.push(§1t78s0§.§1t11514s0§);
            }
            if(_loc10_ != null)
            {
               _loc13_.push(§1t78s0§.§1t9134s0§);
            }
            if(_loc11_ != null)
            {
               _loc13_.push(§1t78s0§.§1t9135s0§);
            }
            if(_loc13_.length != 0)
            {
               _loc14_ = int(_loc13_[param3.rand(_loc13_.length)]);
               if(_loc14_ == §1t78s0§.§1t11513s0§)
               {
                  _loc12_ = _loc8_;
               }
               else if(_loc14_ == §1t78s0§.§1t11514s0§)
               {
                  _loc12_ = _loc9_;
               }
               else if(_loc14_ == §1t78s0§.§1t9134s0§)
               {
                  _loc12_ = _loc10_;
               }
               else if(_loc14_ == §1t78s0§.§1t9135s0§)
               {
                  _loc12_ = _loc11_;
               }
               _loc6_.push(_loc12_);
               this.linkNodes(_loc4_,_loc12_,_loc14_);
               return;
            }
            _loc7_++;
         }
      }
      
      internal function §1t1354s0§(param1:int, param2:int, param3:Array, param4:Array, param5:int) : *
      {
         var _loc6_:§1t78s0§ = param3[param1][param2];
         if(_loc6_.§1t2128s0§() != §1t78s0§.§1t11506s0§ && _loc6_.§1t2128s0§() != §1t78s0§.§1t11511s0§)
         {
            return;
         }
         if(_loc6_.§1t2133s0§(param5) == 1)
         {
            return;
         }
         param4.push(_loc6_);
         _loc6_.§1t2127s0§(§1t78s0§.§1t11511s0§);
         if(param5 == §1t78s0§.§1t11513s0§)
         {
            this.linkNodes(param3[param1][param2 + 1],_loc6_,param5);
         }
         else if(param5 == §1t78s0§.§1t11514s0§)
         {
            this.linkNodes(param3[param1][param2 - 1],_loc6_,param5);
         }
         else if(param5 == §1t78s0§.§1t9134s0§)
         {
            this.linkNodes(param3[param1 - 1][param2],_loc6_,param5);
         }
         else if(param5 == §1t78s0§.§1t9135s0§)
         {
            this.linkNodes(param3[param1 + 1][param2],_loc6_,param5);
         }
         if(param2 > 0)
         {
            this.§1t1354s0§(param1,param2 - 1,param3,param4,§1t78s0§.§1t11513s0§);
         }
         if(param2 < 5)
         {
            this.§1t1354s0§(param1,param2 + 1,param3,param4,§1t78s0§.§1t11514s0§);
         }
         if(param1 < 5)
         {
            this.§1t1354s0§(param1 + 1,param2,param3,param4,§1t78s0§.§1t9134s0§);
         }
         if(param1 > 0)
         {
            this.§1t1354s0§(param1 - 1,param2,param3,param4,§1t78s0§.§1t9135s0§);
         }
      }
      
      internal function getValidMove(param1:§1t78s0§, param2:int, param3:int, param4:Array, param5:Array) : §1t78s0§
      {
         var _loc6_:§1t78s0§ = null;
         if(param2 == §1t78s0§.§1t11513s0§)
         {
            if(param3 == §1t78s0§.§1t11514s0§ || param1.§1t2131s0§() == 0)
            {
               return null;
            }
            _loc6_ = param4[param1.§1t2130s0§()][param1.§1t2131s0§() - 1];
         }
         else if(param2 == §1t78s0§.§1t11514s0§)
         {
            if(param3 == §1t78s0§.§1t11513s0§ || param1.§1t2131s0§() == 5)
            {
               return null;
            }
            _loc6_ = param4[param1.§1t2130s0§()][param1.§1t2131s0§() + 1];
         }
         else if(param2 == §1t78s0§.§1t9134s0§)
         {
            if(param3 == §1t78s0§.§1t9135s0§ || param1.§1t2130s0§() == 5)
            {
               return null;
            }
            _loc6_ = param4[param1.§1t2130s0§() + 1][param1.§1t2131s0§()];
         }
         else if(param2 == §1t78s0§.§1t9135s0§)
         {
            if(param3 == §1t78s0§.§1t9134s0§ || param1.§1t2130s0§() == 0)
            {
               return null;
            }
            _loc6_ = param4[param1.§1t2130s0§() - 1][param1.§1t2131s0§()];
         }
         if(_loc6_.§1t2128s0§() == §1t78s0§.§1t11510s0§ || _loc6_.§1t2128s0§() == §1t78s0§.§1t11511s0§ || _loc6_.§1t2128s0§() == §1t78s0§.§1t11512s0§ || _loc6_.§1t2128s0§() == §1t78s0§.§1t463s0§)
         {
            return null;
         }
         if(_loc6_.§1t2128s0§() == §1t78s0§.§1t11509s0§ && !_loc6_.§1t2138s0§(param2))
         {
            return null;
         }
         if(param5.indexOf(_loc6_) != -1)
         {
            return null;
         }
         return _loc6_;
      }
      
      internal function linkNodes(param1:§1t78s0§, param2:§1t78s0§, param3:int) : *
      {
         if(param3 == §1t78s0§.§1t11513s0§)
         {
            param1.§1t1756s0§(§1t78s0§.§1t11513s0§);
            param2.§1t1756s0§(§1t78s0§.§1t11514s0§);
         }
         else if(param3 == §1t78s0§.§1t11514s0§)
         {
            param1.§1t1756s0§(§1t78s0§.§1t11514s0§);
            param2.§1t1756s0§(§1t78s0§.§1t11513s0§);
         }
         else if(param3 == §1t78s0§.§1t9135s0§)
         {
            param1.§1t1756s0§(§1t78s0§.§1t9135s0§);
            param2.§1t1756s0§(§1t78s0§.§1t9134s0§);
         }
         else if(param3 == §1t78s0§.§1t9134s0§)
         {
            param1.§1t1756s0§(§1t78s0§.§1t9134s0§);
            param2.§1t1756s0§(§1t78s0§.§1t9135s0§);
         }
      }
      
      internal function createRoute(param1:§1t78s0§, param2:§1t78s0§, param3:Array, param4:Array, param5:§1t58s0§, param6:Boolean = true) : Boolean
      {
         var _loc8_:§1t78s0§ = null;
         var _loc9_:§1t78s0§ = null;
         var _loc10_:§1t78s0§ = null;
         var _loc11_:§1t78s0§ = null;
         var _loc12_:Array = null;
         var _loc13_:§1t78s0§ = null;
         var _loc15_:int = 0;
         var _loc7_:§1t78s0§ = param1;
         var _loc14_:int = -1;
         var _loc16_:Array = new Array();
         while(_loc7_ != param2)
         {
            _loc8_ = this.getValidMove(_loc7_,§1t78s0§.§1t11513s0§,_loc14_,param3,_loc16_);
            _loc9_ = this.getValidMove(_loc7_,§1t78s0§.§1t11514s0§,_loc14_,param3,_loc16_);
            _loc10_ = this.getValidMove(_loc7_,§1t78s0§.§1t9134s0§,_loc14_,param3,_loc16_);
            _loc11_ = this.getValidMove(_loc7_,§1t78s0§.§1t9135s0§,_loc14_,param3,_loc16_);
            _loc12_ = new Array();
            if(_loc8_ != null && _loc7_.§1t2131s0§() > param2.§1t2131s0§())
            {
               _loc12_.push(§1t78s0§.§1t11513s0§);
            }
            if(_loc9_ != null && _loc7_.§1t2131s0§() < param2.§1t2131s0§())
            {
               _loc12_.push(§1t78s0§.§1t11514s0§);
            }
            if(_loc10_ != null && _loc7_.§1t2130s0§() < param2.§1t2130s0§())
            {
               _loc12_.push(§1t78s0§.§1t9134s0§);
            }
            if(_loc11_ != null && _loc7_.§1t2130s0§() > param2.§1t2130s0§())
            {
               _loc12_.push(§1t78s0§.§1t9135s0§);
            }
            if(_loc12_.length == 0)
            {
               if(!param6)
               {
                  return false;
               }
               if(_loc8_ != null)
               {
                  _loc12_.push(§1t78s0§.§1t11513s0§);
               }
               if(_loc9_ != null)
               {
                  _loc12_.push(§1t78s0§.§1t11514s0§);
               }
               if(_loc10_ != null)
               {
                  _loc12_.push(§1t78s0§.§1t9134s0§);
               }
               if(_loc11_ != null)
               {
                  _loc12_.push(§1t78s0§.§1t9135s0§);
               }
               if(_loc12_.length == 0)
               {
                  return false;
               }
            }
            _loc13_ = _loc7_;
            _loc14_ = int(_loc12_[param5.rand(_loc12_.length)]);
            if(_loc14_ == §1t78s0§.§1t11513s0§)
            {
               _loc7_ = _loc8_;
            }
            else if(_loc14_ == §1t78s0§.§1t11514s0§)
            {
               _loc7_ = _loc9_;
            }
            else if(_loc14_ == §1t78s0§.§1t9135s0§)
            {
               _loc7_ = _loc11_;
            }
            else if(_loc14_ == §1t78s0§.§1t9134s0§)
            {
               _loc7_ = _loc10_;
            }
            this.linkNodes(_loc13_,_loc7_,_loc14_);
            _loc16_.push(_loc7_);
            if(_loc7_.§1t2128s0§() == §1t78s0§.§1t11506s0§)
            {
               _loc7_.§1t2127s0§(§1t78s0§.§1t11508s0§);
               _loc15_ = param4.indexOf(_loc7_);
               param4.splice(_loc15_,1);
            }
            else if(_loc7_.§1t2128s0§() != §1t78s0§.§1t11507s0§)
            {
               if(_loc7_.§1t2128s0§() != §1t78s0§.§1t11509s0§)
               {
                  if(!(!param6 && _loc7_.§1t2128s0§() == §1t78s0§.§1t11508s0§))
                  {
                     return true;
                  }
               }
            }
         }
         return true;
      }
      
      public function toString() : String
      {
         var _loc3_:int = 0;
         var _loc1_:String = this.§1t1261s0§ + " ";
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            _loc3_ = 0;
            while(_loc3_ < 6)
            {
               _loc1_ += this.§1t1282s0§[_loc2_][_loc3_] + ",";
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

