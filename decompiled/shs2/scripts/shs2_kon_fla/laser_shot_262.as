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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1687")]
   public dynamic class laser_shot_262 extends MovieClip
   {
      
      public var flames:MovieClip;
      
      public var laser:MovieClip;
      
      public function laser_shot_262()
      {
         super();
         addFrameScript(13,frame14,15,frame16,17,frame18,19,frame20);
      }
      
      internal function frame14() : *
      {
         if(Boss4.instance.checkEnemyWeaponHitPlayer(laser))
         {
            Player.instance.gotLaunched();
         }
      }
      
      internal function frame18() : *
      {
         if(Boss4.instance.checkEnemyWeaponHitPlayer(laser))
         {
            Player.instance.gotLaunched();
         }
      }
      
      internal function frame16() : *
      {
         if(Boss4.instance.checkEnemyWeaponHitPlayer(laser))
         {
            Player.instance.gotLaunched();
         }
      }
      
      internal function frame20() : *
      {
         if(Boss4.instance.checkEnemyWeaponHitPlayer(laser))
         {
            Player.instance.gotLaunched();
         }
      }
   }
}

