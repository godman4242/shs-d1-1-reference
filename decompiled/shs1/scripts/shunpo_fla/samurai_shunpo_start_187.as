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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol398")]
   public dynamic class samurai_shunpo_start_187 extends MovieClip
   {
      
      public var dashcloud1:MovieClip;
      
      public function samurai_shunpo_start_187()
      {
         super();
         addFrameScript(3,frame4,14,frame15);
      }
      
      internal function frame15() : *
      {
         MovieClip(parent.parent).shunpoEnd();
      }
      
      internal function frame4() : *
      {
         MovieClip(parent.parent).drawSlash();
      }
   }
}

