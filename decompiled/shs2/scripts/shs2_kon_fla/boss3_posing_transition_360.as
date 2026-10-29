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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1041")]
   public dynamic class boss3_posing_transition_360 extends MovieClip
   {
      
      public function boss3_posing_transition_360()
      {
         super();
         addFrameScript(8,frame9,9,frame10);
      }
      
      internal function frame10() : *
      {
         MovieClip(parent).gotoAndStop(3);
      }
      
      internal function frame9() : *
      {
         if(Player.instance.isRedFreeze)
         {
            this.stop();
         }
      }
   }
}

