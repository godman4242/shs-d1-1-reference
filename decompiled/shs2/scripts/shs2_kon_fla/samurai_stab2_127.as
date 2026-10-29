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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1957")]
   public dynamic class samurai_stab2_127 extends MovieClip
   {
      
      public function samurai_stab2_127()
      {
         super();
         addFrameScript(5,frame6,15,frame16,34,frame35);
      }
      
      internal function frame6() : *
      {
         if(Player.instance.downSlashVictim != null)
         {
            Player.instance.downSlashVictim.downSlashHit();
         }
      }
      
      internal function frame16() : *
      {
      }
      
      internal function frame35() : *
      {
         if(MovieClip(parent.parent).currentFrame == 1)
         {
            MovieClip(parent.parent).setPosition(MovieClip(parent.parent).x - 20,MovieClip(parent.parent).y);
         }
         else
         {
            MovieClip(parent.parent).setPosition(MovieClip(parent.parent).x + 20,MovieClip(parent.parent).y);
         }
         MovieClip(parent).gotoAndStop(3);
      }
   }
}

