package
{
   import flash.events.*;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class §1t88s0§
   {
      
      public static var instance:§1t88s0§;
      
      public var isPlaying:int = -1;
      
      public var §1t1485s0§:* = true;
      
      public var §1t1486s0§:* = true;
      
      internal var §1t1487s0§:int = -1;
      
      internal var §1t1488s0§:§1t133s0§;
      
      internal var loaded:Boolean = false;
      
      internal var §1t1489s0§:Array = new Array();
      
      internal var §1t1490s0§:SoundTransform;
      
      internal var §1t1492s0§:SoundTransform;
      
      internal var §1t1493s0§:SoundTransform;
      
      internal var §1t1494s0§:SoundChannel;
      
      internal var §1t1518s0§:Boolean = false;
      
      public function §1t88s0§()
      {
         super();
         instance = this;
         this.§1t1488s0§ = §1t133s0§.§1t9190s0§();
      }
      
      public static function §1t9190s0§() : §1t88s0§
      {
         if(instance == null)
         {
            new §1t88s0§();
         }
         return instance;
      }
      
      public function init() : *
      {
         var _loc3_:String = null;
         var _loc1_:Array = ["Snd_punch","Snd_addStat","Snd_birds1","Snd_birds2","Snd_birds3","Snd_bowFire","Snd_bowFireMany","Snd_challenge","Snd_criticalDamage","Snd_drop","Snd_equip","Snd_error","Snd_fart","Snd_hitMetal","Snd_goodKoto","Snd_jump","Snd_slash1","Snd_slash2","Snd_die1","Snd_mail","Snd_menu","Snd_menuClose","Snd_mining","Snd_ninja","Snd_notification","Snd_put","Snd_refund","Snd_rimshot","Snd_sadTrombone","Snd_wrScout","Snd_die3","Snd_slash3","Snd_smallClick","Snd_smokebomb","Snd_sumo","Snd_die2","Snd_upgradeSkill","Snd_wrAttack","Snd_wrDeploy","Snd_back","Snd_click","Snd_deflect","Snd_wrMove"];
         var _loc2_:int = int(_loc1_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = _loc1_[_loc4_];
            this.§1t1489s0§[_loc3_] = §1t1522s0§.§1t9320s0§(_loc3_);
            _loc4_++;
         }
         this.§1t1490s0§ = new SoundTransform();
         this.§1t1490s0§.pan = -0.95;
         this.§1t1492s0§ = new SoundTransform();
         this.§1t1492s0§.pan = 0.95;
         this.§1t1493s0§ = new SoundTransform();
         this.loaded = true;
      }
      
      public function §1t1496s0§(param1:Number) : *
      {
         this.§1t1493s0§.volume = param1;
         this.§1t1490s0§.volume = param1;
         this.§1t1492s0§.volume = param1;
      }
      
      public function §1t1497s0§() : *
      {
         if(this.§1t1486s0§)
         {
            this.§1t1502s0§();
         }
         this.§1t1486s0§ = !this.§1t1486s0§;
         if(this.§1t1486s0§)
         {
            this.§1t1501s0§();
         }
         §1t3317s0§.instance.§1t2010s0§();
         if(Boolean(this.§1t1486s0§) && !§1t133s0§.loaded)
         {
            §1t1522s0§.§1t9307s0§();
         }
      }
      
      public function §1t1498s0§() : *
      {
         this.§1t1485s0§ = !this.§1t1485s0§;
         §1t3317s0§.instance.§1t2010s0§();
         if(Boolean(this.§1t1485s0§) && !this.loaded)
         {
            §1t1522s0§.§1t9308s0§();
         }
      }
      
      public function §1t1499s0§(param1:int) : *
      {
         if(!this.§1t1486s0§ || !§1t133s0§.loaded)
         {
            this.§1t1487s0§ = param1;
            return;
         }
         if(this.isPlaying == param1)
         {
            return;
         }
         this.§1t1488s0§.§1t1741s0§(param1);
         this.isPlaying = param1;
      }
      
      public function §1t1500s0§() : *
      {
         if(this.isPlaying != -1)
         {
            this.§1t1488s0§.§1t1741s0§(§1t133s0§.§1t11337s0§);
            this.isPlaying = -1;
         }
      }
      
      public function §1t1501s0§() : *
      {
         if(this.isPlaying == -1)
         {
            this.§1t1499s0§(this.§1t1487s0§);
         }
      }
      
      public function §1t1502s0§() : *
      {
         if(!this.§1t1486s0§)
         {
            return;
         }
         this.§1t1487s0§ = this.isPlaying;
         this.§1t1500s0§();
      }
      
      public function §1t1503s0§() : int
      {
         return this.isPlaying;
      }
      
      public function §1t1504s0§(param1:int, param2:Boolean, param3:Boolean) : *
      {
         if(param3)
         {
            this.§1t1499s0§(§1t133s0§.§1t11345s0§);
         }
         else if(param1 == §1t112s0§.§1t12562s0§ || param1 == §1t112s0§.§1t12563s0§ || param1 == §1t112s0§.§1t12564s0§ || param1 == §1t112s0§.§1t12565s0§ || param1 == §1t112s0§.§1t12569s0§ || param1 == §1t112s0§.§1t12573s0§ || param1 == §1t112s0§.§1t12584s0§)
         {
            if(param2)
            {
               this.§1t1499s0§(§1t133s0§.§1t11351s0§);
            }
            else
            {
               this.§1t1499s0§(§1t133s0§.§1t11346s0§);
            }
         }
         else if(param1 == §1t112s0§.§1t12570s0§ || param1 == §1t112s0§.§1t12571s0§ || param1 == §1t112s0§.§1t12572s0§ || param1 == §1t112s0§.§1t12585s0§ || param1 == §1t112s0§.§1t12587s0§ || param1 == §1t112s0§.§1t12586s0§ || param1 == §1t112s0§.§1t12577s0§ || param1 == §1t112s0§.§1t12567s0§)
         {
            this.§1t1499s0§(§1t133s0§.§1t11343s0§);
         }
         else if(param1 == §1t112s0§.§1t12559s0§ || param1 == §1t112s0§.§1t12560s0§)
         {
            this.§1t1499s0§(§1t133s0§.§1t11349s0§);
         }
         else if(param1 == §1t112s0§.§1t12574s0§ || param1 == §1t112s0§.§1t12593s0§ || param1 == §1t112s0§.§1t12581s0§)
         {
            this.§1t1499s0§(§1t133s0§.§1t11342s0§);
         }
         else if(param1 == §1t112s0§.§1t12579s0§ || param1 == §1t112s0§.§1t12553s0§ || param1 == §1t112s0§.§1t12596s0§ || param1 == §1t112s0§.§1t12595s0§ || param1 == §1t112s0§.§1t12598s0§)
         {
            if(param2)
            {
               this.§1t1499s0§(§1t133s0§.§1t11348s0§);
            }
            else
            {
               this.§1t1499s0§(§1t133s0§.§1t11347s0§);
            }
         }
         else if(param1 == §1t112s0§.§1t12588s0§ || param1 == §1t112s0§.§1t12589s0§ || param1 == §1t112s0§.§1t12550s0§ || param1 == §1t112s0§.§1t12600s0§ || param1 == §1t112s0§.§1t12601s0§)
         {
            if(param2)
            {
               this.§1t1499s0§(§1t133s0§.§1t11342s0§);
            }
            else
            {
               this.§1t1499s0§(§1t133s0§.§1t11343s0§);
            }
         }
         else if(param2)
         {
            this.§1t1499s0§(§1t133s0§.§1t11342s0§);
         }
         else
         {
            this.§1t1499s0§(§1t133s0§.§1t11341s0§);
         }
      }
      
      public function §1t1505s0§() : *
      {
         if(this.isPlaying == §1t133s0§.§1t11342s0§)
         {
            this.§1t1499s0§(§1t133s0§.§1t11338s0§);
         }
         else if(this.isPlaying == §1t133s0§.§1t11351s0§ || this.isPlaying == §1t133s0§.§1t11348s0§)
         {
            this.§1t1499s0§(§1t133s0§.§1t11344s0§);
         }
      }
      
      public function §1t1506s0§() : *
      {
         var _loc2_:Sound = null;
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:int = Math.random() * 3;
         if(_loc1_ == 0)
         {
            _loc2_ = this.§1t1489s0§["Snd_slash1"];
            if(_loc2_ != null)
            {
               _loc2_.play();
            }
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = this.§1t1489s0§["Snd_slash2"];
            if(_loc2_ != null)
            {
               _loc2_.play();
            }
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = this.§1t1489s0§["Snd_slash3"];
            if(_loc2_ != null)
            {
               _loc2_.play();
            }
         }
      }
      
      public function §1t1507s0§() : *
      {
         var _loc2_:Sound = null;
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:int = Math.random() * 3;
         if(_loc1_ == 0)
         {
            _loc2_ = this.§1t1489s0§["Snd_die1"];
            if(_loc2_ != null)
            {
               _loc2_.play();
            }
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = this.§1t1489s0§["Snd_die2"];
            if(_loc2_ != null)
            {
               _loc2_.play();
            }
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = this.§1t1489s0§["Snd_die3"];
            if(_loc2_ != null)
            {
               _loc2_.play();
            }
         }
      }
      
      public function §1t1508s0§() : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:Sound = this.§1t1489s0§["Snd_punch"];
         if(_loc1_ != null)
         {
            _loc1_.play();
         }
      }
      
      public function §1t1509s0§() : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:Sound = this.§1t1489s0§["Snd_punch"];
         if(_loc1_ != null)
         {
            _loc1_.play();
         }
      }
      
      public function §1t1510s0§() : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:Sound = this.§1t1489s0§["Snd_hitMetal"];
         if(_loc1_ != null)
         {
            _loc1_.play();
         }
      }
      
      public function §1t1511s0§() : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:Sound = this.§1t1489s0§["Snd_deflect"];
         if(_loc1_ != null)
         {
            _loc1_.play();
         }
      }
      
      public function §1t1512s0§() : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:Sound = this.§1t1489s0§["Snd_fart"];
         if(_loc1_ != null)
         {
            _loc1_.play();
         }
      }
      
      public function §1t1513s0§() : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:Sound = this.§1t1489s0§["Snd_goodKoto"];
         if(_loc1_ != null)
         {
            _loc1_.play();
         }
      }
      
      public function §1t1514s0§() : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:Sound = this.§1t1489s0§["Snd_sumo"];
         if(_loc1_ != null)
         {
            _loc1_.play();
         }
      }
      
      public function §1t1515s0§() : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc1_:Sound = this.§1t1489s0§["Snd_refund"];
         if(_loc1_ != null)
         {
            _loc1_.play();
         }
      }
      
      public function §1t1516s0§(param1:String) : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc2_:Sound = this.§1t1489s0§[param1];
         if(_loc2_ != null)
         {
            this.§1t1494s0§ = _loc2_.play();
            this.§1t1494s0§.soundTransform = this.§1t1493s0§;
         }
      }
      
      public function §1t1517s0§(param1:int) : *
      {
         if(!this.§1t1485s0§ || !this.loaded)
         {
            return;
         }
         var _loc2_:Sound = this.§1t1489s0§["Snd_bowFire"];
         if(_loc2_ != null)
         {
            this.§1t1494s0§ = _loc2_.play();
         }
         if(this.§1t1494s0§ != null && (param1 > 200 || param1 < -200))
         {
            if(param1 > 200)
            {
               this.§1t1494s0§.soundTransform = this.§1t1492s0§;
            }
            else
            {
               this.§1t1494s0§.soundTransform = this.§1t1490s0§;
            }
         }
      }
      
      public function §1t1519s0§(param1:int) : *
      {
         var _loc2_:Sound = null;
         if(!this.§1t1485s0§ || !this.loaded || this.§1t1518s0§)
         {
            return;
         }
         var _loc3_:int = Math.random() * 3;
         if(_loc3_ == 0)
         {
            _loc2_ = this.§1t1489s0§["Snd_birds1"];
         }
         else if(_loc3_ == 1)
         {
            _loc2_ = this.§1t1489s0§["Snd_birds2"];
         }
         else if(_loc3_ == 2)
         {
            _loc2_ = this.§1t1489s0§["Snd_birds3"];
         }
         if(_loc2_ != null)
         {
            this.§1t1494s0§ = _loc2_.play();
         }
         if(this.§1t1494s0§ != null && (param1 > 100 || param1 < -100))
         {
            if(param1 > 100)
            {
               this.§1t1494s0§.soundTransform = this.§1t1492s0§;
            }
            else
            {
               this.§1t1494s0§.soundTransform = this.§1t1490s0§;
            }
         }
         if(this.§1t1494s0§ != null)
         {
            this.§1t1518s0§ = true;
            this.§1t1494s0§.addEventListener(Event.SOUND_COMPLETE,this.§1t1520s0§,false,0,true);
         }
      }
      
      internal function §1t1520s0§(param1:Event) : *
      {
         this.§1t1518s0§ = false;
         param1.target.removeEventListener(Event.SOUND_COMPLETE,this.§1t1520s0§);
      }
   }
}

