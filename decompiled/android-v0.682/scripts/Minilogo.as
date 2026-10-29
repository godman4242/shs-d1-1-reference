package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BlurFilter;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.setTimeout;
   import playerio.utils.SWFReader;
   
   public class Minilogo extends MovieClip
   {
      
      public static var showLogo:Boolean = true;
      
      private var align:String;
      
      private var t:Tween;
      
      private var rect:Rectangle;
      
      public function Minilogo(align:String = "BC")
      {
         var n:* = null;
         super();
         this.align = align;
         this.alpha = 0;
         this.buttonMode = true;
         addEventListener("addedToStage",handleAttach);
         this.addEventListener("mouseDown",handleClick);
         Minilogo.showLogo = false;
      }
      
      private function handleClick(e:MouseEvent) : void
      {
         e.preventDefault();
         e.stopImmediatePropagation();
         try
         {
            navigateToURL(new URLRequest("http://playerio.com/?ref=gamelogo"),"_new");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      private function handleResize(e:Event = null) : void
      {
         var xo:Number = NaN;
         var yo:Number = NaN;
         if(this.parent)
         {
            xo = 0;
            yo = 0;
            if(stage.scaleMode == "noScale")
            {
               var _loc4_:String;
               switch(stage.align)
               {
                  case "":
                     xo = -(stage.stageWidth - rect.width) / 2;
                     yo = -(stage.stageHeight - rect.height) / 2;
                     break;
                  case "T":
                     xo = -(stage.stageWidth - rect.width) / 2;
                  case _loc4_ = align,"TL":
                     addr00bd:
                     this.x = xo + 140;
                     this.y = yo + 45;
                     break;
                  default:
                     addr0160:
                     this.x = xo + stage.stageWidth / 2;
                     this.y = yo + stage.stageHeight - 45;
                     break;
                  case "CL":
                     addr00d7:
                     this.x = xo + 140;
                     this.y = yo + stage.stageHeight / 2;
                     break;
                  case "BL":
                     addr00f8:
                     this.x = xo + 140;
                     this.y = yo + stage.stageHeight - 45;
                     break;
                  case "TC":
                     addr0119:
                     this.x = xo + stage.stageWidth / 2;
                     this.y = yo + 45;
                     break;
                  case "CC":
                     addr0139:
                     this.x = xo + stage.stageWidth / 2;
                     this.y = yo + stage.stageHeight / 2;
                     break;
                  case "TR":
                     addr0187:
                     this.x = xo + stage.stageWidth - 140;
                     this.y = yo + 45;
                     break;
                  case "CR":
                     addr01a8:
                     this.x = xo + stage.stageWidth - 140;
                     this.y = yo + stage.stageHeight / 2;
                     break;
                  case "BR":
                     addr01d0:
                     this.x = xo + stage.stageWidth - 140;
                     this.y = yo + stage.stageHeight - 45;
               }
               return;
            }
            switch(align)
            {
               case "TL":
                  §§goto(addr00bd);
               case "CL":
                  §§goto(addr00d7);
               case "BL":
                  §§goto(addr00f8);
               case "TC":
                  §§goto(addr0119);
               case "CC":
                  §§goto(addr0139);
               case "TR":
                  §§goto(addr0187);
               case "CR":
                  §§goto(addr01a8);
               case "BR":
                  §§goto(addr01d0);
               default:
                  §§goto(addr0160);
            }
         }
         §§goto(addr025c);
      }
      
      private function handleEnterFrame(e:Event) : void
      {
         if(stage.getChildAt(stage.numChildren - 1) != this)
         {
            stage.addChild(this);
         }
      }
      
      private function handleAttach(e:Event) : void
      {
         if((stage.loaderInfo as Object).hasOwnProperty("bytes"))
         {
            rect = new SWFReader((stage.loaderInfo as Object).bytes).dimensions;
         }
         else
         {
            rect = new Rectangle(0,0,stage.stageWidth,stage.stageHeight);
         }
         stage.addEventListener("resize",handleResize);
         handleResize();
         t = new Tween(this,"alpha",Strong.easeIn,0,1,0.5,true);
         t.addEventListener("motionFinish",handleCreated);
         t.addEventListener("motionChange",handleTick);
         addEventListener("enterFrame",handleEnterFrame);
      }
      
      private function handleCreated(e:TweenEvent) : void
      {
         setTimeout(doRemove,3000);
      }
      
      private function handleTick(e:Event) : void
      {
         this.filters = [new BlurFilter((1 - this.alpha) * 100,(1 - this.alpha) * 10)];
      }
      
      private function doRemove() : void
      {
         t = new Tween(this,"alpha",Strong.easeIn,1,0,0.5,true);
         t.addEventListener("motionChange",handleTick);
         t.addEventListener("motionFinish",kill);
         removeEventListener("enterFrame",handleEnterFrame);
         stage.removeEventListener("resize",handleResize);
      }
      
      private function kill(e:Event) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

