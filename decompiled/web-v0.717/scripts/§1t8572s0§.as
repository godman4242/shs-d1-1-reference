package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3289")]
   public class §1t8572s0§ extends §1t399s0§
   {
      
      public var §1t8573s0§:MovieClip;
      
      internal var §1t8100s0§:Boolean = false;
      
      internal var velX:int;
      
      internal var velY:int;
      
      public function §1t8572s0§()
      {
         var _loc1_:Number = NaN;
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         §1t8160s0§ = true;
         _loc1_ = Math.random() * 0.4 + 1;
         if(int(Math.random() * 2) == 0)
         {
            scaleX = _loc1_;
         }
         else
         {
            scaleX = -_loc1_;
         }
         scaleY = _loc1_;
      }
      
      override public function §1t8523s0§() : *
      {
         interact();
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 200;
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(!this.§1t8100s0§ && visible)
         {
            this.flyaway();
         }
      }
      
      override public function §1t6733s0§() : String
      {
         return "";
      }
      
      override public function update() : *
      {
         if(this.§1t8100s0§)
         {
            x += this.velX;
            y -= this.velY;
            if(y < -10 || this.velX < 0 && x < -10 || this.velX > 0 && x > §1t1523s0§.stageWidth + 10)
            {
               this.§1t8100s0§ = false;
               this.visible = false;
               §1t8501s0§ = false;
            }
         }
      }
      
      public function flyaway() : *
      {
         var _loc1_:int = 0;
         §1t88s0§.instance.§1t1519s0§(this.x - §1t1523s0§.§1t9586s0§().§1t1559s0§().x);
         if(Math.random() * 2 < 1)
         {
            _loc1_ = this.x + Math.random() * 200;
         }
         else
         {
            _loc1_ = this.x - Math.random() * 200;
         }
         this.flyTo(_loc1_,-20);
      }
      
      public function flyTo(param1:int, param2:int) : *
      {
         this.§1t8100s0§ = true;
         gotoAndStop(2);
         this.velY = 5 + Math.random() * 8;
         if(param1 < x)
         {
            scaleX = 1;
            this.velX = -(Math.random() * 10 + 12);
         }
         else
         {
            scaleX = -1;
            this.velX = Math.random() * 10 + 12;
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

