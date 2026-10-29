package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1634")]
   public class §1t5865s0§ extends MovieClip
   {
      
      public var §1t5917s0§:§1t4912s0§;
      
      public var §1t5918s0§:MovieClip;
      
      public var §1t5919s0§:TextField;
      
      public var lovebarTextShadow:TextField;
      
      public var §1t5921s0§:TextField;
      
      public var portrait:MovieClip;
      
      public var rightButton:§1t4912s0§;
      
      internal var §1t5923s0§:Array = [0,50,150,300,500,750];
      
      internal var maxLevel:int = 5;
      
      internal var §1t5925s0§:int = 0;
      
      public function §1t5865s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5921s0§,false);
         §1t1521s0§.§1t9290s0§(this.§1t5919s0§,false);
         §1t1521s0§.§1t9290s0§(this.lovebarTextShadow,false);
         this.portrait.mouseEnabled = false;
         this.portrait.mouseChildren = false;
      }
      
      internal function §1t912s0§() : int
      {
         return §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9435s0§) + §1t1524s0§.§1t9890s0§() * 5;
      }
      
      public function §1t5926s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:int = this.getLevel();
         var _loc2_:int = this.§1t912s0§();
         if(_loc2_ < this.§1t5923s0§[this.maxLevel - 1])
         {
            _loc3_ = this.§1t5928s0§(_loc1_);
            _loc4_ = this.§1t5928s0§(_loc1_ - 1);
            _loc5_ = _loc2_ - this.§1t5928s0§(_loc1_ - 1);
            _loc6_ = this.§1t5928s0§(_loc1_) - this.§1t5928s0§(_loc1_ - 1);
            this.§1t5919s0§.text = _loc2_ - _loc4_ + " / " + (_loc3_ - _loc4_);
            this.§1t5918s0§.bar.scaleX = _loc5_ / _loc6_;
         }
         else
         {
            _loc7_ = this.§1t5923s0§[this.maxLevel - 1] - this.§1t5923s0§[this.maxLevel - 2];
            this.§1t5919s0§.text = _loc7_ + " / " + _loc7_;
            this.§1t5918s0§.bar.scaleX = 1;
         }
         this.lovebarTextShadow.text = this.§1t5919s0§.text;
         this.§1t5930s0§(1);
         this.§1t5925s0§ = 1;
         this.§1t5921s0§.text = _loc1_.toString();
      }
      
      public function getLevel() : int
      {
         var _loc1_:int = this.§1t912s0§();
         var _loc2_:int = 0;
         while(_loc2_ < this.maxLevel)
         {
            if(this.§1t5923s0§[_loc2_] > _loc1_)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return this.maxLevel;
      }
      
      public function §1t5927s0§() : int
      {
         return this.§1t5923s0§[this.getLevel()] - this.§1t912s0§();
      }
      
      public function §1t5928s0§(param1:int) : int
      {
         return this.§1t5923s0§[param1];
      }
      
      public function §1t5929s0§() : int
      {
         return this.§1t5925s0§;
      }
      
      public function §1t5930s0§(param1:int) : *
      {
         this.portrait.gotoAndStop(param1);
         this.§1t5925s0§ = param1;
         this.§1t5917s0§.visible = param1 != 1;
         this.rightButton.visible = param1 != this.maxLevel && param1 != this.getLevel();
      }
   }
}

