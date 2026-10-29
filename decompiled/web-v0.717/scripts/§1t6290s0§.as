package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol966")]
   public class §1t6290s0§ extends MovieClip
   {
      
      internal var §1t6291s0§:MovieClip;
      
      internal var §1t6292s0§:MovieClip;
      
      internal var §1t6293s0§:MovieClip;
      
      internal var §1t6294s0§:MovieClip;
      
      internal var §1t6295s0§:MovieClip;
      
      public function §1t6290s0§()
      {
         super();
         mouseChildren = false;
      }
      
      public function clearItem() : *
      {
         this.cacheAsBitmap = false;
         var _loc1_:int = numChildren;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            removeChildAt(0);
            _loc2_++;
         }
      }
      
      public function §1t529s0§(param1:uint) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:int = numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = MovieClip(getChildAt(_loc4_)).primaryColor;
            if(_loc3_ != null)
            {
               §1t1643s0§.§1t11214s0§(_loc3_,param1);
            }
            _loc4_++;
         }
      }
      
      public function §1t530s0§(param1:uint) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:int = numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = MovieClip(getChildAt(_loc4_)).secondaryColor;
            if(_loc3_ != null)
            {
               §1t1643s0§.§1t11214s0§(_loc3_,param1);
            }
            _loc4_++;
         }
      }
      
      public function §1t6240s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("hat",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t5855s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.scaleX = 1.3;
            this.§1t6291s0§.scaleY = 1.3;
            this.§1t6291s0§.x = -1;
            this.§1t6291s0§.y = 10;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6242s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("hair",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t5855s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            this.§1t6292s0§ = this.§1t6238s0§("head",8000);
            addChild(this.§1t6292s0§);
            this.§1t6292s0§.scaleX = 1.3;
            this.§1t6292s0§.scaleY = 1.3;
            this.§1t6292s0§.x = -1;
            this.§1t6292s0§.y = 10;
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.scaleX = 1.3;
            this.§1t6291s0§.scaleY = 1.3;
            this.§1t6291s0§.x = -1;
            this.§1t6291s0§.y = 10;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6239s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("head",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t5855s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            if(this.§1t6291s0§.height * 2.5 > 60)
            {
               this.§1t6291s0§.height = 60;
            }
            else
            {
               this.§1t6291s0§.scaleX = 2.5;
            }
            this.§1t6291s0§.scaleY = this.§1t6291s0§.scaleX;
            this.§1t6291s0§.x = -10;
            this.§1t6291s0§.y = 6;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6243s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("mask",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t6308s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.scaleX = 2;
            this.§1t6291s0§.scaleY = 2;
            this.§1t6291s0§.x = -10;
            this.§1t6291s0§.y = 4;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6265s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("weapon",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t8027s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.x = -15;
            this.§1t6291s0§.y = 15;
            this.§1t6291s0§.rotation = -45;
            this.§1t6291s0§.width = 60;
            this.§1t6291s0§.scaleY = this.§1t6291s0§.scaleX;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6297s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("item",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new item0();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.scaleX = 1;
            this.§1t6291s0§.scaleY = 1;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6298s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("acc",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t5008s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.scaleX = 1.2;
            this.§1t6291s0§.scaleY = 1.2;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6262s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("hand",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t5828s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.scaleX = 2;
            this.§1t6291s0§.scaleY = 2;
            this.§1t6291s0§.x = -15;
            this.§1t6291s0§.scaleX *= -1;
            this.§1t6292s0§ = this.§1t6238s0§("hand",param1);
            addChild(this.§1t6292s0§);
            this.§1t6292s0§.scaleX = 2;
            this.§1t6292s0§.scaleY = 2;
            this.§1t6292s0§.x = 15;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6263s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("foot",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t6857s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.scaleX = 1.5;
            this.§1t6291s0§.scaleY = 1.5;
            this.§1t6291s0§.x = 6;
            this.§1t6291s0§.y = 10;
            this.§1t6293s0§ = this.§1t6238s0§("foottop",param1);
            addChild(this.§1t6293s0§);
            this.§1t6293s0§.scaleX = 1.5;
            this.§1t6293s0§.scaleY = 1.5;
            this.§1t6293s0§.x = 7;
            this.§1t6293s0§.y = -28;
            this.§1t6293s0§.rotation = 2;
            this.§1t6292s0§ = this.§1t6238s0§("foot",param1);
            addChild(this.§1t6292s0§);
            this.§1t6292s0§.scaleX = 1.5;
            this.§1t6292s0§.scaleY = 1.5;
            this.§1t6292s0§.x = -15;
            this.§1t6292s0§.y = 10;
            this.§1t6294s0§ = this.§1t6238s0§("foottop",param1);
            addChild(this.§1t6294s0§);
            this.§1t6294s0§.scaleX = 1.5;
            this.§1t6294s0§.scaleY = 1.5;
            this.§1t6294s0§.x = -13;
            this.§1t6294s0§.y = -28;
            this.§1t6294s0§.rotation = 2;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6245s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("stomach",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t5035s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.x = -0.65;
            this.§1t6291s0§.y = 5.9;
            this.§1t6292s0§ = this.§1t6238s0§("pelvic",param1);
            addChild(this.§1t6292s0§);
            this.§1t6292s0§.x = -0.35;
            this.§1t6292s0§.y = 10;
            this.§1t6293s0§ = this.§1t6238s0§("torso",param1);
            addChild(this.§1t6293s0§);
            this.§1t6293s0§.y = -2;
            this.§1t6294s0§ = this.§1t6238s0§("uparm",param1);
            addChild(this.§1t6294s0§);
            this.§1t6294s0§.x = -5.2;
            this.§1t6294s0§.y = -13.5;
            this.§1t6295s0§ = this.§1t6238s0§("lowarm",param1);
            addChild(this.§1t6295s0§);
            this.§1t6295s0§.x = -6.5;
            this.§1t6295s0§.y = 4.8;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
      }
      
      public function §1t6264s0§(param1:int) : *
      {
         this.clearItem();
         this.§1t6291s0§ = this.§1t6238s0§("thigh",param1);
         if(this.§1t6291s0§ == null)
         {
            this.§1t6291s0§ = new §1t6664s0§();
            addChild(this.§1t6291s0§);
         }
         else
         {
            addChild(this.§1t6291s0§);
            this.§1t6291s0§.x = 3.5;
            this.§1t6291s0§.y = -17.4;
            this.§1t6291s0§.rotation = 20.7;
            this.§1t6293s0§ = this.§1t6238s0§("calf",param1);
            addChild(this.§1t6293s0§);
            this.§1t6293s0§.x = -5.8;
            this.§1t6293s0§.y = 7.7;
            this.§1t6293s0§.rotation = 19;
            this.§1t6292s0§ = this.§1t6238s0§("crotch",param1);
            addChild(this.§1t6292s0§);
            this.§1t6292s0§.x = 6;
            this.§1t6292s0§.y = -23;
            this.§1t6292s0§.rotation = 8.3;
            this.§1t6294s0§ = this.§1t6238s0§("thigh",param1);
            addChild(this.§1t6294s0§);
            this.§1t6294s0§.x = 6.05;
            this.§1t6294s0§.y = -19.45;
            this.§1t6294s0§.rotation = 1.9;
            this.§1t6295s0§ = this.§1t6238s0§("calf",param1);
            addChild(this.§1t6295s0§);
            this.§1t6295s0§.x = 5.45;
            this.§1t6295s0§.y = 7.35;
            this.§1t6295s0§.rotation = 1;
         }
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.animated;
         if(!_loc3_)
         {
            this.cacheAsBitmap = true;
         }
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
   }
}

