package
{
   import flash.errors.*;
   import flash.events.*;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.*;
   import flash.utils.Timer;
   
   public class §1t1832s0§
   {
      
      public static var instance:§1t1832s0§;
      
      internal static var §1t9972s0§:int = 21;
      
      public var §1t1833s0§:Boolean = false;
      
      public var §1t1834s0§:Boolean = false;
      
      public var magicnum:int = 0;
      
      internal var username:String = "";
      
      internal var §1t1836s0§:String = "";
      
      internal var §1t1837s0§:String = "";
      
      internal var §1t1838s0§:int = 0;
      
      internal var serverTime:int = 0;
      
      internal var §1t1839s0§:int = 0;
      
      internal var §1t1840s0§:int = 0;
      
      internal var §1t1841s0§:int = 0;
      
      internal var §1t1842s0§:Boolean = false;
      
      internal var §1t1843s0§:Timer = new Timer(1000);
      
      internal var §1t1526s0§:Vector.<Boolean> = new Vector.<Boolean>(§1t9972s0§);
      
      internal var §1t1527s0§:Array = new Array();
      
      internal var debug:Boolean = false;
      
      internal var server:String;
      
      internal var §1t1531s0§:int = -1;
      
      internal var §1t1532s0§:Boolean = false;
      
      internal var §1t1845s0§:int = 0;
      
      internal var §1t1888s0§:String;
      
      internal var §1t1943s0§:int;
      
      internal var §1t1944s0§:int;
      
      internal var §1t1945s0§:int;
      
      internal var §1t1981s0§:Boolean = false;
      
      internal var §1t2017s0§:int;
      
      public function §1t1832s0§()
      {
         super();
      }
      
      internal function §1t1528s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t9972s0§)
         {
            this.§1t1526s0§[_loc1_] = false;
            _loc1_++;
         }
      }
      
      internal function §1t1529s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t9972s0§)
         {
            this.§1t1526s0§[_loc1_] = true;
            _loc1_++;
         }
      }
      
      internal function §1t1530s0§(param1:int) : *
      {
         this.§1t1526s0§[param1] = true;
      }
      
      internal function §1t1533s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t9972s0§)
         {
            this.§1t1527s0§[_loc1_] = false;
            _loc1_++;
         }
         this.§1t1527s0§[100] = false;
         this.§1t1527s0§[101] = false;
         this.§1t1527s0§[102] = false;
         this.§1t1527s0§[103] = false;
         this.§1t1527s0§[104] = false;
         this.§1t1527s0§[105] = false;
         this.§1t1531s0§ = -1;
         this.§1t1532s0§ = false;
      }
      
      public function §1t1534s0§() : *
      {
         this.§1t1531s0§ = -1;
         this.§1t1532s0§ = false;
      }
      
      internal function §1t1535s0§(param1:int) : *
      {
         this.§1t1527s0§[param1] = false;
         §1t406s0§.instance.§1t6656s0§(this.§1t1536s0§());
      }
      
      public function §1t1536s0§() : Boolean
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < §1t9972s0§)
         {
            if(this.§1t1527s0§[_loc1_])
            {
               return true;
            }
            _loc1_++;
         }
         _loc1_ = 100;
         while(_loc1_ <= 105)
         {
            if(this.§1t1527s0§[_loc1_])
            {
               return true;
            }
            _loc1_++;
         }
         this.§1t1531s0§ = -1;
         return false;
      }
      
      internal function §1t1846s0§(param1:int = 0) : *
      {
         var _loc3_:int = 0;
         if(param1 != 0)
         {
            if(this.serverTime != 0)
            {
               _loc3_ = this.serverTime - param1;
               if(_loc3_ < 1431087000)
               {
                  if(this.§1t1845s0§ < 3 && _loc3_ >= 60)
                  {
                     ++this.§1t1845s0§;
                     if(this.§1t1845s0§ == 3)
                     {
                        §1t3318s0§.instance.§1t1982s0§(_loc3_ + " " + §1t1521s0§.getString(118) + "4",false,true);
                     }
                  }
               }
            }
            this.serverTime = param1;
            this.§1t1838s0§ = this.serverTime;
         }
         else
         {
            this.§1t1838s0§ = this.serverTime;
         }
         var _loc2_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         _loc2_.data.§1t1838s0§ = this.§1t1838s0§;
         if(!this.§1t1842s0§)
         {
            this.§1t1842s0§ = true;
            this.§1t1843s0§.start();
            this.§1t1843s0§.addEventListener(TimerEvent.TIMER,this.§1t1427s0§,false,0,true);
            this.§1t1839s0§ = new Date(this.serverTime * 1000).dateUTC;
            this.§1t1840s0§ = new Date(this.serverTime * 1000).monthUTC;
            this.§1t1841s0§ = new Date(this.serverTime * 1000 - 24 * 60 * 60 * 1000).dateUTC;
         }
      }
      
      internal function §1t1427s0§(param1:TimerEvent) : void
      {
         ++this.serverTime;
      }
      
      public function §1t1847s0§() : int
      {
         if(this.§1t1842s0§)
         {
            return this.serverTime;
         }
         return 0;
      }
      
      public function §1t1848s0§() : int
      {
         return this.§1t1839s0§;
      }
      
      public function §1t1849s0§() : int
      {
         return this.§1t1840s0§;
      }
      
      public function §1t1850s0§() : int
      {
         return this.§1t1841s0§;
      }
      
      public function login(param1:String, param2:String) : *
      {
         var _loc3_:URLRequest = null;
         var _loc4_:URLLoader = null;
         var _loc5_:URLVariables = null;
         this.username = param1;
         if(!this.§1t1833s0§)
         {
            _loc3_ = new URLRequest(this.server + "login_internal.php");
            _loc4_ = new URLLoader();
            _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
            _loc5_ = new URLVariables();
            _loc5_.username = param1;
            _loc5_.password = param2;
            _loc5_.lang = §1t1521s0§.getLanguage();
            _loc5_.ver = §1t1523s0§.§1t9323s0§;
            if(this.debug)
            {
               _loc5_.debug = 1;
            }
            _loc3_.data = _loc5_;
            _loc3_.method = URLRequestMethod.POST;
            _loc4_.addEventListener(Event.COMPLETE,this.§1t1854s0§,false,0,true);
            _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1855s0§,false,0,true);
            _loc4_.load(_loc3_);
         }
         else
         {
            this.§1t1834s0§ = true;
            this.username = "Guest";
            this.§1t1837s0§ = "";
            §1t7017s0§.instance.login.§1t5343s0§(0);
            this.§1t1846s0§(1000000);
            §1t251s0§.§1t9190s0§();
         }
      }
      
      public function §1t1851s0§() : *
      {
         var _loc1_:URLRequest = null;
         var _loc2_:URLLoader = null;
         var _loc3_:URLVariables = null;
         if(!this.§1t1833s0§)
         {
            _loc1_ = new URLRequest(this.server + "login_external.php");
            _loc2_ = new URLLoader();
            _loc2_.dataFormat = URLLoaderDataFormat.VARIABLES;
            _loc3_ = new URLVariables();
            _loc3_.ver = §1t1523s0§.§1t9323s0§;
            _loc3_.lang = §1t1521s0§.getLanguage();
            if(this.debug)
            {
               _loc3_.debug = 1;
            }
            _loc1_.data = _loc3_;
            _loc1_.method = URLRequestMethod.POST;
            _loc2_.addEventListener(Event.COMPLETE,this.§1t1854s0§,false,0,true);
            _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1855s0§,false,0,true);
            _loc2_.load(_loc1_);
         }
      }
      
      public function §1t1852s0§() : Boolean
      {
         if(!§1t1523s0§.§1t9498s0§)
         {
            return false;
         }
         var _loc1_:Object = §1t1540s0§.§1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         return _loc1_.username;
      }
      
      public function §1t1853s0§() : *
      {
         var _loc2_:URLRequest = null;
         var _loc3_:URLLoader = null;
         var _loc4_:URLVariables = null;
         var _loc1_:Object = §1t1540s0§.§1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         if(!_loc1_.username)
         {
            §1t7017s0§.instance.login.§1t5343s0§(6);
            return;
         }
         if(_loc1_.facebookid)
         {
            §1t1523s0§.facebookid = _loc1_.facebookid;
         }
         if(_loc1_.fbfriends)
         {
            §1t1523s0§.§1t9378s0§ = _loc1_.fbfriends;
         }
         if(!this.§1t1833s0§)
         {
            _loc2_ = new URLRequest(this.server + "login_flashvars.php");
            _loc3_ = new URLLoader();
            _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
            _loc4_ = new URLVariables();
            _loc4_.username = _loc1_.username;
            _loc4_.§1t1836s0§ = _loc1_.§1t1836s0§;
            _loc4_.ver = §1t1523s0§.§1t9323s0§;
            _loc4_.lang = §1t1521s0§.getLanguage();
            if(this.debug)
            {
               _loc4_.debug = 1;
            }
            _loc2_.data = _loc4_;
            _loc2_.method = URLRequestMethod.POST;
            _loc3_.addEventListener(Event.COMPLETE,this.§1t1854s0§,false,0,true);
            _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1855s0§,false,0,true);
            _loc3_.load(_loc2_);
         }
      }
      
      internal function §1t1854s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               this.magicnum = _loc3_.magicnum;
               this.§1t1834s0§ = true;
               this.§1t1837s0§ = _loc3_.chars;
               if(_loc3_.username != null && _loc3_.username != "")
               {
                  this.username = _loc3_.username;
               }
               this.§1t1836s0§ = _loc3_.id;
               §1t7017s0§.instance.§1t7043s0§(_loc3_.motd);
               if(§1t1523s0§.§1t9499s0§ && !§1t251s0§.§1t9190s0§().connected)
               {
                  §1t251s0§.§1t9190s0§();
               }
               else
               {
                  §1t7017s0§.instance.login.§1t5343s0§(0);
               }
               break;
            case "1":
               if(§1t1523s0§.§1t9497s0§ || §1t1523s0§.§1t9498s0§)
               {
                  §1t7017s0§.instance.login.§1t5343s0§(5);
               }
               else
               {
                  §1t7017s0§.instance.login.§1t5343s0§(1);
               }
               break;
            case "2":
               if(§1t1523s0§.§1t9497s0§ || §1t1523s0§.§1t9498s0§)
               {
                  return;
               }
               §1t7017s0§.instance.login.§1t5343s0§(2);
               break;
            case "4":
               §1t7017s0§.instance.login.§1t5343s0§(4);
               break;
            case "5":
               §1t7017s0§.instance.login.§1t5343s0§(5);
         }
      }
      
      internal function §1t1855s0§(param1:IOErrorEvent) : void
      {
         if(!§1t7017s0§.instance.login.visible)
         {
            §1t7017s0§.instance.§1t7030s0§();
         }
         §1t7017s0§.instance.login.§1t5343s0§(3);
      }
      
      public function §1t1856s0§() : *
      {
         var _loc1_:URLRequest = null;
         var _loc2_:URLLoader = null;
         var _loc3_:URLVariables = null;
         if(!this.§1t1833s0§)
         {
            _loc1_ = new URLRequest(this.server + "logout.php");
            _loc2_ = new URLLoader();
            _loc2_.dataFormat = URLLoaderDataFormat.VARIABLES;
            _loc3_ = new URLVariables();
            _loc3_.charname = §1t1523s0§.charname;
            _loc1_.data = _loc3_;
            _loc1_.method = URLRequestMethod.POST;
            _loc2_.load(_loc1_);
         }
         this.§1t2004s0§();
         this.§1t1834s0§ = false;
      }
      
      public function §1t1857s0§(param1:String, param2:String, param3:String, param4:String = "") : *
      {
         var _loc5_:URLRequest = new URLRequest(this.server + "registeruser.php");
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc7_:URLVariables = new URLVariables();
         _loc7_.username = param1;
         _loc7_.password = param2;
         _loc7_.email = param3;
         _loc7_.facebookid = param4;
         if(this.debug)
         {
            _loc7_.debug = 1;
         }
         _loc5_.data = _loc7_;
         _loc5_.method = URLRequestMethod.POST;
         _loc6_.addEventListener(Event.COMPLETE,this.§1t1858s0§,false,0,true);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1859s0§,false,0,true);
         _loc6_.load(_loc5_);
      }
      
      internal function §1t1858s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         switch(_loc3_.status)
         {
            case "0":
               §1t7017s0§.instance.register.§1t5343s0§(0);
               break;
            case "1":
               §1t7017s0§.instance.register.§1t5343s0§(1);
               break;
            case "2":
               §1t7017s0§.instance.register.§1t5343s0§(2);
               break;
            case "3":
               §1t7017s0§.instance.register.§1t5343s0§(3);
               break;
            case "4":
               §1t7017s0§.instance.register.§1t5343s0§(4);
         }
      }
      
      internal function §1t1859s0§(param1:IOErrorEvent) : void
      {
         §1t7017s0§.instance.register.§1t5343s0§(5);
      }
      
      public function §1t1860s0§(param1:String) : *
      {
         var _loc2_:URLRequest = new URLRequest(this.server + "getemail.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.id = param1;
         if(this.debug)
         {
            _loc4_.debug = 1;
         }
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1861s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1862s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1861s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         switch(_loc3_.status)
         {
            case "0":
               §1t7017s0§.instance.edit.gotEmail(_loc3_.email);
               break;
            case "1":
               §1t7017s0§.instance.edit.back(null);
         }
      }
      
      internal function §1t1862s0§(param1:IOErrorEvent) : void
      {
         §1t7017s0§.instance.edit.back(null);
      }
      
      public function §1t1863s0§(param1:String, param2:String, param3:String) : *
      {
         var _loc4_:URLRequest = new URLRequest(this.server + "edituser.php");
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc6_:URLVariables = new URLVariables();
         _loc6_.username = param1;
         _loc6_.password = param2;
         _loc6_.email = param3;
         _loc6_.debug = 1;
         _loc4_.data = _loc6_;
         _loc4_.method = URLRequestMethod.POST;
         _loc5_.addEventListener(Event.COMPLETE,this.§1t1864s0§,false,0,true);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1865s0§,false,0,true);
         _loc5_.load(_loc4_);
      }
      
      internal function §1t1864s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         switch(_loc3_.status)
         {
            case "0":
               §1t7017s0§.instance.edit.§1t5343s0§(0);
               break;
            case "1":
               §1t7017s0§.instance.edit.§1t5343s0§(1);
               break;
            case "2":
               §1t7017s0§.instance.edit.§1t5343s0§(2);
               break;
            case "3":
               §1t7017s0§.instance.edit.§1t5343s0§(3);
               break;
            case "4":
               §1t7017s0§.instance.edit.§1t5343s0§(4);
         }
      }
      
      internal function §1t1865s0§(param1:IOErrorEvent) : void
      {
         §1t7017s0§.instance.edit.§1t5343s0§(5);
      }
      
      public function §1t1866s0§(param1:String) : *
      {
         var _loc2_:URLRequest = new URLRequest(this.server + "sendverify.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.email = param1;
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1867s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1868s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1867s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         switch(_loc3_.status)
         {
            case "0":
               §1t7017s0§.instance.resend.§1t5343s0§(0);
               break;
            case "1":
               §1t7017s0§.instance.resend.§1t5343s0§(1);
               break;
            case "2":
               §1t7017s0§.instance.resend.§1t5343s0§(2);
         }
      }
      
      internal function §1t1868s0§(param1:IOErrorEvent) : void
      {
         §1t7017s0§.instance.resend.§1t5343s0§(3);
      }
      
      public function §1t1869s0§(param1:String) : *
      {
         if(this.§1t1833s0§)
         {
            this.§1t1942s0§();
            this.§1t2008s0§();
            this.§1t1837s0§ = param1 + ",1";
            §1t7017s0§.instance.charcreate.§1t5343s0§(0);
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "createcharacter.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.charname = param1;
         _loc4_.magicnum = this.magicnum;
         _loc4_.stratusid = "12345";
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1870s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1871s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1870s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               this.§1t1942s0§();
               this.§1t1837s0§ = _loc3_.chars;
               §1t7017s0§.instance.charcreate.§1t5343s0§(0);
               break;
            case "1":
               §1t7017s0§.instance.charcreate.§1t5343s0§(1);
               break;
            case "2":
               §1t7017s0§.instance.charcreate.§1t5343s0§(2);
               break;
            case "3":
               §1t7017s0§.instance.charcreate.§1t5343s0§(3);
               break;
            case "4":
               §1t7017s0§.instance.charcreate.§1t5343s0§(4);
         }
      }
      
      internal function §1t1871s0§(param1:IOErrorEvent) : void
      {
         §1t7017s0§.instance.charcreate.§1t5343s0§(5);
      }
      
      public function §1t1872s0§(param1:String) : *
      {
         this.§1t2002s0§(param1);
         if(this.§1t1833s0§)
         {
            this.§1t2009s0§();
            this.§1t1837s0§ = "";
            §1t7017s0§.instance.charselect.chardeleteform.§1t5343s0§(0);
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "deletecharacter.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.charname = param1;
         _loc4_.magicnum = this.magicnum;
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1873s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1874s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1873s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               this.§1t1837s0§ = _loc3_.chars;
               §1t7017s0§.instance.charselect.chardeleteform.§1t5343s0§(0);
               break;
            case "1":
               §1t7017s0§.instance.charselect.chardeleteform.§1t5343s0§(1);
               break;
            case "2":
               §1t7017s0§.instance.charselect.chardeleteform.§1t5343s0§(2);
               break;
            case "3":
               §1t7017s0§.instance.charselect.chardeleteform.§1t5343s0§(3);
         }
      }
      
      internal function §1t1874s0§(param1:IOErrorEvent) : void
      {
         §1t7017s0§.instance.charselect.chardeleteform.§1t5343s0§(4);
      }
      
      public function §1t1875s0§(param1:int) : *
      {
         var _loc2_:URLRequest = new URLRequest(this.server + "whoishere.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.node = param1.toString();
         _loc4_.magicnum = this.magicnum;
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1876s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1877s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1876s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1877s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1878s0§() : *
      {
         if(this.§1t1833s0§)
         {
            §1t5565s0§.instance.§1t3388s0§("");
            return;
         }
         var _loc1_:URLRequest = new URLRequest(this.server + "getopponents.php");
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc3_:URLVariables = new URLVariables();
         _loc3_.charname = §1t1523s0§.charname;
         _loc3_.lvl = §1t1523s0§.§1t9727s0§();
         _loc3_.magicnum = this.magicnum;
         if(this.debug)
         {
            _loc3_.debug = 1;
         }
         _loc1_.data = _loc3_;
         _loc1_.method = URLRequestMethod.POST;
         _loc2_.addEventListener(Event.COMPLETE,this.§1t1879s0§,false,0,true);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1880s0§,false,0,true);
         _loc2_.load(_loc1_);
      }
      
      internal function §1t1879s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t5565s0§.instance.§1t3388s0§(_loc3_.chars);
               break;
            case "1":
               §1t5565s0§.instance.§1t5026s0§(null);
               break;
            case "2":
               §1t5565s0§.instance.§1t5026s0§(null);
         }
      }
      
      internal function §1t1880s0§(param1:IOErrorEvent) : void
      {
         §1t5565s0§.instance.§1t5026s0§(null);
      }
      
      public function §1t1881s0§(param1:String) : *
      {
         var _loc2_:URLRequest = new URLRequest(this.server + "getopponentdata.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.charname = param1;
         _loc4_.magicnum = this.magicnum;
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1882s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1883s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1882s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t5565s0§.instance.§1t5595s0§(_loc3_.playerstats,_loc3_.skillstats,_loc3_.stratusid,int(_loc3_.lastping),_loc3_.taunt);
               break;
            case "1":
               §1t5565s0§.instance.§1t5026s0§(null);
               break;
            case "2":
               §1t5565s0§.instance.§1t5026s0§(null);
         }
      }
      
      internal function §1t1883s0§(param1:IOErrorEvent) : void
      {
         §1t5565s0§.instance.§1t5026s0§(null);
      }
      
      public function §1t1884s0§(param1:int = 0, param2:Boolean = false) : *
      {
         var _loc3_:URLRequest = new URLRequest(this.server + "getleaderboards.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.page = param1;
         _loc5_.magicnum = this.magicnum;
         if(param2)
         {
            _loc5_.weekly = "1";
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1885s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1886s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1885s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               if(§1t1540s0§.§1t10012s0§())
               {
                  §1t6073s0§.instance.§1t5560s0§(_loc3_.chars);
               }
               else
               {
                  §1t5565s0§.instance.§1t5560s0§(_loc3_.chars);
               }
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1886s0§(param1:IOErrorEvent) : void
      {
         if(§1t1540s0§.§1t10012s0§())
         {
            §1t6073s0§.instance.ioError();
         }
         else
         {
            §1t5565s0§.instance.ioError();
         }
      }
      
      public function §1t1887s0§(param1:String, param2:String, param3:String, param4:int, param5:Boolean) : *
      {
         if(param3 == "" && param4 == 0)
         {
            return;
         }
         var _loc6_:URLRequest = new URLRequest(this.server + "giveitem.php");
         var _loc7_:URLLoader = new URLLoader();
         _loc7_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc8_:URLVariables = new URLVariables();
         _loc8_.receiver = param1;
         _loc8_.giver = param2;
         _loc8_.items = param3;
         _loc8_.coins = param4;
         _loc8_.magicnum = this.magicnum;
         this.§1t1888s0§ = param1;
         _loc6_.data = _loc8_;
         _loc6_.method = URLRequestMethod.POST;
         _loc7_.addEventListener(Event.COMPLETE,this.§1t1889s0§,false,0,true);
         _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1890s0§,false,0,true);
         _loc7_.load(_loc6_);
      }
      
      internal function §1t1889s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t251s0§.instance.§1t3526s0§(this.§1t1888s0§);
               break;
            case "1":
            case "2":
            case "3":
         }
      }
      
      internal function §1t1890s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1891s0§() : *
      {
         var _loc1_:URLRequest = new URLRequest(this.server + "getnotifications.php");
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc3_:URLVariables = new URLVariables();
         _loc3_.magicnum = this.magicnum;
         _loc3_.charname = §1t1523s0§.charname;
         _loc1_.data = _loc3_;
         _loc1_.method = URLRequestMethod.POST;
         _loc2_.addEventListener(Event.COMPLETE,this.§1t1892s0§,false,0,true);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1893s0§,false,0,true);
         _loc2_.load(_loc1_);
      }
      
      internal function §1t1892s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               if(§1t1523s0§.§1t9379s0§ == "")
               {
                  §1t1523s0§.§1t9379s0§ = _loc3_.notif;
               }
               else
               {
                  §1t1523s0§.§1t9379s0§ = §1t1523s0§.§1t9379s0§ + "^" + _loc3_.notif;
               }
               if(§1t1540s0§.§1t9550s0§() && !§1t406s0§.instance.§1t6475s0§.visible && !§1t406s0§.instance.§1t6482s0§.visible)
               {
                  §1t1523s0§.§1t9742s0§();
               }
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1893s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1894s0§(param1:String, param2:String) : *
      {
         var _loc3_:URLRequest = new URLRequest(this.server + "duelend.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.winner = param1;
         _loc5_.loser = param2;
         _loc5_.magicnum = this.magicnum;
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1895s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1896s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1895s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1896s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1897s0§() : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc1_:URLRequest = new URLRequest(this.server + "/war/getclanmembercount.php");
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc3_:URLVariables = new URLVariables();
         _loc3_.magicnum = this.magicnum;
         if(this.debug)
         {
            _loc3_.debug = 1;
         }
         _loc1_.data = _loc3_;
         _loc1_.method = URLRequestMethod.POST;
         _loc2_.addEventListener(Event.COMPLETE,this.§1t1898s0§,false,0,true);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1899s0§,false,0,true);
         _loc2_.load(_loc1_);
      }
      
      internal function §1t1898s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6482s0§.§1t8002s0§.§1t7736s0§(_loc3_.red,_loc3_.green,_loc3_.blue,_loc3_.yellow);
               break;
            case "1":
               §1t406s0§.instance.§1t6482s0§.loading.visible = false;
               break;
            case "2":
               §1t406s0§.instance.§1t6482s0§.loading.visible = false;
         }
      }
      
      internal function §1t1899s0§(param1:IOErrorEvent) : void
      {
         §1t406s0§.instance.§1t6482s0§.loading.visible = false;
      }
      
      public function §1t1900s0§(param1:int, param2:Boolean = true) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "/war/getwarmaps.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.magicnum = this.magicnum;
         _loc5_.charid = §1t1523s0§.id;
         _loc5_.side = param1;
         if(param2)
         {
            _loc5_.getworld = 1;
         }
         else
         {
            _loc5_.getworld = 0;
         }
         if(this.debug)
         {
            _loc5_.debug = 1;
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1901s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1902s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1901s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6482s0§.§1t7977s0§(_loc3_.§1t11505s0§,_loc3_.sentry,_loc3_.activebattles,_loc3_.nextupdate,_loc3_[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9041s0§)]);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1902s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1903s0§(param1:int, param2:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "/war/getwarhex.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.magicnum = this.magicnum;
         _loc5_.map = param1;
         _loc5_.side = param2;
         if(this.debug)
         {
            _loc5_.debug = 1;
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1904s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1905s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1904s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6482s0§.§1t8018s0§(_loc3_.hex,_loc3_.tdata);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1905s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1906s0§(param1:int, param2:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "/war/warmessage.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.magicnum = this.magicnum;
         _loc5_.map = param1;
         _loc5_.side = param2;
         _loc5_.op = "get";
         if(this.debug)
         {
            _loc5_.debug = 1;
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1907s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1908s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1907s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6482s0§.§1t8003s0§.msgBoard.§1t6332s0§(_loc3_.msg);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1908s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1909s0§(param1:int, param2:int, param3:int, param4:String, param5:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc6_:URLRequest = new URLRequest(this.server + "/war/warmessage.php");
         var _loc7_:URLLoader = new URLLoader();
         _loc7_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc8_:URLVariables = new URLVariables();
         _loc8_.magicnum = this.magicnum;
         _loc8_.map = param1;
         _loc8_.side = param2;
         _loc8_.charside = param3;
         _loc8_.charname = param4;
         _loc8_.msg = param5;
         _loc8_.op = "add";
         if(this.debug)
         {
            _loc8_.debug = 1;
         }
         _loc6_.data = _loc8_;
         _loc6_.method = URLRequestMethod.POST;
         _loc7_.addEventListener(Event.COMPLETE,this.§1t1910s0§,false,0,true);
         _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1911s0§,false,0,true);
         _loc7_.load(_loc6_);
      }
      
      internal function §1t1910s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1911s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1912s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc5_:URLRequest = new URLRequest(this.server + "/war/getwarhexdata.php");
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc7_:URLVariables = new URLVariables();
         _loc7_.magicnum = this.magicnum;
         _loc7_.map = param1;
         _loc7_.x = param2;
         _loc7_.y = param3;
         _loc7_.side = param4;
         if(this.debug)
         {
            _loc7_.debug = 1;
         }
         _loc5_.data = _loc7_;
         _loc5_.method = URLRequestMethod.POST;
         _loc6_.addEventListener(Event.COMPLETE,this.§1t1913s0§,false,0,true);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1914s0§,false,0,true);
         _loc6_.load(_loc5_);
      }
      
      internal function §1t1913s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7866s0§(_loc3_.hex,_loc3_.sentry);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1914s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1915s0§(param1:int, param2:int, param3:int, param4:int, param5:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc6_:URLRequest = new URLRequest(this.server + "/war/warsentry.php");
         var _loc7_:URLLoader = new URLLoader();
         _loc7_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc8_:URLVariables = new URLVariables();
         _loc8_.magicnum = this.magicnum;
         _loc8_.map = param1;
         _loc8_.side = param2;
         _loc8_.charid = param5;
         _loc8_.x = param3;
         _loc8_.y = param4;
         _loc8_.op = "add";
         if(this.debug)
         {
            _loc8_.debug = 1;
         }
         _loc6_.data = _loc8_;
         _loc6_.method = URLRequestMethod.POST;
         _loc7_.addEventListener(Event.COMPLETE,this.§1t1916s0§,false,0,true);
         _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1917s0§,false,0,true);
         _loc7_.load(_loc6_);
      }
      
      internal function §1t1916s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1917s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1918s0§(param1:int, param2:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "/war/warsentry.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.magicnum = this.magicnum;
         _loc5_.charid = param2;
         _loc5_.op = "del";
         if(this.debug)
         {
            _loc5_.debug = 1;
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1919s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1920s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1919s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1920s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1921s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc5_:URLRequest = new URLRequest(this.server + "/war/getwarenemysentry.php");
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc7_:URLVariables = new URLVariables();
         _loc7_.magicnum = this.magicnum;
         _loc7_.map = param1;
         _loc7_.side = param4;
         _loc7_.x = param2;
         _loc7_.y = param3;
         if(this.debug)
         {
            _loc7_.debug = 1;
         }
         _loc5_.data = _loc7_;
         _loc5_.method = URLRequestMethod.POST;
         _loc6_.addEventListener(Event.COMPLETE,this.§1t1922s0§,false,0,true);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1923s0§,false,0,true);
         _loc6_.load(_loc5_);
      }
      
      internal function §1t1922s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7858s0§(_loc3_.char);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1923s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1924s0§(param1:int, param2:int, param3:int, param4:int, param5:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc6_:URLRequest = new URLRequest(this.server + "/war/setwarhex.php");
         var _loc7_:URLLoader = new URLLoader();
         _loc7_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc8_:URLVariables = new URLVariables();
         _loc8_.magicnum = this.magicnum;
         _loc8_.map = param1;
         _loc8_.x = param2;
         _loc8_.y = param3;
         _loc8_.side = param4;
         _loc8_.value = param5;
         if(this.debug)
         {
            _loc8_.debug = 1;
         }
         _loc6_.data = _loc8_;
         _loc6_.method = URLRequestMethod.POST;
         _loc7_.addEventListener(Event.COMPLETE,this.§1t1925s0§,false,0,true);
         _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1926s0§,false,0,true);
         _loc7_.load(_loc6_);
      }
      
      internal function §1t1925s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1926s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1927s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc5_:URLRequest = new URLRequest(this.server + "/war/startbuild.php");
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc7_:URLVariables = new URLVariables();
         _loc7_.magicnum = this.magicnum;
         _loc7_.map = param1;
         _loc7_.x = param2;
         _loc7_.y = param3;
         _loc7_.type = param4;
         if(this.debug)
         {
            _loc7_.debug = 1;
         }
         _loc5_.data = _loc7_;
         _loc5_.method = URLRequestMethod.POST;
         _loc6_.addEventListener(Event.COMPLETE,this.§1t1928s0§,false,0,true);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1929s0§,false,0,true);
         _loc6_.load(_loc5_);
      }
      
      internal function §1t1928s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1929s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1930s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc5_:URLRequest = new URLRequest(this.server + "/war/dobuild.php");
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc7_:URLVariables = new URLVariables();
         _loc7_.magicnum = this.magicnum;
         _loc7_.map = param1;
         _loc7_.x = param2;
         _loc7_.y = param3;
         _loc7_.cost = param4;
         if(this.debug)
         {
            _loc7_.debug = 1;
         }
         _loc5_.data = _loc7_;
         _loc5_.method = URLRequestMethod.POST;
         _loc6_.addEventListener(Event.COMPLETE,this.§1t1931s0§,false,0,true);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1932s0§,false,0,true);
         _loc6_.load(_loc5_);
      }
      
      internal function §1t1931s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1932s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1933s0§(param1:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "/logmessage.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.charname = §1t1523s0§.charname;
         _loc4_.msg = escape(param1);
         if(this.debug)
         {
            _loc4_.debug = 1;
         }
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1934s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1934s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1935s0§(param1:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "playerio/logtrade.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.charname = §1t1523s0§.charname;
         _loc4_.msg = param1;
         if(this.debug)
         {
            _loc4_.debug = 1;
         }
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1936s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1936s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1937s0§(param1:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "playerio/logtowerget.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.charname = §1t1523s0§.charname;
         _loc4_.msg = param1;
         if(this.debug)
         {
            _loc4_.debug = 1;
         }
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1938s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1938s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1939s0§(param1:String, param2:Boolean = false) : *
      {
         var _loc3_:URLRequest = null;
         var _loc4_:URLLoader = null;
         var _loc5_:URLVariables = null;
         §1t1523s0§.charname = param1;
         if(param2)
         {
            this.§1t1838s0§ = 0;
         }
         if(this.§1t1833s0§)
         {
            §1t1523s0§.§1t9585s0§();
            §1t70s0§.instance.§1t1125s0§(§1t1523s0§.§1t2218s0§(),false);
         }
         else
         {
            _loc3_ = new URLRequest(this.server + "loaddata.php");
            _loc4_ = new URLLoader();
            _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
            _loc5_ = new URLVariables();
            _loc5_.lastupdate = this.§1t1838s0§;
            _loc5_.charname = param1;
            _loc5_.magicnum = this.magicnum;
            if(§1t1523s0§.§1t9499s0§)
            {
               _loc5_.stratusid = §1t251s0§.§1t9190s0§().§1t2055s0§();
            }
            else
            {
               _loc5_.stratusid = "";
            }
            if(this.debug)
            {
               _loc5_.debug = 1;
            }
            _loc3_.data = _loc5_;
            _loc3_.method = URLRequestMethod.POST;
            _loc4_.addEventListener(Event.COMPLETE,this.§1t1940s0§,false,0,true);
            _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1941s0§,false,0,true);
            _loc4_.load(_loc3_);
         }
         this.§1t1528s0§();
      }
      
      internal function §1t1940s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               if(_loc3_.lastupdate == "")
               {
                  this.§1t1846s0§(0);
               }
               else
               {
                  this.§1t1846s0§(int(_loc3_.lastupdate));
               }
               §1t1523s0§.id = _loc3_.id;
               if(_loc3_.apupdate != "")
               {
                  §1t1523s0§.§1t9386s0§ = _loc3_.apupdate;
               }
               if(_loc3_.dtupdate != "")
               {
                  §1t1523s0§.§1t9387s0§ = _loc3_.dtupdate;
               }
               if(_loc3_.warupdate != "")
               {
                  §1t1523s0§.§1t9388s0§ = _loc3_.warupdate;
               }
               if(_loc3_.playerstats != null)
               {
                  §1t1523s0§.§1t1256s0§(_loc3_.playerstats);
               }
               if(_loc3_.equipment != null)
               {
                  §1t1523s0§.§1t1257s0§(_loc3_.equipment);
               }
               if(_loc3_.skillstats != null)
               {
                  §1t1523s0§.§1t9221s0§(_loc3_.skillstats);
               }
               if(_loc3_.skillslots != null)
               {
                  §1t1523s0§.§1t9735s0§(_loc3_.skillslots);
               }
               if(_loc3_.inventory != null)
               {
                  §1t1523s0§.§1t9737s0§(_loc3_.inventory);
               }
               if(_loc3_.stash != null)
               {
                  §1t1523s0§.§1t9739s0§(_loc3_.stash);
               }
               if(_loc3_.questitems != null)
               {
                  §1t1523s0§.§1t9744s0§(_loc3_.questitems);
               }
               if(_loc3_.intstats != null)
               {
                  §1t1523s0§.§1t9746s0§(_loc3_.intstats);
               }
               if(_loc3_.achievementstats != null)
               {
                  §1t1523s0§.§1t9750s0§(_loc3_.achievementstats);
               }
               if(_loc3_.booleanstats != null)
               {
                  §1t1523s0§.§1t9748s0§(_loc3_.booleanstats);
               }
               if(_loc3_.activequest != null)
               {
                  §1t1523s0§.§1t9753s0§(_loc3_.activequest);
               }
               if(_loc3_.completedquest != null)
               {
                  §1t1523s0§.§1t9757s0§(_loc3_.completedquest);
               }
               if(_loc3_.taunt != null)
               {
                  §1t1523s0§.§1t9758s0§(_loc3_.taunt);
               }
               if(_loc3_.rank != null)
               {
                  §1t1523s0§.rank = _loc3_.rank;
               }
               if(_loc3_.wins != null)
               {
                  §1t1523s0§.§1t7357s0§(§1t1523s0§.§1t9421s0§,_loc3_.wins);
               }
               if(_loc3_.bounty != null)
               {
                  §1t1523s0§.bounty = _loc3_.bounty;
               }
               if(_loc3_.notif != null)
               {
                  §1t1523s0§.§1t9379s0§ = _loc3_.notif;
               }
               if(_loc3_.friends != null)
               {
                  §1t1523s0§.§1t9760s0§(_loc3_.friends);
               }
               if(_loc3_.ignore != null)
               {
                  §1t1543s0§.§1t10254s0§(_loc3_.ignore);
               }
               if(_loc3_.purchases != null)
               {
                  §1t1523s0§.§1t9393s0§.§1t695s0§(_loc3_.purchases);
               }
               if(_loc3_.goldbought != null)
               {
                  §1t1523s0§.§1t9394s0§.§1t695s0§(_loc3_.goldbought);
               }
               §1t1523s0§.§1t9585s0§();
               §1t70s0§.instance.§1t1125s0§(§1t1523s0§.§1t2218s0§(),false);
               this.§1t2018s0§();
               break;
            case "1":
               §1t1540s0§.§1t10028s0§();
               break;
            case "2":
               §1t1540s0§.§1t10028s0§();
               break;
            case "3":
               §1t1540s0§.§1t10028s0§();
               §1t7017s0§.instance.§1t7034s0§();
         }
      }
      
      internal function §1t1941s0§(param1:IOErrorEvent) : void
      {
         §1t1540s0§.§1t10028s0§();
         §1t7017s0§.instance.§1t7034s0§();
      }
      
      public function §1t1942s0§() : *
      {
         this.§1t2001s0§();
         if(this.§1t1833s0§)
         {
            this.§1t1528s0§();
         }
         else
         {
            this.§1t1529s0§();
            this.§1t1946s0§(true);
         }
      }
      
      public function §1t1946s0§(param1:Boolean = false) : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = undefined;
         var _loc4_:URLRequest = null;
         var _loc5_:URLLoader = null;
         var _loc6_:URLVariables = null;
         if(!this.§1t2019s0§())
         {
            §1t406s0§.instance.§1t6637s0§();
            return;
         }
         §1t1523s0§.§1t9557s0§();
         this.§1t2001s0§();
         if(this.§1t1833s0§)
         {
            this.§1t1528s0§();
         }
         else
         {
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < §1t9972s0§)
            {
               if(this.§1t1526s0§[_loc3_])
               {
                  _loc2_ = true;
               }
               _loc3_++;
            }
            if(!_loc2_)
            {
               return;
            }
            _loc4_ = new URLRequest(this.server + "savedata.php");
            _loc5_ = new URLLoader();
            _loc5_.dataFormat = URLLoaderDataFormat.VARIABLES;
            _loc6_ = new URLVariables();
            _loc6_.charname = §1t1523s0§.charname;
            _loc6_.magicnum = this.magicnum;
            if(this.§1t1526s0§[0])
            {
               _loc6_.playerlevel = §1t1523s0§.§1t9727s0§();
            }
            if(this.§1t1526s0§[1])
            {
               _loc6_.playerstats = §1t1523s0§.§1t9730s0§();
               _loc6_.battlestats = §1t1523s0§.§1t7366s0§();
            }
            if(this.§1t1526s0§[2])
            {
               _loc6_.equipment = §1t1523s0§.§1t9732s0§();
            }
            if(this.§1t1526s0§[3])
            {
               _loc6_.skillstats = §1t1523s0§.§1t9733s0§();
            }
            if(this.§1t1526s0§[4])
            {
               _loc6_.inventory = §1t1523s0§.§1t9736s0§();
            }
            if(this.§1t1526s0§[5])
            {
               _loc6_.questitems = §1t1523s0§.§1t9743s0§();
            }
            if(this.§1t1526s0§[6])
            {
               _loc6_.intstats = §1t1523s0§.§1t9745s0§();
            }
            if(this.§1t1526s0§[7])
            {
               _loc6_.booleanstats = §1t1523s0§.§1t9747s0§();
            }
            if(this.§1t1526s0§[8])
            {
               _loc6_.activequest = §1t1523s0§.§1t9751s0§();
            }
            if(this.§1t1526s0§[9])
            {
               _loc6_.completedquest = §1t1523s0§.§1t9756s0§();
            }
            if(this.§1t1526s0§[10])
            {
               _loc6_.playerlocation = §1t1523s0§.§1t2220s0§();
            }
            if(this.§1t1526s0§[11])
            {
               _loc6_.taunt = §1t1523s0§.§1t5608s0§();
            }
            if(this.§1t1526s0§[12])
            {
               _loc6_.friends = §1t1523s0§.§1t9759s0§();
            }
            if(this.§1t1526s0§[14])
            {
               _loc6_.skillslots = §1t1523s0§.§1t9734s0§();
            }
            if(this.§1t1526s0§[15])
            {
               _loc6_.side = §1t1523s0§.§1t7746s0§();
            }
            if(this.§1t1526s0§[16])
            {
               _loc6_.playerdan = §1t1523s0§.§1t9728s0§();
            }
            if(this.§1t1526s0§[17])
            {
               _loc6_.stash = §1t1523s0§.§1t9738s0§();
            }
            if(this.§1t1526s0§[19])
            {
               _loc6_.achievementstats = §1t1523s0§.§1t9749s0§();
            }
            if(this.§1t1526s0§[20])
            {
               _loc6_.ignore = §1t1543s0§.§1t10253s0§();
            }
            if(§1t1523s0§.§1t9386s0§ != this.§1t1943s0§)
            {
               _loc6_.apupdate = §1t1523s0§.§1t9386s0§;
               this.§1t1943s0§ = §1t1523s0§.§1t9386s0§;
            }
            if(§1t1523s0§.§1t9387s0§ != this.§1t1944s0§)
            {
               _loc6_.dtupdate = §1t1523s0§.§1t9387s0§;
               this.§1t1944s0§ = §1t1523s0§.§1t9387s0§;
            }
            if(§1t1523s0§.§1t9388s0§ != this.§1t1945s0§)
            {
               _loc6_.warupdate = §1t1523s0§.§1t9388s0§;
               this.§1t1945s0§ = §1t1523s0§.§1t9388s0§;
            }
            if(this.debug)
            {
               _loc6_.debug = 1;
            }
            this.§1t1528s0§();
            _loc4_.data = _loc6_;
            _loc4_.method = URLRequestMethod.POST;
            _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1947s0§,false,0,true);
            _loc5_.load(_loc4_);
            this.§1t1846s0§();
         }
      }
      
      internal function §1t1947s0§(param1:IOErrorEvent) : void
      {
         this.§1t1529s0§();
      }
      
      public function §1t1948s0§(param1:String, param2:String, param3:String, param4:int) : *
      {
         var _loc5_:URLRequest = new URLRequest(this.server + "savereplay.php");
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc7_:URLVariables = new URLVariables();
         _loc7_.name1 = param1;
         _loc7_.name2 = param2;
         _loc7_.magicnum = this.magicnum;
         _loc7_.data = param3;
         _loc7_.win = param4;
         if(this.debug)
         {
            _loc7_.debug = 1;
         }
         _loc5_.data = _loc7_;
         _loc5_.method = URLRequestMethod.POST;
         _loc6_.addEventListener(Event.COMPLETE,this.§1t1949s0§,false,0,true);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1950s0§,false,0,true);
         _loc6_.load(_loc5_);
      }
      
      internal function §1t1949s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t5186s0§.instance.§1t6230s0§();
               §1t5177s0§.instance.§1t6230s0§();
               if(§1t1523s0§.isFacebook())
               {
                  this.§1t2022s0§();
               }
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1950s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1951s0§(param1:String) : *
      {
         §1t1540s0§.§1t10035s0§();
         var _loc2_:URLRequest = new URLRequest(this.server + "getreplay.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.id = param1;
         if(this.debug)
         {
            _loc4_.debug = 1;
         }
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1953s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1954s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      public function §1t1952s0§(param1:String) : *
      {
         §1t1540s0§.§1t10035s0§();
         var _loc2_:URLRequest = new URLRequest(this.server + "getreplay.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.name = param1;
         if(this.debug)
         {
            _loc4_.debug = 1;
         }
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1953s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1954s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1953s0§(param1:Event) : void
      {
         §1t1540s0§.§1t10036s0§();
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t251s0§.instance.§1t3516s0§(_loc3_.data);
               break;
            case "1":
               if(§1t1540s0§.§1t10062s0§())
               {
                  this.§1t1951s0§("0");
               }
               break;
            case "2":
               if(§1t1540s0§.§1t10062s0§())
               {
                  this.§1t1951s0§("0");
               }
               break;
            case "3":
               if(§1t1540s0§.§1t10062s0§())
               {
                  this.§1t1951s0§("0");
               }
               else
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(484),§1t1521s0§.getString(5));
               }
         }
      }
      
      internal function §1t1954s0§(param1:IOErrorEvent) : void
      {
         §1t1540s0§.§1t10036s0§();
      }
      
      public function §1t1955s0§(param1:int, param2:int) : *
      {
         §1t406s0§.instance.§1t6489s0§.§1t5823s0§(param1,param2);
         if(§1t1523s0§.§1t9501s0§ || this.§1t1833s0§)
         {
            return;
         }
         if(param1 == 50005 || param1 == 50006)
         {
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "updateglobalvar.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.charid = §1t1523s0§.id;
         _loc5_.magicnum = this.magicnum;
         _loc5_.varid = param1;
         _loc5_.value = param2;
         if(this.debug)
         {
            _loc5_.debug = 1;
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1956s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1957s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1956s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1957s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1958s0§(param1:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "getglobalvar.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.varid = param1;
         if(this.debug)
         {
            _loc4_.debug = 1;
         }
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1959s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1960s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1959s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1960s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1961s0§(param1:int) : *
      {
         var _loc2_:Point = §1t70s0§.instance.§1t1133s0§(§1t123s0§.instance.§1t1563s0§);
         var _loc3_:int = §1t1523s0§.§1t7746s0§();
         §1t406s0§.instance.§1t6489s0§.§1t1961s0§(param1,_loc3_,_loc2_.x,_loc2_.y);
         if(§1t1523s0§.§1t9501s0§ || this.§1t1833s0§ || §1t70s0§.instance.§1t1140s0§(_loc2_.x << 12 | _loc2_.y))
         {
            return;
         }
         var _loc4_:URLRequest = new URLRequest(this.server + "/town/updatetownprosperity.php");
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc6_:URLVariables = new URLVariables();
         _loc6_.charid = §1t1523s0§.id;
         _loc6_.magicnum = this.magicnum;
         _loc6_.tx = _loc2_.x;
         _loc6_.ty = _loc2_.y;
         _loc6_.side = _loc3_;
         _loc6_.value = param1;
         if(this.debug)
         {
            _loc6_.debug = 1;
         }
         _loc4_.data = _loc6_;
         _loc4_.method = URLRequestMethod.POST;
         _loc5_.addEventListener(Event.COMPLETE,this.§1t1962s0§,false,0,true);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1963s0§,false,0,true);
         _loc5_.load(_loc4_);
      }
      
      internal function §1t1962s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1963s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1964s0§(param1:int, param2:int, param3:String = "") : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc4_:URLRequest = new URLRequest(this.server + "/town/createtown.php");
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc6_:URLVariables = new URLVariables();
         _loc6_.charid = §1t1523s0§.id;
         _loc6_.magicnum = this.magicnum;
         _loc6_.x = param1;
         _loc6_.y = param2;
         _loc6_.name = param3;
         _loc6_.founder = §1t1523s0§.charname;
         _loc6_.side = §1t1523s0§.§1t7746s0§();
         if(this.debug)
         {
            _loc6_.debug = 1;
         }
         _loc4_.data = _loc6_;
         _loc4_.method = URLRequestMethod.POST;
         _loc5_.addEventListener(Event.COMPLETE,this.§1t1965s0§,false,0,true);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1966s0§,false,0,true);
         _loc5_.load(_loc4_);
      }
      
      internal function §1t1965s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
      }
      
      internal function §1t1966s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1967s0§(param1:int, param2:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "/town/gettowndata.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.magicnum = this.magicnum;
         _loc5_.x = param1;
         _loc5_.y = param2;
         if(this.debug)
         {
            _loc5_.debug = 1;
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1968s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1969s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1968s0§(param1:Event) : void
      {
         var _loc4_:Point = null;
         var _loc5_:§1t71s0§ = null;
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               _loc4_ = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
               _loc5_ = §1t70s0§.instance.§1t1126s0§(_loc4_.x,_loc4_.y,true);
               _loc5_.§1t1336s0§(_loc3_.data,null);
               _loc5_.§1t1338s0§();
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1969s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1970s0§(param1:int, param2:int, param3:int, param4:int, param5:String, param6:Boolean) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc7_:URLRequest = new URLRequest(this.server + "/war/spawnpointcreate.php");
         var _loc8_:URLLoader = new URLLoader();
         _loc8_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc9_:URLVariables = new URLVariables();
         _loc9_.magicnum = this.magicnum;
         _loc9_.x = param3;
         _loc9_.y = param4;
         _loc9_.side = param2;
         _loc9_.mapid = param1;
         _loc9_.cp = param5;
         _loc9_.§1t1295s0§ = param6;
         if(this.debug)
         {
            _loc9_.debug = 1;
         }
         _loc7_.data = _loc9_;
         _loc7_.method = URLRequestMethod.POST;
         _loc8_.addEventListener(Event.COMPLETE,this.§1t1971s0§,false,0,true);
         _loc8_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1972s0§,false,0,true);
         _loc8_.load(_loc7_);
      }
      
      internal function §1t1971s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
            case "1":
            case "2":
         }
         §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7878s0§(_loc3_.status);
      }
      
      internal function §1t1972s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1973s0§(param1:int, param2:int, param3:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc4_:URLRequest = new URLRequest(this.server + "/war/spawnpointdestroy.php");
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc6_:URLVariables = new URLVariables();
         _loc6_.magicnum = this.magicnum;
         _loc6_.x = param2;
         _loc6_.y = param3;
         _loc6_.mapid = param1;
         if(this.debug)
         {
            _loc6_.debug = 1;
         }
         _loc4_.data = _loc6_;
         _loc4_.method = URLRequestMethod.POST;
         _loc5_.addEventListener(Event.COMPLETE,this.§1t1974s0§,false,0,true);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1975s0§,false,0,true);
         _loc5_.load(_loc4_);
      }
      
      internal function §1t1974s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7878s0§(10);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1975s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1126s0§(param1:int, param2:int) : *
      {
         if(this.§1t1833s0§)
         {
            §1t70s0§.instance.§1t1130s0§(param1,param2,"0");
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "/town/getterritorydata.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.magicnum = this.magicnum;
         _loc5_.x = param1;
         _loc5_.y = param2;
         if(this.debug)
         {
            _loc5_.debug = 1;
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1976s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1977s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1976s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t70s0§.instance.§1t1130s0§(_loc3_.x,_loc3_.y,_loc3_.data);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1977s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1978s0§(param1:int, param2:int) : *
      {
         if(this.§1t1833s0§)
         {
            §1t70s0§.instance.§1t1132s0§(param1,param2,"0|0|0|0|0|0|0|0|0");
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "/town/getterritorygroupdata.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.magicnum = this.magicnum;
         _loc5_.x = param1;
         _loc5_.y = param2;
         if(this.debug)
         {
            _loc5_.debug = 1;
         }
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.addEventListener(Event.COMPLETE,this.§1t1979s0§,false,0,true);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1980s0§,false,0,true);
         _loc4_.load(_loc3_);
      }
      
      internal function §1t1979s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t70s0§.instance.§1t1132s0§(_loc3_.x,_loc3_.y,_loc3_.data);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1980s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1982s0§(param1:String, param2:Boolean = false, param3:Boolean = false) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         if(this.§1t1981s0§)
         {
            return;
         }
         §1t406s0§.instance.§1t6636s0§(5000);
         var _loc4_:URLRequest = new URLRequest(this.server + "rh.php");
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc6_:URLVariables = new URLVariables();
         _loc6_.magicnum = this.magicnum;
         _loc6_.charname = §1t1523s0§.charname;
         _loc4_.data = _loc6_;
         _loc4_.method = URLRequestMethod.POST;
         _loc5_.addEventListener(Event.COMPLETE,this.§1t1983s0§,false,0,true);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1984s0§,false,0,true);
         _loc5_.load(_loc4_);
      }
      
      internal function §1t1983s0§(param1:Event) : void
      {
         this.§1t1981s0§ = true;
      }
      
      internal function §1t1984s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1985s0§(param1:int, param2:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc3_:URLRequest = new URLRequest(this.server + "/playerio/reportgotgold.php");
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.charname = §1t1523s0§.charname;
         _loc5_.num = param1;
         _loc5_.method = param2;
         _loc5_.level = §1t1523s0§.getLevel() + §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) * 80;
         _loc5_.pubid = §1t1540s0§.§1t10072s0§();
         _loc3_.data = _loc5_;
         _loc3_.method = URLRequestMethod.POST;
         _loc4_.load(_loc3_);
      }
      
      public function §1t1986s0§(param1:int, param2:String, param3:int) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc4_:URLRequest = new URLRequest(this.server + "reportpremiumbuy.php");
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc6_:URLVariables = new URLVariables();
         _loc6_.magicnum = this.magicnum;
         _loc6_.charname = §1t1523s0§.charname;
         _loc6_.id = param1;
         _loc6_.str = param2;
         _loc4_.data = _loc6_;
         _loc4_.method = URLRequestMethod.POST;
         _loc5_.addEventListener(Event.COMPLETE,this.§1t1987s0§,false,0,true);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1988s0§,false,0,true);
         _loc5_.load(_loc4_);
      }
      
      internal function §1t1987s0§(param1:Event) : void
      {
      }
      
      internal function §1t1988s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1989s0§() : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc1_:URLRequest = new URLRequest(this.server + "getdiscount.php");
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc3_:URLVariables = new URLVariables();
         _loc3_.magicnum = this.magicnum;
         _loc1_.data = _loc3_;
         _loc1_.method = URLRequestMethod.POST;
         _loc2_.addEventListener(Event.COMPLETE,this.§1t1990s0§,false,0,true);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1991s0§,false,0,true);
         _loc2_.load(_loc1_);
      }
      
      internal function §1t1990s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6498s0§.§1t6711s0§(_loc3_.discount,_loc3_.expire);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1991s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1992s0§(param1:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "whois.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.charname = param1;
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1993s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1994s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1993s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t5239s0§(_loc3_.char + " is " + _loc3_.alts);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1994s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1995s0§(param1:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "changename.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.oldname = §1t1523s0§.charname;
         _loc4_.newname = param1;
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1996s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1997s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1996s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t6504s0§.§1t5327s0§();
               break;
            case "3":
               §1t406s0§.instance.§1t6504s0§.§1t5329s0§(3);
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t1997s0§(param1:IOErrorEvent) : void
      {
      }
      
      public function §1t1998s0§(param1:String) : *
      {
         if(this.§1t1833s0§)
         {
            return;
         }
         var _loc2_:URLRequest = new URLRequest(this.server + "getplayerlocation.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.magicnum = this.magicnum;
         _loc4_.charname = param1;
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t1999s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t2000s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t1999s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(this.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = _loc3_.location;
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t2000s0§(param1:IOErrorEvent) : void
      {
      }
      
      internal function §1t2001s0§() : *
      {
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         _loc1_.data.playerlevel = §1t1523s0§.§1t9727s0§();
         _loc1_.data.dan = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§);
         _loc1_.data.purchases = §1t1523s0§.§1t9393s0§.§1t697s0§();
         _loc1_.data.saved = true;
         try
         {
            _loc1_.flush();
         }
         catch(error:Error)
         {
         }
         var _loc2_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§ + "_" + §1t1523s0§.charname);
         _loc2_.data.saved = true;
         _loc2_.data.equipment = §1t1523s0§.§1t9732s0§();
         _loc2_.data.playerlevel = §1t1523s0§.§1t9727s0§();
         try
         {
            _loc2_.flush();
         }
         catch(error:Error)
         {
         }
         this.§1t2008s0§();
      }
      
      internal function §1t2002s0§(param1:String) : *
      {
         var _loc2_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§ + "_" + param1);
         _loc2_.data.saved = false;
         _loc2_.data.§1t9386s0§ = "";
         _loc2_.data.§1t9387s0§ = "";
         _loc2_.data.§1t1838s0§ = "";
         _loc2_.data.playerLevel = "";
         _loc2_.data.§1t7315s0§ = "";
         _loc2_.data.equipment = "";
         _loc2_.data.§1t9367s0§ = "";
         _loc2_.data.§1t6928s0§ = "";
         _loc2_.data.inventory = "";
         _loc2_.data.stash = "";
         _loc2_.data.§1t9369s0§ = "";
         _loc2_.data.§1t9370s0§ = "";
         _loc2_.data.§1t9372s0§ = "";
         _loc2_.data.§1t9371s0§ = "";
         _loc2_.data.§1t9373s0§ = "";
         _loc2_.data.§1t9374s0§ = "";
         _loc2_.data.playerlocation = "";
         _loc2_.data.taunt = "";
         _loc2_.data.friends = "";
         try
         {
            _loc2_.flush();
         }
         catch(error:Error)
         {
         }
      }
      
      internal function §1t2003s0§(param1:String, param2:String) : *
      {
         if(param1 == "" || param1 == "guest" || param2 == "")
         {
            return;
         }
         var _loc3_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         _loc3_.data.saved = true;
         _loc3_.data.user = param1;
         _loc3_.data.pass = param2;
         try
         {
            _loc3_.flush();
         }
         catch(error:Error)
         {
         }
      }
      
      internal function §1t2004s0§() : *
      {
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         _loc1_.data.saved = true;
         _loc1_.data.user = "";
         _loc1_.data.pass = "";
         _loc1_.data.accesstoken = "";
         try
         {
            _loc1_.flush();
         }
         catch(error:Error)
         {
         }
      }
      
      public function §1t2005s0§() : *
      {
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         if(_loc1_.data.saved != true)
         {
            §1t1522s0§.§1t9307s0§();
            §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11340s0§);
            §1t1522s0§.§1t9308s0§();
            return false;
         }
         if(_loc1_.data.§1t1486s0§ != undefined)
         {
            §1t88s0§.instance.§1t1486s0§ = _loc1_.data.§1t1486s0§;
         }
         if(§1t88s0§.instance.§1t1486s0§)
         {
            §1t1522s0§.§1t9307s0§();
         }
         §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11340s0§);
         if(_loc1_.data.§1t1485s0§ != undefined)
         {
            §1t88s0§.instance.§1t1485s0§ = _loc1_.data.§1t1485s0§;
         }
         if(§1t88s0§.instance.§1t1485s0§)
         {
            §1t1522s0§.§1t9308s0§();
         }
         if(_loc1_.data.§1t9471s0§ != undefined)
         {
            §1t1523s0§.§1t9471s0§ = _loc1_.data.§1t9471s0§;
         }
         if(_loc1_.data.§1t9472s0§ != undefined)
         {
            §1t1523s0§.§1t9472s0§ = _loc1_.data.§1t9472s0§;
         }
         if(_loc1_.data.§1t9473s0§ != undefined)
         {
            §1t1523s0§.§1t9473s0§ = _loc1_.data.§1t9473s0§;
         }
         if(_loc1_.data.§1t9474s0§ != undefined)
         {
            §1t1523s0§.§1t9474s0§ = _loc1_.data.§1t9474s0§;
         }
         if(_loc1_.data.§1t9478s0§ != undefined)
         {
            §1t1523s0§.§1t9478s0§ = _loc1_.data.§1t9478s0§;
         }
      }
      
      public function §1t2006s0§() : Boolean
      {
         if(§1t1523s0§.§1t9510s0§)
         {
            return false;
         }
         if(§1t1523s0§.§1t9521s0§)
         {
            return false;
         }
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         if(_loc1_.data.saved != true)
         {
            return false;
         }
         if((_loc1_.data.playerlevel >= 10 || _loc1_.data.dan > 0) && _loc1_.data.purchases == 0)
         {
            return true;
         }
         return false;
      }
      
      public function §1t2007s0§() : Boolean
      {
         if(§1t1523s0§.§1t9502s0§)
         {
            return false;
         }
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         if(_loc1_.data.saved != true)
         {
            return false;
         }
         var _loc2_:String = _loc1_.data.user;
         var _loc3_:String = _loc1_.data.pass;
         if(_loc2_ != "" && _loc3_ != "")
         {
            this.login(_loc2_,_loc3_);
            return true;
         }
         return false;
      }
      
      internal function §1t2008s0§() : *
      {
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         _loc1_.data.saved = true;
         _loc1_.data.charname = §1t1523s0§.charname;
         try
         {
            _loc1_.flush();
         }
         catch(error:Error)
         {
         }
      }
      
      internal function §1t2009s0§() : *
      {
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         _loc1_.data.saved = true;
         _loc1_.data.charname = "";
         try
         {
            _loc1_.flush();
         }
         catch(error:Error)
         {
         }
      }
      
      internal function §1t2010s0§() : *
      {
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         _loc1_.data.saved = true;
         _loc1_.data.§1t1486s0§ = §1t88s0§.instance.§1t1486s0§;
         _loc1_.data.§1t1485s0§ = §1t88s0§.instance.§1t1485s0§;
         _loc1_.data.§1t9471s0§ = §1t1523s0§.§1t9471s0§;
         _loc1_.data.§1t9472s0§ = §1t1523s0§.§1t9472s0§;
         _loc1_.data.§1t9473s0§ = §1t1523s0§.§1t9473s0§;
         _loc1_.data.§1t4431s0§ = §1t1523s0§.§1t4431s0§;
         _loc1_.data.§1t9474s0§ = §1t1523s0§.§1t9474s0§;
         _loc1_.data.§1t9478s0§ = §1t1523s0§.§1t9478s0§;
         _loc1_.data.§1t9476s0§ = §1t1523s0§.§1t9476s0§;
         try
         {
            _loc1_.flush();
         }
         catch(error:Error)
         {
         }
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.OPTIONS);
      }
      
      internal function §1t2011s0§() : String
      {
         var sharedObject:SharedObject = null;
         var charname:String = null;
         try
         {
            sharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
            if(sharedObject.data.saved != true)
            {
               return "";
            }
            charname = sharedObject.data.charname;
            sharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§ + "_" + charname);
            if(sharedObject.data.saved != true)
            {
               return "";
            }
            return sharedObject.data.equipment;
         }
         catch(errObject:Error)
         {
            return "";
         }
      }
      
      internal function §1t2012s0§(param1:String) : *
      {
         var url:String = param1;
         var request:URLRequest = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
         }
      }
      
      internal function §1t2013s0§(param1:String) : *
      {
         var url:String = param1;
         var request:URLRequest = new URLRequest(url);
         try
         {
            navigateToURL(request);
         }
         catch(e:Error)
         {
         }
      }
      
      public function §1t2014s0§() : *
      {
         this.§1t2012s0§("http://www.explosivebarrel.com");
      }
      
      public function §1t2015s0§() : *
      {
         this.§1t2012s0§("http://forums.explosivebarrel.com/showthread.php?tid=86");
      }
      
      public function §1t2016s0§() : *
      {
         if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9277s0§)
         {
            this.§1t2012s0§("http://www.strawhatsamuraiduels.com/fr/");
         }
         else if(§1t1521s0§.getLanguage() == §1t1521s0§.§1t9279s0§)
         {
            this.§1t2012s0§("http://www.strawhatsamuraiduels.com/es/");
         }
         else
         {
            this.§1t2012s0§("http://www.strawhatsamuraiduels.com/");
         }
      }
      
      internal function §1t2018s0§() : *
      {
         if(§1t1540s0§.§1t10062s0§() || this.§1t1833s0§)
         {
            return;
         }
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§,"/");
         this.§1t2017s0§ = Math.random() * 10000;
         _loc1_.data.current = this.§1t2017s0§;
         try
         {
            _loc1_.flush();
         }
         catch(error:Error)
         {
         }
      }
      
      internal function §1t2019s0§() : Boolean
      {
         if(§1t1540s0§.§1t10062s0§() || this.§1t1833s0§)
         {
            return true;
         }
         if(§1t406s0§.instance == null)
         {
            return true;
         }
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§,"/");
         if(_loc1_.data.current == null)
         {
            return true;
         }
         return _loc1_.data.current == this.§1t2017s0§;
      }
      
      public function §1t2020s0§(param1:String) : *
      {
         var _loc2_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         _loc2_.data.saved = true;
         _loc2_.data.lang = param1;
         try
         {
            _loc2_.flush();
         }
         catch(error:Error)
         {
         }
      }
      
      public function §1t2021s0§() : String
      {
         var _loc1_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         if(_loc1_.data.lang == null)
         {
            return "";
         }
         return _loc1_.data.lang;
      }
      
      internal function §1t2022s0§() : *
      {
         ExternalInterface.call("shareDuelTVOnWall",§1t1523s0§.charname);
      }
      
      public function §1t2023s0§(param1:String, param2:String) : *
      {
      }
      
      public function §1t2024s0§() : *
      {
      }
      
      public function §1t2025s0§(param1:Array, param2:Array, param3:§1t139s0§) : *
      {
      }
      
      public function §1t2026s0§() : *
      {
         var _loc1_:URLRequest = new URLRequest(this.server + "hello.php");
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.load(_loc1_);
      }
   }
}

