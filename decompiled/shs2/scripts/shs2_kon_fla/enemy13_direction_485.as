package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol713")]
   public dynamic class enemy13_direction_485 extends MovieClip
   {
      
      public var hpbar:MovieClip;
      
      public var enemy:MovieClip;
      
      public function enemy13_direction_485()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7);
      }
      
      internal function frame3() : *
      {
         hpbar.x = -12;
         hpbar.y = -62;
         stop();
      }
      
      internal function frame6() : *
      {
         hpbar.visible = false;
         stop();
      }
      
      internal function frame7() : *
      {
         hpbar.visible = false;
         stop();
      }
      
      internal function frame1() : *
      {
         hpbar.x = -12;
         hpbar.y = -62;
         stop();
      }
      
      internal function frame4() : *
      {
         hpbar.x = 107;
         hpbar.y = -22;
         stop();
      }
      
      internal function frame5() : *
      {
         hpbar.visible = false;
         stop();
      }
      
      internal function frame2() : *
      {
         hpbar.x = -12;
         hpbar.y = -62;
         stop();
      }
   }
}

