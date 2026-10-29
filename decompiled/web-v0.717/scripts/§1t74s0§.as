package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1160")]
   public class §1t74s0§ extends MovieClip
   {
      
      internal var §1t6231s0§:Array = new Array();
      
      internal var §1t6232s0§:MovieClip;
      
      internal var §1t6233s0§:MovieClip;
      
      internal var §1t6234s0§:MovieClip;
      
      internal var §1t6235s0§:MovieClip;
      
      internal var §1t6236s0§:Boolean = false;
      
      public function §1t74s0§()
      {
         super();
         mouseChildren = false;
      }
      
      public function §1t5494s0§() : *
      {
         var _loc1_:int = numChildren;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            removeChildAt(0);
            _loc2_++;
         }
         this.§1t6231s0§.length = 0;
         this.§1t6232s0§ = null;
         this.§1t6233s0§ = null;
         this.§1t6234s0§ = null;
         this.§1t6235s0§ = null;
      }
      
      public function §1t1549s0§(param1:§1t17s0§, param2:§1t17s0§, param3:§1t17s0§, param4:§1t17s0§, param5:§1t17s0§, param6:§1t17s0§) : *
      {
         var _loc7_:int = param1.§1t483s0§();
         var _loc8_:int = param2.§1t483s0§();
         var _loc9_:int = param3.§1t483s0§();
         var _loc10_:int = param4.§1t483s0§();
         var _loc11_:int = param5.§1t483s0§();
         var _loc12_:int = param6.§1t483s0§();
         if(_loc12_ > 0)
         {
            this.§1t6244s0§(_loc12_);
         }
         else
         {
            this.§1t6244s0§(10000);
         }
         if(_loc10_ > 0)
         {
            this.§1t6239s0§(_loc10_);
         }
         else
         {
            this.§1t6239s0§(8005);
         }
         if(_loc11_ > 0)
         {
            this.§1t6243s0§(_loc11_,param5.§1t527s0§(),param5.§1t528s0§());
         }
         else
         {
            this.§1t6243s0§(9000);
         }
         this.§1t6236s0§ = _loc9_ > 0 && _loc9_ != 7000 && _loc9_ != 7049;
         if(_loc8_ > 0)
         {
            this.§1t6242s0§(_loc8_);
         }
         else
         {
            this.§1t6242s0§(6001);
         }
         if(_loc7_ > 0)
         {
            this.§1t6245s0§(_loc7_,param1.§1t527s0§(),param1.§1t528s0§());
         }
         else
         {
            this.§1t6245s0§(4000);
         }
         if(this.§1t6236s0§)
         {
            this.§1t6240s0§(_loc9_,param3.§1t527s0§(),param3.§1t528s0§());
         }
         else
         {
            this.§1t6240s0§(7000);
         }
         addChild(this.§1t6231s0§[§1t75s0§.§1t12396s0§]);
         this.§1t6246s0§(§1t1544s0§.§1t10561s0§,0);
      }
      
      public function §1t5489s0§(param1:int) : *
      {
         var _loc2_:§1t76s0§ = §1t1524s0§.§1t9874s0§(param1);
         if(_loc2_ != null)
         {
            this.§1t1550s0§(_loc2_.mcs);
         }
      }
      
      public function §1t5491s0§(param1:String) : *
      {
         var _loc2_:Array = new Array();
         if(param1.indexOf(§1t1701s0§.§1t11255s0§) != -1)
         {
            param1 = param1.split(§1t1701s0§.§1t11255s0§)[0];
         }
         var _loc3_:Array = param1.split("|");
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_[_loc5_] = §1t17s0§.§1t8745s0§(_loc3_[_loc5_]);
            _loc5_++;
         }
         this.§1t1549s0§(_loc2_[§1t1523s0§.§1t9439s0§],_loc2_[§1t1523s0§.§1t9441s0§],_loc2_[§1t1523s0§.§1t9442s0§],_loc2_[§1t1523s0§.§1t9443s0§],_loc2_[§1t1523s0§.§1t9444s0§],_loc2_[§1t1523s0§.§1t9445s0§]);
      }
      
      public function §1t5490s0§() : *
      {
         this.§1t1549s0§(§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9439s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9441s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9442s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9443s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9444s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9445s0§]);
      }
      
      public function §1t1550s0§(param1:XMLList) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1.armor.toString() != "")
         {
            _loc2_ = this.§1t6237s0§(param1.armor);
         }
         if(param1.hair.toString() != "")
         {
            _loc3_ = this.§1t6237s0§(param1.hair);
         }
         if(param1.hat.toString() != "")
         {
            _loc4_ = this.§1t6237s0§(param1.hat);
         }
         if(param1.head.toString() != "")
         {
            _loc5_ = this.§1t6237s0§(param1.head);
         }
         if(param1.mask.toString() != "")
         {
            _loc6_ = this.§1t6237s0§(param1.mask);
         }
         if(param1.neck.toString() != "")
         {
            _loc7_ = this.§1t6237s0§(param1.neck);
         }
         var _loc8_:§1t17s0§ = new §1t17s0§(_loc2_);
         if(param1.armorpcolor.toString() != "")
         {
            _loc8_.§1t529s0§(param1.armorpcolor);
         }
         if(param1.armorscolor.toString() != "")
         {
            _loc8_.§1t530s0§(param1.armorscolor);
         }
         var _loc9_:§1t17s0§ = new §1t17s0§(_loc4_);
         if(param1.hatpcolor.toString() != "")
         {
            _loc9_.§1t529s0§(param1.hatpcolor);
         }
         if(param1.hatscolor.toString() != "")
         {
            _loc9_.§1t530s0§(param1.hatscolor);
         }
         var _loc10_:§1t17s0§ = new §1t17s0§(_loc6_);
         if(param1.maskpcolor.toString() != "")
         {
            _loc10_.§1t529s0§(param1.maskpcolor);
         }
         if(param1.maskscolor.toString() != "")
         {
            _loc10_.§1t530s0§(param1.maskscolor);
         }
         this.§1t1549s0§(_loc8_,new §1t17s0§(_loc3_),_loc9_,new §1t17s0§(_loc5_),_loc10_,new §1t17s0§(_loc7_));
      }
      
      internal function §1t6237s0§(param1:String) : int
      {
         var _loc2_:Array = new Array();
         _loc2_ = param1.split(",");
         return _loc2_[int(Math.random() * _loc2_.length)];
      }
      
      internal function §1t6238s0§(param1:String, param2:int) : MovieClip
      {
         var art:int = 0;
         var ClassDefinition:Class = null;
         var partType:String = param1;
         var id:int = param2;
         var xmlItem:§1t104s0§ = §1t1524s0§.§1t9862s0§(id);
         if(xmlItem == null)
         {
            art = id;
         }
         else
         {
            art = xmlItem.art;
         }
         if(§1t1523s0§.§1t9494s0§)
         {
            return §1t1522s0§.§1t6238s0§(partType,art);
         }
         try
         {
            if(getDefinitionByName(partType + art.toString()))
            {
               ClassDefinition = Class(getDefinitionByName(partType + art.toString()));
            }
            else
            {
               ClassDefinition = Class(getDefinitionByName(partType + "0"));
            }
         }
         catch(error:ReferenceError)
         {
            return null;
         }
         return new ClassDefinition() as MovieClip;
      }
      
      public function §1t6239s0§(param1:int) : *
      {
         var _loc2_:MovieClip = this.§1t6231s0§[§1t75s0§.§1t12393s0§];
         var _loc3_:MovieClip = this.§1t6238s0§("head",param1);
         if(_loc3_ == null)
         {
            _loc3_ = new head8004();
         }
         this.addChild(_loc3_);
         if(_loc2_ != null)
         {
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            _loc3_.rotation = _loc2_.rotation;
            setChildIndex(_loc3_,getChildIndex(_loc2_));
            removeChild(_loc2_);
         }
         this.§1t6231s0§[§1t75s0§.§1t12393s0§] = _loc3_;
         var _loc4_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc5_:Boolean = _loc4_ != null && _loc4_.animated;
         if(!_loc5_)
         {
            _loc3_.cacheAsBitmapMatrix = _loc3_.transform.concatenatedMatrix;
            _loc3_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6240s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         this.§1t6236s0§ = param1 > 0 && param1 != 7000 && param1 != 7049;
         this.§1t6232s0§.visible = !this.§1t6236s0§;
         this.§1t6235s0§.visible = this.§1t6236s0§;
         var _loc4_:MovieClip = this.§1t6238s0§("hat",param1);
         if(_loc4_ == null)
         {
            _loc4_ = new hat7000();
         }
         if(param2 != 1 && _loc4_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc4_.primaryColor,param2);
         }
         if(param3 != 1 && _loc4_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc4_.secondaryColor,param3);
         }
         this.addChild(_loc4_);
         if(this.§1t6233s0§ != null)
         {
            _loc4_.x = this.§1t6233s0§.x;
            _loc4_.y = this.§1t6233s0§.y;
            _loc4_.rotation = this.§1t6233s0§.rotation;
            setChildIndex(_loc4_,getChildIndex(this.§1t6233s0§));
            removeChild(this.§1t6233s0§);
         }
         this.§1t6233s0§ = _loc4_;
         var _loc5_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc6_:Boolean = _loc5_ != null && _loc5_.animated;
         if(!_loc6_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6241s0§(param1:int, param2:uint) : *
      {
         var _loc3_:int = 0;
         if(param1 == 6001 || param1 <= 0)
         {
            _loc3_ = 6001;
         }
         else
         {
            _loc3_ = 6000;
         }
         var _loc4_:MovieClip = this.§1t6238s0§("hair",_loc3_);
         if(_loc4_ == null)
         {
            _loc4_ = new hair6000();
         }
         if(_loc3_ == 6000)
         {
            §1t1643s0§.§1t11214s0§(_loc4_.primaryColor,param2);
         }
         this.addChild(_loc4_);
         if(this.§1t6235s0§ != null)
         {
            setChildIndex(_loc4_,getChildIndex(this.§1t6235s0§));
            removeChild(this.§1t6235s0§);
         }
         this.§1t6235s0§ = _loc4_;
         this.§1t6235s0§.x = this.§1t6232s0§.x;
         this.§1t6235s0§.y = this.§1t6232s0§.y;
         this.§1t6235s0§.rotation = this.§1t6232s0§.rotation;
         this.§1t6232s0§.visible = !this.§1t6236s0§;
         this.§1t6235s0§.visible = this.§1t6236s0§;
      }
      
      public function §1t6242s0§(param1:int) : *
      {
         var _loc2_:MovieClip = this.§1t6238s0§("hair",param1);
         if(_loc2_ == null)
         {
            _loc2_ = new hair6000();
         }
         this.addChild(_loc2_);
         if(this.§1t6232s0§ != null)
         {
            _loc2_.x = this.§1t6232s0§.x;
            _loc2_.y = this.§1t6232s0§.y;
            _loc2_.rotation = this.§1t6232s0§.rotation;
            setChildIndex(_loc2_,getChildIndex(this.§1t6232s0§));
            removeChild(this.§1t6232s0§);
         }
         this.§1t6232s0§ = _loc2_;
         var _loc3_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc4_:Boolean = _loc3_ != null && _loc3_.animated;
         if(!_loc4_)
         {
            _loc2_.cacheAsBitmapMatrix = _loc2_.transform.concatenatedMatrix;
            _loc2_.cacheAsBitmap = true;
         }
         this.§1t6241s0§(param1,uint(_loc3_.scolor));
      }
      
      public function §1t6243s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc4_:MovieClip = null;
         _loc4_ = this.§1t6238s0§("mask",param1);
         if(_loc4_ == null)
         {
            _loc4_ = new mask9000();
         }
         if(param2 != 1 && _loc4_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc4_.primaryColor,param2);
         }
         if(param3 != 1 && _loc4_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc4_.secondaryColor,param3);
         }
         this.addChild(_loc4_);
         if(this.§1t6234s0§ != null)
         {
            _loc4_.x = this.§1t6234s0§.x;
            _loc4_.y = this.§1t6234s0§.y;
            _loc4_.rotation = this.§1t6234s0§.rotation;
            setChildIndex(_loc4_,getChildIndex(this.§1t6234s0§));
            removeChild(this.§1t6234s0§);
         }
         this.§1t6234s0§ = _loc4_;
         var _loc5_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc6_:Boolean = _loc5_ != null && _loc5_.animated;
         if(!_loc6_)
         {
            _loc4_.cacheAsBitmapMatrix = _loc4_.transform.concatenatedMatrix;
            _loc4_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6244s0§(param1:int) : *
      {
         var _loc2_:MovieClip = this.§1t6231s0§[§1t75s0§.§1t12389s0§];
         var _loc3_:MovieClip = this.§1t6238s0§("neck",param1);
         if(_loc3_ == null)
         {
            _loc3_ = new neck10000();
         }
         this.addChild(_loc3_);
         if(_loc2_ != null)
         {
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            _loc3_.rotation = _loc2_.rotation;
            setChildIndex(_loc3_,getChildIndex(_loc2_));
            removeChild(_loc2_);
         }
         this.§1t6231s0§[§1t75s0§.§1t12389s0§] = _loc3_;
         var _loc4_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc5_:Boolean = _loc4_ != null && _loc4_.animated;
         if(!_loc5_)
         {
            _loc3_.cacheAsBitmapMatrix = _loc3_.transform.concatenatedMatrix;
            _loc3_.cacheAsBitmap = true;
         }
      }
      
      public function §1t6245s0§(param1:int, param2:int = 1, param3:int = 1) : *
      {
         var _loc7_:Class = null;
         var _loc8_:MovieClip = null;
         var _loc4_:MovieClip = this.§1t6231s0§[§1t75s0§.§1t12392s0§];
         var _loc5_:MovieClip = this.§1t6231s0§[§1t75s0§.§1t12396s0§];
         var _loc6_:MovieClip = this.§1t6231s0§[§1t75s0§.§1t12389s0§];
         _loc8_ = this.§1t6238s0§("torso",param1);
         if(_loc8_ == null)
         {
            _loc8_ = new torso4000();
         }
         if(param2 != 1 && _loc8_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
         }
         if(param3 != 1 && _loc8_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
         }
         this.addChild(_loc8_);
         if(_loc4_ != null)
         {
            _loc8_.x = _loc4_.x;
            _loc8_.y = _loc4_.y;
            _loc8_.rotation = _loc4_.rotation;
            setChildIndex(_loc8_,getChildIndex(_loc4_));
            removeChild(_loc4_);
         }
         this.§1t6231s0§[§1t75s0§.§1t12392s0§] = _loc8_;
         var _loc9_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc10_:Boolean = _loc9_ != null && _loc9_.animated;
         if(!_loc10_)
         {
            _loc8_.cacheAsBitmapMatrix = _loc8_.transform.concatenatedMatrix;
            _loc8_.cacheAsBitmap = true;
         }
         _loc8_ = this.§1t6238s0§("uparm",param1);
         if(_loc8_ == null)
         {
            _loc8_ = new uparm4000();
         }
         if(param2 != 1 && _loc8_.primaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
         }
         if(param3 != 1 && _loc8_.secondaryColor != null)
         {
            §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
         }
         this.addChild(_loc8_);
         if(_loc5_ != null)
         {
            _loc8_.x = _loc5_.x;
            _loc8_.y = _loc5_.y;
            _loc8_.rotation = _loc5_.rotation;
            setChildIndex(_loc8_,getChildIndex(_loc5_));
            removeChild(_loc5_);
         }
         this.§1t6231s0§[§1t75s0§.§1t12396s0§] = _loc8_;
         if(!_loc10_)
         {
            _loc8_.cacheAsBitmapMatrix = _loc8_.transform.concatenatedMatrix;
            _loc8_.cacheAsBitmap = true;
         }
         _loc8_ = this.§1t6238s0§("neck",param1);
         if(_loc8_ != null)
         {
            if(param2 != 1 && _loc8_.primaryColor != null)
            {
               §1t1643s0§.§1t11214s0§(_loc8_.primaryColor,param2);
            }
            if(param3 != 1 && _loc8_.secondaryColor != null)
            {
               §1t1643s0§.§1t11214s0§(_loc8_.secondaryColor,param3);
            }
            this.addChild(_loc8_);
            if(_loc6_ != null)
            {
               _loc8_.x = _loc6_.x;
               _loc8_.y = _loc6_.y;
               _loc8_.rotation = _loc6_.rotation;
               setChildIndex(_loc8_,getChildIndex(_loc6_));
               removeChild(_loc6_);
            }
            this.§1t6231s0§[§1t75s0§.§1t12389s0§] = _loc8_;
            if(!_loc10_)
            {
               _loc8_.cacheAsBitmapMatrix = _loc8_.transform.concatenatedMatrix;
               _loc8_.cacheAsBitmap = true;
            }
         }
      }
      
      public function §1t6246s0§(param1:String, param2:int) : *
      {
         var _loc5_:§1t1360s0§ = null;
         var _loc6_:int = 0;
         §1t75s0§.§1t12425s0§();
         var _loc3_:§1t59s0§ = §1t75s0§.§1t12424s0§[param1].§1t788s0§(param2);
         var _loc4_:int = int(_loc3_.nodeList.length);
         var _loc7_:* = int(_loc4_ - 1);
         while(_loc7_ >= 0)
         {
            _loc5_ = _loc3_.nodeList[_loc7_];
            _loc6_ = _loc5_.id;
            switch(_loc6_)
            {
               case §1t75s0§.§1t12393s0§:
                  _loc5_.setPosition(this.§1t6231s0§[§1t75s0§.§1t12393s0§]);
                  _loc5_.setPosition(this.§1t6233s0§);
                  _loc5_.setPosition(this.§1t6232s0§);
                  _loc5_.setPosition(this.§1t6235s0§);
                  _loc5_.setPosition(this.§1t6234s0§);
                  break;
               case §1t75s0§.§1t12389s0§:
               case §1t75s0§.§1t12392s0§:
               case §1t75s0§.§1t12396s0§:
                  _loc5_.setPosition(this.§1t6231s0§[_loc6_]);
            }
            _loc7_--;
         }
      }
      
      public function §1t6247s0§() : *
      {
         this.§1t6232s0§.visible = true;
         this.§1t6235s0§.visible = false;
      }
      
      public function §1t6248s0§() : *
      {
         this.§1t6232s0§.visible = false;
         this.§1t6235s0§.visible = true;
      }
   }
}

