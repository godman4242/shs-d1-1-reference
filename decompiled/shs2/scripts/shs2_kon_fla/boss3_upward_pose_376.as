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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1085")]
   public dynamic class boss3_upward_pose_376 extends MovieClip
   {
      
      public var hat:MovieClip;
      
      public function boss3_upward_pose_376()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         if(!MovieClip(parent.parent.parent).hasHat)
         {
            hat.vislble = false;
         }
      }
   }
}

