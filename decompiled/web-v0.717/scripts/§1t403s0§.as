package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1376")]
   public class §1t403s0§ extends MovieClip
   {
      
      public static var §1t9128s0§:int = 0;
      
      public static var §1t9129s0§:int = 1;
      
      public static var §1t9130s0§:int = 2;
      
      public static var §1t9131s0§:int = 3;
      
      public var exit_e:§1t6348s0§;
      
      public var exit_n:§1t6348s0§;
      
      public var exit_s:§1t6348s0§;
      
      public var exit_w:§1t6348s0§;
      
      public var questmark:TextField;
      
      public var rect:MovieClip;
      
      public var roomIcon:MovieClip;
      
      internal var §1t5263s0§:Array = new Array();
      
      internal var roomWidth:int;
      
      internal var isNSOrientation:Boolean;
      
      internal var mcWidth:int = 80;
      
      internal var §1t6351s0§:int = 30;
      
      internal var §1t6352s0§:Boolean = false;
      
      public function §1t403s0§()
      {
         super();
         this.§1t5263s0§[0] = this.exit_n;
         this.§1t5263s0§[1] = this.exit_s;
         this.§1t5263s0§[2] = this.exit_e;
         this.§1t5263s0§[3] = this.exit_w;
      }
      
      public function §1t6353s0§(param1:Boolean) : *
      {
         this.§1t6352s0§ = param1;
      }
      
      public function §1t6354s0§(param1:int, param2:Boolean, param3:int, param4:int, param5:Boolean) : *
      {
         if(param5)
         {
            this.rect.gotoAndStop(1);
         }
         else
         {
            this.rect.gotoAndStop(2);
         }
         this.§1t6352s0§ = false;
         this.roomWidth = param1;
         this.mcWidth = param1 / 800 * 40;
         this.rect.rotation = 0;
         this.rect.scaleX = param1 / 800;
         this.isNSOrientation = param2;
         if(param2)
         {
            this.rect.rotation = 90;
         }
         else
         {
            this.rect.rotation = 0;
         }
         this.questmark.visible = false;
         if(param3 != 0)
         {
            this.roomIcon.visible = true;
            if(param3 == §1t147s0§.§1t11363s0§ || param3 == §1t147s0§.§1t11395s0§)
            {
               if(§1t1525s0§.§1t9929s0§("key" + param4))
               {
                  this.roomIcon.visible = false;
               }
               else
               {
                  this.roomIcon.gotoAndStop("key");
               }
            }
            else if(param3 == §1t147s0§.§1t11365s0§)
            {
               if(§1t1525s0§.§1t9929s0§("boss" + param4))
               {
                  if(§1t1525s0§.§1t9929s0§("goodlootchest" + param4))
                  {
                     this.roomIcon.visible = false;
                  }
                  else
                  {
                     this.roomIcon.gotoAndStop("loot");
                  }
               }
               else
               {
                  this.roomIcon.gotoAndStop("boss");
               }
            }
            else if(param3 == §1t147s0§.§1t11368s0§)
            {
               if(§1t1525s0§.§1t9931s0§(param4))
               {
                  this.roomIcon.gotoAndStop("unlocked");
               }
               else
               {
                  this.roomIcon.gotoAndStop("locked");
               }
            }
            else if(param3 == §1t147s0§.§1t11385s0§)
            {
               if(§1t1523s0§.§1t9668s0§() || §1t1525s0§.§1t9931s0§(param4))
               {
                  this.roomIcon.gotoAndStop("unlocked");
               }
               else
               {
                  this.roomIcon.gotoAndStop("locked");
               }
            }
            else if(param3 == §1t147s0§.§1t11386s0§)
            {
               if(§1t1525s0§.§1t9929s0§("lever" + param4))
               {
                  this.roomIcon.visible = false;
               }
               else
               {
                  this.roomIcon.gotoAndStop("lever");
               }
            }
            else if(param3 == §1t8615s0§.§1t12645s0§)
            {
               this.roomIcon.gotoAndStop("market");
            }
            else if(param3 == §1t8615s0§.§1t12646s0§)
            {
               this.roomIcon.gotoAndStop("gamblingden");
               if(§1t1523s0§.§1t9575s0§(§1t1525s0§.§1t9935s0§(),param4))
               {
                  this.questmark.visible = true;
               }
            }
            else if(param3 == §1t8615s0§.§1t12647s0§)
            {
               this.roomIcon.gotoAndStop("bank");
            }
            else if(param3 == §1t8615s0§.§1t12648s0§)
            {
               this.roomIcon.gotoAndStop("stables");
            }
            else if(param3 == §1t8615s0§.§1t12649s0§)
            {
               this.roomIcon.gotoAndStop("inn");
               if(§1t1523s0§.§1t9574s0§(§1t1525s0§.§1t9935s0§(),param4))
               {
                  this.questmark.visible = true;
               }
            }
            else if(param3 == §1t8615s0§.§1t12650s0§)
            {
               this.roomIcon.gotoAndStop("barber");
            }
            else if(param3 == §1t8615s0§.§1t12651s0§)
            {
               this.roomIcon.gotoAndStop("merchant");
            }
            else if(param3 == §1t8615s0§.§1t12652s0§)
            {
               this.roomIcon.gotoAndStop("peddler");
            }
            else if(param3 == §1t8615s0§.§1t12653s0§)
            {
               this.roomIcon.gotoAndStop("bountyboard");
            }
            else if(param3 == §1t8615s0§.§1t12654s0§)
            {
               this.roomIcon.gotoAndStop("blacksmith");
            }
            else
            {
               this.roomIcon.visible = false;
            }
         }
         else
         {
            this.roomIcon.visible = false;
         }
         if(!this.roomIcon.visible)
         {
            if(§1t1523s0§.§1t9573s0§(§1t1525s0§.§1t9935s0§(),param4))
            {
               this.roomIcon.visible = true;
               this.roomIcon.gotoAndStop(17);
            }
         }
         else if(this.roomIcon.visible && §1t1523s0§.§1t9573s0§(§1t1525s0§.§1t9935s0§(),param4))
         {
            this.questmark.visible = true;
         }
      }
      
      public function §1t5768s0§() : *
      {
         this.roomIcon.visible = false;
      }
      
      public function §1t6355s0§() : *
      {
         this.roomIcon.gotoAndStop(4);
         this.roomIcon.visible = true;
      }
      
      public function initNodeExits(param1:Array) : *
      {
         var _loc2_:int = 0;
         this.§1t5265s0§();
         var _loc3_:int = param1[0] + param1[1] + param1[2] + param1[3];
         var _loc4_:int = this.§1t6351s0§ / 2 * (this.roomWidth / this.mcWidth);
         if(param1[§1t9128s0§] == 1)
         {
            this.§1t5263s0§[0].visible = true;
            if(this.isNSOrientation)
            {
               this.§1t5263s0§[0].x = 0;
               this.§1t5263s0§[0].y = -this.mcWidth / 2;
            }
            else
            {
               if(_loc3_ == 2)
               {
                  if(param1[§1t9130s0§] == 0)
                  {
                     _loc2_ = this.roomWidth - _loc4_;
                  }
                  else
                  {
                     _loc2_ = _loc4_;
                  }
               }
               else
               {
                  _loc2_ = this.roomWidth / 2;
               }
               this.§1t5263s0§[0].y = -this.§1t6351s0§ / 2;
               this.§1t5263s0§[0].x = _loc2_ / this.roomWidth * this.mcWidth - this.mcWidth / 2;
            }
         }
         if(param1[§1t9129s0§] == 1)
         {
            this.§1t5263s0§[1].visible = true;
            if(this.isNSOrientation)
            {
               this.§1t5263s0§[1].x = 0;
               this.§1t5263s0§[1].y = this.mcWidth / 2;
            }
            else
            {
               if(_loc3_ == 2)
               {
                  if(param1[§1t9131s0§] == 0)
                  {
                     _loc2_ = _loc4_;
                  }
                  else
                  {
                     _loc2_ = this.roomWidth - _loc4_;
                  }
               }
               else
               {
                  _loc2_ = this.roomWidth / 2;
               }
               this.§1t5263s0§[1].y = this.§1t6351s0§ / 2;
               this.§1t5263s0§[1].x = _loc2_ / this.roomWidth * this.mcWidth - this.mcWidth / 2;
            }
         }
         if(param1[§1t9130s0§] == 1)
         {
            this.§1t5263s0§[2].visible = true;
            if(!this.isNSOrientation)
            {
               this.§1t5263s0§[2].x = this.mcWidth / 2;
               this.§1t5263s0§[2].y = 0;
            }
            else
            {
               if(_loc3_ == 2)
               {
                  if(param1[§1t9129s0§] == 0)
                  {
                     _loc2_ = _loc4_;
                  }
                  else
                  {
                     _loc2_ = this.roomWidth - _loc4_;
                  }
               }
               else
               {
                  _loc2_ = this.roomWidth / 2;
               }
               this.§1t5263s0§[2].x = this.§1t6351s0§ / 2;
               this.§1t5263s0§[2].y = this.mcWidth / 2 - _loc2_ / this.roomWidth * this.mcWidth;
            }
         }
         if(param1[§1t9131s0§] == 1)
         {
            this.§1t5263s0§[3].visible = true;
            if(!this.isNSOrientation)
            {
               this.§1t5263s0§[3].x = -this.mcWidth / 2;
               this.§1t5263s0§[3].y = 0;
            }
            else
            {
               if(_loc3_ == 2)
               {
                  if(param1[§1t9128s0§] == 0)
                  {
                     _loc2_ = this.roomWidth - _loc4_;
                  }
                  else
                  {
                     _loc2_ = _loc4_;
                  }
               }
               else
               {
                  _loc2_ = this.roomWidth / 2;
               }
               this.§1t5263s0§[3].x = -this.§1t6351s0§ / 2;
               this.§1t5263s0§[3].y = this.mcWidth / 2 - _loc2_ / this.roomWidth * this.mcWidth;
            }
         }
      }
      
      public function §1t6356s0§(param1:XMLList) : *
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:§1t6348s0§ = null;
         if(param1 == null)
         {
            return;
         }
         var _loc5_:int = param1.length();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(param1[_loc6_].id == 0 || param1[_loc6_].id == 22 || param1[_loc6_].id == 63)
            {
               _loc2_ = String(param1[_loc6_].property).split(",");
               if(param1[_loc6_].id == 8 || _loc2_.length < 5 || _loc2_[4] < 0 || _loc2_[4] > 3)
               {
                  _loc4_ = new §1t6348s0§();
                  addChild(_loc4_);
                  _loc4_.gotoAndStop(2);
                  this.§1t5263s0§.push(_loc4_);
                  if(param1[_loc6_].id == 63)
                  {
                     _loc3_ = param1[_loc6_].x * 3 / 2;
                  }
                  else
                  {
                     _loc3_ = int(param1[_loc6_].x);
                  }
                  if(this.isNSOrientation)
                  {
                     _loc4_.x = 0;
                     _loc4_.y = this.mcWidth / 2 - _loc3_ / this.roomWidth * this.mcWidth;
                  }
                  else
                  {
                     _loc4_.x = _loc3_ / this.roomWidth * this.mcWidth - this.mcWidth / 2;
                     _loc4_.y = 0;
                  }
               }
               else if(param1[_loc6_].id != 0 && param1[_loc6_].id != 22 && param1[_loc6_].id != 63)
               {
                  _loc4_ = this.§1t5263s0§[_loc2_[4]];
                  _loc4_.visible = true;
                  _loc3_ = int(param1[_loc6_].x);
                  if(this.isNSOrientation)
                  {
                     _loc4_.x = -this.§1t6351s0§ / 2;
                     _loc4_.y = this.mcWidth / 2 - _loc3_ / this.roomWidth * this.mcWidth;
                  }
                  else
                  {
                     _loc4_.x = _loc3_ / this.roomWidth * this.mcWidth - this.mcWidth / 2;
                     _loc4_.y = -this.§1t6351s0§ / 2;
                  }
               }
            }
            _loc6_++;
         }
      }
      
      internal function §1t5265s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5263s0§.length)
         {
            if(_loc1_ >= 4)
            {
               removeChild(this.§1t5263s0§[_loc1_]);
            }
            else
            {
               this.§1t5263s0§[_loc1_].visible = false;
            }
            _loc1_++;
         }
         this.§1t5263s0§.splice(4,this.§1t5263s0§.length - 4);
      }
      
      public function §1t6357s0§(param1:int) : Point
      {
         return new Point(this.§1t5263s0§[param1].x,this.§1t5263s0§[param1].y);
      }
      
      public function §1t6358s0§(param1:§1t403s0§, param2:int) : *
      {
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         if(param1.§1t6352s0§ || !this.§1t5263s0§[param2].visible)
         {
            param1.visible = false;
            return;
         }
         if(param2 == §1t9128s0§)
         {
            _loc3_ = this.§1t6357s0§(§1t9128s0§);
            _loc4_ = param1.§1t6357s0§(§1t9129s0§);
         }
         else if(param2 == §1t9129s0§)
         {
            _loc3_ = this.§1t6357s0§(§1t9129s0§);
            _loc4_ = param1.§1t6357s0§(§1t9128s0§);
         }
         else if(param2 == §1t9130s0§)
         {
            _loc3_ = this.§1t6357s0§(§1t9130s0§);
            _loc4_ = param1.§1t6357s0§(§1t9131s0§);
         }
         else
         {
            if(param2 != §1t9131s0§)
            {
               param1.visible = false;
               return;
            }
            _loc3_ = this.§1t6357s0§(§1t9131s0§);
            _loc4_ = param1.§1t6357s0§(§1t9130s0§);
         }
         param1.x = _loc3_.x - _loc4_.x;
         param1.y = _loc3_.y - _loc4_.y;
         param1.visible = true;
      }
   }
}

