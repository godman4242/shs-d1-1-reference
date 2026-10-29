package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1707")]
   public class §1t139s0§ extends MovieClip
   {
      
      public var §1t5724s0§:§1t5050s0§;
      
      public var §1t5725s0§:§1t5050s0§;
      
      public var §1t5726s0§:SimpleButton;
      
      public var §1t5727s0§:SimpleButton;
      
      public var §1t5728s0§:§1t5059s0§;
      
      public var §1t5729s0§:TextField;
      
      internal var §1t5730s0§:Array;
      
      internal var §1t5731s0§:Array;
      
      internal var §1t5732s0§:Array;
      
      internal var §1t5733s0§:int = 0;
      
      internal var mode:int = 0;
      
      internal var §1t5734s0§:int = 5;
      
      internal var §1t5735s0§:Boolean = false;
      
      public function §1t139s0§()
      {
         var _loc1_:§1t5697s0§ = null;
         var _loc2_:int = 0;
         this.§1t5732s0§ = new Array();
         super();
         _loc2_ = 0;
         while(_loc2_ < 6)
         {
            _loc1_ = new §1t5697s0§();
            this.addChild(_loc1_);
            _loc1_.y = 4;
            _loc1_.x = 32 + _loc2_ * 120;
            this.§1t5732s0§.push(_loc1_);
            if(_loc2_ == 5)
            {
               _loc1_.§1t5709s0§();
               _loc1_.x = 683;
            }
            _loc2_++;
         }
         this.§1t5224s0§();
         this.§1t5728s0§.§1t5769s0§(§1t1521s0§.getString(16));
         §1t1521s0§.§1t9290s0§(this.§1t5729s0§,true);
         this.§1t5729s0§.text = §1t1521s0§.getString(907);
      }
      
      internal function §1t5736s0§(param1:Boolean) : *
      {
         this.§1t5728s0§.visible = param1;
         this.§1t5729s0§.visible = param1;
         if(param1)
         {
            this.§1t5728s0§.addEventListener(MouseEvent.CLICK,§1t406s0§.instance.§1t6652s0§);
         }
         else
         {
            this.§1t5728s0§.removeEventListener(MouseEvent.CLICK,§1t406s0§.instance.§1t6652s0§);
         }
      }
      
      public function §1t5224s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            this.§1t5732s0§[_loc1_].visible = false;
            _loc1_++;
         }
         this.§1t5727s0§.visible = false;
         this.§1t5726s0§.visible = false;
         this.§1t5724s0§.visible = false;
         this.§1t5725s0§.visible = false;
      }
      
      public function init() : *
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:§1t398s0§ = null;
         if(this.§1t5735s0§ || !§1t1523s0§.§1t9362s0§)
         {
            return;
         }
         this.§1t5730s0§ = new Array();
         _loc1_ = §1t1523s0§.§1t5730s0§.split("|");
         if(_loc1_[_loc1_.length - 1] == "")
         {
            --_loc1_.length;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.length)
         {
            if(_loc1_[_loc4_] != "" && _loc1_[_loc4_] != "-")
            {
               _loc2_ = _loc1_[_loc4_].split(",");
               _loc3_ = new §1t398s0§(_loc2_[0]);
               if(_loc2_.length == 2)
               {
                  _loc3_.setFriend(_loc2_[0],_loc2_[1]);
               }
               this.§1t5730s0§.push(_loc3_);
            }
            _loc4_++;
         }
         _loc3_ = new §1t398s0§(§1t1523s0§.charname);
         if(§1t1523s0§.§1t9503s0§)
         {
            _loc3_.setFriend(§1t1523s0§.charname,§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§));
         }
         else
         {
            _loc3_.setFriend(§1t1523s0§.charname,§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§));
         }
         this.§1t5730s0§.unshift(_loc3_);
         this.§1t5731s0§ = new Array();
         var _loc5_:Array = §1t1523s0§.§1t9378s0§.split("|");
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            if(_loc5_[_loc4_] != "")
            {
               _loc2_ = _loc5_[_loc4_].split(",");
               _loc3_ = new §1t398s0§("-1");
               _loc3_.setFacebook(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
               this.§1t5731s0§.push(_loc3_);
            }
            _loc4_++;
         }
         _loc3_ = new §1t398s0§("-1");
         if(§1t1523s0§.§1t9503s0§)
         {
            _loc3_.setFacebook(§1t1523s0§.facebookid,§1t1523s0§.charname,§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§),§1t1523s0§.charname);
         }
         else
         {
            _loc3_.setFacebook(§1t1523s0§.facebookid,§1t3317s0§.instance.username,§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§));
         }
         this.§1t5731s0§.push(_loc3_);
         this.§1t5731s0§.sortOn("wins",Array.NUMERIC | Array.DESCENDING);
         this.§1t5733s0§ = 0;
         this.§1t5004s0§();
         this.§1t5724s0§.§1t5769s0§(§1t1521s0§.getString(236));
         this.§1t5725s0§.§1t5769s0§(§1t1521s0§.getString(237));
         if(§1t1523s0§.facebookid == "")
         {
            this.mode = 0;
            this.§1t5724s0§.visible = false;
            this.§1t5725s0§.visible = false;
            this.§1t5734s0§ = 5;
            if(_loc1_.length > 0)
            {
               §1t3317s0§.instance.§1t2025s0§(this.§1t5730s0§,_loc1_,this);
            }
            else
            {
               this.§1t5740s0§(this.§1t5733s0§);
            }
         }
         else
         {
            this.mode = 1;
            this.§1t5724s0§.visible = true;
            this.§1t5725s0§.visible = true;
            this.§1t5740s0§(this.§1t5733s0§);
         }
         this.§1t5735s0§ = true;
      }
      
      public function §1t5737s0§() : *
      {
         if(this.§1t5730s0§ != null)
         {
            this.§1t5730s0§.length = 0;
         }
         if(this.§1t5731s0§ != null)
         {
            this.§1t5731s0§.length = 0;
         }
         this.removeEventListeners();
         this.§1t5224s0§();
         this.§1t5735s0§ = false;
      }
      
      public function §1t5738s0§() : String
      {
         if(this.§1t5730s0§ == null)
         {
            return "";
         }
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t5730s0§.length)
         {
            if(this.§1t5730s0§[_loc2_].charname != §1t1523s0§.charname)
            {
               _loc1_ = _loc1_ + this.§1t5730s0§[_loc2_].charname + "|";
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function §1t5739s0§(param1:String, param2:int) : *
      {
         if(this.§1t5730s0§.length >= 50)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(870),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            return;
         }
         var _loc3_:§1t398s0§ = new §1t398s0§(param1);
         _loc3_.wins = param2;
         this.§1t5730s0§.push(_loc3_);
         this.§1t5730s0§.sortOn("wins",Array.NUMERIC | Array.DESCENDING);
         if(this.mode == 0)
         {
            this.§1t5740s0§(this.§1t5733s0§);
         }
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9685s0§);
         §1t3317s0§.instance.§1t1946s0§();
      }
      
      public function §1t5714s0§(param1:String) : *
      {
         var _loc2_:int = -1;
         var _loc3_:int = int(this.§1t5730s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.§1t5730s0§[_loc4_].charname == param1)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc2_ != -1)
         {
            this.§1t5730s0§.splice(_loc2_,1);
         }
         this.§1t5740s0§(this.§1t5733s0§);
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9685s0§);
         §1t3317s0§.instance.§1t1946s0§();
      }
      
      public function §1t5740s0§(param1:int) : *
      {
         var _loc2_:Array = null;
         var _loc3_:§1t5697s0§ = null;
         if(this.mode == 0)
         {
            _loc2_ = this.§1t5730s0§;
            this.§1t5732s0§[5].visible = false;
         }
         else if(this.mode == 1)
         {
            _loc2_ = this.§1t5731s0§;
            this.§1t5732s0§[5].visible = true;
         }
         if(§1t1523s0§.§1t9521s0§)
         {
            this.§1t5732s0§[5].visible = true;
         }
         if(param1 > _loc2_.length - 5)
         {
            param1 = _loc2_.length - 5;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.§1t5734s0§)
         {
            _loc3_ = this.§1t5732s0§[_loc4_];
            if(param1 + _loc4_ < _loc2_.length)
            {
               _loc3_.§1t5707s0§(_loc2_[_loc4_ + param1],_loc4_ + param1 + 1);
            }
            else
            {
               _loc3_.hide();
            }
            _loc4_++;
         }
         this.§1t5727s0§.visible = param1 > 0;
         this.§1t5726s0§.visible = param1 < _loc2_.length - this.§1t5734s0§;
         this.§1t5733s0§ = param1;
      }
      
      public function §1t5741s0§(param1:MouseEvent) : *
      {
         var _loc2_:Array = null;
         if(this.mode == 0)
         {
            _loc2_ = this.§1t5730s0§;
         }
         else if(this.mode == 1)
         {
            _loc2_ = this.§1t5731s0§;
         }
         if(this.§1t5733s0§ < _loc2_.length - 1)
         {
            ++this.§1t5733s0§;
            this.§1t5740s0§(this.§1t5733s0§);
         }
      }
      
      public function §1t5742s0§(param1:MouseEvent) : *
      {
         if(this.§1t5733s0§ > 0)
         {
            --this.§1t5733s0§;
            this.§1t5740s0§(this.§1t5733s0§);
         }
      }
      
      public function §1t4235s0§() : *
      {
         if(this.§1t5735s0§)
         {
            this.§1t5740s0§(this.§1t5733s0§);
         }
      }
      
      public function §1t5743s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5732s0§.length)
         {
            if(this.§1t5732s0§[_loc1_].§1t5711s0§())
            {
               this.§1t5732s0§[_loc1_].§1t5710s0§();
            }
            _loc1_++;
         }
      }
      
      public function §1t5744s0§(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t5730s0§.length)
         {
            if(this.§1t5730s0§[_loc2_].charname == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function §1t5004s0§() : *
      {
         this.§1t5727s0§.addEventListener(MouseEvent.CLICK,this.§1t5742s0§);
         this.§1t5726s0§.addEventListener(MouseEvent.CLICK,this.§1t5741s0§);
         this.§1t5724s0§.addEventListener(MouseEvent.CLICK,this.§1t5746s0§);
         this.§1t5724s0§.§1t5004s0§();
         this.§1t5725s0§.addEventListener(MouseEvent.CLICK,this.§1t5747s0§);
         this.§1t5725s0§.§1t5004s0§();
      }
      
      public function removeEventListeners() : *
      {
         this.§1t5727s0§.removeEventListener(MouseEvent.CLICK,this.§1t5742s0§);
         this.§1t5726s0§.removeEventListener(MouseEvent.CLICK,this.§1t5741s0§);
         this.§1t5724s0§.removeEventListener(MouseEvent.CLICK,this.§1t5746s0§);
         this.§1t5724s0§.removeEventListeners();
         this.§1t5725s0§.removeEventListener(MouseEvent.CLICK,this.§1t5747s0§);
         this.§1t5725s0§.removeEventListeners();
      }
      
      public function §1t5745s0§(param1:String) : §1t398s0§
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t5730s0§.length)
         {
            if(this.§1t5730s0§[_loc2_].charname == param1)
            {
               return this.§1t5730s0§[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function §1t5746s0§(param1:MouseEvent) : *
      {
         if(this.mode == 1)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.mode = 1;
         this.§1t5733s0§ = 0;
         this.§1t5740s0§(0);
      }
      
      public function §1t5747s0§(param1:MouseEvent) : *
      {
         if(this.mode == 0)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.mode = 0;
         this.§1t5733s0§ = 0;
         this.§1t5740s0§(0);
      }
   }
}

