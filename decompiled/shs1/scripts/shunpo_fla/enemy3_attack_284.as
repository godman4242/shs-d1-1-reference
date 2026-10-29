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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol165")]
   public dynamic class enemy3_attack_284 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public var head:MovieClip;
      
      public function enemy3_attack_284()
      {
         super();
         addFrameScript(2,frame3,3,frame4,4,frame5,19,frame20);
      }
      
      internal function frame3() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon);
      }
      
      internal function frame20() : *
      {
         MovieClip(parent.parent).moveAgain();
         MovieClip(parent.parent).setReload(false);
      }
      
      internal function frame4() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon);
      }
      
      internal function frame5() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon);
         MovieClip(parent.parent).setReload(true);
      }
   }
}

