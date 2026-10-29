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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol958")]
   public dynamic class enemy6_attack_436 extends MovieClip
   {
      
      public var head:MovieClip;
      
      public function enemy6_attack_436()
      {
         super();
         addFrameScript(15,frame16,19,frame20);
      }
      
      internal function frame16() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon);
      }
      
      internal function frame20() : *
      {
         MovieClip(parent.parent).moveAgain();
      }
   }
}

