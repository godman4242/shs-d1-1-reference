package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol947")]
   public class QuestImageUI extends MovieClip
   {
      
      internal var image:MovieClip;
      
      public function QuestImageUI()
      {
         super();
         this.visible = false;
      }
      
      public function show(imageID:String, type:int = 0) : *
      {
         this.image = ResourceManager.getCutsceneImage(imageID);
         if(this.image != null)
         {
            this.addChild(this.image);
         }
         this.addEventListener(MouseEvent.CLICK,this.onHide);
         this.visible = true;
      }
      
      public function onHide(mouseEvent:MouseEvent) : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.onHide);
         this.visible = false;
         if(this.image != null)
         {
            this.removeChild(this.image);
            this.image = null;
         }
         CutsceneManager.getInstance().nextStep();
      }
   }
}

