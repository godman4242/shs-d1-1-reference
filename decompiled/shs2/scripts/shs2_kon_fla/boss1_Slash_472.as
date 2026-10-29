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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol733")]
   public dynamic class boss1_Slash_472 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public function boss1_Slash_472()
      {
         super();
         addFrameScript(4,frame5,13,frame14,15,frame16,21,frame22);
      }
      
      internal function frame14() : *
      {
         MovieClip(parent.parent).setIsVul(false);
         Player.instance.checkEnemyWeaponHitPlayer(weapon);
      }
      
      internal function frame16() : *
      {
         Player.instance.checkEnemyWeaponHitPlayer(weapon);
      }
      
      internal function frame22() : *
      {
         MovieClip(parent.parent).moveAgain();
      }
      
      internal function frame5() : *
      {
         MovieClip(parent.parent).setIsVul(true);
      }
   }
}

