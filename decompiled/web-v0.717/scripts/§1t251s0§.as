package
{
   import flash.events.NetStatusEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import playerio.§1t82s0§;
   import playerio.§1t84s0§;
   import playerio.PlayerIOError;
   import playerio.RoomInfo;
   
   public class §1t251s0§ extends §1t2027s0§
   {
      
      public static var instance:§1t251s0§;
      
      public static var §1t12078s0§:int = 0;
      
      public static var §1t12079s0§:int = 1;
      
      public static var §1t12080s0§:int = 2;
      
      public static var §1t12081s0§:int = 3;
      
      public static var §1t12082s0§:int = 4;
      
      public static var §1t12083s0§:int = 5;
      
      public static var §1t11503s0§:int = 0;
      
      public static var §1t11504s0§:int = 1;
      
      public static var §1t12084s0§:int = 2;
      
      public static var §1t12085s0§:int = 3;
      
      public static var §1t12086s0§:int = 4;
      
      public static var §1t12087s0§:int = 5;
      
      public static var §1t12088s0§:int = 6;
      
      public static var §1t12089s0§:int = 7;
      
      public static var §1t12090s0§:int = 8;
      
      public static var §1t12091s0§:int = 9;
      
      public static var §1t12092s0§:int = 10;
      
      public static var §1t12093s0§:int = 11;
      
      public static var §1t12094s0§:int = 12;
      
      public static var §1t12095s0§:int = 13;
      
      public static var §1t12096s0§:int = 14;
      
      public static var §1t12097s0§:int = 15;
      
      public static var §1t12098s0§:int = 16;
      
      public static var §1t12099s0§:int = 17;
      
      public static var §1t12100s0§:int = 18;
      
      public static var §1t12101s0§:int = 19;
      
      public static var §1t12102s0§:int = 20;
      
      public static var §1t12103s0§:int = 21;
      
      public static var §1t12104s0§:int = 22;
      
      public static var §1t12105s0§:int = 23;
      
      public static var §1t12106s0§:int = 24;
      
      public static var §1t12107s0§:int = 25;
      
      public static var §1t12108s0§:int = 26;
      
      public static var §1t12109s0§:int = 100;
      
      public static var §1t12110s0§:int = 101;
      
      public static var §1t12111s0§:int = 102;
      
      public static var §1t12112s0§:int = 103;
      
      public static var §1t12113s0§:int = 104;
      
      public static var §1t12114s0§:int = 105;
      
      public static var §1t12115s0§:int = 106;
      
      public static var §1t12116s0§:* = 107;
      
      public static var §1t12117s0§:int = 108;
      
      public static var §1t12118s0§:int = 109;
      
      public static var §1t12119s0§:int = 110;
      
      public static var §1t12120s0§:int = 111;
      
      public static var §1t12121s0§:int = 112;
      
      public static var §1t12122s0§:int = 113;
      
      public static var §1t12123s0§:int = 114;
      
      public static var §1t12124s0§:int = 115;
      
      public static var §1t12125s0§:int = 116;
      
      public static var §1t12126s0§:int = 117;
      
      public static var §1t12127s0§:int = 118;
      
      public static var §1t12128s0§:int = 119;
      
      public static var §1t12129s0§:int = 120;
      
      public static var §1t12130s0§:int = 121;
      
      public static var §1t12131s0§:int = 122;
      
      public static var §1t12132s0§:int = 123;
      
      public static var §1t12133s0§:int = 124;
      
      public static var §1t12134s0§:int = 125;
      
      public static var §1t12135s0§:int = 126;
      
      public static var §1t12136s0§:int = 0;
      
      public static var §1t12137s0§:int = 1;
      
      public static var §1t12138s0§:int = 2;
      
      public static var §1t12139s0§:int = 3;
      
      public static var §1t12140s0§:int = 4;
      
      public static var §1t12141s0§:int = 5;
      
      public static var §1t12142s0§:int = 6;
      
      internal var §1t3465s0§:int = 0;
      
      internal var §1t3466s0§:§1t81s0§ = null;
      
      internal var §1t3469s0§:§1t142s0§;
      
      internal var §1t3478s0§:Object = new Object();
      
      internal var §1t3480s0§:Object = new Object();
      
      internal var §1t3482s0§:Object = new Object();
      
      internal var §1t3484s0§:Object = new Object();
      
      internal var §1t3486s0§:Object = new Object();
      
      internal var §1t3488s0§:Object = new Object();
      
      internal var §1t3490s0§:Object = new Object();
      
      internal var §1t3491s0§:Object = new Object();
      
      internal var §1t3493s0§:Object = new Object();
      
      internal var §1t3494s0§:Object = new Object();
      
      internal var §1t3496s0§:Object = new Object();
      
      internal var §1t3499s0§:Boolean = false;
      
      internal var §1t3500s0§:Array;
      
      internal var §1t3501s0§:Array;
      
      internal var §1t3502s0§:Array;
      
      internal var §1t3503s0§:int;
      
      internal var §1t3504s0§:int;
      
      internal var §1t3505s0§:Object;
      
      internal var §1t3513s0§:int = 0;
      
      internal var §1t3514s0§:§1t1701s0§;
      
      internal var §1t3515s0§:Boolean = false;
      
      internal var §1t3517s0§:int;
      
      internal var §1t3518s0§:int;
      
      internal var §1t3546s0§:Function;
      
      internal var §1t3562s0§:String = "";
      
      internal var §1t3565s0§:Boolean = false;
      
      internal var §1t3582s0§:§1t82s0§;
      
      internal var §1t3583s0§:String;
      
      internal var §1t3584s0§:Array = new Array();
      
      internal var §1t3585s0§:int = 10;
      
      internal var timer:Timer;
      
      internal var §1t3596s0§:§1t82s0§;
      
      internal var §1t3597s0§:§1t81s0§;
      
      internal var §1t3598s0§:Vector.<Point> = new Vector.<Point>();
      
      internal var §1t3599s0§:String = "";
      
      internal var §1t3600s0§:String = "";
      
      internal var §1t3601s0§:int = 0;
      
      internal var §1t3602s0§:int = 0;
      
      internal var §1t3603s0§:int = 0;
      
      internal var §1t3611s0§:Boolean = false;
      
      internal var §1t3613s0§:§1t82s0§;
      
      internal var §1t3614s0§:String = "";
      
      internal var §1t3615s0§:Boolean = false;
      
      internal var §1t3622s0§:§1t17s0§ = new §1t17s0§();
      
      internal var §1t3626s0§:§1t82s0§;
      
      public function §1t251s0§()
      {
         super();
         instance = this;
         this.§1t3469s0§ = new §1t142s0§();
         this.init();
      }
      
      public static function §1t9190s0§() : §1t251s0§
      {
         if(instance == null)
         {
            instance = new §1t251s0§();
         }
         return instance;
      }
      
      override public function init() : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            connected = false;
            return;
         }
         nid = "";
         if(!§1t1523s0§.§1t9499s0§)
         {
            connected = true;
            return;
         }
         if(§1t1523s0§.§1t9500s0§)
         {
            §1t2035s0§ = "rtmfp://218.99.12.19/shs3/";
         }
         else
         {
            §1t2035s0§ = "rtmfp://p2p.rtmfp.net";
         }
         super.init();
      }
      
      override internal function §1t2040s0§(param1:NetStatusEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         §1t2039s0§("netConnectionHandler: " + param1.info.code);
         switch(param1.info.code)
         {
            case "NetConnection.Connect.Success":
               §1t2039s0§("nearID is " + §1t2030s0§.nearID);
               nid = §1t2030s0§.nearID;
               §1t2041s0§();
               connected = true;
               if(§1t1540s0§.§1t10012s0§() && !§1t3318s0§.instance.§1t3326s0§)
               {
                  §1t7017s0§.instance.login.§1t5343s0§(0);
               }
               break;
            case "NetConnection.Connect.Failed":
            case "NetConnection.Connect.Rejected":
            case "NetConnection.Connect.InvalidApp":
            case "NetConnection.Connect.IdleTimeout":
            case "NetConnection.Connect.Closed":
            case "NetConnection.Connect.AppShutdown":
               §1t2039s0§("Unable to connect to " + §1t2035s0§);
               connected = false;
               if(§1t1540s0§.§1t10012s0§() && !§1t3318s0§.instance.§1t3326s0§)
               {
                  §1t7017s0§.instance.login.§1t5343s0§(0);
               }
               break;
            case "NetStream.Connect.Success":
               §1t2039s0§("Connection from: " + param1.info.stream.farID);
               break;
            case "NetStream.Connect.Closed":
               §1t2039s0§("Connection closed from: " + param1.info.stream.farID);
               _loc2_ = -1;
               _loc3_ = 0;
               while(_loc3_ < §1t2032s0§.length)
               {
                  if(§1t2032s0§[_loc3_].farID == param1.info.stream.farID)
                  {
                     §1t2032s0§[_loc3_].close();
                     _loc2_ = _loc3_;
                  }
                  _loc3_++;
               }
               if(_loc2_ != -1)
               {
                  §1t2032s0§.splice(_loc2_,1);
               }
               break;
            case "NetGroup.Connect.Success":
               §1t2039s0§("connected to netgroup");
               if(param1.info.group == §1t2070s0§)
               {
                  §1t406s0§.instance.§1t5239s0§("Connected to channel: Global","#FFCC00");
               }
               break;
            case "NetGroup.Connect.Rejected":
               §1t2039s0§("rejected by netgroup");
               §1t2069s0§();
               §1t2062s0§();
               §1t1523s0§.§1t9511s0§ = false;
               this.§1t3616s0§();
         }
      }
      
      public function §1t3467s0§(param1:int) : *
      {
         this.§1t3465s0§ = param1;
      }
      
      override internal function §1t2050s0§(param1:String) : Boolean
      {
         return true;
      }
      
      override internal function §1t2051s0§(param1:String) : *
      {
         sendTo(param1,§1t12084s0§,null);
      }
      
      override internal function §1t2052s0§(param1:String) : *
      {
      }
      
      override internal function §1t2053s0§(param1:String) : *
      {
         var _loc2_:§1t68s0§ = null;
         if(this.§1t3465s0§ == §1t12079s0§)
         {
            this.§1t3465s0§ = §1t12078s0§;
            §1t406s0§.instance.§1t6538s0§("3");
         }
         else if(this.§1t3465s0§ == §1t12082s0§ && !§1t1525s0§.§1t9952s0§())
         {
            _loc2_ = §1t1543s0§.§1t3306s0§(param1);
            if(_loc2_ != null)
            {
               _loc2_.§1t3298s0§();
            }
            §1t1543s0§.§1t10236s0§();
         }
      }
      
      public function §1t3468s0§(param1:String) : *
      {
         if(this.§1t3465s0§ == §1t12079s0§)
         {
            this.§1t3465s0§ = §1t12078s0§;
            §1t406s0§.instance.§1t6541s0§();
         }
         else if(this.§1t3465s0§ == §1t12082s0§)
         {
            §1t6477s0§.instance.§1t7709s0§();
         }
      }
      
      override internal function processMsg(param1:String, param2:int, param3:Object) : *
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         switch(param2)
         {
            case §1t11503s0§:
               §1t2039s0§(param3);
               break;
            case §1t12084s0§:
               if(this.§1t3465s0§ == §1t12079s0§)
               {
                  _loc5_ = new Object();
                  _loc5_.charname = §1t1523s0§.charname;
                  _loc5_.charlvl = §1t1523s0§.getLevel();
                  _loc5_.stats = §1t1523s0§.§1t9730s0§();
                  _loc5_.equip = §1t1523s0§.§1t9732s0§(false);
                  _loc5_.skills = §1t1523s0§.§1t9733s0§(false);
                  _loc5_.taunt = §1t1523s0§.§1t5608s0§();
                  _loc5_.stance = §1t1523s0§.stance;
                  _loc5_.bg = §1t5565s0§.instance.§1t5613s0§();
                  sendTo(param1,§1t12085s0§,_loc5_);
                  §1t5565s0§.instance.§1t5612s0§(param1);
               }
               break;
            case §1t12085s0§:
               if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
               {
                  sendTo(param1,§1t12087s0§,"2");
               }
               else if(this.§1t3470s0§())
               {
                  this.§1t3465s0§ == §1t12080s0§;
                  §1t406s0§.instance.§1t6537s0§(param3,param1,param1);
               }
               else
               {
                  sendTo(param1,§1t12087s0§,"3");
               }
               break;
            case §1t12086s0§:
               this.§1t3465s0§ = §1t12078s0§;
               §1t406s0§.instance.§1t6539s0§();
               disconnect(param1);
               break;
            case §1t12087s0§:
               if(!§1t5565s0§.instance.§1t5614s0§())
               {
                  return;
               }
               if(param3 == "1")
               {
                  this.§1t3465s0§ = §1t12082s0§;
                  this.§1t3507s0§();
                  §1t5565s0§.instance.§1t5600s0§(param1,true);
               }
               else
               {
                  §1t5565s0§.instance.§1t5617s0§();
                  §1t406s0§.instance.§1t6538s0§(String(param3));
                  disconnect(param1);
               }
               break;
            case §1t12096s0§:
               _loc4_ = (int(new Date().valueOf() % 1000000) - param3.time) / 2;
               §1t113s0§.instance.§1t5247s0§(_loc4_);
               if(param3.twoWay)
               {
                  _loc5_ = new Object();
                  _loc5_.latency = _loc4_;
                  this.send(§1t12097s0§,_loc5_);
               }
               break;
            case §1t12097s0§:
               §1t113s0§.instance.§1t5247s0§(param3.latency);
               break;
            default:
               this.§1t3469s0§.processMsg(param2,param3,param1);
         }
      }
      
      public function §1t3470s0§() : Boolean
      {
         if(§1t6477s0§.instance.visible)
         {
            return false;
         }
         if(§1t406s0§.instance.§1t6475s0§.visible || §1t406s0§.instance.§1t6484s0§.visible || §1t406s0§.instance.§1t6499s0§.visible)
         {
            return true;
         }
         return §1t1540s0§.§1t9550s0§() && (this.§1t3465s0§ == §1t12078s0§ || this.§1t3465s0§ == §1t12083s0§) && !§1t406s0§.instance.§1t6496s0§.§1t6853s0§() && !§1t126s0§.instance.§1t1700s0§() && !§1t1541s0§.§1t10100s0§() && §1t1525s0§.§1t9923s0§() != §1t134s0§.§1t9231s0§;
      }
      
      public function §1t3471s0§() : Boolean
      {
         if(§1t1523s0§.§1t1981s0§ && !§1t1523s0§.§1t9519s0§)
         {
            return false;
         }
         if(§1t1523s0§.§1t9595s0§() >= §1t1523s0§.§1t9603s0§())
         {
            return false;
         }
         if(§1t3317s0§.instance.§1t1536s0§())
         {
            return false;
         }
         if(§1t6477s0§.instance.visible)
         {
            return false;
         }
         if(§1t406s0§.instance.§1t6499s0§.visible)
         {
            return true;
         }
         return §1t1540s0§.§1t9550s0§() && (this.§1t3465s0§ == §1t12078s0§ || this.§1t3465s0§ == §1t12083s0§) && !§1t406s0§.instance.§1t6496s0§.§1t6853s0§() && !§1t126s0§.instance.§1t1700s0§() && !§1t1541s0§.§1t10100s0§() && §1t1525s0§.§1t9923s0§() != §1t134s0§.§1t9231s0§;
      }
      
      public function §1t3472s0§(param1:Boolean, param2:String) : *
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:§1t82s0§ = §1t81s0§.§1t9259s0§();
         if(param1)
         {
            if(_loc3_ != null && _loc3_.connected)
            {
               _loc3_.send("private",§1t12087s0§,param2,"1",§1t1523s0§.§1t9730s0§(),§1t1523s0§.§1t9732s0§(),§1t1523s0§.stance,nid);
            }
            else
            {
               sendTo(param2,§1t12087s0§,"1");
            }
            this.§1t3465s0§ = §1t12082s0§;
         }
         else
         {
            if(_loc3_ != null && _loc3_.connected)
            {
               _loc3_.send("private",§1t12087s0§,param2,"0");
            }
            else
            {
               sendTo(param2,§1t12087s0§,"0");
            }
            this.§1t3465s0§ = §1t12078s0§;
         }
      }
      
      public function §1t3473s0§(param1:Boolean, param2:String) : *
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:§1t82s0§ = §1t81s0§.§1t9259s0§();
         if(param1)
         {
            if(_loc3_ != null && _loc3_.connected)
            {
               _loc3_.send("private",§1t12105s0§,param2,"1");
            }
            else
            {
               sendTo(param2,§1t12105s0§,"1");
            }
            this.§1t3465s0§ = §1t12082s0§;
         }
         else
         {
            if(_loc3_ != null && _loc3_.connected)
            {
               _loc3_.send("private",§1t12105s0§,param2,"0");
            }
            else
            {
               sendTo(param2,§1t12105s0§,"0");
            }
            this.§1t3465s0§ = §1t12078s0§;
         }
      }
      
      public function §1t3474s0§(param1:String) : *
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:§1t82s0§ = §1t81s0§.§1t9259s0§();
         if(_loc2_ != null && _loc2_.connected)
         {
            _loc2_.send("private",§1t12086s0§,param1);
         }
         else
         {
            sendTo(param1,§1t12086s0§,null);
         }
         this.§1t3465s0§ = §1t12078s0§;
      }
      
      public function §1t3475s0§(param1:String) : *
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:§1t82s0§ = §1t81s0§.§1t9259s0§();
         if(_loc2_ != null && _loc2_.connected)
         {
            _loc2_.send("private",§1t12104s0§,param1);
         }
         else
         {
            sendTo(param1,§1t12104s0§,null);
         }
         this.§1t3465s0§ = §1t12078s0§;
      }
      
      public function §1t1894s0§() : *
      {
         this.§1t3465s0§ = §1t12078s0§;
         disconnectAll();
         §1t81s0§.§1t9258s0§();
      }
      
      public function §1t3476s0§() : Boolean
      {
         return this.§1t3465s0§ == §1t12082s0§ || this.§1t3465s0§ == §1t12083s0§;
      }
      
      public function §1t3477s0§() : Boolean
      {
         return this.§1t3465s0§ == §1t12082s0§;
      }
      
      public function §1t3479s0§(param1:Vector.<Point>, param2:int, param3:int, param4:String = "") : *
      {
         var _loc7_:Point = null;
         var _loc5_:String = "";
         var _loc6_:int = int(param1.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc7_ = param1[_loc8_];
            _loc5_ += _loc7_.x + param2 + "," + _loc7_.y;
            if(_loc8_ < _loc6_ - 1)
            {
               _loc5_ += "|";
            }
            _loc8_++;
         }
         if(param4 == "")
         {
            param4 = nid;
         }
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12088s0§,param4,_loc5_,param3);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12088s0§,param4,_loc5_,param3);
               }
            }
            else
            {
               this.§1t3478s0§.lineArrayStr = _loc5_;
               this.§1t3478s0§.nid = param4;
               this.§1t3478s0§.posX = param3;
               this.send(§1t12088s0§,this.§1t3478s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.lineArrayStr = _loc5_;
               this.§1t3505s0§.nid = param4;
               this.§1t3505s0§.posX = param3;
               this.§1t3508s0§(§1t12088s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t3481s0§(param1:String, param2:int, param3:§1t67s0§, param4:Boolean = false, param5:String = "", param6:int = 0) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12089s0§,param5,param1,param2,param3.§1t1100s0§(),param4,param6);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12089s0§,param5,param1,param2,param3.§1t1100s0§(),param4,param6);
               }
            }
            else
            {
               this.§1t3480s0§.victim = param1;
               this.§1t3480s0§.hp = param2;
               this.§1t3480s0§.launched = param3.§1t1100s0§();
               this.§1t3480s0§.canreject = param4;
               this.§1t3480s0§.attacker = param5;
               this.§1t3480s0§.effdmg = param6;
               this.send(§1t12089s0§,this.§1t3480s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.victim = param1;
               this.§1t3505s0§.hp = param2;
               this.§1t3505s0§.launched = param3.§1t1100s0§();
               this.§1t3505s0§.canreject = param4;
               this.§1t3505s0§.attacker = param5;
               this.§1t3505s0§.effdmg = param6;
               this.§1t3508s0§(§1t12089s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t3483s0§(param1:String, param2:String, param3:String) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12099s0§,param1,param2,param3);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12099s0§,param1,param2,param3);
               }
            }
            else
            {
               this.§1t3482s0§.attacker = param1;
               this.§1t3482s0§.victim = param2;
               this.§1t3482s0§.damagestr = param3;
               this.send(§1t12099s0§,this.§1t3482s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.attacker = param1;
               this.§1t3505s0§.victim = param2;
               this.§1t3505s0§.damagestr = param3;
               this.§1t3508s0§(§1t12099s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t3485s0§(param1:String, param2:int, param3:String, param4:String) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12100s0§,param1,param2,param3,param4);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12100s0§,param1,param2,param3,param4);
               }
            }
            else
            {
               this.§1t3484s0§.victim = param1;
               this.§1t3484s0§.hp = param2;
               this.§1t3484s0§.launched = param3;
               this.§1t3484s0§.attacker = param4;
               this.send(§1t12100s0§,this.§1t3484s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.victim = param1;
               this.§1t3505s0§.hp = param2;
               this.§1t3505s0§.launched = param3;
               this.§1t3505s0§.attacker = param4;
               this.§1t3508s0§(§1t12100s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t3487s0§(param1:String, param2:String) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12101s0§,param1,param2);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12101s0§,param1,param2);
               }
            }
            else
            {
               this.§1t3486s0§.victim = param1;
               this.§1t3486s0§.§1t13194s0§ = param2;
               this.send(§1t12101s0§,this.§1t3486s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.victim = param1;
               this.§1t3505s0§.§1t13194s0§ = param2;
               this.§1t3508s0§(§1t12101s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t3489s0§(param1:int) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12090s0§,nid,param1);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12090s0§,nid,param1);
               }
            }
            else
            {
               this.§1t3488s0§.stance = param1;
               this.send(§1t12090s0§,this.§1t3488s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.stance = param1;
               this.§1t3508s0§(§1t12090s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t1557s0§(param1:String) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12091s0§,nid,param1);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12091s0§,nid,param1);
               }
            }
            else
            {
               this.§1t3490s0§.anim = param1;
               this.send(§1t12091s0§,this.§1t3490s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.anim = param1;
               this.§1t3508s0§(§1t12091s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t3492s0§(param1:String) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12094s0§,nid,param1);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12094s0§,nid,param1);
               }
            }
            else
            {
               this.§1t3491s0§.text = param1;
               this.send(§1t12094s0§,this.§1t3491s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.text = param1;
               this.§1t3508s0§(§1t12094s0§,this.§1t3505s0§,nid);
            }
         }
         §1t1523s0§.§1t9586s0§().say(param1);
      }
      
      public function §1t3269s0§(param1:int, param2:int, param3:int, param4:Boolean, param5:String = "") : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12092s0§,nid,param1,param2,param3,param4,param5);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12092s0§,nid,param1,param2,param3,param4,param5);
               }
            }
            else
            {
               this.§1t3493s0§.actionState = param1;
               this.§1t3493s0§.x = param2;
               this.§1t3493s0§.y = param3;
               this.§1t3493s0§.facingRight = param4;
               this.§1t3493s0§.anim = param5;
               this.send(§1t12092s0§,this.§1t3493s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.actionState = param1;
               this.§1t3505s0§.x = param2;
               this.§1t3505s0§.y = param3;
               this.§1t3505s0§.facingRight = param4;
               this.§1t3505s0§.anim = param5;
               this.§1t3508s0§(§1t12092s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t3495s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12093s0§,nid,param1,param2,param3,param4,param5,param6,param7);
            }
         }
         else
         {
            if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
            {
               if(this.§1t3466s0§.§1t1447s0§())
               {
                  this.§1t3466s0§.connection.send("public",§1t12093s0§,nid,param1,param2,param3,param4,param5,param6,param7);
               }
            }
            else
            {
               this.§1t3494s0§.ptype = param1;
               this.§1t3494s0§.x = param2;
               this.§1t3494s0§.y = param3;
               this.§1t3494s0§.velX = param4;
               this.§1t3494s0§.velY = param5;
               this.§1t3494s0§.damage = param6;
               this.§1t3494s0§.skilllevel = param7;
               this.send(§1t12093s0§,this.§1t3494s0§);
            }
            if(this.§1t3499s0§)
            {
               this.§1t3505s0§.ptype = param1;
               this.§1t3505s0§.x = param2;
               this.§1t3505s0§.y = param3;
               this.§1t3505s0§.velX = param4;
               this.§1t3505s0§.velY = param5;
               this.§1t3505s0§.damage = param6;
               this.§1t3505s0§.skilllevel = param7;
               this.§1t3508s0§(§1t12093s0§,this.§1t3505s0§,nid);
            }
         }
      }
      
      public function §1t3497s0§(param1:Boolean) : *
      {
         var _loc2_:int = int(new Date().valueOf() % 1000000);
         if(this.§1t3466s0§ != null && !this.§1t3466s0§.§1t1425s0§)
         {
            if(this.§1t3466s0§.§1t1447s0§())
            {
               this.§1t3466s0§.connection.send("private",§1t12095s0§,§1t81s0§.§1t9260s0§(),_loc2_,param1);
            }
         }
         else
         {
            this.§1t3496s0§.time = _loc2_;
            this.§1t3496s0§.twoWay = param1;
            this.send(§1t12095s0§,this.§1t3496s0§);
         }
      }
      
      public function §1t3498s0§(param1:String, param2:int) : *
      {
         if(this.§1t3465s0§ == §1t12083s0§ && §1t1523s0§.§1t9503s0§)
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12102s0§,param1,param2);
            }
         }
      }
      
      override public function send(param1:int, param2:Object) : void
      {
         if(this.§1t3466s0§ != null && this.§1t3466s0§.§1t1425s0§)
         {
            this.§1t3466s0§.§1t1448s0§(param1,param2);
         }
      }
      
      public function §1t3506s0§() : Boolean
      {
         return this.§1t3499s0§;
      }
      
      internal function §1t3507s0§() : *
      {
         if(!§1t1523s0§.§1t9473s0§ && !§1t5565s0§.instance.§1t5616s0§())
         {
            return;
         }
         this.§1t3499s0§ = true;
         this.§1t3500s0§ = new Array();
         this.§1t3502s0§ = new Array();
         this.§1t3505s0§ = new Object();
         this.§1t3513s0§ = 0;
         var _loc1_:Object = new Object();
         _loc1_.charname = §1t1523s0§.charname;
         _loc1_.charlvl = §1t1523s0§.getLevel();
         _loc1_.stats = §1t1523s0§.§1t9730s0§();
         _loc1_.equip = §1t1523s0§.§1t9732s0§(false);
         _loc1_.skills = §1t1523s0§.§1t9733s0§(false);
         _loc1_.taunt = §1t1523s0§.§1t5608s0§();
         _loc1_.stance = §1t1523s0§.stance;
         _loc1_.bg = §1t5565s0§.instance.getBG();
         this.§1t3502s0§[0] = nid;
         this.§1t3508s0§(§1t12084s0§,_loc1_,nid);
         _loc1_ = new Object();
         _loc1_.charname = §1t5565s0§.instance.§1t5579s0§;
         _loc1_.charlvl = §1t5565s0§.instance.§1t5580s0§;
         _loc1_.stats = §1t5565s0§.instance.§1t5582s0§;
         _loc1_.equip = §1t5565s0§.instance.§1t5581s0§;
         if(_loc1_.equip.indexOf(§1t1701s0§.§1t11255s0§) != -1)
         {
            _loc1_.equip = _loc1_.equip.split(§1t1701s0§.§1t11255s0§)[0];
         }
         _loc1_.skills = §1t5565s0§.instance.§1t5583s0§;
         if(_loc1_.skills.indexOf(§1t1701s0§.§1t11255s0§) != -1)
         {
            _loc1_.skills = _loc1_.skills.split(§1t1701s0§.§1t11255s0§)[0];
         }
         _loc1_.taunt = §1t5565s0§.instance.§1t5584s0§;
         _loc1_.stance = §1t5565s0§.instance.§1t5586s0§;
         _loc1_.bg = §1t5565s0§.instance.getBG();
         this.§1t3502s0§[1] = §1t5565s0§.instance.§1t5585s0§;
         this.§1t3508s0§(§1t12084s0§,_loc1_,§1t5565s0§.instance.§1t5585s0§);
      }
      
      internal function §1t3508s0§(param1:int, param2:Object, param3:String) : *
      {
         if(param3 == this.§1t3502s0§[0])
         {
            param3 = "0";
         }
         else if(param3 == this.§1t3502s0§[1])
         {
            param3 = "1";
         }
         else
         {
            param3 = "?";
         }
         this.§1t3500s0§.push(new §1t1701s0§(param1,param2,param3,this.§1t3513s0§,true));
      }
      
      public function §1t3509s0§(param1:int) : *
      {
         if(this.§1t3499s0§)
         {
            this.§1t3499s0§ = false;
            this.§1t3504s0§ = param1;
            if(param1 == 0)
            {
               this.§1t3500s0§[0].§1t1708s0§().win = true;
               this.§1t3500s0§[1].§1t1708s0§().win = false;
            }
            else if(param1 == 1)
            {
               this.§1t3500s0§[0].§1t1708s0§().win = false;
               this.§1t3500s0§[1].§1t1708s0§().win = true;
            }
            else
            {
               this.§1t3500s0§[0].§1t1708s0§().win = true;
               this.§1t3500s0§[1].§1t1708s0§().win = true;
            }
            if(§1t5565s0§.instance.§1t5616s0§())
            {
               this.§1t3511s0§();
            }
         }
      }
      
      internal function §1t3510s0§() : String
      {
         var _loc1_:String = this.§1t3500s0§[0].§1t1708s0§().charname;
         var _loc2_:String = this.§1t3500s0§[1].§1t1708s0§().charname;
         if(§1t1523s0§.§1t9503s0§ && §1t1523s0§.§1t9505s0§)
         {
            this.§1t3500s0§[0].§1t1708s0§().charname = "_player1charname_";
            this.§1t3500s0§[1].§1t1708s0§().charname = "_player2charname_";
         }
         var _loc3_:int = int(this.§1t3500s0§.length);
         var _loc4_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ += this.§1t3500s0§[_loc5_].toString() + §1t1701s0§.§1t11258s0§;
            _loc5_++;
         }
         _loc3_ = int(this.§1t3502s0§.length);
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _loc4_.split(this.§1t3502s0§[_loc5_]).join(_loc5_.toString());
            _loc5_++;
         }
         if(§1t1523s0§.§1t9503s0§ && §1t1523s0§.§1t9505s0§)
         {
            _loc4_ = _loc4_.split("_player1charname_").join(_loc1_);
            _loc4_ = _loc4_.split("_player2charname_").join(_loc2_);
            this.§1t3500s0§[0].§1t1708s0§().charname = _loc1_;
            this.§1t3500s0§[1].§1t1708s0§().charname = _loc2_;
         }
         return _loc4_;
      }
      
      public function §1t3511s0§() : *
      {
         var _loc1_:String = this.§1t3510s0§();
         var _loc2_:String = this.§1t3500s0§[0].§1t1708s0§().charname;
         var _loc3_:String = this.§1t3500s0§[1].§1t1708s0§().charname;
         §1t3317s0§.instance.§1t1948s0§(_loc2_,_loc3_,_loc1_,this.§1t3504s0§);
      }
      
      public function §1t3512s0§() : *
      {
         if(this.§1t3500s0§ == null || this.§1t3500s0§.length == 0)
         {
            return;
         }
         this.§1t3516s0§(this.§1t3510s0§());
      }
      
      public function §1t3516s0§(param1:String) : *
      {
         this.§1t3501s0§ = §1t1701s0§.parse(param1);
         var _loc2_:§1t1701s0§ = this.§1t3501s0§.shift();
         var _loc3_:§1t1701s0§ = this.§1t3501s0§.shift();
         if(_loc2_ == null || _loc3_ == null)
         {
            §1t3318s0§.instance.§1t1951s0§("0");
            return;
         }
         §1t5565s0§.instance.§1t5603s0§(_loc2_.msg,_loc3_.msg);
         this.§1t3513s0§ = 0;
         this.§1t3515s0§ = true;
         this.§1t3514s0§ = this.§1t3501s0§.shift();
         if(_loc2_.§1t1708s0§().win == false)
         {
            §1t5181s0§.instance.§1t6732s0§(_loc3_.§1t1708s0§().charname,_loc3_.§1t1708s0§().taunt,701);
         }
         else if(_loc3_.§1t1708s0§().win == false)
         {
            §1t5181s0§.instance.§1t6732s0§(_loc2_.§1t1708s0§().charname,_loc2_.§1t1708s0§().taunt,700);
         }
         else
         {
            §1t5181s0§.instance.§1t5221s0§();
         }
      }
      
      public function §1t3519s0§(param1:String, param2:int, param3:int) : *
      {
         this.§1t3517s0§ = param2;
         this.§1t3518s0§ = param3;
         this.§1t3501s0§ = §1t1701s0§.parse(param1);
         var _loc4_:Array = new Array();
         while(this.§1t3501s0§[0].§1t1702s0§ == §1t12084s0§)
         {
            _loc4_.push(this.§1t3501s0§.shift().msg);
         }
         §1t5565s0§.instance.§1t5604s0§(_loc4_);
         this.§1t3513s0§ = 0;
         this.§1t3515s0§ = true;
         this.§1t3514s0§ = this.§1t3501s0§.shift();
      }
      
      public function update() : *
      {
         if(this.§1t3499s0§)
         {
            ++this.§1t3513s0§;
         }
         else if(this.§1t3515s0§)
         {
            ++this.§1t3513s0§;
            if(this.§1t3514s0§ == null)
            {
               this.§1t3515s0§ = false;
            }
            while(this.§1t3514s0§ != null && this.§1t3514s0§.§1t1706s0§() <= this.§1t3513s0§)
            {
               this.processMsg(this.§1t3514s0§.§1t1709s0§(),this.§1t3514s0§.§1t1707s0§(),this.§1t3514s0§.§1t1708s0§());
               if(this.§1t3501s0§.length == 0)
               {
                  this.§1t3514s0§ = null;
                  if(§1t1540s0§.§1t10050s0§())
                  {
                     §1t1540s0§.§1t3652s0§(this.§1t3517s0§,this.§1t3518s0§);
                  }
                  else if(!§1t1525s0§.§1t9952s0§())
                  {
                     if(§1t5181s0§.instance.winner == 700)
                     {
                        §1t122s0§(§1t1543s0§.§1t3306s0§("1")).§1t4483s0§(0,"",false,"",0);
                     }
                     else
                     {
                        §1t122s0§(§1t1543s0§.§1t3306s0§("0")).§1t4483s0§(0,"",false,"",0);
                     }
                  }
               }
               else
               {
                  this.§1t3514s0§ = this.§1t3501s0§.shift();
               }
            }
         }
      }
      
      override public function §1t2066s0§(param1:Object) : void
      {
         var _loc2_:§1t68s0§ = null;
         switch(param1.§1t1702s0§)
         {
            case §1t11503s0§:
               §1t2039s0§(param1);
         }
      }
      
      override public function §1t2079s0§(param1:Object) : void
      {
         var _loc2_:String = null;
         switch(param1.§1t1702s0§)
         {
            case §1t11503s0§:
               §1t2039s0§(param1);
               break;
            case §1t12111s0§:
               if(param1.charname == §1t1523s0§.charname)
               {
                  return;
               }
               if(§1t1543s0§.§1t10251s0§(param1.charname))
               {
                  return;
               }
               if(param1.side == 0)
               {
                  _loc2_ = "#FFFFFF";
               }
               else if(param1.side == -1)
               {
                  _loc2_ = "#CCCCCC";
               }
               else if(param1.side == 1)
               {
                  _loc2_ = "#FF0000";
               }
               else if(param1.side == 2)
               {
                  _loc2_ = "#00FF00";
               }
               else if(param1.side == 3)
               {
                  _loc2_ = "#00FFFF";
               }
               else if(param1.side == 4)
               {
                  _loc2_ = "#FFCC00";
               }
               else if(§1t1523s0§.§1t9663s0§(param1.side))
               {
                  _loc2_ = "#FF9900";
               }
               if(param1.side == 0 || param1.side == §1t1523s0§.§1t7746s0§())
               {
                  §1t406s0§.instance.§1t5238s0§(param1.charname,param1.text,_loc2_);
                  if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                  {
                     §1t113s0§.instance.§1t5238s0§(param1.charname,param1.text,_loc2_);
                  }
                  else if(§1t406s0§.instance.§1t6509s0§.visible)
                  {
                     §1t412s0§.instance.§1t5238s0§(param1.charname,param1.text,_loc2_);
                  }
               }
               break;
            case §1t12118s0§:
               §1t406s0§.instance.§1t6599s0§(param1.charname);
         }
      }
      
      override internal function §1t2067s0§(param1:String) : *
      {
         var _loc2_:Object = null;
         var _loc3_:Vector.<§1t68s0§> = null;
         var _loc4_:String = null;
         var _loc5_:§1t122s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:* = undefined;
         if(§1t2059s0§)
         {
            this.§1t3465s0§ = §1t12083s0§;
            _loc2_ = new Object();
            _loc2_.id = §1t1523s0§.id;
            _loc2_.charname = §1t1523s0§.charname;
            _loc2_.charlvl = §1t1523s0§.getLevel();
            _loc2_.equip = §1t1523s0§.§1t9732s0§();
            _loc2_.x = §1t1523s0§.§1t9586s0§().§1t1555s0§();
            if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
            {
               _loc2_.stats = §1t1523s0§.§1t9730s0§();
               _loc2_.skills = §1t1523s0§.§1t9733s0§();
               _loc2_.taunt = §1t1523s0§.§1t5608s0§();
               _loc2_.stance = §1t1523s0§.stance;
            }
            else
            {
               _loc2_.stats = "";
               _loc2_.skills = "";
               _loc2_.taunt = "";
               _loc2_.stance = 0;
            }
            §1t2064s0§(§1t12109s0§,_loc2_);
            §1t2059s0§ = false;
         }
         else
         {
            _loc3_ = §1t1543s0§.§1t10227s0§();
            _loc4_ = "";
            _loc6_ = int(_loc3_.length);
            _loc7_ = new Array();
            if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
            {
               _loc7_.push(§1t1523s0§.id + "$" + §1t1523s0§.charname + "$" + §1t1523s0§.getLevel() + "$" + §1t1523s0§.§1t9732s0§() + "$" + nid + "$" + §1t1523s0§.§1t9586s0§().§1t1555s0§() + "$" + §1t1523s0§.§1t9730s0§() + "$" + §1t1523s0§.§1t9733s0§() + "$" + §1t1523s0§.§1t5608s0§() + "$" + §1t1523s0§.stance);
            }
            else
            {
               _loc7_.push(§1t1523s0§.id + "$" + §1t1523s0§.charname + "$" + §1t1523s0§.getLevel() + "$" + §1t1523s0§.§1t9732s0§() + "$" + nid + "$" + §1t1523s0§.§1t9586s0§().§1t1555s0§());
            }
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc5_ = _loc3_[_loc8_] as §1t122s0§;
               _loc4_ = _loc5_.nid + "$" + _loc5_.charname + "$" + _loc5_.level + "$" + _loc5_.equipmentStr + "$" + _loc5_.§1t1555s0§() + "$" + _loc5_.statStr + "$" + _loc5_.skillStr + "$" + _loc5_.tauntStr + "$" + _loc5_.stance;
               _loc7_.push(_loc4_);
               _loc8_++;
            }
            _loc2_ = new Object();
            _loc2_.playerList = _loc7_;
            §1t2065s0§(param1,§1t12112s0§,_loc2_);
         }
      }
      
      override internal function §1t2068s0§(param1:String) : *
      {
         var _loc2_:Object = new Object();
         _loc2_.peerID = param1;
         §1t2064s0§(§1t12110s0§,_loc2_);
         §1t1543s0§.§1t10224s0§(param1);
      }
      
      public function §1t3520s0§(param1:int, param2:int, param3:int, param4:int, param5:String = "") : *
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         if(!connected || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t3567s0§();
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc7_ = "net.explosivebarrel.duels.room_";
         }
         else
         {
            _loc7_ = "";
         }
         if(param5 != "")
         {
            _loc6_ = _loc7_ + param5;
         }
         else if(param3 == §1t134s0§.§1t9227s0§ || param3 == §1t134s0§.§1t9229s0§ || param3 == §1t134s0§.§1t9231s0§ || param3 == §1t134s0§.§1t9232s0§ || param3 == §1t134s0§.§1t9234s0§ || param3 == §1t134s0§.§1t9236s0§)
         {
            _loc6_ = _loc7_ + param1 + "_" + param2;
         }
         else
         {
            if(param3 == 1)
            {
               §1t251s0§.§1t9190s0§().§1t3521s0§();
               return;
            }
            if(param3 == §1t134s0§.§1t9230s0§ || param3 == §1t134s0§.§1t9233s0§ || param3 == §1t134s0§.§1t9235s0§ || param3 == §1t134s0§.§1t9237s0§)
            {
               _loc6_ = _loc7_ + "dojo" + "_" + param2;
            }
            else if(param3 == 4)
            {
               _loc6_ = _loc7_ + "red" + "_" + param2;
            }
            else if(param3 == 5)
            {
               _loc6_ = _loc7_ + "green" + "_" + param2;
            }
            else if(param3 == 6)
            {
               _loc6_ = _loc7_ + "blue" + "_" + param2;
            }
            else if(param3 == 7)
            {
               _loc6_ = _loc7_ + "yellow" + "_" + param2;
            }
         }
         if(§1t2058s0§ != _loc6_)
         {
            if(§1t2058s0§ != "")
            {
               if(!§1t1523s0§.§1t9503s0§)
               {
                  §1t2062s0§();
               }
               else
               {
                  this.§1t3607s0§();
               }
            }
            if(!§1t1523s0§.§1t9503s0§)
            {
               §1t2061s0§(_loc6_);
            }
            else
            {
               this.§1t3604s0§(_loc6_,param4,param3);
            }
         }
      }
      
      public function §1t3521s0§() : *
      {
         if(!§1t1523s0§.§1t9503s0§)
         {
            §1t2062s0§();
         }
         else
         {
            this.§1t3607s0§();
         }
         this.§1t3567s0§();
      }
      
      public function §1t3522s0§() : Boolean
      {
         return this.§1t3596s0§ != null && this.§1t3596s0§.connected;
      }
      
      public function §1t3523s0§(param1:String, param2:int, param3:String = "") : *
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         if(param2 == 0)
         {
            _loc4_ = 0;
         }
         else if(param2 == 1)
         {
            _loc4_ = -1;
         }
         else if(param2 == 2)
         {
            _loc4_ = §1t1523s0§.§1t7746s0§();
         }
         if(§1t1523s0§.§1t9766s0§)
         {
            if(_loc4_ == -1)
            {
               _loc5_ = §1t1523s0§.§1t9768s0§;
               param3 = param1;
               param1 = "";
            }
            else if(_loc4_ == 0)
            {
               _loc5_ = "";
               param1 = "[EVENT] " + §1t1523s0§.§1t9768s0§ + ":   " + param1;
            }
         }
         else if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
         {
            _loc5_ = "";
            if(param3 == "")
            {
               param3 = param1;
            }
            param1 = "[Kanji] " + §1t1523s0§.§1t9765s0§() + ":   " + param1;
         }
         else
         {
            _loc5_ = §1t1523s0§.charname;
         }
         if(param2 == 3)
         {
            if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
            {
               this.§1t3613s0§.send("tchat",_loc5_,param1);
            }
            return;
         }
         if(_loc4_ != -1)
         {
            if(§1t1523s0§.§1t9511s0§ && this.§1t3615s0§)
            {
               _loc6_ = new Object();
               _loc6_.charname = _loc5_;
               _loc6_.text = param1;
               _loc6_.side = _loc4_;
               _loc6_.say = param3;
               _loc6_.channel = this.§1t3614s0§;
               §1t2077s0§(§1t12111s0§,_loc6_);
            }
            else if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
            {
               this.§1t3613s0§.send("public",§1t12111s0§,nid,_loc5_,param1,_loc4_,§1t2058s0§);
            }
         }
         if(§1t1523s0§.§1t9766s0§ && _loc4_ == 0)
         {
            return;
         }
         if(this.§1t3522s0§())
         {
            if(_loc4_ == -1)
            {
               this.§1t3596s0§.send("public",§1t12111s0§,nid,_loc5_,param1,_loc4_,param3,"");
            }
            else
            {
               this.§1t3596s0§.send("public",§1t12111s0§,nid,_loc5_,param1,_loc4_,param3,this.§1t3614s0§);
            }
         }
         if(param3 == "")
         {
            §1t1523s0§.§1t9586s0§().say(param1);
         }
         else
         {
            §1t1523s0§.§1t9586s0§().say(param3);
         }
      }
      
      public function §1t3524s0§(param1:String, param2:int, param3:Array) : *
      {
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc4_:String = param3.join("|");
         if(!(param2 == 806 && §1t1523s0§.§1t9766s0§) && (§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§) || §1t1523s0§.§1t9483s0§))
         {
            return;
         }
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc5_ = new Object();
            _loc5_.prefix = param1;
            _loc5_.code = param2;
            _loc5_.params = _loc4_;
            §1t2077s0§(§1t12130s0§,_loc5_);
         }
         else if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            this.§1t3613s0§.send("public",§1t12130s0§,param1,param2,_loc4_);
         }
         if(param2 != 805)
         {
            _loc6_ = this.§1t3525s0§(param1,param2,_loc4_);
            §1t406s0§.instance.§1t5238s0§("",_loc6_);
            §1t3317s0§.instance.§1t1933s0§(_loc6_);
         }
      }
      
      internal function §1t3525s0§(param1:String, param2:int, param3:*) : String
      {
         var _loc4_:Array = param3.split("|");
         return param1 + §1t1521s0§.getString(param2,_loc4_);
      }
      
      public function §1t3526s0§(param1:String) : *
      {
         var _loc3_:§1t81s0§ = null;
         var _loc2_:Object = new Object();
         _loc2_.charname = param1;
         if(!§1t1523s0§.§1t9503s0§)
         {
            §1t2077s0§(§1t12117s0§,_loc2_);
         }
         else
         {
            _loc3_ = §1t251s0§.§1t9190s0§().§1t3572s0§(param1,§1t81s0§.§1t9245s0§);
            _loc3_.§1t1428s0§();
         }
      }
      
      public function §1t3527s0§(param1:String) : *
      {
         var _loc2_:Object = null;
         var _loc3_:§1t81s0§ = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc2_ = new Object();
            _loc2_.charname = param1;
            §1t2077s0§(§1t12129s0§,_loc2_);
         }
         else
         {
            _loc3_ = §1t251s0§.§1t9190s0§().§1t3572s0§(param1,§1t81s0§.§1t9250s0§);
            _loc3_.§1t1428s0§();
         }
      }
      
      public function §1t3528s0§(param1:String) : *
      {
         var _loc2_:Object = null;
         var _loc3_:§1t81s0§ = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc2_ = new Object();
            _loc2_.charname = param1;
            §1t2077s0§(§1t12131s0§,_loc2_);
         }
         else
         {
            _loc3_ = §1t251s0§.§1t9190s0§().§1t3572s0§(param1,§1t81s0§.§1t9251s0§);
            _loc3_.§1t1428s0§();
         }
      }
      
      public function §1t3529s0§(param1:String) : *
      {
         var _loc2_:§1t81s0§ = null;
         _loc2_ = §1t251s0§.§1t9190s0§().§1t3572s0§(param1,§1t81s0§.§1t9246s0§,§1t1523s0§.§1t9460s0§ + "," + 3600);
      }
      
      public function §1t3530s0§(param1:String) : *
      {
         var _loc2_:Object = null;
         if(§1t1523s0§.§1t9766s0§)
         {
            return;
         }
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc2_ = new Object();
            _loc2_.equip = param1;
            §1t2064s0§(§1t12113s0§,_loc2_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12113s0§,nid,param1);
         }
      }
      
      public function §1t3531s0§(param1:int) : *
      {
         var _loc2_:Object = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc2_ = new Object();
            _loc2_.charlvl = param1;
            §1t2064s0§(§1t12114s0§,_loc2_);
         }
         else
         {
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("public",§1t12114s0§,nid,param1);
            }
            if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
            {
               this.§1t3613s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8821s0§),param1);
            }
         }
      }
      
      public function §1t3532s0§(param1:Boolean) : *
      {
         var _loc2_:Object = null;
         if(§1t2059s0§ && !§1t1523s0§.§1t9503s0§)
         {
            return;
         }
         if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§) || §1t1523s0§.§1t9766s0§)
         {
            return;
         }
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc2_ = new Object();
            _loc2_.busy = param1;
            §1t2064s0§(§1t12115s0§,_loc2_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12115s0§,nid,param1);
         }
         §1t1523s0§.§1t9586s0§().§1t4453s0§(false);
      }
      
      public function §1t3533s0§(param1:String) : *
      {
         var _loc2_:Object = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc2_ = new Object();
            _loc2_.anim = param1;
            §1t2064s0§(§1t12116s0§,_loc2_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12116s0§,nid,param1);
         }
      }
      
      public function §1t3534s0§(param1:int, param2:String) : *
      {
         var _loc3_:Object = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc3_ = new Object();
            _loc3_.step = param1;
            _loc3_.target = param2;
            §1t2064s0§(§1t12128s0§,_loc3_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12128s0§,nid,param1,param2);
         }
      }
      
      public function §1t3535s0§(param1:String, param2:Boolean) : *
      {
         var _loc3_:Object = null;
         if(!§1t1540s0§.§1t10047s0§() && !§1t1540s0§.§1t10048s0§())
         {
            return;
         }
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc3_ = new Object();
            _loc3_.target = param1;
            _loc3_.ally = param2;
            §1t2064s0§(§1t12132s0§,_loc3_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12132s0§,param1,nid,param2);
         }
      }
      
      public function §1t3536s0§(param1:String) : *
      {
         var _loc2_:Object = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc2_ = new Object();
            _loc2_.charname = §1t1523s0§.charname;
            §1t2065s0§(param1,§1t12119s0§,_loc2_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("private",§1t12119s0§,§1t1523s0§.charname,§1t1523s0§.charname);
         }
      }
      
      public function §1t3537s0§(param1:int, param2:int, param3:int, param4:String, param5:String) : *
      {
         var _loc6_:Object = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc6_ = new Object();
            _loc6_.objid = param1;
            _loc6_.x = param2;
            _loc6_.y = param3;
            _loc6_.props = param4;
            _loc6_.objname = param5;
            §1t2064s0§(§1t12120s0§,_loc6_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12120s0§,param1,param2,param3,param4,param5);
         }
         §1t1525s0§.§1t9940s0§().§1t3537s0§(param1,param2,param3,param4,param5);
      }
      
      public function §1t3538s0§(param1:String) : *
      {
         var _loc2_:Object = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc2_ = new Object();
            _loc2_.objname = param1;
            §1t2064s0§(§1t12121s0§,_loc2_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12121s0§,param1);
         }
         §1t1525s0§.§1t9940s0§().§1t8138s0§(param1);
      }
      
      public function §1t3539s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : *
      {
         var _loc8_:Object = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc8_ = new Object();
            _loc8_.ptype = param1;
            _loc8_.x = param2;
            _loc8_.y = param3;
            _loc8_.velX = param4;
            _loc8_.velY = param5;
            _loc8_.damage = param6;
            _loc8_.skilllevel = param7;
            §1t2064s0§(§1t12122s0§,_loc8_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12122s0§,nid,param1,param2,param3,param4,param5,param6,param7);
         }
      }
      
      public function §1t3540s0§(param1:String, param2:Boolean, param3:Boolean, param4:int = 0) : *
      {
         var _loc5_:Object = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc5_ = new Object();
            _loc5_.name = param1;
            _loc5_.flag = param2;
            _loc5_.flag2 = param3;
            _loc5_.§1t15222s0§ = param4;
            §1t2064s0§(§1t12126s0§,_loc5_);
         }
         else if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("public",§1t12126s0§,param1,param2,param3,param4);
         }
      }
      
      public function §1t3541s0§(param1:int, param2:String, param3:String = "") : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8822s0§),param1,param2,param3);
         }
      }
      
      public function §1t3542s0§(param1:int, param2:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9103s0§),param1,param2);
         }
      }
      
      public function §1t3543s0§(param1:String, param2:String, param3:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9047s0§),param1,param2,param3);
         }
      }
      
      public function §1t3544s0§() : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9050s0§));
         }
      }
      
      public function §1t3545s0§() : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9052s0§));
         }
      }
      
      public function §1t3547s0§(param1:Function) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3546s0§ = param1;
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9056s0§));
         }
      }
      
      public function §1t3548s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8823s0§),param1);
         }
      }
      
      public function §1t1924s0§(param1:int, param2:int, param3:int, param4:int, param5:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8824s0§),param1,param2,param3,param4,param5);
         }
      }
      
      public function §1t1915s0§(param1:int, param2:int, param3:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8825s0§),param1,param2,param3);
         }
      }
      
      public function §1t1918s0§(param1:int, param2:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8826s0§),param1,param2);
         }
      }
      
      public function §1t1927s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8827s0§),param1,param2,param3,param4);
         }
      }
      
      public function §1t1930s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8828s0§),param1,param2,param3,param4);
         }
      }
      
      public function §1t1970s0§(param1:int, param2:int, param3:int, param4:int, param5:String, param6:Boolean) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8829s0§),param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function §1t1973s0§(param1:int, param2:int, param3:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8830s0§),param1,param2,param3);
         }
      }
      
      public function §1t3549s0§(param1:int, param2:int, param3:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9031s0§),param1,param2,param3);
         }
      }
      
      public function §1t3550s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9046s0§),param1,param2,param3,param4);
         }
      }
      
      public function §1t1955s0§(param1:int, param2:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8831s0§),param1,param2);
         }
      }
      
      public function §1t1986s0§(param1:int, param2:String, param3:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9029s0§),param1,param2,param3);
         }
      }
      
      public function §1t1933s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9030s0§),escape(param1));
         }
      }
      
      public function §1t1935s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9055s0§),param1);
         }
      }
      
      public function §1t3551s0§(param1:String, param2:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9033s0§),param1,param2);
         }
      }
      
      public function §1t1887s0§(param1:String, param2:String, param3:int, param4:Boolean) : *
      {
         var _loc5_:Object = null;
         if(param2 == "" && param3 == 0)
         {
            return;
         }
         if(param4)
         {
            if(!§1t1523s0§.§1t9503s0§)
            {
               _loc5_ = new Object();
               _loc5_.receiver = param1;
               _loc5_.items = param2;
               _loc5_.coins = param3;
               _loc5_.giver = §1t1523s0§.charname;
               §1t2064s0§(§1t12133s0§,_loc5_);
            }
            if(this.§1t3522s0§())
            {
               this.§1t3596s0§.send("private",§1t12133s0§,param1,param2,param3,§1t1523s0§.charname);
            }
         }
         else if(this.§1t3595s0§())
         {
            if(§1t1523s0§.§1t9766s0§)
            {
               this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8832s0§),param1,param2,param3,§1t1523s0§.§1t9768s0§);
            }
            else
            {
               this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8832s0§),param1,param2,param3,"",§1t1523s0§.§1t9730s0§());
            }
         }
      }
      
      public function §1t3552s0§(param1:String, param2:int, param3:int) : *
      {
         if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send("private",§1t12134s0§,param1,param2,param3);
         }
      }
      
      public function §1t1995s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8833s0§),param1);
         }
      }
      
      public function §1t3553s0§(param1:String, param2:int, param3:int, param4:int, param5:String, param6:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8834s0§),param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function §1t3554s0§(param1:§1t17s0§) : *
      {
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1.§1t483s0§());
         if(_loc2_ == null || _loc2_.unique != 0)
         {
            return;
         }
         var _loc3_:§1t17s0§ = §1t17s0§.§1t8745s0§(param1.§1t490s0§());
         _loc3_.§1t541s0§(§1t1523s0§.§1t9765s0§());
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8835s0§),_loc3_.getLevel(),_loc3_.§1t490s0§());
         }
      }
      
      public function §1t3555s0§(param1:String) : *
      {
         if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8836s0§),param1);
         }
      }
      
      public function §1t3556s0§(param1:Boolean) : *
      {
         var _loc2_:String = null;
         if(this.§1t3522s0§())
         {
            if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9235s0§)
            {
               if(param1)
               {
                  this.§1t3596s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8837s0§),"4");
               }
               else
               {
                  this.§1t3596s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8837s0§),"3");
               }
            }
            else
            {
               if(§1t1523s0§.§1t9766s0§ && !§1t1523s0§.§1t9767s0§)
               {
                  _loc2_ = §1t1523s0§.§1t9774s0§();
               }
               else
               {
                  _loc2_ = §1t1523s0§.§1t7366s0§();
               }
               this.§1t3596s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8837s0§),"5",_loc2_,§1t1523s0§.§1t9733s0§(),§1t1523s0§.§1t5608s0§(),§1t1523s0§.stance.toString());
            }
            §1t1540s0§.§1t10057s0§();
         }
      }
      
      public function §1t3557s0§(param1:Boolean) : *
      {
         var _loc2_:String = null;
         if(this.§1t3522s0§())
         {
            if(§1t1523s0§.§1t9766s0§ && !§1t1523s0§.§1t9767s0§)
            {
               _loc2_ = §1t1523s0§.§1t9774s0§();
            }
            else
            {
               _loc2_ = §1t1523s0§.§1t7366s0§();
            }
            this.§1t3596s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8837s0§),"6",_loc2_,§1t1523s0§.§1t9733s0§(),§1t1523s0§.§1t5608s0§(),§1t1523s0§.stance.toString());
            §1t1540s0§.§1t10057s0§();
            this.§1t3611s0§ = true;
         }
      }
      
      public function §1t3558s0§() : *
      {
         if(this.§1t3522s0§())
         {
            this.§1t3596s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8838s0§));
         }
      }
      
      public function §1t3559s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8839s0§),param1);
         }
      }
      
      public function §1t3560s0§(param1:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8842s0§),param1);
         }
      }
      
      public function §1t3561s0§() : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9060s0§));
            §1t3317s0§.instance.§1t1532s0§ = true;
         }
      }
      
      public function §1t1982s0§(param1:String, param2:Boolean, param3:Boolean) : *
      {
         this.§1t3562s0§ = param1;
         if(this.§1t3595s0§())
         {
            if(param2)
            {
               this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9019s0§));
            }
            else if(param3)
            {
               this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9024s0§));
            }
            else
            {
               this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8843s0§));
            }
         }
         §1t3318s0§.instance.§1t3345s0§().§1t731s0§.§1t4655s0§(§1t3317s0§.instance.§1t1836s0§ + " " + §1t1523s0§.§1t9764s0§() + " " + param1,"","",null);
      }
      
      public function §1t3563s0§() : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8844s0§));
         }
         §1t3317s0§.instance.§1t1933s0§("[" + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8844s0§) + "] " + this.§1t3562s0§);
      }
      
      public function §1t1961s0§(param1:int, param2:int, param3:int) : *
      {
         var _loc4_:int = param1 & 0x0FFF;
         var _loc5_:int = param1 >> 12 & 0x0FFF;
         if(§1t1524s0§.§1t7976s0§(_loc5_,_loc4_))
         {
         }
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8848s0§),param1,param2,param3);
         }
      }
      
      public function §1t3564s0§(param1:uint) : *
      {
         var _loc2_:int = §1t1523s0§.§1t9394s0§.§1t697s0§() / 400;
         if(_loc2_ > 5)
         {
            _loc2_ = 5;
         }
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8849s0§),param1 * 13,_loc2_);
         }
      }
      
      public function §1t3566s0§(param1:String) : *
      {
         if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            this.§1t3613s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8850s0§),param1);
            this.§1t3565s0§ = true;
         }
      }
      
      public function §1t3567s0§() : *
      {
         if(this.§1t3565s0§ && this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            this.§1t3613s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8851s0§));
            this.§1t3565s0§ = false;
         }
      }
      
      public function §1t3568s0§() : *
      {
         if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            this.§1t3613s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8852s0§));
         }
      }
      
      public function §1t3569s0§(param1:String) : *
      {
         if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            this.§1t3613s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8853s0§),param1);
         }
      }
      
      public function §1t3570s0§(param1:String) : *
      {
         if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            this.§1t3613s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8854s0§),param1);
         }
      }
      
      public function §1t3571s0§(param1:String) : *
      {
         if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            this.§1t3613s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8855s0§),param1);
         }
      }
      
      public function §1t3572s0§(param1:String, param2:int = 0, param3:String = "") : §1t81s0§
      {
         var _loc4_:§1t81s0§ = §1t81s0§.§1t9256s0§(param1,param2,param3);
         _loc4_.§1t1426s0§(this.§1t3583s0§);
         return _loc4_;
      }
      
      public function §1t3573s0§(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Boolean) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8856s0§),param1,param2,param3,param4,param5,param6,param7);
         }
      }
      
      public function §1t3574s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8857s0§),param1);
         }
      }
      
      public function §1t3575s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8858s0§),param1);
         }
      }
      
      public function §1t3576s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8859s0§),param1);
         }
      }
      
      public function §1t3577s0§(param1:String, param2:String, param3:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8860s0§),param1,param2,param3);
         }
      }
      
      public function §1t3578s0§(param1:String, param2:int, param3:int) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8861s0§),param1,param2,param3);
         }
      }
      
      public function §1t3579s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8862s0§),param1);
         }
      }
      
      public function §1t3580s0§(param1:String) : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8863s0§),param1);
         }
      }
      
      public function §1t3581s0§(param1:String = "", param2:String = "") : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8864s0§),param1,param2);
         }
      }
      
      public function §1t3586s0§() : *
      {
         if(this.§1t3595s0§())
         {
            return;
         }
         var _loc1_:* = new Object();
         _loc1_[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8998s0§)] = §1t1523s0§.charname;
         _loc1_[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8999s0§)] = §1t1523s0§.§1t9323s0§;
         _loc1_[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9000s0§)] = §1t1523s0§.§1t9324s0§;
         var _loc2_:String = "$service-room$";
         §1t3318s0§.instance.client.multiplayer.createJoinRoom(_loc2_,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8867s0§),true,{},_loc1_,this.§1t3587s0§,this.§1t3590s0§);
      }
      
      internal function §1t3587s0§(param1:§1t82s0§) : *
      {
         this.§1t3582s0§ = param1;
         param1.§1t2166s0§(this.§1t3588s0§);
         param1.§1t2164s0§("*",this.§1t3594s0§);
         this.§1t3585s0§ = 5;
         if(§1t406s0§.instance != null)
         {
            §1t406s0§.instance.§1t6451s0§.visible = false;
         }
         §1t3317s0§.instance.§1t1534s0§();
      }
      
      internal function §1t3588s0§() : void
      {
         if(this.§1t3585s0§ <= 0)
         {
            §1t251s0§.instance.§1t3521s0§();
            §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(972),"#FFCC00");
            §1t1540s0§.§1t10039s0§();
            return;
         }
         §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(973),"#FFCC00");
         §1t406s0§.instance.§1t6657s0§(§1t1521s0§.getString(973));
         this.§1t3591s0§();
         --this.§1t3585s0§;
      }
      
      public function §1t3589s0§() : *
      {
         if(this.§1t3595s0§())
         {
            this.§1t3582s0§.disconnect();
            this.§1t3582s0§.§1t2167s0§(this.§1t3588s0§);
            this.§1t3582s0§.§1t2165s0§("*",this.§1t3594s0§);
         }
      }
      
      internal function §1t3590s0§(param1:PlayerIOError) : *
      {
         if(this.§1t3585s0§ > 0)
         {
            if(§1t406s0§.instance != null)
            {
               §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(974),"#FFCC00");
            }
            this.§1t3591s0§();
            --this.§1t3585s0§;
            return;
         }
         §1t251s0§.instance.§1t3521s0§();
         if(§1t406s0§.instance != null)
         {
            §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(975),"#FFCC00");
         }
         §1t1540s0§.§1t10039s0§();
      }
      
      internal function §1t3591s0§() : *
      {
         if(this.timer == null)
         {
            this.timer = new Timer(5000);
         }
         else
         {
            this.timer.delay = 5000;
            this.timer.reset();
         }
         this.timer.start();
         this.timer.addEventListener(TimerEvent.TIMER,this.§1t3592s0§,false,0,true);
      }
      
      internal function §1t3592s0§(param1:TimerEvent) : *
      {
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.§1t3592s0§);
         this.§1t3586s0§();
      }
      
      public function §1t3593s0§(param1:String) : *
      {
         return this.§1t3584s0§.indexOf(param1) != -1;
      }
      
      internal function §1t3594s0§(param1:§1t84s0§) : *
      {
         var msgbox:§1t5372s0§ = null;
         var index:int = 0;
         var rmindex:int = 0;
         var §1t15229s0§:String = null;
         var str:String = null;
         var j:int = 0;
         var §1t2176s0§:§1t81s0§ = null;
         var §1t15142s0§:§1t71s0§ = null;
         var §1t15230s0§:Array = null;
         var item:§1t17s0§ = null;
         var i:* = undefined;
         var m:§1t84s0§ = param1;
         try
         {
            if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8905s0§))
            {
               §1t3318s0§.instance.§1t3462s0§();
               §1t3317s0§.instance.§1t1846s0§(m.§1t1005s0§(0));
               this.§1t3583s0§ = m.getString(1);
               if(m.length == 2)
               {
                  §1t3318s0§.instance.checkLoadComplete();
               }
               else
               {
                  §1t3318s0§.instance.§1t3374s0§(m.getString(2),m.getString(3),m.getString(4),m.getString(5),m.getString(6),m.getString(7),m.getString(8),m.getString(9),m.§1t1005s0§(10),m.§1t1005s0§(11));
               }
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8871s0§))
            {
               if(§1t406s0§.instance != null)
               {
                  §1t406s0§.instance.§1t6635s0§();
               }
               else
               {
                  msgbox = new §1t5372s0§();
                  msgbox.prompt.text = §1t1521s0§.getString(11133);
                  §1t1540s0§.§1t9973s0§.addChild(msgbox);
                  this.§1t3589s0§();
               }
               §1t1523s0§.§1t1981s0§ = true;
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9059s0§))
            {
               if(§1t406s0§.instance != null)
               {
                  §1t406s0§.instance.§1t6657s0§(§1t1521s0§.getString(991));
               }
               else
               {
                  msgbox = new §1t5372s0§();
                  msgbox.prompt.text = §1t1521s0§.getString(991);
                  §1t1540s0§.§1t9973s0§.addChild(msgbox);
                  this.§1t3589s0§();
               }
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8933s0§))
            {
               msgbox = new §1t5372s0§();
               msgbox.prompt.text = §1t1521s0§.getString(646);
               §1t1540s0§.§1t9973s0§.addChild(msgbox);
               this.§1t3589s0§();
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8906s0§))
            {
               index = m.§1t1005s0§(0);
               if(index < 100)
               {
                  §1t3317s0§.instance.§1t1530s0§(index);
               }
               else if(index == 100)
               {
                  ++§1t3317s0§.instance.§1t1943s0§;
               }
               else if(index == 101)
               {
                  ++§1t3317s0§.instance.§1t1944s0§;
               }
               else if(index == 102)
               {
                  ++§1t3317s0§.instance.§1t1945s0§;
               }
               else if(index == 103)
               {
                  §1t3317s0§.instance.§1t1530s0§(1);
               }
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8927s0§))
            {
               this.§1t3584s0§.push(m.getString(0));
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8928s0§))
            {
               rmindex = this.§1t3584s0§.indexOf(m.getString(0));
               if(rmindex != -1)
               {
                  this.§1t3584s0§.splice(rmindex,1);
               }
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8929s0§))
            {
               this.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8930s0§));
               if(m.length == 1)
               {
                  §1t3317s0§.instance.§1t1846s0§(m.§1t1005s0§(0));
               }
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8872s0§))
            {
               if(§1t406s0§.instance != null)
               {
                  this.§1t3589s0§();
                  this.§1t3607s0§();
                  §1t1540s0§.§1t9973s0§.addChild(new §1t406s0§());
                  §1t406s0§.instance.§1t6638s0§();
               }
               else
               {
                  msgbox = new §1t5372s0§();
                  msgbox.prompt.text = §1t1521s0§.getString(991);
                  §1t1540s0§.§1t9973s0§.addChild(msgbox);
                  this.§1t3589s0§();
               }
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8873s0§))
            {
               §1t15229s0§ = m.getString(0);
               §1t81s0§.§1t9256s0§(§1t1523s0§.charname,§1t81s0§.§1t9249s0§).§1t1426s0§(§1t15229s0§);
               if(§1t406s0§.instance == null)
               {
                  msgbox = new §1t5372s0§();
                  msgbox.prompt.text = §1t1521s0§.getString(991);
                  §1t1540s0§.§1t9973s0§.addChild(msgbox);
               }
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8907s0§))
            {
               str = m.getString(0) + " is ";
               j = 1;
               while(j < m.length)
               {
                  str += m.getString(j);
                  if(j != m.length - 1)
                  {
                     str += ",";
                  }
                  j++;
               }
               §1t406s0§.instance.§1t5239s0§(str);
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9003s0§))
            {
               §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = m.getString(0);
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9005s0§))
            {
               if(m.§1t1005s0§(0) == 0)
               {
                  §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = §1t1521s0§.getString(11114);
               }
               else
               {
                  §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = §1t1521s0§.getString(11115);
               }
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8908s0§))
            {
               §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = m.§1t1005s0§(0).toString();
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8909s0§))
            {
               §1t2176s0§ = §1t81s0§.§1t9256s0§(m.getString(0),m.§1t1005s0§(1),m.getString(2));
               §1t2176s0§.§1t1429s0§();
            }
            else if(m.type != §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8910s0§))
            {
               if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8911s0§))
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7878s0§(m.§1t1005s0§(0));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8912s0§))
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7876s0§(m.§1t1005s0§(0));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9032s0§))
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7877s0§(m.§1t1005s0§(0));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9034s0§))
               {
                  §1t251s0§.instance.§1t3527s0§(m.getString(0));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8874s0§))
               {
                  §1t3318s0§.instance.client.§1t737s0§.§1t4235s0§(function():*
                  {
                     if(§1t1540s0§.§1t9550s0§())
                     {
                        §1t406s0§.instance.§1t6578s0§();
                     }
                     §1t406s0§.instance.§1t6645s0§();
                     §1t3524s0§("",869,[§1t1523s0§.§1t9765s0§()]);
                  });
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8914s0§))
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7874s0§(m.§1t1005s0§(0),m.§1t1005s0§(1));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8915s0§))
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7875s0§(m.§1t1005s0§(0));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8916s0§))
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7873s0§(m.§1t1005s0§(0));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8917s0§))
               {
                  §1t15142s0§ = §1t70s0§.instance.§1t1127s0§(m.§1t1005s0§(0));
                  if(§1t15142s0§ != null)
                  {
                     §1t15142s0§.§1t1277s0§ = §1t1523s0§.§1t7746s0§();
                  }
                  §1t406s0§.instance.§1t6482s0§.§1t7982s0§(m.§1t1005s0§(0),§1t1523s0§.§1t7746s0§());
                  if(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()))
                  {
                     ++§1t1523s0§.§1t9650s0§;
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8918s0§))
               {
                  if(m.§1t1005s0§(0) == 0)
                  {
                     this.§1t3526s0§(m.getString(1));
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(679),§1t1521s0§.getString(5));
                     if(m.getString(1) != "")
                     {
                        §1t15230s0§ = m.getString(1).split("|");
                        i = 0;
                        while(i < §1t15230s0§.length)
                        {
                           item = §1t17s0§.§1t8745s0§(§1t15230s0§[i]);
                           §1t1523s0§.§1t7693s0§(item);
                           i++;
                        }
                     }
                     §1t1523s0§.§1t9619s0§(m.§1t1005s0§(2));
                     §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9677s0§);
                     §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9674s0§);
                     §1t3317s0§.instance.§1t1946s0§();
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8919s0§))
               {
                  if(§1t406s0§.instance.§1t6505s0§ == null)
                  {
                     return;
                  }
                  if(m.§1t1005s0§(0) == 0)
                  {
                     §1t406s0§.instance.§1t6505s0§.§1t5470s0§(m.§1t1005s0§(1));
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6505s0§.§1t5471s0§(m.§1t1005s0§(0));
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8920s0§))
               {
                  if(m.§1t1005s0§(0) == 0)
                  {
                     §1t406s0§.instance.§1t6504s0§.§1t5327s0§();
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6504s0§.§1t5329s0§(m.§1t1005s0§(0));
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8875s0§))
               {
                  if(m.§1t1005s0§(0) == 0)
                  {
                     if(m.§1t1005s0§(1) == 11 || m.§1t1005s0§(1) == 12 || m.§1t1005s0§(1) == 20112)
                     {
                        if(m.length == 4)
                        {
                           §1t406s0§.instance.§1t6504s0§.§1t5325s0§(m.§1t1005s0§(1),m.§1t1005s0§(2),m.§1t1005s0§(3));
                           §1t3317s0§.instance.§1t1933s0§("[" + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8875s0§) + "] " + §1t406s0§.instance.§1t6504s0§.nametext2.text + ": " + m.§1t1005s0§(1) + " " + m.§1t1005s0§(2) + " " + m.§1t1005s0§(3));
                        }
                        else
                        {
                           §1t406s0§.instance.§1t6504s0§.§1t5325s0§(m.§1t1005s0§(1),m.§1t1005s0§(2));
                           §1t3317s0§.instance.§1t1933s0§("[" + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8875s0§) + "] " + §1t406s0§.instance.§1t6504s0§.nametext2.text + ": " + m.§1t1005s0§(1) + " " + m.§1t1005s0§(2));
                        }
                     }
                     else
                     {
                        §1t406s0§.instance.§1t6504s0§.§1t5325s0§(m.§1t1005s0§(1),1);
                        §1t3317s0§.instance.§1t1933s0§("[" + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8875s0§) + "] " + §1t406s0§.instance.§1t6504s0§.nametext2.text + ": " + m.§1t1005s0§(1));
                     }
                     §1t406s0§.instance.§1t6504s0§.§1t5326s0§();
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6504s0§.§1t5329s0§(m.§1t1005s0§(0));
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8891s0§))
               {
                  §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = m.getString(0);
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8890s0§))
               {
                  §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = §1t1521s0§.getString(11114);
                  §1t251s0§.instance.§1t3527s0§(m.getString(0));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8921s0§))
               {
                  if(m.§1t1005s0§(0) == 0)
                  {
                     §1t406s0§.instance.§1t6484s0§.listingsUI.§1t7170s0§();
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6484s0§.listingsUI.§1t7171s0§();
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8922s0§))
               {
                  if(m.§1t1005s0§(0) == 0)
                  {
                     §1t406s0§.instance.§1t6484s0§.listingsUI.§1t7173s0§();
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6484s0§.listingsUI.§1t7174s0§();
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8923s0§))
               {
                  if(m.§1t1005s0§(0) == 0)
                  {
                     §1t406s0§.instance.§1t6484s0§.listingsUI.§1t7172s0§();
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8924s0§))
               {
                  if(m.§1t1005s0§(0) == 0)
                  {
                     §1t406s0§.instance.§1t6484s0§.§1t5293s0§.§1t7081s0§();
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6484s0§.§1t5293s0§.§1t7082s0§(m.§1t1005s0§(1));
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8925s0§))
               {
                  if(m.§1t1005s0§(0) == 0)
                  {
                     §1t406s0§.instance.§1t6484s0§.§1t5293s0§.§1t7068s0§();
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6484s0§.§1t5293s0§.§1t7069s0§();
                  }
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8926s0§))
               {
                  §1t406s0§.instance.§1t6646s0§();
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9048s0§))
               {
                  §1t406s0§.instance.§1t6476s0§.§1t7713s0§(m.§1t1005s0§(1));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9051s0§))
               {
                  §1t406s0§.instance.§1t5947s0§.§1t3544s0§();
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9053s0§))
               {
                  §1t406s0§.instance.§1t5947s0§.crops.§1t3545s0§();
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9054s0§))
               {
                  §1t3318s0§.instance.§1t1535s0§(m.§1t1005s0§(0));
               }
               else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9057s0§))
               {
                  this.§1t3546s0§();
                  this.§1t3546s0§ = null;
               }
            }
         }
         catch(e:Error)
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§(e.message,"global:" + m.toString(),e.getStackTrace(),e.errorID);
         }
      }
      
      public function §1t3595s0§() : Boolean
      {
         return this.§1t3582s0§ != null && this.§1t3582s0§.connected;
      }
      
      public function §1t3604s0§(param1:String, param2:int, param3:int) : *
      {
         this.§1t3602s0§ = param2;
         this.§1t3603s0§ = param3;
         this.§1t3611s0§ = false;
         if(this.§1t3522s0§())
         {
            this.§1t3607s0§();
         }
         var _loc4_:* = new Object();
         var _loc5_:* = new Object();
         _loc4_.charname = §1t1523s0§.charname;
         _loc4_.level = §1t1523s0§.getLevel();
         _loc4_.equip = §1t1523s0§.§1t9732s0§();
         _loc4_.x = param2;
         _loc4_.side = §1t1523s0§.§1t7746s0§();
         _loc4_.nid = nid;
         _loc4_.spectator = §1t1523s0§.§1t9479s0§;
         if(param3 == §1t134s0§.§1t9232s0§ || param3 == §1t134s0§.§1t9234s0§ || param3 == §1t134s0§.§1t9233s0§ || param3 == §1t134s0§.§1t9235s0§ || param3 == §1t134s0§.§1t9236s0§ || param3 == §1t134s0§.§1t9237s0§)
         {
            _loc4_.stats = §1t1523s0§.§1t7366s0§();
            _loc4_.skills = §1t1523s0§.§1t9733s0§();
            _loc4_.taunt = §1t1523s0§.§1t5608s0§();
            _loc4_.stance = §1t1523s0§.stance;
            if(param3 == §1t134s0§.§1t9235s0§)
            {
               _loc5_.pvp = "2";
            }
            else
            {
               _loc5_.pvp = "1";
            }
         }
         else
         {
            _loc4_.stats = "";
            _loc4_.skills = "";
            _loc4_.taunt = "";
            _loc4_.stance = 0;
            _loc5_.pvp = "0";
         }
         _loc5_.roomwidth = §1t1525s0§.§1t8124s0§();
         _loc5_.groundy = §1t1525s0§.§1t4467s0§();
         if(§1t1523s0§.§1t9766s0§)
         {
            _loc4_.charname = §1t1523s0§.§1t9768s0§;
            _loc4_.level = §1t1523s0§.§1t9769s0§;
            _loc4_.equip = §1t1523s0§.§1t9770s0§;
            _loc4_.side = 0;
            if(§1t1523s0§.§1t9479s0§ != §1t12139s0§ && §1t1523s0§.§1t9479s0§ != §1t12140s0§ && §1t1523s0§.§1t9479s0§ != §1t12141s0§ && §1t1523s0§.§1t9479s0§ != §1t12142s0§)
            {
               _loc4_.spectator = §1t12139s0§;
            }
            if(!§1t1523s0§.§1t9767s0§)
            {
               _loc4_.stats = §1t1523s0§.§1t9774s0§();
            }
         }
         §1t3318s0§.instance.client.multiplayer.createJoinRoom(param1,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8868s0§),true,_loc5_,_loc4_,this.§1t3605s0§,this.§1t3606s0§);
         §1t2058s0§ = param1;
         this.§1t3599s0§ = param1;
      }
      
      internal function §1t3605s0§(param1:§1t82s0§) : *
      {
         var _loc3_:§1t99s0§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.§1t3601s0§ = 0;
         if(param1.roomId == this.§1t3600s0§)
         {
            param1.disconnect();
            this.§1t3600s0§ = "";
            return;
         }
         this.§1t3599s0§ = "";
         this.§1t3596s0§ = param1;
         this.§1t3596s0§.§1t2166s0§(this.§1t3608s0§);
         this.§1t3596s0§.§1t2164s0§("*",this.§1t3609s0§);
         this.§1t3465s0§ = §1t12083s0§;
         if(this.§1t3597s0§ == null)
         {
            this.§1t3597s0§ = new §1t81s0§();
         }
         var _loc2_:Boolean = §1t406s0§.instance.§1t6496s0§.§1t5150s0§();
         if(!_loc2_)
         {
            _loc3_ = §1t1523s0§.§1t9586s0§();
            _loc4_ = _loc3_.actionState;
            if(_loc4_ == §1t1544s0§.§1t11143s0§ || _loc4_ == §1t1544s0§.§1t11142s0§)
            {
               _loc5_ = _loc3_.§1t4408s0§;
            }
            else
            {
               _loc5_ = _loc3_.§1t1555s0§();
            }
            if(§1t1525s0§.§1t9899s0§ != null && _loc5_ != 150 && _loc5_ != §1t1525s0§.§1t8124s0§() - 150)
            {
               if(this.§1t3598s0§.length == 0)
               {
                  this.§1t3598s0§.push(new Point());
               }
               this.§1t3598s0§[0].x = _loc5_;
               this.§1t3598s0§[0].y = §1t1525s0§.§1t4467s0§();
               this.§1t3479s0§(this.§1t3598s0§,§1t1525s0§.§1t8131s0§(),-1);
            }
         }
      }
      
      internal function §1t3606s0§(param1:PlayerIOError) : *
      {
         var _loc2_:String = null;
         if(param1 == PlayerIOError.RoomIsFull)
         {
            ++this.§1t3601s0§;
            if(this.§1t3601s0§ == 1)
            {
               _loc2_ = §1t2058s0§ + "|" + this.§1t3601s0§.toString();
            }
            else if(this.§1t3601s0§ <= 10)
            {
               _loc2_ = §1t2058s0§.substr(0,§1t2058s0§.length - 1) + this.§1t3601s0§.toString();
            }
            else
            {
               _loc2_ = §1t2058s0§.substr(0,§1t2058s0§.length - 2) + this.§1t3601s0§.toString();
            }
            this.§1t3604s0§(_loc2_,this.§1t3602s0§,this.§1t3603s0§);
         }
         else
         {
            this.§1t3601s0§ = 0;
            §1t2058s0§ = "";
         }
      }
      
      public function §1t3607s0§() : *
      {
         if(§1t2058s0§ == this.§1t3599s0§)
         {
            this.§1t3600s0§ = this.§1t3599s0§;
         }
         if(this.§1t3522s0§())
         {
            this.§1t3596s0§.disconnect();
            this.§1t3596s0§.§1t2167s0§(this.§1t3608s0§);
            this.§1t3596s0§.§1t2165s0§("*",this.§1t3609s0§);
         }
         §1t2058s0§ = "";
      }
      
      internal function §1t3608s0§() : void
      {
         §1t2058s0§ = "";
      }
      
      internal function §1t3609s0§(param1:§1t84s0§) : *
      {
         var nid:String = null;
         var charname:String = null;
         var charlvl:int = 0;
         var equip:String = null;
         var xpos:int = 0;
         var side:int = 0;
         var facingRight:Boolean = false;
         var §1t15242s0§:String = null;
         var spectator:int = 0;
         var stats:String = null;
         var skills:String = null;
         var taunt:String = null;
         var stance:int = 0;
         var max:int = 0;
         var §1t15243s0§:Array = null;
         var i:int = 0;
         var §1t13174s0§:Array = null;
         var str:String = null;
         var §1t15244s0§:Array = null;
         var §1t15245s0§:String = null;
         var §1t15246s0§:String = null;
         var m:§1t84s0§ = param1;
         if(§1t2058s0§ == "")
         {
            return;
         }
         try
         {
            if(m.type == "public" || m.type == "private")
            {
               this.§1t3597s0§.§1t1445s0§(m);
            }
            else if(m.type == "UserJoined")
            {
               if(m.getString(0) == §1t2058s0§)
               {
                  nid = m.getString(1);
                  charname = m.getString(2);
                  charlvl = int(m.getString(3));
                  equip = m.getString(4);
                  xpos = int(m.getString(5));
                  side = int(m.getString(6));
                  facingRight = m.getString(7) == "1";
                  §1t15242s0§ = m.getString(8);
                  spectator = int(m.getString(9));
                  if(m.length == 14)
                  {
                     stats = m.getString(10);
                     skills = m.getString(11);
                     taunt = m.getString(12);
                     stance = int(m.getString(13));
                  }
                  else
                  {
                     stats = "";
                     skills = "";
                     taunt = "";
                     stance = 0;
                  }
                  §1t1543s0§.§1t10218s0§(nid,charname,charlvl,equip,xpos,side,facingRight,§1t15242s0§,spectator,stats,skills,taunt,stance,true);
               }
            }
            else if(m.type == "UserLeft")
            {
               §1t1543s0§.§1t10224s0§(m.getString(0));
            }
            else if(m.type == "ping")
            {
               this.§1t3596s0§.send("pong");
            }
            else if(m.type == "PlayerList")
            {
               if(m.getString(0) == §1t2058s0§)
               {
                  max = m.length;
                  i = 1;
                  while(i < max)
                  {
                     §1t15243s0§ = m.getString(i).split("$");
                     nid = §1t15243s0§[0];
                     charname = §1t15243s0§[1];
                     charlvl = int(§1t15243s0§[2]);
                     equip = §1t15243s0§[3];
                     xpos = int(§1t15243s0§[4]);
                     side = int(§1t15243s0§[5]);
                     facingRight = §1t15243s0§[6] == "1";
                     §1t15242s0§ = §1t15243s0§[7];
                     spectator = int(§1t15243s0§[8]);
                     if(§1t15243s0§.length == 13)
                     {
                        stats = §1t15243s0§[9];
                        skills = §1t15243s0§[10];
                        taunt = §1t15243s0§[11];
                        stance = int(§1t15243s0§[12]);
                     }
                     else
                     {
                        stats = "";
                        skills = "";
                        taunt = "";
                        stance = 0;
                     }
                     §1t1543s0§.§1t10218s0§(nid,charname,charlvl,equip,xpos,side,facingRight,§1t15242s0§,spectator,stats,skills,taunt,stance,false);
                     i++;
                  }
                  §1t406s0§.instance.§1t6496s0§.§1t5150s0§();
               }
            }
            else if(m.type == "RoomObj")
            {
               §1t13174s0§ = m.getString(0).split("|");
               max = int(§1t13174s0§.length);
               i = 0;
               while(i < max)
               {
                  if(§1t13174s0§[i] != "")
                  {
                     §1t15244s0§ = §1t13174s0§[i].split("^");
                     if(§1t15244s0§[2] == -1)
                     {
                        §1t15244s0§[2] = §1t1525s0§.§1t4467s0§();
                     }
                     §1t1525s0§.§1t9940s0§().§1t3537s0§(§1t15244s0§[0],§1t15244s0§[1],§1t15244s0§[2],§1t15244s0§[3],§1t15244s0§[4]);
                  }
                  i++;
               }
            }
            else if(m.type == "roomkicked")
            {
               this.§1t3521s0§();
               §1t1543s0§.§1t10242s0§(true);
            }
            else if(m.type == "stoppvp")
            {
               §1t1540s0§.§1t10058s0§();
            }
            else if(m.type == "pvp")
            {
               if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9235s0§)
               {
                  §1t1540s0§.§1t10057s0§();
               }
               else
               {
                  this.§1t3610s0§();
               }
            }
            else if(m.type == "wantpvpdata")
            {
               if(this.§1t3522s0§())
               {
                  if(m.length == 1 && m.getString(0) == "6")
                  {
                     this.§1t3611s0§ = true;
                  }
                  §1t406s0§.instance.§1t6496s0§.action = §1t6497s0§.§1t9995s0§;
                  §1t406s0§.instance.§1t6496s0§.§1t5149s0§ = true;
                  §1t1540s0§.§1t10035s0§(§1t1040s0§.§1t12376s0§);
                  §1t1540s0§.§1t10057s0§();
                  §1t1543s0§.§1t10242s0§(true);
                  if(§1t1523s0§.§1t9766s0§ && !§1t1523s0§.§1t9767s0§)
                  {
                     §1t15245s0§ = §1t1523s0§.§1t9774s0§();
                  }
                  else
                  {
                     §1t15245s0§ = §1t1523s0§.§1t7366s0§();
                  }
                  this.§1t3596s0§.send("mypvpdata",§1t15245s0§,§1t1523s0§.§1t9733s0§(),§1t1523s0§.§1t5608s0§(),§1t1523s0§.stance.toString());
               }
            }
            else if(m.type == "noentry")
            {
               §1t15246s0§ = §1t2058s0§ + "|1";
               this.§1t3521s0§();
               this.§1t3604s0§(§1t15246s0§,this.§1t3602s0§,this.§1t3603s0§);
            }
         }
         catch(e:Error)
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§(e.message,"group:" + m.toString(),e.getStackTrace(),e.errorID);
         }
      }
      
      public function §1t3610s0§() : *
      {
         var _loc1_:String = §1t2058s0§;
         var _loc2_:int = §1t1523s0§.§1t9586s0§().§1t1555s0§();
         var _loc3_:int = §1t1525s0§.§1t9923s0§();
         this.§1t3521s0§();
         this.§1t3604s0§(_loc1_,_loc2_,_loc3_);
      }
      
      public function §1t3612s0§() : Boolean
      {
         return this.§1t3611s0§ || §1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9236s0§ || §1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9237s0§;
      }
      
      public function §1t3616s0§() : *
      {
         this.§1t3617s0§("$service-room$");
      }
      
      public function §1t3617s0§(param1:String, param2:Boolean = true) : *
      {
         if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            if(this.§1t3615s0§)
            {
               §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(970) + "Global","#FFCC00");
            }
            else
            {
               §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(970) + this.§1t3614s0§,"#FFCC00");
            }
            this.§1t3620s0§();
         }
         else if(§1t1523s0§.§1t9511s0§ && this.§1t3615s0§)
         {
            §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(970) + "Global","#FFCC00");
            this.§1t3615s0§ = false;
            §1t2075s0§();
         }
         if(param1 == "global" || param1 == "Global")
         {
            param1 = "$service-room$";
         }
         if(§1t1523s0§.§1t9511s0§ && param1 == "$service-room$")
         {
            §1t2074s0§("net.explosivebarrel.duels.chat_" + §1t1521s0§.getLanguage());
            this.§1t3615s0§ = true;
            return;
         }
         var _loc3_:* = new Object();
         _loc3_.charname = §1t1523s0§.charname;
         _loc3_.level = §1t1523s0§.getLevel();
         if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
         {
            _loc3_.invis = "2";
         }
         var _loc4_:* = new Object();
         if(param1 == "$service-room$")
         {
            _loc3_.service = "1";
            this.§1t3615s0§ = true;
         }
         else
         {
            _loc4_.creator = §1t1523s0§.charname;
            this.§1t3615s0§ = false;
         }
         this.§1t3614s0§ = param1;
         §1t3318s0§.instance.client.multiplayer.createJoinRoom(param1,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8869s0§),param2,_loc4_,_loc3_,this.§1t3618s0§,this.§1t3619s0§);
      }
      
      internal function §1t3618s0§(param1:§1t82s0§) : *
      {
         this.§1t3613s0§ = param1;
         if(§1t406s0§.instance != null)
         {
            if(this.§1t3615s0§)
            {
               §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(969) + "Global","#FFCC00",false);
               §1t406s0§.instance.§1t6597s0§(§1t1521s0§.getString(11141) + "<br><br>","#FFCC00");
            }
            else
            {
               §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(969) + this.§1t3614s0§,"#FFCC00",false);
               §1t406s0§.instance.§1t6597s0§(§1t1521s0§.getString(11141) + "<br><br>","#FFCC00");
            }
         }
         param1.§1t2166s0§(this.§1t3621s0§);
         param1.§1t2164s0§("*",this.§1t3623s0§);
         this.§1t3614s0§ = this.§1t3613s0§.roomId;
      }
      
      internal function §1t3619s0§(param1:PlayerIOError) : *
      {
         this.§1t3614s0§ = "";
         if(param1 == PlayerIOError.RoomIsFull)
         {
            §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(963),"#FFCC00");
         }
      }
      
      public function §1t3620s0§() : *
      {
         if(this.§1t3613s0§ != null && this.§1t3613s0§.connected)
         {
            this.§1t3613s0§.disconnect();
            this.§1t3613s0§.§1t2167s0§(this.§1t3621s0§);
            this.§1t3613s0§.§1t2165s0§("*",this.§1t3623s0§);
         }
         this.§1t3614s0§ = "";
      }
      
      internal function §1t3621s0§() : void
      {
         this.§1t3614s0§ = "";
      }
      
      internal function §1t3623s0§(param1:§1t84s0§) : *
      {
         var §1t15293s0§:int = 0;
         var §1t15294s0§:String = null;
         var i:int = 0;
         var §1t15295s0§:String = null;
         var max:int = 0;
         var §1t15296s0§:String = null;
         var §1t15297s0§:String = null;
         var §1t15298s0§:int = 0;
         var §1t15299s0§:String = null;
         var §1t15300s0§:Array = null;
         var §1t15301s0§:Array = null;
         var §1t15302s0§:§1t68s0§ = null;
         var §1t15303s0§:String = null;
         var §1t15304s0§:String = null;
         var §1t1656s0§:§1t58s0§ = null;
         var §1t13182s0§:* = undefined;
         var §1t13183s0§:String = null;
         var §1t13184s0§:* = undefined;
         var color:String = null;
         var §1t15305s0§:String = null;
         var §1t13174s0§:Array = null;
         var §1t15306s0§:int = 0;
         var §1t15307s0§:int = 0;
         var str:String = null;
         var m:§1t84s0§ = param1;
         try
         {
            if(m.type == "UserJoined")
            {
               if(!§1t1543s0§.§1t10251s0§(m.getString(0)))
               {
                  §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(408,["<u><a href=\'event:[CHR]" + m.getString(0) + "\'>" + this.§1t3624s0§(m.getString(0)) + "</a></u>"]),"#FFCC00",false);
               }
            }
            else if(m.type == "UserLeft")
            {
               if(!§1t1543s0§.§1t10251s0§(m.getString(0)))
               {
                  §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(409,[this.§1t3624s0§(m.getString(0))]),"#FFCC00",false);
               }
            }
            else if(m.type == "ping")
            {
               this.§1t3613s0§.send("pong");
            }
            else if(m.type == "PlayersOnline")
            {
               §1t15293s0§ = m.length / 2;
               if(this.§1t3615s0§ && §1t15293s0§ == 20)
               {
                  §1t406s0§.instance.§1t5239s0§("\n" + §1t1521s0§.getString(967,[">20"]),"#FFCC00",false);
               }
               else
               {
                  §1t406s0§.instance.§1t5239s0§("\n" + §1t1521s0§.getString(967,[§1t15293s0§.toString()]),"#FFCC00",false);
               }
               this.§1t3584s0§ = new Array();
               i = 0;
               while(i < m.length)
               {
                  §1t15294s0§ = m.getString(i);
                  if(§1t15294s0§.substr(0,5) == "[OP] ")
                  {
                     §1t15294s0§ = §1t15294s0§.substr(5).toLowerCase();
                  }
                  §1t15295s0§ = "<u><a href=\'event:[CHR]" + §1t15294s0§ + "\'>" + this.§1t3624s0§(m.getString(i)) + "</a></u>";
                  §1t406s0§.instance.§1t5239s0§("- " + §1t15295s0§ + " (" + §1t1521s0§.getString(47,[m.getString(i + 1)]) + ")","#CCCCCC",false);
                  this.§1t3584s0§.push(m.getString(i));
                  i += 2;
               }
               §1t406s0§.instance.§1t5239s0§("<br>","",false);
            }
            else if(m.type == "kicked")
            {
               if(this.§1t3615s0§)
               {
                  §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(968) + "Global","#FFCC00");
               }
               else
               {
                  §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(968) + this.§1t3614s0§,"#FFCC00");
               }
               this.§1t3620s0§();
            }
            else if(m.type == "chatblock")
            {
               max = m.length;
               i = 0;
               while(i < max / 4)
               {
                  if(m.getString(i * 4 + 2) != §1t2058s0§)
                  {
                     §1t15296s0§ = m.getString(i * 4);
                     §1t15297s0§ = m.getString(i * 4 + 1);
                     §1t15298s0§ = m.§1t1005s0§(i * 4 + 3);
                     if(§1t15296s0§ == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8886s0§) && this.§1t3636s0§(§1t15297s0§))
                     {
                        return;
                     }
                     if(§1t15296s0§ == "Server")
                     {
                        §1t15296s0§ = "";
                        §1t15300s0§ = §1t15297s0§.split("|");
                        if(§1t15300s0§.length == 2)
                        {
                           §1t15301s0§ = §1t15300s0§[1].split(",");
                           §1t15297s0§ = §1t1521s0§.getString(int(§1t15300s0§[0]),§1t15301s0§);
                        }
                     }
                     if((§1t15298s0§ == 0 || §1t15298s0§ == §1t1523s0§.§1t7746s0§()) && !§1t1543s0§.§1t10251s0§(§1t15296s0§))
                     {
                        if(§1t15298s0§ == 0)
                        {
                           §1t15299s0§ = "#FFFFFF";
                        }
                        else if(§1t15298s0§ == 1)
                        {
                           §1t15299s0§ = "#FF0000";
                        }
                        else if(§1t15298s0§ == 2)
                        {
                           §1t15299s0§ = "#00FF00";
                        }
                        else if(§1t15298s0§ == 3)
                        {
                           §1t15299s0§ = "#00FFFF";
                        }
                        else if(§1t15298s0§ == 4)
                        {
                           §1t15299s0§ = "#FFCC00";
                        }
                        else if(§1t1523s0§.§1t9663s0§(§1t15298s0§))
                        {
                           §1t15299s0§ = "#FF9900";
                        }
                        §1t406s0§.instance.§1t5238s0§(§1t15296s0§,§1t15297s0§,§1t15299s0§);
                        if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                        {
                           §1t113s0§.instance.§1t5238s0§(§1t15296s0§,§1t15297s0§,§1t15299s0§);
                        }
                        else if(§1t406s0§.instance.§1t6509s0§.visible)
                        {
                           §1t412s0§.instance.§1t5238s0§(§1t15296s0§,§1t15297s0§,§1t15299s0§);
                        }
                     }
                  }
                  i++;
               }
            }
            else if(m.type == "tchatblock")
            {
               max = m.length;
               i = 0;
               while(i < max / 2)
               {
                  §1t15296s0§ = m.getString(i * 2);
                  §1t15297s0§ = m.getString(i * 2 + 1);
                  if(!§1t1543s0§.§1t10251s0§(§1t15296s0§) && §1t15296s0§ != §1t1523s0§.§1t9764s0§())
                  {
                     §1t406s0§.instance.§1t6596s0§(§1t15296s0§,§1t15297s0§);
                  }
                  i++;
               }
            }
            else if(m.type == "chatbot")
            {
               §1t15302s0§ = §1t1543s0§.§1t10210s0§();
               if(§1t15302s0§ != null && §1t15302s0§.§1t1559s0§() != null)
               {
                  §1t15303s0§ = m.getString(0);
                  §1t15303s0§ = §1t15303s0§.toLowerCase();
                  if(§1t15303s0§.indexOf("chomsky") >= 0)
                  {
                     if(§1t15302s0§.§1t1559s0§().displayName != null && §1t15302s0§.§1t1559s0§().displayName.visible)
                     {
                        §1t15304s0§ = §1t15302s0§.§1t1559s0§().displayName.nametext.text;
                        §1t15303s0§ = §1t15303s0§.split("chomsky").join(§1t15304s0§);
                     }
                     else
                     {
                        §1t15303s0§ = "I am just a villager.";
                     }
                  }
                  if(§1t15303s0§.indexOf("peter") >= 0)
                  {
                     §1t1656s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() + §1t1525s0§.§1t7341s0§() * 21);
                     §1t15303s0§ = §1t15303s0§.split("peter").join(§1t136s0§.§1t9190s0§().§1t1815s0§(§1t1656s0§,true));
                     §1t1656s0§.destroy();
                  }
                  if(§1t15303s0§.indexOf("2004") >= 0)
                  {
                     §1t15303s0§ = §1t15303s0§.split("2004").join("1725");
                  }
                  if(§1t15303s0§ == "the price of gasoline is up.")
                  {
                     if(int(Math.random() * 2) == 0)
                     {
                        §1t15303s0§ = "The sky is up.";
                     }
                     else
                     {
                        §1t15303s0§ = "Sup.";
                     }
                  }
                  else if(§1t15303s0§.indexOf("i would like to talk about") >= 0)
                  {
                     §1t15303s0§ = "I\'m bored! Let\'s talk about something else.";
                  }
                  else if(§1t15303s0§.indexOf("can we talk about") >= 0)
                  {
                     §1t15303s0§ = "Let\'s talk about something else.";
                  }
                  else if(§1t15303s0§.indexOf("wow! what do you do when you arent watching star trek, playing world of warcraft, and thinking of questions like that?") >= 0)
                  {
                     §1t15303s0§ = §1t15303s0§.split("wow! what do you do when you arent watching star trek, playing world of warcraft, and thinking of questions like that?").join("wow! what do you do when you aren\'t killing bandits, fighting in the war room, and thinking of questions like that?");
                  }
                  else if(§1t15303s0§.indexOf("100") >= 0)
                  {
                     §1t15303s0§ = "Bye!";
                  }
                  else if(§1t15303s0§.indexOf("bot") >= 0 || §1t15303s0§.indexOf("pandora") >= 0 || §1t15303s0§.indexOf(".com") >= 0 || §1t15303s0§.indexOf("computer") >= 0 || §1t15303s0§.indexOf("electronic") >= 0 || §1t15303s0§.indexOf("artificial") >= 0 || §1t15303s0§.indexOf("software") >= 0 || §1t15303s0§.indexOf("http") >= 0 || §1t15303s0§.indexOf("human") >= 0 || §1t15303s0§.indexOf("link") >= 0 || §1t15303s0§.indexOf("cyber") >= 0 || §1t15303s0§.indexOf("wiki") >= 0 || §1t15303s0§.indexOf("electricity") >= 0 || §1t15303s0§.indexOf("internet") >= 0 || §1t15303s0§.indexOf("<br>") >= 0 || §1t15303s0§.indexOf("briefly") >= 0 || §1t15303s0§.indexOf("click") >= 0)
                  {
                     §1t15303s0§ = "Hmm...";
                  }
                  §1t15302s0§.§1t1559s0§().§1t6288s0§(§1t15303s0§);
                  §1t3317s0§.instance.§1t1933s0§("[BOT]: " + §1t15303s0§);
               }
            }
            else if(m.type == "public" || m.type == "private")
            {
               switch(m.§1t1005s0§(0))
               {
                  case §1t12111s0§:
                     §1t13182s0§ = m.getString(2);
                     §1t13183s0§ = m.getString(3);
                     if(§1t13182s0§ == §1t1523s0§.charname)
                     {
                        return;
                     }
                     if(§1t13182s0§ == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8886s0§) && this.§1t3636s0§(§1t13183s0§))
                     {
                        return;
                     }
                     if(§1t1543s0§.§1t10251s0§(§1t13182s0§))
                     {
                        return;
                     }
                     §1t13184s0§ = m.§1t1005s0§(4);
                     if(§1t13184s0§ == 0)
                     {
                        color = "#FFFFFF";
                     }
                     else if(§1t13184s0§ == -1)
                     {
                        color = "#CCCCCC";
                     }
                     else if(§1t13184s0§ == 1)
                     {
                        color = "#FF0000";
                     }
                     else if(§1t13184s0§ == 2)
                     {
                        color = "#00FF00";
                     }
                     else if(§1t13184s0§ == 3)
                     {
                        color = "#00FFFF";
                     }
                     else if(§1t13184s0§ == 4)
                     {
                        color = "#FFCC00";
                     }
                     else if(§1t1523s0§.§1t9663s0§(§1t13184s0§))
                     {
                        color = "#FF9900";
                     }
                     if(§1t13184s0§ == 0 || §1t13184s0§ == §1t1523s0§.§1t7746s0§())
                     {
                        §1t406s0§.instance.§1t5238s0§(§1t13182s0§,§1t13183s0§,color);
                        if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                        {
                           §1t113s0§.instance.§1t5238s0§(§1t13182s0§,§1t13183s0§,color);
                        }
                        else if(§1t406s0§.instance.§1t6509s0§.visible)
                        {
                           §1t412s0§.instance.§1t5238s0§(§1t13182s0§,§1t13183s0§,color);
                        }
                     }
                     break;
                  case §1t12130s0§:
                     if(m.§1t1005s0§(2) == 863)
                     {
                        §1t13174s0§ = m.getString(3).split("|");
                        if(§1t13174s0§.length == 2 && int(§1t13174s0§[1]) < 5 && §1t1523s0§.getLevel() > 20)
                        {
                           return;
                        }
                     }
                     else if(m.§1t1005s0§(2) == 805)
                     {
                        §1t13174s0§ = m.getString(3).split("|");
                        if(§1t13174s0§.length == 2)
                        {
                           this.§1t3622s0§.§1t492s0§(§1t13174s0§[1]);
                           §1t15306s0§ = this.§1t3622s0§.getLevel();
                           §1t15307s0§ = §1t1523s0§.getLevel();
                           if(§1t15306s0§ < §1t15307s0§ - 10 || §1t15306s0§ > §1t15307s0§ + 15)
                           {
                              return;
                           }
                           str = "<b><u><a href=\'event:[ITM]" + this.§1t3622s0§.§1t490s0§() + "\'>" + this.§1t3622s0§.§1t511s0§() + "</a></u></b>";
                           §1t15305s0§ = this.§1t3525s0§(m.getString(1),m.§1t1005s0§(2),§1t13174s0§[0] + "|" + str);
                           §1t406s0§.instance.§1t5238s0§("",§1t15305s0§);
                           return;
                        }
                     }
                     §1t15305s0§ = this.§1t3525s0§(m.getString(1),m.§1t1005s0§(2),m.getString(3));
                     §1t406s0§.instance.§1t5238s0§("",§1t15305s0§);
                     if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                     {
                        §1t113s0§.instance.§1t5238s0§("",§1t15305s0§);
                     }
                     else if(§1t406s0§.instance.§1t6509s0§.visible)
                     {
                        §1t412s0§.instance.§1t5238s0§("",§1t15305s0§);
                     }
               }
            }
         }
         catch(e:Error)
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§(e.message,"chat:" + m.toString(),e.getStackTrace(),e.errorID);
         }
      }
      
      public function §1t3624s0§(param1:String) : String
      {
         var _loc2_:String = param1.substr(0,1);
         var _loc3_:String = param1.substr(1,param1.length);
         return _loc2_.toUpperCase() + _loc3_;
      }
      
      public function §1t3625s0§() : *
      {
         §1t3318s0§.instance.client.multiplayer.listRooms(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8869s0§),null,1000,0,function(param1:Array):*
         {
            var _loc3_:RoomInfo = null;
            var _loc4_:String = null;
            var _loc2_:int = int(param1.length);
            §1t406s0§.instance.§1t5239s0§("\n" + §1t1521s0§.getString(971),"#FFCC00");
            §1t406s0§.instance.§1t5239s0§("- Global","#CCCCCC");
            var _loc5_:int = 0;
            while(_loc5_ < _loc2_)
            {
               _loc3_ = param1[_loc5_];
               _loc4_ = "- " + _loc3_.id + " (" + _loc3_.onlineUsers + "/45)\n";
               §1t406s0§.instance.§1t5239s0§(_loc4_,"#CCCCCC");
               _loc5_++;
            }
            §1t406s0§.instance.§1t5239s0§("");
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      public function §1t3627s0§(param1:String, param2:Object) : *
      {
         var _loc3_:String = "$service-room$";
         param2.purpose = param1;
         §1t3318s0§.instance.client.multiplayer.createJoinRoom(_loc3_,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8870s0§),false,{},param2,this.§1t3630s0§,this.§1t3634s0§);
         if(param1 == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8876s0§) || param1 == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8877s0§))
         {
            if(this.timer == null)
            {
               this.timer = new Timer(30000);
            }
            else
            {
               this.timer.delay = 30000;
               this.timer.reset();
            }
            this.timer.start();
            this.timer.addEventListener(TimerEvent.TIMER,this.§1t3628s0§,false,0,true);
         }
      }
      
      internal function §1t3628s0§(param1:TimerEvent) : *
      {
         this.§1t3629s0§();
         if(§1t7017s0§.instance != null && §1t7017s0§.instance.visible && §1t7017s0§.instance.charcreate.visible)
         {
            §1t7017s0§.instance.charcreate.§1t5343s0§(4);
            §1t7017s0§.instance.charcreate.errormessage.text = §1t1521s0§.getString(11116);
            if(§1t1523s0§.§1t9521s0§)
            {
               §1t1676s0§.instance.§1t1680s0§();
            }
         }
         else if(§1t406s0§.instance != null && §1t406s0§.instance.§1t6521s0§ != null && §1t406s0§.instance.§1t6521s0§.visible)
         {
            §1t406s0§.instance.§1t6521s0§.§1t6832s0§(4);
            §1t406s0§.instance.§1t6521s0§.errormessage.text = §1t1521s0§.getString(11117);
            §1t406s0§.instance.§1t6521s0§.fbnotelabel.text = §1t1521s0§.getString(11116);
            §1t406s0§.instance.§1t6521s0§.fbnotelabel.visible = true;
         }
      }
      
      internal function §1t3629s0§() : *
      {
         if(this.timer != null && this.timer.running)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.§1t3628s0§);
         }
      }
      
      internal function §1t3630s0§(param1:§1t82s0§) : *
      {
         this.§1t3629s0§();
         this.§1t3626s0§ = param1;
         param1.§1t2166s0§(this.§1t3633s0§);
         param1.§1t2164s0§("*",this.§1t3632s0§);
      }
      
      public function §1t3631s0§() : *
      {
         if(this.§1t3626s0§ != null && this.§1t3626s0§.connected)
         {
            this.§1t3626s0§.disconnect();
            this.§1t3626s0§.§1t2167s0§(this.§1t3633s0§);
            this.§1t3626s0§.§1t2165s0§("*",this.§1t3632s0§);
         }
      }
      
      internal function §1t3632s0§(param1:§1t84s0§) : *
      {
         var msgbox:§1t5372s0§ = null;
         var m:§1t84s0§ = param1;
         try
         {
            if(m.type == "createchar")
            {
               if(§1t406s0§.instance != null && §1t406s0§.instance.§1t6521s0§ != null && §1t406s0§.instance.§1t6521s0§.visible)
               {
                  §1t3318s0§.instance.§1t3339s0§();
               }
               else
               {
                  §1t3318s0§.instance.§1t3363s0§(m.§1t1005s0§(0));
               }
               this.§1t3626s0§.disconnect();
            }
            else if(m.type == "charnamecheckresp")
            {
               if(§1t406s0§.instance != null && §1t406s0§.instance.§1t6521s0§ != null && §1t406s0§.instance.§1t6521s0§.visible)
               {
                  §1t406s0§.instance.§1t6521s0§.§1t6832s0§(m.§1t1005s0§(0));
               }
               this.§1t3626s0§.disconnect();
            }
            else if(m.type == "disconnect")
            {
               this.§1t3626s0§.disconnect();
            }
            else if(m.type == "migrationresp")
            {
               §1t3318s0§.instance.§1t3359s0§(§1t3318s0§.instance.client);
               this.§1t3626s0§.disconnect();
            }
            else if(m.type == "delcharresp")
            {
               §1t7017s0§.instance.charselect.chardeleteform.§1t5343s0§(0);
               this.§1t3626s0§.disconnect();
            }
            else if(m.type == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8871s0§))
            {
               if(§1t406s0§.instance != null)
               {
                  §1t406s0§.instance.§1t6635s0§();
               }
               else
               {
                  msgbox = new §1t5372s0§();
                  msgbox.prompt.text = §1t1521s0§.getString(11133);
                  §1t1540s0§.§1t9973s0§.addChild(msgbox);
               }
               §1t1523s0§.§1t1981s0§ = true;
               this.§1t3626s0§.disconnect();
            }
         }
         catch(e:Error)
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§(e.message,"utility: " + (§1t406s0§.instance != null && §1t406s0§.instance.§1t6521s0§ != null && §1t406s0§.instance.§1t6521s0§.visible) + " " + (§1t3318s0§.instance == null) + " " + m.toString(),e.getStackTrace(),e.errorID);
         }
      }
      
      internal function §1t3633s0§() : void
      {
      }
      
      internal function §1t3634s0§(param1:PlayerIOError) : *
      {
         this.§1t3629s0§();
         if(§1t7017s0§.instance != null && §1t7017s0§.instance.visible && §1t7017s0§.instance.charcreate.visible)
         {
            §1t7017s0§.instance.charcreate.§1t5343s0§(4);
            §1t7017s0§.instance.charcreate.errormessage.text = String(param1.type);
         }
         else if(§1t406s0§.instance != null && §1t406s0§.instance.§1t6521s0§ != null && §1t406s0§.instance.§1t6521s0§.visible)
         {
            §1t406s0§.instance.§1t6521s0§.§1t6832s0§(4);
            §1t406s0§.instance.§1t6521s0§.errormessage.text = String(param1.type);
         }
      }
      
      internal function §1t3635s0§(param1:Object) : *
      {
         var _loc2_:* = undefined;
         for(_loc2_ in param1)
         {
         }
      }
      
      internal function §1t3636s0§(param1:String) : Boolean
      {
         var _loc2_:Array = param1.split(" ");
         if(_loc2_[0] == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8865s0§) || _loc2_[0] == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8866s0§) && _loc2_.length == 2 && _loc2_[1] == §1t1523s0§.charname)
         {
            this.§1t3521s0§();
            §1t1540s0§.§1t10039s0§();
            if(§1t1523s0§.§1t9503s0§)
            {
               this.§1t3589s0§();
            }
            §1t3317s0§.instance.§1t1856s0§();
            §1t7017s0§.instance.§1t7030s0§();
            §1t7017s0§.instance.login.errormessage.text = §1t1521s0§.getString(31);
            §1t7017s0§.instance.§1t7039s0§();
            §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(674));
            return true;
         }
         if(_loc2_[0] == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9018s0§) && _loc2_.length == 2 && _loc2_[1] == §1t1523s0§.charname)
         {
            §1t1523s0§.§1t1981s0§ = true;
            return true;
         }
         if(_loc2_[0] == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8866s0§) || _loc2_[0] == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9018s0§))
         {
            return true;
         }
         return false;
      }
   }
}

