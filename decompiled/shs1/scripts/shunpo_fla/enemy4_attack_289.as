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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol147")]
   public dynamic class enemy4_attack_289 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public var head:MovieClip;
      
      public function enemy4_attack_289()
      {
         super();
         addFrameScript(0,frame1,5,frame6);
      }
      
      internal function frame6() : *
      {
         if(MovieClip(parent.parent).isNearPlayer())
         {
            MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon.tip);
         }
      }
      
      internal function frame1() : *
      {
         if(MovieClip(parent.parent).isNearPlayer())
         {
            MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon.tip);
         }
      }
   }
}

