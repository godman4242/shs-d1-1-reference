package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1821")]
   public class §1t5029s0§ extends MovieClip
   {
      
      public var inside:MovieClip;
      
      internal var image:MovieClip;
      
      public function §1t5029s0§()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,95,this.frame96);
         §1t1521s0§.§1t9290s0§(this.inside.titlelabel);
         this.inside.titlelabel.text = §1t1521s0§.getString(721);
      }
      
      public function show(param1:*) : *
      {
         var _loc2_:§1t109s0§ = §1t1524s0§.§1t9889s0§(param1);
         this.inside.achievementtext.text = §1t1521s0§.getString(_loc2_.§1t892s0§);
         if(this.image != null)
         {
            this.inside.removeChild(this.image);
         }
         this.image = §1t1522s0§.§1t9314s0§(_loc2_.image);
         this.image.x = 50;
         this.image.y = 45;
         this.inside.addChild(this.image);
         gotoAndPlay(2);
         visible = true;
         §1t88s0§.instance.§1t1514s0§();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         this.inside.cacheAsBitmap = true;
      }
      
      internal function frame96() : *
      {
         stop();
         visible = false;
         this.inside.cacheAsBitmap = false;
      }
   }
}

