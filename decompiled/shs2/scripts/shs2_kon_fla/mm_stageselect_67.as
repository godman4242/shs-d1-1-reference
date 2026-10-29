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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2246")]
   public dynamic class mm_stageselect_67 extends MovieClip
   {
      
      public var s2button:SimpleButton;
      
      public var lock4:MovieClip;
      
      public var s3button:SimpleButton;
      
      public var lock2:MovieClip;
      
      public var lock3:MovieClip;
      
      public var s4button:SimpleButton;
      
      public var s1button:SimpleButton;
      
      public var backbutton:SimpleButton;
      
      public function mm_stageselect_67()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function s4ClickEvent(param1:Event) : void
      {
         MovieClip(parent).initMode = true;
         MovieClip(parent).gotoAndPlay(1,"beforefortwalls");
      }
      
      public function s3ClickEvent(param1:Event) : void
      {
         MovieClip(parent).initMode = true;
         MovieClip(parent).gotoAndPlay(1,"beforebattlefield");
      }
      
      public function updateLocks() : *
      {
         lock2.visible = !StatsManager.stage1completed;
         lock3.visible = !StatsManager.stage2completed;
         lock4.visible = !StatsManager.stage3completed;
         if(StatsManager.accessAllStages)
         {
            lock2.visible = false;
            lock3.visible = false;
            lock4.visible = false;
         }
      }
      
      internal function frame1() : *
      {
         backbutton.addEventListener(MouseEvent.CLICK,MovieClip(parent).backClickEvent);
         s1button.addEventListener(MouseEvent.CLICK,s1ClickEvent);
         s2button.addEventListener(MouseEvent.CLICK,s2ClickEvent);
         s3button.addEventListener(MouseEvent.CLICK,s3ClickEvent);
         s4button.addEventListener(MouseEvent.CLICK,s4ClickEvent);
      }
      
      public function s2ClickEvent(param1:Event) : void
      {
         MovieClip(parent).initMode = true;
         MovieClip(parent).gotoAndPlay(1,"beforemountain");
      }
      
      public function s1ClickEvent(param1:Event) : void
      {
         MovieClip(parent).initMode = true;
         MovieClip(parent).gotoAndPlay(1,"beforeforest");
      }
   }
}

