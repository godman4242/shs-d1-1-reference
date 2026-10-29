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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol844")]
   public dynamic class transition_46 extends MovieClip
   {
      
      public function transition_46()
      {
         super();
         addFrameScript(0,frame1,23,frame24,47,frame48,59,frame60,82,frame83,119,frame120,152,frame153);
      }
      
      internal function frame153() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame24() : *
      {
         stop();
      }
      
      internal function frame83() : *
      {
         stop();
      }
      
      internal function frame120() : *
      {
         stop();
         MovieClip(parent.parent).goOverworld();
      }
      
      internal function frame48() : *
      {
         stop();
         StatsManager.instance.transitionOut();
      }
      
      internal function frame60() : *
      {
         stop();
      }
   }
}

