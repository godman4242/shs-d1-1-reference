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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2141")]
   public dynamic class forest_mid_tree1_24 extends MovieClip
   {
      
      public var platform1:MovieClip;
      
      public var deco2:MovieClip;
      
      public var deco1:MovieClip;
      
      public var deco3:MovieClip;
      
      public var platform2:MovieClip;
      
      public var deco4:MovieClip;
      
      public var deco5:MovieClip;
      
      public var groundplatform2:MovieClip;
      
      public var groundplatform1:MovieClip;
      
      public function forest_mid_tree1_24()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function init() : *
      {
         deco1.visible = Math.random() * 2 > 1;
         deco1.y = 220 + Math.random() * 200 - 100;
         deco2.visible = Math.random() * 2 > 1;
         deco2.y = 277 + Math.random() * 200 - 100;
         deco3.visible = Math.random() * 2 > 1;
         deco3.y = 67 + Math.random() * 200 - 100;
         deco4.visible = Math.random() * 2 > 1;
         deco4.y = 50 + Math.random() * 200 - 100;
         deco5.visible = Math.random() * 2 > 1;
         platform1.visible = false;
         platform2.visible = false;
      }
      
      internal function frame1() : *
      {
         init();
      }
      
      public function showPlatform1(param1:int) : *
      {
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         platform1.visible = true;
         if(param1 == -1)
         {
            _loc3_ = Math.floor(Math.random() * 4);
            if(_loc3_ == 0)
            {
               platform1.y = 100;
            }
            else if(_loc3_ == 1)
            {
               platform1.y = 150;
            }
            else if(_loc3_ == 2)
            {
               platform1.y = 200;
            }
            else if(_loc3_ == 3)
            {
               platform1.y = 250;
            }
         }
         else
         {
            platform1.y = param1;
         }
         platform1.init();
         if(groundplatform1 == null)
         {
            groundplatform1 = new forest_platform();
            MovieClip(parent).ground.addChild(groundplatform1);
         }
         _loc2_ = new Point(platform1.x,platform1.y);
         _loc2_ = localToGlobal(_loc2_);
         groundplatform1.x = _loc2_.x;
         groundplatform1.y = _loc2_.y;
         groundplatform1.scaleX = scaleX;
      }
      
      public function showPlatform2(param1:int) : *
      {
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         platform2.visible = true;
         if(param1 == -1)
         {
            _loc3_ = Math.floor(Math.random() * 4);
            if(_loc3_ == 0)
            {
               platform2.y = 100;
            }
            else if(_loc3_ == 1)
            {
               platform2.y = 150;
            }
            else if(_loc3_ == 2)
            {
               platform2.y = 200;
            }
            else if(_loc3_ == 3)
            {
               platform2.y = 250;
            }
         }
         else
         {
            platform2.y = param1;
         }
         platform2.init();
         if(groundplatform2 == null)
         {
            groundplatform2 = new forest_platform();
            MovieClip(parent).ground.addChild(groundplatform2);
         }
         _loc2_ = new Point(platform2.x,platform2.y);
         _loc2_ = localToGlobal(_loc2_);
         groundplatform2.x = _loc2_.x;
         groundplatform2.y = _loc2_.y;
         groundplatform2.scaleX = -scaleX;
      }
   }
}

