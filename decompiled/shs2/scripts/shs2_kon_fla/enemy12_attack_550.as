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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol427")]
   public dynamic class enemy12_attack_550 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public var jetpack:MovieClip;
      
      public var head:MovieClip;
      
      public function enemy12_attack_550()
      {
         super();
         addFrameScript(16,frame17,17,frame18,19,frame20,20,frame21);
      }
      
      internal function frame18() : *
      {
         MovieClip(parent.parent).checkHitPlayer();
      }
      
      internal function frame17() : *
      {
         MovieClip(parent.parent).checkHitPlayer();
      }
      
      internal function frame21() : *
      {
         stop();
         if(MovieClip(parent.parent).currentFrame == 1)
         {
            MovieClip(parent.parent).x = MovieClip(parent.parent).x + 170;
         }
         else
         {
            MovieClip(parent.parent).x = MovieClip(parent.parent).x - 170;
         }
         MovieClip(parent.parent).y = MovieClip(parent.parent).y + 170;
         MovieClip(parent.parent).moveAgain();
      }
      
      internal function frame20() : *
      {
         MovieClip(parent.parent).checkHitPlayer();
      }
   }
}

