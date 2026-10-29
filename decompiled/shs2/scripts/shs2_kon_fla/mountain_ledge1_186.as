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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2446")]
   public dynamic class mountain_ledge1_186 extends MovieClip
   {
      
      public var groundplatform:mountain_platform1;
      
      public var vines:MovieClip;
      
      public var shadow:MovieClip;
      
      public var pactive:Boolean;
      
      public var goup:MovieClip;
      
      public var platform:MovieClip;
      
      public var go:MovieClip;
      
      public function mountain_ledge1_186()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5);
      }
      
      public function showPlatform_upwards(param1:int) : *
      {
         if(!Player.instance.isRedFreeze)
         {
            this.visible = true;
         }
         pactive = true;
         vines.visible = Math.random() * 2 < 1;
         if(param1 == -1)
         {
            x = Math.random() * GameStage.stageWidth;
         }
         else
         {
            x = param1;
         }
         if(groundplatform == null)
         {
            groundplatform = new mountain_platform1();
            MovieClip(parent).ground.addChild(groundplatform);
         }
         groundplatform.x = x;
         groundplatform.y = y;
      }
      
      internal function frame3() : *
      {
         go.visible = false;
         goup.visible = false;
         stop();
      }
      
      internal function frame1() : *
      {
         pactive = false;
         visible = false;
         go.visible = false;
         goup.visible = false;
         stop();
      }
      
      internal function frame5() : *
      {
         go.visible = false;
         goup.visible = true;
         stop();
      }
      
      internal function frame4() : *
      {
         go.visible = false;
         goup.visible = false;
         stop();
      }
      
      internal function frame2() : *
      {
         go.visible = true;
         goup.visible = false;
         stop();
      }
      
      public function showPlatform(param1:int) : *
      {
         var _loc2_:int = 0;
         if(!Player.instance.isRedFreeze)
         {
            this.visible = true;
         }
         pactive = true;
         vines.visible = Math.random() * 2 < 1;
         if(param1 == -1)
         {
            _loc2_ = Math.floor(Math.random() * 4);
            if(_loc2_ == 0)
            {
               y = 100;
            }
            else if(_loc2_ == 1)
            {
               y = 150;
            }
            else if(_loc2_ == 2)
            {
               y = 200;
            }
            else if(_loc2_ == 3)
            {
               y = 250;
            }
         }
         else
         {
            y = param1;
         }
         if(groundplatform == null)
         {
            groundplatform = new mountain_platform1();
            MovieClip(parent).ground.addChild(groundplatform);
         }
         groundplatform.x = x;
         groundplatform.y = y;
      }
   }
}

