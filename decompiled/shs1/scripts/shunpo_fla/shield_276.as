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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol174")]
   public dynamic class shield_276 extends MovieClip
   {
      
      public var stuckarrow1:stuck_arrow;
      
      public var stuckarrow2:stuck_arrow;
      
      public var stuckarrow3:stuck_arrow;
      
      public function shield_276()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         if(MovieClip(parent.parent.parent.parent).stuckarrow1rot == 0)
         {
            stuckarrow1.visible = false;
         }
         else
         {
            stuckarrow1.visible = true;
            stuckarrow1.rotation = MovieClip(parent.parent.parent.parent).stuckarrow1rot;
         }
         if(MovieClip(parent.parent.parent.parent).stuckarrow2rot == 0)
         {
            stuckarrow2.visible = false;
         }
         else
         {
            stuckarrow2.visible = true;
            stuckarrow2.rotation = MovieClip(parent.parent.parent.parent).stuckarrow2rot;
         }
         if(MovieClip(parent.parent.parent.parent).stuckarrow3rot == 0)
         {
            stuckarrow3.visible = false;
         }
         else
         {
            stuckarrow2.visible = true;
            stuckarrow2.rotation = MovieClip(parent.parent.parent.parent).stuckarrow3rot;
         }
      }
   }
}

