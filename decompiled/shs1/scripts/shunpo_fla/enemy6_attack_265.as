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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol237")]
   public dynamic class enemy6_attack_265 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public var weapon1:MovieClip;
      
      public var weapon2:MovieClip;
      
      public function enemy6_attack_265()
      {
         super();
         addFrameScript(10,frame11,22,frame23,23,frame24,24,frame25,29,frame30);
      }
      
      internal function frame25() : *
      {
         if(MovieClip(parent.parent).isNearPlayer())
         {
            MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon1);
         }
         if(MovieClip(parent.parent).isNearPlayer())
         {
            MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon2);
         }
      }
      
      internal function frame23() : *
      {
         if(MovieClip(parent.parent).isNearPlayer())
         {
            MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon1);
         }
      }
      
      internal function frame24() : *
      {
         if(MovieClip(parent.parent).isNearPlayer())
         {
            MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon1);
         }
      }
      
      internal function frame30() : *
      {
         if(MovieClip(parent.parent).isNearPlayer())
         {
            MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon1);
         }
         if(MovieClip(parent.parent).isNearPlayer())
         {
            MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this.weapon2);
         }
         gotoAndPlay(1);
      }
      
      internal function frame11() : *
      {
         this.gotoAndPlay(1);
      }
   }
}

