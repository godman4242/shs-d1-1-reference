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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol452")]
   public dynamic class enemy11_outofcontrol_explosion_544 extends MovieClip
   {
      
      public var enemy:MovieClip;
      
      public function enemy11_outofcontrol_explosion_544()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,4,frame5,7,frame8);
      }
      
      internal function frame3() : *
      {
         if(MovieClip(parent.parent).headshot)
         {
            enemy.head.visible = false;
         }
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this);
      }
      
      internal function frame1() : *
      {
         MovieClip(parent.parent).explode();
         if(MovieClip(parent.parent).headshot)
         {
            enemy.head.visible = false;
         }
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this);
         rotation = 0;
      }
      
      internal function frame5() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this);
      }
      
      internal function frame8() : *
      {
         stop();
         MovieClip(parent.parent).dieEnd();
      }
      
      internal function frame2() : *
      {
         if(MovieClip(parent.parent).headshot)
         {
            enemy.head.visible = false;
         }
      }
   }
}

