package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2802")]
   public class §1t8450s0§ extends §1t112s0§
   {
      
      public var f_1:MovieClip;
      
      public var f_10:MovieClip;
      
      public var f_11:MovieClip;
      
      public var f_12:MovieClip;
      
      public var f_2:MovieClip;
      
      public var f_3:MovieClip;
      
      public var f_4:MovieClip;
      
      public var f_5:MovieClip;
      
      public var f_6:MovieClip;
      
      public var f_7:MovieClip;
      
      public var f_8:MovieClip;
      
      public var f_9:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var ff_2:MovieClip;
      
      public var ff_3:MovieClip;
      
      public var ff_4:MovieClip;
      
      public var ff_5:MovieClip;
      
      public var ff_6:MovieClip;
      
      public var ff_7:MovieClip;
      
      public var ground_1:MovieClip;
      
      public var ground_2:MovieClip;
      
      public var ground_3:MovieClip;
      
      public var ground_4:MovieClip;
      
      public var playercanvas:§1t5016s0§;
      
      public var redBG:RedBG;
      
      public var sky:MovieClip;
      
      internal var §1t8453s0§:Boolean;
      
      public function §1t8450s0§(param1:int, param2:int)
      {
         var _loc5_:int = 0;
         super();
         §1t2186s0§ = 1600;
         §1t2184s0§ = 400;
         §1t2185s0§ = true;
         §1t2188s0§ = 7;
         §1t2189s0§ = 12;
         §1t2190s0§ = 0;
         §1t2191s0§ = 4;
         §1t2192s0§ = 0;
         this.§1t8126s0§();
         this.redBG.visible = false;
         var _loc3_:uint = §1t70s0§.instance.§1t1164s0§(§1t1525s0§.§1t9935s0§());
         var _loc4_:ColorTransform = new ColorTransform();
         _loc4_.color = _loc3_;
         this.§1t8453s0§ = param2 == 1 && _loc3_ <= 4;
         if(param1 == 0)
         {
            _loc5_ = 0;
            while(_loc5_ < 6)
            {
               §1t7190s0§[_loc5_].visible = false;
               _loc5_++;
            }
         }
         else if(param1 == 1)
         {
            _loc5_ = 0;
            while(_loc5_ < 6)
            {
               §1t7190s0§[_loc5_].visible = true;
               §1t7190s0§[_loc5_].gotoAndStop(1);
               _loc5_++;
            }
         }
         else if(param1 == 2)
         {
            _loc5_ = 0;
            while(_loc5_ < 6)
            {
               §1t7190s0§[_loc5_].visible = true;
               §1t7190s0§[_loc5_].gotoAndStop(2);
               _loc5_++;
            }
         }
         _loc5_ = 6;
         while(_loc5_ < 12)
         {
            if(_loc3_ >= 1 && _loc3_ <= 4)
            {
               §1t7190s0§[_loc5_].gotoAndStop(_loc3_ + 1);
            }
            else
            {
               §1t7190s0§[_loc5_].gotoAndStop(1);
               §1t7190s0§[_loc5_].building.color.transform.colorTransform = _loc4_;
            }
            _loc5_++;
         }
         this.sky.gotoAndStop(§1t58s0§.random(10,§1t1525s0§.§1t9935s0§()) + 1);
      }
      
      override public function §1t8126s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 1;
         while(_loc1_ <= §1t2188s0§)
         {
            _loc2_ = MovieClip(this.getChildByName("ff_" + _loc1_));
            §1t7189s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            §1t1643s0§.blur(_loc2_,8);
            if(Boolean(_loc2_.flipped) && (_loc2_.x < 0 || _loc2_.x - _loc2_.width > screenWidth))
            {
               _loc2_.visible = false;
            }
            else if(!_loc2_.flipped && (_loc2_.x + _loc2_.width < 0 || _loc2_.x > screenWidth))
            {
               _loc2_.visible = false;
            }
            _loc1_++;
         }
         §1t7189s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= §1t2189s0§)
         {
            _loc2_ = MovieClip(this.getChildByName("f_" + _loc1_));
            §1t7190s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            if(this.§1t8453s0§)
            {
               §1t1643s0§.blur(_loc2_,8);
            }
            else
            {
               §1t1643s0§.blur(_loc2_,4);
            }
            if(Boolean(_loc2_.flipped) && (_loc2_.x < 0 || _loc2_.x - _loc2_.width > screenWidth))
            {
               _loc2_.visible = false;
            }
            else if(!_loc2_.flipped && (_loc2_.x + _loc2_.width < 0 || _loc2_.x > screenWidth))
            {
               _loc2_.visible = false;
            }
            _loc1_++;
         }
         §1t7190s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= §1t2190s0§)
         {
            _loc2_ = MovieClip(this.getChildByName("pp_" + _loc1_));
            §1t8116s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = this.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            if(Boolean(_loc2_.flipped) && (_loc2_.x < 0 || _loc2_.x - _loc2_.width > screenWidth))
            {
               _loc2_.visible = false;
            }
            else if(!_loc2_.flipped && (_loc2_.x + _loc2_.width < 0 || _loc2_.x > screenWidth))
            {
               _loc2_.visible = false;
            }
            _loc1_++;
         }
         §1t8116s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= §1t2191s0§)
         {
            _loc2_ = MovieClip(this.getChildByName("ground_" + _loc1_));
            §1t7191s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            §1t1643s0§.blur(_loc2_,4);
            _loc1_++;
         }
         §1t7191s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= §1t2192s0§)
         {
            _loc2_ = MovieClip(this.getChildByName("fg_" + _loc1_));
            §1t8117s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            §1t1643s0§.blur(_loc2_,8);
            if(Boolean(_loc2_.flipped) && (_loc2_.x < 0 || _loc2_.x - _loc2_.width > screenWidth))
            {
               _loc2_.visible = false;
            }
            else if(!_loc2_.flipped && (_loc2_.x + _loc2_.width < 0 || _loc2_.x > screenWidth))
            {
               _loc2_.visible = false;
            }
            _loc1_++;
         }
         §1t8117s0§.fixed = true;
      }
      
      override public function §1t8127s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         _loc2_ = 0;
         while(_loc2_ < §1t2188s0§)
         {
            _loc3_ = §1t7189s0§[_loc2_];
            if(this.§1t8453s0§)
            {
               _loc3_.x += param1 * 6 / 8;
               §1t8132s0§(_loc3_,4,param1);
               if(!_loc3_.visible)
               {
                  §1t7196s0§(_loc3_,param1);
               }
            }
            else
            {
               _loc3_.x += param1 / 4;
               §1t8132s0§(_loc3_,4,param1);
               if(!_loc3_.visible)
               {
                  §1t7196s0§(_loc3_,param1);
               }
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §1t2189s0§)
         {
            _loc3_ = §1t7190s0§[_loc2_];
            if(this.§1t8453s0§)
            {
               _loc3_.x += param1 * 7 / 8;
               §1t8132s0§(_loc3_,3,param1);
               if(!_loc3_.visible)
               {
                  §1t7196s0§(_loc3_,param1);
               }
            }
            else
            {
               _loc3_.x += param1 / 3;
               §1t8132s0§(_loc3_,3,param1);
               if(!_loc3_.visible)
               {
                  §1t7196s0§(_loc3_,param1);
               }
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §1t2190s0§)
         {
            _loc3_ = §1t8116s0§[_loc2_];
            _loc3_.x += param1;
            §1t8132s0§(_loc3_,2,param1);
            if(!_loc3_.visible)
            {
               §1t7196s0§(_loc3_,param1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §1t2191s0§)
         {
            _loc3_ = §1t7191s0§[_loc2_];
            _loc3_.x += param1;
            §1t8132s0§(_loc3_,1,param1);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §1t2192s0§)
         {
            _loc3_ = §1t8117s0§[_loc2_];
            _loc3_.x += param1 * 2;
            §1t8132s0§(_loc3_,0,param1);
            if(!_loc3_.visible)
            {
               §1t7196s0§(_loc3_,param1);
            }
            _loc2_++;
         }
         §1t8114s0§ += param1;
      }
      
      override public function §1t2292s0§() : *
      {
         this.redBG.visible = true;
         super.§1t2292s0§();
      }
      
      override public function §1t3310s0§() : *
      {
         this.redBG.visible = false;
         super.§1t3310s0§();
      }
   }
}

