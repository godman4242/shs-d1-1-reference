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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol757")]
   public dynamic class boss1_Slash_fly_473 extends MovieClip
   {
      
      public var flame2:MovieClip;
      
      public var flame1:MovieClip;
      
      public function boss1_Slash_fly_473()
      {
         super();
         addFrameScript(5,frame6,18,frame19,20,frame21,30,frame31);
      }
      
      internal function frame6() : *
      {
         MovieClip(parent.parent).setIsVul(true);
      }
      
      internal function frame19() : *
      {
         MovieClip(parent.parent).setIsVul(false);
      }
      
      internal function frame21() : *
      {
         MovieClip(parent.parent).shootWave();
      }
      
      internal function frame31() : *
      {
         MovieClip(parent.parent).moveAgain();
      }
   }
}

