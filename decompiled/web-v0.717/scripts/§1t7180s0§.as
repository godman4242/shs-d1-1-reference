package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1852")]
   public class §1t7180s0§ extends MovieClip
   {
      
      public static var screenWidth:int = 800;
      
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
      
      public var ground_1:MovieClip;
      
      public var ground_2:MovieClip;
      
      public var ground_3:MovieClip;
      
      public var §1t7185s0§:MovieClip;
      
      public var §1t7186s0§:MovieClip;
      
      internal var §1t7187s0§:int = 0;
      
      internal var §1t7188s0§:int = 400;
      
      internal var §1t2188s0§:int = 3;
      
      internal var §1t2189s0§:int = 12;
      
      internal var §1t2191s0§:int = 3;
      
      internal var §1t2193s0§:int = 800;
      
      internal var §1t2194s0§:int = 950;
      
      internal var §1t2196s0§:int = 1200;
      
      internal var §1t7189s0§:Vector.<MovieClip>;
      
      internal var §1t7190s0§:Vector.<MovieClip>;
      
      internal var §1t7191s0§:Vector.<MovieClip>;
      
      public function §1t7180s0§()
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         this.§1t7189s0§ = new Vector.<MovieClip>();
         this.§1t7190s0§ = new Vector.<MovieClip>();
         this.§1t7191s0§ = new Vector.<MovieClip>();
         super();
         _loc1_ = 1;
         while(_loc1_ <= this.§1t2188s0§)
         {
            _loc2_ = MovieClip(this.getChildByName("ff_" + _loc1_));
            this.§1t7189s0§.push(_loc2_);
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
         this.§1t7189s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= this.§1t2189s0§)
         {
            _loc2_ = MovieClip(this.getChildByName("f_" + _loc1_));
            this.§1t7190s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            §1t1643s0§.blur(_loc2_,2);
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
         this.§1t7190s0§.fixed = true;
         _loc1_ = 1;
         while(_loc1_ <= this.§1t2191s0§)
         {
            _loc2_ = MovieClip(this.getChildByName("ground_" + _loc1_));
            this.§1t7191s0§.push(_loc2_);
            _loc2_.cacheAsBitmap = true;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.flipped = _loc2_.scaleX < 0 || _loc2_.transform.matrix.a < 0;
            _loc1_++;
         }
         this.§1t7191s0§.fixed = true;
      }
      
      public function §1t7192s0§(param1:int) : *
      {
         var _loc2_:int = param1 - this.§1t7187s0§;
         this.§1t7187s0§ = param1;
         this.§1t7194s0§(_loc2_ / scaleX);
      }
      
      public function §1t7193s0§(param1:int) : *
      {
         var _loc2_:int = param1 - this.§1t7188s0§;
         this.§1t7188s0§ = param1;
         this.§1t7195s0§(_loc2_);
      }
      
      internal function §1t7194s0§(param1:Number) : *
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         _loc2_ = 0;
         while(_loc2_ < this.§1t2188s0§)
         {
            _loc3_ = this.§1t7189s0§[_loc2_];
            _loc3_.x += param1 / 4;
            if(!_loc3_.visible)
            {
               this.§1t7196s0§(_loc3_,param1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.§1t2189s0§)
         {
            _loc3_ = this.§1t7190s0§[_loc2_];
            _loc3_.x += param1 / 3;
            if(!_loc3_.visible)
            {
               this.§1t7196s0§(_loc3_,param1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.§1t2191s0§)
         {
            _loc3_ = this.§1t7191s0§[_loc2_];
            _loc3_.x += param1;
            this.§1t7196s0§(_loc3_,param1);
            _loc2_++;
         }
      }
      
      internal function §1t7195s0§(param1:int) : *
      {
         this.y += param1;
         if(scaleX == 4)
         {
            this.§1t7185s0§.visible = y < -120;
            this.§1t7186s0§.visible = y > 1830;
         }
         else if(scaleX == 2)
         {
            this.§1t7185s0§.visible = y < 60;
            this.§1t7186s0§.visible = y > 1040;
         }
         else
         {
            this.§1t7185s0§.visible = y < 150;
            this.§1t7186s0§.visible = false;
         }
      }
      
      internal function §1t7196s0§(param1:MovieClip, param2:int) : *
      {
         param1.visible = true;
         if(param1.flipped)
         {
            if(param2 < 0 && param1.x - param1.width < screenWidth)
            {
               param1.visible = true;
            }
            else if(param2 > 0 && param1.x > 0)
            {
               param1.visible = true;
            }
         }
         else if(param2 < 0 && param1.x < screenWidth)
         {
            param1.visible = true;
         }
         else if(param2 > 0 && param1.x + param1.width > 0)
         {
            param1.visible = true;
         }
      }
      
      public function §1t3307s0§(param1:Number) : *
      {
         this.§1t7192s0§(0);
         scaleX = param1;
         scaleY = param1;
      }
   }
}

