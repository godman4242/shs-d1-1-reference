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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2378")]
   public dynamic class gui_score_150 extends MovieClip
   {
      
      public var score:TextField;
      
      public function gui_score_150()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         Player.instance.updateScore(0);
         stop();
      }
   }
}

