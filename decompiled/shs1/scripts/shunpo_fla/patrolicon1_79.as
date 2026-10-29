package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol536")]
   public dynamic class patrolicon1_79 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public var enemy:MovieClip;
      
      public var head:MovieClip;
      
      public function patrolicon1_79()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      internal function frame1() : *
      {
         stop();
         enemy.buttonMode = true;
         enemy.addEventListener(MouseEvent.CLICK,enemyEvent);
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      public function enemyEvent(param1:Event) : void
      {
         StatsManager.instance.gotoLevel(StatsManager.instance.getPatrolLocation(this));
      }
   }
}

