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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2376")]
   public dynamic class hitcombocount_149 extends MovieClip
   {
      
      public var num:TextField;
      
      public function hitcombocount_149()
      {
         super();
         addFrameScript(0,frame1,2,frame3,4,frame5);
      }
      
      internal function frame3() : *
      {
         num.text = Player.instance.combo.toString();
      }
      
      internal function frame1() : *
      {
         num.text = Player.instance.combo.toString();
      }
      
      internal function frame5() : *
      {
         stop();
         num.text = Player.instance.combo.toString();
      }
   }
}

