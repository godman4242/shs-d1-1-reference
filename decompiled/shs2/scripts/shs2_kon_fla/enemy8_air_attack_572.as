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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol351")]
   public dynamic class enemy8_air_attack_572 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public var head:MovieClip;
      
      public function enemy8_air_attack_572()
      {
         super();
         addFrameScript(1,frame2,2,frame3,3,frame4,18,frame19);
      }
      
      internal function frame3() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon);
      }
      
      internal function frame19() : *
      {
         MovieClip(parent).gotoAndStop(21);
      }
      
      internal function frame4() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon);
      }
      
      internal function frame2() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon);
      }
   }
}

