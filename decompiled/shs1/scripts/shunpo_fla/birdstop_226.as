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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol338")]
   public dynamic class birdstop_226 extends MovieClip
   {
      
      public var temp:int;
      
      public function birdstop_226()
      {
         super();
         addFrameScript(0,frame1,8,frame9,18,frame19,28,frame29,38,frame39,40,frame41,42,frame43);
      }
      
      internal function frame1() : *
      {
      }
      
      internal function frame19() : *
      {
         if(Math.random() * 8 < 7)
         {
            this.gotoAndPlay(10);
         }
         else
         {
            temp = Math.random() * 5;
            if(temp == 0)
            {
               this.gotoAndPlay(1);
            }
            else if(temp == 1)
            {
               this.gotoAndPlay(10);
            }
            else if(temp == 2)
            {
               this.gotoAndPlay(20);
            }
            else if(temp == 3)
            {
               this.gotoAndPlay(30);
            }
            else if(temp == 4)
            {
               this.gotoAndPlay(40);
            }
            if(Math.random() * 10 < 1)
            {
               this.scaleX = -this.scaleX;
            }
         }
      }
      
      internal function frame9() : *
      {
         if(Math.random() * 8 < 7)
         {
            this.gotoAndPlay(1);
         }
         else
         {
            temp = Math.random() * 5;
            if(temp == 0)
            {
               this.gotoAndPlay(1);
            }
            else if(temp == 1)
            {
               this.gotoAndPlay(10);
            }
            else if(temp == 2)
            {
               this.gotoAndPlay(20);
            }
            else if(temp == 3)
            {
               this.gotoAndPlay(30);
            }
            else if(temp == 4)
            {
               this.gotoAndPlay(40);
            }
            if(Math.random() * 10 < 1)
            {
               this.scaleX = -this.scaleX;
            }
            if(Math.random() * 10 < 1)
            {
               MovieClip(this.parent).flyaway();
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
            temp = Math.random() * 5;
            if(temp == 0)
            {
               this.gotoAndPlay(1);
            }
            else if(temp == 1)
            {
               this.gotoAndPlay(10);
            }
            else if(temp == 2)
            {
               this.gotoAndPlay(20);
            }
            else if(temp == 3)
            {
               this.gotoAndPlay(30);
            }
            else if(temp == 4)
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
      
      internal function frame43() : *
      {
         this.gotoAndPlay(1);
      }
      
      internal function frame41() : *
      {
         if(!MovieClip(parent).onscarecrow)
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
      }
   }
}

