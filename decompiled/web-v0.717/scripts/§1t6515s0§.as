package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1166")]
   public class §1t6515s0§ extends MovieClip
   {
      
      public var shade:§1t6775s0§;
      
      internal var image:MovieClip;
      
      internal var §1t6781s0§:String;
      
      public function §1t6515s0§()
      {
         super();
         this.visible = false;
         this.shade.visible = false;
      }
      
      public function show(param1:String, param2:int = 0) : *
      {
         if(this.§1t6781s0§ == param1)
         {
            return;
         }
         this.§1t6781s0§ = param1;
         this.image = §1t1522s0§.§1t9315s0§(param1);
         if(this.image != null)
         {
            this.addChild(this.image);
         }
         else
         {
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§("QuestImageUI.show " + param1,"","",null);
         }
         this.addEventListener(MouseEvent.CLICK,this.§1t6777s0§);
         this.hitArea = this.shade;
         this.visible = true;
         if(this.image != null && this.image.totalFrames > 1)
         {
            this.image.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      public function §1t6777s0§(param1:MouseEvent) : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.§1t6777s0§);
         this.visible = false;
         if(this.image != null)
         {
            this.removeChild(this.image);
            this.image.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            this.image = null;
            this.§1t6781s0§ = "";
         }
         §1t126s0§.§1t9190s0§().§1t813s0§();
      }
      
      internal function onEnterFrame(param1:Event) : *
      {
         if(this.image == null)
         {
            return;
         }
         switch(this.§1t6781s0§)
         {
            case "_epilogue":
            case "_episode0":
            case "_episode1":
            case "_episode2":
            case "_episode3":
            case "_episode4":
            case "_episode5":
            case "_episode6":
            case "_episode7":
            case "_episode8":
            case "_episode9":
            case "_episode10":
            case "_episode11":
            case "_episode12":
               if(this.image.currentFrame == 135)
               {
                  this.image.stop();
                  this.image.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
               }
               break;
            case "_exposition":
            case "_exposition_epilogue":
               if(this.image.currentFrame == 682)
               {
                  this.image.stop();
                  this.image.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
               }
         }
      }
   }
}

