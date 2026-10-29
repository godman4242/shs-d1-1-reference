package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol571")]
   public dynamic class patrolicon2_115 extends MovieClip
   {
      
      public var enemy:MovieClip;
      
      public function patrolicon2_115()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         enemy.buttonMode = true;
         enemy.addEventListener(MouseEvent.CLICK,enemyEvent);
      }
      
      public function enemyEvent(param1:Event) : void
      {
         StatsManager.instance.gotoLevel(StatsManager.instance.getPatrolLocation(this));
      }
   }
}

