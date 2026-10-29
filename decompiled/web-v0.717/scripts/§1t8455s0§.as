package
{
   import flash.display.MovieClip;
   
   public class §1t8455s0§ extends §1t112s0§
   {
      
      internal var stageContent:MovieClip;
      
      internal var bgType:int;
      
      public function §1t8455s0§(param1:int, param2:int = 0, param3:int = 0)
      {
         var _loc4_:§1t106s0§ = null;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:§1t58s0§ = null;
         var _loc8_:int = 0;
         super();
         this.bgType = param1;
         _loc4_ = §1t1524s0§.§1t9864s0§(this.bgType);
         §1t2184s0§ = _loc4_.§1t2184s0§;
         §1t2185s0§ = _loc4_.§1t2185s0§;
         §1t2186s0§ = _loc4_.§1t2186s0§;
         §1t2187s0§ = _loc4_.§1t2187s0§;
         §1t2188s0§ = _loc4_.§1t2188s0§;
         §1t2189s0§ = _loc4_.§1t2189s0§;
         §1t2190s0§ = _loc4_.§1t2190s0§;
         §1t2191s0§ = _loc4_.§1t2191s0§;
         §1t2192s0§ = _loc4_.§1t2192s0§;
         §1t2188s0§ = _loc4_.§1t2188s0§;
         §1t2189s0§ = _loc4_.§1t2189s0§;
         §1t2190s0§ = _loc4_.§1t2190s0§;
         §1t2191s0§ = _loc4_.§1t2191s0§;
         §1t2192s0§ = _loc4_.§1t2192s0§;
         §1t2193s0§ = _loc4_.§1t2193s0§;
         §1t2194s0§ = _loc4_.§1t2194s0§;
         §1t2195s0§ = _loc4_.§1t2195s0§;
         §1t2196s0§ = _loc4_.§1t2196s0§;
         §1t2197s0§ = _loc4_.§1t2197s0§;
         §1t2198s0§ = _loc4_.§1t2198s0§;
         §1t2199s0§ = _loc4_.§1t2199s0§;
         §1t2200s0§ = _loc4_.§1t2200s0§;
         §1t2201s0§ = _loc4_.§1t2201s0§;
         §1t2202s0§ = _loc4_.§1t2202s0§;
         §1t2203s0§ = _loc4_.§1t2203s0§;
         §1t2204s0§ = _loc4_.§1t2204s0§;
         §1t2205s0§ = _loc4_.§1t2205s0§;
         §1t2206s0§ = _loc4_.§1t2206s0§;
         §1t2207s0§ = _loc4_.§1t2207s0§;
         this.stageContent = §1t1522s0§.getBG(_loc4_.name);
         addChild(this.stageContent);
         this.stageContent.redBG.visible = false;
         this.§1t8126s0§();
         if(this.bgType == §1t12587s0§)
         {
            if(param2 == 0)
            {
               §1t7190s0§[2].stop();
            }
            else if(param2 == 1)
            {
               §1t7190s0§[2].gotoAndStop(2);
            }
         }
         else if(this.bgType == §1t12583s0§)
         {
            this.§1t8127s0§(-§1t58s0§.random(2000,§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21)));
            §1t8114s0§ = 0;
         }
         else if(this.bgType == §1t12577s0§ || this.bgType == §1t12597s0§)
         {
            if(this.bgType == §1t12577s0§)
            {
               _loc6_ = §1t58s0§.random(4,§1t1525s0§.§1t9935s0§() * §1t1525s0§.§1t7341s0§()) + 1;
            }
            else
            {
               _loc6_ = §1t58s0§.random(3,§1t1525s0§.§1t9935s0§() * §1t1525s0§.§1t7341s0§()) + 1;
            }
            _loc5_ = 0;
            while(_loc5_ < §1t2190s0§)
            {
               §1t8116s0§[_loc5_].gotoAndStop(_loc6_);
               _loc5_++;
            }
            if(param3 != 0)
            {
               §1t8116s0§[param3 - 1].gotoAndStop(5);
            }
         }
         else if(this.bgType == §1t12582s0§)
         {
            _loc7_ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21));
            _loc5_ = int(§1t2190s0§ - 1);
            while(_loc5_ >= 0)
            {
               if(_loc7_.rand(3) == 0)
               {
                  this.stageContent.removeChild(§1t8116s0§[_loc5_]);
                  §1t8116s0§.splice(_loc5_,1);
                  --§1t2190s0§;
               }
               _loc5_--;
            }
            _loc5_ = int(§1t2192s0§ - 1);
            while(_loc5_ >= 0)
            {
               if(_loc7_.rand(3) == 0)
               {
                  this.stageContent.removeChild(§1t8117s0§[_loc5_]);
                  §1t8117s0§.splice(_loc5_,1);
                  --§1t2192s0§;
               }
               _loc5_--;
            }
            _loc7_.destroy();
         }
         else if((this.bgType == §1t12562s0§ || this.bgType == §1t12598s0§) && param2 != 0)
         {
            _loc5_ = 0;
            while(_loc5_ < §1t2189s0§)
            {
               §1t1643s0§.§1t11227s0§(§1t7190s0§[_loc5_].base,0.1,param2);
               _loc5_++;
            }
            _loc5_ = 0;
            while(_loc5_ < §1t2191s0§)
            {
               §1t1643s0§.§1t11227s0§(§1t7191s0§[_loc5_],0.05,param2);
               _loc5_++;
            }
         }
         else if((this.bgType == §1t12550s0§ || this.bgType == §1t12600s0§) && param2 != 0)
         {
            this.stageContent.bg.castle.visible = false;
         }
         else if(this.bgType == §1t12592s0§)
         {
            §1t7190s0§[0].stop();
            §1t7190s0§[1].stop();
            §1t7190s0§[2].stop();
            §1t7190s0§[3].stop();
            §1t7190s0§[4].stop();
            §1t7190s0§[5].stop();
            §1t7190s0§[6].stop();
            §1t7190s0§[7].stop();
            if(param2 != 0)
            {
               §1t7190s0§[param2].gotoAndStop(2);
            }
         }
         else if(this.bgType == §1t12588s0§)
         {
            §1t7190s0§[0].door1.stop();
            §1t7190s0§[0].door2.stop();
            §1t7190s0§[0].door3.stop();
            §1t7190s0§[1].door1.stop();
            §1t7190s0§[1].door2.stop();
            §1t7190s0§[1].door3.stop();
            §1t7190s0§[2].door1.stop();
            §1t7190s0§[2].door2.stop();
            §1t7190s0§[2].door3.stop();
            if(param2 != 0)
            {
               _loc8_ = param2 % 3;
               if(_loc8_ == 0)
               {
                  §1t7190s0§[(param2 - _loc8_) / 3].door1.gotoAndStop(2);
               }
               else if(_loc8_ == 1)
               {
                  §1t7190s0§[(param2 - _loc8_) / 3].door2.gotoAndStop(2);
               }
               else if(_loc8_ == 2)
               {
                  §1t7190s0§[(param2 - _loc8_) / 3].door3.gotoAndStop(2);
               }
            }
         }
         else if(this.bgType == §1t12589s0§)
         {
            this.§1t8458s0§(param2);
         }
         else if(this.bgType == §1t12601s0§)
         {
            this.§1t8459s0§(param2);
         }
         else if(this.bgType == §1t12567s0§)
         {
            this.§1t8460s0§(param2);
         }
         else if(this.bgType == §1t12585s0§)
         {
            this.§1t8461s0§(param2);
         }
         else if(this.bgType == §1t12586s0§)
         {
            this.§1t8462s0§(param2);
         }
         else if(this.bgType == §1t12581s0§ || this.bgType == §1t12573s0§)
         {
            this.§1t8463s0§(param2,param3,this.bgType == §1t12573s0§);
         }
         else if(this.bgType == §1t12593s0§ || this.bgType == §1t12594s0§)
         {
            this.§1t8464s0§(param2);
         }
         else if(this.bgType == §1t12584s0§)
         {
            this.§1t8465s0§(param3);
         }
         else if(this.bgType == §1t12580s0§)
         {
            this.§1t8466s0§(param2);
         }
         else if(this.bgType == §1t12579s0§)
         {
            §1t7190s0§[5].door.stop();
         }
      }
      
      override public function §1t8126s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 1;
         while(_loc1_ <= §1t2188s0§)
         {
            _loc2_ = MovieClip(this.stageContent.getChildByName("ff_" + _loc1_));
            §1t7189s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            if(!(this.bgType == §1t12553s0§ && _loc1_ > 2))
            {
               if(§1t2198s0§ != 0)
               {
                  §1t1643s0§.blur(_loc2_,§1t2198s0§);
               }
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
         §1t7189s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= §1t2189s0§)
         {
            _loc2_ = MovieClip(this.stageContent.getChildByName("f_" + _loc1_));
            §1t7190s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            if(§1t2199s0§ != 0)
            {
               §1t1643s0§.blur(_loc2_,§1t2199s0§);
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
            _loc2_ = MovieClip(this.stageContent.getChildByName("pp_" + _loc1_));
            §1t8116s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            if(§1t2200s0§ != 0)
            {
               §1t1643s0§.blur(_loc2_,§1t2200s0§);
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
         §1t8116s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= §1t2191s0§)
         {
            _loc2_ = MovieClip(this.stageContent.getChildByName("ground_" + _loc1_));
            §1t7191s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            if(_loc1_ <= 2 && §1t2201s0§ != 0)
            {
               §1t1643s0§.blur(_loc2_,§1t2201s0§);
            }
            _loc1_++;
         }
         §1t7191s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= §1t2192s0§)
         {
            _loc2_ = MovieClip(this.stageContent.getChildByName("fg_" + _loc1_));
            §1t8117s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            if(§1t2202s0§ != 0)
            {
               §1t1643s0§.blur(_loc2_,§1t2202s0§);
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
            _loc3_.x += param1 * §1t2203s0§;
            §1t8132s0§(_loc3_,4,param1);
            if(!_loc3_.visible)
            {
               §1t7196s0§(_loc3_,param1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §1t2189s0§)
         {
            _loc3_ = §1t7190s0§[_loc2_];
            _loc3_.x += param1 * §1t2204s0§;
            §1t8132s0§(_loc3_,3,param1);
            if(!_loc3_.visible)
            {
               §1t7196s0§(_loc3_,param1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §1t2190s0§)
         {
            _loc3_ = §1t8116s0§[_loc2_];
            _loc3_.x += param1 * §1t2205s0§;
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
            _loc3_.x += param1 * §1t2206s0§;
            §1t8132s0§(_loc3_,1,param1);
            if(!_loc3_.visible)
            {
               §1t7196s0§(_loc3_,param1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §1t2192s0§)
         {
            _loc3_ = §1t8117s0§[_loc2_];
            _loc3_.x += param1 * §1t2207s0§;
            §1t8132s0§(_loc3_,0,param1);
            if(!_loc3_.visible)
            {
               §1t7196s0§(_loc3_,param1);
            }
            _loc2_++;
         }
         §1t8114s0§ += param1;
      }
      
      override public function §1t8148s0§() : MovieClip
      {
         return this.stageContent.playercanvas;
      }
      
      override public function §1t8149s0§() : MovieClip
      {
         if(this.stageContent.farcanvas == null)
         {
            return this.stageContent.playercanvas;
         }
         return this.stageContent.farcanvas;
      }
      
      override public function §1t8150s0§() : MovieClip
      {
         return this.stageContent.redBG;
      }
      
      internal function §1t8458s0§(param1:int) : *
      {
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21));
         this.stageContent.bg.flower1.gotoAndStop(_loc2_.rand(5) + 1);
         this.stageContent.bg.flower2.gotoAndStop(_loc2_.rand(5) + 1);
         this.stageContent.bg.flower3.gotoAndStop(_loc2_.rand(5) + 1);
         this.stageContent.bg.flower4.gotoAndStop(_loc2_.rand(5) + 1);
         this.stageContent.bg.flower5.gotoAndStop(_loc2_.rand(5) + 1);
         this.stageContent.bg.flower6.gotoAndStop(_loc2_.rand(5) + 1);
         this.stageContent.bg.sidepiece1.gotoAndStop(_loc2_.rand(8) + 1);
         this.stageContent.bg.sidepiece2.gotoAndStop(_loc2_.rand(8) + 1);
         this.stageContent.bg.centerpiece.gotoAndStop(_loc2_.rand(9) + 1);
         _loc2_.destroy();
         var _loc3_:int = 0;
         if(param1 == 0)
         {
            this.stageContent.leftdoor.stop();
            this.stageContent.rightdoor.stop();
         }
         if(param1 == 1)
         {
            this.stageContent.leftdoor.gotoAndStop(2);
            this.stageContent.rightdoor.gotoAndStop(1);
         }
         else if(param1 == 2)
         {
            this.stageContent.leftdoor.gotoAndStop(1);
            this.stageContent.rightdoor.gotoAndStop(2);
         }
         else if(param1 == 3)
         {
            this.stageContent.leftdoor.gotoAndStop(2);
            this.stageContent.rightdoor.gotoAndStop(2);
         }
         else if(param1 == 4)
         {
            this.stageContent.leftdoor.gotoAndStop(4);
            this.stageContent.rightdoor.gotoAndStop(3);
            _loc3_ = 9398845;
         }
         else if(param1 == 5)
         {
            this.stageContent.leftdoor.gotoAndStop(3);
            this.stageContent.rightdoor.gotoAndStop(4);
            _loc3_ = 9398845;
         }
         else if(param1 == 6)
         {
            this.stageContent.leftdoor.gotoAndStop(4);
            this.stageContent.rightdoor.gotoAndStop(4);
            _loc3_ = 9398845;
         }
         if(_loc3_ != 0)
         {
            §1t1643s0§.§1t11214s0§(this.stageContent.bg.basecolor,_loc3_);
            if(this.stageContent.leftdoor.currentFrame <= 2)
            {
               §1t1643s0§.§1t11214s0§(this.stageContent.leftdoor.basecolor,_loc3_);
            }
            if(this.stageContent.rightdoor.currentFrame <= 2)
            {
               §1t1643s0§.§1t11214s0§(this.stageContent.rightdoor.basecolor,_loc3_);
            }
         }
      }
      
      internal function §1t8459s0§(param1:int) : *
      {
         §1t7190s0§[0].door.stop();
         §1t7190s0§[7].door.stop();
         if(param1 == 0)
         {
            §1t7190s0§[0].door.visible = false;
            §1t7190s0§[7].door.visible = false;
         }
         else if(param1 == 1)
         {
            §1t7190s0§[0].door.gotoAndStop(3);
            §1t7190s0§[7].door.gotoAndStop(4);
         }
         else if(param1 == 2)
         {
            §1t7190s0§[0].door.gotoAndStop(4);
            §1t7190s0§[7].door.gotoAndStop(3);
         }
         else if(param1 == 3)
         {
            §1t7190s0§[0].door.gotoAndStop(3);
            §1t7190s0§[7].door.gotoAndStop(3);
         }
      }
      
      internal function §1t8460s0§(param1:int) : *
      {
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§());
         this.stageContent.window1.visible = false;
         this.stageContent.window2.visible = false;
         this.stageContent.window3.visible = false;
         this.stageContent.window4.visible = false;
         this.stageContent.window5.visible = false;
         this.stageContent.window6.visible = false;
         this.stageContent.banner.visible = false;
         this.stageContent.fg_1.visible = false;
         this.stageContent.anvil.visible = false;
         this.stageContent.wood1.visible = false;
         this.stageContent.wood2.visible = false;
         this.stageContent.banner.visible = false;
         this.stageContent.shelf.visible = false;
         this.stageContent.fg_2.visible = false;
         this.stageContent.bag0.visible = false;
         this.stageContent.bag1.visible = false;
         this.stageContent.bag2.visible = false;
         this.stageContent.bag3.visible = false;
         this.stageContent.bag4.visible = false;
         this.stageContent.hat.visible = false;
         if(§1t1525s0§.§1t9935s0§() == 8390657)
         {
            this.stageContent.banner.visible = true;
            this.stageContent.anvil.visible = true;
            this.stageContent.fg_2.visible = true;
            this.stageContent.window4.visible = true;
            this.stageContent.shelf.visible = true;
            this.stageContent.wood1.visible = true;
            this.stageContent.wood2.visible = true;
            this.stageContent.hat.visible = true;
            return;
         }
         var _loc3_:int = _loc2_.rand(7);
         if(_loc3_ == 0)
         {
            this.stageContent.window2.visible = true;
         }
         else if(_loc3_ == 1)
         {
            this.stageContent.window4.visible = true;
         }
         else if(_loc3_ == 2)
         {
            this.stageContent.window1.visible = true;
         }
         else if(_loc3_ == 3)
         {
            this.stageContent.window6.visible = true;
         }
         else if(_loc3_ == 4)
         {
            this.stageContent.window2.visible = true;
            this.stageContent.window3.visible = true;
         }
         else if(_loc3_ == 5)
         {
            this.stageContent.window4.visible = true;
            this.stageContent.window5.visible = true;
         }
         else if(_loc3_ == 6)
         {
            this.stageContent.window2.visible = true;
            this.stageContent.window4.visible = true;
         }
         this.stageContent.bag0.visible = _loc2_.rand(2) == 0;
         this.stageContent.bag1.visible = this.stageContent.bag0.visible;
         this.stageContent.bag2.visible = _loc2_.rand(2) == 0;
         this.stageContent.bag3.visible = _loc2_.rand(2) == 0;
         this.stageContent.bag4.visible = _loc2_.rand(2) == 0;
         this.stageContent.bag5.visible = _loc2_.rand(2) == 0;
         this.stageContent.wood1.visible = _loc2_.rand(2) == 0;
         this.stageContent.wood2.visible = _loc2_.rand(2) == 0;
         this.stageContent.hat.visible = !this.stageContent.window1.visible && _loc2_.rand(2) == 0;
         this.stageContent.fg_1.visible = _loc2_.rand(2) == 0;
         this.stageContent.shelf.visible = _loc2_.rand(2) == 0;
         this.stageContent.fg_2.visible = _loc2_.rand(2) == 0;
         _loc2_.destroy();
      }
      
      internal function §1t8461s0§(param1:int) : *
      {
         var _loc4_:§1t8630s0§ = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         this.stageContent.f_10.stop();
         if(param1 == 1)
         {
            this.stageContent.f_11.gotoAndStop(2);
         }
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * 2);
         this.stageContent.f_1.gotoAndStop(_loc2_.rand(3) + 1);
         var _loc3_:Array = new Array();
         if(_loc2_.rand(2) == 0)
         {
            _loc6_ = _loc2_.rand(3);
            if(_loc6_ == 0)
            {
               _loc5_ = §1t1544s0§.§1t10349s0§;
            }
            else if(_loc6_ == 1)
            {
               _loc5_ = §1t1544s0§.§1t10351s0§;
            }
            else if(_loc6_ == 2)
            {
               _loc5_ = §1t1544s0§.§1t10353s0§;
            }
            _loc4_ = new §1t8630s0§((50 + _loc2_.rand(4)).toString() + "," + _loc5_ + ",1","patron1");
            _loc4_.x = 150;
            _loc3_.push(_loc4_);
         }
         if(_loc2_.rand(2) == 0)
         {
            _loc6_ = _loc2_.rand(3);
            if(_loc6_ == 0)
            {
               _loc5_ = §1t1544s0§.§1t10349s0§;
            }
            else if(_loc6_ == 1)
            {
               _loc5_ = §1t1544s0§.§1t10351s0§;
            }
            else if(_loc6_ == 2)
            {
               _loc5_ = §1t1544s0§.§1t10353s0§;
            }
            _loc4_ = new §1t8630s0§((50 + _loc2_.rand(4)).toString() + "," + _loc5_,"patron2");
            _loc4_.x = 340;
            _loc3_.push(_loc4_);
         }
         if(_loc2_.rand(2) == 0)
         {
            _loc6_ = _loc2_.rand(3);
            if(_loc6_ == 0)
            {
               _loc5_ = §1t1544s0§.§1t10349s0§;
            }
            else if(_loc6_ == 1)
            {
               _loc5_ = §1t1544s0§.§1t10351s0§;
            }
            else if(_loc6_ == 2)
            {
               _loc5_ = §1t1544s0§.§1t10353s0§;
            }
            _loc4_ = new §1t8630s0§((50 + _loc2_.rand(4)).toString() + "," + _loc5_,"patron3");
            _loc4_.x = 435;
            _loc3_.push(_loc4_);
         }
         if(_loc2_.rand(2) == 0)
         {
            _loc6_ = _loc2_.rand(3);
            if(_loc6_ == 0)
            {
               _loc5_ = §1t1544s0§.§1t10349s0§;
            }
            else if(_loc6_ == 1)
            {
               _loc5_ = §1t1544s0§.§1t10351s0§;
            }
            else if(_loc6_ == 2)
            {
               _loc5_ = §1t1544s0§.§1t10353s0§;
            }
            _loc4_ = new §1t8630s0§((50 + _loc2_.rand(4)).toString() + "," + _loc5_ + ",1","patron4");
            _loc4_.x = 520;
            _loc3_.push(_loc4_);
         }
         if(_loc2_.rand(2) == 0)
         {
            _loc6_ = _loc2_.rand(3);
            if(_loc6_ == 0)
            {
               _loc5_ = §1t1544s0§.§1t10349s0§;
            }
            else if(_loc6_ == 1)
            {
               _loc5_ = §1t1544s0§.§1t10351s0§;
            }
            else if(_loc6_ == 2)
            {
               _loc5_ = §1t1544s0§.§1t10353s0§;
            }
            _loc4_ = new §1t8630s0§((50 + _loc2_.rand(4)).toString() + "," + _loc5_,"patron5");
            _loc4_.x = 695;
            _loc3_.push(_loc4_);
         }
         if(_loc2_.rand(2) == 0)
         {
            _loc6_ = _loc2_.rand(3);
            if(_loc6_ == 0)
            {
               _loc5_ = §1t1544s0§.§1t10349s0§;
            }
            else if(_loc6_ == 1)
            {
               _loc5_ = §1t1544s0§.§1t10351s0§;
            }
            else if(_loc6_ == 2)
            {
               _loc5_ = §1t1544s0§.§1t10353s0§;
            }
            _loc4_ = new §1t8630s0§((50 + _loc2_.rand(4)).toString() + "," + _loc5_,"patron6");
            _loc4_.x = 795;
            _loc3_.push(_loc4_);
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc7_] as §1t8630s0§;
            _loc4_.y = 365;
            _loc4_.mcs.§1t6287s0§("");
            this.stageContent.ff_1.addChild(_loc4_);
            _loc7_++;
         }
         _loc2_.destroy();
      }
      
      internal function §1t8462s0§(param1:int) : *
      {
         var _loc3_:§1t8630s0§ = null;
         if(param1 == 1)
         {
            this.stageContent.f_2.gotoAndStop(2);
         }
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * 2);
         if(_loc2_.rand(2) == 0)
         {
            _loc3_ = new §1t8630s0§((50 + _loc2_.rand(4)).toString() + "," + §1t1544s0§.§1t10349s0§ + ",1","patron1");
            _loc3_.x = 220;
            _loc3_.y = §1t2184s0§;
            _loc3_.mcs.§1t6287s0§("");
            _loc3_.cacheAsBitmap = true;
            this.stageContent.playercanvas.addChild(_loc3_);
            §1t8118s0§.fixed = false;
            §1t8118s0§.push(_loc3_);
            §1t8118s0§.fixed = true;
         }
         if(_loc2_.rand(2) == 0)
         {
            _loc3_ = new §1t8630s0§((50 + _loc2_.rand(4)).toString() + "," + §1t1544s0§.§1t10349s0§ + ",1","patron2");
            _loc3_.x = 550;
            _loc3_.y = §1t2184s0§;
            _loc3_.mcs.§1t6287s0§("");
            _loc3_.cacheAsBitmap = true;
            this.stageContent.playercanvas.addChild(_loc3_);
            §1t8118s0§.fixed = false;
            §1t8118s0§.push(_loc3_);
            §1t8118s0§.fixed = true;
         }
         _loc2_.destroy();
      }
      
      internal function §1t8463s0§(param1:int, param2:int, param3:Boolean) : *
      {
         var _loc5_:MovieClip = null;
         var _loc4_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21));
         var _loc6_:int = 0;
         while(_loc6_ < §1t2190s0§ - 1)
         {
            _loc5_ = §1t8116s0§[_loc6_];
            _loc5_.decor1.visible = _loc4_.rand(2) == 0;
            _loc5_.decor2.visible = _loc4_.rand(2) == 0;
            _loc5_.decor3.visible = _loc4_.rand(2) == 0;
            _loc5_.decor4.visible = _loc4_.rand(2) == 0;
            _loc5_.decor5.visible = _loc4_.rand(2) == 0;
            _loc5_.decor6.visible = _loc4_.rand(2) == 0;
            _loc5_.decor7.visible = _loc4_.rand(2) == 0;
            _loc5_.decor7.gotoAndStop(param1 + 1);
            _loc5_.decor8.visible = _loc4_.rand(2) == 0;
            _loc5_.decor9.visible = _loc4_.rand(2) == 0;
            _loc5_.decor10.visible = _loc4_.rand(2) == 0;
            _loc5_.decor11.visible = _loc4_.rand(2) == 0;
            _loc5_.decor12.visible = _loc4_.rand(2) == 0;
            _loc5_.decor13.visible = _loc4_.rand(8) == 0;
            _loc5_.decor1.x = _loc4_.rand(500 - _loc5_.decor1.width);
            _loc5_.decor2.x = _loc4_.rand(500 - _loc5_.decor2.width);
            _loc5_.decor3.x = _loc4_.rand(500 - _loc5_.decor3.width);
            _loc5_.decor4.x = _loc4_.rand(500 - _loc5_.decor4.width);
            _loc5_.decor5.x = _loc4_.rand(500 - _loc5_.decor5.width);
            _loc5_.decor6.x = _loc4_.rand(500 - _loc5_.decor6.width);
            _loc5_.decor7.x = _loc4_.rand(500 - _loc5_.decor7.width);
            _loc5_.decor8.x = _loc4_.rand(500 - _loc5_.decor8.width);
            _loc5_.decor9.x = _loc4_.rand(500 - _loc5_.decor9.width);
            _loc5_.decor10.x = _loc4_.rand(500 - _loc5_.decor10.width);
            _loc5_.decor11.x = _loc4_.rand(500 - _loc5_.decor11.width);
            _loc5_.decor12.x = _loc4_.rand(500 - _loc5_.decor12.width);
            _loc5_.decor13.x = _loc4_.rand(500 - _loc5_.decor13.width);
            if(param3 && Boolean(_loc5_.decor2.visible))
            {
               _loc5_.cacheAsBitmap = false;
               _loc5_.curtains.cacheAsBitmap = true;
               if(_loc5_.decor1.visible)
               {
                  _loc5_.decor1.cacheAsBitmap = true;
               }
               if(_loc5_.decor3.visible)
               {
                  _loc5_.decor3.cacheAsBitmap = true;
               }
               if(_loc5_.decor4.visible)
               {
                  _loc5_.decor4.cacheAsBitmap = true;
               }
               if(_loc5_.decor5.visible)
               {
                  _loc5_.decor5.cacheAsBitmap = true;
               }
               if(_loc5_.decor6.visible)
               {
                  _loc5_.decor6.cacheAsBitmap = true;
               }
               if(_loc5_.decor7.visible)
               {
                  _loc5_.decor7.cacheAsBitmap = true;
               }
               if(_loc5_.decor8.visible)
               {
                  _loc5_.decor8.cacheAsBitmap = true;
               }
               if(_loc5_.decor9.visible)
               {
                  _loc5_.decor9.cacheAsBitmap = true;
               }
               if(_loc5_.decor10.visible)
               {
                  _loc5_.decor10.cacheAsBitmap = true;
               }
               if(_loc5_.decor11.visible)
               {
                  _loc5_.decor11.cacheAsBitmap = true;
               }
               if(_loc5_.decor12.visible)
               {
                  _loc5_.decor12.cacheAsBitmap = true;
               }
               if(_loc5_.decor13.visible)
               {
                  _loc5_.decor13.cacheAsBitmap = true;
               }
            }
            _loc6_++;
         }
         if(param2 > 0)
         {
            this.stageContent.pp_6.x = §1t8116s0§[param2 - 1].x;
            §1t8116s0§[param2 - 1].visible = false;
            this.stageContent.pp_6.visible = true;
         }
         else
         {
            this.stageContent.pp_6.visible = false;
         }
         _loc4_.destroy();
      }
      
      internal function §1t8464s0§(param1:int = 6) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21));
         var _loc4_:int = 0;
         while(_loc4_ < §1t2190s0§)
         {
            if(_loc4_ != 2)
            {
               _loc3_ = §1t8116s0§[_loc4_];
               _loc3_.decor1.visible = false;
               _loc3_.decor2.visible = false;
               _loc3_.decor3.visible = false;
               _loc3_.decor4.visible = false;
               _loc3_.decor5.visible = false;
               _loc3_.decor6.visible = false;
               _loc3_.decor7.visible = true;
               _loc3_.decor7.gotoAndStop(param1 + 1);
               _loc3_.decor8.visible = false;
               _loc3_.decor9.visible = false;
               _loc3_.decor10.visible = false;
               _loc3_.decor11.visible = false;
               _loc3_.decor12.visible = false;
               _loc3_.decor13.visible = false;
            }
            _loc4_++;
         }
         _loc4_ = 2;
         while(_loc4_ <= 6)
         {
            §1t7190s0§[_loc4_].gotoAndStop(param1 + 1);
            _loc4_++;
         }
         _loc2_.destroy();
      }
      
      internal function §1t8465s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:MovieClip = null;
         var _loc3_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21));
         this.stageContent.f_1.decor.gotoAndStop(_loc3_.rand(9) + 1);
         _loc2_ = _loc3_.rand(5);
         this.stageContent.f_1.decor.tear1.visible = _loc2_ == 0;
         this.stageContent.f_1.decor.tear2.visible = _loc2_ == 1;
         this.stageContent.f_2.decor.gotoAndStop(_loc3_.rand(9) + 1);
         _loc2_ = _loc3_.rand(5);
         this.stageContent.f_1.decor.tear1.visible = _loc2_ == 0;
         this.stageContent.f_1.decor.tear2.visible = _loc2_ == 1;
         if(param1 == 0)
         {
            _loc2_ = _loc3_.rand(3);
            if(_loc2_ == 0)
            {
               _loc5_ = this.stageContent.f_2;
            }
            else if(_loc2_ == 1)
            {
               _loc5_ = this.stageContent.f_3;
            }
            if(_loc2_ != 2)
            {
               _loc4_ = _loc5_.x;
               _loc5_.x = this.stageContent.f_1.x;
               this.stageContent.f_1.x = _loc4_;
            }
         }
         if(param1 == 1)
         {
            _loc4_ = int(this.stageContent.f_1.x);
            this.stageContent.f_1.x = this.stageContent.f_3.x;
            this.stageContent.f_3.x = _loc4_;
            this.stageContent.f_3.rocks.visible = false;
            this.§1t8127s0§(-250);
            §1t8114s0§ = 0;
            _loc7_ = -600;
            _loc6_ = 0;
            while(_loc6_ < §1t2190s0§)
            {
               _loc5_ = §1t8116s0§[_loc6_];
               _loc5_.x += _loc7_ * §1t2205s0§;
               §1t8132s0§(_loc5_,2,_loc7_ * §1t2205s0§);
               _loc6_++;
            }
         }
         else if(param1 == 2)
         {
            _loc4_ = int(this.stageContent.f_2.x);
            this.stageContent.f_2.x = this.stageContent.f_3.x;
            this.stageContent.f_3.x = _loc4_;
            this.stageContent.f_3.rocks.visible = false;
            this.§1t8127s0§(-440);
            §1t8114s0§ = 0;
            _loc7_ = 650;
            _loc6_ = 0;
            while(_loc6_ < §1t2190s0§)
            {
               _loc5_ = §1t8116s0§[_loc6_];
               _loc5_.x += _loc7_ * §1t2205s0§;
               §1t8132s0§(_loc5_,2,_loc7_ * §1t2205s0§);
               _loc6_++;
            }
         }
         else if(param1 == 3)
         {
            _loc4_ = int(this.stageContent.f_2.x);
            this.stageContent.f_2.x = this.stageContent.f_3.x;
            this.stageContent.f_3.x = _loc4_;
            this.stageContent.f_3.rocks.visible = false;
            this.§1t8127s0§(-1000);
            §1t8114s0§ = 0;
            _loc7_ = 700;
            _loc6_ = 0;
            while(_loc6_ < §1t2190s0§)
            {
               _loc5_ = §1t8116s0§[_loc6_];
               _loc5_.x += _loc7_ * §1t2205s0§;
               §1t8132s0§(_loc5_,2,_loc7_ * §1t2205s0§);
               _loc6_++;
            }
         }
         _loc6_ = 1;
         while(_loc6_ <= §1t2189s0§)
         {
            _loc8_ = MovieClip(this.stageContent.getChildByName("f_" + _loc6_));
            if(Boolean(_loc8_.flipped) && (_loc8_.x < 0 || _loc8_.x - _loc8_.width > screenWidth))
            {
               _loc8_.visible = false;
            }
            else if(!_loc8_.flipped && (_loc8_.x + _loc8_.width < 0 || _loc8_.x > screenWidth))
            {
               _loc8_.visible = false;
            }
            else
            {
               _loc8_.visible = true;
            }
            _loc6_++;
         }
         _loc3_.destroy();
      }
      
      internal function §1t8466s0§(param1:int) : *
      {
         var _loc3_:MovieClip = null;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21));
         _loc4_ = int(§1t2190s0§ - 1);
         while(_loc4_ >= 0)
         {
            _loc3_ = §1t8116s0§[_loc4_];
            if(_loc4_ == 7 || _loc4_ == 9)
            {
               if(_loc2_.rand(6) != 0)
               {
                  this.stageContent.removeChild(_loc3_);
                  §1t8116s0§.splice(_loc4_,1);
                  --§1t2190s0§;
               }
            }
            else if(_loc2_.rand(3) == 0)
            {
               this.stageContent.removeChild(_loc3_);
               §1t8116s0§.splice(_loc4_,1);
               --§1t2190s0§;
            }
            _loc3_.x = _loc2_.rand(§1t2186s0§ - 300) + 150;
            _loc4_--;
         }
         this.stageContent.f_1.decor1.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_1.decor2.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_1.decor3.visible = false;
         this.stageContent.f_1.decor4.visible = false;
         this.stageContent.f_1.decor5.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_1.decor6.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_1.decor7.visible = false;
         this.stageContent.f_2.decor1.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_2.decor2.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_2.decor3.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_2.decor4.visible = false;
         this.stageContent.f_2.decor5.visible = false;
         this.stageContent.f_2.decor6.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_2.decor7.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_2.decor8.visible = false;
         this.stageContent.f_3.decor1.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_3.decor2.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_3.decor3.visible = false;
         this.stageContent.f_3.decor4.visible = false;
         this.stageContent.f_3.decor5.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_3.decor6.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_3.decor7.visible = false;
         this.stageContent.f_3.door.visible = false;
         this.stageContent.f_4.decor1.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_4.decor2.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_4.decor3.visible = false;
         this.stageContent.f_4.decor4.visible = false;
         this.stageContent.f_5.decor1.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_5.decor2.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_5.decor3.visible = false;
         this.stageContent.f_5.decor4.visible = false;
         this.stageContent.f_5.decor5.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_5.decor6.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_5.decor7.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_5.decor8.visible = false;
         this.stageContent.f_6.decor1.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_6.decor2.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_6.decor3.visible = _loc2_.rand(4) == 0;
         this.stageContent.f_6.decor4.visible = false;
         this.stageContent.f_6.door.visible = false;
         _loc6_ = _loc2_.rand(6);
         _loc7_ = _loc2_.rand(6);
         _loc8_ = _loc2_.rand(6);
         _loc9_ = _loc2_.rand(6);
         _loc10_ = _loc2_.rand(6);
         _loc11_ = _loc2_.rand(6);
         _loc12_ = §1t7190s0§[_loc6_].x;
         §1t7190s0§[_loc6_].x = §1t7190s0§[_loc7_].x;
         §1t7190s0§[_loc7_].x = _loc12_;
         _loc12_ = §1t7190s0§[_loc8_].x;
         §1t7190s0§[_loc8_].x = §1t7190s0§[_loc9_].x;
         §1t7190s0§[_loc9_].x = _loc12_;
         _loc12_ = §1t7190s0§[_loc10_].x;
         §1t7190s0§[_loc10_].x = §1t7190s0§[_loc11_].x;
         §1t7190s0§[_loc11_].x = _loc12_;
         _loc5_ = _loc2_.rand(4);
         this.stageContent.ff_1.decor1.visible = _loc5_ == 3;
         _loc5_ = _loc2_.rand(5);
         this.stageContent.ff_2.decor1.visible = _loc5_ == 3;
         this.stageContent.ff_2.decor2.visible = _loc5_ == 4;
         _loc5_ = _loc2_.rand(6);
         this.stageContent.ff_3.decor1.visible = _loc5_ == 3;
         this.stageContent.ff_3.decor2.visible = _loc5_ == 4;
         this.stageContent.ff_3.decor2.visible = _loc5_ == 5;
         _loc5_ = _loc2_.rand(5);
         this.stageContent.ff_4.decor1.visible = _loc5_ == 3;
         this.stageContent.ff_4.decor2.visible = _loc5_ == 4;
         _loc6_ = _loc2_.rand(4);
         _loc7_ = _loc2_.rand(4);
         _loc8_ = _loc2_.rand(4);
         _loc9_ = _loc2_.rand(4);
         _loc12_ = §1t7189s0§[_loc6_].x;
         §1t7189s0§[_loc6_].x = §1t7189s0§[_loc7_].x;
         §1t7189s0§[_loc7_].x = _loc12_;
         _loc12_ = §1t7189s0§[_loc8_].x;
         §1t7189s0§[_loc8_].x = §1t7189s0§[_loc9_].x;
         §1t7189s0§[_loc9_].x = _loc12_;
         _loc4_ = 1;
         while(_loc4_ <= §1t2189s0§)
         {
            _loc3_ = MovieClip(this.stageContent.getChildByName("f_" + _loc4_));
            if(Boolean(_loc3_.flipped) && (_loc3_.x < 0 || _loc3_.x - _loc3_.width > screenWidth))
            {
               _loc3_.visible = false;
            }
            else if(!_loc3_.flipped && (_loc3_.x + _loc3_.width < 0 || _loc3_.x > screenWidth))
            {
               _loc3_.visible = false;
            }
            else
            {
               _loc3_.visible = true;
            }
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= §1t2188s0§)
         {
            _loc3_ = MovieClip(this.stageContent.getChildByName("ff_" + _loc4_));
            if(Boolean(_loc3_.flipped) && (_loc3_.x < 0 || _loc3_.x - _loc3_.width > screenWidth))
            {
               _loc3_.visible = false;
            }
            else if(!_loc3_.flipped && (_loc3_.x + _loc3_.width < 0 || _loc3_.x > screenWidth))
            {
               _loc3_.visible = false;
            }
            else
            {
               _loc3_.visible = true;
            }
            _loc4_++;
         }
         _loc2_.destroy();
      }
      
      override public function §1t2292s0§() : *
      {
         var _loc1_:int = 0;
         super.§1t2292s0§();
         if(this.bgType == §1t12592s0§)
         {
            _loc1_ = 0;
            while(_loc1_ < §1t2190s0§)
            {
               §1t1643s0§.§1t11215s0§(§1t8116s0§[_loc1_]);
               §1t8116s0§[_loc1_].visible = true;
               _loc1_++;
            }
         }
      }
   }
}

