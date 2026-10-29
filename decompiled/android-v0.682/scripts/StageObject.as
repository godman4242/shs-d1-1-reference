package
{
   import flash.display.MovieClip;
   
   public class StageObject extends MovieClip
   {
      
      internal var typeid:int;
      
      internal var updateMe:Boolean = false;
      
      public function StageObject()
      {
         super();
      }
      
      public function isInteractive() : Boolean
      {
         return false;
      }
      
      public function init(posX:int, posY:int, props:String) : *
      {
      }
      
      public function doScroll(dist:int) : *
      {
         x += dist;
      }
      
      public function removeFromCanvas(canvas:MovieClip) : *
      {
         canvas.removeChild(this);
      }
      
      public function showQuestIndicator(questAction:QuestAction) : *
      {
      }
      
      public function needsUpdate() : Boolean
      {
         return this.updateMe;
      }
      
      public function update() : *
      {
      }
      
      public function forFarCanvas() : Boolean
      {
         return false;
      }
   }
}

