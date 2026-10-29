package shunpo_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol318")]
   public dynamic class guardtower_people_237 extends MovieClip
   {
      
      public var enemy:MovieClip;
      
      public function guardtower_people_237()
      {
         super();
         addFrameScript(0,frame1,10,frame11,12,frame13,20,frame21,24,frame25);
      }
      
      internal function frame1() : *
      {
         stop();
         this.down = false;
      }
      
      internal function frame25() : *
      {
         stop();
         this.down = false;
      }
      
      internal function frame13() : *
      {
         stop();
         this.down = true;
      }
      
      internal function frame21() : *
      {
         if(Math.random() * 3 < 1)
         {
            gotoAndPlay(20);
         }
      }
      
      internal function frame11() : *
      {
         if(Math.random() * 3 < 1)
         {
            gotoAndPlay(10);
         }
      }
   }
}

