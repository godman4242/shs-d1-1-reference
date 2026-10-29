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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol269")]
   public dynamic class enemy1_downeddead_427 extends MovieClip
   {
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public function enemy1_downeddead_427()
      {
         super();
         addFrameScript(1,frame2,24,frame25);
      }
      
      internal function frame25() : *
      {
         MovieClip(parent.parent).deathAnimDone = true;
         stop();
      }
      
      internal function frame2() : *
      {
         marker.visible = false;
         bloodspurt.visible = false;
         marker.visible = false;
      }
   }
}

