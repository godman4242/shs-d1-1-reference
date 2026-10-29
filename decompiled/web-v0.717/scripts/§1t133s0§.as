package
{
   import flash.events.Event;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class §1t133s0§
   {
      
      public static var instance:§1t133s0§;
      
      public static var §1t11337s0§:int = 0;
      
      public static var §1t11338s0§:int = 1;
      
      public static var §1t11339s0§:int = 2;
      
      public static var §1t11340s0§:int = 3;
      
      public static var §1t11341s0§:int = 4;
      
      public static var §1t11342s0§:int = 5;
      
      public static var §1t11343s0§:int = 6;
      
      public static var §1t11344s0§:int = 7;
      
      public static var §1t11345s0§:int = 8;
      
      public static var §1t11346s0§:int = 9;
      
      public static var §1t11347s0§:int = 11;
      
      public static var §1t11348s0§:int = 12;
      
      public static var §1t11349s0§:int = 14;
      
      public static var §1t11350s0§:int = 15;
      
      public static var §1t11351s0§:int = 16;
      
      public static var §1t11352s0§:int = 100;
      
      public static var §1t11353s0§:int = 101;
      
      public static var §1t11354s0§:int = 102;
      
      public static var loaded:Boolean = false;
      
      internal var §1t1717s0§:int = 0;
      
      internal var §1t1718s0§:int = 1;
      
      internal var §1t1719s0§:int = 2;
      
      internal var §1t1720s0§:int = 3;
      
      internal var §1t1721s0§:int = 4;
      
      internal var §1t1722s0§:int = 5;
      
      internal var §1t1723s0§:int = 6;
      
      internal var §1t1724s0§:int = 7;
      
      internal var §1t1725s0§:int = 8;
      
      internal var §1t1726s0§:int = 9;
      
      internal var §1t1727s0§:int = 10;
      
      internal var §1t1728s0§:int = 11;
      
      internal var §1t1729s0§:int = 12;
      
      internal var §1t1730s0§:int = 13;
      
      internal var §1t1731s0§:int = 0;
      
      internal var §1t1732s0§:int = 1;
      
      internal var §1t1733s0§:int = 2;
      
      internal var §1t1734s0§:Boolean = false;
      
      internal var §1t1735s0§:Array = new Array();
      
      internal var §1t1736s0§:Array = new Array();
      
      internal var §1t1737s0§:Array = new Array();
      
      internal var §1t1738s0§:Array = new Array();
      
      internal var §1t1739s0§:Array = new Array();
      
      internal var §1t1740s0§:Array;
      
      public function §1t133s0§()
      {
         super();
         instance = this;
      }
      
      public static function §1t9190s0§() : §1t133s0§
      {
         if(instance == null)
         {
            new §1t133s0§();
         }
         return instance;
      }
      
      public function init() : *
      {
         this.§1t1735s0§[this.§1t1717s0§] = §1t1522s0§.§1t9319s0§("battlechants");
         this.§1t1735s0§[this.§1t1718s0§] = §1t1522s0§.§1t9319s0§("battledrums");
         this.§1t1735s0§[this.§1t1719s0§] = §1t1522s0§.§1t9319s0§("flutes");
         this.§1t1735s0§[this.§1t1720s0§] = §1t1522s0§.§1t9319s0§("safeambience");
         this.§1t1735s0§[this.§1t1721s0§] = §1t1522s0§.§1t9319s0§("safekoto");
         this.§1t1735s0§[this.§1t1722s0§] = §1t1522s0§.§1t9319s0§("safepercussion");
         this.§1t1735s0§[this.§1t1723s0§] = §1t1522s0§.§1t9319s0§("dungeonambience");
         this.§1t1735s0§[this.§1t1724s0§] = §1t1522s0§.§1t9319s0§("dungeonflute");
         this.§1t1735s0§[this.§1t1725s0§] = §1t1522s0§.§1t9319s0§("dungeonpercussion");
         this.§1t1735s0§[this.§1t1726s0§] = §1t1522s0§.§1t9319s0§("dungeonpiano");
         this.§1t1735s0§[this.§1t1727s0§] = §1t1522s0§.§1t9319s0§("bgm_gangnam");
         this.§1t1735s0§[this.§1t1728s0§] = §1t1522s0§.§1t9319s0§("bgm_levelup");
         this.§1t1735s0§[this.§1t1729s0§] = §1t1522s0§.§1t9319s0§("bgm_lose");
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t1730s0§)
         {
            this.§1t1736s0§[_loc1_] = null;
            this.§1t1737s0§[_loc1_] = this.§1t1731s0§;
            _loc1_++;
         }
         this.§1t1738s0§[§1t11337s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11338s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11338s0§][this.§1t1719s0§] = true;
         this.§1t1738s0§[§1t11338s0§][this.§1t1718s0§] = true;
         this.§1t1738s0§[§1t11339s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11339s0§][this.§1t1719s0§] = true;
         this.§1t1738s0§[§1t11339s0§][this.§1t1718s0§] = true;
         this.§1t1738s0§[§1t11339s0§][this.§1t1717s0§] = true;
         this.§1t1738s0§[§1t11340s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11340s0§][this.§1t1719s0§] = true;
         this.§1t1738s0§[§1t11341s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11341s0§][this.§1t1719s0§] = true;
         this.§1t1738s0§[§1t11341s0§][this.§1t1720s0§] = true;
         this.§1t1738s0§[§1t11342s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11342s0§][this.§1t1719s0§] = true;
         this.§1t1738s0§[§1t11342s0§][this.§1t1720s0§] = true;
         this.§1t1738s0§[§1t11342s0§][this.§1t1722s0§] = true;
         this.§1t1738s0§[§1t11343s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11343s0§][this.§1t1719s0§] = true;
         this.§1t1738s0§[§1t11343s0§][this.§1t1720s0§] = true;
         this.§1t1738s0§[§1t11343s0§][this.§1t1721s0§] = true;
         this.§1t1738s0§[§1t11344s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11344s0§][this.§1t1718s0§] = true;
         this.§1t1738s0§[§1t11344s0§][this.§1t1724s0§] = true;
         this.§1t1738s0§[§1t11345s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11345s0§][this.§1t1718s0§] = true;
         this.§1t1738s0§[§1t11345s0§][this.§1t1717s0§] = true;
         this.§1t1738s0§[§1t11346s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11346s0§][this.§1t1723s0§] = true;
         this.§1t1738s0§[§1t11346s0§][this.§1t1724s0§] = true;
         this.§1t1738s0§[§1t11347s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11347s0§][this.§1t1726s0§] = true;
         this.§1t1738s0§[§1t11348s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11348s0§][this.§1t1723s0§] = true;
         this.§1t1738s0§[§1t11348s0§][this.§1t1724s0§] = true;
         this.§1t1738s0§[§1t11348s0§][this.§1t1725s0§] = true;
         this.§1t1738s0§[§1t11348s0§][this.§1t1726s0§] = true;
         this.§1t1738s0§[§1t11349s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11349s0§][this.§1t1719s0§] = true;
         this.§1t1738s0§[§1t11349s0§][this.§1t1720s0§] = true;
         this.§1t1738s0§[§1t11349s0§][this.§1t1721s0§] = true;
         this.§1t1738s0§[§1t11349s0§][this.§1t1722s0§] = true;
         this.§1t1738s0§[§1t11350s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11350s0§][this.§1t1718s0§] = true;
         this.§1t1738s0§[§1t11351s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11351s0§][this.§1t1723s0§] = true;
         this.§1t1738s0§[§1t11351s0§][this.§1t1724s0§] = true;
         this.§1t1738s0§[§1t11351s0§][this.§1t1725s0§] = true;
         this.§1t1738s0§[§1t11352s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11352s0§][this.§1t1727s0§] = true;
         this.§1t1738s0§[§1t11353s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11353s0§][this.§1t1728s0§] = true;
         this.§1t1738s0§[§1t11354s0§] = new Array(this.§1t1730s0§);
         this.§1t1738s0§[§1t11354s0§][this.§1t1729s0§] = true;
         this.§1t1740s0§ = this.§1t1738s0§[§1t11337s0§];
         loaded = true;
         §1t88s0§.§1t9190s0§().§1t1501s0§();
      }
      
      public function §1t1741s0§(param1:int) : *
      {
         var _loc4_:int = 0;
         var _loc5_:SoundTransform = null;
         var _loc2_:Array = this.§1t1740s0§;
         this.§1t1740s0§ = this.§1t1738s0§[param1];
         var _loc3_:int = 0;
         while(_loc3_ < this.§1t1730s0§)
         {
            if(!_loc2_[_loc3_] && Boolean(this.§1t1740s0§[_loc3_]))
            {
               _loc4_ = 0;
               if(this.§1t1736s0§[this.§1t1719s0§] != null)
               {
                  _loc4_ = int(this.§1t1736s0§[this.§1t1719s0§].position);
               }
               else if(this.§1t1736s0§[this.§1t1718s0§] != null)
               {
                  _loc4_ = int(this.§1t1736s0§[this.§1t1718s0§].position);
               }
               else if(this.§1t1736s0§[this.§1t1722s0§] != null)
               {
                  _loc4_ = int(this.§1t1736s0§[this.§1t1722s0§].position);
               }
               else if(this.§1t1736s0§[this.§1t1726s0§] != null)
               {
                  _loc4_ = int(this.§1t1736s0§[this.§1t1726s0§].position);
               }
               else if(this.§1t1736s0§[this.§1t1723s0§] != null)
               {
                  _loc4_ = int(this.§1t1736s0§[this.§1t1723s0§].position);
               }
               else if(this.§1t1736s0§[this.§1t1724s0§] != null)
               {
                  _loc4_ = int(this.§1t1736s0§[this.§1t1724s0§].position);
               }
               if(Boolean(_loc2_[this.§1t1719s0§]) && Boolean(this.§1t1740s0§[this.§1t1724s0§]) || Boolean(_loc2_[this.§1t1724s0§]) && Boolean(this.§1t1740s0§[this.§1t1719s0§]))
               {
                  _loc4_ = 0;
               }
               if(_loc4_ > this.§1t1735s0§[_loc3_].length)
               {
                  _loc4_ %= this.§1t1735s0§[_loc3_].length;
               }
               if(this.§1t1736s0§[_loc3_] != null)
               {
                  this.§1t1736s0§[_loc3_].stop();
                  this.§1t1736s0§[_loc3_].removeEventListener(Event.SOUND_COMPLETE,this.§1t1739s0§[_loc3_]);
               }
               if(_loc3_ == this.§1t1729s0§)
               {
                  this.§1t1736s0§[_loc3_] = this.§1t1735s0§[_loc3_].play(0,1);
                  this.§1t1737s0§[_loc3_] = this.§1t1731s0§;
               }
               else if(_loc3_ == this.§1t1728s0§)
               {
                  this.§1t1736s0§[_loc3_] = this.§1t1735s0§[_loc3_].play(0,999);
                  this.§1t1737s0§[_loc3_] = this.§1t1731s0§;
               }
               else
               {
                  this.§1t1736s0§[_loc3_] = this.§1t1735s0§[_loc3_].play(_loc4_);
                  this.§1t1739s0§[_loc3_] = this.§1t1742s0§(_loc3_);
                  this.§1t1736s0§[_loc3_].addEventListener(Event.SOUND_COMPLETE,this.§1t1739s0§[_loc3_]);
                  if(this.§1t1736s0§[_loc3_] != null)
                  {
                     _loc5_ = this.§1t1736s0§[_loc3_].soundTransform;
                     _loc5_.volume = 0;
                     this.§1t1736s0§[_loc3_].soundTransform = _loc5_;
                     this.§1t1737s0§[_loc3_] = this.§1t1733s0§;
                     this.§1t1734s0§ = true;
                  }
               }
            }
            else if(Boolean(_loc2_[_loc3_]) && !this.§1t1740s0§[_loc3_])
            {
               this.§1t1737s0§[_loc3_] = this.§1t1732s0§;
               this.§1t1734s0§ = true;
            }
            _loc3_++;
         }
      }
      
      internal function §1t1742s0§(param1:int) : Function
      {
         var index:int = param1;
         return function(param1:Event):void
         {
            SoundChannel(param1.target).removeEventListener(Event.SOUND_COMPLETE,§1t1739s0§[index]);
            §1t1736s0§[index] = §1t1735s0§[index].play();
            §1t1736s0§[index].addEventListener(Event.SOUND_COMPLETE,§1t1739s0§[index]);
         };
      }
      
      public function update() : *
      {
         var _loc1_:SoundTransform = null;
         var _loc2_:int = 0;
         var _loc3_:SoundChannel = null;
         var _loc4_:int = 0;
         if(this.§1t1734s0§)
         {
            _loc2_ = 0;
            _loc4_ = 0;
            while(_loc4_ < this.§1t1730s0§)
            {
               if(this.§1t1737s0§[_loc4_] == this.§1t1732s0§)
               {
                  _loc3_ = this.§1t1736s0§[_loc4_];
                  if(_loc3_ != null)
                  {
                     _loc1_ = _loc3_.soundTransform;
                     _loc1_.volume -= 0.05;
                     if(_loc1_.volume <= 0)
                     {
                        _loc3_.stop();
                        if(this.§1t1739s0§[_loc4_] != null)
                        {
                           _loc3_.removeEventListener(Event.SOUND_COMPLETE,this.§1t1739s0§[_loc4_]);
                        }
                        this.§1t1739s0§[_loc4_] = null;
                        this.§1t1736s0§[_loc4_] = null;
                        this.§1t1737s0§[_loc4_] = this.§1t1731s0§;
                     }
                     else
                     {
                        this.§1t1736s0§[_loc4_].soundTransform = _loc1_;
                     }
                  }
                  else
                  {
                     this.§1t1737s0§[_loc4_] = this.§1t1731s0§;
                  }
               }
               else if(this.§1t1737s0§[_loc4_] == this.§1t1733s0§)
               {
                  _loc3_ = this.§1t1736s0§[_loc4_];
                  if(_loc3_ != null)
                  {
                     _loc1_ = _loc3_.soundTransform;
                     _loc1_.volume += 0.05;
                     if(_loc1_.volume >= 1)
                     {
                        this.§1t1737s0§[_loc4_] = this.§1t1731s0§;
                     }
                     _loc3_.soundTransform = _loc1_;
                  }
                  else
                  {
                     this.§1t1737s0§[_loc4_] = this.§1t1731s0§;
                  }
               }
               else
               {
                  _loc2_++;
               }
               _loc4_++;
            }
            if(_loc2_ == this.§1t1730s0§)
            {
               this.§1t1734s0§ = false;
            }
         }
      }
   }
}

