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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1420")]
   public dynamic class boss2_front_bomb_339 extends MovieClip
   {
      
      public var flame2:MovieClip;
      
      public var flame1:MovieClip;
      
      public var enemy:MovieClip;
      
      public var flame3:MovieClip;
      
      public function boss2_front_bomb_339()
      {
         super();
         addFrameScript(75,frame76,88,frame89,111,frame112);
      }
      
      internal function frame76() : *
      {
         if(Math.random() * 2 < 1)
         {
            gotoAndPlay(100);
         }
      }
      
      internal function frame89() : *
      {
         MovieClip(parent.parent).endFrontBomb();
         stop();
      }
      
      internal function frame112() : *
      {
         MovieClip(parent.parent).endFrontBomb();
         stop();
      }
   }
}

