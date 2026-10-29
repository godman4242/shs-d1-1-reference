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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol603")]
   public dynamic class enemy13_Slash_488 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public var head:MovieClip;
      
      public function enemy13_Slash_488()
      {
         super();
         addFrameScript(4,frame5,11,frame12,12,frame13,13,frame14,19,frame20);
      }
      
      internal function frame14() : *
      {
         Player.instance.checkEnemyWeaponHitPlayer(weapon);
      }
      
      internal function frame12() : *
      {
         if(MovieClip(parent.parent).currentFrame == 1)
         {
            MovieClip(parent.parent).x = MovieClip(parent.parent).x + 50;
         }
         else
         {
            MovieClip(parent.parent).x = MovieClip(parent.parent).x - 50;
         }
         MovieClip(parent.parent).setIsVul(false);
         Player.instance.checkEnemyWeaponHitPlayer(weapon);
      }
      
      internal function frame20() : *
      {
         MovieClip(parent.parent).doIdle();
      }
      
      internal function frame13() : *
      {
         if(MovieClip(parent.parent).currentFrame == 1)
         {
            MovieClip(parent.parent).x = MovieClip(parent.parent).x + 50;
         }
         else
         {
            MovieClip(parent.parent).x = MovieClip(parent.parent).x - 50;
         }
      }
      
      internal function frame5() : *
      {
         MovieClip(parent.parent).setIsVul(true);
      }
   }
}

