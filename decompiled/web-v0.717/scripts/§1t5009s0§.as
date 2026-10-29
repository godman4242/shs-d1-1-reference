package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1833")]
   public class §1t5009s0§ extends MovieClip
   {
      
      public var §1t5010s0§:TextField;
      
      public var §1t5011s0§:TextField;
      
      public var bar:MovieClip;
      
      public var §1t5013s0§:TextField;
      
      public var §1t5014s0§:TextField;
      
      internal var image:MovieClip;
      
      public function §1t5009s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5011s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5010s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5013s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5014s0§);
      }
      
      public function init(param1:int) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:§1t109s0§ = §1t1524s0§.§1t9889s0§(param1);
         if(_loc2_ != null)
         {
            this.§1t5011s0§.text = §1t1521s0§.getString(_loc2_.§1t891s0§);
            this.§1t5010s0§.text = §1t1521s0§.getString(_loc2_.§1t892s0§);
            _loc3_ = 0;
            if(_loc2_.condition == null)
            {
               _loc3_ = §1t1523s0§.§1t9714s0§(_loc2_.reqid);
            }
            else if(§1t1523s0§.§1t640s0§(_loc2_.condition))
            {
               _loc3_ = 1;
            }
            _loc4_ = _loc2_.reqvalue;
            if(_loc3_ >= _loc4_)
            {
               _loc3_ = _loc4_;
               this.§1t5013s0§.text = §1t1521s0§.getString(720);
            }
            else
            {
               this.§1t5013s0§.text = _loc3_ + "/" + _loc4_;
            }
            this.§1t5014s0§.text = this.§1t5013s0§.text;
            this.bar.bar.scaleX = _loc3_ / _loc4_;
            visible = true;
            if(this.image != null)
            {
               removeChild(this.image);
            }
            if(_loc3_ >= _loc4_)
            {
               this.image = §1t1522s0§.§1t9314s0§(_loc2_.image);
            }
            else
            {
               this.image = §1t1522s0§.§1t9314s0§(0);
            }
            this.image.x = 35;
            this.image.y = 40;
            addChild(this.image);
         }
         else
         {
            visible = false;
         }
      }
   }
}

