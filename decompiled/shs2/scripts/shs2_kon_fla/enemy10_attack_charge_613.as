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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol186")]
   public dynamic class enemy10_attack_charge_613 extends MovieClip
   {
      
      public var shield:MovieClip;
      
      public var head:MovieClip;
      
      public function enemy10_attack_charge_613()
      {
         super();
         addFrameScript(0,frame1,5,frame6);
      }
      
      internal function frame1() : *
      {
         if(MovieClip(parent.parent).isNearPlayer())
         {
            if(MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this))
            {
               Player.instance.gotLaunched();
            }
         }
      }
      
      internal function frame6() : *
      {
         if(MovieClip(parent.parent).isNearPlayer())
         {
            if(MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this))
            {
               Player.instance.gotLaunched();
            }
         }
      }
   }
}

