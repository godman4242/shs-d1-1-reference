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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1946")]
   public dynamic class samurai_upward_launch_125 extends MovieClip
   {
      
      public function samurai_upward_launch_125()
      {
         super();
         addFrameScript(5,frame6,6,frame7);
      }
      
      internal function frame6() : *
      {
         if(Boolean(Player.instance.isRedFreeze) || Math.random() * 3 > 1)
         {
            this.gotoAndPlay(5);
         }
      }
      
      internal function frame7() : *
      {
         MovieClip(parent).gotoAndStop(3);
      }
   }
}

