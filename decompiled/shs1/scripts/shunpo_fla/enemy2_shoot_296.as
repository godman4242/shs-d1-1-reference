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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol73")]
   public dynamic class enemy2_shoot_296 extends MovieClip
   {
      
      public var bow:MovieClip;
      
      public var head:MovieClip;
      
      public var aimtop:MovieClip;
      
      public function enemy2_shoot_296()
      {
         super();
         addFrameScript(3,frame4,4,frame5,19,frame20);
      }
      
      internal function frame20() : *
      {
         MovieClip(parent.parent).doStop();
      }
      
      internal function frame4() : *
      {
         if(Math.random() * 2 < 1)
         {
            this.gotoAndPlay(1);
         }
      }
      
      internal function frame5() : *
      {
         MovieClip(parent.parent).shootArrow(aimtop.bow);
      }
   }
}

