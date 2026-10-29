package shs2_kon_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol488")]
   public dynamic class enemy11_shoot_540 extends MovieClip
   {
      
      public var jetpack:MovieClip;
      
      public var flame:MovieClip;
      
      public var bow:MovieClip;
      
      public var head:MovieClip;
      
      public var aimtop:MovieClip;
      
      public function enemy11_shoot_540()
      {
         super();
         addFrameScript(0,frame1,3,frame4,4,frame5,9,frame10,15,frame16,19,frame20);
      }
      
      internal function frame10() : *
      {
         MovieClip(parent.parent).hasFire = Math.random() * 2 < 1;
      }
      
      internal function frame16() : *
      {
         flame.visible = MovieClip(parent.parent).hasFire;
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
      
      internal function frame1() : *
      {
         aimtop.flame.visible = MovieClip(parent.parent).hasFire;
      }
      
      internal function frame20() : *
      {
         MovieClip(parent.parent).doIdle();
      }
   }
}

