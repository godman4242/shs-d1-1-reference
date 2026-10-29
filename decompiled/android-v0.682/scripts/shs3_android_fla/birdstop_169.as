package shs3_android_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.globalization.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.engine.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2573")]
   public dynamic class birdstop_169 extends MovieClip
   {
      
      public var temp:int;
      
      public function birdstop_169()
      {
         super();
         addFrameScript(0,this.frame1,8,this.frame9,18,this.frame19,28,this.frame29,38,this.frame39,40,this.frame41,42,this.frame43);
      }
      
      internal function frame1() : *
      {
      }
      
      internal function frame9() : *
      {
         if(Math.random() * 8 < 7)
         {
            this.gotoAndPlay(1);
         }
         else
         {
            this.temp = Math.random() * 5;
            if(this.temp == 0)
            {
               this.gotoAndPlay(1);
            }
            else if(this.temp == 1)
            {
               this.gotoAndPlay(10);
            }
            else if(this.temp == 2)
            {
               this.gotoAndPlay(20);
            }
            else if(this.temp == 3)
            {
               this.gotoAndPlay(30);
            }
            else if(this.temp == 4)
            {
               this.gotoAndPlay(40);
            }
            if(Math.random() * 10 < 1)
            {
               this.scaleX = -this.scaleX;
            }
            if(this.parent != null && Math.random() * 10 < 1)
            {
               MovieClip(this.parent).flyaway();
            }
         }
      }
      
      internal function frame19() : *
      {
         if(Math.random() * 8 < 7)
         {
            this.gotoAndPlay(10);
         }
         else
         {
            this.temp = Math.random() * 5;
            if(this.temp == 0)
            {
               this.gotoAndPlay(1);
            }
            else if(this.temp == 1)
            {
               this.gotoAndPlay(10);
            }
            else if(this.temp == 2)
            {
               this.gotoAndPlay(20);
            }
            else if(this.temp == 3)
            {
               this.gotoAndPlay(30);
            }
            else if(this.temp == 4)
            {
               this.gotoAndPlay(40);
            }
            if(Math.random() * 10 < 1)
            {
               this.scaleX = -this.scaleX;
            }
         }
      }
      
      internal function frame29() : *
      {
         if(Math.random() * 8 < 7)
         {
            this.gotoAndPlay(20);
         }
         else
         {
            this.temp = Math.random() * 5;
            if(this.temp == 0)
            {
               this.gotoAndPlay(1);
            }
            else if(this.temp == 1)
            {
               this.gotoAndPlay(10);
            }
            else if(this.temp == 2)
            {
               this.gotoAndPlay(20);
            }
            else if(this.temp == 3)
            {
               this.gotoAndPlay(30);
            }
            else if(this.temp == 4)
            {
               this.gotoAndPlay(40);
            }
            if(Math.random() * 10 < 1)
            {
               this.scaleX = -this.scaleX;
            }
         }
      }
      
      internal function frame39() : *
      {
         if(Math.random() * 2 < 1)
         {
            this.gotoAndPlay(30);
         }
         else
         {
            this.gotoAndPlay(1);
         }
      }
      
      internal function frame41() : *
      {
         if(this.scaleX < 0)
         {
            this.x += 7;
         }
         else
         {
            this.x -= 7;
         }
      }
      
      internal function frame43() : *
      {
         this.gotoAndPlay(1);
      }
   }
}

