package
{
   import Facebook.*;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.system.Security;
   import playerio.*;
   
   public class §1t3318s0§ extends §1t1832s0§
   {
      
      public static var instance:§1t3318s0§;
      
      public static var §1t12071s0§:Boolean = false;
      
      internal static var §1t12072s0§:int = 0;
      
      internal static var §1t12073s0§:int = 1;
      
      internal static var §1t12074s0§:int = 2;
      
      internal static var §1t12075s0§:int = 3;
      
      internal static var §1t12076s0§:int = 4;
      
      public static var §1t12077s0§:int = 32;
      
      internal const §1t3319s0§:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8938s0§);
      
      internal const §1t3320s0§:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t3320s0§);
      
      internal const §1t3321s0§:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t3321s0§);
      
      internal const §1t3322s0§:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t3322s0§);
      
      public var §1t3323s0§:String = this.§1t3321s0§;
      
      internal var client:§1t150s0§;
      
      internal var §1t3324s0§:§1t23s0§ = null;
      
      internal var §1t3325s0§:Boolean = false;
      
      internal var §1t3326s0§:Boolean = false;
      
      public var §1t3327s0§:Boolean = false;
      
      internal var §1t3328s0§:Boolean = false;
      
      internal var §1t3333s0§:String = "";
      
      internal var §1t3364s0§:int;
      
      internal var §1t3365s0§:int;
      
      internal var §1t3366s0§:int;
      
      internal var §1t3372s0§:int;
      
      internal var §1t3381s0§:Array;
      
      internal var §1t3384s0§:Array = null;
      
      internal var §1t3385s0§:int = 0;
      
      internal var §1t3395s0§:int = 0;
      
      internal var §1t3396s0§:int;
      
      internal var §1t3397s0§:Boolean;
      
      internal var §1t3398s0§:Boolean;
      
      internal var §1t3399s0§:Array;
      
      internal var §1t3410s0§:int = 5000;
      
      internal var §1t3413s0§:Array = new Array();
      
      internal var §1t3414s0§:Array = new Array();
      
      internal var §1t3415s0§:int = 0;
      
      internal var §1t3416s0§:int = 250;
      
      internal var §1t3418s0§:Array = new Array();
      
      internal var §1t3419s0§:int = 0;
      
      internal var §1t3431s0§:§1t998s0§ = new §1t998s0§();
      
      internal var §1t3438s0§:Array = new Array();
      
      internal var §1t3439s0§:Array = new Array();
      
      internal var §1t3440s0§:int = 0;
      
      internal var §1t3441s0§:int = 250;
      
      internal var §1t3443s0§:Array;
      
      internal var §1t3444s0§:int = 0;
      
      public var §1t3445s0§:int;
      
      internal var §1t3456s0§:Number = 0;
      
      internal var §1t3457s0§:Number = 0;
      
      internal var §1t3458s0§:Boolean = false;
      
      internal var §1t3459s0§:Boolean = false;
      
      internal var §1t3460s0§:Boolean = false;
      
      internal var §1t3461s0§:int = 0;
      
      public function §1t3318s0§()
      {
         super();
         server = §1t1523s0§.server;
         instance = this;
      }
      
      public function §1t3329s0§(param1:String) : String
      {
         if(§1t1523s0§.§1t9506s0§)
         {
            return §1t8210s0§.gameFS(this.§1t3323s0§).getUrl("/testres/" + param1);
         }
         return §1t8210s0§.gameFS(this.§1t3323s0§).getUrl("/res/" + param1);
      }
      
      public function §1t3330s0§() : String
      {
         if(§1t1523s0§.§1t9506s0§)
         {
            return §1t8210s0§.gameFS(this.§1t3323s0§).getUrl("/testlang/");
         }
         return §1t8210s0§.gameFS(this.§1t3323s0§).getUrl("/lang/");
      }
      
      public function §1t3331s0§(param1:String) : String
      {
         if(§1t1523s0§.§1t9506s0§)
         {
            return §1t8210s0§.gameFS(this.§1t3323s0§).getUrl("/testdata/" + param1);
         }
         return §1t8210s0§.gameFS(this.§1t3323s0§).getUrl("/data/" + param1);
      }
      
      public function §1t3332s0§(param1:String) : String
      {
         return §1t8210s0§.gameFS(this.§1t3323s0§).getUrl(param1);
      }
      
      override public function §1t1857s0§(param1:String, param2:String, param3:String, param4:String = "") : *
      {
         if(!this.§1t3325s0§)
         {
            this.§1t3334s0§(param1,param2,param3,param4);
            return;
         }
         var _loc5_:URLRequest = new URLRequest(server + "/playerio/registeruser.php");
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc7_:URLVariables = new URLVariables();
         _loc7_.username = param1;
         _loc7_.password = param2;
         _loc7_.email = param3;
         _loc7_.facebookid = param4;
         if(debug)
         {
            _loc7_.debug = 1;
         }
         _loc5_.data = _loc7_;
         _loc5_.method = URLRequestMethod.POST;
         _loc6_.addEventListener(Event.COMPLETE,this.§1t1858s0§,false,0,true);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,§1t1859s0§,false,0,true);
         _loc6_.load(_loc5_);
      }
      
      override internal function §1t1858s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         switch(_loc3_.status)
         {
            case "0":
               this.§1t3334s0§(§1t7017s0§.instance.register.usernamefield.text,§1t7017s0§.instance.register.§1t5647s0§.text,§1t7017s0§.instance.register.emailfield.text);
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
      
      public function §1t3334s0§(param1:String, param2:String, param3:String, param4:String = "") : *
      {
         this.§1t3333s0§ = param3;
         §1t8210s0§.quickConnect.simpleRegister(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,param1,param2,param3,null,null,null,null,this.§1t3335s0§,this.§1t3337s0§);
         username = param1;
      }
      
      internal function §1t3335s0§(param1:§1t150s0§) : *
      {
         var client:§1t150s0§ = param1;
         client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8949s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8950s0§),function(param1:§1t23s0§):*
         {
            var §1t15066s0§:Boolean;
            var o:§1t23s0§ = param1;
            if(o.motd != null && o.motd != "" && !§1t3317s0§.instance.§1t1833s0§)
            {
               §1t7017s0§.instance.§1t7043s0§(o.motd);
            }
            §1t15066s0§ = o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9041s0§)] != null && Boolean(o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9041s0§)]);
            if(§1t15066s0§)
            {
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(674));
               return;
            }
            if(o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9038s0§)] != null && int(o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9038s0§)] * 1000) > int(§1t1523s0§.§1t9323s0§ * 1000))
            {
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(646));
               return;
            }
            if(o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9000s0§)] != null && o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9000s0§)] > §1t1523s0§.§1t9324s0§)
            {
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(646));
               return;
            }
            if(§1t1524s0§.§1t9897s0§(o))
            {
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(11137));
               return;
            }
            if(o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9039s0§)] != null && o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9039s0§)] != "")
            {
               §1t1523s0§.§1t9514s0§ = o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9039s0§)];
            }
            if(o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9040s0§)] != null)
            {
               §1t1523s0§.§1t9515s0§ = o[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9040s0§)];
            }
            client.§1t729s0§.loadMyPlayerObject(function(param1:§1t23s0§):*
            {
               §1t3336s0§(param1,client);
            });
         });
      }
      
      internal function §1t3336s0§(param1:§1t23s0§, param2:§1t150s0§) : *
      {
         if(this.§1t3325s0§)
         {
            this.client = param2;
            §1t251s0§.§1t9190s0§().§1t3627s0§("saveemail",{
               "email":this.§1t3333s0§,
               "needverifyemail":"1"
            });
            §1t1866s0§(§1t7017s0§.instance.register.emailfield.text);
            §1t7017s0§.instance.register.§1t5343s0§(0);
         }
         else
         {
            this.§1t3359s0§(param2);
            §1t251s0§.§1t9190s0§().§1t3627s0§("saveemail",{
               "email":this.§1t3333s0§,
               "needverifyemail":"0"
            });
         }
      }
      
      internal function §1t3337s0§(param1:§1t250s0§) : *
      {
         var _loc2_:String = "Error";
         if(param1.captchaError != null)
         {
            _loc2_ = param1.captchaError;
         }
         else if(param1.emailError != null)
         {
            _loc2_ = param1.emailError;
         }
         else if(param1.passwordError != null)
         {
            _loc2_ = param1.passwordError;
         }
         else if(param1.usernameError != null)
         {
            _loc2_ = param1.usernameError;
         }
         §1t7017s0§.instance.register.§1t6149s0§(_loc2_);
         username = "";
      }
      
      public function §1t3338s0§(param1:String, param2:String, param3:String, param4:String, param5:String = "") : *
      {
         var charname:String = param1;
         var user:String = param2;
         var pass:String = param3;
         var email:String = param4;
         var facebookid:String = param5;
         §1t8210s0§.quickConnect.simpleRegister(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,user,pass,email,null,null,null,null,function(param1:§1t150s0§):*
         {
            §1t3318s0§.instance.client = param1;
            §1t1836s0§ = param1.connectUserId;
            §1t1834s0§ = true;
            username = user;
            §1t1523s0§.charname = charname;
            §1t251s0§.instance.§1t3627s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8951s0§),{
               "charname":charname,
               "type":"newera2_guest",
               "created":new Date().toUTCString(),
               "intstats":§1t1523s0§.§1t9745s0§(),
               "skillstats":§1t1523s0§.§1t9733s0§(),
               "equipment":§1t1523s0§.§1t9732s0§(),
               "playerstats":§1t1523s0§.§1t9730s0§(),
               "skillslots":§1t1523s0§.§1t9734s0§(),
               "email":email,
               "activequest":§1t1523s0§.§1t9751s0§(),
               "questitems":§1t1523s0§.§1t9743s0§(),
               "achievementstats":§1t1523s0§.§1t9749s0§(),
               "booleanstats":§1t1523s0§.§1t9747s0§(),
               "inventory":§1t1523s0§.§1t9736s0§(),
               "stash":§1t1523s0§.§1t9738s0§(),
               "playerlevel":§1t1523s0§.§1t9727s0§(),
               "completedquest":§1t1523s0§.§1t9756s0§()
            });
         },function(param1:§1t250s0§):*
         {
            var _loc2_:String = "Error";
            if(param1.captchaError != null)
            {
               _loc2_ = param1.captchaError;
            }
            else if(param1.emailError != null)
            {
               _loc2_ = param1.emailError;
            }
            else if(param1.passwordError != null)
            {
               _loc2_ = param1.passwordError;
            }
            else if(param1.usernameError != null)
            {
               _loc2_ = param1.usernameError;
            }
            §1t406s0§.instance.§1t6521s0§.§1t6149s0§(_loc2_);
         });
         username = user;
      }
      
      public function §1t3339s0§() : *
      {
         this.client.§1t729s0§.loadMyPlayerObject(function(param1:§1t23s0§):*
         {
            §1t3324s0§ = param1;
            §1t1833s0§ = false;
            §1t2018s0§();
            §1t3404s0§();
            §1t406s0§.instance.§1t6521s0§.§1t5343s0§(0);
         });
      }
      
      override public function login(param1:String, param2:String) : *
      {
         this.§1t3343s0§(param1,param2);
      }
      
      public function §1t3340s0§(param1:String) : *
      {
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         var _loc4_:URLLoader = null;
         if(!§1t1833s0§)
         {
            param1 = "UwAB_wAxBAEDhRtDbGgAeQQAUX3mJwgBAAAAAleAc2dpZF8wNDAxMDM4NTFiNDM2YzY4kvrsARwJV1Bva82yQxZeVrvt3GL4qHH5pENmolbKo3eLRQKTBrD3ug";
            _loc2_ = "http://api.playerio.com/clientintegrations/spilgames/auth?gameid=" + this.§1t3323s0§ + "&token=" + param1;
            _loc3_ = new URLRequest(_loc2_);
            _loc4_ = new URLLoader();
            _loc4_.addEventListener(Event.COMPLETE,this.§1t3341s0§,false,0,true);
            _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t3342s0§,false,0,true);
            _loc4_.load(_loc3_);
         }
      }
      
      internal function §1t3341s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:String = _loc2_.data;
         var _loc4_:Array = _loc3_.split(/\n/);
         var _loc5_:String = _loc4_[0];
         var _loc6_:String = _loc4_[1];
         §1t8210s0§.authenticate(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8940s0§),{
            "userId":_loc5_,
            "auth":_loc6_
         },null,this.§1t3344s0§,this.§1t3346s0§);
      }
      
      internal function §1t3342s0§(param1:Event) : void
      {
         §1t7017s0§.instance.login.§1t5343s0§(7);
      }
      
      public function §1t3343s0§(param1:String, param2:String) : *
      {
         if(!§1t1833s0§)
         {
            if(param1 == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8941s0§))
            {
               §1t7017s0§.instance.login.§1t6149s0§("The user does not exist");
               return;
            }
            §1t8210s0§.quickConnect.simpleConnect(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,param1,param2,this.§1t3344s0§,this.§1t3346s0§);
            username = param1;
         }
         else
         {
            §1t8210s0§.quickConnect.simpleConnect(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8941s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8942s0§),this.§1t3344s0§,this.§1t3346s0§);
         }
      }
      
      internal function §1t3344s0§(param1:§1t150s0§) : *
      {
         §1t1523s0§.facebookid = "";
         §1t1523s0§.§1t9378s0§ = "";
         if(§1t1523s0§.§1t9522s0§)
         {
            username = param1.connectUserId;
         }
         else if(§1t1523s0§.§1t9523s0§)
         {
            username = §1t49s0§.instance.username;
         }
         this.§1t3359s0§(param1);
      }
      
      public function §1t3345s0§() : §1t150s0§
      {
         return this.client;
      }
      
      internal function §1t3346s0§(param1:PlayerIOError) : *
      {
         if(!§1t7017s0§.instance.login.visible)
         {
            §1t7017s0§.instance.§1t7030s0§();
         }
         if(param1.message.indexOf("PlayerIOError") != -1)
         {
            §1t7017s0§.instance.login.§1t6149s0§(§1t1521s0§.getString(991));
         }
         else
         {
            §1t7017s0§.instance.login.§1t6149s0§(param1.message);
         }
         username = "";
      }
      
      public function §1t3347s0§(param1:Number, param2:String) : *
      {
         username = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8943s0§) + param1.toString();
         §1t8210s0§.quickConnect.kongregateConnect(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,param1.toString(),param2,this.§1t3344s0§,this.§1t3346s0§);
      }
      
      public function §1t3348s0§(param1:String, param2:String) : *
      {
         §1t8210s0§.authenticate(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8944s0§),{
            "userId":param1,
            "authToken":param2
         },null,this.§1t3344s0§,this.§1t3346s0§);
      }
      
      public function §1t3349s0§(param1:String) : *
      {
         §1t8210s0§.authenticate(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8945s0§),{"userToken":param1},null,this.§1t3344s0§,this.§1t3346s0§);
      }
      
      internal function §1t1787s0§() : *
      {
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1787s0§();
            return;
         }
         §1t8210s0§.quickConnect.facebookOAuthConnectPopup(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,"_blank",["publish_stream","offline_access"],null,function(param1:§1t150s0§, param2:String, param3:String):void
         {
            §1t1523s0§.facebookid = param3;
            var _loc4_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
            _loc4_.data.saved = true;
            _loc4_.data.accesstoken = param2;
            try
            {
               _loc4_.flush();
            }
            catch(error:Error)
            {
            }
            var _loc5_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8946s0§);
            FB.init({
               "access_token":param2,
               "app_id":_loc5_,
               "debug":false
            });
            §1t3353s0§(param1,param2);
         });
      }
      
      internal function §1t3350s0§(param1:String) : *
      {
         var access_token:String = param1;
         §1t8210s0§.quickConnect.facebookOAuthConnect(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,access_token,null,function(param1:§1t150s0§, param2:String):void
         {
            §1t1523s0§.facebookid = param2;
            var _loc3_:String = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8946s0§);
            FB.init({
               "access_token":access_token,
               "app_id":_loc3_,
               "debug":false
            });
            §1t3353s0§(param1,access_token);
         });
      }
      
      internal function §1t3351s0§() : *
      {
         if(!§1t7017s0§.instance.login.visible)
         {
            §1t7017s0§.instance.§1t7030s0§();
         }
         §1t2004s0§();
      }
      
      internal function §1t3352s0§(param1:String, param2:String, param3:Function, param4:Function) : *
      {
         var str:String = param1;
         var access_token:String = param2;
         var §1t9313s0§:Function = param3;
         var failCallback:Function = param4;
         var request:URLRequest = new URLRequest("https://graph.facebook.com/" + str + "&access_token=" + access_token);
         var loader:URLLoader = new URLLoader();
         request.method = URLRequestMethod.GET;
         loader.addEventListener(Event.COMPLETE,function(param1:Event):*
         {
            var _loc2_:URLLoader = URLLoader(param1.target);
            var _loc3_:Object = FBJSON.deserialize(_loc2_.data);
            §1t9313s0§(_loc3_);
         },false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,failCallback,false,0,true);
         loader.load(request);
      }
      
      internal function §1t3353s0§(param1:§1t150s0§, param2:String) : *
      {
         var client:§1t150s0§ = param1;
         var access_token:String = param2;
         this.§1t3352s0§("v2.2/me?fields=name",access_token,function(param1:Object):*
         {
            username = param1.name;
            §1t3354s0§(client,access_token);
         },function(param1:Event):*
         {
            §1t3351s0§();
         });
      }
      
      internal function §1t3354s0§(param1:§1t150s0§, param2:String) : *
      {
         var client:§1t150s0§ = param1;
         var access_token:String = param2;
         §1t7017s0§.instance.§1t7039s0§();
         §1t1523s0§.§1t9378s0§ = "";
         this.§1t3359s0§(client);
         this.§1t3352s0§("v2.2/me/friends?fields=first_name",access_token,this.§1t3355s0§,function(param1:Event):*
         {
            §1t1523s0§.§1t9378s0§ = "";
         });
      }
      
      internal function §1t3355s0§(param1:Object) : *
      {
         var fbnames:Array = null;
         var uid:String = null;
         var fbwinscallback:Function = null;
         var fbwinserror:Function = null;
         var §1t5103s0§:Object = param1;
         fbwinscallback = function(param1:Array):*
         {
            var _loc4_:§1t23s0§ = null;
            var _loc2_:int = int(param1.length);
            var _loc3_:String = "";
            var _loc5_:* = 0;
            while(_loc5_ < _loc2_)
            {
               _loc4_ = param1[_loc5_];
               _loc3_ += _loc4_.key + "," + fbnames[_loc4_.key] + "," + _loc4_.wins + "," + _loc4_.charname + "|";
               _loc5_++;
            }
            §1t1523s0§.§1t9378s0§ = _loc3_;
         };
         fbwinserror = function(param1:PlayerIOError):*
         {
            §1t1523s0§.§1t9378s0§ = "";
         };
         var fbwinskeys:Array = new Array();
         fbnames = new Array();
         var max:int = int(§1t5103s0§.data.length);
         var i:int = 0;
         while(i < max)
         {
            uid = §1t5103s0§.data[i].id.toString();
            fbwinskeys.push(uid);
            fbnames[uid] = §1t5103s0§.data[i].first_name;
            i++;
         }
         this.client.§1t729s0§.loadKeys(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8948s0§),fbwinskeys,fbwinscallback,fbwinserror);
      }
      
      override public function §1t2007s0§() : Boolean
      {
         if(§1t1523s0§.§1t9502s0§)
         {
            return false;
         }
         var _loc1_:Object = §1t1540s0§.§1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         if(_loc1_.fb_access_token != null && _loc1_.fb_access_token != "")
         {
            this.§1t3350s0§(_loc1_.fb_access_token);
            this.§1t3327s0§ = true;
            return true;
         }
         var _loc2_:SharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         if(_loc2_.data.saved != true)
         {
            return false;
         }
         var _loc3_:String = _loc2_.data.accesstoken;
         if(_loc3_ != null && _loc3_ != "")
         {
            this.§1t3350s0§(_loc3_);
            return true;
         }
         var _loc4_:String = _loc2_.data.user;
         var _loc5_:String = _loc2_.data.pass;
         if(_loc4_ != null && _loc5_ != null && _loc4_ != "" && _loc5_ != "" && _loc4_ != §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8941s0§))
         {
            §1t7017s0§.instance.login.usernamefield.text = _loc4_;
            §1t7017s0§.instance.login.§1t6140s0§.text = _loc5_;
            this.login(_loc4_,_loc5_);
            return true;
         }
         return false;
      }
      
      override public function §1t1853s0§() : *
      {
         var _loc1_:Object = §1t1540s0§.§1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         if(_loc1_.fb_access_token != null)
         {
            this.§1t3350s0§(_loc1_.fb_access_token);
            return;
         }
         §1t7017s0§.instance.login.§1t5343s0§(6);
      }
      
      public function §1t3356s0§(param1:String) : *
      {
         var _loc2_:URLRequest = new URLRequest(server + "/playerio/checkemailverified.php");
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc4_:URLVariables = new URLVariables();
         _loc4_.username = param1;
         _loc2_.data = _loc4_;
         _loc2_.method = URLRequestMethod.POST;
         _loc3_.addEventListener(Event.COMPLETE,this.§1t3357s0§,false,0,true);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t3358s0§,false,0,true);
         _loc3_.load(_loc2_);
      }
      
      internal function §1t3357s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         switch(_loc3_.status)
         {
            case "0":
               §1t251s0§.§1t9190s0§().§1t3627s0§("emailverified",{});
               this.§1t3361s0§(this.§1t3324s0§);
               break;
            case "1":
               if(§1t1523s0§.§1t9497s0§ || §1t1523s0§.§1t9498s0§)
               {
                  return;
               }
               §1t7017s0§.instance.login.§1t5343s0§(2);
         }
      }
      
      internal function §1t3358s0§(param1:IOErrorEvent) : void
      {
         §1t7017s0§.instance.login.§1t5343s0§(3);
      }
      
      internal function §1t3359s0§(param1:§1t150s0§) : *
      {
         var client:§1t150s0§ = param1;
         this.client = client;
         §1t1836s0§ = client.connectUserId;
         this.§1t3326s0§ = false;
         client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8949s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8950s0§),function(param1:§1t23s0§):*
         {
            if(param1.motd != null && param1.motd != "" && !§1t3317s0§.instance.§1t1833s0§)
            {
               §1t7017s0§.instance.§1t7043s0§(param1.motd);
            }
            var _loc2_:Boolean = param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9041s0§)] != null && Boolean(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9041s0§)]);
            if(_loc2_)
            {
               if(§1t1833s0§)
               {
                  §1t1540s0§.§1t10036s0§();
                  §1t7017s0§.instance.§1t7039s0§();
               }
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(674));
               return;
            }
            if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9038s0§)] != null && int(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9038s0§)] * 1000) > int(§1t1523s0§.§1t9323s0§ * 1000))
            {
               if(§1t1833s0§)
               {
                  §1t1540s0§.§1t10036s0§();
                  §1t7017s0§.instance.§1t7039s0§();
               }
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(646));
               return;
            }
            if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9000s0§)] != null && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9000s0§)] > §1t1523s0§.§1t9324s0§)
            {
               if(§1t1833s0§)
               {
                  §1t1540s0§.§1t10036s0§();
                  §1t7017s0§.instance.§1t7039s0§();
               }
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(646));
               return;
            }
            if(§1t1524s0§.§1t9897s0§(param1))
            {
               if(§1t1833s0§)
               {
                  §1t1540s0§.§1t10036s0§();
                  §1t7017s0§.instance.§1t7039s0§();
               }
               §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(11137));
               return;
            }
            if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9039s0§)] != null && param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9039s0§)] != "")
            {
               §1t1523s0§.§1t9514s0§ = param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9039s0§)];
            }
            if(param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9040s0§)] != null)
            {
               §1t1523s0§.§1t9515s0§ = param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9040s0§)];
            }
            §1t1834s0§ = true;
            §1t1523s0§.charname = "";
            if(§1t1523s0§.§1t9499s0§ && !§1t251s0§.§1t9190s0§().connected && !§1t3317s0§.instance.§1t1833s0§)
            {
               §1t251s0§.§1t9190s0§();
            }
            else
            {
               §1t7017s0§.instance.login.§1t5343s0§(0);
               §1t251s0§.§1t9190s0§();
            }
         });
      }
      
      public function §1t3360s0§() : *
      {
         this.client.§1t729s0§.loadMyPlayerObject(this.§1t3361s0§);
      }
      
      internal function §1t3361s0§(param1:§1t23s0§) : *
      {
         this.§1t3324s0§ = param1;
         if(param1.charname == null || param1.charname == "")
         {
            §1t7017s0§.instance.§1t7038s0§();
            §1t1540s0§.§1t10036s0§();
         }
         else
         {
            §1t1523s0§.charname = param1.charname;
            §1t1540s0§.§1t10032s0§();
            if(!§1t1540s0§.§1t10062s0§())
            {
               §1t1623s0§.instance.§1t1635s0§();
            }
            else
            {
               §1t1623s0§.instance.§1t1636s0§();
            }
         }
      }
      
      public function §1t3362s0§() : *
      {
         var §1t15093s0§:Function = null;
         var §1t15094s0§:Function = null;
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         §1t15093s0§ = function(param1:Event):void
         {
            var _loc2_:URLLoader = URLLoader(param1.target);
            var _loc3_:URLVariables = new URLVariables(_loc2_.data);
            if(debug)
            {
            }
            switch(_loc3_.status)
            {
               case "0":
                  magicnum = _loc3_.magicnum;
                  if(§1t1523s0§.§1t9499s0§ && !§1t251s0§.§1t9190s0§().connected)
                  {
                     §1t251s0§.§1t9190s0§();
                  }
                  else
                  {
                     §1t7017s0§.instance.login.§1t5343s0§(0);
                  }
                  break;
               default:
                  if(§1t1523s0§.§1t9499s0§ && !§1t251s0§.§1t9190s0§().connected)
                  {
                     §1t251s0§.§1t9190s0§();
                  }
                  else
                  {
                     §1t7017s0§.instance.login.§1t5343s0§(0);
                  }
            }
         };
         §1t15094s0§ = function(param1:IOErrorEvent):*
         {
            if(§1t1523s0§.§1t9499s0§ && !§1t251s0§.§1t9190s0§().connected)
            {
               §1t251s0§.§1t9190s0§();
            }
            else
            {
               §1t7017s0§.instance.login.§1t5343s0§(0);
            }
         };
         if(!§1t1833s0§)
         {
            request = new URLRequest(server + "/playerio/login_pio.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.username = username;
            variables.§1t1836s0§ = §1t1836s0§;
            variables.lang = §1t1521s0§.getLanguage();
            if(debug)
            {
               variables.debug = 1;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(Event.COMPLETE,§1t15093s0§,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,§1t15094s0§,false,0,true);
            loader.load(request);
         }
      }
      
      override public function §1t1856s0§() : *
      {
         §1t2004s0§();
         §1t1834s0§ = false;
         this.§1t3324s0§ = null;
         §1t1523s0§.facebookid = "";
         §1t1523s0§.§1t9378s0§ = "";
         §1t1523s0§.§1t9375s0§ = new Vector.<§1t17s0§>();
         §1t251s0§.instance.§1t3589s0§();
         this.client = null;
         this.§1t3446s0§();
      }
      
      override public function §1t1869s0§(param1:String) : *
      {
         if(§1t1833s0§)
         {
            §1t2001s0§();
            §1t2008s0§();
            §1t1837s0§ = param1 + ",1";
            §1t7017s0§.instance.charcreate.§1t5343s0§(0);
            return;
         }
         this.§1t3324s0§.charname = param1;
         var _loc2_:String = "";
         if(§1t1523s0§.facebookid != "" && this.§1t3324s0§ != null && (this.§1t3324s0§.facebookid == null || this.§1t3324s0§.facebookid == ""))
         {
            _loc2_ = §1t1523s0§.facebookid;
         }
         §1t251s0§.instance.§1t3627s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8951s0§),{
            "charname":param1,
            "type":"newera2",
            "created":new Date().toUTCString(),
            "facebookid":_loc2_,
            "intstats":§1t1523s0§.§1t9745s0§(),
            "skillstats":§1t1523s0§.§1t9733s0§(),
            "equipment":§1t1523s0§.§1t9732s0§(),
            "playerstats":§1t1523s0§.§1t9730s0§(),
            "skillslots":§1t1523s0§.§1t9734s0§()
         });
      }
      
      internal function §1t3363s0§(param1:int) : *
      {
         if(param1 != 0)
         {
            §1t7017s0§.instance.charcreate.§1t5343s0§(param1);
            this.§1t3324s0§.charname = "";
         }
         else
         {
            §1t1942s0§();
            §1t1837s0§ = this.§1t3324s0§.charname + ",1";
            §1t7017s0§.instance.charcreate.§1t5343s0§(0);
         }
      }
      
      override public function §1t1946s0§(param1:Boolean = false) : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = undefined;
         var _loc4_:Boolean = false;
         if(!§1t2019s0§())
         {
            §1t406s0§.instance.§1t6637s0§();
            return;
         }
         §1t1523s0§.§1t9557s0§();
         §1t2001s0§();
         if(§1t1833s0§)
         {
            §1t1528s0§();
         }
         else
         {
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < §1t9972s0§)
            {
               if(§1t1526s0§[_loc3_])
               {
                  _loc2_ = true;
               }
               _loc3_++;
            }
            if(!_loc2_)
            {
               return;
            }
            if(§1t1526s0§[0])
            {
               §1t251s0§.instance.§1t3541s0§(0,§1t1523s0§.§1t9727s0§());
            }
            if(Boolean(§1t1527s0§[1]) || §1t1526s0§[1])
            {
               §1t1527s0§[1] = true;
               §1t251s0§.instance.§1t3541s0§(1,§1t1523s0§.§1t9730s0§());
               §1t251s0§.instance.§1t3541s0§(103,§1t1523s0§.§1t7366s0§());
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8989s0§)] = §1t1523s0§.§1t9730s0§();
            }
            if(Boolean(§1t1527s0§[104]) || (Boolean(§1t1527s0§[2]) || Boolean(§1t1526s0§[2])) && (Boolean(§1t1527s0§[4]) || Boolean(§1t1526s0§[4])))
            {
               §1t1527s0§[104] = true;
               §1t1526s0§[2] = false;
               §1t1526s0§[4] = false;
               §1t1527s0§[2] = false;
               §1t1527s0§[4] = false;
               §1t251s0§.instance.§1t3541s0§(104,§1t1523s0§.§1t9732s0§(),§1t1523s0§.§1t9736s0§());
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8990s0§)] = §1t1523s0§.§1t9732s0§();
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8992s0§)] = §1t1523s0§.§1t9736s0§();
            }
            if(Boolean(§1t1527s0§[105]) || (Boolean(§1t1527s0§[4]) || Boolean(§1t1526s0§[4])) && (Boolean(§1t1527s0§[17]) || Boolean(§1t1526s0§[17])))
            {
               §1t1527s0§[105] = true;
               §1t1526s0§[4] = false;
               §1t1526s0§[17] = false;
               §1t1527s0§[4] = false;
               §1t1527s0§[17] = false;
               §1t251s0§.instance.§1t3541s0§(105,§1t1523s0§.§1t9736s0§(),§1t1523s0§.§1t9738s0§());
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8992s0§)] = §1t1523s0§.§1t9736s0§();
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8996s0§)] = §1t1523s0§.§1t9738s0§();
            }
            if(Boolean(§1t1527s0§[2]) || §1t1526s0§[2])
            {
               §1t1527s0§[2] = true;
               §1t251s0§.instance.§1t3541s0§(2,§1t1523s0§.§1t9732s0§());
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8990s0§)] = §1t1523s0§.§1t9732s0§();
            }
            if(Boolean(§1t1527s0§[3]) || §1t1526s0§[3])
            {
               §1t1527s0§[3] = true;
               §1t251s0§.instance.§1t3541s0§(3,§1t1523s0§.§1t9733s0§());
            }
            if(Boolean(§1t1527s0§[4]) || §1t1526s0§[4])
            {
               §1t1527s0§[4] = true;
               §1t251s0§.instance.§1t3541s0§(4,§1t1523s0§.§1t9736s0§());
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8992s0§)] = §1t1523s0§.§1t9736s0§();
            }
            if(Boolean(§1t1527s0§[5]) || §1t1526s0§[5])
            {
               §1t1527s0§[5] = true;
               §1t251s0§.instance.§1t3541s0§(5,§1t1523s0§.§1t9743s0§());
            }
            if(Boolean(§1t1527s0§[6]) || §1t1526s0§[6])
            {
               §1t1527s0§[6] = true;
               §1t251s0§.instance.§1t3541s0§(6,§1t1523s0§.§1t9745s0§());
            }
            if(Boolean(§1t1527s0§[7]) || §1t1526s0§[7])
            {
               §1t1527s0§[7] = true;
               §1t251s0§.instance.§1t3541s0§(7,§1t1523s0§.§1t9747s0§());
            }
            if(Boolean(§1t1527s0§[8]) || §1t1526s0§[8])
            {
               §1t1527s0§[8] = true;
               §1t251s0§.instance.§1t3541s0§(8,§1t1523s0§.§1t9751s0§());
            }
            if(Boolean(§1t1527s0§[9]) || §1t1526s0§[9])
            {
               §1t1527s0§[9] = true;
               §1t251s0§.instance.§1t3541s0§(9,§1t1523s0§.§1t9756s0§());
            }
            if(§1t1526s0§[10])
            {
               §1t251s0§.instance.§1t3541s0§(10,§1t1523s0§.§1t2220s0§());
            }
            if(§1t1526s0§[11])
            {
               §1t251s0§.instance.§1t3541s0§(11,§1t1523s0§.§1t5608s0§());
            }
            if(§1t1526s0§[12])
            {
               §1t251s0§.instance.§1t3541s0§(12,§1t1523s0§.§1t9759s0§());
            }
            if(§1t1526s0§[14])
            {
               §1t251s0§.instance.§1t3541s0§(14,§1t1523s0§.§1t9734s0§());
            }
            if(§1t1526s0§[15])
            {
               §1t251s0§.instance.§1t3541s0§(15,§1t1523s0§.§1t7746s0§().toString());
            }
            if(§1t1526s0§[16])
            {
               §1t251s0§.instance.§1t3541s0§(16,§1t1523s0§.§1t9728s0§());
            }
            if(Boolean(§1t1527s0§[17]) || §1t1526s0§[17])
            {
               §1t1527s0§[17] = true;
               §1t251s0§.instance.§1t3541s0§(17,§1t1523s0§.§1t9738s0§());
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8996s0§)] = §1t1523s0§.§1t9738s0§();
            }
            if(§1t1526s0§[18])
            {
               §1t251s0§.instance.§1t3541s0§(18,§1t1523s0§.§1t9740s0§());
            }
            if(§1t1526s0§[19])
            {
               §1t251s0§.instance.§1t3541s0§(19,§1t1523s0§.§1t9749s0§());
            }
            if(§1t1526s0§[20])
            {
               §1t251s0§.instance.§1t3541s0§(20,§1t1543s0§.§1t10253s0§());
            }
            if(Boolean(§1t1527s0§[100]) || §1t1523s0§.§1t9386s0§ != this.§1t3364s0§)
            {
               §1t1527s0§[100] = true;
               §1t251s0§.instance.§1t3541s0§(100,§1t1523s0§.§1t9386s0§.toString());
               this.§1t3364s0§ = §1t1523s0§.§1t9386s0§;
            }
            if(Boolean(§1t1527s0§[101]) || §1t1523s0§.§1t9387s0§ != this.§1t3365s0§)
            {
               §1t1527s0§[101] = true;
               §1t251s0§.instance.§1t3541s0§(101,§1t1523s0§.§1t9387s0§.toString());
               this.§1t3365s0§ = §1t1523s0§.§1t9387s0§;
            }
            if(Boolean(§1t1527s0§[102]) || §1t1523s0§.§1t9388s0§ != this.§1t3366s0§)
            {
               §1t1527s0§[102] = true;
               §1t251s0§.instance.§1t3541s0§(102,§1t1523s0§.§1t9388s0§.toString());
               this.§1t3366s0§ = §1t1523s0§.§1t9388s0§;
            }
            §1t1846s0§();
            §1t1528s0§();
            if(§1t406s0§.instance != null)
            {
               _loc4_ = §1t1536s0§();
               if((_loc4_) && §1t1531s0§ == -1)
               {
                  §1t1531s0§ = §1t1847s0§();
               }
               else if(!§1t1532s0§ && §1t1531s0§ != -1 && §1t1847s0§() - §1t1531s0§ > 120)
               {
                  §1t251s0§.instance.§1t3561s0§();
               }
               §1t406s0§.instance.§1t6656s0§(_loc4_);
            }
         }
      }
      
      internal function §1t3367s0§() : Number
      {
         return new Date().time;
      }
      
      override public function §1t1939s0§(param1:String, param2:Boolean = false) : *
      {
         §1t1523s0§.charname = param1;
         if(§1t251s0§.§1t9190s0§().nid == "")
         {
            §1t251s0§.instance.nid = param1;
         }
         if(param2)
         {
            §1t1838s0§ = 0;
         }
         if(§1t1833s0§)
         {
            §1t1523s0§.§1t9585s0§();
            §1t70s0§.instance.§1t1125s0§(§1t1523s0§.§1t2218s0§(),false);
            this.§1t3371s0§();
         }
         else
         {
            §1t1523s0§.id = param1;
            §1t2018s0§();
            this.§1t3372s0§ = 0;
            this.client.§1t737s0§.§1t4235s0§(this.§1t3368s0§,this.§1t3369s0§);
            this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8952s0§),param1,this.§1t3370s0§,this.§1t3377s0§);
            this.§1t3371s0§();
            §1t251s0§.instance.§1t3586s0§();
         }
      }
      
      internal function §1t3368s0§() : *
      {
         this.checkLoadComplete();
      }
      
      internal function §1t3369s0§(param1:PlayerIOError) : *
      {
         this.§1t3328s0§ = true;
         this.checkLoadComplete();
      }
      
      internal function §1t3370s0§(param1:§1t23s0§) : *
      {
         if(param1 != null)
         {
            §1t1523s0§.§1t9379s0§ = param1.notif;
            this.client.§1t729s0§.deleteKeys(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8952s0§),[§1t1523s0§.charname]);
         }
         this.checkLoadComplete();
      }
      
      internal function §1t3371s0§() : *
      {
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8949s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8953s0§),function(param1:§1t23s0§):*
         {
            §1t1524s0§.§1t9853s0§(param1.towns);
            checkLoadComplete();
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      public function checkLoadComplete() : *
      {
         ++this.§1t3372s0§;
         if(this.§1t3372s0§ == 4)
         {
            this.§1t3375s0§();
         }
      }
      
      public function §1t3374s0§(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int) : *
      {
         var _loc11_:String = null;
         var _loc12_:int = 0;
         if(this.§1t3372s0§ >= 4)
         {
            return;
         }
         if(this.§1t3324s0§.charname == null)
         {
            §1t251s0§.instance.§1t3589s0§();
            §1t251s0§.instance.§1t3620s0§();
            return;
         }
         if(this.§1t3324s0§ != null && this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8989s0§)] == null && this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8990s0§)] == null)
         {
            §1t251s0§.instance.§1t3589s0§();
            §1t251s0§.instance.§1t3620s0§();
            §1t1540s0§.§1t10036s0§();
            §1t1540s0§.§1t10028s0§();
            this.§1t1872s0§(this.§1t3324s0§.charname);
            §1t7017s0§.instance.§1t7038s0§();
            return;
         }
         _loc11_ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8989s0§)];
         if(_loc11_ != null && _loc11_ != param1 && param1 != "")
         {
            §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8989s0§),_loc11_ + " " + param1);
         }
         _loc11_ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8990s0§)];
         if(_loc11_ != null && _loc11_ != param2 && param2 != "")
         {
            if(_loc11_.indexOf(§1t1701s0§.§1t11255s0§) == -1)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8990s0§),_loc11_ + " " + param2);
            }
         }
         _loc11_ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8992s0§)];
         if(_loc11_ != null && _loc11_ != param3 && param3 != "")
         {
            if(_loc11_.indexOf(§1t1701s0§.§1t11255s0§) == -1)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8992s0§),_loc11_ + " " + param3);
            }
         }
         _loc11_ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8995s0§)];
         if(_loc11_ != null && _loc11_ != param4 && param4 != "")
         {
            if(_loc11_.indexOf(§1t1701s0§.§1t11255s0§) == -1)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8995s0§),_loc11_ + " " + param4);
            }
         }
         _loc11_ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8996s0§)];
         if(_loc11_ != null && _loc11_ != param5 && param5 != "")
         {
            if(_loc11_.indexOf(§1t1701s0§.§1t11255s0§) == -1)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8996s0§),_loc11_ + " " + param5);
            }
         }
         _loc11_ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8991s0§)];
         if(_loc11_ != null && _loc11_ != param6 && param6 != "")
         {
            if(_loc11_.indexOf(§1t1701s0§.§1t11255s0§) == -1)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8991s0§),_loc11_ + " " + param6);
            }
         }
         _loc11_ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9026s0§)];
         if(_loc11_ != null && _loc11_ != param7 && param7 != "")
         {
            if(_loc11_.indexOf(§1t1701s0§.§1t11255s0§) == -1)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9026s0§),_loc11_ + " " + param7);
            }
         }
         _loc11_ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9027s0§)];
         if(_loc11_ != null && _loc11_ != param8 && param8 != "")
         {
            if(_loc11_.indexOf(§1t1701s0§.§1t11255s0§) == -1)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9027s0§),_loc11_ + " " + param8);
            }
         }
         if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9028s0§)] != null && this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9028s0§)] != param9)
         {
            if(param9 > this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9028s0§)])
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9028s0§),this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9028s0§)] + " " + param9);
               this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9028s0§)] = param9;
            }
         }
         if(param10 > 0 && (this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8988s0§)] == null || this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8988s0§)] != param10))
         {
            §1t3318s0§.instance.§1t3409s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8988s0§),this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8988s0§)] + " " + param10);
            this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8988s0§)] = param10;
         }
         this.checkLoadComplete();
      }
      
      internal function §1t3375s0§() : *
      {
         var sharedObject:SharedObject = null;
         §1t1533s0§();
         try
         {
            if(this.§1t3324s0§.apupdate != "")
            {
               §1t1523s0§.§1t9386s0§ = this.§1t3324s0§.apupdate;
            }
            if(this.§1t3324s0§.dtupdate != "")
            {
               §1t1523s0§.§1t9387s0§ = this.§1t3324s0§.dtupdate;
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9028s0§)] != "")
            {
               §1t1523s0§.§1t9388s0§ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9028s0§)];
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8988s0§)] != null && this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8988s0§)] > 0)
            {
               §1t1523s0§.§1t1981s0§ = true;
            }
            §1t1523s0§.§1t9519s0§ = this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9023s0§)] == true;
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9001s0§)] != null)
            {
               §1t1523s0§.§1t9516s0§ = true;
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8989s0§)] != null)
            {
               §1t1523s0§.§1t1256s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8989s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8990s0§)] != null)
            {
               §1t1523s0§.§1t1257s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8990s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8991s0§)] != null)
            {
               §1t1523s0§.§1t9221s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8991s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9026s0§)] != null)
            {
               §1t1523s0§.§1t9735s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9026s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8992s0§)] != null)
            {
               §1t1523s0§.§1t9737s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8992s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8995s0§)] != null)
            {
               §1t1523s0§.§1t9744s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8995s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8996s0§)] != null)
            {
               §1t1523s0§.§1t9739s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8996s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9027s0§)] != null)
            {
               §1t1523s0§.§1t9746s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9027s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8997s0§)] != null)
            {
               §1t1523s0§.§1t9750s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8997s0§)]);
            }
            if(this.§1t3324s0§.booleanstats != null)
            {
               §1t1523s0§.§1t9748s0§(this.§1t3324s0§.booleanstats);
            }
            if(this.§1t3324s0§.activequest != null)
            {
               §1t1523s0§.§1t9753s0§(this.§1t3324s0§.activequest);
            }
            if(this.§1t3324s0§.completedquest != null)
            {
               §1t1523s0§.§1t9757s0§(this.§1t3324s0§.completedquest);
            }
            if(this.§1t3324s0§.taunt != null)
            {
               §1t1523s0§.§1t9758s0§(this.§1t3324s0§.taunt);
            }
            if(this.§1t3324s0§.bounty != null)
            {
               §1t1523s0§.bounty = this.§1t3324s0§.bounty;
            }
            if(this.§1t3324s0§.friends != null)
            {
               §1t1523s0§.§1t9760s0§(this.§1t3324s0§.friends);
            }
            if(this.§1t3324s0§.ignore != null)
            {
               §1t1543s0§.§1t10254s0§(this.§1t3324s0§.ignore);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8993s0§)] != null)
            {
               §1t1523s0§.§1t9393s0§.§1t695s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8993s0§)]);
            }
            if(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8994s0§)] != null)
            {
               §1t1523s0§.§1t9394s0§.§1t695s0§(this.§1t3324s0§[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8994s0§)]);
            }
            if(this.§1t3324s0§.options != null)
            {
               sharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
               if(sharedObject.data.saved != true)
               {
                  §1t1523s0§.§1t9741s0§(this.§1t3324s0§.options);
               }
            }
            §1t1523s0§.§1t9585s0§();
            if(§1t1523s0§.§1t9663s0§(§1t1523s0§.§1t7746s0§()))
            {
               this.§1t3432s0§(§1t1523s0§.§1t7746s0§(),this.§1t3376s0§);
            }
            else
            {
               this.§1t3376s0§();
            }
            §1t1523s0§.§1t9517s0§ = false;
            §1t1523s0§.§1t9518s0§ = false;
            if(§1t1523s0§.getLevel() == 1 && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9426s0§) == 0)
            {
               §1t1523s0§.§1t9712s0§(30025,§1t3317s0§.instance.§1t1847s0§());
            }
         }
         catch(e:Error)
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§(e.message,"processPlayerObj " + §1t1523s0§.charname,e.getStackTrace(),e.errorID);
         }
      }
      
      internal function §1t3376s0§(param1:§1t23s0§ = null) : *
      {
         if(param1 != null)
         {
            §1t1523s0§.§1t9652s0§(param1.clanname,param1.color,param1.logo,param1.logocolor,param1.acronym,param1.founder,param1.owned);
         }
         §1t70s0§.instance.§1t1125s0§(§1t1523s0§.§1t2218s0§(),false);
      }
      
      internal function §1t3377s0§(param1:PlayerIOError) : *
      {
         this.client.§1t731s0§.§1t4655s0§(param1.name,param1.message,param1.getStackTrace(),param1.errorID);
      }
      
      public function §1t3378s0§() : *
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§1t3324s0§ != null)
         {
            if(this.§1t3324s0§.charname == null || this.§1t3324s0§.charname == "")
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               §1t7017s0§.instance.options.§1t5339s0§();
               §1t7017s0§.instance.options.§1t6411s0§.visible = false;
            }
            else
            {
               if(this.§1t3324s0§.playerstats != null)
               {
                  _loc1_ = this.§1t3324s0§.playerstats.split("|");
                  _loc2_ = int(_loc1_[§1t1523s0§.§1t9431s0§]);
                  _loc3_ = int(_loc1_[§1t1523s0§.§1t9432s0§]);
                  if((_loc2_ == §1t1523s0§.§1t9460s0§ || _loc2_ == §1t1523s0§.§1t9461s0§ || _loc2_ == §1t1523s0§.§1t9462s0§) && _loc3_ > §1t3317s0§.instance.§1t1847s0§())
                  {
                     §1t88s0§.instance.§1t1516s0§("Snd_error");
                     §1t7017s0§.instance.options.§1t5339s0§();
                     §1t7017s0§.instance.options.§1t6411s0§.visible = false;
                     return;
                  }
               }
               §1t7017s0§.instance.options.chardeleteform.§1t5339s0§(this.§1t3324s0§.charname);
               §1t7017s0§.instance.options.chardeleteform.visible = true;
            }
         }
         else
         {
            this.client.§1t729s0§.loadMyPlayerObject(this.§1t3380s0§);
         }
      }
      
      public function §1t3379s0§() : Boolean
      {
         if(this.§1t3324s0§ == null)
         {
            return false;
         }
         if(this.§1t3324s0§.charname == null || this.§1t3324s0§.charname == "")
         {
            return true;
         }
         return false;
      }
      
      internal function §1t3380s0§(param1:§1t23s0§) : *
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.§1t3324s0§ = param1;
         if(param1.charname == null || param1.charname == "")
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            §1t7017s0§.instance.options.§1t5339s0§();
            §1t7017s0§.instance.options.§1t6411s0§.visible = false;
         }
         else
         {
            if(param1.playerstats != null)
            {
               _loc2_ = param1.playerstats.split("|");
               _loc3_ = int(_loc2_[§1t1523s0§.§1t9431s0§]);
               _loc4_ = int(_loc2_[§1t1523s0§.§1t9432s0§]);
               if((_loc3_ == §1t1523s0§.§1t9460s0§ || _loc3_ == §1t1523s0§.§1t9461s0§ || _loc3_ == §1t1523s0§.§1t9462s0§) && _loc4_ > §1t3317s0§.instance.§1t1847s0§())
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  §1t7017s0§.instance.options.§1t5339s0§();
                  §1t7017s0§.instance.options.§1t6411s0§.visible = false;
                  return;
               }
            }
            §1t7017s0§.instance.options.chardeleteform.§1t5339s0§(param1.charname);
            §1t7017s0§.instance.options.chardeleteform.visible = true;
         }
      }
      
      override public function §1t1872s0§(param1:String) : *
      {
         §1t2002s0§(param1);
         §1t2009s0§();
         §1t1837s0§ = "";
         this.§1t3324s0§.charname = "";
         §1t251s0§.§1t9190s0§().§1t3627s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8954s0§),{});
      }
      
      override public function §1t1878s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(this.§1t3384s0§ == null || §1t1847s0§() - this.§1t3385s0§ > 60 * 2)
         {
            _loc1_ = §1t1523s0§.getLevel();
            this.§1t3385s0§ = §1t1847s0§();
            this.§1t3381s0§ = null;
            this.§1t3384s0§ = null;
            _loc3_ = Math.random() * 2;
            if(_loc3_ == 0)
            {
               _loc2_ = "ByLevelRandomA";
            }
            else if(_loc3_ == 1)
            {
               _loc2_ = "ByLevelRandomB";
            }
            this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8955s0§),_loc2_,[],_loc1_,null,20,this.§1t3382s0§,this.§1t3389s0§);
            this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8955s0§),"ByLevelOnline",[true],_loc1_,null,20,this.§1t3383s0§,this.§1t3389s0§);
         }
         else
         {
            this.§1t3388s0§();
         }
      }
      
      internal function §1t3382s0§(param1:Array) : *
      {
         this.§1t3381s0§ = param1;
         if(this.§1t3384s0§ != null)
         {
            this.§1t3386s0§();
         }
      }
      
      internal function §1t3383s0§(param1:Array) : *
      {
         this.§1t3384s0§ = param1;
         if(this.§1t3381s0§ != null)
         {
            this.§1t3386s0§();
         }
      }
      
      internal function §1t3386s0§() : void
      {
         var _loc1_:§1t23s0§ = null;
         var _loc2_:* = 0;
         _loc2_ = int(this.§1t3384s0§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc1_ = this.§1t3384s0§[_loc2_];
            if(this.§1t3387s0§(_loc1_))
            {
               this.§1t3384s0§.splice(_loc2_,1);
            }
            _loc2_--;
         }
         _loc2_ = 0;
         while(_loc2_ < this.§1t3381s0§.length && this.§1t3384s0§.length < 20)
         {
            _loc1_ = this.§1t3381s0§[_loc2_];
            if(!_loc1_.online && !this.§1t3387s0§(_loc1_))
            {
               this.§1t3384s0§.push(_loc1_);
            }
            _loc2_++;
         }
         this.§1t3388s0§();
      }
      
      internal function §1t3387s0§(param1:§1t23s0§) : Boolean
      {
         var _loc2_:int = §1t1523s0§.getLevel();
         return param1.key == §1t1523s0§.charname || Boolean(param1.mod) || param1.playerlevel > _loc2_ + 2;
      }
      
      internal function §1t3388s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t23s0§ = null;
         var _loc1_:Array = this.§1t3384s0§.slice(0,this.§1t3384s0§.length);
         var _loc2_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < 6 && _loc1_.length > 0)
         {
            _loc4_ = _loc1_.splice(int(Math.random() * _loc1_.length),1)[0];
            if(_loc4_.online != null && Boolean(_loc4_.online))
            {
               _loc3_ = 0;
            }
            else
            {
               _loc3_ = 10000;
            }
            if(_loc4_.equipment == null)
            {
               _loc4_.equipment = §1t76s0§.§1t9212s0§;
            }
            _loc2_ += _loc4_.key + "$" + _loc4_.playerlevel + "$" + _loc4_.equipment + "$" + _loc3_ + §1t1701s0§.§1t11257s0§;
            _loc5_++;
         }
         §1t5565s0§.instance.§1t3388s0§(_loc2_);
      }
      
      internal function §1t3389s0§(param1:PlayerIOError) : void
      {
         §1t5565s0§.instance.§1t5026s0§(null);
      }
      
      override public function §1t1881s0§(param1:String) : *
      {
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8956s0§),param1,this.§1t3390s0§,this.§1t3391s0§);
      }
      
      internal function §1t3390s0§(param1:§1t23s0§) : void
      {
         var _loc2_:* = undefined;
         if(param1 == null)
         {
            §1t5565s0§.instance.§1t5026s0§(null);
         }
         else
         {
            if(param1.battlestats == null)
            {
               this.§1t3391s0§(null);
               return;
            }
            if(param1.skillstats == null)
            {
               param1.skillstats = "";
            }
            if(param1.stratusid == null)
            {
               param1.stratusid = "";
            }
            if(param1.battlestats == null)
            {
               param1.battlestats = "5|10|10|10|1|1|1|0|0|0|0|0|0|0";
            }
            if(param1.online != null && Boolean(param1.online))
            {
               _loc2_ = 0;
            }
            else
            {
               _loc2_ = 10000;
            }
            if(param1.taunt == null)
            {
               param1.taunt = "";
            }
            §1t5565s0§.instance.§1t5595s0§(param1.battlestats,param1.skillstats,param1.stratusid,_loc2_,param1.taunt);
         }
      }
      
      internal function §1t3391s0§(param1:PlayerIOError) : void
      {
         §1t5565s0§.instance.§1t5026s0§(null);
      }
      
      public function §1t3392s0§() : *
      {
         var _loc1_:String = null;
         var _loc2_:int = Math.random() * 2;
         if(_loc2_ == 0)
         {
            _loc1_ = "ByLevelRandomA";
         }
         else if(_loc2_ == 1)
         {
            _loc1_ = "ByLevelRandomB";
         }
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8955s0§),_loc1_,[],int(Math.random() * 70) + 10,null,20,this.§1t3393s0§,this.§1t3394s0§);
      }
      
      internal function §1t3393s0§(param1:Array) : *
      {
         var §1t15106s0§:§1t23s0§ = null;
         var array:Array = param1;
         if(array.length == 0)
         {
            this.§1t3394s0§(null);
         }
         else
         {
            §1t15106s0§ = array[int(Math.random() * array.length)];
            if(Boolean(§1t15106s0§.key == §1t1523s0§.charname) || Boolean(§1t15106s0§.mod) || Boolean(§1t15106s0§.notowerget))
            {
               array[int(Math.random() * array.length)];
            }
            if(Boolean(§1t15106s0§.key == §1t1523s0§.charname) || Boolean(§1t15106s0§.mod) || Boolean(§1t15106s0§.notowerget))
            {
               this.§1t3394s0§(null);
            }
            this.client.§1t729s0§.load("BattleData",§1t15106s0§.key,function(param1:§1t23s0§):*
            {
               var _loc2_:int = 0;
               if(param1 == null || §1t15106s0§.equipment == null || param1.battlestats == null || param1.skillstats == null)
               {
                  §1t3394s0§(null);
               }
               else
               {
                  _loc2_ = 0;
                  if(§1t15106s0§.playerdan != null)
                  {
                     _loc2_ = int(§1t15106s0§.playerdan);
                  }
                  §1t412s0§.instance.§1t7549s0§.§1t7438s0§(true,§1t15106s0§.key,§1t15106s0§.equipment,param1.battlestats,param1.skillstats,§1t15106s0§.playerlevel,_loc2_);
               }
            },this.§1t3394s0§);
         }
      }
      
      internal function §1t3394s0§(param1:PlayerIOError) : *
      {
         §1t412s0§.instance.§1t7549s0§.§1t7438s0§(false,"","","","",1,0);
      }
      
      override public function §1t1894s0§(param1:String, param2:String) : *
      {
         §1t251s0§.instance.§1t3548s0§(param2);
      }
      
      override public function §1t1884s0§(param1:int = 0, param2:Boolean = false) : *
      {
         var _loc3_:Object = null;
         if(param1 == 0)
         {
            this.§1t3395s0§ = 0;
            _loc3_ = null;
            this.§1t3397s0§ = false;
            this.§1t3398s0§ = false;
            this.§1t3399s0§ = new Array();
         }
         else
         {
            if(!(this.§1t3397s0§ && param1 > this.§1t3395s0§))
            {
               if(this.§1t3398s0§ && param1 < this.§1t3395s0§)
               {
                  --this.§1t3395s0§;
                  this.§1t3400s0§(this.§1t3399s0§[this.§1t3395s0§]);
                  return;
               }
               return;
            }
            ++this.§1t3395s0§;
            _loc3_ = this.§1t3396s0§;
         }
         if(param2)
         {
            this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8957s0§),"ByRating",null,_loc3_,null,11,this.§1t3400s0§,this.§1t3401s0§);
         }
         else
         {
            this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8958s0§),"ByRating",null,_loc3_,null,11,this.§1t3400s0§,this.§1t3401s0§);
         }
      }
      
      internal function §1t3400s0§(param1:Array) : void
      {
         var str:String = null;
         var o:§1t23s0§ = null;
         var i:int = 0;
         var array:Array = param1;
         try
         {
            this.§1t3399s0§[this.§1t3395s0§] = array;
            this.§1t3397s0§ = array.length == 11;
            this.§1t3398s0§ = this.§1t3395s0§ > 0;
            if(this.§1t3397s0§)
            {
               this.§1t3396s0§ = array[9].rating;
            }
            str = "";
            i = 0;
            while(i < array.length && i < 10)
            {
               o = array[i];
               if(o.wins == null)
               {
                  o.wins = 0;
               }
               if(o.loss == null)
               {
                  o.loss = 0;
               }
               if(o.draw == null)
               {
                  o.draw = 0;
               }
               str += o.key + "#" + "0" + "#" + o.wins + "#" + o.loss + "#" + o.draw + "#" + "0" + "^";
               i++;
            }
            if(§1t1540s0§.§1t10012s0§())
            {
               §1t6073s0§.instance.§1t5560s0§(str);
            }
            else
            {
               §1t5565s0§.instance.§1t5560s0§(str);
            }
         }
         catch(e:Error)
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§(e.message,"leaderboards " + §1t1540s0§.§1t10012s0§() + " " + §1t3395s0§,e.getStackTrace(),e.errorID);
         }
      }
      
      internal function §1t3401s0§(param1:PlayerIOError) : void
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
      
      override public function §1t1887s0§(param1:String, param2:String, param3:String, param4:int, param5:Boolean) : *
      {
         if(param3 == "" && param4 == 0)
         {
            return;
         }
         §1t251s0§.instance.§1t1887s0§(param1,param3,param4,param5);
      }
      
      override public function §1t1891s0§() : *
      {
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8952s0§),§1t1523s0§.charname,this.§1t3402s0§);
      }
      
      internal function §1t3402s0§(param1:§1t23s0§) : *
      {
         if(param1 == null)
         {
            return;
         }
         if(§1t1523s0§.§1t9379s0§ == "")
         {
            §1t1523s0§.§1t9379s0§ = param1.notif;
         }
         else
         {
            §1t1523s0§.§1t9379s0§ = §1t1523s0§.§1t9379s0§ + "^" + param1.notif;
         }
         if(§1t1540s0§.§1t9550s0§() && !§1t406s0§.instance.§1t6475s0§.visible && !§1t406s0§.instance.§1t6482s0§.visible)
         {
            §1t1523s0§.§1t9742s0§();
         }
         this.client.§1t729s0§.deleteKeys(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8952s0§),[§1t1523s0§.charname]);
      }
      
      public function §1t3403s0§() : int
      {
         if(this.§1t3328s0§)
         {
            return 0;
         }
         try
         {
            return this.client.§1t737s0§.coins;
         }
         catch(e:Error)
         {
            client.§1t737s0§.§1t4235s0§(function():*
            {
               if(§1t1540s0§.§1t9550s0§())
               {
                  §1t406s0§.instance.§1t6578s0§();
               }
            });
         }
         return 0;
      }
      
      public function §1t3404s0§() : *
      {
         if(this.§1t3328s0§)
         {
            return;
         }
         this.client.§1t737s0§.§1t4235s0§(function():*
         {
            if(§1t1540s0§.§1t9550s0§())
            {
               §1t406s0§.instance.§1t6578s0§();
            }
         });
      }
      
      public function §1t3405s0§(param1:int, param2:Function, param3:Function) : *
      {
         var num:int = param1;
         var callbackSuccess:Function = param2;
         var callbackError:Function = param3;
         if(this.§1t3328s0§)
         {
            return;
         }
         this.client.§1t737s0§.§1t4687s0§(num,"",function():*
         {
            §1t251s0§.instance.§1t3564s0§(num);
            callbackSuccess.call();
         },function():*
         {
            callbackError();
         });
      }
      
      public function §1t3406s0§(param1:int) : *
      {
         var num:int = param1;
         Security.allowDomain("*");
         this.client.yahoo.payments.§1t2563s0§(num,{
            "name":num.toString() + " " + §1t1521s0§.getString(64),
            "description":§1t1521s0§.getString(687),
            "icon":this.§1t3332s0§("/images/gold75x75.png"),
            "currency":"usd"
         },function(param1:Object):void
         {
            §1t406s0§.instance.§1t6498s0§.§1t6728s0§("success");
         },function(param1:PlayerIOError):void
         {
            if(param1.message == "cancelled")
            {
               §1t406s0§.instance.§1t6498s0§.§1t6728s0§("cancelled");
            }
            else
            {
               §1t406s0§.instance.§1t6498s0§.§1t6728s0§("failed",param1.message);
            }
         });
      }
      
      public function §1t3407s0§(param1:int) : *
      {
         var num:int = param1;
         this.client.§1t737s0§.§1t4690s0§("facebookv2",{
            "coinamount":num.toString(),
            "title":num.toString() + " " + §1t1521s0§.getString(64),
            "description":§1t1521s0§.getString(687),
            "image":"http://www.strawhatsamuraiduels.com/gold.png",
            "currencies":"USD"
         },function(param1:Object):void
         {
            var info:Object = param1;
            try
            {
               FB.ui(info,function(param1:Object):void
               {
                  if(param1.status == "completed")
                  {
                     §1t406s0§.instance.§1t6498s0§.§1t6724s0§(§1t1798s0§.§1t11413s0§);
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6498s0§.§1t6724s0§(§1t1798s0§.§1t11417s0§,param1.status);
                  }
               });
            }
            catch(error:Error)
            {
               §1t406s0§.instance.§1t6498s0§.§1t6694s0§.hide();
               §1t406s0§.instance.§1t6498s0§.§1t6694s0§.show(num,§1t406s0§.instance.§1t6498s0§);
            }
         },function(param1:PlayerIOError):void
         {
            §1t406s0§.instance.§1t6498s0§.§1t6724s0§(§1t1798s0§.§1t11415s0§);
         });
      }
      
      public function §1t3408s0§(param1:String) : *
      {
         var msg:String = param1;
         FB.ui({
            "method":"apprequests",
            "message":msg
         },function(param1:Object):void
         {
         });
      }
      
      override internal function §1t2022s0§() : *
      {
         var link:String = null;
         try
         {
            link = "http://www.strawhatsamuraiduels.com/watch?name=" + §1t1523s0§.charname;
            FB.ui({
               "method":"feed",
               "name":"Straw Hat Samurai: Duels",
               "link":"http://www.facebook.com/strawhatsamuraiduels",
               "picture":"http://strawhatsamuraiduels.com/images/shareimage.jpg",
               "caption":"Watch me kick some ass!",
               "description":"Check out my duel on Straw Hat Samurai: Duels TV!",
               "actions":"[{\"name\": \"Watch duel\", \"link\": \"" + link + "\"}]"
            },function(param1:Object):void
            {
            });
         }
         catch(e:Error)
         {
         }
      }
      
      override public function §1t1126s0§(param1:int, param2:int) : *
      {
         var terrX:int = param1;
         var terrY:int = param2;
         var §1t15141s0§:int = terrX << 12 | terrY;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8959s0§),§1t15141s0§.toString(),function(param1:§1t23s0§):*
         {
            var _loc2_:String = null;
            var _loc3_:String = null;
            var _loc4_:String = null;
            if(param1 == null)
            {
               §1t70s0§.instance.§1t1130s0§(terrX,terrY,"0");
            }
            else
            {
               _loc3_ = "0";
               if(param1.war)
               {
                  _loc3_ = "1";
               }
               _loc4_ = "";
               if(param1.name != null && param1.name != "")
               {
                  _loc4_ = param1.name;
               }
               _loc2_ = param1.prosperity + "," + param1.side + "," + _loc4_ + "," + _loc3_ + "," + param1.questdata + "," + param1.encounterdata + "," + param1.battlereports;
               §1t70s0§.instance.§1t1130s0§(terrX,terrY,_loc2_);
            }
         });
      }
      
      override public function §1t1978s0§(param1:int, param2:int) : *
      {
         var §1t15141s0§:int;
         var i:int = 0;
         var j:int = 0;
         var terrX:int = param1;
         var terrY:int = param2;
         var keys:Array = new Array();
         i = terrX - 1;
         while(i <= terrX + 1)
         {
            j = terrY - 1;
            while(j <= terrY + 1)
            {
               keys.push((i << 12 | j).toString());
               j++;
            }
            i++;
         }
         §1t15141s0§ = terrX << 12 | terrY;
         this.client.§1t729s0§.loadKeys(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8959s0§),keys,function(param1:Array):*
         {
            var _loc4_:§1t23s0§ = null;
            var _loc5_:String = null;
            var _loc6_:String = null;
            var _loc7_:int = 0;
            var _loc8_:int = 0;
            var _loc2_:String = "";
            var _loc3_:int = int(param1.length);
            i = 0;
            while(i < _loc3_)
            {
               _loc4_ = param1[i];
               _loc5_ = "0";
               if(_loc4_.war)
               {
                  _loc5_ = "1";
               }
               _loc6_ = "";
               if(_loc4_.name != null && _loc4_.name != "")
               {
                  _loc6_ = _loc4_.name;
               }
               _loc2_ = _loc4_.prosperity + "," + _loc4_.side + "," + _loc6_ + "," + _loc5_ + "," + _loc4_.questdata + "," + _loc4_.encounterdata + "," + _loc4_.battlereports;
               _loc7_ = int(_loc4_.key) >> 12 & 0x0FFF;
               _loc8_ = int(_loc4_.key) & 0x0FFF;
               §1t70s0§.instance.§1t1130s0§(_loc7_,_loc8_,_loc2_);
               ++i;
            }
            §1t1540s0§.§1t10037s0§();
         },function(param1:PlayerIOError):*
         {
            client.§1t731s0§.§1t4655s0§(param1.name,param1.message,param1.getStackTrace(),param1.errorID);
         });
      }
      
      public function §1t3409s0§(param1:String, param2:String = "") : *
      {
         this.§1t3345s0§().§1t731s0§.§1t4655s0§(§1t1836s0§ + " " + §1t1523s0§.§1t9764s0§() + " " + param1,param2,"",null);
      }
      
      override public function §1t1982s0§(param1:String, param2:Boolean = false, param3:Boolean = false) : *
      {
         var _loc4_:Object = null;
         if(§1t1981s0§)
         {
            return;
         }
         §1t1981s0§ = true;
         if(§1t1833s0§)
         {
            _loc4_ = new Object();
            _loc4_.det = param1;
            §1t251s0§.instance.§1t3627s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8935s0§),_loc4_);
            §1t406s0§.instance.§1t6636s0§(this.§1t3410s0§);
            §1t1523s0§.§1t1981s0§ = true;
            return;
         }
         if(§1t1523s0§.§1t1981s0§)
         {
            §1t1523s0§.§1t9763s0§(666);
            §1t1523s0§.§1t9726s0§(§1t1523s0§.§1t9462s0§,86400);
            §1t251s0§.instance.§1t1982s0§(param1,param2,param3);
            §1t406s0§.instance.§1t6635s0§(true);
         }
         else
         {
            §1t251s0§.instance.§1t1982s0§(param1,param2,param3);
            §1t406s0§.instance.§1t6636s0§(this.§1t3410s0§);
         }
         §1t1523s0§.§1t1981s0§ = true;
      }
      
      override public function §1t1967s0§(param1:int, param2:int) : *
      {
         var territoryx:int = param1;
         var territoryy:int = param2;
         var §1t15141s0§:int = territoryx << 12 | territoryy;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8960s0§),§1t15141s0§.toString(),function(param1:§1t23s0§):*
         {
            var §1t15142s0§:§1t71s0§ = null;
            var o:§1t23s0§ = param1;
            §1t15142s0§ = §1t70s0§.instance.§1t1126s0§(territoryx,territoryy,true);
            if(§1t1523s0§.§1t9663s0§(§1t15142s0§.§1t1342s0§()))
            {
               §1t3432s0§(§1t15142s0§.§1t1342s0§(),function(param1:§1t23s0§):*
               {
                  §1t15142s0§.§1t1351s0§(param1);
                  if(o == null)
                  {
                     o = new §1t23s0§(null,null,null,null,null,null);
                  }
                  §1t3411s0§(§1t15142s0§,o);
               });
            }
            else
            {
               §1t3411s0§(§1t15142s0§,o);
            }
         });
      }
      
      internal function §1t3411s0§(param1:§1t71s0§, param2:§1t23s0§) : *
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param2 == null)
         {
            param1.§1t1336s0§(",,",null);
         }
         else
         {
            _loc4_ = "";
            if(param2.founder != null && param2.founder != "")
            {
               _loc4_ = param2.founder;
            }
            _loc3_ = _loc4_ + "," + "" + "," + "";
            param1.§1t1336s0§(_loc3_,param2.influence);
         }
         param1.§1t1338s0§();
      }
      
      public function §1t3412s0§(param1:int, param2:int) : *
      {
         var §1t15142s0§:§1t71s0§ = null;
         var territoryx:int = param1;
         var territoryy:int = param2;
         §1t15142s0§ = §1t70s0§.instance.§1t1126s0§(territoryx,territoryy,true);
         if(§1t1523s0§.§1t9663s0§(§1t15142s0§.§1t1342s0§()))
         {
            this.§1t3432s0§(§1t15142s0§.§1t1342s0§(),function(param1:§1t23s0§):*
            {
               §1t15142s0§.§1t1351s0§(param1);
            });
         }
      }
      
      override public function §1t1961s0§(param1:int) : *
      {
         var _loc2_:Point = §1t70s0§.instance.§1t1133s0§(§1t123s0§.instance.§1t1563s0§);
         var _loc3_:int = §1t1523s0§.§1t7746s0§();
         var _loc4_:Boolean = §1t406s0§.instance.§1t6489s0§.§1t1961s0§(param1,_loc3_,_loc2_.x,_loc2_.y);
         if(_loc4_)
         {
            if(§1t1523s0§.§1t9501s0§ || §1t1833s0§ || §1t70s0§.instance.§1t1140s0§(_loc2_.x << 12 | _loc2_.y))
            {
               return;
            }
            §1t251s0§.instance.§1t1961s0§(§1t70s0§.instance.§1t1134s0§(§1t123s0§.instance.§1t1563s0§),_loc3_,param1);
         }
      }
      
      override public function §1t1909s0§(param1:int, param2:int, param3:int, param4:String, param5:String) : *
      {
         var _loc6_:Object = new Object();
         _loc6_.mapid = param1;
         _loc6_.side = param2;
         _loc6_.charside = param3;
         _loc6_.charname = param4;
         _loc6_.msg = param5;
         _loc6_.created = §1t1847s0§();
         this.client.§1t729s0§.createObject(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8961s0§),null,_loc6_);
      }
      
      override public function §1t1906s0§(param1:int, param2:int) : *
      {
         var msgArray:Array = null;
         var stopTime:int = 0;
         var startTime:int = 0;
         var mapid:int = param1;
         var side:int = param2;
         if(this.§1t3414s0§[mapid] == null || this.§1t3414s0§[mapid] == 0)
         {
            stopTime = §1t1847s0§() - 60 * 60 * 24 * 7;
         }
         else
         {
            stopTime = int(this.§1t3414s0§[mapid]);
         }
         startTime = §1t1847s0§();
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8961s0§),"ByMapIdSideCreated",[mapid,side],startTime,stopTime,50,function(param1:Array):*
         {
            var array:Array = param1;
            §1t3414s0§[mapid] = startTime;
            if(mapid == -1)
            {
               if(§1t3413s0§[mapid] == null)
               {
                  §1t3413s0§[mapid] = array;
               }
               else
               {
                  §1t3413s0§[mapid] = array.concat(§1t3413s0§[mapid]);
               }
               §1t406s0§.instance.§1t6482s0§.§1t8004s0§.msgBoard.§1t6320s0§(§1t3413s0§[mapid]);
               §1t3415s0§ += array.length;
               §1t3417s0§();
               return;
            }
            msgArray = array;
            client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8961s0§),"ByMapIdSideCreated",[mapid,0],startTime,stopTime,50,function(param1:Array):*
            {
               msgArray = msgArray.concat(param1);
               msgArray.sortOn("created",Array.NUMERIC | Array.DESCENDING);
               if(§1t3413s0§[mapid] == null)
               {
                  §1t3413s0§[mapid] = msgArray;
               }
               else
               {
                  §1t3413s0§[mapid] = msgArray.concat(§1t3413s0§[mapid]);
               }
               §1t406s0§.instance.§1t6482s0§.§1t8003s0§.msgBoard.§1t6320s0§(§1t3413s0§[mapid]);
               §1t3415s0§ += msgArray.length;
               §1t3417s0§();
            },function(param1:PlayerIOError):*
            {
               if(§1t3413s0§[mapid] == null)
               {
                  §1t3413s0§[mapid] = msgArray;
               }
               else
               {
                  §1t3413s0§[mapid] = msgArray.concat(§1t3413s0§[mapid]);
               }
               §1t406s0§.instance.§1t6482s0§.§1t8003s0§.msgBoard.§1t6320s0§(msgArray);
               §1t3415s0§ += msgArray.length;
               §1t3417s0§();
            });
         });
      }
      
      internal function §1t3417s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(this.§1t3415s0§ < this.§1t3416s0§)
         {
            return;
         }
         var _loc1_:int = §1t1847s0§();
         var _loc2_:String = "-1";
         for(_loc4_ in this.§1t3414s0§)
         {
            _loc3_ = int(this.§1t3414s0§[_loc4_]);
            if(_loc4_ != "-1")
            {
               if(_loc1_ - _loc3_ > 3600)
               {
                  _loc2_ = _loc4_;
                  break;
               }
               if(_loc3_ <= _loc1_)
               {
                  _loc1_ = _loc3_;
                  _loc2_ = _loc4_;
               }
            }
         }
         if(_loc2_ != "-1")
         {
            this.§1t3415s0§ -= this.§1t3413s0§[_loc2_].length;
            delete this.§1t3413s0§[_loc2_];
            delete this.§1t3414s0§[_loc2_];
         }
      }
      
      override public function §1t1915s0§(param1:int, param2:int, param3:int, param4:int, param5:String) : *
      {
         §1t251s0§.instance.§1t1915s0§(param1,param3,param4);
      }
      
      override public function §1t1918s0§(param1:int, param2:String) : *
      {
         §1t251s0§.instance.§1t1918s0§(param1,param2);
      }
      
      override public function §1t1921s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         var mapid:int = param1;
         var xpos:int = param2;
         var §1t2259s0§:int = param3;
         var side:int = param4;
         var mapid_x_y:String = mapid + "_" + xpos + "_" + §1t2259s0§;
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8962s0§),"ByMapIdXYSide",[mapid_x_y,side],null,null,10,function(param1:Array):*
         {
            §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7859s0§(param1);
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      override public function §1t1900s0§(param1:int, param2:Boolean = true) : *
      {
         var §1t15153s0§:Function = null;
         var side:int = param1;
         var §1t15155s0§:Boolean = param2;
         §1t15153s0§ = function():*
         {
            ++§1t3419s0§;
            if(§1t3419s0§ == 4)
            {
               §1t406s0§.instance.§1t6482s0§.§1t7977s0§(§1t3418s0§[§1t12072s0§],§1t3418s0§[§1t12073s0§],§1t3418s0§[§1t12074s0§],§1t3418s0§[§1t12075s0§],§1t3418s0§[§1t12076s0§]);
               §1t3419s0§ = 0;
            }
         };
         if(this.§1t3419s0§ > 0)
         {
            return;
         }
         ++this.§1t3419s0§;
         if(§1t15155s0§)
         {
            this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8949s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8963s0§),function(param1:§1t23s0§):*
            {
               var _loc4_:int = 0;
               §1t3418s0§[§1t12072s0§] = param1.territoryowners;
               §1t3418s0§[§1t12075s0§] = param1.nextupdate;
               §1t3418s0§[§1t12076s0§] = param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9041s0§)];
               var _loc2_:String = param1.territoryowners;
               var _loc3_:int = _loc2_.length;
               var _loc5_:§1t998s0§ = new §1t998s0§();
               var _loc6_:int = 0;
               while(_loc6_ < _loc3_)
               {
                  _loc4_ = _loc2_.charAt(_loc6_).charCodeAt(0) - §1t12077s0§;
                  if(§1t1523s0§.§1t9663s0§(_loc4_))
                  {
                     _loc5_.put(_loc4_,_loc4_.toString(),true);
                  }
                  _loc6_++;
               }
               var _loc7_:Array = _loc5_.§1t1007s0§();
               §1t3433s0§(_loc7_,§1t15153s0§);
               §1t406s0§.instance.§1t6480s0§.§1t8052s0§(§1t3418s0§[§1t12072s0§]);
            },function(param1:PlayerIOError):*
            {
            });
         }
         else
         {
            this.§1t3418s0§[§1t12072s0§] = "";
            this.§1t3418s0§[§1t12075s0§] = "";
            §1t15153s0§();
         }
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8962s0§),§1t1523s0§.charname,function(param1:§1t23s0§):*
         {
            if(param1 != null && param1.mapid_x_y != null)
            {
               §1t3418s0§[§1t12073s0§] = param1.mapid_x_y.split("_").join(",");
            }
            else
            {
               §1t3418s0§[§1t12073s0§] = "";
            }
            §1t15153s0§();
         },function(param1:PlayerIOError):*
         {
         });
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8964s0§),"ByMapId",null,null,null,1000,function(param1:Array):*
         {
            var _loc2_:§1t23s0§ = null;
            var _loc6_:String = null;
            var _loc3_:int = int(param1.length);
            var _loc4_:String = "";
            var _loc5_:int = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ = param1[_loc5_];
               _loc6_ = _loc2_.mapid + "," + _loc2_.side + "," + _loc2_.state + "," + _loc2_.x + "," + _loc2_.y;
               if(_loc4_ == "")
               {
                  _loc4_ = _loc6_;
               }
               else
               {
                  _loc4_ = _loc4_ + "|" + _loc6_;
               }
               _loc5_++;
            }
            §1t3418s0§[§1t12074s0§] = _loc4_;
            §1t15153s0§();
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      public function §1t3420s0§() : *
      {
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8964s0§),"ByMapId",null,null,null,1000,function(param1:Array):*
         {
            var _loc2_:§1t23s0§ = null;
            var _loc6_:String = null;
            var _loc3_:int = int(param1.length);
            var _loc4_:String = "";
            var _loc5_:int = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ = param1[_loc5_];
               _loc6_ = _loc2_.mapid + "," + _loc2_.side + "," + _loc2_.state + "," + _loc2_.x + "," + _loc2_.y;
               if(_loc4_ == "")
               {
                  _loc4_ = _loc6_;
               }
               else
               {
                  _loc4_ = _loc4_ + "|" + _loc6_;
               }
               _loc5_++;
            }
            §1t406s0§.instance.§1t6482s0§.§1t8021s0§(_loc4_);
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      public function §1t3421s0§(param1:int, param2:Function) : *
      {
         var key:String = null;
         var side:int = param1;
         var callback:Function = param2;
         if(side == 1)
         {
            key = "50000";
         }
         else if(side == 2)
         {
            key = "50001";
         }
         else if(side == 3)
         {
            key = "50002";
         }
         else
         {
            if(side != 4)
            {
               callback(0);
               return;
            }
            key = "50003";
         }
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8949s0§),key,function(param1:§1t23s0§):*
         {
            var _loc2_:int = 0;
            if(param1 != null)
            {
               _loc2_ = int(param1.value);
            }
            callback(_loc2_);
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      public function §1t3422s0§(param1:Function) : *
      {
         var callback:Function = param1;
         this.client.§1t729s0§.loadKeys(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8949s0§),["50000","50001","50002","50003"],function(param1:Array):*
         {
            var _loc4_:§1t23s0§ = null;
            var _loc2_:int = int(param1.length);
            var _loc3_:Array = [0,0,0,0];
            var _loc5_:int = 0;
            while(_loc5_ < _loc2_)
            {
               _loc4_ = param1[_loc5_];
               if(_loc4_.key == "50000")
               {
                  _loc3_[0] = _loc4_.value;
               }
               else if(_loc4_.key == "50001")
               {
                  _loc3_[1] = _loc4_.value;
               }
               else if(_loc4_.key == "50002")
               {
                  _loc3_[2] = _loc4_.value;
               }
               else if(_loc4_.key == "50003")
               {
                  _loc3_[3] = _loc4_.value;
               }
               _loc5_++;
            }
            callback(_loc3_);
         });
      }
      
      public function §1t3423s0§() : *
      {
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8949s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8963s0§),function(param1:§1t23s0§):*
         {
            var _loc4_:int = 0;
            §1t3418s0§[§1t12072s0§] = param1.territoryowners;
            §1t3418s0§[§1t12075s0§] = param1.nextupdate;
            §1t3418s0§[§1t12076s0§] = param1[§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9041s0§)];
            var _loc2_:String = param1.territoryowners;
            var _loc3_:int = _loc2_.length;
            var _loc5_:§1t998s0§ = new §1t998s0§();
            var _loc6_:int = 0;
            while(_loc6_ < _loc3_)
            {
               _loc4_ = _loc2_.charAt(_loc6_).charCodeAt(0) - §1t12077s0§;
               if(§1t1523s0§.§1t9663s0§(_loc4_))
               {
                  _loc5_.put(_loc4_,_loc4_.toString(),true);
               }
               _loc6_++;
            }
            var _loc7_:Array = _loc5_.§1t1007s0§();
            §1t3433s0§(_loc7_,§1t3424s0§);
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      internal function §1t3424s0§() : *
      {
         §1t406s0§.instance.§1t6480s0§.§1t8047s0§(this.§1t3418s0§[§1t12072s0§]);
      }
      
      override public function §1t1903s0§(param1:int, param2:int) : *
      {
         var mapid:int = param1;
         var side:int = param2;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8959s0§),mapid.toString(),function(param1:§1t23s0§):*
         {
            var townname:String = null;
            var tdata:String = null;
            var o:§1t23s0§ = param1;
            if(o == null)
            {
               §1t406s0§.instance.§1t6482s0§.§1t8018s0§("","0");
            }
            else
            {
               townname = "";
               if(o.name != null && o.name != "")
               {
                  townname = o.name;
               }
               tdata = o.prosperity + "," + o.side + "," + townname + ",";
               if(o.war)
               {
                  tdata += "1";
               }
               else
               {
                  tdata += "0";
               }
               if(!o.war)
               {
                  §1t406s0§.instance.§1t6482s0§.§1t8018s0§("",tdata);
               }
               else
               {
                  client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8966s0§),"ByMapId",[mapid],null,null,1000,function(param1:Array):*
                  {
                     var max:int;
                     var troops:Array = null;
                     var hexstr:String = null;
                     var o:§1t23s0§ = null;
                     var str:String = null;
                     var array:Array = param1;
                     troops = new Array(6);
                     var i:int = 0;
                     while(i < 6)
                     {
                        troops[i] = new Array(6);
                        i++;
                     }
                     hexstr = "";
                     max = int(array.length);
                     i = 0;
                     while(i < max)
                     {
                        o = array[i];
                        str = o.x + "," + o.y + "," + o.owner + "," + "" + "," + o.type + "," + o.cost + ",";
                        if(o.troops[side] != null)
                        {
                           str += o.troops[side];
                        }
                        else
                        {
                           str += "0";
                        }
                        if(hexstr == "")
                        {
                           hexstr = str;
                        }
                        else
                        {
                           hexstr += "|" + str;
                        }
                        troops[o.x][o.y] = o.troops;
                        i++;
                     }
                     client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8967s0§),mapid.toString(),function(param1:§1t23s0§):*
                     {
                        var _loc2_:int = 0;
                        if(param1 != null && param1.opened != null)
                        {
                           _loc2_ = int(param1.opened);
                        }
                        §1t406s0§.instance.§1t6482s0§.§1t8018s0§(hexstr,tdata,troops,_loc2_);
                     });
                  },function(param1:PlayerIOError):*
                  {
                     tdata = o.prosperity + "," + o.side + "," + o.townname + ",0";
                     §1t406s0§.instance.§1t6482s0§.§1t8018s0§("",tdata);
                  });
               }
            }
         },function(param1:PlayerIOError):*
         {
            §1t406s0§.instance.§1t6482s0§.§1t8018s0§("","0");
         });
      }
      
      override public function §1t1912s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         var mapid:int = param1;
         var xpos:int = param2;
         var §1t2259s0§:int = param3;
         var side:int = param4;
         var key:String = mapid + "_" + xpos + "_" + §1t2259s0§;
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8962s0§),"ByMapIdXYSide",[key,side],null,null,10,function(param1:Array):*
         {
            var _loc2_:§1t23s0§ = null;
            var _loc6_:String = null;
            var _loc7_:Array = null;
            var _loc3_:int = int(param1.length);
            var _loc4_:String = "";
            var _loc5_:int = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ = param1[_loc5_];
               _loc6_ = _loc2_.key;
               if(_loc6_.substr(0,4) == "bot_")
               {
                  _loc7_ = _loc6_.split("_");
                  _loc6_ = §1t136s0§.§1t9190s0§().§1t1818s0§(int(_loc7_[1]) * 130 + int(_loc7_[2]) * 11);
               }
               _loc4_ += _loc6_ + "," + _loc2_.playerlevel + "|";
               _loc5_++;
            }
            §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7867s0§(_loc4_);
         },function(param1:PlayerIOError):*
         {
            §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7867s0§("");
         });
      }
      
      override public function §1t1924s0§(param1:int, param2:int, param3:int, param4:int, param5:int) : *
      {
         §1t251s0§.instance.§1t1924s0§(param1,param2,param3,param4,param5);
      }
      
      override public function §1t1927s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         §1t251s0§.instance.§1t1927s0§(param1,param2,param3,param4);
      }
      
      override public function §1t1930s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         §1t251s0§.instance.§1t1930s0§(param1,param2,param3,param4);
      }
      
      public function §1t3425s0§(param1:int, param2:int, param3:int, param4:Function) : *
      {
         var mapid:int = param1;
         var xpos:int = param2;
         var §1t2259s0§:int = param3;
         var callback:Function = param4;
         var key:String = mapid + "_" + xpos + "_" + §1t2259s0§;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8966s0§),key,function(param1:§1t23s0§):*
         {
            if(param1 == null || param1.cpflag == null)
            {
               callback(0);
            }
            else
            {
               callback(param1.cpflag);
            }
         },function(param1:PlayerIOError):*
         {
            callback(0);
         });
      }
      
      override public function §1t1970s0§(param1:int, param2:int, param3:int, param4:int, param5:String, param6:Boolean) : *
      {
         §1t251s0§.instance.§1t1970s0§(param1,param2,param3,param4,param5,param6);
      }
      
      override public function §1t1973s0§(param1:int, param2:int, param3:int) : *
      {
         §1t251s0§.instance.§1t1973s0§(param1,param2,param3);
      }
      
      public function §1t3426s0§(param1:int, param2:Function) : *
      {
         var §1t15141s0§:int = param1;
         var callback:Function = param2;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8967s0§),§1t15141s0§.toString(),function(param1:§1t23s0§):*
         {
            if(param1 == null)
            {
               callback(0);
            }
            else if(param1.opened != null)
            {
               callback(param1.opened);
            }
            else
            {
               callback(0);
            }
         });
      }
      
      public function §1t3427s0§(param1:int) : *
      {
         var §1t15141s0§:int = param1;
         this.client.§1t729s0§.loadKeysOrCreate(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8967s0§),[§1t15141s0§.toString()],function(param1:Array):*
         {
            var _loc2_:§1t23s0§ = param1[0];
            _loc2_.opened = §1t1847s0§();
            _loc2_.save();
         });
      }
      
      override public function §1t1948s0§(param1:String, param2:String, param3:String, param4:int) : *
      {
         var newo:Object = null;
         var name1:String = param1;
         var name2:String = param2;
         var data:String = param3;
         var win:int = param4;
         if(§1t5565s0§.instance.§1t5616s0§())
         {
            newo = new Object();
            newo.player1 = name1;
            newo.player2 = name2;
            newo.data = data;
            newo.created = §1t1847s0§();
            newo.win = win;
            newo.version = §1t1523s0§.§1t9323s0§;
            newo.randomindex = int(Math.random() * 30000);
            this.client.§1t729s0§.createObject(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8968s0§),null,newo,function(param1:§1t23s0§):*
            {
               var _loc2_:String = null;
               var _loc3_:String = null;
               §1t5186s0§.instance.§1t6230s0§(param1.key);
               §1t5177s0§.instance.§1t6230s0§(param1.key);
               if(§1t1523s0§.isFacebook() && §1t3318s0§.instance.§1t3327s0§)
               {
                  §1t2022s0§();
               }
               if(name1 < name2)
               {
                  _loc2_ = name1 + "_" + name2;
               }
               else
               {
                  _loc2_ = name2 + "_" + name1;
               }
               if(win == 0)
               {
                  _loc3_ = name1;
               }
               else if(win == 1)
               {
                  _loc3_ = name2;
               }
               if(win != 2)
               {
                  §1t251s0§.instance.§1t3577s0§(_loc2_,_loc3_,param1.key);
               }
               §1t5565s0§.instance.§1t5617s0§();
            });
         }
         else
         {
            this.client.§1t729s0§.loadOrCreate(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8968s0§),§1t1523s0§.charname,function(param1:§1t23s0§):*
            {
               param1.player1 = name1;
               param1.player2 = name2;
               param1.data = data;
               param1.created = §1t1847s0§();
               param1.win = win;
               param1.version = §1t1523s0§.§1t9323s0§;
               param1.randomindex = int(Math.random() * 30000);
               param1.save();
               §1t5186s0§.instance.§1t6230s0§();
               §1t5177s0§.instance.§1t6230s0§();
               if(§1t1523s0§.isFacebook() && §1t3318s0§.instance.§1t3327s0§)
               {
                  §1t2022s0§();
               }
            });
         }
      }
      
      public function §1t3428s0§(param1:String, param2:String) : *
      {
         var pbid:String = param1;
         var pbname:String = param2;
         §1t8210s0§.quickConnect.simpleConnect(§1t1523s0§.§1t9365s0§.stage,this.§1t3323s0§,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8941s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8942s0§),function(param1:§1t150s0§):void
         {
            client = param1;
            if(pbid != null && pbid != "")
            {
               §1t1951s0§(pbid);
            }
            else if(pbname != null && pbname != "")
            {
               §1t1952s0§(pbname);
            }
            else
            {
               §1t1951s0§("0");
            }
         },function(param1:PlayerIOError):void
         {
         });
      }
      
      internal function informWatchPage(param1:§1t23s0§) : *
      {
         ExternalInterface.call("informWatchPage",param1.key,param1.views,param1.player1,param1.player2);
      }
      
      override public function §1t1951s0§(param1:String) : *
      {
         var id:String = param1;
         if(id == "0")
         {
            this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8968s0§),"ByRandom",null,int(Math.random() * 30000),null,1,function(param1:Array):*
            {
               if(param1.length == 0)
               {
                  if(§1t1540s0§.§1t10062s0§())
                  {
                     §1t1951s0§("0");
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(484),§1t1521s0§.getString(5));
                  }
               }
               else
               {
                  §1t1540s0§.§1t10036s0§();
                  §1t251s0§.instance.§1t3516s0§(param1[0].data);
                  param1[0].views += 1;
                  param1[0].save();
                  if(§1t1540s0§.§1t10062s0§() && !§1t1523s0§.§1t9501s0§)
                  {
                     informWatchPage(param1[0]);
                  }
               }
            },function(param1:PlayerIOError):*
            {
               if(!§1t1540s0§.§1t10062s0§())
               {
                  §1t1540s0§.§1t10036s0§();
               }
            });
         }
         else
         {
            this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8968s0§),id,function(param1:§1t23s0§):*
            {
               if(param1 == null)
               {
                  if(§1t1540s0§.§1t10062s0§())
                  {
                     §1t1951s0§("0");
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(484),§1t1521s0§.getString(5));
                  }
               }
               else
               {
                  §1t1540s0§.§1t10036s0§();
                  §1t251s0§.instance.§1t3516s0§(param1.data);
                  param1.views += 1;
                  param1.save();
                  if(§1t1540s0§.§1t10062s0§() && !§1t1523s0§.§1t9501s0§)
                  {
                     informWatchPage(param1);
                  }
               }
            },function(param1:PlayerIOError):*
            {
               if(!§1t1540s0§.§1t10062s0§())
               {
                  §1t1540s0§.§1t10036s0§();
               }
            });
         }
      }
      
      override public function §1t1952s0§(param1:String) : *
      {
         var charname:String = param1;
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8968s0§),"ByCharnameCreated",[charname],null,null,1,function(param1:Array):*
         {
            if(param1.length == 0)
            {
               if(§1t1540s0§.§1t10062s0§())
               {
                  §1t1951s0§("0");
               }
               else
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(484),§1t1521s0§.getString(5));
               }
            }
            else
            {
               §1t1540s0§.§1t10036s0§();
               §1t251s0§.instance.§1t3516s0§(param1[0].data);
               param1[0].views += 1;
               param1[0].save();
               if(§1t1540s0§.§1t10062s0§())
               {
                  informWatchPage(param1[0]);
               }
            }
         },function(param1:PlayerIOError):*
         {
            if(!§1t1540s0§.§1t10062s0§())
            {
               §1t1540s0§.§1t10036s0§();
            }
         });
      }
      
      override public function §1t1955s0§(param1:int, param2:int) : *
      {
         §1t406s0§.instance.§1t6489s0§.§1t5823s0§(param1,param2);
         if(§1t1523s0§.§1t9501s0§ || §1t1833s0§)
         {
            return;
         }
         if(param1 == 50005 || param1 == 50006)
         {
            return;
         }
         §1t251s0§.instance.§1t1955s0§(param1,param2);
      }
      
      override public function §1t1958s0§(param1:int) : *
      {
         var varid:int = param1;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8949s0§),varid.toString(),function(param1:§1t23s0§):*
         {
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      public function §1t1349s0§(param1:int) : *
      {
         var tx:int = 0;
         var ty:int = 0;
         var mapid:int = param1;
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8969s0§),"ByMapId",[mapid],null,null,3,function(param1:Array):*
         {
            tx = mapid >> 12 & 0x0FFF;
            ty = mapid & 0x0FFF;
            §1t70s0§.instance.§1t1126s0§(tx,ty,false).§1t1350s0§(param1);
         },function(param1:PlayerIOError):*
         {
            tx = mapid >> 12 & 0x0FFF;
            ty = mapid & 0x0FFF;
            §1t70s0§.instance.§1t1126s0§(tx,ty,false).§1t1350s0§(null);
         });
      }
      
      override public function §1t1992s0§(param1:String) : *
      {
         if(§1t1833s0§)
         {
            return;
         }
         §1t251s0§.instance.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9042s0§),param1);
      }
      
      override public function §1t1998s0§(param1:String) : *
      {
         if(§1t1833s0§)
         {
            return;
         }
         §1t251s0§.instance.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9043s0§),param1);
      }
      
      public function §1t3430s0§() : *
      {
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8970s0§),"ByRoomId",null,null,null,100,function(param1:Array):*
         {
            if(param1.length == 100)
            {
               §1t406s0§.instance.§1t5239s0§(">100 players found","#FFCC00");
            }
            else
            {
               §1t406s0§.instance.§1t5239s0§(param1.length + " player(s) found","#FFCC00");
            }
            var _loc2_:int = 0;
            while(_loc2_ < param1.length)
            {
               §1t406s0§.instance.§1t5239s0§(param1[_loc2_].key,"#FFFFFF");
               _loc2_++;
            }
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      override public function §1t1995s0§(param1:String) : *
      {
         if(§1t1833s0§)
         {
            return;
         }
         §1t251s0§.instance.§1t1995s0§(param1);
      }
      
      public function §1t3432s0§(param1:int, param2:Function = null) : *
      {
         var clanId:int = param1;
         var callback:Function = param2;
         if(callback != null && this.§1t3431s0§.contains(clanId))
         {
            callback(this.§1t3431s0§.get(clanId));
            return;
         }
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8971s0§),clanId.toString(),function(param1:§1t23s0§):*
         {
            if(param1 == null)
            {
               param1 = new §1t23s0§(null,null,null,null,null,null);
               param1.clanname = "?";
               param1.color = 3355443;
               param1.logo = 1;
               param1.logocolor = 13421772;
               param1.acronym = "???";
               param1.owned = 0;
               param1.founder = "?";
            }
            if(clanId == §1t1523s0§.§1t7746s0§())
            {
               §1t1523s0§.§1t9652s0§(param1.clanname,param1.color,param1.logo,param1.logocolor,param1.acronym,param1.founder,param1.owned);
            }
            §1t3431s0§.put(clanId,param1);
            if(callback != null)
            {
               callback(param1);
            }
         });
      }
      
      public function §1t3433s0§(param1:Array, param2:Function) : *
      {
         var keys:Array = param1;
         var callback:Function = param2;
         if(keys == null || keys.length == 0)
         {
            callback();
            return;
         }
         this.client.§1t729s0§.loadKeys(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8971s0§),keys,function(param1:Array):*
         {
            var _loc3_:§1t23s0§ = null;
            var _loc2_:int = int(param1.length);
            var _loc4_:int = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = param1[_loc4_];
               §1t3431s0§.put(int(_loc3_.key),_loc3_,true);
               _loc4_++;
            }
            callback();
         },function(param1:PlayerIOError):*
         {
            callback();
         });
      }
      
      public function §1t3434s0§(param1:int) : Boolean
      {
         return this.§1t3431s0§.contains(param1);
      }
      
      public function §1t3435s0§(param1:int) : §1t23s0§
      {
         return this.§1t3431s0§.get(param1);
      }
      
      public function §1t3436s0§(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:String, param8:int) : *
      {
         var _loc9_:§1t23s0§ = this.§1t3431s0§.get(param1);
         if(_loc9_ != null)
         {
            _loc9_.clanname = param2;
            _loc9_.color = param3;
            _loc9_.logo = param4;
            _loc9_.logocolor = param5;
            _loc9_.acronym = param6;
            _loc9_.founder = param7;
            _loc9_.owned = param8;
         }
      }
      
      public function §1t3437s0§(param1:int, param2:Function) : *
      {
         var level:int = param1;
         var callback:Function = param2;
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8972s0§),"ByLevel",null,[level],[level + 3],100,function(param1:Array):*
         {
            if(param1.length == 0)
            {
               callback(new §1t17s0§(2128));
            }
            var _loc2_:int = Math.random() * param1.length;
            callback(§1t17s0§.§1t8745s0§(param1[_loc2_].itemdata));
         });
      }
      
      override public function §1t2023s0§(param1:String, param2:String) : *
      {
         var indexstr:String = null;
         var stopTime:int = 0;
         var startTime:int = 0;
         var charname:String = param1;
         var caller:String = param2;
         if(charname == "[Event]" || charname == "[Tournament]")
         {
            indexstr = charname + caller;
         }
         else if(charname < caller)
         {
            indexstr = charname + caller;
         }
         else
         {
            indexstr = caller + charname;
         }
         if(this.§1t3439s0§[indexstr] == null)
         {
            stopTime = §1t1847s0§() - 60 * 60 * 24 * 30;
         }
         else
         {
            stopTime = int(this.§1t3439s0§[indexstr]);
         }
         startTime = §1t1847s0§();
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8973s0§),"ByIndexstrCreated",[indexstr],startTime,stopTime,50,function(param1:Array):*
         {
            var _loc2_:int = 0;
            var _loc3_:§1t23s0§ = null;
            var _loc4_:int = 0;
            var _loc5_:Array = null;
            var _loc6_:Array = null;
            §1t3439s0§[indexstr] = startTime;
            _loc2_ = int(§1t3443s0§.length);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = §1t3443s0§[_loc4_];
               if(_loc3_.charname == charname)
               {
                  _loc3_.read = true;
                  break;
               }
               _loc4_++;
            }
            _loc2_ = int(param1.length);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = param1[_loc4_];
               if(_loc3_.read == null || !_loc3_.read)
               {
                  _loc3_.read = true;
                  _loc3_.save();
               }
               if(_loc3_.msg == "" && _loc3_.msg2 != null && _loc3_.msg2 != "")
               {
                  _loc5_ = _loc3_.msg2.split("|");
                  if(_loc5_.length == 2)
                  {
                     _loc6_ = _loc5_[1].split(",");
                     _loc3_.msg = §1t1521s0§.getString(int(_loc5_[0]),_loc6_);
                  }
               }
               _loc4_++;
            }
            if(§1t3438s0§[indexstr] == null)
            {
               §1t3438s0§[indexstr] = param1;
            }
            else
            {
               §1t3438s0§[indexstr] = param1.concat(§1t3438s0§[indexstr]);
            }
            §1t406s0§.instance.§1t6499s0§.msgBoard.§1t6320s0§(§1t3438s0§[indexstr]);
            §1t3440s0§ += param1.length;
            §1t3442s0§();
         });
      }
      
      internal function §1t3442s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(this.§1t3440s0§ < this.§1t3441s0§)
         {
            return;
         }
         var _loc1_:int = §1t1847s0§();
         var _loc2_:String = "";
         for(_loc4_ in this.§1t3439s0§)
         {
            _loc3_ = int(this.§1t3439s0§[_loc4_]);
            if(_loc1_ - _loc3_ > 3600)
            {
               _loc2_ = _loc4_;
               break;
            }
            if(_loc3_ <= _loc1_)
            {
               _loc1_ = _loc3_;
               _loc2_ = _loc4_;
            }
         }
         if(_loc2_ != "")
         {
            this.§1t3440s0§ -= this.§1t3438s0§[_loc2_].length;
            delete this.§1t3438s0§[_loc2_];
            delete this.§1t3439s0§[_loc2_];
         }
      }
      
      override public function §1t2024s0§() : *
      {
         var startTime:int = 0;
         startTime = §1t1847s0§();
         this.§1t3445s0§ = startTime + 300;
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8973s0§),"ByRecipientCreated",[§1t1523s0§.charname],startTime,this.§1t3444s0§,1000,function(param1:Array):*
         {
            var _loc5_:String = null;
            var _loc6_:§1t23s0§ = null;
            var _loc9_:Array = null;
            var _loc10_:Array = null;
            §1t3444s0§ = startTime;
            if(§1t3443s0§ != null)
            {
               param1 = param1.concat(§1t3443s0§);
            }
            var _loc2_:int = int(param1.length);
            var _loc3_:Array = new Array();
            var _loc4_:Array = new Array();
            var _loc7_:Boolean = false;
            var _loc8_:int = 0;
            while(_loc8_ < _loc2_)
            {
               _loc6_ = param1[_loc8_];
               _loc5_ = _loc6_.charname;
               if(!§1t1543s0§.§1t10251s0§(_loc5_))
               {
                  if(_loc6_.msg == "" && _loc6_.msg2 != null && _loc6_.msg2 != "")
                  {
                     _loc9_ = _loc6_.msg2.split("|");
                     if(_loc9_.length == 2)
                     {
                        _loc10_ = _loc9_[1].split(",");
                        _loc6_.msg = §1t1521s0§.getString(int(_loc9_[0]),_loc10_);
                     }
                  }
                  if(_loc3_.indexOf(_loc5_) == -1)
                  {
                     _loc3_.push(_loc5_);
                     _loc4_.push(_loc6_);
                     if(_loc6_.read == null || !_loc6_.read)
                     {
                        _loc7_ = true;
                     }
                  }
               }
               _loc8_++;
            }
            §1t3443s0§ = _loc4_;
            if(§1t406s0§.instance.§1t6499s0§.visible)
            {
               §1t406s0§.instance.§1t6499s0§.msgBoard.§1t6321s0§(_loc4_);
            }
            if(_loc7_)
            {
               §1t406s0§.instance.§1t6646s0§();
            }
         });
      }
      
      public function §1t3446s0§() : *
      {
         if(this.§1t3443s0§ != null)
         {
            this.§1t3438s0§.length = 0;
            this.§1t3439s0§.length = 0;
            this.§1t3440s0§ = 0;
            this.§1t3443s0§.length = 0;
            this.§1t3444s0§ = 0;
         }
      }
      
      override public function §1t2025s0§(param1:Array, param2:Array, param3:§1t139s0§) : *
      {
         var §1t15185s0§:Array = null;
         var §1t5705s0§:§1t398s0§ = null;
         var myFriendItem:§1t398s0§ = null;
         var §1t15186s0§:Array = param1;
         var keys:Array = param2;
         var §1t15187s0§:§1t139s0§ = param3;
         var max:int = int(§1t15186s0§.length);
         §1t15185s0§ = new Array();
         var i:int = 0;
         while(i < max)
         {
            §1t5705s0§ = §1t15186s0§[i];
            §1t15185s0§[§1t5705s0§.charname] = §1t5705s0§;
            i++;
         }
         myFriendItem = §1t15186s0§[0];
         this.client.§1t729s0§.loadKeys(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8958s0§),keys,function(param1:Array):*
         {
            var _loc3_:§1t23s0§ = null;
            var _loc2_:int = int(param1.length);
            var _loc4_:int = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = param1[_loc4_];
               §1t15185s0§[_loc3_.key].wins = _loc3_.wins;
               _loc4_++;
            }
            §1t15186s0§.sortOn("wins",Array.NUMERIC | Array.DESCENDING);
            §1t15187s0§.§1t5740s0§(§1t15186s0§.indexOf(myFriendItem) - 2);
         },function(param1:PlayerIOError):*
         {
         });
      }
      
      public function §1t3447s0§() : *
      {
         this.client.multiplayer.listRooms(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8868s0§),null,1000,0,function(param1:Array):*
         {
            var _loc2_:int = int(param1.length);
            var _loc3_:int = 0;
            var _loc4_:int = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ += param1[_loc4_].onlineUsers;
               _loc4_++;
            }
            §1t406s0§.instance.§1t5239s0§(§1t1521s0§.getString(966,[_loc3_]),"#FFCC00");
         });
      }
      
      public function §1t3448s0§() : *
      {
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8965s0§),"ByStatus",null,0,2,20,function(param1:Array):*
         {
            var _loc3_:§1t23s0§ = null;
            var _loc5_:* = undefined;
            if(param1.length > 0 && param1[param1.length - 1].status == 2)
            {
               param1.pop();
            }
            var _loc2_:int = int(param1.length);
            var _loc4_:* = int(_loc2_ - 1);
            while(_loc4_ >= 0)
            {
               _loc3_ = param1[_loc4_];
               if(_loc3_.status == 2)
               {
                  param1.splice(_loc4_,1);
               }
               else if(_loc3_.players.indexOf(§1t1523s0§.charname) != -1)
               {
                  _loc3_.title = _loc3_.title + " (" + §1t1521s0§.getString(11023) + ")";
               }
               _loc4_--;
            }
            if(param1.length < 20 && §1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§))
            {
               _loc5_ = new §1t23s0§("","new","",0,false,null);
               _loc5_.title = §1t1521s0§.getString(11060);
               param1.push(_loc5_);
            }
            §1t406s0§.instance.§1t6484s0§.listingsUI.§1t7163s0§(param1);
         });
      }
      
      public function §1t3449s0§(param1:String) : *
      {
         var key:String = param1;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8965s0§),key,function(param1:§1t23s0§):*
         {
            if(param1.players.indexOf(§1t1523s0§.charname) != -1)
            {
               param1.title = param1.title + " (" + §1t1521s0§.getString(11023) + ")";
            }
            §1t406s0§.instance.§1t6484s0§.listingsUI.§1t7165s0§(param1);
         });
      }
      
      public function §1t3450s0§() : *
      {
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8965s0§),"ByStatusCreated",[2],null,null,20,function(param1:Array):*
         {
            §1t406s0§.instance.§1t6484s0§.listingsUI.§1t7164s0§(param1);
         });
      }
      
      public function §1t3451s0§(param1:String, param2:Boolean, param3:Boolean) : *
      {
         var tid:String = param1;
         var needBetData:Boolean = param2;
         var §1t15194s0§:Boolean = param3;
         if(!needBetData)
         {
            §1t15194s0§ = false;
         }
         this.client.§1t729s0§.loadRange(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8974s0§),"ByTid",[tid],null,null,1000,function(param1:Array):*
         {
            var array:Array = param1;
            if(!needBetData)
            {
               §1t406s0§.instance.§1t6484s0§.§1t5293s0§.§1t7063s0§(array,null,null);
            }
            client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8975s0§),tid + "_" + §1t1523s0§.charname,function(param1:§1t23s0§):*
            {
               var beto:§1t23s0§ = param1;
               if(!§1t15194s0§)
               {
                  §1t406s0§.instance.§1t6484s0§.§1t5293s0§.§1t7063s0§(array,beto,null);
               }
               else
               {
                  client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8965s0§),tid,function(param1:§1t23s0§):*
                  {
                     §1t406s0§.instance.§1t6484s0§.§1t5293s0§.§1t7063s0§(array,beto,param1);
                  });
               }
            });
         },function(param1:PlayerIOError):*
         {
            §1t406s0§.instance.§1t6484s0§.hide();
         });
      }
      
      public function §1t3452s0§(param1:String) : *
      {
         var charname:String = param1;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8955s0§),charname,function(param1:§1t23s0§):*
         {
            if(param1 == null || !param1.online)
            {
               §1t406s0§.instance.§1t6484s0§.§1t5293s0§.§1t7083s0§();
            }
            else
            {
               §1t406s0§.instance.§1t6484s0§.hide();
               §1t5565s0§.instance.§1t5589s0§();
               §1t5565s0§.instance.§1t5594s0§(charname,param1.playerlevel,param1.equipment,true);
            }
         });
      }
      
      public function §1t3453s0§(param1:int) : *
      {
         var side:int = param1;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8971s0§),side.toString() + "_orbat",function(param1:§1t23s0§):*
         {
            if(param1 == null)
            {
               §1t406s0§.instance.§1t6482s0§.§1t5026s0§(null);
            }
            else
            {
               §1t406s0§.instance.§1t6482s0§.§1t8004s0§.§1t7943s0§.§1t7919s0§(param1);
            }
         });
      }
      
      public function §1t3454s0§() : *
      {
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9064s0§),§1t1523s0§.§1t9764s0§(),function(param1:§1t23s0§):*
         {
            §1t24s0§.§1t8784s0§(param1);
         },function(param1:PlayerIOError):*
         {
            §1t24s0§.§1t8795s0§();
         });
      }
      
      public function §1t3455s0§(param1:String) : *
      {
         var §1t15199s0§:String = param1;
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9064s0§),§1t15199s0§,function(param1:§1t23s0§):*
         {
            if(param1 != null && param1.§1t916s0§ != "")
            {
               §1t132s0§.§1t9190s0§().§1t1715s0§(param1);
            }
            else
            {
               §1t132s0§.§1t9190s0§().§1t1716s0§();
            }
         },function(param1:PlayerIOError):*
         {
            §1t132s0§.§1t9190s0§().§1t1716s0§();
         });
      }
      
      public function §1t3462s0§() : *
      {
         this.§1t3456s0§ = 0;
         this.§1t3457s0§ = 0;
         this.§1t3458s0§ = false;
         this.§1t3459s0§ = false;
         this.§1t3460s0§ = false;
         serverTime = 0;
      }
      
      public function §1t3463s0§(param1:String, param2:Boolean) : Boolean
      {
         if(this.§1t3456s0§ == 0 || this.§1t3457s0§ == 0)
         {
            this.§1t3456s0§ = this.§1t3367s0§();
            this.§1t3457s0§ = §1t1847s0§();
         }
         var _loc3_:Number = §1t1847s0§() - this.§1t3457s0§;
         var _loc4_:Number = (this.§1t3367s0§() - this.§1t3456s0§) / 1000;
         var _loc5_:Number = _loc3_ - _loc4_;
         if(!§1t1523s0§.§1t9516s0§ && param2 && _loc5_ >= 300)
         {
            serverTime -= _loc5_;
            ++this.§1t3461s0§;
            if(this.§1t3461s0§ == 3)
            {
               §1t406s0§.instance.§1t6639s0§();
               return true;
            }
            return false;
         }
         if(!this.§1t3460s0§ && _loc5_ >= 600)
         {
            this.§1t3409s0§(param1 + " " + _loc5_ + " " + this.§1t3458s0§ + " " + this.§1t3459s0§ + " " + §1t1521s0§.getString(118));
            this.§1t3460s0§ = true;
         }
         if(!this.§1t3459s0§ && _loc5_ >= 300)
         {
            this.§1t1982s0§(param1 + " " + _loc5_ + " " + this.§1t3458s0§ + " " + §1t1521s0§.getString(118),false,true);
            this.§1t3459s0§ = true;
            return true;
         }
         if(!this.§1t3458s0§ && _loc5_ >= 60)
         {
            this.§1t3458s0§ = true;
            return true;
         }
         return false;
      }
      
      override public function §1t1897s0§() : *
      {
         this.client.§1t729s0§.load(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9025s0§),"attendence",function(param1:§1t23s0§):*
         {
            var _loc2_:Array = param1.yesterday;
            if(_loc2_ != null)
            {
               §1t406s0§.instance.§1t6482s0§.§1t8002s0§.§1t7736s0§(_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
            }
            else
            {
               §1t406s0§.instance.§1t6482s0§.§1t8002s0§.§1t7736s0§(0,0,0,0);
            }
         },function(param1:PlayerIOError):*
         {
            §1t406s0§.instance.§1t6482s0§.§1t8002s0§.§1t7736s0§(0,0,0,0);
         });
      }
      
      public function §1t3464s0§() : Boolean
      {
         var _loc1_:int = Math.random() * 1000;
         var _loc2_:int = 0;
         while(_loc2_ < 20)
         {
            if(int(Math.random() * 1000) != _loc1_)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      override public function §1t1986s0§(param1:int, param2:String, param3:int) : *
      {
         if(§1t1833s0§)
         {
            return;
         }
         §1t251s0§.instance.§1t1986s0§(param1,param2,param3);
      }
      
      override public function §1t1933s0§(param1:String) : *
      {
         if(§1t1833s0§)
         {
            return;
         }
         §1t251s0§.instance.§1t1933s0§(param1);
      }
   }
}

