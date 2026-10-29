package
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import playerio.*;
   
   public class §1t81s0§
   {
      
      internal static var §1t9255s0§:§1t81s0§;
      
      internal static var §1t9238s0§:int = -1;
      
      internal static var §1t9239s0§:int = 0;
      
      internal static var §1t9240s0§:int = 1;
      
      internal static var §1t9241s0§:int = 2;
      
      internal static var §1t9242s0§:int = 3;
      
      internal static var §1t9243s0§:int = 0;
      
      internal static var §1t9244s0§:int = 1;
      
      internal static var §1t9245s0§:int = 2;
      
      internal static var §1t9246s0§:int = 3;
      
      internal static var §1t9247s0§:int = 4;
      
      internal static var §1t9248s0§:int = 5;
      
      internal static var §1t9249s0§:int = 6;
      
      internal static var §1t9250s0§:int = 7;
      
      internal static var §1t9251s0§:int = 8;
      
      internal static var §1t9252s0§:int = 9;
      
      internal static var §1t9253s0§:int = 10;
      
      internal static var §1t9254s0§:int = 11;
      
      internal var target:String = "";
      
      internal var §1t1413s0§:String = "";
      
      internal var purpose:int;
      
      internal var params:String = "";
      
      internal var status:int = §1t9238s0§;
      
      internal var §1t1417s0§:Boolean = false;
      
      internal var connection:§1t82s0§;
      
      internal var §1t1419s0§:int = 0;
      
      internal var §1t1420s0§:Boolean = false;
      
      internal var timer:Timer = new Timer(1000);
      
      internal var §1t1422s0§:§1t251s0§;
      
      internal var §1t1423s0§:§1t142s0§;
      
      internal var latency:int = -1;
      
      public var §1t1425s0§:Boolean = false;
      
      internal var obj:Object = new Object();
      
      public function §1t81s0§()
      {
         super();
         this.§1t1422s0§ = §1t251s0§.instance;
      }
      
      public static function §1t9256s0§(param1:String, param2:int, param3:String = "") : §1t81s0§
      {
         var _loc4_:§1t81s0§ = new §1t81s0§();
         _loc4_.target = param1;
         _loc4_.purpose = param2;
         _loc4_.params = param3;
         return _loc4_;
      }
      
      internal static function §1t9257s0§(param1:§1t81s0§) : *
      {
         §1t9258s0§();
         §1t9255s0§ = param1;
         §1t251s0§.instance.§1t3466s0§ = param1;
      }
      
      public static function §1t9258s0§() : *
      {
         if(§1t9255s0§ != null && §1t9255s0§.connection != null && §1t9255s0§.connection.connected)
         {
            §1t9255s0§.§1t1428s0§();
            §1t9255s0§.§1t1430s0§(§1t9242s0§);
         }
         §1t251s0§.instance.§1t3466s0§ = null;
      }
      
      public static function §1t9259s0§() : §1t82s0§
      {
         if(§1t9255s0§ == null)
         {
            return null;
         }
         if(!§1t9255s0§.§1t1443s0§())
         {
            return null;
         }
         return §1t9255s0§.connection;
      }
      
      public static function §1t9260s0§() : String
      {
         if(§1t9255s0§ == null)
         {
            return null;
         }
         return §1t9255s0§.target;
      }
      
      public function §1t1426s0§(param1:String) : *
      {
         var myserviceroom:String = param1;
         this.§1t1417s0§ = true;
         if(this.purpose == §1t9243s0§ || this.purpose == §1t9252s0§)
         {
            §1t9257s0§(this);
         }
         else if(this.purpose == §1t9249s0§)
         {
            this.§1t1432s0§(myserviceroom,false);
            return;
         }
         if(this.§1t1422s0§.§1t3593s0§(this.target))
         {
            this.§1t1432s0§(myserviceroom,true);
            return;
         }
         §1t3318s0§.instance.client.§1t729s0§.load("OnlinePlayers",this.target,function(param1:§1t23s0§):*
         {
            if(param1 == null || param1.roomid == null || param1.roomid == "")
            {
               if(purpose == §1t9243s0§)
               {
                  §1t5565s0§.instance.§1t5597s0§();
               }
               else if(purpose == §1t9252s0§)
               {
                  §1t6477s0§.instance.§1t5597s0§();
               }
               §1t1430s0§(§1t9241s0§);
            }
            else
            {
               §1t1432s0§(param1.roomid,param1.roomid == myserviceroom);
            }
         },function(param1:PlayerIOError):*
         {
            §1t1430s0§(§1t9240s0§);
         });
      }
      
      internal function §1t1427s0§(param1:TimerEvent) : *
      {
         ++this.§1t1419s0§;
         if(this.§1t1419s0§ >= 60 && this.status != §1t9239s0§)
         {
            this.§1t1428s0§();
            this.§1t1430s0§(§1t9242s0§);
         }
      }
      
      public function §1t1428s0§() : *
      {
         if(!this.§1t1420s0§)
         {
            this.§1t1434s0§();
         }
         else
         {
            this.§1t1440s0§();
         }
         this.§1t1430s0§(§1t9242s0§);
      }
      
      public function §1t1429s0§() : *
      {
         var _loc1_:Array = this.params.split(",");
         this.§1t1417s0§ = false;
         if(this.purpose == §1t9243s0§ || this.purpose == §1t9252s0§)
         {
            if(§1t9255s0§ != null && §1t9255s0§.status == §1t9239s0§)
            {
               this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8913s0§),1,this.target,this.purpose);
               this.§1t1428s0§();
            }
            else
            {
               §1t9257s0§(this);
               this.§1t1438s0§(this.target,§1t1523s0§.charname);
               this.timer.start();
               this.timer.addEventListener(TimerEvent.TIMER,this.§1t1427s0§,false,0,true);
            }
         }
         else if(this.purpose == §1t9244s0§)
         {
            if(!§1t1543s0§.§1t10251s0§(this.target))
            {
               §1t406s0§.instance.§1t5239s0§(this.target + " invited you to join channel: " + this.params,"#FFCC00");
            }
         }
         else if(this.purpose == §1t9245s0§)
         {
            §1t406s0§.instance.§1t6647s0§();
         }
         else if(this.purpose == §1t9250s0§)
         {
            if(!§1t1543s0§.§1t10251s0§(this.target))
            {
               §1t406s0§.instance.§1t6646s0§(this.target);
            }
         }
         else if(this.purpose == §1t9251s0§)
         {
            §1t3318s0§.instance.§1t3404s0§();
         }
         else if(this.purpose == §1t9246s0§)
         {
            §1t1523s0§.§1t9726s0§(_loc1_[0],_loc1_[1]);
            this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8913s0§),0,this.target,this.purpose);
         }
         else if(this.purpose == §1t9247s0§)
         {
            if(§1t1540s0§.§1t9550s0§())
            {
               §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(_loc1_[0],_loc1_[1],400);
               §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12486s0§);
            }
            else
            {
               §1t1525s0§.§1t9916s0§(_loc1_[0]);
            }
            this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8913s0§),0,this.target,this.purpose);
         }
         else if(this.purpose == §1t9248s0§)
         {
            this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8913s0§),0,this.target,this.purpose);
            this.§1t1422s0§.§1t3521s0§();
            §1t1540s0§.§1t10039s0§();
            if(§1t1523s0§.§1t9503s0§)
            {
               this.§1t1422s0§.§1t3589s0§();
            }
            §1t3317s0§.instance.§1t1856s0§();
            §1t7017s0§.instance.§1t7030s0§();
            §1t7017s0§.instance.login.errormessage.text = §1t1521s0§.getString(31);
            §1t7017s0§.instance.§1t7039s0§();
            §1t7017s0§.instance.§1t7042s0§(§1t1521s0§.getString(674));
         }
         else if(this.purpose == §1t9249s0§)
         {
            if(!this.§1t1417s0§)
            {
               this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8913s0§),0,this.target,this.purpose);
               §1t406s0§.instance.§1t6638s0§();
            }
         }
         else if(this.purpose == §1t9253s0§)
         {
            §1t1523s0§.§1t1981s0§ = true;
            this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8913s0§),0,this.target,this.purpose);
         }
         else if(this.purpose == §1t9254s0§)
         {
            §1t1523s0§.§1t9520s0§ = true;
            this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8913s0§),0,this.target,this.purpose);
         }
      }
      
      internal function §1t1430s0§(param1:int) : *
      {
         this.status = param1;
         if(this.status != §1t9239s0§)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.§1t1427s0§);
         }
      }
      
      public function §1t1431s0§() : int
      {
         return this.status;
      }
      
      internal function §1t1432s0§(param1:String, param2:Boolean) : *
      {
         var _loc3_:* = undefined;
         if(!param2)
         {
            _loc3_ = new Object();
            _loc3_.Name = §1t1523s0§.charname;
            _loc3_.invis = "3";
            §1t3318s0§.instance.client.multiplayer.joinRoom(param1,_loc3_,this.§1t1433s0§,this.§1t1437s0§);
         }
         else
         {
            this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8909s0§),this.target,this.purpose,this.params);
            this.§1t1422s0§.§1t3582s0§.§1t2164s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8910s0§),this.§1t1435s0§);
         }
         this.timer.start();
         this.timer.addEventListener(TimerEvent.TIMER,this.§1t1427s0§,false,0,true);
      }
      
      internal function §1t1433s0§(param1:§1t82s0§) : *
      {
         this.connection = param1;
         param1.§1t2166s0§(this.§1t1436s0§);
         param1.§1t2164s0§("*",this.§1t1435s0§);
         this.§1t1420s0§ = false;
         param1.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8909s0§),this.target,this.purpose,this.params);
      }
      
      internal function §1t1434s0§() : *
      {
         if(this.connection != null && this.connection.connected)
         {
            this.connection.disconnect();
            this.connection.§1t2167s0§(this.§1t1436s0§);
            this.connection.§1t2165s0§("*",this.§1t1435s0§);
         }
         this.§1t1422s0§.§1t3582s0§.§1t2165s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8910s0§),this.§1t1435s0§);
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.§1t1427s0§);
      }
      
      internal function §1t1435s0§(param1:§1t84s0§) : *
      {
         var response:int = 0;
         var mname:String = null;
         var mpurpose:int = 0;
         var m:§1t84s0§ = param1;
         try
         {
            switch(m.type)
            {
               case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8910s0§):
                  response = m.§1t1005s0§(0);
                  if(response == 1)
                  {
                     if(this.purpose == §1t9243s0§)
                     {
                        this.§1t1430s0§(§1t9241s0§);
                        §1t406s0§.instance.§1t6538s0§("3");
                     }
                     else if(this.purpose == §1t9252s0§)
                     {
                        this.§1t1430s0§(§1t9241s0§);
                        §1t6477s0§.instance.§1t5026s0§(null);
                        §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11081,[this.target]),§1t1521s0§.getString(5));
                     }
                     else if(this.purpose == §1t9246s0§ || this.purpose == §1t9247s0§ || this.purpose == §1t9248s0§ || this.purpose == §1t9253s0§ || this.purpose == §1t9254s0§)
                     {
                        §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = §1t1521s0§.getString(11115);
                        this.§1t1428s0§();
                     }
                     else if(this.purpose == §1t9249s0§)
                     {
                        this.§1t1428s0§();
                     }
                  }
                  else if(response == 2 && this.purpose == §1t9252s0§)
                  {
                     this.§1t1430s0§(§1t9241s0§);
                     §1t6477s0§.instance.§1t5026s0§(null);
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11492),§1t1521s0§.getString(5));
                     this.§1t1428s0§();
                     this.§1t1430s0§(§1t9242s0§);
                  }
                  else if(response == 0)
                  {
                     if(this.purpose == §1t9243s0§ || this.purpose == §1t9252s0§)
                     {
                        mname = m.getString(1);
                        mpurpose = m.§1t1005s0§(2);
                        if(mname == this.target && mpurpose == this.purpose)
                        {
                           this.§1t1434s0§();
                           this.§1t1438s0§(§1t1523s0§.charname,this.target);
                        }
                     }
                     else if(this.purpose == §1t9246s0§ || this.purpose == §1t9247s0§ || this.purpose == §1t9248s0§ || this.purpose == §1t9253s0§ || this.purpose == §1t9254s0§)
                     {
                        §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = §1t1521s0§.getString(11114);
                        this.§1t1428s0§();
                     }
                     else if(this.purpose == §1t9249s0§)
                     {
                        this.§1t1428s0§();
                     }
                  }
            }
         }
         catch(e:Error)
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§(e.message,"svc:" + purpose + "," + (§1t406s0§.instance == null) + "," + m.toString(),e.getStackTrace(),e.errorID);
         }
      }
      
      internal function §1t1436s0§() : void
      {
         this.§1t1430s0§(§1t9240s0§);
      }
      
      internal function §1t1437s0§(param1:PlayerIOError) : *
      {
         this.§1t1430s0§(§1t9240s0§);
      }
      
      internal function §1t1438s0§(param1:String, param2:String) : *
      {
         var _loc3_:* = new Object();
         _loc3_.charname = §1t1523s0§.charname;
         var _loc4_:String = param1 + "_" + param2;
         var _loc5_:String = "SHS3Connection";
         if(this.purpose == §1t9243s0§ && §1t1523s0§.§1t9508s0§)
         {
            _loc5_ = "SHS3DuelConnection";
         }
         §1t3318s0§.instance.client.multiplayer.createJoinRoom(_loc4_,_loc5_,true,{},_loc3_,this.§1t1439s0§,this.§1t1442s0§);
         this.§1t1420s0§ = true;
      }
      
      internal function §1t1439s0§(param1:§1t82s0§) : *
      {
         this.connection = param1;
         param1.§1t2166s0§(this.§1t1441s0§);
         param1.§1t2164s0§("*",this.§1t1445s0§);
         if(!this.§1t1417s0§)
         {
            this.§1t1422s0§.§1t3582s0§.send(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8913s0§),0,this.target,this.purpose);
         }
         else
         {
            this.§1t1430s0§(§1t9239s0§);
         }
      }
      
      internal function §1t1440s0§() : *
      {
         if(this.connection != null && this.connection.connected)
         {
            this.connection.disconnect();
            this.connection.§1t2167s0§(this.§1t1441s0§);
            this.connection.§1t2165s0§("*",this.§1t1445s0§);
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.§1t1427s0§);
         }
         if(§1t1523s0§.§1t9499s0§ && this.§1t1423s0§ != null)
         {
            this.§1t1423s0§.disconnect();
         }
      }
      
      internal function §1t1441s0§() : void
      {
         this.§1t1430s0§(§1t9242s0§);
      }
      
      internal function §1t1442s0§(param1:PlayerIOError) : *
      {
         this.§1t1430s0§(§1t9240s0§);
      }
      
      public function §1t1443s0§() : Boolean
      {
         return this.§1t1420s0§ && this.status == §1t9239s0§;
      }
      
      public function §1t1445s0§(param1:§1t84s0§) : *
      {
         var §1t13169s0§:String = null;
         var §1t13170s0§:int = 0;
         var receiver:String = null;
         var §1t13172s0§:int = 0;
         var §1t13173s0§:int = 0;
         var str:String = null;
         var §1t13174s0§:Array = null;
         var max:int = 0;
         var item:§1t17s0§ = null;
         var i:int = 0;
         var §1t1702s0§:int = 0;
         var npc:§1t122s0§ = null;
         var §1t13175s0§:String = null;
         var victim:String = null;
         var hp:int = 0;
         var launched:String = null;
         var §1t13176s0§:Boolean = false;
         var §1t13177s0§:int = 0;
         var actionState:int = 0;
         var xpos:int = 0;
         var §1t2259s0§:int = 0;
         var facingRight:Boolean = false;
         var anim:String = null;
         var §1t13178s0§:String = null;
         var §1t13179s0§:String = null;
         var §1t13180s0§:String = null;
         var §1t13181s0§:String = null;
         var §1t13182s0§:String = null;
         var §1t13183s0§:String = null;
         var §1t13184s0§:int = 0;
         var §1t13185s0§:* = undefined;
         var §1t13186s0§:String = null;
         var §1t13187s0§:String = null;
         var §1t13188s0§:int = 0;
         var §1t13189s0§:String = null;
         var §1t13190s0§:String = null;
         var §1t13191s0§:§1t122s0§ = null;
         var §1t13192s0§:§1t8624s0§ = null;
         var §1t13193s0§:int = 0;
         var player:§1t99s0§ = null;
         var §1t13194s0§:§1t122s0§ = null;
         var §1t13195s0§:int = 0;
         var §1t13196s0§:int = 0;
         var color:String = null;
         var ally:Boolean = false;
         var m:§1t84s0§ = param1;
         try
         {
            if(m.type == "UserJoined")
            {
               if(!this.§1t1417s0§ && this.status != §1t9239s0§)
               {
                  this.§1t1430s0§(§1t9239s0§);
                  this.connection.send("private",§1t251s0§.§1t12084s0§,this.target);
               }
            }
            else if(m.type == "UserLeft")
            {
               this.§1t1428s0§();
               this.§1t1430s0§(§1t9242s0§);
               if(this.purpose == §1t9243s0§)
               {
                  this.§1t1422s0§.§1t2053s0§(this.§1t1413s0§);
               }
               else if(this.purpose == §1t9252s0§)
               {
                  this.§1t1422s0§.§1t3468s0§(this.§1t1413s0§);
               }
            }
            else if(m.type == "ping")
            {
               this.connection.send("pong");
            }
            else if(m.type == "private")
            {
               switch(m.§1t1005s0§(0))
               {
                  case §1t251s0§.§1t12084s0§:
                     if(this.§1t1422s0§.§1t3465s0§ == §1t251s0§.§1t12079s0§)
                     {
                        if(this.purpose == §1t9243s0§)
                        {
                           this.connection.send("private",§1t251s0§.§1t12085s0§,this.target,§1t1523s0§.charname,§1t1523s0§.getLevel(),§1t1523s0§.§1t9730s0§(),§1t1523s0§.§1t9732s0§(),§1t1523s0§.§1t9733s0§(),§1t1523s0§.§1t5608s0§(),§1t5565s0§.instance.§1t5613s0§(),§1t1523s0§.stance,§1t251s0§.instance.nid);
                        }
                        else if(this.purpose == §1t9252s0§)
                        {
                           this.connection.send("private",§1t251s0§.§1t12103s0§,this.target);
                        }
                     }
                     break;
                  case §1t251s0§.§1t12085s0§:
                     if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                     {
                        this.connection.send("private",§1t251s0§.§1t12087s0§,this.target,"2");
                        this.§1t1428s0§();
                     }
                     else if(this.§1t1422s0§.§1t3470s0§() && !§1t1543s0§.§1t10251s0§(this.target))
                     {
                        this.§1t1422s0§.§1t3465s0§ = §1t251s0§.§1t12080s0§;
                        this.obj = new Object();
                        this.obj.charname = m.getString(2);
                        this.obj.charlvl = m.§1t1005s0§(3);
                        this.obj.stats = m.getString(4);
                        this.obj.equip = m.getString(5);
                        this.obj.skills = m.getString(6);
                        this.obj.taunt = m.getString(7);
                        this.obj.bg = m.§1t1005s0§(8);
                        this.obj.stance = m.§1t1005s0§(9);
                        this.§1t1413s0§ = m.getString(10);
                        §1t406s0§.instance.§1t6537s0§(this.obj,this.target,this.§1t1413s0§);
                        if(§1t1523s0§.§1t9499s0§ && this.obj.charname != this.§1t1413s0§)
                        {
                           this.§1t1423s0§ = §1t142s0§.§1t9256s0§(this.§1t1413s0§,this);
                        }
                     }
                     else
                     {
                        this.connection.send("private",§1t251s0§.§1t12087s0§,this.target,"3");
                        this.§1t1428s0§();
                     }
                     break;
                  case §1t251s0§.§1t12086s0§:
                     this.§1t1422s0§.§1t3465s0§ = §1t251s0§.§1t12078s0§;
                     §1t406s0§.instance.§1t6539s0§();
                     this.§1t1428s0§();
                     this.§1t1430s0§(§1t9242s0§);
                     break;
                  case §1t251s0§.§1t12087s0§:
                     if(!§1t5565s0§.instance.§1t5614s0§())
                     {
                        return;
                     }
                     if(m.getString(2) == "1")
                     {
                        §1t5565s0§.instance.§1t5596s0§(m.getString(3),m.getString(4),m.§1t1005s0§(5));
                        this.§1t1413s0§ = m.getString(6);
                        this.§1t1422s0§.§1t3465s0§ = §1t251s0§.§1t12082s0§;
                        §1t5565s0§.instance.§1t5585s0§ = this.§1t1413s0§;
                        this.§1t1422s0§.§1t3507s0§();
                        §1t5565s0§.instance.§1t5600s0§(this.§1t1413s0§,true);
                        if(§1t1523s0§.§1t9499s0§ && §1t5565s0§.instance.§1t5579s0§ != this.§1t1413s0§)
                        {
                           this.§1t1423s0§ = §1t142s0§.§1t9256s0§(this.§1t1413s0§,this);
                           this.§1t1423s0§.connect();
                        }
                     }
                     else
                     {
                        §1t406s0§.instance.§1t6538s0§(m.getString(2));
                        this.§1t1428s0§();
                        this.§1t1430s0§(§1t9242s0§);
                     }
                     break;
                  case §1t251s0§.§1t12103s0§:
                     if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                     {
                        this.connection.send("private",§1t251s0§.§1t12105s0§,this.target,"2");
                        this.§1t1428s0§();
                     }
                     else if(this.§1t1422s0§.§1t3471s0§() && !§1t1543s0§.§1t10251s0§(this.target))
                     {
                        this.§1t1422s0§.§1t3465s0§ = §1t251s0§.§1t12080s0§;
                        §1t406s0§.instance.§1t6540s0§(this.target,this.§1t1413s0§);
                     }
                     else
                     {
                        this.connection.send("private",§1t251s0§.§1t12105s0§,this.target,"3");
                        this.§1t1428s0§();
                     }
                     break;
                  case §1t251s0§.§1t12104s0§:
                     this.§1t1422s0§.§1t3465s0§ = §1t251s0§.§1t12078s0§;
                     §1t406s0§.instance.§1t6542s0§();
                     this.§1t1428s0§();
                     this.§1t1430s0§(§1t9242s0§);
                     break;
                  case §1t251s0§.§1t12105s0§:
                     if(m.getString(2) == "1")
                     {
                        §1t6477s0§.instance.§1t7701s0§();
                        this.§1t1422s0§.§1t3465s0§ = §1t251s0§.§1t12082s0§;
                     }
                     else
                     {
                        §1t406s0§.instance.§1t6541s0§();
                        this.§1t1428s0§();
                        this.§1t1430s0§(§1t9242s0§);
                     }
                     break;
                  case §1t251s0§.§1t12095s0§:
                     this.connection.send("private",§1t251s0§.§1t12096s0§,this.target,m.§1t1005s0§(2),m.getBoolean(3));
                     break;
                  case §1t251s0§.§1t12096s0§:
                     this.latency = (int(new Date().valueOf() % 1000000) - m.getNumber(2)) / 2;
                     §1t113s0§.instance.§1t5247s0§(this.latency);
                     if(m.getBoolean(3))
                     {
                        this.connection.send("private",§1t251s0§.§1t12097s0§,this.target,this.latency);
                     }
                     if(this.§1t1423s0§ != null)
                     {
                        this.§1t1446s0§();
                     }
                     break;
                  case §1t251s0§.§1t12097s0§:
                     this.latency = m.§1t1005s0§(2);
                     §1t113s0§.instance.§1t5247s0§(this.latency);
                     if(this.§1t1423s0§ != null)
                     {
                        this.§1t1446s0§();
                     }
                     break;
                  case §1t251s0§.§1t12119s0§:
                     if(m.getString(2) == §1t1523s0§.charname)
                     {
                        this.§1t1422s0§.§1t3521s0§();
                        §1t1540s0§.§1t10039s0§();
                        this.§1t1422s0§.§1t3589s0§();
                     }
                     break;
                  case §1t251s0§.§1t12133s0§:
                     §1t13169s0§ = m.getString(1);
                     §1t13170s0§ = m.§1t1005s0§(3);
                     if((§1t13169s0§ == §1t1523s0§.charname || §1t13169s0§ == §1t1523s0§.§1t9768s0§) && §1t1540s0§.§1t9550s0§())
                     {
                        str = m.getString(4) + " gave you ";
                        if(§1t13170s0§ > 0)
                        {
                           str += §1t13170s0§ + " coins";
                        }
                        else
                        {
                           §1t13174s0§ = m.getString(2).split("|");
                           max = int(§1t13174s0§.length);
                           i = 0;
                           while(i < max)
                           {
                              if(§1t13174s0§[i] != "")
                              {
                                 item = §1t17s0§.parse(§1t13174s0§[i]);
                                 str += "<b><u><a href=\'event:[ITM]" + §1t13174s0§[i] + "\'>" + item.§1t511s0§() + "</a></u></b> ";
                              }
                              i++;
                           }
                        }
                        §1t406s0§.instance.§1t5239s0§(str,"#FFCC00");
                     }
                     break;
                  case §1t251s0§.§1t12134s0§:
                     receiver = m.getString(1);
                     §1t13172s0§ = m.§1t1005s0§(2);
                     §1t13173s0§ = m.§1t1005s0§(3);
                     if(§1t1523s0§.charname == receiver)
                     {
                        if(§1t13173s0§ > 0)
                        {
                           §1t13173s0§--;
                        }
                        §1t1523s0§.§1t9567s0§(§1t13172s0§,§1t13173s0§);
                        §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(988),§1t1521s0§.getString(5));
                     }
               }
            }
            else if(m.type == "public")
            {
               §1t1702s0§ = m.§1t1005s0§(0);
               switch(§1t1702s0§)
               {
                  case §1t251s0§.§1t12088s0§:
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.nid = m.getString(1);
                        this.obj.lineArrayStr = m.getString(2);
                        if(m.length >= 4)
                        {
                           this.obj.posX = m.§1t1005s0§(3);
                        }
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     §1t1541s0§.§1t10105s0§(m.getString(2),m.getString(1),m.§1t1005s0§(3));
                     break;
                  case §1t251s0§.§1t12089s0§:
                     §1t13175s0§ = m.getString(1);
                     victim = m.getString(2);
                     hp = m.§1t1005s0§(3);
                     launched = m.getString(4);
                     §1t13176s0§ = m.getBoolean(5);
                     §1t13177s0§ = 0;
                     if(m.length == 6)
                     {
                        §1t13177s0§ = m.§1t1005s0§(6);
                     }
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.victim = victim;
                        this.obj.hp = hp;
                        this.obj.launched = launched;
                        this.obj.canreject = §1t13176s0§;
                        this.obj.attacker = §1t13175s0§;
                        this.obj.effdmg = §1t13177s0§;
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     if(!this.§1t1422s0§.§1t3515s0§ && victim == this.§1t1422s0§.nid)
                     {
                        player = §1t1523s0§.§1t9586s0§();
                        if(!player.§1t2364s0§() && !§1t406s0§.instance.§1t6496s0§.§1t6853s0§())
                        {
                           player.§1t4483s0§(hp,launched,§1t13176s0§,§1t13175s0§,§1t13177s0§);
                           if(this.§1t1422s0§.§1t3465s0§ == §1t251s0§.§1t12083s0§)
                           {
                              if(hp <= 0)
                              {
                                 §1t13194s0§ = §1t1543s0§.§1t10225s0§(§1t13175s0§);
                                 if(§1t13194s0§ != null)
                                 {
                                    §1t5565s0§.instance.§1t5609s0§(§1t13194s0§.tauntStr);
                                    §1t1524s0§.§1t9878s0§(§1t76s0§.§1t9196s0§,§1t13194s0§.equipmentStr,§1t13194s0§.level,§1t13194s0§.charname);
                                    this.§1t1422s0§.§1t3524s0§("[PvP]   ",806,[this.§1t1422s0§.§1t3624s0§(§1t13194s0§.charname),§1t1523s0§.§1t9765s0§()]);
                                 }
                              }
                           }
                        }
                     }
                     else
                     {
                        npc = §1t1543s0§.§1t10225s0§(victim);
                        if(npc != null)
                        {
                           npc.§1t4483s0§(hp,launched,§1t13176s0§,§1t13175s0§,§1t13177s0§);
                        }
                     }
                     break;
                  case §1t251s0§.§1t12090s0§:
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.nid = m.getString(1);
                        this.obj.stance = m.§1t1005s0§(2);
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     npc = §1t1543s0§.§1t10225s0§(m.getString(1));
                     if(npc != null)
                     {
                        npc.§1t3489s0§(m.§1t1005s0§(2));
                     }
                     break;
                  case §1t251s0§.§1t12092s0§:
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.nid = m.getString(1);
                        this.obj.actionState = m.§1t1005s0§(2);
                        this.obj.x = m.§1t1005s0§(3);
                        this.obj.y = m.§1t1005s0§(4);
                        this.obj.facingRight = m.getBoolean(5);
                        this.obj.anim = m.getString(6);
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     actionState = m.§1t1005s0§(2);
                     xpos = m.§1t1005s0§(3);
                     §1t2259s0§ = m.§1t1005s0§(4);
                     facingRight = m.getBoolean(5);
                     anim = m.getString(6);
                     npc = §1t1543s0§.§1t10225s0§(m.getString(1));
                     if(npc != null && npc.§1t1559s0§() != null)
                     {
                        §1t13195s0§ = npc.§1t1555s0§() - xpos;
                        if(§1t13195s0§ * §1t13195s0§ > 160000)
                        {
                           npc.setPosition(xpos,§1t2259s0§);
                        }
                        else
                        {
                           npc.setPosition(npc.§1t1555s0§(),§1t2259s0§);
                        }
                        if(facingRight)
                        {
                           npc.§1t1559s0§().§1t5493s0§();
                        }
                        else
                        {
                           npc.§1t1559s0§().§1t5492s0§();
                        }
                        npc.§1t4494s0§();
                        if(actionState == §1t1544s0§.§1t11187s0§ || actionState == §1t1544s0§.§1t11188s0§)
                        {
                           npc.§1t4436s0§ = int(anim);
                           npc.§1t3269s0§(actionState);
                        }
                        else
                        {
                           if(anim != "")
                           {
                              npc.§1t1557s0§(anim);
                           }
                           npc.§1t3269s0§(actionState);
                        }
                     }
                     break;
                  case §1t251s0§.§1t12093s0§:
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.nid = m.getString(1);
                        this.obj.ptype = m.§1t1005s0§(2);
                        this.obj.x = m.§1t1005s0§(3);
                        this.obj.y = m.§1t1005s0§(4);
                        this.obj.velX = m.§1t1005s0§(5);
                        this.obj.velY = m.§1t1005s0§(6);
                        this.obj.damage = m.§1t1005s0§(7);
                        this.obj.skilllevel = m.§1t1005s0§(8);
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     §1t1712s0§.§1t4568s0§(m.§1t1005s0§(2),m.§1t1005s0§(3),m.§1t1005s0§(4),m.§1t1005s0§(5),m.§1t1005s0§(6),m.§1t1005s0§(7),m.§1t1005s0§(8),§1t1543s0§.§1t3306s0§(m.getString(1)));
                     break;
                  case §1t251s0§.§1t12094s0§:
                     if(this.purpose == §1t9252s0§)
                     {
                        §1t6477s0§.instance.§1t7710s0§(m.getString(2));
                     }
                     else
                     {
                        if(this.§1t1422s0§.§1t3499s0§)
                        {
                           this.obj.nid = m.getString(1);
                           this.obj.text = m.getString(2);
                           this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                        }
                        npc = §1t1543s0§.§1t10225s0§(m.getString(1));
                        if(npc != null)
                        {
                           npc.say(m.getString(2));
                           if(§1t113s0§.instance != null)
                           {
                              §1t113s0§.instance.§1t5238s0§(npc.charname,m.getString(2));
                           }
                        }
                     }
                     break;
                  case §1t251s0§.§1t12091s0§:
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.nid = m.getString(1);
                        this.obj.anim = m.getString(2);
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     §1t13178s0§ = m.getString(2);
                     if(§1t13178s0§ == "fart")
                     {
                        §1t88s0§.instance.§1t1512s0§();
                     }
                     else if(§1t13178s0§ == "sadtrombone")
                     {
                        §1t88s0§.instance.§1t1516s0§("Snd_sadTrombone");
                     }
                     else if(§1t13178s0§ == "rimshot")
                     {
                        §1t88s0§.instance.§1t1516s0§("Snd_rimshot");
                     }
                     else
                     {
                        npc = §1t1543s0§.§1t10225s0§(m.getString(1));
                        if(npc != null)
                        {
                           npc.§1t1557s0§(§1t13178s0§);
                        }
                     }
                     break;
                  case §1t251s0§.§1t12099s0§:
                     §1t13175s0§ = m.getString(1);
                     victim = m.getString(2);
                     §1t13179s0§ = m.getString(3);
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.attacker = §1t13175s0§;
                        this.obj.victim = victim;
                        this.obj.damagestr = §1t13179s0§;
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     if(!this.§1t1422s0§.§1t3515s0§ && victim == this.§1t1422s0§.nid)
                     {
                        player = §1t1523s0§.§1t9586s0§();
                        if(!player.§1t2364s0§())
                        {
                           player.§1t4486s0§(§1t13179s0§,§1t13175s0§);
                        }
                     }
                     else
                     {
                        npc = §1t1543s0§.§1t10225s0§(victim);
                        if(npc != null)
                        {
                           npc.§1t4486s0§(§1t13179s0§,§1t13175s0§);
                        }
                     }
                     break;
                  case §1t251s0§.§1t12100s0§:
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.victim = m.getString(1);
                        this.obj.hp = m.§1t1005s0§(2);
                        this.obj.launched = m.getString(3);
                        this.obj.attacker = m.getString(4);
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     npc = §1t1543s0§.§1t10225s0§(m.getString(1));
                     if(npc != null)
                     {
                        npc.§1t4485s0§(m.§1t1005s0§(2),m.getString(3),m.getString(4));
                     }
                     break;
                  case §1t251s0§.§1t12101s0§:
                     if(this.§1t1422s0§.§1t3499s0§)
                     {
                        this.obj.victim = m.getString(1);
                        this.§1t1422s0§.§1t3508s0§(§1t1702s0§,this.obj,this.§1t1413s0§);
                     }
                     §1t13180s0§ = m.getString(1);
                     if(§1t13180s0§ == this.§1t1422s0§.nid)
                     {
                        §1t1523s0§.§1t9586s0§().§1t4484s0§("");
                     }
                     else
                     {
                        npc = §1t1543s0§.§1t10225s0§(§1t13180s0§);
                        if(npc != null)
                        {
                           if(m.length == 3)
                           {
                              npc.§1t4484s0§(m.getString(2));
                           }
                           else
                           {
                              npc.§1t4484s0§("");
                           }
                        }
                     }
                     break;
                  case §1t251s0§.§1t12102s0§:
                     if(!this.§1t1422s0§.§1t3515s0§ && m.getString(1) == §1t1523s0§.charname && (§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§()))
                     {
                        §1t13196s0§ = m.§1t1005s0§(2);
                        §1t406s0§.instance.§1t6488s0§.§1t6194s0§(§1t13196s0§);
                        if(§1t13196s0§ <= 10 || int(Math.random() * 3) == 0)
                        {
                           §1t406s0§.instance.§1t6488s0§.§1t5846s0§(Math.random() * §1t13196s0§);
                        }
                        if(§1t1523s0§.getLevel() < 10)
                        {
                           §1t406s0§.instance.§1t6488s0§.§1t6201s0§(§1t68s0§.§1t12070s0§(§1t1523s0§.getLevel(),§1t13196s0§,§1t13196s0§ * 5 + 45,false) * 3);
                        }
                        else
                        {
                           §1t406s0§.instance.§1t6488s0§.§1t6201s0§(§1t68s0§.§1t12070s0§(§1t1523s0§.getLevel(),§1t13196s0§,§1t13196s0§ * 5 + 45,true));
                        }
                     }
                     break;
                  case §1t251s0§.§1t12111s0§:
                     §1t13181s0§ = m.getString(1);
                     §1t13182s0§ = m.getString(2);
                     if(§1t1543s0§.§1t10251s0§(§1t13182s0§))
                     {
                        return;
                     }
                     §1t13183s0§ = m.getString(3);
                     §1t13184s0§ = m.§1t1005s0§(4);
                     if(§1t13184s0§ == 0 || §1t13184s0§ == -1 || §1t13184s0§ == §1t1523s0§.§1t7746s0§())
                     {
                        if(m.length >= 6 && m.getString(5) != "")
                        {
                           §1t1543s0§.§1t10219s0§(§1t13181s0§,m.getString(5));
                        }
                        else
                        {
                           §1t1543s0§.§1t10219s0§(§1t13181s0§,§1t13183s0§);
                        }
                        if(§1t13184s0§ == -1 || m.getString(6) != this.§1t1422s0§.§1t3614s0§)
                        {
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
                           §1t406s0§.instance.§1t5238s0§(§1t13182s0§,§1t13183s0§,color);
                           if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                           {
                              §1t113s0§.instance.§1t5238s0§(§1t13182s0§,§1t13183s0§,color);
                           }
                        }
                     }
                     break;
                  case §1t251s0§.§1t12113s0§:
                     §1t1543s0§.§1t10220s0§(m.getString(1),m.getString(2));
                     break;
                  case §1t251s0§.§1t12114s0§:
                     §1t1543s0§.§1t10221s0§(m.getString(1),m.§1t1005s0§(2));
                     break;
                  case §1t251s0§.§1t12115s0§:
                     §1t1543s0§.§1t10222s0§(m.getString(1),m.getBoolean(2));
                     break;
                  case §1t251s0§.§1t12116s0§:
                     §1t13185s0§ = m.getString(2);
                     npc = §1t1543s0§.§1t10225s0§(m.getString(1));
                     if(npc != null)
                     {
                        if(§1t13185s0§ == "fart")
                        {
                           if(!§1t1543s0§.§1t10251s0§(npc.charname))
                           {
                              §1t88s0§.instance.§1t1512s0§();
                           }
                        }
                        else if(§1t13185s0§ == "sadtrombone")
                        {
                           if(!§1t1543s0§.§1t10251s0§(npc.charname))
                           {
                              §1t88s0§.instance.§1t1516s0§("Snd_sadTrombone");
                           }
                        }
                        else if(§1t13185s0§ == "rimshot")
                        {
                           if(!§1t1543s0§.§1t10251s0§(npc.charname))
                           {
                              §1t88s0§.instance.§1t1516s0§("Snd_rimshot");
                           }
                        }
                        else
                        {
                           npc.§1t1557s0§(§1t13185s0§);
                        }
                     }
                     break;
                  case §1t251s0§.§1t12132s0§:
                     if(!§1t1540s0§.§1t10047s0§() && !§1t1540s0§.§1t10048s0§())
                     {
                        return;
                     }
                     §1t13186s0§ = m.getString(1);
                     if(§1t13186s0§ == §1t1523s0§.charname || §1t13186s0§ == §1t1523s0§.§1t9768s0§)
                     {
                        npc = §1t1543s0§.§1t10225s0§(m.getString(2));
                        if(npc != null)
                        {
                           ally = m.getBoolean(3);
                           npc.§1t4447s0§(ally);
                           if(ally)
                           {
                              §1t113s0§.instance.§1t5238s0§("",§1t1521s0§.getString(961,[this.§1t1422s0§.§1t3624s0§(npc.charname)]));
                           }
                           else
                           {
                              §1t113s0§.instance.§1t5238s0§("",§1t1521s0§.getString(962,[this.§1t1422s0§.§1t3624s0§(npc.charname)]));
                           }
                        }
                     }
                     break;
                  case §1t251s0§.§1t12128s0§:
                     §1t13181s0§ = m.getString(1);
                     §1t13187s0§ = m.getString(3);
                     §1t13188s0§ = -1;
                     §1t13189s0§ = "";
                     §1t13190s0§ = "";
                     switch(m.§1t1005s0§(2))
                     {
                        case 1:
                           §1t13188s0§ = 40008;
                           §1t13189s0§ = §1t1544s0§.§1t10383s0§;
                           §1t13190s0§ = §1t1521s0§.getString(6116);
                           break;
                        case 2:
                           §1t13188s0§ = 40010;
                           §1t13189s0§ = §1t1544s0§.§1t10383s0§;
                           §1t13190s0§ = §1t1521s0§.getString(6124);
                           break;
                        case 3:
                           §1t13188s0§ = 40004;
                           §1t13189s0§ = §1t1544s0§.§1t10391s0§;
                           §1t13190s0§ = §1t1521s0§.getString(6118);
                           break;
                        case 4:
                           §1t13188s0§ = 40014;
                           §1t13189s0§ = §1t1544s0§.§1t10391s0§;
                           §1t13190s0§ = §1t1521s0§.getString(6126);
                           break;
                        case 5:
                           §1t13188s0§ = 40003;
                           §1t13189s0§ = §1t1544s0§.§1t10397s0§;
                           §1t13190s0§ = §1t1521s0§.getString(6120);
                           break;
                        case 6:
                           §1t13188s0§ = 40017;
                           §1t13189s0§ = §1t1544s0§.§1t10397s0§;
                           §1t13190s0§ = §1t1521s0§.getString(6128);
                           break;
                        case 7:
                           §1t13188s0§ = 40006;
                           §1t13189s0§ = §1t1544s0§.§1t10385s0§;
                           §1t13190s0§ = §1t1521s0§.getString(6122);
                           break;
                        case 8:
                           §1t13188s0§ = 40011;
                           §1t13189s0§ = §1t1544s0§.§1t10385s0§;
                           §1t13190s0§ = §1t1521s0§.getString(6130);
                     }
                     if(§1t13187s0§ == §1t1523s0§.§1t9768s0§ && §1t1540s0§.§1t9550s0§())
                     {
                        §1t13191s0§ = §1t1543s0§.§1t10225s0§(§1t13181s0§);
                        if(§1t13191s0§ != null)
                        {
                           §1t406s0§.instance.§1t5239s0§(§1t13191s0§.charname + " taught you " + §1t13190s0§,"#FFCC00");
                        }
                     }
                     else if(§1t13187s0§ == §1t1523s0§.charname && §1t13188s0§ != -1 && §1t1540s0§.§1t9550s0§())
                     {
                        §1t13191s0§ = §1t1543s0§.§1t10225s0§(§1t13181s0§);
                        if(§1t1523s0§.§1t9714s0§(§1t13188s0§) == 0)
                        {
                           §1t1523s0§.§1t9712s0§(§1t13188s0§,1);
                           if(§1t13191s0§ != null)
                           {
                              §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(756,[§1t13191s0§.charname,§1t13190s0§]),§1t1521s0§.getString(5));
                           }
                        }
                        else if(§1t13191s0§ != null)
                        {
                           §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(757,[§1t13191s0§.charname,§1t13190s0§]),§1t1521s0§.getString(5));
                        }
                        §1t3317s0§.instance.§1t1946s0§();
                     }
                     if(§1t13189s0§ != "")
                     {
                        §1t1543s0§.§1t10223s0§(§1t13181s0§,§1t13189s0§);
                     }
                     break;
                  case §1t251s0§.§1t12120s0§:
                     §1t1525s0§.§1t9940s0§().§1t3537s0§(m.§1t1005s0§(1),m.§1t1005s0§(2),m.§1t1005s0§(3),m.getString(4),m.getString(5));
                     break;
                  case §1t251s0§.§1t12121s0§:
                     §1t1525s0§.§1t9940s0§().§1t8138s0§(m.getString(1));
                     break;
                  case §1t251s0§.§1t12126s0§:
                     §1t13192s0§ = §1t1525s0§.§1t9940s0§().§1t8146s0§(m.getString(1)) as §1t8624s0§;
                     if(§1t13192s0§ != null)
                     {
                        if(m.length == 5)
                        {
                           §1t13192s0§.triggerObject(m.getBoolean(2),m.getBoolean(3),m.§1t1005s0§(4));
                        }
                        else
                        {
                           §1t13192s0§.triggerObject(m.getBoolean(2),m.getBoolean(3));
                        }
                     }
                     break;
                  case §1t251s0§.§1t12122s0§:
                     §1t13193s0§ = §1t1525s0§.§1t9940s0§().§1t8131s0§();
                     §1t1712s0§.§1t4568s0§(m.§1t1005s0§(2),m.§1t1005s0§(3),m.§1t1005s0§(4),m.§1t1005s0§(5),m.§1t1005s0§(6),m.§1t1005s0§(7),m.§1t1005s0§(5),§1t1543s0§.§1t3306s0§(m.getString(1)));
                     break;
                  case §1t251s0§.§1t12107s0§:
                     §1t6477s0§.instance.§1t7706s0§(m.getString(1));
                     break;
                  case §1t251s0§.§1t12106s0§:
                     §1t6477s0§.instance.§1t7707s0§(m.getBoolean(1));
                     break;
                  case §1t251s0§.§1t12108s0§:
                     §1t6477s0§.instance.§1t7712s0§(m.§1t1005s0§(1));
               }
            }
         }
         catch(e:Error)
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§(e.message,"connpio:" + m.toString(),e.getStackTrace(),e.errorID);
         }
      }
      
      public function §1t1446s0§() : *
      {
         if(this.§1t1423s0§.latency != -1 && this.latency != -1 && this.§1t1423s0§.latency < this.latency)
         {
            this.§1t1425s0§ = true;
            §1t113s0§.instance.§1t5238s0§("Latency",this.§1t1423s0§.latency.toString() + " ms");
         }
         else
         {
            this.§1t1425s0§ = false;
         }
      }
      
      public function §1t1447s0§() : Boolean
      {
         return this.§1t1443s0§() && this.connection != null && this.connection.connected;
      }
      
      public function §1t1448s0§(param1:int, param2:Object) : *
      {
         this.§1t1423s0§.send(param1,param2);
      }
   }
}

